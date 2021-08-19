Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CDD3F203A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 20:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169103.308898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGnBg-0005ss-UD; Thu, 19 Aug 2021 18:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169103.308898; Thu, 19 Aug 2021 18:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGnBg-0005r2-RB; Thu, 19 Aug 2021 18:54:48 +0000
Received: by outflank-mailman (input) for mailman id 169103;
 Thu, 19 Aug 2021 18:54:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hQ7n=NK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mGnBf-0005qg-Va
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 18:54:48 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8102c11f-a44c-4f35-8c6a-6bed057912ee;
 Thu, 19 Aug 2021 18:54:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k29so10530626wrd.7
 for <xen-devel@lists.xenproject.org>; Thu, 19 Aug 2021 11:54:47 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id z6sm3266243wmp.1.2021.08.19.11.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 11:54:46 -0700 (PDT)
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
X-Inumbo-ID: 8102c11f-a44c-4f35-8c6a-6bed057912ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mvULkYvqm6BI1lVy/Zt820NeNShyQCV7ZeA2HFgF+3o=;
        b=S/6Appc5aEvoL/jAol38cWxwuTVzV429CnIgyqoEWZsR2bCU0+AkCblgXcM9d9al8R
         mAeYxy2O3GhEImb60TVurBA8iidf8ldl8i8nVCQiNBGYfbeFEyjEaoiLTlO2IPcudc3x
         AGYmKLVG+ytm1ZEUrFJDMhMM0OtdmeJfDjr5re66VwY36Umbh5BDtqwoDRgDhr+wwKN7
         kkrT7aAiUfYd+sSu6q2ii8NqbtRokQM02tzTdScIyt5HhR61NIhbti919qhSw6osU9sy
         U8fE+v4TkgwpbqJwglGqap5LsdvlmofKF+O10/DSYtywoF0c/FrLi01QFHnoelsURC4q
         aPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=mvULkYvqm6BI1lVy/Zt820NeNShyQCV7ZeA2HFgF+3o=;
        b=XXafi/234LZgzre9fjlVAjBHQaFGre5QcxK3bDZuSAjRM5BxxFb5bCKBb52cXTxlZR
         WG6i6dlhCwJHjKLpsLabTCBahyGFt6rVKLvVR7phmCbX3GuNKDooQwA8rEOzz/fO9yq7
         TpccWqbhISZiNo6CPnsj2EVW3+OgRLjQWbmiTQ8yKwE885zZt0Z4RIQXglVsxbXAt5Gc
         jdU0bsKvEyja5sMw8NU5ELvo0RaIDIH2B8A5/BmT7D87gX0ZpfD99c2kgz6JMdJ6D1OS
         /0TqUcOJAwa7rTiCR0plngD5uNWruSjaNXgRG4WTqHfvINXZJQKGrfnxrl+FRfHt4JzP
         2hHg==
X-Gm-Message-State: AOAM531wQA2GDIUQThxdSyn0RKCuOi13b3NrBI/Ig1ne2r/nChy7YPzL
	OlAhssOdBYzoY0fmt24Hcuo=
X-Google-Smtp-Source: ABdhPJzaMkSORURVkePNNVbW1LdvqyixfqoaTu8x8cE75xIPJjkeagpFg9ycDcs25fLnu3mcnnjYtw==
X-Received: by 2002:adf:df0c:: with SMTP id y12mr5531533wrl.155.1629399286429;
        Thu, 19 Aug 2021 11:54:46 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] AMD/IOMMU: don't increase perms when splitting superpage
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
References: <f642d06e-77cc-7c45-0e1e-9cf694712d42@suse.com>
Message-ID: <b7b75bdb-981f-cf15-8593-3ff417ca7b7b@xen.org>
Date: Thu, 19 Aug 2021 19:54:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f642d06e-77cc-7c45-0e1e-9cf694712d42@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19/08/2021 09:04, Jan Beulich wrote:
> The old (super)page's permissions ought to be propagated, rather than
> blindly allowing both reads and writes.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

