Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0031FA65
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 15:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86890.163420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD6ZX-00014n-94; Fri, 19 Feb 2021 14:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86890.163420; Fri, 19 Feb 2021 14:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD6ZX-00014Q-5w; Fri, 19 Feb 2021 14:15:55 +0000
Received: by outflank-mailman (input) for mailman id 86890;
 Fri, 19 Feb 2021 14:15:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD6ZW-00014L-1s
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 14:15:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b8a634b-4203-446c-912f-84de8b4f57a6;
 Fri, 19 Feb 2021 14:15:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14FCEABAE;
 Fri, 19 Feb 2021 14:15:52 +0000 (UTC)
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
X-Inumbo-ID: 9b8a634b-4203-446c-912f-84de8b4f57a6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613744152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Ycka/xTMYs/DV3CnJFaLl8REG1O2rk4dF5PdWYzoWY=;
	b=jsGEjuLgR/i3+6meOJ7tMesy8/9vVPGiOTIbJCgpbf5z1o8ck2eSJq53wEgRrMtKZv2HFk
	7sjC30Z/a4PB+ixi1l6yfQlAbHKQdc4vhlwlPhIQtnQXwsc6xDQ0LVnIH0RzoH5QQ7Xj3h
	40jYj0v/6VgjItZhPWrRyNivpQPvECA=
Subject: Re: [PATCH-for-4.15] tools/libs/light: fix xl save -c handling
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20210219141337.6934-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c02c3af-0a9b-6c68-e110-9d0963275e17@suse.com>
Date: Fri, 19 Feb 2021 15:15:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219141337.6934-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.02.2021 15:13, Juergen Gross wrote:
> libxl_domain_resume() won't work correctly for the case it was called
> due to a "xl save -c" command, i.e. to continue the suspended domain.
> 
> The information to do that is not saved in libxl__dm_resume_state for
> non-HVM domains.
> 
> Fixes: 6298f0eb8f443 ("libxl: Re-introduce libxl__domain_resume")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

