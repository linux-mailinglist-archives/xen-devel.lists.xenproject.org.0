Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B69F29F1B1
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 17:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14339.35457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYAwP-0006IU-1q; Thu, 29 Oct 2020 16:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14339.35457; Thu, 29 Oct 2020 16:38:21 +0000
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
	id 1kYAwO-0006I5-Ul; Thu, 29 Oct 2020 16:38:20 +0000
Received: by outflank-mailman (input) for mailman id 14339;
 Thu, 29 Oct 2020 16:38:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYAwN-0006I0-3Z
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:38:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b31470ea-f733-4d8d-95d2-6e258bb94a65;
 Thu, 29 Oct 2020 16:38:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5D74AB98;
 Thu, 29 Oct 2020 16:38:16 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYAwN-0006I0-3Z
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:38:19 +0000
X-Inumbo-ID: b31470ea-f733-4d8d-95d2-6e258bb94a65
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b31470ea-f733-4d8d-95d2-6e258bb94a65;
	Thu, 29 Oct 2020 16:38:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603989496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Cfzj/gXh0YLmbTsJHNVVlTFt8gFMdLegExytjwGpww=;
	b=CFmrUdSdEyAq6gRgMTIdkbmmvT/dci+kp5+aBrRVrzYmzEpSvuLIbla5PZe4HFkI6hnNWD
	MBZHYly2x/3/ITq8RMQLXO+c1Oji9ZSIl3bK/21mIPTfqhTtwAii0Tn8IPTorXvleN2psV
	BM1Kl/sjOrh0cvICNdF8JONipuAawic=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B5D74AB98;
	Thu, 29 Oct 2020 16:38:16 +0000 (UTC)
Subject: Re: [PATCH] x86/hvm: process softirq while saving/loading entries
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201029152054.28635-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab7f64a2-2ea8-0445-7266-c60e58a49a85@suse.com>
Date: Thu, 29 Oct 2020 17:38:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201029152054.28635-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.10.2020 16:20, Roger Pau Monne wrote:
> On slow systems with sync_console saving or loading the context of big
> guests can cause the watchdog to trigger. Fix this by adding a couple
> of process_pending_softirqs.

Which raises the question in how far this is then also a problem
for the caller of the underlying hypercall. IOW I wonder whether
instead we need to make use of continuations here. Nevertheless
...

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

