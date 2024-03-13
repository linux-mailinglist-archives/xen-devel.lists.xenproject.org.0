Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9B87AB28
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 17:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692623.1079940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRVv-0005e9-Pn; Wed, 13 Mar 2024 16:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692623.1079940; Wed, 13 Mar 2024 16:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRVv-0005bU-MZ; Wed, 13 Mar 2024 16:31:35 +0000
Received: by outflank-mailman (input) for mailman id 692623;
 Wed, 13 Mar 2024 16:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AcA=KT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rkRVu-0005bO-6S
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 16:31:34 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 266263c9-e157-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 17:31:32 +0100 (CET)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5a21859a4b8so1432974eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 09:31:32 -0700 (PDT)
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
X-Inumbo-ID: 266263c9-e157-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710347491; x=1710952291; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umgvJmcBaleLQI+t61eBfjeJyu3f6nhm74M4JR/otFc=;
        b=VJhp1/BGAmH/9nQ0DAP1OajFZ0WM9O12SSnRaZiMZY6fsJHhHmkAkdGjIZz9GcqkIG
         U8cYnKUX9QrupmWx7JKqfLOLWmr0svHuQbrnG5hHqeqXRawXhSQXvIl/0KJOupIETmwx
         SHVnIVd+hWptc5XSHqdqwfRjJmSKAz3uhm8tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710347491; x=1710952291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umgvJmcBaleLQI+t61eBfjeJyu3f6nhm74M4JR/otFc=;
        b=OxVFI1wAXWEZ24CYQK0w0zzBUyVb5RGBIbC6hywqIKXSE65Bi0Xs776ZGSA5b4LiDS
         0CEylNkd8wI8hWVjHBXF8HaoCUoBTiTZwL3Xi8Rn9w7k2GIxeShzO1AwcbTDA+bWWS0V
         5Pgi4A1Nj/zf+dW88ft0oZFA7TYN0E9LVTGZTo6IfcQoOlYGWlxH7ks7lSNA8rYQ7ZS+
         4Jz5MT+gKjNn6DMa/VBygCMRbgGR4Kcge4rOyYGkXPQsebpDCKVx7K0PDcX+uE/+G1Hl
         LcCv0fxWQuWtcgwwxqzwe8L2ogz0uVGPe89i9GX7Tv+apczdb5xZlJWnycKRP7NaLacH
         sHhg==
X-Gm-Message-State: AOJu0YwaDXtv8/oJ1Zr3UPW//Qq+lBEJvcyEhRTCOnemnI5USAORFmG3
	AzUaVBPVLuw8cLcl1XZBuamsbIBxDRLTTEDPZKM7bCDlSMcQeVidMlsIzhMV8TGEVJZRMSngXJL
	BAt+bRIfe30pQh9rTUaPjWdbujEtuSa0XJGKg5w==
X-Google-Smtp-Source: AGHT+IEH2gZXJs2GYm9YIzznaX9/VCtR9VxyDnXjn8f48/KO/KwdpvpJI7e2unbFpW4Eq8/kv/xqtdumDvLgiYEmSfg=
X-Received: by 2002:a05:6870:f14e:b0:221:8fd9:284c with SMTP id
 l14-20020a056870f14e00b002218fd9284cmr3956496oac.1.1710347491259; Wed, 13 Mar
 2024 09:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com> <3daef84c-47dd-4a6b-9984-402e997598dc@suse.com>
In-Reply-To: <3daef84c-47dd-4a6b-9984-402e997598dc@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 13 Mar 2024 16:31:20 +0000
Message-ID: <CA+zSX=aQv3cx6BR9soqaN8LD_esUqkxnVQRA6p5RzzsAiLcHbQ@mail.gmail.com>
Subject: Re: [PATCH v4] x86/PoD: tie together P2M update and increment of
 entry count
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 2:00=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> When not holding the PoD lock across the entire region covering P2M
> update and stats update, the entry count - if to be incorrect at all -
> should indicate too large a value in preference to a too small one, to
> avoid functions bailing early when they find the count is zero. However,
> instead of moving the increment ahead (and adjust back upon failure),
> extend the PoD-locked region.
>
> Fixes: 99af3cd40b6e ("x86/mm: Rework locking in the PoD layer")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Would you mind commenting on why you went with multiple unlocks,
rather than multiple if statements?

e.g.,

```
rc =3D p2m_set_entry(...);

/* Do the pod entry adjustment while holding the lock on success */
if ( rc =3D=3D 0 ) {
 /* adjust pod entries */
}

pod_unlock(p2m);

/* Do the rest of the clean-up and error handling */
if (rc =3D=3D 0 ) {
```

Just right now the multiple unlocks makes me worry that we may forget
one at some point.

 -George

