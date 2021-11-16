Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36E7452E50
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 10:45:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226225.390858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmv1H-0000gz-B7; Tue, 16 Nov 2021 09:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226225.390858; Tue, 16 Nov 2021 09:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmv1H-0000eB-6w; Tue, 16 Nov 2021 09:44:51 +0000
Received: by outflank-mailman (input) for mailman id 226225;
 Tue, 16 Nov 2021 09:44:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mmv1G-0000e5-9P
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 09:44:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmv1E-000094-Ew; Tue, 16 Nov 2021 09:44:48 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.85.43.125])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmv1E-0008Uy-9A; Tue, 16 Nov 2021 09:44:48 +0000
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
	bh=ITb0tgPz902cdlMepxHGSDer4HVCMmfvWUnvI3cVNYI=; b=179kQt3WxHkHpZKd27hOTNF931
	hpKDkOEKmdJj2XED7OrRubTkA+bAfUZ3JKiUs4wQwY7RHsOfwrNf6uyfMme7MYFcC4KGebgEFLjIg
	AgQ3LTPhg08kn4TfSrXzH7NRFOogznGJKml9Pfc6TmLg3+iF4saTu9wFQm4Ymft55XnA=;
Message-ID: <c9bc50d8-5840-2712-979d-df2b7b56f410@xen.org>
Date: Tue, 16 Nov 2021 09:44:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v3 00/10] direct-map memory map
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <9f883c45-05ec-f362-57e7-f87741da08d5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9f883c45-05ec-f362-57e7-f87741da08d5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 16/11/2021 07:49, Jan Beulich wrote:
> On 16.11.2021 07:31, Penny Zheng wrote:
>> v3 changes:
>> - move flag XEN_DOMCTL_CDF_INTERNAL_directmap back to xen/include/xen/domain.h,
>> to let it be only available for domain created by XEN.
>> - name it with extra "INTERNAL" and add comments to warn developers not
>> to accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag.
> 
> FTR I continue to object to the hijacking of a public interface bit for
> this purpose. Not to the degree of nak-ing the change, but still.

I remember this discussion in v1 and I am a bit confused why this was 
re-introduced. Looking at the thread, I think you and I were happy with 
the following approach:

   1) Switch the last parameter of domain_create() (i.e. bool is_priv) 
to flags.
   2) Define a bit in the parameter to indicate whether the domain will 
be direct-mapped.

Cheers,

-- 
Julien Grall

