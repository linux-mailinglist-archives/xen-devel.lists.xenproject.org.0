Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F0456D4D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 11:30:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227749.394038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo1A1-00077O-Se; Fri, 19 Nov 2021 10:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227749.394038; Fri, 19 Nov 2021 10:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo1A1-00074v-PL; Fri, 19 Nov 2021 10:30:25 +0000
Received: by outflank-mailman (input) for mailman id 227749;
 Fri, 19 Nov 2021 10:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEpL=QG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mo19z-00074p-Ly
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 10:30:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b21f0dfb-4923-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 11:30:22 +0100 (CET)
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
X-Inumbo-ID: b21f0dfb-4923-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637317821;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mrEDCvLQp/TKMqvftLjGripCo8Tcgn3miH+kVAhxaAM=;
  b=QqCwgnleLBjr29dLyUqKcIg5+UovtfOuosrI6McD6Ar4oXrlhngypNvt
   8djeHCbD5nb98dPOU5w3hJyvPO7JQLFs88chvJfBkMGw6orxeJguTHOHH
   WOAe9RxYY6CPtHtI0QtMpnDLe3nXxydoyQmIqNrKbnlWNyhmepxHTZw8l
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: z0fV9fMWN9D1/M+XOFyaBt9ZquxqyUQdOy7T0bX5wFzdVGJQtTFNpcntU/CeIMDPMBGUrAFWt4
 oexMMQ1AJaw/t969p4OEL8f34hseTUKUXbJk5drqCYLMF+sk28Zg2YT9ldXVNStrTpvWYhkGdB
 +41zboCMQ2/M8Z+a8aR9554kIqdX7cN1MWcAn1NStljBuCkrbEgoSgBVBmYDzezG/NSOB7J5OK
 ay3LYC9AEllGJ8j+nqWyBHASmMlfPkeYB3X6m+je16Or5EBuRceYmAoe5iJVkOCnFv0Mt0IE93
 SSMqjlKikGVuUAfrceVu9nsX
X-SBRS: 5.1
X-MesageID: 58594730
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gcb3+av/JUrYkAr6HPru/R4BpOfnVLFZMUV32f8akzHdYApBsoF/q
 tZmKTvUMqrZamSjfdolbNiw8BsC6MPVmN8ySARrrChjQ3lB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2InhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplqI6KZhYHBpzwtLobYghCS35MF51J0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DN
 5dINWU0NHwsZTVQF1QvMY9lpNyZl37ubj1IgQ6opZoetj27IAtZj+G2bYu9lsaxbd9ShUyCo
 WXF+UzwAxcUM8eSwnyO9XfErvDLtTP2XsQVDrLQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa9VOpZsnwWQWip3yJtQJaXMBfe9DW8ynUlPCSuVzAQDFZEHgRM7TKqfPaWxQ3x
 GWmjv3RNABD7rukWGjFqYW+nTybbH19wXA5WQcISg4M4t/GqY41jw7SQtsLLJNZnuEZChmrn
 WnU8XFWa6E7yJdSiv7lpQyvbyeE/8CRFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdgTRH43h/5nzvp5p1QEwZ3Y1QvHNEBz3pRaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZ91l/a4RIS4C6CIBjarXnSXXFXalM2JTRTOt10BbWB2yf1vU
 XtlWZjE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz8uYdykEW9EO9fWHPXN7hRxPrd/G39r
 oYOX+PXmk43eLCvPUHqHXs7cAliwY4TXsut9aS6t4erf2JbJY3WI6OLnO56JdU6x/89eyWh1
 ijVZ3K0AWHX3RXvQThmoFg6NtsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:63K3UqgqZuIc6V7Vkb2n3/w+/XBQXtAji2hC6mlwRA09TySZ//
 rAoB19726QtN9xYgBGpTnuAsi9qB/nmKKdgrNhX4tKPjOHhILAFugLhuHfKlXbaknDH4Vmu5
 uIHZITNDSJNykYsfrH
X-IronPort-AV: E=Sophos;i="5.87,247,1631592000"; 
   d="scan'208";a="58594730"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Nick
 Rosbrook" <rosbrookn@ainfosec.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH for-4.16] golang/xenlight: regen generated code
Date: Fri, 19 Nov 2021 10:29:48 +0000
Message-ID: <20211119102948.156887-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes: 7379f9e10a3b ("gnttab: allow setting max version per-domain")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/golang/xenlight/helpers.gen.go | 4 ++++
 tools/golang/xenlight/types.gen.go   | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 6e1b05431056..b746ff108131 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -323,6 +323,7 @@ x.CpuTime = uint64(xc.cpu_time)
 x.VcpuMaxId = uint32(xc.vcpu_max_id)
 x.VcpuOnline = uint32(xc.vcpu_online)
 x.Cpupool = uint32(xc.cpupool)
+x.GpaddrBits = byte(xc.gpaddr_bits)
 x.DomainType = DomainType(xc.domain_type)
 
  return nil}
@@ -355,6 +356,7 @@ xc.cpu_time = C.uint64_t(x.CpuTime)
 xc.vcpu_max_id = C.uint32_t(x.VcpuMaxId)
 xc.vcpu_online = C.uint32_t(x.VcpuOnline)
 xc.cpupool = C.uint32_t(x.Cpupool)
+xc.gpaddr_bits = C.uint8_t(x.GpaddrBits)
 xc.domain_type = C.libxl_domain_type(x.DomainType)
 
  return nil
@@ -1012,6 +1014,7 @@ return fmt.Errorf("converting field VnumaNodes: %v", err) }
 }
 x.MaxGrantFrames = uint32(xc.max_grant_frames)
 x.MaxMaptrackFrames = uint32(xc.max_maptrack_frames)
+x.MaxGrantVersion = int(xc.max_grant_version)
 x.DeviceModelVersion = DeviceModelVersion(xc.device_model_version)
 if err := x.DeviceModelStubdomain.fromC(&xc.device_model_stubdomain);err != nil {
 return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
@@ -1341,6 +1344,7 @@ return fmt.Errorf("converting field VnumaNodes: %v", err)
 }
 xc.max_grant_frames = C.uint32_t(x.MaxGrantFrames)
 xc.max_maptrack_frames = C.uint32_t(x.MaxMaptrackFrames)
+xc.max_grant_version = C.int(x.MaxGrantVersion)
 xc.device_model_version = C.libxl_device_model_version(x.DeviceModelVersion)
 if err := x.DeviceModelStubdomain.toC(&xc.device_model_stubdomain); err != nil {
 return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index a0acfaacc3a8..b1e84d525843 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -316,6 +316,7 @@ CpuTime uint64
 VcpuMaxId uint32
 VcpuOnline uint32
 Cpupool uint32
+GpaddrBits byte
 DomainType DomainType
 }
 
@@ -479,6 +480,7 @@ BlkdevStart string
 VnumaNodes []VnodeInfo
 MaxGrantFrames uint32
 MaxMaptrackFrames uint32
+MaxGrantVersion int
 DeviceModelVersion DeviceModelVersion
 DeviceModelStubdomain Defbool
 StubdomainMemkb uint64
-- 
Anthony PERARD


