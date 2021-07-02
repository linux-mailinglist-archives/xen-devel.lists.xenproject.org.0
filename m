Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A953BA2AD
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 17:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149188.275817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzKsQ-0006m4-QD; Fri, 02 Jul 2021 15:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149188.275817; Fri, 02 Jul 2021 15:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzKsQ-0006ij-Mm; Fri, 02 Jul 2021 15:14:46 +0000
Received: by outflank-mailman (input) for mailman id 149188;
 Fri, 02 Jul 2021 15:14:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mhJ0=L2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lzKsP-0006iX-D2
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 15:14:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3aec3538-db48-11eb-83b6-12813bfff9fa;
 Fri, 02 Jul 2021 15:14:44 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-nrIufyHbMh2YzeEsGJwyaw-1;
 Fri, 02 Jul 2021 17:14:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Fri, 2 Jul
 2021 15:14:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.023; Fri, 2 Jul 2021
 15:14:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0021.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.7 via Frontend Transport; Fri, 2 Jul 2021 15:14:41 +0000
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
X-Inumbo-ID: 3aec3538-db48-11eb-83b6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625238883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hC94+a97j6kslkLN67tYNOJce5dy4+/q6ruAJmaPGJE=;
	b=BebwIASDqahviqLcMIIDG1PSe2kcbMSPk0NbzlVRSud/B8WiQu8rnhUpJTrG/lqXvrVHT/
	edAHOimGP+QsFT+e7nUaUTfYH67G4V/+RSjdLXxj/yF2M2eyP+XlZXGINeEVliZvq3ucNq
	XUxwMGucVMomaGAc+UHuFGd8hgIJIno=
X-MC-Unique: nrIufyHbMh2YzeEsGJwyaw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8QTSxu/aRY6ivBtt2kvuaxGpn7UYZx8BwtrJpUSeCT0JCU9JoEli8F6gboIrlfP+AM9sADEhRTTSWql9bU9xcTwWC0rSdsn2UTgmzR39F4IAFqnZWEEcJZLFT5J86HJwnQ7iAY7/qXUi50NFrMPHxjqCpB/4Emd6fprTbFIsXSAoZ2gWn66pS3PHOyCU10S4XRKXGpj0T2eRGbTzFfqz64oF+/hKXF7yEU7G2pI0yxwb7CcRnr0E43ZVvDx7tmmbvuJ5cGHnpkfzu8lZWk+qiYzMGAkZlyyji0F3dyus38TzN1PJ4WqhjzviAy+s4gsGDnw328CQfdm1llZ2jtF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hC94+a97j6kslkLN67tYNOJce5dy4+/q6ruAJmaPGJE=;
 b=EiiCxLKvOiPViHbuCAVonkDNUu5gXIP/bu9v/tA0nSdD+adpKO3Gnkj0E6713kI0MlO9gzy+mxMkna7MZYjb9dMAZtRqPhEURMn+vXwq+TBLz1pviHGj7CpR3hlW31fFqrU0p8VZVFNQDjPoWrDoecV4A1jh2G/cTtJOkZ/xStFYONhYmQ6W98oxsUyw1avX+LooSemVM7PxoD2GV6ot8hLqGhLvfQp3B25iZORiAX/CmTl+0b1jUDzyRjFVKcZ6G2cVN24HoVHfHwC0J9T6U7gvXDhfPG28aAnwkwH4oUOBmmHOjnLa8/uIMtT9xuRkzjogKpV+G+uNXfnH9v6g1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] libxl/x86: check return value of SHADOW_OP_SET_ALLOCATION
 domctl
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <5d2bb2cf-8c0c-7300-c895-75bef0e50817@suse.com>
 <YN2Mujj8jKGv7tik@perard> <4913d3f6-cd16-1865-9c19-99f7db615ded@suse.com>
 <YN8m4BBYrb++fEYN@perard> <89ccd8b7-42e1-0e86-5929-2a33fa1b9c4b@suse.com>
Message-ID: <61f96b68-cd29-84c2-33ca-e114a6fc7714@suse.com>
Date: Fri, 2 Jul 2021 17:14:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <89ccd8b7-42e1-0e86-5929-2a33fa1b9c4b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR2P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3efd04ac-4729-4db5-35ab-08d93d6c1df4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7040646E986D9C00B6A1C9B0B31F9@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HzT5jq46pR/Yt11R6iQAR9p1zs/+7HZJDIxroBSwJxBzu6ltfHEgWiVKh8ISqTzB7Fl4CGiNQpBc4Ee4nUSQPvdwj3Eaf6/Km/K4DRMNOd/C9zaZgPWA11ZK/ZbIFG7FArDIcxhz8ZfF2I/36sYfLHp5CUmW4CwzVIc3+Aru+G19m8f6FRkkppRhozF8mvRtT/NdUwYvLtLaA/K+EGbgGuvIMAuZHrf1jFlIQgi+EMoEDPD2eA/a2Jdy9H9qspaNAkx8Q0VG/GE+JD3lXI9hYLncBy3vNcC3m9QJ+AZAkYNZ1gS8jD56tmVqp4vicIBX4Rjp4YOabPdgYlq91MKYzQB2G9cHD611qKMXOII+PZ6+vLTz97KJ4BqNSTxuYitDQLj3o0I+Z18afu0Zgb6JBKSHC1OacSeAjOksl3DLcEaVayXKuw6Wp5wW8HJwu2GNh2ZENBpECBoe0tPJkySh7/koonpBd3AKpBbH2GgFu6XwQGpyHd5XP2xKsPEf843doLhCGUHy88fG9HGr9mh6qiANbhv+VW7pjowIA6gtX0LC00jkS/TIFZjshfP2lJHKWzpMsAQ+nWt2I6GtvtrM7P+Ik6kKzz91NpSQEsbx0S1Ovct4s3yGsmOkYkaMigmUdCM67t65CG/RER25bY4zRtk7ZRrrMu5PMr0LsHM3wCi7cdMezo1CePRg7ecJDZJWbzvKQP0voTD/+WACk3SjpGv7dptfXwO1EdrbwGsWpdmpF6cCbEDYijZBiSYrU3Kc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39860400002)(16526019)(86362001)(6486002)(8936002)(54906003)(36756003)(5660300002)(186003)(53546011)(316002)(83380400001)(26005)(2906002)(66476007)(66946007)(38100700002)(66556008)(31686004)(8676002)(478600001)(16576012)(31696002)(6916009)(956004)(4326008)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEVuZ2NDWmtROFZ3Q3hiSVhtbHVtY0x4ZEVsd294d1Rld2dNMC9Tem1TNGo2?=
 =?utf-8?B?SjNmL1F2QWVRVVVvK1czOEFMem9CRTc2ZUZ5R3ZDdU5CLzhJRkpzYVpIdjNH?=
 =?utf-8?B?L2RWZ2tXcmRiUG5IZ0doTnZtVjNMSEVyTGlwZXRyZDBYREN5Q2tuNW05SjdL?=
 =?utf-8?B?R0N0anFyQklick5MQ0NrRVh4dWJ3SWR2RkM2aWsxaGlPUlpkYUFPaGhqSlVP?=
 =?utf-8?B?WVUyY21mVlF0NzNCSGxjamVnd0dyZFk4dm41Rzl0Tk9HYW9nUUNFWHdLT2VD?=
 =?utf-8?B?bkxTMUJpeEJ3MkZXL09nbzBxcyt2Ti9BaHpWSkMrc3l6YlFYalA4Z2cxcE1W?=
 =?utf-8?B?OHMxSk5UY0J2VmRCaEIvNnpFZHlXODF3YVlucDZpVWpLSmxpSUpaNG1EaHNw?=
 =?utf-8?B?anRJUGlHcCtVa2UrVUprQ1NuUVJhaFNkV0FEbmw5WkthRUdYRmZXMzNDZld3?=
 =?utf-8?B?S2lqaVVjQ0cyTjJxUGVMYkFZc1laNFo5QmthbFJFeDhrc0NwOGVwRHNNRmI4?=
 =?utf-8?B?RElyZDVMa1JhSlltQlB2T05JV0ttSmRjOUcyQkZUL01YU0kyaWdtQkNKOHc3?=
 =?utf-8?B?bUtpeFZZaDVIenZEblAxRDhJQlptd1V0YU9LTkg1dE9QTHZQSUJ1MVgrb2x3?=
 =?utf-8?B?NU5aV0pBM0FHdlF6TStpaHBEWExVV1hXa0VDdGkxRnFCZ0FLb0Z3ejZOLytq?=
 =?utf-8?B?ZjdWZTFiYzhxY0dRVGo1VUVuR2xOQjJsbW9zbDEyUUNSZ29LT2FZL1FBTzlE?=
 =?utf-8?B?dzVkTy96K1diMmZFRVhieDVzaDhqTTBZZWxoSW9SMDhnVnY1UkkreGN1cHRq?=
 =?utf-8?B?T3NUYUpMcmZpb0tSZDFKd0h3UlRoSlo1eGdYd0FVaUpIOUMySDBYRm9UTVZB?=
 =?utf-8?B?WTFDRllPV2Z0NW1HVHZBNXlRUjhXUUJ3MmV3U3Avb3QwcmVNVWlmMmhrSTQz?=
 =?utf-8?B?YTZ5cnkvZW83Z2lNMmNKVXRzb0w5U0pFZnQxbnZqd1A1bjE0eGlhdUZ3VTRU?=
 =?utf-8?B?U2xUTGpIYjVvcGxnd2JYOHp3Z3VHYUVHV3h6bVRZY2l1K0czNW0vZUw2a0xY?=
 =?utf-8?B?Ukx5WmowbGZjeXFiNktwMU5La1hmeWZXb0tMMFpORU5JRkVKRkt2SWlaVUxJ?=
 =?utf-8?B?UVhEYVJLTlkyVWY4SlhsSzNCSFMrL3drNHlCb3dCZmx2RUpuWWJYMVBVY0Er?=
 =?utf-8?B?aXVBOHNSU0w1VWF2alZrRDlmRlV1Q0pGQnZ0bFZUbjQxOXlyNXFSdVRVRDFx?=
 =?utf-8?B?K3JsREoxTkRhZjBtMEpRYlhpZk1MaXN3Wmdsb1pSMFZMOHZHeTBma1pieTBz?=
 =?utf-8?B?WHcyWlBHR2FmSXhTR0xSMDQyckpha2YvanRMSHU4djU2N09qR0tVZnNmMjBG?=
 =?utf-8?B?bVczQmdacGFzcVh5RE9sNHZEMHBDNjZUQnhVNjYwR0R5VlZtMi9mOGFsTHJ0?=
 =?utf-8?B?ajVsVW1jYkI0czFTNWszckpvUDYzcC9WK1hRdE0zMTNUT1R1UXJOZC9lYkFE?=
 =?utf-8?B?UWJWbFl0MEsrM3dpMWtiaXB5b3dadTR0Z1Bna01tdGFNUGlLc3Y1ZG1jVHZV?=
 =?utf-8?B?R0gwS01SNk5JaHFKTlFCeFlNajN5QVp2Y05oWEpxVzJoU0tGNHRXbnU1aGNF?=
 =?utf-8?B?YjJBVDZoZVVXUi9ycHBEeVk5ZEVWYWxFN2hNM01ZVlE3WE1WS05IaEtJMU02?=
 =?utf-8?B?dUJNQ3lOalVtRzhDcEJlcWtHY1hCdVp3STVqOUIyZ05xY1BmR1ZLWllkOC8x?=
 =?utf-8?Q?0yITrBQ26sHhqyH/k00XOHsOm9BNWvrF9N4pfbV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efd04ac-4729-4db5-35ab-08d93d6c1df4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 15:14:41.8591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0W+yx/I2k52wG8mkb1oTpD3crdx+gNkEC4aD3HsvXmVAIHIykMK+YS9FSpTalg2anvuXf39Amv4cwnDkFuKpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 02.07.2021 17:12, Jan Beulich wrote:
> On 02.07.2021 16:46, Anthony PERARD wrote:
>> On Fri, Jul 02, 2021 at 02:29:31PM +0200, Jan Beulich wrote:
>>> On 01.07.2021 11:36, Anthony PERARD wrote:
>>>> On Mon, Jun 28, 2021 at 01:47:03PM +0200, Jan Beulich wrote:
>>>>> --- a/tools/libs/light/libxl_x86.c
>>>>> +++ b/tools/libs/light/libxl_x86.c
>>>>> @@ -531,8 +531,18 @@ int libxl__arch_domain_create(libxl__gc
>>>>>      if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
>>>>>          unsigned long shadow = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
>>>>>                                             1024);
>>>>> -        xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
>>>>> -                          NULL, 0, &shadow, 0, NULL);
>>>>> +        int rc = xc_shadow_control(ctx->xch, domid,
>>>>
>>>> Could you use 'r' instead of 'rc' ? The later is reserved for libxl
>>>> error codes while the former is for system and libxc calls.
>>>
>>> Of course I can, but I did look at the rest of the function and
>>> found that it uses "ret" for the purpose of what you now say
>>> "rc" ought to be used for. Seeing "ret", I decided to avoid it
>>> (knowing you use different names for different kinds of return
>>> values). While I've switched to "r" for now, I'd be rather
>>> inclined to re-use "ret" instead. (Or actually, as per the
>>> remark further down, I can get away without any local variable
>>> then.)
>>
>> I know there's quite a few (many?) coding style issue in libxl. I'm
>> trying to prevent new issue without asking to fix the existing one.
>> The use of "ret" is an already existing issue, so I'm fine with it been
>> use in this patch for libxl error code in the function.
>>
>> BTW, you still need to store the return value of xc_shadow_control()
>> into a "r" variable before checking it for error.
> 
> Are you saying that
> 
>         if (xc_shadow_control(ctx->xch, domid,
>                               XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
>                               NULL, 0, &shadow_mb, 0, NULL)) {
> 
> is not acceptable, style-wise?

Oh, there is indeed such a rule under "ERROR HANDLING". Which means ...

> If indeed you are, please disambiguate
> your statement above regarding the use of "ret": May I or may I not
> use it? IOW do I need to introduce "r", or can I get away with the
> existing local variables.

... I need this to be clarified.

Jan


