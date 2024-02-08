Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F2584D74E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 01:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677932.1054860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsew-0000cM-3j; Thu, 08 Feb 2024 00:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677932.1054860; Thu, 08 Feb 2024 00:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsev-0000al-W7; Thu, 08 Feb 2024 00:52:57 +0000
Received: by outflank-mailman (input) for mailman id 677932;
 Thu, 08 Feb 2024 00:52:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jwf=JR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rXseu-0000af-2Q
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 00:52:56 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 646b8d2f-c61c-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 01:52:54 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5605c7b0ca2so1381994a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 16:52:54 -0800 (PST)
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
X-Inumbo-ID: 646b8d2f-c61c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707353574; x=1707958374; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4/6pPPW9cKDAE5xv53SDcVFW7vlkCvJ+UeinfJAcuQ=;
        b=U67m/nIYs7b8/kN0P0srCDx7qHop3qPxNJFwlv7soeq6+yC5gSHioU4vwdiJA5gzkU
         GJx7mZxkKm9uYubkFmf3GBHOQyraKiouHoHaIHK6aSFuxGEmzEdUxXFCPLKJKCKZ4wcy
         7yxHt/8KGecyWFH27yi9iSzt0ZmoujUDnEKF3jhKETgbnjtRlc24HZmAgNPtrobYsUon
         5NiQw/AIR01nSL61Iig9jppVSKyMZNpDQ9XUY0gaWkCXQ0SnAQunxtYdQUAGvxh/BM25
         6u08fNbt1VX5SrB0Sa9V4MWRSOLqT0qOkZUf6gAQwJzYaIzwQcTleOeYE3jQbhkgWS56
         sbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707353574; x=1707958374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4/6pPPW9cKDAE5xv53SDcVFW7vlkCvJ+UeinfJAcuQ=;
        b=C9yFTcvpS8Qiy9/gvbiFTa+O1sv90j0h5Rf4tNqZYE5cmoy7+butyECwjM/wJ/Dx4x
         Jr86SPrD8DbC+yaT+ldJ9PSWXv757ezZcTUJrG5GxAYd/j43KvivBB3dX4POnY4s9Sdy
         gQ6BxGHmNP2CZeZA2zXuw9DXvx88b8bFGHS+En0iRzVYS6gMlwJ30s40/CSU7qj91QpC
         fAIBT4j1AeDYXLt/kz85OgLnoKmPnHkw14QskdAS+QAS7nTzJUUQWyfFdp+0tHzFN7sz
         xDixUy2erq5N9RX+eNR0oCAobXaXM0285RY/7CslLJQGRF2LiMZqgEVSUelZmczlfbE9
         S0EA==
X-Gm-Message-State: AOJu0YynD12RS7xVsdzvBvscI+7q8eH3n/YTW73cWPOPEX8vZKGf5RWx
	LU+tRyDaGZA9rBqdfvF2mecl+LEyZW9G1+jMvo5t4uyx5JSbupx5wkh07V8HDDOjUSJGMe6aKC8
	YLCoJpPxN2Ec1MeMVPXSw68FV1Jg=
X-Google-Smtp-Source: AGHT+IH3+EfhY+1g7chY05CpNnWKLIRsW7fjoIsA5M6RXnfJymZ/pZ16IzVTSQoLDWBabt8iVwj6LldvUcYTVBTNwf0=
X-Received: by 2002:a05:6402:149a:b0:55f:c3c1:34e with SMTP id
 e26-20020a056402149a00b0055fc3c1034emr4622599edv.15.1707353573452; Wed, 07
 Feb 2024 16:52:53 -0800 (PST)
MIME-Version: 1.0
References: <20240205105001.24171-1-jgross@suse.com> <20240205105001.24171-10-jgross@suse.com>
In-Reply-To: <20240205105001.24171-10-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 7 Feb 2024 19:52:41 -0500
Message-ID: <CAKf6xpsUqVTMF89P5Qhadt-YBV8z+O+ag+zpQx4FLiSKq8Lp1g@mail.gmail.com>
Subject: Re: [PATCH v4 09/32] tools/xen-9pfsd: add 9pfs open request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 6:13=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the open request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

