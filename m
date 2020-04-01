Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274A919A900
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 11:58:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJa46-0006Vc-Hb; Wed, 01 Apr 2020 09:53:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=46oD=5R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJa44-0006VV-Nb
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 09:53:40 +0000
X-Inumbo-ID: aa2bc100-73fe-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa2bc100-73fe-11ea-9e09-bc764e2007e4;
 Wed, 01 Apr 2020 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=21/R/2NJ0AKJSZg398rGKMrjdex9rZryeAqLLM+m8Ks=; b=D7xXYDcLu8tWdTBn+VlaKKYK8b
 h/zVWbRuBk+W1cZWOpUfCVfdCRK1tkS5QFzNJN+1E9W3Y4yYUb6v3smmjiHSDuaoKrD5p4Mus0N6h
 sQ/kUgATVo2v2z286fFrVgVbPcryy3tZItaTFlilzZuu1vcnveSRVtr59hpeH2yNEb/Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJa42-0007Pw-97; Wed, 01 Apr 2020 09:53:38 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJa42-0002iD-34; Wed, 01 Apr 2020 09:53:38 +0000
Subject: Re: [PATCH 2/8] xen/public: sysctl: set_parameter.params and
 debug.keys should be const
To: Jan Beulich <jbeulich@suse.com>
References: <20200330192157.1335-1-julien@xen.org>
 <20200330192157.1335-3-julien@xen.org>
 <81a7f1a5-6fce-a996-9bcb-0fe6dfe05e30@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e4ded9cd-069e-bceb-d183-3756b9825161@xen.org>
Date: Wed, 1 Apr 2020 10:53:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <81a7f1a5-6fce-a996-9bcb-0fe6dfe05e30@suse.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, dfaggioli@suse.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 31/03/2020 08:30, Jan Beulich wrote:
> On 30.03.2020 21:21, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The fields set_parameter.params and debug.keys should never be modified
>> by the hypervisor. So mark them as const.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
>> I am not entirely sure whether we should bump the systcl version for
>> this change. Any thoughts?
> 
> No, it should be left as is - it's about _binary_ compatibility (e.g.
> if structure layout changes, or a sub-function gets dropped). The
> need to potentially address build issues resulting from changes like
> the one here isn't covered by it, but by the __XEN__ / __XEN_TOOLS__
> conditional at the top of the header.

Thank you for the examplanation! I will commit the patch.

Cheers,

-- 
Julien Grall

