Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C192387F4E
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 20:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129574.243213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj4C1-0004YD-6h; Tue, 18 May 2021 18:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129574.243213; Tue, 18 May 2021 18:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj4C1-0004Ve-30; Tue, 18 May 2021 18:11:45 +0000
Received: by outflank-mailman (input) for mailman id 129574;
 Tue, 18 May 2021 18:11:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lj4Bz-0004Uv-HZ
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 18:11:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj4By-0000e1-8Q; Tue, 18 May 2021 18:11:42 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj4By-0004Mq-2p; Tue, 18 May 2021 18:11:42 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:Cc:To;
	bh=ofuvlVgP5VBf3Y1E5xtHZWsKDGDSQQPy3HRZEKYa4oE=; b=t+kYy/V3ucTlpUE/VwzINcxFuN
	6+sTYw+mMRM8LKa9iaxbJTCzI2e6gk2hqQ3m8U610fRt7cEYuZ3WYJHny0q3bc7pk39z7Bj8x3dr/
	6XVdLJbqVy3oX9qRRWWijiWDeuLICgWJHYa/YpnU7pDd7H1sOylNDsjXN3ojAYmmk4wI=;
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>, "Doebel, Bjoern" <doebel@amazon.de>,
 raphning@amazon.co.uk, "Durrant, Paul" <pdurrant@amazon.co.uk>
From: Julien Grall <julien@xen.org>
Subject: Preserving transactions accross Xenstored Live-Update
Message-ID: <13bbb51e-f63d-a886-272f-e6a6252fb468@xen.org>
Date: Tue, 18 May 2021 19:11:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

I have started to look at preserving transaction accross Live-update in 
C Xenstored. So far, I managed to transfer transaction that read/write 
existing nodes.

Now, I am running into trouble to transfer new/deleted node within a 
transaction with the existing migration format.

C Xenstored will keep track of nodes accessed during the transaction but 
not the children (AFAICT for performance reason).

Therefore we have the name of the children but not the content (i.e. 
permission, data...).

I have been exploring a couple of approaches:
    1) Introducing a flag to indicate there is a child but no content.

Pros:
   * Close to the existing stream.
   * Fairly implementation agnostic.

Cons:
   * Memory overhead as we need to transfer the full path (rather than 
the child name)
   * Checking for duplication (if the node was actually accessed) will 
introduce runtime overhead.

     2) Extend XS_STATE_TYPE_NODE (or introduce a new record) to allow 
transferring the children name for transaction

Pros:
   * The implementation is more straight forward

Cons:
    * The stream becomes implementation specific

Neither approach looks very appealing to me. So I would like to request 
some feedback for other proposals or preference between the two options.

Note that I haven't looked into much detail how transactions works on 
OCaml Xenstored.

Cheers,

-- 
Julien Grall

