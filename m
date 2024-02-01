Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF9845A9C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 15:50:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674477.1049419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVYNQ-00058O-EV; Thu, 01 Feb 2024 14:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674477.1049419; Thu, 01 Feb 2024 14:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVYNQ-00055m-Bw; Thu, 01 Feb 2024 14:49:16 +0000
Received: by outflank-mailman (input) for mailman id 674477;
 Thu, 01 Feb 2024 14:49:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXLx=JK=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rVYNO-00052A-N6
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 14:49:14 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fdbc749-c111-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 15:49:12 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-554fe147ddeso1329235a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 06:49:12 -0800 (PST)
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
X-Inumbo-ID: 0fdbc749-c111-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706798951; x=1707403751; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFrb14sFYxvQL3XHYJxoeThDXXBr7naHSSTej1GaxwM=;
        b=HkshQvKloTCdtnLdkPscnYQAHZr695KnweqO+dQX6FCvifY46YjvCkMeR4FBAGGIDk
         pzRRbAy8FJxua6TLs63JVXGE6HoywShHJKeSBXXshNUY3XVSAhNFs1PO0RYB7bt7kW3K
         eZXMy3YbtV27wFhYdkJoIMyUT095lxt9JPReoe2SLNgxGmPHw1a9m+pRXS6SgsKiCfmx
         Iz7YsyX06Ny90kHawBFxv0ZYClaq2hXBshEXMJi1J7fX4CCQawany2AUf23bd+j+/tfA
         BUzNMllNC9QkOdtIb1EFB/8F5zyOvDH0LxaKlMBWhG1Bfj8njRfuZLuvmlKtAQg/yncn
         NSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706798951; x=1707403751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFrb14sFYxvQL3XHYJxoeThDXXBr7naHSSTej1GaxwM=;
        b=it69Y+mahH5/EjHLl2j1naCSXPhZhf51WmXt9VuMlLWTmKZXJdGxA/Bs30F0Pei9HJ
         J6EOQdHiwSjHFBWr/uJhb9Tb21TJxAx+ynH7UxHlKer07gM68MdpNGvoXmtnIIsew5KJ
         a9Un9q4BmB5r/JZNZYuquQykJbyssz9lg8ac48IPrH1q7I4ekLSOj5V7cuJK7l7aaB3u
         QIvnNxFvEupCH0nY76WmxhZo80oldjZ/NeYbsxfjglzOUcmWerXgJIWzomwRlu5O9O58
         RZkhCKHuxB2B6CnxiWahlqtafW/zauoHqDREmbA4WkOJ3XhaAIAhTbGLWDwg0uERdlZV
         53NQ==
X-Gm-Message-State: AOJu0YwsVrP8KC/anWDYyFoRHnaMpkDM76xQ7DwGXhrBMzAns9nSdhUY
	XgRO0lMVPqhulY0czaJXIe7PPSGQvBDrOXBjxKjiMHOwYG8kfeuDH7/wV28YgVvaXtaEdLXBhm0
	mCtU+a/q7673GxMzxvfrftN9jexBbB1/Z1B5S2Q==
X-Google-Smtp-Source: AGHT+IGZeF8OndDYcaG2J0sgatGE/PKwuAz0nBmgVPylZnF2Kzym4hDGoLbgQtOieEEWLKmER+mEc/I1uizfcYgv5JA=
X-Received: by 2002:a05:6402:b4d:b0:55e:ef54:1239 with SMTP id
 bx13-20020a0564020b4d00b0055eef541239mr3840572edb.10.1706798951541; Thu, 01
 Feb 2024 06:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-10-carlo.nonato@minervasys.tech> <8a3f3c38-b290-417a-86cb-216e36182abe@suse.com>
In-Reply-To: <8a3f3c38-b290-417a-86cb-216e36182abe@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 1 Feb 2024 15:49:00 +0100
Message-ID: <CAG+AhRU5Yhz_VF02CfaFD5ifvw8cUQbsM7-UiMcRWm+1LR4btg@mail.gmail.com>
Subject: Re: [PATCH v6 09/15] xen/page_alloc: introduce preserved page flags macro
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Feb 1, 2024 at 3:24=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 29.01.2024 18:18, Carlo Nonato wrote:
> > PGC_static and PGC_extra are flags that needs to be preserved when assi=
gning
> > a page. Define a new macro that groups those flags and use it instead o=
f
> > or'ing every time.
>
> While here you say where the "preserving" applies, ...
>
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -157,6 +157,8 @@
> >  #define PGC_static 0
> >  #endif
> >
> > +#define PGC_preserved (PGC_extra | PGC_static)
>
> ... nothing is said here. From the earlier version I also seem to recall
> that the constant was then used outside of assign_pages(). That would
> then mean amending whatever comment would be added here.

Yes, but it was used in places where the name didn't fit (to stop merging i=
n
free_heap_pages()) and so I thought it would've been better to use the
constant only for one of the two concepts: only for preserved flags in
assign_pages().

Are you suggesting adding a comment to this #define to clarify its usage?

Thanks.

> Jan

