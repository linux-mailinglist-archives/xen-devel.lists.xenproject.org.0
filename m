Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFB62EF142
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 12:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63350.112482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxpxf-0001vg-PS; Fri, 08 Jan 2021 11:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63350.112482; Fri, 08 Jan 2021 11:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxpxf-0001uo-Lp; Fri, 08 Jan 2021 11:29:43 +0000
Received: by outflank-mailman (input) for mailman id 63350;
 Fri, 08 Jan 2021 11:29:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BSv=GL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kxpxd-0001qf-9I
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 11:29:41 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7598d243-556a-45c6-bfd3-72f8998529b9;
 Fri, 08 Jan 2021 11:29:39 +0000 (UTC)
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
X-Inumbo-ID: 7598d243-556a-45c6-bfd3-72f8998529b9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610105379;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=oQDXPfOsoK2HHZwzvLtJMwpWgOYg1ZFw3xhKZzApLxE=;
  b=ha3fv+F8IWz3s/XT6Uk6inOZr01WXI4khTqr6c9bLALNa4rJ1wIQMOZb
   Z9tAGeevYq5ikgiDS7KljBPNvooGCpeCz7pZv1JBwtR63rVRS78bBxXb/
   btpwuUPCKt+dipZxbNi31VWq/0gUgpPtkZBqsI9tFTM4OW+ooQ1lXvT/q
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aG6nQRIxzSu+3eviaZKvNvqzvUHHKasdUm8fUFPKahNjCypZLzupIhPa7jlNLfeXp8g2cOTktx
 ncLKqTiWS5XWwlV5E0pB4LarGk7Hs/n5jkIu5EzEWeGbMkdhgtANli4HASkhN3HM4DSXbs2EAr
 t9IK3CFwk1GZCpfnsAqPe3Co3HcABpCMkVf2/X0lbqoFfWnTK2S3R6Jy1qJpv20yRkp+4Sve32
 16vrujRdRDpOEgkXm3rlgtulLwmuLojuMgmPHvvOXWa+sRQuh/z2fXlFER7X6X3g4C3qXtmlnG
 Etw=
X-SBRS: 5.2
X-MesageID: 35963577
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,330,1602561600"; 
   d="scan'208";a="35963577"
Subject: Re: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
To: <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <iwj@xenproject.org>, <anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <roger.pau@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <1610066796-17266-2-git-send-email-igor.druzhinin@citrix.com>
 <00a001d6e599$a07c8380$e1758a80$@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <c09f1304-c08f-1f18-319d-62aa518a89d1@citrix.com>
Date: Fri, 8 Jan 2021 11:29:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <00a001d6e599$a07c8380$e1758a80$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/01/2021 08:38, Paul Durrant wrote:
>> -----Original Message-----
>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Sent: 08 January 2021 00:47
>> To: xen-devel@lists.xenproject.org
>> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com;
>> andrew.cooper3@citrix.com; george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org;
>> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin <igor.druzhinin@citrix.com>
>> Subject: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
>>
>> If Viridian extensions are enabled, Windows wouldn't currently allow
>> a hotplugged vCPU to be brought up dynamically. We need to expose a special
>> bit to let the guest know we allow it. It appears we can just start exposing
>> it without worrying too much about compatibility - see relevant QEMU
>> discussion here:
>>
>> https://patchwork.kernel.org/project/qemu-devel/patch/1455364815-19586-1-git-send-email-
>> den@openvz.org/
> 
> I don't think that discussion really confirmed it was safe... just that empirically it appeared to be so. I think we should err on
> the side of caution and have this behind a feature flag (but I'm happy for it to default to on).

QEMU was having this code since 2016 and nobody complained is good
enough for me - but if you insist we need an option - ok, I will add one.

Igor

