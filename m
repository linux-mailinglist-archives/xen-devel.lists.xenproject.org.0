Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98906753FD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 12:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481706.746790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIq1t-0000ey-7Z; Fri, 20 Jan 2023 11:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481706.746790; Fri, 20 Jan 2023 11:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIq1t-0000ce-4g; Fri, 20 Jan 2023 11:57:57 +0000
Received: by outflank-mailman (input) for mailman id 481706;
 Fri, 20 Jan 2023 11:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIq1r-0000cY-Eu
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 11:57:55 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac0f2b26-98b9-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 12:57:54 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id e3so4615410wru.13
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 03:57:54 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 d14-20020adffbce000000b002bddd75a83fsm18650463wrs.8.2023.01.20.03.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 03:57:52 -0800 (PST)
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
X-Inumbo-ID: ac0f2b26-98b9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GbexX4kQSh9SEmZpnsGkseyMty0RjNFBm4wrT1LyRr0=;
        b=GNbvpCFJ9wnZ+2Wfz/jFRIik/GF9jy8gYmfKfDaL5/pxDLMomMAcUzVno+9tJAi1ZP
         wwAlEb5pPszrSd+gJlgp4H/3QY7dEu9EZDTCZoxjxS1/Eh5LphxnW3yP4vkKwDm9No9T
         /vL019bt70ZEyzPp+snmZg1MZRc9Z7hXSH5G01xYR3cvOWAd12k1pmojIn4WmQZivVQi
         q7y0xnpfGzEW6yYkjjlfuu9NtFGwqmNzgPzXDAdr2pdO5+DgXrcx3iS+XUyREmu61iao
         G3dpARwuDLfiSi4scfyQly5M+beDkNvpPr+qsstNG7yOh+52FP48rMNObwMT5TQKhYpf
         6hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GbexX4kQSh9SEmZpnsGkseyMty0RjNFBm4wrT1LyRr0=;
        b=Yo1e7XS0lwDxE+MP0nZ+sTnE2DvnJjkOzdj6o3HL/c9X+jjQGvn3GPvhcJ5te3Aedn
         vx2rYufgAOLygvNQivi3j9+gY/E720VgAWkedEwbcEmjXJxr7xmGvs5mKbHnXie1i3hg
         lxdadZWQycUs2VJM3u7LAZHymH7BRoJMIFcEUhS0bhC5PIitb3N/mcP8BQBwkof9UeIi
         uKYBuL6i+0hDk7BdyT8olfpdlbLYLnSN7LOVwwMlLO4HDb6AzguWA6mVWCey+1HfNc4n
         2ZDE/aWAzMKk7f0w7OlcLMCgNuoDjoyoRptVF4eg4S7a/U+APVKTf914k8eLG5OVxg8X
         2cFg==
X-Gm-Message-State: AFqh2kqz9+YlKSFPx32LlvKlBuA9oj/KVaePNBk6Ju055qtg57Fbd2TQ
	XvdldFnNCwDrQ/bCPyGNR9A=
X-Google-Smtp-Source: AMrXdXtyrNAPJWxwqaUE4bxs2IUy2rKspaOURlFGEkhAwZU8Q6PZHHGDUJKcBOrhwDMnozTwwHt3UA==
X-Received: by 2002:a5d:514b:0:b0:2a7:68f9:c00b with SMTP id u11-20020a5d514b000000b002a768f9c00bmr8442351wrt.50.1674215873617;
        Fri, 20 Jan 2023 03:57:53 -0800 (PST)
Message-ID: <4dbddea68957f2081bd6fae8b0474164cd20ab6e.camel@gmail.com>
Subject: Re: [PATCH v5 1/5] xen/include: Change <asm/types.h> to
 <xen/types.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 20 Jan 2023 13:57:51 +0200
In-Reply-To: <a2d262f8-77eb-44bb-d3c9-677ed73df22a@suse.com>
References: <cover.1674131459.git.oleksii.kurochko@gmail.com>
	 <916d01663e76a3a0acad93f6c234834deaa2dd72.1674131459.git.oleksii.kurochko@gmail.com>
	 <22992b47-bac6-d522-a8a6-c55c3c15e7a5@suse.com>
	 <a2d262f8-77eb-44bb-d3c9-677ed73df22a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-01-19 at 16:43 +0100, Jan Beulich wrote:
> On 19.01.2023 15:29, Jan Beulich wrote:
> > On 19.01.2023 15:07, Oleksii Kurochko wrote:
> > > In the patch "include/types: move stddef.h-kind types to common
> > > header" [1] size_t was moved from <asm/types.h> to <xen/types.h>
> > > so early_printk should be updated correspondingly.
> >=20
> > Hmm, this reads a little like that patch would introduce a build
> > issue (on Arm), but according to my testing it doesn't. If it did,
> > the change here would need to be part of that (not yet committed)
> > change. On the assumption that it really doesn't, ...
> >=20
> > > [1]
> > > https://lore.kernel.org/xen-devel/5a0a9e2a-c116-21b5-8081-db75fe4178d=
7@suse.com/
> > >=20
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >=20
> > Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> Actually I notice we have more explicit uses of asm/types.h, and
> hence the title of this change isn't really correct (with this
It's really uncorrect. I was in a hurry, my fault.
I meant that change <asm/types.h> to <xen/types.h> only for
<xen/early_printk.h>.

> title I would expect all uses to go away underneath xen/include/xen).
> I'll try to remember to adjust the title when committing.
>=20
Thanks for that.
> Jan
>=20
~ Oleksii


