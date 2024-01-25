Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD5983CB86
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 19:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671737.1045243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4kt-0007cC-M2; Thu, 25 Jan 2024 18:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671737.1045243; Thu, 25 Jan 2024 18:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4kt-0007aK-JT; Thu, 25 Jan 2024 18:47:15 +0000
Received: by outflank-mailman (input) for mailman id 671737;
 Thu, 25 Jan 2024 18:47:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rT4ks-0007aE-2M
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 18:47:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4kr-0002VT-D9; Thu, 25 Jan 2024 18:47:13 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.5.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4kr-0008VC-6o; Thu, 25 Jan 2024 18:47:13 +0000
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
	bh=1sWA3lBuGp/hPSm+43trthR5afGMOBUKC/9cdOTI3dw=; b=2g6nZyinjDgqa+etotGfRgsLxo
	bIteytAszbQVtTMdYRzCda0/rVTr8CkCy7fDp+6TEP1N9IQY0a1ML3JIhSke+J61sgoxNv0LkZx1t
	8tEuTDjfyB/kewMHQ1qaPpOLKm8nQ8kXQkjvyteNVgB0iz5QBGqXky85fh2wKwhw777k=;
Message-ID: <b0c56882-2a34-4815-95c4-5d5f360d4492@xen.org>
Date: Thu, 25 Jan 2024 18:47:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/33] tools/xenstored: add early_init() function
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-23-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240104090055.27323-23-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/01/2024 09:00, Juergen Gross wrote:
> Some xenstored initialization needs to be done in the daemon case only,
> so split it out into a new early_init() function being a stub in the
> stubdom case.
> 
> Remove the call of talloc_enable_leak_report_full(), as it serves no
> real purpose: the daemon only ever exits due to a crash, in which case
> a log of talloc()ed memory hardly has any value.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

