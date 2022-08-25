Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06925A169D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 18:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393529.632546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRFdC-0006u1-P2; Thu, 25 Aug 2022 16:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393529.632546; Thu, 25 Aug 2022 16:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRFdC-0006rd-Lp; Thu, 25 Aug 2022 16:22:58 +0000
Received: by outflank-mailman (input) for mailman id 393529;
 Thu, 25 Aug 2022 16:22:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iKVJ=Y5=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oRFdC-0006rX-2f
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 16:22:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d471050-2492-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 18:22:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 975B161828;
 Thu, 25 Aug 2022 16:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B726C433D6;
 Thu, 25 Aug 2022 16:22:54 +0000 (UTC)
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
X-Inumbo-ID: 2d471050-2492-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661444575;
	bh=EjI4+VNhnr0SQiEvNEQ7VCRCiI+uNu1bxaC7anwph6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vEVcG5o/4x2ldnFxAZQNsybfdDBVhCILEevxTjSmgRCql8FsoU58VT2+CM4GgB3J6
	 aXRPBja8+vMqtB3fNlqFfMY1+LVjiEsFhNhIe+4hPWv/VqaFgHOH8hfYUvz/nE840o
	 E/LBkDQSBzYc1savkk2y6ThG9OgFtNAO+UO5qeT3reeD2VipGg7/iFCz6ZKJz0NDnG
	 tqv66JXVEJdvc8BEVSLvMuxyLpSmoj40hOrSpH/GDHXqEYbKEvdJQYsgZif2CC7/ch
	 ywpDjXfc+C4IwbupX/RHTtRMDL3f6uiaKimxE7SHGR6+Kf3ycWqf0I/abBlN+ZvsHZ
	 VowNk3HlYpVpQ==
From: SeongJae Park <sj@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: SeongJae Park <sj@kernel.org>,
	roger.pau@citrix.com,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Xen developer discussion" <xen-devel@lists.xenproject.org>,
	"SeongJae Park" <sjpark@amazon.com>,
	"Maximilian Heyne" <mheyne@amazon.de>
Subject: =?UTF-8?q?Re=3A=20=E2=80=9CBackend=20has=20not=20unmapped=20grant=E2=80=9D=20errors?=
Date: Thu, 25 Aug 2022 16:22:52 +0000
Message-Id: <20220825162252.94991-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <70d931c9-2c3c-40f5-4e93-93a1aba1b76c@suse.com>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Juergen,


Thank you for the quick and nice reply!

On Thu, 25 Aug 2022 08:20:33 +0200 Juergen Gross <jgross@suse.com> wrote:

> 
[...]
> 
> Could you please send it as two proper patches (one for each driver) with
> the correct "Fixes:" tags?

Sure, just posted:
https://lore.kernel.org/xen-devel/20220825161511.94922-2-sj@kernel.org/


Thanks,
SJ

> 
> 
> Juergen

