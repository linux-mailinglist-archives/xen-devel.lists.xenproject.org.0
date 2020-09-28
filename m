Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7B327AC5D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 13:00:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqtK-0005Uv-Nf; Mon, 28 Sep 2020 11:00:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMqtI-0005Uc-SY
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 11:00:20 +0000
X-Inumbo-ID: edc434d1-1fe6-418c-a800-fea8123e2a1b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edc434d1-1fe6-418c-a800-fea8123e2a1b;
 Mon, 28 Sep 2020 11:00:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mAH7mcn+I8c4u1B7EFxsTLHZFEBEuLLXXQ/mROQ/yrA=;
 b=ShrjWvlMN6Ip19eLagVUXToTY/0OK51n5x0M+DI+7lzSGDrdYZXG/2a/IqxJj/jJnUMlS8
 jakO6ftepvMmUaTYfGv0jta5401tAzNy5Zk4FmgPMwG3W/4ErtrV8UwPk9MhQNZGgrhUq0
 AokR/cIRmiISyfddiPlGSXukxwS1f0A=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6891AAE07;
 Mon, 28 Sep 2020 11:00:19 +0000 (UTC)
Subject: [PATCH 08/12] evtchn: ECS_CLOSED => ECS_FREE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Message-ID: <eeb0f674-1eb5-85a2-70b2-42041588e3d9@suse.com>
Date: Mon, 28 Sep 2020 13:00:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There's no ECS_CLOSED; correct a comment naming it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -673,7 +673,7 @@ int evtchn_close(struct domain *d1, int
              * We can only get here if the port was closed and re-bound after
              * unlocking d1 but before locking d2 above. We could retry but
              * it is easier to return the same error as if we had seen the
-             * port in ECS_CLOSED. It must have passed through that state for
+             * port in ECS_FREE. It must have passed through that state for
              * us to end up here, so it's a valid error to return.
              */
             rc = -EINVAL;


