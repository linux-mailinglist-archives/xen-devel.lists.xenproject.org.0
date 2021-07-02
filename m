Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B603BA1EC
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 16:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149154.275729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzJmb-0004hC-RL; Fri, 02 Jul 2021 14:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149154.275729; Fri, 02 Jul 2021 14:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzJmb-0004fB-Ny; Fri, 02 Jul 2021 14:04:41 +0000
Received: by outflank-mailman (input) for mailman id 149154;
 Fri, 02 Jul 2021 14:04:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzJmb-0004f5-4I
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 14:04:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzJmZ-000282-1D; Fri, 02 Jul 2021 14:04:39 +0000
Received: from [54.239.6.178] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzJmY-0008EW-RB; Fri, 02 Jul 2021 14:04:38 +0000
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
	bh=6EtD5SqbRZJNvHvLZGtuLrFhx1G/nd/OrXMKhDJ1chI=; b=qkbpf3/7L3zxazPEqvUwNJEF3h
	me/qnG0UXHl2hv8SZx97S0v+791Kl2O0JMxlK6MzKLqwDUF6UqrIkmUW2bF0JjsBaSYIVPB0QCh+S
	6WV71OiNu+yA/svhIKwqy4lgVs3lrvLlMnkJTDtNdTHR5bESOZuPCzwjGeAfzHoAgYFc=;
Subject: Re: [XEN PATCH] Config.mk: re-pin OVMF changeset and unpin qemu-xen
To: Ian Jackson <iwj@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210628134217.47622-1-anthony.perard@citrix.com>
 <24793.54037.159770.159505@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ed929363-2b15-bf5f-5a7d-d9e330d79025@xen.org>
Date: Fri, 2 Jul 2021 15:04:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <24793.54037.159770.159505@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 28/06/2021 14:48, Ian Jackson wrote:
> Anthony PERARD writes ("[XEN PATCH] Config.mk: re-pin OVMF changeset and unpin qemu-xen"):
>> qemu-xen tree have a osstest gate and doesn't need to be pinned.
>>
>> On the other hand, OVMF's xen repository doesn't have a gate and needs
>> to be pinned. The "master" branch correspond now to the tag
>> "edk2-stable202105", so pin to that commit.
>>
>> Fixes: a04509d34d72 ("Branching: Update version files etc. for newly unstable")
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> Looks like I adjusted the wrong line in a04509d34d72.  Sorry.

I have committed it.

Cheers,

-- 
Julien Grall

