Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB7ECAD6CF
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 15:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180710.1503844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSc6v-0004XG-LD; Mon, 08 Dec 2025 14:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180710.1503844; Mon, 08 Dec 2025 14:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSc6v-0004VU-Ih; Mon, 08 Dec 2025 14:21:09 +0000
Received: by outflank-mailman (input) for mailman id 1180710;
 Mon, 08 Dec 2025 14:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLQx=6O=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vSc6u-0004VK-GA
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 14:21:08 +0000
Received: from mail-yx1-xb12d.google.com (mail-yx1-xb12d.google.com
 [2607:f8b0:4864:20::b12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 227d0596-d441-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 15:21:07 +0100 (CET)
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-640d4f2f13dso4418502d50.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 06:21:07 -0800 (PST)
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
X-Inumbo-ID: 227d0596-d441-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765203666; x=1765808466; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe7gq2VKIcn5EN08gX/Zk6wHxhqOFMTU4yLkvGJknAE=;
        b=Tn9tR9ccXNKUirkGelndyMysly7RGnA5oTal3sTVSKeh1wO/PyaZIMuZypVz1qOGxu
         QGsYOb3A4t2UwGEvn8VN1cIMxXK1drHdsfxofGuaG57JeEibrGviOB/FiJ6SEa3kq/31
         i/i1n3Aj80D7aXOPRrtERl5HuazCHaMgxpHZDe33iJfVP3EFi9TvcmszWY04rUi/jQJT
         QErWewvw1Cr0KzYX6cPTrh6+72xc27oyB5xaINoao6OLgdl249DQVQPRGHqY9wmao3aE
         Qqj3ebrOU1v2KCFZK261IiAyTepVZ9mhYqnI9STx+w+y2HqBG7L86T6k9LvfpbdkXuU4
         ueFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203666; x=1765808466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe7gq2VKIcn5EN08gX/Zk6wHxhqOFMTU4yLkvGJknAE=;
        b=o3KMF8GFUcLOdSq8vzuQkX4ZYge5NhP5G29VyCut/HYJml8tGuhRHE9NRUNEr9Weye
         tfcZfwzGUqB19bWKYSleowt6qZLkB1uRJb0XorORMa64EyU/wZFpWFXP/1VzI2Xv+mHb
         q74YucCJySqVCqorEV1ap98hxNahWPjOEYKBXHp8K8jhz7oT6MLt3XpBe1dXV3btTjhv
         3Jf1ALYbLiHbo72LNwuIwBp13Xc/Gc+bMSrit86p+3oqNytlCId8vGKdsq6/7D8+xEJB
         zPzA7BgW8L+Z5pr8DABTLRYo7ElYKZFjgnmh4Hb5AE7A2yr1pxnNiEL4rwwfDf21C25Z
         GbMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz30FhwSggeCapiUrg5qYe/s+bz4Y9JpuQzZLw1f55BT/esp/fGt9/Lhiwu532GSj717yyLMfeFdY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxb6N0bI2DT/gLi9ZV04soKtTY2i5AnHYIU1vKvoYDtyZZhbNIf
	pstiB+WUOrHDrx97uEtTX3F9avjp+PgqHMO7ogxWPlM0nNlEj/Nk+PKDnHhUGFfgB4GqGCYscNV
	EllyPldJQU0CbE3cl6Q/Qvs/0wngCFl0=
X-Gm-Gg: ASbGncssdEkBWnvIXgFi388ES6LQmQn3XECfztp/guMvuLS1LVhFdKJq2r2xYEMoBoX
	gq0wsdOhahjr22AyCK1iKcc1jY7gy5aw+WlhIkOgjY50DdA73VqQdvvAXjSiB9qBnRKR05+m5WN
	dLbPHEK1avflTniiD5M0B96xFYFN5kln1Z80Fwsjj3I61D1ZenEZC8yNOCEcLUe2HIYJUhZ/FOA
	Grs4mNGv4XoRh7ZuJTrkysLmnDPSaxgRx/vs/zAkVhj9/w0PrnBFsZmKJlCdFpAphiuHVfms88U
	o41Iuw==
X-Google-Smtp-Source: AGHT+IE3MCZiH+pYIT5GmlJhdgfgiKGEQRDUJ/i2BY8SCpGosFVv7CF215o4ct0UcZWDP+Y8B/Bvonwdy2vNT0AZT64=
X-Received: by 2002:a05:690e:4259:b0:641:f5bc:69a0 with SMTP id
 956f58d0204a3-6444e7dda7dmr5092115d50.78.1765203665972; Mon, 08 Dec 2025
 06:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20251208133945.61375-1-frediano.ziglio@citrix.com>
 <20251208133945.61375-2-frediano.ziglio@citrix.com> <f1964926-9b83-46df-838d-def42b0d7a53@suse.com>
In-Reply-To: <f1964926-9b83-46df-838d-def42b0d7a53@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 8 Dec 2025 14:20:54 +0000
X-Gm-Features: AQt7F2pNx3JyI_po5YTv0bDIHgPKmeQaW6w3ZXtPxiCeE7hG80QhguPBqfWc5MM
Message-ID: <CAHt6W4czO9kYXuzbT-bmyuooeY__RhhU-gb4Rj4Wmgm5uPpjnw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] Do not attempt to workaround older binutils
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Dec 2025 at 13:56, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 08.12.2025 14:39, Frediano Ziglio wrote:
> > From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > Older binutils versions do not handle correctly PE files.
> > It looks like they could work if they don't produce debug information
> > but they mess the PE file in other way like putting invalid
> > flags in sections.
> > For instance they set IMAGE_SCN_LNK_NRELOC_OVFL flag which should be
> > set only if the number of relocations are more than 64K and not on
> > executable (while xen.efi is an executable).
> > Although some UEFI implementation do not check for these minor flags
> > we should not allow building not working artifacts.
>
> The sentence is self-contradictory imo: When "some UEFI implementation
> do not check", what "not working artifacts" are you talking about?
>

I cannot see the contradiction, some work, some not.

> > Also different tools will complain about the format (like
> > objdump and strip).
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> As said in reply to v9 - I don't think we should be taking this step
> unless we can prove the generated binaries to be entirely unusable.

I prefer if the build produces 100% working instead of a russian roulette.

> Which, again as said, contradicts my personal experience.
>

I never said they never work. But implementations keep progressing and
there will be more of them improving their checks. For instance
currently implementations with enhanced memory protection will cause
early crashes.

> Jan

Frediano

