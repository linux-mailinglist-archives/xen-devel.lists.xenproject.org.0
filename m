Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8012F9B9F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 09:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69457.124307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QNm-000205-WE; Mon, 18 Jan 2021 08:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69457.124307; Mon, 18 Jan 2021 08:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QNm-0001zg-Si; Mon, 18 Jan 2021 08:59:30 +0000
Received: by outflank-mailman (input) for mailman id 69457;
 Mon, 18 Jan 2021 08:59:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1QNl-0001zb-K1
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 08:59:29 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e8ee602-dc9d-4298-9dfa-4e7b0f9f5b95;
 Mon, 18 Jan 2021 08:59:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id h17so12651316wmq.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 00:59:28 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id o23sm30496825wro.57.2021.01.18.00.59.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 00:59:27 -0800 (PST)
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
X-Inumbo-ID: 7e8ee602-dc9d-4298-9dfa-4e7b0f9f5b95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=T46mBuh3Qhz5RsOWYDSZVkobrMyTbmsc7fwokBy0fbo=;
        b=SHiDGrUTMtILLbSFAGYj0ww+oGKWRns8XSKNy21VcKkfs16MF2wqTxnQkZh61g6pcg
         CW17cni4G9sNFtqIB2UiRd2kKGw/BrBHWQv11bJfQNUtjLmfEftBP6GZLavHrtaazA9e
         wj2pzE61AF+YkTAmTqMnoASHRQjRs3gXWsp1wMIQc79zMcNa9ej+pm9Tt10a2Jdvjf3X
         7rqROw8C/tSC6nBszC3buAF607/cFw0+fUmcQB9htj6fw+eB/2EGDC3JqyT6DerbWHz8
         nYXYfFtll/a/LURrO5Pq5WW1GL0fVamjVj7Py715FtBdJm84h3dMgX5ny9sAY8S0pJpq
         AcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=T46mBuh3Qhz5RsOWYDSZVkobrMyTbmsc7fwokBy0fbo=;
        b=JM+5J/NoFQ7wZV5RueJ8314yfK25YQKVSsm6Ds2Vkivr6sa7Rc4ZMDlcn65+z84+Xt
         eVdzuprBAPfDyo0MYFQWD4NQ08+XHUtrdLdQ6jumtlXSYHreEFANsC5c6t15E1/5Mm8z
         a0NiOBUEYnY2qbU2t3/a0zfM1GXJxrmjYgTb6GcK4BNEjwGLio7zIiWN7Cq5RQ8L6knk
         8PYtJ3jOMW0fAU3wQFJyP0hiSaVyvEgSN10wQQjJHEE1R8SJuA7EUpPnApR3NM6WbVyw
         QDNeBe1G8U5mFfB4G/Bo+Qiyv39smQaCeJ3WEXZAnf3IVkbFGtIkX2yZWgdYXQDefJ6C
         NZnA==
X-Gm-Message-State: AOAM532RL8Tb8Wl+RT7XE3C2CvkkPUJyXpLGNS2KorT9CUrkvYo53V5P
	v7aIMieX20Rx7xKHUuczifQ=
X-Google-Smtp-Source: ABdhPJxezvgvS1y2dXb5Jyf3i8XAacc5oOCscbvlCUBhCAI84bRgloqPM9KrOBOxdA7eePJnBOn0FQ==
X-Received: by 2002:a1c:4057:: with SMTP id n84mr13672622wma.141.1610960367758;
        Mon, 18 Jan 2021 00:59:27 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-8-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-8-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 07/24] xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
Date: Mon, 18 Jan 2021 08:59:26 -0000
Message-ID: <00c001d6ed78$399da720$acd8f560$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQKkyMBxqOs5HeA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Oleksandr Tyshchenko
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap =
<george.dunlap@citrix.com>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Julien =
Grall <julien.grall@arm.com>
> Subject: [PATCH V4 07/24] xen/ioreq: Make x86's =
hvm_ioreq_(page/vcpu/server) structs common
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> The IOREQ is a common feature now and these structs will be used
> on Arm as is. Move them to xen/ioreq.h and remove "hvm" prefixes.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Paul Durrant <paul@xen.org>

... with one small nit below (if you happen to do a v5)

> Acked-by: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
>=20
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>=20
> Changes RFC -> V1:
>    - new patch
>=20
> Changes V1 -> V2:
>    - remove "hvm" prefix
>=20
> Changes V2 -> V3:
>    - update patch according the "legacy interface" is x86 specific
>=20
> Changes V3 -> V4:
>    - add Jan's A-b
> ---
>  xen/arch/x86/hvm/emulate.c       |   2 +-
>  xen/arch/x86/hvm/ioreq.c         |  38 +++++++-------
>  xen/arch/x86/hvm/stdvga.c        |   2 +-
>  xen/arch/x86/mm/p2m.c            |   8 +--
>  xen/common/ioreq.c               | 108 =
+++++++++++++++++++--------------------
>  xen/include/asm-x86/hvm/domain.h |  36 +------------
>  xen/include/asm-x86/p2m.h        |   8 +--
>  xen/include/xen/ioreq.h          |  54 ++++++++++++++++----
>  8 files changed, 128 insertions(+), 128 deletions(-)
>=20
[snip]
>  #ifdef CONFIG_MEM_SHARING
>  struct mem_sharing_domain
>  {
> @@ -110,7 +76,7 @@ struct hvm_domain {
>      /* Lock protects all other values in the sub-struct and the =
default */
>      struct {
>          spinlock_t              lock;
> -        struct hvm_ioreq_server *server[MAX_NR_IOREQ_SERVERS];
> +        struct ioreq_server *server[MAX_NR_IOREQ_SERVERS];

NIT: this breaks the alignment... you should also remove some of the =
indent from the line above.

>      } ioreq_server;
>=20
>      /* Cached CF8 for guest PCI config cycles */


