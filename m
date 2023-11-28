Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34F7FC519
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 21:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643460.1003703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r84Ue-0005yP-9M; Tue, 28 Nov 2023 20:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643460.1003703; Tue, 28 Nov 2023 20:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r84Ue-0005wP-6j; Tue, 28 Nov 2023 20:15:40 +0000
Received: by outflank-mailman (input) for mailman id 643460;
 Tue, 28 Nov 2023 20:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxdS=HJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r84Ud-0005wJ-FN
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 20:15:39 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e56e2120-8e2a-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 21:15:38 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54bb5ebbb35so1228345a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 12:15:38 -0800 (PST)
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
X-Inumbo-ID: e56e2120-8e2a-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701202538; x=1701807338; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GR/FFJv2LTd+zh5JQd9p/ki10wU3P89/Dm1cx7xOSNs=;
        b=W8rnf3UA/+eeTXuAetHcNswDupF+2IEY3lvtkO5b5yJDU8tc0UAMKq3VAD6ciRJf1m
         2Balg9QFED9S5avonu/kxwptDFZJrT4spkISrO+l4bOxo+kjD5VLmLPiLUFIcpPsLefX
         5h8d8Fy1QlpxPiX9ejNivIzHXRncKD8tc7l4YXQsXY4h6SfBsePPKq2F61SOmALutHSi
         +LC23ZpGYi91wI0LsQofWM3cspaMj4K/PuWuSt+GviUGZltaP0ZgMW7wfYYY9Ayy+udc
         fzaNZC9YbO7wvz7RNHkESNlGJeQ18pzU8kQSqUHcFSoGKaQnRXIxeSjSjCAGE1FMcUFD
         WVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701202538; x=1701807338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GR/FFJv2LTd+zh5JQd9p/ki10wU3P89/Dm1cx7xOSNs=;
        b=SPkY+2VYNukdWaRKVbgVIRLoHsT7czSUIZKvQnh5arSXW9ao7K7w47aVMLxsTrqim6
         OjQM1WlKl7mqKRUElzn9OWIT2MPKrx0EkmGYtE4ORea+mfogwy8hFNNQLi8qAZuOReSh
         3bFIIjAC651r6l8qPiUTPMj1xFWx1QmFcpPGMoRIpaLF0bEY64tGuJK3uRrQKBTbvT6+
         azCYAw/uliQ2SB8ntT5ZdPF39EljGTqKsXbz+9FZuQh7Tza4/LMbxdrpcORrmroMmkP6
         p1I/XTFKjCE0Pc3NkVRAkeduiuB51nFU0THJd+Mw3x4swnZoOyK15Uqs3yVLhYSG6FMV
         XmiQ==
X-Gm-Message-State: AOJu0Yx1+mlaw+WF7slpk1ZvZu3Gr3AvVh+tTqVeCX+a6svd7AEhGGZ0
	lyYYFB9h1H+6D1c8LxPA72XCGRR1f/iXgrWaf2k=
X-Google-Smtp-Source: AGHT+IECzboUVC2i0KiD/oNn3pzQDSoKpTTHN/L0e0EF9tLG7+hTDLELH9wP2Lt9LG0x5WpKynP0eUvywtF+UPs9WL4=
X-Received: by 2002:a05:6402:1bd9:b0:54b:53f0:2696 with SMTP id
 ch25-20020a0564021bd900b0054b53f02696mr5953897edb.30.1701202537623; Tue, 28
 Nov 2023 12:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-11-jgross@suse.com>
In-Reply-To: <20231110160804.29021-11-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Nov 2023 15:15:25 -0500
Message-ID: <CAKf6xpubb3+LDFbmajgrCwQZk=owM2WjH9bEb2A8O8RKRnJBoQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/29] tools/xenlogd: add 9pfs clunk request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 11:22=E2=80=AFAM Juergen Gross <jgross@suse.com> wr=
ote:
>
> Add the clunk request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

