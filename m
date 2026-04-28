Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Mj1Hc298Gl0YAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:01:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B075648678F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296284.1572709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHj0I-0007Fh-Af; Tue, 28 Apr 2026 14:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296284.1572709; Tue, 28 Apr 2026 14:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHj0I-0007Do-7v; Tue, 28 Apr 2026 14:01:34 +0000
Received: by outflank-mailman (input) for mailman id 1296284;
 Tue, 28 Apr 2026 14:01:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4650f2c000f373@swg.vates.tech>)
 id 1wHj0G-0007Di-VX
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:01:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHj0G-002FCk-BY
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:01:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4650f2c000f373@swg.vates.tech>)
 id 69f0bdac-2eae-0a2a0a5409dd-0a2a4503a360-40
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:01:32 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4650f2c000f373@swg.vates.tech>)
 id 69f0bdbc-672d-0a2a45030019-b9ff1c22ab5d-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:01:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dd4650f2c000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Apr 2026 14:01:26 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9D0DE8632D;
 Tue, 28 Apr 2026 16:01:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Ge8VGVcz3F+F04cXtFUFi3xWtqCV+GSEWHSHeIeQDEE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=F26OBvrf1QCrdsqpkmys9Wi8JgadVxsUnLCbhFyaG18tWVEgPCm77yazQQVELQqJc3WCRD5Po
 8UWfZEs3G6fSTqeUMLOBfG0Qlgr2eL2Xkos2VNvZ782rKQumPa+CkBGsY/J9wpjjNSOBY378p41
 fenSHcv5DmpycH6mxuiPqM1nw9P4QDY/gXbiVdGlRnSL4nhJuorCQ6Yqa+hx6sUYzkn8nHEjUzv
 QGsb/dNJRZNEgAlPcyNlWwZdLrd1Tf/9Xj/Pa074tl6g0IGtVKb1ww1OFb+VpUnEBj2TTFSrplP
 c9yW0UNHr/6fsNs20R9vClM9xKCvdDwo+Bbp+IpwQipg==
X-Zone-Loop: 7498aa3db807c0daac240a4f993392f4fc55817a0e5d
x-campaign-type: default
x-transaction-id: 3894dfa1-d272-4ed6-bf22-966a174d2d94
x-swg-uid: 01-912ad003-8ff3-424c-a4a9-5df252209416
X-Mailer: Sweego
Message-ID:
 <1777384886.8631fc262581453bbf619ec5b2062170.19dd4650f2c000f373@vates.tech>
x-swg-bid: 1777384886.8631fc262581453bbf619ec5b2062170.19dd4650f2c000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 28 Apr 2026 16:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] x86/passthrough: Extract PT_IRQ_TYPE_MSI body into
 pt_irq_bind_msi()
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298079.8631fc262581453bbf619ec5b2062170.19dcf3880b0000f373@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <1777298079.8631fc262581453bbf619ec5b2062170.19dcf3880b0000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.b5.57efd0fc27062d4d.19dd465068f.43f3625d62435cc9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777384883856
X-purgate-ID: tlsNG-33051d/1777384892-28975938-554CAABD/0/0
X-purgate-type: clean
X-purgate-size: 14899
X-Rspamd-Queue-Id: B075648678F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-0.971];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.b5.57efd0fc27062d4d.19dd465068f.43f3625d62435cc9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/04/2026 =C3=A0 15:57, Julian Vetter a =C3=A9crit=C2=A0:
> No functional change: move the PT_IRQ_TYPE_MSI case of pt_irq_create_bin=
d()
> into a new static helper pt_irq_bind_msi() taking the same gvec/gflags/g=
table
> parameters=2E Restructure pt_irq_create_bind() so the MSI case delegates=
 to the
> helper and pt_irq_dpci_setup() is called inside each case rather than sh=
ared=2E
>=20
> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> ---
> Changes in v4:
> - New patch
> - Split out as a preparatory no-functional-change step so that the
>    interface change in patch 5 (switching pt_irq_bind_msi() from gvec +
>    gflags to raw MSI addr + data) shows as a clean diff against an
>    already-extracted helper, rather than being tangled with the 'case
>    PT_IRQ_TYPE_MSI' code
> ---
>   xen/drivers/passthrough/x86/hvm=2Ec | 255 ++++++++++++++++------------=
--
>   1 file changed, 140 insertions(+), 115 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrou=
gh/x86/hvm=2Ec
> index 19463c3406=2E=2Eeff1e8a79e 100644
> --- a/xen/drivers/passthrough/x86/hvm=2Ec
> +++ b/xen/drivers/passthrough/x86/hvm=2Ec
> @@ -290,161 +290,186 @@ static int pt_irq_dpci_setup(struct domain *d, u=
nsigned int pirq,
>       } while ( true );
>   }
>  =20
> -int pt_irq_create_bind(
> -    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
> +static int pt_irq_bind_msi(struct domain *d, uint32_t machine_irq,
> +                            uint8_t gvec, uint32_t gflags, uint64_t gta=
ble,
> +                            bool unmasked)
>   {
>       struct hvm_irq_dpci *hvm_irq_dpci;
>       struct hvm_pirq_dpci *pirq_dpci;
>       struct pirq *info;
> -    int rc, pirq =3D pt_irq_bind->machine_irq;
> +    uint8_t dest, delivery_mode;
> +    bool dest_mode;
> +    int dest_vcpu_id, rc;
> +    const struct vcpu *vcpu;
>  =20
> -    if ( pirq < 0 || pirq >=3D d->nr_pirqs )
> +    if ( machine_irq >=3D (unsigned int)d->nr_pirqs )

is that (unsigned int) cast required ?

>           return -EINVAL;
>  =20
> -    rc =3D pt_irq_dpci_setup(d, pirq, &hvm_irq_dpci, &pirq_dpci, &info)=
;
> +    rc =3D pt_irq_dpci_setup(d, machine_irq, &hvm_irq_dpci, &pirq_dpci,=
 &info);
>       if ( rc )
>           return rc;
>  =20
> -    switch ( pt_irq_bind->irq_type )
> +    if ( !(pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) )
>       {
> -    case PT_IRQ_TYPE_MSI:
> -    {
> -        uint8_t dest, delivery_mode;
> -        bool dest_mode;
> -        int dest_vcpu_id;
> -        const struct vcpu *vcpu;
> -        uint32_t gflags =3D pt_irq_bind->u=2Emsi=2Egflags &
> -                          ~XEN_DOMCTL_VMSI_X86_UNMASKED;
> -
> -        if ( !(pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) )
> +        pirq_dpci->flags =3D HVM_IRQ_DPCI_MAPPED | HVM_IRQ_DPCI_MACH_MS=
I |
> +                           HVM_IRQ_DPCI_GUEST_MSI;
> +        pirq_dpci->gmsi=2Egvec =3D gvec;
> +        pirq_dpci->gmsi=2Egflags =3D gflags;
> +        /*
> +         * 'pt_irq_bind_msi' can be called after 'pt_irq_destroy_bind'=
=2E
> +         * The 'pirq_cleanup_check' which would free the structure is o=
nly
> +         * called if the event channel for the PIRQ is active=2E Howeve=
r
> +         * OS-es that use event channels usually bind PIRQs to eventds
> +         * and unbind them before calling 'pt_irq_destroy_bind' - with =
the
> +         * result that we re-use the 'dpci' structure=2E This can be
> +         * reproduced with unloading and loading the driver for a devic=
e=2E
> +         *
> +         * As such on every 'pt_irq_bind_msi' call we MUST set it=2E
> +         */
> +        pirq_dpci->dom =3D d;
> +        /* bind after hvm_irq_dpci is setup to avoid race with irq hand=
ler */
> +        rc =3D pirq_guest_bind(d->vcpu[0], info, 0);
> +        if ( rc =3D=3D 0 && gtable )
>           {
> -            pirq_dpci->flags =3D HVM_IRQ_DPCI_MAPPED | HVM_IRQ_DPCI_MAC=
H_MSI |
> -                               HVM_IRQ_DPCI_GUEST_MSI;
> -            pirq_dpci->gmsi=2Egvec =3D pt_irq_bind->u=2Emsi=2Egvec;
> -            pirq_dpci->gmsi=2Egflags =3D gflags;
> -            /*
> -             * 'pt_irq_create_bind' can be called after 'pt_irq_destroy=
_bind'=2E
> -             * The 'pirq_cleanup_check' which would free the structure =
is only
> -             * called if the event channel for the PIRQ is active=2E Ho=
wever
> -             * OS-es that use event channels usually bind PIRQs to even=
tds
> -             * and unbind them before calling 'pt_irq_destroy_bind' - w=
ith the
> -             * result that we re-use the 'dpci' structure=2E This can b=
e
> -             * reproduced with unloading and loading the driver for a d=
evice=2E
> -             *
> -             * As such on every 'pt_irq_create_bind' call we MUST set i=
t=2E
> -             */
> -            pirq_dpci->dom =3D d;
> -            /* bind after hvm_irq_dpci is setup to avoid race with irq =
handler*/
> -            rc =3D pirq_guest_bind(d->vcpu[0], info, 0);
> -            if ( rc =3D=3D 0 && pt_irq_bind->u=2Emsi=2Egtable )
> -            {
> -                rc =3D msixtbl_pt_register(d, info, pt_irq_bind->u=2Ems=
i=2Egtable);
> -                if ( unlikely(rc) )
> -                {
> -                    pirq_guest_unbind(d, info);
> -                    /*
> -                     * Between 'pirq_guest_bind' and before 'pirq_guest=
_unbind'
> -                     * an interrupt can be scheduled=2E No more of them=
 are going
> -                     * to be scheduled but we must deal with the one th=
at may be
> -                     * in the queue=2E
> -                     */
> -                    pt_pirq_softirq_reset(pirq_dpci);
> -                }
> -            }
> +            rc =3D msixtbl_pt_register(d, info, gtable);
>               if ( unlikely(rc) )
>               {
> -                pirq_dpci->gmsi=2Egflags =3D 0;
> -                pirq_dpci->gmsi=2Egvec =3D 0;
> -                pirq_dpci->dom =3D NULL;
> -                pirq_dpci->flags =3D 0;
> -                if ( !info->evtchn )
> -                    pirq_cleanup_check(info, d);
> -                write_unlock(&d->event_lock);
> -                return rc;
> +                pirq_guest_unbind(d, info);
> +                /*
> +                 * Between 'pirq_guest_bind' and before 'pirq_guest_unb=
ind'
> +                 * an interrupt can be scheduled=2E No more of them are=
 going
> +                 * to be scheduled but we must deal with the one that m=
ay be
> +                 * in the queue=2E
> +                 */
> +                pt_pirq_softirq_reset(pirq_dpci);
>               }
>           }
> -        else
> +        if ( unlikely(rc) )
>           {
> -            uint32_t mask =3D HVM_IRQ_DPCI_MACH_MSI | HVM_IRQ_DPCI_GUES=
T_MSI;
> -
> -            if ( (pirq_dpci->flags & mask) !=3D mask )
> -            {
> -                write_unlock(&d->event_lock);
> -                return -EBUSY;
> -            }
> -
> -            /* If pirq is already mapped as vmsi, update guest data/add=
r=2E */
> -            if ( pirq_dpci->gmsi=2Egvec !=3D pt_irq_bind->u=2Emsi=2Egve=
c ||
> -                 pirq_dpci->gmsi=2Egflags !=3D gflags )
> -            {
> -                /* Directly clear pending EOIs before enabling new MSI =
info=2E */
> -                pirq_guest_eoi(info);
> -
> -                pirq_dpci->gmsi=2Egvec =3D pt_irq_bind->u=2Emsi=2Egvec;
> -                pirq_dpci->gmsi=2Egflags =3D gflags;
> -            }
> +            pirq_dpci->gmsi=2Egflags =3D 0;
> +            pirq_dpci->gmsi=2Egvec =3D 0;
> +            pirq_dpci->dom =3D NULL;
> +            pirq_dpci->flags =3D 0;
> +            if ( !info->evtchn )
> +                pirq_cleanup_check(info, d);
> +            write_unlock(&d->event_lock);
> +            return rc;
>           }
> -        /* Calculate dest_vcpu_id for MSI-type pirq migration=2E */
> -        dest =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
> -                         XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
> -        dest_mode =3D pirq_dpci->gmsi=2Egflags & XEN_DOMCTL_VMSI_X86_DM=
_MASK;
> -        delivery_mode =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
> -                                  XEN_DOMCTL_VMSI_X86_DELIV_MASK);
> -
> -        dest_vcpu_id =3D hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
> -        pirq_dpci->gmsi=2Edest_vcpu_id =3D dest_vcpu_id;
> -        write_unlock(&d->event_lock);
> +    }
> +    else
> +    {
> +        uint32_t mask =3D HVM_IRQ_DPCI_MACH_MSI | HVM_IRQ_DPCI_GUEST_MS=
I;
>  =20
> -        pirq_dpci->gmsi=2Eposted =3D false;
> -        vcpu =3D (dest_vcpu_id >=3D 0) ? d->vcpu[dest_vcpu_id] : NULL;
> -        if ( iommu_intpost )
> +        if ( (pirq_dpci->flags & mask) !=3D mask )
>           {
> -            if ( delivery_mode =3D=3D dest_LowestPrio )
> -                vcpu =3D vector_hashing_dest(d, dest, dest_mode,
> -                                           pirq_dpci->gmsi=2Egvec);
> -            if ( vcpu )
> -                pirq_dpci->gmsi=2Eposted =3D true;
> +            write_unlock(&d->event_lock);
> +            return -EBUSY;
>           }
> -        if ( vcpu && is_iommu_enabled(d) )
> -            hvm_migrate_pirq(pirq_dpci, vcpu);
>  =20
> -        /* Use interrupt posting if it is supported=2E */
> -        if ( iommu_intpost )
> +        /* If pirq is already mapped as vmsi, update guest data/addr=2E=
 */
> +        if ( pirq_dpci->gmsi=2Egvec !=3D gvec || pirq_dpci->gmsi=2Egfla=
gs !=3D gflags )
>           {
> -            rc =3D hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi=2Egve=
c);
> +            /* Directly clear pending EOIs before enabling new MSI info=
=2E */
> +            pirq_guest_eoi(info);
>  =20
> -            if ( rc )
> -            {
> -                pt_irq_destroy_bind(d, pt_irq_bind);
> -                return rc;
> -            }
> +            pirq_dpci->gmsi=2Egvec =3D gvec;
> +            pirq_dpci->gmsi=2Egflags =3D gflags;
>           }
> +    }
> +    /* Calculate dest_vcpu_id for MSI-type pirq migration=2E */
> +    dest =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags, XEN_DOMCTL_VMSI_X86_DE=
ST_ID_MASK);
> +    dest_mode =3D pirq_dpci->gmsi=2Egflags & XEN_DOMCTL_VMSI_X86_DM_MAS=
K;
> +    delivery_mode =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
> +                               XEN_DOMCTL_VMSI_X86_DELIV_MASK);
> +
> +    dest_vcpu_id =3D hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
> +    pirq_dpci->gmsi=2Edest_vcpu_id =3D dest_vcpu_id;
> +    write_unlock(&d->event_lock);
>  =20
> -        if ( pt_irq_bind->u=2Emsi=2Egflags & XEN_DOMCTL_VMSI_X86_UNMASK=
ED )
> +    pirq_dpci->gmsi=2Eposted =3D false;
> +    vcpu =3D (dest_vcpu_id >=3D 0) ? d->vcpu[dest_vcpu_id] : NULL;
> +    if ( iommu_intpost )
> +    {
> +        if ( delivery_mode =3D=3D dest_LowestPrio )
> +            vcpu =3D vector_hashing_dest(d, dest, dest_mode,
> +                                       pirq_dpci->gmsi=2Egvec);
> +        if ( vcpu )
> +            pirq_dpci->gmsi=2Eposted =3D true;
> +    }
> +    if ( vcpu && is_iommu_enabled(d) )
> +        hvm_migrate_pirq(pirq_dpci, vcpu);
> +
> +    /* Use interrupt posting if it is supported=2E */
> +    if ( iommu_intpost )
> +    {
> +        struct xen_domctl_bind_pt_irq bind =3D {
> +            =2Emachine_irq =3D machine_irq,
> +            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
> +        };
> +
> +        rc =3D hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi=2Egvec);
> +        if ( rc )
>           {
> -            unsigned long flags;
> -            struct irq_desc *desc =3D pirq_spin_lock_irq_desc(info, &fl=
ags);
> +            pt_irq_destroy_bind(d, &bind);
> +            return rc;
> +        }
> +    }
>  =20
> -            if ( !desc )
> -            {
> -                pt_irq_destroy_bind(d, pt_irq_bind);
> -                return -EINVAL;
> -            }
> +    if ( unmasked )
> +    {
> +        struct xen_domctl_bind_pt_irq bind =3D {
> +            =2Emachine_irq =3D machine_irq,
> +            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
> +        };
> +        unsigned long flags;
> +        struct irq_desc *desc =3D pirq_spin_lock_irq_desc(info, &flags)=
;
>  =20
> -            guest_mask_msi_irq(desc, false);
> -            spin_unlock_irqrestore(&desc->lock, flags);
> +        if ( !desc )
> +        {
> +            pt_irq_destroy_bind(d, &bind);
> +            return -EINVAL;
>           }
>  =20
> -        break;
> +        guest_mask_msi_irq(desc, false);
> +        spin_unlock_irqrestore(&desc->lock, flags);
>       }
>  =20
> +    return 0;
> +}
> +
> +int pt_irq_create_bind(
> +    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
> +{
> +    int rc, pirq =3D pt_irq_bind->machine_irq;
> +
> +    if ( pirq < 0 || pirq >=3D d->nr_pirqs )
> +        return -EINVAL;
> +
> +    switch ( pt_irq_bind->irq_type )
> +    {
> +    case PT_IRQ_TYPE_MSI:
> +        return pt_irq_bind_msi(d, pirq,
> +                               pt_irq_bind->u=2Emsi=2Egvec,
> +                               pt_irq_bind->u=2Emsi=2Egflags &
> +                                   ~XEN_DOMCTL_VMSI_X86_UNMASKED,
> +                               pt_irq_bind->u=2Emsi=2Egtable,
> +                               !!(pt_irq_bind->u=2Emsi=2Egflags &
> +                                  XEN_DOMCTL_VMSI_X86_UNMASKED));
> +
>       case PT_IRQ_TYPE_PCI:
>       case PT_IRQ_TYPE_MSI_TRANSLATE:
>       {
> +        struct hvm_irq_dpci *hvm_irq_dpci;
> +        struct hvm_pirq_dpci *pirq_dpci;
> +        struct pirq *info;
>           struct dev_intx_gsi_link *digl =3D NULL;
>           struct hvm_girq_dpci_mapping *girq =3D NULL;
>           unsigned int guest_gsi;
>  =20
> +        rc =3D pt_irq_dpci_setup(d, pirq, &hvm_irq_dpci, &pirq_dpci, &i=
nfo);
> +        if ( rc )
> +            return rc;
> +
>           /*
>            * Mapping GSIs for the hardware domain is different than doin=
g it for
>            * an unpriviledged guest, the hardware domain is only allowed=
 t
Aside that, the rest looks good to me=2E

with or without the cast change :
Reviewed-by: Teddy Astie <teddy=2Eastie@vates=2Etech>

Teddy


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.b5.57efd0fc27062d4d.19dd465068f.43f3625d62435cc9=---

