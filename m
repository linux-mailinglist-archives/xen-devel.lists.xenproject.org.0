Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBAC95CA2F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 12:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782230.1191706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRJW-0005HT-JW; Fri, 23 Aug 2024 10:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782230.1191706; Fri, 23 Aug 2024 10:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRJW-0005Ft-Gr; Fri, 23 Aug 2024 10:14:38 +0000
Received: by outflank-mailman (input) for mailman id 782230;
 Fri, 23 Aug 2024 10:14:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2sR=PW=bounce.vates.tech=bounce-md_30504962.66c86108.v1-bc3f4735558f49418844320d71e9bfdd@srs-se1.protection.inumbo.net>)
 id 1shRJU-0005Fn-1d
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 10:14:36 +0000
Received: from mail137-25.atl71.mandrillapp.com
 (mail137-25.atl71.mandrillapp.com [198.2.137.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e41150e-6138-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 12:14:34 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-25.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4Wqwsh55c4z35hTnh
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 10:14:32 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bc3f4735558f49418844320d71e9bfdd; Fri, 23 Aug 2024 10:14:32 +0000
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
X-Inumbo-ID: 7e41150e-6138-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724408072; x=1724668572;
	bh=9CdPXHQwe6XS75VaZtG5OP1VzkMzlV8ORdgt+V3o85Q=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SHEBQN3aCJFMhDd884j/bzNs22BP/5Aq/2UojlCLgImKicTEVhGiKwCGCDii+JP3F
	 NPIdz9SOWvejrHcKxNPxd/xbNLllI4YQAnEI0AGKvBW/Qpm7bcup7Wr5urHIXVea5v
	 8f8TJsbUn5WQ15M/0UZ0w50thLFsWJZziUSN4AZf5ticpTg4q3AtC6ge6c/YIzeFpN
	 I4XAROXABDNk5HzEkKYhISsdmM767s5jU+V5Dq9g+P/DVFmXVGwa2AMp9Zaq4NDClc
	 KZY6xgbrw6Ki4zF+9XOtNnKO6UDwOL59DS6X01cUJiHbq/MQOwC//hOF/2jk/XcoEQ
	 q+hxzWoyXYqMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724408072; x=1724668572; i=anthony.perard@vates.tech;
	bh=9CdPXHQwe6XS75VaZtG5OP1VzkMzlV8ORdgt+V3o85Q=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xzYHO7eyZIrsuVi1MLUBH3m0jbvEt+GlgtMjAtoUWpowLy2Lt8enlFltqWL+WYPrN
	 tpkwChN3JLAUdzFGpm/7HsXowPcXsojLtXw/ObPwgWcTAxL+E/oB9eCDLP0oEIP9OC
	 guY0FzHZJkjrodQHJYf62W41FOKT/G1QaYdJeCBUegPVItOClmVO1E5vnyHVXsllNQ
	 ZosUK091ujTnYm6FGaG8tKjj2O7Z4qiLVpfgHC5ZdaRMw1UeLzI6Y5fEFMvV3eNSpA
	 KKDidr3QJF4ZQYPlrQrIm13fBaxfMlbvYMUe0F6ndfivUa9YKAe/YPjCmpL7+ZwT7l
	 40C16PElvqe8Q==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v1]=20libxl:=20Fix=20nul-termination=20of=20the=20return=20value=20of=20libxl=5Fxen=5Fconsole=5Fread=5Fline()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724408070798
To: Jan Beulich <jbeulich@suse.com>, Javi Merino <javi.merino@cloud.com>
Cc: Juergen Gross <jgross@suse.com>, =?utf-8?Q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, xen-devel@lists.xenproject.org
Message-Id: <ZshhBoWZZVGZLUv+@l14>
References: <ad7c89bbae34155566ae7c9ca2cb501f21c7d585.1724330921.git.javi.merino@cloud.com> <7b575ad5-c7c6-4054-8036-9d2961630d42@suse.com>
In-Reply-To: <7b575ad5-c7c6-4054-8036-9d2961630d42@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bc3f4735558f49418844320d71e9bfdd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240823:md
Date: Fri, 23 Aug 2024 10:14:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 08:31:50AM +0200, Jan Beulich wrote:
> On 22.08.2024 15:13, Javi Merino wrote:
> > When built with ASAN, "xl dmesg" crashes in the "printf("%s", line)"
> > call in main_dmesg().  ASAN reports a heap buffer overflow: an
> > off-by-one access to cr->buffer.
> > 
> > The readconsole sysctl copies up to count characters into the buffer,
> > but it does not add a null character at the end.  Despite the
> > documentation of libxl_xen_console_read_line(), line_r is not
> > nul-terminated if 16384 characters were copied to the buffer.
> > 
> > Fix this by making count one less that the size of the allocated
> > buffer so that the last byte is always null.
> > 
> > Reported-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> 
> Perhaps wants a Fixes: tag as well?

Seems to be:
Fixes: 4024bae739cc ("xl: Add subcommand 'xl dmesg'")

> > --- a/tools/libs/light/libxl_console.c
> > +++ b/tools/libs/light/libxl_console.c
> > @@ -779,7 +779,7 @@ libxl_xen_console_reader *
> >      cr =3D libxl__zalloc(NOGC, sizeof(libxl_xen_console_reader));
> >      cr->buffer =3D libxl__zalloc(NOGC, size);
> >      cr->size =3D size;
> > -    cr->count =3D size;
> > +    cr->count =3D size - 1;
> >      cr->clear =3D clear;
> >      cr->incremental =3D 1;
> 
> While this looks to be addressing the issue at hand, I still wonder: Why
> does the "count" field exist at all? It's certainly odd to be set right
> here (when the buffer actually is empty). It's used solely in
> libxl_xen_console_read_line(), so could be a local variable there.

It isn't only odd to have "count" field, it is also used the wrong way.
Once "cr->count" is set to 0, the next call to
libxl_xen_console_read_line() will simply return an empty NULL, even if
in the mean time more data is available to read from the string.
Also, if the last call to libxl_xen_console_read_line() was shorter than
the buffer size, none of the following call will use the full size of
the buffer. This isn't really a problem for `xl dmesg`, but could be if
we want to implement "--follow" option for example.

So Javi, could you remove that `cr->count` field and use a local
variable instead?

And a comment in the code might be useful about why there's a "-1".

But I think a better way to address the issue would be to actually set
'\0' at the end of the string after the call to xc_readconsolering(),
and remove the not very useful memset(0). That way, it will be more
explicite as to why we need "-1".

> Then, further, I wonder why struct libxl__xen_console_reader lives in
> libxl_internal.h - it's used solely in libxl_console.c.

History? It actually use to live in libxl.h, 14 yr ago.

> Finally - why libxl__zalloc() when libxl_xen_console_read_line() clears
> the buffer anyway?

Overuse of libxl__zalloc when it was use to replace the open coding that
was used to allocate "cr". While it doesn't seems necessary, I don't
think it hurt to keep it there.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


