Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A64B099CF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 04:32:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047790.1418153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucatU-0001eT-QB; Fri, 18 Jul 2025 02:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047790.1418153; Fri, 18 Jul 2025 02:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucatU-0001c1-Ng; Fri, 18 Jul 2025 02:32:16 +0000
Received: by outflank-mailman (input) for mailman id 1047790;
 Fri, 18 Jul 2025 02:32:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucatU-0001bv-6v
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 02:32:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 679c4eb2-637f-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 04:32:10 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1431D613F9;
 Fri, 18 Jul 2025 02:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E87FC4CEF5;
 Fri, 18 Jul 2025 02:32:08 +0000 (UTC)
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
X-Inumbo-ID: 679c4eb2-637f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752805928;
	bh=xNCDdBY2tMiQoEqH8WJfByMN4EfXGCbP+S9+miUVhEs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Lgmg+IaU+/baFWBd0/4a3GcEyUqFFd1m79XgB7Dh1vkJPGvdTUtxrn/WIaKarMTRt
	 T4vJPMUQIauWoS1f09TwV+2xDlOf1tOGW+DJ5idxlKnQsnerHUsFiAGEw8EopqgwE+
	 o61VXGRBkEuwZ9UewIbm7CdJ3RuoEYkyWzV9fUupYBmfdjmrF7RiSSSzE81hkuRcAE
	 3PIcs52SXXpaLeK13/hq/TOg3Ke7CszUXvCwO6pxuD5WqFXVd+DDXStxi8oQukfN3h
	 wj97rvzUAgepgaEyKyPfd6b2xhw8KZANVfmXs14l4FCMVI20PgPRuQCZ6/Ym4ASkJi
	 qRzZOoqhTsX6A==
Date: Thu, 17 Jul 2025 19:32:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2 17/17] tools/init-dom0less: Continue on error
In-Reply-To: <20250716211504.291104-18-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507171931260.15546@ubuntu-linux-20-04-desktop>
References: <20250716211504.291104-1-jason.andryuk@amd.com> <20250716211504.291104-18-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, Jason Andryuk wrote:
> An error on one domain doesn't apply to others.  Continue the loop over
> all domains if init_domain() fails.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  tools/helpers/init-dom0less.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> index 4336e0f418..bd213c5ccd 100644
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-dom0less.c
> @@ -377,7 +377,6 @@ int main(int argc, char **argv)
>          rc = init_domain(xsh, xch, xfh, &info[i]);
>          if (rc < 0) {
>              fprintf(stderr, "init_domain failed.\n");
> -            goto out;
 
init_domain doesn't always return < 0 on error

That said, this change is still good.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

