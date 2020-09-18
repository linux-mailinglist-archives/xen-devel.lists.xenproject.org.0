Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6C2700E1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 17:25:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJIFp-00075k-Bv; Fri, 18 Sep 2020 15:24:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K9We=C3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kJIFo-00075f-2v
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 15:24:52 +0000
X-Inumbo-ID: c1917035-fbb8-456e-a3fb-5a92083113d2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1917035-fbb8-456e-a3fb-5a92083113d2;
 Fri, 18 Sep 2020 15:24:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600442690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKq1+z7XAdEDwoUFidkxVuc3E1VrRumuG8aTN5barYo=;
 b=HsnpdgB+tJusE7FkDOaUzzOZ6cAeEqO3/q3XHP3gU4hg0q/8nVj5zFJv9tlIMLehQKCnBc
 EDuc8G7TE8rmq9bo6cZL204NEJMkJP7N1poY+gFXkaJNJxPN5sm+l2IwLEN+/MXG5m9AlL
 k3hwUCro9y43Fwt6vsJ4i/Gvvq24P6M=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1764AAC7;
 Fri, 18 Sep 2020 15:25:24 +0000 (UTC)
Subject: Re: [PATCH v5 5/5] efi: Do not use command line if unified config is
 included
To: Trammell Hudson <hudson@trmm.net>
References: <20200917154048.1140580-1-hudson@trmm.net>
 <20200917154048.1140580-6-hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f9df8496-59ba-4987-820b-3f969f551745@suse.com>
Date: Fri, 18 Sep 2020 17:24:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917154048.1140580-6-hudson@trmm.net>
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

On 17.09.2020 17:40, Trammell Hudson wrote:
> @@ -1155,8 +1184,10 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          PrintErrMesg(L"No Loaded Image Protocol", status);
>  
>      efi_arch_load_addr_check(loaded_image);
> +    secure = efi_secure_boot();
>  
> -    if ( use_cfg_file )
> +    if ( use_cfg_file &&
> +         !read_section(loaded_image, ".config", &cfg, NULL))
>      {
>          UINTN offset = 0;

I continue to think that it's wrong to ignore the command line
altogether. And this isn't just for the Dom0 kernel part when
there's no .kernel section, but also because there may be
firmware workarounds that the user needs to be able to make use
of in order for the binary to work on certain hardware.

Jan

