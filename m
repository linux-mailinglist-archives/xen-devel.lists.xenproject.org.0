Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919832584AD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 02:11:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCttN-0001sX-W7; Tue, 01 Sep 2020 00:11:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn3Q=CK=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kCttM-0001rt-BB
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 00:11:16 +0000
X-Inumbo-ID: 8e8d1671-645a-4483-aff3-ca16b319ce19
Received: from mail-qt1-x830.google.com (unknown [2607:f8b0:4864:20::830])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e8d1671-645a-4483-aff3-ca16b319ce19;
 Tue, 01 Sep 2020 00:11:08 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id k18so6147929qtm.10
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2020 17:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=5ChwAZPKBJXfRIooObF/mR23x75fGlNBFyiMAw9Jq/8=;
 b=mwQrqXOu1DSz3/WiI3xwBvdp6E90F3+aImy0JdN4xrN23XTwtcNMnkf/PJofPG3nRM
 CLQ5oipb9OgvWbqxsH6yW5ZNyQw5QLf8vmUcH5u6KoU/Us2VWo8bvTYG1nbcfD3EZyHn
 OpDb8CL+7Y2jWM73S9ytmndJm3NqVvVZfDDmqbYSnk8WSqJU9n4zOsnm7q6sDdHeALZe
 IMMd4LyaTGBnzUuN5xh+EOXztvDqdwUJHwRXp0i2/LllnKZH7u7thVurgEeHSa44LMxv
 DqbUw8vLFiSzfvC+SS4cib1f9Mf75b3N1gbEiGUO4yniildP37Ud3Js0GzKBN+o6P5Ox
 Dq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=5ChwAZPKBJXfRIooObF/mR23x75fGlNBFyiMAw9Jq/8=;
 b=ncp2fdVvzh//YrjujOEb7qST/QZonwO2gK5h4bl1F9nTUWxTUS0caChsUtm7OlMvU1
 u8vKOqHxzAuJhIZJEAdNK3USmaK1aoFZDw8d88gLkygR8qa/BFLwXmDPHOO8BYMSPQ1j
 0aRf2Kh5L6dlVieA6g6ODHOiTgkX4sBKxB0zRsymFgd++wDDMOiWhUPfQ0KLFAvIWoDq
 8kHLhR2+xzdXIAWtZoLgD8tFH+U7CHc+dCG4WtqFZ8GX+/203vK2LwMgtpVFXWRt7i9q
 wsaw+36p7gTU/CXH2wvA7yuotdDxKcIXhegEaWheirz4i2mouj7a01TzGx+j7UE3yPza
 2pUw==
X-Gm-Message-State: AOAM5335c4kKA/0yvIyPiL6M7BrYPi0KJ6D/WnjlsdqE0LECd45uRsVy
 QdCrmElgDOCb+2ZwejwL2nw22i1B1A0l6g==
X-Google-Smtp-Source: ABdhPJy715YUYk/ht8ekkXDjWBE9mg5R91qYbPlbr31ucbKHNdWjJf2jY7mBATo7Pc82fybnts1luA==
X-Received: by 2002:ac8:4548:: with SMTP id z8mr3978566qtn.291.1598919067240; 
 Mon, 31 Aug 2020 17:11:07 -0700 (PDT)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 d10sm3371675qkk.1.2020.08.31.17.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 17:11:06 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] golang/xenlight: use struct pointers in keyed union fields
Date: Mon, 31 Aug 2020 20:10:58 -0400
Message-Id: <ff4abe23234dd6057761009c61732cc61eecf1f8.1598918801.git.rosbrookn@ainfosec.com>
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

Currently, when marshalig Go types with keyed union fields, we assign the
value of the struct (e.g. DomainBuildInfoTypeUnionHvm) which implements the
interface of the keyed union field (e.g. DomainBuildInfoTypeUnion).
As-is, this means that if a populated DomainBuildInfo is marshaled to
e.g. JSON, unmarshaling back to DomainBuildInfo will fail.

When the encoding/json is unmarshaling data into a Go type, and
encounters a JSON object, it basically can either marshal the data into
an empty interface, a map, or a struct. It cannot, however, marshal data
into an interface with at least one method defined on it (e.g.
DomainBuildInfoTypeUnion). Before this check is done, however, the
decoder will check if the Go type is a pointer, and dereference it if
so. It will then use the type of this value as the "target" type.

This means that if the TypeUnion field is populated with a
DomainBuildInfoTypeUnion, the decoder will see a non-empty interface and
fail. If the TypeUnion field is populated with a
*DomainBuildInfoTypeUnionHvm, it dereferences the pointer and sees a
struct instead, allowing decoding to continue normally.

Since there does not appear to be a strict need for NOT using pointers
in these fields, update code generation to set keyed union fields to
pointers of their implementing structs.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/gengotypes.py  |  4 +--
 tools/golang/xenlight/helpers.gen.go | 44 ++++++++++++++--------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index 9acc8c0b49..a802c371b6 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -397,7 +397,7 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
         s += 'if err := {0}.fromC(xc);'.format(goname)
         s += 'err != nil {{\n return fmt.Errorf("converting field {0}: %v", err)\n}}\n'.format(goname)
 
-        s += 'x.{0} = {1}\n'.format(field_name, goname)
+        s += 'x.{0} = &{1}\n'.format(field_name, goname)
 
     # End switch statement
     s += 'default:\n'
@@ -563,7 +563,7 @@ def xenlight_golang_union_to_C(ty = None, union_name = '',
         gotype  = xenlight_golang_fmt_name(cgotype)
 
         field_name = xenlight_golang_fmt_name('{0}_union'.format(keyname))
-        s += 'tmp, ok := x.{0}.({1})\n'.format(field_name,gotype)
+        s += 'tmp, ok := x.{0}.(*{1})\n'.format(field_name,gotype)
         s += 'if !ok {\n'
         s += 'return errors.New("wrong type for union key {0}")\n'.format(keyname)
         s += '}\n'
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 152c7e8e6b..1a7ff89c7c 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -436,7 +436,7 @@ var connectionPty ChannelinfoConnectionUnionPty
 if err := connectionPty.fromC(xc);err != nil {
  return fmt.Errorf("converting field connectionPty: %v", err)
 }
-x.ConnectionUnion = connectionPty
+x.ConnectionUnion = &connectionPty
 case ChannelConnectionSocket:
 x.ConnectionUnion = nil
 case ChannelConnectionUnknown:
@@ -476,7 +476,7 @@ switch x.Connection{
 case ChannelConnectionUnknown:
 break
 case ChannelConnectionPty:
-tmp, ok := x.ConnectionUnion.(ChannelinfoConnectionUnionPty)
+tmp, ok := x.ConnectionUnion.(*ChannelinfoConnectionUnionPty)
 if !ok {
 return errors.New("wrong type for union key connection")
 }
@@ -1097,7 +1097,7 @@ var typeHvm DomainBuildInfoTypeUnionHvm
 if err := typeHvm.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeHvm: %v", err)
 }
-x.TypeUnion = typeHvm
+x.TypeUnion = &typeHvm
 case DomainTypeInvalid:
 x.TypeUnion = nil
 case DomainTypePv:
@@ -1105,13 +1105,13 @@ var typePv DomainBuildInfoTypeUnionPv
 if err := typePv.fromC(xc);err != nil {
  return fmt.Errorf("converting field typePv: %v", err)
 }
-x.TypeUnion = typePv
+x.TypeUnion = &typePv
 case DomainTypePvh:
 var typePvh DomainBuildInfoTypeUnionPvh
 if err := typePvh.fromC(xc);err != nil {
  return fmt.Errorf("converting field typePvh: %v", err)
 }
-x.TypeUnion = typePvh
+x.TypeUnion = &typePvh
 default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
@@ -1426,7 +1426,7 @@ xc.tee = C.libxl_tee_type(x.Tee)
 xc._type = C.libxl_domain_type(x.Type)
 switch x.Type{
 case DomainTypeHvm:
-tmp, ok := x.TypeUnion.(DomainBuildInfoTypeUnionHvm)
+tmp, ok := x.TypeUnion.(*DomainBuildInfoTypeUnionHvm)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -1544,7 +1544,7 @@ hvm.mca_caps = C.uint64_t(tmp.McaCaps)
 hvmBytes := C.GoBytes(unsafe.Pointer(&hvm),C.sizeof_libxl_domain_build_info_type_union_hvm)
 copy(xc.u[:],hvmBytes)
 case DomainTypePv:
-tmp, ok := x.TypeUnion.(DomainBuildInfoTypeUnionPv)
+tmp, ok := x.TypeUnion.(*DomainBuildInfoTypeUnionPv)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -1569,7 +1569,7 @@ return fmt.Errorf("converting field E820Host: %v", err)
 pvBytes := C.GoBytes(unsafe.Pointer(&pv),C.sizeof_libxl_domain_build_info_type_union_pv)
 copy(xc.u[:],pvBytes)
 case DomainTypePvh:
-tmp, ok := x.TypeUnion.(DomainBuildInfoTypeUnionPvh)
+tmp, ok := x.TypeUnion.(*DomainBuildInfoTypeUnionPvh)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -2149,7 +2149,7 @@ var typeHostdev DeviceUsbdevTypeUnionHostdev
 if err := typeHostdev.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeHostdev: %v", err)
 }
-x.TypeUnion = typeHostdev
+x.TypeUnion = &typeHostdev
 default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 
@@ -2176,7 +2176,7 @@ xc.port = C.int(x.Port)
 xc._type = C.libxl_usbdev_type(x.Type)
 switch x.Type{
 case UsbdevTypeHostdev:
-tmp, ok := x.TypeUnion.(DeviceUsbdevTypeUnionHostdev)
+tmp, ok := x.TypeUnion.(*DeviceUsbdevTypeUnionHostdev)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -2367,7 +2367,7 @@ var connectionSocket DeviceChannelConnectionUnionSocket
 if err := connectionSocket.fromC(xc);err != nil {
  return fmt.Errorf("converting field connectionSocket: %v", err)
 }
-x.ConnectionUnion = connectionSocket
+x.ConnectionUnion = &connectionSocket
 case ChannelConnectionUnknown:
 x.ConnectionUnion = nil
 default:
@@ -2403,7 +2403,7 @@ break
 case ChannelConnectionPty:
 break
 case ChannelConnectionSocket:
-tmp, ok := x.ConnectionUnion.(DeviceChannelConnectionUnionSocket)
+tmp, ok := x.ConnectionUnion.(*DeviceChannelConnectionUnionSocket)
 if !ok {
 return errors.New("wrong type for union key connection")
 }
@@ -3938,7 +3938,7 @@ var typeDiskEject EventTypeUnionDiskEject
 if err := typeDiskEject.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeDiskEject: %v", err)
 }
-x.TypeUnion = typeDiskEject
+x.TypeUnion = &typeDiskEject
 case EventTypeDomainCreateConsoleAvailable:
 x.TypeUnion = nil
 case EventTypeDomainDeath:
@@ -3948,13 +3948,13 @@ var typeDomainShutdown EventTypeUnionDomainShutdown
 if err := typeDomainShutdown.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeDomainShutdown: %v", err)
 }
-x.TypeUnion = typeDomainShutdown
+x.TypeUnion = &typeDomainShutdown
 case EventTypeOperationComplete:
 var typeOperationComplete EventTypeUnionOperationComplete
 if err := typeOperationComplete.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeOperationComplete: %v", err)
 }
-x.TypeUnion = typeOperationComplete
+x.TypeUnion = &typeOperationComplete
 default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 
@@ -4009,7 +4009,7 @@ xc.for_user = C.uint64_t(x.ForUser)
 xc._type = C.libxl_event_type(x.Type)
 switch x.Type{
 case EventTypeDomainShutdown:
-tmp, ok := x.TypeUnion.(EventTypeUnionDomainShutdown)
+tmp, ok := x.TypeUnion.(*EventTypeUnionDomainShutdown)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -4020,7 +4020,7 @@ copy(xc.u[:],domain_shutdownBytes)
 case EventTypeDomainDeath:
 break
 case EventTypeDiskEject:
-tmp, ok := x.TypeUnion.(EventTypeUnionDiskEject)
+tmp, ok := x.TypeUnion.(*EventTypeUnionDiskEject)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -4033,7 +4033,7 @@ return fmt.Errorf("converting field Disk: %v", err)
 disk_ejectBytes := C.GoBytes(unsafe.Pointer(&disk_eject),C.sizeof_libxl_event_type_union_disk_eject)
 copy(xc.u[:],disk_ejectBytes)
 case EventTypeOperationComplete:
-tmp, ok := x.TypeUnion.(EventTypeUnionOperationComplete)
+tmp, ok := x.TypeUnion.(*EventTypeUnionOperationComplete)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -4108,13 +4108,13 @@ var typeCat PsrHwInfoTypeUnionCat
 if err := typeCat.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeCat: %v", err)
 }
-x.TypeUnion = typeCat
+x.TypeUnion = &typeCat
 case PsrFeatTypeMba:
 var typeMba PsrHwInfoTypeUnionMba
 if err := typeMba.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeMba: %v", err)
 }
-x.TypeUnion = typeMba
+x.TypeUnion = &typeMba
 default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 
@@ -4153,7 +4153,7 @@ xc.id = C.uint32_t(x.Id)
 xc._type = C.libxl_psr_feat_type(x.Type)
 switch x.Type{
 case PsrFeatTypeCat:
-tmp, ok := x.TypeUnion.(PsrHwInfoTypeUnionCat)
+tmp, ok := x.TypeUnion.(*PsrHwInfoTypeUnionCat)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -4164,7 +4164,7 @@ cat.cdp_enabled = C.bool(tmp.CdpEnabled)
 catBytes := C.GoBytes(unsafe.Pointer(&cat),C.sizeof_libxl_psr_hw_info_type_union_cat)
 copy(xc.u[:],catBytes)
 case PsrFeatTypeMba:
-tmp, ok := x.TypeUnion.(PsrHwInfoTypeUnionMba)
+tmp, ok := x.TypeUnion.(*PsrHwInfoTypeUnionMba)
 if !ok {
 return errors.New("wrong type for union key type")
 }
-- 
2.17.1


