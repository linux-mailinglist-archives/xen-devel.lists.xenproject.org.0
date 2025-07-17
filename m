Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C9B0872B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 09:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046316.1416639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJFz-0008Vb-6m; Thu, 17 Jul 2025 07:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046316.1416639; Thu, 17 Jul 2025 07:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJFz-0008TM-3g; Thu, 17 Jul 2025 07:42:19 +0000
Received: by outflank-mailman (input) for mailman id 1046316;
 Thu, 17 Jul 2025 07:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEt7=Z6=bounce.vates.tech=bounce-md_30504962.6878a724.v1-38df59fb8e824747bc33eed269c1c7a4@srs-se1.protection.inumbo.net>)
 id 1ucJ6x-0004NF-17
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 07:32:59 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fc3670d-62e0-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 09:32:53 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bjPlm1qkHz8XRqRF
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 07:32:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 38df59fb8e824747bc33eed269c1c7a4; Thu, 17 Jul 2025 07:32:52 +0000
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
X-Inumbo-ID: 3fc3670d-62e0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1752737572; x=1753007572;
	bh=fBderDz/vIBoibX0gTwvyuzMFsWB/Usn1ouyPP1beaI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=q0J035OgXs24YXzz/RlO8g8ko+4xCP9zLT7Mung9Zt2voaVjtUr4z0lQlwd8nZqXL
	 E4QSxy818M4tmn2uCxlizsVhvCTLbECYqSZaaapb8fu0Dp3LbmpK/e97cyGmi5Y0Hc
	 dMXAw2pOhePT20MLZT9VIRcxdFanCgcGliwYtZAPmXOz0C+WPtNXmVxseMUV5n+c9W
	 cBiwtt05wx33U+0Hl9ru3erCITjBWdP9q/RFpDJYkfcWCotSIYnuLbHrO5Q/ulrjNl
	 Vtu/I4ahYYRVFxH2SEzxErU3WBsv3DL9upeEQ98CCzbt6ZUFQmlzICqVUcyayN/TSb
	 iUOYKph407TYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1752737572; x=1752998072; i=yann.sionneau@vates.tech;
	bh=fBderDz/vIBoibX0gTwvyuzMFsWB/Usn1ouyPP1beaI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1hEZP7Z7vUo/xUnAj9/QTlKmyvbTtpvWRtOQ7ZjioTGbOCdCr/uVFviDkWyP0CKlL
	 AIf7fO8/VDwDxePvfjAeeNGximICKXO5Kw7yWqRQg48EFoYsqzp5n7M3lyFnOUOOk+
	 hxY9/fDBmgKh6422E4feYQmeLOjksCdpHXdPS4aDoos8gkplKWqq9BqJfGlgkiY/03
	 Z8hTvXostxXHDhy4/mpFJf/JdUzLb9FzB90g3yidn7Ht8yhlCJ+5aVBOcDIOAvfLW1
	 z+pi037Pi+fBfv2w+aaDbqZUeyxPjFDJLEohEizvBT9xa4vXVgAPvA7bpMQdsbPGhA
	 4iEmrZyTJOyyA==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20xen.efi=20has=20MEM=5FDISCARDABLE=20flag=20in=20Characteristics=20field=20of=20.reloc=20section?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1752737570927
Message-Id: <7a7f40b8-5d73-421a-9358-30421d12a243@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, "Demi Marie Obenour" <demiobenour@gmail.com>
Cc: yann@sionneau.net, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Xen developer discussion" <xen-devel@lists.xenproject.org>, nickc@redhat.com
References: <39104717-4b64-483c-b6fd-d30069df4c58@gmail.com> <7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com>
In-Reply-To: <7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.38df59fb8e824747bc33eed269c1c7a4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250717:md
Date: Thu, 17 Jul 2025 07:32:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Demi Marie, Jan, Nick, all,

Thank you Demi Marie for bringing this topic on the mailing list.

I discussed it a bit with Jan on Matrix but the situation is not pretty, 
there is no clean solution that stands out easily.

As Jan said, it seems .reloc is meant to be discardable, so we can't 
blame binutils LD for putting it:

https://github.com/bminor/binutils-gdb/commit/25c80428af3311e761c87d8f706596b9701602ec#diff-078cf751467928c038996b40073a682425712b9b01182424e68cf18fb08a75b5R953-R977

And we can't obviously blame the loaders for honoring this flag.

Most reasonable solution indeed would be to ask binutils to add a link 
flag to say "please do not put the DISCARDABLE flag on the .reloc section"

I'm adding Nick Clifton from binutils in CC so that he can comment on 
this possible outcome or any other possible solution.

In the mean time, while waiting for a solution to emerge (and be merged, 
and released) what do we do?

Do we put some hack in Xen build Makefiles so that xen.efi is 
post-processed to strip this bit?

This could be the temporary solution.

Regards,

Yann

On 7/17/25 08:04, Jan Beulich wrote:
> On 17.07.2025 05:11, Demi Marie Obenour wrote:
>> This was discovered by GitHub user @fallen and leads
>> to an "Unsupported relocation type" crash during boot
>> because shim and some patched versions of GRUB do not load
>> the section.  See
>> https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-3078795967
>> for more details.
>>
>> I'm not sure if this is a bug in Xen or a bug in the linker.
> As said on Matrix, my take is that - if at all - the linker could do something
> about it only with a to-be-added command line option. For all "normal" purposes
> .reloc being discardable is what is wanted. Since such a command line option
> would be extremely niche, I think this will need taking care of on the Xen side
> (which, however, is unlikely to end up very pretty).
>
> Jan
>


Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


