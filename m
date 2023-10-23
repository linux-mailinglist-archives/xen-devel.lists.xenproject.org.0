Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257CC7D3045
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621336.967690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusPA-0004Z1-QT; Mon, 23 Oct 2023 10:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621336.967690; Mon, 23 Oct 2023 10:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusPA-0004XJ-NX; Mon, 23 Oct 2023 10:43:28 +0000
Received: by outflank-mailman (input) for mailman id 621336;
 Mon, 23 Oct 2023 10:43:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qusP8-0004Qk-Fq
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:43:26 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd85624c-7190-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:43:23 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507c50b7c36so4266077e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 03:43:23 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k27-20020a508adb000000b0052ffc2e82f1sm6274689edk.4.2023.10.23.03.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 03:43:22 -0700 (PDT)
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
X-Inumbo-ID: fd85624c-7190-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698057803; x=1698662603; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kouX21kUd9TEIwjYLs2hVM+ZWT3UAEPPsQQiKW7eyuQ=;
        b=kwStfbLPOE//KxGhtrv+RsW3NTYYmQo7u4LVpJOOq3SBouJ68jstzUBoF+Buld2Irm
         U1XJgu2UuPCi5EyO0zZl7fmy5e4WTzARLD9R8lts/XWsjq/wtjPrJsJJzzL4FCHVMz1L
         UqiWcVs2GJ6TmxN+hHMMpflUlKaZY0JfGQC8BW0qIEnncV8eg3INQ8dBmQ+86LGOjVay
         o/zd6y50y4MFeh3rnfmRYBXSbI/8t0ESBxA7hb8ul9HpC9T59GQTJgQw4s8kccnw9Ap4
         bsf+v2P5Fr7+1WrdZ33JOzGYprc1FtjLC6A93sgO11i5DMSvLv27K4NkxlINT24izZsh
         dtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698057803; x=1698662603;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kouX21kUd9TEIwjYLs2hVM+ZWT3UAEPPsQQiKW7eyuQ=;
        b=gboINe2hiSqD2u9T77oHqLmF9nLdtGR8lUaZIrF441F2wXB8HH1kX3DtjUgg9LKBst
         1m+yIFo6k0GgpEVq+mu4M5x1X5UFpZUgnDNfVXythxRzIPBa2h8rBL3nwNi9qbbeucgN
         lwktKJekeLL9mwGuBTLii+ijFW9+aUVpjpKxjPswCQTTcvk9UOmpOKNHe1Mi13HNpTMQ
         3dasgRxpucQvREZvbCwrITZ9EQSIBVOpEsb+T92kKvo6aDHprvywbhjUmp/Im1sGAAW5
         y7eRHA/gkFL9jhz2+ONoLk48m9vzEBcVqGjz+MpgRY9VLjY69ZKcAGn5KAt5JrOQvEbY
         my5w==
X-Gm-Message-State: AOJu0YxD4g2VbAjk1n8qWima0ujoHtriF0pBtHS4vvyMYxO3Z54izu43
	+ZTLqIw1ndm7K6PTMupyMwA=
X-Google-Smtp-Source: AGHT+IFeGzToe5Yh3vRrUyjN8BdMDVovGPaSuCBVv0PgyfnfHelYzia1hf68y+C2Ipgtov9dJjlrwA==
X-Received: by 2002:a05:6512:4885:b0:502:9a2c:f766 with SMTP id eq5-20020a056512488500b005029a2cf766mr6662533lfb.30.1698057803211;
        Mon, 23 Oct 2023 03:43:23 -0700 (PDT)
Message-ID: <e1e26fd0a31c7ab14e474d6d7fb16163e8163f2b.camel@gmail.com>
Subject: Re: [PATCH v1 10/29] xen/asm-generic: introduce stub header iommu.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 13:43:22 +0300
In-Reply-To: <65cdbeaa-6766-e5b7-65fb-191da6f59d81@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <8990c5c77c12333bfa7aba42b66bf7fffee5a096.1694702259.git.oleksii.kurochko@gmail.com>
	 <65cdbeaa-6766-e5b7-65fb-191da6f59d81@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 11:44 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/iommu.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_IOMMU_H__
> > +#define __ASM_GENERIC_IOMMU_H__
> > +
> > +struct arch_iommu {
> > +};
> > +
> > +#endif /* __ASM_IOMMU_H__ */
> This one's perhaps slightly more "interesting": Yes, we have a
> HAS_PASSTHROUGH Kconfig option, which both Arm and x86 select. But it
> is in principle possible to support guests without any kind of IOMMU
> (permitting solely emulated and PV devices). In which case what's
> (imo) needed here in addition is
>=20
> #ifdef CONFIG_HAS_PASSTHROUGH
> # error
> #endif
I am not 100% sure but not all platform has support of IOMMU.

And I thought that passthrough it is when a device is fully committed
to  a guest domain with all MMIO things. So it is a question of
properly mapping MMIO to guest domain. Am I right?

~ Oleksii




