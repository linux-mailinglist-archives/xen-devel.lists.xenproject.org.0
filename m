Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2979DD74
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 03:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600902.936726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgETk-0006Rx-JI; Wed, 13 Sep 2023 01:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600902.936726; Wed, 13 Sep 2023 01:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgETk-0006P2-Gj; Wed, 13 Sep 2023 01:15:40 +0000
Received: by outflank-mailman (input) for mailman id 600902;
 Wed, 13 Sep 2023 01:15:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgETi-0006Ov-VH
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 01:15:38 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b9a1a21-51d3-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 03:15:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B815AB81E16;
 Wed, 13 Sep 2023 01:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55459C433C7;
 Wed, 13 Sep 2023 01:15:34 +0000 (UTC)
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
X-Inumbo-ID: 0b9a1a21-51d3-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694567735;
	bh=mbI3rxX23vB6aNPI4tOpZCvisEZvVv//Qhz0UcPdPoU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CS+32FgxjsrPwWWXmnkaUZAOva5X4+U6NDk9OXmTjKeYJoGTOHJ8KD5xGfd5ETC3s
	 aPaVPTDSuw3BMt9GGyDqEjnsPgwA5rX5OjK7tbJOQkX+0PBEO+FRuIVDLFjfiKQB3E
	 6BfNbevtH24bRIhV7zgb+cezunzsnKK0x1I7IUYgEvbMM1mCVGKUTW/57kzklZqgLw
	 PsVRJMFcA/vEX/arGTi3gjBTTPDT8x/6AYexxThV1Kwsix07jV2CFN3I4f6jxSCofs
	 qG4is6f8eJGzho3SPABBmicH9Zi4qAIMFDKXNcni3CwDOxfESsw/SxwyxlgCYcJ8QV
	 iQ45d19X8VjHA==
Date: Tue, 12 Sep 2023 18:15:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 07/10] xen/common: address violations of MISRA
 C:2012 Directive 4.10
In-Reply-To: <580f202ce2b07a91b496f34dc4b300d8fb23dbc8.1694510856.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309121815150.2295162@ubuntu-linux-20-04-desktop>
References: <cover.1694510856.git.simone.ballarin@bugseng.com> <580f202ce2b07a91b496f34dc4b300d8fb23dbc8.1694510856.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Sep 2023, Simone Ballarin wrote:
> Add inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


