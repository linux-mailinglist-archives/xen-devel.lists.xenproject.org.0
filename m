Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4E26D68E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 10:28:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIpHV-0004Zs-T0; Thu, 17 Sep 2020 08:28:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIpHU-0004Zn-Ug
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 08:28:41 +0000
X-Inumbo-ID: 256b27c1-0909-4b38-89bb-49ed5efeec1b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 256b27c1-0909-4b38-89bb-49ed5efeec1b;
 Thu, 17 Sep 2020 08:28:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600331318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGYrMTH7hRFIcnzWfSAIkJeNWFzhGYnJNoE/rDiwm+s=;
 b=NPC9MQi7x09kVc6xd/tFh/NkQ+KOfFaQj+AVSnyTU4xUsBM/BLDlaAnusNqxLE2u3fVJw2
 ITYR9sO+w34AS7Xyps0I1Zo7GwDdFRDK7CfRmcEpDcgEvqmD4EIlqgOQ8f1UjHx+57AQZ1
 hyzTFtER8glKOSvOowr8vxbcvjFTA5bp32ZbIGHdtjNa7ecfQ4Iuu8tciRLjzKvfeQ7CVG
 dd+fRues0eiEfT0GtFEh17m5tBQFzfSto8VxVr68lS2TpIw+3DhkcVxRHf9QgN5DcLORlG
 C9A/DTTv/tKeYtx+L5VDNVGRLmPGQDiws8x1NQbQy5rdk0al+UMtuicEwleCPA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4D20B4DC;
 Thu, 17 Sep 2020 08:29:09 +0000 (UTC)
Subject: Re: [PATCH 3/5] sched/arinc653: Clean up function definitions
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-4-jeff.kubascik@dornerworks.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c3f11088-cf5f-c3c1-d487-f0c719147c17@suse.com>
Date: Thu, 17 Sep 2020 10:09:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916181854.75563-4-jeff.kubascik@dornerworks.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 16.09.2020 20:18, Jeff Kubascik wrote:
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -119,10 +119,9 @@ static int dom_handle_cmp(const xen_domain_handle_t h1,
>      return memcmp(h1, h2, sizeof(xen_domain_handle_t));
>  }
>  
> -static struct sched_unit *find_unit(
> -    const struct scheduler *ops,
> -    xen_domain_handle_t handle,
> -    int unit_id)
> +static struct sched_unit *find_unit(const struct scheduler *ops,
> +                                    xen_domain_handle_t handle,
> +                                    int unit_id)
>  {

Just fyi, afaict we consider both variants legitimate style as far
as Xen as a whole is concerned; I'm unaware of scheduler code
specific restrictions (but I'll be happy to be corrected if I'm
wrong with this).

Instead what I'm wondering by merely seeing this piece of code is
whether unit_id really can go negative. If not (as would be the
common case with IDs), it would want converting to unsigned int,
which may be more important than the purely typographical
adjustment done here.

Jan

