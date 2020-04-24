Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9931B7B0B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 18:03:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS0nk-0006r5-L8; Fri, 24 Apr 2020 16:03:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WQMg=6I=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jS0nj-0006qz-13
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 16:03:39 +0000
X-Inumbo-ID: 28dce3aa-8645-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28dce3aa-8645-11ea-9e09-bc764e2007e4;
 Fri, 24 Apr 2020 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=km2tNhygbS5JyFbHIAlrtTbSOfBt57LcUU+UeQl4Gyc=; b=2N+Oavz+Euet9G62ZFqHfh+c/6
 en/nfaZr6jpUiB95Jh4GIM+wZnBrPdFWFZW39Adakr/Lg8KW1B1MNWhRdl51m8hKDPnEDvqEYSQRH
 nV6DU6LgMFJHcbAUjZlV1FA0fidlaJnMxkyHCGKjEAEgh3lvFfaOu1N8oJNCAF6YZC4Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jS0nh-0004g1-J9; Fri, 24 Apr 2020 16:03:37 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jS0nh-0001qH-AT; Fri, 24 Apr 2020 16:03:37 +0000
Subject: Re: [PATCH] docs/designs: re-work the xenstore migration document...
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200424133736.737-1-paul@xen.org>
 <a1febde5-0a34-6480-6400-7142a6bb6f52@suse.com>
 <c7cb8073-44ef-c92e-2962-d427e1568748@xen.org>
 <8029c772-9c42-460c-e17c-85e18b32f102@suse.com>
 <7ae1bb1c-0029-c3f0-1565-e5f99effee51@xen.org>
 <33b38b41-9112-5a7f-7d3a-1663132b9603@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e614fa8c-cea6-43f3-0bf2-003eabb4ae8f@xen.org>
Date: Fri, 24 Apr 2020 17:03:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <33b38b41-9112-5a7f-7d3a-1663132b9603@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 24/04/2020 16:59, Jürgen Groß wrote:
> On 24.04.20 17:44, Julien Grall wrote:
> If I extend the record and do a downgrade I'm losing the information,
> too, as the old version won't read it in any case. BTW, extending the
> record is no problem, as the length is stored in the header. Unknown
> records (and extensions) will be just ignored when reading.

That's very much up to the implementation. An implementation may decide 
to bail out if the record is not an exact size.

> 
> In your case when reusing the paddings and doing a downgrade you would
> crash, as the paddings are no longer zero.
> 
> In case a downgrade should not be done due to vital information loss
> then you should just not do it.

Of course, however I don't think a user will necessarily know it should 
not do it. So how do you protect against misuse?

Cheers,

-- 
Julien Grall

