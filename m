Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0723A3824B7
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 08:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128056.240492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liX3D-0001s0-Lp; Mon, 17 May 2021 06:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128056.240492; Mon, 17 May 2021 06:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liX3D-0001pY-Hx; Mon, 17 May 2021 06:48:27 +0000
Received: by outflank-mailman (input) for mailman id 128056;
 Mon, 17 May 2021 06:48:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liX3C-0001pO-EN
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 06:48:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37de0106-a572-435a-a931-98f813e36962;
 Mon, 17 May 2021 06:48:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C556AF3E;
 Mon, 17 May 2021 06:48:24 +0000 (UTC)
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
X-Inumbo-ID: 37de0106-a572-435a-a931-98f813e36962
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621234104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O6qUVKWUKUzptKyI9QMY4G49qkAM1nkIhX4ZXC+4+Hs=;
	b=JbqL611RsNq4/5E6QtlsiYkidds/foslsKgqnWQ5dAYqrtLQxTCYSauKzvizAHAg1xw6RT
	TjhRBDeDGC8/RQTUlU1sBzpoW4gQ6bJSBiUMVD5M4PcmIqGnkBT5VMHkXOiT13adGKry6w
	H/SWgUB5SX8Iu1jQYXb13AEK3LnLtFA=
Subject: Re: [PATCH v3 2/5] xen/x86: manually build xen.mb.efi binary
To: Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
 <3c621726-31c4-6a79-a020-88c59644111b@suse.com>
 <74ea104d-3826-d80d-3af5-f444d065c73f@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a183a5f9-0f36-187d-fd06-8d6db99cbe43@suse.com>
Date: Mon, 17 May 2021 08:48:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <74ea104d-3826-d80d-3af5-f444d065c73f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.05.2021 22:26, Bob Eshleman wrote:
> What is your intuition WRT the idea that instead of trying add a PE/COFF hdr
> in front of Xen's mb2 bin, we instead go the route of introducing valid mb2
> entry points into xen.efi?

At the first glance I think this is going to be less intrusive, and hence
to be preferred. But of course I haven't experimented in any way ...

Jan

