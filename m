Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD08113B6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 14:53:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654005.1020637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDPee-0006Eu-LP; Wed, 13 Dec 2023 13:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654005.1020637; Wed, 13 Dec 2023 13:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDPee-0006Ci-Iq; Wed, 13 Dec 2023 13:52:04 +0000
Received: by outflank-mailman (input) for mailman id 654005;
 Wed, 13 Dec 2023 13:52:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrFR=HY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDPed-0006Cb-2Y
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 13:52:03 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca106841-99be-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 14:52:01 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-336417c565eso372655f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 05:52:00 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 h12-20020a5d504c000000b003333521a1cesm1277229wrt.57.2023.12.13.05.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 05:51:59 -0800 (PST)
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
X-Inumbo-ID: ca106841-99be-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702475520; x=1703080320; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KAGK6CeQGpfPRG6k54rKBcuH1/bYwwYkZsXMsWDnJzs=;
        b=b7ioeewcYDfBK5FOJuMKTcIyc93KX7qyYSVycG43l+PWhYchgkYOCrfTY3RoEh/66k
         i+Ps5KeMqIrcg4JLELhv7NPXKXaPJkvL71g6xnykENijTEX/fg2UhYW2VWWEET4cFPqk
         uoJwzZUgIFnYbu4SOFT8cC/w2N2NFFwux4IE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702475520; x=1703080320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAGK6CeQGpfPRG6k54rKBcuH1/bYwwYkZsXMsWDnJzs=;
        b=qKEIbhfGvpw5aiImVIFtKcbHVxY0cpgsDV7aYAhOSFME59bw3won5TQbWEYjF1lYuU
         NTqpRD0NT2+v5xhO7OEhnmwp1bNP8G3aHwoLh8PfIBUzhm9O02SNkuBhA4B6QiH02S+t
         jeW51S7u7628a23Fc2fdWAPzcQPcwZUqAriLaEEbrpUKXd6lS8zwnGFiT+sEbEWKraK2
         qpjV8zXIMGCbDrAXwh+wUDaYBWQ1isye45fFW3tEvfpZF0M7jl/HIr8Vng29rIjIDZOF
         GMyYFPXEGD6ZuqZUkc1Y00cCok0uO8/mAXsLWv0l9NhJzH0u+Y0xHhNp4KeRDU+MSqdu
         NGpg==
X-Gm-Message-State: AOJu0Yzr2OoBhYedCRkAWKUqDpdxhdsXqXCCI0wOWwo+iUhTrAYw1WLW
	CNd9ob1ubn0YfCGcbLC74w/cF7KbaJeBBHUhU/g=
X-Google-Smtp-Source: AGHT+IFn6ZIRkJAZV3iMR6Xfkn1+X5khZH7616XoXJgDJbLGWFqvKkkRq3Rk7I3AHx9F6mXrYB+YwA==
X-Received: by 2002:a5d:55c6:0:b0:333:533d:9cfa with SMTP id i6-20020a5d55c6000000b00333533d9cfamr3157794wrw.208.1702475520210;
        Wed, 13 Dec 2023 05:52:00 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] livepatch-build-tools: fix misuse of script directory as work directory
Date: Wed, 13 Dec 2023 14:51:47 +0100
Message-ID: <20231213135147.6749-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's incorrect to assume that the script directory will always match the
directory the script is executed from.  Instead cache the directory at the
start of script execution in order to be able to get back to it if needed.

Fixes: 629ab8ddb775 ('livepatch-build-tools: do not use readlink -m option')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 livepatch-build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/livepatch-build b/livepatch-build
index f622683fc56c..e318cecd4da6 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -25,6 +25,7 @@
 # script.
 
 SCRIPTDIR="$(readlink -f $(dirname $(type -p $0)))"
+WORKDIR="$(readlink -f -- .)"
 CPUS="$(getconf _NPROCESSORS_ONLN)"
 DEBUG=n
 XEN_DEBUG=n
@@ -459,7 +460,7 @@ if [ "${SKIP}" != "build" ]; then
 fi
 
 if [ "${SKIP}" != "diff" ]; then
-    cd "${SCRIPTDIR}" || die
+    cd "${WORKDIR}" || die
     [ -d "$outputarg" ] || die "Output directory does not exist"
     OUTPUT="$(readlink -f -- "$outputarg")"
 

base-commit: 0ed8ef88dc300750696a64e89efa3b82502f6dc7
prerequisite-patch-id: 20327fdf775db3903c8067a0642254d67c495806
-- 
2.43.0


