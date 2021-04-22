Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC248368325
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 17:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115634.220662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZb3n-0001Ad-4w; Thu, 22 Apr 2021 15:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115634.220662; Thu, 22 Apr 2021 15:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZb3n-0001AE-1s; Thu, 22 Apr 2021 15:16:07 +0000
Received: by outflank-mailman (input) for mailman id 115634;
 Thu, 22 Apr 2021 15:16:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZb3l-0001A9-AJ
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:16:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11231367-2b32-44da-812a-6abdbb6ee2c6;
 Thu, 22 Apr 2021 15:16:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D546AF9E;
 Thu, 22 Apr 2021 15:16:03 +0000 (UTC)
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
X-Inumbo-ID: 11231367-2b32-44da-812a-6abdbb6ee2c6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619104563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkrS5Dxrb1ouK8VtwGEkh5+X/L5fhslUZ1usjLo8vSc=;
	b=GUNZNQaO/jkQoegnioQaMiAtk4QDzpmlHgZUBGMSLbFtV5BTZalH7QPEbdCNus9LoRlUVs
	ysPByqkQJ1gHh8KYGQagyKga5/7X7axPIJaw2sTmnDc9t7xHWPfdO7NKg19z/DNBAXKImi
	xIE2dkKMNRAxvhpaUYGLJSMyvWmZcOI=
Subject: Re: [PATCH 0/3] xen: remove some checks for always present Xen
 features
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
References: <20210422151007.2205-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df27aba6-c67e-d66e-f00e-75a1f76de921@suse.com>
Date: Thu, 22 Apr 2021 17:16:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210422151007.2205-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.04.2021 17:10, Juergen Gross wrote:
> Some features of Xen can be assumed to be always present, so add a
> central check to verify this being true and remove the other checks.
> 
> Juergen Gross (3):
>   xen: check required Xen features
>   xen: assume XENFEAT_mmu_pt_update_preserve_ad being set for pv guests
>   xen: assume XENFEAT_gnttab_map_avail_bits being set for pv guests

I wonder whether it's a good idea to infer feature presence from
version numbers. If (at some point in the past) you had inferred
gnttab v2 being available by version, this would have been broken
by its availability becoming controllable by a command line option
in Xen.

Jan

