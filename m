Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F68292868
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 15:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8709.23332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUVP1-0006Zl-Gk; Mon, 19 Oct 2020 13:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8709.23332; Mon, 19 Oct 2020 13:40:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUVP1-0006ZM-DZ; Mon, 19 Oct 2020 13:40:43 +0000
Received: by outflank-mailman (input) for mailman id 8709;
 Mon, 19 Oct 2020 13:40:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUVP0-0006ZH-6S
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 13:40:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d76b381d-7cd2-4a15-8ffb-ff150168e3ba;
 Mon, 19 Oct 2020 13:40:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32411AFCD;
 Mon, 19 Oct 2020 13:40:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUVP0-0006ZH-6S
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 13:40:42 +0000
X-Inumbo-ID: d76b381d-7cd2-4a15-8ffb-ff150168e3ba
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d76b381d-7cd2-4a15-8ffb-ff150168e3ba;
	Mon, 19 Oct 2020 13:40:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603114840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F96zGFEWJ0bk6yCEfbveljepHQGb0tH3SrWs5zRqVF0=;
	b=EirkYcGjAFu6yJ+YZKfA7Xh+vE7hfqVbcvMsfGbhB8RMBYz+MeGIw7O0N1/ewYkOrqlOI5
	wQLPw9/voTRi9qAS6JJx276/5HrcV+qIRSujk1C/w+7gOzEveGEbhLoAPaqLzGkNpqVcMH
	qtRQnxSFh9Wx0YNA3rO9XNgecngkwcw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 32411AFCD;
	Mon, 19 Oct 2020 13:40:40 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] SVM: avoid VMSAVE in ctxt-switch-to
Message-ID: <a01862b8-6e16-5ddc-7f48-2d3bed2f34b6@suse.com>
Date: Mon, 19 Oct 2020 15:40:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Of the state saved by the insn and reloaded by the corresponding VMLOAD
- TR, syscall, and sysenter state are invariant while having Xen's state
  loaded,
- FS, GS, and LDTR are not used by Xen and get suitably set in PV
  context switch code.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -984,7 +984,6 @@ static void svm_ctxt_switch_to(struct vc
 
     svm_restore_dr(v);
 
-    svm_vmsave_pa(per_cpu(host_vmcb, cpu));
     vmcb->cleanbits.raw = 0;
     svm_tsc_ratio_load(v);
 

