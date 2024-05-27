Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D608D06B6
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 17:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730877.1136144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcdz-0003BW-DW; Mon, 27 May 2024 15:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730877.1136144; Mon, 27 May 2024 15:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcdz-00039p-Av; Mon, 27 May 2024 15:52:15 +0000
Received: by outflank-mailman (input) for mailman id 730877;
 Mon, 27 May 2024 15:52:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClYa=M6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sBcdx-00039T-N3
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 15:52:13 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11baa1ab-1c41-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 17:52:07 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a61b70394c0so943928166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 08:52:07 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8a21esm502620066b.150.2024.05.27.08.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 08:52:05 -0700 (PDT)
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
X-Inumbo-ID: 11baa1ab-1c41-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716825126; x=1717429926; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P6oRdxwr3jCk/MnK0Bry251F3aONczSBnKKHYZ+r0ds=;
        b=bMFJAPKtdyElMT/pfbxGLE+kVCPHmRkq5uY/gLUcDFnmq8+fcIyL2DG3aaCq8pmTqO
         bHtcz5/W5c1VJ/+fzSV+rYUR92tkPFQoavdNXy1XPAd33ByXmKRAnWvGVfeEhoM8pUaL
         /7OnKphuUhtxfmDCKLfEwByBE9lDg9tbMWDdOLiLTKiBzTT/fuD2WgkAgUj1jQSD+REl
         INuD8wNefvxzamj5EdSNaWaIf5cZbZcmLFX0m+1egvjQS6wYFFtxAn+BjxBtT4QtrAPo
         GZzdgatPqyefWEYTBWSbk2dNIqk0KwqDKnBhDTGg7RNfp2fFjwyqUtPmpTmWACcsjA4y
         EWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716825126; x=1717429926;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6oRdxwr3jCk/MnK0Bry251F3aONczSBnKKHYZ+r0ds=;
        b=Yecl0pN48a/C+9hHuOHyvs2Oc4GQ0cyYRWE+6PI2amQz1KddbK4yzBi9wN9ra5czV+
         Iw+94mV0dD+v07UkZ46B1qq5dxBvcdp3KhqEERjbxzEGf6z6M+3sQeM5IQklxDlpNEuT
         MEZSsLxv62CT0U8TV90NoMtzEsNXhZWx1WG1adLEOTjUq8NP3bfGTWv0KDQiFQGcdGdk
         3OzPI6FD1IrivIidlQm7Y19xWryuLdyDw/7ZFoIWWYG8gi1WKXK8oA8NU5XO3q7eZgeH
         u8J8mzCc+7nWiWe3xZF3MkmqJhrBOcxdq6RYoGluQUr4sGkyMauE8J/tJ9SPAbe/XtSB
         2dKA==
X-Forwarded-Encrypted: i=1; AJvYcCUbxIiBjWrq0SZwS/5ME9yI1xFDljtOIjlvIoE25P3ogiy5ET10OLdN7BY9h6PA7vf6+ic0tx1OHeJRcLZZtH5eopGxndgUN4vAKcW1lTw=
X-Gm-Message-State: AOJu0Yz3C31OjO9wy7V0d7hWZzFazM6RRc9RyrhdxkxHFkSB4e//ka1k
	63PV44Aq7B4D5TuM7GSHKxIMywBQdj9r+3tqV4S6CKg/coUUUayB
X-Google-Smtp-Source: AGHT+IFlKHuq1rqNjEyRsTXAg9iGa84Z09U95oGtalNOqiYyQI/FRKfGYdIJOY3vi4/0v/jlkQkuyw==
X-Received: by 2002:a17:906:28ce:b0:a52:6fcb:564a with SMTP id a640c23a62f3a-a62641a8d45mr594457466b.9.1716825126061;
        Mon, 27 May 2024 08:52:06 -0700 (PDT)
Message-ID: <48f5e40e1f13ef96e8448b59f76878b522876030.camel@gmail.com>
Subject: Re: Code freeze date for Xen 4.19 is 31.05.2024
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org
Date: Mon, 27 May 2024 17:52:05 +0200
In-Reply-To: <a1e65a79-d8a4-4b8a-ad4d-a18544389e5a@suse.com>
References: <6a4323b46dd3dbb170c48fa24e78a23fa030b2a2.camel@gmail.com>
	 <a1e65a79-d8a4-4b8a-ad4d-a18544389e5a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-05-27 at 17:12 +0200, Jan Beulich wrote:
> On 27.05.2024 15:58, Oleksii K. wrote:
> > I would like to remind you that the code freeze date for Xen 4.19
> > is
> > May 31, 2024.
>=20
> I may be confused: With feature freeze having been last Friday aiui,
> isn't
> this a little too short a period? I was actually expecting a longer-
> than-
> normal one to account for the Xen Summit week.
It makes sense to move the last day to June 14. Consequently, we would
need to adjust the schedule as follows:

Hard Code Freeze: from June 21 to June 28
Final commits: from July 5 to July 12
Release: July 17

And this schedule also looks good to me.

However, another option is to combine the Code Freeze and Hard Code
Freeze periods since both phases are about accepting only bug fixes,
differing only in the severity of the fixes.

Thoughts?

~ Oleksii
>=20
> Jan
>=20
> > I'm okay with bug fixes being committed without my release ack
> > (just CC
> > me), except in cases where a one of maintainers gives a strong
> > NACK.
> >=20
> > Have a nice week!
> >=20
> > Best regards,
> > Oleksii
>=20


