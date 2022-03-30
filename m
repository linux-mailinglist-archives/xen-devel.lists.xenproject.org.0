Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C824EC416
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 14:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296303.504318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZXT7-0005Yx-PQ; Wed, 30 Mar 2022 12:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296303.504318; Wed, 30 Mar 2022 12:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZXT7-0005WH-ME; Wed, 30 Mar 2022 12:30:33 +0000
Received: by outflank-mailman (input) for mailman id 296303;
 Wed, 30 Mar 2022 12:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjcS=UJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZXT6-0005WB-LZ
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 12:30:32 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30943e81-b025-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 14:30:31 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id k21so35525276lfe.4
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 05:30:31 -0700 (PDT)
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
X-Inumbo-ID: 30943e81-b025-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YmOTBJmJMJCRQFY61NbiFcHKoqhfmSCI5hmcPcWeNM4=;
        b=iGvyBVtdUwMSXD7DxuirThgqqGv8ZhpQS/jIY//w4jz4jnvsy7nHht4CPCORi8q6QN
         JYiMEoRu6c2liUkWUYyrjt1Rd9xzyurnL1rZVDz8D+c2IulAc9Ai+Anacjtez8A6BqER
         U3Kqerp+bAAtARZS3nb8QKIVVxksPNCC6MLF+CEmXW88myayOthqpi5m1a7NAUuXSsjP
         JNcznoVHUnWvbX1HewnaZbKPSf97nJqlySLaxEttjGWfdhGgGnDG5k+NIW6t/xNFSHNz
         /6DH20FsuSFx5tYX946QlArqGkh5sn2T4KY78+kv4I8mg3BJ8rvLatJOi57YX8DU6vZh
         RYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YmOTBJmJMJCRQFY61NbiFcHKoqhfmSCI5hmcPcWeNM4=;
        b=qw4mU2obIzDrhAYMQuHB1go4wTOcqwF7wGfxWiceF5CZ4DUj1Beg0yBrLdodfWpynX
         impoFwW+8c8+wC/ElkEvmcvYLaNyAsRg4Je+gZsg2llBJLqqJkD/18MVP6i/J7glRXz0
         wInAyPN6NF2KKpyu0hPVmA5Ad/1zv2euhzN+7HNKdKEtqbv6gvs+AG0o+KEweEwDsvIF
         lrrW0Hazw6vK6/He8IJ2GE8xC9iS7KII9obbg8U0pjE+Er0fKVgl3rebuhm7IFbQeOLz
         sbSa+lPxOKWWeQ/9ZRv3EBYog6cGzoB9ppFoh7oI5IpSs/OFYOTu3Up9keNeMS8g8CyE
         Q9xw==
X-Gm-Message-State: AOAM530u4L+xg79TtsquMtxpedq/RL+okIJzYjPN40CRNJIny+1IeCPM
	ie2R2uqJ4OZpb+CBkcpyaN4uZOq3I/UoL9E3k3o=
X-Google-Smtp-Source: ABdhPJysVd5YGoiExi/Y9FNL/piYEIDClyTZzwwFpeUe8wSpHSwpzmugpYzTZUZXpP4IoN8Hn88u3ueZ7QW0J0qh/a8=
X-Received: by 2002:a05:6512:33c2:b0:44a:25e2:25d4 with SMTP id
 d2-20020a05651233c200b0044a25e225d4mr6673674lfg.359.1648643431255; Wed, 30
 Mar 2022 05:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com> <7935e60e-34b1-76be-e5de-56e60f173438@suse.com>
 <a991c32d-4e45-f015-3d99-8552199e8d45@apertussolutions.com> <e711e8c8-5e5d-7443-fbc8-368ccdde533b@suse.com>
In-Reply-To: <e711e8c8-5e5d-7443-fbc8-368ccdde533b@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 30 Mar 2022 08:30:19 -0400
Message-ID: <CAKf6xpt46jFgexwLA=wdUVH-HJWLOEisL6-2cmSLyJsO3QE2eQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Scott Davis <scott.davis@starlab.io>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 2:30 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 29.03.2022 20:57, Daniel P. Smith wrote:
> > On 3/29/22 02:43, Jan Beulich wrote:
> >> Similarly I don't see how things would work transparently with a
> >> Flask policy in place. Regardless of you mentioning the restriction,
> >> I think this wants resolving before the patch can go in.
> >
> > To enable the equivalent in flask would require no hypervisor code
> > changes. Instead that would be handled by adding the necessary rules to
> > the appropriate flask policy file(s).
>
> Of course this can be dealt with by adjusting policy file(s), but until
> people do so they'd end up with a perceived regression and/or unexplained
> difference in behavior from running in dummy (or SILO, once also taken
> care of) mode.

This need to change the Flask policy is the crux of my dislike for
making Xen-internal operations go through XSM checks.  It is wrong,
IMO, to require the separate policy to grant xen_t permissions for
proper operation.  I prefer restructuring the code so Xen itself
doesn't have to go through XSM checks since that way Xen itself always
runs properly regardless of the policy.

This is more based on unmap_domain_pirq having an XSM check for an
internal operation.  dom0less, hyperlaunch, & Live Update may all be
niche use cases where requiring a policy change is reasonable.

Regards,
Jason

