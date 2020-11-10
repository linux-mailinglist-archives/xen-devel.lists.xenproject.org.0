Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3E12AD75D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 14:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23378.50075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcTYo-0001oZ-34; Tue, 10 Nov 2020 13:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23378.50075; Tue, 10 Nov 2020 13:19:46 +0000
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
	id 1kcTYn-0001oA-WE; Tue, 10 Nov 2020 13:19:46 +0000
Received: by outflank-mailman (input) for mailman id 23378;
 Tue, 10 Nov 2020 13:19:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcTYm-0001o0-Do
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:19:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca5d3cd4-0a20-4a0a-865d-a307583a7e8a;
 Tue, 10 Nov 2020 13:19:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0453ABCC;
 Tue, 10 Nov 2020 13:19:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcTYm-0001o0-Do
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:19:44 +0000
X-Inumbo-ID: ca5d3cd4-0a20-4a0a-865d-a307583a7e8a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ca5d3cd4-0a20-4a0a-865d-a307583a7e8a;
	Tue, 10 Nov 2020 13:19:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605014380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjIxpzoJoK2RSmU+/Sp56xcGMtt7dE1k677M7iQdhr0=;
	b=Sf/jqmcV09prnR3VZfsTw7JOT4nFDEAmgPie/XOceYuIAy+77v+rzSsKqHSD48N2nAvvpc
	0CKh2O+eheI3BSXGn/BgeDG5MdYGUNgBH1qh4cdRrurbo8eTt1mOR4SjaIFOCJaVPTIBpq
	Qpjh8ticDZuHqkFwQH0emVb1uuGkHlc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D0453ABCC;
	Tue, 10 Nov 2020 13:19:40 +0000 (UTC)
Subject: Re: [PATCH v3 5/7] x86: guard against straight-line speculation past
 RET
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
 <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
 <20201110093142.hkufamaepn67gv43@Air-de-Roger>
 <92e58ff0-e6a4-f92f-1ad6-06db7751762a@suse.com>
 <20201110111603.rarf7ncddrkswlxs@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <586bb9e5-bb90-bb27-3010-e702d65e301c@suse.com>
Date: Tue, 10 Nov 2020 14:19:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201110111603.rarf7ncddrkswlxs@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.11.2020 12:16, Roger Pau Monné wrote:
> On Tue, Nov 10, 2020 at 11:06:46AM +0100, Jan Beulich wrote:
>> On 10.11.2020 10:31, Roger Pau Monné wrote:
>>> On Fri, Oct 23, 2020 at 10:38:04AM +0200, Jan Beulich wrote:
>>>> Under certain conditions CPUs can speculate into the instruction stream
>>>> past a RET instruction. Guard against this just like 3b7dab93f240
>>>> ("x86/spec-ctrl: Protect against CALL/JMP straight-line speculation")
>>>> did - by inserting an "INT $3" insn. It's merely the mechanics of how to
>>>> achieve this that differ: A set of macros gets introduced to post-
>>>> process RET insns issued by the compiler (or living in assembly files).
>>>>
>>>> Unfortunately for clang this requires further features their built-in
>>>> assembler doesn't support: We need to be able to override insn mnemonics
>>>> produced by the compiler (which may be impossible, if internally
>>>> assembly mnemonics never get generated), and we want to use \(text)
>>>> escaping / quoting in the auxiliary macro.
>>>
>>> Could this have an option to enable/disable at build time?
>>
>> Well, a subsequent patch adds a config option for this, which in
>> the worst case could be turned off. I'm afraid though I'm not
>> clear about the question, because ...
>>
>>> FreeBSD will drop GNU as quite soon from base, and albeit it can be
>>> installed as a package I would like to be able to build Xen using a
>>> toolchain based on LLVM exclusively.
>>
>> ... it's not clear to me what the implications here are: Are you
>> saying -no-integrated-as is not going to function anymore, unless
>> people explicitly install gas? If that's not what you meant to
>> indicate, then I don't see how building would become impossible.
> 
> I'm still inquiring about this, but I would say that when gas is
> removed from FreeBSD then the 'as' command would be mapped to llvm-as,
> and thus -no-integrated-as would hit the same issues as the integrated
> as. So far in Xen we have assumed that -no-integrated-as would
> fallback to an as capable of doing what the integrated clang as
> doesn't support, but that might not be the case.

At which point Xen couldn't be built anyway, I expect. If llvm-as
isn't sufficiently gas-compatible, we've lost (right now at least).

> Ideally we would have to re-run the tests with -no-integrated-as, in
> order to assert that the external as is really capable of what the
> internal one is not.

And if it doesn't, what would we do other than failing the build
(which it would also if we didn't do the 2nd round of checks)?

Jan

