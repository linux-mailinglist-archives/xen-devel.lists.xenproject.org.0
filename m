Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720851F6AF3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 17:28:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjP7K-0002zW-4z; Thu, 11 Jun 2020 15:27:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmH/=7Y=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjP7J-0002zR-1a
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 15:27:45 +0000
X-Inumbo-ID: 187d73fc-abf8-11ea-b542-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 187d73fc-abf8-11ea-b542-12813bfff9fa;
 Thu, 11 Jun 2020 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v3o0fdGPjH5JumEICjeM0imsdOhAX0jac0IKcKYHn0k=; b=bU83A8XsYPRiUMsENfRBDRJX4H
 0xMCFChUa/pKoXUausFNEX9SZwcj/SXE4EF8k3fC3csVkime3xkmvyJmRiIfUM4lUT+fryiJoAvsl
 wLBBlYO2iiHrin5Vk4Tpz69bdbF7+pvXBHdAvqAqHqBVWZ3853RLAOg7BLh8fRtvF4cU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjP7F-00078C-Dc; Thu, 11 Jun 2020 15:27:41 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjP7F-0000Jf-62; Thu, 11 Jun 2020 15:27:41 +0000
Subject: Re: Kexec and libxenctlr.so
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, "wl@xen.org" <wl@xen.org>,
 daniel.kiper@oracle.com
References: <7a88218d-981e-6583-15a5-3fcaffb05294@amazon.com>
 <261293b1-f4c9-e41d-0c76-cd47fe5c0dc2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5602eebf-c149-17f7-37c9-b263ff290509@xen.org>
Date: Thu, 11 Jun 2020 16:27:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <261293b1-f4c9-e41d-0c76-cd47fe5c0dc2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 11/06/2020 16:21, Jürgen Groß wrote:
> On 11.06.20 16:57, Julien Grall wrote:
>> Hi all,
>>
>> kexec-tools has an option to load dynamically libxenctlr.so (not 
>> .so.4.x) (see [1]).
>>
>> Given that the library has never been considered stable, it is 
>> probably a disaster that is waiting to happen.
>>
>> Looking at the tree kexec is using the follow libxc functions:
>>     - xc_kexec_get_range()
>>     - xc_kexec_load()
>>     - xc_kexec_unload()
>>     - xc_kexec_status()
>>     - xc_kexec_exec()
>>     - xc_version()
>>     - xc_interface_open()
>>     - xc_interface_close()
>>     - xc_get_max_cpus()
>>     - xc_get_machine_memory_map()
>>
>> I think it is uncontroversial that we want a new stable library for 
>> all the xc_kexec_* functions (maybe libxenexec)?
>>
>> However I am not entirely sure where to put the others.
>>
>> I am thinking to introduce libxensysctl for xc_get_max_cpus() as it is 
>> a XEN_SYSCTL. We could possibly include xc_get_machine_memory_map() 
>> (despite it is a XENMEM_).
>>
>> For xc_version(), I am thinking to extend libxentoolcore to also 
>> include "stable xen API".
>>
>> Any opinion on the approach?
> 
> You could consider hypfs (at least for some of the functionality).

That would work!

> 
> xc_version() and xc_get_max_cpus() would be rather easy.

I am guessing we will need a fallback to the normal hypercalls if hypfs 
is not present.

> xc_get_machine_memory_map() is using a stable hypercall used by
> the kernel, too.

IIUC, you are suggesting to put this one in hypfs library as well. Is 
that correct?

Thank you for the input!

Cheers,

-- 
Julien Grall

