Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0112FE485
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 09:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71913.129148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ush-00071J-5u; Thu, 21 Jan 2021 07:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71913.129148; Thu, 21 Jan 2021 07:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ush-00070u-2T; Thu, 21 Jan 2021 07:59:51 +0000
Received: by outflank-mailman (input) for mailman id 71913;
 Thu, 21 Jan 2021 07:59:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2Usg-00070p-93
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 07:59:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98844585-39b4-49e1-8a48-38abcdc14e3b;
 Thu, 21 Jan 2021 07:59:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA8BCAAAE;
 Thu, 21 Jan 2021 07:59:48 +0000 (UTC)
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
X-Inumbo-ID: 98844585-39b4-49e1-8a48-38abcdc14e3b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611215988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czR88UdGuNquAVzvLBeD6CPfWjnXVI8LsoCgdajYAZY=;
	b=U30iPp0PLAKLIWWMAY8QFX46vU6ioHI8lm/HgSOj9EPhuxLlDYdzDKf5Box+6cKTSrdxo5
	FMQQE9fnP5STIpMmSdUVYW/hFJRXU1N2zVu3eWwiPDm29iOYg9m5N6C4mAwweDLKoP8k7N
	yaPJi+Vbri0zmOH4KWtamzGjWk9EuoY=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Claudemir Todo Bom <claudemir@todobom.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
 <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
 <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
 <CANyqHYcUSoTRZ1XW9uSNFRzvzoXEkuchmjGdnAneGkr5=dU98g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d80d60c-d3fc-04c5-ccbf-9de8657d2ea8@suse.com>
Date: Thu, 21 Jan 2021 08:59:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CANyqHYcUSoTRZ1XW9uSNFRzvzoXEkuchmjGdnAneGkr5=dU98g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.01.2021 21:13, Claudemir Todo Bom wrote:
> Em qua., 20 de jan. de 2021 às 12:13, Jürgen Groß <jgross@suse.com> escreveu:
>> On 20.01.21 09:50, Jan Beulich wrote:
>>> I'm afraid there's no real way around seeing the full Xen
>>> messages, i.e. including possible ones while Dom0 already boots
>>> (and allowing some debug keys to be issued, as the rcu_barrier
>>> on the stack may suggest there's an issue with one of the
>>> secondary CPUs). You could try whether "vag=keep" on the Xen
>>> command line allows you to see more, but this option may have
>>> quite severe an effect on the timing of Dom0's booting, which
>>> may make an already bad situation worse.
> 
> already used "vga=keep", no new information. Will try to enable a
> serial output in order to debug more. Is there any parameters I could
> give to Xen in order to it write more information on serial line while
> the dom0 is booting on the screen?

You'll presumably want "console=" and "com<N>="; the exact values
to use depend on your system, so I will refer you to the command
line doc[1].

Jan

[1] https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html

