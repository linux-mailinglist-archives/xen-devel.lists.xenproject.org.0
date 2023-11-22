Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012557F434E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:12:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638653.995459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kD7-0000dx-HT; Wed, 22 Nov 2023 10:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638653.995459; Wed, 22 Nov 2023 10:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kD7-0000bn-DX; Wed, 22 Nov 2023 10:11:57 +0000
Received: by outflank-mailman (input) for mailman id 638653;
 Wed, 22 Nov 2023 10:11:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HdNt=HD=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1r5kD5-0000bZ-Uc
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:11:55 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f789d1e-891f-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 11:11:54 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c87adce180so45092371fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 02:11:54 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05600c138c00b0040472ad9a3dsm1667203wmf.14.2023.11.22.02.11.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Nov 2023 02:11:52 -0800 (PST)
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
X-Inumbo-ID: 8f789d1e-891f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700647913; x=1701252713; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X32I1qDaBWsvKQMJH+9/U78hLuZ01vavJ3x6hlm/z70=;
        b=SPMI/4rE4/02JCwOwYhn9+nyre/jWQA3Qnqk2DltwR3++QAciv1aq04Jmi/bhyzNE8
         WUex4ddsleBfTbuLSj+q3lBz9shIFe6hD2qGdCgshsO3L2+paDPaissmczyB4vGCd+CS
         wohgkYh2+NodGr1wNC8wpIWqx/GbcKkhewOJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647913; x=1701252713;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X32I1qDaBWsvKQMJH+9/U78hLuZ01vavJ3x6hlm/z70=;
        b=FlXeuLu2Yd+K89pzl54YWk2QB0LiQncyFNBx49ZEOX/7LVIge6RJcKeUtanTn1QtoW
         H45cRkXN/Q0G9aijPbJMddwuM2i/ebjGqhoEBxci0ucOuCsyCExRTNzRldq7Rc4SW96M
         KCyBalxV5D02bK0BOWSpdf8LrtiipncTydCeBV39Zl3MojSh4PVTongxfpi0dKY9Ukca
         n9PDLaH1rEoY9S5bG7Ruou+pmCS/9pVOgHdwHA8fjUtaxCbDhZuXfms8XHOV65DoFMKR
         f8BwRuI4KRGz7iUy7eBSAzM6iNQc4MtRT0+GgsgQohVD8PiWFwDkoVNCZQRRdl4kvG6V
         dzrw==
X-Gm-Message-State: AOJu0Yy6n+PdX54jDqirK5s5zXJ+YcRydUxpvktkXtZiIz23ZF1VPHlY
	EFd/gGmcwMA+bNwE/WjABPtn9A==
X-Google-Smtp-Source: AGHT+IED1Y4b/ZWWUFWg7+FFh3UiuASf0S5CEuj8xvX4gzGF9kzgnX1WTU7OSjwHyZf7W0pP+4uIqA==
X-Received: by 2002:a05:651c:199f:b0:2c8:7192:817 with SMTP id bx31-20020a05651c199f00b002c871920817mr1540982ljb.15.1700647913525;
        Wed, 22 Nov 2023 02:11:53 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH v2] stubdom: remove caml-stubdom
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <c476207c-229d-4f0c-9993-92ec4b2b7b6e@suse.com>
Date: Wed, 22 Nov 2023 10:11:51 +0000
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <42855D0F-D2F3-47A4-BFC4-2A3241244790@cloud.com>
References: <20231122072110.22413-1-jgross@suse.com>
 <b36d5838-28cd-4b76-9597-b77df3812439@citrix.com>
 <c476207c-229d-4f0c-9993-92ec4b2b7b6e@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)



> On 22 Nov 2023, at 10:08, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 22.11.23 11:06, Andrew Cooper wrote:
>> On 22/11/2023 7:21 am, Juergen Gross wrote:
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index c341c9d0bf..bbb3cd5beb 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -14,6 +14,8 @@ The format is based on [Keep a =
Changelog](https://keepachangelog.com/en/1.0.0/)
>>>       for IPIs and Physical addressing mode for external interrupts.
>>>    ### Removed
>>> +- caml-stubdom has been removed. It didn't build since 2014, so =
nobody seems
>>> +  to care.
>> May I suggest some different phrasing.
>> "caml-stubdom.  It hasn't built since 2014, was pinned to Ocaml 4.02,
>> and has been superseded by the MirageOS/SOLO5 projects."
>=20
> Fine with me.
>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>

Acked-by: Christian Lindig <christian.lindig@cloud.com>

I am fine with removing it as well.

=E2=80=94 C=

