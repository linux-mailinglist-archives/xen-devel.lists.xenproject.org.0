Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774D2F762F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 11:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67879.121351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Lx1-0004EU-0I; Fri, 15 Jan 2021 10:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67879.121351; Fri, 15 Jan 2021 10:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Lx0-0004E5-TC; Fri, 15 Jan 2021 10:03:26 +0000
Received: by outflank-mailman (input) for mailman id 67879;
 Fri, 15 Jan 2021 10:03:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Lwz-0004E0-JI
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:03:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c8cc756-2d1e-4481-b14a-07d966e1c3ec;
 Fri, 15 Jan 2021 10:03:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF38EB1C4;
 Fri, 15 Jan 2021 10:03:23 +0000 (UTC)
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
X-Inumbo-ID: 0c8cc756-2d1e-4481-b14a-07d966e1c3ec
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610705004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8QCZO+56z7YEtdz7baHP9JERgJfP5QzvFdckI0+m+Ko=;
	b=loBX0+A++zpHXnDNyhVt7RWy6r17iRBEgXM0nDnzB2ceDVnmmhuDMqxI2qUCbpgAP6Sdk9
	pEqgjf/3qpDB6CPVS4Kq3VAvixTgvoejOL9HhshD67otCyNi9TDk5mk1SSiLm4jgpQ404h
	9XpZQ4HdR2bNYwi+7EATZFbqjSvMcz8=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, M A Young <m.a.young@durham.ac.uk>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86/Dom0: support zstd compressed kernels
Message-ID: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
Date: Fri, 15 Jan 2021 11:03:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Linux has been offering this option of kernel compression
for quite some time - about time for us to start supporting
it. The series here covers Dom0 only; I simply didn't have
time to see about also integrating this into libxenguest.

1: introduce unaligned.h
2: lib: introduce xxhash
3: x86/Dom0: support zstd compressed kernels

Jan

