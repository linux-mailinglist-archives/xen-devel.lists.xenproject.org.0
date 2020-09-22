Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4213E27468F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 18:24:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKl5m-0003lK-Ob; Tue, 22 Sep 2020 16:24:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKl5l-0003lF-1h
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 16:24:33 +0000
X-Inumbo-ID: fbbb3584-2a4c-48f3-86c9-21471814a9fa
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbbb3584-2a4c-48f3-86c9-21471814a9fa;
 Tue, 22 Sep 2020 16:24:32 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a15so14675380ljk.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 09:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=e6w+gjIoOS4bwmTd1p6EizacxPffcVXHcKcUP3Oq5Sg=;
 b=g9jJw60HqLaBL/v5mbMHBvs7JMNPXu0hBU2mWxyugztg89bRlIm6y0/JTUzMJyhY6i
 OFKCpZfAolfeLda/zvF8heGMhQeXDsroruI54W9m+XirVmHg5h1EyyR7+orZLVoUHYl7
 U8LWzuN7icW3g/RWLHszcG5up+FqUOigUPukHJLHpDanvBcv8KUpB17mBiv+0xqo5wUg
 p/lqAcm+Nmex9eOxLalugr9x4uzlrDeP7BaO6KRG+/eCdWoApQy6fa6Gq2CAo34jnsz9
 TwIx7ZNkdG6rwi52n5fPbqZlK3JFBXMgn75XShDjUgmi5ZwUGkSGLzoOoiHNZa5lbkHH
 yUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e6w+gjIoOS4bwmTd1p6EizacxPffcVXHcKcUP3Oq5Sg=;
 b=pd9muu16ZwTipBZQ75MuCHoljHY3+DtJAId6ToRY5GPVsRnw2NOuNs9tLjsdiRSPJY
 w9iDJx9vPDnuKGPLsjeSbvFDutCB+IEC9029e/AIctYuNuxsVNHeCjHvD+Nek51+5D51
 TX/MsNeGfC6CB0HvcQID3eTXiKtctBVjRbQw7IXxFqHrYY/cqJnFXM/KR2Kvum7audgy
 NweEKsuVbKHor03VWwGVZiXDlfGg94lsHIMMIkne/NGtlvMlqDmNauzf7pZrJdujPIN0
 X166whN7GLX/hMLysZUP28fYam7tvGxzSAAANCLB9J+1g8pQ5kleRuBBANVDRFAmkfvU
 jUUA==
X-Gm-Message-State: AOAM531UpTp2VImeZ8JhAwM7K8vYsOdA5W/3GsBmVmQOHwsLEzx9kPz2
 DgIVznY5QlXFlOk8FrbEvg0=
X-Google-Smtp-Source: ABdhPJxrVOabPPyM3feztH8WJMJ4SeQkVe9Kdz/HvuH/D8XOPDEBUSySPN0SdL03dMapus++L46Ljw==
X-Received: by 2002:a2e:141d:: with SMTP id u29mr1714007ljd.243.1600791870871; 
 Tue, 22 Sep 2020 09:24:30 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z141sm3691952lfc.171.2020.09.22.09.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 09:24:30 -0700 (PDT)
Subject: Re: [PATCH V1 05/16] xen/ioreq: Make x86's
 hvm_mmio_first(last)_byte() common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-6-git-send-email-olekstysh@gmail.com>
 <889ff4d2-6edc-2318-7230-f20a70e10d57@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ec224110-adce-ef13-f36c-2968243c6f95@gmail.com>
Date: Tue, 22 Sep 2020 19:24:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <889ff4d2-6edc-2318-7230-f20a70e10d57@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 14.09.20 18:13, Jan Beulich wrote:

Hi Jan

> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The IOREQ is a common feature now and these helpers will be used
>> on Arm as is. Move them to include/xen/ioreq.h
> I think you also want to renamed them to replace the hvm_
> prefix by ioreq_.

ok

-- 
Regards,

Oleksandr Tyshchenko


