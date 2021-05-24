Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C1C38F47D
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131883.246306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKs-0003DT-FW; Mon, 24 May 2021 20:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131883.246306; Mon, 24 May 2021 20:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKs-0003AY-At; Mon, 24 May 2021 20:38:02 +0000
Received: by outflank-mailman (input) for mailman id 131883;
 Mon, 24 May 2021 20:38:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHKq-0001ey-S5
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:38:00 +0000
Received: from mail-qt1-x829.google.com (unknown [2607:f8b0:4864:20::829])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e19ada3-e1b5-41ea-b64a-fbe3971da842;
 Mon, 24 May 2021 20:37:43 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id s12so12402206qta.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:43 -0700 (PDT)
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
X-Inumbo-ID: 3e19ada3-e1b5-41ea-b64a-fbe3971da842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=hfBP94KizJpDruLBLBLMUfOcD8AldREODeB/q9SIq2M=;
        b=EQMocBqOydCDD/W8SK/dRmkPliwTZBPDqqBue37vjCJUpXE7Kazzvg3C0+yP6P18Ii
         SfhM0N145Miw5QwY7hJq+dRJc/v1S4Rie7TO5ZA3rT1Jlni76D5sx9SwsCJSVlHQxnsX
         WY34MhAbv/qGh332hnI+zir9IDLTnNlCkAxVd1IrVcG4yzAM4iGiSVT+fbdEXMa9RiyC
         ubjhuVK2GJrSvhjNjRF/U52xlmzAo5eF1a5BYLminyYi9qBDYbFkk6Vh19o3PsZJOmik
         1WFJqU/5Gz6RT1ZCY2N3QK+lVZ+7ejaaLFjq/J5s30t2uQIilmL0Aiuwn7hd3GUNVowB
         C4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=hfBP94KizJpDruLBLBLMUfOcD8AldREODeB/q9SIq2M=;
        b=CoJyKzt1vSaoFrfQX3iggknKs0kp+u0HCWACOL/xPQU+Zsikb1RjWXLr+4vUAKkvOT
         1P2Mr5b1b4JrABLAFvqXXTHf7hB7bz6RK3zRzkxu5IdVvT6IWd9Y7PD60CPpnTo5AQq7
         nHTs22ZtKkKzm752sAD665nVQp24xuhyobJ7q3sEriUgDvrPkz6DYzDg4u6Iw0PGQdls
         3ZRGkN2yL4g2sO0uEPGUIfSDHF/rGUvCKG+WtqRCX8mef9Jwa//LEbWg5IXa8LKdJh6G
         3+1PerPMtIyNiwL9IqAiAfeHgF+HBrcYiyiaoeZ3U7L/j2rx9q2Jo9Lu/BwgpD1U9A8O
         v8og==
X-Gm-Message-State: AOAM532xqX1Mmai9CZHk2mVSwRd8GKVFLI/Ayw3KKFR7GZOXbu4zKZVL
	y57B325N0wr6ZPq5GZy8LIA=
X-Google-Smtp-Source: ABdhPJyKe6Or6ryElDeBwz+s/qA1wfWs/ZYdvbgEtPXmQ70fTLPF1ZXiKPco+HZJ8+TI5BqNoB/45A==
X-Received: by 2002:ac8:66da:: with SMTP id m26mr28281280qtp.102.1621888663707;
        Mon, 24 May 2021 13:37:43 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 04/12] golang/xenlight: export keyed union interface types
Date: Mon, 24 May 2021 16:36:45 -0400
Message-Id: <29a3fbc93262cb9b31f02d6c94c018b200dfa43e.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

For structs that have a keyed union, e.g. DomainBuildInfo, the TypeUnion
field must be exported so that package users can get/set the fields
within. This means that users are aware of the existence of the
interface type used in those fields (see [1]), so it is awkward that the
interface itself is not exported. However, the single method within the
interface must remain unexported so that users cannot mistakenly "implement"
those interfaces.

Since there seems to be no reason to do otherwise, export the keyed
union interface types.

[1] https://pkg.go.dev/xenbits.xenproject.org/git-http/xen.git/tools/golang/xenlight?tab=doc#DeviceUsbdev

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/gengotypes.py |  6 +--
 tools/golang/xenlight/types.gen.go  | 58 ++++++++++++++---------------
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index e6daa9b92f..3796632f7d 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -159,7 +159,7 @@ def xenlight_golang_define_union(ty = None, struct_name = '', union_name = ''):
     extras = []
 
     interface_name = '{0}_{1}_union'.format(struct_name, ty.keyvar.name)
-    interface_name = xenlight_golang_fmt_name(interface_name, exported=False)
+    interface_name = xenlight_golang_fmt_name(interface_name)
 
     s += 'type {0} interface {{\n'.format(interface_name)
     s += 'is{0}()\n'.format(interface_name)
@@ -341,7 +341,7 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
     field_name = xenlight_golang_fmt_name('{0}_union'.format(keyname))
 
     interface_name = '{0}_{1}_union'.format(struct_name, keyname)
-    interface_name = xenlight_golang_fmt_name(interface_name, exported=False)
+    interface_name = xenlight_golang_fmt_name(interface_name)
 
     cgo_keyname = keyname
     if cgo_keyname in go_keywords:
@@ -546,7 +546,7 @@ def xenlight_golang_union_to_C(ty = None, union_name = '',
     gokeytype = xenlight_golang_fmt_name(keytype)
 
     interface_name = '{0}_{1}_union'.format(struct_name, keyname)
-    interface_name = xenlight_golang_fmt_name(interface_name, exported=False)
+    interface_name = xenlight_golang_fmt_name(interface_name)
 
     cgo_keyname = keyname
     if cgo_keyname in go_keywords:
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index f2ceceb61c..a214dd9df6 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -337,18 +337,18 @@ State int
 Evtch int
 Rref int
 Connection ChannelConnection
-ConnectionUnion channelinfoConnectionUnion
+ConnectionUnion ChannelinfoConnectionUnion
 }
 
-type channelinfoConnectionUnion interface {
-ischannelinfoConnectionUnion()
+type ChannelinfoConnectionUnion interface {
+isChannelinfoConnectionUnion()
 }
 
 type ChannelinfoConnectionUnionPty struct {
 Path string
 }
 
-func (x ChannelinfoConnectionUnionPty) ischannelinfoConnectionUnion(){}
+func (x ChannelinfoConnectionUnionPty) isChannelinfoConnectionUnion(){}
 
 type Vminfo struct {
 Uuid Uuid
@@ -510,7 +510,7 @@ Apic Defbool
 DmRestrict Defbool
 Tee TeeType
 Type DomainType
-TypeUnion domainBuildInfoTypeUnion
+TypeUnion DomainBuildInfoTypeUnion
 ArchArm struct {
 GicVersion GicVersion
 Vuart VuartType
@@ -522,8 +522,8 @@ Altp2M Altp2MMode
 VmtraceBufKb int
 }
 
-type domainBuildInfoTypeUnion interface {
-isdomainBuildInfoTypeUnion()
+type DomainBuildInfoTypeUnion interface {
+isDomainBuildInfoTypeUnion()
 }
 
 type DomainBuildInfoTypeUnionHvm struct {
@@ -575,7 +575,7 @@ RdmMemBoundaryMemkb uint64
 McaCaps uint64
 }
 
-func (x DomainBuildInfoTypeUnionHvm) isdomainBuildInfoTypeUnion(){}
+func (x DomainBuildInfoTypeUnionHvm) isDomainBuildInfoTypeUnion(){}
 
 type DomainBuildInfoTypeUnionPv struct {
 Kernel string
@@ -588,7 +588,7 @@ Features string
 E820Host Defbool
 }
 
-func (x DomainBuildInfoTypeUnionPv) isdomainBuildInfoTypeUnion(){}
+func (x DomainBuildInfoTypeUnionPv) isDomainBuildInfoTypeUnion(){}
 
 type DomainBuildInfoTypeUnionPvh struct {
 Pvshim Defbool
@@ -597,7 +597,7 @@ PvshimCmdline string
 PvshimExtra string
 }
 
-func (x DomainBuildInfoTypeUnionPvh) isdomainBuildInfoTypeUnion(){}
+func (x DomainBuildInfoTypeUnionPvh) isDomainBuildInfoTypeUnion(){}
 
 type DeviceVfb struct {
 BackendDomid Domid
@@ -761,11 +761,11 @@ type DeviceUsbdev struct {
 Ctrl Devid
 Port int
 Type UsbdevType
-TypeUnion deviceUsbdevTypeUnion
+TypeUnion DeviceUsbdevTypeUnion
 }
 
-type deviceUsbdevTypeUnion interface {
-isdeviceUsbdevTypeUnion()
+type DeviceUsbdevTypeUnion interface {
+isDeviceUsbdevTypeUnion()
 }
 
 type DeviceUsbdevTypeUnionHostdev struct {
@@ -773,7 +773,7 @@ Hostbus byte
 Hostaddr byte
 }
 
-func (x DeviceUsbdevTypeUnionHostdev) isdeviceUsbdevTypeUnion(){}
+func (x DeviceUsbdevTypeUnionHostdev) isDeviceUsbdevTypeUnion(){}
 
 type DeviceDtdev struct {
 Path string
@@ -807,18 +807,18 @@ BackendDomname string
 Devid Devid
 Name string
 Connection ChannelConnection
-ConnectionUnion deviceChannelConnectionUnion
+ConnectionUnion DeviceChannelConnectionUnion
 }
 
-type deviceChannelConnectionUnion interface {
-isdeviceChannelConnectionUnion()
+type DeviceChannelConnectionUnion interface {
+isDeviceChannelConnectionUnion()
 }
 
 type DeviceChannelConnectionUnionSocket struct {
 Path string
 }
 
-func (x DeviceChannelConnectionUnionSocket) isdeviceChannelConnectionUnion(){}
+func (x DeviceChannelConnectionUnionSocket) isDeviceChannelConnectionUnion(){}
 
 type ConnectorParam struct {
 UniqueId string
@@ -1116,31 +1116,31 @@ Domid Domid
 Domuuid Uuid
 ForUser uint64
 Type EventType
-TypeUnion eventTypeUnion
+TypeUnion EventTypeUnion
 }
 
-type eventTypeUnion interface {
-iseventTypeUnion()
+type EventTypeUnion interface {
+isEventTypeUnion()
 }
 
 type EventTypeUnionDomainShutdown struct {
 ShutdownReason byte
 }
 
-func (x EventTypeUnionDomainShutdown) iseventTypeUnion(){}
+func (x EventTypeUnionDomainShutdown) isEventTypeUnion(){}
 
 type EventTypeUnionDiskEject struct {
 Vdev string
 Disk DeviceDisk
 }
 
-func (x EventTypeUnionDiskEject) iseventTypeUnion(){}
+func (x EventTypeUnionDiskEject) isEventTypeUnion(){}
 
 type EventTypeUnionOperationComplete struct {
 Rc int
 }
 
-func (x EventTypeUnionOperationComplete) iseventTypeUnion(){}
+func (x EventTypeUnionOperationComplete) isEventTypeUnion(){}
 
 type PsrCmtType int
 const(
@@ -1175,11 +1175,11 @@ PsrFeatTypeMba PsrFeatType = 2
 type PsrHwInfo struct {
 Id uint32
 Type PsrFeatType
-TypeUnion psrHwInfoTypeUnion
+TypeUnion PsrHwInfoTypeUnion
 }
 
-type psrHwInfoTypeUnion interface {
-ispsrHwInfoTypeUnion()
+type PsrHwInfoTypeUnion interface {
+isPsrHwInfoTypeUnion()
 }
 
 type PsrHwInfoTypeUnionCat struct {
@@ -1188,7 +1188,7 @@ CbmLen uint32
 CdpEnabled bool
 }
 
-func (x PsrHwInfoTypeUnionCat) ispsrHwInfoTypeUnion(){}
+func (x PsrHwInfoTypeUnionCat) isPsrHwInfoTypeUnion(){}
 
 type PsrHwInfoTypeUnionMba struct {
 CosMax uint32
@@ -1196,5 +1196,5 @@ ThrtlMax uint32
 Linear bool
 }
 
-func (x PsrHwInfoTypeUnionMba) ispsrHwInfoTypeUnion(){}
+func (x PsrHwInfoTypeUnionMba) isPsrHwInfoTypeUnion(){}
 
-- 
2.17.1


