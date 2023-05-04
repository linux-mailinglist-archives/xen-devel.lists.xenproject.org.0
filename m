Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB3F6F6CF2
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529773.824543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZ32-0004OQ-VV; Thu, 04 May 2023 13:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529773.824543; Thu, 04 May 2023 13:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZ32-0004Lo-S3; Thu, 04 May 2023 13:31:04 +0000
Received: by outflank-mailman (input) for mailman id 529773;
 Thu, 04 May 2023 13:31:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wc2m=AZ=tls.msk.ru=mjt@srs-se1.protection.inumbo.net>)
 id 1puZ31-0004Lh-Q0
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:31:03 +0000
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e89b52f9-ea7f-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 15:31:01 +0200 (CEST)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E39D4400FD;
 Thu,  4 May 2023 16:30:59 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id E55BC9E;
 Thu,  4 May 2023 16:30:58 +0300 (MSK)
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
X-Inumbo-ID: e89b52f9-ea7f-11ed-8611-37d641c3527e
Message-ID: <5f7329f2-8d17-12de-4ea9-74a5932b80c5@msgid.tls.msk.ru>
Date: Thu, 4 May 2023 16:30:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] 9pfs/xen: Fix segfault on shutdown
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20230502143722.15613-1-jandryuk@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230502143722.15613-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

02.05.2023 17:37, Jason Andryuk wrote:
> xen_9pfs_free can't use gnttabdev since it is already closed and NULL-ed
> out when free is called.  Do the teardown in _disconnect().  This
> matches the setup done in _connect().

Ping?

/mjt

