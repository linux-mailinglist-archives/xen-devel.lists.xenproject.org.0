Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CB236E270
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 02:15:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119622.226234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKf-0007Nh-4v; Thu, 29 Apr 2021 00:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119622.226234; Thu, 29 Apr 2021 00:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKe-0007Ms-Vc; Thu, 29 Apr 2021 00:15:04 +0000
Received: by outflank-mailman (input) for mailman id 119622;
 Thu, 29 Apr 2021 00:15:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S48z=J2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lbuKd-00072A-U8
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 00:15:03 +0000
Received: from mail-qk1-x733.google.com (unknown [2607:f8b0:4864:20::733])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e524f946-e987-4ffd-935f-e56f2d0521ca;
 Thu, 29 Apr 2021 00:14:43 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id q136so44605561qka.7
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 17:14:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id r185sm1021694qkf.78.2021.04.28.17.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 17:14:42 -0700 (PDT)
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
X-Inumbo-ID: e524f946-e987-4ffd-935f-e56f2d0521ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=gmgGK17wIRa1DlqHFSQ1z3Zv/54AdOc2b0ySCVRt0yU=;
        b=OKNJ37sxZCgorQWpDPLeSEJcBm6eJe3y/hN4NqQtbP7wif3VlS/ztMfU4dGIk//aqz
         htT7IKDGhQ583NfaDB43UTo75FfOKjbEDmDUI+2MDY/o36LjTKiTUNbDD1IosAnl9jJk
         yMSyJvw8Hp67O+KpoJ1V+8W/7V+qhrjsygpe3n2ab4pw4iAc4XbUq283x4ECQVykc6C0
         0RGY0fnnttdZhTDp9Tkjg725E/HMCJJNn8UqU2hBkZuJgDB24+Ab5SYPJ67Bg2qPf9kk
         keUigpG40+MdYs+tR+ipH1ZNFYpH9fZYF2iGA7zBUfmm3BowguzFmXbHMXtlBxddoEyG
         sYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=gmgGK17wIRa1DlqHFSQ1z3Zv/54AdOc2b0ySCVRt0yU=;
        b=UM680fMaCB4R1ZXIHZawt3yRqVTqCFyWoTxBt3JndYHtMAKboyh6uaAJ/wYn77ipyo
         iU84jQCEmYV1auBJ0B4vtRJOMgyf/CIemX/U7o+omCUKtX5j0myOHxNMUSKs7b8UPkHd
         oO0Z1BqhDtVR0OEpge1YphAsVoSvfVmVX8txgr1NTMnoG6x47pkmLEjZFRst5YneFqsT
         1XWDzZuEwMFd0V9uKfigqmukBC2w67GAaftU+lOsqjz7hGY7a6pR+qbJiVtK+aT0/Ynj
         KtFBBcMzc5ciTjxAja9Sc9tkbfOSQkWsgp8S6mPlWsOYY8VOO9Yk9KE5iDeOQs7U432Z
         Nfnw==
X-Gm-Message-State: AOAM533syWJG0CgxXYnYgSJHYgzndRavzzcfhyV/l/sV+bct7BtVVM+w
	dA8MvxHLnMjcQdr4ooI08SlKbrZitk4=
X-Google-Smtp-Source: ABdhPJwJCDwbqS4/N2++moiTvGiiZFQkUvJeGhOuRY3EcwdojMxZhZuIoPVa0twtVUM0W8GZgVzdIg==
X-Received: by 2002:a05:620a:1025:: with SMTP id a5mr2345999qkk.395.1619655282448;
        Wed, 28 Apr 2021 17:14:42 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 05/12] golang/xenlight: use struct pointers in keyed union fields
Date: Wed, 28 Apr 2021 20:14:27 -0400
Message-Id: <ebeb085b9b4b5d3dddd66607b409590f5e7cdfc6.1619655104.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619650820.git.rosbrookn@ainfosec.com>
References: <cover.1619650820.git.rosbrookn@ainfosec.com>
In-Reply-To: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>
References: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>

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


