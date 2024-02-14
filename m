Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B531C8547BA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680552.1058542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raD66-0001Uo-JP; Wed, 14 Feb 2024 11:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680552.1058542; Wed, 14 Feb 2024 11:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raD66-0001Sn-Go; Wed, 14 Feb 2024 11:06:38 +0000
Received: by outflank-mailman (input) for mailman id 680552;
 Wed, 14 Feb 2024 11:06:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raD65-00015K-QM
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:06:37 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eb210d4-cb29-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 12:06:36 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50eac018059so6955457e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:06:36 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t18-20020ac243b2000000b0051023149df3sm1629611lfl.248.2024.02.14.03.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:06:35 -0800 (PST)
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
X-Inumbo-ID: 1eb210d4-cb29-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707908796; x=1708513596; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PebPhg0dxWmlkc99eA6OqdfYUBB2ia8H+qi2Oe/OHd0=;
        b=UTtim5GGj794AU//ShgF7mVjJ3TuaOXMb5/ZazJtJOutbRONjpplJWGtdcr9cukRmL
         G/UhU4FyTfhU+VUDg9Y5cY2YQNIAxgWa6Cq1QtTXsuVzzWpoW/jX2EYPyi0gYMU/nTYA
         TmzGpsX/hSAbIG/zwPPDLn/gcJdcQrDMfS7iPyP0ENngDAR9exklSFmRzJFYCwaDGnZy
         w7cKR1q5z+G1N/ZyfvJSIWQGRNmhTRvf0Gx800MU1ipkGKPv7CMDNE47V/d4NvZ2/i3+
         zou13cCEcIWp6PBrfcMb3Jjm4IEC1EoIGS4f83Ubqy/GU9F6lCRl8Pkol/CKARrSxGHW
         X40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707908796; x=1708513596;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PebPhg0dxWmlkc99eA6OqdfYUBB2ia8H+qi2Oe/OHd0=;
        b=rC4QI1OsJc90E9WEguFJOMAo6sFzWKlbnIY3VE61U8s+BQWKpbYBY44nr3e/2PBB5Y
         Qn4QtmeZiqg8rjG87TaCimqWdYQ46CxA9KT4bLxBiUEhR10NjXWGjoj+YTGMS3CfN6X8
         +Gc+zy74JL6xdLjFapMngt3khvOtgj5EQEtC7m0R/8I/qjrt/jQLiye93aN4N9EZDsBD
         CKyQa49hosgiXMVtIED6NWV3G35XynwVtjeQswEOYK6ofkFH8eAZxVKLcYwn5eQ9ND1q
         WqGd5XOJ+XOyugyaGQ424zw46W2iYEQ2L4ZnULTy93YuZUUIbWcdKAvoi5GuVVQTSJlr
         +xGw==
X-Forwarded-Encrypted: i=1; AJvYcCUP5az+BkbZSVoM65yxh6zJ7669i5nPe6gDnFVYD+2ZnehxRR3R77sUh6khVVrbC15C6GaHUvqCXVnFsnk/xe/brXa7oeNNRprJQkZb3FE=
X-Gm-Message-State: AOJu0Yz7435oj1H+WglI/TXwqWbNTajpg1/YBuazylDt/tIAHi4B+eg+
	g+WauuuX4pcYTwAQGVsxHUBT9sX3KwQ8hocqiXCx+1rYSMbajDlS
X-Google-Smtp-Source: AGHT+IH74VzRoZlUgSmmLukG8bUvEV6IAP8dCtDHosVeasK26VBMduoXjVpCnPkDmlj/X/6sKejQ/A==
X-Received: by 2002:a19:e001:0:b0:511:737d:6619 with SMTP id x1-20020a19e001000000b00511737d6619mr1613696lfg.0.1707908795714;
        Wed, 14 Feb 2024 03:06:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGaM66fX+CjNFH6wGLj9gf4ayLknaGlkMh8pkrM2GnUMjWsuctX0Tg7CIwrgvH9fAsy/zNfiI+bjFjbhSTIYpk4giLkSJyK1XI2eAPRSzP08kevrxV6s5Sp9JO29nwOI8jO+2FkDBpfCl02bAdchWn4oF7Yeha0UfdTXX6zZZ4Y5U6Nr3X7TSFxctaWDa4HRXZYBsBBsSF9MGRd/vNN83dnA/BTM3ozkuNSXas9pHxXWIZxTHoJtmirXnK04KnlFx8EC+31jWVMmE3KEGSttuV5URXB7KGecBIxHuhp9WAnbABXI4hxZ0=
Message-ID: <16a84caf539d90f1712d931ae24c70c5368ed7cd.camel@gmail.com>
Subject: Re: [PATCH v4 11/30] xen/riscv: introduce smp.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 12:06:34 +0100
In-Reply-To: <3a74458a-809f-40e4-9c86-e58e339fe96c@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <4d0a8aba3ec17fa428f8d18f0008f863481b1f67.1707146506.git.oleksii.kurochko@gmail.com>
	 <3a74458a-809f-40e4-9c86-e58e339fe96c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 16:13 +0100, Jan Beulich wrote:
> On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks for Ack.

~ Oleksii

