Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D87D845940
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 14:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674440.1049339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXQs-0001Ig-Bk; Thu, 01 Feb 2024 13:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674440.1049339; Thu, 01 Feb 2024 13:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXQs-0001GK-97; Thu, 01 Feb 2024 13:48:46 +0000
Received: by outflank-mailman (input) for mailman id 674440;
 Thu, 01 Feb 2024 13:48:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+ZK+=JK=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1rVXQr-0001GE-C0
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 13:48:45 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d82452d-c108-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 14:48:44 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-337cc8e72f5so586336f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 05:48:44 -0800 (PST)
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
X-Inumbo-ID: 9d82452d-c108-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706795324; x=1707400124; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uAGJ40Mi5YAKkJYTVBw8bZ5DQVfGYXwY1pM2JcXYAro=;
        b=ahqFhiZepKwvOq6s3o0cYYqp0wP7EtlJ4xfGJNiBSaTrhx1XsrN26inzDOedg2scMC
         pWDCN1S5J5YH9X5YXWDOli+yfoKM5+jKtzIpF4H8SufG2WrUVqXhafp8MV9bS2FzwtVr
         3LEqYGMbjnOkAOj8TV+PgK9q1f0YK/KNEUYucnk4QAqelUpxPLjDHmPrL34FsifTD1S7
         DY9ohoAX1E9MBEXr4e+RM2KQnXAJZ9PTzOmooJHWmWvXGkRy2TMiVff3LZNEQiqBnZGE
         rM9W+qpzZGyZFE7IrWtLJbVsWEkEcUr5iajnV1ebp6OT5qaxCH/WVj1b2Z8oUeGkVxB6
         HM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706795324; x=1707400124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAGJ40Mi5YAKkJYTVBw8bZ5DQVfGYXwY1pM2JcXYAro=;
        b=WEnn/qqrTFOjGbVbnqa56O16Hr3VtocvUpMxhrVFbdIkMe5p8DU+sdH5QWcNzZihzt
         5pQuAi2vlNDcUiTnljsKGMjsQb54/UbdXPN/XPFRe5Faao6oQsntqRj1yAPQZdbMGTcT
         D7UAm2MzVKE0/lPKG1kem0Ghwx3JOdLU2WL7jMhHQaItmhfwrCr4uAVk+B1lO+5vyDyh
         t8PZLlhZJPktVJrDNS7uGtmsxjnKvkEj5otG7wH5YMPstGXLiFvAXn/ryLDm2DnjAmsa
         TXTAMWBkOaFLosTTdC6+eHM6FX33F4cX/JNX/MmhfU5u2PjHNW99GgspXgz7GoY2BoK+
         my4g==
X-Gm-Message-State: AOJu0Yy6NJqUwcJZgd9sIDtomtYgH+V+ZF0hILGZTa9ZjJc+jAiyVjfg
	ftQ88U+WYHvlq5o5O47/uyxX+LPxxMNalu+InJzGI348f6SWqA7IuHdNVjTUM9dYRVAlvT2DKJn
	awNyoen0/ivrWTN6O18JIaCQerD4=
X-Google-Smtp-Source: AGHT+IE7tozFHaLnynQdgdJw3y9iEQ0VpntF/6OAUIFHKYfZhEIPGYvIBgrm0kz22Dc/kTDHdCp7PYd5aB4dp8NUV+U=
X-Received: by 2002:adf:ee10:0:b0:33a:ecd6:1c71 with SMTP id
 y16-20020adfee10000000b0033aecd61c71mr1714660wrn.56.1706795323475; Thu, 01
 Feb 2024 05:48:43 -0800 (PST)
MIME-Version: 1.0
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com> <0c61e460-122c-6486-00b7-22a9a24ee1fc@suse.com>
In-Reply-To: <0c61e460-122c-6486-00b7-22a9a24ee1fc@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 1 Feb 2024 13:48:32 +0000
Message-ID: <CAFLBxZbUeuyLx998fpxeOCGjbgR4C_aLJcN-To9isfOcQ3iYNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] x86/PoD: simplify / improve p2m_pod_cache_add()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000f5cef90610524009"

--000000000000f5cef90610524009
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 4, 2022 at 9:48=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:

> Avoid recurring MFN -> page or page -> MFN translations. Drop the pretty
> pointless local variable "p". Make sure the MFN logged in a debugging
> error message is actually the offending one. Return negative errno
> values rather than -1 (presently no caller really cares, but imo this
> should change). Adjust style.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>

Sorry, not sure how I managed to miss this:

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

--000000000000f5cef90610524009
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 4, 2022 at 9:48=E2=80=AFA=
M Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Avo=
id recurring MFN -&gt; page or page -&gt; MFN translations. Drop the pretty=
<br>
pointless local variable &quot;p&quot;. Make sure the MFN logged in a debug=
ging<br>
error message is actually the offending one. Return negative errno<br>
values rather than -1 (presently no caller really cares, but imo this<br>
should change). Adjust style.<br>
<br>
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br></blockquote><div><br></div><div>S=
orry, not sure how I managed to miss this:</div><div><br></div><div><div>Re=
viewed-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com" tar=
get=3D"_blank">george.dunlap@cloud.com</a>&gt;</div><div class=3D"gmail-yj6=
qo"></div><div class=3D"gmail-adL">=C2=A0</div></div><div class=3D"gmail-ad=
L"><br></div></div></div>

--000000000000f5cef90610524009--

