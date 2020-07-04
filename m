Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A872146E6
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 17:29:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrk6K-0000fN-DH; Sat, 04 Jul 2020 15:29:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRhY=AP=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jrk6I-0000fH-De
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 15:29:10 +0000
X-Inumbo-ID: 1b0cb946-be0b-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b0cb946-be0b-11ea-bca7-bc764e2007e4;
 Sat, 04 Jul 2020 15:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J5n0FelEMPB/ub5oFiH/6XxPMZvyiGaUigA/UxUvVVg=; b=Xdx3SxFWYwF3c4pKlwDkheaqXA
 Cvudma8yPgVinpLMpooergLe2tcxeQuhpNjJYNZ8jUiI5S45+Nv3o1TQ8KN1TG/ap5nWmFqRe9LUZ
 rwbdy2zR0+/oPuY/XGSrO16yb8FzQqPKm6YMxcJMPvaNGFcm0dy9PDvkhA1h/oTISerM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrk6D-0006pI-KH; Sat, 04 Jul 2020 15:29:05 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrk6D-0005e5-9U; Sat, 04 Jul 2020 15:29:05 +0000
Subject: Re: [PATCH v4 for-4.14 2/2] pvcalls: Document correctly and
 explicitely the padding for all arches
To: xen-devel@lists.xenproject.org
References: <20200627095533.14145-1-julien@xen.org>
 <20200627095533.14145-3-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <b7f41be0-f1d2-2c3b-c79f-5d9763dfb5df@xen.org>
Date: Sat, 4 Jul 2020 16:29:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200627095533.14145-3-julien@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 27/06/2020 10:55, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The specification of pvcalls suggests there is padding for 32-bit x86
> at the end of most the structure. However, they are not described in
> in the public header.
> 
> Because of that all the structures would be 32-bit aligned and not
> 64-bit aligned for 32-bit x86.
> 
> For all the other architectures supported (Arm and 64-bit x86), the
> structure are aligned to 64-bit because they contain uint64_t field.
> Therefore all the structures contain implicit padding.
> 
> Given the specification is authoriitative, the padding will the same for
> the all architectures. The potential breakage of compatibility is ought
> to be fine as pvcalls is still a tech preview.
> 
> As an aside, the padding sadly cannot be mandated to be 0 as they are
> already present. So it is not going to be possible to use the padding
> for extending a command in the future.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

It looks like most of the comments are on the commit message. So rather 
than sending the series again, below a new version of the commit message:

"
The specification of pvcalls suggests there is padding for 32-bit x86
at the end of most the structure. However, they are not described in
in the public header.

Because of that all the structures would have a different size between 
32-bit x86 and 64-bit x86.

For all the other architectures supported (Arm and 64-bit x86), the
structure have the sames sizes because they contain implicit padding 
thanks to the 64-bit alinment of the field uint64_t field.

Given the specification is authoritative, the padding will now be the 
same for all architectures. The potential breakage of compatibility is 
ought to be fine as pvcalls is still a tech preview.
"

Cheers,


-- 
Julien Grall

