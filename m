Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AE2A0480D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 18:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866736.1278086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVDEJ-0004nn-LD; Tue, 07 Jan 2025 17:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866736.1278086; Tue, 07 Jan 2025 17:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVDEJ-0004m9-Ie; Tue, 07 Jan 2025 17:18:59 +0000
Received: by outflank-mailman (input) for mailman id 866736;
 Tue, 07 Jan 2025 17:18:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6kTq=T7=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tVDEH-0004m3-FU
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 17:18:57 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78ea7ab1-cd1b-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 18:18:55 +0100 (CET)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5f3610c395dso1338868eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 09:18:55 -0800 (PST)
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
X-Inumbo-ID: 78ea7ab1-cd1b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736270334; x=1736875134; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEE6e2LfZ3Nz/7dPmmiDJyNDKAXnj3mxI03pg3pUtVE=;
        b=a/N617Fs9TajG0PH3ONDRhPBrutyfgy1utLZEbAGiilI576fwr8sSxjZ4J+HmfPku+
         eobCDTMrK4iHJAi3e6K02PGidcqG/cgHsaArlwXTKPYQ8K30wxCAWw/ZAfOVV/kqRA2I
         YLAVIfHvqSNJiMD1kKYs80rvsRijDzmz5BHQi4LnIJE7jL1f0cbp0R13mAHW6x9yxtPz
         b2I2X/1uy63/Z7AWaIIxtEoPwgUaoAO9aYKWvbX1Sh+ZUzKqPVhXGguskCFYSYCvepGf
         HgMUDrypKh/mNL9rjdb0E6rfICVaP9r7gVhicvVj/lCAicOaBwhR2VM2QaRbkjF8/SYO
         KR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736270334; x=1736875134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEE6e2LfZ3Nz/7dPmmiDJyNDKAXnj3mxI03pg3pUtVE=;
        b=c5KkjsXlZXslefKGQgkA5coNpe5ZpZwbfVG1rDjofBoalEUFGxPY6GUUBkmZxXYO8I
         RxD0RO0QTI/bFmubdlp1CK3O9MrB+iPKplv7XZy6jvf1ByyZlLaYBA1R1M4awZzhS74J
         gif++/iNqvjnjY7yQcA83O5O37+DulCaNR5dvO8fLXnyAnxIfMjmiOgKFgmCF3OXXGdI
         6DgKRj7wruQc0wB8tE/3z/LC+olSAtup3XNxKOubPvsdW99xyFdnDPJb+iiOdMGoovr/
         qpvxuHK7RSBpKH7qxmD3gl9N/9VEpfLmd+CIaA/mbtyPyHkBnnHHd4V9wQmN+QW/9Tf4
         i75w==
X-Forwarded-Encrypted: i=1; AJvYcCUIBmyywuhmzT0LsZxGMoxWPSOFlSkqgEyk6bTQ2amqGbMnh4CVcxWUSJO8pVEAO1+q331uE1IvBMo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxq1J/HQqdoDciQurEVNvTmP+b5tVK1pq/wBLoGokD3t+Oyl2nn
	pDJAzHBaccbILCep7s01k+BSMXPFcaDbhBbE15wAJdjfEWReoYZsTyFg4P/vjIZDtB7kZBnmKCq
	qeeHzz0eOjllEAVRIkWGuptiLXqQ=
X-Gm-Gg: ASbGncsDpWX/XZXpEu1BhtPy2CEJrXGFn+PFxAoxderUYvqAN3ux3NqvgVGs9xLIVel
	YRuPQ1raMfelrpm2+52MezP5FQ7x8ElVJwvjzKB4FjKiy+lWSKEL8Ob9O2lD2uM6xyDkLxHMa
X-Google-Smtp-Source: AGHT+IF/Tdx0/H0LQFmeXanbd5LVdu5zeAAPLELoYjwulF6hm+zzom5HsqX61l+UEapAfWN5KPOqQ0J3iy/52puc0cs=
X-Received: by 2002:a05:6871:d043:b0:29e:6ddf:22d2 with SMTP id
 586e51a60fabf-2a7fb2ea6c2mr11869609fac.9.1736270334153; Tue, 07 Jan 2025
 09:18:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1735837806.git.w1benny@gmail.com> <31a1ff2d5d1e17bb73231e008f1e47c501bb3ce8.1735837806.git.w1benny@gmail.com>
 <d6eb70a7-5895-4471-95b3-609f133fa457@suse.com>
In-Reply-To: <d6eb70a7-5895-4471-95b3-609f133fa457@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 7 Jan 2025 18:18:42 +0100
X-Gm-Features: AbW1kvbbT0Ao77_SX8v_xwjhfJidiny3cOOBrs8_y1skS8wVZgZchQ5sT4cS7S0
Message-ID: <CAKBKdXjJm5194Wa=gy=DikiUEsevrB2Xn-idr+vgfgJMBrfZ-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86: Add Support for Paging-Write Feature
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 5:46=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
> Hmm ... Instead of you touching the bit in every one of the case blocks,
> I was expecting you to clear the bit ahead of the switch(), accepting a
> double update in the p2m_access_r_pw case.

I did consider it, but ultimately didn't like the double-update.
Similarly, the switch-case above does also set each bit in the
"case-s" individually. But I understand it's more justified there.
However, if you insist, I'll fix it.

P.

