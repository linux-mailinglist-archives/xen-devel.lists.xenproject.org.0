Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D56BB2BEDE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 12:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086405.1444595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoJXw-0007UX-W8; Tue, 19 Aug 2025 10:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086405.1444595; Tue, 19 Aug 2025 10:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoJXw-0007SL-QJ; Tue, 19 Aug 2025 10:26:28 +0000
Received: by outflank-mailman (input) for mailman id 1086405;
 Tue, 19 Aug 2025 10:26:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mE2V=27=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uoJXw-0007SD-AK
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 10:26:28 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f574a298-7ce6-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 12:26:26 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-61bd4e231b7so71753eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 03:26:25 -0700 (PDT)
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
X-Inumbo-ID: f574a298-7ce6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755599184; x=1756203984; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojUIQfIyEL657Dt601PL1qd/mSs7z+u//+Iy3WEPsuA=;
        b=X55lIJinLGMkPsHg7zvzlb/M0ReRHe+/aq3/CFq14BQ8KZRAeUqxzj/2MEMbQ+OET5
         lY7U4NyYg+4W7Z/nowhRnU4KKi0+lSLO5PiBhQxJkgcp6qkGcBkq+a2zNNt2N8Qzqe4P
         ZzD3FmKnqTTLdpU2VxEJnXBlpplY527Y32fmGXF5dUNNqlGkdHdRRpQCeSG//mceMUwY
         utVV9xlUjpz/2S5uZxos3/Y7a+IRCS6f+wsm7Ke3dp/WNxIanN8gGgmyIimAwgVdTGu/
         bvoF3prR8wsDh2QHOmaJEx9ZjPPcnw2vwxDKuRSzYq+V0IpSmDX79E5/k6sKmH5Ck5hz
         uvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755599184; x=1756203984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojUIQfIyEL657Dt601PL1qd/mSs7z+u//+Iy3WEPsuA=;
        b=pXa2lB0Ar2fr1qL6Q+l/XcB1MC3oJMmH2+5MgbjN5T7TEoozFHIEVOOKxbMDpnjl4Q
         Qy9zQPhrjQby5Pd/dBw48Gr0qorzet9kOAKY889Xj+jfbHTZhIdf9zpyWGJEzqH3qJey
         oRvpqZGjhDEHLxZmEMkeB349eBfpirHJe16AJbdNPj0i/O8E0LRYoPXb9+GWP1R20nrD
         KXu7qo245Kyq5o5SK2OOv0VXu7Uu7yVh4RRfF3Sw2rGx33Lba5YT+5pCNurNSj7yYUMa
         ke/qvRC7WnHzsr9UBspyeTZaOYnNkSPP8cgGxedaaSGxenqf2pb64HaNdj9/bZy62NLg
         D/7w==
X-Forwarded-Encrypted: i=1; AJvYcCWkOtEbOsOq/5eINBjSxxGHmUnffuZ+yRGPUcMP4Nt0tAJn6TYYQ93hf7Td1hN5x638+kC3K8Q6S9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymCHFleLDDQxzn3S9zQhuZDWiCN7wF0DJzlaoP/J3qpSpc/j9P
	w+ER1n4F4Gnj+jcgo+gThRr/VkuD7CVDxwsvbt8vvUHIeOS+6AxtZKyWNvtKZSicfor7M4rU4x0
	T1Oh+h3CZBhDGEbDKO1A34S13CuAlDNM=
X-Gm-Gg: ASbGnct263mHHvBvg4BQqWk0MsR/I74q+qhBBIKVhm41sR/M+K7eOprPNCIaLMu7YLu
	tLWrJTyogaLtXcpLon7eYuol80KgxN3JHd8Tn/zplYxr9tt3TSxiuN69G2u0lbHWORITnHj5Ur0
	cbLESF/PhNUp7oHignCmFqWZyLcfOeYblu7wKA+bFYULCHS54B0qlMr/D9gAeYRNi4Gz9a76bZI
	F/mLg==
X-Google-Smtp-Source: AGHT+IGf8P1mui8mcmERnj0bQQerMW6ZKd7HQ19cPGUw2o1RKfcYfIZ75TxyuajR0UMw+UCfWjTTwhl8iikGTW3raRs=
X-Received: by 2002:a05:6820:1aa6:b0:61b:ae0c:d334 with SMTP id
 006d021491bc7-61d919f9e84mr305227eaf.2.1755599184436; Tue, 19 Aug 2025
 03:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753869323.git.w1benny@gmail.com> <cdd28b4f-34fa-42d4-a4b2-602fab2416b9@suse.com>
In-Reply-To: <cdd28b4f-34fa-42d4-a4b2-602fab2416b9@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 19 Aug 2025 12:26:13 +0200
X-Gm-Features: Ac12FXyVV_iFk-vvpdQ7L7X8BbdSfHKW_tJT7b12WQDO8nbIHrVPawhLw9ngBrc
Message-ID: <CAKBKdXg8GyX7JR599ie1DT3tuiBYcuh_H6gn5agYKcB0zDoFtQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 8:45=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
> Just to mention, also affecting your MAX_ALTP2M series: It is on you to c=
hase
> missing acks. It would of course be nice for this work of yours to not go=
 in
> only at the last minute, or even miss 4.21.

Thank you, I've been watching the timeline and wondering, what could I
do to pursue this. Which... I still don't know how to do it.

How exactly can I chase the missing acks? The Submitting Xen Project
Patches wiki page mentions that I should re-send the patch with
[RESEND] in the subject. Should I do just that?

P.

