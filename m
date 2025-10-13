Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F72CBD2E4C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 14:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142318.1476506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8HG1-00019a-8c; Mon, 13 Oct 2025 12:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142318.1476506; Mon, 13 Oct 2025 12:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8HG1-00017A-65; Mon, 13 Oct 2025 12:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1142318;
 Mon, 13 Oct 2025 12:02:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gpU8=4W=linux.dev=thorsten.blum@srs-se1.protection.inumbo.net>)
 id 1v8HFz-000174-D3
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 12:02:27 +0000
Received: from out-186.mta0.migadu.com (unknown [91.218.175.186])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 775dc2f5-a82c-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 14:02:19 +0200 (CEST)
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
X-Inumbo-ID: 775dc2f5-a82c-11f0-980a-7dc792cee155
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760356937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHboIQv6refupr1G8jO/PDidwtSpxE+8ysLOORDABVQ=;
	b=iF1vJsmkXSUxP04f5R/FFr3Y/a8MD76OVbhONUWNa7ZNO6+0+b74fNBRuagGl3K1Pvahkr
	XTCT2IRMsqTEchHDlq4Bsd1OnOotdf18gikEaDlXqcGXTFCbDhlwNz25eG4YNOXLTsxF/L
	Pcf4TRi1LKOf14+w2ccQH+QkRmKrw5o=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2] drivers/xen/xenbus: Replace deprecated strcpy in
 xenbus_transaction_end
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <20251013115129.30304-2-thorsten.blum@linux.dev>
Date: Mon, 13 Oct 2025 14:02:04 +0200
Cc: linux-hardening@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <48BBD43F-50F9-4521-B636-CAC71B8DE871@linux.dev>
References: <20251013115129.30304-2-thorsten.blum@linux.dev>
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>
X-Migadu-Flow: FLOW_OUT

On 13. Oct 2025, at 13:51, Thorsten Blum wrote:
> strcpy() is deprecated; inline the read-only string instead. Fix the
> function comment and use bool instead of int while we're at it.
>=20
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

I forgot to add:

Changes in v2:
- Use an inline ternary expression and remove 'char abortstr[2]' as
suggested by J=C3=BCrgen
- Link to v1: =
https://lore.kernel.org/lkml/20251012195514.39003-2-thorsten.blum@linux.de=
v/


