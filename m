Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C3624519D
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 19:31:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7019-0004js-L5; Sat, 15 Aug 2020 17:30:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zz9Y=BZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7018-0004jn-6Z
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 17:30:54 +0000
X-Inumbo-ID: c84d8f31-a07c-441c-a620-477a9040542a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c84d8f31-a07c-441c-a620-477a9040542a;
 Sat, 15 Aug 2020 17:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=yJqxU9lMiE+a3Fv429IhMJzKSz4RYuQrf9/UIaAUCFg=; b=4eV1aXoPWlabsf2WhHFG2x4WzO
 QjQTNcyv9U9q2WiodAlijbZ0aT+xrllIIuc2e/e9eqaaaRazaSd0hH4vznvC0YL5cxh3VESS1Pt22
 96jP+G9+wtzDHTu5DbbmeFiElzcQnYoD7uX2rupKFmGpYvoRVEGZDj6SNoA1Hx8Qvagg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k700z-0006Pu-2R; Sat, 15 Aug 2020 17:30:45 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k700y-00030y-M6; Sat, 15 Aug 2020 17:30:44 +0000
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <73ab810e-f7c0-14cd-c400-24ddeb79eda5@xen.org>
Date: Sat, 15 Aug 2020 18:30:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
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

Hi Oleksandr,

On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
> +static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
> +{

[...]

> +    /* Canonicalize read/write pointers to prevent their overflow. */
> +    while ( (s->bufioreq_handling == HVM_IOREQSRV_BUFIOREQ_ATOMIC) &&
> +            qw++ < IOREQ_BUFFER_SLOT_NUM &&
> +            pg->ptrs.read_pointer >= IOREQ_BUFFER_SLOT_NUM )
> +    {
> +        union bufioreq_pointers old = pg->ptrs, new;
> +        unsigned int n = old.read_pointer / IOREQ_BUFFER_SLOT_NUM;
> +
> +        new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
> +        new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
> +        cmpxchg(&pg->ptrs.full, old.full, new.full);

While working on the implementation of cmpxchg(), I realized the 
operation will happen on memory shared with a the emulator.

This will need to be switched to guest_cmpxchg64() to prevent a domain 
to DoS Xen on Arm.

I looked at the rest of the IOREQ and didn't notice any other example.

Cheers,

-- 
Julien Grall

