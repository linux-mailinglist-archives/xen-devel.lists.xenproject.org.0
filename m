Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE47E9CCC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 14:14:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631585.985061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WlR-0004QC-6L; Mon, 13 Nov 2023 13:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631585.985061; Mon, 13 Nov 2023 13:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WlR-0004Nx-3p; Mon, 13 Nov 2023 13:14:05 +0000
Received: by outflank-mailman (input) for mailman id 631585;
 Mon, 13 Nov 2023 13:14:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofAX=G2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r2WlP-0004Nr-GP
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 13:14:03 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8310f5fa-8226-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 14:14:01 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-507975d34e8so6283350e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 05:14:01 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c22-20020ac24156000000b005079fa0b1c3sm968795lfi.243.2023.11.13.05.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 05:13:59 -0800 (PST)
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
X-Inumbo-ID: 8310f5fa-8226-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699881240; x=1700486040; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SpRHI8ODdMxBKrEatyi1pfs9xw4E1INwXWlw+NJuvPE=;
        b=REHMVcA9WsyQ6v8ffqEQcAKK4IPTMrEb1PJFRrFsdKVkClJGRSQifXUqy2Sb/iId79
         KmuyNNFfA1t1L07RCZH6/pW3iGUyJWqhv9weVPhc3WtFXDRjRWwLHgAqA6VHsuYWWOeb
         Fv+BndTYgnNrop2FK6d5xS6BehTEN/37e3liOnXIe1wNcXK45B7nn5Mt0gkulsQjyFQY
         5a67RLwFGtWIOPy5T29pji0a9Gj6QmnMGtmhlEbGhtFI4t7bGIa5Z3+vyM386eam+eE2
         CZFBivHCS2qu6V+s0/0wlltV2XEnjOHnObOPqtLHKGwaU9Ca48tzMqjdoCgA1dnLQ9LJ
         jTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699881240; x=1700486040;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpRHI8ODdMxBKrEatyi1pfs9xw4E1INwXWlw+NJuvPE=;
        b=Lqxxp/XVFydq+6dtnVUsyVcRQgGb8X9m2Xie422y3z2+KicLmY/eMSYDQzy7yIdhbD
         e3avBaY00lGzY01B12meazLZC4XtrdVs7MtfCoFTTp32jbYX0O0Hr96IQ+/whTScG3e/
         j8JJKZMGuX3Spom1nKRRVtKYpyrf31FBKmC1pkXMO+1r7gQW3pWGftTDzsiAa5dTX577
         Qcv97MmKMUQcz3mJUY36y6uvSZtwCjtMkt2mhq0XZXorPfJ6eWd0i+oO3L51FGmuxiuZ
         cYJ5eJgX5JGzv+0AQUmNhd7yutbQiiAwkjzelOj7KnYsEuj56On8InGmja/COWdaYt3T
         k3gg==
X-Gm-Message-State: AOJu0YyXy/CHwZ3yCYXZSelQhZY5WZMXjzn6HprbxGauIjuYgl/4/xB3
	gENoa951UchGVgKI6zbAOR9audjU7rU=
X-Google-Smtp-Source: AGHT+IF0RnravydepDWtp3abzfn8hc7PngmkI8Kv9e8nngbgwg6GqYHrzTfQTl8y3Dw52EZOrCat0g==
X-Received: by 2002:ac2:47f0:0:b0:507:9ae3:6ba7 with SMTP id b16-20020ac247f0000000b005079ae36ba7mr4330164lfp.67.1699881239777;
        Mon, 13 Nov 2023 05:13:59 -0800 (PST)
Message-ID: <4421cbf44ea8b434c68a7ed218d007d049c08e6d.camel@gmail.com>
Subject: Re: [PATCH v2 03/15] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	 <wl@xen.org>
Date: Mon, 13 Nov 2023 15:13:58 +0200
In-Reply-To: <928557f8d62941a2524fc67b7067a777e2180db2.camel@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <cd1341ae337fc9a1619d747b3db1a7a5cd6ad2fb.1699633310.git.oleksii.kurochko@gmail.com>
	 <928557f8d62941a2524fc67b7067a777e2180db2.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Sat, 2023-11-11 at 12:25 +0200, Oleksii wrote:
> I missed to check the patch properly.
>=20
> The patch fails for Arm randconfigs:
> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1068865674
>=20
> I need to do an additional investigation.
So the only one macro cause compile issue if move it to
xen/grant_table.h compilation will pass:

--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -23,10 +23,14 @@
 #ifndef __XEN_GRANT_TABLE_H__
 #define __XEN_GRANT_TABLE_H__
=20
+#include <xen/kernel.h>
 #include <xen/mm-frame.h>
 #include <xen/rwlock.h>
 #include <public/grant_table.h>
+
+#ifdef CONFIG_GRANT_TABLE
 #include <asm/grant_table.h>
+#endif
=20
 struct grant_table;
=20
@@ -112,6 +116,16 @@ static inline int gnttab_acquire_resource(
     return -EINVAL;
 }
=20
+/*
+ * The region used by Xen on the memory will never be mapped in DOM0
+ * memory layout. Therefore it can be used for the grant table.
+ *
+ * Only use the text section as it's always present and will contain
+ * enough space for a large grant table
+ */
+#define gnttab_dom0_frames()                                        =20
\
+    min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext -
_stext))
+
 #endif /* CONFIG_GRANT_TABLE */
=20
 #endif /* __XEN_GRANT_TABLE_H__ */


But gnttab_dom0_frames() is used only for ARM, so probably moving it to
<xen/grant_table.h> is not a good idea.

Could you please tell me your opinion? Thanks in advance.

~ Oleksii

>=20
> Does it make sense to re-send this patch separately out of this patch
> series?
>=20
> ~ Oleksii
>=20
> On Fri, 2023-11-10 at 18:30 +0200, Oleksii Kurochko wrote:
> > Ifdefing inclusion of <asm/grant_table.h> allows to avoid
> > generation of empty <asm/grant_table.h> for cases when
> > CONFIG_GRANT_TABLE is not enabled.
> >=20
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- ifdef inclusion of as=
m/grant_table.h in xen/grant_table.h
> > to avoid
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generation of em=
pty headers for PPC and RISC-V archs.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update commit message
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- add Suggested-by: Jan=
 Beulich <jbeulich@suse.com>
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Remove provided befor=
e asm-generic/grant_table.h header.
> > ---
> > =C2=A0xen/include/xen/grant_table.h | 3 +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/xen/include/xen/grant_table.h
> > b/xen/include/xen/grant_table.h
> > index 85fe6b7b5e..50edfecfb6 100644
> > --- a/xen/include/xen/grant_table.h
> > +++ b/xen/include/xen/grant_table.h
> > @@ -26,7 +26,10 @@
> > =C2=A0#include <xen/mm-frame.h>
> > =C2=A0#include <xen/rwlock.h>
> > =C2=A0#include <public/grant_table.h>
> > +
> > +#ifdef CONFIG_GRANT_TABLE
> > =C2=A0#include <asm/grant_table.h>
> > +#endif
> > =C2=A0
> > =C2=A0struct grant_table;
> > =C2=A0
>=20


