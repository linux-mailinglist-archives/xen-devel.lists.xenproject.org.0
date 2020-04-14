Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4721A775A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:29:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOHsc-0008MJ-5t; Tue, 14 Apr 2020 09:29:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1gEY=56=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOHsa-0008MD-K2
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:29:16 +0000
X-Inumbo-ID: 68de0cba-7e32-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68de0cba-7e32-11ea-b4f4-bc764e2007e4;
 Tue, 14 Apr 2020 09:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BstlzNV+1YkHfdb9VV8d+U63o01aGz0GvTcEYIMnhh8=; b=fjCFSYUlz47YmoO/fD9AF24PHj
 z+gvHFmvq2K0vnmzl0ebkU26CrYIWliDTOMRrivProkXp4YT6eL2zbLED/IHLYRWkJxcFAW3KtdWc
 zL9ka2U3thWejhD8RFkyeqUoEsqktrLin5eMNoSAJkHXWvVoLO+lm5YuTQN+ct1cmMlM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOHsS-0005qt-KF; Tue, 14 Apr 2020 09:29:08 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOHsS-0002ed-DB; Tue, 14 Apr 2020 09:29:08 +0000
Subject: Re: [PATCH v7 09/12] xen: add runtime parameter access support to
 hypfs
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-10-jgross@suse.com>
 <f08bdac6-122a-9289-3241-a0460a73c686@suse.com>
 <1a68e135-2761-0ccd-11fc-45344a84757d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bdd65308-e549-c2b2-0de9-fb220d03f087@xen.org>
Date: Tue, 14 Apr 2020 10:29:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1a68e135-2761-0ccd-11fc-45344a84757d@suse.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 03/04/2020 16:31, Jürgen Groß wrote:
> On 03.04.20 16:51, Jan Beulich wrote:
>> On 02.04.2020 17:46, Juergen Gross wrote:
>>> V7:
>>> - fine tune some parameter initializations (Jan Beulich)
>>> - call custom_runtime_set_var() after updating the value
>>> - modify alignment in Arm linker script to 4 (Jan Beulich)
>>
>> I didn't ask for this to be unilaterally 4 - I don't think this
>> would work on Arm64, seeing that there are pointers inside the
>> struct. This wants to be pointer size, i.e. 4 for Arm32 but 8
>> for Arm64.

We don't allow unaligned access on Arm32, so if your structure happen to 
have a 64-bit value in it then you will get a crash at runtime.

For safety, it should neither be POINTER_ALIGN or 4, but 8. This is 
going to make your linker more robust.

Cheers,

-- 
Julien Grall

