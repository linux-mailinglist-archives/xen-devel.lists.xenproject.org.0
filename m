Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F723D84F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:07:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3brw-0008TA-GW; Thu, 06 Aug 2020 09:07:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZxa=BQ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k3brv-0008T3-Hr
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:07:23 +0000
X-Inumbo-ID: fcc5e954-3ff2-4fc6-b734-cc3f96047b3d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcc5e954-3ff2-4fc6-b734-cc3f96047b3d;
 Thu, 06 Aug 2020 09:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JRMwKKEpbRfbvlV3oeNr75bWFNzkmlb2XMoM7s4VMVk=; b=Pk4EOddwR79+fK7wRoQ4HWv+Qi
 Ya6uWnB4A7OIt0hr2OTnEor+GR+68LkmbKanV/ewE+jqzVenkgdPmmp/Buvo/4lEa3/klkwlUC05O
 yV7TF3+BryftkfrtunOEinwEPjupMW5MDnu5TGWIj2zYoegI/Mr9CXEvk0Ogx86QYZKs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k3brt-0005vu-0U; Thu, 06 Aug 2020 09:07:21 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k3brs-00037n-PQ; Thu, 06 Aug 2020 09:07:20 +0000
Subject: Re: [PATCH 1/4] build: work around bash issue
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <b427e8e6-b9ff-65d2-074b-19439a2e3d02@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e8006147-31e5-d4c5-8c13-74250f267c0c@xen.org>
Date: Thu, 6 Aug 2020 10:07:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b427e8e6-b9ff-65d2-074b-19439a2e3d02@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 06/08/2020 10:04, Jan Beulich wrote:
> Older bash fails to honor "set -e" for certain built-in commands

"Older" is pretty vague. May I ask the exact version you run into the issue?

> ("while" here), despite the command's status correctly bein non-zero.
> The subsequent objcopy invocation now being separated by a semicolon
> results in no failure. Insert an explicit "exit" (replacing ; by &&
> ought to be another possible workaround).
> 
> Fixes: e321576f4047 ("xen/build: start using if_changed")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I've done a pretty light-weight audit of possible further instances of
> this issue, but didn't find any.
> 
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -193,7 +193,7 @@ define cmd_obj_init_o
>               echo "Error: size of $<:$$name is 0x$$sz" >&2; \
>               exit $$(expr $$idx + 1);; \
>           esac; \
> -    done; \
> +    done || exit $$?; \
>       $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
>   endef
>   
> 

Cheers,

-- 
Julien Grall

