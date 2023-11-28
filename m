Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D4C7FC535
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 21:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643463.1003714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r84b8-0000R8-VA; Tue, 28 Nov 2023 20:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643463.1003714; Tue, 28 Nov 2023 20:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r84b8-0000Om-Rm; Tue, 28 Nov 2023 20:22:22 +0000
Received: by outflank-mailman (input) for mailman id 643463;
 Tue, 28 Nov 2023 20:22:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxdS=HJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r84b7-0000Og-IQ
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 20:22:21 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d50e6799-8e2b-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 21:22:20 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-544455a4b56so7762579a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 12:22:20 -0800 (PST)
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
X-Inumbo-ID: d50e6799-8e2b-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701202940; x=1701807740; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2WK/B5ktvzZA1nZvqN1jN+QaZ6wc1lxOalewdNRiYw=;
        b=EDTnim0rp25yEl2Zxk6JCS+6Lg9SFjXbVptl6d645jIja1B8+gcKOeM/G3xhcMcenU
         C1KKa/EqKvzkDNge49MOun68EQj/JyuB14daX7dtMkYkm/Hk7eBGzlC0KLch7t7AEdoT
         2c7RiTKlAGHZ+4jAhxrgYl+4OH51fJuFnsAs63kOmt04ELlaMio3DGt9o3QW9HP+3TI6
         u2Eeah1R3hCj0i88OEO8QKpVvpvrExLHjzqs650OT5zeauDMCg69stlfTTPGdCvtLkhy
         qmXCOfQVdsPoq5F8ZcNne7JLwuq/HjKss390V6eWTXg0skkyAS4KnKCAvqbYThOGoyWR
         NOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701202940; x=1701807740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2WK/B5ktvzZA1nZvqN1jN+QaZ6wc1lxOalewdNRiYw=;
        b=BISBid8eON/NaGp+ahOyOMsmgLvZOOCZTdshVs+keOZSbiyjzMWJMtgGwgX/vU0VuR
         bCCtx5JDQ746FkTLjusxjtOo10hLrmvy/6is4mVX19OEqD/Ba97bSuw381Fu1woYJ0Hu
         +gMhZMPWCeOwVFEgAIt6aXcBDh66mzUcraXS5qguMS4pS5dFP98xGV/oH5k4O4ee/qAK
         q8U9tKs3GWaSJO1PSk74Q0/J24qe3WifBKGjDlMTWlT+VWxJj0/FTvTcAF3zcN1aNoW2
         +vlJPR/pxLnXgH9AcRW2F6SCgbi/8lnuSE+QL5TUINeiMwFRtrbYdtjhsd8ihgbCkCt3
         r8QQ==
X-Gm-Message-State: AOJu0YyigmIWkvBVdeTc9dwDlnNIoUs3zX6AUiKyAamsIFFNzgqzATyJ
	EQt8OfiMIRHuZ9PybPtMLjlhxuJQ5MChTzAiMwE=
X-Google-Smtp-Source: AGHT+IHt6x1SO269uWH6pHumnek2VT+sRS6qE3LTLJcFB9bO7GUcHxpSIf2FbLKOhHOqN5+uEfipmDNL1EP50+JDp7E=
X-Received: by 2002:aa7:d3d5:0:b0:54a:f72d:38b7 with SMTP id
 o21-20020aa7d3d5000000b0054af72d38b7mr11478196edr.1.1701202939737; Tue, 28
 Nov 2023 12:22:19 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-12-jgross@suse.com>
In-Reply-To: <20231110160804.29021-12-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Nov 2023 15:22:08 -0500
Message-ID: <CAKf6xptw7_OSQtXGZAJyyoQHny0nmcd4YFowigYv0d2uy8D+1A@mail.gmail.com>
Subject: Re: [PATCH v2 11/29] tools/xenlogd: add 9pfs create request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 12:14=E2=80=AFPM Juergen Gross <jgross@suse.com> wr=
ote:
>
> Add the create request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

