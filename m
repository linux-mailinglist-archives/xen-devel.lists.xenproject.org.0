Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2C7699335
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 12:36:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496475.767242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pScXi-0007qo-6L; Thu, 16 Feb 2023 11:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496475.767242; Thu, 16 Feb 2023 11:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pScXi-0007o6-2g; Thu, 16 Feb 2023 11:35:14 +0000
Received: by outflank-mailman (input) for mailman id 496475;
 Thu, 16 Feb 2023 11:35:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7p0N=6M=citrix.com=prvs=40464162c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pScXg-0007me-Ru
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 11:35:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f47672f5-aded-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 12:35:06 +0100 (CET)
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
X-Inumbo-ID: f47672f5-aded-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676547309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bPG+IKs3jCl4f6bGnU79qKb+PyDR4NqGoTeP9Duf/6o=;
  b=JRTMg73g24ncbUXqvhPVxDeQNwHfnBZbJC7ARd+0X+VdaLHhg8Qo2I1V
   H9Y6Xb8qjZtP+eVYuXit0N7JudKx/JJQf/RLik3NZ+kkxeqt9zJgKNI2w
   PgGy9goszQCUkY8iNG126TfoyaBxLebZvISk1Gs9klm69NPuHEHiiAgGd
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97293965
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:a4/akq2AMfM5cUdic/bD5eRxkn2cJEfYwER7XKvMYLTBsI5bp2RTn
 WpJC2nUM67ZazSnLtolOdjk8B8O7ZfXmIVrSwpqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZnO6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfOUNP3
 uxfDSw2fBXeofDn3ZKgU7Jor5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFJoPzx3J+
 D+uE2LRWA4iDfa1xCe8qWOprdbvs37jaKEQLejtnhJtqALKnTFCYPEMbnOguuWwgEO6X9NZK
 mQX9zAooKx081akJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQNcvrsMxSBQh3
 0WFmN6vDjtq2JWcUX+H/62YhS+zMyMSa2QFYEc5oRAtuoe55ttp11SWE4glSfTu5jHoJd3u6
 wiorQMuwJAPttwOioOprE3nmCv3orGcG2bZ+T7rdm6i6wp4YqusaIqp9UXX4J58EWqJcrWSl
 CNawpbDtYjiGbnIzXXQG7tVQNlF8t7faFXhbUhT847NHthH01qqZshu7T53Py+F2e5UKGayM
 Cc/Ve68jaK/3UdGj4ctP+pd6Oxwl8AM8OgJsdiFBueimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05k2TqF7lFi+V6n3FWKYbvqXfTlUnP7FZjTCTNFedt3KWmMIjVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zGLgBQliEJTPPriv85Y/XrfacmJb9JQJV6e5LUUJJ9Y0wMy4V47go
 hmAZ6Ov4Aan2SyccVzXNS4LhXGGdc8XkE/X9BcEZT6As0XPq671vM/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:Fq/oyqs9eQYUX5Q7AMYdrhxM7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="97293965"
Date: Thu, 16 Feb 2023 11:34:43 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 3/4] automation: Remove expired root certificates
 used to be used by let's encrypt
Message-ID: <Y+4UyiTCp4Q8Yttx@l14>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
 <20230215120208.35807-4-anthony.perard@citrix.com>
 <3caee35d-3c0d-7e28-dc66-6f422568edad@citrix.com>
 <alpine.DEB.2.22.394.2302151608320.2127160@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2302151608320.2127160@ubuntu-linux-20-04-desktop>

On Wed, Feb 15, 2023 at 04:14:53PM -0800, Stefano Stabellini wrote:
> On Wed, 15 Feb 2023, Andrew Cooper wrote:
> > Honestly, I think I'd prefer to drop all of these legacy versions...
> 
> Good timing! It just so happens that we need to shave some of the old
> container tests as we have too many build tests on x86 :-)
> 
> I would remove Jessie as it reached EOL years ago. Do we really need
> both Centos 7 and 7.2? If not, we could remove 7.

Actually, 7.2 is older than 7, so I would remove 7.2. (7 would be 7.x so
latest 7 which is 7.9.)

> That leaves us with Trusty and Centos 7.2 among these. I would be
> tempted to keep Trusty and add the sed hack of this patch to make it
> work. For Centos 7.2, the hack looks even worse. Would it solve the
> problem to upgrade to the latest Centos 7.x subrelease? Is there really
> no other way to solve the problem?

So for centos7, the blacklist of the expired root certificate isn't
needed if we simply run `yum update` which for some reason is missing
from the dockerfile...

Thanks,

-- 
Anthony PERARD

