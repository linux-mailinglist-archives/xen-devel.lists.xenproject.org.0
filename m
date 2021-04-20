Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C936596D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 15:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113654.216596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpzu-0002IK-82; Tue, 20 Apr 2021 13:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113654.216596; Tue, 20 Apr 2021 13:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpzu-0002Hv-4t; Tue, 20 Apr 2021 13:00:58 +0000
Received: by outflank-mailman (input) for mailman id 113654;
 Tue, 20 Apr 2021 13:00:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYpzs-0002Hq-Jt
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 13:00:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYpzn-0001B4-P5; Tue, 20 Apr 2021 13:00:51 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYpzn-0008HU-HR; Tue, 20 Apr 2021 13:00:51 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=GE7kMMQDC7qGfHnr7SeRoZrQd4ZsjTtrQTSkfnOkghM=; b=wK0PSINeZ0WYGg8xcxwDkOjM3s
	ZcRd/riZHN7WBK5zcOdxRZXsVajZ7tcZVCSdn5/ih86IFCMaoh1uXbDm+SXpzeQz853nj1J2YCm54
	eYmd74SGoKLJRyW49KJzndANe3akk9nj6zj4wVE+n/Qn5blAV7T1L83IjcHTpWalDGno=;
Subject: Re: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org,
 Chao Gao <chao.gao@intel.com>
References: <20200401200606.48752-1-chao.gao@intel.com>
 <f4b3ad3b-16b9-5e42-c7a6-0c5c81b1f392@suse.com>
 <148ad77f-d447-0800-d48b-9ba8c758b905@xen.org>
 <b89c8443-4df6-485b-2b5b-d89360a6969a@suse.com>
 <98da1bbb-8860-0728-a438-a4f12719d4e2@xen.org>
 <525fa57c-b036-7c2b-3a6d-ede7f4ce6d36@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5f77d54a-6c92-84bb-a8a9-a0864b350f1f@xen.org>
Date: Tue, 20 Apr 2021 14:00:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <525fa57c-b036-7c2b-3a6d-ede7f4ce6d36@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 20/04/2021 13:50, Jan Beulich wrote:
>> Alternatively, you could be a bit more
>> verbose in your request so the other understand the reasoning behind it.
> 
> Well, yes, perhaps. But then there's the desire to not repeat oneself
> all the time.

Most likely, the time you try to save not expanding your thought are 
going to be lost when the contributor will come back asking why you are 
requesting it. ;)

Cheers,

-- 
Julien Grall

