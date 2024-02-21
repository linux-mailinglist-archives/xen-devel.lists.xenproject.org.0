Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B1E85D100
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 08:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683827.1063454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgnB-0002un-3B; Wed, 21 Feb 2024 07:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683827.1063454; Wed, 21 Feb 2024 07:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgnA-0002sC-WC; Wed, 21 Feb 2024 07:13:21 +0000
Received: by outflank-mailman (input) for mailman id 683827;
 Wed, 21 Feb 2024 07:13:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rcgn9-0002s6-9k
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 07:13:19 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afcfad74-d088-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 08:13:17 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d10ad265d5so68889351fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 23:13:17 -0800 (PST)
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
X-Inumbo-ID: afcfad74-d088-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708499597; x=1709104397; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nr74LCFagsjWslOgZf57SG/Js4h6QFS74f9G6WYs40=;
        b=KuTZT+o/YqISIpt3aZkXiyDcL1b5zz1pQEZNf0dewnlHg6Y45itj8AnOsLGveNNdxK
         WgkKWpUFJr3FjF5XdaGXluI5Qx9Sa28/wTY+vV30kfP14yJTt2qWzPXgQUJqyYN2nnW5
         BBuTdNcweihXa7auqusfnRe2pBlDepartXJAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499597; x=1709104397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nr74LCFagsjWslOgZf57SG/Js4h6QFS74f9G6WYs40=;
        b=tXXV4uxi7DuDqsc19E/AgeHJLU9YFGUYaWek+EbmEO7aYcPzqFuNELIdbpbnTbyc0z
         HdnzT8TtBhbnoZIERnn+YC7WU5j0eYTCPjrd0uoBP7Evk80bMQUvc5JFcSwQ207hYCfy
         3bPqgPkTFYKLn1+PMCsnfjoc+GaWPeHfKAHwKCkwrnf5fV5gtPlHqpjWHZNKmI2/WIc3
         ksN3hrkEWAJ3dsmzqLZWcBT6zNMP6Op7bIDW8SxSi9+y82lKNLoedPrVbc/gD3SL8gmm
         COjQ57hbZdlgX1d2kdOIDeY2W3tVjdJmVEfid9Z5RLjjDj3Q345W/qaBjPeVg+CIz2Tr
         45lg==
X-Forwarded-Encrypted: i=1; AJvYcCUWyR/AaOkKjKrPyG++IQcKEJaCZ3D7CVUvXE6/eh3IlSkKMlTaFy38Ys5dbeL1BcVJeB8DOARyNXQU6mzULy/AD314YGpFb2WN4HdIrUc=
X-Gm-Message-State: AOJu0YxAxFTpeh7kTYzxJoQbgFn/z97POA41qSjICbUvWjLTLFr/pr6p
	j8pwKCHTQ2s3QNCRCFl6sEk7NsXcZJIESw85ppWHMbIJN4kWXrBNK+r3hvOizOjTyBg0dIrFQxX
	08VFMztyiZ1o0pX1nDGQEnypKfznjCgSOmNNFMA==
X-Google-Smtp-Source: AGHT+IH8mrsxu8WW8+MHevP+GQ8WvqFc+p76S/FGwgq4Y9u3yTcAFgsBPbJalxMxlxYPc51l1HxB8VfS7BVWFLmD5GY=
X-Received: by 2002:a2e:3e15:0:b0:2d2:50bc:99d6 with SMTP id
 l21-20020a2e3e15000000b002d250bc99d6mr1678949lja.35.1708499597544; Tue, 20
 Feb 2024 23:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-3-george.dunlap@cloud.com> <14f09e7a-76b4-4650-9f90-90e7709379be@suse.com>
In-Reply-To: <14f09e7a-76b4-4650-9f90-90e7709379be@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 15:13:06 +0800
Message-ID: <CA+zSX=aARhiXDSVFXUvQOuNf-jNNcq3XDakZUcshj6z5UN9HCQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] svm: Improve type of cpu_has_svm_feature
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 11:24=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 06.02.2024 02:20, George Dunlap wrote:
> > --- a/xen/arch/x86/include/asm/hvm/svm/svm.h
> > +++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
> > @@ -38,7 +38,10 @@ extern u32 svm_feature_flags;
> >  #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks *=
/
> >  #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation *=
/
> >
> > -#define cpu_has_svm_feature(f) (svm_feature_flags & (1u << (f)))
> > +static inline bool cpu_has_svm_feature(unsigned int feat)
> > +{
> > +    return svm_feature_flags & (1u << (feat));
> > +}
> >  #define cpu_has_svm_npt       cpu_has_svm_feature(SVM_FEATURE_NPT)
> >  #define cpu_has_svm_lbrv      cpu_has_svm_feature(SVM_FEATURE_LBRV)
> >  #define cpu_has_svm_svml      cpu_has_svm_feature(SVM_FEATURE_SVML)
>
> Having seen patch 4 now, I have to raise the question here as well: Why
> do we need a separate variable (svm_feature_flags) when we could use
> the host policy (provided it isn't abused; see comments on patch 4)?

We certainly don't need an extra variable; in fact, moving all of
these into the host cpuid policy thing would make it easier, for
example, to test some of the guest creation restrictions: One could
use the Xen command-line parameters to disable some of the bits, then
try to create a nested SVM guest and verify that it fails as expected.

I would like to do that eventually, but this patch is already done and
improves the code, so I just kept it.

Let me know if you'd like me to simply drop this patch instead.

 -George

