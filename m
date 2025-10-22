Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC32EBFBF09
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 14:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148031.1480165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBYI2-0006N7-6g; Wed, 22 Oct 2025 12:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148031.1480165; Wed, 22 Oct 2025 12:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBYI2-0006K4-3r; Wed, 22 Oct 2025 12:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1148031;
 Wed, 22 Oct 2025 12:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Toh=47=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1vBYI0-00061T-EI
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 12:50:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a00535dd-af45-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 14:50:03 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-8J2MpIi7M2yK0ZJRMdvkPA-1; Wed, 22 Oct 2025 08:50:00 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47111dc7bdbso52552075e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 05:50:00 -0700 (PDT)
Received: from [192.168.10.48] ([151.61.22.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428a534sm50029055e9.6.2025.10.22.05.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 05:49:57 -0700 (PDT)
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
X-Inumbo-ID: a00535dd-af45-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761137401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=aAilEOob8MMVFEkWURHCW9Vwkf2sd7OjrJ1WBZhbJ5MOrijxW6XleAuN0uUYh39DCDFF6w
	VFGLafRZMzWkZ37yctTzF1dU5+T9XI6+FZG7N5Fg6cQpvKYr+kQfa/3tqOIkpCMr95mT6X
	7n618B45nYcBF5hk8SmrWh2zc5/yd8s=
X-MC-Unique: 8J2MpIi7M2yK0ZJRMdvkPA-1
X-Mimecast-MFC-AGG-ID: 8J2MpIi7M2yK0ZJRMdvkPA_1761137399
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761137399; x=1761742199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=Ij4ZYtpg8KWv+7saqBtOadBzQIMUa8yKy/Lk7SdyEsP+qAEIL9pO271vKLWcSq9km0
         WCqbcfsc3ovvwozK91//E10Bnj5sYhg2TbCNd1Zt+D9XWzmlnc8QetalBdjSs7Va32oP
         Nz8YKTlxLZ+ljXHeIN2SYpg3txL1YBOmWNV2pkVgkRQqjZ3+K7eZgwa/pfplbpVIaCW5
         8h5mCC9exBk5FixES5EqjTkS3LNHGYhOxPKlzCa9ajtyyrmsv9Z3Nz1yI94ski4TTJRZ
         xnDuTelMoIO2MuUeGn7F43Wrng1sIPqJFRppsGjfm0a9vYgvZJGXo8ecgrsZtXjwjVlf
         nEUA==
X-Forwarded-Encrypted: i=1; AJvYcCUGalBExYcbJPJZIh7ifVAD6kJkK3219s0guLggqz1GuQBeniNzlchURZtVVWcxWcSLsOEZwTw5s0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEb4KMDIE/aO31jIfN9KqDdd+2iWrYxZuF6BRdVCZ+qZxv4hY0
	2EKld1mtS2cnUJGHvfEid2Zb1/kWTgDPYYSGRQHTSm3vhuLVi0Ebd5NcsikHJNmtBtSLjnfL0No
	tXLHcqosnC0ZESr9rvSECljCLAOZpc5SWyKYOT16BieMCnsaYtQjasDvdYdy7ftwVyOyZ
X-Gm-Gg: ASbGnctt/CS1F74HQwvDEp+Fg33UjRR0US/+wPslCjz5za/d0ysjTFRFU1E3Y2p8ssM
	j1JK8OM12uaaanClLcLWD2HvE97mnyGhuPzrj9uBPjL/b29zzfm+uU8rSE9Er5VqonRkbOpTlop
	rZGXioeQZJuFOtGghc5+oZBGsNmfJ0e0+I2ZMtFJDn6uypUSIwkx5fZJRDBQpgIaNKLaR15GFhA
	lMN3yVLVD6/oGX+A5I8r80XgGxBw04J/8Gd2aVi/a7Ap/XvJgAmrG2xH7e9cnaNgV7NekCPRA45
	3Wk/G6Wug7rsOPGVMGoqws23f0NYNWfllVaz+fSyJTMLCoxX5hXSMDVXxKKi+5TGoRpskEr3gsa
	r/MhzNB4g5+G2vHBDycLAccFaE543LVSzmi9yqE2oS3ThhHsyR0SIkGHqAe1KCZTCZkYDfWOw05
	hQXg==
X-Received: by 2002:a05:600c:3e07:b0:468:7a5a:1494 with SMTP id 5b1f17b1804b1-4711787350dmr122416765e9.1.1761137399200;
        Wed, 22 Oct 2025 05:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/Hm2BY761ErfCQAW9TWE1D63G3DyFVH54t8V55V0H1jT6mBT86okovR2Of93UGrtI6FGtKQ==
X-Received: by 2002:a05:600c:3e07:b0:468:7a5a:1494 with SMTP id 5b1f17b1804b1-4711787350dmr122416435e9.1.1761137398787;
        Wed, 22 Oct 2025 05:49:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
	Gonglei <arei.gonglei@huawei.com>,
	Zhenwei Pi <pizhenwei@bytedance.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Amit Shah <amit@kernel.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
	Frederic Konrad <konrad.frederic@yahoo.fr>,
	Alberto Garcia <berto@igalia.com>,
	Thomas Huth <huth@tuxfamily.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Yoshinori Sato <yoshinori.sato@nifty.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Collin L . Walling" <walling@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>,
	Corey Minyard <minyard@acm.org>,
	Paul Burton <paulburton@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Vijai Kumar K <vijai@behindbytes.com>,
	Samuel Tardieu <sam@rfc1149.net>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Raphael Norwitz <raphael@enfabrica.net>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"reviewer : vhost-user-scmi" <mzamazal@redhat.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Fabiano Rosas <farosas@suse.de>,
	Markus Armbruster <armbru@redhat.com>,
	"Dr . David Alan Gilbert" <dave@treblig.org>,
	Zhang Chen <zhangckid@gmail.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Jason Wang <jasowang@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Lukas Straub <lukasstraub2@web.de>,
	"open list : Sharp SL-5500 Co . . ." <qemu-arm@nongnu.org>,
	"open list : S390 SCLP-backed . . ." <qemu-s390x@nongnu.org>,
	"open list : sPAPR pseries" <qemu-ppc@nongnu.org>,
	"open list : X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
	"open list : RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
	"open list : virtiofs" <virtio-fs@lists.linux.dev>,
	"open list : Rust-related patc . . ." <qemu-rust@nongnu.org>
Subject: Re: [PATCH v2] char: rename CharBackend->CharFrontend
Date: Wed, 22 Oct 2025 14:49:51 +0200
Message-ID: <20251022124952.3691010-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022074612.1258413-1-marcandre.lureau@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IYqCJQXPcbBdswq8Wt2sDQ3u__UJ-vuBopcxumrjlfw_1761137399
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Queued, thanks.

Paolo


