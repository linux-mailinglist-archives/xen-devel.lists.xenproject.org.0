Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8BA2D1199
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 14:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46525.82564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGME-0004Ar-RW; Mon, 07 Dec 2020 13:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46525.82564; Mon, 07 Dec 2020 13:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGME-0004AS-NB; Mon, 07 Dec 2020 13:15:14 +0000
Received: by outflank-mailman (input) for mailman id 46525;
 Mon, 07 Dec 2020 13:15:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmGMC-0004AL-Th
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:15:12 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5b4fc8b5-c61d-4d6f-8bcf-4473de81d46a;
 Mon, 07 Dec 2020 13:15:11 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-06Pe1iUoMrCNM2-EithplQ-1; Mon, 07 Dec 2020 08:15:08 -0500
Received: by mail-wm1-f72.google.com with SMTP id d16so2487027wmd.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 05:15:08 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 94sm6169289wrq.22.2020.12.07.05.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:15:06 -0800 (PST)
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
X-Inumbo-ID: 5b4fc8b5-c61d-4d6f-8bcf-4473de81d46a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607346911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P8E9r6EVqPEiRqlaumtn8A3AH4erPVBibEbVofdGhF4=;
	b=NEYMsYEi4idYlSBrCyGNxo99DfcV6Q3/XyNohssFsdkbjF/z+m+p8lHhD9FMRn0dKhzdxJ
	bLt5lKP3hgEW+s0krQNA+THfTZWZyklROi1ahT3WK0wcVEx42W2hl89NGuqsS4Iu1neGiB
	TBBcAnDavQTqnleW8NV+GYAhiYRhhwU=
X-MC-Unique: 06Pe1iUoMrCNM2-EithplQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D+Xzt47T3O6uanVPO2OPfmJ/SH9QMRtVuJ5cnLL0G9o=;
        b=iqoS9Ezbsngyuqy9fM+iTo1tUk8tT9k6DzNASaWa0Y/ZhyAoVMIxCgOQTLilpCk8pH
         ekv1aa1f94/j9U/tIPFmcneYQnJFQP6cO/nXXRXBXmyF6dMQ5jI0vJZFOiqquwIQ0ZGU
         +q8A/FzZt+VJwTa6HSQe4jpCqeXf5e51toQKHh3S78pOy7qWp7maIt5rkI3wIwwuDKj9
         DVO3BNM6cSljPz6XekFc6iKQyPjtnp2mVRKYa+gEuaFMTzZYh6N4pzDpFcsVj7DJgak4
         Razx+9eN7YhxEOBYZG+H7IzE1htra15Da2oxi7mWWIUlrnyVRMNrG8lBgzMO1WwETYSZ
         uF7Q==
X-Gm-Message-State: AOAM532dUcoCaCMjPxBzqXRsv7iLcqHnT5EG81OjxqdBtAO6p5qA3czv
	FIMiMkKDt3qsHTpsTsrESK0NqK+67Zy5NIaf8Ze/7REewgi5wWwhol2su3P08bDxiKs72MJ0AF+
	HKr9vCy7R2fShHz7Hht5okX+qGn4=
X-Received: by 2002:a5d:4d88:: with SMTP id b8mr19446883wru.134.1607346907513;
        Mon, 07 Dec 2020 05:15:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpnUya1Cq26y+zerYd2xTIJ5RvuSXM0q1BxVsK+34xdINKnlF/ke5kWAF9RdCASl4P3rK0fg==
X-Received: by 2002:a5d:4d88:: with SMTP id b8mr19446856wru.134.1607346907342;
        Mon, 07 Dec 2020 05:15:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Claudio Fontana <cfontana@suse.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 0/5] gitlab-ci: Add accelerator-specific Linux jobs
Date: Mon,  7 Dec 2020 14:14:58 +0100
Message-Id: <20201207131503.3858889-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Since v2:=0D
- Fixed ARM Xen job=0D
- Renamed jobs with -$accel trailer (Thomas)=0D
=0D
Since v1:=0D
- Documented cross_accel_build_job template (Claudio)=0D
- Only add new job for s390x (Thomas)=0D
- Do not add entry to MAINTAINERS (Daniel)=0D
- Document 'build-tcg-disabled' job is X86 + KVM=0D
- Drop the patches with negative review feedbacks=0D
=0D
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
Resulting pipeline:=0D
https://gitlab.com/philmd/qemu/-/pipelines/226240415=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[1] https://travis-ci.community/t/build-delays-for-open-source-project/1027=
2=0D
[2] https://blog.travis-ci.com/2020-11-02-travis-ci-new-billing=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  gitlab-ci: Document 'build-tcg-disabled' is a KVM X86 job=0D
  gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)=0D
  gitlab-ci: Introduce 'cross_accel_build_job' template=0D
  gitlab-ci: Add KVM s390x cross-build jobs=0D
  gitlab-ci: Add Xen cross-build jobs=0D
=0D
 .gitlab-ci.d/crossbuilds.yml | 78 ++++++++++++++++++++++++++----------=0D
 .gitlab-ci.yml               |  5 +++=0D
 2 files changed, 62 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


