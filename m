Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F34C393F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 23:56:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278673.476017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNN1a-00046v-1h; Thu, 24 Feb 2022 22:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278673.476017; Thu, 24 Feb 2022 22:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNN1Z-000455-Tm; Thu, 24 Feb 2022 22:55:49 +0000
Received: by outflank-mailman (input) for mailman id 278673;
 Thu, 24 Feb 2022 22:55:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNN1Z-00044z-5l
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 22:55:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNN1V-00009F-5O; Thu, 24 Feb 2022 22:55:45 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNN1U-0005ww-Vo; Thu, 24 Feb 2022 22:55:45 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=kiGNoNOATm3G6K6BFFu/M9wqslarFhAG0JWMOeHad5A=; b=oqVUY0vukjnHaoEUa+trZAcMQW
	LQmmVNNrD+TVZ0tOdo0fAp73ZcmY1GQNbKOpFri2+Hkdd+OS3d+PIxcmH+LGqR9Xx85oLKl4NbDtR
	LgAFlMx/TB1iAiH10UU13LNqbPWCWivOx7Dr5r9pgP5xlCY62N1NH1nayRS+ICYGIjes=;
Message-ID: <78543fe5-1dde-41b8-e28d-de2cf22fc87f@xen.org>
Date: Thu, 24 Feb 2022 22:55:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
 <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
 <7ca05a74-6b65-f9cb-f524-28d700a7d0e4@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
In-Reply-To: <7ca05a74-6b65-f9cb-f524-28d700a7d0e4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 16/02/2022 09:29, Jan Beulich wrote:
> On 16.02.2022 08:20, Juergen Gross wrote:
>> On 15.02.22 22:13, Julien Grall wrote:
>>> As a side note, should we also update SUPPORT.md?
>>
>> Good question.
> 
> I'm not sure here either - talking about individual hypercall sub-ops
> seems overly small granularity to me for this kind of doc. Plus I
> don't view deprecation and de-supporting as the same thing. The latter
> would mean to render unsupported any old XenoLinux which may still be
> in use, all of the sudden.

I understand this would result to unsupport some old OSes (not clear how 
old). However, from what Juergen said this feature is untested.

To me it sound like we are not confident that we could security support 
this feature.

So I am not sure to understand why we only want to deprecate it.

Cheers,

-- 
Julien Grall

