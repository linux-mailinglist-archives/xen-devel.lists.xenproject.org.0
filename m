Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CACE36E26E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 02:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119617.226209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKW-0007D6-5a; Thu, 29 Apr 2021 00:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119617.226209; Thu, 29 Apr 2021 00:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKW-0007Ca-1g; Thu, 29 Apr 2021 00:14:56 +0000
Received: by outflank-mailman (input) for mailman id 119617;
 Thu, 29 Apr 2021 00:14:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S48z=J2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lbuKT-00072A-Tx
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 00:14:53 +0000
Received: from mail-qk1-x731.google.com (unknown [2607:f8b0:4864:20::731])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2f678f5-9d9f-493b-ab92-319259b8698b;
 Thu, 29 Apr 2021 00:14:42 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id v23so13535062qkj.13
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 17:14:42 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id r185sm1021694qkf.78.2021.04.28.17.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 17:14:41 -0700 (PDT)
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
X-Inumbo-ID: d2f678f5-9d9f-493b-ab92-319259b8698b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=hfBP94KizJpDruLBLBLMUfOcD8AldREODeB/q9SIq2M=;
        b=nwB/PeMLkI5d5Mqyaog1rfa0K2BxHc+Qq5tQqH/hyNbAD8mcLSzN90mrysxA9dNmkC
         72SwKu3SVMXjLtLh8M+3S2y9GU4L2pnCItbWq1adnWsxSFEoHVT3gX5ES/1tg1c/JRxe
         jpvMkBTCQVXnkaPbTUZgyuKXddPHZIr6WahTALnVulbTPqX1WbmRD0Wvwgl2BNom614r
         Zi5WgKyqp5YPxLqdJV8lvoIo8b0K6IoaHmNI5jItQbBWp0uGC+xs8GO6Zd7PeK67oveH
         3u+I0ohJyC1cHAnwEyrtnF3JJvOi2l2gBg/rQJgvcYmieT++3Af7Np4pIWamdGRXr6lU
         WWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=hfBP94KizJpDruLBLBLMUfOcD8AldREODeB/q9SIq2M=;
        b=pTONOOesor04uXZTiDYzFTPA/tlZ+yUgN8TmG1HV0HBTZwGy0urJl3qdlJ/s4REA97
         hNgvDZx0K4Vw6ImtkRipmrm4m8Ysa3CfLYfBqyr2R5qK+a5HEw8+FIO9LVsT5fNJRMvo
         goaIZKR3myiMLpwAZvRUKimaSdanw5HN6Qn9d0HmwIHHrpYVLg2Kq/ae6Y1DBbAljnEg
         pwHzLy6HWWlVv/aps1dj+xtOQV6ercolDBxZIe0LvdG9tFiQgudtlvgTeqvv+mUkplZt
         HgfJtRXzStTJvGJOJaVuAsDwzlfC4qr/graOpYsrMkCxW12T1MVcyu/fb5cBw4R7wkEc
         h1+A==
X-Gm-Message-State: AOAM533Ta02snuHvxcAJYOK8R0dsRXVTauJ42TBJYhi2N2O0Lbn9+NzV
	8QK5VZh/dh0CDK9PxexNWKS7nQ9EfMg=
X-Google-Smtp-Source: ABdhPJxJ9iyXQi7HJ8FElJttOTZBsESnGgPJlcEya9pvWEkOAtrcG1pmBttr40tyMannomyjlrVwOQ==
X-Received: by 2002:a05:620a:24c4:: with SMTP id m4mr32883604qkn.114.1619655281508;
        Wed, 28 Apr 2021 17:14:41 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 04/12] golang/xenlight: export keyed union interface types
Date: Wed, 28 Apr 2021 20:14:26 -0400
Message-Id: <29a3fbc93262cb9b31f02d6c94c018b200dfa43e.1619655104.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619650820.git.rosbrookn@ainfosec.com>
References: <cover.1619650820.git.rosbrookn@ainfosec.com>
In-Reply-To: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>
References: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>

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


