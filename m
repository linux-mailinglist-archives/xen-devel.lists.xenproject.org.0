Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C167EA305
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 19:44:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631970.985755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2buv-0001ir-Fg; Mon, 13 Nov 2023 18:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631970.985755; Mon, 13 Nov 2023 18:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2buv-0001fW-CY; Mon, 13 Nov 2023 18:44:13 +0000
Received: by outflank-mailman (input) for mailman id 631970;
 Mon, 13 Nov 2023 18:44:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofAX=G2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r2but-0001fQ-C0
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 18:44:11 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1742ae2-8254-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 19:44:09 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so6375603e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 10:44:09 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a056512108c00b005041ad95b20sm1045857lfg.9.2023.11.13.10.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 10:44:07 -0800 (PST)
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
X-Inumbo-ID: a1742ae2-8254-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699901049; x=1700505849; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kDPmnpjdTP24Yy5dUEZ4SxqnVnY2GT/XlRMac0eVwdo=;
        b=CGz7a7nDXPKOuQvbsP/1vBzqz47x7CcUsEmQnWf4qJimhXJsO9K9Lg9dfyTXlXchzi
         74Jjt4pSbzJbF5ejk0vzUfWkuAResRuH5S1idUehUOkb2/sULi4woGnyjltOFUrSS4DN
         DlYKKC4mPlbCGzBueGU2pjCt5CL23ZU9x2BCsfrnoUrXcdOKE6D3hHFmgxTn55FB2Ekx
         Hvq+C8QwUHNYCtRbxDGoqv8gecDKkPc0nv9iBwWlgSLiEB9rIEeSJQQt97CzTFy+UJs3
         zECgKC9TLfFMHcLMw8n3yBYSNUSw2sHCxafxRog/H44yWwsKk7rjYkhHw2T0UDfM4Uk7
         FVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699901049; x=1700505849;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDPmnpjdTP24Yy5dUEZ4SxqnVnY2GT/XlRMac0eVwdo=;
        b=mUPruOFlvEuh+yq3E6PvFAAh5lJVPy29RcUHmYMdA2M6WCgv8xX+dJtBV3HDLzZMQv
         /4iE3Qd91y46xXZkQXVVzdnaPqVspUE2QybaX3b9U/4z7+zM1VZb39bH2eaI8PCGjDxO
         IM14Nu0JIcUIvS/jGAhszi1WJ35FQiabhQ7LMPmle0mOH/XPezzulKxyKXYGtE/A2Rm+
         WnCcg63Mn8hrW9puYzz7oxPevNWTgwHM+YDDrdGlebT+K4JZVj9Oyl0eLNj8qa0D4/NY
         hN3NxM43Oiy2S+WREA6YaHrAeg51Ch4if73I4Oh1wQ5MaXdr4RpnYr2Wpi00iGrVFodY
         H0+g==
X-Gm-Message-State: AOJu0Yz8KwNZP+0e5Z8qb5bGJp53ZHJpG8jprIYNhGIUdJWz9YpDPVNa
	EGsWBAtQ66Ux4Xm/tWC+bGs7u+q1RVw=
X-Google-Smtp-Source: AGHT+IE9hHSzMcXEe6H6PE/fKQaTfhydpW2C7myxbIsV3lNF8YWcAn7Jqrgt5HNVK27tKMnMVCryTw==
X-Received: by 2002:ac2:562c:0:b0:508:1a25:b092 with SMTP id b12-20020ac2562c000000b005081a25b092mr5001458lff.24.1699901048616;
        Mon, 13 Nov 2023 10:44:08 -0800 (PST)
Message-ID: <8ee78d91c856d4db0ce437902a0f9b4f82f807ee.camel@gmail.com>
Subject: Re: [PATCH v2 06/15] xen/asm-generic: ifdef inclusion of
 <asm/mem_access.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Date: Mon, 13 Nov 2023 20:44:06 +0200
In-Reply-To: <c6b6d20a-cdd9-7502-a221-7b24c6d4c584@suse.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <7ab8ce9ca633a5a7e5212d0acc62d6e1d4688ca0.1699633310.git.oleksii.kurochko@gmail.com>
	 <e66e60744fe517c09ea16efc69cc329443025ef1.camel@gmail.com>
	 <c6b6d20a-cdd9-7502-a221-7b24c6d4c584@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-11-13 at 18:01 +0100, Jan Beulich wrote:
> On 11.11.2023 11:24, Oleksii wrote:
> > This patch should be reworked as it fails Arm builds:
> > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1068867920
>=20
> Took me a while to actually find the error. Would have been nice if
> you
> had explained what's going wrong, supplying the link only as extra
> info.
Sorry about that. I'll be more precise with links next time! But the
issue is exactly what you wrote below ( with p2m_mem_access_check and
some others from <asm/mem_access.h> ) .

>=20
> > It looks like it is not possible just to #ifdef CONFIG_MEM_ACCESS.
> >=20
> > An empty asm-generic mem_access.h will be better solution.
>=20
> I remain unconvinced. The issue looks to be with
> p2m_mem_access_check().
> One solution would be to move that declaration into the common
> header.
> But there's no common code referencing it, so Arm's and x86's version
> might as well diverge at some point. Hence from my pov it again boils
> down to Arm's traps.c including asm/mem_access.h explicitly, to bring
> the declaration in scope. None of the common files really have a need
> to have a dependency on the arch-specific header when MEM_ACCESS=3Dn.
I started to do that in that way you mentioned.

It should be included in 2 files, at least: p2m.c and traps.c.
I am finishind the testing if it is enough.
If it is enough, I will send a separate patch.

~ Oleksii


