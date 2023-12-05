Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A878059E0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 17:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648119.1012134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAY9Z-0002x3-Qo; Tue, 05 Dec 2023 16:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648119.1012134; Tue, 05 Dec 2023 16:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAY9Z-0002sb-MN; Tue, 05 Dec 2023 16:20:09 +0000
Received: by outflank-mailman (input) for mailman id 648119;
 Tue, 05 Dec 2023 16:20:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WXV=HQ=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rAY9Y-0002sU-HK
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 16:20:08 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25c5ef24-938a-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 17:20:05 +0100 (CET)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6ce5a0c384fso1755469b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 08:20:05 -0800 (PST)
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
X-Inumbo-ID: 25c5ef24-938a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701793204; x=1702398004; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQlGLAxxeEJp+EQtTSDrWU/5FydJgE+KAh6vaQE/9+k=;
        b=dccs9pLiZPgko+NfATbOJOcYB587IVLxZ6Y+rjWy4dFrchVa30kvQur2KJP/1pXu2h
         tI60Ln+OKcrYeJVqlOmQue089jtVpLkVhUg52PU/kIJrG56BVUX4gJA2+PuaRGqow/vd
         hwpubYxr7qAQv8X6M2PsH+jh4DhEb43LH/wJehPi/78VLhvJCDENot54Ukd7XmAlA3vP
         +mJMqJb7qN8Ubhtv808fkky3/ldVJY0ZgqLIXH4yfvsR8O7GbzznU5BFzZCfXTdHKldl
         IqvBNG6jVs9bjSZRDFCZOUiYO6TaBz1fAXxXswUX3JnnisXHfmheevTGAEiQWtaMW2zm
         Zh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701793204; x=1702398004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQlGLAxxeEJp+EQtTSDrWU/5FydJgE+KAh6vaQE/9+k=;
        b=pUEfkmY2kfS3eCPqoEPJMzdhBtrFPrldQYk+J4TwlwMu1EbeBHoVimEPzTySMsAQGF
         UZvocfMwDwSwvVJnYpuZ4itJLxdpFTPSzgSzF8ev99rfYjZzb2n3fLo1LOEz6tfVz47y
         ycUZjJ47bw6kwVMUxseD12P2lGYUMyvIKrn5UoFsLIGRcl8Z+FP1CVL/jaKA53ndu9OV
         ZrA+COA4cwHXDDqLoresUrZfZHAqSfp+7jB1m7BxSnR67HIUkYJz4hb6rvJrqDKH8LKl
         7Bk+WUbEykN/+/ZTBD8WTN4G1l9tUh9MXZ9uIs4P0YoJfSyIhi1D8ncZomh5MTHE2PWb
         Cghg==
X-Gm-Message-State: AOJu0Yw0QhddLls/9Ituoheqa8WBviez47iCYLCScwDOsWSfYcL7BnFT
	IDuae8Bg9XfhzJkWLYSa3P/Xbe3l6xjvS2WjvWDFZHxGXLo=
X-Google-Smtp-Source: AGHT+IHr8BWyZmClNTXj5iKuDaRHbkzZUjKti5gkghCtpR8YawFE9nm1lOT0yc/aZ7GqlDgtEKG611zcFf74KZyknVo=
X-Received: by 2002:a05:6a00:e0a:b0:6ce:412a:2a60 with SMTP id
 bq10-20020a056a000e0a00b006ce412a2a60mr1427795pfb.38.1701793203534; Tue, 05
 Dec 2023 08:20:03 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com> <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com> <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com> <435d159f-96d5-49af-82ec-bce6961e3391@suse.com>
In-Reply-To: <435d159f-96d5-49af-82ec-bce6961e3391@suse.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 5 Dec 2023 17:19:52 +0100
Message-ID: <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 5 d=C3=A9c. 2023 =C3=A0 15:18, Jan Beulich <jbeulich@suse.com> a =
=C3=A9crit :
>
> On 05.12.2023 15:14, S=C3=A9bastien Chaumat wrote:
> >  booting kernel with "dyndbg=3Dfile drivers/gpio/* +p"
>
> I'm afraid this doesn't tell me anything. I'm simply not familiar with
> Linux'es GPIO handling.
>
Thanks for your help so far.
I moved  the issue to linux-gpio devs  :

https://marc.info/?l=3Dlinux-gpio&m=3D170177779023453&w=3D1

S=C3=A9bastien

