Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7308119E526
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 15:14:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKicN-0006Vt-IM; Sat, 04 Apr 2020 13:13:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKicL-0006Vn-La
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 13:13:45 +0000
X-Inumbo-ID: 1cc2e3a0-7676-11ea-be20-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1cc2e3a0-7676-11ea-be20-12813bfff9fa;
 Sat, 04 Apr 2020 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rtn2dIqkhpIfVgInY36chc0bEHX9bJJHJxfP9lteREM=; b=wI5BwdS0HKmympD9izz2RDcQ8s
 Br/mhTyDo6e24BAC+eWC3o3guScSRovab+Veq4Yew3uW6R4OClRYJgw+I+P5bhD8PClRP5mK6hpNL
 6jbQK0P3g4eP+FWoJMroUUfh+R2WwinQPcYKlyoBREZm8J5aneJ6RadGYSqp+V5M3DaU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKicE-0008Lj-TE; Sat, 04 Apr 2020 13:13:38 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKicE-0008AH-JI; Sat, 04 Apr 2020 13:13:38 +0000
Subject: Re: [PATCH 0/7] xen: Consolidate asm-*/guest_access.h in
 xen/guest_access.h
To: xen-devel@lists.xenproject.org
References: <20200404131017.27330-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <02ace867-646b-adf5-c341-92d9042340a3@xen.org>
Date: Sat, 4 Apr 2020 14:13:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200404131017.27330-1-julien@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/04/2020 14:10, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> A lot of the helpers implemented in asm-*/guest_access.h are implemented
> the same way. This series aims to avoid the duplication and implement
> them only once in xen/guest_access.h.

I forgot to mention this is based on "xen/guest_access: Harden 
*copy_to_guest_offset() to prevent const dest operand" [1].

This will also clash with Jan's patch "guestcopy: evaluate 
{,__}copy{,_field}_to_guest*() arguments just once" [2]. I am happy to 
rebase this series on top of it.

Cheers,

[1] https://lore.kernel.org/xen-devel/20200404130613.26428-1-julien@xen.org/
[2] 
https://lore.kernel.org/xen-devel/9918b339-e914-7228-5f8e-86c82090b5bd@suse.com/

> 
> Cheers,
> 
> Julien Grall (7):
>    xen/guest_access: Add missing emacs magics
>    xen/arm: kernel: Re-order the includes
>    xen/arm: decode: Re-order the includes
>    xen/arm: guestcopy: Re-order the includes
>    xen: include xen/guest_access.h rather than asm/guest_access.h
>    xen/guest_access: Consolidate guest access helpers in
>      xen/guest_access.h
>    xen/guest_access: Fix coding style in xen/guest_access.h
> 
>   xen/arch/arm/decode.c                |   7 +-
>   xen/arch/arm/domain.c                |   2 +-
>   xen/arch/arm/guest_walk.c            |   3 +-
>   xen/arch/arm/guestcopy.c             |   5 +-
>   xen/arch/arm/kernel.c                |  12 +--
>   xen/arch/arm/vgic-v3-its.c           |   2 +-
>   xen/arch/x86/hvm/svm/svm.c           |   2 +-
>   xen/arch/x86/hvm/viridian/viridian.c |   2 +-
>   xen/arch/x86/hvm/vmx/vmx.c           |   2 +-
>   xen/common/libelf/libelf-loader.c    |   2 +-
>   xen/include/asm-arm/guest_access.h   | 132 ------------------------
>   xen/include/asm-x86/guest_access.h   | 129 ++---------------------
>   xen/include/xen/guest_access.h       | 149 +++++++++++++++++++++++++++
>   xen/lib/x86/private.h                |   2 +-
>   14 files changed, 178 insertions(+), 273 deletions(-)
> 

-- 
Julien Grall

