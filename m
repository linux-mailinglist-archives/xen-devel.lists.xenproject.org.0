Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA89B7E76CA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 02:46:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629887.982435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1GaF-0000gK-Gp; Fri, 10 Nov 2023 01:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629887.982435; Fri, 10 Nov 2023 01:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1GaF-0000eC-EE; Fri, 10 Nov 2023 01:45:19 +0000
Received: by outflank-mailman (input) for mailman id 629887;
 Fri, 10 Nov 2023 01:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1GaE-0000aP-SB
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 01:45:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c80aa7d3-7f6a-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 02:45:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 12C4061944;
 Fri, 10 Nov 2023 01:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A8DC433C9;
 Fri, 10 Nov 2023 01:45:02 +0000 (UTC)
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
X-Inumbo-ID: c80aa7d3-7f6a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699580703;
	bh=nXcOhJwUSITcWKDgtXJhN1gzhRWj51errqNVjvv/5xw=;
	h=Date:From:To:cc:Subject:From;
	b=TIH3IXfbd0u13Ru0blHId3MyQ1XkXwob3VVPLoBdWi/0N4bpTEBO3NG0VdEyINMIp
	 uvFkmK1wGmDUTPM6tthdT6arttxkg8pBHp1dOW2l7Z6XyVti9BO0QIz1b7xFHqMatD
	 CuAqdBoeaWSDk+ISziZAudaRHtjGLoWECRn8JoEUdkS+D/s6XX84ehNMDS8wzkChWg
	 5G+2NKTt4+RaXD1bsnFr6DhKuGErS9FxkqGnKY64efeTk9Psi4n4Q1S953vJ6RIfRG
	 a8rvjK+Bg9EKRODtwoHpV21g+BAzgbpD1NLuwOzVlwvb/G03q+8pzPrOtlQY3ZKImA
	 SJQztqgkpvUTw==
Date: Thu, 9 Nov 2023 17:44:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: viryaos-discuss@lists.sourceforge.net
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    michal.orzel@amd.com, brian@woods.art
Subject: [PATCH] Use hex for bitstream_size as expected by u-boot
Message-ID: <alpine.DEB.2.22.394.2311091740490.3478774@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Reported-by: Brian Woods <brian@woods.art>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index b284887..6e52da5 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -790,7 +790,7 @@ bitstream_load_and_config()
         check_file_type "$BITSTREAM" "BIT data"
         bitstream_addr=$memaddr
         load_file $BITSTREAM "fpga_bitstream"
-        bitstream_size=$filesize
+        bitstream_size=`printf "0x%X\n" $filesize`
         if test "$UBOOT_SOURCE"
         then
             # we assume the FPGA device is 0 here

