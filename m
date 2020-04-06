Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB76419F79F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 16:09:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLSQY-0008Fi-5o; Mon, 06 Apr 2020 14:08:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/51Y=5W=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jLSQW-0008Fc-Ng
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 14:08:36 +0000
X-Inumbo-ID: 1af12654-7810-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1af12654-7810-11ea-b58d-bc764e2007e4;
 Mon, 06 Apr 2020 14:08:36 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a43so19368843edf.6
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2020 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TTw3UrfbySzK+JDBPHarGUZASDNeWpzrpP2iHm36uoU=;
 b=Xa+yNmGCB3Jq8xF6WAm3A2oovOL8D5CEkouUOOELE0TvENSUxM4KWdsc/eoO5OamGx
 6DffZRpPkInDYa7mqkSW01puNZE5vrAgdyQr3ohZgJd5gSP5hvloJgQiNxjS1/RfxhsS
 CoJFH69dLW/WvCwTIpDzoJ/E8ZuOyrIyFRdUz0DEXyPH2oADEaahRb7H/tgAtW2WJSc5
 M04j/xxHZDroEPGnpGXkpn0iqHv7cIT7XJ/gIkNFFMY42GvsqnX1W5OHfxYrH/jjuTEh
 9UPr8t94sXZVVRr9MUD14jmaNeSExR3Ladr7L0gzklZUwe9TEXIp9sbxPKlEDRFJfd/f
 ar5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TTw3UrfbySzK+JDBPHarGUZASDNeWpzrpP2iHm36uoU=;
 b=OnSMJv7M3LKqplruwhJlGQ8vspb3y7n8L925y2hIwD01Ng9wWE5fNdqYy0u6CPpALv
 cW9Kkth5STdwPLbE0PTeffHxop4h6p67/6pK1TuNpyDLI70yK+kx8Vm1IpK7km/t70PH
 hr179LKBd1c/QTt1wc7QEkdRNbXNM3t63MOMQ/T/Aq+TDkkKhbAYI1Po5NcQC5nUIFIF
 FdWG6ygD8pEozwrjIVICgyjz/Ejpcw7++5K413d1dFp0VJ/nQG03LZ8sa7sngxYqvqnt
 dup7WSxTjjoRwNnauaAWNb47zlpmgrwguWUBv19NEGZlncdAjLqpbIqhfpOVi7ljGfPZ
 U9KQ==
X-Gm-Message-State: AGi0PuaheZ8Qnz77eRMjTrwPWoSlwTLVKnchbiG+FX4RU5H9DhV63l/A
 5HxMjmJaySjQ9YlJ8dPIiSKw38VKTLc=
X-Google-Smtp-Source: APiQypJBZQOsZRgt/jye73SAu0vWAtCpiBGKhYh74oEOItp+jN97kPeBLp8EKA5hV+g9txVoK+ux4Q==
X-Received: by 2002:a50:d2c6:: with SMTP id q6mr19680881edg.265.1586182114080; 
 Mon, 06 Apr 2020 07:08:34 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id v19sm2423966edl.76.2020.04.06.07.08.32
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 07:08:33 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id w15so11388826wrv.10
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2020 07:08:32 -0700 (PDT)
X-Received: by 2002:adf:94c6:: with SMTP id 64mr24786959wrr.386.1586182112301; 
 Mon, 06 Apr 2020 07:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585579955.git.tamas.lengyel@intel.com>
 <f40757694decdfdbd5a264be4c277ba824261874.1585579955.git.tamas.lengyel@intel.com>
 <20200406105219.GY28601@Air-de-Roger>
In-Reply-To: <20200406105219.GY28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 6 Apr 2020 08:07:56 -0600
X-Gmail-Original-Message-ID: <CABfawhk9STnn95+O7SnxEzA9KA4u=0pWBZLJ1SLaQ=7eVrFWUg@mail.gmail.com>
Message-ID: <CABfawhk9STnn95+O7SnxEzA9KA4u=0pWBZLJ1SLaQ=7eVrFWUg@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] xen/mem_sharing: VM forking
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 6, 2020 at 4:52 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> On Mon, Mar 30, 2020 at 08:02:08AM -0700, Tamas K Lengyel wrote:
> > VM forking is the process of creating a domain with an empty memory spa=
ce and a
> > parent domain specified from which to populate the memory when necessar=
y. For
> > the new domain to be functional the VM state is copied over as part of =
the fork
> > operation (HVM params, hap allocation, etc).
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > +static int bring_up_vcpus(struct domain *cd, struct domain *d)
> > +{
> > +    unsigned int i;
> > +    int ret =3D -EINVAL;
> > +
> > +    if ( d->max_vcpus !=3D cd->max_vcpus ||
> > +        (ret =3D cpupool_move_domain(cd, d->cpupool)) )
> > +        return ret;
> > +
> > +    for ( i =3D 0; i < cd->max_vcpus; i++ )
> > +    {
> > +        if ( !d->vcpu[i] || cd->vcpu[i] )
> > +            continue;
> > +
> > +        if ( !vcpu_create(cd, i) )
> > +            return -EINVAL;
> > +    }
> > +
> > +    domain_update_node_affinity(cd);
> > +    return 0;
> > +}
> > +
> > +static int copy_vcpu_settings(struct domain *cd, struct domain *d)
>
> Nit: AFAICT *d can be constified.

Sure.

>
> > +{
> > +    unsigned int i;
> > +    struct p2m_domain *p2m =3D p2m_get_hostp2m(cd);
> > +    int ret =3D -EINVAL;
> > +
> > +    for ( i =3D 0; i < cd->max_vcpus; i++ )
> > +    {
> > +        const struct vcpu *d_vcpu =3D d->vcpu[i];
> > +        struct vcpu *cd_vcpu =3D cd->vcpu[i];
> > +        struct vcpu_runstate_info runstate;
> > +        mfn_t vcpu_info_mfn;
> > +
> > +        if ( !d_vcpu || !cd_vcpu )
> > +            continue;
> > +
> > +        /* Copy & map in the vcpu_info page if the guest uses one */
> > +        vcpu_info_mfn =3D d_vcpu->vcpu_info_mfn;
> > +        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> > +        {
> > +            mfn_t new_vcpu_info_mfn =3D cd_vcpu->vcpu_info_mfn;
> > +
> > +            /* Allocate & map the page for it if it hasn't been alread=
y */
> > +            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
> > +            {
> > +                gfn_t gfn =3D mfn_to_gfn(d, vcpu_info_mfn);
> > +                unsigned long gfn_l =3D gfn_x(gfn);
> > +                struct page_info *page;
> > +
> > +                if ( !(page =3D alloc_domheap_page(cd, 0)) )
> > +                    return -ENOMEM;
> > +
> > +                new_vcpu_info_mfn =3D page_to_mfn(page);
> > +                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
> > +
> > +                ret =3D p2m->set_entry(p2m, gfn, new_vcpu_info_mfn,
> > +                                     PAGE_ORDER_4K, p2m_ram_rw,
> > +                                     p2m->default_access, -1);
> > +                if ( ret )
> > +                    return ret;
> > +
> > +                ret =3D map_vcpu_info(cd_vcpu, gfn_l,
> > +                                    PAGE_OFFSET(d_vcpu->vcpu_info));
> > +                if ( ret )
> > +                    return ret;
> > +            }
> > +
> > +            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
> > +        }
> > +
> > +        /* Setup the vCPU runstate area */
> > +        if ( !guest_handle_is_null(runstate_guest(d_vcpu)) )
> > +        {
> > +            runstate_guest(cd_vcpu) =3D runstate_guest(d_vcpu);
> > +            vcpu_runstate_get(cd_vcpu, &runstate);
> > +            __copy_to_guest(runstate_guest(cd_vcpu), &runstate, 1);
>
> I just realized there's no need to copy the runstate area contents
> here, since they will get copied anyway in schedule_tail before
> resuming execution og cd_vcpu as long as runstate_guest is set.
>
> Note that the vcpu_info needs to be copied since it contains event
> channel info which is not unconditionally updated on context switch
> IIRC.

OK

>
> > +        }
> > +
> > +        /*
> > +         * TODO: to support VMs with PV interfaces copy additional
> > +         * settings here, such as PV timers.
> > +         */
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int fork_hap_allocation(struct domain *cd, struct domain *d)
> > +{
> > +    int rc;
> > +    bool preempted;
> > +    unsigned long mb =3D hap_get_allocation(d);
> > +
> > +    if ( mb =3D=3D hap_get_allocation(cd) )
> > +        return 0;
> > +
> > +    paging_lock(cd);
> > +    rc =3D hap_set_allocation(cd, mb << (20 - PAGE_SHIFT), &preempted)=
;
> > +    paging_unlock(cd);
> > +
> > +    return preempted ? -ERESTART : rc;
> > +}
> > +
> > +static void copy_tsc(struct domain *cd, struct domain *d)
> > +{
> > +    uint32_t tsc_mode;
> > +    uint32_t gtsc_khz;
> > +    uint32_t incarnation;
> > +    uint64_t elapsed_nsec;
> > +
> > +    tsc_get_info(d, &tsc_mode, &elapsed_nsec, &gtsc_khz, &incarnation)=
;
> > +    /* Don't bump incarnation on set */
> > +    tsc_set_info(cd, tsc_mode, elapsed_nsec, gtsc_khz, incarnation - 1=
);
> > +}
> > +
> > +static int copy_special_pages(struct domain *cd, struct domain *d)
> > +{
> > +    mfn_t new_mfn, old_mfn;
> > +    struct p2m_domain *p2m =3D p2m_get_hostp2m(cd);
> > +    static const unsigned int params[] =3D
> > +    {
> > +        HVM_PARAM_STORE_PFN,
> > +        HVM_PARAM_IOREQ_PFN,
> > +        HVM_PARAM_BUFIOREQ_PFN,
> > +        HVM_PARAM_CONSOLE_PFN
> > +    };
> > +    unsigned int i;
> > +    int rc;
> > +
> > +    for ( i =3D 0; i < ARRAY_SIZE(params); i++ )
> > +    {
> > +        p2m_type_t t;
> > +        uint64_t value =3D 0;
> > +        struct page_info *page;
> > +
> > +        if ( hvm_get_param(cd, params[i], &value) || !value )
>
> Don't you need to use d here instead of cd? You want to check whether
> the parent has this parameter set in order to copy it to the child I
> think.

Indeed, I probably made this error in one of the revisions when I
renamed the variable.

>
> With that:
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks,
Tamas

