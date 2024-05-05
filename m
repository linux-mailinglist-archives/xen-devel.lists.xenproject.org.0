Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A598BC46C
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 00:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717139.1119078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3k6V-0006bK-8f; Sun, 05 May 2024 22:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717139.1119078; Sun, 05 May 2024 22:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3k6V-0006YD-36; Sun, 05 May 2024 22:13:07 +0000
Received: by outflank-mailman (input) for mailman id 717139;
 Sun, 05 May 2024 22:13:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F67X=MI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1s3k6T-0006Y7-VP
 for xen-devel@lists.xenproject.org; Sun, 05 May 2024 22:13:06 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2994a59-0b2c-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 00:13:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D00728285375;
 Sun,  5 May 2024 17:12:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pbSFnbYpwGOm; Sun,  5 May 2024 17:12:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0BDAE8285609;
 Sun,  5 May 2024 17:12:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5QPnu0esl4hU; Sun,  5 May 2024 17:12:58 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 7E8DD8285375;
 Sun,  5 May 2024 17:12:58 -0500 (CDT)
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
X-Inumbo-ID: a2994a59-0b2c-11ef-909c-e314d9c70b13
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0BDAE8285609
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1714947179; bh=O29LkBtMJH19pAXLgx1JTabdFZARX87JoGWKXY6FNKk=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=beP/xJkl+Bq66svUq/KnsnuckbhTdELmzYXz9mcNxluO/F1IdwRAH8lOOun5QqBOO
	 0z3YkQQroNJ2IJSjDZexZ2+iW7ylJ2hIxaKLXCuFRZiDNZlCiRLKQPrNMwiK1vd+N7
	 FnQYofFcM8MS43whBXR2vOKk9M3rDjxiUXbRik4k=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <212940fc-4e3f-4763-934f-c8306d44ad7e@raptorengineering.com>
Date: Sun, 5 May 2024 17:12:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] ppc/riscv: fix arch_acquire_resource_check()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240430153423.80875-1-roger.pau@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240430153423.80875-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Roger,

On 4/30/24 10:34 AM, Roger Pau Monne wrote:
> None of the implementations support set_foreign_p2m_entry() yet, neithe=
r they
> have a p2m walk in domain_relinquish_resources() in order to remove the=
 foreign
> mappings from the p2m and thus drop the extra refcounts.
>=20
> Adjust the arch helpers to return false and introduce a comment that cl=
early
> states it is not only taking extra refcounts that's needed, but also dr=
opping
> them on domain teardown.
>=20
> Fixes: 4988704e00d8 ('xen/riscv: introduce p2m.h')
> Fixes: 4a2f68f90930 ('xen/ppc: Define minimal stub headers required for=
 full build')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---

This makes sense to me. This stub implementation was definitely an
oversight on my part.

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

