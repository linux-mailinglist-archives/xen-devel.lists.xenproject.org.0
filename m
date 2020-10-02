Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7CF280E95
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 10:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1734.5272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOGDd-00077P-3I; Fri, 02 Oct 2020 08:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1734.5272; Fri, 02 Oct 2020 08:15:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOGDc-000770-W9; Fri, 02 Oct 2020 08:15:08 +0000
Received: by outflank-mailman (input) for mailman id 1734;
 Fri, 02 Oct 2020 08:15:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOGDb-00076v-He
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 08:15:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 184eced0-cefb-436b-857f-0d9b11c7d260;
 Fri, 02 Oct 2020 08:15:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E73C2AE37;
 Fri,  2 Oct 2020 08:15:05 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOGDb-00076v-He
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 08:15:07 +0000
X-Inumbo-ID: 184eced0-cefb-436b-857f-0d9b11c7d260
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 184eced0-cefb-436b-857f-0d9b11c7d260;
	Fri, 02 Oct 2020 08:15:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601626506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GcYjzA6eXVsPOzZWJaiz0ZrJlZpu9hPVM/+LbzGJt4w=;
	b=OWxoMHGdMH11+4eHbwo1SBp89KT7VmTdzr+U0RhMSHjuRUaQB4Hs1RWci2syUbxGOQsmdO
	shfrwNhyl8JjqlAY8vNS/+AcQAsFFZ96vCbp8kfbqCITth+F+AN+E1PyArETwrIsKhTTW7
	RaeAwmorCx2vmH8WgLoTfUFURXG4sTo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E73C2AE37;
	Fri,  2 Oct 2020 08:15:05 +0000 (UTC)
Subject: Re: [PATCH v8 1/5] efi/boot.c: add file.need_to_free
To: Trammell Hudson <hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, wl@xen.org
References: <20200930120011.1622924-1-hudson@trmm.net>
 <20200930120011.1622924-2-hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76a21a35-0469-6d44-564a-c0fed9bf9bfd@suse.com>
Date: Fri, 2 Oct 2020 10:15:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930120011.1622924-2-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 14:00, Trammell Hudson wrote:
> The config file, kernel, initrd, etc should only be freed if they
> are allocated with the UEFI allocator.  On x86 the ucode, and on
> ARM the dtb, are also marked as need_to_free when allocated or
> expanded.
> 
> This also fixes a memory leak in ARM fdt_increase_size() if there
> is an error in building the new device tree.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


