Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14257221F3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 11:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543578.848666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q66Mr-0008Hd-Ti; Mon, 05 Jun 2023 09:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543578.848666; Mon, 05 Jun 2023 09:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q66Mr-0008Eb-Qf; Mon, 05 Jun 2023 09:19:13 +0000
Received: by outflank-mailman (input) for mailman id 543578;
 Mon, 05 Jun 2023 09:19:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/oe=BZ=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1q66Mp-0008EV-UH
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 09:19:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 060ee4a6-0382-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 11:19:08 +0200 (CEST)
Received: from [192.168.1.142] (unknown [151.37.78.171])
 by support.bugseng.com (Postfix) with ESMTPSA id 9706B4EE073A;
 Mon,  5 Jun 2023 11:19:06 +0200 (CEST)
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
X-Inumbo-ID: 060ee4a6-0382-11ee-8611-37d641c3527e
Message-ID: <00f013e2-865f-4a7f-6dbb-e51ea6d05c2a@bugseng.com>
Date: Mon, 5 Jun 2023 11:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: Xen reliance on non-standard GCC features
To: Jan Beulich <jbeulich@suse.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <f5c112f1-a0ac-63a8-17b4-b42ab5fd2ad9@suse.com>
Content-Language: en-US
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <f5c112f1-a0ac-63a8-17b4-b42ab5fd2ad9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/23 09:35, Jan Beulich wrote:
> On 05.06.2023 07:28, Roberto Bagnara wrote:
>> Finally, Xen seems to rely on explicitly undefined behavior, namely
>> C99 UB 58: "A structure or union is defined as containing no named
>> members (6.7.2.1)." All instances but one occur via macro BUILD_BUG_ON_ZERO,
>> the remaining instance concerns struct
>> `cpu_policy::<anonymous union>::<anonymous struct>::<anonymous union>::<anonymous struct>'.
>> Reliance on undefined behavior might be hard to justify.
> 
> For starters just a comment here: I'm pretty sure this case was discussed
> before, and that it was agreed that if need be we'd simply add _ as the
> name there. Yet then - how did you notice this? Code inspection? I would
> expect no analysis tool would spot it because it's used for gcc < 4.6
> only. And I doubt you run analysis tools in combination with this old a
> gcc?

It is detected by ECLAIR, but the analysis is based on GCC 12,
and the detection of implementation-defined behaviors (including
predefined macros) is completely automatic, so I don't think there
is any configuration error.

One of the instances arises from

xen/arch/arm/dm.c:50.19-50.37:
all the members of struct `dm_op(const struct dmop_args*)::<anonymous struct>' are unnamed (undefined for the C99 standard, ISO/IEC 9899:1999 Annex J.2 item 58: "A structure or union is defined as containing no named members (6.7.2.1)." [STD.anonstct]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

and, in turn:

xen/include/xen/lib.h:54.12-54.17: expanded from macro `BUILD_BUG_ON_ZERO'
xen/include/xen/compiler.h:126.3-126.77: expanded from macro `__must_be_array'
xen/include/xen/lib.h:77.53-77.70: expanded from macro `ARRAY_SIZE'

I apologize in advance if I have misunderstood something.
Kind regards,

    Roberto

