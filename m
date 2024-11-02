Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1620B9BA176
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 17:42:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829525.1244497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7HCv-0005BK-1W; Sat, 02 Nov 2024 16:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829525.1244497; Sat, 02 Nov 2024 16:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7HCu-00058S-V8; Sat, 02 Nov 2024 16:42:36 +0000
Received: by outflank-mailman (input) for mailman id 829525;
 Sat, 02 Nov 2024 16:42:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7HCt-00058M-Q6
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 16:42:35 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72cf0089-9939-11ef-99a3-01e77a169b0f;
 Sat, 02 Nov 2024 17:42:31 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730565744126272.650446673846;
 Sat, 2 Nov 2024 09:42:24 -0700 (PDT)
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
X-Inumbo-ID: 72cf0089-9939-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcyY2YwMDg5LTk5MzktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNTY1NzUxLjg5Nzc0NSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730565745; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WtWX5O+OOWgeU6GDDTxwKkXeKlJZLNpCyzw9zG6glQcAtUW2ACAdZ3NFzm395YxTm2llmKxK7ZFEKwx0Q/20kqyRL9YoXRM5oIHeOyJ6sGN6FHPLnB7UgNixE+VACA2kKSzlNhuBvAdQFAczj7qtBH9o7jw7AJspO0O+FsleS5Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730565745; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U9p2RjgPxBhXuYtmg+T3Hy/9H4zyhyFyRanWavga3x4=; 
	b=QiEkbfXnlD4M9pIvtHfw5XHDwQYfZHNuBmoI54oopN4ziuhmCz+YKzFZGXXCRKcRt98rCMOp+X74HpWZQdseImCcJ9RnXQr4NIvf5qelzMffyitIlJK+gf0GIKa6trF6IktCzX1ZfJb4BXjq0xwzWUe5CH7wAg+hQLRINmR3kb4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730565745;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=U9p2RjgPxBhXuYtmg+T3Hy/9H4zyhyFyRanWavga3x4=;
	b=bLNwaIcKbcH+4ZCJ8xXDBDIysIQnjWoSUweAeRmfAqFWQomph7Feho9FICcCl8h5
	sTx5fOqKQ2PhCSz2x4AFiKPj4iBv6IsFsBx6sXb6w/IIWLnc8rwEgNzA0W7rj+Dki1r
	z4K8sU0E85SRsK+omjRspfhus6UQCy4V17w3Hj6c=
Message-ID: <35ce38ec-9bc1-41c6-84da-a623807d1225@apertussolutions.com>
Date: Sat, 2 Nov 2024 12:42:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] x86/ucode: Enforce invariant about module selection
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-7-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241028091856.2151603-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/28/24 05:18, Andrew Cooper wrote:
> The work to add the `ucode=nmi` cmdline option left a subtle corner case.
> Both scan and an explicit index could be selected, and we could really find a
> CPIO archive and explicit microcode file.
> 
> Worse, because the if/else chains for processing ucode_{blob,mod} are opposite
> ways around in early_microcode_load() and microcode_init_cache(), we can
> genuinely perform early microcode loading from the CPIO archive, then cache
> from the explicit file.
> 
> Therefore, enforce that only one selection method can be active.
> 
> Rename ucode_{scan,mod_idx} to have an opt_ prefix.  This is both for
> consistency with the rest of Xen, and to guarantee that we've got all
> instances of the variables covered in this change.  Explain how they're use.
> During cmdline/config parsing, always update both variables in pairs.
> 
> In early_microcode_load(), ASSERT() the invariant just in case.  Use a local
> variable for idx rather than operating on the static; we're the only consume
> of the value.
> 
> Expand the index selection logic with comments and warnings to the user when
> something went wrong.
> 
> Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Despite the fixes tag, this can't be backported (at least not in this form).

This provides a much more consistent/predictable behavior.

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

