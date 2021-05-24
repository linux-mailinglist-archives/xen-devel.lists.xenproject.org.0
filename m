Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162E238F47B
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131885.246318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKx-0003hv-TC; Mon, 24 May 2021 20:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131885.246318; Mon, 24 May 2021 20:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKx-0003cg-ON; Mon, 24 May 2021 20:38:07 +0000
Received: by outflank-mailman (input) for mailman id 131885;
 Mon, 24 May 2021 20:38:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHKv-0001ey-S7
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:38:05 +0000
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 371a11a3-daef-4f03-870a-063378a3ebe8;
 Mon, 24 May 2021 20:37:45 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id f8so21602691qth.6
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:44 -0700 (PDT)
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
X-Inumbo-ID: 371a11a3-daef-4f03-870a-063378a3ebe8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=gmgGK17wIRa1DlqHFSQ1z3Zv/54AdOc2b0ySCVRt0yU=;
        b=B05k9j4uMyR1hRjIwmDxThYoVmBYL2zqqZjqz943qVU+pE1JKzh6R+y+4aYxEetmDn
         ZRUXr9S93x/qWIe/8BXNDwjEXv0h1jYA2DnIGWFaAVSaIHd2keq3W96tCUdrscC2rAIK
         fvXYT84dAnD2sf6fe4Zd+toxcowKimjLuC4uFK+pQMKthzKPnYuzmopkzRUI6X4F1bGj
         m4uLFrRufBfGPmnI2efNm6UNsQIFVgCXL+sADX2VYz4fBkRldOXlXIVJQvRaGFKI8iaE
         A+LKWKSFVyXYwPVRsPN90Pw5kVe52qIiFh1kuOEiieRyjw6OypJ+f5L0f4bvwucRB7EY
         +JIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=gmgGK17wIRa1DlqHFSQ1z3Zv/54AdOc2b0ySCVRt0yU=;
        b=paC669tCplGCgMzXHNTvj+mTnp+WK272/AVudAfAd0yRyXuji+wtTeV6R60HEFRkvw
         YWa0IzOeGP3HUijzVw8PqOhuOTwhCtWs/obNbJmvqu5WdlTIvRcQlLe7EUAX6muNWrnQ
         ArlpaZSPtgSf1NShXGWDkP0Cx37U/wPpVke4shfyz1iv5+KbwuM3oDhqJYCXnk6ccvb5
         WLh9OPMzxAwMhj6FnMZMnnOtksr1L+roCuVH8e7rBD40Ae1IZUNcKBDuBVXMQqIaSSlD
         huuArC4vNTOpsTeYAbqqbP5CBLUhfOJ/B+sJrbucB257FmTirMP40TGKDmRQXWQV4MQo
         CPHg==
X-Gm-Message-State: AOAM5301rGOuLqW7EKwS2oYiWlvZh+lhO2lFw5g8Ov/kzFXViuwR/+uS
	7GpZQ9kN98nankTepQqNv7s=
X-Google-Smtp-Source: ABdhPJydQniZGUyZMjJR+HeCNDL6lVO7LbJWXrKQPMkjEMzzgQBlIsoCwdB54Q4X4AyvnLF9qbJ/Uw==
X-Received: by 2002:a05:622a:144d:: with SMTP id v13mr735850qtx.4.1621888664835;
        Mon, 24 May 2021 13:37:44 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 05/12] golang/xenlight: use struct pointers in keyed union fields
Date: Mon, 24 May 2021 16:36:46 -0400
Message-Id: <ebeb085b9b4b5d3dddd66607b409590f5e7cdfc6.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

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
index 3796632f7d..57f2576468 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -404,7 +404,7 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
         s += 'if err := {0}.fromC(xc);'.format(goname)
         s += 'err != nil {{\n return fmt.Errorf("converting field {0}: %v", err)\n}}\n'.format(goname)
 
-        s += 'x.{0} = {1}\n'.format(field_name, goname)
+        s += 'x.{0} = &{1}\n'.format(field_name, goname)
 
     # End switch statement
     s += 'default:\n'
@@ -571,7 +571,7 @@ def xenlight_golang_union_to_C(ty = None, union_name = '',
         gotype  = xenlight_golang_fmt_name(cgotype)
 
         field_name = xenlight_golang_fmt_name('{0}_union'.format(keyname))
-        s += 'tmp, ok := x.{0}.({1})\n'.format(field_name,gotype)
+        s += 'tmp, ok := x.{0}.(*{1})\n'.format(field_name,gotype)
         s += 'if !ok {\n'
         s += 'return errors.New("wrong type for union key {0}")\n'.format(keyname)
         s += '}\n'
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 5222898fb8..8fc5ec1649 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -443,7 +443,7 @@ var connectionPty ChannelinfoConnectionUnionPty
 if err := connectionPty.fromC(xc);err != nil {
  return fmt.Errorf("converting field connectionPty: %v", err)
 }
-x.ConnectionUnion = connectionPty
+x.ConnectionUnion = &connectionPty
 case ChannelConnectionSocket:
 x.ConnectionUnion = nil
 case ChannelConnectionUnknown:
@@ -485,7 +485,7 @@ switch x.Connection{
 case ChannelConnectionUnknown:
 break
 case ChannelConnectionPty:
-tmp, ok := x.ConnectionUnion.(ChannelinfoConnectionUnionPty)
+tmp, ok := x.ConnectionUnion.(*ChannelinfoConnectionUnionPty)
 if !ok {
 return errors.New("wrong type for union key connection")
 }
@@ -1120,7 +1120,7 @@ var typeHvm DomainBuildInfoTypeUnionHvm
 if err := typeHvm.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeHvm: %v", err)
 }
-x.TypeUnion = typeHvm
+x.TypeUnion = &typeHvm
 case DomainTypeInvalid:
 x.TypeUnion = nil
 case DomainTypePv:
@@ -1128,13 +1128,13 @@ var typePv DomainBuildInfoTypeUnionPv
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
@@ -1465,7 +1465,7 @@ xc.tee = C.libxl_tee_type(x.Tee)
 xc._type = C.libxl_domain_type(x.Type)
 switch x.Type{
 case DomainTypeHvm:
-tmp, ok := x.TypeUnion.(DomainBuildInfoTypeUnionHvm)
+tmp, ok := x.TypeUnion.(*DomainBuildInfoTypeUnionHvm)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -1593,7 +1593,7 @@ hvm.mca_caps = C.uint64_t(tmp.McaCaps)
 hvmBytes := C.GoBytes(unsafe.Pointer(&hvm),C.sizeof_libxl_domain_build_info_type_union_hvm)
 copy(xc.u[:],hvmBytes)
 case DomainTypePv:
-tmp, ok := x.TypeUnion.(DomainBuildInfoTypeUnionPv)
+tmp, ok := x.TypeUnion.(*DomainBuildInfoTypeUnionPv)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -1623,7 +1623,7 @@ return fmt.Errorf("converting field E820Host: %v", err)
 pvBytes := C.GoBytes(unsafe.Pointer(&pv),C.sizeof_libxl_domain_build_info_type_union_pv)
 copy(xc.u[:],pvBytes)
 case DomainTypePvh:
-tmp, ok := x.TypeUnion.(DomainBuildInfoTypeUnionPvh)
+tmp, ok := x.TypeUnion.(*DomainBuildInfoTypeUnionPvh)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -2283,7 +2283,7 @@ var typeHostdev DeviceUsbdevTypeUnionHostdev
 if err := typeHostdev.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeHostdev: %v", err)
 }
-x.TypeUnion = typeHostdev
+x.TypeUnion = &typeHostdev
 default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 
@@ -2310,7 +2310,7 @@ xc.port = C.int(x.Port)
 xc._type = C.libxl_usbdev_type(x.Type)
 switch x.Type{
 case UsbdevTypeHostdev:
-tmp, ok := x.TypeUnion.(DeviceUsbdevTypeUnionHostdev)
+tmp, ok := x.TypeUnion.(*DeviceUsbdevTypeUnionHostdev)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -2508,7 +2508,7 @@ var connectionSocket DeviceChannelConnectionUnionSocket
 if err := connectionSocket.fromC(xc);err != nil {
  return fmt.Errorf("converting field connectionSocket: %v", err)
 }
-x.ConnectionUnion = connectionSocket
+x.ConnectionUnion = &connectionSocket
 case ChannelConnectionUnknown:
 x.ConnectionUnion = nil
 default:
@@ -2546,7 +2546,7 @@ break
 case ChannelConnectionPty:
 break
 case ChannelConnectionSocket:
-tmp, ok := x.ConnectionUnion.(DeviceChannelConnectionUnionSocket)
+tmp, ok := x.ConnectionUnion.(*DeviceChannelConnectionUnionSocket)
 if !ok {
 return errors.New("wrong type for union key connection")
 }
@@ -4107,7 +4107,7 @@ var typeDiskEject EventTypeUnionDiskEject
 if err := typeDiskEject.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeDiskEject: %v", err)
 }
-x.TypeUnion = typeDiskEject
+x.TypeUnion = &typeDiskEject
 case EventTypeDomainCreateConsoleAvailable:
 x.TypeUnion = nil
 case EventTypeDomainDeath:
@@ -4117,13 +4117,13 @@ var typeDomainShutdown EventTypeUnionDomainShutdown
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
 
@@ -4178,7 +4178,7 @@ xc.for_user = C.uint64_t(x.ForUser)
 xc._type = C.libxl_event_type(x.Type)
 switch x.Type{
 case EventTypeDomainShutdown:
-tmp, ok := x.TypeUnion.(EventTypeUnionDomainShutdown)
+tmp, ok := x.TypeUnion.(*EventTypeUnionDomainShutdown)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -4189,7 +4189,7 @@ copy(xc.u[:],domain_shutdownBytes)
 case EventTypeDomainDeath:
 break
 case EventTypeDiskEject:
-tmp, ok := x.TypeUnion.(EventTypeUnionDiskEject)
+tmp, ok := x.TypeUnion.(*EventTypeUnionDiskEject)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -4203,7 +4203,7 @@ return fmt.Errorf("converting field Disk: %v", err)
 disk_ejectBytes := C.GoBytes(unsafe.Pointer(&disk_eject),C.sizeof_libxl_event_type_union_disk_eject)
 copy(xc.u[:],disk_ejectBytes)
 case EventTypeOperationComplete:
-tmp, ok := x.TypeUnion.(EventTypeUnionOperationComplete)
+tmp, ok := x.TypeUnion.(*EventTypeUnionOperationComplete)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -4278,13 +4278,13 @@ var typeCat PsrHwInfoTypeUnionCat
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
 
@@ -4323,7 +4323,7 @@ xc.id = C.uint32_t(x.Id)
 xc._type = C.libxl_psr_feat_type(x.Type)
 switch x.Type{
 case PsrFeatTypeCat:
-tmp, ok := x.TypeUnion.(PsrHwInfoTypeUnionCat)
+tmp, ok := x.TypeUnion.(*PsrHwInfoTypeUnionCat)
 if !ok {
 return errors.New("wrong type for union key type")
 }
@@ -4334,7 +4334,7 @@ cat.cdp_enabled = C.bool(tmp.CdpEnabled)
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


