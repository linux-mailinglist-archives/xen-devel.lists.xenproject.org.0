Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A1387653
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 12:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129035.242220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwq3-0006bW-QL; Tue, 18 May 2021 10:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129035.242220; Tue, 18 May 2021 10:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwq3-0006Zr-MF; Tue, 18 May 2021 10:20:35 +0000
Received: by outflank-mailman (input) for mailman id 129035;
 Tue, 18 May 2021 10:20:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1liwq2-0006Zl-2G
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 10:20:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwq1-0000DD-RV; Tue, 18 May 2021 10:20:33 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwq1-0000eh-Lg; Tue, 18 May 2021 10:20:33 +0000
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
	bh=JuAqfttAr0cqJXlEstfQXvr8kBJVIZtkS87RGGDsMy8=; b=EwpvBuvHE/lEv02EmNX1fo69Le
	4PqJbOS1DGAAhLxVcK572WTcTeWKzPkOF8TZnY5B799kU2tmS82wsMqxpZpNzHdXw8UQVZT5MiQxl
	Qy+IJJKIPL09QsApTQqTgv6DFFkhvfH+CMvrG4kAWdCCALy74Tk94O3KgX/wCJwpzS0E=;
Subject: Re: [PATCH 06/10] xen: replace order with nr_pfns in assign_pages for
 better compatibility
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-7-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7dc01bcd-1570-82fa-5d15-11c28a857b3f@xen.org>
Date: Tue, 18 May 2021 11:20:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-7-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 18/05/2021 06:21, Penny Zheng wrote:
> Function parameter order in assign_pages is always used as 1ul << order,
> referring to 2@order pages.
> 
> Now, for better compatibility with new static memory, order shall
> be replaced with nr_pfns pointing to page count with no constraint,
> like 250MB.

We have similar requirements for LiveUpdate because are preserving the 
memory with a number of pages (rather than a power-of-two). With the 
current interface would be need to split the range in a power of 2 which 
is a bit of pain.

However, I think I would prefer if we introduce a new interface (maybe 
assign_pages_nr()) rather than change the meaning of the field. This is 
for two reasons:
   1) We limit the risk to make mistake when backporting a patch touch 
assign_pages().
   2) Adding (1UL << order) for pretty much all the caller is not nice.

Cheers,

-- 
Julien Grall

