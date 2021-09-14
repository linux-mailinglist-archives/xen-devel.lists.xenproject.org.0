Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200AD40B0C4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 16:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186820.335566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9Vk-0001bR-1W; Tue, 14 Sep 2021 14:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186820.335566; Tue, 14 Sep 2021 14:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9Vj-0001ZP-UI; Tue, 14 Sep 2021 14:34:11 +0000
Received: by outflank-mailman (input) for mailman id 186820;
 Tue, 14 Sep 2021 14:34:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puvF=OE=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1mQ9Vi-0001ZJ-ID
 for xen-devel@lists.xen.org; Tue, 14 Sep 2021 14:34:10 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 651f7dc0-b134-46d1-b641-8337acd90c9e;
 Tue, 14 Sep 2021 14:34:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t8so15559955wrq.4
 for <xen-devel@lists.xen.org>; Tue, 14 Sep 2021 07:34:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o10sm11893120wrc.16.2021.09.14.07.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:34:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C04D1FF96;
 Tue, 14 Sep 2021 15:34:06 +0100 (BST)
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
X-Inumbo-ID: 651f7dc0-b134-46d1-b641-8337acd90c9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=7N1WlynKaMd1gFi/xUXdVFiOHnGdvDIif7OrtCJw3zg=;
        b=QV2U3GUMEOTeYY1UtMJEW0TsLBNd4RMF9KqLCTqgC2r2CrHbjvrTa5MbBNF552jrIT
         CvPCeJbaC7sWRU66aNmU7DzQd7uIXij0M+MIqUq0MTLh47kDc6+rOdvGcMyHHUjKVzXa
         6i0nxGdF1Cp1qS8kTdqT9udhhE5+NoqqouTq0n8oYmGvqMfVzBA6bVF+nrYVQ0rtBG3y
         hlgxqF+03SxxLDAm0esQM6Ang3ecPR6RKGvQc1NlziSRwidTQ2n0lbhwmD3aEbM6f66F
         GR31klbS8YFH8inRbtYnTnYSZPGkyXz+4X1br2fm9w53SIInGORXPq14MRBYkU7XLUHd
         YFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=7N1WlynKaMd1gFi/xUXdVFiOHnGdvDIif7OrtCJw3zg=;
        b=eV5acPjBHbnCA/t+8swbu+2j3YdyaJxtAr3vKHrddm/azOErzgHKF3fQR70yVZdD/B
         DvkOSoik4++Vg/Tb3hdIVehrzhJtlZhh4BQhVLPFvMpw2NCMTBOLS3d3n9x6Gt2DMRA5
         BsWVUG/gFTgUYpHroRFm7aK6bcJgegYEA0hH2599hlcGKMWIEmp6eM1VDrkNFsbhH2BY
         K3ffPrLe+ckxGffNINOsOiN2ov2aetpxvUHU9y6514v5bBXbVZug10QJZdPM2dhUsHog
         BL8ezUAtbdsG2DjZSNzufSIbRhUVMtj7BvuvYIYmW68VUEta5d7eRmWB4wGT+qP27TZm
         5Icg==
X-Gm-Message-State: AOAM53181O1x+4+aLAvPDhwuUAnljkJZwHivqqbEyjIoHftrtNx1kJvS
	fhcRGJGWiGldVUQKznYkV7G3kA==
X-Google-Smtp-Source: ABdhPJyHckofqWY2VKh07GWmlJ0xv6a0kbRJroIzDTqKuO5X5O/0cTMWoOwx0Ri+ylwwUXwuDsuoNg==
X-Received: by 2002:adf:b789:: with SMTP id s9mr19237422wre.315.1631630048147;
        Tue, 14 Sep 2021 07:34:08 -0700 (PDT)
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain> <875yvkh1p1.fsf@linaro.org>
 <20210903080609.GD47953@laputa> <87czpqq9qu.fsf@linaro.org>
 <20210906022356.GD40187@laputa>
 <alpine.DEB.2.21.2109131615570.10523@sstabellini-ThinkPad-T480s>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
 virtio-dev@lists.oasis-open.org, Arnd Bergmann <arnd.bergmann@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Jan Kiszka
 <jan.kiszka@siemens.com>, Carl van Schaik <cvanscha@qti.qualcomm.com>,
 pratikp@quicinc.com, Srivatsa Vaddagiri <vatsa@codeaurora.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Wei.Chen@arm.com, olekstysh@gmail.com,
 Oleksandr_Tyshchenko@epam.com, Bertrand.Marquis@arm.com,
 Artem_Mygaiev@epam.com, julien@xen.org, jgross@suse.com, paul@xen.org,
 xen-devel@lists.xen.org, Elena Afanasova <eafanasova@gmail.com>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
Date: Tue, 14 Sep 2021 15:25:22 +0100
In-reply-to: <alpine.DEB.2.21.2109131615570.10523@sstabellini-ThinkPad-T480s>
Message-ID: <878rzzusyp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Stefano Stabellini <stefano.stabellini@xilinx.com> writes:

> On Mon, 6 Sep 2021, AKASHI Takahiro wrote:
>> > the second is how many context switches are involved in a transaction.
>> > Of course with all things there is a trade off. Things involving the
>> > very tightest latency would probably opt for a bare metal backend which
>> > I think would imply hypervisor knowledge in the backend binary.
>>=20
>> In configuration phase of virtio device, the latency won't be a big matt=
er.
>> In device operations (i.e. read/write to block devices), if we can
>> resolve 'mmap' issue, as Oleksandr is proposing right now, the only issu=
e is
>> how efficiently we can deliver notification to the opposite side. Right?
>> And this is a very common problem whatever approach we would take.
>>=20
>> Anyhow, if we do care the latency in my approach, most of virtio-proxy-
>> related code can be re-implemented just as a stub (or shim?) library
>> since the protocols are defined as RPCs.
>> In this case, however, we would lose the benefit of providing "single bi=
nary"
>> BE.
>> (I know this is is an arguable requirement, though.)
>
> In my experience, latency, performance, and security are far more
> important than providing a single binary.
>
> In my opinion, we should optimize for the best performance and security,
> then be practical on the topic of hypervisor agnosticism. For instance,
> a shared source with a small hypervisor-specific component, with one
> implementation of the small component for each hypervisor, would provide
> a good enough hypervisor abstraction. It is good to be hypervisor
> agnostic, but I wouldn't go extra lengths to have a single binary.

I agree it shouldn't be a primary goal although a single binary working
with helpers to bridge the gap would make a cool demo. The real aim of
agnosticism is avoid having multiple implementations of the backend
itself for no other reason than a change in hypervisor.

> I cannot picture a case where a BE binary needs to be moved between
> different hypervisors and a recompilation is impossible (BE, not FE).
> Instead, I can definitely imagine detailed requirements on IRQ latency
> having to be lower than 10us or bandwidth higher than 500 MB/sec.
>
> Instead of virtio-proxy, my suggestion is to work together on a common
> project and common source with others interested in the same problem.
>
> I would pick something like kvmtool as a basis. It doesn't have to be
> kvmtools, and kvmtools specifically is GPL-licensed, which is
> unfortunate because it would help if the license was BSD-style for ease
> of integration with Zephyr and other RTOSes.

This does imply making some choices, especially the implementation
language. However I feel that C is really the lowest common denominator
here and I get the sense that people would rather avoid it if they could
given the potential security implications of a bug prone back end. This
is what is prompting interest in Rust.

> As long as the project is open to working together on multiple
> hypervisors and deployment models then it is fine. For instance, the
> shared source could be based on OpenAMP kvmtool [1] (the original
> kvmtool likely prefers to stay small and narrow-focused on KVM). OpenAMP
> kvmtool was created to add support for hypervisor-less virtio but they
> are very open to hypervisors too. It could be a good place to add a Xen
> implementation, a KVM fatqueue implementation, a Jailhouse
> implementation, etc. -- work together toward the common goal of a single
> BE source (not binary) supporting multiple different deployment models.
>
>
> [1] https://github.com/OpenAMP/kvmtool


--=20
Alex Benn=C3=A9e

