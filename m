Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2620650C98
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 14:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466094.724935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7G5i-00047j-C2; Mon, 19 Dec 2022 13:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466094.724935; Mon, 19 Dec 2022 13:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7G5i-00045h-8X; Mon, 19 Dec 2022 13:22:02 +0000
Received: by outflank-mailman (input) for mailman id 466094;
 Mon, 19 Dec 2022 13:22:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S2HB=4R=tibco.com=etorok@srs-se1.protection.inumbo.net>)
 id 1p7G5g-00045b-F8
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 13:22:00 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d79cfa7-7fa0-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 14:21:58 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id o5so8615574wrm.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Dec 2022 05:21:59 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n18-20020a5d67d2000000b0022cdeba3f83sm9822488wrw.84.2022.12.19.05.21.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Dec 2022 05:21:58 -0800 (PST)
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
X-Inumbo-ID: 1d79cfa7-7fa0-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/wg08fPunablYBmuby3qHl6qZu4dh64aU4NPM6DyqE=;
        b=Q8LPvqbMH6Ck2EdyIPz3WGG6uyC8acTdh/oMFqmhYdfwzAiOEfvrSkUQzRW6zw+18Y
         ZW8AaAEM0HQWZevf2uRpEHmlOf3c5wqd3DWAbqhPrda83ipDJdGyHcKSmFXpE0hvfikI
         O9i65qMRGTIqFLz5gNFdbuIuttBnzc7kZO87M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/wg08fPunablYBmuby3qHl6qZu4dh64aU4NPM6DyqE=;
        b=oJWc1lPVKVJlrK967c4Q8011536sXWpczbk3i1Nbllkt0e3YIThgIsu4L5tcsPBlKT
         UgWBbXt8nFPdHPdZ0Snn6wWYr6gM8sK9BdPeGUKePseJccj5kBWevYBkyCjn+ONi6d3r
         AO/ffIegyn/kVtjQ93FLGB9ZlDJeeojTq3nUb+Mo4fbd7L8TpRkII43HeXI99Fio9X0Q
         yWTJxlVZWeYiEvw0UsOo8bdHL3ukCvjPoupiImqHcX5My+uW7CZeYmD+TG8VjhGxs6Hv
         xdq/z1EjEAX7Gajma0eOIZB95dSMlbVsUSOQ/S0fzFzjpHxGtBNvj29d/NnllZEVf4DR
         bbyA==
X-Gm-Message-State: ANoB5pmk8B03QnezLS7iU60SA1hHF4UK6KkkCYyR1Xm8t8fic+yAWkLg
	DBHHfDtOZ2KR/M1T5FE1VYstKw2CrJljHjnx
X-Google-Smtp-Source: AA0mqf4ePiBycUVCC0mXuPTf1iGgx8HoYdtYUchzQ8AyWM+08j7PspUahi953KLDnkdHlLhxrRMyZg==
X-Received: by 2002:adf:a44f:0:b0:242:63e5:2449 with SMTP id e15-20020adfa44f000000b0024263e52449mr29283347wra.69.1671456118544;
        Mon, 19 Dec 2022 05:21:58 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v4 06/11] tools/ocaml: add .clang-format
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <Y6BTExf6riHD1HLV@perard.uk.xensource.com>
Date: Mon, 19 Dec 2022 13:21:47 +0000
Cc: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E45A2869-A227-4017-91C6-9523FB541474@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
 <a3af11ec979d7559ba8db2d185bd51454858739d.1671214525.git.edwin.torok@cloud.com>
 <Y6BTExf6riHD1HLV@perard.uk.xensource.com>
To: Anthony PERARD <anthony.perard@citrix.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)



> On 19 Dec 2022, at 12:03, Anthony PERARD <anthony.perard@citrix.com> =
wrote:
>=20
> On Fri, Dec 16, 2022 at 06:25:15PM +0000, Edwin T=C3=B6r=C3=B6k wrote:
>> Add a .clang-format configuration that tries to match CODING_STYLE =
where
>> possible.
>=20
> Is there going to be a patch applying this to "tools/ocaml", like you
> did with "make format"?

Long term probably, not yet.

For now I just want to experiment with it to see how well and =
consistently it works (especially with different versions of the tool).
(I've been using ocp-indent and ocamlformat for years now, clang-format =
would be a brand new addition.
 There are some solutions for ocamlformat that might be useful for =
backports, e.g. there is a git merge driver
that reformats all 3 sides of a merge and then attempt to solve =
conflict/do the merge on the resulting formatted files,
so even if old code was formatted differently or with a different =
version it might be able to apply the changes.
I've yet to try it though, and I'm not yet sure how easy it would be to =
integrate something like that with 'guilt' or 'stgit'
which is what Xen uses to manage its patch-queue for backports, at least =
internally.

If there was an ocp-indent equivalent for C that just re-indents that =
might be something we could apply right now,
but I'm not aware of one.
)


>> I was not able to expr
>> ess the special casing of braces after 'do'
>> though, this can only be controlled generally for all control
>> statements.
>> It is imperfect, but should be better than the existing bindings, =
which
>> do not follow Xen coding style.
>=20
> There isn't a single CODING_STYLE for all code in the repo so it isn't
> an issue if the binding where having a different coding style. But
> having as few coding style as possible in the repo is probably =
helpful.

Indeed, having *a* coding style (and automated checking/formatting) is =
what I'm more interested in rather than which particular one.
The current one used by the bindings is not documented, and although I =
can guess at based on surrounding code,
that surrounding code is subtly different based on when it was written, =
so it seemed better to adopt what is already documented
in CODING_STYLE.


>=20
> You could maybe add a CODING_STYLE in "tools/ocaml" to say that the
> coding style is running `make format` or `clang-format ...`. And if
> there other rules like how to name certain variable, that could go in
> this file as well.
>=20


Having a way to easily run these formatters would be a plus.=20
Perhaps extending one of the container images that Xen already has to =
include (a recent enough version of) ocp-indent and clang-format, and =
similarly for the .spec file it might be useful
to update its BuildRequires to bring in the necessary formatters to make =
it easier to use this in backports.

And then all that can be documented in a CODING_STYLE or =
CONTRIBUTING.txt/CONTRIBUTING.md file in tools/ocaml.

Best regards,
--Edwin


