Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4858A2B0149
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 09:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25545.53367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd87A-0008NK-OS; Thu, 12 Nov 2020 08:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25545.53367; Thu, 12 Nov 2020 08:37:56 +0000
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
	id 1kd87A-0008Mv-LA; Thu, 12 Nov 2020 08:37:56 +0000
Received: by outflank-mailman (input) for mailman id 25545;
 Thu, 12 Nov 2020 08:37:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kd879-0008Mq-BS
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:37:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f739ebd6-2c27-44d8-9f3f-ede26ee4e126;
 Thu, 12 Nov 2020 08:37:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8ABD5AE49;
 Thu, 12 Nov 2020 08:37:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kd879-0008Mq-BS
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:37:55 +0000
X-Inumbo-ID: f739ebd6-2c27-44d8-9f3f-ede26ee4e126
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f739ebd6-2c27-44d8-9f3f-ede26ee4e126;
	Thu, 12 Nov 2020 08:37:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605170273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKtBw0yrqCVPrbGQ5riNB4AdQHefK1Z3wzKKVyz7SEY=;
	b=OAJie9wqKmWRzmP9One/YxJWpWmp1Y+NWz5psVvjIjXZlijrz8t/hh2s+ItJAetvKwMBnc
	bOh0P3qAMJFOxXKj1HxftCfCvJ8dXIJhZx7NtZiVboJj8f+vcYWlbEfknOPpHZC0/jKuiv
	NX5r9PSrBpx+FHLN8GsiHOlXE46cT7k=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8ABD5AE49;
	Thu, 12 Nov 2020 08:37:53 +0000 (UTC)
Subject: Re: [PATCH 02/10] viridian: move IPI hypercall implementation into
 separate function
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-3-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37655f80-2f72-5069-6de4-0b2c8dce47bf@suse.com>
Date: Thu, 12 Nov 2020 09:37:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201111200721.30551-3-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.11.2020 21:07, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch moves the implementation of HVCALL_SEND_IPI that is currently
> inline in viridian_hypercall() into a new hvcall_ipi() function.
> 
> The new function returns Xen errno values similarly to hvcall_flush(). Hence
> the errno translation code in viridial_hypercall() is generalized, removing
> the need for the local 'status' variable.
> 
> NOTE: The formatting of the 'out' label also corrected as per CODING_STYLE

How about correcting the adjacent switch() at the same time as well?

>       and the code is adjusted to avoid a register copy-back if 'mode' is
>       neither 8 nor 4.

While you mention it here, isn't this an unrelated change wanting
its own justification?

Jan

