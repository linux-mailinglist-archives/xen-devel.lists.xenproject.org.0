Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOL6ONyt8GnBXAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:53:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0A94852CE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296159.1572555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHhwS-000068-Rj; Tue, 28 Apr 2026 12:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296159.1572555; Tue, 28 Apr 2026 12:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHhwS-0008V1-P5; Tue, 28 Apr 2026 12:53:32 +0000
Received: by outflank-mailman (input) for mailman id 1296159;
 Tue, 28 Apr 2026 12:53:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd426d216000f373@swg.vates.tech>)
 id 1wHhwR-0008Uv-Sp
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:53:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHhwR-001ylI-8k
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:53:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd426d216000f373@swg.vates.tech>)
 id 69f0adc7-e002-0a2a0a5209dd-0a2a450bb026-24
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:53:31 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd426d216000f373@swg.vates.tech>)
 id 69f0adca-212f-0a2a450b0019-b9ff1c22a139-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:53:31 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dd426d216000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Apr 2026 12:53:27 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 70F3D861E5;
 Tue, 28 Apr 2026 14:53:26 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=0NwevG5QeWgAQyqGH8eMBN2pmsjZ9gFyStGUYXdDeA8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Tsmmw9dXAuAUYlYSpkt588n1MOCuy02d1+qTeG4q4zkY0NiUzXy2EuAGwCF8TUGv+3qDlfVni
 MTh4jEID99lgdgLzZ3jAJycsFMQ3VRKJ8veSZ2Vk01TRi3MyI/jfnY6/NsglT5RnS5nFYwAICV8
 mLCe954ROA9uCgUqEN2w4NJLdZv3qgy9qLC4n1KW0DM0hUBpgBs1SAl6j3fIT1eQZhUqjdhICeg
 GJ/pjZV2tB68d8Np12EKmxnNIYzdpSc9pUIfQjktvTpjMSxRCa9Ej/Jah+DUuBbKc4Y7FDw20aD
 gXsbnhcNkQom19r13jbUlv5sOr1E+tqfNIlOiixmfOSw==
X-Zone-Loop: 49b0996f75ed9ddff3de1659bbb4289a1471fb6ff5d0
x-campaign-type: default
x-transaction-id: d7f393a3-ca66-4d7f-845b-7475ab891410
x-swg-uid: 01-933eaec2-d412-43fe-bd4b-93df7ede092d
X-Mailer: Sweego
Message-ID:
 <1777380807.8631fc262581453bbf619ec5b2062170.19dd426d216000f373@vates.tech>
x-swg-bid: 1777380807.8631fc262581453bbf619ec5b2062170.19dd426d216000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 28 Apr 2026 14:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] x86/passthrough: Extract pt_irq_dpci_setup() from
 pt_irq_create_bind()
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387f6f000f373@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387f6f000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.7b.b46d8b43660053ac.19dd426d007.cfc53a05fe197929=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777380806663
X-purgate-ID: tlsNG-42698a/1777380811-0556BF3B-57078A3D/0/0
X-purgate-type: clean
X-purgate-size: 5274
X-Rspamd-Queue-Id: 4D0A94852CE
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
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
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.7b.b46d8b43660053ac.19dd426d007.cfc53a05fe197929=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/04/2026 =C3=A0 15:57, Julian Vetter a =C3=A9crit=C2=A0:
> The setup preamble in pt_irq_create_bind(), lazily allocating
> hvm_irq_dpci, looking up the struct pirq, and spinning until any pending
> hvm_dirq_assist softirq has drained, is needed by pt_irq_bind_msi() as
> well=2E Extract it into a static helper pt_irq_dpci_setup() that returns
> with d->event_lock write-locked on success=2E Replace the open-coded got=
o
> restart loop with a do { } while (true) loop and a continue, making the
> retry structure explicit without a label=2E No functional change=2E
>=20
> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> ---
> Changes in v4:
> - New patch
> - Split out as a preparatory no-functional-change step to make the diff
>    in patch 5 (pt_irq_bind_msi() interface change) easier to review
> ---
>   xen/drivers/passthrough/x86/hvm=2Ec | 54 +++++++++++++++++++++++------=
--
>   1 file changed, 40 insertions(+), 14 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrou=
gh/x86/hvm=2Ec
> index 691fa1b2c7=2E=2E19463c3406 100644
> --- a/xen/drivers/passthrough/x86/hvm=2Ec
> +++ b/xen/drivers/passthrough/x86/hvm=2Ec
> @@ -217,18 +217,22 @@ static struct vcpu *vector_hashing_dest(const stru=
ct domain *d,
>       return dest;
>   }
>  =20
> -int pt_irq_create_bind(
> -    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
> +/*
> + * Acquire d->event_lock (write), lazily allocate hvm_irq_dpci if neede=
d, look
> + * up the struct pirq for @pirq, and drain any pending hvm_dirq_assist =
softirq
> + * on it before returning=2E Returns 0 with d->event_lock held on succe=
ss,
> + * negative errno otherwise (lock not held)=2E
> + */
> +static int pt_irq_dpci_setup(struct domain *d, unsigned int pirq,
> +                              struct hvm_irq_dpci **hvm_irq_dpci_out,
> +                              struct hvm_pirq_dpci **pirq_dpci_out,
> +                              struct pirq **info_out)
>   {
>       struct hvm_irq_dpci *hvm_irq_dpci;
>       struct hvm_pirq_dpci *pirq_dpci;
>       struct pirq *info;
> -    int rc, pirq =3D pt_irq_bind->machine_irq;
>  =20
> -    if ( pirq < 0 || pirq >=3D d->nr_pirqs )
> -        return -EINVAL;
> -
> - restart:
> +    do
>       {
>           write_lock(&d->event_lock);
>  =20
> @@ -238,10 +242,11 @@ int pt_irq_create_bind(
>               unsigned int i;
>  =20
>               /*
> -             * NB: the hardware domain doesn't use a hvm_irq_dpci struc=
t because
> -             * it's only allowed to identity map GSIs, and so the data =
contained in
> -             * that struct (used to map guest GSIs into machine GSIs an=
d perform
> -             * interrupt routing) is completely useless to it=2E
> +             * NB: the hardware domain doesn't use a hvm_irq_dpci struc=
t
> +             * because it's only allowed to identity map GSIs, and so t=
he
> +             * data contained in that struct (used to map guest GSIs in=
to
> +             * machine GSIs and perform interrupt routing) is completel=
y
> +             * useless to it=2E
>                */
>               hvm_irq_dpci =3D xzalloc(struct hvm_irq_dpci);
>               if ( hvm_irq_dpci =3D=3D NULL )
> @@ -269,15 +274,36 @@ int pt_irq_create_bind(
>            * We MUST check for this condition as the softirq could be sc=
heduled
>            * and hasn't run yet=2E Note that this code replaced tasklet_=
kill which
>            * would have spun forever and would do the same thing (wait t=
o flush out
> -         * outstanding hvm_dirq_assist calls=2E
> +         * outstanding hvm_dirq_assist calls)=2E
>            */
>           if ( pt_pirq_softirq_active(pirq_dpci) )
>           {
>               write_unlock(&d->event_lock);
>               cpu_relax();
> -            goto restart;
> +            continue;
>           }
> -    }
> +
> +        *hvm_irq_dpci_out =3D hvm_irq_dpci;
> +        *pirq_dpci_out =3D pirq_dpci;
> +        *info_out =3D info;
> +        return 0;
> +    } while ( true );

I would prefer something like

do {
   =2E=2E=2E
} while (false);

return 0;

> +}
> +
> +int pt_irq_create_bind(
> +    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
> +{
> +    struct hvm_irq_dpci *hvm_irq_dpci;
> +    struct hvm_pirq_dpci *pirq_dpci;
> +    struct pirq *info;
> +    int rc, pirq =3D pt_irq_bind->machine_irq;
> +
> +    if ( pirq < 0 || pirq >=3D d->nr_pirqs )
> +        return -EINVAL;
> +
> +    rc =3D pt_irq_dpci_setup(d, pirq, &hvm_irq_dpci, &pirq_dpci, &info)=
;
> +    if ( rc )
> +        return rc;
>  =20
>       switch ( pt_irq_bind->irq_type )
>       {

The rest looks good to me=2E
With the do { =2E=2E=2E } while (false); change:

Reviewed-by: Teddy Astie <teddy=2Eastie@vates=2Etech>


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.7b.b46d8b43660053ac.19dd426d007.cfc53a05fe197929=---

