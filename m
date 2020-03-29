Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96265196EA3
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 19:23:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIbag-0005HY-Eg; Sun, 29 Mar 2020 17:19:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fisU=5O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIbae-0005HT-Vf
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 17:19:17 +0000
X-Inumbo-ID: 6adff2ce-71e1-11ea-b34e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6adff2ce-71e1-11ea-b34e-bc764e2007e4;
 Sun, 29 Mar 2020 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3r2xmY8rJjGGcpqpKHBDQ2I9pxZnSk0Oh4kuDuBGg04=; b=N9hflV2UkMiF22YeXWiwrKvoiN
 2fRJztUtM9dT2G9nb6rhAR7lT28HHN0i8tqeDir6V0SILqqtuwfYUSyVkfl4PsuUAY1+HwTXh5731
 wV5aAPF0D9kmfm9QpThEVZJ4GUIRK/5rl8C+gDjQLj82tAudeooCNlMUr+7FvfDBH6QY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIbae-0008OW-2s; Sun, 29 Mar 2020 17:19:16 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIbad-0003XX-SZ; Sun, 29 Mar 2020 17:19:16 +0000
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <ac7e2df75c70affd992ed68b7d3e189fa59fa709.camel@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <671346c5-cb0c-4bc9-8124-07beeb5cbf73@xen.org>
Date: Sun, 29 Mar 2020 18:19:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ac7e2df75c70affd992ed68b7d3e189fa59fa709.camel@suse.com>
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



On 25/03/2020 09:40, Dario Faggioli wrote:
> Hello,

Hi Dario,

> 
> Are the following errors (and more similar ones):
> 
>   CC       xenctrl_stubs.o
> In file included from /usr/lib64/ocaml/caml/alloc.h:24,
>                   from xenctrl_stubs.c:22:
> xenctrl_stubs.c: In function 'stub_xc_vcpu_context_get':
> /usr/lib64/ocaml/caml/mlvalues.h:265:24: error: passing argument 1 of 'memcpy' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>    265 | #define String_val(x) ((const char *) Bp_val(x))
>        |                       ~^~~~~~~~~~~~~~~~~~~~~~~~~
> xenctrl_stubs.c:502:9: note: in expansion of macro 'String_val'
>    502 |  memcpy(String_val(context), (char *) &ctxt.c, sizeof(ctxt.c));
>        |         ^~~~~~~~~~
> In file included from xenctrl_stubs.c:30:
> /usr/include/string.h:43:14: note: expected 'void * restrict' but argument is of type 'const char *'
>     43 | extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
>        |              ^~~~~~
> 
> When building with:
> 
> gcc version 9.2.1 20200306 [revision c5edde44f5b17b4891f17a63517f355bbf89e7d3] (SUSE Linux)
> 
> Already known and being dealt with?

I suspect you have a new version of Ocaml built with -safe-string as per 
[1], String_Val() will return (const char *) rather than (char *).

I am looking at writing a patch for it and send it to xen-devel.

Cheers,

[1] https://github.com/ocaml/ocaml/pull/1274

> 
> Regards
> 

-- 
Julien Grall

