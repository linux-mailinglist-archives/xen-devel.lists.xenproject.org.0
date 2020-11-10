Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4252AD46D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 12:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23244.49888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcRTp-000625-BI; Tue, 10 Nov 2020 11:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23244.49888; Tue, 10 Nov 2020 11:06:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcRTp-00061g-81; Tue, 10 Nov 2020 11:06:29 +0000
Received: by outflank-mailman (input) for mailman id 23244;
 Tue, 10 Nov 2020 11:06:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcRTo-00061b-6A
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 11:06:28 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7b9a9a1-76e4-4aec-b330-5cf24c955b51;
 Tue, 10 Nov 2020 11:06:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcRTo-00061b-6A
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 11:06:28 +0000
X-Inumbo-ID: d7b9a9a1-76e4-4aec-b330-5cf24c955b51
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d7b9a9a1-76e4-4aec-b330-5cf24c955b51;
	Tue, 10 Nov 2020 11:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605006386;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=IoeKuqYSK5jA+7hLi8BBP01Ooa4QsWCp7IH9OBg61IU=;
  b=N+YbqqVrVyKvEjW2F7D7h1XTalRs6n3u+NdxK34V2ULHOUQFM/VLMJn7
   ArJfE4ukLBv+VKNhn/40sxiRlNxoCVsE8KQ/vq2692J4kVQCquiaRgwQ1
   7Vo3NLlhbCkSEQ78kvoCou70u696Y0uENNE2e0+aC7IEO6pqu8eNT3YDN
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4tyJ30fWxdKDPOogYFRirC82FqLHUxjtxFwwHK36xTsQt5NlgEdCnN2+0p9kcoQxTDLA971PFb
 9L6+QCo4Kqg9lYQVNGetrNrN2hK+EusKvUFiSWJbtZtRkdQtsWSQMoB+ro3tFRa7Qt8ax59pRG
 heTsdQf8ZQV1buBDQoQHwkFhDXdjWYAvRy21OQ1mRw19EreBa+ODxwnkGbj8VGKaSwuxmdLaqD
 //hQeXNLmt7Lcqe0ELQn6aa2NiDptht1blB+JjzEm1ag/YPZmoWvYCZr5OzHrc1/eGQHkCgjgS
 8Dc=
X-SBRS: None
X-MesageID: 31071122
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="31071122"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHiG0TsDCKl3rnbO6tjBVUm0RcgdQSKoYgWxWw77NeutuMpbASTm9yagXlH8AdMo2GY6pIcltuYJ1nHGXX9n60mbWOiOogeMI5VLZO0O+1i0YKocgVjso14Sfxk9SjLtzyw4bRlVExURItOLpFuNGYECe8qdGKSseHUybTCAOTG6EvwB328nk+ZB6koKgCNKNcDO/Or9cZ6iEq7BmbnMgunggpmugmV41Re9EoALy9nyrjgPJQSLFKf5UF5RJ7vw/oYadQx4/tY/tCtS58Rx2ZsiyWCaaAa7lVWlzT8EgyTC4cuFBxqgOYp9k3pQq1f5ucrNQ0KD0YPIU1HIqVCz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0jYr58tjfamTxcEsgCw9lsAJ5QTh9ksPUArderUhmM=;
 b=hx8HaokcvfZxirMLaLg0a5Usv9f2BQBBBU6Uweuq/INXvz1tsZqH2JRYxdivM2vZ4WlPCVopfSMizGr+14rSMQl9LQ25uWkWW+07/Ox8kR7LJxzg+AcesStWLjq3n+oYiKQ0WzsYbu27d028+2AkLuZId/U8qivoHatxvfMOBi90ThsjK8QcV3pU09lOwiuXHAbzoGdVGWgmUtJCoHBgsccmOn2BDMtEWDb+lWX5SQg9KWMQ56FFYGoAEVEgLimDVnQGT4KDxmBYe4b2w3GEUTtUIx7ThPUjEYpmwf6NntlEwZWU+QJ8qMVLK9FKGxW3zOj7Gjl9O0gWBCC9Pt0NAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0jYr58tjfamTxcEsgCw9lsAJ5QTh9ksPUArderUhmM=;
 b=KGdJxfVArkRIZv8/IgYrNwQxJwUElgvwiuKTh1tF6ssqN5PxVkPlO+y2aComTXAD95CRFSVELovD1zBs5yk/ZyX2dkwy7AID3Ovya40Xnlp9cNpvAfkC4nlH29nRyYxmXM8t8sFnl6xVI0y3ywlon9WrRPzMMl8uNOCp0Ywqa2M=
Date: Tue, 10 Nov 2020 12:06:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 2/5] x86/p2m: collapse the two ->write_p2m_entry() hooks
Message-ID: <20201110110611.p3twf6rmy7qdlxa7@Air-de-Roger>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <b26981d1-7a1a-2387-0640-574bdf11ceff@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b26981d1-7a1a-2387-0640-574bdf11ceff@suse.com>
X-ClientProxiedBy: LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e3d672d-7e21-4200-0cc8-08d88568a890
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5463C7C2BD0ACA18BE2E24778FE90@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z5yWdSSgUgIrKQSIFe+YLVkZ6+OGTk7te1EbRNZPvuKLHX+1BE63E6fglUNJwiIR8psAMT3yY58m9bIuXu9oOSo55Q1fpCU8Rxhsm5y2bqv0UthEGx6p5bnLwBzKeh6RGfp2fmdWtDNLDY1szXw9t0AAK7GPXZHM+DPTRlPppJ0bXypNa0yJKKpjA6+z7rpOXWx6/v/sx7/WSPvYPx5zxug/UnhauaH7k5kiNxhIapHVzKk4NCg4jjMrFvMcH5mYg2CpHcarVaZFKWzmfsrlhBQAK7O1/mw+M+r3I3Cfay6691hJUvmsWiPSXtCe89rPxRe+3RSQ/UrfNj28fIag9ar6sBtFg5EdNQHs1xQkXX4j1AXu/iXvlJ5MKNO4uTHS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(39860400002)(366004)(346002)(136003)(396003)(2906002)(4326008)(6496006)(1076003)(5660300002)(8676002)(66946007)(9686003)(66476007)(8936002)(83380400001)(86362001)(85182001)(186003)(956004)(6916009)(16526019)(478600001)(26005)(6666004)(54906003)(316002)(33716001)(6486002)(66556008)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: jhvOG2WAcSB//Ok/SdhjC4sj9ogQUOa35lozhyGuHT5gaLEPiUTt8q3RAtzU3H2SBlwMY3RU5NqU9SnMF7efGQOJbY81UHHaISIx5GCYBZDOy5LVo06ot6cuUyXg+pbxJMT1zyX/IyPbT+Hh6Hs8vGZYkxKz+ilZssvnxn9+4/d6ArNMsapiOmCd/+BhGcV+s2Nnayjmd9w8HH4odM8xXL3bHCmtz3pHOzYp7/WhY23LAyfEJceI5OGa+LodbeukVkF+uHuUvRBoKlUFcof4jGcr+cyeKveraBbAmwoqbfe/dkWW035ICeqp0GLQ/bZI0/2XeLoxONSbqb2ah2HTKn52knoBu1+cc0ejI151uxwXhVZz1xPPirQF4OORCpqVRm6+5D6hfMhps9lB7kNAKqGigj61rcECGbKeAmg992lbqKZ55oPttNYUY35q0b/zXdFY0E05/1qYPeRt7dmeFj1I5q/VWef6kv4pnAkfj32Xq8A8T7Veqay6KVRJEPH71ogt30OJoYKOUKO69cBTQg5FEojtMut5H+3Y2iFAhkJSLA0p4NGnDmxPaX0BiRE06yNnhW7RNOaJZB2+S8U7LMcxeVHcUSz+9HfGPg0RCDmi0jV2+BTmLOErSVFTa2/sS1/XL8l/dfjO+swDgvW5HcoUuDAtbNsW+4x7UuHDXrqpFeFj6FQeQPNqkSL1Z/J1SKHtZAZTVr5UcQsW1t3YgPGcv35CNxaIriaXbl+TCrtYYu+xMD9xzP29iuVBKrARUqnvFlQW0ylD+4fWM+GAdRs4GWr0pH43Ty3shhyaJv6+WbCE0rpHRRUKEsk1u5woiR/BQE0SgWyUDXBHkYwrZy/Icdu424b+eYbAbMq1VO/mBsUAzM147A5Qv/gHIH/YO6m3QKNf5H65H95GIL3jng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3d672d-7e21-4200-0cc8-08d88568a890
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 11:06:22.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKxOld4fbT8KRQknB+nXQ04QDxH+MJYPfRpC9mLsax0km9NKyDFjIDvCwQU29ng2fSL0GWhQsl9pmPJRUmAjOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Wed, Oct 28, 2020 at 10:22:58AM +0100, Jan Beulich wrote:
> The struct paging_mode instances get set to the same functions
> regardless of mode by both HAP and shadow code, hence there's no point
> having this hook there. The hook also doesn't need moving elsewhere - we
> can directly use struct p2m_domain's. This merely requires (from a
> strictly formal pov; in practice this may not even be needed) making
> sure we don't end up using safe_write_pte() for nested P2Ms.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Like for the possibly unnecessary p2m_is_nestedp2m() I'm not really sure
> the paging_get_hostmode() check there is still needed either. But I
> didn't want to alter more aspects than necessary here.
> 
> Of course with the p2m_is_nestedp2m() check there and with all three of
> {hap,nestedp2m,shadow}_write_p2m_entry() now globally accessible, it's
> certainly an option to do away with the indirect call there altogether.
> In fact we may even be able to go further and fold the three functions:
> They're relatively similar, and this would "seamlessly" address the
> apparent bug of nestedp2m_write_p2m_entry() not making use of
> p2m_entry_modify().
> 
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -823,6 +823,11 @@ hap_write_p2m_entry(struct p2m_domain *p
>      return 0;
>  }
>  
> +void hap_p2m_init(struct p2m_domain *p2m)
> +{
> +    p2m->write_p2m_entry = hap_write_p2m_entry;
> +}
> +
>  static unsigned long hap_gva_to_gfn_real_mode(
>      struct vcpu *v, struct p2m_domain *p2m, unsigned long gva, uint32_t *pfec)
>  {
> @@ -846,7 +851,6 @@ static const struct paging_mode hap_pagi
>      .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_real_mode,
>      .update_cr3             = hap_update_cr3,
>      .update_paging_modes    = hap_update_paging_modes,
> -    .write_p2m_entry        = hap_write_p2m_entry,
>      .flush_tlb              = flush_tlb,
>      .guest_levels           = 1
>  };
> @@ -858,7 +862,6 @@ static const struct paging_mode hap_pagi
>      .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_2_levels,
>      .update_cr3             = hap_update_cr3,
>      .update_paging_modes    = hap_update_paging_modes,
> -    .write_p2m_entry        = hap_write_p2m_entry,
>      .flush_tlb              = flush_tlb,
>      .guest_levels           = 2
>  };
> @@ -870,7 +873,6 @@ static const struct paging_mode hap_pagi
>      .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_3_levels,
>      .update_cr3             = hap_update_cr3,
>      .update_paging_modes    = hap_update_paging_modes,
> -    .write_p2m_entry        = hap_write_p2m_entry,
>      .flush_tlb              = flush_tlb,
>      .guest_levels           = 3
>  };
> @@ -882,7 +884,6 @@ static const struct paging_mode hap_pagi
>      .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_4_levels,
>      .update_cr3             = hap_update_cr3,
>      .update_paging_modes    = hap_update_paging_modes,
> -    .write_p2m_entry        = hap_write_p2m_entry,
>      .flush_tlb              = flush_tlb,
>      .guest_levels           = 4
>  };
> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -126,8 +126,9 @@ static int write_p2m_entry(struct p2m_do
>  
>      if ( v->domain != d )
>          v = d->vcpu ? d->vcpu[0] : NULL;
> -    if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) )
> -        rc = paging_get_hostmode(v)->write_p2m_entry(p2m, gfn, p, new, level);
> +    if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) ||
> +         p2m_is_nestedp2m(p2m) )
> +        rc = p2m->write_p2m_entry(p2m, gfn, p, new, level);
>      else
>          safe_write_pte(p, new);
>  
> @@ -209,7 +210,7 @@ p2m_next_level(struct p2m_domain *p2m, v
>  
>          new_entry = l1e_from_mfn(mfn, P2M_BASE_FLAGS | _PAGE_RW);
>  
> -        rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, new_entry, level + 1);
> +        rc = write_p2m_entry(p2m, gfn, p2m_entry, new_entry, level + 1);
>          if ( rc )
>              goto error;
>      }
> @@ -251,7 +252,7 @@ p2m_next_level(struct p2m_domain *p2m, v
>          {
>              new_entry = l1e_from_pfn(pfn | (i << ((level - 1) * PAGETABLE_ORDER)),
>                                       flags);
> -            rc = p2m->write_p2m_entry(p2m, gfn, l1_entry + i, new_entry, level);
> +            rc = write_p2m_entry(p2m, gfn, l1_entry + i, new_entry, level);
>              if ( rc )
>              {
>                  unmap_domain_page(l1_entry);
> @@ -262,8 +263,7 @@ p2m_next_level(struct p2m_domain *p2m, v
>          unmap_domain_page(l1_entry);
>  
>          new_entry = l1e_from_mfn(mfn, P2M_BASE_FLAGS | _PAGE_RW);
> -        rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, new_entry,
> -                                  level + 1);
> +        rc = write_p2m_entry(p2m, gfn, p2m_entry, new_entry, level + 1);
>          if ( rc )
>              goto error;
>      }
> @@ -335,7 +335,7 @@ static int p2m_pt_set_recalc_range(struc
>              if ( (l1e_get_flags(e) & _PAGE_PRESENT) && !needs_recalc(l1, e) )
>              {
>                  set_recalc(l1, e);
> -                err = p2m->write_p2m_entry(p2m, first_gfn, pent, e, level);
> +                err = write_p2m_entry(p2m, first_gfn, pent, e, level);
>                  if ( err )
>                  {
>                      ASSERT_UNREACHABLE();
> @@ -412,8 +412,8 @@ static int do_recalc(struct p2m_domain *
>                       !needs_recalc(l1, ent) )
>                  {
>                      set_recalc(l1, ent);
> -                    err = p2m->write_p2m_entry(p2m, gfn - remainder, &ptab[i],
> -                                               ent, level);
> +                    err = write_p2m_entry(p2m, gfn - remainder, &ptab[i], ent,
> +                                          level);
>                      if ( err )
>                      {
>                          ASSERT_UNREACHABLE();
> @@ -426,7 +426,7 @@ static int do_recalc(struct p2m_domain *
>              if ( !err )
>              {
>                  clear_recalc(l1, e);
> -                err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
> +                err = write_p2m_entry(p2m, gfn, pent, e, level + 1);
>                  ASSERT(!err);
>  
>                  recalc_done = true;
> @@ -474,7 +474,7 @@ static int do_recalc(struct p2m_domain *
>          }
>          else
>              clear_recalc(l1, e);
> -        err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
> +        err = write_p2m_entry(p2m, gfn, pent, e, level + 1);
>          ASSERT(!err);
>  
>          recalc_done = true;
> @@ -618,7 +618,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m,
>              : l3e_empty();
>          entry_content.l1 = l3e_content.l3;
>  
> -        rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 3);
> +        rc = write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 3);
>          /* NB: write_p2m_entry() handles tlb flushes properly */
>          if ( rc )
>              goto out;
> @@ -655,7 +655,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m,
>              entry_content = l1e_empty();
>  
>          /* level 1 entry */
> -        rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 1);
> +        rc = write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 1);
>          /* NB: write_p2m_entry() handles tlb flushes properly */
>          if ( rc )
>              goto out;
> @@ -690,7 +690,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m,
>              : l2e_empty();
>          entry_content.l1 = l2e_content.l2;
>  
> -        rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 2);
> +        rc = write_p2m_entry(p2m, gfn, p2m_entry, entry_content, 2);
>          /* NB: write_p2m_entry() handles tlb flushes properly */
>          if ( rc )
>              goto out;
> @@ -914,7 +914,7 @@ static void p2m_pt_change_entry_type_glo
>              int rc;
>  
>              set_recalc(l1, e);
> -            rc = p2m->write_p2m_entry(p2m, gfn, &tab[i], e, 4);
> +            rc = write_p2m_entry(p2m, gfn, &tab[i], e, 4);
>              if ( rc )
>              {
>                  ASSERT_UNREACHABLE();
> @@ -1132,7 +1132,13 @@ void p2m_pt_init(struct p2m_domain *p2m)
>      p2m->recalc = do_recalc;
>      p2m->change_entry_type_global = p2m_pt_change_entry_type_global;
>      p2m->change_entry_type_range = p2m_pt_change_entry_type_range;
> -    p2m->write_p2m_entry = write_p2m_entry;
> +
> +    /* Still too early to use paging_mode_hap(). */
> +    if ( hap_enabled(p2m->domain) )
> +        hap_p2m_init(p2m);
> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
> +        shadow_p2m_init(p2m);

There's already some logic in p2m_initialise that checks for
hap_enabled for EPT specific initialization. Do you think you could
move this there so that it's more contained?

I think having the initialization condition sprinkled all over the
different functions makes the logic more complicated to follow.

Also, should hap_p2m_init be limited to HAP and PT, as opposed to HAP
and EPT which doesn't use the helper AFAICT?

Maybe it would be clearer to unify shadow_write_p2m_entry with
hap_write_p2m_entry and call it p2m_pt_write_p2m_entry to match the
rest of the p2m PT helpers?

Thanks, Roger.

