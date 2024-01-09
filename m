Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4435828E07
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 20:46:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664940.1035089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNI2o-0004fC-2a; Tue, 09 Jan 2024 19:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664940.1035089; Tue, 09 Jan 2024 19:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNI2n-0004cg-UN; Tue, 09 Jan 2024 19:45:49 +0000
Received: by outflank-mailman (input) for mailman id 664940;
 Tue, 09 Jan 2024 19:45:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNI2n-0004ca-4k
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 19:45:49 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af11566a-af27-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 20:45:47 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cd56dac1adso28717951fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 11:45:47 -0800 (PST)
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
X-Inumbo-ID: af11566a-af27-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704829546; x=1705434346; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peJWWf86DIwACu1g3bAnPDPszT38X8bGX+7jVbS+I0Y=;
        b=dMUHj4fRVVxBYUXn2kj0UhbpaP1RD23o9dgmIWCGjxBSj83N4IXxxcvH0qvL/+KwBH
         oxbLaS9YT0VzGYvqdCE4Vk0uwIwnfiA/lNzRop3Ibhb5sZNAEcefRsZSyVcmbHkJ7ze3
         ZzmThjdDi9GP8IOzzZSO0drrbrsrwZ1gfGDLkB6InLqvCzZYCkIatdCvlCTZsIAKm3q9
         u/XwayBDmLiGiEGVCqUUo9JnCYJFY4l82Yaqwt9E9/jxXUdS2Sj2oiA77kiKNqsZbaza
         17CMiYhHdMXBPd6emok9Hi9CEQM4fFzBtZBfeS137S5tF49BbPcwiD0Wn+dN5qQRRD0p
         oP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704829546; x=1705434346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peJWWf86DIwACu1g3bAnPDPszT38X8bGX+7jVbS+I0Y=;
        b=MJqSHPc8JLJ7AlhjzZ2T78aT3R0UwLyVn9SLYmv8tUY65AQo2QTr2SaYU96lwDzWse
         +igizKkKcFYTB8It2h5jSDW5AE/H1iIFAXOoTyk4gp2qty7Uoi++tTjo8eMxVor/K+vZ
         cY0bk/gH63ZUmPUTfXWz8LE7o4d3TpK8b68FqjasP+JFJrgORMu5Qg8H+f4fzAXkD4Cs
         oyE3uQCKWUWNixtLhUfVTvgbwjhFsBDX+tRIoP/eWVRtyx5ZENEmjXo8NY0SXK72RNeu
         AOc+y6a1Os9zYtNCQFojGFker+PmtdbCE4DSkjihe2tTBhNJPwnJd8bCOp9EVHFJiEbM
         8ocg==
X-Gm-Message-State: AOJu0Yx2HoaLBembcQvMs+fWtxQykeBZAQ5f9no+A7IZtB+MOsvL9LWy
	LEXVhDtLQpwyDiOeS9cukQt7CHRv4FRi0aeGeHw=
X-Google-Smtp-Source: AGHT+IHVbTg10/3rSmyQp18KyRTmwxBYDhBUc6i1+W3BDuB29wtHn0aHyoRr6LstJtJ3+GpOzDvWos5uQJ6LjnW3Pc0=
X-Received: by 2002:a2e:9350:0:b0:2cc:e708:adb2 with SMTP id
 m16-20020a2e9350000000b002cce708adb2mr2681709ljh.96.1704829546436; Tue, 09
 Jan 2024 11:45:46 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-13-jgross@suse.com>
In-Reply-To: <20240104090055.27323-13-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Jan 2024 14:45:34 -0500
Message-ID: <CAKf6xptcUCOxtzA8FpdUj2dQ4yRUoXgxeGrzmBnb-X0g3_xnKw@mail.gmail.com>
Subject: Re: [PATCH v3 12/33] tools/xenlogd: add 9pfs create request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:13=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the create request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

