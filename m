Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95781559F48
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 19:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355775.583641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4n3M-0003Tv-2J; Fri, 24 Jun 2022 17:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355775.583641; Fri, 24 Jun 2022 17:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4n3L-0003Rz-Ue; Fri, 24 Jun 2022 17:25:07 +0000
Received: by outflank-mailman (input) for mailman id 355775;
 Fri, 24 Jun 2022 17:25:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4n3K-0003Rs-4Y
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 17:25:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4n3J-0003l3-QL; Fri, 24 Jun 2022 17:25:05 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4n3J-0002mc-JR; Fri, 24 Jun 2022 17:25:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=uIQBUHf2B1nNIwlw54Yy0Fu2lC1Ge4jGBpr2Y7H/EGw=; b=XnuUmAUJzS5OqZ07xirKEs97rV
	Fu8h/c3hdfulfyogtbX/r826eiU80r2gjYwvVI6cUJm2H/k9hMZ0ZhRojOLmJzoNPvO3fLpy/sRHx
	9iKzlvuF8WnUZ0sru3veHl2UmIRWWMYHrtVoDr45YUpvWK5lRh9PtkzVhPZ/Y9cNMoM8=;
Message-ID: <81c33c8c-e345-2fe3-32c6-2f80799eefd0@xen.org>
Date: Fri, 24 Jun 2022 18:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] docs/misra: Add instructions for cppcheck
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220624105311.21057-1-luca.fancellu@arm.com>
 <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
 <15F23829-3693-47CC-A9D6-3D7A3B44EB64@arm.com>
 <88bd7017-e2b3-59f3-a68a-25db9e53136d@xen.org>
 <CA8DFF26-3D7F-4CDA-9EDC-E173203B2A51@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA8DFF26-3D7F-4CDA-9EDC-E173203B2A51@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 24/06/2022 14:34, Luca Fancellu wrote:
>> On 24 Jun 2022, at 13:17, Julien Grall <julien@xen.org> wrote:
> I would keep the section about compiling cppcheck since many recent distro doesn’t provide cppcheck >=2.7 yet (and 2.8 is broken),
> If you agree with it.

It depends on the content of the section. If the content duplicates the 
cppcheck README then no. If this is just to point to the cppcheck 
README, then I am OK with that.

Cheers,

-- 
Julien Grall

