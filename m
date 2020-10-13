Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEDA28CF14
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 15:24:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6202.16457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKHe-00034G-MH; Tue, 13 Oct 2020 13:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6202.16457; Tue, 13 Oct 2020 13:24:06 +0000
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
	id 1kSKHe-00033f-IO; Tue, 13 Oct 2020 13:24:06 +0000
Received: by outflank-mailman (input) for mailman id 6202;
 Tue, 13 Oct 2020 13:24:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSKHd-00033N-6O
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:24:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8966304-3780-43c2-b3d1-906064a9add9;
 Tue, 13 Oct 2020 13:24:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 710B9B2F6;
 Tue, 13 Oct 2020 13:24:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSKHd-00033N-6O
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:24:05 +0000
X-Inumbo-ID: b8966304-3780-43c2-b3d1-906064a9add9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b8966304-3780-43c2-b3d1-906064a9add9;
	Tue, 13 Oct 2020 13:24:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602595443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tg4ogB+O6v36HtBcabX2efN40YqLQan2oe3KO/rXuQk=;
	b=HGDmB/6lJ38yzY76p7UrBWezFg9alGGczMJmPpw3Bh3b6Xambaq07blIUDP40UKjP1nTlP
	w4JNYQJqHBxNIeCPXumy1BpeL5kvTUrnH1gV5UROSLqv33298bXhkZVGFhnze43q2yki/p
	BQODvKE8PyA9dLZl6w8gk/hXkLNuDYw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 710B9B2F6;
	Tue, 13 Oct 2020 13:24:03 +0000 (UTC)
Subject: Re: [PATCH v2 2/6] x86: reduce CET-SS related #ifdef-ary
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <d8561c46-a6df-3f64-78df-f84c649a99b4@suse.com>
 <4120e048-5314-afba-d921-9f4651a61eaa@suse.com>
 <3a2cfb6a-68cd-dbc7-c0c8-53b810b4eede@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f21084b2-7424-f519-18c1-0450f73fcf02@suse.com>
Date: Tue, 13 Oct 2020 15:24:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3a2cfb6a-68cd-dbc7-c0c8-53b810b4eede@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.2020 13:40, Andrew Cooper wrote:
> (Interestingly, zero length
> alternatives do appear to compile, and this is clearly a bug.)

Why? The replacement code may be intended to be all NOPs.

Jan

