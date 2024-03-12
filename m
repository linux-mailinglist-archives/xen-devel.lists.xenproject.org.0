Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652FD8791CD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691733.1077988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzGr-0004Z7-TW; Tue, 12 Mar 2024 10:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691733.1077988; Tue, 12 Mar 2024 10:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzGr-0004Ws-Qp; Tue, 12 Mar 2024 10:22:09 +0000
Received: by outflank-mailman (input) for mailman id 691733;
 Tue, 12 Mar 2024 10:22:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rjzGq-0004Wk-Iq
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:22:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rjzGp-0006ct-TK; Tue, 12 Mar 2024 10:22:07 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rjzGp-0006kc-LH; Tue, 12 Mar 2024 10:22:07 +0000
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
	bh=OYPc1rI6cazjN4G1VMzOnQcjU4zsryqByt7pQaUumH8=; b=MWphzdiFpdLTMwqJ6CH4zfa57q
	ecKosglvz/MWQHCJROqxD7p+N1eP5tYXP59JrbPED5Nb0QFsvUcrwD2/XSePLzWflvQDfJwNvOsW8
	nsZM8L/ta3yfaqu+EwLw97ZehgqsN6s2tucnG74TQKwC9ejOOcv4Momn1kzNdVHe1VxY=;
Message-ID: <045b1170-56f1-4194-858a-9f4aecfd15ec@xen.org>
Date: Tue, 12 Mar 2024 10:22:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 09/16] xen: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-GB
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <504cdd2a0f27d28e0a87492f75476b123b68bbc0.1710145041.git.simone.ballarin@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <504cdd2a0f27d28e0a87492f75476b123b68bbc0.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Simone,

On 11/03/2024 08:59, Simone Ballarin wrote:
> Amend inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere) and the #if directive cannot
> be used for other checks.
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>

Regarding Jan's comment, I don't have any strong opinion on whether this 
patch impair readability in this case. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

