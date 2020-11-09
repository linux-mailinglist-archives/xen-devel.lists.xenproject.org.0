Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288CA2AC116
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 17:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22740.49157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcADl-00026L-Bw; Mon, 09 Nov 2020 16:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22740.49157; Mon, 09 Nov 2020 16:40:45 +0000
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
	id 1kcADl-00025x-8o; Mon, 09 Nov 2020 16:40:45 +0000
Received: by outflank-mailman (input) for mailman id 22740;
 Mon, 09 Nov 2020 16:40:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcADj-00025o-52
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 16:40:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9afd9b1e-6cc2-4d20-8141-d35fd72f0d64;
 Mon, 09 Nov 2020 16:40:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2ADF7ACF1;
 Mon,  9 Nov 2020 16:40:41 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcADj-00025o-52
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 16:40:43 +0000
X-Inumbo-ID: 9afd9b1e-6cc2-4d20-8141-d35fd72f0d64
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9afd9b1e-6cc2-4d20-8141-d35fd72f0d64;
	Mon, 09 Nov 2020 16:40:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604940041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3aNMIrVfZWlG53c/2LnwOwCn4F3/iAvTdqD7F2c9kWE=;
	b=kyl6PeK3jfvDHOK75Tw7BKxFO9QjgigYw/k7vPIu0gvf+xyc6IP3Tcz80IGuFxyhHa988B
	qwjhbCUhUGP7+fDBBnPgxYwubuGnE6Lc+FKm2MWNNF2Ksah64CrSmMkb9wwe3w1lEA3RWM
	XMcZ4QtJRH8CqVvKRVlr8UkflT/8JNw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2ADF7ACF1;
	Mon,  9 Nov 2020 16:40:41 +0000 (UTC)
Subject: Re: [PATCH v6 3/3] xen/evtchn: revert 52e1fc47abc3a0123
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <20201109163826.13035-1-jgross@suse.com>
 <20201109163826.13035-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5cabf9dc-6227-7985-b150-2452808496aa@suse.com>
Date: Mon, 9 Nov 2020 17:40:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109163826.13035-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.11.2020 17:38, Juergen Gross wrote:
> With the event channel lock no longer disabling interrupts commit
> 52e1fc47abc3a0123 ("evtchn/Flask: pre-allocate node on send path") can
> be reverted again.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


