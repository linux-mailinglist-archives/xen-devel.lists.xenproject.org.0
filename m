Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4FA325FA6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 10:10:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90159.170602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZ8i-0000bS-2M; Fri, 26 Feb 2021 09:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90159.170602; Fri, 26 Feb 2021 09:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZ8h-0000b3-V9; Fri, 26 Feb 2021 09:10:23 +0000
Received: by outflank-mailman (input) for mailman id 90159;
 Fri, 26 Feb 2021 09:10:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFZ8g-0000ay-A5
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 09:10:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1198110f-cde1-4b03-bf14-d656f123aa48;
 Fri, 26 Feb 2021 09:10:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C7F95AAAE;
 Fri, 26 Feb 2021 09:10:20 +0000 (UTC)
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
X-Inumbo-ID: 1198110f-cde1-4b03-bf14-d656f123aa48
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614330620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnPO0c8BqED9sNXUMyc5GizBTjaaFQPqZ40nV6grb5g=;
	b=icmCsrvMmX8/butHsBZyoJB5/mefB28V0+ueEZVf0Wqr3ujss+yjtI7XQHMLmehJ9G7C3E
	JNOmUhJriI/SUIrjcF0jz+M3CSs6c6LdE+v3ORct06m/mTo0rMRcv9a8k545BwjBl4XNis
	YXYyh67rb9PVMBLpnnxnh42xoBSpgss=
Subject: Re: [PATCH 2/3] tools/firmware: Build firmware as -ffreestanding
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210225203010.11378-1-andrew.cooper3@citrix.com>
 <20210225203010.11378-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <23f64cfe-8908-79e1-253b-ad07b7aee00a@suse.com>
Date: Fri, 26 Feb 2021 10:10:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225203010.11378-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 21:30, Andrew Cooper wrote:
> firmware should always have been -ffreestanding, as it doesn't execute in the
> host environment.
> 
> inttypes.h isn't a freestanding header, but the 32bitbios_support.c only wants
> the stdint.h types so switch to the more appropriate include.
> 
> This removes the build time dependency on a 32bit libc just to compile the
> hvmloader and friends.
> 
> Update README and the TravisCI configuration.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with one further adjustment:

> --- a/tools/firmware/Rules.mk
> +++ b/tools/firmware/Rules.mk
> @@ -16,4 +16,4 @@ CFLAGS += -Werror
>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
>  # Extra CFLAGS suitable for an embedded type of environment.
> -CFLAGS += -fno-builtin -msoft-float
> +CFLAGS += -fno-builtin -msoft-float -ffreestanding

As per gcc doc -ffreestanding implies -fno-builtin, so I think you
want to replace that one instead of adding the new option on top.

Jan

