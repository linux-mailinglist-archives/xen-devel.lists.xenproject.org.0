Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A5307499
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76925.139055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55N1-000219-SV; Thu, 28 Jan 2021 11:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76925.139055; Thu, 28 Jan 2021 11:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55N1-00020Z-Oi; Thu, 28 Jan 2021 11:21:51 +0000
Received: by outflank-mailman (input) for mailman id 76925;
 Thu, 28 Jan 2021 11:21:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l55Mz-0001zy-Ue
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:21:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 961c13be-4426-4b90-afab-3a2fe6b7f739;
 Thu, 28 Jan 2021 11:21:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14459B083;
 Thu, 28 Jan 2021 11:21:48 +0000 (UTC)
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
X-Inumbo-ID: 961c13be-4426-4b90-afab-3a2fe6b7f739
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611832908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ix0q6GkOdx5bUiI5UZ7JQcz5+BRfk+iwQpvzPTY2K84=;
	b=O7snOGfbLCa1ukAxQuX41Otlp98oE4gf2kDUI4oEYXjjTxC3WTfGkEFJ5uS9sgBkf6lBHy
	QX30n3/Br1vhu/rOkrULUf0Fdvu6kVAkJgE7ua1AFg9jpnPi6RFdA16ohzblrSSNaJN5vq
	ZHoh5em37Ck5iR37qC/eFBm0xnLWFXE=
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
 <CAJ=z9a1c+obN3KW_cMr7OH0112_gHSxnAoEJb9qW6R1J38QgQQ@mail.gmail.com>
 <20270711-36bc-6d7d-16cb-4572cace47ed@gmail.com>
 <eb03f366-9405-c193-07be-fbeca29fca4c@xen.org>
 <1156e356-5762-a196-ec16-bb6614912394@gmail.com>
 <alpine.DEB.2.21.2101271235410.9684@sstabellini-ThinkPad-T480s>
 <dd9a1bf6-5afb-158a-6456-a5ded15580bf@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0785367a-9349-ae0c-2622-9412297773fc@suse.com>
Date: Thu, 28 Jan 2021 12:21:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <dd9a1bf6-5afb-158a-6456-a5ded15580bf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.01.2021 12:01, Oleksandr wrote:
> On 27.01.21 22:46, Stefano Stabellini wrote:
>> On Wed, 27 Jan 2021, Oleksandr wrote:
>>> Thank you. I got a request to make a possibility for user to select IOREQ via
>>> the menuconfig on Arm. Saying tech preview do you mean that I also need to put
>>> it under CONFIG_EXPERT on Arm?
>> Normally I would say that unless it actually takes an expert to enable
>> the feature, it is better to make it depend on CONFIG_UNSUPPORTED [1].
>>
>> However, in this case, it might actually take an expert :-)
>> Additional patches are still required to enable the feature at the
>> toolstack level, and also the user needs to build a userspace ioreq
>> server. So in this case I am fine either way. I'll leave it up to you
>> and Julien to pick the best one.
>>
>> Either way, please add "(EXPERT)" or "(UNSUPPORTED)" in the one-line
>> kconfig description for ARM if possible.
>>
>>
>> [1] https://marc.info/?l=xen-devel&m=161168780401884
> 
> Thank you for the explanation, personally I would prefer EXPERT, but...
> 
> It would be really nice if we could agreed regarding that *common* 
> Kconfig option before I submit V6 (which would probably avoid me to send 
> V7 I hope).
> 
> Now I see it as following (please note, it is a subject for new patch in 
> this series, which should come last):
> 
> +++ b/xen/common/Kconfig
> @@ -137,7 +137,13 @@ config HYPFS_CONFIG
>            want to hide the .config contents from dom0.
> 
>   config IOREQ_SERVER
> -       bool
> +       bool "IOREQ support" if EXPERT || X86

This would make the prompt visible for x86, which we don't
want. But I guess Stefano was anyway after ...

> +       default X86
> +       depends on HVM
> +       ---help---
> +         Enables generic mechanism for providing emulated devices to 
> the guests.
> +
> +         If unsure, say Y.

 config IOREQ_SERVER
       bool "IOREQ support (EXPERT)" if EXPERT && !X86
       default X86
       depends on HVM

As the prompt should be invisible this way on x86, the (EXPERT)
doesn't need further qualifying, except maybe in the help text
(just to avoid this being taken as a possible mistake).

Jan

