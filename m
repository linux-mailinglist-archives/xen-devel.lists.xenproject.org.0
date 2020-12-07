Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1E62D0FC1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:55:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46393.82341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmF6Y-0002d6-Rh; Mon, 07 Dec 2020 11:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46393.82341; Mon, 07 Dec 2020 11:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmF6Y-0002cj-Oa; Mon, 07 Dec 2020 11:54:58 +0000
Received: by outflank-mailman (input) for mailman id 46393;
 Mon, 07 Dec 2020 11:54:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmF6W-0002cb-Qj
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:54:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72161036-7c26-4c14-b7d0-c371f3eb4ec0;
 Mon, 07 Dec 2020 11:54:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66BDAAC90;
 Mon,  7 Dec 2020 11:54:54 +0000 (UTC)
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
X-Inumbo-ID: 72161036-7c26-4c14-b7d0-c371f3eb4ec0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607342094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vHIlWrDJ6kyj51TcNfinMHIsaXaGP/TQ3AKqTAQs1x0=;
	b=Wcg7ztqfRnN/HV2ufgIeRCrczSHq/S9JGYyL7hvDEBz5m6bJdCclv5oNkQjqegwjGeBvFj
	5nxOsXQFH0cp4kNeSWR9z0xXksD/dLhIpe4uRu8SHgjDKxj64UgjFOTgWTIe8dWmpO9+Jk
	TTf7gWPZbT8GiVXuHpDkygRFan2Nv5Q=
Subject: Re: [PATCH V3 07/23] xen/ioreq: Make x86's
 hvm_ioreq_(page/vcpu/server) structs common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-8-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36b5640e-8d37-ed1a-f675-59e1a5d74ff7@suse.com>
Date: Mon, 7 Dec 2020 12:54:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-8-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The IOREQ is a common feature now and these structs will be used
> on Arm as is. Move them to xen/ioreq.h and remove "hvm" prefixes.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Applicable parts
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

