Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF57D3062
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621349.967729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusVb-0001uY-6K; Mon, 23 Oct 2023 10:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621349.967729; Mon, 23 Oct 2023 10:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusVb-0001sc-3X; Mon, 23 Oct 2023 10:50:07 +0000
Received: by outflank-mailman (input) for mailman id 621349;
 Mon, 23 Oct 2023 10:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qusVY-0001gt-WD
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:50:05 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec22ad2a-7191-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 12:50:04 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5384975e34cso4875932a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 03:50:04 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ck8-20020a0564021c0800b0053f11e3c019sm6032054edb.90.2023.10.23.03.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 03:50:02 -0700 (PDT)
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
X-Inumbo-ID: ec22ad2a-7191-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698058203; x=1698663003; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a0DPtkCA6HGp/d1A+5h4PRuHKBOIZzUueDb8OM8bcEM=;
        b=AzMARuJO6Wdur70Ji0EdzltOFeWFmxjNBuDM857A0vb5V+qRyw51e+JJIwc9/HmbII
         alZbTAoO3CYNwc9h/8nQBvauxH+NK9NIs6cANtqrUhKTsYx54Tso8lS6++yPg74Xthky
         1pB04xAscZ75vaqv6bIoR5HUnFp7rO4SEqEBmMCuo7yS0gjkcePE2mon/FnCESz6jZ9R
         8Ee7FHjJj4nKe3Dx6rT/i8cGPW6akYe2XAWtM120AROsTVQwbuxUT0C0jNZoetYl80uL
         /XA2/lXakhJodFlqP7R7HWDGBa4IUEoSDuhSOHJ6zI5SBm6T/bNOJ33tsQ+GyTgzOi6q
         u81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698058203; x=1698663003;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0DPtkCA6HGp/d1A+5h4PRuHKBOIZzUueDb8OM8bcEM=;
        b=fWfjtd6rVxJxsdxef1ydCD/yHIkhD4rM69/yNTYBbl9n8M3/ymAZ3MbybXEKOxgp5I
         llGEsrUghWymKwtoNXemMSd5Qyt/+xo1rmlXSscIsjqjMRfOQ773ekaKKGOGPRLy+qJE
         WoltxygP6QE69U5XHRp/RraeX+D9yDRFyamxMOtGdHlhmycOVSzzVFHvPdrPNTiKd1Sz
         wnxxKY81DH+Bd3fwUwRvwpLVvomogmo333tSPdvNVjOEIRi6pNJFyG4Gr/shgAecTlWn
         iHqx2Z1Mwz+0twRVD45dvgPEY0CwzZdqWmP5K+ecdCNQBxPv4jxllWGOFMSvyZU2jvtP
         ioyA==
X-Gm-Message-State: AOJu0YwkdY+osHabbyDjkx3AxoSf+QKt/dloiCcyKqUS6hpXnEtOzc9R
	YjVfwjtrScftbkJfw0SzONk=
X-Google-Smtp-Source: AGHT+IFi/azX5iMcbg9mOzRFJJhqrMjygIzE1l8Utbb5+YKGX8Gy6PUWKry3YNHxvy4Ov4xzopwdpg==
X-Received: by 2002:a05:6402:26d1:b0:53d:b59c:8f91 with SMTP id x17-20020a05640226d100b0053db59c8f91mr6514630edd.27.1698058203377;
        Mon, 23 Oct 2023 03:50:03 -0700 (PDT)
Message-ID: <0da7452e0c62dcdc5a0e1185b9f99cdb3d7393c9.camel@gmail.com>
Subject: Re: [PATCH v1 12/29] xen/asm-generic: introduce stub header pci.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 13:50:02 +0300
In-Reply-To: <d4dca6d7-ac54-beac-26fc-5eaf80783a73@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <597a482c70fef196e245a5d898ea6314a0c479ca.1694702259.git.oleksii.kurochko@gmail.com>
	 <d4dca6d7-ac54-beac-26fc-5eaf80783a73@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 11:55 +0200, Jan Beulich wrote:
> While more involved, I still wonder whether xen/pci.h could also
> avoid
> including asm/pci.h when !HAS_PCI. Of course there's more than just
> the
> #include which then would need #ifdef-ing out.
It looks like we can get with #ifdef-ing. I'll push a separate patch
for xen/pci.h.

It will probably need to remove usage of <asm/pci.h> everywhere or
#ifdef-ing it too.
Which option will be better?

~ Oleksii


