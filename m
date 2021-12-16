Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC169477396
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 14:51:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247970.427654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxr97-0007Gi-Cn; Thu, 16 Dec 2021 13:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247970.427654; Thu, 16 Dec 2021 13:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxr97-0007EX-9M; Thu, 16 Dec 2021 13:50:09 +0000
Received: by outflank-mailman (input) for mailman id 247970;
 Thu, 16 Dec 2021 13:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxr95-0007Bl-SV
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 13:50:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1352bb40-5e77-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 14:50:06 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-5Eh3yvklNAaomexX3-lprQ-1; Thu, 16 Dec 2021 14:50:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 13:50:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 13:50:03 +0000
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
X-Inumbo-ID: 1352bb40-5e77-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639662605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uA6tRfloT3vh9c7MuLZ1zE6HnbJN/MKTiqJ/rO3B1FU=;
	b=hdrQ2wp/VonDOzwXq+5GTFeRYPezCsS4dT820mZ6/JMHXFunv4iLuhuNn0cRlgTIqXVt46
	rXDJK6AQtRXjKwJ9GKM56ev6FFLdSDaEEjy7MqXqh6BLCKYzJ66gooq/5gckrDEW+sQxZf
	b4n4Yei2K0XC8rB3gdecDfCljKqubmQ=
X-MC-Unique: 5Eh3yvklNAaomexX3-lprQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSex8uAYQhj2neENTZpduxeICUVIh8Ll31xxTFWsaeD8V/hAJq3MzT7NgLIAK3s9kJFI1xMoLpzgtaKu3fyjCK/g7MRPe2wskmRwJ9l3ADh5C29N/gi+votyPRAWfAVgmAtnTea6EvfzqzUeI3NOs7GWJ69e1MgQZkHkx915HyNmgvNHoT8/Yiu5cl/TdWFfaifVYX2gFAdGedol8FkxwLmiPwfxr25RDpChSownzr08273dIBD5I05oXmOEjdwjtIEleaGmH/IP56jnT5849yEm7a+pAwKmgyo13/E0uIogEg75fUvbxjRuggsxIXBpGWSLxLFbgph5y5jZc+/New==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uA6tRfloT3vh9c7MuLZ1zE6HnbJN/MKTiqJ/rO3B1FU=;
 b=hVBTRDoY6rqwprZHByhFt3jEeHn2BAL3UL+5BZo43OoDAe7AZkxaJe+C30wqxz6YhAMYOO+PED6HbmNHeaHR+24I6iHwN34vJhUgxDG9qg4Z5a0Ey/YV+qIOPUfKcSIAmuyLgCE0WWrvjlozwGDvLuIdNMOyQwdQEp1VJ6dwniLVPi0VIGp80zyCt7qk+mS6myoN6av8vvruAkVZpdBrijG7VbqsKvZiDT/4S6xk9+mHUKlj5PeFS9E4ph5bIz7mQjP/SGMJPDp+xi9jCYDSpsnhVsH8lcaaO+chy15gBCD0B0tvMuFbbVUOCR3USt1//PJBeEp2WFmOR59PVu2hzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58061d10-7299-6aec-5cb4-4c2d54f0043d@suse.com>
Date: Thu, 16 Dec 2021 14:50:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211216092134.579-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211216092134.579-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0106.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b5b1c29-7869-4c8c-46ec-08d9c09af5ba
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26071805856CC661A07AB630B3779@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YXFSa2Rd3dV7uS1mdVMHCj4Rb0a7aDjMXWNKssv7RmclXZFKN9NdU9IoiI5xOiGXW0e+C73Fgxot4HsN67bfE7XiiulewfBUANvAH2BjhQk31qyCW5oNmBvGLwc3EscsUSs0fZZZnlikwMTTt+9qtS7ATBQai6mTurksf4pcML2fkQzhXcO2yaD3Vf28rqBMW1A+jcwBeN3eJGDRrZt+TCKn2yD0LMOcGTWrH/5e56m5YpLbNwEozJiLg2+90llmkvTW3L9ti4mN8uc0/4NTzvbjE3P39fpO+tSB/zgWBNMk7vZ6oDFGCw+72Y/cp/c0HpXo8QhiBPTpSBUfJ8XG2/FNWRCH3LSHog2Cnp7ANTrkcY9x5VRmL8xd91KCRNGP3g3kwElszA4r3/bVoNnemq5JIv8dCtrOlqVUqkZ4y7wswA0q1HDjhIp7hnAk0faoMrL+blJ9pLHa7n4xv45v8Az2oxSaaaUlgqtmba8umchQeIXkIATgUd8riSfymghZNVn+3sxpJk38F24uWUJbIB6IBOnMmcli7v1xRNIE32bMi+e+6rZrz6jRlTPRJGiJkFZBY5OFjPIvExWjbYlI8EZMoCYrSm43ufOmNTW5gQvY3EC3CdE4HNIsFWwlfEIlm9E8Ny3tJLfp5cOqaUSxM5Hj9AvoSbPNdy3DONRl0K5DEs1ANti+7h9vvUDFa674XF/vxoB3xRRnaJxNgxlLpbzt3VAJAxZnrJNvTIOYzqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(26005)(186003)(6512007)(2616005)(53546011)(316002)(6506007)(8676002)(38100700002)(54906003)(2906002)(36756003)(86362001)(6486002)(508600001)(83380400001)(31686004)(66946007)(66476007)(6916009)(4326008)(8936002)(66556008)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnlWMHc2WEpPbW1tc1hyZm04STEybUcxMndQZWl3TmY4cnhnWVNXQ2dHdDhL?=
 =?utf-8?B?ZVE0T0U0R2Q1QU5MUzhMOHlKQWNxVjFhcHhGUlFtNzFzUkNkV2VJYWUrazIr?=
 =?utf-8?B?WkRZdS9sVUFiSU1ENWpUNVlXTTFoWEU2T3BSTUZJNGZndndVQTVNZ3FrOWhT?=
 =?utf-8?B?RUJqMnhEVHNnS2FYaE9kbEhBSVB5M0ozdEtOODlUUWJjeFpyZkNlbnErQ2Za?=
 =?utf-8?B?cmN2dDYveHBFTDJxTGhPN3NtN2xya3MxdFAybDQrY1VwRVJwdmJ1L2RKRnpx?=
 =?utf-8?B?TUNQYjZ4OWdBUjVENWI2YUV4b1JpQ0paaTZjaG1STkI0TzVKYlNiUlFhdnNj?=
 =?utf-8?B?VVVpb3JjZmFrWllMUFhXYmp1QkF4aWdtTExFTklheXNmaEh5alZ0OG1rSWdm?=
 =?utf-8?B?aEtZTmJPUXIwbExFSDFsUnk4WGZCV0ZXVytkNVZod3hvWmtiWFNqM0FXVVJw?=
 =?utf-8?B?WXVObVp4M2R3YXRZWllWcGo2ZnJxTXJkZUMxMXFnR3IxeUtkQUxtSHBncDNs?=
 =?utf-8?B?Q0RLc21VbVRmNjdmTGcvUjI4MEpLWmxmZllFY09MM1BtbGxBZEh6K2JMbzJs?=
 =?utf-8?B?Qk40UjlaWW1UeGh2QktQY2FTd01VTWtOUkhCVEFZVFVRMXpkYjFEckZNTk9u?=
 =?utf-8?B?djlUQ1ZnTktKbkM2d3VVZnZrYkhNY0ZGcGQ0SnNIWVhpLy81QjhQUVoyNnFs?=
 =?utf-8?B?QmViZS9uYmdZdDFnemw3ZmNVekwrVDVoVXY3ZmRWcEVvT1FKVG1hNkVMaTRi?=
 =?utf-8?B?blE2NVhwZEg2bnNUTEErVExsUnU2M0J2aHZweEFJT2xDZTFVZWZ2NWZGSnc1?=
 =?utf-8?B?eU9SZmZXbDVpeG41NUJmTXBjZXc1b0xNdSsxV09Vb1lrd0RtSzY2WFJWYmtJ?=
 =?utf-8?B?eUxjbnZNVEpBRlZVY0NScDhjKy9EQkRnK2hHVEVPYzkrc1hBOURCYkhhVkhF?=
 =?utf-8?B?TnI4U3F6Mmx1SGpZRHBJOWhrTE9TOXVQOFpPejhyZGlOWkh2RHZXWUtyRVRx?=
 =?utf-8?B?MmFla1cyWlpjNFQ0TjM2TjY4bFRqMlRPRUFtMXEveENzb0ZiTUVxWXdOQXpP?=
 =?utf-8?B?QWNEbUNSMkxwbS9mb2J1Q25OamFpR2ZXQjRKQnlrN2cvUEFTK2N6S1VudlFX?=
 =?utf-8?B?bDRzNjdQeW56R2RKY2wxV216WDFpY3llWVM1a1lGakYxZ1J3WlBlY1NKUUZ4?=
 =?utf-8?B?ZGtRaGllZitTS2xIMnJwcHduZ2tTSWxLUUo1SkEvd2RtTTM1T3lDUGdqZjRQ?=
 =?utf-8?B?VFN2NnFSSmJwMytySkdrV3Q1WkFScUtGR1YzTFFDMHB2eGhvenJFSGlRU2JF?=
 =?utf-8?B?MkJIdTMxeE9mVkJxdlVtUVRJSTFhUjk4c2ozQ0FMUGFSM2dtNkh1M2huQlo2?=
 =?utf-8?B?ZFRwcVh4WXQ5b295YjZkWDNCZTZscDBNVVEzbnFLLzMyS3BNdC9SRTNyYUR0?=
 =?utf-8?B?K2c5cVBUeWh2K01XeEVMNDNheUJRdVhJVXJpWVlwbzNaS0Rid0hkY0FDeTNS?=
 =?utf-8?B?YUNqRTNzaC9MVGc4MTZpaExwV1FCTGZ4SmI1OExLdElBeEdvb0k2SjMvdnRQ?=
 =?utf-8?B?MCtMdzV3UnVvaythYjBXdGF1VjRYcjlUSmxZdTd4M3lqTUNYYUFoV2ZBWjZo?=
 =?utf-8?B?eVk4ZDVoQU1xUkZHeUk3U0RlMzFZM3ZUT05mSjRLUFdWRWhoNWZ4aHZEYngx?=
 =?utf-8?B?Z3p2SmNRUzlrblJQQm5yWERJb3N3VnFvdE12WnR5YWpPTlIwUnk3OFF0MG1h?=
 =?utf-8?B?djhjdXFzekZwVmZSRC9McFFTa3llU1F1Q3JmdUgrVS9GeHBQdEU5WDUrT0FL?=
 =?utf-8?B?VS9QOTZlbi92OWF6YnM4ZmRRSGp6SzhxQUdlbTJSZjd1UVhjU1ZtM3NON1ZS?=
 =?utf-8?B?UnZwUGsrSFpqZjJDbHRESWVBbXVhdHgxM1h4MWFyTVZPdjRxVmZ1ZmphVmNU?=
 =?utf-8?B?RnMyaWtIZzQwWnQvTk9kazNUb0NnVGl4SkNaUXhxb21FY2d6eUZ4RWg4bzJy?=
 =?utf-8?B?d2E1d1ppUWllQVUrbFVySW1ZT3dBak5BSVlFL2ZqeUw0dGpGY0QzUXBrZElt?=
 =?utf-8?B?bndnQ0JGQ2FtR1NibEVlY0hJemtKU0c3eVpBc0NGd1U3QWZYT1ZpK0N3MTR6?=
 =?utf-8?B?bmJHc3M5eitBd1VzeDJPaHVnbnZwZkpoTlYzY3V1bE9KeHJEY1kvYU5GbzFE?=
 =?utf-8?Q?LW/RmSljwsL5BSRM9aKfD1M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5b1c29-7869-4c8c-46ec-08d9c09af5ba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 13:50:03.1467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4S2eMgSsEiHcr8SYFQ4FBFEXjWdWKvdZacQ86xm5yT993Fip6l/OPzcP+pVJpUV09QpwTUQlgcytcAlavbSyVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 16.12.2021 10:21, Michal Orzel wrote:
> to hypervisor when switching from AArch32 state.
> 
> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
> "If the general-purpose register was accessible from AArch32 state the
> upper 32 bits either become zero, or hold the value that the same
> architectural register held before any AArch32 execution.
> The choice between these two options is IMPLEMENTATION DEFINED"
> 
> Currently Xen does not ensure that the top 32 bits are zeroed and this
> needs to be fixed. The reason why is that there are places in Xen
> where we assume that top 32bits are zero for AArch32 guests.
> If they are not, this can lead to misinterpretation of Xen regarding
> what the guest requested. For example hypercalls returning an error
> encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op
> would return -ENOSYS if the command passed as the first argument was
> clobbered.
> 
> Create a macro clobber_gp_top_halves to clobber top 32 bits of gp
> registers when hyp == 0 (guest mode) and compat == 1 (AArch32 mode).
> Add a compile time check to ensure that save_x0_x1 == 1 if
> compat == 1.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>  xen/arch/arm/arm64/entry.S | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index fc3811ad0a..01f32324d0 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -102,6 +102,30 @@
>          .endif
>  
>          .endm
> +
> +/*
> + * Clobber top 32 bits of gp registers when switching from AArch32
> + */
> +        .macro clobber_gp_top_halves, compat, save_x0_x1
> +
> +        .if \compat == 1      /* AArch32 mode */
> +
> +        /*
> +         * save_x0_x1 is equal to 0 only for guest_sync (compat == 0).
> +         * Add a compile time check to avoid violating this rule.
> +         */
> +        .if \save_x0_x1 == 0
> +        .error "save_x0_x1 is 0 but compat is 1"
> +        .endif
> +
> +        .irp n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
> +        mov w\n, w\n
> +        .endr

What about x30 (aka lr)?

For values read from elr_el2, spsr_el2, and esr_el2 I guess the
hardware takes care of the high halves getting zeroed?

Jan


