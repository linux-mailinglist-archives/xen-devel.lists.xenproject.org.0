Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E66273E7C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 11:24:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKeX6-0002bq-St; Tue, 22 Sep 2020 09:24:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZDRM=C7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKeX4-0002bl-Ie
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 09:24:18 +0000
X-Inumbo-ID: 1a123225-611d-4396-ac72-edb6eb6d1a87
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a123225-611d-4396-ac72-edb6eb6d1a87;
 Tue, 22 Sep 2020 09:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=o0qQ9zs2pNDY6eqKf2EMNGBLby2BruIjY/l5lAYV8hc=; b=TSEtF0f0MvHpO9dr2fQRK5M8le
 SA2zoowCW5gtS4889g2wINxYuOXmuVjzQI/Ln/9uYSKEt52/iChae3hmVhP/vPRTNCXHPO1ckkhwz
 3KI4LoPp1eL2AKjJUWh2ZgQMZ88wTSfmq+vv7uSnLEC1qRyNCXOwh0/JAoOfz0N81rq0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKeX1-0001SY-6S; Tue, 22 Sep 2020 09:24:15 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKeX0-0003O0-TT; Tue, 22 Sep 2020 09:24:15 +0000
Subject: Re: Ping: [PATCH 1/9] build: use if_changed more consistently (and
 correctly) for prelink*.o
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <75d94bf1-b419-8a82-2d15-fb02e56109d8@suse.com>
 <de999174-604d-5874-cf11-4fab15c583d4@suse.com>
 <43a4240c-baba-ca52-0a9f-a884c0f297be@xen.org>
 <f6de6cc3-7bde-6f99-1525-cc046a136a19@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0a0ab7a6-e448-3ffe-3818-4b97edbffb72@xen.org>
Date: Tue, 22 Sep 2020 10:24:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f6de6cc3-7bde-6f99-1525-cc046a136a19@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 22/09/2020 09:28, Jan Beulich wrote:
> On 21.09.2020 13:39, Julien Grall wrote:
>> On 21/09/2020 11:17, Jan Beulich wrote:
>>> On 14.09.2020 12:15, Jan Beulich wrote:
>>>> Switch to $(call if_changed,ld) where possible; presumably not doing so
>>>> in e321576f4047 ("xen/build: start using if_changed") right away was an
>>>> oversight, as it did for Arm in (just) one case. It failed to add
>>>> prelink.o to $(targets), though, causing - judging from the observed
>>>> behavior on x86 - undue rebuilds of the final binary (because of
>>>> prelink.o getting rebuild for $(cmd_prelink.o) being empty, in turn
>>>> because of .prelink.o.cmd not getting read) during "make install-xen".
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>>    xen/arch/arm/Makefile |  4 +++-
>>>>    xen/arch/x86/Makefile | 18 ++++++++++--------
>>>>    2 files changed, 13 insertions(+), 9 deletions(-)
>>>
>>> May I ask for an Arm-side ack (or otherwise) here, please?
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks. On the Arm side this is actually addressing a (minor) bug,

Just to confirm, the bug is: Xen will be rebuilt when it is not 
necessary, right?

Cheers,

-- 
Julien Grall

