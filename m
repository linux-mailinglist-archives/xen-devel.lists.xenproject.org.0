Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4D928CBC3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 12:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6144.16184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSHcd-00030e-Cw; Tue, 13 Oct 2020 10:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6144.16184; Tue, 13 Oct 2020 10:33:35 +0000
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
	id 1kSHcd-00030F-99; Tue, 13 Oct 2020 10:33:35 +0000
Received: by outflank-mailman (input) for mailman id 6144;
 Tue, 13 Oct 2020 10:33:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSHcb-000309-8i
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 10:33:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0de2bf8d-4077-43ad-89d7-7edbee472268;
 Tue, 13 Oct 2020 10:33:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCBD6ADA8;
 Tue, 13 Oct 2020 10:33:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSHcb-000309-8i
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 10:33:33 +0000
X-Inumbo-ID: 0de2bf8d-4077-43ad-89d7-7edbee472268
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0de2bf8d-4077-43ad-89d7-7edbee472268;
	Tue, 13 Oct 2020 10:33:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602585211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uJpfnqEhG3clpJ6iODe36Kg1iSHOlDN5ELdcDXVv83I=;
	b=PiEMnCxUVUZTKhRuun9NuYT1mW1WRM2uLT8FYJ9IbqdmWBiUDqp0gXwTdwvQESh9oPOSRK
	2BaWmyVqooVgMcB/OOh+UhDtTwK8oS0u6RaQiAmlOe7/l68HjszQ5S9n7LI3C3XG3gJDUN
	XqKjo1xrdnQKFw8rlaLrwTNvORz3iwA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BCBD6ADA8;
	Tue, 13 Oct 2020 10:33:31 +0000 (UTC)
Subject: Re: [PATCH v2 5/6] x86: guard against straight-line speculation past
 RET
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <fd18939c-cfc7-6de8-07f2-217f810afde1@suse.com>
 <20201008162822.GM19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3a9a4d5-d647-013e-5c10-545af9c49429@suse.com>
Date: Tue, 13 Oct 2020 12:33:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201008162822.GM19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.10.2020 18:28, Roger Pau Monné wrote:
> On Mon, Sep 28, 2020 at 02:31:49PM +0200, Jan Beulich wrote:
>> Under certain conditions CPUs can speculate into the instruction stream
>> past a RET instruction. Guard against this just like 3b7dab93f240
>> ("x86/spec-ctrl: Protect against CALL/JMP straight-line speculation")
>> did - by inserting an "INT $3" insn. It's merely the mechanics of how to
>> achieve this that differ: A set of macros gets introduced to post-
>> process RET insns issued by the compiler (or living in assembly files).
>>
>> Unfortunately for clang this requires further features their built-in
>> assembler doesn't support: We need to be able to override insn mnemonics
>> produced by the compiler (which may be impossible, if internally
>> assembly mnemonics never get generated), and we want to use \(text)
>> escaping / quoting in the auxiliary macro.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Code LGTM.
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> TBD: Should this depend on CONFIG_SPECULATIVE_HARDEN_BRANCH?
> 
> I don't see the additions done in 3b7dab93f240 being guarded by
> CONFIG_SPECULATIVE_HARDEN_BRANCH, so in that regard I would say no.
> However those are already guarded by CONFIG_INDIRECT_THUNK so it's
> slightly weird that the addition of such protections cannot be turned
> off in any way.
> 
> I would be fine with having the additions done in 3b7dab93f240
> protected by CONFIG_SPECULATIVE_HARDEN_BRANCH, and then the additions
> done here also.

Okay, perhaps I'll make a separate patch then to add the conditional
at all respective places.

Jan

