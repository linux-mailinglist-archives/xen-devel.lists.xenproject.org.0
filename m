Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B9470501D
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535212.832866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyvDg-0005Nw-As; Tue, 16 May 2023 14:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535212.832866; Tue, 16 May 2023 14:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyvDg-0005LP-7o; Tue, 16 May 2023 14:00:04 +0000
Received: by outflank-mailman (input) for mailman id 535212;
 Tue, 16 May 2023 14:00:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXU0=BF=kernel.org=jpoimboe@srs-se1.protection.inumbo.net>)
 id 1pyvDe-0004p0-Fl
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:00:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f27ee586-f3f1-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 16:00:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D1966389A;
 Tue, 16 May 2023 13:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7210AC433D2;
 Tue, 16 May 2023 13:59:58 +0000 (UTC)
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
X-Inumbo-ID: f27ee586-f3f1-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684245599;
	bh=RgXUB8U9LXn46MjhwEIA4Tcw8LGTx3bvjUBiOiBdWtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gU9lgSFE0CgUeEoV2RiiLXuj//7fUOLVHsZIboBuaF10dHQ8x3sHDq0+45y3M8YfA
	 EPHQGYyALRn+EfVIoOfEPiP0It1LWQORSRWEEQiQ5SB2/glfuF3BLUvwINCPa2VsNo
	 NmDodr14LZhbaLcyU2EHBc/QE09ZKNkWzwahw8gvH4QJ3lxyCciFgRnO5gOMK8osJm
	 nq6xT+pZVajU2Acheh9PE9j8Nhf1qciFsEEANVeylt2jBFzr5DaQV9XcTijr/EjFbG
	 8SNQd+LhxpUSI0b0mdeeMRMayImFcbnCSu+nYOMlwRP3Wzy+4HRFv8MuVff9WygS36
	 2Y9S+SCuhxJJg==
Date: Tue, 16 May 2023 06:59:56 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	=?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 0/7] x86: retbleed=stuff fixes
Message-ID: <20230516135956.35bnxekprirnv2fc@treble>
References: <20230116142533.905102512@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230116142533.905102512@infradead.org>

On Mon, Jan 16, 2023 at 03:25:33PM +0100, Peter Zijlstra wrote:
> Hi all,
> 
> Patches to address the various callthunk fails reported by Joan.
> 
> The first two patches are new (and I've temporarily dropped the
> restore_processor_state sealing).
> 
> It is my understanding that AP bringup will always use the 16bit trampoline
> path, if this is not the case, please holler.

Ping?

-- 
Josh

