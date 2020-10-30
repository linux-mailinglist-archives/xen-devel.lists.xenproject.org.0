Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3188E2A02B6
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 11:21:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15612.38617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYRX3-0000z8-4m; Fri, 30 Oct 2020 10:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15612.38617; Fri, 30 Oct 2020 10:21:17 +0000
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
	id 1kYRX3-0000yj-1C; Fri, 30 Oct 2020 10:21:17 +0000
Received: by outflank-mailman (input) for mailman id 15612;
 Fri, 30 Oct 2020 10:21:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYRX0-0000yd-RQ
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:21:14 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2b54742-748d-44ab-b478-b1543c195c5f;
 Fri, 30 Oct 2020 10:21:13 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYRWx-0005Py-4m; Fri, 30 Oct 2020 10:21:11 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYRWw-0005n7-Rt; Fri, 30 Oct 2020 10:21:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYRX0-0000yd-RQ
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:21:14 +0000
X-Inumbo-ID: a2b54742-748d-44ab-b478-b1543c195c5f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a2b54742-748d-44ab-b478-b1543c195c5f;
	Fri, 30 Oct 2020 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=DpagRUoaWOiZtLNNsCwYXCTH2dY4fG6an5igMXxemW0=; b=lhW4cJ1cvYWJn/8qBC4mSCBJAq
	TQMxKDqB+mZmbOBVb1hD8BciacFx9dj9bunCl/5/ljTDg61p5MiPoB3UY/y7ipcn+FgREUzHYBmw4
	+saTN3EBD7ObFQI03gM8TueVjng/6Y/PqyYcNY8HWMp6HKbC8R65du9YiAOp0OwaOzFI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYRWx-0005Py-4m; Fri, 30 Oct 2020 10:21:11 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYRWw-0005n7-Rt; Fri, 30 Oct 2020 10:21:10 +0000
Subject: Re: [PATCH v2 2/8] evtchn: replace FIFO-specific header by generic
 private one
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <3fea358e-d6d1-21d4-2d83-d9bd457ba3b5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c330d6e3-04da-9bf2-5634-b6b2961c18db@xen.org>
Date: Fri, 30 Oct 2020 10:21:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <3fea358e-d6d1-21d4-2d83-d9bd457ba3b5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/10/2020 15:08, Jan Beulich wrote:
> Having a FIFO specific header is not (or at least no longer) warranted
> with just three function declarations left there. Introduce a private
> header instead, moving there some further items from xen/event.h.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> v2: New.
> ---
> TBD: If - considering the layering violation that's there anyway - we
>       allowed PV shim code to make use of this header, a few more items
>       could be moved out of "public sight".

Are you referring to PV shim calling function such as evtchn_bind_vcpu()?

Cheers,

-- 
Julien Grall

