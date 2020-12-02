Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFFB2CB8EA
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 10:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42576.76599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkOVr-0005Or-Oi; Wed, 02 Dec 2020 09:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42576.76599; Wed, 02 Dec 2020 09:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkOVr-0005OQ-LP; Wed, 02 Dec 2020 09:33:27 +0000
Received: by outflank-mailman (input) for mailman id 42576;
 Wed, 02 Dec 2020 09:33:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ucf=FG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kkOVq-0005OL-GD
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 09:33:26 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6cec683-7717-442e-b1b9-c6fe711af3f0;
 Wed, 02 Dec 2020 09:33:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id a3so5839401wmb.5
 for <xen-devel@lists.xenproject.org>; Wed, 02 Dec 2020 01:33:25 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id d8sm1306279wrp.44.2020.12.02.01.33.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 01:33:24 -0800 (PST)
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
X-Inumbo-ID: c6cec683-7717-442e-b1b9-c6fe711af3f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=wFdH0b5BrOglk4W7o4+NNUGlrS0Sb7D/PHMAdFyrgMo=;
        b=B0+FBYO/somobHBPPeVu5uWzlY4jxnb2cBXb85MBtORedv399tlgbibRbDFBlRjfBZ
         1MrRgOtkNRqNxLIWRUgFcCxQgBu1owiH8lGWpR2jFUIM/4cbQY3SgMKxXCcf6/ngleRd
         o1fmqCESy/tukuFUXd0yDhcS0Yn6RMvh7hYCYT0iDxR0eRfVzSxncSoHwFt/tZkzcKbG
         /buuvXlPO9ur75hZ2MTFesJHGt7ThN/QoYttGeud7JOGnihZGqRjOZGdYAG3PT7y4Y2I
         wmD5idLXFUvx1sFG/9/MsTSI3CQJizrfsHKQuuA+or6bkyv9Yk2yBPKwy6glS3CUlPT3
         GINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=wFdH0b5BrOglk4W7o4+NNUGlrS0Sb7D/PHMAdFyrgMo=;
        b=uDr2NJ0B3OP5uE1nrFjsNVKLsWSk8Gy2Jcq9yCQQNCn5iW3GQsiHSd95M3+ub1OoFN
         LowLn/ESAYq09kB7QM8Ua0FtobdHyyXaxtLFflE81aKb79fDkm27aRcUDZM6Cf2yPwYF
         xoOBh5u5iShOVWrsjLXon9I3Vd8uqJJejkPjYDP95eVWQas44gHYX+uS6xQ5u7qtraLt
         0cW1WuKVBBQx7eKum902t8XefPO6mpVW9I66zG5bSqNXDFyjwHFL7P0UGwdm0XLviZfi
         gadXWHivejnANKU4rGfPXfkMf3Z+1SIeb7ihVnEBrQPopFxifwJ4qRiNksy2N1Y4lY5+
         +c5w==
X-Gm-Message-State: AOAM531+l9w51C87U06bpwE8Cg2PtqN9hA4dPJOv7++8+jhF++FUp92G
	3MWRmw0rYj2r18UNb2TKX9Y=
X-Google-Smtp-Source: ABdhPJyay8tRDTs/3w06RI3yhhgMpPAYb92JAShISclenYW+9XTJA9RE/OiOhfi7hzjuo3Db8lFsFw==
X-Received: by 2002:a05:600c:2949:: with SMTP id n9mr2113328wmd.29.1606901604960;
        Wed, 02 Dec 2020 01:33:24 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20201202092205.906-1-paul@xen.org> <20201202092205.906-2-paul@xen.org> <f95b237e-31d3-08c8-4dab-ee273f10b585@suse.com>
In-Reply-To: <f95b237e-31d3-08c8-4dab-ee273f10b585@suse.com>
Subject: RE: [PATCH v4 01/11] viridian: don't blindly write to 32-bit registers is 'mode' is invalid
Date: Wed, 2 Dec 2020 09:33:23 -0000
Message-ID: <003301d6c88e$2eccc010$8c664030$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFAW81zKVdA94714yPPI08guNmREwItrs0IAWpwLCuq86NOoA==

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 02 December 2020 09:29
> To: Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; Wei Liu <wl@xen.org>; Andrew =
Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH v4 01/11] viridian: don't blindly write to 32-bit =
registers is 'mode' is invalid
>=20
> On 02.12.2020 10:21, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > If hvm_guest_x86_mode() returns something other than 8 or 4 then
> > viridian_hypercall() will return immediately but, on the way out, =
will write
> > back status as if 'mode' was 4. This patch simply makes it leave the =
registers
> > alone.
> >
> > NOTE: The formatting of the 'out' label and the switch statement are =
also
> >       adjusted as per CODING_STYLE.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > ---
> > Cc: Wei Liu <wl@xen.org>
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> >
> > v4:
> >  - Fixed another CODING_STYLE violation.
>=20
> Partly:
>=20
> > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > @@ -692,13 +692,15 @@ int viridian_hypercall(struct cpu_user_regs =
*regs)
> >          break;
> >      }
> >
> > -out:
> > + out:
> >      output.result =3D status;
> > -    switch (mode) {
> > +    switch (mode)
>=20
> There are also two blanks missing here. Will again record this as
> to be taken care of while committing, once an ack arrives. (And
> btw, the earlier of the two "is" in the subject also wants to be
> "if".)

Gah. The lack of a style checker really is annoying. I'll fix locally in =
case there's a v5.

  Paul

>=20
> Jan


