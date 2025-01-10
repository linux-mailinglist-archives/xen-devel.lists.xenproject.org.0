Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2C7A09D1C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 22:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870013.1281465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWMPj-0008KW-OM; Fri, 10 Jan 2025 21:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870013.1281465; Fri, 10 Jan 2025 21:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWMPj-0008Fn-JG; Fri, 10 Jan 2025 21:19:31 +0000
Received: by outflank-mailman (input) for mailman id 870013;
 Fri, 10 Jan 2025 21:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qCll=UC=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tWMPi-0008EF-F3
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 21:19:30 +0000
Received: from mx1.somlen.de (typhoon.somlen.de [89.238.64.140])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92bb8563-cf98-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 22:19:28 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id 553B95030E7;
 Fri, 10 Jan 2025 22:19:26 +0100 (CET)
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
X-Inumbo-ID: 92bb8563-cf98-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1736543966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jWZqXIp5bUcmoJ7raF+Sui2s7eMrVNjK2aCR0SvW1XU=;
	b=uk+UYv9svfJr8U5T6duzoCxpjiOyOkhuGe3C8SZlyZeJyooBxHqBpoDpbdVHoXDpfuN2++
	D2BNirGYlrtpckTMbulqpMGSs+BLNQI9/2QprjqtkzMH9NHCPWmIN0H9jdJOvHd4YGWRzA
	M3mgEV59tX3dFe5k7wAcBqw1O9gDtN7piQRkz0lKUgvovnlOUxdjE8s6N8saJLoJPszNtR
	UtRu/YMVQC3EdKTe82/Cosz2hYGqBWxew2nVoUDmqq7xMJltC237Zkpc/Lmd7TJs0ILjuw
	Gr3KehaZRTllmZdjs9S4l3/9rb90oNg/V1hkiVL340PJIoROgXAYLzwWv6K3Gw==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH 0/1] Bug: Hyperlinks in generated documentation may point to the wrong architecture
Date: Fri, 10 Jan 2025 22:19:02 +0100
Message-Id: <cover.1736542505.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As suggested by Andrew Cooper in [1], I formally submit this patch for
fixing that documentation hyperlinks may point to the wrong
architecture. This fix also makes building the documentation
reproducible in Debian.

With this patch applied, I still get the following:

/usr/bin/perl -w /build/reproducible-path/xen-4.19.1/docs/xen-headers -O html/hypercall/ppc \
	-T 'arch-ppc - Xen public headers' \
	-X arch-arm -X arch-riscv -X arch-x86_32 -X arch-x86_64 \
	-X xen-arm -X xen-riscv -X xen-x86_32 -X xen-x86_64 \
	-X arch-x86 \
	/build/reproducible-path/xen-4.19.1/docs/../xen include/public include/xen/errno.h
include/public/hvm/dm_op.h:476: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:55
include/public/hvm/dm_op.h:476: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:61
include/public/hvm/dm_op.h:476: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:55
include/public/hvm/dm_op.h:476: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:61

This seems to happen due to multiple "typedef uint64_t xen_ulong_t;"
in xen/include/public/arch-ppc.h (albeit in different if(n)def blocks).
It does not cause any problems for us at the moment, but probably should
still be addressed somehow.

[1] https://lists.xen.org/archives/html/xen-devel/2025-01/msg00324.html

Maximilian Engelhardt (1):
  docs/Makefile: Add ppc and riscv to DOC_ARCHES

 docs/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.39.5


