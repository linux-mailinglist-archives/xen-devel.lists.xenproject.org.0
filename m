Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31779731AC7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 16:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549616.858235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9nan-0004XY-3y; Thu, 15 Jun 2023 14:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549616.858235; Thu, 15 Jun 2023 14:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9nan-0004Vg-1C; Thu, 15 Jun 2023 14:04:53 +0000
Received: by outflank-mailman (input) for mailman id 549616;
 Thu, 15 Jun 2023 14:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Djv=CD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9nal-0004Va-Ho
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 14:04:51 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 964ccb31-0b85-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 16:04:47 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51480d3e161so11645460a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 07:04:47 -0700 (PDT)
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
X-Inumbo-ID: 964ccb31-0b85-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686837887; x=1689429887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxnY0aK7SzkApStiLsuE2St3iDQaPT3SpvYKIOPYDHM=;
        b=dKY9IUMg5OrDyvek2D9RfqctTKv51JRz8LOQd28qO97cuitZ1y2GBC0giqxnMMZFLz
         o/uq8THymLJcH1u4wxRp5GEsVEvp1jeZ1pfIZ++4DiQpNZKnZAiy/QdY9mf8RwPrUcHf
         xljFGZf8MPsdJbOYTw1sGJEjwudBi1zyF5O519+zWSHUJPMe+n1P1yoquKSAHYKkV1T4
         rmXM2Sgr0IVFSUoqo82KgBBYpDemJeZqjyX1Uf76yDtFFvTzg8eCWcRYSP5glV7hKZsG
         5uP6L3Si8sIGqlLzKWjA33PJpsKHCl1W9sdT+IpdE4wYYQe7QC7ohxyiYuKTL66O6OD7
         1TIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686837887; x=1689429887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxnY0aK7SzkApStiLsuE2St3iDQaPT3SpvYKIOPYDHM=;
        b=CHt+zP7BE9nw8ki0I47CVTCEzcEZF0ZiO6AuaOoJrYSrXJ/ELIo8u2i4CmZPtSIPnZ
         GRwZnEuk2dateBkwtw0/wyGpYBXHgk1nQ7ubeWdTEKuAeGVqn3I4mxof2O/5ALVsJPxe
         ymvEidPj1lZkSH3B5woIKCvx9hv7fC2Fsc6GdqgXdohvklOyvZivjGJRq3zqbZwEPgft
         +cmnoRlZCkNjg9hSUHSJZmeCeSZsQvnvmIfMkKGmQVQP+NncUpah0rwkgWXGumQJTEg1
         Q7+W+0MfECiDrJUSSATYgIFSEnCpEbjplQXCVupCf0GVc40wkAvco6kyrHphhcfuDGOw
         IAWA==
X-Gm-Message-State: AC+VfDwosjp9qUAipZPTg+2tKC4WJX9a9DWo4o2WFHWSMznF1fiFAY4l
	TPRYv4esVBBNNCwCYzk3ZTdZuH6e2QHl9lbLsyUWH5ahywc=
X-Google-Smtp-Source: ACHHUZ6tSSqBieXweBWcdg1hx6BpGXBTq4Cy495u6TYXRY/U2LeMl3lNxlrdebVuYLjEpC3IdQbLAZphh5IyPyHUCFo=
X-Received: by 2002:aa7:da0d:0:b0:514:666b:1e04 with SMTP id
 r13-20020aa7da0d000000b00514666b1e04mr12081192eds.35.1686837886927; Thu, 15
 Jun 2023 07:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230614180253.89958-1-jandryuk@gmail.com> <20230614180253.89958-2-jandryuk@gmail.com>
 <71c1d8cd-8777-e913-5a9d-93696dad3740@suse.com>
In-Reply-To: <71c1d8cd-8777-e913-5a9d-93696dad3740@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 15 Jun 2023 10:04:34 -0400
Message-ID: <CAKf6xpsWrOer0Unq3oaOs5+AtPOyGvWJqUYkN+h_2FAn_KuTkg@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] cpufreq: Allow restricting to internal governors only
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 9:21=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 14.06.2023 20:02, Jason Andryuk wrote:
> > @@ -121,6 +122,12 @@ int __init cpufreq_register_governor(struct cpufre=
q_governor *governor)
> >      if (!governor)
> >          return -EINVAL;
> >
> > +    if (cpufreq_governor_internal && !governor->internal)
> > +        return -EINVAL;
> > +
> > +    if (!cpufreq_governor_internal && governor->internal)
> > +        return -EINVAL;
>
> First just a nit: Why not simply
>
>     if (cpufreq_governor_internal !=3D governor->internal)
>         return -EINVAL;
>
> ?

Yes, that would work.

> Yet then I find this approach a little odd anyway. I think the
> registration attempts would better be suppressed, thus also not
> resulting in (apparently) failed init-calls. Especially for the
> userspace governor this would then also mean / allow to avoid
> registering of the CPU notifier.

So are you suggesting that each caller check cpufreq_governor_internal
and potentially skip calling cpufreq_register_governor()?  e.g. the
start of cpufreq_gov_userspace_init() would gain:

    if (cpufreq_governor_internal)
        return 0

?

I put the check in cpufreq_register_governor() since then it is
handled in a single place instead of being spread around.

To leave the check in cpufreq_register_governor(),
cpufreq_gov_userspace_init() could be rearranged to call
cpufreq_register_governor() first and only call
register_cpu_notifier() on success?

Or do you want the whole governor registration to be re-worked to be
more explicit?  Remove initcalls and have governors registered
according to the cpufreq driver?

Regards,
Jason

