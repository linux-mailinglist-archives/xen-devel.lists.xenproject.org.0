Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16631B2F73
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 20:45:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQxtF-0004Z4-RI; Tue, 21 Apr 2020 18:45:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wEXD=6F=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQxtE-0004Yz-8F
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 18:45:00 +0000
X-Inumbo-ID: 33f6a560-8400-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33f6a560-8400-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 18:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3LRpHjK56BbXSmp/E5Wp5stHCUvVNHhkgn/mMIlOrhM=; b=LoMkH8FFHvgYsF++CozfveQZeI
 t4Op3K1otGTctTHTuU3zl74R8X/TI42NDaGJFKWBijnPsJ3bjC0tVl1+plJ7sNZ8SRNt7J8vGhfWg
 emAFgx4MSrmfb5cboJ2uM5R0LdaEUnaJDH906q+4rA15sTbSVy/+fOYSxSSnfWXXO8Rg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQxtB-0006q3-SR; Tue, 21 Apr 2020 18:44:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQxtB-0001cU-Lp; Tue, 21 Apr 2020 18:44:57 +0000
Subject: Re: [PATCH v2 4/4] x86: adjustments to guest handle treatment
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
 <20200421173010.GY28601@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <524885c7-5189-7215-41e6-1652a8bd08a2@xen.org>
Date: Tue, 21 Apr 2020 19:44:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421173010.GY28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 21/04/2020 18:30, Roger Pau Monné wrote:
> On Tue, Apr 21, 2020 at 11:13:23AM +0200, Jan Beulich wrote:
>> First of all avoid excessive conversions. copy_{from,to}_guest(), for
>> example, work fine with all of XEN_GUEST_HANDLE{,_64,_PARAM}().
> 
> I'm not sure I understand the difference between those two, as they
> are both placeholders for linear guest addresses?
> 
> AFAICT XEN_GUEST_HANDLE should be used for guest pointers inside of an
> hypercall struct, while XEN_GUEST_HANDLE_PARAM is for guest pointers
> as hypercall arguments. But those are both just guest pointers,
> whether they are a parameter to the hypercall or a field in a
> struct, and hence could use the same type?
> 
> I assume there's some reason for not doing so, and I see the comment
> about other arches, but again a linear guest address is just that in
> all arches, regardless of it's placement.

On Arm:
  * XEN_GUEST_HANDLE() will always be 64-bit on both 32-bit and 64-bit 
hypervisor.
  * XEN_GUEST_HANDLE_PARAM() will be 32-bit for 32-bit hypervisor. For 
64-bit hypervisor, it will be 64-bit.

Per the ABI, each argument only fit a register. So you could not use 
XEN_GUEST_HANDLE() as now an argument will be held in 2 registers on 32-bit.

We also want the structure layout to be the same for 32-bit and 64-bit. 
So using XEN_GUEST_HANDLE_PARAM() everywhere is not the solution as the 
virtual address is not the same.

We could possibly convert internally XEN_GUEST_HANDLE_PARAM() to 
XEN_GUEST_HANDLE(), but I am not sure how this would be beneficial. We 
would have to use 2 registers for arm 32-bit everytime.

Cheers,

-- 
Julien Grall

