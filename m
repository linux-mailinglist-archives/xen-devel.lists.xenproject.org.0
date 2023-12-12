Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0266380E0EE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 02:39:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652597.1018536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrkK-0007RX-Cd; Tue, 12 Dec 2023 01:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652597.1018536; Tue, 12 Dec 2023 01:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrkK-0007OX-9D; Tue, 12 Dec 2023 01:39:40 +0000
Received: by outflank-mailman (input) for mailman id 652597;
 Tue, 12 Dec 2023 01:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rCrkJ-0007OR-4Q
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 01:39:39 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee053b8-988f-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 02:39:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3F707CE1742;
 Tue, 12 Dec 2023 01:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53759C433C7;
 Tue, 12 Dec 2023 01:39:32 +0000 (UTC)
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
X-Inumbo-ID: 4ee053b8-988f-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702345173;
	bh=RXVSpXUPw+eFhiMlhTi5bs9yukcQYx3OpUDlAW3GCzQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nLO5J/wlju2oRAZIevr7CIkd9p4ZPTdQG0cJQiwl+uTNNW8DE3aCO4ocn6SlBOlW2
	 zwude6ubUbWQgks7PWa0pM/OziMRXoBVgDms0kmX+P9+WDL8uM8NQ1bIwKByJqKo3B
	 M7tPMYtiLn1+eAmn2QZA4KMMPtyRlA5Inu4duT/MlKqNjKQ0b1f8Z598aDbK6o2Po9
	 Fjk91tTeu58vOUT3uRzoQMi+LtILBTJnZMAA/NYLNmnbTD/9MnnDtwVkVCD1PRTavK
	 cyxKrz96MIcmllvWdt9whL6fhTxynqBU120cd/VN82BJJNDbZK/SxCu3zb3qDGDI1m
	 MhXu8dpA0rP1w==
Date: Mon, 11 Dec 2023 17:39:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/7] xen/shutdown: address MISRA C:2012 Rule 2.1
In-Reply-To: <c0a8a12e39d688e101936d221af0f8eeefabe352.1702283415.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312111739250.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com> <c0a8a12e39d688e101936d221af0f8eeefabe352.1702283415.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Dec 2023, Nicola Vetrini wrote:
> Given that 'hwdom_shutdown' is a noreturn function, unreachable
> breaks can be eliminated to resolve violations of Rule 2.1.
> On the occasion, the type of its parameter is changed to uint8_t.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

