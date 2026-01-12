Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22400D1278A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 13:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200171.1516163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfGjZ-00041j-B7; Mon, 12 Jan 2026 12:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200171.1516163; Mon, 12 Jan 2026 12:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfGjZ-00040P-8T; Mon, 12 Jan 2026 12:09:21 +0000
Received: by outflank-mailman (input) for mailman id 1200171;
 Mon, 12 Jan 2026 12:09:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9RJI=7R=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1vfGjX-00040J-Tk
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 12:09:20 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85083c71-efaf-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 13:09:18 +0100 (CET)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c03ea3b9603so192193a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 04:09:18 -0800 (PST)
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
X-Inumbo-ID: 85083c71-efaf-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1768219757; cv=none;
        d=google.com; s=arc-20240605;
        b=dNg8M295M+AqSjLfrfk6mVfqIPNcnXGJ4xMEJ98EU5bOVL4koBf5e7h4HEcoV7f7wZ
         xcFZaULluewxDH+7+yTr2nUBplQD671ci5yiBrvRJu4AO08qigQNikcXeeKcpXzXORtq
         8iRBYrW7eTvKgOTVios6+wS+lkArGyP3Z3My/uWfrZUzmvrtG3377mxEj1SISCR6fFU/
         D7FAUJ2rIVR2JPdyyNxkqMiGLK0A08Vst6/MIEUQCTzGLAifXrCnqpfCD01lGnCZSFHd
         4/GmyoMVXmoNE7QLH8a9etX45TrkYrMA3XhqAQUAYu9LXNAsKFAZ4/moA2UBsICatYOA
         UOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hqE0n/BHfuGpBhKc4gDOFo1HDXq1DAZHir7z66JW3p0=;
        fh=64sy4YBgBXGN17F8up8usSaCG+1UZhpwtGHg+RL4oUw=;
        b=VoMBHQy7DOQu6hA8MJZdYuiOlxD/cTwJh0voi+yAy+SUa1HOQWJCRj50jQtGBqtNSf
         k9irlCpYf8QBOcaSp013XWpADLuBhZkF01A/kb6jwsrheHfOgoexuk7h+P9jmnTynqo8
         EaKFRw4F/XxnzHnVwbC465wXQAYQKLN1V+ZedPc17TwzYH4A9566L244i3mqZUe8fDw1
         xa4vHzFBwk8EXbMYOGH4mha0ka7y1rLSbJbeeUMR5N8yM48vEYQm2OfW396j1DHVqKj7
         xQdyrb9VMVs5WEN/YxhJ5wNAh2GJ9BKg2MdUzI5lXNjvPqR5exGs2Svi3BC5zvcXuD7H
         L0KQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768219757; x=1768824557; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqE0n/BHfuGpBhKc4gDOFo1HDXq1DAZHir7z66JW3p0=;
        b=OpnJ/NPFQQjxouuF7Z51IjwBd1FW0NYL+RJ/3MFO5h1SJPKNVWHmFhFOUrFSnbrrQS
         ZUWaIQQRW2eMYB+6vIDieA8ZJ6KVMhWTB8Q1XBfzCnIRXsz8hzAfEfoMoB+sMykOKboc
         h7fKMAo3Mm4UwsMpAxEnjtCAknb9vmOAciFlplNJ1SwCMkdljltkFqi0LZ74v+vaPEYL
         Ti4THAyM7MGU4g+Pb29Djxdai7g777SiPVXq749YTK5dUZVUeor2kqlPRLj/Tg0pfAQW
         wBXlqslNmaGa3/uS+wTXHM+i5k/Vq1R2fhXobt7dR7MEBdrCG4g4BLGCqmjDz++oG3n2
         u37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219757; x=1768824557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hqE0n/BHfuGpBhKc4gDOFo1HDXq1DAZHir7z66JW3p0=;
        b=G6Qj/vuYww4NjYyRVqxbvzXKy3pk6TVHTnk5WHhIwFcDBDF7xxIHtO0/UHRFb5/KXI
         Nds4XV1ydTYsD+LrdYCwTyFtWH3ja23wRvGCjNNW8JWL9/R8gcJB+UHoTf817NKZI/DG
         b4dNJUYidVytWx/9oSx4O9ie8O5oUufxYGGGglCfuWc91whlu65tbvPuVMP538tQhzyC
         9FzcICbf0uWhABwurq1d3TSwHuYOQzq//U8ZBqKOkfXG4iFIvjNCzOHwon6DzrbSCQTN
         z7RLus7KBsQCO0YkTdWLYdQryCik3iemvTwcZr/glMutfh6TE+7M5M1+lMJYvzRJUiBN
         F/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtxUi38KhbYtpf1hqbzjExq7AQ4lVMRzh61zlkpmJ0R9HaDoGlP7fdQYu7SlxFXyLsWRqLfKOLj6k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgQYn+HkUaoYQZy6ZCJjvvcmvrKzldgGYubj1HigslJZVq6LF3
	Jg2sO0UWoIgChkt127jeb1ER3JR6P/njAoV86Kn/uHorIfEeOUGyx1o+4kTMxxBZhNcepoJz2nw
	3BuSmVg50FrHWb9wWAdpEiPC9bjj7794=
X-Gm-Gg: AY/fxX7yN3lqS3r5gfuYaL+CVjQzFZfMT9xMV3cu8sFAEKw1mSU1BqjxeToUv77jT8w
	ayoembKrKnZYGFxML6loJCFjeqYi6msuIfZ2ppT/FkvKzOAqfftsECwtbrrrLOXDTD+HxYDitPU
	ye6+6cgUamAAMg+5O22jp9tROAmQm2MGKjO0CHdi0lHyigbClaK2WY+G97NDSr8NHqh0GY0wwa8
	wcjoVxkSz3bIJ17JOvknAkCm6JeLGdDfCnPXZcVz26zrAiJnB8SH3NP3PGQXZBPnZH43w==
X-Google-Smtp-Source: AGHT+IGsoiuSKDEZkzPc+RQK/fg69BzYwaTbBV5Bxe6h/NwWMA9EvRBgHQOVQxh73MMosCF39OGG7AG3SnAebiiaEVs=
X-Received: by 2002:a17:90b:4a46:b0:340:29cd:dce with SMTP id
 98e67ed59e1d1-34f68d3a4d6mr11635797a91.8.1768219757156; Mon, 12 Jan 2026
 04:09:17 -0800 (PST)
MIME-Version: 1.0
References: <dbab519006501b3971fa913310a06755a14c4548.1767982955.git.w1benny@gmail.com>
 <ec57461b-dde6-413d-a825-3538f46a1209@suse.com> <1916d0a7-ff9a-49f1-8564-2767226fca9c@citrix.com>
 <f0dcc4e7-3053-4386-a162-579ecf68240f@suse.com>
In-Reply-To: <f0dcc4e7-3053-4386-a162-579ecf68240f@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Mon, 12 Jan 2026 20:09:06 +0800
X-Gm-Features: AZwV_Qjp5V6qCcZpodbmtwCpIohPHZlCtKOUexN9NWe90LYUlohn5CyEMWPxdu0
Message-ID: <CAKBKdXg-KRMOf3T+gAiPiRvtjnFJ0sn8aZ-6L+dQvmZsKmRibA@mail.gmail.com>
Subject: Re: [PATCH] x86/altp2m: altp2m_get_effective_entry() should honor ap2m->default_access
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 12:24=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 12.01.2026 12:18, Andrew Cooper wrote:
> > On 12/01/2026 11:09 am, Jan Beulich wrote:
> >> You didn't even Cc Tamas, who I think once again will need to ack this=
.

I _considered_ Ccing Tamas when I saw add_maintainers.pl didn't add
him. I couldn't remember if I added him manually at that time or not.
However, in the end, I just trusted the add_maintainers.pl and didn't
modify it.

> >> However, two formal points: Please use 12-digit hashes, as demanded by
> >> sending-patches.pandoc.

I apologize. This is the first time I'm learning of the existence of
sending-patches.pandoc. Up until now I was following the
"Submitting_Xen_Project_Patches" wiki page where nothing about how
many characters of the hash should be included. I'll keep that in
mind.

> >> That earlier change of yours didn't mean to do more than it did, by it=
s
> >> title and description.

True. Had I known at that time that the fix is needed to be applied in
multiple places, the commit message would look different.

> >> We relatively recently introduced Amends:, which
> >> may be a suitable fit here.

So, what should be my next steps? Should I re-send the patch where I
Cc Tamas, use 12-char hashes and replace Fixes with Amends?

P.

