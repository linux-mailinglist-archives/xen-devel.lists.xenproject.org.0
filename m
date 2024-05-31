Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B2F8D56BF
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 02:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733142.1139237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCprG-0004en-Gf; Fri, 31 May 2024 00:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733142.1139237; Fri, 31 May 2024 00:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCprG-0004ce-Df; Fri, 31 May 2024 00:10:58 +0000
Received: by outflank-mailman (input) for mailman id 733142;
 Fri, 31 May 2024 00:10:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8zp=NC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sCprE-0004cW-Qr
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 00:10:56 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3da61046-1ee2-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 02:10:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9D2FCCE1B96;
 Fri, 31 May 2024 00:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37A3C2BBFC;
 Fri, 31 May 2024 00:10:48 +0000 (UTC)
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
X-Inumbo-ID: 3da61046-1ee2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717114249;
	bh=zu0XXiDpdoXFuaeqYoN3SExvsNMHcQwNXY3Dk1hEiFw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AZoVeQmHhI1c29CMa9rdmO8BO54Pz3IqGRATLZOyg0KCdosBnuVIVSWFU0IDe4sLr
	 77VS783KOMmhMlm9TcFi3vZlCPpG/4dAtS9OouSFyEvIM/tzWtkK93Q2ntyrkfHaN6
	 sE86+fGD9i5Giqho5vcdehMbO6IvApq4rLBnFuP1vVcwDUy5ERrgIJ5fMVV4KlaGgJ
	 +ZPQJxV4sKbGvo+8dWp/Cq0r0oCSv10ojKYfnpzm3tgWR9TOGKS3vfuQ4w7nY5FY6z
	 ADCIIjDW4TxDDq/Uir4VmfBKehrNDmI18YA1P6acC53Ud73usXZn50pn0Gm2feLvqZ
	 EYrkrr8MMVUSg==
Date: Thu, 30 May 2024 17:10:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/3] CI: Use a debug build of Xen for the Xilinx HW
 tests
In-Reply-To: <20240529141945.41669-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405301710380.2557291@ubuntu-linux-20-04-desktop>
References: <20240529141945.41669-1-andrew.cooper3@citrix.com> <20240529141945.41669-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1953463651-1717114248=:2557291"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1953463651-1717114248=:2557291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 29 May 2024, Andrew Cooper wrote:
> ... like the other hardware tests.  This gets more value out of the testing.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/gitlab-ci/test.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index efd3ad46f08e..e96ccdfad54c 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -149,7 +149,7 @@ xilinx-smoke-dom0less-arm64-gcc:
>      - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
> -    - alpine-3.18-gcc-arm64
> +    - alpine-3.18-gcc-debug-arm64
>  
>  xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
>    extends: .xilinx-arm64
> @@ -157,7 +157,7 @@ xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
>      - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh gem-passthrough 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
> -    - alpine-3.18-gcc-arm64
> +    - alpine-3.18-gcc-debug-arm64
>  
>  adl-smoke-x86-64-gcc-debug:
>    extends: .adl-x86-64
> -- 
> 2.30.2
> 
--8323329-1953463651-1717114248=:2557291--

