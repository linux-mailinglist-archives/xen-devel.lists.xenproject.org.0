Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445DF4B2CF3
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 19:27:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270615.464958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIach-00064T-9n; Fri, 11 Feb 2022 18:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270615.464958; Fri, 11 Feb 2022 18:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIach-000621-5i; Fri, 11 Feb 2022 18:26:23 +0000
Received: by outflank-mailman (input) for mailman id 270615;
 Fri, 11 Feb 2022 18:26:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tVj4=S2=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1nIacf-00061v-Oi
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 18:26:21 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b19045c-8b68-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 19:26:19 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id e7so20564316ejn.13
 for <xen-devel@lists.xenproject.org>; Fri, 11 Feb 2022 10:26:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a19sm6342921ejt.7.2022.02.11.10.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 10:26:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9F5141FFB7;
 Fri, 11 Feb 2022 18:26:16 +0000 (GMT)
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
X-Inumbo-ID: 1b19045c-8b68-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=BEQerwhm5Wp0S3tjCPAtRdmBeDWl6qB2J4pcBvnrW9s=;
        b=izrxAqKMMH8Rr8pCgmTm2MAVFBdvp+rztTtvm7lXOlc2RqAOtHWy1PSpYohQ1vpq49
         uak8gsSQTQLL7RGXRLgLpKDG0Z7HGuluOvgYpmEl2+WAR4JmuouvkpM7qRA6pXMTs+d9
         lpZumeq3tOnh8YcKpxMRMXpsVx8bGAD6KANpygnZSZrJ+qGS4zcfSTvGTx2fz7BX/drd
         mWEMs+jxAI8qG/XKFFMq0kk/tUMKzMnKflxiha1mvvyjQ3EFTj2+2Z5+oQEcQYnS2hNL
         0xmta6O02h1VxwjtW3hCiG/+ZByUaPaPavBLTX96WAxCSX0LIFiDQPaGIBFhA558r/Xl
         YhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=BEQerwhm5Wp0S3tjCPAtRdmBeDWl6qB2J4pcBvnrW9s=;
        b=pUQpty22QX9pcybVo9XaOVgTIYXNB2JdupqobKrpvfeyJ6Fn7aEkiV88yevnsLCljo
         US+oE+qhBg97bjMiKueU+UlMB96CcBkaUzIpyHz2zN5P5R/QdiaMFX+Cs/QfRU4Hn5Gl
         qvJ281rSzEWX0imVz/R8GOx1janaM7sgXuWDVODijS2FCdU5EjaMkCEOnbLDPK+XgWL+
         Q3nP8fE/HVlNsgaXWIg/xpA0ggBlCYA4dVdYdvhwSaiPAAcRQJJQGJOsiQuX7sKKbqB8
         hyyFdHZWwk4h+NeBIx/hEwHjSli+rT3wKnK2vI19b3GWGufJ9XLNUeCr2myfSEDtZGFP
         uiwQ==
X-Gm-Message-State: AOAM533h/tPxWeSp1NpL2OKcCvW/3mvn1WWep42wE/6CvWMy6RFrWs5F
	zxalEiBuLg9yAgZLn9sBP31oGA==
X-Google-Smtp-Source: ABdhPJznsKIixGZnvshYn8SwxIZ8Rf6/+8SM7aEkKYG5T699wm6BxxHROaBvQIv2s6ireOkVAFpeow==
X-Received: by 2002:a17:907:90d5:: with SMTP id gk21mr2384157ejb.633.1644603978353;
        Fri, 11 Feb 2022 10:26:18 -0800 (PST)
References: <87h79bgd1m.fsf@linaro.org>
 <alpine.DEB.2.22.394.2202071419270.2091381@ubuntu-linux-20-04-desktop>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, xen-devel@lists.xenproject.org, AKASHI
 Takahiro <takahiro.akashi@linaro.org>, Arnd Bergmann
 <arnd.bergmann@linaro.org>, Christopher Clark
 <christopher.w.clark@gmail.com>, Dmytro Firsov <dmytro_firsov@epam.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Oleksandr_Tyshchenko@epam.com,
 Artem_Mygaiev@epam.com, bertrand.marquis@arm.com, Wei.Chen@arm.com,
 Ed.Doxat@arm.com, Oleksii_Moisieiev@epam.com
Subject: Re: Metadata and signalling channels for Zephyr virtio-backends on Xen
Date: Fri, 11 Feb 2022 18:20:30 +0000
In-reply-to: <alpine.DEB.2.22.394.2202071419270.2091381@ubuntu-linux-20-04-desktop>
Message-ID: <87k0e1cl9z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Stefano Stabellini <stefano.stabellini@xilinx.com> writes:

> On Mon, 7 Feb 2022, Alex Benn=C3=A9e wrote:
>> Hi Stefano,
>>=20
>> Vincent gave an update on his virtio-scmi work at the last Stratos sync
>> call and the discussion moved onto next steps.
>
> Hi Alex,
>
> I don't know the specifics of virtio-scmi, but if it is about power,
> clocks, reset, etc. like the original SCMI protocol, then virtio-scmi is
> likely going to be very different from all the other virtio frontends
> and backends. That's because SCMI requires a full view of the system,
> which is different from something like virtio-net that is limited to the
> emulation of 1 device. For this reason, it is likely that the
> virtio-scmi backend would be a better fit in Xen itself, rather than run
> in userspace inside a VM.

That may be a good solution for Xen but I still think it's worthwhile
being able to package SCMI in a VM for other hypervisors. We are just
happening to use Xen as a nice type-1 example.

Vincents SCMI server code is portable anyway and can reside in a Zephyr
app, firmware blob or a userspace vhost-user client.

> FYI, a good and promising approach to handle both SCMI and SCPI is the
> series recently submitted by EPAM to mediate SCMI and SCPI requests in
> Xen: https://marc.info/?l=3Dxen-devel&m=3D163947444032590
>
> (Another "special" virtio backend is virtio-iommu for similar reasons:
> the guest p2m address mappings and also the IOMMU drivers are in Xen.
> It is not immediately clear whether a virtio-iommu backend would need to
> be in Xen or run as a process in dom0/domU.)
>
> On the other hand, for all the other "normal" protocols (e.g.
> virtio-net, virtio-block, etc.) the backend would naturally run as a
> process in dom0 or domU (e.g. QEMU in Dom0) as one would expect.

Can domU's not be given particular access to HW they might want to
tweak? I assume at some point a block device backend needs to actually
talk to real HW to store the blocks (even if in most cases it would be a
kernel doing the HW access on it's behalf).

>> Currently the demo setup
>> is intermediated by a double-ended vhost-user daemon running on the
>> devbox acting as a go between a number of QEMU instances representing
>> the front and back-ends. You can view the architecture with Vincents
>> diagram here:
>>=20
>>   https://docs.google.com/drawings/d/1YSuJUSjEdTi2oEUq4oG4A9pBKSEJTAp6hh=
cHKKhmYHs/edit?usp=3Dsharing
>>=20
>> The key virtq handling is done over the special carve outs of shared
>> memory between the front end and guest. However the signalling is
>> currently over a virtio device on the backend. This is useful for the
>> PoC but obviously in a real system we don't have a hidden POSIX system
>> acting as a go between not to mention the additional latency it causes
>> with all those context switches.
>>=20
>> I was hoping we could get some more of the Xen experts to the next
>> Stratos sync (17th Feb) to go over approaches for a properly hosted on
>> Xen approach. From my recollection (Vincent please correct me if I'm
>> wrong) of last week the issues that need solving are:
>
> Unfortunately I have a regular conflict which prevents me from being
> able to join the Stratos calls. However, I can certainly make myself
> available for one call (unless something unexpected comes up).
>
>
>>  * How to handle configuration steps as FE guests come up
>>=20
>> The SCMI server will be a long running persistent backend because it is
>> managing real HW resources. However the guests may be ephemeral (or just
>> restarted) so we can't just hard-code everything in a DTB. While the
>> virtio-negotiation in the config space covers most things we still need
>> information like where in the guests address space the shared memory
>> lives and at what offset into that the queues are created. As far as I'm
>> aware the canonical source of domain information is XenStore
>> (https://wiki.xenproject.org/wiki/XenStore) but this relies on a Dom0
>> type approach. Is there an alternative for dom0less systems or do we
>> need a dom0-light approach, for example using STR-21 (Ensure Zephyr can
>> run cleanly as a Dom0 guest) providing just enough services for FE's to
>> register metadata and BE's to read it?
>
> I'll try to answer the question for a generic virtio frontend and
> backend instead (not SCMI because SCMI is unique due to the reasons
> above.)
>
> Yes, xenstore is the easiest way to exchange configuration information
> between domains. I think EPAM used xenstore to exchange the
> configuration information in their virtio-block demo. There is a way to
> use xenstore even between dom0less VMs:
> https://marc.info/?l=3Dxen-devel&m=3D164340547602391 Not just xenstore but
> full PV drivers too. However, in the dom0less case xenstore is going to
> become available some time after boot, not immediately at startup time.
> That's because you need to wait until xenstored is up and running.
>
> There are other ways to send data from one VM to another which are
> available immediately at boot, such as Argo and static shared memory.
>
> But dom0less is all about static partitioning, so it makes sense to
> exploit the build-time tools to the fullest. In the dom0less case, we
> already know what is going to run on the target before it is even turned
> on. As an example, we might have already prepared an environment with 3
> VMs using Yocto and ImageBuilder. We could also generate all
> configurations needed and place them inside each VMs using Yocto's
> standard tools and ImageBuilder. So for dom0less, I recommend to go via
> a different route and pre-generate the configuration directly where
> needed instead of doing dynamic discovery.

Even in a full dom0less setup you still need to manage lifetimes somehow
if a guest reboots.

>
>
>>  * How to handle mapping of memory
>>=20
>> AIUI the Xen model is the FE guest explicitly makes grant table requests
>> to expose portions of it's memory to other domains. Can the BE query the
>> hypervisor itself to discover the available grants or does it require
>> coordination with Dom0/XenStore for that information to be available to
>> the BE domain?
>
> Typically the frontend passes grant table references to the backend
> (i.e. instead of plain guest physical addresses on the virtio ring.)
> Then, the backend maps the grants; Xen checks that the mapping is
> allowed.
>
> We might be able to use the same model with virtio devices. A special
> pseudo-IOMMU driver in Linux would return a grant table reference and an
> offset as "DMA address". The "DMA address" is passed to the virtio
> backend over the virtio ring. The backend would map the grant table
> reference using the regular grant table hypercalls.
>
>
>>  * How to handle signalling
>>=20
>> I guess this requires a minimal implementation of the IOREQ calls for
>> Zephyr so we can register the handler in the backend? Does the IOREQ API
>> allow for a IPI style notifications using the global GIC IRQs?
>>=20
>> Forgive the incomplete notes from the Stratos sync, I was trying to type
>> while participating in the discussion so hopefully this email captures
>> what was missed:
>>=20
>>   https://linaro.atlassian.net/wiki/spaces/STR/pages/28682518685/2022-02=
-03+Project+Stratos+Sync+Meeting+Notes
>
> Yes, any emulation backend (including virtio backends) would require an
> IOREQ implementation, which includes notifications via event channels.
> Event channels are delivered as a GIC PPI interrupt to the Linux kernel.
> Then, the kernel sends the notification to userspace via a file
> descriptor.

Thanks.

--=20
Alex Benn=C3=A9e

