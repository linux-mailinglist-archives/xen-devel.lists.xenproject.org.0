Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AF481A6CD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 19:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658225.1027331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1FU-00041Z-Tb; Wed, 20 Dec 2023 18:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658225.1027331; Wed, 20 Dec 2023 18:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1FU-0003zg-Q3; Wed, 20 Dec 2023 18:24:52 +0000
Received: by outflank-mailman (input) for mailman id 658225;
 Wed, 20 Dec 2023 18:24:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rG1FS-0003Qh-Kt
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 18:24:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e79d80e-9f65-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 19:24:49 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 27D69CE1DCD;
 Wed, 20 Dec 2023 18:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DE4C433C7;
 Wed, 20 Dec 2023 18:24:42 +0000 (UTC)
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
X-Inumbo-ID: 0e79d80e-9f65-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703096684;
	bh=3SKBk5/wfLnWWuOrHV07nyJo3tOVq5iFTAqRk+VbqPY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rDld1t4XWo6Egb4D+S9LTWlvHPZ+Apnw205V3JklmQSN0co/jdKh+bqjHyc20/8Es
	 H91CSLwGZjx841TiJICIo4LNWdPLh7e6s++Sm5CUOANSBKm+K0ix4w+1vsLatirmIX
	 JI9CC8SkSVWyphUrDM6imeYWD7ej+dtkeUY9lTtthhTdD4oflK7OJrViHue7lBaSsH
	 VTxqazmQhfvxGo7Y2I1g3dpin1cgR8D9Y33RY/g8E+yr6MxM4jBdy7xjQlzH674kV/
	 ZAE4LND0Nh7Z3OHa1nny8Z8AM1AqY/bJjyJhTM+1nkkvEw3JRqQSTpo3xKDs+4HaJR
	 kxdxobsPP7mKw==
Date: Wed, 20 Dec 2023 10:24:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] docs/misra: exclude files inherited from ACPI CA
 from MISRA compliance
In-Reply-To: <2a6df4ecd1cbcd14e3eb462eed0e1a73670ed762.1703067901.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312201014050.685950@ubuntu-linux-20-04-desktop>
References: <2a6df4ecd1cbcd14e3eb462eed0e1a73670ed762.1703067901.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Dec 2023, Nicola Vetrini wrote:
> The files under 'include/acpi/ac*.h' and 'include/acpi/plaform/ac*.h'
> are inherited from Linux and ACPI CA, therefore they are not subject to
> MISRA compliance at the moment.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

