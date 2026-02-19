Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B8kOrv0lmndrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:32:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CB415E4C5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236165.1538934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt2G4-0005Au-6h; Thu, 19 Feb 2026 11:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236165.1538934; Thu, 19 Feb 2026 11:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt2G4-00057j-3K; Thu, 19 Feb 2026 11:31:48 +0000
Received: by outflank-mailman (input) for mailman id 1236165;
 Thu, 19 Feb 2026 11:31:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6FJ=AX=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vt2G2-0004uH-Rs
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 11:31:46 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91c2e6f5-0d86-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 12:31:44 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-388126f79bcso7261211fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 03:31:44 -0800 (PST)
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
X-Inumbo-ID: 91c2e6f5-0d86-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1771500704; cv=none;
        d=google.com; s=arc-20240605;
        b=XOXNHnmGNyo0e1aQVTyYEcWabYlwPzm0nCjQUFjBCckbb2z83T2Uz542GuviL5YyVV
         LdVZNzALJYHxi1ULAtLQryTSMfUBIJMLUuqHR9Ulr9szoL7svUrCa1OCOEY9sWcDohEl
         lhyADDlRb03geBMmbzNBYudQtnzJsEWXUn3kZJ0BfJSqlPMrmtydr735Cve7o9B2cTUL
         M2kwH/caiwpIK4SiwDpwRxmnW4gswsWEWbZtNLF5hYahkkGvgOMdEKTL3XXHiKvWfLXc
         sGcm4+w0pRbQ6bT7N8kZ0tLWN9E+TrcHHalCdf+/w4fn1reCa+sR8k9ADW2iaFno0sct
         MXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9d2ZXPdihAkEnCINi8lcTZ6+WdSKfvPfr0fwM+yPiY=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=awJVdi6eDCUmQnAWJauL0nqit4C9M+R4d6R+EqbYaLZqYY7rZ33Y7T5EYk6DepWDes
         vMUdI3FHh93t1UOYp/u8DbOb0lp3IlOjEfQo5uBzMgthpPGjSly3ACeCrcs6dADeDOfs
         85suMTQ4Ccop7uG8gDqXjvPWz6Eb5yZKq5PgDRvBxxxUONqiwd2Q7gheca0ix9xXHXVF
         HiiCzQiDAYyRPH8U5S2Q9EnGKe/H1Uxb/jvxBvX90kQIsB/W7de7JaJI5azO84kQYVVp
         9BXwV8bTryLTOZC336x4zdgd8im/B3iCspQilRpcxTCKdcbNeLtyPD0IIAA4JKw3DtzP
         YLMw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771500704; x=1772105504; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9d2ZXPdihAkEnCINi8lcTZ6+WdSKfvPfr0fwM+yPiY=;
        b=dinJ1GK2kGpb0UW6lp2nFVpsxZFRdgRQcLxlMn2FgDI8z/oiTU8xw2bgB/7a+0JcU0
         R/wXBTeefAXGG5oFNWCnxKwTGS0CAy3j3yNHBhOXnJ798OpCqVggK6QKhLZqrLuDQ8kG
         XJWbBtAdO++e2VIH4IGEp0/yyDGS/vZrLRHtKuevoR3eBbMXnurX6wIgHp2K+cXdcIyT
         yU4QGd2B3ash9DwxOaX7UYg9V3YXmRfJYcbBFzhPzXlUBMIxsC6MFkstwM1B1q9cEr5Y
         Leqhgams6hf0mL9DQD3CIbhn/lpU6CAuWc8ohwWDwPVw1m+wFk3B7VwF20zm585LiGz4
         x+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500704; x=1772105504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z9d2ZXPdihAkEnCINi8lcTZ6+WdSKfvPfr0fwM+yPiY=;
        b=JiZHOCYDx6GOmYsJYgf9TJQaqGIm/ybQ1c2AM3FCQCUnLNY9RXYpwpoOMaLSpa0aL5
         N8kQewM4rGhPoF5TyiWaQ8YDsAps+pByo1iJ27nqhcp3vLQR4Lt5PWSChCIHIu9YSCit
         M+Dc7A4xUPYUXzGaJWRIlSIZJb9nsI5Sc51v7EkP4BiBVsHruS5Rrfic1JxAXEi48BsT
         VxQrzixAcopfRUVrNQQgHCT52gtzo/JL01m47xHqAYQiv3aoq5pqONFpFHmO1sjQmFWI
         AH8X8Hi4bYXD4Nsw+VZ2fOgfmEZ8IkSrYNOFxNm+wZHChWDU6hBdzUXRDpZsfvVic+1V
         LfTw==
X-Gm-Message-State: AOJu0YwoeG1/zKfl76zpuD96kuNBHKx8NwObTKX5QZ9CbcRIuBGr8ocR
	DYFIXZwMhe9HzRmYdq8EvUuXLB1qn9z0d/ZU5/HXa0cTE9KbTxmrfRs/+Ui2yRPrgeGA+qnDqfc
	cqpVhNy19gM6JrphXVpfKg/SCmmARY2Y=
X-Gm-Gg: AZuq6aLtum8NZxgWRKWeT+5pW6JLwQNhmv3DUdisQu7OOw6IV/SBIbxFRtPyhHXDuqF
	dHbf7dzCwE5NWM2mFiizhp8qPnPZVnT2scep08VIz0mdtoKYErYP2VPowVyLdxxRK52TjxQcgv7
	tVKtuyMvC5KD43ooswqVQkCwRob5ywBWtADRXEPU9YBxwsw3xEpJmLclTHMf031iD7MCqMHQ4Sy
	9aUvp/stSuse5T6t9t7sSG2dMUxLWRFbSpN8SF/dZM4Wln1U0CFjE/8ABGqyGizKYOXv9cu1mO2
	tv2Ggg==
X-Received: by 2002:a05:651c:1581:b0:37f:af92:1c03 with SMTP id
 38308e7fff4ca-388467aaa7cmr16533301fa.12.1771500703774; Thu, 19 Feb 2026
 03:31:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <f5a6642772da0736e28511ec92f71146ce443294.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <f5a6642772da0736e28511ec92f71146ce443294.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 19 Feb 2026 13:30:00 +0200
X-Gm-Features: AaiRm52xq-kPLxnj8N_bv0GgnnsmKULu84PI9AiwhOXUAGXZnd3sUEsIGovxq6g
Message-ID: <CAGeoDV9-Tqq4inKTtwQGosa+=OAOTVYDOo2CXh=xpQsbMateyA@mail.gmail.com>
Subject: Re: [RFC PATCH 17/19] arm/gicv4: Handle doorbells
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43CB415E4C5
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> When GIC wants to inject a virtual interrupt to a VCPU that is not
> currently scheduled, it sends a kick for a hypervisor to schedule it. To
> receive such kicks, we need to set up a doorbell interrupt for each VPE.
>
> Add changes necessary to allocate, mask/unmask and handle doorbell
> interrupts for each VPE. When a doorbell interrupt is received, set the
> pending_last flag for the corresponding VPE and kick it, so that the
> hypervisor schedules the VCPU to handle pending VLPIs.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/gic-v3-its.c             |  13 ++-
>  xen/arch/arm/gic-v3-lpi.c             |  69 ++++++++++----
>  xen/arch/arm/gic-v4-its.c             | 127 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/gic_v3_its.h |   6 +-
>  xen/arch/arm/vgic-v3-its.c            |  14 ++-
>  5 files changed, 203 insertions(+), 26 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index be840fbc8f..fa5c1eb6d1 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -1016,8 +1016,11 @@ int gicv3_its_map_guest_device(struct domain *d,
>
>      dev->guest_doorbell =3D guest_doorbell;
>      dev->guest_devid =3D guest_devid;
> -    dev->host_devid =3D host_devid;
> -    dev->eventids =3D nr_events;
> +
> +    #ifdef CONFIG_GICV4
> +       spin_lock_init(&dev->event_map.vlpi_lock);
> +       dev->event_map.nr_lpis =3D nr_events;
> +    #endif
>
>      rb_link_node(&dev->rbnode, parent, new);
>      rb_insert_color(&dev->rbnode, &d->arch.vgic.its_devices);
> @@ -1142,7 +1145,8 @@ int gicv3_remove_guest_event(struct domain *d, padd=
r_t vdoorbell_address,
>      if ( host_lpi =3D=3D INVALID_LPI )
>          return -EINVAL;
>
> -    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI);
> +    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI,
> +                                false, INVALID_VCPU_ID);
>
>      return 0;
>  }
> @@ -1169,7 +1173,8 @@ struct pending_irq *gicv3_assign_guest_event(struct=
 domain *d,
>      if ( !pirq )
>          return NULL;
>
> -    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, virt_lpi);
> +    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, virt_lpi,
> +                                false, INVALID_VCPU_ID);
>
>      return pirq;
>  }
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index 3c2649b695..37f1aa1064 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -39,7 +39,7 @@ union host_lpi {
>      struct {
>          uint32_t virt_lpi;
>          uint16_t dom_id;
> -        uint16_t pad;
> +        uint16_t db_vcpu_id;
>      };
>  };
>
> @@ -161,24 +161,48 @@ void gicv3_do_LPI(unsigned int lpi)
>       * ignore them, as they have no further state and no-one can expect
>       * to see them if they have not been mapped.
>       */
> -    if ( hlpi.virt_lpi =3D=3D INVALID_LPI )
> +    if ( hlpi.virt_lpi =3D=3D INVALID_LPI && hlpi.db_vcpu_id =3D=3D INVA=
LID_VCPU_ID )
>          goto out;
>
>      d =3D rcu_lock_domain_by_id(hlpi.dom_id);
>      if ( !d )
>          goto out;
>
> -    /*
> -     * TODO: Investigate what to do here for potential interrupt storms.
> -     * As we keep all host LPIs enabled, for disabling LPIs we would nee=
d
> -     * to queue a ITS host command, which we avoid so far during a guest=
's
> -     * runtime. Also re-enabling would trigger a host command upon the
> -     * guest sending a command, which could be an attack vector for
> -     * hogging the host command queue.
> -     * See the thread around here for some background:
> -     * https://lists.xen.org/archives/html/xen-devel/2016-12/msg00003.ht=
ml
> -     */
> -    vgic_vcpu_inject_lpi(d, hlpi.virt_lpi);
> +    /* It is a doorbell interrupt. */
> +    if ( hlpi.db_vcpu_id !=3D INVALID_VCPU_ID )
> +    {
> +#ifdef CONFIG_GICV4
> +        struct vcpu *v =3D d->vcpu[hlpi.db_vcpu_id];
> +
> +        /* We got the message, no need to fire again */
> +        its_vpe_mask_db(v->arch.vgic.its_vpe);
> +
> +        /*
> +         * Update the pending_last flag that indicates that VLPIs are pe=
nding.
> +         * And the corresponding vcpu is also kicked into action.
> +         */
> +        v->arch.vgic.its_vpe->pending_last =3D true;

This write is not synchronized. pending_last is touched from the LPI
handler path, so please use the appropriate vPE lock here, or make it
an atomic/WRITE_ONCE with a clear concurrency rationale. As-is this is
a data race.

> +
> +        vcpu_kick(v);
> +#else
> +        printk(XENLOG_WARNING
> +               "Doorbell LPI is only suooprted on GICV4\n");
> +#endif
> +    }
> +    else
> +    {
> +        /*
> +         * TODO: Investigate what to do here for potential interrupt sto=
rms.
> +         * As we keep all host LPIs enabled, for disabling LPIs we would=
 need
> +         * to queue a ITS host command, which we avoid so far during a g=
uest's
> +         * runtime. Also re-enabling would trigger a host command upon t=
he
> +         * guest sending a command, which could be an attack vector for
> +         * hogging the host command queue.
> +         * See the thread around here for some background:
> +         * https://lists.xen.org/archives/html/xen-devel/2016-12/msg0000=
3.html
> +         */
> +        vgic_vcpu_inject_lpi(d, hlpi.virt_lpi);
> +    }
>
>      rcu_unlock_domain(d);
>
> @@ -187,7 +211,8 @@ out:
>  }
>
>  void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
> -                                 uint32_t virt_lpi)
> +                                 uint32_t virt_lpi, bool is_db,
> +                                 uint16_t db_vcpu_id)
>  {
>      union host_lpi *hlpip, hlpi;
>
> @@ -197,8 +222,16 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi, =
int domain_id,
>
>      hlpip =3D &lpi_data.host_lpis[host_lpi / HOST_LPIS_PER_PAGE][host_lp=
i % HOST_LPIS_PER_PAGE];
>
> -    hlpi.virt_lpi =3D virt_lpi;
> -    hlpi.dom_id =3D domain_id;
> +    if ( !is_db )
> +    {
> +        hlpi.virt_lpi =3D virt_lpi;
> +        hlpi.dom_id =3D domain_id;
> +    }
> +    else
> +    {
> +        hlpi.dom_id =3D domain_id;
> +        hlpi.db_vcpu_id =3D db_vcpu_id;
> +    }
>
>      write_u64_atomic(&hlpip->data, hlpi.data);
>  }
> @@ -595,6 +628,7 @@ int gicv3_allocate_host_lpi_block(struct domain *d, u=
int32_t *first_lpi)
>           */
>          hlpi.virt_lpi =3D INVALID_LPI;
>          hlpi.dom_id =3D d->domain_id;
> +        hlpi.db_vcpu_id =3D INVALID_VCPU_ID;
>          write_u64_atomic(&lpi_data.host_lpis[chunk][lpi_idx + i].data,
>                           hlpi.data);
>
> @@ -602,7 +636,8 @@ int gicv3_allocate_host_lpi_block(struct domain *d, u=
int32_t *first_lpi)
>           * Enable this host LPI, so we don't have to do this during the
>           * guest's runtime.
>           */
> -        lpi_data.lpi_property[lpi + i] |=3D LPI_PROP_ENABLED;
> +        lpi_write_config(lpi_data.lpi_property, lpi + i + LPI_OFFSET, 0x=
ff,
> +                         LPI_PROP_ENABLED);
>      }
>
>      lpi_data.next_free_lpi =3D lpi + LPI_BLOCK;
> diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
> index 175fda7acb..0462976b93 100644
> --- a/xen/arch/arm/gic-v4-its.c
> +++ b/xen/arch/arm/gic-v4-its.c
> @@ -157,6 +157,9 @@ static int its_send_cmd_vmapp(struct host_its *its, s=
truct its_vpe *vpe,
>      cmd[3] =3D (vpt_addr & GENMASK(51, 16)) |
>               ((HOST_LPIS_NRBITS - 1) & GENMASK(4, 0));
>
> +    /* Default doorbell interrupt */
> +    cmd[1] |=3D (uint64_t)vpe->vpe_db_lpi;

Doorbell LPI is a GICv4.1 addition; for GICv4.0 this should not be set.

> +
>   out:
>      ret =3D its_send_command(its, cmd);
>
> @@ -296,6 +299,37 @@ static int its_send_cmd_vmovp(struct its_vpe *vpe)
>      return 0;
>  }
>
> +
> +static void its_vpe_send_inv_db(struct its_vpe *vpe)
> +{
> +    // struct its_device *dev =3D vpe_proxy.dev;
> +    // unsigned long flags;
> +
> +    // spin_lock_irqsave(&vpe_proxy.lock, flags);
> +    // gicv4_vpe_db_proxy_map_locked(vpe);
> +    // its_send_cmd_inv(dev->hw_its, dev->host_devid, vpe->vpe_proxy_eve=
nt);
> +    // spin_unlock_irqrestore(&vpe_proxy.lock, flags);
> +}
> +
> +static void its_vpe_inv_db(struct its_vpe *vpe)
> +{
> +    its_vpe_send_inv_db(vpe);
> +}
> +
> +void its_vpe_mask_db(struct its_vpe *vpe)
> +{
> +    /* Only clear enable bit. */
> +    lpi_write_config(lpi_data.lpi_property, vpe->vpe_db_lpi, LPI_PROP_EN=
ABLED, 0);
> +    its_vpe_inv_db(vpe);
> +}
> +
> +static void its_vpe_unmask_db(struct its_vpe *vpe)
> +{
> +    /* Only set enable bit. */
> +    lpi_write_config(lpi_data.lpi_property, vpe->vpe_db_lpi, 0, LPI_PROP=
_ENABLED);
> +    its_vpe_inv_db(vpe);
> +}
> +
>  static void __init its_vpe_teardown(struct its_vpe *vpe)
>  {
>      unsigned int order;
> @@ -309,6 +343,8 @@ static void __init its_vpe_teardown(struct its_vpe *v=
pe)
>  int vgic_v4_its_vm_init(struct domain *d)
>  {
>      unsigned int nr_vcpus =3D d->max_vcpus;
> +    unsigned int nr_db_lpis, nr_chunks, i =3D 0;
> +    uint32_t *db_lpi_bases;
>      int ret =3D -ENOMEM;
>
>      if ( !gicv3_its_host_has_its() )
> @@ -326,9 +362,31 @@ int vgic_v4_its_vm_init(struct domain *d)
>      d->arch.vgic.its_vm->vproptable =3D lpi_allocate_proptable();
>      if ( !d->arch.vgic.its_vm->vproptable )
>          goto fail_vprop;
> +    /* Allocate a doorbell interrupt for each VPE. */
> +    nr_db_lpis =3D d->arch.vgic.its_vm->nr_vpes;
> +    nr_chunks =3D DIV_ROUND_UP(nr_db_lpis, LPI_BLOCK);
> +    db_lpi_bases =3D xzalloc_array(uint32_t, nr_chunks);
> +    if ( !db_lpi_bases )
> +        goto fail_db_bases;
> +
> +    do {
> +        /* Allocate doorbell interrupts in chunks of LPI_BLOCK (=3D32). =
*/
> +        ret =3D gicv3_allocate_host_lpi_block(d, &db_lpi_bases[i]);
> +        if ( ret )
> +            goto fail_db;
> +    } while ( ++i < nr_chunks );
> +
> +    d->arch.vgic.its_vm->db_lpi_bases =3D db_lpi_bases;
> +    d->arch.vgic.its_vm->nr_db_lpis =3D nr_db_lpis;
>
>      return 0;
>
> +fail_db:
> +    while ( --i >=3D 0 )

'i' is unsigned, so --i >=3D 0 is always true.
This will loop forever.

> +        gicv3_free_host_lpi_block(d->arch.vgic.its_vm->db_lpi_bases[i]);

The fail path frees via d->arch.vgic.its_vm->db_lpi_bases, but this
pointer is only assigned on the success path. On failure it can be
NULL/uninitialized. Please free via the local db_lpi_bases[] (and then
xfree(db_lpi_bases)), or assign its_vm->db_lpi_bases before entering the
allocation loop.

> +    xfree(db_lpi_bases);
> +fail_db_bases:
> +    lpi_free_proptable(d->arch.vgic.its_vm->vproptable);
>  fail_vprop:
>      xfree(d->arch.vgic.its_vm->vpes);
>   fail_vpes:
> @@ -340,8 +398,13 @@ fail_vprop:
>  void vgic_v4_free_its_vm(struct domain *d)
>  {
>      struct its_vm *its_vm =3D d->arch.vgic.its_vm;
> +    int nr_chunks =3D DIV_ROUND_UP(its_vm->nr_db_lpis, LPI_BLOCK);
>      if ( its_vm->vpes )
>          xfree(its_vm->vpes);
> +    while ( --nr_chunks >=3D 0 )
> +        gicv3_free_host_lpi_block(its_vm->db_lpi_bases[nr_chunks]);
> +    if ( its_vm->db_lpi_bases )
> +        xfree(its_vm->db_lpi_bases);
>      if ( its_vm->vproptable )
>          lpi_free_proptable(its_vm);
>  }
> @@ -357,14 +420,29 @@ int vgic_v4_its_vpe_init(struct vcpu *vcpu)
>          return -ENOMEM;
>
>      its_vm->vpes[vcpuid] =3D vcpu->arch.vgic.its_vpe;
> +    vcpu->arch.vgic.its_vpe =3D vcpu->arch.vgic.its_vpe;

This is a no-op self-assignment; please remove.

> +    vcpu->arch.vgic.its_vpe->vpe_db_lpi =3D its_vm->db_lpi_bases[vcpuid/=
32] + (vcpuid % 32);
> +    /*
> +     * Sometimes vlpi gets firstly mapped before associated vpe
> +     * becoming resident, so in case missing the interrupt, we intend to
> +     * enable doorbell at the initialization stage
> +     */
> +
>      vcpu->arch.vgic.its_vpe->its_vm =3D its_vm;
>
> +    gicv3_lpi_update_host_entry(vcpu->arch.vgic.its_vpe->vpe_db_lpi,
> +                                vcpu->domain->domain_id, INVALID_LPI, tr=
ue,
> +                                vcpu->vcpu_id);
> +
> +
>      ret =3D its_vpe_init(vcpu->arch.vgic.its_vpe);
>      if ( ret )
>      {
>          its_vpe_teardown(vcpu->arch.vgic.its_vpe);
>          return ret;
>      }
> +    its_vpe_unmask_db(vcpu->arch.vgic.its_vpe);
> +
>      return 0;
>  }
>
> @@ -800,6 +878,7 @@ void vgic_v4_load(struct vcpu *vcpu)
>       * corresponding to our current CPU expects us here
>       */
>      WARN_ON(gicv4_vpe_set_affinity(vcpu));
> +    its_vpe_mask_db(vpe);
>      its_make_vpe_resident(vpe, vcpu->processor);
>      vpe->resident =3D true;
>  }
> @@ -812,5 +891,53 @@ void vgic_v4_put(struct vcpu *vcpu, bool need_db)
>          return;
>
>      its_make_vpe_non_resident(vpe, vcpu->processor);
> +    if ( need_db )
> +        /* Enable the doorbell, as the guest is going to block */
> +        its_vpe_unmask_db(vpe);
>      vpe->resident =3D false;
>  }
> +
> +static int its_vlpi_set_doorbell(struct its_vlpi_map *map, bool enable)
> +{
> +    if (map->db_enabled =3D=3D enable)
> +        return 0;
> +
> +    map->db_enabled =3D enable;
> +
> +    /*
> +     * Ideally, we'd issue a VMAPTI to set the doorbell to its LPI
> +     * value or to 1023, depending on the enable bit. But that
> +     * would be issuing a mapping for an /existing/ DevID+EventID
> +     * pair, which is UNPREDICTABLE. Instead, let's issue a VMOVI
> +     * to the /same/ vPE, using this opportunity to adjust the doorbell.
> +     */
> +    return its_send_cmd_vmovi(map->dev->hw_its, map);
> +}
> +
> +int its_vlpi_prop_update(struct pending_irq *pirq, uint8_t property,
> +                         bool needs_inv)
> +{
> +    struct its_vlpi_map *map;
> +    unsigned int cpu;
> +    int ret;
> +
> +    if ( !pirq->vlpi_map )
> +        return -EINVAL;
> +
> +    map =3D pirq->vlpi_map;
> +
> +    /* Cache the updated property and update the vproptable. */
> +    map->properties =3D property;
> +    lpi_write_config(map->vm->vproptable, pirq->irq, 0xff, property);
> +
> +    if ( needs_inv )
> +    {
> +        cpu =3D map->vm->vpes[map->vpe_idx]->col_idx;
> +        ret =3D its_inv_lpi(map->dev->hw_its, map->dev, map->eventid, cp=
u);
> +        if ( ret )
> +            return ret;
> +    }
> +
> +    return its_vlpi_set_doorbell(map, property & LPI_PROP_ENABLED);
> +}
> +
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include=
/asm/gic_v3_its.h
> index f03a8fad47..dababe97cd 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -295,7 +295,9 @@ struct pending_irq *gicv3_assign_guest_event(struct d=
omain *d,
>                                               uint32_t vdevid, uint32_t e=
ventid,
>                                               uint32_t virt_lpi);
>  void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
> -                                 uint32_t virt_lpi);
> +                                 uint32_t virt_lpi, bool is_db,
> +                                 uint16_t db_vcpu_id);
> +
>  struct its_baser *its_get_baser(struct host_its *hw_its, uint32_t type);
>  bool its_alloc_table_entry(struct its_baser *baser, uint32_t id);
>  struct page_info *lpi_allocate_pendtable(void);
> @@ -322,6 +324,8 @@ bool event_is_forwarded_to_vcpu(struct its_device *de=
v, uint32_t eventid);
>  void its_vpe_mask_db(struct its_vpe *vpe);
>  #endif
>  int gicv4_its_vlpi_unmap(struct pending_irq *pirq);
> +int its_vlpi_prop_update(struct pending_irq *pirq, uint8_t property,
> +                         bool needs_inv);
>
>  /* ITS quirks handling. */
>  uint64_t gicv3_its_get_cacheability(void);
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 94f7dd7d90..0a740ad68f 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -387,7 +387,7 @@ out_unlock:
>   * property table and update the virtual IRQ's state in the given pendin=
g_irq.
>   * Must be called with the respective VGIC VCPU lock held.
>   */
> -static int update_lpi_property(struct domain *d, struct pending_irq *p)
> +int update_lpi_property(struct domain *d, struct pending_irq *p, bool ne=
eds_inv)

I don=E2=80=99t see any out-of-file users of update_lpi_property().
If it=E2=80=99s still file-local, keep it static.

Best regards,
Mykola

>  {
>      paddr_t addr;
>      uint8_t property;
> @@ -417,6 +417,9 @@ static int update_lpi_property(struct domain *d, stru=
ct pending_irq *p)
>      else
>          clear_bit(GIC_IRQ_GUEST_ENABLED, &p->status);
>
> +    if ( pirq_is_tied_to_hw(p) )
> +        return its_vlpi_prop_update(p, property, needs_inv);
> +
>      return 0;
>  }
>
> @@ -430,6 +433,9 @@ static int update_lpi_property(struct domain *d, stru=
ct pending_irq *p)
>   */
>  static void update_lpi_vgic_status(struct vcpu *v, struct pending_irq *p=
)
>  {
> +    if ( pirq_is_tied_to_hw(p) )
> +        return;
> +
>      ASSERT(spin_is_locked(&v->arch.vgic.lock));
>
>      if ( test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
> @@ -479,7 +485,7 @@ static int its_handle_inv(struct virt_its *its, uint6=
4_t *cmdptr)
>      spin_lock_irqsave(&vcpu->arch.vgic.lock, flags);
>
>      /* Read the property table and update our cached status. */
> -    if ( update_lpi_property(d, p) )
> +    if ( update_lpi_property(d, p, true) )
>          goto out_unlock;
>
>      /* Check whether the LPI needs to go on a VCPU. */
> @@ -552,7 +558,7 @@ static int its_handle_invall(struct virt_its *its, ui=
nt64_t *cmdptr)
>
>              vlpi =3D pirqs[i]->irq;
>              /* If that fails for a single LPI, carry on to handle the re=
st. */
> -            err =3D update_lpi_property(its->d, pirqs[i]);
> +            err =3D update_lpi_property(its->d, pirqs[i], false);
>              if ( !err )
>                  update_lpi_vgic_status(vcpu, pirqs[i]);
>              else
> @@ -785,7 +791,7 @@ static int its_handle_mapti(struct virt_its *its, uin=
t64_t *cmdptr)
>       * We don't need the VGIC VCPU lock here, because the pending_irq is=
n't
>       * in the radix tree yet.
>       */
> -    ret =3D update_lpi_property(its->d, pirq);
> +    ret =3D update_lpi_property(its->d, pirq, true);
>      if ( ret )
>          goto out_remove_host_entry;
>
> --
> 2.51.2

