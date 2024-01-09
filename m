Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE50828DC2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 20:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664934.1035078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNHyN-0003kL-GV; Tue, 09 Jan 2024 19:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664934.1035078; Tue, 09 Jan 2024 19:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNHyN-0003hK-Di; Tue, 09 Jan 2024 19:41:15 +0000
Received: by outflank-mailman (input) for mailman id 664934;
 Tue, 09 Jan 2024 19:41:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNHyM-0003hE-0S
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 19:41:14 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bc0766c-af27-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 20:41:13 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-557c188f313so3728368a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 11:41:13 -0800 (PST)
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
X-Inumbo-ID: 0bc0766c-af27-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704829273; x=1705434073; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jBCC+8roDVSQAyI+69/0l++c3mBV52vqgbyaSZdsB4=;
        b=PHoj92EjSCzX3a7FcOURqaBTQ0NYZajUWyOBbAvX5jTCnREC+Aqq0TxW9tyfSehy9P
         3LoVwJX/NMEyT+lfsrXBWGnu2lc52VAvf1icvrNVoyW0UMJw7++wIk2vVdnIQqO/733c
         x6sR9Z3kFhLhXHU6sHNaVYgsbYstgf2QlGKwjQLWxqIXbhYDYNDvUNDe5lThMokkwF9i
         1H7yU8ua8MYfzRGk7AgAeberpChbR7Z0xcyPBEcbnxBxJK7qrniD2HkqzJA5dlrizWuh
         jjReNaCqPK+9X1AKvDmrvpHMLkFEOI2o61DN/2BeULzExBvLjJlKPiOT4vDmARLN0pXb
         db1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704829273; x=1705434073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jBCC+8roDVSQAyI+69/0l++c3mBV52vqgbyaSZdsB4=;
        b=nvl/7bohanchsdtoZpS4YzCxwDNjiw+O2ePAI7BkFPmXAhlfVek62XV9M+5ViTOirA
         SWiXhPU330KxwQneMov/9bLuI1PptkvoTJIOfs5turaVIvEFx3tDolSMXMiiF1jO0R9N
         TnqpDnyJnmF8OwIToD/i7SKAPUaUOffRH9cjrJTU5T7k+Y/aQfPUvEHV2CKecbWJBC9w
         PJ3HntjXxwp9/TUOgU92TwxSGTIehyygkenx+i96b6Yh4b0uYzKkxYZ1zUIlMrxr8gBc
         pyrquHKMKX38WwlZp8qdRlFwDGeJAQDSBGSFUK3n4+UD5+RI9R4CHF+VSnT8op5iMwgF
         ttHg==
X-Gm-Message-State: AOJu0YyXk5w5A8OYTQ9Ne4E1SUWdqU+Zi/dg3iyrFWdv1GFOu/Iyznmr
	fzJiLpWUisAk6ca4fvPAfJBLEZ1EOXg9qEonRXA=
X-Google-Smtp-Source: AGHT+IEj9nGuh26SMHb7dm3QmFTULYzb6B8AkpvYDn1OZvdCTyBufGTlxxrOm6bsvThtC1zJOw23gGUZ5kIlf8raptM=
X-Received: by 2002:a50:ef07:0:b0:557:1654:d705 with SMTP id
 m7-20020a50ef07000000b005571654d705mr1343778eds.5.1704829272697; Tue, 09 Jan
 2024 11:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-12-jgross@suse.com>
In-Reply-To: <20240104090055.27323-12-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Jan 2024 14:41:01 -0500
Message-ID: <CAKf6xpvLFn7KkDFgPr0jnyhFqirAjBD+UxnyK6c6TTLuo652iw@mail.gmail.com>
Subject: Re: [PATCH v3 11/33] tools/xenlogd: add 9pfs clunk request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:34=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the clunk request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

