Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497CF31FE01
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:39:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87034.164024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kg-000199-H7; Fri, 19 Feb 2021 17:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87034.164024; Fri, 19 Feb 2021 17:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kg-00018L-BI; Fri, 19 Feb 2021 17:39:38 +0000
Received: by outflank-mailman (input) for mailman id 87034;
 Fri, 19 Feb 2021 17:39:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9ke-00015B-HZ
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:39:36 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5d3d0e88-38f6-4dbb-b21f-040f82cc7201;
 Fri, 19 Feb 2021 17:39:35 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-bvpW0CxdNBuwgHTvOAM7jw-1; Fri, 19 Feb 2021 12:39:31 -0500
Received: by mail-wr1-f69.google.com with SMTP id l10so2764903wry.16
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:39:31 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r12sm3052972wrt.69.2021.02.19.09.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:30 -0800 (PST)
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
X-Inumbo-ID: 5d3d0e88-38f6-4dbb-b21f-040f82cc7201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ueqj+n2dHsbjBHuZ0Hoy+mZlGObPSK9klpKLOoZpu4Y=;
	b=MMF33b6NnBdSSOiWvC0VxRqETouFen+FQ7chlscpyNGwpGoPnOVyXD0KOSt6ZNjzrcGLlx
	e7K3+LMK21YQac6V7nxO0KMpjaaqcNB7cndfaLMYUwlu9nlt+FCYDeVH2LS/Y8rF/bjZu1
	N7OsP/RVseweu135mRvasXNezJWyqF4=
X-MC-Unique: bvpW0CxdNBuwgHTvOAM7jw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ueqj+n2dHsbjBHuZ0Hoy+mZlGObPSK9klpKLOoZpu4Y=;
        b=gvUjCHKHU0o7U/QuNaPovTACBBYo2wXSv5/NdFyA2U0hbNUtt0iIevYBFGzk1kF38l
         vPyaYsrCRZj/NkV6lec4bsPX1AdEXVWBvcjaU6LKOcI8m07P7ADqpSam6kLMPLBN4LrX
         FUrfjpePBKkEHrmeXlqqvHpWRdZsJfOm1cy1stSSfLRWhXprQPEBaZMWoH5yywKkDprr
         PIjX75HTMCStYq2cDziQfKTb7C74uV6KiqxrYrSI+/WnFGnIdsT9+OOJNTwWlAmHPKg1
         ZRmlN0RpWHmWM+4pryZNoezVCklvGvWwV+Yxr+tZvVDLdIyD4sVpGHwMoiUpRqZyIdpX
         wlxA==
X-Gm-Message-State: AOAM533Q0ZrM0dkvk6wLFwGYJKk3gDdOg3id8yhifDmb1Vs+WvVRRySv
	InPqEPmZbZ4dVWr1PXhu2+2lkHJQVfVR3bDCXioBSDkfyU13MoTcg4zerTzUl+ZZd20VCatr9XN
	JA2dxka/wpfZsFE1ZNiaeTD3sL0I=
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr9312000wmb.98.1613756370707;
        Fri, 19 Feb 2021 09:39:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQVxSvgdKIkMYLk6jZPql9ZCAN0WXriT+5Nc8pY51dY+mHxFK5IkbcVQRBV0rvadWM1WYfTA==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr9311979wmb.98.1613756370490;
        Fri, 19 Feb 2021 09:39:30 -0800 (PST)
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
Subject: [PATCH v2 07/11] hw/s390x: Explicit the s390-ccw-virtio machines support TCG and KVM
Date: Fri, 19 Feb 2021 18:38:43 +0100
Message-Id: <20210219173847.2054123-8-philmd@redhat.com>
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

All s390-ccw-virtio machines support TCG and KVM.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2972b607f36..1f168485066 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -586,6 +586,10 @@ static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
     return newsz;
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void ccw_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -612,6 +616,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     mc->possible_cpu_arch_ids = s390_possible_cpu_arch_ids;
     /* it is overridden with 'host' cpu *in kvm_arch_init* */
     mc->default_cpu_type = S390_CPU_TYPE_NAME("qemu");
+    mc->valid_accelerators = valid_accels;
     hc->plug = s390_machine_device_plug;
     hc->unplug_request = s390_machine_device_unplug_request;
     nc->nmi_monitor_handler = s390_nmi;
-- 
2.26.2


