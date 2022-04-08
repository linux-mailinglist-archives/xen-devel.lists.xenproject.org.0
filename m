Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856464F937C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301401.514366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmTJ-0001Bi-9k; Fri, 08 Apr 2022 11:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301401.514366; Fri, 08 Apr 2022 11:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmTJ-00019W-6d; Fri, 08 Apr 2022 11:08:09 +0000
Received: by outflank-mailman (input) for mailman id 301401;
 Fri, 08 Apr 2022 11:08:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncmTG-00019P-Ui
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:08:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncmTF-0000PT-DN; Fri, 08 Apr 2022 11:08:05 +0000
Received: from [54.239.6.190] (helo=[192.168.16.176])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncmTF-0002wI-6b; Fri, 08 Apr 2022 11:08:05 +0000
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
	bh=osVK69YQoPVCEAYXBk/+qr/6y9mMC14WucU8SEetKRc=; b=BEkFW9Msn62Ndi11entcRDj0eh
	kTdy/bvs3jkvKeEav4MGp5smiv7GtPChk9CXODWXxKd3dKcj2S1jC7O/IQW1NT1cmL/aSbfCGbY5K
	v0p75Vx1qNpMGiJqjwJ7c2UNGVAejAz1LkLd3YwBC/byiHfeb/l81bZIvmoXuRE2sla8=;
Message-ID: <ab27a3c3-a85d-b9aa-de0c-ca96f3e2a3fc@xen.org>
Date: Fri, 8 Apr 2022 12:08:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <osstest-169199-mainreport@xen.org>
 <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
 <Yk/tzuKq4D3mFEQu@Air-de-Roger>
 <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com>
 <YlAWBom8O8d1lCpQ@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YlAWBom8O8d1lCpQ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/04/2022 12:01, Roger Pau Monné wrote:
>>> I could add a suitable dom0_max_vcpus parameter to osstest.  XenServer
>>> uses 16 for example.
>>
>> I'm afraid a fixed number won't do, the more that iirc there are
>> systems with just a few cores in the pool (and you don't want to
>> over-commit by default).
> 
> But this won't over commit, it would just assign dom0 16 vCPUs at
> most, if the system has less than 16 vCPUs that's what would be
> assigned to dom0.

AFAICT, this is not the case on Arm. If you ask 16 vCPUs, then you will 
get that number even if there are 8 pCPUs.

In fact, the documentation of dom0_max_vcpus suggests that the numbers 
of vCPUs can be more than the number of pCPUs.

Cheers,

-- 
Julien Grall

