Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43862901C0D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 09:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736983.1143082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZeP-0001Iw-Uv; Mon, 10 Jun 2024 07:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736983.1143082; Mon, 10 Jun 2024 07:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZeP-0001Fl-SF; Mon, 10 Jun 2024 07:41:09 +0000
Received: by outflank-mailman (input) for mailman id 736983;
 Mon, 10 Jun 2024 07:41:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruA2=NM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sGZeO-0001Ff-0w
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 07:41:08 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb71d2fe-26fc-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 09:41:06 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so601149266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 00:41:06 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6ef441b3d6sm401785766b.203.2024.06.10.00.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 00:41:04 -0700 (PDT)
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
X-Inumbo-ID: cb71d2fe-26fc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718005265; x=1718610065; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s2Tcwv5lcq49+leEsw/Hn3k2ttqMfhbFYWQfvObavAs=;
        b=k6g5t/yPdGoomXfMzuZZUwdwuJEKF16/UYMJdvtqCihTaDcyUzrgoBQZaJSG5F1N6I
         8ZsLQ/4EFhCkEDIPs4zoxPBSrO/PnK8xmcwYCXaKl1j/feKp789Ynd8vzvZZVUxatyfD
         /yVcoRzcwiJ8dTB94AHeQV46EsjzX2JBT7SL3LFCYP/SW5pGc3JOpxOhUObc5znx4pdj
         efkRWNFLUKzb8s0b/zuCDjGPUYMCb1OCRRzOggm0GO2EBv1BHQazLx4O3U1uAsS4oIOW
         +8zleGzRBIGJDNaiM63jjX7GhbOf5zjaCEF+PO1bZOxmiJCJByr+1+biM7GrBABZMbTw
         dWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718005265; x=1718610065;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2Tcwv5lcq49+leEsw/Hn3k2ttqMfhbFYWQfvObavAs=;
        b=SZNMH1Lu8OMHVxXMGoTyvZUYRRH994K2PdAYFxloCvnYEwDTf6asKdCabUONJzrgYO
         8ckKRdlehh7Je+zz+8FEZp+bv4+o5Z41x7FHtFJgquP/Qx5tDU3dOsEOw0vfilrheYvz
         LGIVg5cBUO483pLCNasCGDeAsflszhk+XVdAgeyRWoAZMLVSxp0RqDpHBoc+oQEj2pjI
         czyvmGZ3deLPtiUkuEh+ye0z9VjPuvcGo5D9J8Y1DYfb/g8L5+l8KfuqFjzepDptxdHs
         qE9iQ+fKttWWAQdvdLvm1TaGsApmtkv+aZOE6a/6E0b+jvLXsFaF8ogcT4xp9KFpVi6l
         SzCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy9xnJWuDWDILviBR/etYEoCe+1qKoOWcPxzj6enHk6toKxY6vo6gewpQSu+VJupkU1YXB9z4OldLB+MEVca0dm9GLSFiYUH1XesDzh8U=
X-Gm-Message-State: AOJu0YwHtc1yGH+KLO9iaTKZGfwVO2wamczkAUTJjjmONXfOXVqgFO5I
	S1QicHTT7Bi6ZsF24ELeQi9BRAyEWZx6VVlly5HPsFtxYxpJEzjP
X-Google-Smtp-Source: AGHT+IF/gQSbX5KBEV6IdH2/3VZckDWvduuSLV+LT2zvfSjeZD6xXTZo9nj/+g00o1BId0fUSPzeJg==
X-Received: by 2002:a17:907:3e8b:b0:a68:c744:725b with SMTP id a640c23a62f3a-a6cd665f1e1mr646201266b.32.1718005265183;
        Mon, 10 Jun 2024 00:41:05 -0700 (PDT)
Message-ID: <769044faa70235c4c293b56024ac434de55f5918.camel@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: alter EFI section
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>, Marek Marczykowski
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 10 Jun 2024 09:41:04 +0200
In-Reply-To: <5b9d57b4-bd28-4523-bb80-f4a5912eb3e8@suse.com>
References: <5b9d57b4-bd28-4523-bb80-f4a5912eb3e8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-06-10 at 08:38 +0200, Jan Beulich wrote:
> To get past the recurring friction on the approach to take wrt
> workarounds needed for various firmware flaws, I'm stepping down as
> the
> maintainer of our code interfacing with EFI firmware. Two new
> maintainers are being introduced in my place.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
> ---
> For the new maintainers, here's a 1st patch to consider right away:
> https://lists.xen.org/archives/html/xen-devel/2024-03/msg00931.html.
>=20
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -308,7 +308,9 @@ F:	automation/eclair_analysis/
> =C2=A0F:	automation/scripts/eclair
> =C2=A0
> =C2=A0EFI
> -M:	Jan Beulich <jbeulich@suse.com>
> +M:	Daniel P. Smith <dpsmith@apertussolutions.com>
> +M:	Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> +R:	Jan Beulich <jbeulich@suse.com>
> =C2=A0S:	Supported
> =C2=A0F:	xen/arch/x86/efi/
> =C2=A0F:	xen/arch/x86/include/asm/efi*.h


