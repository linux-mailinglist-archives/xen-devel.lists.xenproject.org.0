Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4B34A2A8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 08:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101606.194476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPh8r-0006j1-0s; Fri, 26 Mar 2021 07:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101606.194476; Fri, 26 Mar 2021 07:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPh8q-0006hh-Td; Fri, 26 Mar 2021 07:44:24 +0000
Received: by outflank-mailman (input) for mailman id 101606;
 Fri, 26 Mar 2021 07:44:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2QT=IY=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lPh8p-0006hc-GF
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 07:44:23 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1ed4b93-0441-42aa-86f2-35a95c009967;
 Fri, 26 Mar 2021 07:44:22 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id x16so4669109wrn.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Mar 2021 00:44:22 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id s12sm9786402wmj.28.2021.03.26.00.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 00:44:21 -0700 (PDT)
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
X-Inumbo-ID: c1ed4b93-0441-42aa-86f2-35a95c009967
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qV0dFBPoDRaxg5YApXW9Y4x3fUbOMMX8COOiQIXJz50=;
        b=tLv7jTshahKmuWpzjTLh3FxafaoG0RoPOMmbVVnDSZmeZeZ4Fv16FHjA2TQr8AMzJb
         KseDGW3JhBMTVE6xEIQTwsrdtYWtLslryvMYeOd9fMn/NDW9X14E2oH8ThPmR0WzgcCU
         02K1+7ex/n4TgZlq3xlEdHjnqA4pcUkO3x7534xcrpEaF/OWS3Oc8k0anDjOibozbc2L
         R/QqY/7+IFL8udhF/B++g02UFtnICeRak8RqEmj+KATxEdTs+duP6kEplVyLI2l44LhE
         usuN/O2ryP7ToLmGA5rcTncoM0deqD/0QhRyDxGkL7znBaMJsmwVNAP7+UbZh/gZ9Ajd
         n4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=qV0dFBPoDRaxg5YApXW9Y4x3fUbOMMX8COOiQIXJz50=;
        b=jaYZVamSZjvqeF8R5ue//smVbUB3yWmKeE/PLTIzpRFwMB1+w8eg2IYzt2dApw09Pg
         6DKUWi0sLpTOimW1IO+zDN/PozsdQ6RJxNWVNC4Tg9+NN9lgEYk7bzKjE8JMlcG7qeBw
         9wRkpMc+e3G8EWncQHK2zA/5xT8TEOvBkEG3tfsZhswEAP+/3yu689KYOY4yD1g0pC4L
         FEd8svZIfQ4S9VuP77jJKJ/YbqOzYZZfMybGUB2eU4yvAPPCOlG2Rs8w41uFav6xBOm8
         1bNGHHLHqN8RPW4RGfcjZVJBCjEEKov3yDo8b6BBQVRPqIeP51gIh3x/vTG2FQJRgfBk
         NlLA==
X-Gm-Message-State: AOAM5310q4ZFMhOhWZPBqprfOlaGDazm+UZFGNZ0i7G98uNz7nDxDHbF
	5jKTY2sr7bWr59AlyMdOpulEVl6wmB0=
X-Google-Smtp-Source: ABdhPJx44DsOktcxij2f4O8eW3DAfr9jew2klNZnEYR36G1kCwj4b8ooy2niHszsL/zQdFhnV1dTJA==
X-Received: by 2002:adf:9043:: with SMTP id h61mr12889486wrh.216.1616744662109;
        Fri, 26 Mar 2021 00:44:22 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH 2/6] CHANGELOG.md: Add named PCI devices
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <20210324164407.302062-2-george.dunlap@citrix.com>
Message-ID: <925330af-1432-a1e6-d7ab-4637613338d2@xen.org>
Date: Fri, 26 Mar 2021 07:44:21 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324164407.302062-2-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24/03/2021 16:44, George Dunlap wrote:
> Signed-off-by: George Dunlap <george.dunlap@citrix.coM>
> ---
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Paul Durrant <paul@xen.org>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>   CHANGELOG.md | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 7f03e85bd7..8c89212f14 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>    - Renesas IPMMU-VMSA (Supported, not security supported; was Tech Preview)
>    - ARM SMMUv3 (Tech Preview)
>    - Intel Processor Trace support (Tech Preview)
> + - Named PCI devices for xl/libxl
>   
>   ## Removed / support downgraded
>   
> 


