Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494FD2AD82D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 15:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23431.50194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcUBi-000623-15; Tue, 10 Nov 2020 13:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23431.50194; Tue, 10 Nov 2020 13:59:57 +0000
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
	id 1kcUBh-00061e-U1; Tue, 10 Nov 2020 13:59:57 +0000
Received: by outflank-mailman (input) for mailman id 23431;
 Tue, 10 Nov 2020 13:59:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcUBg-00061X-4b
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:59:56 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7183c7c1-02f4-42f6-9a50-451e64f28a20;
 Tue, 10 Nov 2020 13:59:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcUBg-00061X-4b
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:59:56 +0000
X-Inumbo-ID: 7183c7c1-02f4-42f6-9a50-451e64f28a20
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7183c7c1-02f4-42f6-9a50-451e64f28a20;
	Tue, 10 Nov 2020 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605016794;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=r5iiOjedk2JU9fzX4kP+66vTVAhWk/gH5xKq5Rr3854=;
  b=NWt88M9cwhwb9TsY/qADV5XdO8A1d5BGzcg9qtpMDyw7Zw37UzJu4KrM
   dvv/50YaZeD67s9cQsAJs5rOjNv8vQntCzYMIigREwCj2R/qt3N82YHqE
   ikZtzGbRr0QkbMuHJB28q8hqWjSlvw47JTOWa7mfZww1xD/6NnL8DYD77
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KvQvBNbeciOL82CpdT0xg7nsO9hLVQSgof/K0mswKEe/yAegLlzp4AutzKX8VYPD64rygkkZzj
 c/YBxXK8EW2rxEiemaswfYK1R3QanENqvPsHnqM0OOAnArmoEUQdWTNJstCqKric/iXajtdLa+
 HzE6gkAcygjdNEQgx0vtks1kOA5p+ThQd+BT6tw8WAbwSJ5zc8aJZigNX460Vy7ND0D6IgWI69
 CJbwkowdgIPZgXMKN+w8e5pJmLO/YFSuFHwpnbuQPlByR85v83UbjoCldmP2FlUtiSA5SRw868
 tHI=
X-SBRS: None
X-MesageID: 31189355
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="31189355"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfLZsaR4G0yfBJkl0nYw2l9BePWqFyJ9ENIIfnAOHacNvsMIAWkIebk0Sx1zxYZJ7g11cWPCa2B1NO+VtAzUFzSZSugLL6acsec9ZKPErHp89EFkukaybIcq/lbVPuNrltrar9tZQk8Sxn8G2WreYul/mr7HUj5ZLiWFtWxJSuhV2wxnUyY0jY/enMYsvVLIVM0c1h4rTw7FF/PbF5u23HVxczcDLKqMvLF2U413WL3A2gXuiIGhJQXa7VxcIHBybi1Z8hRJBmmu7Nz15fvl9gtDiO9nD1Q03rUkgaHPL+SsT/tTNzS6Fn/5VUFMs8nkIK5JPyq7wy6kDM5HJAFGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riQl1Ui0MG+1X4/c0TWUuj7C8+7QwXUUp/MQS5CEwXY=;
 b=dxBICnYxtQk0MW1NJzIakfLRjRNXPkHzKaLr77dkC6hN83nIaynCX6Yvp4BsNK1/yt3ia2dygfz5zykKgyzprS/0/bOtpPYf12FhGNFVHbesiegc41dg2lEYtB5pzdMbnDctPEuutEGphY5fTygth8uuZRII8YqNoNjW62izvGzIndVus1d9G8l4r0+pMgxi8b3nef8W/OTMHTRbvSY/Cx1qHmTBoty3FIseu6lA8sPeIiJ8p5svrc1xCp47DGv6Q8qv4z7cJpbjcfJVnAzYDSPM6IvFJa2wP66OaFEfvpH630zIq2IT4DJhGUd7ZKI2lyV+1Zc7ZQl0oZ+JJQTN1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riQl1Ui0MG+1X4/c0TWUuj7C8+7QwXUUp/MQS5CEwXY=;
 b=lFdEofygpb/cpMLPyKw/f70o0M3W8acWNSV12CRDM4zwLXZ1V6i+2zNrQeqFRn5tturadZRKXsQvPzbmp5rHi+ylsqaOUrvgFl7tjJeFe+XT0CynEdp8N/npMDRDmkMvOTd1Ef04ru9ORTBEUXUjU/eyLDFao0oam+ounGgO60A=
Date: Tue, 10 Nov 2020 14:59:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 5/5] x86/p2m: split write_p2m_entry() hook
Message-ID: <20201110135944.hbsojy6eeyw53has@Air-de-Roger>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
X-ClientProxiedBy: LO4P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7128cb9-3ab1-4c54-6555-08d88580e3b0
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4476E0382A5ABB223DEED7A78FE90@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rnymQO5L3s0c1GKola8AVTexNd2nH4CMiSfpemwovjplEAZ63kYvS+VAy0Ok7aHC4Mz5x9DcSsdLiExcJ/RrGWHgPUYZ71mKMUSd2Iljp7XtsSnYa0sBDfaKa9AiHTVqCDSyxJ8fu+CfHeTtL9UHqEVRfQYn/1I2STP6ViM/oBwPCtpfa3zMJzAVyuIYp9toSDLne6+cfHn1FChclMGBIbqyKcDjCSInJTEzsNIGlV70cjhE1Vb3MBAXEMwBRLvfyn0DULIU6/tfNbmVNP+50Dt4ZmCX6q5asJ022jbwIVeamzx5J6stbD8FvCzsANCyLWljfbQxmsEP8CkLCSlY+NPVkzcjngjP0Yh1lVdo9oWESxTjQfAIdsHzp+wejt5d
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(366004)(136003)(346002)(396003)(66946007)(2906002)(186003)(83380400001)(6666004)(66556008)(6486002)(6916009)(26005)(6496006)(54906003)(4326008)(85182001)(5660300002)(1076003)(66476007)(316002)(478600001)(86362001)(16526019)(956004)(8936002)(33716001)(9686003)(8676002)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: En949OIrW0cEShQRYvey+lfjYHPxi6Kldkcvz4rwpW6aLPIEmByTdKlY299bXC4qsaoXxRmVgcfApmsmuBTUX2FXhte90+1u8A+yeyN6ZdgBiD3n6aKBWXoTqUrB2PipYv1zrgKs55sW8L/BeIhCtRcgcCJq0Vwv6UWRnCJGLtQLcwq8fUqF1I7ID5IE96ChoDG5dTgh2rN6MfjHpg9py/AE8Q8QjvTwh+4mi1+PwIn+t6nkr2cEuvbaZlukwY8f7FJ3iCIm+TZRcx0gwevfUSfX+oVrHJNl1oFVJWon5r3yTYple9cEV0Q9DzKIplcn8LsaIIkOI+nwBAAyu9wJLzTae/iKpa/tGi1Ze9brNg42IJQktSAOLtmA9Cp4+bVYgezMTTz91GobohJHAYKyUfNJJX5T5+I4NWgzaRPD6tsZ3/K5dy34jDByu0hTy8vitJG2ulvESstKh01M7V+xy8fW2+TUt6IXmGgd5VUl/gTQed8XIkUpKay5/g5C97JfFV5xcnEvT+IK9hxu3ZwjL5/Nh7Muu5V+Gkc+gKFqJpaIbKd6+p3ResSLG6kKvCeTmLVirR+IX6UU7/wwSOGd027P6Xbyk4julurRkDIYwhzyDMuULVYonUys0tIqONysvpGhRjebubDqEUlqbTl30H1yM71uU6HfeWH7eSnftNrUArre+KgiAWlFq4ZDDHxUoGHSOosr2udzgVjzNgE4nbV/V7B8HfLuu04KojEf/yBHWjA2cElSWy11iHMY2NwQ096iIDQeZJw6JYN0eGOQ53zBBRLgacw8luS5SR511DNNOhcN329mFEUI+6IfbBLiU1mA8Ex5i+XVHmeHBiNJstdpcHJJMlsJUzU2pmTIuQ9hoRnQXnO2N9zfKLqNrhiQ6zLFaw/NESZv2/JZezcZ3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7128cb9-3ab1-4c54-6555-08d88580e3b0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 13:59:49.6605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3XNpl9f+rqsyT+UuQdSNFczFQpk47beL5ZkPRsmvNX1JacJ4m7z3LIIaRT3O4PH9EqxwAC8s3PrBOOe+Zebqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Wed, Oct 28, 2020 at 10:24:53AM +0100, Jan Beulich wrote:
> Fair parts of the present handlers are identical; in fact
> nestedp2m_write_p2m_entry() lacks a call to p2m_entry_modify(). Move
> common parts right into write_p2m_entry(), splitting the hooks into a
> "pre" one (needed just by shadow code) and a "post" one.
> 
> For the common parts moved I think that the p2m_flush_nestedp2m() is,
> at least from an abstract perspective, also applicable in the shadow
> case. Hence it doesn't get a 3rd hook put in place.
> 
> The initial comment that was in hap_write_p2m_entry() gets dropped: Its
> placement was bogus, and looking back the the commit introducing it
> (dd6de3ab9985 "Implement Nested-on-Nested") I can't see either what use
> of a p2m it was meant to be associated with.

Is there any performance implication of moving from one hook to two
hooks? Since this shouldn't be a hot path I assume it's fine.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: This is effectively the alternative to the suggestion in an earlier
>      patch that we might do away with the hook altogether. Of course a
>      hybrid approach would also be possible, by using direct calls here
>      instead of splitting the hook into two.
> ---
> I'm unsure whether p2m_init_nestedp2m() zapping the "pre" hook is
> actually correct, or whether previously the sh_unshadow_for_p2m_change()
> invocation was wrongly skipped.
> 
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -774,55 +774,18 @@ static void hap_update_paging_modes(stru
>      put_gfn(d, cr3_gfn);
>  }
>  
> -static int
> -hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
> -                    l1_pgentry_t new, unsigned int level)
> +static void
> +hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
>  {
>      struct domain *d = p2m->domain;
> -    uint32_t old_flags;
> -    mfn_t omfn;
> -    int rc;
>  
> -    /* We know always use the host p2m here, regardless if the vcpu
> -     * is in host or guest mode. The vcpu can be in guest mode by
> -     * a hypercall which passes a domain and chooses mostly the first
> -     * vcpu. */
> -
> -    paging_lock(d);
> -    old_flags = l1e_get_flags(*p);
> -    omfn = l1e_get_mfn(*p);
> -
> -    rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
> -                          p2m_flags_to_type(old_flags), l1e_get_mfn(new),
> -                          omfn, level);
> -    if ( rc )
> -    {
> -        paging_unlock(d);
> -        return rc;
> -    }
> -
> -    safe_write_pte(p, new);
> -    if ( old_flags & _PAGE_PRESENT )
> +    if ( oflags & _PAGE_PRESENT )
>          guest_flush_tlb_mask(d, d->dirty_cpumask);
> -
> -    paging_unlock(d);
> -
> -    if ( nestedhvm_enabled(d) && (old_flags & _PAGE_PRESENT) &&
> -         !p2m_get_hostp2m(d)->defer_nested_flush &&
> -         /*
> -          * We are replacing a valid entry so we need to flush nested p2ms,
> -          * unless the only change is an increase in access rights.
> -          */
> -         (!mfn_eq(omfn, l1e_get_mfn(new)) ||
> -          !perms_strictly_increased(old_flags, l1e_get_flags(new))) )
> -        p2m_flush_nestedp2m(d);
> -
> -    return 0;
>  }
>  
>  void hap_p2m_init(struct p2m_domain *p2m)
>  {
> -    p2m->write_p2m_entry = hap_write_p2m_entry;
> +    p2m->write_p2m_entry_post = hap_write_p2m_entry_post;
>  }
>  
>  static unsigned long hap_gva_to_gfn_real_mode(
> --- a/xen/arch/x86/mm/hap/nested_hap.c
> +++ b/xen/arch/x86/mm/hap/nested_hap.c
> @@ -71,24 +71,11 @@
>  /*        NESTED VIRT P2M FUNCTIONS         */
>  /********************************************/
>  
> -int
> -nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
> -    l1_pgentry_t *p, l1_pgentry_t new, unsigned int level)
> +void
> +nestedp2m_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
>  {
> -    struct domain *d = p2m->domain;
> -    uint32_t old_flags;
> -
> -    paging_lock(d);
> -
> -    old_flags = l1e_get_flags(*p);
> -    safe_write_pte(p, new);
> -
> -    if (old_flags & _PAGE_PRESENT)
> -        guest_flush_tlb_mask(d, p2m->dirty_cpumask);
> -
> -    paging_unlock(d);
> -
> -    return 0;
> +    if ( oflags & _PAGE_PRESENT )
> +        guest_flush_tlb_mask(p2m->domain, p2m->dirty_cpumask);
>  }

This is a verbatimi copy of hap_write_p2m_entry_post. I assume there's
a reason why we need both, but I'm missing it.

>  
>  /********************************************/
> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -122,17 +122,55 @@ static int write_p2m_entry(struct p2m_do
>  {
>      struct domain *d = p2m->domain;
>      struct vcpu *v = current;
> -    int rc = 0;
>  
>      if ( v->domain != d )
>          v = d->vcpu ? d->vcpu[0] : NULL;
>      if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) ||
>           p2m_is_nestedp2m(p2m) )
> -        rc = p2m->write_p2m_entry(p2m, gfn, p, new, level);
> +    {
> +        unsigned int oflags;
> +        mfn_t omfn;
> +        int rc;
> +
> +        paging_lock(d);
> +
> +        if ( p2m->write_p2m_entry_pre )
> +            p2m->write_p2m_entry_pre(d, gfn, p, new, level);
> +
> +        oflags = l1e_get_flags(*p);
> +        omfn = l1e_get_mfn(*p);
> +
> +        rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
> +                              p2m_flags_to_type(oflags), l1e_get_mfn(new),
> +                              omfn, level);
> +        if ( rc )
> +        {
> +            paging_unlock(d);
> +            return rc;
> +        }
> +
> +        safe_write_pte(p, new);
> +
> +        if ( p2m->write_p2m_entry_post )
> +            p2m->write_p2m_entry_post(p2m, oflags);
> +
> +        paging_unlock(d);
> +
> +        if ( nestedhvm_enabled(d) && !p2m_is_nestedp2m(p2m) &&
> +             (oflags & _PAGE_PRESENT) &&
> +             !p2m_get_hostp2m(d)->defer_nested_flush &&
> +             /*
> +              * We are replacing a valid entry so we need to flush nested p2ms,
> +              * unless the only change is an increase in access rights.
> +              */
> +             (!mfn_eq(omfn, l1e_get_mfn(new)) ||
> +              !perms_strictly_increased(oflags, l1e_get_flags(new))) )
> +            p2m_flush_nestedp2m(d);

It feel slightly weird to have a nested p2m hook post, and yet have
nested specific code here.

Have you considered if the post hook could be moved outside of the
locked region, so that we could put this chunk there in the nested p2m
case?

Thanks, Roger.

