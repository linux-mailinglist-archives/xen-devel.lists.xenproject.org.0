Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F03247B69D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 01:54:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250078.430686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzTQE-0004KG-BF; Tue, 21 Dec 2021 00:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250078.430686; Tue, 21 Dec 2021 00:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzTQE-0004Hz-7N; Tue, 21 Dec 2021 00:54:30 +0000
Received: by outflank-mailman (input) for mailman id 250078;
 Tue, 21 Dec 2021 00:54:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNu3=RG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mzTQC-0004Ht-Ux
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 00:54:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c101334-61f8-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 01:54:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB72561312;
 Tue, 21 Dec 2021 00:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA9CC36AE5;
 Tue, 21 Dec 2021 00:54:25 +0000 (UTC)
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
X-Inumbo-ID: 8c101334-61f8-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640048066;
	bh=dgbaOUeuqqsjuv9beSywo5m2obZqLKj27sugTVKKYIY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dRBHrZ8PF1p3jSNZWgu3cbpEhz6z39/5LlvNDqWA7001zAvvBmThXtQbgMJ/FeioF
	 rgRnhxidVUgLxHBej7PwwEEm+QBvRCfddN8nkZeGA6DBk24z7ug9i+L87gUi+eqRxg
	 baMsJc8EX01GyI2YLCzMVMOeqnPcoSNgqUgQEM1Tez4BFBVwq8vcoUuaV+D+RJoCJh
	 pbTDlO1Oezpu2Yp/W7bdVLXYdJJ1Z8PmtYSnOIxhuo64PcX0tFC6gBxHkym8FTPKdO
	 kb2omg8xQ61z04d3J93z3tZTDDC2mXS4JeaOOdTLzLX5vSl2waNcWyqHm0XEQVf9Us
	 HLkJS366s3AYQ==
Date: Mon, 20 Dec 2021 16:54:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
In-Reply-To: <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2112201653500.2060010@ubuntu-linux-20-04-desktop>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com> <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> This enumeration sets SCI type for the domain. Currently there is
> two possible options: either 'none' or 'scmi_smc'.
> 
> 'none' is the default value and it disables SCI support at all.
> 
> 'scmi_smc' enables access to the Firmware from the domains using SCMI
> protocol and SMC as transport.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>  docs/man/xl.cfg.5.pod.in         | 22 ++++++++++++++++++++++
>  tools/include/libxl.h            |  5 +++++
>  tools/libs/light/libxl_types.idl |  6 ++++++
>  tools/xl/xl_parse.c              |  9 +++++++++
>  4 files changed, 42 insertions(+)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index b98d161398..92d0593875 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1614,6 +1614,28 @@ This feature is a B<technology preview>.
>  
>  =back
>  
> +=item B<sci="STRING">
> +
> +B<Arm only> Set SCI type for the guest. SCI is System Control Protocol -
> +allows domain to manage various functions that are provided by HW platform.
> +
> +=over 4
> +
> +=item B<none>
> +
> +Don't allow guest to use SCI if present on the platform. This is the default
> +value.
> +
> +=item B<scmi_smc>
> +
> +Enables SCMI-SMC support for the guest. SCMI is System Control Management
> +Inferface - allows domain to manage various functions that are provided by HW
> +platform, such as clocks, resets and power-domains. Xen will mediate access to
> +clocks, power-domains and resets between Domains and ATF. Disabled by default.
> +SMC is used as transport.

Would it make sense to actually enable SCMI-SMC support for the guest by
default if the guest has any devices directly assigned?

