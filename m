Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D428CFC5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6227.16550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKuI-0007OQ-Bc; Tue, 13 Oct 2020 14:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6227.16550; Tue, 13 Oct 2020 14:04:02 +0000
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
	id 1kSKuI-0007O1-8N; Tue, 13 Oct 2020 14:04:02 +0000
Received: by outflank-mailman (input) for mailman id 6227;
 Tue, 13 Oct 2020 14:04:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSKuH-0007Nw-A3
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:04:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65cb9423-5efa-4b64-bc24-df7fb6ed62d0;
 Tue, 13 Oct 2020 14:04:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB98DAC2F;
 Tue, 13 Oct 2020 14:03:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSKuH-0007Nw-A3
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:04:01 +0000
X-Inumbo-ID: 65cb9423-5efa-4b64-bc24-df7fb6ed62d0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 65cb9423-5efa-4b64-bc24-df7fb6ed62d0;
	Tue, 13 Oct 2020 14:04:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602597839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xGGF/KIIYFeZDMZNq0z7ds2K46CBuGaxaLzBLu3vtJQ=;
	b=hVkyavPPQQkIjnvenVxmRsDRObNJciGiTq0PqPoLA330zMJFlpYwMs4lIgZIHecAYKREXi
	l9mudO1CYfQk2Sa/YcYe9R4NTTJO7P2SBHcD09IgrPVEmdtVRZzI5AEhp62n5fvQT475Yb
	IaZ8HUdcpC4bJLu7qK5+EFDo5CEWL30=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BB98DAC2F;
	Tue, 13 Oct 2020 14:03:59 +0000 (UTC)
Subject: Re: [PATCH] x86/msr: handle IA32_THERM_STATUS
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20201007102032.98565-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d2b0176-f976-5f39-903b-89c5d001fe3d@suse.com>
Date: Tue, 13 Oct 2020 16:03:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007102032.98565-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.10.2020 12:20, Roger Pau Monne wrote:
> Windows 8 will attempt to read MSR_IA32_THERM_STATUS and panic if a
> #GP fault is injected as a result:
> 
> vmx.c:3035:d8v0 RDMSR 0x0000019c unimplemented
> d8v0 VIRIDIAN CRASH: 3b c0000096 fffff8061de31651 fffff4088a613720 0
> 
> So handle the MSR and return 0 instead.
> 
> Note that this is done on the generic MSR handler, and PV guest will
> also get 0 back when trying to read the MSR. There doesn't seem to be
> much value in handling the MSR for HVM guests only.
> 
> Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

