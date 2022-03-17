Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716044DCE6E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 20:03:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291724.495369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUvOY-0006mQ-2H; Thu, 17 Mar 2022 19:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291724.495369; Thu, 17 Mar 2022 19:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUvOX-0006jE-VQ; Thu, 17 Mar 2022 19:02:45 +0000
Received: by outflank-mailman (input) for mailman id 291724;
 Thu, 17 Mar 2022 19:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZpy=T4=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nUvOV-0006j5-Kv
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 19:02:43 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2029677-a624-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 20:02:41 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id w7so10587506lfd.6
 for <xen-devel@lists.xenproject.org>; Thu, 17 Mar 2022 12:02:41 -0700 (PDT)
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
X-Inumbo-ID: d2029677-a624-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PAUhVyB8VVVigytkv4cb4GXKo7bmMF1X/nGv3QUnFFo=;
        b=fM+MDAuw4i8VUg1o5ap+qH7DdfuA07F0bkqlXz/8NOXa2GtvoaN9gKmgnuCQA2nVKh
         S1idokh90lcRwkoaIC9tFuxI3hg/idlW7qFq3Yms8FHP8IvdqKWRFY/Wx2UWEvznoqIL
         MYejvPNylWNLXvOQSTDV6LlbSBaF1bVIuWoZ7w8VNVdL+0XJoBPNpcsqmJVxShW+l800
         vR4b68tbF1U45yfbzfMlXnjVnaFwglm/zTTq3CjCyqWVO6cktBFVZSVMs1a5O2I1k6Gf
         Pp/mRIQyIWKShaz+Ad4Ky5kvC5ISK5/Bn/vPuNBSXvSNaxwdv9vpIiB70fJo8JHQZg/L
         KQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PAUhVyB8VVVigytkv4cb4GXKo7bmMF1X/nGv3QUnFFo=;
        b=xFcpndzmCoPxSyH7kgDVr/b67WeeBfAVQO1eS+YkNTYjjrulnvvGnjYMLffYvZefXB
         BCV+vwEZIbwY1PS4af/p/Wlm6PsKmpn16HUN9ZJgbK9uzzU+98LUfaLZCfwPYhaKozCN
         Y7JaT+380pu5nufP7Mjk7wW1eeOgsKAGQNa+6hszrER7bFM/HCQIEb1gdWBM1FvPNEOh
         AMD50RmQEHE1LZ2Ay5LK8igSAclLRI+1mJVc547IAHSM3GxNOS5Ts0CQKQdfLrdOh1YT
         vgfRLCicnU5zf6pjtZVjpniEvXKuRHHi4nHLpN0kS5j2yi37d2isxML0TyYcqeoaJYsJ
         fKpg==
X-Gm-Message-State: AOAM533tAxrP6a7F0ZXj4+FMRpt2rnjtiz8eAzW4jWkSZLjQPMfael0T
	b17HTw45WgZQy6AabUpBD9wUdHGrz46CwYqLSEd9/yc1s90=
X-Google-Smtp-Source: ABdhPJypN1KpXNlKcSOV95yZ/JUQYMQyOS1zBt+/bZQ6OfXXscl9tiC4lpfazQu6Xlab8HpvzObICr0sDEwtMPZBazk=
X-Received: by 2002:a19:6a0e:0:b0:443:3b15:4345 with SMTP id
 u14-20020a196a0e000000b004433b154345mr3815880lfu.388.1647543760223; Thu, 17
 Mar 2022 12:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpvk1zX3ZtzSOWBCasZOuS607-W_iqHbC=ZgTBQqo+btjA@mail.gmail.com>
 <ab5a7aea-cab1-f9d9-e3cc-58636c234a4e@citrix.com>
In-Reply-To: <ab5a7aea-cab1-f9d9-e3cc-58636c234a4e@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 17 Mar 2022 15:02:28 -0400
Message-ID: <CAKf6xpuqzJ+YE9crAJCJCCaZRZRYkZ5snsOOLP8Yjc4Nyx=9=A@mail.gmail.com>
Subject: Re: Nonsensical XSM Flask denial
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 2:14 PM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>
> On 17/03/2022 17:52, Jason Andryuk wrote:
> > I shut down a domU (HVM dom9 w/ Linux stubdom dom10) with a single PCI
> > device assigned.  Xen logged the following Flask denial for a second
> > PVH dom5 (uivm) without any PCI devices assigned.  This is Xen 4.14.4.
> >
> > (XEN) avc:  denied  { remove_irq } for domid=5 irq=17
> > scontext=system_u:system_r:uivm_t
> > tcontext=system_u:object_r:shared_irq_t tclass=resource
> >
> > Domain 5 as uivm_t and irq 17 as shared_irq_t both look correct.  But
> > it doesn't make sense that uivm would make a hypercall for an irq.
> >
> > Could this be from RCU calling complete_domain_destroy() when current
> > is dom5 (uivm)?  What would current be set to when RCU runs its
> > callbacks?
>
> RCU runs in softirq context, so yes - (almost) any use of current would
> be bogus.
>
> But I can't spot any overlap between the physdevop_unmap_pirq XSM check,
> and complete_domain_destroy().
>
> Any chance you can reproduce this with a WARN() in the AVC denied path,
> so we can see what's going on here?

The path I found reading is:
complete_domain_destroy
  arch_domain_destroy
    free_domain_pirqs
      unmap_domain_pirq
        xsm_unmap_domain_irq

After a few tries it triggered:
(XEN) Xen WARN at irq.c:2348
(XEN) ----[ Xen-4.14.4-xc  x86_64  debug=n   Not tainted ]----
(XEN) CPU:    4
(XEN) RIP:    e008:[<ffff82d0403115d4>] unmap_domain_pirq+0x3c4/0x490
...
(XEN) Xen call trace:
(XEN)    [<ffff82d0403115d4>] R unmap_domain_pirq+0x3c4/0x490
(XEN)    [<ffff82d04022ac52>] S xmem_pool_free+0x22/0x2f0
(XEN)    [<ffff82d0403116f1>] S free_domain_pirqs+0x51/0x70
(XEN)    [<ffff82d040301615>] S arch_domain_destroy+0x45/0xb0
(XEN)    [<ffff82d040208391>] S domain.c#complete_domain_destroy+0x81/0x150
(XEN)    [<ffff82d040221dc4>] S rcupdate.c#rcu_process_callbacks+0x114/0x2b0
(XEN)    [<ffff82d04022244a>] S softirq.c#__do_softirq+0x5a/0xa0
(XEN)    [<ffff82d04029890b>] S vmx_asm_do_vmentry+0x2b/0x30

I found the XSM checks a little confusing.

physdevop_unmap_pirq() calls:
  xsm_unmap_domain_pirq() <- checks generic resource remove
  unmap_domain_pirq()
    xsm_unmap_domain_irq() <- checks remove_irq for the specific irq

access_vectors lists physdevop_unmap_pirq as remove_irq, but the xsm
check in the function is xsm_unmap_domain_pirq, which doesn't use
remove_irq.

In an earlier Xen version, these RCU callbacks may have run as xen_t?
Or maybe it's just racy which context is used?  commit
8ad651705cbd0ad192398c1513d12c02b3197fa1 had:

    2. When a domain is destroyed with a device passthrough active, the
    calls to remove_{irq,ioport,iomem} can be made by the hypervisor itself
    (which results in an XSM check with the source xen_t).  It does not make
    sense to deny these permissions; no domain should be using xen_t, and
    forbidding the hypervisor from performing cleanup is not useful.

+# Domain destruction can result in some access checks for actions performed by
+# the hypervisor.  These should always be allowed.
+allow xen_t resource_type : resource { remove_irq remove_ioport remove_iomem };

Thanks,
Jason

