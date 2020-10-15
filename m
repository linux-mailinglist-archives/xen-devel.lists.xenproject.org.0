Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7516228F062
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 12:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7263.18937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT0rd-00080u-Gf; Thu, 15 Oct 2020 10:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7263.18937; Thu, 15 Oct 2020 10:52:05 +0000
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
	id 1kT0rd-00080Y-DX; Thu, 15 Oct 2020 10:52:05 +0000
Received: by outflank-mailman (input) for mailman id 7263;
 Thu, 15 Oct 2020 10:52:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sFLp=DW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kT0rc-000801-HL
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 10:52:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 494b7e29-b24a-4f2c-ba31-fb9de5a7499e;
 Thu, 15 Oct 2020 10:52:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04AE3AF0F;
 Thu, 15 Oct 2020 10:52:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFLp=DW=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kT0rc-000801-HL
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 10:52:04 +0000
X-Inumbo-ID: 494b7e29-b24a-4f2c-ba31-fb9de5a7499e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 494b7e29-b24a-4f2c-ba31-fb9de5a7499e;
	Thu, 15 Oct 2020 10:52:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602759123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnpeTZrGFBvmlxr6aEM4Si89rh3Iavn2Pva5X6Exq/E=;
	b=JPoHsdXkCc+83sDQcDnnW0OJWgura5pP/+BDvWHi55lwNE5StA56+hvA35fbHPjrgpXaRX
	jMZo4b79OT+Wg6rt9RQD9X2kfUekATzTXOkr/6Pi/PLJbg7UvXcPCr1P3/2Msf2BNQn+x3
	6ArsYTV7O5dCyxJ76fZH25Miff2uJ7A=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 04AE3AF0F;
	Thu, 15 Oct 2020 10:52:03 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] xen/x86: implement NMI continuation as softirq
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201007133011.18871-1-jgross@suse.com>
 <20201015104939.GA67506@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a8e03a4e-57ae-b251-5e74-5207b03b4aba@suse.com>
Date: Thu, 15 Oct 2020 12:52:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201015104939.GA67506@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.10.20 12:49, Roger Pau Monné wrote:
> On Wed, Oct 07, 2020 at 03:30:09PM +0200, Juergen Gross wrote:
>> Move sending of a virq event for oprofile to the local vcpu from NMI
>> to softirq context.
>>
>> This has been tested with a small test patch using the continuation
>> framework of patch 1 for all NMIs and doing a print to console in
>> the continuation handler.
>>
>> Version 1 of this small series was sent to the security list before.
>>
>> Juergen Gross (2):
>>    xen/x86: add nmi continuation framework
>>    xen/oprofile: use set_nmi_continuation() for sending virq to guest
> 
> Apart from the comments in patch 1, I think this is a fine approach if
> it allows us to restore to the previous state of the event lock.

This will not be enough to do that, but it is clearly removing a
potential deadlock.

> I think we should be expecting a v3 with the nmi callback prototype?

And using an IPI instead of a softirq, yes.


Juergen

