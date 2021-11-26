Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A30445F743
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 00:51:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233562.405258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqkyj-0007RH-AQ; Fri, 26 Nov 2021 23:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233562.405258; Fri, 26 Nov 2021 23:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqkyj-0007NF-5w; Fri, 26 Nov 2021 23:50:05 +0000
Received: by outflank-mailman (input) for mailman id 233562;
 Fri, 26 Nov 2021 23:50:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3jyU=QN=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mqkyh-000783-76
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 23:50:03 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fb4f0ee-4f13-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 00:50:01 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49914)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mqkyS-0003kT-gL (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 26 Nov 2021 23:49:48 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D0F421FBF1;
 Fri, 26 Nov 2021 23:49:47 +0000 (GMT)
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
X-Inumbo-ID: 8fb4f0ee-4f13-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <7809f437-320a-6749-e33c-92e641f87be0@srcf.net>
Date: Fri, 26 Nov 2021 23:49:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <2bc4eeab-a69a-a953-e09e-7b87f7dc4b85@suse.com>
 <41e1f32d-6fe0-b588-ca27-8ddbd77f25e4@srcf.net>
 <ce727ab2-da21-b013-9650-98747ebf45a0@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
In-Reply-To: <ce727ab2-da21-b013-9650-98747ebf45a0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/11/2021 13:22, Jan Beulich wrote:
> On 26.11.2021 14:13, Andrew Cooper wrote:
>> On 26/11/2021 12:48, Jan Beulich wrote:
>>> On 26.11.2021 13:33, Andrew Cooper wrote:
>>>>   * I have not checked for misaligned endbr64's, and I'm not sure there is
>>>>     anything useful we could do upon discovering that there were any.
>>>>     Naively, there is a 1 in 2^32 chance (endbr64 being 4 bytes long), but
>>>>     this doesn't account for the structure of x86 code, which is most
>>>>     certainly not a uniform random distribution of bytes.
>>> Do you really mean "misaligned" here? The 2nd sentence rather might suggest
>>> that you mean byte sequences resembling ENDBR, despite actually being part
>>> of other insns. If so, checking might not allow to prove anything, as e.g.
>>> displacements change with about every build.
>> I do mean "any sequence of bytes resembling ENDBR", because that is
>> ultimately how the CPU instruction decode will behave.
>>
>> And yes - you certainly can hide it in a 4-byte disp/imm, but it's an
>> incredibly rare imm32 to find (except for tasks such as in patch 64).

[Answering out of order]
>> You can also hide it in an disp/imm8 followed by a specific nopl, but
>> I'm not sure if we'd ever emit 0F 1E FA as a nopl by default.
> We don't, and the tool chain doesn't either. Only canonical NOPs (opcode
> 0x1F) are to be used there, as all others may gain a meaning beyond
> plain NOP.

Good.  Presuming that this continues to be true, the "endbr64 bridging
two instructions" looks like:

F3 0F 1E FA - real endbr64
0F 1E FA - Not emitted by toolchains
1E xx - push %ds which is #UD in 64bit
FA - cli

So local_irq_{save,disable}() need to be a little wary, but this is far
more constrained than I was anticipating.

> A disp alone won't do in general, as the top byte will only ever be 0x00
> or 0xFF (as long as our binary image doesn't go beyond 16Mb).

Tangent... I thought I'd lifted all the 16M restrictions when I rewrote
the pagetable handling, but the linker assert is still present so
clearly something is still hanging around.

For a call/jump disp32, 0xF30F1EFA is nearly -2G so we're not in any
danger of encountering that, given the 1G upper limit on .text/.data/etc.

However, disp32s on memory operands are effectively arbitrary, and there
are tricks like:

    incl  ASM_PERFC_exceptions * 4(%rcx, %rax, 4)

where the disp32 field isn't even a "usual" offset.

> But a
> ModR/M or SIB byte could start such a sequence, with only two or three
> of the (lower) disp bytes used to complete the pattern.

Luckily, a ModRM of F3 is a reg/reg encoding (ebx and esi), with no SIB
byte, so there is no ModRM=F3, SIB=0F case to worry about.

That leaves:

1) ModRM=F3 with 0F 1E FA in imm32, or
2) ModRM=F3 with 0F 1E in imm16 and a trailing CLI instruction, or
3) SIB=F3, an (%rbx, %rsi, 8)-ish operand with 0F 1E FA coming from imm,
disp or the following instruction.

These look to have rather more wiggle room, but still don't look as if
they'd be common to encounter.

Perhaps the two most worrying areas are imm64 constants, and the
div-by-constant reciprocal that tends to yield a large imm32 for use
with mul.


Given that Marek has kindly hacked us up a check which should find any
arbitrary violations, and on a small sample of builds, there are no
violations, I suggest that we clean it up and put it as a check in the
real build and enable it by default seeing as we're right at the start
of the 4.17 dev window.

If it is seen to trip (and it might well not), we can judge at that
point whether to rearrange the code to avoid it, or drop the check. 
Until then however, it gives us a very strong security statement.

~Andrew

