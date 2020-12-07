Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F52D0EE2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:24:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46265.82096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEcg-0005ox-Gm; Mon, 07 Dec 2020 11:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46265.82096; Mon, 07 Dec 2020 11:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEcg-0005oX-DE; Mon, 07 Dec 2020 11:24:06 +0000
Received: by outflank-mailman (input) for mailman id 46265;
 Mon, 07 Dec 2020 11:24:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmEce-0005oS-MA
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:24:04 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cf2a39eb-1a84-4fd6-bc8a-e6a09744fb3d;
 Mon, 07 Dec 2020 11:24:02 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-07nhtAX6OiqA2xk8r6b4_w-1; Mon, 07 Dec 2020 06:23:58 -0500
Received: by mail-wm1-f69.google.com with SMTP id r1so5237120wmn.8
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 03:23:58 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 34sm14514869wrh.78.2020.12.07.03.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:23:56 -0800 (PST)
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
X-Inumbo-ID: cf2a39eb-1a84-4fd6-bc8a-e6a09744fb3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607340242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KjLEJ26NwV7wRGptfySD4BLn63K7qvIHtT9dhMtihSI=;
	b=gkhud3T3SA5wng8wn+8iEfaMrh3mHGLoBUvYpEfh8z8x4mGaaeuawqcaIKVM5ZebRKy2jn
	JnCB1m1yQr70XCOK6vOzUuv1udJpgIVtMTZq7CM7MkJim1O9PhXbw3UC7st2PfPRs7edvJ
	fIImWTIJumaq8nCG3MAcHPuE7laRGrE=
X-MC-Unique: 07nhtAX6OiqA2xk8r6b4_w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=auivzVy5y6QOjO5B6onFwW2/1Tqt9pcw8PvGSGN2N6I=;
        b=XJwWFPaObSimdkcEEaCbfZuCTyyuu5MJejInuyQMnnVcuYT7RXgPRrPd4TxOnUJm41
         K5KKV0+iyA3QeRCN7D/2rZGbzlB10dirTeVxbD3BD9aF6lKaCqgyg9lR2Il5MHh6Aksz
         Ej2jPr0zGmLitST3v4Qnm3HrVDwLgxJoj67Bb0X0QDyv2d66wbCVAxrL3Nh66Dp5RBYN
         W9tnFpVA5MpOPOZPTnbHTG8iFkRYtRmD391DGfCp2YO7xZcDSmOG1nQb98+fWpkBKZDD
         n3KP80KjK1sGs/hsoJcGUO2caJzLcy0Aqyq0E7eOGjvUCNxrXMvkgqPFG0Q4yfNaEYEQ
         8Uwg==
X-Gm-Message-State: AOAM531+PAUWgln9BhOyHPxXtdvoIcS8OL9dQkaURU+xkbQz4keAJgba
	UjUWoEH0PK0qVi61iKgHgwdVgYiLbai6QPgn/ST+aw3bJi1p/uWWQ3Sp7cZtWy8BHkQOJvmT5Qo
	frrxqWtqByKX/bNXqR+YzlFoSbnA=
X-Received: by 2002:a1c:750f:: with SMTP id o15mr17874286wmc.144.1607340237196;
        Mon, 07 Dec 2020 03:23:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtEVzeEC7jhHuC2uJxrowF2KeO/P6RnnWe7mlJ0qlo0yRhGBZE6N17mpPfK6BoXPRNgR263w==
X-Received: by 2002:a1c:750f:: with SMTP id o15mr17874250wmc.144.1607340236966;
        Mon, 07 Dec 2020 03:23:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Willian Rampazzo <wrampazz@redhat.com>,
	qemu-s390x@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/5] gitlab-ci: Add accelerator-specific Linux jobs
Date: Mon,  7 Dec 2020 12:23:48 +0100
Message-Id: <20201207112353.3814480-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

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
Philippe Mathieu-Daud=C3=A9 (5):=0D
  gitlab-ci: Document 'build-tcg-disabled' is a KVM X86 job=0D
  gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)=0D
  gitlab-ci: Introduce 'cross_accel_build_job' template=0D
  gitlab-ci: Add KVM s390x cross-build jobs=0D
  gitlab-ci: Add Xen cross-build jobs=0D
=0D
 .gitlab-ci.d/crossbuilds.yml | 80 ++++++++++++++++++++++++++----------=0D
 .gitlab-ci.yml               |  5 +++=0D
 2 files changed, 64 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


