Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42393BE6C8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 13:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152128.281065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m15HM-0003fM-9e; Wed, 07 Jul 2021 10:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152128.281065; Wed, 07 Jul 2021 10:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m15HM-0003cM-5r; Wed, 07 Jul 2021 10:59:44 +0000
Received: by outflank-mailman (input) for mailman id 152128;
 Wed, 07 Jul 2021 10:58:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gidy=L7=gmail.com=jirislaby@srs-us1.protection.inumbo.net>)
 id 1m15Fx-0003b7-Je
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 10:58:17 +0000
Received: from mail-ed1-f53.google.com (unknown [209.85.208.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e5f8fb5-c035-4989-9402-5de6e03f09cd;
 Wed, 07 Jul 2021 10:58:16 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id y40so2834337ede.4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jul 2021 03:58:16 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id h8sm7057430ejj.22.2021.07.07.03.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 03:58:15 -0700 (PDT)
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
X-Inumbo-ID: 0e5f8fb5-c035-4989-9402-5de6e03f09cd
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6zKc5bM/j/Saim3WcJ7XMsv777ylB6DzjZT8Xkvqlo8=;
        b=kyn1EWZ9+XZ6rs+mGWNHzsltek9y/aU3d8BumYyIsyL3Vx6QN56i9roMbVbmJniipw
         mIijomibpoVnb2X/jcPP43pNDF08AVsEW7kNcUp47G63xyAa8mlz6kDSjSJDnZCyNp7n
         RHBRktnByHfDamGfF2QLwoRzUTxNWK8aMj8vRw3NOrb0+9SkU/+HZk78xUgcUbtaBXGm
         vMOxJyxYRNUPcTHk+0w3h7E2aQMkmdkwr9WFGF2QrlAJcv+1vdCbeeSiLeNq5JTWRscQ
         bi5wtSaMY3N5w/MtXU9v6feQi5/3//c6496mRG+odQ3ARE99aVVqUgWNaEfJZUCJ+uy4
         xThw==
X-Gm-Message-State: AOAM5316e4L41WUCyzviye1aoMScedC1RQUSyh8DKGj4IEpNpovoOAQ1
	gLRpnfMIhGqusFgzK3OUgQc=
X-Google-Smtp-Source: ABdhPJw9AWx/zVkQP7+TWOppO1SN41FBH7XT10N9Y4mW5X2FTCcM1e3yMvvdcWiMqnnW+M23v3zplQ==
X-Received: by 2002:a05:6402:1001:: with SMTP id c1mr29109250edu.26.1625655495857;
        Wed, 07 Jul 2021 03:58:15 -0700 (PDT)
Subject: Re: [PATCH v2] xen/hvc: replace BUG_ON() with negative return value
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20210707091045.460-1-jgross@suse.com>
 <9e45c5f8-0ac0-e1bb-4703-838679285e80@suse.com>
 <dd32b09b-7345-664b-165d-dfb30c285448@suse.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <b38eddf2-52af-3fa1-9cc0-681c094e327f@kernel.org>
Date: Wed, 7 Jul 2021 12:58:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dd32b09b-7345-664b-165d-dfb30c285448@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07. 07. 21, 12:40, Juergen Gross wrote:
>> And btw, since I've got puzzled by the linuxppc-dev@ in the recipients
>> list, I did look up relevant entries in ./MAINTAINERS. Shouldn't the
>> file be part of "XEN HYPERVISOR INTERFACE"?
> 
> I wouldn't mind. Greg, Jiri, what do you think?

/me concurs.

thanks,
-- 
js
suse labs

