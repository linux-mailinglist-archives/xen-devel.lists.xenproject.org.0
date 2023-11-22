Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F327F4412
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638674.995510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kfA-0005Pv-Jp; Wed, 22 Nov 2023 10:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638674.995510; Wed, 22 Nov 2023 10:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kfA-0005Md-Fz; Wed, 22 Nov 2023 10:40:56 +0000
Received: by outflank-mailman (input) for mailman id 638674;
 Wed, 22 Nov 2023 10:40:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypHP=HD=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1r5kf9-0005MX-93
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:40:55 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c2b9dc9-8923-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 11:40:53 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso33499355e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 02:40:53 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0040b303d0dcfsm1794213wmq.36.2023.11.22.02.40.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Nov 2023 02:40:52 -0800 (PST)
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
X-Inumbo-ID: 9c2b9dc9-8923-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700649653; x=1701254453; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBscqDCAUhGijH4/Syb6sQF8j6XXVoCWoYLv0GZdoi8=;
        b=BOafXdF59O6ykrMx1rVL4Gw9hstQ6xoetylphPXkGSxYDa2eQcFmvWs7B8nTpJpJcd
         8zZsUwRqLWUVjgMbt0vg/DJSFf0873t8WJLyfvNjd80F82KcnpfIOSNvYGpZsxFrcXZh
         12ZWcgy5sM1brHMhp7VinOwgUK03V9GQx+kRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700649653; x=1701254453;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBscqDCAUhGijH4/Syb6sQF8j6XXVoCWoYLv0GZdoi8=;
        b=e0Pa9UMA79I1Ome1mJV7vzI3WV2kxKif55IPQxz3DR5YtAFUr1tbsY46EiVCsblsKJ
         9OtBH8gvtQOGthp3kZ/8v955MG1OIiu6NL1ktYfyNvXLv/7TA3Nz6QeWvzdL+JYPM7w7
         9h8sPGGVr8ryF1d5sMxx1miEbF4CHnRwxRet07AyBdFrJNhc4rK9inX1QHA5KNE+MWX+
         JUVYMaamrI2234qxU5pU4QDYxOpuvmEiy6sSMWp6MkOkleR7kRk/Tx8dX1grwYb3Xi/N
         ty0ki/aKR9fltamY28SX6m1Vt7HpuZRLnNcF+ggIKEx/vjD/mP+q5pMtKT/3YXlr8CNm
         M0BA==
X-Gm-Message-State: AOJu0YwBEd0ioQvCi5R+uFoVSbPT01bUoXEuTe/HeB57g5iTlpV6CINd
	2hnuPu3785LUcYCM3GgpLWO3DA==
X-Google-Smtp-Source: AGHT+IFdhYrROBbEsfQqOWqdnjTRVCP7U5UaS2iUWukEZ8L7lrhCtSs2wJR8t/19DXfRwk/6v2hfGw==
X-Received: by 2002:a05:600c:a49:b0:406:53c0:3c71 with SMTP id c9-20020a05600c0a4900b0040653c03c71mr1483966wmq.37.1700649652702;
        Wed, 22 Nov 2023 02:40:52 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [PATCH v2] stubdom: remove caml-stubdom
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <b36d5838-28cd-4b76-9597-b77df3812439@citrix.com>
Date: Wed, 22 Nov 2023 10:40:41 +0000
Cc: Juergen Gross <jgross@suse.com>,
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
Message-Id: <BDE25109-57E5-4BCB-B91D-F085FDF316C0@cloud.com>
References: <20231122072110.22413-1-jgross@suse.com>
 <b36d5838-28cd-4b76-9597-b77df3812439@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On 22 Nov 2023, at 10:06, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 22/11/2023 7:21 am, Juergen Gross wrote:
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index c341c9d0bf..bbb3cd5beb 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -14,6 +14,8 @@ The format is based on [Keep a =
Changelog](https://keepachangelog.com/en/1.0.0/)
>>      for IPIs and Physical addressing mode for external interrupts.
>>=20
>> ### Removed
>> +- caml-stubdom has been removed. It didn't build since 2014, so =
nobody seems
>> +  to care.
>=20
> May I suggest some different phrasing.
>=20
> "caml-stubdom.  It hasn't built since 2014, was pinned to Ocaml 4.02,
> and has been superseded by the MirageOS/SOLO5 projects."
>=20
> Also, one last ping to anyone Ocaml folks for any comment whatsoever.
>=20

I'm fine with removing it, seems to predate the Lwt based Mirage, and =
the way to cross-compile OCaml to unikernels is completely different =
now.

I think the latest way to use Mirage under Xen is to use Solo5 (which =
has Xen support and gives you a PVH domain).
https://mirage.io/blog/announcing-mirage-39-release
"The Xen backend has been re-written from scratch to be based on Solo5, =
and now supports PVHv2 on Xen 4.10 or higher, and QubesOS 4.0."

The mirage version of xenstore is here (a functor that can be =
instantiated on both Unix and Unikernel implementations and doesn't =
depend on Irmin): https://github.com/mirage/ocaml-xenstore
And I think the Unikernel instantiation of the Xenstore Server functor =
is here =
https://github.com/djs55/ocaml-xenstore-xen/blob/master/xen/src/server_xen=
.ml, but probably needs to be updated to work with newer versions of =
Mirage. I haven't got around to trying it out yet.

I never tried to use the unikernel build inside the Xen tree, it seems =
to be completely undocumented so I wouldn't know where to start.

The new way is shown here, and dune has some builtin support to make =
this easier: https://mirage.io/blog/2022-03-30.cross-compilation

Best regards,
--Edwin=

