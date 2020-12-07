Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DEF2D0DEE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:24:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46113.81808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDgM-0005f7-AV; Mon, 07 Dec 2020 10:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46113.81808; Mon, 07 Dec 2020 10:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDgM-0005eR-6b; Mon, 07 Dec 2020 10:23:50 +0000
Received: by outflank-mailman (input) for mailman id 46113;
 Mon, 07 Dec 2020 10:23:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Acm=FL=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1kmDgK-0005cU-Mq
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:23:48 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9180c6ca-a37b-458b-ad0f-303c5a2da8bd;
 Mon, 07 Dec 2020 10:23:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-W4NZmy85M4282Y90Lqh5rw-1; Mon, 07 Dec 2020 05:23:32 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7432C801AE8;
 Mon,  7 Dec 2020 10:23:29 +0000 (UTC)
Received: from redhat.com (ovpn-113-137.ams2.redhat.com [10.36.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 435C360BD8;
 Mon,  7 Dec 2020 10:23:19 +0000 (UTC)
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
X-Inumbo-ID: 9180c6ca-a37b-458b-ad0f-303c5a2da8bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607336626;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0qgjftJvMWB28i7vhzEDVbkT48Qo4f02gO6Q9KnMTyo=;
	b=cGIxO2JaYQZ1vArjne8aOanS0fgGYaiYtDCS+A+HJr+skYSu8u34pX/TAz2mQgDovDLirx
	Hl7PrG3dX00XIRC19PBjr/LKZht0GnnhSJniXRnjBg3yxN/qWcVmfs87wXB9TF3Q96Hx0y
	/lNeCFKSiGMssqDBZuYg9W6CHWacZLw=
X-MC-Unique: W4NZmy85M4282Y90Lqh5rw-1
Date: Mon, 7 Dec 2020 10:23:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
	Paul Durrant <paul@xen.org>, Thomas Huth <thuth@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Huacai Chen <chenhc@lemote.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Claudio Fontana <cfontana@suse.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 0/8] gitlab-ci: Add accelerator-specific Linux jobs
Message-ID: <20201207102316.GF3102898@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201206185508.3545711-1-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11

On Sun, Dec 06, 2020 at 07:55:00PM +0100, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I was custom to use Travis-CI for testing KVM builds on s390x/ppc
> with the Travis-CI jobs.
> 
> During October Travis-CI became unusable for me (extremely slow,
> see [1]). Then my free Travis account got updated to the new
> "10K credit minutes allotment" [2] which I burned without reading
> the notification email in time (I'd burn them eventually anyway).
> 
> Today Travis-CI is pointless to me. While I could pay to run my
> QEMU jobs, I don't think it is fair for an Open Source project to
> ask its forks to pay for a service.
> 
> As we want forks to run some CI before contributing patches, and
> we have cross-build Docker images available for Linux hosts, I
> added some cross KVM/Xen build jobs to Gitlab-CI.
> 
> Cross-building doesn't have the same coverage as native building,
> as we can not run the tests. But this is still useful to get link
> failures.
> 
> Each job is added in its own YAML file, so it is easier to notify
> subsystem maintainers in case of troubles.
> 
> Resulting pipeline:
> https://gitlab.com/philmd/qemu/-/pipelines/225948077
> 
> Regards,
> 
> Phil.
> 
> [1] https://travis-ci.community/t/build-delays-for-open-source-project/10272
> [2] https://blog.travis-ci.com/2020-11-02-travis-ci-new-billing
> 
> Philippe Mathieu-Daudé (8):
>   gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)
>   gitlab-ci: Introduce 'cross_accel_build_job' template
>   gitlab-ci: Add KVM X86 cross-build jobs
>   gitlab-ci: Add KVM ARM cross-build jobs
>   gitlab-ci: Add KVM s390x cross-build jobs
>   gitlab-ci: Add KVM PPC cross-build jobs
>   gitlab-ci: Add KVM MIPS cross-build jobs
>   gitlab-ci: Add Xen cross-build jobs
> 
>  .gitlab-ci.d/crossbuilds-kvm-arm.yml   |  5 +++
>  .gitlab-ci.d/crossbuilds-kvm-mips.yml  |  5 +++
>  .gitlab-ci.d/crossbuilds-kvm-ppc.yml   |  5 +++
>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml |  6 +++
>  .gitlab-ci.d/crossbuilds-kvm-x86.yml   |  6 +++
>  .gitlab-ci.d/crossbuilds-xen.yml       | 14 +++++++

Adding so many different files here is crazy IMHO, and then should
all be under the same GitLab CI maintainers, not the respective
arch maintainers.  The MAINTAINERS file is saying who is responsible
for the contents of the .yml file, not who is responsible for making
sure KVM works on that arch. 

>  .gitlab-ci.d/crossbuilds.yml           | 52 ++++++++++++++++----------
>  .gitlab-ci.yml                         |  6 +++
>  MAINTAINERS                            |  6 +++
>  9 files changed, 85 insertions(+), 20 deletions(-)
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-arm.yml
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-mips.yml
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-ppc.yml
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml
>  create mode 100644 .gitlab-ci.d/crossbuilds-xen.yml

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


