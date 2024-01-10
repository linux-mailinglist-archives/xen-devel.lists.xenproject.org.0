Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071D82A2AE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 21:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665752.1036054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfTu-0003TV-L9; Wed, 10 Jan 2024 20:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665752.1036054; Wed, 10 Jan 2024 20:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfTu-0003R7-I2; Wed, 10 Jan 2024 20:47:22 +0000
Received: by outflank-mailman (input) for mailman id 665752;
 Wed, 10 Jan 2024 20:47:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWwH=IU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNfTs-0003R1-Or
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 20:47:20 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 724ad809-aff9-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 21:47:19 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-555f581aed9so5388463a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 12:47:19 -0800 (PST)
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
X-Inumbo-ID: 724ad809-aff9-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704919639; x=1705524439; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvJNeieuIZAAb9SWVbY0cs7/rBSF6L3PddlhDHJYfYM=;
        b=JiIpFhKyVFXxDbC2GF/KS7vlEQDKrXASUiytzWu98F7iQvsKEoZkj/PfSK19w7gheA
         cc73UYXVLfCWwLcUefsWKE7HAUNCyIhwWrz27veDQRu8sjEOB4Y8LOiqlUGNBaItNezQ
         UpKw04xFB8cZeqOwDy5JGccY1vVp2k9Qgxy7ZyW56BSH822wx8IA2jgluo95XvDiHqB+
         X19veqKr4rRply2acmTorr+JNE/6F03wTFS/xycyE6nAbOTjfn4IX/tBeY3Dm+LM4xkM
         g/clDBEs25/lBOZYGz2T9xXZMfpyUKEv4zg5rRg4fN28IxL13XFv6vL0FLT6XrQd42A/
         MB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704919639; x=1705524439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvJNeieuIZAAb9SWVbY0cs7/rBSF6L3PddlhDHJYfYM=;
        b=q/PP13t/dodnszdrbC8G7J2Yp2OugsOPouxASiUB/NIOLuS+gb30AmQ1mFouMG78Qt
         deB5a4rtUMtAjRH4bulM52oELanWpk+lanlxsytrXlK0XzDg6B4pjxbLhBAADJSWw/ED
         /ouz4b6o1l+JZgI9vsTPMvAYpNAELdEWBbKXNe6+DRyPz974GqWfo9NVuQ1ADtcsaxbA
         u7YySmzYMs9FqfMYNcU5BVAuy/TJ5RL8OYYKf7d7f9Cb/+DVDGge+sM61PTh8Muf8JEi
         ySzWZhAcQqFwlz9uLc/QzIdfC60tbSPpWpbwuy6ieElP8cSRZMeP+/yZVU1VyW+eLy0k
         /AIA==
X-Gm-Message-State: AOJu0YxHlxo2N0boDFGyGx9/hj5oxJ19EzTc6uVx+0Jm730rvcBg4par
	feb8LCLe80LbFrYoZ1jcr5yl7Z2nk8TOs8v3J/s=
X-Google-Smtp-Source: AGHT+IHLwp2CBk3j5cEn/eNeeC5YydkhEU7v0nucpJ0hxKeJpKucZa+Lua1/k1oVK8TfjLkWmCXCI+CE3Xscb8HNshY=
X-Received: by 2002:a05:6402:430d:b0:557:8067:c43b with SMTP id
 m13-20020a056402430d00b005578067c43bmr31567edc.61.1704919638965; Wed, 10 Jan
 2024 12:47:18 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-26-jgross@suse.com>
In-Reply-To: <20240104090055.27323-26-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 Jan 2024 15:47:07 -0500
Message-ID: <CAKf6xpvutPFTUX9EYa=Pt+TnNhZojQ7xSfgUgToujvHWPM=oWA@mail.gmail.com>
Subject: Re: [PATCH v3 25/33] tools/xenstored: move all socket handling into posix.c
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:10=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> All of the socket handling is needed only when running as daemon.
>
> Move it into posix.c, allowing to remove the NO_SOCKETS macro.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

