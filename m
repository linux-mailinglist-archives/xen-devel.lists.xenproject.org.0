Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6EDD20537
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 17:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203488.1518673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg44D-0004RA-OW; Wed, 14 Jan 2026 16:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203488.1518673; Wed, 14 Jan 2026 16:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg44D-0004Pi-Kf; Wed, 14 Jan 2026 16:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1203488;
 Wed, 14 Jan 2026 16:49:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S8+q=7T=deutnet.info=agriveaux@srs-se1.protection.inumbo.net>)
 id 1vg44C-0004PM-39
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 16:49:56 +0000
Received: from srv1.deutnet.info (srv1.deutnet.info [2a01:4f8:c2c:6846::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c07bd9b-f169-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 17:49:53 +0100 (CET)
Received: from [2a01:e0a:186:d20::ebe]
 by srv1.deutnet.info with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <agriveaux@deutnet.info>) id 1vg446-0000000468Y-2rnX;
 Wed, 14 Jan 2026 17:49:50 +0100
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
X-Inumbo-ID: 0c07bd9b-f169-11f0-9ccf-f158ae23cfc8
Message-ID: <cc3c15a7-5639-423a-b9d6-1a7a3a55e104@deutnet.info>
Date: Wed, 14 Jan 2026 17:49:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH XEN] tools: Update files examples PV&PVH with pygrub.
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <aWV5U1hgOYqDBIk2@deutnet.info>
 <a2331e66-24ac-412f-bed5-66d9920f4efc@suse.com>
 <3e937fc7-62bb-404c-9b1b-c4172404bf35@deutnet.info>
 <4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com>
 <a7eb74e9-d5c1-4000-a4a1-d0a09a4fb192@deutnet.info>
 <1d06919f-841f-44e4-b53f-af575e9dd2b1@suse.com>
Content-Language: en-US
From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
In-Reply-To: <1d06919f-841f-44e4-b53f-af575e9dd2b1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/01/2026 à 09:41, Jürgen Groß a écrit :
> On 14.01.26 09:20, Alexandre GRIVEAUX wrote:
>> Le 14/01/2026 à 08:43, Jürgen Groß a écrit :
>>> Yes. This is why I don't like the wording "inside guest", which is 
>>> just not
>>> true.
>>
>> Before wasting more time for that side, there is chroot with 
>> bind-mount of DomU FS.
>>
>> Rephrasing like this should be more than enough:
>>
>> # Enable to use a grub2 emulation boot instead of direct kernel boot.
>>
>>>
>>> Please be aware that we are trying to phase out pygrub, as it widens 
>>> the
>>> attack surface of dom0 from a guest. pygrub needs to look into guest
>>> controlled file systems, so any bug in the related code (e.g. 
>>> failure to
>>> handle a corrupted or maliciously modified file system) might result in
>>> security issues like code injection.
>>
>> Effectively, if pygrub is on verge of being phased out, there is not 
>> need for this patch...
>
> :-)
>
>> But could you point me to the discussion of alternatives ? As pygrub 
>> allow a more easy management...
>
> Oh, the fun of selecting the grub variant. :-)
>
> There are:
>
> - pygrub as discussed already
>
> - grub-pv (32- and 64-bit) and grub-pvh: official flavors of grub2 for 
> PV and
>   PVH guests, selected by specifying them as the kernel to boot, 
> running in
>   domU context
>
> - pvgrub (32- and 64-bit): legacy grub 0.97 variants based on Mini-OS 
> for PV
>   guests, selected by specifying them as the kernel to boot, running 
> in domU
>   context
>
>>
>> Should this be noted to the wiki ?
>
> Yes. Documentation should really be enhanced.

No problem to that, I have commit access to the wiki but beside 
updating, I need to test it, and check if Debian have packaged grub-pv...

For me the pvgrub should also be noted as being phased out in favor of 
grub-pv.

As for me the documentation should be usable by user without advanced 
knowledge to read code.

>
>>> So I'm on the edge whether we really should make it easier to use 
>>> pygrub.
>> Legit, Should patch subject need to be [RFC PATCH] ?
>
> No, I don't think so. Others might have other opinions than me 
> regarding pygrub.
>
> Juergen

Ok.


Thanks.


