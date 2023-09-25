Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFDF7AD533
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 12:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607754.946043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkiPD-00007Q-4z; Mon, 25 Sep 2023 10:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607754.946043; Mon, 25 Sep 2023 10:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkiPD-0008W1-2A; Mon, 25 Sep 2023 10:01:31 +0000
Received: by outflank-mailman (input) for mailman id 607754;
 Mon, 25 Sep 2023 10:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vtXC=FJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qkiPB-0008UZ-5j
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 10:01:29 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e791e4d-5b8a-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 12:01:28 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4050bd2e33aso63420785e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Sep 2023 03:01:28 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x17-20020a5d6511000000b0031fd849e797sm11403220wru.105.2023.09.25.03.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 03:01:27 -0700 (PDT)
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
X-Inumbo-ID: 7e791e4d-5b8a-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695636087; x=1696240887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uF9HFOcox6pQR2Al9mdkKn8TvDo7YjP6eB8y5/6IBs0=;
        b=q0kXDDnC+8X6dGh6CSl+7qOW5IVdK6AbR7cK76zj7Iu9egUXjT8O7bxuJpmZSMqMnj
         6s3rTgk+9ONv1nelMsdaC4IOqnm3/RbEsWPRCBltzhYgwW4WeEvpLwqg2U8SX/tB7w52
         98/uw8yOJEV1w+wNxkknf0IA4pByyD6zIVnzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695636087; x=1696240887;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uF9HFOcox6pQR2Al9mdkKn8TvDo7YjP6eB8y5/6IBs0=;
        b=GWHCWxFCufD2k0pjj0wAPn3lTHmWPnOKBR9VlCNEBnlTU/KI8zmbD5HjxfmY4B/jzG
         mgUN+ZyCTrBxXKeVpwWFYDu1GxxjbI3YrmxNonY85vFyNgdNmUSJJ8pZS4kM1CHXR6tZ
         aHDAlTBvz62tCMr5KU0E/NX+I3MglztAw4ifbi4n5ixgH1KdPLIaBcYbFSVvo3TEWdOG
         aZwMkxKTOIsg0puV/5HxchdTtTumNFpG6qirAFypSXGoqh5sOLZ6SQRZyNY8vxPD/vHF
         CMLJDXpXecH7RT/bYPz9o4NFwcCJPlBZqmQ/XK+YUYvC/aR7LeK5I/04Nz97LkjzuB0F
         i7+A==
X-Gm-Message-State: AOJu0Yw0nvXaWvNwsrw5V0iMwpVP90gWdMoIY+5UyDCiV6OoTU65ny9t
	0kAuzDbSjDuWdG4X2z6zHKoqhw==
X-Google-Smtp-Source: AGHT+IE+aiZeFBvAaiwukTgNX3A0yR9vBB+ny3wcbWBFi15oD8Dlw1s78J6QcGmJiX6IlBUQlNwKrw==
X-Received: by 2002:a05:600c:2050:b0:401:906b:7e9d with SMTP id p16-20020a05600c205000b00401906b7e9dmr5300709wmg.18.1695636087503;
        Mon, 25 Sep 2023 03:01:27 -0700 (PDT)
Message-ID: <62622205-09fe-ff43-a5b6-51e159fc19ad@citrix.com>
Date: Mon, 25 Sep 2023 11:01:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/4] pdx: Add CONFIG_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, Henry Wang <Henry.Wang@arm.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <20230808130220.27891-5-alejandro.vallejo@cloud.com>
 <d462f419-4cd2-53c4-7694-b43b7fa68d88@citrix.com>
 <b0296908-5081-5d34-8487-b8293eee97ca@suse.com>
 <ZRFXA0dUHk5Rmlan@MacBookPdeRoger>
In-Reply-To: <ZRFXA0dUHk5Rmlan@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2023 10:46 am, Roger Pau Monné wrote:
> On Mon, Sep 25, 2023 at 08:36:03AM +0200, Jan Beulich wrote:
>> On 22.09.2023 22:03, Andrew Cooper wrote:
>>> On 08/08/2023 2:02 pm, Alejandro Vallejo wrote:
>>>> --- a/xen/common/Kconfig
>>>> +++ b/xen/common/Kconfig
>>>> @@ -23,6 +23,16 @@ config GRANT_TABLE
>>>>  
>>>>  	  If unsure, say Y.
>>>>  
>>>> +config PDX_COMPRESSION
>>>> +	bool "PDX (Page inDeX) compression support" if EXPERT
>>> This still needs hiding on x86.  The minimal hack for 4.18 is "if EXPERT
>>> && !X86".
>> If you insist on complete hiding and I insist on allowing it to be used by
>> people who want to play with exotic hardware, then this won't go anywhere.
>> I think I've come far enough with accepting a compromise, and so I think
>> it's your turn now to also take a step from your original position.
> Just because I'm not familiar with this, is there any x86 hardware
> that has such sparse memory map that would benefit from PDX?

There is one known system which never shipped.  Xen's implementation was
from the anticipation of that system shipping.  Nothing else known.

None of the other major kernels have facilities such as this, which is
very likely a contributory factor to the system not shipping.

> Wouldn't anyone doing bring up on such exotic hardware also likely need to
> perform other adjustments to Xen, and hence commenting out the !X86 in
> Kconfig be acceptable? (we would likely make it selectable at that
> point if such platforms exist).

People with bizarre hardware can cover the cost of bringing it up.  And
that includes tweaking Kconfig so they can select this option.

~Andrew

