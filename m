Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42F313161
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 12:51:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82810.153070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l954I-00016c-Qk; Mon, 08 Feb 2021 11:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82810.153070; Mon, 08 Feb 2021 11:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l954I-00016A-Nm; Mon, 08 Feb 2021 11:51:02 +0000
Received: by outflank-mailman (input) for mailman id 82810;
 Mon, 08 Feb 2021 11:51:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l954H-000162-3j
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 11:51:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l954G-0002lN-Lq; Mon, 08 Feb 2021 11:51:00 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l954G-0001gh-EF; Mon, 08 Feb 2021 11:51:00 +0000
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
	bh=Yb8hwLCySjNi2+iqUZJlgDYQEPN0SidS4NbLYbSWASA=; b=0EP9GAFGUUaHqcqmkHxhIkNS/2
	q+12rHMTFSmo7vkP8d46/QLtWVzWHba1fqhtQm1Y2z2JOKDtsVDeBpzFAfxoAa3D6PPfX4bAD4ndV
	7rpEDV3zOiQ3K+NGx7pWQziyno6q4hapeUafIHQy//JxAUSFNREMC7hY5efEE6w/wgmo=;
Subject: Re: [PATCH 7/7] xen/evtchn: read producer index only once
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-8-jgross@suse.com>
 <72334160-cffe-2d8a-23b7-2ea9ab1d803a@suse.com>
 <626f500a-494a-0141-7bf3-94fb86b47ed4@suse.com>
 <e88526ac-6972-fe08-c58f-ea872cbdcc14@suse.com>
 <d0ca217c-ecc9-55f7-abb1-30a687a46b31@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <42e15cc4-56d1-b34b-d97e-d579e771788a@xen.org>
Date: Mon, 8 Feb 2021 11:50:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d0ca217c-ecc9-55f7-abb1-30a687a46b31@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 08/02/2021 10:59, Jürgen Groß wrote:
> On 08.02.21 11:51, Jan Beulich wrote:
> Yes, but I don't see an urgent need to fix that, as there would
> be thousands of accesses in the kernel needing a fix. A compiler
> tearing a naturally aligned access into multiple memory accesses
> would be rejected as buggy from the kernel community IMO.

I would not be so sure. From lwn [1]:

"In the Linux kernel, tearing of plain C-language loads has been 
observed even given properly aligned and machine-word-sized loads.)"

And for store tearing:

"Note that this tearing can happen even on properly aligned and 
machine-word-sized accesses, and in this particular case, even for 
volatile stores. Some might argue that this behavior constitutes a bug 
in the compiler, but either way it illustrates the perceived value of 
store tearing from a compiler-writer viewpoint. [...] But for properly 
aligned machine-sized stores, WRITE_ONCE() will prevent store tearing."

Cheers,

[1] https://lwn.net/Articles/793253/#Load%20Tearing

> 
> 
> Juergen

-- 
Julien Grall

