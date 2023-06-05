Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583C9721D75
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 07:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543478.848499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q62ld-0002K6-8U; Mon, 05 Jun 2023 05:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543478.848499; Mon, 05 Jun 2023 05:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q62ld-0002HD-4v; Mon, 05 Jun 2023 05:28:33 +0000
Received: by outflank-mailman (input) for mailman id 543478;
 Mon, 05 Jun 2023 05:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/oe=BZ=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1q62lc-0002H5-0Q
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 05:28:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cda2ac33-0361-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 07:28:29 +0200 (CEST)
Received: from [192.168.1.98] (unknown [176.206.19.199])
 by support.bugseng.com (Postfix) with ESMTPSA id BD7A44EE073A;
 Mon,  5 Jun 2023 07:28:28 +0200 (CEST)
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
X-Inumbo-ID: cda2ac33-0361-11ee-8611-37d641c3527e
Message-ID: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
Date: Mon, 5 Jun 2023 07:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Xen reliance on non-standard GCC features
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi there.

It appears Xen uses lots of GCC features that are outside the C99
standard.  Some of them are documented GNU extensions to the language.
Some of them seem not to be documented, so they do not qualify
as language extensions (at least, not as far as the spirit and letter
of functional-safety standards are concerned).

Language extensions come with two problems:

a) They limit portability.
b) They significantly increase the cost of compiler qualification
    (commercial C compiler validation suites do not cover the extensions,
    and the cost of the extra validation effort will have to be born
    by whomever wants to use Xen for safety-related development).

Said that, maybe the use of certain extensions is intentional, but for
others it may be unintentional.  The purpose of this message is to
distinguish the ones from the others.  In the following, when I mention
the C99 standard, I refer to compiler uses with -std=c99 or -std=gnu99.

Let us start from the (as far as I can tell) undocumented extensions:

U1) Use of _Static_assert in C99 mode.

U2) Empty initialization lists, both in C99 mode (ARM64 and X86_64)
     and C18 mode (only X86_64).

U3) Returning void expressions.

U4) Static functions or variables used in inline functions with external
     linkage.

U5) Enumerator values outside the range of `int'.

U6) Empty declarations.

U7) Empty enum definitions.

U8) Conversion between incompatible pointer types.

U9) Conversion between function pointers and object pointers.

U10) \m escape sequence.
      Is this an undocumented GCC extension or just a typo?

In case you know where these are documented in the GCC manual,
I would appreciate if you could tell me.

Here is a list of extensions that are documented in the GCC manual:

D1) Arithmetic operators on `void *' type:
     See Section "6.24 Arithmetic on void- and Function-Pointers"
     of the GCC manual."

D2) Sizeof and alignof on `void *' type:
     See Section "6.24 Arithmetic on void- and Function-Pointers"
     of the GCC manual."

D3) Use of GNU statement expressions.
     See Section "6.1 Statements and Declarations in Expressions"
     of the GCC manual.

D4) Use of GNU statement expressions from macro expansion.
     See Section "6.1 Statements and Declarations in Expressions"
     of the GCC manual.
     (My advice is to read it fully, as there are implications.)

D5) Record declarations with no members.
     See Section "6.19 Structures with No Members" of the GCC manual."

D6) Structures containing a flexible array member as member of a structure.
     See Section "6.18 Arrays of Length Zero" of the GCC manual.

D7) Structures containing a flexible array member as element of an array.
     See Section "6.18 Arrays of Length Zero" of the GCC manual.

D8) Binary conditional operator.
     See Section "6.8 Conditionals with Omitted Operands" of the GCC manual.

D9) Case labels with upper/lower values.
     See Section "6.30 Case Ranges" of the GCC manual.

D10) Anonymous structure and union fields.
      See Section "6.63 Unnamed Structure and Union Fields" of the GCC manual.

D11) Variadic macros called without any argument for '...'
      See Section "6.21 Macros with a Variable Number of Arguments"
      of the GCC manual.

D12) Forward references to enum definitions.
      See Section "6.49 Incomplete enum Types" of the GCC manual.

Finally, Xen seems to rely on explicitly undefined behavior, namely
C99 UB 58: "A structure or union is defined as containing no named
members (6.7.2.1)." All instances but one occur via macro BUILD_BUG_ON_ZERO,
the remaining instance concerns struct
`cpu_policy::<anonymous union>::<anonymous struct>::<anonymous union>::<anonymous struct>'.
Reliance on undefined behavior might be hard to justify.

I look forward to receiving your feedback.
Kind regards,

    Roberto

