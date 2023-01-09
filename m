Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABEB662667
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 14:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473610.734304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pErmu-0001Jw-Cy; Mon, 09 Jan 2023 13:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473610.734304; Mon, 09 Jan 2023 13:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pErmu-0001IB-AD; Mon, 09 Jan 2023 13:02:04 +0000
Received: by outflank-mailman (input) for mailman id 473610;
 Mon, 09 Jan 2023 13:02:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pErms-0001I5-Kc
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 13:02:02 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce42a66c-901d-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 14:02:00 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id 18so12376231edw.7
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 05:02:00 -0800 (PST)
Received: from 2a02.2378.102e.bce5.ip.kyivstar.net
 ([2a02:2378:102e:bce5:dfc0:9312:b994:6b21])
 by smtp.gmail.com with ESMTPSA id
 ch17-20020a0564021bd100b004585eba4baesm3707013edb.80.2023.01.09.05.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 05:01:59 -0800 (PST)
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
X-Inumbo-ID: ce42a66c-901d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VL3jfDiNUYbqOELuZt5dZ3P1mshWkZMGXFgg0J+f4Qg=;
        b=YCHzlmY8elUGdxQDlNgEocdnRTVqJFqqPrQtJzJGjMd98YTvCpEbEwWUSaLlOTDNwX
         NhrKwwLyKwgvDjeHJqF1WBBO8jpo2gjDvnAJJjpNVxMMsvCgHYPqJ3f7uI3j2BGVG+IB
         4jHZmPyE4OX0j2MIaWlzb1WCs02fk7WvkFzr45dHjNTnyp/SmhM6jcb4FKJUjV7DuIkq
         SUsNAFyB20GGUdgnpmDkuomwLiBaEuIYoQyWmH74gxyPDjFmMsNjNEDJE9VYJZ+VuKBj
         SOSBNNRzxRkR6MfTCFKF/lTEkWyEVH9BhCQ6Qq1CZsvukzVXZOYuUSjfE7MB2RnQ095f
         j1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VL3jfDiNUYbqOELuZt5dZ3P1mshWkZMGXFgg0J+f4Qg=;
        b=3EUf57WYj/YCwOZlvkMNpbEQ2T2AcOj8mso5hil3Hx6cc7KZ82iL9Fzw0f7a3gi2WU
         Y8ZNEkCiQyopCCOBwHoMy4nzidlpojKpWoEHRz8w8TNsaGjEed4OlpfXJtdTRf1wY21W
         oDFavHADv1CcVMNcuXe4CUseEbRSc4FJnFFJ1c9ZB21EXmNhLP8adtsYktRYJ6QkqRAp
         r1SF46NvQN7p4w3WYU1Jc02QyAu/psU/b4AtsseZLrzAFJIWtsglWlc/JDycXAH6LKvu
         Oe01eXVaZoGNQeYFrZrn/+b35xoxsKS1bFd0LdcqvERbnE2EawHjuUF1nEuGGMkqg0T0
         cWIw==
X-Gm-Message-State: AFqh2koN1kq+eTyZBLlbsklL4rjs0u0UQlCES02YQ0F4aNSmtzVIOts0
	ONcPh9ssE+ko8DQ+2XRltu8=
X-Google-Smtp-Source: AMrXdXsPP2m+OTQBykqALpdCEv2sU9yIgaVoNx24f2Dv27Y0z1oh6SHNAuEylft9mxjswOnYbylfWg==
X-Received: by 2002:a05:6402:2202:b0:48e:bb08:c96 with SMTP id cq2-20020a056402220200b0048ebb080c96mr20115152edb.28.1673269320300;
        Mon, 09 Jan 2023 05:02:00 -0800 (PST)
Message-ID: <7abe43df7db5a7ec969cca9ec360c0de6fbf523d.camel@gmail.com>
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Bobby Eshleman
	 <bobbyeshleman@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
Date: Mon, 09 Jan 2023 15:01:57 +0200
In-Reply-To: <320cc1b3-f03f-ad87-205f-d3c5db446f7d@citrix.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
	 <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
	 <Y6FUy/F0mbrvRP3e@bullseye>
	 <320cc1b3-f03f-ad87-205f-d3c5db446f7d@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-06 at 17:16 +0000, Andrew Cooper wrote:
> On 20/12/2022 6:23 am, Bobby Eshleman wrote:
> > On Fri, Jan 06, 2023 at 03:14:25PM +0200, Oleksii Kurochko wrote:
> > > The patch introduce sbi_putchar() SBI call which is necessary
> > > to implement initial early_printk
> > >=20
> > I think that it might be wise to start off with an alternative to
> > sbi_putchar() since it is already planned for deprecation. I
> > realize
> > that this will require rework, but it is almost guaranteed that
> > early_printk() will break on future SBI implementations if using
> > this
> > SBI call. IIRC, Xen/ARM's early printk looked like a reasonable
> > analogy
> > for how it could work on RISC-V, IMHO.
>=20
> Hmm, we're using it as a stopgap right now in CI so we can break
> "upstream RISC-V support" into manageable chunks.
>=20
> So perhaps we want to forgo plumbing sbi_putchar() into
> early_printk()=C2=A0
> (to avoid giving the impression that this will stay around in the
> future) and use sbi_putchar() directly for the hello world print.
>=20
> Next, we focus on getting the real uart driver working along with
> real
> printk (rather than focusing on exceptions which was going to be the
> next task), and we can drop sbi_putchar() entirely.
>=20
> Thoughts?
>=20
I think it would be better to remain it as it is done now and add TODO
comment "TODO: rewrite early_printk() to use uart directly as
sbi_putchar() is already planned for deprecation" and update the commit
message too.
After real uart will be ready it will be easy to remove sbi_putchar()
and do something similar to ARM early printk implementation.
> ~Andrew


