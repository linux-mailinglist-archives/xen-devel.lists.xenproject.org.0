Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A71C8C1137
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 16:32:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719277.1121930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s54nq-000569-ME; Thu, 09 May 2024 14:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719277.1121930; Thu, 09 May 2024 14:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s54nq-00054B-Ig; Thu, 09 May 2024 14:31:22 +0000
Received: by outflank-mailman (input) for mailman id 719277;
 Thu, 09 May 2024 14:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XcCC=MM=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1s54np-000545-2n
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 14:31:21 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd68208b-0e10-11ef-909c-e314d9c70b13;
 Thu, 09 May 2024 16:31:20 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2e1fa1f1d9bso18281331fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 07:31:20 -0700 (PDT)
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
X-Inumbo-ID: cd68208b-0e10-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715265079; x=1715869879; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfecLCj4ppaiJFUOJSfuq5jz2MPsvW1TMhLtuPxJ2Ew=;
        b=fuAnQ2fhkZBxr20XPig6OJMzwus8r137XHUKZgTUgrONMg03reI1lgUopHE9KmzMxX
         hfikVBTBR1C9b3GBk0fS1suxNzB7y0VXjkM5Np7gXjMorGwmP8UZ2wfWMjcj59+6GxKg
         sDZqqV+7nNyCp4ViRm+KyTlAL6jf97nlOPjXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715265079; x=1715869879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfecLCj4ppaiJFUOJSfuq5jz2MPsvW1TMhLtuPxJ2Ew=;
        b=Y7vWanZm01tH5n7uct5Sckldb768BEi3A51cfcnxYgM/XjxcHJgIPo6NW5WrkvfJ01
         SsDNjREtWlxM7CMlk3Fj0ua2Z19PzCudD+tuQQVoo+YsPBhk4buv15YnKKSU3Ni/JaXi
         GFqhSCyUEyR97bA7H9p8HcV+1foptEShz8gyGB9GhRXW4YyZL3yt38qPS2YpG1jfoa5n
         PMMw8W6vCwAAr4yLsMRoCazZ7iLEbwEZCWtVhDw8y7QZ61jzAo8LGxHH0hHFgxNbihuX
         /g7fLbVkjim2IEt8kRBWZc80hv4GV5uEXyIPj2caXS8Agy0dUrGISMKZkA7c1SYBa4Hu
         aoSw==
X-Forwarded-Encrypted: i=1; AJvYcCVJoQE+PTEM53S/gK/F4OcDYiRFc/6F+BeBLVj/KgcdqsnFLp7WPjLSQO6jON/iZPe6ANmHwDsLHjOB9I+DhtbGjWSLvX8XaKIF+sv6lf8=
X-Gm-Message-State: AOJu0YyeS40o/uJAeAN6xAni0tj5F4NL7bYcSfEfCm7cS2Wzc/YwVY0N
	mBQpoc7cWC1R7DLGwBQ7akxSzKPnpTfX+8H1hrYkO+xXRJ7TxxmJQ5D2XHS410Jkdtdgy/6taqX
	wKG9pE7UhIy5FwrQXv2fw4opk04Mo6xNtIFGEZQ==
X-Google-Smtp-Source: AGHT+IHw8USn1pwtfDYRiGrAV9UlikvZVFNUltLg1Z0kyZTfGor8u+pHXtigfdaRATjwOlfrdJZO+AA3REyDvpOGgNk=
X-Received: by 2002:a05:6512:488d:b0:51f:4165:930b with SMTP id
 2adb3069b0e04-5217cd4963emr4404267e87.49.1715265079540; Thu, 09 May 2024
 07:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
 <20240430124709.865183-6-fouad.hilly@cloud.com> <8b433feb-467c-4569-9426-cc245fc9da50@suse.com>
In-Reply-To: <8b433feb-467c-4569-9426-cc245fc9da50@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Thu, 9 May 2024 15:31:06 +0100
Message-ID: <CAJKAvHZfOVnNR4uv5d8X53o=m3YPCQSPSU0UaYhnq6dKPgbDuQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] Add --force option to xen-ucode to override
 microcode version check
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 10:39=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 30.04.2024 14:47, Fouad Hilly wrote:
> > @@ -21,10 +23,11 @@ static const char   amd_id[] =3D "AuthenticAMD";
> >  static void usage(const char *name)
> >  {
> >      printf("%s: Xen microcode updating tool\n"
> > -           "Usage: %s [<microcode file> | Options]\n"
> > +           "Usage: %s [microcode file] [options]\n"
> >             "options:\n"
> >             "  -h, --help            display this help and exit\n"
> > -           "  -s, --show-cpu-info   show CPU information and exit\n",
> > +           "  -s, --show-cpu-info   show CPU information and exit\n"
> > +           "  -f, --force           force to skip micorocde version ch=
eck\n",
>
> Besides (nit) the typo, isn't "version check" too broad here? Elsewhere i=
n the
> series you mention Intel's "min_rev" addition. _That_ kind of version che=
ck
> probably shouldn't be permitted to skip? In which case maybe better "cert=
ain
> version checking" or some such?
I will remove "min_rev" mention from this patch series. The main
reason for this change is to allow developers to downgrade microcode.
>
> Jan

