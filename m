Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D607F3682F6
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 17:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115600.220591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaus-000864-NQ; Thu, 22 Apr 2021 15:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115600.220591; Thu, 22 Apr 2021 15:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaus-00085e-Jv; Thu, 22 Apr 2021 15:06:54 +0000
Received: by outflank-mailman (input) for mailman id 115600;
 Thu, 22 Apr 2021 15:06:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZaur-00085Z-0U
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:06:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34cc38a1-bd92-42c0-b9fc-ae3c249870ce;
 Thu, 22 Apr 2021 15:06:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CD09B12C;
 Thu, 22 Apr 2021 15:06:51 +0000 (UTC)
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
X-Inumbo-ID: 34cc38a1-bd92-42c0-b9fc-ae3c249870ce
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619104011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3TxHxq3QrU6QlnEf1HzKyTR9ghKFQG7M5FKiQ2YbQrI=;
	b=KggcmuwB90vYM510sQNQKuo5VsiRq2ZI/w+2oct3rbHfwxxVlsOhoFkzWMlPvXDfc6VRnN
	oYJYzwPye5Oza1/5+HqWzPH8tw0Q4M2iZb28b7JIxtc0U9mzFdZS6Lb+mvEjjzo85IJ5HE
	WFHVeWTkv95byBOvL2R2DNFa+B5zGMs=
Subject: Re: [PATCH v3 19/22] x86emul: support TILELOADD{,T1} and TILESTORE
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <paul@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <fc272d90-9a3c-98e9-d811-ea9b70f89e22@suse.com>
Message-ID: <6b604011-a618-871a-2a3e-9118dd1b702b@suse.com>
Date: Thu, 22 Apr 2021 17:06:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <fc272d90-9a3c-98e9-d811-ea9b70f89e22@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Paul,

On 22.04.2021 16:55, Jan Beulich wrote:
> +        do {
> +            /* Limit rows to just as many to cover the next one to access. */
> +            cfg->start_row = i;
> +            cfg->rows[modrm_reg] = i + 1;
> +            write_tilecfg(cfg);
> +
> +            if ( vex.pfx != vex_f3 )
> +                rc = ops->read(ea.mem.seg,
> +                               truncate_ea(ea.mem.off + i * ea.val),
> +                               row, cfg->colsb[modrm_reg], ctxt);
> +
> +            invoke_stub("", "", "=m" (dummy) : "a" (row));
> +
> +            if ( vex.pfx == vex_f3 )
> +                rc = ops->write(ea.mem.seg,
> +                                truncate_ea(ea.mem.off + i * ea.val),
> +                                row, cfg->colsb[modrm_reg], ctxt);
> +        } while ( rc == X86EMUL_OKAY && ++i < n );

in principle tiles could have rows larger than 64 bytes without any
separate CPUID feature flag qualifying this. struct hvm_mmio_cache,
otoh, is having a fixed-size 64-byte buffer right now. Therefore I'm
wondering whether we'd want to switch to dynamically allocating that
to the minimum of 64 bytes and the size of a tile row, just as a
precautionary measure.

Jan

