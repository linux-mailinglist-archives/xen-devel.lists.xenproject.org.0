Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B9C67A740
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 00:54:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483783.750158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKT73-0005DJ-1d; Tue, 24 Jan 2023 23:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483783.750158; Tue, 24 Jan 2023 23:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKT72-0005BW-V4; Tue, 24 Jan 2023 23:54:00 +0000
Received: by outflank-mailman (input) for mailman id 483783;
 Tue, 24 Jan 2023 23:54:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wk+X=5V=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKT72-0005BO-88
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 23:54:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e24ee1c-9c42-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 00:53:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 891B661014;
 Tue, 24 Jan 2023 23:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B8CC433D2;
 Tue, 24 Jan 2023 23:53:56 +0000 (UTC)
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
X-Inumbo-ID: 5e24ee1c-9c42-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674604436;
	bh=ZMmOyANc1PW2IMYFXQWjo4aOEGKdzzO7BIAZeYh+vc0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ubHmsD4a6TKoRVGtI1ZI1X3ogYXhxXCrEBubqh3EDBqL9bFWOiOJmfRdvqELu/o89
	 xDkmf1LGko1TNY2O2wnf+Iz9LpEofhsrl+RFdTMqcnvgsTZ8nHgg2XqCy9NdgJt5XO
	 scRSefg188vPdvr2QsdUcqiDSV+JdZkWnvkwzfLsr+x6Mr6Vcr7kdrRAaa6F/q2cyN
	 0B6ZQlclrlCL8eimIUTyKrPfX1XpsQkptU1/mcHZMadOhJNNtVrvt2HOkC2N9fU1Ui
	 a6MQRWDLXBpMQRPDatpkX34hMj59QFUK5ZQwTmlbL/s4uv+caU8nhURoHuGsBAHDfz
	 C2nJBExrgSzoA==
Date: Tue, 24 Jan 2023 15:53:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Gianluca Guida <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 14/14] automation: add smoke test to verify macros
 from bug.h
In-Reply-To: <4ce72535e44f49e82ad23f4e7dc004a67344b823.1674226563.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2301241553220.1978264@ubuntu-linux-20-04-desktop>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com> <4ce72535e44f49e82ad23f4e7dc004a67344b823.1674226563.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jan 2023, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I think you should remove the old greps. This script is part of the Xen
repository and in-sync with the codebase, so it is OK to only keep the
most recent version of the grep string.

> ---
>  automation/scripts/qemu-smoke-riscv64.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> index e0f06360bc..e7cc7f1442 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -17,4 +17,6 @@ qemu-system-riscv64 \
>  
>  set -e
>  (grep -q "Hello from C env" smoke.serial) || exit 1
> +(grep -q "run_in_exception_handler is most likely working" smoke.serial) || exit 1
> +(grep -q "WARN is most likely working" smoke.serial) || exit 1
>  exit 0
> -- 
> 2.39.0
> 

