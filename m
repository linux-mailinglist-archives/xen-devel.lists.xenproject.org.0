Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8731F9C17
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 17:40:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkrDB-0000NG-1B; Mon, 15 Jun 2020 15:39:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EAde=74=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jkrD9-0000NB-Is
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 15:39:47 +0000
X-Inumbo-ID: 70fbfbe2-af1e-11ea-8496-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70fbfbe2-af1e-11ea-8496-bc764e2007e4;
 Mon, 15 Jun 2020 15:39:46 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id b27so16090602qka.4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=r/4LSS2ARR1HnDNp9VBrA9sVpnsEV3py1FqBM276R1Y=;
 b=PDqXv6i7ad5sthSW66KEf0J+Y5CJEKhHQNO9/TNUF3IBMWQuR9VoFaVLBPDefrqzUJ
 iL4hJGIAN/VQbuZCo+nwo5w5K57tofgP2vUhH6o/z0ywT3kn87a9lJaGOrE8bS2aRuTD
 97bQd4jY/ZKBGpIAwOFVir+98vl6TyEu8m9mvHBi4ZqcQczIXy1mOb/Cet5CmsZMzoSY
 dn8gy+xQaAeMzyy/45MDZlJnCzDNvRb1nxTqS00fylNCj3TniLy72iZSJAC218iQk+DY
 flTMVRkKo/ut44XxVMlgo/Xu09ps4tDdSw/8PKtIHN1kg56K0eDwwZaPznFNJBKOBg4F
 YxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=r/4LSS2ARR1HnDNp9VBrA9sVpnsEV3py1FqBM276R1Y=;
 b=F5jCMQhWanlEhtiZP9PMYicpI6Rh6+qld0LU7t7QiEkEpNUw2qti7KPj5tPHZ4pbom
 0bFSatVP7nzbBnaM6284ttVotmopmgzUWDCZxkl0MdQM9n66eAfWaNSRJOlY0WwWUyHJ
 f/sPIfNa+RJ0WdBN7FX0zAAiGd2avV9tqk4cIrN/WDJb2ckPK/i37mxzNbIVHo1+jBF/
 JMUbWSEuY9hmbCe5osC9LFSlYo3Wtp/6x9nRmp4iY8PPys160xyGuxcm2vbZivsAq7QX
 4zety6qJaBnGBgvSfpp1JZgZjZMzWTJMexNyC24WBsnfn+Yz7rBEeK0lIDWA5GbbUY0s
 Tv7A==
X-Gm-Message-State: AOAM531mhZ1WMlpsekIUBN6GxVJG/nOCe5SSp4DH2oYm9TfgTUtwiOYA
 VguUaUpcpZ1OARF4Yrz9OBcbGnUJldc=
X-Google-Smtp-Source: ABdhPJy4dVJReJwLuos2mxrWp9SF0D8SBfTrktzn12eLIlKqafn5SmSl5yr2C6rWP8bKs2TxiFP06g==
X-Received: by 2002:a05:620a:9d8:: with SMTP id
 y24mr15434990qky.274.1592235586023; 
 Mon, 15 Jun 2020 08:39:46 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id o33sm12476014qtj.44.2020.06.15.08.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 08:39:45 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14] golang/xenlight: sort cases in switch statement
Date: Mon, 15 Jun 2020 11:39:42 -0400
Message-Id: <42ba06bc716cf91d25c8bb1d988cb1310219b8fe.1592234663.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Wei Liu <wl@xen.org>, paul@xen.org, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The xenlight_golang_union_from_C function iterates over a dict to
construct a switch statement that marshals a C keyed union into a Go
type. Because python does not guarantee dict ordering across all
versions, this can result in the switch statement being generated in a
different order depending on the version of python used. For example,
running gengotypes.py with python2.7 and python3.6 will yield different
orderings.

Iterate over sorted(cases.items()) rather than cases.items() to fix
this.

This patch changes the ordering from what was previously checked-in, but
running gengotypes.py with different versions of python will now yield
the same result.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
Andrew reported this in [1], so I intend this as a build fix for 4.14.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00881.html
---
 tools/golang/xenlight/gengotypes.py  |  2 +-
 tools/golang/xenlight/helpers.gen.go | 32 ++++++++++++++--------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index ecca59745f..557fecd07b 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -379,7 +379,7 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
 
     # Create switch statement to determine which 'union element'
     # to populate in the Go struct.
-    for case_name, case_tuple in cases.items():
+    for case_name, case_tuple in sorted(cases.items()):
         (case_val, case_type) = case_tuple
 
         s += 'case {}:\n'.format(case_val)
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 935d3bc50a..152c7e8e6b 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -431,8 +431,6 @@ x.Evtch = int(xc.evtch)
 x.Rref = int(xc.rref)
 x.Connection = ChannelConnection(xc.connection)
 switch x.Connection{
-case ChannelConnectionUnknown:
-x.ConnectionUnion = nil
 case ChannelConnectionPty:
 var connectionPty ChannelinfoConnectionUnionPty
 if err := connectionPty.fromC(xc);err != nil {
@@ -441,6 +439,8 @@ if err := connectionPty.fromC(xc);err != nil {
 x.ConnectionUnion = connectionPty
 case ChannelConnectionSocket:
 x.ConnectionUnion = nil
+case ChannelConnectionUnknown:
+x.ConnectionUnion = nil
 default:
 return fmt.Errorf("invalid union key '%v'", x.Connection)}
 
@@ -1098,6 +1098,8 @@ if err := typeHvm.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeHvm: %v", err)
 }
 x.TypeUnion = typeHvm
+case DomainTypeInvalid:
+x.TypeUnion = nil
 case DomainTypePv:
 var typePv DomainBuildInfoTypeUnionPv
 if err := typePv.fromC(xc);err != nil {
@@ -1110,8 +1112,6 @@ if err := typePvh.fromC(xc);err != nil {
  return fmt.Errorf("converting field typePvh: %v", err)
 }
 x.TypeUnion = typePvh
-case DomainTypeInvalid:
-x.TypeUnion = nil
 default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
@@ -2360,8 +2360,6 @@ x.Devid = Devid(xc.devid)
 x.Name = C.GoString(xc.name)
 x.Connection = ChannelConnection(xc.connection)
 switch x.Connection{
-case ChannelConnectionUnknown:
-x.ConnectionUnion = nil
 case ChannelConnectionPty:
 x.ConnectionUnion = nil
 case ChannelConnectionSocket:
@@ -2370,6 +2368,8 @@ if err := connectionSocket.fromC(xc);err != nil {
  return fmt.Errorf("converting field connectionSocket: %v", err)
 }
 x.ConnectionUnion = connectionSocket
+case ChannelConnectionUnknown:
+x.ConnectionUnion = nil
 default:
 return fmt.Errorf("invalid union key '%v'", x.Connection)}
 
@@ -3933,28 +3933,28 @@ return fmt.Errorf("converting field Domuuid: %v", err)
 x.ForUser = uint64(xc.for_user)
 x.Type = EventType(xc._type)
 switch x.Type{
-case EventTypeDomainShutdown:
-var typeDomainShutdown EventTypeUnionDomainShutdown
-if err := typeDomainShutdown.fromC(xc);err != nil {
- return fmt.Errorf("converting field typeDomainShutdown: %v", err)
-}
-x.TypeUnion = typeDomainShutdown
-case EventTypeDomainDeath:
-x.TypeUnion = nil
 case EventTypeDiskEject:
 var typeDiskEject EventTypeUnionDiskEject
 if err := typeDiskEject.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeDiskEject: %v", err)
 }
 x.TypeUnion = typeDiskEject
+case EventTypeDomainCreateConsoleAvailable:
+x.TypeUnion = nil
+case EventTypeDomainDeath:
+x.TypeUnion = nil
+case EventTypeDomainShutdown:
+var typeDomainShutdown EventTypeUnionDomainShutdown
+if err := typeDomainShutdown.fromC(xc);err != nil {
+ return fmt.Errorf("converting field typeDomainShutdown: %v", err)
+}
+x.TypeUnion = typeDomainShutdown
 case EventTypeOperationComplete:
 var typeOperationComplete EventTypeUnionOperationComplete
 if err := typeOperationComplete.fromC(xc);err != nil {
  return fmt.Errorf("converting field typeOperationComplete: %v", err)
 }
 x.TypeUnion = typeOperationComplete
-case EventTypeDomainCreateConsoleAvailable:
-x.TypeUnion = nil
 default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 
-- 
2.17.1


