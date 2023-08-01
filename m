Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEBC76AA3D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 09:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573744.898734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQk5u-0001wG-5B; Tue, 01 Aug 2023 07:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573744.898734; Tue, 01 Aug 2023 07:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQk5u-0001u3-2Q; Tue, 01 Aug 2023 07:47:02 +0000
Received: by outflank-mailman (input) for mailman id 573744;
 Tue, 01 Aug 2023 07:47:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQk5s-0001tv-6J
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 07:47:00 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97915bac-303f-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 09:46:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7594.eurprd04.prod.outlook.com (2603:10a6:10:203::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 07:46:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 07:46:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 97915bac-303f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1UqYlcdERnl5dRISnbPh2/Q6vlBtAUpdAAYOJpAta3zdxzbC9M9plNOlhqBmVgd5/Yclrcs9bMVCdfPa7LMS+sGZgwZ9Iw7AkD6+P8GEb2mHrYN+RUy/9EvgQKAJQD09Cw1Elu4FfChsDHlHS2cNqr14B8h3GFfSpIwl2m5mlM6u/7LG7nJfAVLh+olRa4hosbr1mE50YAm9u2OUxZPW1SWk5u4YLeUMq0VuCdr7Lrnv501VIXxSoovDdKHPvtkzbcTPhb4J23a2VY2jul1wJtrz3byUEd15fbK11IIeBzldIX5qQMBkwSzyL+XjhlmzYXBFXsahJHchmPtQykbaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Gw0CWE+jIe4M6iBCvoM0MNOxL9X3RV4aI5Dc02R25U=;
 b=McRVWd0U7c38DqVOwBjP4sZLuswVSLU8KpWP8Gwynzx8VYH/v60NY9DgzlypR5StXRboZG3OvV35G0K8M6gW1d2YGL3SdixEAR79ObZjVUrYWKLuSq19BC7xUDWfVa3suM/57shVgaUAtCsK2ph/JUF4WCv36il/dAV6WblmyIWF1g0ojFbIbvbrqXPFRNUg+IgEBuNxtiLn4/59YNRYdpoDiFmPBMCJta/RTISei7zaeN3KuQtWl/aiStAMBdi0igkZ4AqNHAMwMz9e/XNwO8rlLslu8n3Bn9gVF2YwlFNk39Jrpft/7XvNmnH4YNTAVoJYO5JK5dSo3OlCVMf98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Gw0CWE+jIe4M6iBCvoM0MNOxL9X3RV4aI5Dc02R25U=;
 b=bptiSpKQDDmmMSVifSJTYEq1sp72itjKk+QvtULVVjLGA7Rlqo7/fEwZZDify/mUUC0VKGsEN63x95paURRMfv8NYdIUbksiHlt7OYEj0/Z16SqD8+G5T+rPo/DrHX67GVJqQeTSpOlDgzE8MHnH8sre3unatq+19TiHAXi1RGJ42EIdyMTkv2hkmINSt2CElr4rTEmNTqSyXyPk/KkE2RVyXLSIhrP5GlzRX+UJLHJSAz18J9jUmD/3CT7qOMIqRqDXtQGLBFkqNNV8swoeAvGX+GjkWXrCR9AG2gglTc1ByY5qicslFxZrXvENeo453KxaVDQ2GQ36K5qUSzwZKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8bdc7a9b-4fd9-ded4-dc13-cdffcb1284e7@suse.com>
Date: Tue, 1 Aug 2023 09:46:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 3/4] xen: rename variables and parameters to address
 MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690810346.git.nicola.vetrini@bugseng.com>
 <8aebc67a150cb4116affdd6da755a8e82c827ffa.1690810346.git.nicola.vetrini@bugseng.com>
 <f12b9c37-b7d0-ce03-024d-709a7fda7f26@suse.com>
 <2e0a88de6c6d0e7ef23bf14f0f945c0f@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2e0a88de6c6d0e7ef23bf14f0f945c0f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3f3c11-423a-4958-8f5b-08db92637ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ozpa5NOQA0RCVpTm4ZFmhXpZK5C8XHL6/89kmgY9u9w3wdFcm/DQh4JOQFWgeRQUd6HERa4l9j9cTAbadKJMcu7CMBXTzeNMGCffjWFuWmvViRkBVGm27ZzObPHe64zmGFyynyWPwkqULw7UaRXds3ZHjAT/mvqu+Zc5S1qbSW06osamVpnqT/f7IYdlz73cE9bSNn1SDOPNF10V3mLqIyOuAZiTqrOJAPh60ChAlf+Vv71vRgG4RXCqCqbltt+obS+qORr3KtqFEj8+K1/OiVGFBbjNe/l5YzH8nwPI5xZRb2XOStoa9UxUFFtOkSdHEzeOUhv+sa9cr9Zb7xsG+zzRRRypOgxg9p+9HUxpafYTpc1itva1jgtPDW/gu/b1EaCmNr48uF0/Cn+0Du6gk4RySuYyyZR5yxcIXgk5I7MpiQGnXy6yatLUnzdS3vLTWmSwelC+AQ4nLyhhdmsr/ZVvNKG7T1zuPt+8RXGyd5DjKLLa+roNoYB3XEs+MlEsa5dlY6xozMG5wtSftaB4LPF8Cg7+wcgV4iZ08VMj36oJUGU1z2+i486cDB3CioEIKCEMlwEoSFIZz7SCLUK8KHF2k8AJx6ZU2vglawpYRIdQc06tLPs6V2GkeuaLkHO+y0LyYaqnsUcIQfBp66d7Jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(7416002)(38100700002)(66899021)(6506007)(5660300002)(53546011)(4326008)(6916009)(66946007)(66556008)(66476007)(54906003)(6512007)(478600001)(2906002)(4744005)(2616005)(8936002)(8676002)(6486002)(41300700001)(36756003)(31686004)(31696002)(186003)(316002)(86362001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGdEc2p5NEp1eEppVnZpNEltRjM1SE1jbXp3NXF5NnQrd0VBSjJPc2tLTHBj?=
 =?utf-8?B?dEE0V0hVeXAxdTY5d3kwN2FKNnhXVjlzTVhuU0grR3JCQ1Zza1JscXRFcWx0?=
 =?utf-8?B?NGZOaDJHYkx2U2FRK2R1b2NTTTRDNml6Z0hLVG9XV3hHR2UxOU5uai93OUZ6?=
 =?utf-8?B?V2tQTzBIcVlXaHBhNk5HNGVGRVltNmg5UVR1a0t0MjV3eTZFeG11L0dvbDZ4?=
 =?utf-8?B?YmhodW4wT2theWpJdXRuN3ZRK0N6NDBZcXRaVlRpdU9hUDZPWlBic3h0K3FW?=
 =?utf-8?B?V0I5SldPcnJjSkJNeEorZUNGNks0R21ERnJxcWdQdm1SR2pmSkZXVVBNbzBE?=
 =?utf-8?B?VGQ1NlA5SDMxYVNON1h0QmIyVlc4Y0lOUnhGUTA1SjdpZnhKNE0wRkZ3MW9V?=
 =?utf-8?B?QlMvd1FGM3VFUVpteWZsMUduS2JhaTVGVGxFTWtiREhVZmJQTG9udGxEMG82?=
 =?utf-8?B?WUkySC96K1l2bk5jbExYZzBjeE9YSy92M091bklhcEFvd3N3TThUSW5LTHZa?=
 =?utf-8?B?R21BVUV0Z3JkcFJtS3NyWXRIMnE4MGsvKzBEN3N6UDhJV3RIbU53VUFZckxN?=
 =?utf-8?B?L1pTMUg4aTVROHFvZ2JKUUpqc2FuMXBxejI3bjBQMUpHU0dlTFBqRmczN29C?=
 =?utf-8?B?TEpaU0RPNyt6clBWUTVUd3FGaW9HWmZjREFodHRpZTRnR3hRTmV4bzhMOHB1?=
 =?utf-8?B?N2Q3b0dndlpKdGNjVG0zczNxQmh4OC9vNys4SkEwbXNJV3AwV1NwRlhXa0Vi?=
 =?utf-8?B?WlY5UFdVaWc2SzRucW1KTTZqR2lZdDZnTytTNEEyalJYT2VNcXFqd3pnbURE?=
 =?utf-8?B?TU1FSCtpWWZ1dk1kWURKakU2KzRESjZObmI5ZlZJM2ViRmVLdmNYTVQ0b0Rl?=
 =?utf-8?B?dTg5MHhKdVJuZ3IxTFdlck1qTnQzMG10ZXZIc3JnN25BOXlUeTBoVUhNUG52?=
 =?utf-8?B?RW9ZU2gyb1pGRzdOUHNRRjlIU0xPd0V5Z0xMWnUxN3c4ZUsyQmJwUU02OU9i?=
 =?utf-8?B?UlA3Szk2d2RSM0Ruci9sVlZIQkJKck5xaStZU1pRWmhjSkh3dld1SlE5QTVx?=
 =?utf-8?B?aktENXE5SDBaVXRncys0Ymdhc2g0TkRFelh0WGx3MzQrbm41OWUyOGJXWWZL?=
 =?utf-8?B?QjFLTWdydHBObEFOai9wTFBxQjFOaUJVZEFaUzJmbExWTDkyeHI4TjlvMThz?=
 =?utf-8?B?ZkNzbFNidTJ0LzlpV0NnQm1vdXgybnlhSUlTVnh4eFhtOHhyRHAzdThUS2M4?=
 =?utf-8?B?RkVXOCtrd1Y4L0UzUHdwQ3ZZdDVpRTM5ZStIMklGRnY0ajJCdjY0MW4zMDdZ?=
 =?utf-8?B?NXJlNS9mcDFxaHNvRFZ6clZ2WkRPVEVKREMrZ2lXYWxzZmk3YWxKVy9iNmt1?=
 =?utf-8?B?V3RqYzN1UzhLMVNQUzVTVXhUNmxzcFBpMGZDWVI1cjJPbkVOTDFOTElUUlRF?=
 =?utf-8?B?LzNJYm9lWjJ4TktTaVNrL3NEOGp0bUhkWDE3ZnpmZFZ2UHBQS3l5MUVZTkxx?=
 =?utf-8?B?VGlPelh3a1J3aEk0MWx0NVVzQlFsQUJrUFM3ZXNxMnF3UXRLZ21uRGtKTmlj?=
 =?utf-8?B?dnlHYjVaaEZzNGdyZ2pkcVNNRm50enNNTk1VTTFBT3orVndmUFFPblNaY1FX?=
 =?utf-8?B?aVI1NTE1SUg4WGM3NmFtczJYUDBQM0I0M29xM2hKVUY2TXFCL1lHZXFkTFlX?=
 =?utf-8?B?UDN0UnFGUCtqZUNMQnh3K1V2N0J3emRYUnVCUkxqSmNJK2d5OTVjWnkwYStC?=
 =?utf-8?B?cWtOeU1wbmtsZ2QveGxOY2ZGalY3Qk1LMGRLVmNFM0xtQ3IvY3A5UTM1K1o5?=
 =?utf-8?B?RFVWWmhrM01hbnJxUjF4b1BaY0owNmNlMXh4Tnp6MTFiTWV1TTZ5Y1JGOFZY?=
 =?utf-8?B?RmcwdDNKMWsrNmtzeFdCYUdzN0Joa2JNbG1oVDMxektXMHA0eXlIOHdmNHRB?=
 =?utf-8?B?aWFhZytRLzFhWktnazRZZVhUUUtYL0FRVjMreldSTEgwZjBoRWVaNElBaHZm?=
 =?utf-8?B?Tk11QmYzSDU3ZGxqZTE3N1dESEVCYVE4UDVzM2hzdVozbWNRaWNFQnVWS0p1?=
 =?utf-8?B?TlVkcjBqbHQyMVVGSjFxdVdnMXI3b2FSMk52UVZINmI0ZDk0RmRiam9LZWtU?=
 =?utf-8?Q?5FO7TFH15h9vPwvKcFz0pQ6E6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3f3c11-423a-4958-8f5b-08db92637ad2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 07:46:56.4408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFVArcxREVQyB4wmCJRMkuKkyx2BKCqObVqAfyqoxYo+AhUjttLqfZ4KB3SFV+geSKzotCZs/mxiNJjjsWknzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7594

On 01.08.2023 09:20, Nicola Vetrini wrote:
> On 31/07/2023 16:34, Jan Beulich wrote:
>> On 31.07.2023 15:35, Nicola Vetrini wrote:
>>> --- a/xen/common/compat/memory.c
>>> +++ b/xen/common/compat/memory.c
>>> @@ -321,12 +321,12 @@ int compat_memory_op(unsigned int cmd, 
>>> XEN_GUEST_HANDLE_PARAM(void) compat)
>>>
>>>          case XENMEM_remove_from_physmap:
>>>          {
>>> -            struct compat_remove_from_physmap cmp;
>>> +            struct compat_remove_from_physmap c;
>>
>> The intention of the outer scope cmp is to avoid such inner scope
>> ones then consuming extra stack space. This wants making part of the
>> union there.
>>
> 
> Makes sense, though I've not been able to find a definition for the type
> 'struct compat_remove_from_physmap'.

This is a generated type, so you'll need to look in the build tree
under xen/include/compat/. (In this context I'm curious how Misra and
Eclair deal with generated code.)

Jan

