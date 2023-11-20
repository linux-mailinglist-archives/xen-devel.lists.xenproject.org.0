Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1897F1932
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 17:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637124.992873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r57b8-0002bm-Cw; Mon, 20 Nov 2023 16:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637124.992873; Mon, 20 Nov 2023 16:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r57b8-0002Yk-9T; Mon, 20 Nov 2023 16:58:10 +0000
Received: by outflank-mailman (input) for mailman id 637124;
 Mon, 20 Nov 2023 16:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KKU3=HB=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r57b6-0002Xd-M8
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 16:58:08 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa8d573c-87c5-11ee-98e0-6d05b1d4d9a1;
 Mon, 20 Nov 2023 17:58:07 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-548f0b7ab11so258059a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 08:58:07 -0800 (PST)
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
X-Inumbo-ID: fa8d573c-87c5-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700499487; x=1701104287; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oFOk4Uq/VxJUBTkZLn+aIhZ9GS/XoVzYJ6W4NDthfw=;
        b=H6l8HbPvzVyJx+3f54ApqI8kzMFI9iu1jk743iKP+OSCPhNJc2Fgs/3Mxvo71ZACHe
         q5ck0uahL53H9o1yTD2NezvmWCKDf9z8Z045FD0YuB+yCVlF/buFCBFAogEYBI+/ivJY
         809a8Zh5HYomc51bOvtejuVGL8rYJhtBIjpryGMrZgK6NjRd1k909RG5Zt/+eWuntfYb
         62ULonpA50rIm7t+JgoBCusAuLSNv5epaM3W8zB+RkFzvmp8vrZ+5DdzrhR2QETQB5eA
         9D5/aFT97J65jbFc0iHE4aC7qrAbcP7SwphncXGdLm2cyOlFQEr89M5WASJt5OZgmJDZ
         js+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700499487; x=1701104287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oFOk4Uq/VxJUBTkZLn+aIhZ9GS/XoVzYJ6W4NDthfw=;
        b=w/DtsYfFx5tY1qSAqoEhhwPKea6VA9WLRgDppqlfLFmYcsDJPFM8R/sXBAGZKOF1Mm
         bpW7UF+zzdt62z1kWktZ5Eal6dJVuMXJPJ47rDnC1wQqWkkqQvbv9OTn7sDOL8m0QnIn
         drdgsxUe6v3WYppAIHt01A6MefZW/8mNFQ46T2DkM30w0oNSSLFsjTXrRITWkRyeKTdM
         029Oferm8nDSkPgHE+SgmWrr8eHLKVStZBBn3IJGs2qNVcfgaOrp6b6i4gf3nGiQY2wR
         XBUggWSO3FAqYy3XY6m696GUOMvv3mjQ9Kza/kLfojfuK+QsQL55NFTlo5eUn1DL0Zm+
         6Djg==
X-Gm-Message-State: AOJu0Yzd3ekhf3H8RBX0nQIIHz10ZkMof83Cva2Tdigt9PQpeZD6kl3s
	D47El1s7XVLwHman2vQiwEtP26+/b5GS46drsjDCYetr
X-Google-Smtp-Source: AGHT+IHYx3mNXCmJDpuAMWlMnI+zVH0tJs9ZfV+M5IWkMPnVmtDszHHHs+vhiFvCHBgiplMQ9+zTbBbFA1tKfPArDW0=
X-Received: by 2002:aa7:d409:0:b0:544:bec7:36e5 with SMTP id
 z9-20020aa7d409000000b00544bec736e5mr5177681edq.22.1700499487118; Mon, 20 Nov
 2023 08:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-6-jgross@suse.com>
In-Reply-To: <20231110160804.29021-6-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Nov 2023 11:57:54 -0500
Message-ID: <CAKf6xpt_dcX7fPkjmTy78qiUEGMtGvmC-D04PysGXZqKO6j74A@mail.gmail.com>
Subject: Re: [PATCH v2 05/29] tools/xenlogd: add 9pfs response generation support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 1:41=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add support for generation a 9pfs protocol response via a format based
> approach.
>
> Strings are stored in a per device string buffer and they are
> referenced via their offset in this buffer. This allows to avoid
> having to dynamically allocate memory for each single string.
>
> As a first user of the response handling add a generic p9_error()
> function which will be used to return any error to the client.
>
> Add all format parsing variants in order to avoid additional code churn
> later when adding the users of those variants. Prepare a special case
> for the "read" case already (format character 'D'): in order to avoid
> adding another buffer for read data support doing the read I/O directly
> into the response buffer.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

