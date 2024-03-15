Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7057187C938
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 08:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693677.1082050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl21w-0005uS-LD; Fri, 15 Mar 2024 07:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693677.1082050; Fri, 15 Mar 2024 07:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl21w-0005sd-Ih; Fri, 15 Mar 2024 07:31:04 +0000
Received: by outflank-mailman (input) for mailman id 693677;
 Fri, 15 Mar 2024 07:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m7tg=KV=gmail.com=phcoder@srs-se1.protection.inumbo.net>)
 id 1rl21u-0005p8-It
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 07:31:02 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f98f534c-e29d-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 08:31:02 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d46dd8b0b8so21229541fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 00:31:02 -0700 (PDT)
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
X-Inumbo-ID: f98f534c-e29d-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710487861; x=1711092661; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wehPS2kEKkREW3AN11EsCYAASYqr8Gk/vdvA5GOTKLk=;
        b=IzpUb5WwyDrGamtsBAzKXuD9mNfXXYbXGa/Hm7sRGZVMOrgp/eI7hrZBxvM0IrzptE
         3i75N7FLZPK+rRREmp3F+Uhc3qhA1Dc2+g/djdvIGJ9ThiWhcAtPGjwbvaEXeU5eXf7Q
         a0b7WqxQhGw56uiYbYnQc+NMXBCIL/IeJXT0sOKDdUWd9bM1fR0qa1oYnrzk/PT5vcKt
         Izf5QJrw464uvnrqBCgkI1ntBTLR+Z8e+eIReSX1mkt6mndZ0RK0fAvzBsAo1IjS8lfh
         71+GBXt0mN89LP+8TNlv9aXBbeDePY/sonS9wSDTrCO4vI3F4rWzAP3rOtEvvzeCqPoL
         lqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710487861; x=1711092661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wehPS2kEKkREW3AN11EsCYAASYqr8Gk/vdvA5GOTKLk=;
        b=WLCcpUVPnKtIoC3GDNGjpjaYglO3C8VA4EKAzTY2VOa6fF1L67o2jdPy5jqc9dWCNN
         SKqi3RlTTxx5iKfUdRvy9gdk0FBAJet98dIJzoYuSH0v9NrJ1yHuGuqJTG2m+XAUCcEw
         hSU8QUsR1YBMiAvffWSlv0pIu/4U017q/E4i3w4MLJD2XT5C2eEkYiy0kdD11mMJFi3o
         eZE7kXZQVLJ4moXcVxd/SjxkihkpudQ9GFr+iuja8ldvgsx6E5HeCCYqClWlwt0H++ki
         8/ynwMmwa02Mx2wwu/zR0QaMSYcObXx23QxPm5x+o/Aub0e/7ElJQdGMrd0r0aqPUDxC
         Sq+w==
X-Forwarded-Encrypted: i=1; AJvYcCXHgsVzYCvxZerWrEUJiBMAnCQyBFkq9FREmNpuQldjfqOKO6VaKJ6gehNx46XkVU6lAC1Z13wKAyQ7sCxfUB77HqmuPEoxNR0Jf3vY5tc=
X-Gm-Message-State: AOJu0YyBCNmI1m5gELdNyxhvYta7scTJMEnQQqoI/lswEs/wohpuLcfB
	LDJCapKnqt5zYHp63GS/XkprJsvh6f/SD1ZRhZiVjCkvgozNxOsPNo349GgL1FltF0JtFJKEcQz
	7p3vdb7mLdYYdA7W9tm4KLhtRhxc=
X-Google-Smtp-Source: AGHT+IFPPGnPPOV1zLV6mH02SJS4GVbYq3kTRHYpWSLkfR1Qw4+lYFWESVLcUr3tiTeZGz1jwfEHjMLVJaNHCk5wTqw=
X-Received: by 2002:a2e:8949:0:b0:2d4:6765:65ec with SMTP id
 b9-20020a2e8949000000b002d4676565ecmr3009805ljk.42.1710487861328; Fri, 15 Mar
 2024 00:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240313150748.791236-1-ross.lagerwall@citrix.com> <20240313150748.791236-4-ross.lagerwall@citrix.com>
In-Reply-To: <20240313150748.791236-4-ross.lagerwall@citrix.com>
From: "Vladimir 'phcoder' Serbinenko" <phcoder@gmail.com>
Date: Fri, 15 Mar 2024 10:30:50 +0300
Message-ID: <CAEaD8JPr_Mxi5pKUV+Ybpx+H8c7G=j+D4g3FQcc8n9yiydk19Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] multiboot2: Add support for the load type header tag
To: The development of GNU GRUB <grub-devel@gnu.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000005e05b50613adfde6"

--0000000000005e05b50613adfde6
Content-Type: text/plain; charset="UTF-8"

Not a full review. Just one blocking problem


>
>      }
> +  case MULTIBOOT_LOAD_TYPE_PE:
> +      grub_fatal ("Unsupported load type: %u\n", mld.load_type);
> +  default:
> +    /* should be impossible */
> +    grub_fatal ("Unknown load type: %u\n", mld.load_type);
>
Don't use grub_fatal for this. grub_fatal is only when continue to execute
grub is unwise. Here you just have an unsupported file. This is definitely
a GRUB_ERR_BAD_OS


>

--0000000000005e05b50613adfde6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Not a full review. Just one blocking problem<br><br><div =
class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br><br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 case MULTIBOOT_LOAD_TYPE_PE:<br>
+=C2=A0 =C2=A0 =C2=A0 grub_fatal (&quot;Unsupported load type: %u\n&quot;, =
mld.load_type);<br>
+=C2=A0 default:<br>
+=C2=A0 =C2=A0 /* should be impossible */<br>
+=C2=A0 =C2=A0 grub_fatal (&quot;Unknown load type: %u\n&quot;, mld.load_ty=
pe);<br></blockquote></div><div dir=3D"auto">Don&#39;t use grub_fatal for t=
his. grub_fatal is only when continue to execute grub is unwise. Here you j=
ust have an unsupported file. This is definitely a GRUB_ERR_BAD_OS</div><di=
v dir=3D"auto"><br></div><div class=3D"gmail_quote" dir=3D"auto"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><br>
</blockquote></div></div>

--0000000000005e05b50613adfde6--

