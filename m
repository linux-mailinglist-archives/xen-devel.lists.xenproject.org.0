Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A5831FE02
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87039.164035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kt-0001JI-Us; Fri, 19 Feb 2021 17:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87039.164035; Fri, 19 Feb 2021 17:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kt-0001Iq-Qc; Fri, 19 Feb 2021 17:39:51 +0000
Received: by outflank-mailman (input) for mailman id 87039;
 Fri, 19 Feb 2021 17:39:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9kr-0001FU-WF
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:39:50 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d9a537ac-eb31-4856-9d00-58a73a5b2635;
 Fri, 19 Feb 2021 17:39:47 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-ZN5_YoBkMcSIkws2sM-PQA-1; Fri, 19 Feb 2021 12:39:43 -0500
Received: by mail-wr1-f69.google.com with SMTP id e11so2715711wro.19
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:39:43 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b72sm13082236wmd.4.2021.02.19.09.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:41 -0800 (PST)
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
X-Inumbo-ID: d9a537ac-eb31-4856-9d00-58a73a5b2635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m89dmrSplgkgoyBA9XFoMMYsKZX69TbxEanq9oDkcW0=;
	b=DXjY4RQV0itR6RsRPvdf9Coo8i0V0+IoVp9d/6gRb7bfQePt3Yzm6637eeXjUGmuNAlYBA
	EqZzWirw3ji/ywUXv9kvQgAd2BQEu3qmBXjcKGpoid3831Ls92EMrq3JyxCQlu3e6GQuu5
	XYBiTOgCp0JRk6zwPItYpnh87nwQMMQ=
X-MC-Unique: ZN5_YoBkMcSIkws2sM-PQA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m89dmrSplgkgoyBA9XFoMMYsKZX69TbxEanq9oDkcW0=;
        b=aZuifwT8xzpDif3bTSgPxNV+2XmG3ykdqtuUJQxBsPpbsngkH/r8z3owwkr5gE4vSa
         hcp1+nVvHeQzpD+8F3FQvmiqs/48ftEvQjtToR8Tx+bjpL93irK+RJwCYRwOArUdv83b
         GPBZS1ySGR3sZOI8iSOYaRk2sxNzBRu0V1cGMfMUEgVxeq9gKbleogCwJUSdJrtMi/d3
         ovIgwV3vp6jwQHOn+nY+81VubN01kI/tJsek3GYwn1qxId560dbZ3C9sRIKbYMTwatsv
         5fdorqUjIWelfMyyHg7xTDu8Zl5/kXjQ97j2ig0hedQzsWNmd029xjkbQE8lhG2p00b5
         k+JA==
X-Gm-Message-State: AOAM532xYGn1WMTSfbbibGlt+EtFqaCJrnquirjG6TFdR7NuULw7vTLZ
	NvZiYbaRxuhe1Uvg+mSOC7nB1+GKZGsI5Dqaf1bfh1S8/85n2V+uWd5uxrmxADTPwIX/iZv/7CH
	779u0L7r0Vl0Q49j9DqiZJXLy0RI=
X-Received: by 2002:a1c:c6:: with SMTP id 189mr9272330wma.128.1613756382375;
        Fri, 19 Feb 2021 09:39:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfL/zeX1Twd/41yRwfBzbYwswnUhtDRMBecaJ3a8NHeinaw0+wzScyZWOOrq01liX3KOGGMQ==
X-Received: by 2002:a1c:c6:: with SMTP id 189mr9272291wma.128.1613756382214;
        Fri, 19 Feb 2021 09:39:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Leif Lindholm <leif@nuviainc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Durrant <paul@xen.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Greg Kurz <groug@kaod.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 09/11] hw/xenpv: Restrict Xen Para-virtualized machine to Xen accelerator
Date: Fri, 19 Feb 2021 18:38:45 +0100
Message-Id: <20210219173847.2054123-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When started with other accelerator than Xen, the XenPV machine
fails with a criptic message:

  $ qemu-system-x86_64 -M xenpv,accel=kvm
  xen be core: can't connect to xenstored
  qemu-system-x86_64: xen_init_pv: xen backend core setup failed

By restricting it to Xen, we display a clearer error message:

  $ qemu-system-x86_64 -M xenpv,accel=kvm
  qemu-system-x86_64: invalid accelerator 'kvm' for machine xenpv

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/xenpv/xen_machine_pv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 8df575a457c..d7747bcec98 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -86,12 +86,17 @@ static void xen_init_pv(MachineState *machine)
     atexit(xen_config_cleanup);
 }
 
+static const char *valid_accels[] = {
+    "xen", NULL
+};
+
 static void xenpv_machine_init(MachineClass *mc)
 {
     mc->desc = "Xen Para-virtualized PC";
     mc->init = xen_init_pv;
     mc->max_cpus = 1;
     mc->default_machine_opts = "accel=xen";
+    mc->valid_accelerators = valid_accels;
 }
 
 DEFINE_MACHINE("xenpv", xenpv_machine_init)
-- 
2.26.2


