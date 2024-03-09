Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AF6876E90
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 02:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690448.1076457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilXL-0001hP-RB; Sat, 09 Mar 2024 01:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690448.1076457; Sat, 09 Mar 2024 01:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilXL-0001eY-Na; Sat, 09 Mar 2024 01:30:07 +0000
Received: by outflank-mailman (input) for mailman id 690448;
 Sat, 09 Mar 2024 01:30:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VWqy=KP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rilXK-0001ZQ-JL
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 01:30:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8db01e72-ddb4-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 02:30:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 04969CE2A37;
 Sat,  9 Mar 2024 01:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765D0C433F1;
 Sat,  9 Mar 2024 01:30:00 +0000 (UTC)
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
X-Inumbo-ID: 8db01e72-ddb4-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709947802;
	bh=N4Zlr2YBEF2Zmj+/2VFqqlC0xz7Y3kl8JtrrJtLq/F4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Iwy3tPn5X0OLKe2t3V7y1g2S8w+4jbozuYSTx0H8cFhitQtqCHg4LzmsejFNJtJZY
	 MpmRqlxHI8dCMGNzsjdPI+xKRVn1cfTR1TYIVtDq/IQiwuf+mF4hUiG0B6T4vUFcXO
	 nA6fT1iMcQOD05NxjUgTC5DjLq/ZanqB1PNw41+U3NVwkqR55cssY1dbTykH7yJAi5
	 k6ASLy7d8m0hII6DsUaKlbtjsi7OLl3OheJJjkePg5/JxQCA0AUEgnzAsn52L/94+K
	 mc5fPx8zhn/IAusyaRVePf2WYXM2qJPKgWDY6JB8VeUVZc+kaQ6smZaURB12WB0PY8
	 +/sc7UfLApGGw==
Date: Fri, 8 Mar 2024 17:29:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 3/7] xen/list: address violations of MISRA C Rule
 20.7
In-Reply-To: <b93a64b93ef4210f5fe96368c2522e5e71e9c87c.1709896401.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403081729470.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com> <b93a64b93ef4210f5fe96368c2522e5e71e9c87c.1709896401.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Mar 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


