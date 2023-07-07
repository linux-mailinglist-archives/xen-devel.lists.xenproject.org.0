Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915F674AB8B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 09:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560211.875950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfW9-0000FI-Pg; Fri, 07 Jul 2023 07:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560211.875950; Fri, 07 Jul 2023 07:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfW9-0000DH-Lf; Fri, 07 Jul 2023 07:04:37 +0000
Received: by outflank-mailman (input) for mailman id 560211;
 Fri, 07 Jul 2023 07:04:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHfW8-0000Bi-R0
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 07:04:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87d3e035-1c94-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 09:04:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9945.eurprd04.prod.outlook.com (2603:10a6:10:4d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 07:04:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 07:04:07 +0000
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
X-Inumbo-ID: 87d3e035-1c94-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoWf2a6FGDWTEcrvg5rJ4Fyan3EVxxIms/2yMBNxvWrIP4F0aW5x+T44ZTYvG7uGXvjvVUQivIjOmqXg3GJH33JVn1aaC1BcLpKaBEVTRXXcP5QXNEwADGVdSHC2np55z2miBSJj7UHcewh7T7wsGlUV4cH2EQxp9Xs72O5hdR6DB1dv9+0UxDeE7ZnP2CBoJ1jk5bar6yn+OwsnYguDgn3qjoMRqpAJNbWw3/qrgSlcwG7TMFOEyRPsRZVbYIICq+/ZZMq1ONrQdnJmJCHpsAt5gLWTrC+1a9g+UVU2tkKZWu6uH7IgXiejPgn6G5UGlcCeNlS4oOp9wtHXd1ci9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujUusuhvPdDFcgfLM/kUUf9W850npxb8SCXzCPUx2E8=;
 b=jitvkaAtY0MHyej+YmfkocWztzuR+/1szYyV/hK9H+v6i9f7w/JYayLsOOAvEyLiaFE3YMNzHcBZr8agIwe+aDURsX2GkM7HPG8ljK8hDoWLPAMn9YWrG5COjJhq9J1TF4GeFvdXBu6nNKzTQqb/q3MPOCkQUOdvOivdxP2LeibXq2LqV337xnoaig2NKC8i+SeBYaU24any+yAL0GSGtahzUwHef89D9J8Zr4IytQKIJ1C/4hkF1kYor9CvzoImYh7XIKT1Fq2NFsXtAEMSVD9ae76gure6CiHzagYPYnAWd9CeMXJVxBL+h7dahNsFxyYwNXRsRX/6kmdLLRBiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujUusuhvPdDFcgfLM/kUUf9W850npxb8SCXzCPUx2E8=;
 b=VNWzbNy+HRV0rYW38wnJ6zgdwbAYR7o9iEGXLXqmd/oyxPZjiBuTg6S7F9/9DnUtTA+lakC0y9MlnGLNcKwFUGWoykUectkxTi5jzqnAo+weX6MzwZfvcNOWsLmF46F8Zvyf+bugmimXLmEFCQZzdiv5ehIS93K0mv6eoJzjgQy+k1ag4vwHVOrVH0wKOptsVnFLp04IBe+n6otTXgWYJFs7j2zATM/yQJjaeWAJMFjXur/9YfsgEbW+RoN12PMjxZnc7jduWjryLyaR1uP/TzO4VHZ13sKrtRA3I9e1fP29IPoCf5wVvaYuYM8pAYtPIWN7yObd7PmLsk+Qb84mjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb29cca6-454c-82ed-b6a8-ac9814f81cfa@suse.com>
Date: Fri, 7 Jul 2023 09:04:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 12/13] xen/x86: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
 <a343fc97-84df-48e6-1c91-cd933c6e5210@suse.com>
 <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
 <f93f0561-abea-bdae-223e-d69932e435c4@suse.com>
 <CAFHJcJuP7hH01ZiwNe0HHBM=JpBtsF9sDD7fushyBxDQ9UZicw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFHJcJuP7hH01ZiwNe0HHBM=JpBtsF9sDD7fushyBxDQ9UZicw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9945:EE_
X-MS-Office365-Filtering-Correlation-Id: 378649de-1f3c-4796-2e8a-08db7eb85afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2sWdYZ3eXoUuNchD0vaBMo153+KriiIaUhnsyiETtXFynJdxFnvK6Ij5oRIMJELQR8URI1N7wJUj4CgXTefCODexcEzMwt7TKZ7phH7ROzrUGEBetOLdvBXpvMANNA2nXTHBcfcw5X2sMMXzwpqv7lGdwb5w6liyCLgQJ6wKAS793pksrvZqDzqIxsAPru+XIzZcHKtAMpZFbaP30ZjhAonG2KKiCEQrPfOwCyuHzrlApqJgRkxpnI4b5UwMw95nl48KHdiP/rmbeZ+h+zthoIII9kU0WITWZ/GsO4jb5olYBfxTFfiLl1XQj3sG8usSU0+sDTSYZPVuYSfv1m3gXU1sD53lViS+xGJxlZC4N6actFUTe21f6ThA0wRDtqtIc5bL9fRMDrqx7PkeSWCU6u3inyCoZSfmfT6kGDYtsHZnMkEAB0Jom5koUNURwUzAd0VY6yI6Ymm869MXOhy4XB7QSioxPOcDDt06ku5At5fQUbmzY4tC7hTQLujCFuR88niTrivFHp+F+uMAz7IXZOdT90ron1n8Yjm9Ex1hA9pOyPhyPsOl5dVqQ3cTcaHxStAJUr4JNL/bQVnLGYTXXVCYyRqEfvMAj3y2uPJ1LNnxMesdj611QT8xAjLfs2D2HhxQXjX6Yn1vDcW30MaTuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(66476007)(41300700001)(6512007)(478600001)(54906003)(86362001)(31696002)(38100700002)(6486002)(316002)(6666004)(66946007)(66556008)(4326008)(6916009)(83380400001)(36756003)(8676002)(2906002)(8936002)(2616005)(5660300002)(31686004)(7416002)(53546011)(186003)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjVodlpRdGRBNS9NN0dZcllTTzYzSzVCVFZKSVdXeGhkY1dIajZ6dCtDdmJM?=
 =?utf-8?B?bE14ZnBiTVlzTE9obkY2MmVlS2c3djJrZi9xUFAyUTN0MjZweCtzbFIvRU4z?=
 =?utf-8?B?Qk9iSW1mQ1hqbGhPRXRHdndwWGtJbUlUdXRLanNKRkVnNWx0V0M5K2c4WXgv?=
 =?utf-8?B?SmgxUnhpdHdFeFJVSklkOUUvZWRNOHE3Q2U5cVlMQVo0OC9xb1BpUGYxRll5?=
 =?utf-8?B?OUVwZ1ZVMWhBd0hqQnVKbkxpNERveUpKbXFJcWNJSkZPR01jemxadENGelFo?=
 =?utf-8?B?NVpTODNvZHJOTlBLZ1IzbEg0T1FxZjZtTThVTFhXVWNaVG1sS3VackVEdUxq?=
 =?utf-8?B?NmRKTWVTMS9MZjdjYnRmS0JzSE1rc2lZd2hiMUtQVUpxSHltdWVwMjFMakNi?=
 =?utf-8?B?Q0dLbyt6YXFoSlNHZnJvenRyc1psR0xiZmg3V3dHTlhlNHA4RGtYU1R2N2Qx?=
 =?utf-8?B?YjdRaXhkQmJiZE5mMlhIT1BaMWk0ZXVaNnl0bWdLWThjWTgwTzRoNzlBSWtL?=
 =?utf-8?B?QjFSNVZ3R1R5cGQ3VnZvMFZCRWJwOVlNVWxqdm5CTS9yTkNwOStiaExpTHpG?=
 =?utf-8?B?OUo1b3l0M1lVb0g3S2JCaCs2bWtUWFNHdXhVSEtuTUY0QW1oTUQ4Sy9KSFA5?=
 =?utf-8?B?UlZsWGdtamJtbWRQWXJPRmZ0eElaYVVyRWlWOXdHeW9Sdk8vdEh6bU9vSjFO?=
 =?utf-8?B?aDB1U3BmU09LTGFLV1hCR1NOdzZlSmt1bDk3aXpWTkZ0clNkR1pXY3o1NWF6?=
 =?utf-8?B?V2pqcVRBaE9hb3Z2MktrK2hhcXVGNFhRbHlYQ3ZTdEgvRkE1M0JOZFhaSm4y?=
 =?utf-8?B?QU85YUxsaExBeHlMZlhSdk9uSEpWYXMxeWdUQmsyMUMzR2MzMWhXcXJ2Wjdz?=
 =?utf-8?B?TFlKNEQwVS9MRFY5VXlDdTZkYlJkVHR0T2JlRXVvaHVHUWRjOTl3aUtkODVS?=
 =?utf-8?B?V0FISUlIQVpjODZxYjZmUmpBdUY4RXlQU2d0ZU42QTJ1ZEJReDluR1JsZGtS?=
 =?utf-8?B?THhKcEhxckNVUUk5cnk2Rm9KbXVGQkliVmQwamM2YjlHQXVSOWlPVjhXckpl?=
 =?utf-8?B?MVlyY3k4RjVzazR3c29JOXdvYzBxVnJCVXVOZ2FOY3NYSXR4dHR2ZmlLRHZ6?=
 =?utf-8?B?V2VuTm9tbS9HMnZnYWZ3Q1NPWlA3VEJnR2JYUG5wdzBKaFRmS0N3S0Q3aEo0?=
 =?utf-8?B?NzJMaTNsYWxwRDk3bkNBS1krTzNZOXZRcHFRTDdiZVZlRGR5bE1OTEs5eWt3?=
 =?utf-8?B?Y3VLZFRHTXhrRzJNNmZ0WlYyMGI2R0dhbmhNZXdMWW9EYU9HSzdTSjhLaHpC?=
 =?utf-8?B?WHc3Rm5peWRqS2daUG5sUmNBNXRiRFA3SXMwL0RJeUZ3QU13bGs5RVBBTjhQ?=
 =?utf-8?B?U3l3bXRSVjVtM1JuVWtxUTlwODJBMUorNFh6Szh6WEhNbHNWZmZnU1BaZ1JP?=
 =?utf-8?B?QzE4Mmp0WGZGZ21RSjd6S2xXanJwZ2RjUVZTWXRhdFVCNnB1SXVPaXBQdXhn?=
 =?utf-8?B?QnU3T0FiQjdEdEkwWENmMkFzY1pOY3lISHliT29RakEvTFF5S0huYkJKWDVI?=
 =?utf-8?B?azJKZUtTanRubXlTd2x5M011M0xSdkFoMktzUFBjeDhOa1d2QjZhNTlKWXdq?=
 =?utf-8?B?SmRnWXExaEt0Nlh4K3grM3RoeXZyUC9HL1VndVlQVWwwUzJXdnVtbDVjdk9p?=
 =?utf-8?B?cm9hRlpYclVvK3RPNXpqcFlsb2ZxeVlaOVRkWWovSnFKVGgwSWhxNHBNaTFO?=
 =?utf-8?B?RlVkQUlnOTVnTTNBbjg0WUlKd1pnUXBQY3dra0pmRWM1aGNUWVJQbHE1ZmxH?=
 =?utf-8?B?bDN0dGVJa09pMzhYWXRPV0VDSlZ4aUN1U1JiUFVlcEkvOGdXNXA1OVdNdTY2?=
 =?utf-8?B?RUc3SGw1THU4SlRtSmRPeUhCQW1mYzREeVltaHBnOWpSWHcrRklEK0RjUEsz?=
 =?utf-8?B?NUFiek9PU0VnUk9wbG94ZDhONGJrcUYxQzFUc2RlNWd5eXlka3lpM2ZyaVlm?=
 =?utf-8?B?c3dSUXFOMDZ0bk9aUDVPbzdCNFQyMXF4cmdlblVmWDhrYWh2d1QyclpGZmQr?=
 =?utf-8?B?UE04WEJITjY5M1lyckRrVEsrT3lFdXNXNEd4c3FXaEprbU9FVDFWNFhwc3hi?=
 =?utf-8?Q?EFFImHgRXN75GT5PhldNld6Xa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 378649de-1f3c-4796-2e8a-08db7eb85afd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:04:06.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0plDgPPIL4N/h7OdOlYqt+JeB8iw5Ow8/5FdEyoVLFYFB/C6FMs7ltpRrYe3q7dP1ixXRnQlqDfs3KIWaFUGGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9945

On 07.07.2023 08:50, Simone Ballarin wrote:
> Il giorno gio 6 lug 2023 alle ore 18:22 Jan Beulich <jbeulich@suse.com> ha
> scritto:
> 
>> On 06.07.2023 18:08, Simone Ballarin wrote:
>>> Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beulich <jbeulich@suse.com>
>> ha
>>> scritto:
>>>
>>>> On 05.07.2023 17:26, Simone Ballarin wrote:
>>>>> --- a/xen/arch/x86/apic.c
>>>>> +++ b/xen/arch/x86/apic.c
>>>>> @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)
>>>>>       * Setup the APIC counter to maximum. There is no way the lapic
>>>>>       * can underflow in the 100ms detection time frame.
>>>>>       */
>>>>> -    __setup_APIC_LVTT(0xffffffff);
>>>>> +    __setup_APIC_LVTT(0xffffffffU);
>>>>
>>>> While making the change less mechanical, we want to consider to switch
>>>> to ~0 in this and similar cases.
>>>>
>>>
>>> Changing ~0U is more than not mechanical: it is possibly dangerous.
>>> The resulting value could be different depending on the architecture,
>>> I prefer to not make such kind of changes in a MISRA-related patch.
>>
>> What do you mean by "depending on the architecture", when this is
>> x86-only code _and_ you can check what type parameter the called
>> function has?
> 
> Ok, I will change these literals in ~0U in the next submission.

Except that I specifically meant ~0, not ~0U. We mean "maximum value"
here, and at the call site it doesn't matter how wide the function
parameter's type is. If it was 64-bit, ~0U would not do what is wanted.

Jan

