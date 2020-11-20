Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C042BABC0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 15:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32246.63275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg7Gv-000157-6i; Fri, 20 Nov 2020 14:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32246.63275; Fri, 20 Nov 2020 14:20:21 +0000
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
	id 1kg7Gv-00014i-31; Fri, 20 Nov 2020 14:20:21 +0000
Received: by outflank-mailman (input) for mailman id 32246;
 Fri, 20 Nov 2020 14:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg7Gu-00014T-5F
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:20:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65bd90f2-58a5-45f6-971a-0253e3bb38fa;
 Fri, 20 Nov 2020 14:20:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76A38AC23;
 Fri, 20 Nov 2020 14:20:18 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg7Gu-00014T-5F
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:20:20 +0000
X-Inumbo-ID: 65bd90f2-58a5-45f6-971a-0253e3bb38fa
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 65bd90f2-58a5-45f6-971a-0253e3bb38fa;
	Fri, 20 Nov 2020 14:20:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605882018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pcqKyf2F69YpsegYySux8ebDCY1ioanHw5/or7/Lx8k=;
	b=H0Kmnhm9YbmqtRnbtIoTN9FyhUWdeOhBqFeGYWy9ai78thwzWgKYtVWDwMxBDOXM9MTSCw
	oqJAzhqAkXsPndopqGdn6gQVBautnU7gjR01DjKWAms6dTz78xT+ux6SrEyThJf2FT9oat
	lE5t+clvnbJNbUbd8VfWgEvHoJ4xKsg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 76A38AC23;
	Fri, 20 Nov 2020 14:20:18 +0000 (UTC)
Subject: Re: [PATCH v2 01/12] viridian: don't blindly write to 32-bit
 registers is 'mode' is invalid
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201120094900.1489-1-paul@xen.org>
 <20201120094900.1489-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0367ae3b-88a4-1a8d-b174-794b3fe61760@suse.com>
Date: Fri, 20 Nov 2020 15:20:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120094900.1489-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 10:48, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> If hvm_guest_x86_mode() returns something other than 8 or 4 then
> viridian_hypercall() will return immediately but, on the way out, will write
> back status as if 'mode' was 4. This patch simply makes it leave the registers
> alone.

IOW 16-bit protected mode and real mode aren't allowed to make
hypercalls (supported also be the earlier switch() in the
function)? But then, to achieve what you want, wouldn't it be
more direct to simply "return HVM_HCALL_completed;" straight
from that earlier switch()'s default case? At which point the
switch() you modify could become if/else? Anyway - you're the
maintainer, I'm just wondering ...

Jan

