Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPT+KzGCnGkKIwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:37:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B21179E85
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239249.1540688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYvL-0008GX-5l; Mon, 23 Feb 2026 16:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239249.1540688; Mon, 23 Feb 2026 16:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYvL-0008Em-2q; Mon, 23 Feb 2026 16:36:43 +0000
Received: by outflank-mailman (input) for mailman id 1239249;
 Mon, 23 Feb 2026 16:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNtL=A3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1vuYvJ-0008Ef-F6
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 16:36:41 +0000
Received: from smtp-2.srv.uis.cam.ac.uk (smtp-2.srv.uis.cam.ac.uk
 [128.232.132.148]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2ec09f6-10d5-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 17:36:38 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:10335)
 by smtp-2.srv.uis.cam.ac.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.1) (envelope-from <amc96@srcf.net>)
 id 1vuYvF-00000005JUz-5EWC; Mon, 23 Feb 2026 16:36:37 +0000
Received: from [192.168.1.37] (host-92-22-18-152.as13285.net [92.22.18.152])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 42A541FB18;
 Mon, 23 Feb 2026 16:36:37 +0000 (GMT)
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
X-Inumbo-ID: d2ec09f6-10d5-11f1-9ccf-f158ae23cfc8
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <7cf0df43-6271-49f3-8bc1-ceb54f4b8463@srcf.net>
Date: Mon, 23 Feb 2026 16:36:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tools/tests/x86_emulator: fix build on clang-21
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <7147fc3ef5d5bdf5a811e896925d9aa641ed0753.1771840208.git.edwin.torok@citrix.com>
 <6d564a09-b1bb-414f-ba8a-61bf9d9c7e5e@suse.com>
 <c69950cf-7544-40e4-a58c-e2b826f6a5c9@citrix.com>
 <76041b1f-aeb5-4d9e-af6a-a2616763e5c3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <amc96@srcf.net>
Autocrypt: addr=amc96@srcf.net; keydata=
 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
 14JdDDHUX2Rs6+ahAA==
In-Reply-To: <76041b1f-aeb5-4d9e-af6a-a2616763e5c3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.49 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[8];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[srcf.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[amc96@srcf.net,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amc96@srcf.net,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,srcf.net:mid,godbolt.org:url]
X-Rspamd-Queue-Id: 23B21179E85
X-Rspamd-Action: no action

On 23/02/2026 4:21 pm, Jan Beulich wrote:
> On 23.02.2026 17:06, Andrew Cooper wrote:
>> On 23/02/2026 4:02 pm, Jan Beulich wrote:
>>> On 23.02.2026 11:04, Edwin Török wrote:
>>>> clang-21's built-in assembler is enabled by default, but it doesn't
>>>> support some mnemonics:
>>>> ```
>>>> test_x86_emulator.c:2636:36: error: invalid instruction mnemonic 'fsaves'
>>>>  2636 |                        "fidivs %1\n\t"
>>>> test_x86_emulator.c:2640:24: error: invalid instruction mnemonic 'frstors'
>>>>  2640 |         asm volatile ( "frstors %0" :: "m" (res[25]) : "memory" );
>>>>       |                        ^
>>>> test_x86_emulator.c:4251:24: error: invalid instruction mnemonic 'vpcmpestriq'
>>>>  4251 |                        put_insn(vpcmpestri,
>>>>       |                        ^
>>>> ```
>>> Was this reported to them as a bug (or perhaps even two)?
>> Looking at just one of these, the mnemonic is FRSTOR without an S, and
>> Clang 21 is happy with that.
>>
>> What is the trailing S supposed to signify to GAS?
> "short", i.e. the want for a 16-bit operand size prefix.

But that is normally spelled 'w', not 's' in AT&T syntax.

Not that it matters; Clang doesn't like 'w' either.

>  Just like in
> vpcmpestriq the request is for a REX64 prefix. Suffixes are the way to
> go in AT&T syntax when operands alone can't disambiguate operand size.
> The less nice alternative are data16 prefixes; not sure if Clang would
> support those.

data16 seems to be tolerated.

https://godbolt.org/z/MWGjnfWs7

Interestingly Clang automatically inserts a WAIT, although that's a side
effect of the FSAVE it turns into FNSAVE.  

Compiling to a full binary removes the WAIT and reinstates FSAVE, which
I suspect means it's switching back to no-IAS/binutils behind the scenes.

~Andrew

