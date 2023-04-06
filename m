Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ED16D9B60
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 16:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518918.805930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkR3G-0005Dd-4Y; Thu, 06 Apr 2023 14:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518918.805930; Thu, 06 Apr 2023 14:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkR3G-0005Bz-0x; Thu, 06 Apr 2023 14:57:26 +0000
Received: by outflank-mailman (input) for mailman id 518918;
 Thu, 06 Apr 2023 14:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFOP=75=arm.com=Peter.Hoyes@srs-se1.protection.inumbo.net>)
 id 1pkR3E-0005Bt-MH
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 14:57:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 549f176e-d48b-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 16:57:21 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34AABFEC;
 Thu,  6 Apr 2023 07:58:04 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5584D3F762;
 Thu,  6 Apr 2023 07:57:19 -0700 (PDT)
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
X-Inumbo-ID: 549f176e-d48b-11ed-b464-930f4c7d94ae
Message-ID: <6b98b95d-d737-5495-9c03-7857886cb1ce@arm.com>
Date: Thu, 6 Apr 2023 15:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] tools/xendomains: Only save/restore/migrate if supported
 by xenlight
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, wei.chen@arm.com,
 bertrand.marquis@arm.com, Wei Liu <wl@xen.org>
References: <20230322135800.3869458-1-peter.hoyes@arm.com>
 <fa320fd7-31fa-4e96-a804-172e70ef1c80@perard>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <fa320fd7-31fa-4e96-a804-172e70ef1c80@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2023 17:28, Anthony PERARD wrote:
> On Wed, Mar 22, 2023 at 01:58:00PM +0000, Peter Hoyes wrote:
>> From: Peter Hoyes <Peter.Hoyes@arm.com>
>>
>> Saving, restoring and migrating domains are not currently supported on
>> arm and arm64 platforms, so xendomains prints the warning:
>>
>>    An error occurred while saving domain:
>>    command not implemented
>>
>> when attempting to run `xendomains stop`. It otherwise continues to shut
>> down the domains cleanly, with the unsupported steps skipped.
> The patch looks kind of ok, but shouldn't $XENDOMAINS_SAVE be set to an
> empty string in the config by the admin instead?
>
> Or is the issue that $XENDOMAINS_SAVE is set by default, even on arm* ?
Yea the default is the issue. We are building for embedded, using Yocto, 
so there isn't really an admin.
>
> Maybe it's easier to check that the command is implemented at run time
> rather than trying to have a good default value for XENDOMAINS_SAVE at
> install/package time.

It would be cleaner to do this at build time for sure, but I'm not sure 
the autotools config file approach for sysconfig.xendomains.in can 
handle the logic for this?

Thanks,

Peter



