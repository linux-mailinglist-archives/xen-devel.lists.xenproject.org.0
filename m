Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AF33CB36F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 09:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157076.289910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4ITz-0003nV-Ks; Fri, 16 Jul 2021 07:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157076.289910; Fri, 16 Jul 2021 07:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4ITz-0003la-FM; Fri, 16 Jul 2021 07:42:03 +0000
Received: by outflank-mailman (input) for mailman id 157076;
 Fri, 16 Jul 2021 07:42:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m4ITx-0003lU-J0
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 07:42:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m4ITv-0006zh-NT; Fri, 16 Jul 2021 07:41:59 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m4ITv-00055x-H9; Fri, 16 Jul 2021 07:41:59 +0000
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
	bh=XyJjAV8FbxT1MJk+HgkgjCQuFz4Pia04E60pY1ize5U=; b=Kkud+Z1fi68Fz1p5/fOGNE71Hp
	oPxHJsRMSzNVzbCnf8o6PI/crbQhOyzM8dfdaKOBqMDxdVLZWoQsZpD1gwoDuJR0AhTxUxTMrmpMG
	Rl6ZJVd9q5UtetFUsbrPBZYYacC8CW8x731n7GNhGH/73HUrF95S+9GBYq4+omVh5gYs=;
Subject: Re: preparations for 4.15.1 and 4.13.4
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c27ae453-d58f-30ac-e73a-c9eb5bc0090b@xen.org>
Date: Fri, 16 Jul 2021 08:41:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 15/07/2021 08:58, Jan Beulich wrote:
> All,

Hi Jan & Stefano,


> the releases are due in a couple of weeks time (and 4.14.3 is
> supposed to follow another few weeks later). Please point out backports
> you find missing from the respective staging branches, but which you
> consider relevant.
> 
> Please note that 4.13.4 is going to be the last Xen Project
> coordinated release from the 4.13 branch; the branch will go into
> security-only maintenance mode after this release.

I would like to request the backports of the following commits:

4473f3601098 xen/arm: bootfdt: Always sort memory banks
b80470c84553 arm: Modify type of actlr to register_t
dfcffb128be4 xen/arm32: SPSR_hyp/SPSR
93031fbe9f4c Arm32: MSR to SPSR needs qualification

Cheers,

-- 
Julien Grall

