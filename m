Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEBE2AD71D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 14:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23355.50033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcTN6-0000YE-92; Tue, 10 Nov 2020 13:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23355.50033; Tue, 10 Nov 2020 13:07:40 +0000
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
	id 1kcTN6-0000Xp-5H; Tue, 10 Nov 2020 13:07:40 +0000
Received: by outflank-mailman (input) for mailman id 23355;
 Tue, 10 Nov 2020 13:07:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psMK=EQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kcTN4-0000Xk-89
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:07:38 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b906a52-2d4c-4448-a113-4dcf810a92a9;
 Tue, 10 Nov 2020 13:07:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=psMK=EQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kcTN4-0000Xk-89
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:07:38 +0000
X-Inumbo-ID: 2b906a52-2d4c-4448-a113-4dcf810a92a9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2b906a52-2d4c-4448-a113-4dcf810a92a9;
	Tue, 10 Nov 2020 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605013656;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=9QUsY448JzdfbL4MYcbZiBz1JoYM1idYzU6UardXy74=;
  b=EY/SbnNmQafDBKRmVDzYgbXebsZvAdSAiJD1JdX1kG+1AHmh66cHXuIX
   uMO9e08EwKKdcCgAVm4MasdxRnsAyQXjG1xfW3JqAzTDyxf9ulZAApp0K
   awBTu0lfYGREQrGL0Q81reCOMqFOthk0am98fG0GOVT5p9871vO5w6bX5
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CMAC4MVosbgD0FXxof+7NZ1/M7N36WEXdpSRgL7Jj+Ynsk/wAWYVi6wPSLHCpnpzzWpJD4RPdD
 rPC/bbefh+wL0Lj/H7rHFLC2oMvim6LZxBd6/H3JI2nO2qwRp0c0jDQrwJLJWeoM4jfYV7WDqp
 G6+rLNnqa0p4teSrbFDUMyNQ1+bUiI5MDUr3/JL+fzFjaWnxxbN4TlBTzQjD1e38/0SXQtRiNk
 nlvWKwzakxgf7JiNa+c7Swwu1paIpbZReWw7cizhCnj4sy4MCeWMw0QsGFZfkXrt5xf0xgaDmq
 WyY=
X-SBRS: None
X-MesageID: 30846913
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="30846913"
Subject: Re: [PATCH] docs: fix documentation to notice credit2 is the default
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	=?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201110112118.99960-1-roger.pau@citrix.com>
 <b9ca219d-b6d7-9f59-3ede-9b4c9225e01b@suse.com>
 <20201110124900.2hjgn45i7ynf33p3@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <035d10c0-2774-8d1c-b55f-e075f04344e7@citrix.com>
Date: Tue, 10 Nov 2020 13:07:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110124900.2hjgn45i7ynf33p3@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 10/11/2020 12:49, Roger Pau Monné wrote:
> On Tue, Nov 10, 2020 at 12:31:14PM +0100, Jürgen Groß wrote:
>> On 10.11.20 12:21, Roger Pau Monne wrote:
>>> Fix the command line document to account for credit2 now being the
>>> default scheduler.
>>>
>>> Fixes: dafd936dddbd ('Make credit2 the default scheduler')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>   docs/misc/xen-command-line.pandoc | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>>> index 4ae9391fcd..789aead148 100644
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -1876,7 +1876,7 @@ with read and write permissions.
>>>   ### sched
>>>   > `= credit | credit2 | arinc653 | rtds | null`
>>> -> Default: `sched=credit`
>>> +> Default: `sched=credit2`
>>>   Choose the default scheduler.
>>>
>> Tried that before:
>>
>> https://lists.xen.org/archives/html/xen-devel/2019-01/msg01097.html
>>
>> And Andrew didn't like it...
> One way or another we need to get this fixed in the document. Listing
> credit as the still the default is wrong.

I agree that what is there is wrong, but so is saying credit2.

This documentation is for users, because develops know exactly how they
configured their schedulers, and won't actually need to refer to it.

As a consequence, it depends heavily on what a specific
distro/downstream chose, config-wise.

> I think there are several places in xen-command-line.pandoc that just
> contain the default values set in Kconfig, so IMO if we want to
> change this it should be done wholesale rather than picking on every
> default value change. Opinions?

xen-command-line.pandoc wholly predates Kconfig.  We're only in this
mess because previous patches haven't been appropriately reviewed.

Lets fix it up to be correct, but lets not delay fixing this to look for
potential other cases.

~Andrew

