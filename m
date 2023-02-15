Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6076982C8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 19:00:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496182.766789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSM4H-0002xX-1d; Wed, 15 Feb 2023 17:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496182.766789; Wed, 15 Feb 2023 17:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSM4G-0002ut-VJ; Wed, 15 Feb 2023 17:59:44 +0000
Received: by outflank-mailman (input) for mailman id 496182;
 Wed, 15 Feb 2023 17:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l6+G=6L=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pSM4F-0002un-Mm
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 17:59:43 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86188aa2-ad5a-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 18:59:42 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 g6-20020a05600c310600b003e1f6dff952so2226305wmo.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 09:59:42 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003e1fb31fc2bsm3092426wmq.37.2023.02.15.09.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 09:59:41 -0800 (PST)
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
X-Inumbo-ID: 86188aa2-ad5a-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kmhmw5XlwFTAKn7AkFVbDPLUolEeedjqlaORqi0uobg=;
        b=JErikuozksjKxYv9SmnZVbaJEJfO6UdsKS9PvA2Qu/sHHBiyaJByMnx3sAS5vNgWOL
         jisQdUwpD424QfbXmHzIHmqJNW5WX1YW1IJwk15iPj8yf7SnIYa2PJu2b5qeEqd7Ia4C
         qo2cGkkv0DDHUYEfvrshYjbY/QUA6SDRHhvg2GHOZwyh52g0hKSHs69wIwb4OZa6gglv
         ieOIOL48he7tE4iCledbQgOHMZ5K9/8wHH0aGPKJgwJqpuIfEF57uyRjX188rCB/4DCo
         CwWdQKXJ9qVxOcnS1f0y7qvAnPRehoEM0MPJGDjq9sOkSVrSARQdPgqxHgsX20PwcJfo
         4fyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kmhmw5XlwFTAKn7AkFVbDPLUolEeedjqlaORqi0uobg=;
        b=3j9JR0I01DN3uGSpcXundGlhl8Obv3mvUJDkTJyhJ8WE44wFgqNIwGuzriBkNtQTf2
         96d2zZMSEDtaLYBY34gaTf/YHtgM3TazpTqz2WejHY0II3rAVUG9W5cnhhWf7MFO7kf7
         +/W2DtsdtiyY76ac22yPOlvUv0oGlaBNT8ffR2dqs0a4tbRXCv3JHPnp1LDwV4xdLf0w
         wmo71/sXSfwIwT0MzdyXXm3Ytj/HB7jn6Bk4zkNxlO2VvyV2bruO/wbWpATWiXr1eSid
         t92+SveivqWV9zBTegHRglIYl0xDPROldDUfK8XF9u3+G6VP1okcNt8mUwfcVT08tfZx
         XPUA==
X-Gm-Message-State: AO0yUKUke+yIumoTRs8bR4HMSuMJwn+r0ou36kcQNB9oE64jsOhkX69J
	M1SpNUkAeqMg2dzh82hm+Uk=
X-Google-Smtp-Source: AK7set/eWDqxEb62UHhSlvzJhCCkGiiJjFR+lBHb7nOKFGr30DovgFcPgtaRZgQyIXYoWMVJ9kSMTw==
X-Received: by 2002:a05:600c:708:b0:3df:eecc:de2b with SMTP id i8-20020a05600c070800b003dfeeccde2bmr3311889wmn.11.1676483982217;
        Wed, 15 Feb 2023 09:59:42 -0800 (PST)
Message-ID: <00abbda808239ab74cb6c954b33e34380ac4e41e.camel@gmail.com>
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 15 Feb 2023 19:59:40 +0200
In-Reply-To: <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
	 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
	 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
	 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
	 <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hello Jan and community,

I experimented and switched RISC-V to x86 implementation. All that I
changed in x86 implementation for RISC-V was _ASM_BUGFRAME_TEXT. Other
things are the same as for x86.

For RISC-V it is fine to skip '%c' modifier so _ASM_BUGFRAME_TEXT will
look like:

#define _ASM_BUGFRAME_TEXT(second_frame) \
    ".Lbug%=3D: ebreak\n"  =20
    ".pushsection .bug_frames.%[bf_type], \"a\", @progbits\n"
    ".p2align 2\n"
    ".Lfrm%=3D:\n"
    ".long (.Lbug%=3D - .Lfrm%=3D) + %[bf_line_hi]\n"
    ".long (%[bf_ptr] - .Lfrm%=3D) + %[bf_line_lo]\n"
    ".if " #second_frame "\n"
    ".long 0, %[bf_msg] - .Lfrm%=3D\n"
    ".endif\n"
    ".popsection\n"

The only thing I am worried about is:

#define _ASM_BUGFRAME_INFO(type, line, ptr, msg) \
  [bf_type] "i" (type), ...
because as I understand it can be an issue with 'i' modifier in case of
PIE. I am not sure that Xen enables PIE somewhere but still...
If it is not an issue then we can use x86 implementation as a generic
one.

Could you please share your thoughts about that?

~ Oleksii

