Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0732540BA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 10:25:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBDDV-0001wr-O5; Thu, 27 Aug 2020 08:25:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1Y6=CF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kBDDU-0001wh-3t
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 08:25:04 +0000
X-Inumbo-ID: 409f0b96-c856-4899-971f-681293df6558
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 409f0b96-c856-4899-971f-681293df6558;
 Thu, 27 Aug 2020 08:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=tah7sbYyym/3w+aX/e74nEPQijILN0VPHkEywFrp1sE=; b=YxvKa9LfGSJLMuIESTv3YnHcE/
 Q2WMxp+It0ZjvJwl+nAbyee00laoX2ncXbFnTwWhSBPyuEnFSHEY0Ug6AKNwQQLxnTPAJEO10FQ62
 /rP0GtBrcqkuTt+wHISObOeqrfs51vGSvJ7qn8lFlLnLAR9/BXGbAQlHOX1OBpu6PJSA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kBDDR-0000ok-JZ; Thu, 27 Aug 2020 08:25:01 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kBDDR-0004n8-BJ; Thu, 27 Aug 2020 08:25:01 +0000
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Simon Leiner <simon@leiner.me>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
 <eb1c9e1a-d8b5-cfd5-4575-3ae47f99ad44@xen.org>
 <61f11689-8d6b-0407-b76d-ec5c3a57be4c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3a1cad1b-3d78-e5b0-0f68-70c245dbcc1a@xen.org>
Date: Thu, 27 Aug 2020 09:24:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <61f11689-8d6b-0407-b76d-ec5c3a57be4c@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 27/08/2020 06:21, Jürgen Groß wrote:
> On 26.08.20 20:37, Julien Grall wrote:
> "Usually" is a bit gross here. The only generic call site I could find
> is xenbus_grant_ring(). All other instances (I counted 22) are not
> generic at all.
> 
>> will only catch one instance and it means we would have to fix the 
>> first instance and then re-run to catch the others.
>>
>> So I think we want to switch to WARN_ON() here.
> 
> No, please don't. In case there would be a frequent path the result
> would be a basically unusable system due to massive console clobbering.

Right, but if that's really happenning then you have a much bigger 
problem on your platform because the address returned will be invalid.

So I still don't see the advantage of WARN_ON_ONCE() here.

Cheers,

> 
> 
> Juergen

-- 
Julien Grall

