Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061D78B8772
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 11:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715269.1116791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2658-0000KX-Ox; Wed, 01 May 2024 09:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715269.1116791; Wed, 01 May 2024 09:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2658-0000I2-MG; Wed, 01 May 2024 09:16:54 +0000
Received: by outflank-mailman (input) for mailman id 715269;
 Wed, 01 May 2024 09:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ji+M=ME=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s2657-0000Hu-1V
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 09:16:53 +0000
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [2607:f8b0:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b0af7c2-079b-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 11:16:51 +0200 (CEST)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6ee1c0ecfa5so2141218a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 02:16:51 -0700 (PDT)
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
X-Inumbo-ID: 8b0af7c2-079b-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714555010; x=1715159810; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COKrBMlPMlizpEaPks8BJRw7ImDVcG414j/cYDCxwB0=;
        b=Mz9Zp8kmuyUgkD0J2K9PMv+uRcaBQJ/g88dEcIMqyzVVO09Os75On8ZvGpAfBkxNS1
         NCAvA3NM/Q28KotxtKgU7Njyp8IHu3pp+2wGQERZ0x2PNGXxKuHQCDszScSP8EvNmfnU
         tDIPW6rsERB66KHr4elj2mSVflNhDJXEeQevs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714555010; x=1715159810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COKrBMlPMlizpEaPks8BJRw7ImDVcG414j/cYDCxwB0=;
        b=wDh6Jp5RYwKKWPD8N+r1lMFDyW6xdwem/rcf3zkX74dXHXLbvm0G0LouSEsLcDTvKE
         B+VYafI5s1ZTrIg3+z/iluM/hoGZveyTI7uzk3MemCLHw1Gaj8qObnihrvhDdK30i/GI
         LdUigKnuvFZmEpByqMqPiYsu+HIEocN4BZ/bor/vvTztKiiaWtV+BANcAeylL7kfhcmL
         PpTUPuKKbD1wgtGmpPEtOo4s8M+dHHiwKenHd4gcvdTl6YlZuEJp6XWqwUgKt4QWKjfz
         CThtG41aZhiGMEMr8J18hKzN5YGbvC2tZezxT92u4U8pYItL6udCJbm4reIDuVq/rObV
         WWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7+HHe8HnpomT4YtiusLSrKpTvxGYtXb4cmo6fH3YZLP3m9lN5KseH9mkgzq/XqdrKfDgvMsdrghPmkbFNnFByeKLGD6o175FveSmaqW0=
X-Gm-Message-State: AOJu0YzmLFQl2PkRYSdrLQtDZklqdNn/sziQVWdf/YtjiT2CMBMaSZ5J
	EwjTUfea0TKUVOG6ThtgxMRqiIOrLaTOjVeCFyNs8alTHlRhOHcEbPtvfrRXR0g0i25lMyLNd5j
	t9jEijt2vFJfM0yjHsrR+5P0w362BHGp7tdk9XQ==
X-Google-Smtp-Source: AGHT+IHfXehXX/9e++Fr6oyG828pIdr7BriotzIkzUlvQ81XCJKrd1zahJCIq4ZVzOm+PWSMT+W04b1oIkxfBRKcYDw=
X-Received: by 2002:a05:6870:3287:b0:23c:550:ca37 with SMTP id
 q7-20020a056870328700b0023c0550ca37mr2031527oac.42.1714555009911; Wed, 01 May
 2024 02:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
 <20240429151625.977884-2-andrew.cooper3@citrix.com> <766b178a-5e32-437f-ac02-4cb9ad8cb248@suse.com>
 <1749cd23-ba17-450d-b5e0-29fc9ce9489e@citrix.com>
In-Reply-To: <1749cd23-ba17-450d-b5e0-29fc9ce9489e@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 1 May 2024 10:16:38 +0100
Message-ID: <CA+zSX=Z=y2VUXc3kr4VhV_1TyY27inesO3RBoZkKf4PUZLX1CA@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86/cpu-policy: Infrastructure for the AMD SVM and
 SEV leaves
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Andrei Semenov <andrei.semenov@vates.fr>, 
	Vaishali Thakkar <vaishali.thakkar@vates.tech>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 2:25=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 30/04/2024 1:45 pm, Jan Beulich wrote:
> > On 29.04.2024 17:16, Andrew Cooper wrote:
> >> Allocate two new feature leaves, and extend cpu_policy with the non-fe=
ature
> >> fields too.
> >>
> >> The CPUID dependency between the SVM bit on the whole SVM leaf is
> >> intentionally deferred, to avoid transiently breaking nested virt.
> > In reply to this I meant to ask that you at least add those dependencie=
s in
> > commented-out form, such that from looking at gen-cpuid.py it becomes c=
lear
> > they're intentionally omitted. But you don't add feature identifiers ei=
ther,
> > making dependencies impossible to express. Maybe this sentence was real=
ly
> > meant for another of the patches? (Then my request would actually apply
> > there.)
>
> This is necessary because c/s 4f8b0e94d7ca is buggy.  Notice how it puts
> an edit to the policy object in the middle of a block of logic editing
> the featureset, which ends with writing the featureset back over the
> policy object.
>
> And it's not the first outstanding problem from what is a very small
> number of nested-virt patches so far...

I specifically raised this on the x86 maintainers call, and you said
to go ahead with it.

 -George

