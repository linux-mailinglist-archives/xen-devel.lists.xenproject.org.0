Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD3274814
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:24:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmxO-00088Y-SV; Tue, 22 Sep 2020 18:24:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZDRM=C7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKmxN-00088R-7o
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:24:01 +0000
X-Inumbo-ID: 5d4e3ac6-4fe0-4999-a665-bb51315787bf
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d4e3ac6-4fe0-4999-a665-bb51315787bf;
 Tue, 22 Sep 2020 18:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=WK8HqUc7UcXT7zlX5Zl6tFsFW86Pt1Pm4/72J/E5zi8=; b=1ofcBOoiSwSzf9zabW1OWUw/av
 0TW/3+hEqgt7J/+TlwcAPywC4QcXAkPXlQvTatTFmCWB+HLNABLThESuV8QlYXEZq5ekuHg5oxHzQ
 MT8JoIJaizubc/cu9nF2tN/zxyuunw3EQ9DDgFe4njI2xZUvAcpz6olSmOapkJT9AhN8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKmxJ-0005Rg-5R; Tue, 22 Sep 2020 18:23:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKmxI-0005IV-Uy; Tue, 22 Sep 2020 18:23:57 +0000
Subject: Re: [PATCH v4 3/4] xen: Remove mfn_to_gmfn macro
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-4-julien@xen.org>
 <e0783993-50b0-cdf4-895d-45ef8f40450b@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <67d2dc46-e2f1-1ab8-b91e-499498deff17@xen.org>
Date: Tue, 22 Sep 2020 19:23:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e0783993-50b0-cdf4-895d-45ef8f40450b@citrix.com>
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



On 21/09/2020 21:34, Andrew Cooper wrote:
> On 21/09/2020 19:02, Julien Grall wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> On x86, mfn_to_gmfn can be replaced with mfn_to_gfn. On Arm, there are
>> no more call to mfn_to_gmfn, so the helper can be dropped.
> 
> The previous patch dropped the mfn_to_gmfn() call from the domain shared
> info path, but without a hunk adjusting the innards of
> memory_exchange(), this is going to break the x86 build.

Urgh, I thought I build test it the code. I will fix it.

> 
>> At the same time rework a comment in Arm code that does not make sense.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
> 
> To save a round trip, Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com> with the appropriate hunk to memory_exchange().
> 
> Alternatively, it might make sense to fold the adjustment into patch 1
> which is perhaps more obvious, given the insertion of an is_pv_domain()
> check.

I will add in this patch unless someone else also prefer that the change 
is added in patch #1.

Cheers,

-- 
Julien Grall

