Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BA84463F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 18:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674131.1048871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVEU2-00021O-No; Wed, 31 Jan 2024 17:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674131.1048871; Wed, 31 Jan 2024 17:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVEU2-0001yE-Kp; Wed, 31 Jan 2024 17:34:46 +0000
Received: by outflank-mailman (input) for mailman id 674131;
 Wed, 31 Jan 2024 17:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tZP=JJ=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rVEU1-0001ws-Ly
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 17:34:45 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0589fceb-c05f-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 18:34:44 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e80046264so762175e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 09:34:44 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x11-20020adfec0b000000b0033afc875fd5sm4556792wrn.49.2024.01.31.09.34.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jan 2024 09:34:43 -0800 (PST)
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
X-Inumbo-ID: 0589fceb-c05f-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706722484; x=1707327284; darn=lists.xenproject.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFsG06WBJ19relCA7Ipnolb0+7wfirOJFSz8AcOWcL8=;
        b=flfvWzLNgpf8Y27ImtNsuXM3O5Id8g4Gn5erRUS1UIZzUk+QQLxHmYNZ/hy87J1ogk
         9jmjflpLk06jaF4u6jdp3C7CjpWZdA2xO/TW8SoR7mm//TnFYhdefXRpOX8i4LP1bzPb
         jizPQKtzGmErxLvbuOUvAtAHTNhqNDeYHyAWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706722484; x=1707327284;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFsG06WBJ19relCA7Ipnolb0+7wfirOJFSz8AcOWcL8=;
        b=qKjTVAHFYlUAApKpHCmzjftn8lCpEX9b/slW4wB4rYJ5C1CaePPrAKd+7xB7v55HiX
         Spx5z7Hzn2D5bR0xasMtdSQ+CU0mJSN5rQk2Svm2EV5S0CAqFyyu8aPGqA2FDG3PjYXO
         ZR96YWTTYS0MzuvjIz83PxxEVciIWkC9CSqD93kkw2cWj5zsoQxIanUZFjEUJHibQL4q
         8YNLzSxjsLJoS8Fu6QHu5AcsNNsZZd1S3VNJKQF04O/5+2tLnCJvTQc6wTSAG245c/oQ
         mrFiJudeHYIvLEWf2RxoODbyAziUDQA4VuzeWmPVFScXcPhZ/xWbekTRD5aUfIOq2RhC
         AaSg==
X-Gm-Message-State: AOJu0YxiMRLLRi9oK90Ea+Ue2CDOQY8vj4Bfh4b9ZTxKzaqRARd7DAQ/
	jUkKdqxEppIrbVLUJABvzUFoEniGqZzA4yiLOUyi+brQdUPgs9jQ7sWsyXP17y0=
X-Google-Smtp-Source: AGHT+IF56Kwoy0IDgdEkIW5zpeWezgMpiyMWYBRDnz4fEnhJORuAcxPGVm9kYFE/vTYnjJZQm2UQOA==
X-Received: by 2002:a05:6000:5:b0:33a:e6e9:5044 with SMTP id h5-20020a056000000500b0033ae6e95044mr1376403wrx.41.1706722483683;
        Wed, 31 Jan 2024 09:34:43 -0800 (PST)
From: Edwin Torok <edwin.torok@cloud.com>
Message-Id: <9A7DEFE3-5F71-41FF-9F9C-A3863B553FDC@cloud.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6A1CB514-CD49-4EE8-8582-B80352F1AD00"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH v1 2/2] tools/ocaml: bump minimum version to OCaml 4.05
Date: Wed, 31 Jan 2024 17:34:32 +0000
In-Reply-To: <2b912ae7-b102-4d05-9095-9505c869d1d0@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1706697216.git.edwin.torok@cloud.com>
 <11cc8480e6e52d5c2dccc7d8d65e1362c7fba685.1706697216.git.edwin.torok@cloud.com>
 <6cf32d7b-043e-458e-b73b-68899b6303a8@perard>
 <2b912ae7-b102-4d05-9095-9505c869d1d0@citrix.com>
X-Mailer: Apple Mail (2.3774.300.61.1.2)


--Apple-Mail=_6A1CB514-CD49-4EE8-8582-B80352F1AD00
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 31 Jan 2024, at 17:17, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> On 31/01/2024 4:36 pm, Anthony PERARD wrote:
>> On Wed, Jan 31, 2024 at 10:42:49AM +0000, Edwin T=C3=B6r=C3=B6k =
wrote:
>>> We tried bumping to 4.06.1 [1] previously, but OSSTest was holding =
us
>>> back.
>>> So bump to OCaml 4.05 instead, which should match the version on
>>> OSSTest?
>> Yes, it's looks that's the version osstest can currently use.
>> I've started an osstest flight with this patch series and your other
>> ocaml patch series, and so far osstest seems happy with it. The =
flight
>> isn't finished but all build jobs succeed, and a lot of the tests =
jobs
>> as well.
>>=20
>> So:
>> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>=20
> A question, while I think about it.
>=20
> I understand why we want patch 1.  The 4.02 -> 4.03 bump is necessary =
to
> also compile with 5.0
>=20
> But why this 4.03 -> 4.05 bump?  There is no other change in this =
patch.


The oldest supported Debian has 4.05, and I can=E2=80=99t find a non-EOL =
distro with 4.03 or 4.04 here: =
https://repology.org/project/ocaml/versions
I also have another series (that I haven=E2=80=99t sent out yet) which =
would use Dune 1.x in an attempt to use Dune in a way that works on =
OSSTest, and the oldest release I can test this on is Debian 10.

We could keep the minimum at 4.03, but would anything in the CI actually =
be able to test that?=20

Best regards,
=E2=80=94Edwin

>=20
> If it's "just because", then why should we take it?  All it's doing is
> moving a baseline which doesn't need appear to need to move.
>=20
> ~Andrew


--Apple-Mail=_6A1CB514-CD49-4EE8-8582-B80352F1AD00
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On 31 Jan 2024, at 17:17, Andrew Cooper =
&lt;andrew.cooper3@citrix.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div>On 31/01/2024 4:36 pm, =
Anthony PERARD wrote:<br><blockquote type=3D"cite">On Wed, Jan 31, 2024 =
at 10:42:49AM +0000, Edwin T=C3=B6r=C3=B6k wrote:<br><blockquote =
type=3D"cite">We tried bumping to 4.06.1 [1] previously, but OSSTest was =
holding us<br>back.<br>So bump to OCaml 4.05 instead, which should match =
the version on<br>OSSTest?<br></blockquote>Yes, it's looks that's the =
version osstest can currently use.<br>I've started an osstest flight =
with this patch series and your other<br>ocaml patch series, and so far =
osstest seems happy with it. The flight<br>isn't finished but all build =
jobs succeed, and a lot of the tests jobs<br>as =
well.<br><br>So:<br>Acked-by: Anthony PERARD =
&lt;anthony.perard@citrix.com&gt;<br></blockquote><br>A question, while =
I think about it.<br><br>I understand why we want patch 1.&nbsp; The =
4.02 -&gt; 4.03 bump is necessary to<br>also compile with 5.0<br><br>But =
why this 4.03 -&gt; 4.05 bump?&nbsp; There is no other change in this =
patch.<br></div></div></blockquote><div><br></div><div><br></div><div>The =
oldest supported Debian has 4.05, and I can=E2=80=99t find a non-EOL =
distro with 4.03 or 4.04 here:&nbsp;<a =
href=3D"https://repology.org/project/ocaml/versions">https://repology.org/=
project/ocaml/versions</a></div><div>I also have another series (that I =
haven=E2=80=99t sent out yet) which would use Dune 1.x in an attempt to =
use Dune in a way that works on OSSTest, and the oldest release I can =
test this on is Debian 10.</div><div><br></div><div>We could keep the =
minimum at 4.03, but would anything in the CI actually be able to test =
that?&nbsp;</div><div><br></div><div>Best =
regards,</div><div>=E2=80=94Edwin</div><br><blockquote =
type=3D"cite"><div><div><br>If it's "just because", then why should we =
take it?&nbsp; All it's doing is<br>moving a baseline which doesn't need =
appear to need to =
move.<br><br>~Andrew<br></div></div></blockquote></div><br></body></html>=

--Apple-Mail=_6A1CB514-CD49-4EE8-8582-B80352F1AD00--

