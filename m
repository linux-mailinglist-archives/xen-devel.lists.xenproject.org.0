Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F8F7F1E0E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 21:36:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637225.992992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Azo-0006BG-Jk; Mon, 20 Nov 2023 20:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637225.992992; Mon, 20 Nov 2023 20:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Azo-00068Z-GN; Mon, 20 Nov 2023 20:35:52 +0000
Received: by outflank-mailman (input) for mailman id 637225;
 Mon, 20 Nov 2023 20:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KKU3=HB=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r5Azn-00068T-3x
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 20:35:51 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 638566c1-87e4-11ee-98e0-6d05b1d4d9a1;
 Mon, 20 Nov 2023 21:35:50 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5441ba3e53cso6608117a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 12:35:48 -0800 (PST)
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
X-Inumbo-ID: 638566c1-87e4-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700512548; x=1701117348; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4avHqVmE/sADQsrmIybbak6acFGtm8IBYrVxYY7qX+I=;
        b=gj0YrTHdGnTKPi0HwBQy9KBIGj2xx59YyivVPYfPP3Pl4HYkEQX5tBN99E3xyIRd/j
         uYnw5Ixm6oKchgnvbN0+pNs0wU+XYRYlswKAc5PJlUyugeE9irxxLcporECn6XgcKZ8U
         5RQ2a/qowPkuSWGIfivxDOBwo/h8h/SZ10LgPFiLJLWeHgDkCBNNbtdSgckr7Ar0ccWc
         tHZg3pLN41ybg0MTY4JvOo3Q3IChDv1gj0Q8s2LgVxhG2xyVcH798eoByIKbwBE8O8L1
         I2CspfhOkqhpZqaFpAQP8DdJLVPQR42cSPEQ66EWV5P+4cCyNPTDMkcP6GbFzSxVoFho
         9CRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700512548; x=1701117348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4avHqVmE/sADQsrmIybbak6acFGtm8IBYrVxYY7qX+I=;
        b=Lsl2f/x5KFHkqij2co72E3zZP1kSL/9ib+sO/X/rbd5UnSLu8B/RTIeP4b5MffaXnH
         NY+EIClH/imoz/eLT7ej20dgTrMqhSbqiNzp9mGx8iUY9MLtOoqQG50D2JmYsoLqCcRk
         oXazsYTyVTqTCQKxl/7TTnpy/9xgD/AssKkOxBnxnoVVBVLTM6IDMikrnSEkcmwlokJw
         YuUw32Jb78S1gb0Jl3VmnI+2FVGEPRUqskeA3AMR7dLqfwWTxOJNC1qnc616vKk20UiK
         DX4xK1qS05XSwjRK8GroHBVX1segSljsFk62nn/2O0ikK6idd+tQRiE5oP0UU1//738i
         Gy1w==
X-Gm-Message-State: AOJu0YzNmRJuHM53CfvW5A40ll8pjhGTIm9ZtEtU0BfXP797Pq1G7UG9
	tbaZy8y7nu8Sj/QLo0wgpdFJycd8PwXRCvkYwF8=
X-Google-Smtp-Source: AGHT+IEFE2SPby7y6csVZWWR7ZGXyUds721stG05CmhHv8AfeaLNAQPfVwRppCNFQPfOcENNnFkzc0TadwBwa16wapY=
X-Received: by 2002:aa7:d7d1:0:b0:53e:1721:146b with SMTP id
 e17-20020aa7d7d1000000b0053e1721146bmr295972eds.28.1700512548127; Mon, 20 Nov
 2023 12:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-8-jgross@suse.com>
In-Reply-To: <20231110160804.29021-8-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Nov 2023 15:35:35 -0500
Message-ID: <CAKf6xpuNbreDDxHQLf-nq10uXUkjAUJoMLhLg5uzE3_xbdMfCA@mail.gmail.com>
Subject: Re: [PATCH v2 07/29] tools/xenlogd: add 9pfs attach request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 11:09=E2=80=AFAM Juergen Gross <jgross@suse.com> wr=
ote:
>
> Add the attach request of the 9pfs protocol. This introduces the "fid"
> scheme of the 9pfs protocol.
>
> As this will be needed later, use a dedicated memory allocation
> function in alloc_fid() and prepare a fid reference count.
>
> For filling the qid data take the approach from the qemu 9pfs backend
> implementation.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

