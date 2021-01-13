Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B14E2F54E4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 23:25:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66783.118765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzoZI-0008Kn-B0; Wed, 13 Jan 2021 22:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66783.118765; Wed, 13 Jan 2021 22:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzoZI-0008KO-80; Wed, 13 Jan 2021 22:24:44 +0000
Received: by outflank-mailman (input) for mailman id 66783;
 Wed, 13 Jan 2021 22:24:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7D6C=GQ=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1kzoZG-0008KF-PI
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 22:24:42 +0000
Received: from mail-oo1-xc2e.google.com (unknown [2607:f8b0:4864:20::c2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2caa46a5-b4f4-4b23-ae8e-abe578bfa04f;
 Wed, 13 Jan 2021 22:24:41 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id j21so912175oou.11
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 14:24:41 -0800 (PST)
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
X-Inumbo-ID: 2caa46a5-b4f4-4b23-ae8e-abe578bfa04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oCO4innn23xnqkRrin6A8QlVKqbv6O0sIqWlO9vm52s=;
        b=rVGj2AAD+A+0BjRWncrGKrvHpUY49WgJIE8jZw1xgt1vw9PljGVghw5PfUUDb+4+k8
         HxjWoTi5MXh3u5JZrgrDOaE/REH8dkZtHNvawCnL1Kmm1LP/nQbXHmoyegccFbxwhy14
         4K82Q3Q1/wOITVDQ+cQ2aIWlxPVyp2e/C4ctS4gHnKkTRF0EMb0HNdmTpeE8BoD/bTaH
         FrGofCV4jxhZAz1fr2rzJrYRhHoFQrbP5U/BmXuOoqJaa8I9yKmQBgwTk/5cvP3LdiYi
         0KyMOLNAko3QXb5nFjdM8H/8O3eCYxZEbosfNlbi2M38Z3fuj+mcDqljeQLcT6nhKpau
         GDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oCO4innn23xnqkRrin6A8QlVKqbv6O0sIqWlO9vm52s=;
        b=kcINXTd4p77cvrtWFf3LoWz8P+H04B7FsRm3xW1Bu0kQjzJfVSYr2k02iUw30ASpRJ
         phxKeh1ColMK034oRm7Q97LB0lFWwI8ZY561XC/ex+ftu0a969V79wCEEsM9BuHmmliC
         XUwhKs18C4VUOP1cUpwyAGhY1UFMXRVlWZ1nYmlBh3FxxM6aW2oQi7Jbhb8ZGvQFi80y
         jqvDwyacqyFxYbFFwAhGTtJXRJs8Rpd4jHg3OH8KhwEgnoQNFragsX9x/6dXEOul1775
         001ytM3ipMm8w9WJZFUEFX2x6gzB9+liDIg7vwUvP6V14pKfKBUkSi+ntzwzqpLngY44
         28zA==
X-Gm-Message-State: AOAM533z26bp3OeJPPrvx/ByoxJ6THKTbYv2fhkWgeXluS5ZNy26h1BD
	TS/jp8YxhW96lOtWb+I/ecPA3NvRb4aphlG7x0o=
X-Google-Smtp-Source: ABdhPJziRVwVdN/P4qqVOYk8kvLZrNk5Lmj/e+UOq7vDrh3l1ll/zEjvtizF7QLifKBB+0vJ1d4qUMx/YOxke2hbem0=
X-Received: by 2002:a4a:d396:: with SMTP id i22mr2704177oos.55.1610576681218;
 Wed, 13 Jan 2021 14:24:41 -0800 (PST)
MIME-Version: 1.0
References: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com> <1d565881-d3d7-2a25-326a-61c7bb640f3a@suse.com>
In-Reply-To: <1d565881-d3d7-2a25-326a-61c7bb640f3a@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 13 Jan 2021 14:24:29 -0800
Message-ID: <CACMJ4Gboawb-4N8H1Yv7PAFddyM2C4ZMEp0Bk9KXM7krK6UcSw@mail.gmail.com>
Subject: Re: [PATCH 3/5] argo: don't pointlessly use get_domain_by_id()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 5, 2021 at 5:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> For short-lived references rcu_lock_domain_by_id() is the better
> (slightly cheaper) alternative.

This should scale better than the existing use of get_domain_by_id.

I actually found it pretty hard to study the code for the effects of
switching over to use the RCU domain reference logic, and I would have
been happier with reviewing if I'd been able to exercise it with some
focused testing; XTF needs support for tests with multiple test VMs to
enable Argo tests of communication and interactions with hypervisor
state.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Christopher Clark <christopher.w.clark@gmail.com>

> ---
> Is it really intentional for fill_ring_data() to return success (0) in
> case the domain can't be found or has argo disabled?

Good question; I think this logic can and should be improved. I will
work on a patch.

> Even if so, the
> uninitialized ent.max_message_size will be leaked to the caller then
> (and similarly when find_ring_info_by_match() returns NULL). Perhaps
> the field should only be copied back when ent.flags is non-zero?

Yes.

thanks,

Christopher

>
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -445,13 +445,13 @@ signal_domain(struct domain *d)
>  static void
>  signal_domid(domid_t domain_id)
>  {
> -    struct domain *d = get_domain_by_id(domain_id);
> +    struct domain *d = rcu_lock_domain_by_id(domain_id);
>
>      if ( !d )
>          return;
>
>      signal_domain(d);
> -    put_domain(d);
> +    rcu_unlock_domain(d);
>  }
>
>  static void
> @@ -983,7 +983,7 @@ ringbuf_insert(const struct domain *d, s
>  static void
>  wildcard_pending_list_remove(domid_t domain_id, struct pending_ent *ent)
>  {
> -    struct domain *d = get_domain_by_id(domain_id);
> +    struct domain *d = rcu_lock_domain_by_id(domain_id);
>
>      if ( !d )
>          return;
> @@ -996,13 +996,13 @@ wildcard_pending_list_remove(domid_t dom
>          list_del(&ent->wildcard_node);
>          spin_unlock(&d->argo->wildcard_L2_lock);
>      }
> -    put_domain(d);
> +    rcu_unlock_domain(d);
>  }
>
>  static void
>  wildcard_pending_list_insert(domid_t domain_id, struct pending_ent *ent)
>  {
> -    struct domain *d = get_domain_by_id(domain_id);
> +    struct domain *d = rcu_lock_domain_by_id(domain_id);
>
>      if ( !d )
>          return;
> @@ -1015,7 +1015,7 @@ wildcard_pending_list_insert(domid_t dom
>          list_add(&ent->wildcard_node, &d->argo->wildcard_pend_list);
>          spin_unlock(&d->argo->wildcard_L2_lock);
>      }
> -    put_domain(d);
> +    rcu_unlock_domain(d);
>  }
>
>  static void
> @@ -1283,7 +1283,7 @@ partner_rings_remove(struct domain *src_
>                                                        struct argo_send_info,
>                                                        node)) )
>          {
> -            struct domain *dst_d = get_domain_by_id(send_info->id.domain_id);
> +            struct domain *dst_d = rcu_lock_domain_by_id(send_info->id.domain_id);
>
>              if ( dst_d && dst_d->argo )
>              {
> @@ -1302,7 +1302,7 @@ partner_rings_remove(struct domain *src_
>                  ASSERT_UNREACHABLE();
>
>              if ( dst_d )
> -                put_domain(dst_d);
> +                rcu_unlock_domain(dst_d);
>
>              list_del(&send_info->node);
>              xfree(send_info);
> @@ -1330,7 +1330,7 @@ fill_ring_data(const struct domain *curr
>
>      ent.flags = 0;
>
> -    dst_d = get_domain_by_id(ent.ring.domain_id);
> +    dst_d = rcu_lock_domain_by_id(ent.ring.domain_id);
>      if ( !dst_d || !dst_d->argo )
>          goto out;
>
> @@ -1340,10 +1340,7 @@ fill_ring_data(const struct domain *curr
>       */
>      ret = xsm_argo_send(currd, dst_d);
>      if ( ret )
> -    {
> -        put_domain(dst_d);
> -        return ret;
> -    }
> +        goto out;
>
>      read_lock(&dst_d->argo->rings_L2_rwlock);
>
> @@ -1405,7 +1402,7 @@ fill_ring_data(const struct domain *curr
>
>   out:
>      if ( dst_d )
> -        put_domain(dst_d);
> +        rcu_unlock_domain(dst_d);
>
>      if ( !ret && (__copy_field_to_guest(data_ent_hnd, &ent, flags) ||
>                    __copy_field_to_guest(data_ent_hnd, &ent, max_message_size)) )
> @@ -1569,7 +1566,7 @@ unregister_ring(struct domain *currd,
>      if ( ring_id.partner_id == XEN_ARGO_DOMID_ANY )
>          goto out;
>
> -    dst_d = get_domain_by_id(ring_id.partner_id);
> +    dst_d = rcu_lock_domain_by_id(ring_id.partner_id);
>      if ( !dst_d || !dst_d->argo )
>      {
>          ASSERT_UNREACHABLE();
> @@ -1592,7 +1589,7 @@ unregister_ring(struct domain *currd,
>      read_unlock(&L1_global_argo_rwlock);
>
>      if ( dst_d )
> -        put_domain(dst_d);
> +        rcu_unlock_domain(dst_d);
>
>      xfree(send_info);
>
> @@ -1663,7 +1660,7 @@ register_ring(struct domain *currd,
>      }
>      else
>      {
> -        dst_d = get_domain_by_id(reg.partner_id);
> +        dst_d = rcu_lock_domain_by_id(reg.partner_id);
>          if ( !dst_d )
>          {
>              argo_dprintk("!dst_d, ESRCH\n");
> @@ -1845,7 +1842,7 @@ register_ring(struct domain *currd,
>
>   out:
>      if ( dst_d )
> -        put_domain(dst_d);
> +        rcu_unlock_domain(dst_d);
>
>      if ( ret )
>          xfree(send_info);
> @@ -1988,7 +1985,7 @@ sendv(struct domain *src_d, xen_argo_add
>      src_id.domain_id = src_d->domain_id;
>      src_id.partner_id = dst_addr->domain_id;
>
> -    dst_d = get_domain_by_id(dst_addr->domain_id);
> +    dst_d = rcu_lock_domain_by_id(dst_addr->domain_id);
>      if ( !dst_d )
>          return -ESRCH;
>
> @@ -1998,7 +1995,7 @@ sendv(struct domain *src_d, xen_argo_add
>          gprintk(XENLOG_ERR, "argo: XSM REJECTED %i -> %i\n",
>                  src_d->domain_id, dst_d->domain_id);
>
> -        put_domain(dst_d);
> +        rcu_unlock_domain(dst_d);
>
>          return ret;
>      }
> @@ -2068,7 +2065,7 @@ sendv(struct domain *src_d, xen_argo_add
>          signal_domain(dst_d);
>
>      if ( dst_d )
> -        put_domain(dst_d);
> +        rcu_unlock_domain(dst_d);
>
>      return ( ret < 0 ) ? ret : len;
>  }
>

