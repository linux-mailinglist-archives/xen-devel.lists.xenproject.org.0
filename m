Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0AD905010
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:09:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739107.1146037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKuK-0001Qf-TR; Wed, 12 Jun 2024 10:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739107.1146037; Wed, 12 Jun 2024 10:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKuK-0001P7-QH; Wed, 12 Jun 2024 10:08:44 +0000
Received: by outflank-mailman (input) for mailman id 739107;
 Wed, 12 Jun 2024 10:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FFiX=NO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sHKuI-0000da-Rw
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:08:42 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be361f78-28a3-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 12:08:40 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57c923e03caso2282210a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 03:08:41 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c71b6dcaesm7134035a12.78.2024.06.12.03.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 03:08:40 -0700 (PDT)
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
X-Inumbo-ID: be361f78-28a3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718186921; x=1718791721; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q/J/Jkf5evDDxyzdW18ps6v9OcP9gBIFDKcaK5iQWfY=;
        b=kAadM38BioPVaoH6A6LZ8oeBcKXCIlg1OoX8PzupLl6u/9fJ4YhqQyxW5KN5BPrbmd
         NMkrGIcoTtiUa1pyBF+NzquojMZDbgdW4SUBtLzK1/uVQ6QjWGjQ+KPcEbSqAApvekuq
         SgySkvzZ446X9ohnrwfNyuBXcknp/8VKAtAfi/vI/jVv56TN4yPjxshTrnDUNBG9c1WY
         hGXthbyOw3n6VNh4Iz8duNbc4tnf/cSPm374MlcNBwJVMLZn4qC8g+cvvQk7cG820fFv
         upX12E3mb/XDn7RRrJIKycNMHnh00hgwx2V8ZMoYRLmKU448iiV1MnhNoahgjIhi6AuC
         jxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186921; x=1718791721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/J/Jkf5evDDxyzdW18ps6v9OcP9gBIFDKcaK5iQWfY=;
        b=DJTzVfzwbfggkz7UABo/Wx5YjW+3AuVotoGk/s+saXumF77DYPv6ucf4UaUqkfGvLJ
         6bp32TcHrB9o/GdF1oDcmZMYcGPPn/gjf8kEpcZMjyjBbKeSl8INZfrVQ3+se810daIj
         X2U3uVC9SnQCTAFv9cBWsazBbJcysUbcdA3wLO7i07s8OKj+G2oG8qXzF7C0jaXSO88l
         yeJ+MU1dMjVI1cy0CfqLcoPvAJ+cUvW6sMkxesvzTPCStpOj/NU1M5mit7th0ReWVcTX
         XxWHqTde+piUdE4ajmix2TlLQnSTGgAT39k/zByhnCbQXB+JUae3Q8ZKyQ3JqAvb69fL
         Lkrw==
X-Forwarded-Encrypted: i=1; AJvYcCVzv2XXx4iXgewiqI3A+5vpnRzifQsJeuLrYJUUqm/Lbq374iHPcMUzVd1ELAfHeq6p7tvTDG8tScPStyCG04rVlMCiFkjv+o5aB5NNwrA=
X-Gm-Message-State: AOJu0YxgZAivpH3caSM4zuFU50f0mqxpE/AhX6FSpsk2Fe12M+jlpSPW
	fhO8zxO7jZ9hZZjKFCAk3doYLyJlMb0pdYOdCGs9myShD8k7h7EHfm7FUA==
X-Google-Smtp-Source: AGHT+IFhxUOiL9oh0eEj3VXIP9Y7MuKGG4nO61HNtKXIe2QhHKbtGrQ20+oeUSWGURxWwSYm4A47eg==
X-Received: by 2002:a50:ab58:0:b0:57c:6953:2cac with SMTP id 4fb4d7f45d1cf-57ca976aac8mr817059a12.22.1718186920476;
        Wed, 12 Jun 2024 03:08:40 -0700 (PDT)
Message-ID: <b84269bc7d8cb10bf1c1c118d959634c30902603.camel@gmail.com>
Subject: Re: [PATCH v2 2/7] x86/irq: describe how the interrupt CPU movement
 works
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 12 Jun 2024 12:08:39 +0200
In-Reply-To: <9048733a-e942-4384-b926-e8a304095356@suse.com>
References: <20240610142043.11924-1-roger.pau@citrix.com>
	 <20240610142043.11924-3-roger.pau@citrix.com>
	 <9048733a-e942-4384-b926-e8a304095356@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-06-11 at 09:44 +0200, Jan Beulich wrote:
> On 10.06.2024 16:20, Roger Pau Monne wrote:
> > The logic to move interrupts across CPUs is complex, attempt to
> > provide a
> > comment that describes the expected behavior so users of the
> > interrupt system
> > have more context about the usage of the arch_irq_desc structure
> > fields.
> >=20
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

