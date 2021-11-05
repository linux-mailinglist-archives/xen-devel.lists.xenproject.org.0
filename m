Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668EC4464D3
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 15:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222429.384613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj08p-0007Y5-Ps; Fri, 05 Nov 2021 14:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222429.384613; Fri, 05 Nov 2021 14:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj08p-0007WH-LA; Fri, 05 Nov 2021 14:24:27 +0000
Received: by outflank-mailman (input) for mailman id 222429;
 Fri, 05 Nov 2021 14:24:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJNx=PY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mj08o-0007W4-26
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 14:24:26 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 123d17b8-3e44-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 15:24:24 +0100 (CET)
Received: from [172.20.51.40] (50.216.66.194 [50.216.66.194]) by
 mx.zohomail.com with SMTPS id 1636122257858344.84417735095747;
 Fri, 5 Nov 2021 07:24:17 -0700 (PDT)
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
X-Inumbo-ID: 123d17b8-3e44-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; t=1636122261; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jnxG/rsByc0XvpNG7AYPU0jEArlHFJ0HZ4wJhARrdSMrAg7HDRr84vSTfA5g6OK5ROUfh7iDvdOZED5gk3rkSvoGlfQ7smxMq5fB5VOBOxQXCfHM+rQT7u14bMuhUmzEecym9NyEQGpirUbNqlNsgqOSudjPMNodRG15zB9IihU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1636122261; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ejx6XTr8UJAJxOcAsUPXtPka4YA3F0nyBW6RZkn0wM4=; 
	b=EiFi4UuF7GYiN/UbPL4V/pWvobhusmBD3PwGG7tpIwVa7uadVyPU+XpB8eL6WbzjuIg49M3RtM2QMqzKxLyzhIQvCno0Vy5sRCGdJ9oJqvUGiRY3IYk2JUACPYST8GZkjdGKBaDrTZtJBa100o2rI9zAWiik9BlTtTFmDJRQ+hE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1636122261;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ejx6XTr8UJAJxOcAsUPXtPka4YA3F0nyBW6RZkn0wM4=;
	b=aaydQ4z6/IHw2iq6ZB/ftumrfyR9c7roIm7VKUw5AhB8kirlZAH8VYljsCj+0R8t
	8u3vnhMtQ2x9CoC1EdEc6dYC38RqOsJEkFXfGerba2vfWrIILJkAmy8Q9hlGCm+tBnP
	TqT1oEo3PVcDQdPZQeNc/OIxSY563JPDCxJT/R44=
Subject: Re: [PATCH 4/5] xen/xsm: Improve fallback handling in xsm_fixup_ops()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-5-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <be3cc020-0dcf-57e8-dfd3-4ed19f52ea42@apertussolutions.com>
Date: Fri, 5 Nov 2021 10:22:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211105135555.24261-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/5/21 9:55 AM, Andrew Cooper wrote:
> The current xsm_fixup_ops() is just shy of a full page when compiled, and very
> fragile to NULL function pointer errors.
> 
> Address both of these issues with a minor piece of structure (ab)use.
> Introduce dummy_ops, and fixup the provided xsm_ops pointer by treating both
> as an array of unsigned longs.
> 
> The compiled size improvement speaks for itself:
> 
>    $ ../scripts/bloat-o-meter xen-syms-before xen-syms-after
>    add/remove: 1/0 grow/shrink: 0/1 up/down: 712/-3897 (-3185)
>    Function                                     old     new   delta
>    dummy_ops                                      -     712    +712
>    xsm_fixup_ops                               3987      90   -3897
> 
> and there is an additional safety check that will make it obvious during
> development if there is an issue with the fallback handling.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Daniel Smith <dpsmith@apertussolutions.com>


Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>


