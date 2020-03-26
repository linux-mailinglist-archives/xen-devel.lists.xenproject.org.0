Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B784E194509
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 18:06:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHVtq-0007sD-LJ; Thu, 26 Mar 2020 17:02:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MmV=5L=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jHVto-0007s7-T9
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 17:02:33 +0000
X-Inumbo-ID: 949ae976-6f83-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 949ae976-6f83-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 17:02:31 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a43so7693404edf.6
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9jtbHUc3SoqE02eYGrgci0tTAcNp0rJgvjiPvHnGNa8=;
 b=0IrlWzo9ztzOLhTrNsaFO+3OKEzJzqxTz7Zt6BoP461526Fx2VYCgZmqzes5iqORxJ
 pfJz5b2618DpjxEWJPOXchthK8va9/aKhDOIqAVLeQVA10YyEWd5Bwhi0n3DVuRGdult
 Yd/3vbwcxNlpqENG6bO6GH4lDFOTI1F3ct8KVK+J1+8NEfokFYbizJlC9MyQYrYRofXw
 31HzWPe6Z2VfjuoxeAQKqWuoQTWUGnrTRNsliO1UMySV4Re2dxpF3iwq+TL9K6bXBie/
 hWdVV8aphJwIsxxQvERCNB1v+FhK889YPDOv86EY2CkPl8/aYLrekJ8e747Pl2fJRt1m
 KGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9jtbHUc3SoqE02eYGrgci0tTAcNp0rJgvjiPvHnGNa8=;
 b=CiY4vwMLANirV2N7J5OOhRFeb3RdWTQ/JIxFQ8wBpoy83YJ5ccwN7CWaP2EIj7w3yI
 w6tnWK6Mys1ibZnRvfQix+k33xWcEo1EkS0Vif0i1hpX75ZipdK6vDUUpaHx25BC09Mc
 2OOYtmngjFZ9ODGMD/RCU+yegCV2nz+bd5UyseIINoGF6dcQ4MQJxXcbX441IclixjHv
 Onb/1FrlwOe9UScEvTYuAKWuInZ7joQ1bkrq7GX7hjSwL9AYYpU5tY6zr9ilzw0M8vF6
 uMFmndkYRRQ7seebjzI1MJaXT4pzQ4E5T181+h5/Xl6pDxKenj6VnMhgZ/cabHJKMcKc
 Q3Rw==
X-Gm-Message-State: ANhLgQ3qbsmlJ2zdtlJXx6HDTzxqkkvxwncCdRcqP8TxucTphoVXIO8K
 mkmCYMQ5PZlPXZWHw6fua7KMoWyQZCE=
X-Google-Smtp-Source: ADFU+vuuomzP+BU8wAuRR5Z531+r/IxSyBGmgYrIRlhsT6D1/sRvPtiJtoIsYhooi9SOi2nJBMo+Zg==
X-Received: by 2002:a05:6402:17c6:: with SMTP id
 s6mr9012073edy.212.1585242150497; 
 Thu, 26 Mar 2020 10:02:30 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id by25sm369509ejb.16.2020.03.26.10.02.27
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 10:02:28 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id u10so8727570wro.7
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 10:02:27 -0700 (PDT)
X-Received: by 2002:adf:94c6:: with SMTP id 64mr10544884wrr.386.1585242147145; 
 Thu, 26 Mar 2020 10:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
 <c88f7cac-9990-957d-746b-fc60040c4c59@suse.com>
 <20200326091019.GI28601@Air-de-Roger>
In-Reply-To: <20200326091019.GI28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 26 Mar 2020 11:01:50 -0600
X-Gmail-Original-Message-ID: <CABfawhnVfE6MeqP7=SROXfXfR2O8p=vhZZ2z0WF2=vPez4qwaQ@mail.gmail.com>
Message-ID: <CABfawhnVfE6MeqP7=SROXfXfR2O8p=vhZZ2z0WF2=vPez4qwaQ@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
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
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Mar 26, 2020 at 3:10 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Thu, Mar 26, 2020 at 08:07:09AM +0100, Jan Beulich wrote:
> > On 25.03.2020 16:47, Roger Pau Monn=C3=A9 wrote:
> > > On Mon, Mar 23, 2020 at 10:04:35AM -0700, Tamas K Lengyel wrote:
> > >> +static int copy_vcpu_settings(struct domain *cd, struct domain *d)
> > >> +{
> > >> +    unsigned int i;
> > >> +    struct p2m_domain *p2m =3D p2m_get_hostp2m(cd);
> > >> +    int ret =3D -EINVAL;
> > >> +
> > >> +    for ( i =3D 0; i < cd->max_vcpus; i++ )
> > >> +    {
> > >> +        const struct vcpu *d_vcpu =3D d->vcpu[i];
> > >> +        struct vcpu *cd_vcpu =3D cd->vcpu[i];
> > >> +        struct vcpu_runstate_info runstate;
> > >> +        mfn_t vcpu_info_mfn;
> > >> +
> > >> +        if ( !d_vcpu || !cd_vcpu )
> > >> +            continue;
> > >> +
> > >> +        /*
> > >> +         * Copy & map in the vcpu_info page if the guest uses one
> > >> +         */
> > >> +        vcpu_info_mfn =3D d_vcpu->vcpu_info_mfn;
> > >> +        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> > >> +        {
> > >> +            mfn_t new_vcpu_info_mfn =3D cd_vcpu->vcpu_info_mfn;
> > >> +
> > >> +            /*
> > >> +             * Allocate & map the page for it if it hasn't been alr=
eady
> > >> +             */
> > >> +            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
> > >> +            {
> > >> +                gfn_t gfn =3D mfn_to_gfn(d, vcpu_info_mfn);
> > >> +                unsigned long gfn_l =3D gfn_x(gfn);
> > >> +                struct page_info *page;
> > >> +
> > >> +                if ( !(page =3D alloc_domheap_page(cd, 0)) )
> > >> +                    return -ENOMEM;
> > >> +
> > >> +                new_vcpu_info_mfn =3D page_to_mfn(page);
> > >> +                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
> > >> +
> > >> +                ret =3D p2m->set_entry(p2m, gfn, new_vcpu_info_mfn,=
 PAGE_ORDER_4K,
> > >> +                                     p2m_ram_rw, p2m->default_acces=
s, -1);
> > >> +                if ( ret )
> > >> +                    return ret;
> > >> +
> > >> +                ret =3D map_vcpu_info(cd_vcpu, gfn_l,
> > >> +                                    d_vcpu->vcpu_info_offset);
> > >> +                if ( ret )
> > >> +                    return ret;
> > >> +            }
> > >> +
> > >> +            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
> > >> +        }
> > >> +
> > >> +        /*
> > >> +         * Setup the vCPU runstate area
> > >> +         */
> > >> +        if ( guest_handle_is_null(runstate_guest(cd_vcpu)) )
> > >
> > > Maybe I'm confused, but isn't this the other way around and you need
> > > to check? If the parent runstate is not null copy it to the fork,
> > > ie:
> > >
> > > if ( !guest_handle_is_null(runstate_guest(d_vcpu)) )
> > > {
> > >     ...
> > >
> > >> +        {
> > >> +            runstate_guest(cd_vcpu) =3D runstate_guest(d_vcpu);
> > >> +            vcpu_runstate_get(cd_vcpu, &runstate);
> > >> +            __copy_to_guest(runstate_guest(cd_vcpu), &runstate, 1);
> > >
> > > You should check the return code I think.
> >
> > I don't think so - this is a best effort operation just like e.g.
> > in the handling of VCPUOP_register_runstate_memory_area.
>
> I think printing a debug message might be helpful, not so much as for
> the importance of failing to copy the runstate area, but it could
> signal that something went wrong, anyway I don't have such a strong
> opinion.
>
> Just to confirm, __copy_to_guest will cause the forked domain memory
> to be populated and the whole page to be copied over right? (and will
> also cause the page tables to be added to the fork physmap in write
> mode to set the accessed/dirty bits)

I checked this and it ends up calling hvm_translate_get_page which
issues a call to get_page_from_gfn already with P2M_UNSHARE already.
The problem is that we are still in the process of forking the VM, so
mem_sharing_is_fork is not yet true, since we haven't finished the
process yet completely. So what I'll do is set the parent pointer
early which will allow memory to be populated from the parent. If
there is an error during the fork operation the fork domain is getting
destroyed by the toolstack anyway so we don't have to worry about
unwinding a half-way completed fork.

Tamas

