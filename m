Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF179873FD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 15:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805450.1216545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sto5t-000376-Aj; Thu, 26 Sep 2024 12:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805450.1216545; Thu, 26 Sep 2024 12:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sto5t-00034v-7u; Thu, 26 Sep 2024 12:59:41 +0000
Received: by outflank-mailman (input) for mailman id 805450;
 Thu, 26 Sep 2024 12:59:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sto5s-00034p-4A
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 12:59:40 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f4c6f73-7c07-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 14:59:37 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-277df202ca9so454135fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 05:59:37 -0700 (PDT)
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
X-Inumbo-ID: 2f4c6f73-7c07-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727355576; x=1727960376; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9rbQ1hFC3VL1Fi+1C6fBfRc3HlSLZK45AN1XwCzUHQ=;
        b=VRMZiO0UJZPNKM6VWYJUomWHZxcH+pKISHfMN5YMZyk9u2aBM8Y1yOzVl5LaQlJSGY
         qpjKBJdvsqN6BHiKJFHJk9e6pZnrB/1MUmYzYl341u3m15fDZuUiHEq38OHANaIrl3LL
         n1eDKzJC6SbinnNlWhb6iAGTw7Rw1Zz3ackfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727355576; x=1727960376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9rbQ1hFC3VL1Fi+1C6fBfRc3HlSLZK45AN1XwCzUHQ=;
        b=PUnydZUqPBBQbaeYbtxJHb2E/RIl2WcA+3bB2UJ0b35JMatq3mXSpcUIE2MiBQc4C4
         A3JAy9uLqA+LtBqFZpTYFH/DILo5ouz9YYEe05fyqO1IWPI7CPFiAl2qGaTg0J/OG0Lc
         xrIg1+OQmDAARLvwDEMws0Jlmzfgr49D9YOLkA1/10Zdb/2JLmBahDrn6i6q6WVsFvMU
         w6N6d6eBRxquflfEqQwuSw1t+UIY+mLT5Kn99keYjoKHY1oVbEvK6l7qDKf6zJa5ejzn
         IlZZv4090E9sb9mZhZzvhKaNR9/4KPnb5swsVTbE3A63JTc+Wt53eraTCRw4greXt7qY
         lG7w==
X-Gm-Message-State: AOJu0YxokqMG1ayN0VhRcugCjEEfniLvfHlwSlTvYmRM2Xp2FnviLemt
	DCa3jZxki3uJE1SGjsrg8sgNdYXMa8duqsyiAiUsqgKHLVmhwdKWx9h7FXvEbeOmH1TwmadZSV3
	e4il9gDVtdjw1XbF/XWO8VCUVh/atqHxEP8ImHA==
X-Google-Smtp-Source: AGHT+IHLsPSja69dWYejwo/xYPe3hK2qmheDEVkVP1aFk2a6YwsNQN8/E0nfi1Ps/ahv+byxu6OadhE45QNgAIYrG5I=
X-Received: by 2002:a05:6870:4711:b0:277:f301:40d5 with SMTP id
 586e51a60fabf-286e15ce4cdmr5139343fac.31.1727355576717; Thu, 26 Sep 2024
 05:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240926125347.23738-1-anthony.perard@vates.tech> <20240926125347.23738-3-anthony.perard@vates.tech>
In-Reply-To: <20240926125347.23738-3-anthony.perard@vates.tech>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 26 Sep 2024 13:59:25 +0100
Message-ID: <CACHz=ZjGmo0tY5s5t=sMZwE7=vym5cUDPeLUyfQymbLPVq1CcA@mail.gmail.com>
Subject: Re: [XEN PATCH 2/2] blkif: Fix a couple of typos
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 1:54=E2=80=AFPM Anthony PERARD
<anthony.perard@vates.tech> wrote:
>
> Those where fixed in OVMF's copy. (And one of them fixed in QEMU's
> copy but later discarded by an update.)
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> ---
>  xen/include/public/io/blkif.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.=
h
> index 789bab65ab..8407453324 100644
> --- a/xen/include/public/io/blkif.h
> +++ b/xen/include/public/io/blkif.h
> @@ -42,7 +42,7 @@
>   * All data in the XenStore is stored as strings.  Nodes specifying nume=
ric
>   * values are encoded in decimal.  Integer value ranges listed below are
>   * expressed as fixed sized integer types capable of storing the convers=
ion
> - * of a properly formated node string, without loss of information.
> + * of a properly formatted node string, without loss of information.
>   *
>   * Any specified default value is in effect if the corresponding XenBus =
node
>   * is not present in the XenStore.
> @@ -328,7 +328,7 @@
>   *      access (even when it should be read-only). If the frontend hits =
the
>   *      maximum number of allowed persistently mapped grants, it can fal=
lback
>   *      to non persistent mode. This will cause a performance degradatio=
n,
> - *      since the the backend driver will still try to map those grants
> + *      since the backend driver will still try to map those grants
>   *      persistently. Since the persistent grants protocol is compatible=
 with
>   *      the previous protocol, a frontend driver can choose to work in
>   *      persistent mode even when the backend doesn't support it.

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

