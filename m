Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489D42D0D44
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 10:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46027.81642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmD4J-0000Nx-IV; Mon, 07 Dec 2020 09:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46027.81642; Mon, 07 Dec 2020 09:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmD4J-0000NY-FS; Mon, 07 Dec 2020 09:44:31 +0000
Received: by outflank-mailman (input) for mailman id 46027;
 Mon, 07 Dec 2020 09:44:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmD4I-0000NQ-1v
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 09:44:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9c44470-4c7b-43ff-be70-1608ea799ae6;
 Mon, 07 Dec 2020 09:44:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 96E69AC9A;
 Mon,  7 Dec 2020 09:44:28 +0000 (UTC)
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
X-Inumbo-ID: f9c44470-4c7b-43ff-be70-1608ea799ae6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607334268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJohPHIbx1B9VcXIxmFimYdjluC9aftvHc+hYyertfo=;
	b=MJ7W3YYiAYd0OAT34njH6BGbOchvkTws8/N5ubU/3BX7cul4fL0XE3OWKZtQjrEUoNJv2i
	gnuZN0mjPQyMqBbDeZQrdBA60Xk/0DsQe/GKLV7XAYNfuG0CluRBkmNm2QAPVKI6Ci2Arv
	/16FlTGwg55rElvVhsnoSUi0Rb7YoG4=
Subject: Re: [PATCH v3 2/2] x86/IRQ: allocate guest array of max size only for
 shareable IRQs
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, sstabellini@kernel.org, wl@xen.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <1607276587-19231-1-git-send-email-igor.druzhinin@citrix.com>
 <1607276587-19231-2-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8dc7ed4d-7c3e-0fbf-92c9-cbe39c3e5f3d@suse.com>
Date: Mon, 7 Dec 2020 10:44:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1607276587-19231-2-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.12.2020 18:43, Igor Druzhinin wrote:
> ... and increase default "irq-max-guests" to 32.
> 
> It's not necessary to have an array of a size more than 1 for non-shareable
> IRQs and it might impact scalability in case of high "irq-max-guests"
> values being used - every IRQ in the system including MSIs would be
> supplied with an array of that size.
> 
> Since it's now less impactful to use higher "irq-max-guests" value - bump
> the default to 32. That should give more headroom for future systems.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

