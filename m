Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6F15AE8A3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 14:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399840.641187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVXwh-0004SN-TJ; Tue, 06 Sep 2022 12:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399840.641187; Tue, 06 Sep 2022 12:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVXwh-0004PQ-Q4; Tue, 06 Sep 2022 12:44:51 +0000
Received: by outflank-mailman (input) for mailman id 399840;
 Tue, 06 Sep 2022 12:44:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XS79=ZJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oVXwg-0004P1-DP
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 12:44:50 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1cf9f6f-2de1-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 14:44:49 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id qh18so22943676ejb.7
 for <xen-devel@lists.xenproject.org>; Tue, 06 Sep 2022 05:44:49 -0700 (PDT)
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
X-Inumbo-ID: b1cf9f6f-2de1-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=rN9vuEwRmPXxjRLgmgDthD3o4h45nfJ/Z2SWmvqCzvE=;
        b=ZnCPS5GzngMOwDnp6lSRawqA3KM7AcZCcq+lu0rJSqCXXCWqvHtiqhnv8plweBiK5X
         +8tJQqEPpaVbWK0SSm9RM3q7eQptaBzJS4nUIw2Vg3rhAhNLm5ioHnQnuwQwhukKZ0JV
         x2slmuh1dzAXwhdPoSn1Rs3J1m/YoU5ffK4FZl203sUBfCD9DsPzZYbcyKfhN0fzu66n
         YHP0TIZWTVY3h/NloZ/Ae64onSSep83mu6AHyhWvKvwbBvr8/ZPdkD1z56HU6JOy2Ykz
         ZWu5+HPBq5f/M6ap3Wz/ng8VL/XTf0W6CfXApbS1BdOfB8tw28Wn/tZtl4vQeS2QvpXP
         Ix4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rN9vuEwRmPXxjRLgmgDthD3o4h45nfJ/Z2SWmvqCzvE=;
        b=jgbAWYcc7fd8mgE54rog8M4T35/+OgFBTNHD90Cn7IcUV1fRpizHLKResK+p+kfKCQ
         tTIM9Q/EvNGOe34I56VGXbPtcBHcJSQ9h6WPMW86C/QMcNe0N5eqXwBOQY+x5LnaKV5T
         X/nDS8w8NgqaISYMQZqnbZIoCxZDO1sK8vi8OxqjOVccLEWA+GPhmOpmnYvznH/ydtDr
         jYZxvnau+jd3gKm9cFwsvxYCIhnZwN9/LGV3V7AJOCvn9eu5n3AppXPK7slticiacJOB
         6D9XyWNmJg4D+XHn+R/DqzRZYU82yzZiHb4rrc8i/gUZB67u8Hj0PJuN7eu9BTi4VAl6
         alZw==
X-Gm-Message-State: ACgBeo2eHniJ2byn1mAZPtd/ehtdOhb+BbFjMi15A45MRtikMLMbB0WD
	blqaZaA8AZzDHBlnr8W8G7ihK6nCa2oVpizWI7o=
X-Google-Smtp-Source: AA6agR5IZ96LOZgvtvBE42jEneUzt1xYT+3KfILgLOiJahc/ui/Y/+eZkjODozMgv/B1b1siUENe1fm4TCNU7rIYEFM=
X-Received: by 2002:a17:907:272a:b0:741:8105:49e2 with SMTP id
 d10-20020a170907272a00b00741810549e2mr29379893ejl.171.1662468288887; Tue, 06
 Sep 2022 05:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220905135019.3749982-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20220905135019.3749982-1-marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 6 Sep 2022 08:44:37 -0400
Message-ID: <CAKf6xpsZfJE7GN3jjmM+3crEGP4cFweEtmCmhvE+Hy76UyPDHA@mail.gmail.com>
Subject: Re: [PATCH 1/2] vchan-socket-proxy: add reconnect marker support
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 5, 2022 at 9:50 AM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> When vchan client reconnect quickly, the server may not notice it. This
> means, it won't reconnect the UNIX socket either. For QMP, it will
> prevent the client to see the QMP protocol handshake, and the
> communication will timeout.
> Solve the issue by sending in-band connect marker. Whenever server sees
> one (elsewhere than the first byte in the connection), handle it as a
> client had reconnected. The marker is a one byte, and the user need to
> choose something that doesn't appear in the data stream elsewhere.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Here are some of my thoughts on the correctness of this approach:
The QMP data is json - ascii (utf-8?) - so using \x01 is fine as it
won't be in the data stream.  The dropping of any partial message
works since the close and re-open of the QMP socket resets the data
stream.  There shouldn't be any partial data in vchan-socket-proxy to
drop since the client side should not have sent any new data before it
closed and re-opened.  If there is partial data, we shouldn't send it
into QEMU since the new QMP client isn't expecting any response it
would generate.  So that all seems okay.

Regards,
Jason

