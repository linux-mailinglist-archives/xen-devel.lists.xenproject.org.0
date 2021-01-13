Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF312F4C1E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 14:18:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66503.118156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzg2o-0001XY-ST; Wed, 13 Jan 2021 13:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66503.118156; Wed, 13 Jan 2021 13:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzg2o-0001X7-OZ; Wed, 13 Jan 2021 13:18:38 +0000
Received: by outflank-mailman (input) for mailman id 66503;
 Wed, 13 Jan 2021 13:18:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdpw=GQ=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kzg2n-0001Wu-51
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:18:37 +0000
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e06026d6-946f-4c18-b5eb-5e251237a2fe;
 Wed, 13 Jan 2021 13:18:35 +0000 (UTC)
Received: from 88-111-100-194.dynamic.dsl.as9105.com ([88.111.100.194]:55708
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kzg2l-000Qmq-Q3 (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Wed, 13 Jan 2021 13:18:35 +0000
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
X-Inumbo-ID: e06026d6-946f-4c18-b5eb-5e251237a2fe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MhFls4bIaLoWRwXZJu/t752Tme4Vt8yEVwrUfLBL4HU=; b=V6trAwFjcLUlozm+4MdWlrWPCI
	4K1pvexvmTE7vXLYsJOf+Kx7qfzNNGy7Sq9G9xK0dfTB9vC+33GSv7gBP/nRANknfdBjmmesE6T7b
	F/P/2sz9ZdQa9YAtNHeCcI3EICgYpWLtESs5qF2p5hDvhMBlvDdXcuBuq3CGAtG6+ZBI=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH 3/3] tools: Move memshrtool from tests/ to misc/
To: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
 <20210113123455.23209-4-andrew.cooper3@citrix.com>
 <24574.61222.420015.914048@mariner.uk.xensource.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <a8d6da68-f977-a742-dbf3-a0a51c9f469b@cam.ac.uk>
Date: Wed, 13 Jan 2021 13:18:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24574.61222.420015.914048@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 13/01/2021 13:01, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH 3/3] tools: Move memshrtool from tests/ to misc/"):
>> memshrtool is a tool for a human to use, rather than a test.  Move it into
>> misc/ as a more appropriate location to live.  Also rename it to
>> xen-memshare-tool
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks, but I expect that Gitlab will tell me that I broke the ARM
build, by losing a "only build this for x86"-ism.

I've folded this delta in to resolve:

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index fbe010a55a..1774ff014f 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -22,6 +22,7 @@ INSTALL_SBIN-$(CONFIG_MIGRATE) += xen-hptool
 INSTALL_SBIN-$(CONFIG_X86)     += xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     += xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
+INSTALL_SBIN-$(CONFIG_X86)     += xen-memshare-tool
 INSTALL_SBIN-$(CONFIG_X86)     += xen-mfndump
 INSTALL_SBIN-$(CONFIG_X86)     += xen-ucode
 INSTALL_SBIN                   += xencov
@@ -32,7 +33,6 @@ INSTALL_SBIN                   += xenpm
 INSTALL_SBIN                   += xenwatchdogd
 INSTALL_SBIN                   += xen-access
 INSTALL_SBIN                   += xen-livepatch
-INSTALL_SBIN                   += xen-memshare-tool
 INSTALL_SBIN                   += xen-diag
 INSTALL_SBIN += $(INSTALL_SBIN-y)
 
~Andrew

