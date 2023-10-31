Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F707DCF38
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 15:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625832.975527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxplJ-0002ou-9O; Tue, 31 Oct 2023 14:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625832.975527; Tue, 31 Oct 2023 14:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxplJ-0002md-6n; Tue, 31 Oct 2023 14:30:33 +0000
Received: by outflank-mailman (input) for mailman id 625832;
 Tue, 31 Oct 2023 14:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rkuq=GN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qxplI-0002mV-3E
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:30:32 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b64aec0-77fa-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 15:30:31 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53e855d7dacso9457141a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 07:30:31 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ox15-20020a170907100f00b0099bcdfff7cbsm1057325ejb.160.2023.10.31.07.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 07:30:29 -0700 (PDT)
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
X-Inumbo-ID: 0b64aec0-77fa-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698762630; x=1699367430; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xb2w2VKDfSLzoGoICYe6jTYnUMfWhHH6DoXAftJBFj0=;
        b=a5Vr8qK0g+4pMEp1FxBo0CiEN4+DeUdrZbk4OjNcHRMDm8ikMt8HsZYTfCOdc/7rvF
         v1qQW/ITfQyvKsovTrI3bm16HAyXHnR2KjEcaVR2QHMCu1puv6KuympsMv52KEJkM+/1
         gPhm08N9RRH2kpA3IijPEM5/CaeufAbd2lv0ZnquRGov5Heba8NodqzmLO1SnGAaaVTN
         X1cgXcfBWhUaQzSJkaXOwgKmSReO+XGphagYfI6XBsZeRz/1ivJy+werX8hbZLhzXEvN
         1FVvWZFsp37lyHCYpR8moNkNUsfBCQR7lwz4CXTYPUpP3eDBcPeFDUA0TBgMhLi9PzMb
         2Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698762630; x=1699367430;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xb2w2VKDfSLzoGoICYe6jTYnUMfWhHH6DoXAftJBFj0=;
        b=NMdS4GGlR7NH3vdcuX+EAV1Nk3qZufU5Jc4tOXTbpRvR8R5pLmPalqJX3af9ili34t
         IWenOucCXH5VeksXDGRIF/8H7buSSpAhftqbox3SMiVuUWHvz02yGHlualae9T/N8IIn
         kKhBqkIUVskO/i6o6jlsofq7wE4qwxwKywPNGQwHvPwOkLmpmxnk0I1YrDukzbJ9Ym1L
         X7uCZU+TzFBYN2d3J5MRWaxa8wjBrYhq2HegncNRCHDCQLRT/57us0VRw1gyrveq2pdM
         tSps3G6BGcgP1O9ZRGjLaorekHl0o9Zra0/vxGmemGJUGoN0zZxy1Kxdr61rMQ5TyCrz
         wWWA==
X-Gm-Message-State: AOJu0Yzd1QxoVvqPmN9sVKHww/U7/tJ9jrNTbX6boBJ9bMY6jNOF4Zl3
	b7PKD8sDOtbz/a8InoZa4/SMW8SVbU0=
X-Google-Smtp-Source: AGHT+IE39583cgIInVxjKcSE+LW7jG5GGUj08vrdJcLZnv8lS7BVCBPrUcoXhY8ZPTFwZOZLznvG6g==
X-Received: by 2002:a17:907:7203:b0:9ae:6a60:81a2 with SMTP id dr3-20020a170907720300b009ae6a6081a2mr9121045ejc.25.1698762629745;
        Tue, 31 Oct 2023 07:30:29 -0700 (PDT)
Message-ID: <e969e456812e9d627787dd204d8ac0ce8d20e666.camel@gmail.com>
Subject: Re: [PATCH v1 22/29] xen/asm-generic: introduce stub header delay.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	 <wl@xen.org>
Date: Tue, 31 Oct 2023 16:30:27 +0200
In-Reply-To: <b16677ea84860ae7143339b8c856f0da7f8c2b6c.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <b16677ea84860ae7143339b8c856f0da7f8c2b6c.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Instead of introducing stub header for delay.h it was decided to remove
<asm/delay.h> in a separate patch:
https://lore.kernel.org/xen-devel/3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.=
1698759633.git.oleksii.kurochko@gmail.com/T/#u

~ Oleksii

