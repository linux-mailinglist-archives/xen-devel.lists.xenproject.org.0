Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CF3321C75
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 17:11:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88241.165789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDnz-00062U-Cl; Mon, 22 Feb 2021 16:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88241.165789; Mon, 22 Feb 2021 16:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDnz-000625-7r; Mon, 22 Feb 2021 16:11:27 +0000
Received: by outflank-mailman (input) for mailman id 88241;
 Mon, 22 Feb 2021 16:11:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEDnx-00061u-V3
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 16:11:25 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a77b65f-1577-49f2-ab87-26b019530023;
 Mon, 22 Feb 2021 16:11:24 +0000 (UTC)
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
X-Inumbo-ID: 2a77b65f-1577-49f2-ab87-26b019530023
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614010284;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XSOgJbWp7keu4hnHmMl3c8h51USvAUMex177l66Cujw=;
  b=Tp68u0BYSxqTUIkUUkueYfLCiRotp21KLjOQkxyvDrWgUT+PPiS/Fzf7
   xyCng3a79w0F0McpCeO81mortTp9rP2Fs3QdhpHJ5xd3tMwznGDadovr9
   nyDobZpVpy6gW0pTfSXQ4vGt3vyXdR9G76+v1r2+lWppCIBvlzeYI2AaG
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bTQJDP0O7BbF0wV/ZqN8XrfTYJj7Z4/rwhgnB4pG50DVvcP6NB1mnwFwhxZpE03Xnq/gBxGMsu
 AwhvWZV72rToOb/2L5+dcLUZ6LjQoYhcj7ZVF57mIAZOSDCnMV/qNKAe0/hfnE9GrTcdwKXVxq
 OZ8cL+Vio5Ekw4UbdJ3WSU9gncc0hs+NBrC0iXmayKHkGBgU01YZf3gEes0rc/RI6/elFYuXRi
 pyzFQ6YjL/R5/T7ajkaRzV278xiAT3ypreobVGLLHBcA2cmE8FUCllpMwlOcZGLucBKMFa5+Om
 KMI=
X-SBRS: 5.2
X-MesageID: 38121101
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="38121101"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ajc8TUQxyynmuOpQnGnMadylbSlDjU729F/hhxrY+YSwsM/uhoJopuirGen7sD7qsiWSUz0MDG4FUd8WIij9MhsZxEtsGQyf9dVY1/y4GavVMzjUO5YIPiyyji+Q8B0KC0lwvU9Xig5bkfXEZbBAxpFkg+rstpJax7f+0kGhPZAOTdyDfQaksgEvzFUXlxuCAFyvoCkduzpen+aPT3tvUFrggm+AJFUv/nMDfaRwM4GZWK41lqCugfvwWbvIEJaTzgReCVo57YOam3F5T9EgYZ7wTK0Y/W+3Ohi6Aw4UR7i4R5AF3JYxswpBkYG1Ov/VxP6djTP+KrVoiC/ohWJtfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbkpyKsGP2H59wfl58+O1sN6CTAlszEnW1TPSoDA6PI=;
 b=CEUBHOoyGVQxXKcHkz1Mo/YV0SnyWUQQtoLT6yiMZ822cubjYOKLZl/JR7LkBIpvusXlUeDb38OmE6iU9KaantfCTIPFC7M9RTexUe20dB1tbW4qdHHWVWmlNi8BlH9RgggUTYRVZuTf93/sRpQ2Q+hTUbx6qyV+V8ucVyXq4M9tgJCavOgzqIfOVtjtlrjjIJfvbdszF2Hi1cWa0yYVx1KEqTwEtYgYtTX/uf8+ValHQNgpN5OuGugQVAmp6EFLcDfv8KaJx1vhqabwngMAKMnK/iorb6Uy1EN41t+r4V1tVyJxOYfeDIyqM7HQ/GeFC7v2qIEUHEwEfB8lT29pwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbkpyKsGP2H59wfl58+O1sN6CTAlszEnW1TPSoDA6PI=;
 b=GPngRZ/GX8I6hHF5uAyeahEg73UBgAhhMD11Q9eML8YYyP+Na3jZ8X5eIWiFh/X41ZJyXu+0LXEpOAVoH66LOzSbpsHa/sslepw5ztle6E5phC2WWWNDT7+vPwDWIR07yn9z/s0XeR5hZQ7gOlQ0oibvE1P1rKnv9g8RM4XJThY=
Date: Mon, 22 Feb 2021 17:11:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH v2][4.15] x86: mirror compat argument translation area
 for 32-bit PV
Message-ID: <YDPXoxc6WZUYAQZW@Air-de-Roger>
References: <2357b6ef-a452-13c8-8656-e42642e80d99@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2357b6ef-a452-13c8-8656-e42642e80d99@suse.com>
X-ClientProxiedBy: MR2P264CA0110.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a177ca1-9952-4160-1abf-08d8d74c7d6a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB484239548E8CF0B2B12964E38F819@DM6PR03MB4842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ADFBtFMcJyuCQtYGcv1XHVQO2TpLgWgyb9RPrjfirpYrQmOsAU+WfRZK+6BsYCmwcMftX8jxTqCXPXw10/6x3FlxaZrDybo2HL+b/t88pFsGJT35u7MtY8uncwWcA+IOE1CI6vNm2qveFzlKZsfGTsaoJTfe75GtiRuzDqi6nZziF5qdp2mtGmit6bynO+KcN0ebbOvbmIriJhdY09IAhxUA2jombI9GvsU8u//fKhhg08JvPSVg2pvKzlMGREKhhrxXWIY8bCe1k7/E9KBs6mIUvZQLfJOhEJmlyhTcBsDY3f5VtScPTP2o/kyaQRjiNFciHPrdVHK9tPKZ3wS+FM/f7eYd6S88A3aF5pQrd747rGaf/t8ZO9XwhmrQCwRVX7ZkrcqSE/GMLb4klK3VOxD82B79a146DKl0cvD4+e/A1kzMnAj/qkNSSK4MX7yn+JkaMQcJ+1u053qGldMBCxHa3A8Ma4Y+MORSEnT+k2wKm6687vkm3w5hJEtAxBRmwfvaqaVHoD6iLUFOvCYNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(6486002)(66476007)(2906002)(4326008)(26005)(86362001)(6916009)(8936002)(6496006)(5660300002)(9686003)(33716001)(6666004)(186003)(956004)(66946007)(54906003)(8676002)(66556008)(316002)(85182001)(83380400001)(478600001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bktwVWlOd3hDSmhESHdldjk2WXpuejJIbDZUMlozOUdRdmRDd2NyVEhrN1RY?=
 =?utf-8?B?MnNBZWw5WHJFdmFoRElXYVRpbzRLaVZEWjAxdGVlbHBJemJwdmpZM1dDdnpT?=
 =?utf-8?B?b01xYUdUQmd3MmZKbEluZFpSODdYV2IydTQ5QnArM0hQQllMRTg1eEdGSGVM?=
 =?utf-8?B?RDNIRUdIM05WdCtXbXBpTmZZNVpPa3RBS3FwdFMyODhsbUFnZHBpeVEwVVBR?=
 =?utf-8?B?b0lqUm9maW5yNGtVcTltTTBYS2o0eDlNWDBZRVRVanZiVm5XYWx0SFV4cTEr?=
 =?utf-8?B?SEZTUDJSWGNpOU1NZEhKUy9NelJ0RUpCNm44UWhwdjIrbitwV0pJZE1zem9V?=
 =?utf-8?B?NGl6QzBLRytmMDFyOFNGeGdqNkJVTlJCYmhaSWlUWHNZYjQ5TXIzYSsrSk05?=
 =?utf-8?B?Qkd1bDZXMlFjSEVxL01CbW02UTUwNWVLaXpBaXNmdmtXVjdyc3VFR1pHV3dq?=
 =?utf-8?B?NWduWjMxV043dzgwOTZkcXlJcDA0akZlYnFac0I0Zmc1ZFJ5M0xIc2VEbDRM?=
 =?utf-8?B?U1dLOW9Ib2tCRzd6Z2pkNEJMaVhBbzFRNS9nZUlCU2p2WjFLMWxSdjhJcXh2?=
 =?utf-8?B?OTdNeFA0RFF0OFQ1ZzBlUkN2U3p1cm1yMFlQM1YwalRoR1dFajkySDVhYWVO?=
 =?utf-8?B?amViWXJhTjY0dmUvdkIrTkpiUHdEaFkwb2lSeWd4dDJ5eEF4K1ZOTDNSRW1p?=
 =?utf-8?B?YzZUTVFxenhwREJhWkxiVU5iNEMyNU4xcDhUOEJFQ01zQXVwWTl0YWxuWFN6?=
 =?utf-8?B?WkkzWHhvd09SVFBKbGdFV3NuMURhT2RDUjBkcngyVU5nUkhrQldyYWlhMWsw?=
 =?utf-8?B?RkFEc3JKeWlWd0NrZHdMcjdBNE44VjRvOUthcEYwc29FZXdDTG05YXpQcU44?=
 =?utf-8?B?VzdpRmo3ckNaWWh2dGcwRGZyaXlRUWZpeEdpd01JV1pTanRGTVIwM0U0dUgw?=
 =?utf-8?B?U043TGZpckNrYkFUMStYQ0xMYVJJZDhxTllBellJcHRRTU9kQ092VzZiWERr?=
 =?utf-8?B?TEdvSS91V2x4YUR0YWIvQUZJbERHYWxWbFlwMW96MnpWSkdBZ1QrdlJ2SXI3?=
 =?utf-8?B?cFlNajNRb3ExN085c1F2eCtHSy8rdWhmaTZkTnVOck9xajFDWCsxSzVJYjNh?=
 =?utf-8?B?TkFsbmsxNmtnVUZ6WlhPSVd5NkZLMnhHWjk5c3N1MjE5SDNkYVQ4VlNSZU9O?=
 =?utf-8?B?ZnFHdlo3bUhBNGlQazEwdEsvNldKc0t5Z3dONTJHOWdONUl3WWlTVkR4REdh?=
 =?utf-8?B?L3ZXay9kYmdDdS9HMi8yQ3JjRkV6eVFOS1FUNGdnYzVqeXJoZ1BsbzRCQUR1?=
 =?utf-8?B?VWx5YVdUUUY4NnA1M2VsM0FDWXZYdnlvb0hLZEVnOFErTWUyUWR5RUhGQWlC?=
 =?utf-8?B?YWlrUGphOTNPZzdabmhaUVU3V3J6aVlMMXV1Tm5WK1oxSTlienhXNDY5b1FE?=
 =?utf-8?B?UnNqTWphVGoySENkbmNWVUo1U2pXUmlvRUVzWWpiQWFsMTlJa0FOUWNLN3hD?=
 =?utf-8?B?S085aXJ5a08raEVMY1FOcXFDbU94QlJ1bkhCWFFOazdjM3JEOVkvOXlYVmdM?=
 =?utf-8?B?amtFNWVpSktLNzVxNkpZd24rNkFuWlZjK05NblFRY2VhaHY0aG1WTytQMTg1?=
 =?utf-8?B?eGhKeWt0Rjh4U1czOFNlQU45ZDBiejVDZXA5a0NDYVd3ajYwMFdoaTZFWUoz?=
 =?utf-8?B?QkZVaDBkV0pXQndGMk9IWjFQTkJVNGN4TC94WC9lbjk1cVEwK0poci8rOWs4?=
 =?utf-8?Q?W1z52NjKZyLANpPvYzjE7WrYrHPgk4y4Uj29UHE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a177ca1-9952-4160-1abf-08d8d74c7d6a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 16:11:19.7105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rL0dD9kHrJFUE/HfR0BFuiBK82plbYFfWG6IfB5AsUm/B/lPvD0dBCRChbH8314LxonagWvTXEA4PcBFv/diCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4842
X-OriginatorOrg: citrix.com

On Mon, Feb 22, 2021 at 04:50:14PM +0100, Jan Beulich wrote:
> Now that we guard the entire Xen VA space against speculative abuse
> through hypervisor accesses to guest memory, the argument translation
> area's VA also needs to live outside this range, at least for 32-bit PV
> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
> uniformly.
> 
> While this could be conditionalized upon CONFIG_PV32 &&
> CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS, omitting such extra conditionals
> keeps the code more legible imo.
> 
> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One comment nit below.

> ---
> v2: Rename PERDOMAIN2_VIRT_START to PERDOMAIN_ALT_VIRT_START.
> 
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1727,6 +1727,11 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
>                 (ROOT_PAGETABLE_FIRST_XEN_SLOT + slots -
>                  l4_table_offset(XEN_VIRT_START)) * sizeof(*l4t));
>      }
> +
> +    /* Slot 511: Per-domain mappings mirror. */
> +    if ( !is_pv_64bit_domain(d) )
> +        l4t[l4_table_offset(PERDOMAIN_ALT_VIRT_START)] =
> +            l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
>  }
>  
>  bool fill_ro_mpt(mfn_t mfn)
> --- a/xen/include/asm-x86/config.h
> +++ b/xen/include/asm-x86/config.h
> @@ -159,11 +159,11 @@ extern unsigned char boot_edid_info[128]
>   *    1:1 direct mapping of all physical memory.
>  #endif
>   *  0xffff880000000000 - 0xffffffffffffffff [120TB,             PML4:272-511]
> - *    PV: Guest-defined use.
> + *    PV (64-bit): Guest-defined use.
>   *  0xffff880000000000 - 0xffffff7fffffffff [119.5TB,           PML4:272-510]
>   *    HVM/idle: continuation of 1:1 mapping
>   *  0xffffff8000000000 - 0xffffffffffffffff [512GB, 2^39 bytes  PML4:511]
> - *    HVM/idle: unused
> + *    HVM / 32-bit PV: Secondary per-domain mappings.

I would use "Mirrored per-domain mappings." to make it clear this is
indented to be backed up by the same physical range as the original
per-domain mappings.

Thanks, Roger.

