Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C91F2C3C3F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 10:37:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37497.69888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khrDj-0008Fp-6o; Wed, 25 Nov 2020 09:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37497.69888; Wed, 25 Nov 2020 09:36:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khrDj-0008FQ-3P; Wed, 25 Nov 2020 09:36:15 +0000
Received: by outflank-mailman (input) for mailman id 37497;
 Wed, 25 Nov 2020 09:36:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khrDh-0008FL-4c
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 09:36:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0d80d88-2568-4d52-8d74-6cb5bec0bd7d;
 Wed, 25 Nov 2020 09:36:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F054AC6A;
 Wed, 25 Nov 2020 09:36:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khrDh-0008FL-4c
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 09:36:13 +0000
X-Inumbo-ID: c0d80d88-2568-4d52-8d74-6cb5bec0bd7d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c0d80d88-2568-4d52-8d74-6cb5bec0bd7d;
	Wed, 25 Nov 2020 09:36:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606296971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0AxH2Dn0DtiSCSIRsyowpVLW9AeNSPjSK9xgXtYk0yM=;
	b=VkxU9j4BcdI4i7O6Fqe8Ztq6cCTzfG+02hKgVIRle5wUJXth61gZZY6gTWaHyqKuFamI87
	Vl/DifLxPPWKzx4SwLAwhXwwyP02u9CbwZJ4CayzJSTgCk396p+e8C5+P5SVl5yI6/Z0ay
	MNovyDIilYG9VYxLXp05hSFUH5k9aZg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2F054AC6A;
	Wed, 25 Nov 2020 09:36:11 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_disable_fifo, ...
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <pdurrant@amazon.com>, Eslam Elnikety <elnikety@amazon.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>
References: <20201124191751.11472-1-paul@xen.org>
 <20201124191751.11472-2-paul@xen.org>
 <444917ac-f2aa-5544-8f6c-097e7f57c98c@suse.com>
Message-ID: <19792219-22f0-e7ce-23ca-5c1b20d6f581@suse.com>
Date: Wed, 25 Nov 2020 10:36:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <444917ac-f2aa-5544-8f6c-097e7f57c98c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.11.2020 10:20, Jan Beulich wrote:
> On 24.11.2020 20:17, Paul Durrant wrote:
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
>>  #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
>>  #define _XEN_DOMCTL_CDF_nested_virt   6
>>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
>> +#define _XEN_DOMCTL_CDF_disable_fifo  7
>> +#define XEN_DOMCTL_CDF_disable_fifo   (1U << _XEN_DOMCTL_CDF_disable_fifo)
> 
> Despite getting longish, I think this needs "evtchn" somewhere in
> the name. To keep size bounded, maybe XEN_DOMCTL_CDF_no_fifo_evtchn?
> 
>>  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
>> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
>> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_disable_fifo
> 
> While not directly related to this patch, I'm puzzled by the
> presence of this constant: I've not been able to find any use of
> it. In particular you did have a need to modify
> sanitise_domain_config().

So it was you to introduce this, right away without any user, in
7fb0e134f8c6 ("tools/ocaml: abi: Use formal conversion and check
in more places"). The only reference is from what I regard as a
comment (I don't speak any ocaml, so I may be wrong). Could you
clarify why we need to maintain this constant?

Thanks, Jan

