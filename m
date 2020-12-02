Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01B12CC25C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 17:35:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42882.77176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkV5t-0007PX-Cy; Wed, 02 Dec 2020 16:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42882.77176; Wed, 02 Dec 2020 16:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkV5t-0007P8-9g; Wed, 02 Dec 2020 16:35:05 +0000
Received: by outflank-mailman (input) for mailman id 42882;
 Wed, 02 Dec 2020 16:35:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnsL=FG=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kkV5s-0007P3-0a
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 16:35:04 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 896997d7-e286-4c90-bb7d-f0d01f8bb686;
 Wed, 02 Dec 2020 16:35:02 +0000 (UTC)
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
X-Inumbo-ID: 896997d7-e286-4c90-bb7d-f0d01f8bb686
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606926902;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=eycOKdvUo1CyiWQtNu/Nm7EaPdWQhjbeuuRaBlXKR4Q=;
  b=IwjzciYoSicWztxaIM9IauZHGhQn/8xBxj+mDss26ZRmR/3tX4ia3W2j
   0UwB1lnsIJ28fGaY/2Y3v5bEGArK2YN3MFJUgyeFGoFOUFvUGu2CyKPt2
   CXVPhsqoyMpVHBDOljORiTUWLsdGmC9d2V1gl7GijfLq+E6a284FMcs7J
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1NQUARUK5eMmTpNbHwSkFWjmAQc3uAN53dEqKAZZMYHmVQMxFAuCg0+idIP1f0TjWD9xsgjS7m
 gs77VQH+9dNT8lEgv/Oe9gQQIkpe7VhWlIvLXKdlTsTBa7pbbbAIgM7TFeYl/gzdvOiylRfsFq
 K9ATtHRtZIIuE4RsapGHA739VflB95/4VSx8ungxV/HUrbpC3U8hoSIv6YUB/Ql+PxfewVmpKo
 LgNR0hGGQnK1QhepEKlH0k8TSqMadXLC2DDqMpYzRGzgTx7118B7dE/T8DViJEdNDFT6H/Mclz
 YR0=
X-SBRS: None
X-MesageID: 32376019
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,387,1599537600"; 
   d="scan'208";a="32376019"
Subject: Re: [PATCH] x86/IRQ: bump max number of guests for a shared IRQ to 31
To: Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <1606780777-30718-1-git-send-email-igor.druzhinin@citrix.com>
 <b98d3517-6c9d-6f40-6e28-cde142978143@suse.com>
 <3c9735ec-2b04-1ace-2adb-d72b32c4a5f9@citrix.com>
 <88019c81-1988-2512-282b-53b61adf09c6@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <bcb0964d-9444-f5e6-372f-d8daa460fcfd@citrix.com>
Date: Wed, 2 Dec 2020 16:34:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <88019c81-1988-2512-282b-53b61adf09c6@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/12/2020 15:21, Jan Beulich wrote:
> On 02.12.2020 15:53, Igor Druzhinin wrote:
>> On 02/12/2020 09:25, Jan Beulich wrote:
>>> Instead I'm wondering whether this wouldn't better be a Kconfig
>>> setting (or even command line controllable). There don't look to be
>>> any restrictions on the precise value chosen (i.e. 2**n-1 like is
>>> the case for old and new values here, for whatever reason), so a
>>> simple permitted range of like 4...64 would seem fine to specify.
>>> Whether the default then would want to be 8 (close to the current
>>> 7) or higher (around the actually observed maximum) is a different
>>> question.
>>
>> I'm in favor of a command line argument here - it would be much less trouble
>> if a higher limit was suddenly necessary in the field. The default IMO
>> should definitely be higher than 8 - I'd stick with number 32 which to me
>> should cover our real world scenarios and apply some headroom for the future.
> 
> Well, I'm concerned of the extra memory overhead. Every IRQ,
> sharable or not, will get the extra slots allocated with the
> current scheme. Perhaps a prereq change then would be to only
> allocate multi-guest arrays for sharable IRQs, effectively
> shrinking the overhead in particular for all MSI ones?

That's one way to improve overall system scalability but in that area
there is certainly much bigger fish to fry elsewhere. With 32 elements in the
array we get 200 bytes of overhead per structure, with 16 it's just 72 extra
bytes which in the unattainable worst case scenario of every single vector taken
in 512 CPU machine would only account for several MB of overhead.

I'd start with dynamic array allocation first and setting the limit to 16 that
should be enough for now. And then if that default value needs to be raised
we can consider further improvements.

Igor

