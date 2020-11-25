Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4831E2C3ECF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 12:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37577.70017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khshe-00019f-42; Wed, 25 Nov 2020 11:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37577.70017; Wed, 25 Nov 2020 11:11:14 +0000
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
	id 1khshd-00019D-Vr; Wed, 25 Nov 2020 11:11:13 +0000
Received: by outflank-mailman (input) for mailman id 37577;
 Wed, 25 Nov 2020 11:11:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khshc-00018u-4j
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:11:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khshZ-0004zN-Si; Wed, 25 Nov 2020 11:11:09 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khshZ-0006Pt-KU; Wed, 25 Nov 2020 11:11:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khshc-00018u-4j
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=oQA/M5Uuea35a1wIxgW5iLSiJLPmMuYHaChWUL4flWY=; b=VdeoLpOGqIC5/2SzR15Mp5QzUX
	9kwMg/zK0HM9qfcp+2mqW+LI9J0k5paVZfF99JDLV6Hb940fj4mFfWnuZMJVdT/iJ05MozGnYFAAc
	3vJkmyedaOXA/rsmr5YQekt7xV6DqW72JmTL1W3c04FZn+4DlMWoGDsW6ywSnYaS2q5c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khshZ-0004zN-Si; Wed, 25 Nov 2020 11:11:09 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khshZ-0006Pt-KU; Wed, 25 Nov 2020 11:11:09 +0000
Subject: Re: [PATCH] evtchn: double per-channel locking can't hit identical
 channels
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <db0b16f8-2053-5ec3-f73a-c1c8fcdb9444@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7855e268-7857-442d-3daa-8fd837e95287@xen.org>
Date: Wed, 25 Nov 2020 11:11:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <db0b16f8-2053-5ec3-f73a-c1c8fcdb9444@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 24/11/2020 17:03, Jan Beulich wrote:
> Inter-domain channels can't possibly be bound to themselves, there's
> always a 2nd channel involved, even when this is a loopback into the
> same domain. As a result we can drop one conditional each from the two
> involved functions.
> 
> With this, the number of evtchn_write_lock() invocations can also be
> shrunk by half, swapping the two incoming function arguments instead.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

