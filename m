Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D168D7EDF13
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 12:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634118.989373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3a9j-0003gD-N4; Thu, 16 Nov 2023 11:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634118.989373; Thu, 16 Nov 2023 11:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3a9j-0003dT-Jl; Thu, 16 Nov 2023 11:03:31 +0000
Received: by outflank-mailman (input) for mailman id 634118;
 Thu, 16 Nov 2023 11:03:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3a9i-0003dN-So
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 11:03:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3a9h-0003HB-7P; Thu, 16 Nov 2023 11:03:29 +0000
Received: from [15.248.3.7] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3a9h-0001bE-1N; Thu, 16 Nov 2023 11:03:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=7qCErnfExrAX/B1MOnPKMeoyiIIKF9jWJ+6CqwtwEFc=; b=z6Iabcy4gbXq2bqyzpB2Xkf2SK
	pJ6DhFJ3SdlepKwg+t8O1GNIseT3gJ1BVJ7KBUfc8W54hDn21qVLZlR19X/T+E10zsDByIeHpEicO
	H3w0yWSamLL2PgRMXO71bw2qjXfL0mvJc3SIsgOGWzyBH+6u6QSaFQQP31tJ01IxYVrE=;
Message-ID: <d4778dd4-8b7b-470b-adaa-ab5e7c36f097@xen.org>
Date: Thu, 16 Nov 2023 11:03:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 4.18 vs mini-os
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <9202e48c-d2fe-4474-abd5-3110b805cf89@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9202e48c-d2fe-4474-abd5-3110b805cf89@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+ Juergen

On 16/11/2023 07:52, Jan Beulich wrote:
> All,

Hi Jan,

> may I ask on what basis the xen-RELEASE-4.18.0 tag placement was chosen?
> It matches the 4.17 ones, despite there having been new commits from
> Jürgen dating back to January / February. (My own build fix would have
> been nice to have, too, but I can see how that came late.)

Before the tagging, the last time we updated to MINIOS_UPSTREAM_COMMIT 
was in July 2022 (see below).

When I prepare the release, I don't have steps to check this is the 
latest Mini-OS. Instead, I use the commit in the tag.

I believe this is the responsibility of whoever decide to add a commit 
in Mini-OS to also make sure Config.mk is updated accordingly.

Anyway, we never tested Xen 4.18 (even before RC) with the new Mini-OS. 
So I don't think it is sensible to update it at this stage of the 
release. But I would suggest to send a patch to update Config.mk so the 
problem doesn't re-occur for 4.19.

Cheers,

commit 980bfb1ac9247e95790e283dbc03e231e02cced9
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Jul 8 09:42:27 2022 +0200

     Config.mk: use newest Mini-OS commit

     Switch to use the newest Mini-OS commit in order to get the recent
     fixes.

     Signed-off-by: Juergen Gross <jgross@suse.com>
     Acked-by: Jan Beulich <jbeulich@suse.com>

diff --git a/Config.mk b/Config.mk
index a806ef0afb..e56844d964 100644
--- a/Config.mk
+++ b/Config.mk
@@ -230,7 +230,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
  endif
  OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
  QEMU_UPSTREAM_REVISION ?= master
-MINIOS_UPSTREAM_REVISION ?= 83ff43bff4bdd6879539fcb2b3d6ba5e61a64135
+MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3

  SEABIOS_UPSTREAM_REVISION ?= rel-1.16.0

Cheers,

-- 
Julien Grall

