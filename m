Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7270D19B81A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 00:05:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJlPb-0002Dc-BG; Wed, 01 Apr 2020 22:00:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=46oD=5R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJlPZ-0002DW-DB
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 22:00:37 +0000
X-Inumbo-ID: 37710e8e-7464-11ea-bb47-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37710e8e-7464-11ea-bb47-12813bfff9fa;
 Wed, 01 Apr 2020 22:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6nyrWK1yF9oHz/OXopTejPK3X0T3tRoyoqYe5Go48FU=; b=LCq51/uxgQbCFIpqU/DwI4gikX
 6EZU5KP3VixUGE3BoqL/gHnFGM0HR0UpIsH55TSegetCjkGXCOZt5yzNcbY+JSqLiOyYGduaQu+aS
 8CLD9a9MVyPfoTSyS9hV9GuQqkfjovW5WU79pV2o8Dy25ev9xyi805I1GUI2eCREojWw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJlPP-0005Mw-S8; Wed, 01 Apr 2020 22:00:27 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJlPP-00005J-L6; Wed, 01 Apr 2020 22:00:27 +0000
Subject: Re: [PATCH 0/8] Fix build with using OCaml 4.06.1 and -safe-string
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200330192157.1335-1-julien@xen.org>
 <24195.9951.944818.756019@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b90a8cb4-64a6-bda3-6d9f-3a962105455a@xen.org>
Date: Wed, 1 Apr 2020 23:00:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <24195.9951.944818.756019@mariner.uk.xensource.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Ian,

On 31/03/2020 12:17, Ian Jackson wrote:
> Julien Grall writes ("[PATCH 0/8] Fix build with using OCaml 4.06.1 and -safe-string"):
>> This series is meant to solve the build issue reported by Dario when
>> using recent version of OCaml and -safe-string.
> 
> Thanks.  I have reviewed the C tools parts here.  I think the ocaml
> parts ought to have a review from someone familiar with the ocaml FFI.
> 
>> I took the opportunity to harden a bit more the code by using const more
>> often.
> 
> I approve.
> 
> Perhaps we should start building our C code with -Wwrite-strings,
> which makes "" have type const char* ?  Result would be a giant
> constification patch, probably.

So I thought I would give a try and see how far I can go:

    * hypervisor (xen): It is fairly easy to convert, although this is 
touching code that was imported from other projects (such as acpica). I 
need to have a look at whether other projects fixed there code and we 
can backport.
    * libxc: This is pretty trivial, I will send a patch for it
    * libxl: This is where it is getting tricky, the main issue is the 
flexarray framework as we would use it with string (now const char *). I 
thought we could make the interface const, but it looks like there are a 
couple of places where we need to modify the content (such as in 
libxl_json.c). I am not sure yet how to deal with it.

In any case, even if we can't use -Wwrite-strings, I can still send 
patches to use const in more places.

Cheers,

-- 
Julien Grall

