Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F723043E4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 17:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75294.135523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RJQ-0005dB-5r; Tue, 26 Jan 2021 16:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75294.135523; Tue, 26 Jan 2021 16:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RJQ-0005cl-1a; Tue, 26 Jan 2021 16:35:28 +0000
Received: by outflank-mailman (input) for mailman id 75294;
 Tue, 26 Jan 2021 16:35:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4RJN-0005cg-WD
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:35:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a05c9ecd-13dd-4592-a515-c927d7f66797;
 Tue, 26 Jan 2021 16:35:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDB81AF7E;
 Tue, 26 Jan 2021 16:35:23 +0000 (UTC)
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
X-Inumbo-ID: a05c9ecd-13dd-4592-a515-c927d7f66797
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611678923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMN/Ys788Kz+RXTfIF8I+iiIEKBU4Rao4lTwxIo2adY=;
	b=VZO9y/PFz4KGPh6HQIQSCs7XfxkQYtklgpATst8M/JKbNS//TN/L5ItQm+nmtIMN6atalv
	1aWKixXwuC6wBnXF05V5qBoKaIyn/wGgtA4a01UDe+cJ2TJuj16rd1zR7YlOMDU5Prb4j3
	B7SUFb3RmgzUaG+sEjP0Twy7/QMF3YY=
Subject: Re: [PATCH v2 3/4] x86: Allow non-faulting accesses to non-emulated
 MSRs if policy permits this
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, jun.nakajima@intel.com,
 kevin.tian@intel.com, xen-devel@lists.xenproject.org
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
 <c9ee36ca-e19d-0408-d137-8dcee4110ef3@suse.com>
 <dc4ec7c0-c2cf-bf15-a757-7f1836ca801d@oracle.com>
 <d3aec393-4f3b-140b-2189-5de731ee23ba@suse.com> <YA8RCGy6Zj5rE2R8@oracle.com>
 <6f16e5d7-41b5-1a11-c444-11aab52a8891@suse.com> <YBA9HKvmToot64BP@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08d3f304-4c25-75e4-e125-42150d628c33@suse.com>
Date: Tue, 26 Jan 2021 17:35:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YBA9HKvmToot64BP@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 17:02, Boris Ostrovsky wrote:
> On 21-01-26 10:05:47, Jan Beulich wrote:
>> On 25.01.2021 19:42, Boris Ostrovsky wrote:
>>> On 21-01-25 11:22:08, Jan Beulich wrote:
>>>> On 22.01.2021 20:52, Boris Ostrovsky wrote:
>>>>> "Sibling" in terms of name (yes, it would be) or something else?
>>>>
>>>> Name and (possible) purpose - a validate hook could want to
>>>> make use of this, for example.
>>>
>>> A validate hook? 
>>
>> Quoting from struct x86_emulate_ops:
>>
>>     /*
>>      * validate: Post-decode, pre-emulate hook to allow caller controlled
>>      * filtering.
>>      */
>>     int (*validate)(
>>         const struct x86_emulate_state *state,
>>         struct x86_emulate_ctxt *ctxt);
>>
>> Granted to be directly usable the function would need to have a
>> "state" parameter. As that's unused, having it have one and
>> passing NULL in your case might be acceptable. But I also could
>> see arguments towards this not being a good idea.
> 
> I see. Where would we need to call this hook though? We are never directly
> emulating MSR access (compared to, for example, CR accesses where
> x86_insn_is_cr_access is used). And for PV we already validate it in
> emul-priv-op.c():validate().

If you look at some of the functions used for this hook, you may
realize that what your function does could also fit a hypothetical
future hook. Hence I was suggesting to make the new function
suitable for such use right away (and in particular fit their
naming scheme). But it looks like this has ended up more confusing
than anything else, so never mind.

Jan

