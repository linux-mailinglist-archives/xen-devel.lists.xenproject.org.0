Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB8A2AF968
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 21:02:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25196.52793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcwJH-0002zu-1R; Wed, 11 Nov 2020 20:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25196.52793; Wed, 11 Nov 2020 20:01:39 +0000
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
	id 1kcwJG-0002zV-UJ; Wed, 11 Nov 2020 20:01:38 +0000
Received: by outflank-mailman (input) for mailman id 25196;
 Wed, 11 Nov 2020 20:01:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ttLz=ER=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kcwJF-0002zP-O2
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:01:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2670222-2c8e-4430-a224-6d20b4da8eb6;
 Wed, 11 Nov 2020 20:01:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ttLz=ER=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kcwJF-0002zP-O2
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:01:37 +0000
X-Inumbo-ID: a2670222-2c8e-4430-a224-6d20b4da8eb6
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a2670222-2c8e-4430-a224-6d20b4da8eb6;
	Wed, 11 Nov 2020 20:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605124896;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=iq9RG7cYXuJPMV4JVw65VgwwPfC0VZdgzpX0O+JaaIc=;
  b=OS3TIfCYV49E+ihFCiAPMQlVnJX4dzkx+0DRyzc8rYVXPOSypqYPmmF8
   53pD/ihxS6tuNhrIGHf03sEONAr5gDsY2RaYOfYisMlrRdNOZX7SQ5mvX
   ntPGC/6dE4+vS7ERtZ2kXSorHltET2vkE7D/PI3xehZcq2kTdTzmBtWP4
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JYCJ24TFRiuqmBsZRN/qus5yCmdw0+xq9XjTp6UbK2hJNB0zy2UAfFIpZcNKmXalrU2/u/3B0U
 /IvQt1kDl5UaZzM1z5KVtzwQWZE/cpZWF2UDAIpTTvrRYCWr9WcvCGhTSM/5b49DfHn29kK9jq
 3aU/acap2Tg4+GYAsfVW631l+X8Wo+W7LqVXwUJm+6+5b4bnew2cHRjsyPyvxLuxJzznTeOyvK
 iV8YNPjSzbWc9KX9RjBRbm8Q9qWiaicaEKq05na2AOW47xMYERTH/+YdwrgBTtAmCa8kFRf6qj
 jx4=
X-SBRS: None
X-MesageID: 31320261
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,470,1596513600"; 
   d="scan'208";a="31320261"
Subject: Re: [PATCH] xen/x86: Work around Clang code generation bug with asm
 parameters
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201111124512.2268-1-andrew.cooper3@citrix.com>
 <8282790a-a0bd-1d33-d992-9d194766254e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3ecb8469-8504-054a-078d-4bf32f8f82c4@citrix.com>
Date: Wed, 11 Nov 2020 20:01:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8282790a-a0bd-1d33-d992-9d194766254e@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 11/11/2020 15:11, Jan Beulich wrote:
> On 11.11.2020 13:45, Andrew Cooper wrote:
>> Clang 9 and later don't handle the clobber of %r10 correctly in
>> _hypercall64_4().  See https://bugs.llvm.org/show_bug.cgi?id=48122
> Are you sure this is a bug?

Yes.

>  With ...
>
>>  #define _hypercall64_4(type, hcall, a1, a2, a3, a4)                     \
>>      ({                                                                  \
>> -        long res, tmp__;                                                \
>> -        register long _a4 asm ("r10") = ((long)(a4));                   \
>> +        long res, _a1 = (long)(a1), _a2 = (long)(a2),                   \
>> +            _a3 = (long)(a3);                                           \
>> +        register long _a4 asm ("r10") = (long)(a4);                     \
>>          asm volatile (                                                  \
>>              "call hypercall_page + %c[offset]"                          \
>> -            : "=a" (res), "=D" (tmp__), "=S" (tmp__), "=d" (tmp__),     \
>> -              "=&r" (tmp__) ASM_CALL_CONSTRAINT                         \
> ... this we've requested "any register", while with ...
>
>> -            : [offset] "i" (hcall * 32),                                \
>> -              "1" ((long)(a1)), "2" ((long)(a2)), "3" ((long)(a3)),     \
>> -              "4" (_a4)                                                 \
> ... this we've asked for that specific register to be initialized
> from r10 (and without telling the compiler that r10 is going to
> change).

Consider applying that same reasoning to "1" instead of "4".  In that
case, a1 would no longer be bound to %rdi.

The use of "4" explicitly binds the input and the output, which includes
requiring them to be the same register.

Furthermore, LLVM tends to consider "not behaving in the same was as
GCC" a bug.

> Also, by what I would have hoped is convention meanwhile, the new
> macro local variables' names shouldn't start with an underscore,
> but instead perhaps end in one. But to be honest, despite knowing
> of the latent (albeit highly hypothetical) issue, each time I
> find myself making such a comment I'm one tiny step closer to
> giving up.

Convention is not created by you getting irritated at others getting
irritated at you for requesting bizarre and unusual changes in submitted
code, or by continuing to point things out, knowing that others
specifically disagree with your reasoning in this case.

Convention is created when there is general agreement over the technical
merits of writing code in one particular way vs the alternatives, *and*
its written down somewhere, so this argument does not continue any further.

There is no restrictions or guidance in the coding style to prefer one
form over another, therefore anything is acceptable.

~Andrew

