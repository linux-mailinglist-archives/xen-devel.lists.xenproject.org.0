Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901522D069E
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 19:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45754.81177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzBp-0005bi-Ms; Sun, 06 Dec 2020 18:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45754.81177; Sun, 06 Dec 2020 18:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzBp-0005bH-JF; Sun, 06 Dec 2020 18:55:21 +0000
Received: by outflank-mailman (input) for mailman id 45754;
 Sun, 06 Dec 2020 18:55:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PoKi=FK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1klzBn-0005bC-Sq
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 18:55:20 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 313033da-c4fb-4255-ab08-62eeb1e8d5fd;
 Sun, 06 Dec 2020 18:55:16 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-mF2-PuzSM4G6JWuqSeM5Ag-1; Sun, 06 Dec 2020 13:55:13 -0500
Received: by mail-wm1-f71.google.com with SMTP id o203so3252682wmo.3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Dec 2020 10:55:13 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a62sm4051738wmh.40.2020.12.06.10.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:10 -0800 (PST)
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
X-Inumbo-ID: 313033da-c4fb-4255-ab08-62eeb1e8d5fd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oz3755FMu8d1x8s9I95QQZsr6H/EfAu6k1jRrCig21A=;
	b=XyghoQpJOR7foFreAGe7UDE001khSSSlAROjw6uvCKkckAFGGEcV5IPsSmM7gGJmntHc6M
	2Sf9i2HM5letzyg2Zn0pLuaQGVKTVfL+zG5Ds6wGSy8h2+GR/WWanJ1kkbf4b2igTxKCV3
	tzHo0duse6WOtB4RdKMpiUNeatJ4BYU=
X-MC-Unique: mF2-PuzSM4G6JWuqSeM5Ag-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5L9zYVEk7UDV9e8J6jUWmDLNneFBSRjTDjE9eeZGMJ4=;
        b=lsA7Zn4glSovlTTSegGdRcOaJUw+RxxcSWf+oMEkweHDGZ3BQDvmC7NIM1IvX7h4iO
         Fq1qOki4N1fdaGZgZ2UwOXCcA7vmeRwC8e7LRAr69vkV/aVGEcLOX3CAKTxjDooZ/wpa
         mK3xOyzDFmrv3O/iSg6PnxFEDZUQClKZ2o9FSqFxlw3vW4/3WVNo0uqM3ZCHrA2BJyod
         v5vBjF02maABIF5Y9lh8q0FU0/QzqfLMQnhm9su6O9VxaWxw31Z8C8872OwbiNa4MUmD
         9Wv2n0oXgsXHpa59/Ytk4OuPD/Iln6YIseYyikUpdjeJtb3Quf40+5sj/+9xf+9FvnjL
         IIeA==
X-Gm-Message-State: AOAM532AlsoHGrXNRdT7HHvMwVn8Ur1bkJDjzXbNM851vJgaJIZwujwq
	0Xs1nbKj5HvwuawzxpbMblLqKIaVvpb7ZqIxNQdq6zCMvKOLFKVRM1pt7xcZfmnoR0Ujv7s5p31
	66wJOeZzbOu+Rx9cJvTRQp2ZXRIE=
X-Received: by 2002:a1c:6056:: with SMTP id u83mr14528865wmb.90.1607280911972;
        Sun, 06 Dec 2020 10:55:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCSZGi5rbiGoVRoGKRNGTcTbBvyODVVSoiL6GLaxlOiqbwRFYQlZdlM1E+jjVm6ac4G5YFvw==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr14528834wmb.90.1607280911735;
        Sun, 06 Dec 2020 10:55:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Huacai Chen <chenhc@lemote.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Claudio Fontana <cfontana@suse.de>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-s390x@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org
Subject: [PATCH 0/8] gitlab-ci: Add accelerator-specific Linux jobs
Date: Sun,  6 Dec 2020 19:55:00 +0100
Message-Id: <20201206185508.3545711-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,=0D
=0D
I was custom to use Travis-CI for testing KVM builds on s390x/ppc=0D
with the Travis-CI jobs.=0D
=0D
During October Travis-CI became unusable for me (extremely slow,=0D
see [1]). Then my free Travis account got updated to the new=0D
"10K credit minutes allotment" [2] which I burned without reading=0D
the notification email in time (I'd burn them eventually anyway).=0D
=0D
Today Travis-CI is pointless to me. While I could pay to run my=0D
QEMU jobs, I don't think it is fair for an Open Source project to=0D
ask its forks to pay for a service.=0D
=0D
As we want forks to run some CI before contributing patches, and=0D
we have cross-build Docker images available for Linux hosts, I=0D
added some cross KVM/Xen build jobs to Gitlab-CI.=0D
=0D
Cross-building doesn't have the same coverage as native building,=0D
as we can not run the tests. But this is still useful to get link=0D
failures.=0D
=0D
Each job is added in its own YAML file, so it is easier to notify=0D
subsystem maintainers in case of troubles.=0D
=0D
Resulting pipeline:=0D
https://gitlab.com/philmd/qemu/-/pipelines/225948077=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[1] https://travis-ci.community/t/build-delays-for-open-source-project/1027=
2=0D
[2] https://blog.travis-ci.com/2020-11-02-travis-ci-new-billing=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)=0D
  gitlab-ci: Introduce 'cross_accel_build_job' template=0D
  gitlab-ci: Add KVM X86 cross-build jobs=0D
  gitlab-ci: Add KVM ARM cross-build jobs=0D
  gitlab-ci: Add KVM s390x cross-build jobs=0D
  gitlab-ci: Add KVM PPC cross-build jobs=0D
  gitlab-ci: Add KVM MIPS cross-build jobs=0D
  gitlab-ci: Add Xen cross-build jobs=0D
=0D
 .gitlab-ci.d/crossbuilds-kvm-arm.yml   |  5 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-mips.yml  |  5 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-ppc.yml   |  5 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-s390x.yml |  6 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-x86.yml   |  6 +++=0D
 .gitlab-ci.d/crossbuilds-xen.yml       | 14 +++++++=0D
 .gitlab-ci.d/crossbuilds.yml           | 52 ++++++++++++++++----------=0D
 .gitlab-ci.yml                         |  6 +++=0D
 MAINTAINERS                            |  6 +++=0D
 9 files changed, 85 insertions(+), 20 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-arm.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-mips.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-ppc.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-xen.yml=0D
=0D
--=20=0D
2.26.2=0D
=0D


