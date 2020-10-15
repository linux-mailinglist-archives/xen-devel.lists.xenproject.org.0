Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900D828EE8D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 10:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7147.18742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSyhh-0002qL-Lf; Thu, 15 Oct 2020 08:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7147.18742; Thu, 15 Oct 2020 08:33:41 +0000
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
	id 1kSyhh-0002pz-IW; Thu, 15 Oct 2020 08:33:41 +0000
Received: by outflank-mailman (input) for mailman id 7147;
 Thu, 15 Oct 2020 08:33:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSyhg-0002pu-Mz
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:33:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 967dfeca-9826-433e-8d55-d4266bcd98d5;
 Thu, 15 Oct 2020 08:33:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFCEBADA8;
 Thu, 15 Oct 2020 08:33:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSyhg-0002pu-Mz
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:33:40 +0000
X-Inumbo-ID: 967dfeca-9826-433e-8d55-d4266bcd98d5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 967dfeca-9826-433e-8d55-d4266bcd98d5;
	Thu, 15 Oct 2020 08:33:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602750819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7e5viUaGnGwbqXebYUy7WBbaKiwpb1Td6aUpI22ufM=;
	b=oJyrDAa3uoWsEsQ0QfYmvOFZ9IOfR1C8MCARkybo4rLhcVL7JF6xnZuA5OOSddc9i9ZhI3
	x1RaKfs14oc6zJwAXbk8DSCmGnn/AfpmDQq4bqw/1wCuLMtbEBluo55THdk2QNqkAiwRsy
	X5xo87yWbBSLntiePsOzYElejRR22LU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DFCEBADA8;
	Thu, 15 Oct 2020 08:33:38 +0000 (UTC)
Subject: Re: [PATCH v2] tools/xenmpd: Fix gcc10 snprintf warning
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <005bd16161fe803e9c2805bddc440db31c46169b.1602692002.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <470f6555-9935-f581-eae6-6b8b3ed4490d@suse.com>
Date: Thu, 15 Oct 2020 10:33:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <005bd16161fe803e9c2805bddc440db31c46169b.1602692002.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.10.2020 18:14, Bertrand Marquis wrote:
> Add a check for snprintf return code and ignore the entry if we get an
> error. This should in fact never happen and is more a trick to make gcc
> happy and prevent compilation errors.
> 
> This is solving the following gcc warning when compiling for arm32 host
> platforms with optimization activated:
> xenpmd.c:92:37: error: '%s' directive output may be truncated writing
> between 4 and 2147483645 bytes into a region of size 271
> [-Werror=format-truncation=]
> 
> This is also solving the following Debian bug:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=970802
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Just as a nit - could you fix the typo in the prefix of the patch
subject, to correctly name the component?

Jan

