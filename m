Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC3D95CAA3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 12:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782239.1191716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRhm-0001A9-FF; Fri, 23 Aug 2024 10:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782239.1191716; Fri, 23 Aug 2024 10:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRhm-00018K-Ce; Fri, 23 Aug 2024 10:39:42 +0000
Received: by outflank-mailman (input) for mailman id 782239;
 Fri, 23 Aug 2024 10:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=14XH=PW=bounce.vates.tech=bounce-md_30504962.66c866e9.v1-d5591c3b5829461f81b563062813c14b@srs-se1.protection.inumbo.net>)
 id 1shRhk-00018E-Qj
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 10:39:41 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fecb66df-613b-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 12:39:38 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4WqxQd0gLXzQXg29B
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 10:39:37 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d5591c3b5829461f81b563062813c14b; Fri, 23 Aug 2024 10:39:37 +0000
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
X-Inumbo-ID: fecb66df-613b-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724409577; x=1724670077;
	bh=KHLj4zwjzY7dFtptBAA1CaW5882kGzNBdatfO/2AdZU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Bd34UoxFuy8qDOwJFkEkN6a4solZFgMCsy0RpZAasc9irlXwZxILv8MQBzQBww1hF
	 oiIo2XMvm9UpoJI/t/ty4QdSTkugoTEjIe9V5Eou0+qz3LhNFsbpSf7WncJqEWS8AP
	 38iMDIvrMmiQSdqzEGk4VE/Op7luAMlfik+P0rmkzGvA2sgtRBbwCcv3k0tATdCeEl
	 7cikeTLpOxgWdYi0SETODWCzIXFm8Q8Rd+yU7mVjjARPje5mOS/aVuGWqfnVQkiA3o
	 bfyja/mm+6g5jJt1epy0du1LxdbV2mSjznmZRqNAh0fbtGS9hXIMq7MtVc6JFKUn37
	 cgSk+FjUUM5cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724409577; x=1724670077; i=anthony.perard@vates.tech;
	bh=KHLj4zwjzY7dFtptBAA1CaW5882kGzNBdatfO/2AdZU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HfMjx8nMk5M0EsSGPQMVoGsH2xeDyJoecgkEFFHXqa0i+FcMeHO+NuBRz1FUfvLqL
	 6WuGN5bxbc5zQv/4woRti2FbRx8fLlC15dKzaVfurc2/UWwGnfaox0c6e02TkYcsT9
	 Qj3YYEZG5MiXUl8ZT+gkoWCBzf2yRzeGrhFQZKVaDxtVuRZY9E+5WEiGKae/VP7p2s
	 5B8QY1oMS5ol1tLj03zyJ63TwQSakvb8l8IPSvH5zJ0xMZKrQoPILfW8wyI6kPHYmR
	 mqwaUhvwewh+A2muGwyoC0N05ossoMxMxdRUkPPCEKfAJsqJPHplgOtCY0T1L0a67Z
	 zE/am3m1FGAjQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v1]=20libxl:=20Fix=20nul-termination=20of=20the=20return=20value=20of=20libxl=5Fxen=5Fconsole=5Fread=5Fline()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724409575990
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Message-Id: <Zshm5xxhW06u8nF6@l14>
References: <ad7c89bbae34155566ae7c9ca2cb501f21c7d585.1724330921.git.javi.merino@cloud.com> <925ae2fb-6f6f-4825-8469-c410b7bb89fc@citrix.com>
In-Reply-To: <925ae2fb-6f6f-4825-8469-c410b7bb89fc@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d5591c3b5829461f81b563062813c14b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240823:md
Date: Fri, 23 Aug 2024 10:39:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 10:34:05AM +0100, Andrew Cooper wrote:
> On 22/08/2024 2:13 pm, Javi Merino wrote:
> This looks like it will fix the ASAN issue, but I think a better fix
> would be:
> 
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("%s", line);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("%.*s", cr->count, line);

nul-terminated string are safer to manipulate, and cr->count isn't
available outside of libxl, so that's a no go.

> because otherwise there's a world of sharp corners once Xen has wrapped
> the buffer for the first time.

If wrapped buffer are visible to libxl or `xl dmesg`, that a bug in xen,
in XEN_SYSCTL_readconsole. It doesn't looks like it's possible to know
when the console ring buffer wrapped.

> 
> Which brings us a lot of other WTFs in this code...
> 
> First, libxl_console.c describes it's functionality in terms of lines,
> and line_reader() in the API.=C2=A0 Yet it's not lines, it's a 16k buffer
> with generally multi-line content.=C2=A0 It's too late to fix the naming,=
 but
> we could at least rewrite the comments not to be blatant lies.
> 
> 
> Just out of context above the hunk is:
> 
> =C2=A0=C2=A0=C2=A0 unsigned int size =3D 16384;
> 
> which isn't accurate.=C2=A0 The size of Xen's console ring can be changed=
 at
> compile time (like XenServer does), and/or by command line variable.

This buffer size isn't link to Xen's console ring size, both value don't
need to match.

> Because the dmesg ring is never full (it just keeps producing and
> overwriting tail data), it's impossible to get a clean copy except in a
> single hypercall; the incremental/offset parameters are an illusion, and
> do not function correctly if a new printk() has occurred between
> adjacent hypercalls.

Well, let's hope there's no more that "ring_size - size" is been written
to the ring in between two hypercall. There's doesn't seems to be
anything that can be done to work around this with this hypercall
(beside using a huge buffer size).

I think xenconsoled can read the console ring buffer, but does so
continuously, so if `xl dmesg` have some shortcoming, it might be fine.

> And that is why setting count to size - 1 probably isn't wise.=C2=A0 It m=
eans
> that, even in the ideal case where Xen's ringbuffer is 16k, you've still
> got to make 2 hypercalls to get the content.

Well, I've run `xl dmesg` on one machine, it seems to have taken 9
hypercall to get everything, and there's still the first few line of the
boot available. So if the ringbuffer was indeed 16k, it would not be
ideal at all... as lots of stuff would have been overwritten.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


