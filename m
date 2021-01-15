Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C62F7C23
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 14:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68066.121759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0OrR-00005k-3W; Fri, 15 Jan 2021 13:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68066.121759; Fri, 15 Jan 2021 13:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0OrQ-00005K-VF; Fri, 15 Jan 2021 13:09:52 +0000
Received: by outflank-mailman (input) for mailman id 68066;
 Fri, 15 Jan 2021 13:09:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0OrP-00005F-2d
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 13:09:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96e460ae-8339-49db-9789-e55d24175883;
 Fri, 15 Jan 2021 13:09:49 +0000 (UTC)
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
X-Inumbo-ID: 96e460ae-8339-49db-9789-e55d24175883
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610716189;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=efdFiOvmT105/9VOGU37hCsBy+y7FGSuXk7+U+M5QLo=;
  b=ev0FXkztxqbVN2eQOx0V+L+BwQOLKi01ZPw7IigSMohFCfDDoaQNF4LV
   HUuGlmDgnjnyQCevcvgooaNfV5+aMqPJgl8/7ZzJJqOwcIhq+jr+CV9/D
   vtYeraLhhuvfYhJtXXeAvPam6hh8geUtMIeCboJCdF5XD0PM17A9jClkj
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qpuYnRo3VFgTUbh+yr2t+HgxEC/aQekEnnoomejjilFPFpIStN9sUkg+0ycdWhrfVtOY/kBl3I
 WH2FblPfzfTEVfcFFdr5jh/vH/Z3wEDoHIdWoxufJ8hZpetqwyrcu5e1ao4NglVRX8WrQV4lQD
 JWZ7r2KhZwm5VDMY+BTFbiakmIxo2a7munIUcjDDeebX64xd07d92Gw+7i2v2YkgGO60dpoQla
 1IL/dTbXFua1zYCGxqZh+F8LS9bwfysEwOdDU1k0mZewoZgSG3umvaOCtXvHBo9qe0q8VT7WzO
 65o=
X-SBRS: 5.2
X-MesageID: 35169457
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35169457"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbbpWefTMFH9m5GtDgP9ji67vHb+cTFBNrvLyiB/k6OmGhj4qUiU5y+7fH0ISmlJjiTohhDG/5pz6pl4mh4W6y8sICOKHLOTygFHw4ZTyzlK/aCzYeX+dhpkRuiINOYaloxPLaZXa2OTf1lBD4gOhW6UcHsgBLuy8DVqQ5PKTePEt2dc/SlTfvcrzeRQt2xVmJXpoSzQUa8NvAVX3NWzVwm7v2Vs8hzJrtym/4/QYH1jvmy75UuKt/PFUFb+iAyrfKcL2oFlsllugg47pVMdV2bBMw8lstqfXr0mb0i5l/FA6AYeVjNGzy0Gz3dtAvb3mWwj/n2zXo35sgCyld+yBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHyVzc6HBrw4xdr7fHHZmugs8Aoti0rcyI17EDZztZY=;
 b=Z06Mh0j41cB1Otu7jZ6pq0B5DPkWOLjfGJiy4aF6vDnLg1PNwia25DEqDXKHEP77+6tdghDYQAht7BX/idpWq7S31hTuEiDtSrtKKkv9HFt7JSzX8CNajYa5EbS1jSU3Gl4J2IdqYjRONLzjktxQQaRbKiOxjke6bR+/X1t7dvHsJaL/J8GZuH0fnFEm8bz54nE40rriB+bB93vNMakcXjEFxGbhOtqSWd9ux8lKN8mvsxxujp9re/avAkPLJjgFu65PXmmItIniUaawADoxMT5Ucmjc9mGmteYHPF338r6kHmQpJTywjNiLQDtao2LPcShUyeJhvbG1R5h1l10a/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHyVzc6HBrw4xdr7fHHZmugs8Aoti0rcyI17EDZztZY=;
 b=nIqyYp+kRZrsvWI+rbiUvhG0UvzFUKNDK4KAxN0lpQbcAkSl5Jgt81rc/uqeWV6L0XRM6Y5sYCtL2pG2pO7ExeMKqt9Q9EeR0VjbtNtmooFFzDFAPTfFXac19yAGWuoLENe25QZ+iaO0Qo1C5LeFx28xye/ECghkmxZYEm4EZso=
Subject: Re: [PATCH 1/3] gnttab: adjust pin count overflow checks
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
 <38331526-5c24-08d4-b1b6-9baa16251c1d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fb12277c-beaf-2058-69ce-0c7c14bce56c@citrix.com>
Date: Fri, 15 Jan 2021 13:09:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <38331526-5c24-08d4-b1b6-9baa16251c1d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0331.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::12) To BN8PR03MB4721.namprd03.prod.outlook.com
 (2603:10b6:408:6d::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac7f2561-d5f6-4137-9745-08d8b956d421
X-MS-TrafficTypeDiagnostic: BN6PR03MB3108:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB3108002B12D5C9993ADBF6A1BAA70@BN6PR03MB3108.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SEb1HjMmFk6EgwpyPmXCqwQobTuzYDXl/y5GJDc+Jq7MEAUGhrEcXE5ChPsNaO3vnSYdkEYmtJX3LoD6GdmMcPYUGIKhVaHvO7BlVR5XYW8ZknUEBOJs6WgAMiHOJJZShYBEIR/eQRwLu0eHxVEU7XDHGXCdzPxM01VK7wfokeEcPpUQFUfUbHcEKjd6SDcIQ74CtSh5amA1gnzW4SahqTSPV/p3gQ7qiNrTHWvT/uNa3BcNZRvnejxaS5UIkaF0zbs0gVrLHz/1KYYoFnEh1G42NdglHmPbcCLyxPh5YWH1cHtI0yGquJ3uWhgbN149g/c65Yf2QxlbGCfeVh2tDxfJOgNeTx7ClZiDfVygyEl9PsRp7sVwj062MDm9b+Ut2Yf87AT+WcIT7vObFsNJsn2IKYf2OaISpr0qAxRPBmw1qMXe9y8RsWwvxJn6fqxM82zGK11H6B/tyCw0+gDsovYdHg2DAQ9gqT0rrTnBT8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4721.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(86362001)(36756003)(5660300002)(2616005)(110136005)(956004)(6486002)(31686004)(16576012)(54906003)(83380400001)(4326008)(16526019)(66946007)(66476007)(66556008)(2906002)(8936002)(26005)(186003)(31696002)(53546011)(6666004)(478600001)(316002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZEVaait0T2hBa2RWQklvdmU5ZWdhZXRmcFhNdnZDallTM2t4aWc5b1VLUDRv?=
 =?utf-8?B?OXJaQ0VPenU4dDFPTkxpMFU2b3ArNE1rS1dHZEhPUHNzMndhY3hwQzJEVDR3?=
 =?utf-8?B?L05KYWk4NGFyVmlMa3F3MTFyTURhWFQvLzJVYXpwbnNGZ21xRnljcFZSNm5p?=
 =?utf-8?B?YWRKd1U0a1R3V3oxbHg1L1NydVdMdEJJOFExMEZjdGZqWFVCdUE1cmdteHQv?=
 =?utf-8?B?dHdMTzRmZjdBZFROZk55eFlYQXVWYlkwWjBOZ0JrajNtYjVGSCthWVJIVXEr?=
 =?utf-8?B?WWJxTU5CcWFnWVRmNTJPK3hGbWR3V0FhWWduUTFZdmEwaDV0ZFNTMjRuNlU3?=
 =?utf-8?B?V3h0eWF0TTFpd2plallPdlg4aExPeHh1bG9USUwrcStzVTVvaXN4NjBORmtV?=
 =?utf-8?B?bmhoeTdFR3pLQTZVODJyNFlONUtGMzdMODdsRUhqL1Q4VWQ4cjVmZTdFOWU3?=
 =?utf-8?B?ZUQwVHE2cEV0V1NRYSt5ZFJYU2RpcVVSdnc2bkxtcVBxTTNVbmg5MU9IMUpD?=
 =?utf-8?B?d0dYaldER3NRQU5hak1YWkdyNWJ0MGkrU2FyVXVZSVRLYWdreU9ONEZNZEw2?=
 =?utf-8?B?QitRYkYvSlhGRkdoemVaM0RVTkVIUUV0THZ1ZEo1RHZnekpsMHg3MVZVUlJ5?=
 =?utf-8?B?QzNRV3dFZnA1Rk83YzZoanZBR2xlMnppUFNMUDRIOHVJTHMwcW54cCtkTHlQ?=
 =?utf-8?B?b3h2clZtcFczZWQwNjZ6ZHZsVGFsb3U4dlFuZXVhbVRBam5SVW5BTVNUdWdI?=
 =?utf-8?B?OU5Fa1VDOHJPT3plTDNKenhwcDJTd3N4T1pIMGo0Y1FEbUJUbmtiVythVlNL?=
 =?utf-8?B?eklSQW1lZFVrV0VPODQ0eFMxZUN2aTRKWXdDQ29BODF5elFTemR4cUJaVVk5?=
 =?utf-8?B?QzMzRFJWQ2hXWjhKVkFwUU5La2tQZ3U4Z3NFZXVscFQ1MWlEZnY3UVlFWjFz?=
 =?utf-8?B?MWVjc2tyMjZtUUdya1pCaU9rUDJtYnl0SmgyclB4U3h4cFNzamVMZXQ5UnVB?=
 =?utf-8?B?MGhsM3A3M3Jrbk10ZHJ1SGZYd0UrMnVqVW1MTXpYY09zanlTYTRiNTA1bFpU?=
 =?utf-8?B?WWJVczZNM0F2ZFZOMjlHaXg3SWI1bTV4bk9XbjhmUjUyY1duejFHSUU2Y3ZM?=
 =?utf-8?B?aHR4Y2dVdmxESWV5cmxpQVFRVWRmd3pPZTB6bG9RMjVjRzNaOXhiaFZ0bVVT?=
 =?utf-8?B?UkNnZ2FnOThPYVE1dUxUMUZIY01KNVdGQURDWkVxSWtRTkFtYjk1SXBCTklZ?=
 =?utf-8?B?SEc0eDFHSlQrdkdYK0c1WUJnbHhYbjY4bklycG51WTI1NmFBQ0hsRE5xOGtk?=
 =?utf-8?Q?nb3Dswjf7FXTubaXKYWCRRc3SJL61vosJX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7f2561-d5f6-4137-9745-08d8b956d421
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4721.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 13:09:45.8307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shwQ5F3efVZ1mhaTiZGrK1wY8nabQsEFFG9O9Ws6eryijcmweASkktzx8VhfKh+J10oNaCXRyM/FP1Sl2hB/InuFqGo4JcA2fVIjN2RMmj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3108
X-OriginatorOrg: citrix.com

On 14/01/2021 15:23, Jan Beulich wrote:
> It's at least odd to check counters which aren't going to be
> incremented. And it's also not helpful to use open-coded literal numbers
> in these checks.
>
> Calculate the increment values first and derive from them the mask to
> use in the checks.
>
> Also move the pin count checks ahead of the calculation of the status
> (and for copy also sha2) pointers: They're not needed in the failure
> cases, and this way the compiler may also have an easier time keeping
> the variables at least transiently in registers for the subsequent uses.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -323,22 +323,25 @@ shared_entry_header(struct grant_table *
>  /* Active grant entry - used for shadowing GTF_permit_access grants. */
>  struct active_grant_entry {
>      uint32_t      pin;    /* Reference count information:             */
> +                          /* Width of the individual counter fields.  */
> +#define GNTPIN_cntr_width    8
> +#define GNTPIN_cntr_mask     ((1U << GNTPIN_cntr_width) - 1)
>                            /* Count of writable host-CPU mappings.     */
>  #define GNTPIN_hstw_shift    0
>  #define GNTPIN_hstw_inc      (1U << GNTPIN_hstw_shift)
> -#define GNTPIN_hstw_mask     (0xFFU << GNTPIN_hstw_shift)
> +#define GNTPIN_hstw_mask     (GNTPIN_cntr_mask << GNTPIN_hstw_shift)
>                            /* Count of read-only host-CPU mappings.    */
> -#define GNTPIN_hstr_shift    8
> +#define GNTPIN_hstr_shift    (GNTPIN_hstw_shift + GNTPIN_cntr_width)

While this patch is by-and-large an improvement, it unfortunately
further hides how the pin field works, which is already clear-as-mud.

I'd recommend replacing the "Reference count information:" comment with:

/*
 * 4x byte-wide reference counts, for {host,device}{read,write}
 * mappings, implemented as a single 32bit presumably to optimise
 * checking for any reference.
 */
uint32_t      pin;


I still can't make up my mind as to whether this is a sensible
optimisation.  It is borderline obfuscated code, due to having a totally
undocumented and weird data arrangement.

> @@ -1052,19 +1063,19 @@ map_grant_ref(
>      shah = shared_entry_header(rgt, ref);
>      act = active_entry_acquire(rgt, ref);
>  
> -    /* Make sure we do not access memory speculatively */
> -    status = evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
> -                                                 : &status_entry(rgt, ref);
> -
>      /* If already pinned, check the active domid and avoid refcnt overflow. */
>      if ( act->pin &&
>           ((act->domid != ld->domain_id) ||
> -          (act->pin & 0x80808080U) != 0 ||
> +          (act->pin & (pin_incr << (GNTPIN_cntr_width - 1))) ||

This, I'm afraid, is not an improvement.  What we want is:

#define GNTPIN_overflow_mask 0x80808080U

The reason for checking all at once is defence in depth (not strictly
necessary, but also not a problem), and in this specific example, using
a constant results in better code because pin_incr doesn't need
unspilling from stack and manipulated.

If you're happy with both of these suggestions, then Reviewed-by: Andrew
Cooper <andrew.cooper3@citrix.com> to avoid a repost.

~Andrew

