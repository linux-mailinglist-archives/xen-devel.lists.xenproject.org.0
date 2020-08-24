Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668DE24FC3A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 13:04:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAAG2-0004B2-Un; Mon, 24 Aug 2020 11:03:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAAG1-0004Aw-I9
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 11:03:21 +0000
X-Inumbo-ID: a12dec7f-8953-4a6d-a3c3-4503c0b1c0b3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a12dec7f-8953-4a6d-a3c3-4503c0b1c0b3;
 Mon, 24 Aug 2020 11:03:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9854AD92;
 Mon, 24 Aug 2020 11:03:49 +0000 (UTC)
Subject: Re: Qubes OS 4.1 under the Heads
To: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, insurgo@riseup.net,
 Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
References: <76d823d0-03cc-d628-6507-1f300e13b5b2@3mdeb.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <794c49c0-1e72-4530-6b23-c6ace0785250@suse.com>
Date: Mon, 24 Aug 2020 13:03:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <76d823d0-03cc-d628-6507-1f300e13b5b2@3mdeb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.08.2020 12:33, Norbert Kaminski wrote:
> I'm trying to boot Qubes 4.1 under the Heads (http://osresearch.net/).
> The Heads uses kexec to run the Xen 4.13 with Qubes kernel. During the
> boot process on the screen appear colorful artifacts, which are shown in
> this issue:
> 
> https://github.com/osresearch/heads/issues/789
> 
> The installation media booted properly when I replaced the hypervisor to
> the stable-4.11. So I've bisected Xen from the 4.11 to 4.13 version and
> I found out that problems start with:
> 
> https://github.com/xen-project/xen/commit/dcf4179
> 
> This is the first commit where Qubes OS doesn't boot properly. The Qubes
> kernel cannot find the LUKS UUID and boot ends in the emergency mode.

The commit in question doesn't look like a prime candidate to
cause such a regression, so I guess we'll need sufficiently
verbose logs (ideally with a debug=y Xen) at least for the
problem case, but even better would be one last-known-good log
in addition for comparison.

> The colorful artifacts appear in this commit:
> 
> https://github.com/xen-project/xen/commit/07c181c

Did you previously make use of the option this commit removes?
If so, the description's claim of the code being dead may have
been wrong. If not, without further details (logs, as per
above) I guess it'll again be hard to diagnose anything here.

Jan

