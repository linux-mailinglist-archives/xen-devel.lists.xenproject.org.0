Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B72008FC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 14:49:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGSF-0005EP-LE; Fri, 19 Jun 2020 12:49:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jmGSE-0005EI-TK
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 12:49:10 +0000
X-Inumbo-ID: 4424b8b0-b22b-11ea-bb7a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4424b8b0-b22b-11ea-bb7a-12813bfff9fa;
 Fri, 19 Jun 2020 12:49:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59BD8ABCE;
 Fri, 19 Jun 2020 12:49:07 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/msr: Disallow access to Processor Trace MSRs
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <20200619115823.22243-1-andrew.cooper3@citrix.com>
 <1417373854.10164826.1592568614663.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6c7f9f8-9c9e-9648-1c51-43db38cb0b00@suse.com>
Date: Fri, 19 Jun 2020 14:49:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1417373854.10164826.1592568614663.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.06.2020 14:10, Michał Leszczyński wrote:
> ----- 19 cze 2020 o 13:58, Andrew Cooper andrew.cooper3@citrix.com napisał(a):
> 
>> We do not expose the feature to guests, so should disallow access to the
>> respective MSRs.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Paul Durrant <paul@xen.org>
>> CC: Michał Leszczyński <michal.leszczynski@cert.pl>
>>
>> Paul: For 4.14.  This needs backporting to older trees as well.
>>
>> Michał: CC'ing, just to keep you in the loop.  Xen has some dubious default
>> MSR semantics which we're still in the middle of untangling in a backwards
>> compatible way.  Patches like this will eventually not be necessary, but they
>> are for now.
> 
> 
> As for external IPT monitoring, it would be best if the VM would think
> that IPT is simply not supported at all by the underlying hypervisor.

This is already the case, isn't it? Yet not reporting a feature may
not keep a guest from trying to access the respective MSRs.

Jan

