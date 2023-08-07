Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A23B772E48
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578832.906589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5P7-0003K3-OX; Mon, 07 Aug 2023 18:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578832.906589; Mon, 07 Aug 2023 18:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5P7-0003Gl-LX; Mon, 07 Aug 2023 18:56:33 +0000
Received: by outflank-mailman (input) for mailman id 578832;
 Mon, 07 Aug 2023 18:56:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5P5-0003Gf-PW
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:56:31 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e392714-3554-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 20:56:29 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52327d63d7cso3398324a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:56:29 -0700 (PDT)
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
X-Inumbo-ID: 1e392714-3554-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434589; x=1692039389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBAYSkzLCeQU+N3yQ6UmmijTTdXBvq5RAPGQuvYAJVQ=;
        b=ekTJwcTqRdcvkgcDdCu6IOnar5ZQ6RuiIJYdMlC0ZzX2IyHpScUXS1KJzvrQ2cGVhl
         gRgO035HLBqJuKzRDeeoxxf6MLFynNmO6uE3cmB7bYTNvwMZEp8vBAIOWjJ2F9pB44+a
         hfAA/5tRM6Z1h2WqbxjlIOYhs27Jyc6fqn3xdkCbYvkDMmvhFV2vMRDtrzKmu8wvF/K4
         mcv9Htx7fqVL8O4dqu39/5eEoTJXIqPAgZyWW18PsSl+Bh7/bWS5bp5decakJD5cOQ9d
         JNAPO+eUhwFv6w3+E+PieXoMfxI30pJU3F7XbVXXQ5SPbOX2TVfLzDjdnRpH/eGweBGO
         HFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434589; x=1692039389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBAYSkzLCeQU+N3yQ6UmmijTTdXBvq5RAPGQuvYAJVQ=;
        b=Cg2n5rMk8FWb1372usG54fArWqYoNeweOx/DALopoMR/Y51N4fLjxIVqXNI8ZavM70
         1WQzRJ2FqvCblMAw8cUDudhyk8ghz0of5WdA8dcN27YtMvstLSXXKywhh8m6yfu8klEG
         0+4AabKNRQ3mWNbCOOrKnTOe4H2lVF0asPjzmQnTU6UiN3CTfNHaVBor3lIZPeLs4kf+
         bL66V575YqsbJCbPuEg4cul3tq83BbLyeKsQAnaO15MfUjStpUY2JdvXCPpBgJjNwC8X
         KKcVNinXMIaqD5HB+IS7zlTlUH4X/NCaQ46zmqaxsypkI4Uq+ta2XUlP+8gUgQt3KToK
         VcjA==
X-Gm-Message-State: AOJu0Ywsd/AS2frjiWvOCIZYhQ1YjJfzQW5p8y1H2XaClT82wMktioKE
	cqGtGpPrVmq0HKf3cinDXj19ViB7q+osLXrdsXI=
X-Google-Smtp-Source: AGHT+IEDs0k32ZuSaGUJmr5IfF93yZ+0mHlW3Z95dk+4uC50gtq/HfOSUnJPgJNoYz9GjvhFF8AtKWRNqiT6cAkpQLU=
X-Received: by 2002:aa7:d488:0:b0:522:1d47:2d81 with SMTP id
 b8-20020aa7d488000000b005221d472d81mr7813004edr.17.1691434588866; Mon, 07 Aug
 2023 11:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230803203650.1474936-1-andrew.cooper3@citrix.com>
 <f066a57c-3dcf-12f3-26b2-5f61f8fcaffe@suse.com> <722dfba8-a768-55c1-29bb-2d8525282b4b@citrix.com>
 <464d71e4-9047-0461-afdc-8df8b8f569fb@suse.com>
In-Reply-To: <464d71e4-9047-0461-afdc-8df8b8f569fb@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 7 Aug 2023 14:56:17 -0400
Message-ID: <CAKf6xpuU4EONPZnDR-H40DxxvWq3AWPX2_N32Zm65qbuTPuVsA@mail.gmail.com>
Subject: Re: [PATCH] subdom: Fix -Werror=address failure in tmp_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, 
	Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 7:36=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 04.08.2023 11:29, Andrew Cooper wrote:
> > On 04/08/2023 8:23 am, Jan Beulich wrote:
> >> On 03.08.2023 22:36, Andrew Cooper wrote:
> >>> The opensuse-tumbleweed build jobs currently fail with:
> >>>
> >>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c: I=
n function 'rsa_private':
> >>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56=
:7: error: the comparison will always evaluate as 'true' for the address of=
 'p' will never be NULL [-Werror=3Daddress]
> >>>      56 |   if (!key->p || !key->q || !key->u) {
> >>>         |       ^
> >>>   In file included from /builds/xen-project/xen/stubdom/tpm_emulator-=
x86_64/crypto/rsa.c:17:
> >>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.h:28=
:12: note: 'p' declared here
> >>>      28 |   tpm_bn_t p;
> >>>         |            ^
> >>>
> >>> This is because all tpm_bn_t's are 1-element arrays (of either a GMP =
or
> >>> OpenSSL BIGNUM flavour).  The author was probably meaning to do value=
 checks,
> >>> but that's not what the code does.
> >> Looking at the code, I'm not sure about this. There could as well have=
 been
> >> the intention to allow pointers there, then permitting them to be left=
 at
> >> NULL. Who knows where that code came from originally.

The logic looks to be that if p, q, or u are not present, then perform
a regular modular exponentiation.  If they are available, then perform
an optimized Chinese Remainder Theorem exponentiation.

In that light, it's written as if pointers were expected.  However,
the code history doesn't show pointers for p/q/u.  An RSA key can't
have 0 for p/q/u, so value checks don't make sense.  Hmmm, I suppose a
0 value could make sense to indicate uninitialization.

tpm_rsa_import_key() and tpm_rsa_generate_key() set p, q, & u.
tpm_rsa_copy_key() copies those over.  So it should be okay to use
this patch to just always use the CRT path.  It would be safer to
check for 0 though, I suppose.

> > Do you agree that the patch is no function change, or are you saying
> > that you think I got some of my analysis wrong?
>
> Oh, I'm sorry for the potentially ambiguous reply: I agree there's no fun=
ctional
> change. I'm merely not sure about your guessing of value checks being mea=
nt.

Agreed - no functional change.

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Disabling vtpm is also reasonable given the reasons Andrew outlined.

Regards,
Jason

