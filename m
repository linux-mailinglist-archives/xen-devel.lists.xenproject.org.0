Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJbbHNszl2kCvwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 17:01:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D5416076E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 17:01:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236544.1539235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6Sf-0004e1-Ul; Thu, 19 Feb 2026 16:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236544.1539235; Thu, 19 Feb 2026 16:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6Sf-0004bW-Rs; Thu, 19 Feb 2026 16:01:05 +0000
Received: by outflank-mailman (input) for mailman id 1236544;
 Thu, 19 Feb 2026 16:01:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6FJ=AX=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vt6Se-0004bQ-U4
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 16:01:05 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30816849-0dac-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 17:01:02 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-59e4989dacdso1347011e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 08:01:02 -0800 (PST)
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
X-Inumbo-ID: 30816849-0dac-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1771516862; cv=none;
        d=google.com; s=arc-20240605;
        b=flgYOO58eYtvrX2jWPIilzhIVGojBwV5rNaU9fszF6riG0uq1WSDpY/006zUNjuxGR
         iIlO2grVaqzoecvW+eszdTx90xwficAU5Z753NjQWhXWHRU4leMEu6GAQmCIJA9AW6Za
         ZTxkn4QgF6zL/wjfEpqQysrEfeFBcbVj4wY//QVXaJGwGDDKae5SeOUyxgXxW+0yp/Bc
         ORgOY6Kn1NaZNCrn8Fbzv2tnNHi+wz/p1XGI7QSSv6hOtZXx8beeRZfeDfWbPX2sTBxc
         LtwI/+BtoF/GwiA1RG5dbDa18aOjWU6c95RKqWhOOyCJm0O5y306lFvRy94z+HW+IIuS
         KQ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FMy378CkmrJq578o8xbt8mONtZJmLq/hP4VY9u0idEc=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=VzIsJ8lRUGy5gRYeYo2MbY6EC6XMI8U6iLGmgENjhXcITYoRoTvTzl0k3E0WofHOBx
         3bUO2ETCVnS/hfTC2ZexVEGgdaDpXwaWO51zD8Xq6ZF+nM0VIxZ/fbH33f00oo2IfLa3
         EjAOzGD21VhF+PRXa2nvu4GE3jqxNkW4fvONIM1fF2nKJ3szuuu7J1LwAWeK4ko02Obv
         RYD5b6zsU8MpxwgY8XWA3jLafLzow0Znsplr4CS5lnt/ju97BWAVMxyo6VulAZY4K8RJ
         2JB7b5sMCaE+yZGmnjxEIORqlO01b8pYZmICz6aNHviw5JyaU00kP8CYLb0Trp4DOI7g
         ARJA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771516862; x=1772121662; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMy378CkmrJq578o8xbt8mONtZJmLq/hP4VY9u0idEc=;
        b=IHiFj5B7g/z3fGdBa7nSGC8OY/KkiqVPXR0mPyv3FcS+WHr7qLMao7xxIcDlCC6lZv
         l320pmVu15KPMm+vIf4iZl4qZWWN6LP5+RKjqy2CPXnMfxlFYruIHAJFdgVWxzJ+07B9
         vJs3dsdd8B+aMEx+XX7afWdHCcYHv1BV85r6oq/YWXVCZm8libFQfYzjZuWCZwIY6UbC
         gQdVTQXtP/Ht5z5P/jjRt9ccph53JKB9qZzrVOH+y6FSXcayytZ7l6XidjcwjAPmJ2uO
         PmuVq16VecwzWaJQGmtr756MmTdhvD7EhzkOM7pF+OLWP1+NnTWGMqmXXDR6k+cE/imr
         EGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771516862; x=1772121662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FMy378CkmrJq578o8xbt8mONtZJmLq/hP4VY9u0idEc=;
        b=Bi22jBON65g8LxkQxV/tGtf74N56+ebNLAl8Aohz8R8PM28E/GZMccdKQAT59StMZc
         yeDoGBieenXbiPpF9BEXVMckxBuuSBh46LXPAx7edGj7vDwGLqIzWQlK8q1MmVFGGcSL
         j93bDTQzS8XhmbCN7zIWlLARo89tuJNhF2gqrmnsQKQgVOlEYFoqhHcg95QUMDmsxfob
         l0UBzd9NdM5gO7NPiNZFzjcVy37pdZWa+1b6ft92V9ZeKWHffvXAd3X/LEaaZ6LhpHr+
         L1AayDILqqPRApdX7LX0jxz8PROlU62HDAarTQONqQ1eRh3Z2+Khl6eJHRYY86ot1RVs
         2+fw==
X-Gm-Message-State: AOJu0YzAKF8FPFTpKVFpS9s1y6ofHwk9jKjQWdVWdo247un50efp/apu
	xYwDpcPcaJ5wuMZM6ZbmREYnmJyXpOeE5Z0hA3GMxK3DkFYJ/m17l2b8Fkf3/62X03OjHLHdd06
	qPpjuZrKwoJLW2/JV1dsUHOo+KuLFXNE=
X-Gm-Gg: AZuq6aIepg2TwWCoYvHArNzLmtcCCLxnj+/mqOjjgrBMiWFtS02LapMWuUecIIGb4vr
	iieOwGeXfFu4n+iSkhazGe0afodaal1dUqVGbOidFZ0M4noDgZa0cgYqCpYbvd1T/bQatnrY8dk
	fc5BZ7QKVIHI6tR7yhjGW5qNGMo5bEAbCIIQwk7O9XTRLVAb0BQ1PtQqx4ScMS1N4jWnsBhlJoc
	qYzt3KqxHCf+5V3TS5Zjjm8DhnToKTOr/LPieqFaPeCbe0vfso+64HkYRQ97A668h2jMVvSAHOP
	e7tbNQ==
X-Received: by 2002:a05:6512:3e08:b0:59c:bfb8:4cfa with SMTP id
 2adb3069b0e04-59f69c6d5b1mr6004721e87.41.1771516860988; Thu, 19 Feb 2026
 08:01:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <2bbe54851092309a0c23d68e60dfe93e4f77ef3a.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <2bbe54851092309a0c23d68e60dfe93e4f77ef3a.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 19 Feb 2026 18:00:00 +0200
X-Gm-Features: AaiRm52L_JeDfZi0DDt7SBqE2rlixsJKGvPZFar3GwL2eg-hKMSl9Xof_uhr8cw
Message-ID: <CAGeoDV8YdP_miXacqVeqrmeB-CNGWUicy5nVOSYNkwKC6xfL0w@mail.gmail.com>
Subject: Re: [RFC PATCH 18/19] arm/gic: Add VPE proxy support
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,vpe_proxy.dev:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[epam.com:query timed out,vpe_proxy.dev:query timed out];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[mykyta_poturai.epam.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1D5416076E
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/gic-v3-its.c              |  13 ++
>  xen/arch/arm/gic-v3.c                  |   1 +
>  xen/arch/arm/gic-v4-its.c              | 207 ++++++++++++++++++++++++-
>  xen/arch/arm/include/asm/gic_v3_defs.h |   7 +
>  xen/arch/arm/include/asm/gic_v3_its.h  |   7 +
>  xen/arch/arm/include/asm/gic_v4_its.h  |   5 +
>  xen/arch/arm/include/asm/vgic.h        |   2 +
>  7 files changed, 235 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index fa5c1eb6d1..5979a82526 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -333,6 +333,19 @@ int its_send_cmd_discard(struct host_its *its, struc=
t its_device *dev,
>      return its_send_command(its, cmd);
>  }
>
> +int its_send_cmd_movi(struct host_its *its, uint32_t deviceid, uint32_t =
eventid,
> +                      uint16_t icid)
> +{
> +    uint64_t cmd[4];
> +
> +    cmd[0] =3D GITS_CMD_MOVI | ((uint64_t)deviceid << 32);
> +    cmd[1] =3D eventid;
> +    cmd[2] =3D icid;
> +    cmd[3] =3D 0x00;
> +
> +    return its_send_command(its, cmd);
> +}
> +
>  /* Set up the (1:1) collection mapping for the given host CPU. */
>  int gicv3_its_setup_collection(unsigned int cpu)
>  {
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 1cb3169b72..fb80038f17 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -2096,6 +2096,7 @@ static void __init gicv4_init(void)
>
>      gicv4_its_vpeid_allocator_init();
>
> +    gicv4_init_vpe_proxy();

This call ignores errors from gicv4_init_vpe_proxy(). If it returns an erro=
r
code, please handle it (propagate up, or at least log and bail out) to avoi=
d
continuing with a partially initialized proxy.

>  }
>  #else
>  static void __init gicv4_init(void)
> diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
> index 0462976b93..83ee0510ac 100644
> --- a/xen/arch/arm/gic-v4-its.c
> +++ b/xen/arch/arm/gic-v4-its.c
> @@ -39,6 +39,13 @@ static spinlock_t vpeid_alloc_lock =3D SPIN_LOCK_UNLOC=
KED;
>  static uint16_t vmovp_seq_num;
>  static spinlock_t vmovp_lock =3D SPIN_LOCK_UNLOCKED;
>
> +static struct {
> +    spinlock_t lock;
> +    struct its_device *dev;
> +    struct its_vpe **vpes;
> +    int next_victim;
> +} vpe_proxy;
> +
>  void __init gicv4_its_vpeid_allocator_init(void)
>  {
>      /* Allocate space for vpeid_mask based on MAX_VPEID */
> @@ -201,6 +208,124 @@ static int its_map_vpe(struct host_its *its, struct=
 its_vpe *vpe)
>
>      return 0;
>  }
> +static int gicv4_vpe_db_proxy_unmap_locked(struct its_vpe *vpe)
> +{
> +    int ret;
> +
> +    /* Already unmapped? */
> +    if ( vpe->vpe_proxy_event =3D=3D -1 )
> +        return 0;
> +
> +    ret =3D its_send_cmd_discard(vpe_proxy.dev->hw_its, vpe_proxy.dev,
> +                               vpe->vpe_proxy_event);
> +    if ( ret )
> +        return ret;
> +    vpe_proxy.vpes[vpe->vpe_proxy_event] =3D NULL;
> +
> +    /*
> +     * We don't track empty slots at all, so let's move the
> +     * next_victim pointer to quickly reuse the unmapped slot
> +     */
> +    if ( vpe_proxy.vpes[vpe_proxy.next_victim] )
> +        vpe_proxy.next_victim =3D vpe->vpe_proxy_event;
> +
> +    vpe->vpe_proxy_event =3D -1;
> +
> +    return 0;
> +}
> +
> +static void gicv4_vpe_db_proxy_unmap(struct its_vpe *vpe)
> +{
> +    if ( !gic_support_directLPI() )
> +    {
> +        unsigned long flags;
> +
> +        spin_lock_irqsave(&vpe_proxy.lock, flags);
> +        gicv4_vpe_db_proxy_unmap_locked(vpe);

Both return values are ignored. If map_locked() fails and leaves
vpe_proxy_event at the sentinel value, INV may use an invalid eventid.
At minimum: check map_locked() and INV return codes and avoid issuing
INV on failure.

> +        spin_unlock_irqrestore(&vpe_proxy.lock, flags);
> +    }
> +}
> +
> +/*
> + * If a GICv4.0 doesn't implement Direct LPIs (which is extremely
> + * likely), the only way to perform an invalidate is to use a fake
> + * device to issue an INV command, implying that the LPI has first
> + * been mapped to some event on that device. Since this is not exactly
> + * cheap, we try to keep that mapping around as long as possible, and
> + * only issue an UNMAP if we're short on available slots.
> + *
> + * GICv4.1 mandates that we're able to invalidate by writing to a
> + * MMIO register. And most of the time, we don't even have to invalidate
> + * vPE doorbell, as the redistributor can be told whether to generate a
> + * doorbell or not.
> + */
> +static int gicv4_vpe_db_proxy_map_locked(struct its_vpe *vpe)
> +{
> +    int ret;
> +
> +    /* Already mapped? */
> +    if ( vpe->vpe_proxy_event !=3D -1 )
> +        return 0;
> +
> +    /* This slot was already allocated. Kick the other VPE out. */
> +    if ( vpe_proxy.vpes[vpe_proxy.next_victim] )
> +    {
> +        struct its_vpe *old_vpe =3D vpe_proxy.vpes[vpe_proxy.next_victim=
];
> +
> +        ret =3D gicv4_vpe_db_proxy_unmap_locked(old_vpe);
> +        if ( ret )
> +            return ret;
> +    }
> +
> +    /* Map the new VPE instead */
> +    vpe_proxy.vpes[vpe_proxy.next_victim] =3D vpe;
> +    vpe->vpe_proxy_event =3D vpe_proxy.next_victim;
> +    vpe_proxy.next_victim =3D (vpe_proxy.next_victim + 1) %
> +                            vpe_proxy.dev->eventids;
> +
> +    return its_send_cmd_mapti(vpe_proxy.dev->hw_its, vpe_proxy.dev->host=
_devid,

The software state is committed before MAPTI completes. If MAPTI
fails, the vpe stays "mapped" in SW (and next_victim advances), but HW
doesn't have the translation. I think this needs rollback on failure
(or update state only after MAPTI succeeds).

> +                              vpe->vpe_proxy_event, vpe->vpe_db_lpi,
> +                              vpe->col_idx);
> +}
> +
> +int __init gicv4_init_vpe_proxy(void)
> +{
> +    struct host_its *hw_its;
> +    uint32_t devid;
> +
> +    if ( gic_support_directLPI() )
> +    {
> +        printk("ITS: Using DirectLPI for GICv4 VPE invalidation\n");
> +        return 0;
> +    }
> +
> +    /* Any ITS will do, even if not v4 */
> +    hw_its =3D list_first_entry(&host_its_list, struct host_its, entry);

host_its_list may be empty here. list_first_entry() is unsafe in that
case please use list_first_entry_or_null() (or check list_empty()) and
handle the NULL/empty case

> +
> +    vpe_proxy.vpes =3D xzalloc_array(struct its_vpe *, nr_cpu_ids);
> +    if ( !vpe_proxy.vpes )
> +    {
> +        printk(XENLOG_ERR "ITS: Can't allocate GICv4 VPE proxy device ar=
ray\n");
> +        return -ENOMEM;
> +    }
> +
> +    /* Use the last possible DevID */
> +    devid =3D BIT(hw_its->devid_bits, UL) - 1;

This "pick the last DevID" policy looks fragile: it can collide with
other Xen ITS users if they ever end up allocating across the full
DevID space.

> +    vpe_proxy.dev =3D its_create_device(hw_its, devid, nr_cpu_ids);
> +    if ( !vpe_proxy.dev )
> +    {
> +        printk(XENLOG_ERR "ITS: Can't allocate GICv4 VPE proxy device\n"=
);

vpe_proxy.vpes is leaked when vpe_proxy.dev allocation fails

> +        return -ENOMEM;
> +    }
> +
> +    spin_lock_init(&vpe_proxy.lock);
> +    vpe_proxy.next_victim =3D 0;
> +    printk(XENLOG_INFO
> +           "ITS: Allocated DevID %u as GICv4 VPE proxy device\n", devid)=
;
> +
> +    return 0;
> +}
> +
>  static int __init its_vpe_init(struct its_vpe *vpe)
>  {
>      int vpe_id, rc =3D -ENOMEM;
> @@ -224,6 +349,7 @@ static int __init its_vpe_init(struct its_vpe *vpe)
>      rwlock_init(&vpe->lock);
>      vpe->vpe_id =3D vpe_id;
>      vpe->vpendtable =3D page_to_virt(vpendtable);
> +        vpe->vpe_proxy_event =3D -1;
>      /*
>       * We eagerly inform all the v4 ITS and map vPE to the first
>       * possible CPU
> @@ -299,16 +425,45 @@ static int its_send_cmd_vmovp(struct its_vpe *vpe)
>      return 0;
>  }
>
> +/* GICR_SYNCR.Busy =3D=3D 1 until the invalidation completes. */
> +static void wait_for_syncr(void __iomem *rdbase)
> +{
> +    while ( readl_relaxed(rdbase + GICR_SYNCR) & 1 )
> +        cpu_relax();

This is an unbounded busy-wait. If SYNCR.Busy gets stuck (or RDbase is
wrong), Xen can hang. It likely needs a timeout + error path (similar
to other GIC polling loops).

> +}
> +
> +void direct_lpi_inv(struct its_device *dev, uint32_t eventid,

nit: dev and eventid is unused

> +                    uint32_t db_lpi, unsigned int cpu)
> +{
> +    void __iomem *rdbase;
> +    uint64_t val;
> +    /* Register-based LPI invalidation for DB on GICv4.0 */
> +    val =3D FIELD_PREP(GICR_INVLPIR_INTID, db_lpi);
> +
> +    rdbase =3D per_cpu(rbase, cpu);
> +    writeq_relaxed(val, rdbase + GICR_INVLPIR);

direct_lpi_inv() writes GICR_INVLPIR unconditionally.

Note that writing GICR_INVLPIR/GICR_INVALLR while GICR_SYNCR.Busy=3D=3D1
is CONSTRAINED UNPREDICTABLE (the write may be ignored, or the
invalidate may be performed). So we need to ensure Busy=3D=3D0 before
issuing a new invalidate, not only wait after the write.

Please add a pre-check loop (or serialize callers) to guarantee
GICR_SYNCR.Busy=3D=3D0 before the INVLPIR write.

proxy lock protects only the ITS proxy path; direct INVLPIR must also
avoid writes while GICR_SYNCR.Busy=3D=3D1 (pre-check or separate lock)

> +    wait_for_syncr(rdbase);
> +}
>
>  static void its_vpe_send_inv_db(struct its_vpe *vpe)
>  {
> -    // struct its_device *dev =3D vpe_proxy.dev;
> -    // unsigned long flags;
> +    if ( gic_support_directLPI() )
> +    {
> +        unsigned int cpu =3D vpe->col_idx;

We read vpe->col_idx without the vpe lock. Should we use
vpe_to_cpuid_lock() (or otherwise hold vpe_lock) to avoid a
race with affinity updates?

>
> -    // spin_lock_irqsave(&vpe_proxy.lock, flags);
> -    // gicv4_vpe_db_proxy_map_locked(vpe);
> -    // its_send_cmd_inv(dev->hw_its, dev->host_devid, vpe->vpe_proxy_eve=
nt);
> -    // spin_unlock_irqrestore(&vpe_proxy.lock, flags);
> +        /* Target the redistributor this VPE is currently known on */
> +        direct_lpi_inv(NULL, 0, vpe->vpe_db_lpi, cpu);

I think we should document the ordering constraint at the point where
we select between direct_lpi_inv() and the ITS/proxy invalidation path
(its_vpe_send_inv_db()).

The architecture requires register-based invalidation (GICR_INVLPIR /
GICR_INVALLR + polling GICR_SYNCR.Busy) to be serialized against any
ITS command that affects the same interrupt. Overlapping these
operations is CONSTRAINED UNPREDICTABLE.

> +    }
> +    else
> +    {
> +        struct its_device *dev =3D vpe_proxy.dev;
> +        unsigned long flags;
> +
> +        spin_lock_irqsave(&vpe_proxy.lock, flags);
> +        gicv4_vpe_db_proxy_map_locked(vpe);
> +        its_send_cmd_inv(dev->hw_its, dev->host_devid, vpe->vpe_proxy_ev=
ent);

Both return values are ignored. If map_locked() fails and leaves
vpe_proxy_event at the sentinel value, INV may use an invalid eventid.
At minimum: check map_locked() and INV return codes and avoid issuing
INV on failure.

Need to review and handle errors in other places too.

> +        spin_unlock_irqrestore(&vpe_proxy.lock, flags);
> +    }
>  }
>
>  static void its_vpe_inv_db(struct its_vpe *vpe)
> @@ -335,6 +490,7 @@ static void __init its_vpe_teardown(struct its_vpe *v=
pe)
>      unsigned int order;
>
>      order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (u=
nsigned long)SZ_64K));
> +    gicv4_vpe_db_proxy_unmap(vpe);
>      its_free_vpeid(vpe->vpe_id);
>      free_xenheap_pages(vpe->vpendtable, order);
>      xfree(vpe);
> @@ -830,6 +986,43 @@ static void vpe_to_cpuid_unlock(struct its_vpe *vpe,=
 unsigned long *flags)
>      spin_unlock_irqrestore(&vpe->vpe_lock, *flags);
>  }
>
> +static void gicv4_vpe_db_proxy_move(struct its_vpe *vpe, unsigned int fr=
om,
> +                                    unsigned int to)
> +{
> +    unsigned long flags;
> +
> +    if ( gic_support_directLPI() )
> +    {
> +        void __iomem *rdbase;
> +
> +        rdbase =3D per_cpu(rbase, from);
> +        /* Clear potential pending state on the old redistributor */
> +        writeq_relaxed(vpe->vpe_db_lpi, rdbase + GICR_CLRLPIR);
> +        wait_for_syncr(rdbase);
> +        return;
> +    }
> +
> +    spin_lock_irqsave(&vpe_proxy.lock, flags);
> +
> +    gicv4_vpe_db_proxy_map_locked(vpe);
> +
> +    /* MOVI instructs the appropriate Redistributor to move the pending =
state */
> +    its_send_cmd_movi(vpe_proxy.dev->hw_its, vpe_proxy.dev->host_devid,
> +                      vpe->vpe_proxy_event, to);

handle ret from its_send_cmd_movi


> +
> +    /*
> +     * ARM spec says that If, after using MOVI to move an interrupt from
> +     * collection A to collection B, software moves the same interrupt a=
gain
> +     * from collection B to collection C, a SYNC command must be used be=
fore
> +     * the second MOVI for the Redistributor associated with collection =
A to
> +     * ensure correct behavior.
> +     * So each time we issue VMOVI, we VSYNC the old VPE for good measur=
e.
> +     */
> +    WARN_ON(its_send_cmd_sync(vpe_proxy.dev->hw_its, from));
> +
> +    spin_unlock_irqrestore(&vpe_proxy.lock, flags);
> +}
> +
>  static int gicv4_vpe_set_affinity(struct vcpu *vcpu)
>  {
>      struct its_vpe *vpe =3D vcpu->arch.vgic.its_vpe;
> @@ -859,6 +1052,7 @@ static int gicv4_vpe_set_affinity(struct vcpu *vcpu)
>      ret =3D its_send_cmd_vmovp(vpe);
>      if ( ret )
>          goto out;
> +    gicv4_vpe_db_proxy_move(vpe, from, to);
>
>   out:
>      vpe_to_cpuid_unlock(vpe, &flags);
> @@ -940,4 +1134,3 @@ int its_vlpi_prop_update(struct pending_irq *pirq, u=
int8_t property,
>
>      return its_vlpi_set_doorbell(map, property & LPI_PROP_ENABLED);
>  }
> -
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index 0db75309cf..b4d50516ef 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -20,6 +20,13 @@
>
>  #include <xen/sizes.h>
>
> +#ifndef FIELD_GET
> +#define FIELD_GET(_mask, _reg)                 \
> +       ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
> +#endif
> +
> +#define FIELD_PREP(_mask, _val)                        \
> +       (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))

Guard this macro too, it can be redefined

>  /*
>   * Additional registers defined in GIC v3.
>   * Common GICD registers are defined in gic.h
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include=
/asm/gic_v3_its.h
> index dababe97cd..0e82625840 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -236,6 +236,11 @@ int its_inv_lpi(struct host_its *its, struct its_dev=
ice *dev,
>                  uint32_t eventid, unsigned int cpu);
>  int its_send_cmd_mapti(struct host_its *its, uint32_t deviceid,
>                         uint32_t eventid, uint32_t pintid, uint16_t icid)=
;
> +struct its_device *its_create_device(struct host_its *hw_its,
> +                                     uint32_t host_devid, uint64_t nr_ev=
ents);
> +int its_send_cmd_movi(struct host_its *its, uint32_t deviceid, uint32_t =
eventid,
> +                      uint16_t icid);
> +int its_send_cmd_sync(struct host_its *its, unsigned int cpu);
>  #ifdef CONFIG_ACPI
>  unsigned long gicv3_its_make_hwdom_madt(const struct domain *d,
>                                          void *base_ptr);
> @@ -326,6 +331,8 @@ void its_vpe_mask_db(struct its_vpe *vpe);
>  int gicv4_its_vlpi_unmap(struct pending_irq *pirq);
>  int its_vlpi_prop_update(struct pending_irq *pirq, uint8_t property,
>                           bool needs_inv);
> +void direct_lpi_inv(struct its_device *dev, uint32_t eventid,
> +                    uint32_t db_lpi, unsigned int cpu);
>
>  /* ITS quirks handling. */
>  uint64_t gicv3_its_get_cacheability(void);
> diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include=
/asm/gic_v4_its.h
> index 37b6b92f0c..1d800fdbaf 100644
> --- a/xen/arch/arm/include/asm/gic_v4_its.h
> +++ b/xen/arch/arm/include/asm/gic_v4_its.h
> @@ -52,6 +52,7 @@ struct event_vlpi_map {
>  };
>
>  void gicv4_its_vpeid_allocator_init(void);
> +int gicv4_init_vpe_proxy(void);
>
>  #define GICR_VPROPBASER                              0x0070
>  #define GICR_VPENDBASER                              0x0078
> @@ -97,6 +98,10 @@ static inline void gits_write_vpendbaser(uint64_t val,=
 void __iomem *addr)
>  }
>  #define gits_read_vpendbaser(c)     readq_relaxed(c)
>
> +#define GICR_INVLPIR_INTID                GENMASK_ULL(31, 0)
> +#define GICR_INVLPIR_VPEID                GICR_INVALLR_VPEID
> +#define GICR_INVLPIR_V                    GICR_INVALLR_V

GICR_INVALLR_VPEID and GICR_INVALLR_V are not defined, so this does
not build as-is.

Also note that the V/VPEID fields in GICR_INVLPIR/INVALLR exist only
for GICv4.1 (FEAT_GICv4p1). For GICv4.0 these bits are RES0.


Best regards,
Mykola

> +
>  #endif
>
>  /*
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 9ef667decb..558f81818c 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -407,9 +407,11 @@ extern void vgic_check_inflight_irqs_pending(struct =
vcpu *v,
>
>  /* GICV4 functions */
>  #ifdef CONFIG_GICV4
> +bool gic_support_directLPI(void);
>  bool gic_support_vptValidDirty(void);
>  bool gic_is_gicv4(void);
>  #else
> +#define gic_support_directLPI() (false)
>  #define gic_support_vptValidDirty() (false)
>  #define gic_is_gicv4() (false)
>  #endif
> --
> 2.51.2

