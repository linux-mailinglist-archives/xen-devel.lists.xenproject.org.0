Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E216988C5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 00:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496275.766932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSRD8-0001Lt-Oj; Wed, 15 Feb 2023 23:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496275.766932; Wed, 15 Feb 2023 23:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSRD8-0001KC-Lv; Wed, 15 Feb 2023 23:29:14 +0000
Received: by outflank-mailman (input) for mailman id 496275;
 Wed, 15 Feb 2023 23:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bdoc=6L=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1pSRD6-0001JI-Mo
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 23:29:12 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c848daf-ad88-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 00:29:10 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id x40so616909lfu.12
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 15:29:10 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 q10-20020ac2528a000000b004dc4c5149dasm22926lfm.301.2023.02.15.15.29.09
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 15:29:09 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id y25so632946lfa.9
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 15:29:09 -0800 (PST)
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
X-Inumbo-ID: 8c848daf-ad88-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tabx9NVVhDi2NL80cED89hxZVqfHcpcD6w5gvEiG26Q=;
        b=Q8cRbK9bsfMvz1Nn6UBM35NtrHJymdIg7nZkemYtGgv/3Q3yDTJhJG+X81qDdYabIf
         xxrtKoM9CiUsnARz3yOk+5K7ZQQZ+AQV90O8Y3pMrOhGvrKc3sTzpKJ1yje35uhNEj4B
         uqqN3W2f/CoTRayN0vR+ZkTzIuArxuwqNE2BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tabx9NVVhDi2NL80cED89hxZVqfHcpcD6w5gvEiG26Q=;
        b=XU50iB+JyBbpES8dXV83F34hEJ/C1NXcqhdyo7b9ZkxD9dOEwTjT4aIqs/4E36T0Rb
         21o3t9wpYy/f/cDVM+A9Bj9mbOs3n/n2O1OyRn8FXIar/gT6N6qjNGKalfLrnft6014j
         8LSFt2SOS3pTriZxMNP4+/3CCBU1jI2/HPUC1vzj2CAkOcU9xTW5aarVCCN0RBSeI8uR
         Npyuqh1knlnvNj3v7T2dovMpnZ7bBFKMGidrCwcvyWEeP+aRV8IVQQZ1vousdJI9H5gc
         4HlyE6ol9hqWPOVET2CIjRpja7amPNCVe8wRPSuUr3PGFrFkect4qFAAhJb2gMNedDbY
         kFsA==
X-Gm-Message-State: AO0yUKUjnP4ffDIBtAa6JACNa3ZmgytaVQJ0WwZYjNxvLyd2EIUEE4fj
	XS3a8S9o1Pa72YzdTQv1vBr9upeFigVgbShcI9axSw==
X-Google-Smtp-Source: AK7set89f8Bp9QGNS/A8iUL3LnOjEb8PZfld30EuRubFOPr3iXhGUxmixx+WUbcwc0p2h7sA98KS3A==
X-Received: by 2002:ac2:42c8:0:b0:4b6:e4c8:8a48 with SMTP id n8-20020ac242c8000000b004b6e4c88a48mr771339lfl.63.1676503749374;
        Wed, 15 Feb 2023 15:29:09 -0800 (PST)
X-Received: by 2002:a50:99cf:0:b0:4ab:4994:e648 with SMTP id
 n15-20020a5099cf000000b004ab4994e648mr2049346edb.5.1676503372641; Wed, 15 Feb
 2023 15:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20230209072220.6836-1-jgross@suse.com> <efeaec9b303e8a3ec7a7af826c61669d18fd22dc.camel@intel.com>
 <e983da4b-71d5-1c9d-5efa-be7935dab8fc@suse.com> <cb98f918fbc8b58e0a8d6823b4f92ad1d4265cfe.camel@intel.com>
 <51a67208-3374-bbd9-69be-650d515c519f@suse.com>
In-Reply-To: <51a67208-3374-bbd9-69be-650d515c519f@suse.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Feb 2023 15:22:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg2zK6GRFLv+LkDevcjcYqhGi-GazcHmr0F1j_9BXQ6Pg@mail.gmail.com>
Message-ID: <CAHk-=wg2zK6GRFLv+LkDevcjcYqhGi-GazcHmr0F1j_9BXQ6Pg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] x86/mtrr: fix handling with PAT but without MTRR
To: Juergen Gross <jgross@suse.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"Ostrovsky, Boris" <boris.ostrovsky@oracle.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "kys@microsoft.com" <kys@microsoft.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"lists@nerdbynature.de" <lists@nerdbynature.de>, "hpa@zytor.com" <hpa@zytor.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>, 
	"Lutomirski, Andy" <luto@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "Cui, Dexuan" <decui@microsoft.com>, 
	"mikelley@microsoft.com" <mikelley@microsoft.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023 at 12:25 AM Juergen Gross <jgross@suse.com> wrote:
>
> The problem arises in case a large mapping is spanning multiple MTRRs,
> even if they define the same caching type (uniform is set to 0 in this
> case).

Oh, I think then you should fix uniform to be 1.

IOW, we should not think "multiple MTRRs" means "non-uniform". Only
"different actual memory types" should mean non-uniformity.

If I remember correctly, there were good reasons to have overlapping
MTRR's. In fact, you can generate a single MTRR that described a
memory ttype that wasn't even contiguous if you had odd memory setups.

Intel definitely defines how overlapping MTRR's work, and "same types
overlaps" is documented as a real thing.

            Linus

