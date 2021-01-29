Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ABA30872C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 09:59:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77803.141152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Pcg-0002hN-3j; Fri, 29 Jan 2021 08:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77803.141152; Fri, 29 Jan 2021 08:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Pcg-0002gy-0C; Fri, 29 Jan 2021 08:59:22 +0000
Received: by outflank-mailman (input) for mailman id 77803;
 Fri, 29 Jan 2021 08:59:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5Pce-0002gt-Il
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 08:59:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f25be46-2add-4eea-9c17-1f0c775f977e;
 Fri, 29 Jan 2021 08:59:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6AD09AF27;
 Fri, 29 Jan 2021 08:59:18 +0000 (UTC)
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
X-Inumbo-ID: 9f25be46-2add-4eea-9c17-1f0c775f977e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611910758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/gtooI8yHHWJDxGE6j1vhSkQmeC3Iag8N5IOcjYCRo=;
	b=Lzh1EU7X11sboCOoF8q//fNrfXJ2QR4/+N4JTgE4cFPMQiC4FHrwpA7bbgc3fonD4ffKoD
	5B6p5AQLAHOcww4Tes4k4xEd/HQDmbMNm2uGXRBEZ+wKwck/4SdlqkDQGZL5OyC7Vfnzz4
	0cdjsViy8vY49+K6cCauRYKcNOFajXY=
Subject: Re: [PATCH V6 23/24] xen/ioreq: Do not let bufioreq to be used on
 other than x86 arches
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-24-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <808c1a21-0e63-a6a8-c9c2-3d3b448dbd71@suse.com>
Date: Fri, 29 Jan 2021 09:59:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611884932-1851-24-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 02:48, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch prevents the device model running on other than x86
> systems to use buffered I/O feature for now.
> 
> Please note, there is no caller which requires to send buffered
> I/O request on Arm currently and the purpose of this check is
> to catch any future user of bufioreq.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

It wasn't entirely clear to me what your respective reply on
the v5 sub-thread was saying, so assuming this doesn't break
functionality that the earlier parts of the series put in
place:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

