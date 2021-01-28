Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9411E30738B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 11:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76846.138830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54Ou-00024x-6a; Thu, 28 Jan 2021 10:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76846.138830; Thu, 28 Jan 2021 10:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54Ou-00024Y-3L; Thu, 28 Jan 2021 10:19:44 +0000
Received: by outflank-mailman (input) for mailman id 76846;
 Thu, 28 Jan 2021 10:19:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l54Ot-00024T-CL
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:19:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df3136b3-2c73-4baa-9e45-6b4fad499970;
 Thu, 28 Jan 2021 10:19:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC854ACF4;
 Thu, 28 Jan 2021 10:19:41 +0000 (UTC)
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
X-Inumbo-ID: df3136b3-2c73-4baa-9e45-6b4fad499970
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611829181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KOZxr9SBGDc5a84roM/DomORvI+5KPSD1CGP8Sswfdc=;
	b=gJ3v7mkzrmKR/9e4qnCGi4zhh2RtHqeexgnvCurchkzB0O4I9MCABiscmili7EMpuQi7a5
	xblaiQ/qX3IWZrTWnz2R2ZLz4Eyhj2m8nDEAPLj6VeghJlwx4Lf8PbZZAQQLNtDt4VfAAs
	gA4RF/7dypGI89H5wsACWgO/rjAk0h0=
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monn?? <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <202101242308.10ON8Umj004866@m5p.com>
 <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
 <YA8D85MoJ9lG0KJS@mattapan.m5p.com>
 <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
 <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
 <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
 <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
 <67ef8210-a65f-9d6a-bea1-46ce06d47fb7@citrix.com>
 <YBHo/gscAfcAZqst@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44450edc-9a64-8a6e-e8d3-3a3f726a96bc@suse.com>
Date: Thu, 28 Jan 2021 11:19:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YBHo/gscAfcAZqst@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.01.2021 23:28, Elliott Mitchell wrote:
> On Wed, Jan 27, 2021 at 09:03:32PM +0000, Andrew Cooper wrote:
>> So.?? What *should* happen is that if QEMU/OVMF dirties more memory than
>> exists in the PoD cache, the domain gets terminated.
>>
>> Irrespective, Xen/dom0 dying isn't an expected consequence of any normal
>> action like this.
>>
>> Do you have a serial log of the crash??? If not, can you set up a crash
>> kernel environment to capture the logs, or alternatively reproduce the
>> issue on a different box which does have serial?
> 
> No, I don't.  I'm setup to debug ARM failures, not x86 ones.

Then alternatively can you at least give conditions that need to
be met to observe the problem, for someone to repro and then
debug? (The less complex the better, of course.)

Jan

