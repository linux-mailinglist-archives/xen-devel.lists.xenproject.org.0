Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C2B84D747
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 01:48:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677925.1054850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsaa-0007e7-Jf; Thu, 08 Feb 2024 00:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677925.1054850; Thu, 08 Feb 2024 00:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsaa-0007bI-Ga; Thu, 08 Feb 2024 00:48:28 +0000
Received: by outflank-mailman (input) for mailman id 677925;
 Thu, 08 Feb 2024 00:48:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jwf=JR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rXsaY-0007aS-TS
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 00:48:26 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c48f7273-c61b-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 01:48:26 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5605c7b0ca2so1378779a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 16:48:26 -0800 (PST)
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
X-Inumbo-ID: c48f7273-c61b-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707353305; x=1707958105; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3h02KhYcKYr4sChkqfp2MHa63RLYk/teiY9V2+4SCmA=;
        b=Q8R/ef0PRPANYxRCIRkXBH6Djn1IWdXFxCwXhjQ78OhcwZUlIDmpOIvSaa7+YOBSL2
         2cbSaebCMTTvH9SY21bSoUA2FcY6uZ/pkIn8uQ9A0A7MDB8DKpGd4TDU1ezWmV0GlY/C
         Xk/tBR08lV58RPTogqnWUMYhVHw4YxrPL/aWwg2gNFPWbDdLDjsLHpvIePDHlC1JQqtu
         NuSTJp7LspHuwcPANHLVljc1r1/3PVarrzn8QBU37Zsnq7H+JNZ8Af3EArts5U6s5J5u
         DG5cM/eE/kk01joPPSb328pZ21trecXAcyyp6a+pr40I52cwJj8G8qkppyKGOgXApIZF
         HPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707353305; x=1707958105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3h02KhYcKYr4sChkqfp2MHa63RLYk/teiY9V2+4SCmA=;
        b=IynrSe4dvGRooXgystsAE3rjzoZB8effNDpiHugWOE6tgiAUzLtGGvuHyZqw4/S3VK
         awfUyWN9Q7IMmLHV6RmnqL+sSqAP0j9M+uSl1be3Af368sX0+VC2BCi3LRn0gBMlGzHH
         8ok63LRPhlvBdXlhOC5a92lu3ZblFAWsGh+0hFrvYPhLJnQszTj7asEim54id7TRdeg9
         +DAcMgtb5QnyqhYfW6otcUgkxYnBOQIpWldkL+0lRfrMYrwiqbyJWw4tNtJOOFhwF8TB
         uHZaTbKAYyZY4knC233L0Y3mo+gqmO0ZkK800aXnd3z20po3IxTpdNX29BWT0xIP5GcH
         FUrA==
X-Gm-Message-State: AOJu0YwRPgRoNHDA8aVP/oQ+kNiFvRJgO0TW1wsRmJqzk3tAOXqtcK7+
	AYVT5T2CSBZ9iuPuP5fdi5aiaOPrJcKhpfbToeJVydxLxlWepJln7r6Mxo7P7DBxw9C3EUYrHCZ
	gg5XJ8Lj+1EjSqnLwxw9sJY1yseGRfKKn
X-Google-Smtp-Source: AGHT+IEZM91i+3Zb092PAYmXBXxU19MGbLJMvAoeCT42BoP0yED+1H5imulhiwac7qT0Z5njeg4e07TTZ8+qjPYx4nA=
X-Received: by 2002:a05:6402:1203:b0:560:64f4:cbd5 with SMTP id
 c3-20020a056402120300b0056064f4cbd5mr5150060edw.21.1707353305396; Wed, 07 Feb
 2024 16:48:25 -0800 (PST)
MIME-Version: 1.0
References: <20240205105001.24171-1-jgross@suse.com> <20240205105001.24171-9-jgross@suse.com>
In-Reply-To: <20240205105001.24171-9-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 7 Feb 2024 19:48:13 -0500
Message-ID: <CAKf6xpuLc1YjeaEH6XgAFNLWAwSJj7h=OOLPJ9FFUhvqUDD=HA@mail.gmail.com>
Subject: Re: [PATCH v4 08/32] tools/xen-9pfsd: add 9pfs walk request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 5:59=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the walk request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

