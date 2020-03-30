Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44FC19856A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 22:36:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJ15Z-0003qo-Pi; Mon, 30 Mar 2020 20:32:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJ15Y-0003qj-B0
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 20:32:52 +0000
X-Inumbo-ID: a0ad9e4e-72c5-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0ad9e4e-72c5-11ea-83d8-bc764e2007e4;
 Mon, 30 Mar 2020 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=si56M0grJb0MssyVvs1c7OVlZddA2qH5T0dDU1ySE18=; b=CtOFfS0GO8Z1yYW4s29uMGSPlb
 6LRxaU/vPnMHZrKEizLMzEPP4sbZCheY977FPwqGL12HG8fu8fbA1oo+KixvTsoETDOMfuy29AH69
 71QQ76mo/Cm4o+WI/DA+Y9SyVTVq8pcEnkUpL+0MzY0yAKCq8xdYsdCr8R6w10YeCLuU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJ15X-0005FC-Ip; Mon, 30 Mar 2020 20:32:51 +0000
Received: from cpc91226-cmbg18-2-0-cust12.5-4.cable.virginm.net ([82.0.29.13]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJ15X-0001zF-Cu; Mon, 30 Mar 2020 20:32:51 +0000
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <ac7e2df75c70affd992ed68b7d3e189fa59fa709.camel@suse.com>
 <671346c5-cb0c-4bc9-8124-07beeb5cbf73@xen.org>
 <f828909bab87d11f81ab216290db045b94ec0228.camel@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ea53cd6b-ce69-0ad8-e62e-60372c5eb75a@xen.org>
Date: Mon, 30 Mar 2020 21:32:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f828909bab87d11f81ab216290db045b94ec0228.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] Tools build failure with gcc-9.2.1
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Dario,

On 30/03/2020 11:58, Dario Faggioli wrote:
> On Sun, 2020-03-29 at 18:19 +0100, Julien Grall wrote:
>> On 25/03/2020 09:40, Dario Faggioli wrote:
>>> /usr/include/string.h:43:14: note: expected 'void * restrict' but
>>> argument is of type 'const char *'
>>>      43 | extern void *memcpy (void *__restrict __dest, const void
>>> *__restrict __src,
>>>         |              ^~~~~~
>>>
>>> When building with:
>>>
>>> gcc version 9.2.1 20200306 [revision
>>> c5edde44f5b17b4891f17a63517f355bbf89e7d3] (SUSE Linux)
>>>
>>> Already known and being dealt with?
>>
>> I suspect you have a new version of Ocaml built with -safe-string as
>> per
>> [1], String_Val() will return (const char *) rather than (char *).
>>
> Yep, I checked in the ocaml headers installed on the system, and that's
> exactly the case.
> 
>> I am looking at writing a patch for it and send it to xen-devel.
>>
> Cool, thanks! I'll be happy to test it. :-)

I have just posted the patches [1]. This was compiled with OCaml 4.10.x 
and -safe-string. Let me know if it fixes everything on your side.

Cheers,

[1] <20200330192157.1335-1-julien@xen.org>

-- 
Julien Grall

