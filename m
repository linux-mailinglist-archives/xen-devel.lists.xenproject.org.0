Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D9727E1F1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 09:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.446.1376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNWAA-000393-Mp; Wed, 30 Sep 2020 07:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446.1376; Wed, 30 Sep 2020 07:04:30 +0000
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
	id 1kNWAA-00038h-JK; Wed, 30 Sep 2020 07:04:30 +0000
Received: by outflank-mailman (input) for mailman id 446;
 Wed, 30 Sep 2020 07:04:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNWA8-00038c-Ps
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:04:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50cb1817-90f2-4968-a588-6def99a1198c;
 Wed, 30 Sep 2020 07:04:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF23BABAD;
 Wed, 30 Sep 2020 07:04:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNWA8-00038c-Ps
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:04:28 +0000
X-Inumbo-ID: 50cb1817-90f2-4968-a588-6def99a1198c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 50cb1817-90f2-4968-a588-6def99a1198c;
	Wed, 30 Sep 2020 07:04:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601449467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSk1l0LJih4mnMQZyOv9txu5fZ5Aldr76y3J0rm0fCg=;
	b=qIHmpQW3tpkVc36esg2BQgKoYeof8mTt38+gngbH71ad92NzSdI0nTeCoZbLoj+23anJHP
	NIqqMZvB/QmYmWd23w67+lkCO0a6ObpSMPT/SiLgVY9MAiC3bGPb7OsgjyLdCpMhm5aoTw
	+fxB/1dxUXmzyzBk/tYj2flQkOhuVMU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EF23BABAD;
	Wed, 30 Sep 2020 07:04:26 +0000 (UTC)
Subject: Re: [PATCH v7 4/5] efi: Enable booting unified
 hypervisor/kernel/initrd images
To: Trammell Hudson <hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, wl@xen.org
References: <20200929181717.1596965-1-hudson@trmm.net>
 <20200929181717.1596965-5-hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e3f5f85-f323-eb53-19f1-a925254866dd@suse.com>
Date: Wed, 30 Sep 2020 09:04:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929181717.1596965-5-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.09.2020 20:17, Trammell Hudson wrote:
> +static int __init pe_name_compare(const struct PeSectionHeader *sect,
> +                                  const CHAR16 *name)
> +{
> +    size_t i;
> +
> +    if ( sect->Name[0] != '.' )
> +        return -1;
> +
> +    for ( i = 1; i < sizeof(sect->Name); i++ )
> +    {
> +        const char c = sect->Name[i];
> +        const CHAR16 cw = name[i - 1];
> +
> +        if ( cw == L'\0' && c == '\0' )
> +            return 0;
> +        if ( cw != c )
> +            return -1;
> +    }
> +
> +    if ( name[i - 1] == '\0' )

Nit: L'\0'

> +        return 0;
> +
> +    return -1;
> +}

You've effectively made the function return boolean now. Please
reflect this by making it actually have bool return type and
returning true/false (or, for the final return statement, perhaps
simply "return name[i - 1] == L'\0'").

Jan

