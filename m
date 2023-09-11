Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ABC79AAEB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 20:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599741.935289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfm5y-0005PS-5d; Mon, 11 Sep 2023 18:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599741.935289; Mon, 11 Sep 2023 18:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfm5y-0005N4-31; Mon, 11 Sep 2023 18:57:14 +0000
Received: by outflank-mailman (input) for mailman id 599741;
 Mon, 11 Sep 2023 18:57:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipyp=E3=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qfm5w-0005My-S8
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 18:57:12 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0244c921-50d5-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 20:57:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 76BA68285C34;
 Mon, 11 Sep 2023 13:57:07 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IHGt4cUxl5RQ; Mon, 11 Sep 2023 13:57:06 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AEF4582867CA;
 Mon, 11 Sep 2023 13:57:06 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mdhhp1JbGqHU; Mon, 11 Sep 2023 13:57:06 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 3600B8285C34;
 Mon, 11 Sep 2023 13:57:06 -0500 (CDT)
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
X-Inumbo-ID: 0244c921-50d5-11ee-8785-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com AEF4582867CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694458626; bh=2v28jM0yeuH98iMYgzMtNN7A1RCdAp1K5rrZcy9bLwI=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=txg9ICt0BOqRJdFCWtHcieY94nmUwKzg2NMw0FwdoxysXA7kUNouhHWhv5JfEg57c
	 qCVHsvp9/FpBa/vzVNdU5k0ViLpeY74zJH5nj12S5RFcoScaCjpfVpeB2fkgpKGm78
	 rjkuQNOCYZ0i+u95fGemw0G1SUnpo+0ONuoqcay0=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <61a7f9ac-d57f-e64e-5796-b611515daf30@raptorengineering.com>
Date: Mon, 11 Sep 2023 13:57:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] include: make domain_page.h's stubs properly use
 type-unsafe MFN <-> virt helpers
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <9b5d517b-fbc0-d9ce-d6be-d4b8e3c0cc35@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <9b5d517b-fbc0-d9ce-d6be-d4b8e3c0cc35@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/23 1:38 AM, Jan Beulich wrote:
> The first of the commits referenced below didn't go far enough, and the
> 2nd of them, while trying to close (some of) the gap, wrongly kept using
> the potentially type-safe variant. This is getting in the way of new
> ports preferably not having any type-unsafe private code (and in
> particular not having a need for any overrides in newly introduced
> files).
> 
> Fixes: 41c48004d1d8 ("xen/mm: Use __virt_to_mfn in map_domain_page instead of virt_to_mfn")
> Fixes: f46b6197344f ("xen: Convert page_to_mfn and mfn_to_page to use typesafe MFN")
> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xen/domain_page.h
> +++ b/xen/include/xen/domain_page.h
> @@ -56,11 +56,11 @@ static inline void *__map_domain_page_gl
>  #define map_domain_page(mfn)                __mfn_to_virt(mfn_x(mfn))
>  #define __map_domain_page(pg)               page_to_virt(pg)
>  #define unmap_domain_page(va)               ((void)(va))
> -#define domain_page_map_to_mfn(va)          _mfn(virt_to_mfn((unsigned long)(va)))
> +#define domain_page_map_to_mfn(va)          _mfn(__virt_to_mfn((unsigned long)(va)))
>  
>  static inline void *map_domain_page_global(mfn_t mfn)
>  {
> -    return mfn_to_virt(mfn_x(mfn));
> +    return __mfn_to_virt(mfn_x(mfn));
>  }
>  
>  static inline void *__map_domain_page_global(const struct page_info *pg)

Reviewed-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

