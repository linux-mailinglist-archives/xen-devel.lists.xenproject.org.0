Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4002BAA74
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 13:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32149.63099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg5rW-0005Vq-1I; Fri, 20 Nov 2020 12:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32149.63099; Fri, 20 Nov 2020 12:50:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg5rV-0005U9-U4; Fri, 20 Nov 2020 12:50:01 +0000
Received: by outflank-mailman (input) for mailman id 32149;
 Fri, 20 Nov 2020 12:50:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg5rU-0005U3-Nn
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:50:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c9d0fa7-3621-4664-bc16-859c2f0339b2;
 Fri, 20 Nov 2020 12:50:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 441FCAC54;
 Fri, 20 Nov 2020 12:49:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg5rU-0005U3-Nn
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:50:00 +0000
X-Inumbo-ID: 0c9d0fa7-3621-4664-bc16-859c2f0339b2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0c9d0fa7-3621-4664-bc16-859c2f0339b2;
	Fri, 20 Nov 2020 12:50:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605876599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4Hh5f4iDAvskmK3yhQGv4nBpbYLAadWTv9j2Ooxa04=;
	b=URGxCB46a9ikHNFtOZjqW4jSc+vNs/+HwLIWrZTLk4Z+7uGc4FEFVkjl8Dgu6aubClvETp
	pieU9oramiW/o+pBBCGRbI51ebK5reHHZngNluLYiI7CpNcLk3ZvpI8W5dP6+1ZHlEv6s0
	aaA0cX7BzdkJ+HyzPDk0uv64eX8Kd6w=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 441FCAC54;
	Fri, 20 Nov 2020 12:49:59 +0000 (UTC)
Subject: Ping: [PATCH] gnttab: don't allocate status frame tracking array when
 "gnttab=max_ver:1"
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a484cc88-f41d-5d38-d098-4eda297569a1@suse.com>
Message-ID: <cfce3be1-c742-72b4-5a39-5b374d27705c@suse.com>
Date: Fri, 20 Nov 2020 13:50:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a484cc88-f41d-5d38-d098-4eda297569a1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.11.2020 16:55, Jan Beulich wrote:
> This array can be large when many grant frames are permitted; avoid
> allocating it when it's not going to be used anyway. Do so indirectly
> though, by making grant_to_status_frames() return zero in this case.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Ping?

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -446,11 +446,14 @@ static inline void active_entry_release(
>  
>  static inline unsigned int grant_to_status_frames(unsigned int grant_frames)
>  {
> +    if ( opt_gnttab_max_version < 2 )
> +        return 0;
>      return DIV_ROUND_UP(grant_frames * GRANT_PER_PAGE, GRANT_STATUS_PER_PAGE);
>  }
>  
>  static inline unsigned int status_to_grant_frames(unsigned int status_frames)
>  {
> +    ASSERT(opt_gnttab_max_version >= 2);
>      return DIV_ROUND_UP(status_frames * GRANT_STATUS_PER_PAGE, GRANT_PER_PAGE);
>  }
>  
> 


