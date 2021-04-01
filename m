Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306B8351018
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 09:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104116.198748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRrnM-0006Z5-1A; Thu, 01 Apr 2021 07:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104116.198748; Thu, 01 Apr 2021 07:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRrnL-0006Yg-U5; Thu, 01 Apr 2021 07:31:11 +0000
Received: by outflank-mailman (input) for mailman id 104116;
 Thu, 01 Apr 2021 07:31:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRrnK-0006Yb-2N
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 07:31:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95d809e2-e143-4727-86d0-885f1def281a;
 Thu, 01 Apr 2021 07:31:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE0E9B119;
 Thu,  1 Apr 2021 07:31:07 +0000 (UTC)
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
X-Inumbo-ID: 95d809e2-e143-4727-86d0-885f1def281a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617262268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlvKU9J+T+KwoivZaZ0SLwGW3IXl34XrRCMhiAm7cto=;
	b=dVFKMh8eIHxMCyRVhQpwn1AiYwKxzIgHq2lzRqT1eGMFV4b+BIOsFmAe4a0w5oabvmxiTe
	elIc8fxTF17E3H9VNRD/gwM0MMtbwWiHV5riaVnFmfLBv2aRNNTRgKRiJpLbl/NFmtD8nt
	tcwYKlrvljpGxMNWvz9TJifoCHR96sE=
Subject: Re: multiboot2 and module2 boot issues via GRUB2
To: Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, grub-devel@gnu.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
 <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com>
 <CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5ed3a53-5152-aba1-820d-ccab72a82c61@suse.com>
Date: Thu, 1 Apr 2021 09:31:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 03:06, Roman Shaposhnik wrote:
> And the obvious next question: is my EVE usecase esoteric enough that
> I should just go ahead and do a custom GRUB patch or is there a more
> general interest in this?

Not sure if it ought to be a grub patch - the issue could as well
be dealt with in Xen, by concatenating modules to form a monolithic
initrd.

Jan

