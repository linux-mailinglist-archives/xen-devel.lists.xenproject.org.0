Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FE62584AB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 02:11:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCttI-0001sA-N4; Tue, 01 Sep 2020 00:11:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn3Q=CK=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kCttH-0001rt-B1
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 00:11:11 +0000
X-Inumbo-ID: 36012594-5be5-4ae7-9f1b-36e5500f7e11
Received: from mail-qv1-xf2c.google.com (unknown [2607:f8b0:4864:20::f2c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36012594-5be5-4ae7-9f1b-36e5500f7e11;
 Tue, 01 Sep 2020 00:11:06 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id h1so1965691qvo.9
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2020 17:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=4NqMQIvKR+cjPWOKjy1YxbxPsO0+lnWPEKbNxZzXwjU=;
 b=jFvnfywmTtiMJU9SOpVcCiJlyCVr+Ri3bPz76Z9vfvCRsP0aVNQwmCJuIIe4n5mJFC
 Ei9Wmb4xE7QUS4CQnLhKfZvFAmP1FDLpxwYcBzr8kjh6DanQNEoPOUC4d7ZMbDHUtFGo
 kj1XOMRyNX++1fx4HboUNlmS4gN++4IvTqg8O0EsRFSp0lwIMXdiFtuOB3n9quubUOGP
 K1GiPbWP2IdMrA0Qi6uo3gDfuhMc6hhJF4uxrsFFnEKiBNpV0dDzE7IJsuW/4QhPZ9xC
 /TjNmiZHjXx97pwIAvjBELazGbAKd8PaOXxsbTiyKcW83jqM0Ole2KgB4ILiHQMcMXv0
 5aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=4NqMQIvKR+cjPWOKjy1YxbxPsO0+lnWPEKbNxZzXwjU=;
 b=oPJmKLNdJx1vW822mPY9puUBf7ulKZiPqafCtQAfy8tmg8Hd3S/QiDze/ZWIxS/Yfw
 xgH2dn36II7BByN4/+6fESoKqgbqFlMZueAz/trDjbdVIKMCQAELkZNYP0yvuokSwIpQ
 qUCai04b8sEI6ac7U1rJTa6id7tdx0ER0nH6IJR4t4+9szSRRNzmeL2v2KyZwhMXWKik
 JlnkhRBp9Y5uuI+1PWN5hrSeciDC/b6E1SrIggZjAuvkJQ0NdRj0i07f7STRc/W8qqZk
 q8PJ53N3n7jJ0rW1ZOuogV+/6Ym6UqJvUA+EeY9RMWSVx7fpNGeqtsDqXeQnH0xYxh4w
 QgBA==
X-Gm-Message-State: AOAM530ezEE9++6QlNo3ZgA+URfHxuGasosTdpdF4/KtFq+WtTlJFujs
 DYf0iLGez3HE0HNXUi4LnelI54JG+OU2Rg==
X-Google-Smtp-Source: ABdhPJy8fb0P45dahxyVr4Rd9ZAJ3OHpBcNNnw19/ETtG6rEJ3qkMfCdecS4x1/+QxwzzTBgO1WCOQ==
X-Received: by 2002:ad4:51c8:: with SMTP id p8mr3688380qvq.31.1598919065697;
 Mon, 31 Aug 2020 17:11:05 -0700 (PDT)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 d10sm3371675qkk.1.2020.08.31.17.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 17:11:05 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] golang/xenlight: export keyed union interface types
Date: Mon, 31 Aug 2020 20:10:57 -0400
Message-Id: <554916143fa18f389902cca888490d54cbb6b77a.1598918801.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598918801.git.rosbrookn@ainfosec.com>
References: <cover.1598918801.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1598918801.git.rosbrookn@ainfosec.com>
References: <cover.1598918801.git.rosbrookn@ainfosec.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

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
index ebec938224..9acc8c0b49 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -152,7 +152,7 @@ def xenlight_golang_define_union(ty = None, struct_name = '', union_name = ''):
     extras = []
 
     interface_name = '{0}_{1}_union'.format(struct_name, ty.keyvar.name)
-    interface_name = xenlight_golang_fmt_name(interface_name, exported=False)
+    interface_name = xenlight_golang_fmt_name(interface_name)
 
     s += 'type {0} interface {{\n'.format(interface_name)
     s += 'is{0}()\n'.format(interface_name)
@@ -334,7 +334,7 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
     field_name = xenlight_golang_fmt_name('{0}_union'.format(keyname))
 
     interface_name = '{0}_{1}_union'.format(struct_name, keyname)
-    interface_name = xenlight_golang_fmt_name(interface_name, exported=False)
+    interface_name = xenlight_golang_fmt_name(interface_name)
 
     cgo_keyname = keyname
     if cgo_keyname in go_keywords:
@@ -538,7 +538,7 @@ def xenlight_golang_union_to_C(ty = None, union_name = '',
     gokeytype = xenlight_golang_fmt_name(keytype)
 
     interface_name = '{0}_{1}_union'.format(struct_name, keyname)
-    interface_name = xenlight_golang_fmt_name(interface_name, exported=False)
+    interface_name = xenlight_golang_fmt_name(interface_name)
 
     cgo_keyname = keyname
     if cgo_keyname in go_keywords:
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 663c1e86b4..b143e32a9c 100644
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
@@ -518,8 +518,8 @@ Vuart VuartType
 Altp2M Altp2MMode
 }
 
-type domainBuildInfoTypeUnion interface {
-isdomainBuildInfoTypeUnion()
+type DomainBuildInfoTypeUnion interface {
+isDomainBuildInfoTypeUnion()
 }
 
 type DomainBuildInfoTypeUnionHvm struct {
@@ -571,7 +571,7 @@ RdmMemBoundaryMemkb uint64
 McaCaps uint64
 }
 
-func (x DomainBuildInfoTypeUnionHvm) isdomainBuildInfoTypeUnion(){}
+func (x DomainBuildInfoTypeUnionHvm) isDomainBuildInfoTypeUnion(){}
 
 type DomainBuildInfoTypeUnionPv struct {
 Kernel string
@@ -584,7 +584,7 @@ Features string
 E820Host Defbool
 }
 
-func (x DomainBuildInfoTypeUnionPv) isdomainBuildInfoTypeUnion(){}
+func (x DomainBuildInfoTypeUnionPv) isDomainBuildInfoTypeUnion(){}
 
 type DomainBuildInfoTypeUnionPvh struct {
 Pvshim Defbool
@@ -593,7 +593,7 @@ PvshimCmdline string
 PvshimExtra string
 }
 
-func (x DomainBuildInfoTypeUnionPvh) isdomainBuildInfoTypeUnion(){}
+func (x DomainBuildInfoTypeUnionPvh) isDomainBuildInfoTypeUnion(){}
 
 type DeviceVfb struct {
 BackendDomid Domid
@@ -756,11 +756,11 @@ type DeviceUsbdev struct {
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
@@ -768,7 +768,7 @@ Hostbus byte
 Hostaddr byte
 }
 
-func (x DeviceUsbdevTypeUnionHostdev) isdeviceUsbdevTypeUnion(){}
+func (x DeviceUsbdevTypeUnionHostdev) isDeviceUsbdevTypeUnion(){}
 
 type DeviceDtdev struct {
 Path string
@@ -802,18 +802,18 @@ BackendDomname string
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
@@ -1110,31 +1110,31 @@ Domid Domid
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
@@ -1169,11 +1169,11 @@ PsrFeatTypeMba PsrFeatType = 2
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
@@ -1182,7 +1182,7 @@ CbmLen uint32
 CdpEnabled bool
 }
 
-func (x PsrHwInfoTypeUnionCat) ispsrHwInfoTypeUnion(){}
+func (x PsrHwInfoTypeUnionCat) isPsrHwInfoTypeUnion(){}
 
 type PsrHwInfoTypeUnionMba struct {
 CosMax uint32
@@ -1190,5 +1190,5 @@ ThrtlMax uint32
 Linear bool
 }
 
-func (x PsrHwInfoTypeUnionMba) ispsrHwInfoTypeUnion(){}
+func (x PsrHwInfoTypeUnionMba) isPsrHwInfoTypeUnion(){}
 
-- 
2.17.1


