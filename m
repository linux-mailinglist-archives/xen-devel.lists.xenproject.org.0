Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F044C6F91
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 15:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280599.478593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOh4f-0007qT-01; Mon, 28 Feb 2022 14:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280599.478593; Mon, 28 Feb 2022 14:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOh4e-0007nZ-SE; Mon, 28 Feb 2022 14:32:28 +0000
Received: by outflank-mailman (input) for mailman id 280599;
 Mon, 28 Feb 2022 14:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOh4c-0007nT-Sg
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 14:32:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d430d77-98a3-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 15:32:22 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-kojNmmaGN8CAbLLU3WlDHQ-1; Mon, 28 Feb 2022 15:32:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB3465.eurprd04.prod.outlook.com (2603:10a6:7:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Mon, 28 Feb
 2022 14:32:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 14:32:20 +0000
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
X-Inumbo-ID: 3d430d77-98a3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646058744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vd2JdSoXP9lWQu+CWQbnpJ20hEwgjF981/aNZDiOSTU=;
	b=GaHNOufpEoU2uPXh0WJx6fxXKvBrjQrJCvIXDVRA7mewCjpDEEwT1FxNkahfDCMKw3jPvH
	V4trzwvBk4r4oRTcZObkf6Vl9NK6gWhyPNLvDA4bHjmLna635R/1kWv90VOKonsGdEElqf
	6lCE94aqiagx+hdMkFo/SrfL1UjeXMQ=
X-MC-Unique: kojNmmaGN8CAbLLU3WlDHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/e44fCYfhSZWFR8hwmh0J4WPV+b3h8GOrQRRHjZ14s2wxKj9clb208XPq3TzldywhK75T2S7Wt7Y65zFqIpKTmyMAP0R72WyiVMsKPWihXs6FeyoeJmMXUsquqhzvfpFysxCo6Nmwk6MGuAmh7OgIvZJvMhKgDm8/jp8sIk983n5G3s3UVDHHP8AUiaZ/fVPVLG4WDz4N+ypWmSn/5FqqhXnj8LKxoi9yOKaYAvwGYeNllG0aMlV8C8MqHLTZpayBfIPGKKDBjvee9eE5Nucyi0K367V0SaW76hHWM+AMpS+iAZ8xamr27qDujoQbf6rqeamrqAUheiZfYsk8Xutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vd2JdSoXP9lWQu+CWQbnpJ20hEwgjF981/aNZDiOSTU=;
 b=U+SKk1wv2Zj1mWpITSUE4yTs4uxU3X0M/Il3K/bU3seqoXr+zCx4pm06e2CZ6RJFxulFnd4ucQMBlRRq2mydFbGBtH/UU6x4FbewHFTyoZrv5arprKtmTbutc16O3+x5h2FjiMTJgLDaSMVlgG31qQriR9ohkJoxLXO8Yg4i4bRdium2TCOfAqAyo2+ggo+G31gwNqCPFs9qFC1SxDMBoVW8Kz0Dy8lse8LhkJHkhXVaH7KQJsdK9q8nShLIB2CTUr4QFg1zDfo3dYwqfR8eurjEAL/CKPUdn9hOzZfJbQft73sFAjSssan+MhkylgvXORKXTcXPdzs7CkyZ1yRmLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2025d913-acf9-d3f5-12ba-90b97e34eff2@suse.com>
Date: Mon, 28 Feb 2022 15:32:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] docs: correct "gnttab=" documented default
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3cc8bfca-be9e-cde8-c481-657ef33de7f2@suse.com>
 <4c087383-2f17-5af2-7c2f-77eb9aff9d3d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4c087383-2f17-5af2-7c2f-77eb9aff9d3d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0041.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 156d8110-851a-47cc-19b7-08d9fac72096
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3465:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3465E492805863CB09E68818B3019@HE1PR0402MB3465.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NXQRZPVas106U4bxdguwOeERT0yp2dTB3lHrk7gk+TcFj06TImof+TSB6piPRbl/X77xMyoyc6oEifaHjgd7KP5kb5vWMcZRVBQjmuqMDfa+gZU4F6O1ely2K+GTV+IvpOLrQz16K+lYdIm9AbWqvTnnrjIwW4qGBBPaYB6doQKqW2uR3GX0EaKJTI20r7TBauDDVCG+aSY3uR9MyDaQzKEq1PY4f7wN/DKKV5Lu3V+UjRl2xSUFJ+5K4lCsZqg+Yen4w9BJjE7382kDv3ohNyOgBLn45BszkHGp3QFahtD63o8yTnPNGwvj+DGXebYVwYm123rWd+sf823YXv3s2Cm+rseLvPJh12qQXZg52FHJ4P2u2l5wwDKnlPx6WcafWczJo1bnRoWGStCAG2tRuKEk4/xrMU9iupEvWuzivnmSioZ4qb+tz2TTZrRW4MINdajR9YwYM0cBx6KLNzpWXgu/MK80G1iAqco2TMRizYK2iUKu7BdhunXP6zDGqYvX86lWVrhvXx6CjsAjygALan3hF5ghvNAb8x7kdfxBjcNF0ghb0oT4EPPc8w7c2cy6tkKSIT2k1btgLEt+EVd6aHPLZAO6y2B1i3NbNVXSD/mm8o9W75wtpaNYtEPGFkWUMD18fqnU72Wt88nWgI8G2MtFa5DnrrjRAVlEpXxTl4kL+QynsPgaHZQ3DBW2N7QC7PgYVxSrd1a2OSUMkdtByxN2rmEhxLKQJhPtwqKcplY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(26005)(83380400001)(31696002)(53546011)(86362001)(6512007)(6506007)(6486002)(2906002)(186003)(508600001)(8676002)(5660300002)(2616005)(6916009)(31686004)(4326008)(36756003)(38100700002)(66556008)(66946007)(54906003)(316002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1BKVG5OYW5adk83L25NbFVCRysweVFHTXpya1ZYWGRmTnpVQjZYUGJwZXpt?=
 =?utf-8?B?Yy9SRFlBMlNMQXVkWlI0U1BCZmdpdzIvTFkxcVhXM2FXYzB4VDVJT2NGd0Rl?=
 =?utf-8?B?Yit5RjM0QnRVZ1JyY25WQUtKTUY2Mk9sWHo5bzR5NEQxd0t2cSt2amxkV0NG?=
 =?utf-8?B?K1ZTeHE4U3cxbTVlQTQxMEJVWW5OcUZPTkFRa0JDT0pIYlhtaENCTkVLMnJS?=
 =?utf-8?B?Q0cxcmZMK0xRT2s5K21tdk9maTRZUVFRamVTS2dTaS90bWdSRTBVOUxEaTc3?=
 =?utf-8?B?RG5hMFJ4Rzk2b1hsK0thSzJTYnFyZVV0M3BGdjd5TXZSSWJ6VUlGOHdMeTk5?=
 =?utf-8?B?UVlOdmx4YUQwaXJnYVl0UEVCc2pQdzNmcDFWZjZmams0TTA2aWs2eCtMa28x?=
 =?utf-8?B?MUF5OTFmSGc0Tzk2QVhJaUZqazlFaXBzOXFWU3hzckd2OFlGTVYrUStmM1ZG?=
 =?utf-8?B?eXo0Q0o1VXQzSW1jQllPTFVwMXV2L3J0b0U0ZGJtcVo4SWZsMmNmcGVndUg2?=
 =?utf-8?B?V2hGcDduUUd2dXpYR3ZxK2pUNFQ5UW9kR25WZDIzRzRYTlpuMEM4K0dIeEZU?=
 =?utf-8?B?OTk2aUU4SHY4ZFJzNjIzWFJBR0NtUDJXQ3ZGTzJrcUxVZldqakpoL0sxWTVE?=
 =?utf-8?B?dW5ZMHNLOC9oTnhKOGx4Mjh4WjJBSzI3b0FFQTRuTmszUU41djZZUEhBSHVk?=
 =?utf-8?B?ZHl4TEVFa3lXcGtQYVZwZjhaWnR3OW9kS21SZkx0TVZlN2s0ZHZiY0MzQXV0?=
 =?utf-8?B?dEJKOHlyVzhJT04wRkd5VlpkNVlRai90aFc2YWgwTWRBVDV5WnNEYS83QU4z?=
 =?utf-8?B?aWVBOVdSOE1zTFloQkQ4YlpKeG5SWUNhRk04bjRLRTAzWnZlbW80WFN3ZVYr?=
 =?utf-8?B?OW5RZTgrZGh1bTJXRDRKb21FcUdNM0wxQUxGVHJoNU5PZHp5YXZHUnhPcWJx?=
 =?utf-8?B?Nm9EZ3BPRGtPdzFOdFl0bkRlMkpTYVBCaWNaU1NFM2N5eERweCsvSGVZUGhz?=
 =?utf-8?B?SC9mN1owUzFleUIrUlJEZ0hnR2tZd01OMFlVYmxlaEhHMWpGK2tBZEtRZGkr?=
 =?utf-8?B?Zmh2TU5YYTB4MUJDcnJnR2dxZEJYNTRQMG9RZlZaZjlmT25EODNJK3UvamEx?=
 =?utf-8?B?c3VrRk9GL3hGbENvVWsxSUZVU0JvVXZkN0R3elBVUjhiekRlemorMS9UT3Bi?=
 =?utf-8?B?MjY3dnY4VkpIV2h3ZGhqdFUzb2RBZi94UkVBaEROeWlSMWgrTk1mdzUyTnB3?=
 =?utf-8?B?YkxabXJTOThsVWoxTmIrbmhhSzlJS3h6K09JN1JIK3AyVUtnc0NJMlB5eHBH?=
 =?utf-8?B?cHF1M1FXOGdKeWxuQ0tnUDJrTkFCeEs2Wis3bUhiLzNpOStkenRxeFAzUGpu?=
 =?utf-8?B?clFaMmxRRnkvWHErYnFYTnRjRVBkMmJQSWJYcGROUUZSU0g2b1d1T1E2OEtn?=
 =?utf-8?B?eVdSR3pvRjQ2Nlh6TFJjMUdzaTJKaTRCcDhIWGZ3V2JTSG12UGJwZGFPNDJJ?=
 =?utf-8?B?TUl1cTY3KzZwdXV2M1dLMHRjTWZpRW9BV2thNXJndDhsa2lrS3MyQXJvb0Iz?=
 =?utf-8?B?YmY4aHl1cXBxeDRITUlEYkJiUjFReWxoRDdEa3htbHBTZFRJTkJiWDRDMFkv?=
 =?utf-8?B?RUdzdGxKQU1QVGNpK3R6Sk1qNjRmNjBBeU44bEhCRjVvdmwxUFV0cTZLU051?=
 =?utf-8?B?L3Q3Wk5IaXpzRnpUSzNyemVTYUMwdER4SnY0RXNPWDVuZ2V5cGtJbDhqMVNl?=
 =?utf-8?B?c0hUeW03T2MzeHljaWZieFloRUt4MjFBQnJRcnpzN1dONExOQ3JNWHVnV2Vk?=
 =?utf-8?B?a0gyekRzZHFHUmlOVm51eUJFNGNYa3RPQWZ2bEJpQjR3NWRHOW9lUFhwOEJq?=
 =?utf-8?B?bGxQNmVSYi9UWCtFeko4TXgxVFkzSVIxRml4NGcyNkx4ZURiNlFYeFBnZ1p4?=
 =?utf-8?B?YjdwS3liVENuK09lM1NuK1RaWHBieTJ0b28yUy9nQytaeUhTQ3hTc0R6YzYr?=
 =?utf-8?B?bTZEMUg0TW0yU0dUWDU4M0JyaUNtS2NaaEkrK0MyUXlFckx1QTM3YWJBeUdm?=
 =?utf-8?B?UFJUR0xyOGNpNTZMaVdkeGJoTC9vVngvWFVaTVovMUlEQUUwa1lSdXNPMzV5?=
 =?utf-8?B?cFZnWS9pVXR6OXI1elMwcjcyK1BGdC9oWFo1VnltaEhWa0x5MGl1MlU0bjhx?=
 =?utf-8?Q?1tMMASX5weDi7FtWSC6Vjvc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156d8110-851a-47cc-19b7-08d9fac72096
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 14:32:20.4435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1k8kwLlsVKmGlWJlliXwNTBrpyBC+06G7OvDUvZPADY/lmuqxPb2iMi3C0LRyGo+uAh0+e4o7pFArn3ungsQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3465

On 28.02.2022 15:02, Julien Grall wrote:
> On 28/02/2022 10:19, Jan Beulich wrote:
>> Defaults differ for Arm and x86, not the least because of v2 not even
>> being security supported on Arm.
>>
>> Also drop a bogus sentence from gnttab_max_maptrack_frames, which was
>> presumably mistakenly cloned from gnttab_max_frames (albeit even there
>> what is being said is neither very precise nor very useful imo).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1177,7 +1177,8 @@ Specify which console gdbstub should use
>>   ### gnttab
>>   > `= List of [ max-ver:<integer>, transitive=<bool>, transfer=<bool> ]`
>>   
>> -> Default: `gnttab=max-ver:2,transitive,transfer`
>> +> Default (Arm): `gnttab=max-ver:1`
>> +> Default (x86): `gnttab=max-ver:2,transitive,transfer`
> 
> AFAICT, the default would not be correct on x86 when CONFIG_PV=n because 
> transfer is not available.

I can certainly split it in two x86 lines, one for PV and one for HVM.
I would not have thought I need to go that far, though.

Jan


