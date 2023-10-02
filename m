Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0117B5D36
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 00:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611807.951392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRXs-0005PL-N5; Mon, 02 Oct 2023 22:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611807.951392; Mon, 02 Oct 2023 22:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRXs-0005NP-KI; Mon, 02 Oct 2023 22:37:44 +0000
Received: by outflank-mailman (input) for mailman id 611807;
 Mon, 02 Oct 2023 22:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRXq-0005NF-Sd
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 22:37:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c46f88c-6174-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 00:37:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 57CBDB81691;
 Mon,  2 Oct 2023 22:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355D5C433C7;
 Mon,  2 Oct 2023 22:37:39 +0000 (UTC)
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
X-Inumbo-ID: 4c46f88c-6174-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696286260;
	bh=1e9kar+4sge4W4drjOG96MrtQK7wtnCpFMz6BdlzIsY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gn0hfaE30Or/Ek4Td+rFWvGKHSt5r4k5ddW7ouyyTHQMrgAlh372zzvoFQpJh2Eh8
	 6ce4LwYU6Nz/Zp22Hk7Kpi/yM72p2cwT8sqndtD0DEb4GaOqEEzRO97vvuMSg2rY1A
	 aewE0hsDoMLxY4yeqHvQtyYvE+kBBQKFOhAzLXh0wi16Wavp3+fzKitdKIYn5DoQ2H
	 Yg3jzm80j6CeVLUOnNVBBKE5SPlOAY890Z7yTpxkEFTPVTumQH6Uzs4eUlzwwE7Ahu
	 OkdqWSL8VNOrDhwvY7ZrvNPkSTf9LKqoLNM43Eu+fKEYG2b9FUKUZUuU8n7LfzxJLA
	 V30rWfGrgunYQ==
Date: Mon, 2 Oct 2023 15:37:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Henry.Wang@arm.com, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 2/7] x86: add deviations for variables only used in
 asm code
In-Reply-To: <c533d2a73151d89a910ad42b106ccd13991713db.1696232393.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310021536470.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com> <c533d2a73151d89a910ad42b106ccd13991713db.1696232393.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Oct 2023, Nicola Vetrini wrote:
> These variables are only used by asm code, and therefore
> the lack of a declaration is justified by the corresponding
> SAF comment.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

