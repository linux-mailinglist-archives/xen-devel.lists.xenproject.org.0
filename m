Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002964D7BE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 09:30:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463131.721270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jcm-0000Hg-A4; Thu, 15 Dec 2022 08:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463131.721270; Thu, 15 Dec 2022 08:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jcm-0000Ei-6s; Thu, 15 Dec 2022 08:29:52 +0000
Received: by outflank-mailman (input) for mailman id 463131;
 Thu, 15 Dec 2022 08:29:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5jck-0000Ec-JP
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 08:29:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5jcX-0004ao-Ip; Thu, 15 Dec 2022 08:29:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5jcX-00089F-C1; Thu, 15 Dec 2022 08:29:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=lY+oKwmn34YirV4nmM1TKwDRiogOejpXJXfDxIqG6aI=; b=O25jp2oBA/yPZIP+fAupay8uAX
	xnn48u6VcUrIZVpOGtMt/USrX50DKdxR8FepCF7v6bLUCZtVvdlab/BEVDChvwu7cwobZIPFxfQPH
	rjz/J2NunK6zuO/pCizM3vOUTS+gcSObmbpnuKMERt9eXAl4qgkIH74yw8lk5fW60Ekk=;
Message-ID: <43f639ec-5884-0bd1-2db4-f5cdde9dde86@xen.org>
Date: Thu, 15 Dec 2022 08:29:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 0/3] xen/spinlock: make recursive spinlocks a
 dedicated type
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 Paul Durrant <paul@xen.org>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org
References: <20220910154959.15971-1-jgross@suse.com>
 <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>
 <d28412f2-2b94-5c69-c43f-481634562356@suse.com>
 <d57129f5-cfaf-0ed7-0dac-985b3a646b79@apertussolutions.com>
 <0fef4389-0373-b214-800c-f2457676e929@suse.com>
 <5b948f88-7757-7506-aa53-26308893fddf@suse.com>
 <9cf592ef-fa3c-251a-97a3-2f0e8f4f2a0b@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <9cf592ef-fa3c-251a-97a3-2f0e8f4f2a0b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/12/2022 08:03, Juergen Gross wrote:
> Might be, but do we really want that?
> 
> Wouldn't it make more sense to let the user explicitly say that he wants 
> a lock
> to be taken non-recursively? Allowing "spin_lock()" would add some more 
> risk to
> use it by accident e.g. because of copy/paste without noticing that it is a
> recursive lock that is taken non-recursively. Same applies for patch 
> reviews.
> 
> I'd prefer to make this easily visible.

FWIW, +1.

Cheers,

-- 
Julien Grall

