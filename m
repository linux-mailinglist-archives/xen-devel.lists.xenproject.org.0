Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7711A778F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:45:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOI8b-0001ux-UO; Tue, 14 Apr 2020 09:45:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1gEY=56=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOI8a-0001uj-6o
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:45:48 +0000
X-Inumbo-ID: b7731f44-7e34-11ea-8912-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7731f44-7e34-11ea-8912-12813bfff9fa;
 Tue, 14 Apr 2020 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+GpQdcAzlMujF1Z4T9Zl+CYmfV4GeOBcon54F174VU8=; b=HoY3WQgDc80AD86yyAZ47i35xx
 bf3RHARJIh93WZBCNrnQzTbzUhw6+de/Z5Dpb3ZRjNVPJtN+vv6ucY6C9oS+Fy6CORCTvF88vtm3B
 GPukJ8CgOBW40j+KY17XZLFE1KPKiJzrZrcK25+R3+seY8h/jSOfsSthqR/DiALYFNhg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOI8S-0006Aj-Pi; Tue, 14 Apr 2020 09:45:40 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOI8S-0005JB-Ii; Tue, 14 Apr 2020 09:45:40 +0000
Subject: Re: [PATCH v7 09/12] xen: add runtime parameter access support to
 hypfs
To: Jan Beulich <jbeulich@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-10-jgross@suse.com>
 <f08bdac6-122a-9289-3241-a0460a73c686@suse.com>
 <1a68e135-2761-0ccd-11fc-45344a84757d@suse.com>
 <bdd65308-e549-c2b2-0de9-fb220d03f087@xen.org>
 <82cfcac7-225f-204b-e8fc-cbd04f9652e9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <06e72ae4-da0b-db3b-af43-0ba8970844dc@xen.org>
Date: Tue, 14 Apr 2020 10:45:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <82cfcac7-225f-204b-e8fc-cbd04f9652e9@suse.com>
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 14/04/2020 10:31, Jan Beulich wrote:
> On 14.04.2020 11:29, Julien Grall wrote:
>> On 03/04/2020 16:31, Jürgen Groß wrote:
>>> On 03.04.20 16:51, Jan Beulich wrote:
>>>> On 02.04.2020 17:46, Juergen Gross wrote:
>>>>> V7:
>>>>> - fine tune some parameter initializations (Jan Beulich)
>>>>> - call custom_runtime_set_var() after updating the value
>>>>> - modify alignment in Arm linker script to 4 (Jan Beulich)
>>>>
>>>> I didn't ask for this to be unilaterally 4 - I don't think this
>>>> would work on Arm64, seeing that there are pointers inside the
>>>> struct. This wants to be pointer size, i.e. 4 for Arm32 but 8
>>>> for Arm64.
>>
>> We don't allow unaligned access on Arm32, so if your structure happen to have a 64-bit value in it then you will get a crash at runtime.
>>
>> For safety, it should neither be POINTER_ALIGN or 4, but 8.
>> This is going to make your linker more robust.
> 
> Would you mind explaining to me why POINTER_ALIGN would be wrong
> when the most strictly aligned field in a structure is a pointer?
Both are valid with one difference though. If tomorrow someone send a 
patch to add a 64-bit in the structure, what are the chance one won't 
notice the alignment change? It is quite high.

If you align the section to 8, then you make your code more robust at 
the expense of possibly adding an extra 4-bytes in your binary.

Cheers,

-- 
Julien Grall

