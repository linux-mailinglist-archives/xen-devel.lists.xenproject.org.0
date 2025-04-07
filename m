Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6150AA7E8BF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 19:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940745.1340407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1qWv-00067l-65; Mon, 07 Apr 2025 17:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940745.1340407; Mon, 07 Apr 2025 17:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1qWv-00064r-2O; Mon, 07 Apr 2025 17:45:05 +0000
Received: by outflank-mailman (input) for mailman id 940745;
 Mon, 07 Apr 2025 17:45:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1qWu-00064l-08
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 17:45:04 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 085a848a-13d8-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 19:45:02 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so37040105e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 10:45:02 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1f27a55sm139366985e9.2.2025.04.07.10.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 10:45:01 -0700 (PDT)
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
X-Inumbo-ID: 085a848a-13d8-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744047902; x=1744652702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AVNc7OnAjoT3b/S1PH1VwrsvCJ+F9v01z0Slij1FWJQ=;
        b=eSmdAiBvTvcCuxiWmPDlQ9UxreKs7oiONJrr4IRWdCLs+zPkEdDYQO63EFdtkMI+Dr
         cKIiH+pLzHdWCPcuwZVqZnk21aIDZJTHvaRqgAzuU2CAltpQrYMXbi5rb6eYu9iQ3iIQ
         hM0YyHXCeSFghVQrkO5wvH/TV1ehkx7ueB3jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744047902; x=1744652702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVNc7OnAjoT3b/S1PH1VwrsvCJ+F9v01z0Slij1FWJQ=;
        b=YnTGu3cqZN9z5TNaSEmY1xGskZt2UM4nYsDlgztweKMSNnBf9Ig9cjLOkqk5gOcCQ/
         bnq82owavssn8inrEjthpvlbuYjZ2PZGJEyZqevuuIoIRFCuoSrFjw/eplh+0ksxouVY
         q1jIdOEBLtfu+PSaLqXkCjG4y6ZVOIxuM1scQb1yeLHNY0TwFlw3evD6auZDY6WlnQ0l
         7Zzx2cF6wGNhxm3n5XkCsXwgdmogkWk/VEyPJqeIkNnTPf5rtmMyzIjOlwPgrNFWmt/J
         nnSKPw2P+COKAKeEhWJKPLP2m74y3XBNpcdeNsVXvVCcLFEXvWclG9SXdbcrLgX7XIPs
         N5ww==
X-Forwarded-Encrypted: i=1; AJvYcCW5blTbvKuL1O4dumolZHR/Q/FU3hvHc74Hzalqw2SPw6R9FYuIC8AjRXQ4boMSGW4SgDI+OSrBIVQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/jTpuoig99yYBhG1I6rwOh6iFJ+MtI4HQQQRVTuS4OoQwiLt8
	MhZZbmSLcPT1HHWMAHE6gSp5cMVi+t4dXknazi/yjzt3okcTAarmlcAQvWm4prQ=
X-Gm-Gg: ASbGnct8n4tGa2kZ9GAg0fdNA4/WE+D3sbk8IGJgLiug3ZJZAz/1y5q0nDMExUNt/dR
	VigM2U8GsDZWlXFNmJ8PD+HJreSGv3W0wNPuHk5bajbMxVYjL+wd2kbb3YYxYZd2hVSRWDjkmyr
	OBoaLYnTX5ugYahsQxNAgx0Qv/owLEYn5Snm6QD3pJJqrXMCLD/ay7gqdYfGWp41JxoGjpeOdbS
	wV8eornf3VRWToEWfDYDuuN29Uzq0r/IVsaG0IEXFKMhhi0VNTe7H3ujk/8hFr57J7EUfUANEES
	Du9IDHxdndISlrvlYg0+OV1eWIiFn5AQAa9rpSbPAEZhtYLoPAp/uZaN10iBLuS5c2oldfQdtrp
	WlZuBWf/NjA==
X-Google-Smtp-Source: AGHT+IHYvgMDDUb9UY8rJjruIbtNgNFl5/5i3l8vM1OwfFSyqu84dAN4TKt16ul+yi7Wg17MVcak1w==
X-Received: by 2002:a05:600c:1e13:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43ed0da49e6mr158184175e9.30.1744047901807;
        Mon, 07 Apr 2025 10:45:01 -0700 (PDT)
Message-ID: <0da3e304-ceef-4a1d-9c65-b55a975559d4@citrix.com>
Date: Mon, 7 Apr 2025 18:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] CI: consistently use DOCKER_CMD in makefiles
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
 <3e28c1267125641ed3212c0366678474692913b2.1744028549.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3e28c1267125641ed3212c0366678474692913b2.1744028549.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 1:31 pm, Marek Marczykowski-Górecki wrote:
> This allows rebuilding containers using podman too.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  automation/build/Makefile           | 4 ++--
>  automation/tests-artifacts/Makefile | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/automation/build/Makefile b/automation/build/Makefile
> index 4df43b040777..fedf7524dacd 100644
> --- a/automation/build/Makefile
> +++ b/automation/build/Makefile
> @@ -31,8 +31,8 @@ clean:
>  define CLEAN_RULE
>  .PHONY: clean-$(1)
>  clean-$(1):
> -	if [ -n "$$$$(docker image ls -q $(REGISTRY)/$(subst /,:,$(1)))" ]; then \
> -		docker image rm $(REGISTRY)/$(subst /,:,$(1)); \
> +	if [ -n "$$$$($(DOCKER_CMD) image ls -q $(REGISTRY)/$(subst /,:,$(1)))" ]; then \
> +		$(DOCKER_CMD) image rm $(REGISTRY)/$(subst /,:,$(1)); \
>  	fi
>  
>  endef
> diff --git a/automation/tests-artifacts/Makefile b/automation/tests-artifacts/Makefile
> index d055cd696bed..80a60a94f3f7 100644
> --- a/automation/tests-artifacts/Makefile
> +++ b/automation/tests-artifacts/Makefile
> @@ -10,9 +10,9 @@ help:
>  	@echo "To push container builds, set the env var PUSH"
>  
>  %: %.dockerfile ## Builds containers
> -	docker build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
> +	$(DOCKER_CMD) build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
>  	@if [ ! -z $${PUSH+x} ]; then \
> -		docker push $(REGISTRY)/$(@D):$(@F); \
> +		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
>  	fi
>  
>  .PHONY: all

I'm going to apply this commit to the test artefacts repo too, as it's
got a copy of this Makefile in need of the same change.

