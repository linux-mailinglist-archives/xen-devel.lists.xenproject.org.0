Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFCFB3E116
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104478.1455522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2PN-000490-5U; Mon, 01 Sep 2025 11:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104478.1455522; Mon, 01 Sep 2025 11:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2PN-000476-29; Mon, 01 Sep 2025 11:09:09 +0000
Received: by outflank-mailman (input) for mailman id 1104478;
 Mon, 01 Sep 2025 11:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iamq=3M=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ut2PK-000470-Tk
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:09:06 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 134c895b-8724-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 13:09:06 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b7d497abaso26843625e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 04:09:06 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b7e7d1319sm161755635e9.5.2025.09.01.04.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 04:09:05 -0700 (PDT)
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
X-Inumbo-ID: 134c895b-8724-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756724945; x=1757329745; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6rgR++lWLMqzeZslHsvt4I1kEBGOXcv7wE/eP36c0Gk=;
        b=YlgYa50fojCoFnCZHWQukPBXmNtXEjNGuud4vB2aMPx23WAg4uS0jiYgW5YlyTFcQ/
         y/QInvtrG7Q//lg49DoRakmn+inGzwUIaZW/+eyyv4tCDP+CNzn/zqkwDzDkipAFOIWM
         Avl3mqiIoqUYjcLt23nbuniAEosLPodDX0OAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724945; x=1757329745;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rgR++lWLMqzeZslHsvt4I1kEBGOXcv7wE/eP36c0Gk=;
        b=LLdn8VEO9va9tI76QMgxtnC7xVTqWlWjgL/ZUjxrEwmCsyrjCAmogeeKhjPrqhI3qv
         bNiVFtR99A8kszD+TiGSkN82c/xqzOV6jyVFe/G2MkREbXE77lH5avgZlYKk7LeEqwje
         ThtETWvjlxZHhVU3RwKNuDzOHsjlMwol/5Ln41dTj5kagIIg2gEqUB5YB6Ngf/bmRc2U
         YaITjYXDTkKjjVooUxVUd0QANRKgAgpdfn8cl0/Cm42Avi+UzlcXyUUoH5QHcIdiBxA+
         Izoz5GZ29WkUjdWmYFB+63oHAaT/ZS1IFlKGMD93ick/pHKrHIBpi/mXyYPT5nfAaRYw
         1oGg==
X-Forwarded-Encrypted: i=1; AJvYcCUtq74W+U0FDlhjSFhIzZ8/V7UbTFMnYCeVfPwzG8tVCRl7WVXQwdfFp+IyXb9vEmYOeubBeUkrJWA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVNiZeCslnL/yIp8rQgGNjBh0o2j1c7gZaSCghuZgMpjp9XVY2
	BYl+Mgdf1GgNYk/BOG3EUHM/uQ/M/TXPAELkGw2calf85pSRfcxfLIq36CEaHlnHsAw=
X-Gm-Gg: ASbGncvRWKXgXo9K5CGMoZ3dbSqGcvU4pGsl+LnjxcLzD35cY26tiyH4oztxlZn+8YA
	reB5yOsEn4J6udcV/m5meHp3TkpGbMsxQrLEIbmvqtT7J3EaY3kqJ3e8W/3hKR/bnFkF83wJShw
	WpswSVDJXp7Q6ZTIwhvVDbLGB4PLKW2woRyFSokx6Nnt70OHk59RqpU8sBqJadSqfM6d8MIvC+P
	pdQfyaSXT+GyZtAcjWmcCAaeJvhbWPNiK5fPiNaeCByMskSJJX6+a+hq8fPbffbc1st8s+OZR0f
	UeT7Op7Gj3dfiPezsHMRD1SpVz9e5NrWgpiAtmb3pcL+cd2CG90nSxlFuqFPvzD8FxgHMnp4HHD
	EH6JiKfCn9/RAqh5Hn9HcF+uP4MbuSJjLmmcfkAFrl4h7jNpJq43MNDOY76ebsVDWJTEf8WLU6n
	5L
X-Google-Smtp-Source: AGHT+IHIUhdmQPaDN1SX580Lte6re6U34Y6Wbe8vElCsZ77g8+RA42qi3FtSDq25kKAwMRts/+GXzA==
X-Received: by 2002:a05:600c:4f41:b0:45b:8b34:3482 with SMTP id 5b1f17b1804b1-45b8b3437c0mr32312625e9.20.1756724945482;
        Mon, 01 Sep 2025 04:09:05 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:09:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mark Syms <mark.syms@cloud.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] Clarify the cases where BLKIF_RSP_EOPNOTSUPP can be
 returned.
Message-ID: <aLV-0C9J5MugXuF0@Mac.lan>
References: <20250828093821.372024-1-mark.syms@cloud.com>
 <20250829085627.407307-1-mark.syms@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250829085627.407307-1-mark.syms@cloud.com>

On Fri, Aug 29, 2025 at 09:56:27AM +0100, Mark Syms wrote:
> Previously this said it would only happen on barrier writes. Except
> the documentation blocks for
>  * feature-flush-cache
>  * feature-discard

I cannot parse what "documentation blocks" means in this context.  I
would maybe write this as:

"Previously this said it would only happen on barrier writes.  However
Linux blkback and possibly other backends already return it when the
type of the requests is unknown.

Fix the comment to clarify the return code can be used as a reply to
any request types not understood by the backend, not just barrier
writes."

> 
> Also say that they can return this error.
> 
> Signed-off-by: Mark Syms <mark.syms@cloud.com>

Possibly with the commit message adjusted:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

