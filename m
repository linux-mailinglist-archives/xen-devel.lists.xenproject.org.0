Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E572343F8
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 12:13:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1S22-00065V-10; Fri, 31 Jul 2020 10:12:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PAbA=BK=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1S20-00065Q-MK
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 10:12:52 +0000
X-Inumbo-ID: 64463996-d316-11ea-ab98-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64463996-d316-11ea-ab98-12813bfff9fa;
 Fri, 31 Jul 2020 10:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2zWe36xSudEC1Qe3mBC6X1dlmXW/MjuDSaccc+cISKY=; b=CSo8bO6jTKzu0goHo+3zVZ+IvU
 pfOx++B5s2NBTn0+Xs2VInSYIcZxldLqo0C9PfHFJ1xvh/2+Cc5hDDoA33M4/z/RpOFqdvQsw72N6
 LHKxAmvyuTxFlZk1EZHhhsfOUCZVqvUriKfl5pP2xclx8rBteufgd4ljCQIefLJ6MBqY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1S1w-0006Lx-BJ; Fri, 31 Jul 2020 10:12:48 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1S1w-0007A3-0X; Fri, 31 Jul 2020 10:12:48 +0000
Subject: Re: [PATCH v2] xen/arm: Convert runstate address during hypcall
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
 <8d2d7f03-450c-d50c-630b-8608c6d42bb9@suse.com>
 <FCAB700B-4617-4323-BE1E-B80DDA1806C1@arm.com>
 <1b046f2c-05c8-9276-a91e-fd55ec098bed@suse.com>
 <alpine.DEB.2.21.2007291356060.1767@sstabellini-ThinkPad-T480s>
 <1a8bbcc7-9d0c-9669-db7b-e837af279027@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <73c8ade5-36a3-cc13-80b6-bda89e175cbb@xen.org>
Date: Fri, 31 Jul 2020 11:12:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1a8bbcc7-9d0c-9669-db7b-e837af279027@suse.com>
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 31/07/2020 07:39, Jan Beulich wrote:
> We're fixing other issues without breaking the ABI. Where's the
> problem of backporting the kernel side change (which I anticipate
> to not be overly involved)?
This means you can't take advantage of the runstage on existing Linux 
without any modification.

> If the plan remains to be to make an ABI breaking change,

For a theoritical PoV, this is a ABI breakage. However, I fail to see 
how the restrictions added would affect OSes at least on Arm.

In particular, you can't change the VA -> PA on Arm without going 
through an invalid mapping. So I wouldn't expect this to happen for the 
runstate.

The only part that *may* be an issue is if the guest is registering the 
runstate with an initially invalid VA. Although, I have yet to see that 
in practice. Maybe you know?

>  then I
> think this will need an explicit vote.

I was under the impression that the two Arm maintainers (Stefano and I) 
already agreed with the approach here. Therefore, given the ABI breakage 
is only affecting Arm, why would we need a vote?

Cheers,

-- 
Julien Grall

