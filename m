Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2467D294B4B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 12:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9981.26336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVBQa-0006WN-RX; Wed, 21 Oct 2020 10:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9981.26336; Wed, 21 Oct 2020 10:33:08 +0000
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
	id 1kVBQa-0006Vy-OF; Wed, 21 Oct 2020 10:33:08 +0000
Received: by outflank-mailman (input) for mailman id 9981;
 Wed, 21 Oct 2020 10:33:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVBQZ-0006Vo-E2
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:33:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56b049c3-6dd2-4b41-a2cf-63cef2155d93;
 Wed, 21 Oct 2020 10:33:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C24A7ACA1;
 Wed, 21 Oct 2020 10:33:05 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVBQZ-0006Vo-E2
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:33:07 +0000
X-Inumbo-ID: 56b049c3-6dd2-4b41-a2cf-63cef2155d93
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 56b049c3-6dd2-4b41-a2cf-63cef2155d93;
	Wed, 21 Oct 2020 10:33:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603276385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RIz6Fh1/9dRHRoJ4gps/Px3tXLhgXeXwx/bPJoKNxXw=;
	b=uYe7eMD26aZhibgoxe8vu3VSsAzWec/Nyqeuf3ySjVcg6YN7beo2GOqFZcnMcmbErzIvPl
	Xa+KkN2uVkKtADPzoXvd1z1rslwHgb5mW+yH6wNtF9/OWEyNTowuyWZMd44/2l+cC6dD/h
	OkNrk/NAUDoY5Sr90HRYZpDQjh+LEow=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C24A7ACA1;
	Wed, 21 Oct 2020 10:33:05 +0000 (UTC)
Subject: Re: i915 dma faults on Xen
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, intel-gfx@lists.freedesktop.org,
 xen-devel <xen-devel@lists.xenproject.org>
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com>
 <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
 <CAKf6xps1q9zMBeFg7C7ZhD-JcwQ6EG6+bYvvA9QT8PzzxKqMNg@mail.gmail.com>
 <20201021095809.o53b6hpvjl2lbqsi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a855e542-4e12-14e2-b663-75e2efceb937@suse.com>
Date: Wed, 21 Oct 2020 12:33:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201021095809.o53b6hpvjl2lbqsi@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.10.2020 11:58, Roger Pau Monné wrote:
> On Fri, Oct 16, 2020 at 12:23:22PM -0400, Jason Andryuk wrote:
>> The RMRRs are:
>> (XEN) [VT-D]Host address width 39
>> (XEN) [VT-D]found ACPI_DMAR_DRHD:
>> (XEN) [VT-D]  dmaru->address = fed90000
>> (XEN) [VT-D]drhd->address = fed90000 iommu->reg = ffff82c00021d000
>> (XEN) [VT-D]cap = 1c0000c40660462 ecap = 19e2ff0505e
>> (XEN) [VT-D] endpoint: 0000:00:02.0
>> (XEN) [VT-D]found ACPI_DMAR_DRHD:
>> (XEN) [VT-D]  dmaru->address = fed91000
>> (XEN) [VT-D]drhd->address = fed91000 iommu->reg = ffff82c00021f000
>> (XEN) [VT-D]cap = d2008c40660462 ecap = f050da
>> (XEN) [VT-D] IOAPIC: 0000:00:1e.7
>> (XEN) [VT-D] MSI HPET: 0000:00:1e.6
>> (XEN) [VT-D]  flags: INCLUDE_ALL
>> (XEN) [VT-D]found ACPI_DMAR_RMRR:
>> (XEN) [VT-D] endpoint: 0000:00:14.0
>> (XEN) [VT-D]dmar.c:615:   RMRR region: base_addr 78863000 end_addr 78882fff
>> (XEN) [VT-D]found ACPI_DMAR_RMRR:
>> (XEN) [VT-D] endpoint: 0000:00:02.0
>> (XEN) [VT-D]dmar.c:615:   RMRR region: base_addr 7d000000 end_addr 7f7fffff
>> (XEN) [VT-D]found ACPI_DMAR_RMRR:
>> (XEN) [VT-D] endpoint: 0000:00:16.7
>> (XEN) [VT-D]dmar.c:581:  Non-existent device (0000:00:16.7) is
>> reported in RMRR (78907000, 78986fff)'s scope!
>> (XEN) [VT-D]dmar.c:596:   Ignore the RMRR (78907000, 78986fff) due to
> 
> This is also part of a reserved region, so should be added to the
> iommu page tables anyway regardless of this message.

Could you clarify why you think so? RMRRs are tied to devices, so
if a device in reality doesn't exist (and no other one uses the
same range), I don't see why an IOMMU mapping would be needed
(unless to work around some related firmware bug). Plus aiui none
of the IOMMU faults actually report this range as having got
accessed.

Jan

