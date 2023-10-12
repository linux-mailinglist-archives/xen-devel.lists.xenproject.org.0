Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA557C7A9B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 01:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616216.958075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr5RE-0007KX-Du; Thu, 12 Oct 2023 23:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616216.958075; Thu, 12 Oct 2023 23:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr5RE-0007H1-BE; Thu, 12 Oct 2023 23:49:56 +0000
Received: by outflank-mailman (input) for mailman id 616216;
 Thu, 12 Oct 2023 23:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr5RC-00079w-OA
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 23:49:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a25bbcd-695a-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 01:49:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D46361F6F;
 Thu, 12 Oct 2023 23:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E87C433C7;
 Thu, 12 Oct 2023 23:49:51 +0000 (UTC)
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
X-Inumbo-ID: 0a25bbcd-695a-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697154592;
	bh=a/3QuTQO4MPlb3nMrHAT/lW56mp/adUTxrArKbcL3No=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m64uFJZ55sRUWzdZndgCFWG1+J+UXSk5Jes9tuo8J6SDA8giaMJ2a2hFm6jUdZC01
	 wWOkPxy5UFMkBBXHvnhCepV1JgsETI+wwG0hOlkH8ZW1fK9UibwlHywuH1rQfj9Vm5
	 vSri0HwxcK5LIWGeUhnk+C//q7JJbgLwRfBVCqNadHHrebqeYEfQ8uk677F7Tz50cU
	 lo8TSZiNOoeenuaxL5ekepdi1bwBao67zij+y0ST8NddvRxToaeRKIt40XUYmB4zv+
	 Kev/yGc62WQQLmQXdcoww8zHyv2UWBX8e8fN6fYnVdtemzxJMPBDvdn5RLvc0/XsWy
	 GoUm5xLoBpn3g==
Date: Thu, 12 Oct 2023 16:49:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Paul Durrant <paul@xen.org>
Subject: Re: [XEN PATCH][for-4.19 2/2] xen/iommu: use LOWEST_BIT to wrap a
 violation of Rule 10.1
In-Reply-To: <26399294316ff7f468c05d7e8a8433227afb3177.1697125949.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310121649370.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1697125949.git.nicola.vetrini@bugseng.com> <26399294316ff7f468c05d7e8a8433227afb3177.1697125949.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Oct 2023, Nicola Vetrini wrote:
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

