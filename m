Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1B26DA90
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 13:43:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIsJZ-0006Di-1O; Thu, 17 Sep 2020 11:43:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIsJY-0006Dd-0S
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 11:43:00 +0000
X-Inumbo-ID: 6a15c8be-5dda-4249-917c-c00d3b7facc9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a15c8be-5dda-4249-917c-c00d3b7facc9;
 Thu, 17 Sep 2020 11:42:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600342978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owwiD+PmtcEPe+5U1Jb9rAgsD8BVM/ZWnOV7Ow7w8kY=;
 b=mMVl53cHi1I//D/PEIFzNg9hSG5mJvVtyXqIHC/eORv3hmqZuBnhZ+kWdx3kmyRPCTiUAn
 5/wLGA3XcTP4Hs7Cwpby+gGjgLmLwbS4UhJJuPwtnTJ5ZSlzR25eVdN5JKAaBIWNnT+e1m
 +jF3dQX0cG/FCaxG9mmwdfY+weGaAPXH0MkFwZ9q+4RxyJvoYKy/KjMg5D6tCd2pcPIFDJ
 L4eoQX5IQpfcvr1si1DCicZqFYwD6w+qKEdq3IRSHm/6ljSY2QjMvPoe82nelD3E+GtNfU
 C7+QLdlz8z+VAXdrLzdK2snHWMU5DIFpF2m1D/tS3s0BYTfrVlmgSwpcTcPwjQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4EA7FB350;
 Thu, 17 Sep 2020 11:43:32 +0000 (UTC)
Subject: Re: [PATCH] EFI: some easy constification
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Trammell Hudson <hudson@trmm.net>
References: <c2995533-7a14-e83a-9a2a-7f0346c161b0@suse.com>
 <20200917114027.GD19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d28d73b7-dc59-a9f3-5db8-e9089189ebe6@suse.com>
Date: Thu, 17 Sep 2020 13:42:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917114027.GD19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 17.09.2020 13:40, Roger Pau Monné wrote:
> On Thu, Sep 17, 2020 at 01:27:12PM +0200, Jan Beulich wrote:
>> Inspired by some of Trammell's suggestions, this harvests some low
>> hanging fruit, without needing to be concerned about the definitions of
>> the EFI interfaces themselves.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This is purely a non-functional change AFAICT?
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Indeed. Merely adding const with no other changes hardly can have
any functional effect, I think. Unless it broke the build in some
way, in which case I wouldn't [knowingly] have sent the patch.

Jan

