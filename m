Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD07B476594
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 23:22:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247616.426984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxcea-0005M8-Um; Wed, 15 Dec 2021 22:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247616.426984; Wed, 15 Dec 2021 22:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxcea-0005J1-Q7; Wed, 15 Dec 2021 22:21:40 +0000
Received: by outflank-mailman (input) for mailman id 247616;
 Wed, 15 Dec 2021 22:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LTfI=RA=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxceZ-0005Iv-6h
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 22:21:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d6815eb-5df5-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 23:21:37 +0100 (CET)
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
X-Inumbo-ID: 5d6815eb-5df5-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639606897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WS7TqjZJbtgUipE6pePfwgLxq9oaFQsVTAwBm5aBAdY=;
  b=caaZPpe9V1lnqVaAsPV2Gl4ObbMZ0hn8h5unxxQW4eVM9Geq9yeqr4Ug
   mTUbIOLldFwnUXUBB9VjwRRVFC73BR/b0cxDle3kvcZdRNYzE6LJfw1v/
   6CPj8mp04ei6EktKxzrOLCivE8Pa7VAZO7N/oWfYxATXV0ba8ZKG5kqCq
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CIghVhnnSCByUBP/iUbUGkqFldz5Ml1iaGVjnjha/bNdwNGXWiiJlyBagz3YpSZpFB01MIwTgr
 o10nqib/3NdcT7Swd8M1J5Fw0rEb9udkY6uGsmJEjIhNQ0HWZOJWL7ZoY0FXA4VChDob47zJkd
 akwCBa2I/iUbWUe6gcQtGzahT6XYPrFXELIiyWFPi87fKOFIGRdJ1Jppg+Asol4E71n8ytvV8w
 nUk8nOuxawuYYkqnMPrgymcLB1hdqyXIsOuIEAwfC2Us2fWN76tmEl0++1a5DOY06YM39zIMUv
 IZqHcUR2u4SmPB7eMnsrV++g
X-SBRS: 5.1
X-MesageID: 62205277
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+RoyF6+3nB6vw2SGn8ppDrUDTXmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 zMcD2mEPKqIN2ume91ybNuw8BlUvcTQy95iGwFqqik8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug6wrRg39Yz6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgr9
 s1MhcSaWTx4EfOQucBFajoASnhHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4UR66DP
 ZVGAdZpRD/DRyRpAVAdM4N9ke2Eu3DbYTFg73vA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0AeRIEt1iwhG2m4WKvye9XlEnFmcYUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9zABbvzt68owGOlor+p5
 iJsdy+2tr9mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ldRo4aZlUJGWxO
 yc/XD+9ArcJZhNGioctPOqM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6CHfjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClIOMAkc5zX5mNvNoqRpwPZYkPnm5
 Ha4VhMKwVbznySfew6LdmpiePXkWpMm9SA3OiklPFCJ3Xk/YNnwsPdDJsVvJbR3pvZ+yfNUT
 uUef5nSCPp4VTmaqS8WaoPwrdI+eU3z1x6OJSesfBM2Y4VkG17S4tbhcwa2rHsOAyO7uNEQu
 bql0g+HE5MPSx47VJTdae61zkP3tn8YwbogU0zNK9hVWUPt7Ik1dHCh0q5pe5kBcEyRyCGb2
 gCaBQYjidPM+4JlosPUga2krpuyF7csFERtAGSGv629MjPX/zT/zNYYAvqIZz3USEj95L6mO
 bdO1/j5PfAKwARKvo57H+o5xK4y/YKy9bpTzwAiF3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZO3CkMVKSokcv+HhKMdlTTl5PgoJFn3uX1s972dXEQOZxSBhUSx9leu3F/JF
 Qv5hPMr1g==
IronPort-HdrOrdr: A9a23:p9s7Ya0Zlyq/sjgJC8wRuAqjBIgkLtp133Aq2lEZdPRUGvb4qy
 nIpoVi6faUskdpZJhOo6HiBEDtexzhHNtOkO0s1NSZLW/bUQmTXeNfBOLZqlWKcUCTygce79
 YGT0EXMqyKMbEQt6bHCWeDferIuOP3lZyVuQ==
X-IronPort-AV: E=Sophos;i="5.88,209,1635220800"; 
   d="scan'208";a="62205277"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/4] x86/cpuid: Advertise SERIALIZE by default to guests
Date: Wed, 15 Dec 2021 22:21:15 +0000
Message-ID: <20211215222115.6829-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211215222115.6829-1-andrew.cooper3@citrix.com>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I've played with SERIALIZE, TSXLDTRK, MOVDIRI and MOVDIR64 on real hardware,
and they all seem fine, including emulation support.

SERIALIZE exists specifically to have a userspace usable serialising operation
without other side effects.  (The only other two choices are CPUID which is a
VMExit under virt and clobbers 4 registers, and IRET-to-self which very slow
and consumes content from the stack.)

TSXLDTRK is a niche TSX feature, and TSX itself is niche outside of demos of
speculative sidechannels.  Leave the feature opt-in until a usecase is found,
in an effort to preempt the multiple person years of effort it has taken to
mop up TSX issues impacting every processor line.

MOVDIRI and MOVDIR64 are harder to judge.  They're architectural building
blocks towards ENQCMD{,S} without obvious usecases on their own.  They're of
no use to domains without PCI devices, so leave them opt-in for now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 647ee9e5e277..0b399375566f 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -278,7 +278,7 @@ XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MCU_OPT_CTRL and RNGDS_MITG_DIS.
 XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
 XEN_CPUFEATURE(RTM_ALWAYS_ABORT, 9*32+11) /*! June 2021 TSX defeaturing in microcode. */
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
-XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*a  SERIALIZE insn */
+XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
 XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
-- 
2.11.0


