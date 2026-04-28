Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGvrDNaq8GkOXAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:40:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78993484FC3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:40:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296128.1572506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHhjk-0005W7-2A; Tue, 28 Apr 2026 12:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296128.1572506; Tue, 28 Apr 2026 12:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHhjj-0005Uf-Vm; Tue, 28 Apr 2026 12:40:23 +0000
Received: by outflank-mailman (input) for mailman id 1296128;
 Tue, 28 Apr 2026 12:40:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd41abd83000f373@swg.vates.tech>)
 id 1wHhji-0005UY-NS
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:40:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHhjh-008vL8-Vf
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:40:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd41abd83000f373@swg.vates.tech>)
 id 69f0aaad-5cb7-0a2a0a5109dd-0a2a4501c56e-32
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:40:21 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd41abd83000f373@swg.vates.tech>)
 id 69f0aab5-c1f2-0a2a45010019-b9ff1c22871d-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:40:21 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dd41abd83000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Apr 2026 12:40:15 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id E09AC861D6;
 Tue, 28 Apr 2026 14:40:14 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=9o7gVVzCtgiJq6Ow+DXx1i/e7S2Hj86E3t46w5H5dcQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=iipgfByd4fW+LAQTzE968w73nf2AoW+kTMoYGz8tb8lpKZ0AKr6rjvpeYsaRqqY1n7pty1yKJ
 pT1flPHiHXvsXj5p0I1LHesN3TevP2aLKJTSHJYzOPOCee0ILP6vogOyeukAcIvuCT9B3HDGeG2
 diHtVLAx6dH/jxReWSXhf48Iz/942zsLDdPODrogz2ONMFCgnMpSG7noExF7r1l9SrohUO2Nni8
 aZu0hdgHlM22yOmabOpWFCcmh90bacaWPa0JxI6abydBuIJDrQkCekipHnbL60QdlQecrwXjG13
 x7lDWBw2Vbltp3N9VXhVQrtj0UCkNObh0PC8CNcqkvug==
X-Zone-Loop: 70faca43bbf3c0363ce7eb759774e53e06203582dbcc
x-campaign-type: default
x-transaction-id: 9d21ec89-02a4-42f5-8b82-bf05a2fdde72
x-swg-uid: 01-63cc4a61-7a10-4e68-8b87-02ceab2da163
X-Mailer: Sweego
Message-ID:
 <1777380015.8631fc262581453bbf619ec5b2062170.19dd41abd83000f373@vates.tech>
x-swg-bid: 1777380015.8631fc262581453bbf619ec5b2062170.19dd41abd83000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 28 Apr 2026 14:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] x86/passthrough: Wrap pt_irq_create_bind() restart
 block in braces
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387e25000f373@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387e25000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.73.98a3d1c9318306da.19dd41abc0a.36ba62cfdaeb7ccc=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777380015115
X-purgate-ID: tlsNG-d62444/1777380021-B6A61FF4-4D680104/0/0
X-purgate-type: clean
X-purgate-size: 5005
X-Rspamd-Queue-Id: 78993484FC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.73.98a3d1c9318306da.19dd41abc0a.36ba62cfdaeb7ccc=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/04/2026 =C3=A0 15:57, Julian Vetter a =C3=A9crit=C2=A0:
> Enclose the restart/retry block in pt_irq_create_bind() in an explicit
> compound statement to prepare for its extraction into a helper function=
=2E
> No functional change=2E
>=20
> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> ---
> Changes in v4:
> - New patch
> - Split out as a preparatory no-functional-change step to make the diff
>    in patch 5 (pt_irq_bind_msi() interface change) easier to review
> ---
>   xen/drivers/passthrough/x86/hvm=2Ec | 80 ++++++++++++++++-------------=
--
>   1 file changed, 41 insertions(+), 39 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrou=
gh/x86/hvm=2Ec
> index b73bb55055=2E=2E691fa1b2c7 100644
> --- a/xen/drivers/passthrough/x86/hvm=2Ec
> +++ b/xen/drivers/passthrough/x86/hvm=2Ec
> @@ -229,52 +229,54 @@ int pt_irq_create_bind(
>           return -EINVAL;
>  =20
>    restart:
> -    write_lock(&d->event_lock);
> -
> -    hvm_irq_dpci =3D domain_get_irq_dpci(d);
> -    if ( !hvm_irq_dpci && !is_hardware_domain(d) )
>       {
> -        unsigned int i;
> +        write_lock(&d->event_lock);
>  =20
> -        /*
> -         * NB: the hardware domain doesn't use a hvm_irq_dpci struct be=
cause
> -         * it's only allowed to identity map GSIs, and so the data cont=
ained in
> -         * that struct (used to map guest GSIs into machine GSIs and pe=
rform
> -         * interrupt routing) is completely useless to it=2E
> -         */
> -        hvm_irq_dpci =3D xzalloc(struct hvm_irq_dpci);
> -        if ( hvm_irq_dpci =3D=3D NULL )
> +        hvm_irq_dpci =3D domain_get_irq_dpci(d);
> +        if ( !hvm_irq_dpci && !is_hardware_domain(d) )
> +        {
> +            unsigned int i;
> +
> +            /*
> +             * NB: the hardware domain doesn't use a hvm_irq_dpci struc=
t because
> +             * it's only allowed to identity map GSIs, and so the data =
contained in
> +             * that struct (used to map guest GSIs into machine GSIs an=
d perform
> +             * interrupt routing) is completely useless to it=2E
> +             */
> +            hvm_irq_dpci =3D xzalloc(struct hvm_irq_dpci);
> +            if ( hvm_irq_dpci =3D=3D NULL )
> +            {
> +                write_unlock(&d->event_lock);
> +                return -ENOMEM;
> +            }
> +            for ( i =3D 0; i < NR_HVM_DOMU_IRQS; i++ )
> +                INIT_LIST_HEAD(&hvm_irq_dpci->girq[i]);
> +
> +            hvm_domain_irq(d)->dpci =3D hvm_irq_dpci;
> +        }
> +
> +        info =3D pirq_get_info(d, pirq);
> +        if ( !info )
>           {
>               write_unlock(&d->event_lock);
>               return -ENOMEM;
>           }
> -        for ( i =3D 0; i < NR_HVM_DOMU_IRQS; i++ )
> -            INIT_LIST_HEAD(&hvm_irq_dpci->girq[i]);
> -
> -        hvm_domain_irq(d)->dpci =3D hvm_irq_dpci;
> -    }
> -
> -    info =3D pirq_get_info(d, pirq);
> -    if ( !info )
> -    {
> -        write_unlock(&d->event_lock);
> -        return -ENOMEM;
> -    }
> -    pirq_dpci =3D pirq_dpci(info);
> +        pirq_dpci =3D pirq_dpci(info);
>  =20
> -    /*
> -     * A crude 'while' loop with us dropping the spinlock and giving
> -     * the softirq_dpci a chance to run=2E
> -     * We MUST check for this condition as the softirq could be schedul=
ed
> -     * and hasn't run yet=2E Note that this code replaced tasklet_kill =
which
> -     * would have spun forever and would do the same thing (wait to flu=
sh out
> -     * outstanding hvm_dirq_assist calls=2E
> -     */
> -    if ( pt_pirq_softirq_active(pirq_dpci) )
> -    {
> -        write_unlock(&d->event_lock);
> -        cpu_relax();
> -        goto restart;
> +        /*
> +         * A crude 'while' loop with us dropping the spinlock and givin=
g
> +         * the softirq_dpci a chance to run=2E
> +         * We MUST check for this condition as the softirq could be sch=
eduled
> +         * and hasn't run yet=2E Note that this code replaced tasklet_k=
ill which
> +         * would have spun forever and would do the same thing (wait to=
 flush out
> +         * outstanding hvm_dirq_assist calls=2E
> +         */
> +        if ( pt_pirq_softirq_active(pirq_dpci) )
> +        {
> +            write_unlock(&d->event_lock);
> +            cpu_relax();
> +            goto restart;
> +        }
>       }
>  =20
>       switch ( pt_irq_bind->irq_type )

shows up as whitespace only changes (aside brackets)

Reviewed-by: Teddy Astie <teddy=2Eastie@vates=2Etech>


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.73.98a3d1c9318306da.19dd41abc0a.36ba62cfdaeb7ccc=---

