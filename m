Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1566293691
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 10:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8966.24144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUmnv-0000d2-Aw; Tue, 20 Oct 2020 08:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8966.24144; Tue, 20 Oct 2020 08:15:35 +0000
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
	id 1kUmnv-0000cd-7C; Tue, 20 Oct 2020 08:15:35 +0000
Received: by outflank-mailman (input) for mailman id 8966;
 Tue, 20 Oct 2020 08:15:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUmnt-0000cY-6H
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 08:15:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c2ee5f0-32e1-4504-874a-3da47fcbb2c5;
 Tue, 20 Oct 2020 08:15:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79859AC6D;
 Tue, 20 Oct 2020 08:15:31 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUmnt-0000cY-6H
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 08:15:33 +0000
X-Inumbo-ID: 6c2ee5f0-32e1-4504-874a-3da47fcbb2c5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6c2ee5f0-32e1-4504-874a-3da47fcbb2c5;
	Tue, 20 Oct 2020 08:15:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603181731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LcSdpqMy4IhpO30RX9eV6Ws/DFikDuqIjDhsqzf0W8=;
	b=kgPjyDFXCDXNq6FnFRPVAA7+zKAn8tYRRRxrCMuah0Hig6GJXYxjCccKv3/T8fZQqTs4Dy
	jWejzJa6tNlxZv8OnjMCUeRIGqj7WAtgQpxetyr8sRhc12bgUs4XhrAR1u9LaSNh5IX7Po
	p3Mu/0xhZW4iO+Pf5YQr9fwAimVirbg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 79859AC6D;
	Tue, 20 Oct 2020 08:15:31 +0000 (UTC)
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
 <2cc5da3e-0ad0-4647-f1ca-190788c2910b@citrix.com>
 <3pKjdPYCiRimYjqHQP0xd_vqhoTOJqthTXOrY_rLeNvnQEpIF24gXDKgRhmr95JfARJzbVJVbfTrrJeiovGVHGbV0QBSZ2jez2Y_wt6db7g=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <768d9dbb-4387-099f-b489-7952d7e883b0@suse.com>
Date: Tue, 20 Oct 2020 10:15:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <3pKjdPYCiRimYjqHQP0xd_vqhoTOJqthTXOrY_rLeNvnQEpIF24gXDKgRhmr95JfARJzbVJVbfTrrJeiovGVHGbV0QBSZ2jez2Y_wt6db7g=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.10.2020 01:37, Dylanger Daly wrote:
>> This wants reporting (with sufficient data, i.e. at least a serial log)
> 
> Hm, I'm not sure there's UART on this Laptop, can I save the boot log somewhere?

If the systems remains sufficiently usable "xl dmesg" will give you
the log. But you won't be able to get away without a serial-like
console (USB2 debug port may be an alternative, if you have a
suitable cable and if the USB topology in the laptop doesn't
prevent it functioning). Yes, laptops are always problematic in
this regard.

Jan

