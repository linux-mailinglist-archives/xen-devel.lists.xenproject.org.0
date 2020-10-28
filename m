Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAF929D0D4
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 16:49:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13733.34480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXnhM-0007o2-3X; Wed, 28 Oct 2020 15:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13733.34480; Wed, 28 Oct 2020 15:49:16 +0000
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
	id 1kXnhM-0007nd-0H; Wed, 28 Oct 2020 15:49:16 +0000
Received: by outflank-mailman (input) for mailman id 13733;
 Wed, 28 Oct 2020 15:49:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXnhK-0007mt-F8
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:49:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 347b0444-ce59-4e92-8a2e-5bb9515c174e;
 Wed, 28 Oct 2020 15:49:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93847AD71;
 Wed, 28 Oct 2020 15:49:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXnhK-0007mt-F8
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:49:14 +0000
X-Inumbo-ID: 347b0444-ce59-4e92-8a2e-5bb9515c174e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 347b0444-ce59-4e92-8a2e-5bb9515c174e;
	Wed, 28 Oct 2020 15:49:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603900152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nFcUCOP/g/UZYCuUBOE6MBVdn1yuJPxtFuzE8jr9Rpw=;
	b=LOKUqf9iDH/0SYrcRnjK2kkdAhowptCiOhzWrBrP298V1KFAR+JnjrpWXge//daq4n3Jha
	nbe3ws03zJuOkVplJytBkme7G41zYSInswxFrFzJ7T7i1cP32sXrpXCYDjwOg1OfWMWiCg
	VTtF816ZG2xqok1+MJpMVc5GLAIwzoI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 93847AD71;
	Wed, 28 Oct 2020 15:49:12 +0000 (UTC)
Subject: Re: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <d1df24d48508c0c01c0b1130ed22f2b4585d04db.1603731279.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2010271621480.12247@sstabellini-ThinkPad-T480s>
 <95b72e09-246b-dcbe-6254-86b3e25081c6@suse.com>
 <53C69BD9-716C-4ECF-8287-75C435C561CE@arm.com>
 <749813e0-0b04-0ecf-5dc6-96cfe53c786b@xen.org>
 <752F9365-EB91-46AC-A2AD-060A630D8404@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b2fd97b-2d82-8af2-8e20-4a623b62447d@suse.com>
Date: Wed, 28 Oct 2020 16:49:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <752F9365-EB91-46AC-A2AD-060A630D8404@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.10.2020 16:47, Rahul Singh wrote:
> Ok. I will enable by default HAS_NS16550_PCI on X86 only. Once we have proper support for NS16550 PCI on ARM we can enable it at that time.
> I will modify as follows:
> 
> config HAS_NS16550_PCI                                                          
>     bool                                                                        
>     default y                                                                   

def_bool y

Jan

