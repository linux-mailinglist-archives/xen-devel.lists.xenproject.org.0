Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC800298995
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12163.31880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWz0t-000198-W2; Mon, 26 Oct 2020 09:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12163.31880; Mon, 26 Oct 2020 09:42:03 +0000
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
	id 1kWz0t-00018j-SM; Mon, 26 Oct 2020 09:42:03 +0000
Received: by outflank-mailman (input) for mailman id 12163;
 Mon, 26 Oct 2020 09:42:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kWz0s-00018b-4O
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:42:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ca7d3ef-67d4-48db-8c4a-0914eacad7f4;
 Mon, 26 Oct 2020 09:42:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D3A4B2AB;
 Mon, 26 Oct 2020 09:42:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kWz0s-00018b-4O
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:42:02 +0000
X-Inumbo-ID: 0ca7d3ef-67d4-48db-8c4a-0914eacad7f4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0ca7d3ef-67d4-48db-8c4a-0914eacad7f4;
	Mon, 26 Oct 2020 09:42:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603705320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VMdzQKAaM6bFeqE8l0wwYexuiOYIIiXaap9PzHsjpZI=;
	b=Ghf88ZZaq3D4f5tm/nMdXAv6D5ZrtXAVZ9QU4b69lViBjanBG45nkJn+GqEEOnfHG7RQ7j
	6ZzfDdgrK22ASWD0dd5oSX11g/1rA5slvdKYLrx+K6X+58QuLl6dii9FbBUU2s6KhnNOE6
	ubnleRScZXgYIPOIsaQnSk8TE67foMU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7D3A4B2AB;
	Mon, 26 Oct 2020 09:42:00 +0000 (UTC)
Subject: Re: [PATCH v3] x86/pv: inject #UD for entirely missing SYSCALL
 callbacks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0e76675b-c549-128e-449f-0c7a4df64f11@suse.com>
Message-ID: <ce9e309e-cd16-2fef-188d-63d3866e7f1a@suse.com>
Date: Mon, 26 Oct 2020 10:41:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <0e76675b-c549-128e-449f-0c7a4df64f11@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 10:40, Jan Beulich wrote:

And of course this should have

From: Andrew Cooper <andrew.cooper3@citrix.com>

right here, sorry.

Jan

> In the case that no 64-bit SYSCALL callback is registered, the guest
> will be crashed when 64-bit userspace executes a SYSCALL instruction,
> which would be a userspace => kernel DoS.  Similarly for 32-bit
> userspace when no 32-bit SYSCALL callback was registered either.
> 
> This has been the case ever since the introduction of 64bit PV support,
> but behaves unlike all other SYSCALL/SYSENTER callbacks in Xen, which
> yield #GP/#UD in userspace before the callback is registered, and are
> therefore safe by default.
> 
> This change does constitute a change in the PV ABI, for the corner case
> of a PV guest kernel not registering a 64-bit callback (which has to be
> considered a defacto requirement of the unwritten PV ABI, considering
> there is no PV equivalent of EFER.SCE).
> 
> It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
> SYSENTER (safe by default, until explicitly enabled).
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <JBeulich@suse.com>

