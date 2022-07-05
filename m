Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A916756640A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 09:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360648.590057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8d03-0006Ra-LF; Tue, 05 Jul 2022 07:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360648.590057; Tue, 05 Jul 2022 07:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8d03-0006PH-Gz; Tue, 05 Jul 2022 07:29:35 +0000
Received: by outflank-mailman (input) for mailman id 360648;
 Tue, 05 Jul 2022 07:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8d01-0006PA-MY
 for xen-devel@lists.xen.org; Tue, 05 Jul 2022 07:29:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130051.outbound.protection.outlook.com [40.107.13.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 356fa8a0-fc34-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 09:29:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5246.eurprd04.prod.outlook.com (2603:10a6:803:54::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 07:29:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 07:29:28 +0000
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
X-Inumbo-ID: 356fa8a0-fc34-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leEMcL0XT1ZPgK6S3XI4yiPoY5JyhG5k9nz3KFPkHVSrfgDbeGrfiEs0i5gr9PuK+dGgFGPQPVB8dSE1Q8eQ2SbfPAOaiWhztLU/aWiE2G952u+AU4vYbUi+vgyOMjXFLegDTpjVll3ef4O6K2p5AaxxwG4DHQOuZDbR94h97tYZPSILx903SHLe9Cs+eJoC1/iyLJK5zE1M56WIzr1qcAi483AnBFzKm7zXeIPWMbIrfu9BKfSwFEtmjNU/bUal8mf65/+Nf1ie0xgAk4wiKF01n5tvqFeG89ct4F4HxyaUZTEsyHKMYJzwv4bc7hnNLdM6hwViqrslmTpEypB2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNIMALRHMc7bizFWTZt8Vg53ubMkfnRJd1oc1rp5DME=;
 b=MDJxKP1qIhEx0w0h2hyZtH/Q+lxWQI/7E9zjYgrYNuz+wHhEffYDxOGGjX4ccmynUskqtW9TspGWhXa9FWkS3vIosrhqOcaaZSLhrMeO6BdKy4gPVea7ED19Px+7cG+CpTi3/DVq6MFcT8VxZ48Of6dG6uPXSmXK41UVsnQcEEDxylYpFmErSINCFVlw9O8G+W46M+YytvN8LUd/cBAQY7e0tiFIUyqERPWrFnqyxMpkL2GKayZwN7jNNlNyhhOoxgOo5Snwz9qZLshaju99BUnDJY8rGfh6KCRNxjEBnU9LrUv77bM2VX2rjk8eCHv1/+jj0SXUItuyrGHlLnKqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNIMALRHMc7bizFWTZt8Vg53ubMkfnRJd1oc1rp5DME=;
 b=PKibV6XCCQ1DdUJp252J7MF6g1W12HbgBhee3JZ0lS4nxkSU2V0uiRcLkjaFENfwdL67cldN8caqJQ7dt2hn+u/EhxAvPxtxZWuiFcShoMAnfktbwnumbhO3UL8wc3r4gkSVOTlQOCywVrvQzz6RidSrbAwiR2FMxQT1n2rdEEO8OTSvtGkDZQqqmUunHcmbhTeOy1Z5RPIsnfIHkBpwKmP69/26GACR0nwjBkgw9PlEM4huPt4mylS45OUApnj6EtImltSCJLWk5um4aXmHY2ohfFYMEL5w/HwliSnKBK7jhb04M5SHjZJUdOgHc9XTo+zfhR4G5iObeP7ur3FHSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <def66a62-e6d5-38bd-2e78-9ad9a7eff14e@suse.com>
Date: Tue, 5 Jul 2022 09:29:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Content-Language: en-US
To: "G.R." <firemeteor@users.sourceforge.net>
Cc: xen-devel <xen-devel@lists.xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
 <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local>
 <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
 <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local>
 <CAKhsbWZmoC3JzZAZ5T1R0aUif3joJq-oncaYVpMcPZ0A1OXxJg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKhsbWZmoC3JzZAZ5T1R0aUif3joJq-oncaYVpMcPZ0A1OXxJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0730.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2bad96f-211c-4b1d-4b0e-08da5e581830
X-MS-TrafficTypeDiagnostic: VI1PR04MB5246:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eOUZINcLGm8cBq1xvBXN1tuELtIbYG7sAorzq/kcRUd/vQZCLWS7nFhUjwlJzKT7RyhwaOe+E/fGsGg0HIhovWuQL5WFJlUMNgTUbmT6pFLY6XPJPAyHUM3q0UR0qEgwuEaOT+X0wJxAPGotlxPqv2KxkHrqA4sqk4Rtx/qjhp9hD+wefsbf7jnXql+7sbh7MQxnO3iVR9JnBCfnHs8SkD37AKALvbl8VZ6BzKZHQ29DP0HgWxbiP3g4Mkrv5/uRXb1UROCaGevcglmLgQJ0GN1ALP13yTOz9jYbqiTmRRH5H5wRZffNowISdczmvfp/DYBRa/IM+WJ5kjrXtCTldjPrV0bWPIbdscoIMISx6wmcgWdFwksuaxPX2OQBNH7+auL7yQKYwrbIdCNegUOXPJRSB/J+Q/F9EBIxw0tw1EJOUdIZxtbNa2rKwCCPCs7lFpGaTcd8E/czVbvSyNHGDAniJueTWk2JgcLCbdwZMWKWpvw6TNxsql98UpPD0i9Lvm3hntyb/K0t8coNNq1MfRWIl13gi41w4K6YwOyT9ccA5/2SKDthM+Ml6RlVwvsVk9AjrdX484qz/TXLQuSHIqAzrukP32t5JSs8hW8nbBzSwrC9d4S/GKlHjF+Xg7P/H5jJ+rmbpUkQ18Zog1XTDADZ1uSKEkcLmI9gCdXG820fsGWLdO+k7VaHboWTHdvu89SDu9i4fu4yrTraXi+zL/gpV8Z3MKU/oiGkQtx2z6hdOtlY1BcHUaA5DJmTcXnBok2CMHFWCbAFcOAmM7iFwFZm7jR4/KqhNkJGWZnwEfIqOqmnwgbz33t2AyqrQDnli1EnnJfLcjgEcCu3Py7xiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(136003)(376002)(366004)(186003)(66476007)(6486002)(83380400001)(4326008)(6916009)(8676002)(66556008)(66946007)(54906003)(2616005)(6512007)(31686004)(36756003)(26005)(53546011)(6506007)(38100700002)(86362001)(31696002)(2906002)(41300700001)(5660300002)(316002)(8936002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkplWTlaMXdob1J4ZEhNUVRxRUl6RUlGRGEyNUtrT2p2Q1ZHNVp4YXc1emty?=
 =?utf-8?B?WFh0L3R2U1d1TGFWcDhXMk9oNCtJaXBqZ1JtejRQeEh3VFF2VzlTVGFvMmhW?=
 =?utf-8?B?dkV5bnR0TTRHb2YwaHB5RVFHTU5LQVlLMGs2YmVOaDJ4WkZwbzlRTm5NL1I1?=
 =?utf-8?B?R0o2NUpuTUZDSjhIVVlFRlgzeUp5Yy8ySStnUlV5YmoyM1NERW9hT1Q4cUNS?=
 =?utf-8?B?bDVqVmFvUFdZQ011Q2kvcnNSTGJyV3BLbnBmQ1NpVGVnU1ZLMlNJcHNkRjhQ?=
 =?utf-8?B?ZjRTMFEwQTJOdjM0bTFuemYrdW1sTHZNcmc0Mm90OUJXNW1lRGRtUXZnU2N6?=
 =?utf-8?B?b1BEY202Z3docHJ2b3E4R1pnL3J5OXZWM3d0ZEFrOTZqT29OUUlDRVhicmtn?=
 =?utf-8?B?ZXMxc0dSdnQ4bExScDVVckQ4TmZPWVRBQVRrRUVSZG9HS28vUitIekw3NW9k?=
 =?utf-8?B?SkpVMnAwdmdxLzFUU2ZGdEVYVU9kMHJJQU44dkV4SE5ucUlYcUcxV09zUDRN?=
 =?utf-8?B?U2xLdTB6Y0ZVQUZqdW1iZWlZN3Zwb0ZMaFZ6Q1FySUJLTWlGVGs5alJBNmpv?=
 =?utf-8?B?SnFwN01HYTRQNWs0Szk0RGVXVGV4VGJ3SmRiM1BIalZORVN0V25XU1NUemFJ?=
 =?utf-8?B?RGFjZXBLUkFTZWxobktUUEVDUXBYS3NVZ01Fb2IzazFXN3M1N3ZHRVJIWnBW?=
 =?utf-8?B?NFFqVi9ETm0yZGxSQ2pDV3c5di9lNS8vZ1lOaFAzMFA2MHdKNUFqYjF6L3F1?=
 =?utf-8?B?aTRTTzlabDRoTjZQWHZoTFFqdzc3T0xJVkJZbDNMOVQ3Mzg0TDVrR1V5eGhV?=
 =?utf-8?B?THhKanh0UlB3U3ZUK1pRblp5dUk4dU9NL2piM0FzN0xlNE9QaFoxSlVkSTB3?=
 =?utf-8?B?bjVCbVJtNTJEREFIKy9UUXJqNjdYa0pjV1hiWUgzYVhLd0JCdzlzaFBkMGho?=
 =?utf-8?B?NUdYWENNYnBQRFYwc1RBeVBscE8xSlJCcExjL3ptbjJVSWhxWUh0Z1RnMlBz?=
 =?utf-8?B?b1lsck8xMHN3TlVleHBrOWhNRS9RTUtNQXBub1JXL0p6SHVXYi9mUG5IVytt?=
 =?utf-8?B?c1UyL2JMYng5YzNzcGdQaXlScHRyTDJ5ZW51azRMZTE5ZDdZdTBra3N4Qkl5?=
 =?utf-8?B?WUFweUZzNVZWNW9IallBMHovVEp2VGlrZUxWZEpsNmtPbStqenBhNkdtemtB?=
 =?utf-8?B?ZmxnM015QlphZHhJb3FOOXBINUQyb1dPbGxGMUtUWHVJMzg0aXhwMVlVZXZP?=
 =?utf-8?B?N09HMWlwNk5Zbnl3QVdhVkE2dnlma09iK0grbTdHZ1hoWFB0cGJXalM0U3l4?=
 =?utf-8?B?MzZ3UEFaNlVReXVZYWtpUkgzU3VINDZNS3drcHkvZnRhVEZ1aXJyRFJmRDFh?=
 =?utf-8?B?U204TVc3V0RTSFpjdzVqa0lGSXBPYzRFVFRPVWtxU05rL3B0ZDFnVGxtMy9p?=
 =?utf-8?B?ejM4WVh3cCt3aEVRUTdEVnhxajllSjJYZ3c3VUM3clUrM0VjNkp3R1puaVdL?=
 =?utf-8?B?WXJvaHNmZERqQmdBNHBvcFd4Q0RiK1I4RXAyd1ZxUkdidjMyaXJjWGtHYnhq?=
 =?utf-8?B?Rmt2Wm4zUGZUbkNRalcwUFFtZExJeXZ2aWZSUmlhV0hRcWZUcDZxT2NVYWNy?=
 =?utf-8?B?SVkrdHBBT3N1VXRmQW85d2ZIazNudWl5S1NrTGZKOFk3RVFWQlNya3BnU0lV?=
 =?utf-8?B?ZHFFM3B3OWZjblg2WWNqSFFyZ2tMUzBPVXp5UUJEbkpVQ0JieVlkZ3FVMklD?=
 =?utf-8?B?clFrWE95ay9VRjBsU0RvTkJEbDd3YU5OWGdRc29qR1duekJSU29aVDNwMjd1?=
 =?utf-8?B?YXBLYk1hOTMwRDgzdlQvSzlMODBydXhFVVhDb3JHd1pwc0FrVDFnTllDODlo?=
 =?utf-8?B?dStuY2tQZlhlZkUrSHNCLzh3ZElMQ0tMb1lsUUNoVURxaHRhQUtoWVdjN1A5?=
 =?utf-8?B?NjlZS1hGY0oxQ0tYUmRuSHZsVnp5UzQ3RlNLTkpWejJnNDhnRE9Bc2VOek9L?=
 =?utf-8?B?Z2t2MW5yZlJNWEFBdjU1V1ZrMk5IZ0Rma0pMMDFsVmdUL3g1Y2lnUmZkRGJF?=
 =?utf-8?B?d0s1YlhVYnZTNGlFaVVrVEsrUlhMUTl2RksxVVdUNXVadFBpNTNNSUt0MlRz?=
 =?utf-8?Q?lE7rjB59tDfyEZhDXSU0Ks07V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bad96f-211c-4b1d-4b0e-08da5e581830
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 07:29:28.4484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHXXicpXU9IUpOV7uCVUrQYK4rghompT+GM9VzZ3x6+2ZnxeFR6iBThdeFiRfJnRZtf2obJc8r6QU0WiGarAPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5246

On 04.07.2022 18:31, G.R. wrote:
> On Tue, Jul 5, 2022 at 12:21 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>
>> On Mon, Jul 04, 2022 at 11:37:13PM +0800, G.R. wrote:
>>> On Mon, Jul 4, 2022 at 11:15 PM G.R. <firemeteor@users.sourceforge.net> wrote:
>>>>
>>>> On Mon, Jul 4, 2022 at 10:51 PM G.R. <firemeteor@users.sourceforge.net> wrote:
>>>>>
>>>>> On Mon, Jul 4, 2022 at 9:09 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>>> Can you paste the lspci -vvv output for any other device you are also
>>>>>> passing through to this guest?
>>>>>>
>>>>
>>>> As reminded by this request, I tried to assign this nvme device to
>>>> another FreeBSD12 domU.
>>> Just to clarify, this time this NVME SSD is the only device I passed to this VM.
>>>
>>>> This time it does not fail at the VM setup stage, but the device is
>>>> still not usable at the domU.
>>>> The nvmecontrol command is not able to talk to the device at all:
>>>> nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:00000000
>>>> nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0
>>>> nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:00000000
>>>> nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0
>>>>
>>>> The QEMU log says the following:
>>>> 00:05.0] Write-back to unknown field 0x09 (partially) inhibited (0x00)
>>>> [00:05.0] If the device doesn't work, try enabling permissive mode
>>>> [00:05.0] (unsafe) and if it helps report the problem to xen-devel
>>>> [00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30, entry 0)
>>>
>>> I retried with the following:
>>> pci=['05:00.0,permissive=1,msitranslate=1']
>>> Those extra options suppressed some error logging, but still didn't
>>> make the device usable to the domU.
>>> The nvmecontrol command still get ABORTED result from the kernel...
>>>
>>> The only thing remained in the QEMU file is this one:
>>> [00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30, entry 0)
>>
>> Hm it seems like Xen doesn't find the position of the MSI-X table
>> correctly, given there's only one error path from msi.c returning
>> -ENODATA (61).
>>
>> Are there errors from pciback when this happens?  I would expect the
>> call to pci_prepare_msix() from pciback to fail and thus also report
>> some error?
>>
>> I think it's likely I will have to provide an additional debug patch
>> to Xen, maybe Jan has an idea of what could be going on.
>>
> pciback reports the same MSI-x related error.
> But even with DEBUG enabled, I didn't see more context reported.
> Please find details from the attachment.

And nothing pertinent in "xl dmesg"? Looking back through the thread I
couldn't spot a complete hypervisor log (i.e. from boot to assignment
attempt). An issue with MSI-X table determination, as Roger suspects,
would typically be associated with a prominent warning emitted to the
log. But there are also further possible sources of -ENXIO, which
would go silently.

Jan

