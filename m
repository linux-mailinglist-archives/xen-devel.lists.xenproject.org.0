Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FDE1A45A3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 13:27:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMroJ-0005Cu-TP; Fri, 10 Apr 2020 11:26:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aV0t=52=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jMroI-0005Cp-P2
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 11:26:58 +0000
X-Inumbo-ID: 3055487a-7b1e-11ea-83ec-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3055487a-7b1e-11ea-83ec-12813bfff9fa;
 Fri, 10 Apr 2020 11:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUeTVCdLNng3fF60Gdjp3cnkGW2bzHR6Bi8mwsqtNWc=; b=li+uMMdHOQ7Ut5vqWDJ/yqcRuN
 c/Vs2DxiIBIHARk/Jut8HB46nVFQIhoFDn7mY0Fn4Jz+ifpxPRShMJu4YUkK4TK2cposLes7avnoA
 QMJ1JA1Sg4PFl4/GfKEU6a6a+MEZe4EtLNdBJhoX+ldpk9zD8WgCpI1B2yp7Opwo2fdI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMroF-0004db-U9; Fri, 10 Apr 2020 11:26:55 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMroF-0003sF-ND; Fri, 10 Apr 2020 11:26:55 +0000
Subject: Re: [PATCH v2 3/3] xen/x86: ioapic: Simplify ioapic_init()
To: Jan Beulich <jbeulich@suse.com>
References: <20200404102656.29730-1-julien@xen.org>
 <20200404102656.29730-4-julien@xen.org>
 <a7e761a8-118a-3d84-16a2-5428bc0d22c8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <56911e1b-8620-de40-72d0-f7ccf50bf97f@xen.org>
Date: Fri, 10 Apr 2020 12:26:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a7e761a8-118a-3d84-16a2-5428bc0d22c8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 06/04/2020 14:24, Jan Beulich wrote:
> On 04.04.2020 12:26, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since commit 9facd54a45 "x86/ioapic: Add register level checks to detect
>> bogus io-apic entries", Xen is able to cope with IO APICs not mapped in
>> the fixmap.
>>
>> Therefore the whole logic to allocate a fake page for some IO APICs is
>> unnecessary.
>>
>> With the logic removed, the code can be simplified a lot as we don't
>> need to go through all the IO APIC if SMP has not been detected or a
>> bogus zero IO-APIC address has been detected.
>>
>> To avoid another level of tabulation, the simplification is now moved in
>> its own function.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thank you! I took the liberty to push them.

Cheers,

-- 
Julien Grall

