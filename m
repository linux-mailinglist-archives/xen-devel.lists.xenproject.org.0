Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B04CAC0E81
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994119.1377165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI78G-0007M6-WD; Thu, 22 May 2025 14:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994119.1377165; Thu, 22 May 2025 14:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI78G-0007Jy-Sh; Thu, 22 May 2025 14:42:52 +0000
Received: by outflank-mailman (input) for mailman id 994119;
 Thu, 22 May 2025 14:42:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI78F-0007Jn-Iu
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:42:51 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 089eb91d-371b-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 16:42:49 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-601609043cfso9762871a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:42:49 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ae3953esm10653845a12.73.2025.05.22.07.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 07:42:48 -0700 (PDT)
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
X-Inumbo-ID: 089eb91d-371b-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747924969; x=1748529769; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y3NTkdgLVJmWzTRtqaYUwk6F+4R/sk6sNQTp3bKkVpo=;
        b=BcWnidNz6EKQdSOlUSbP4/QH9g7vbq6UxYmSJl+D16QGhdav1+Q0QElPUaKzn80Y52
         3Is8iqhCnvbCxXroemSDkZL6bGUxzBHmx9D+5JDNMiSSWDkZKClZY5sa4kRnq+s/+Ben
         xXsMFIXScgsSKUyfY2l4kk54SEbDPNzaEKYzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747924969; x=1748529769;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3NTkdgLVJmWzTRtqaYUwk6F+4R/sk6sNQTp3bKkVpo=;
        b=Ydc5T/bz1JHRr5V0hlZjL13xHP5syewGtOS7S0e1oOYq0UGksPgpm0SvdX3tVleT1v
         H1oMyL8IfD2xqLb3U6Z9jx/+C3wEnbVNRLBKmmw2HuTsVMwug4JnTZP4Iz7fSiQ7K84p
         mncy884AomlFuBtkojctfG1XjEq8fkGUY6CAv+1XrkXr1w+QRMglRykOJitZHsvhEQKh
         IEIcJyrMye/DlyzyYPnzgRWqc+ylSET7wBFVbc7Gz7uGcxesP5eWrMhCuL59V+n56BmH
         hrmrFmLDKUwaMp6mClKlyz6zi8cJ8wKrwQAl8D0i7RJHGQYcvLc9VzzvMOGIg1dEbcVS
         PqHA==
X-Forwarded-Encrypted: i=1; AJvYcCWnq8BX3LQ62bSFnweKvQDzauoo7jMqgVLmlIc+wvcZrsTAAlYWWRebF+gNB9It6J4xlHx4ZHh6GCQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRtEfgbFbp3gZBZUYwCtVxsNA1qxT4qkLgOTMETHn4Rq2SORaA
	Q+tbQKNkX4eR1kCNNvmRsS4h11N2VWZWeeFU864QD50nn1msv5Xj249+0xJ22oNqO301POMUMWy
	z2Jnv
X-Gm-Gg: ASbGncvwoCwOF/wWIXmYS/nsO4g2MXsGOvunhj8I/0GaTr2S5svsMzjxYYrvsOt+gx3
	rHeLHgD+6Kph1tC9H72YSoRq1DMp3rqTgU6Ll0ukv+gJ9o6c9WeU759gmA7us0hnIwWAEJNFv8X
	uDHNH0ovYXYJ5J8fXwTNukLgGDn8WqKsB0khjbduL7TA+ETlZ50HX0sGSOi/HCEIr+KK+Sde1aI
	Cwve5jI6kV6zmt4HPmElE0zEJ/V2L5jFgOKxjhDgzrh3LY2l9roMxCfVJeujW2H+tBLOjHlMO10
	TRkBL3OqcUhGE9atyXvLJMeixhNWAoHJh615HZwLfQjQbh4LtW4y84CCGqC2EWm+9dRn4rgr678
	GmKr2AtVtTxitsx8F
X-Google-Smtp-Source: AGHT+IGNxH2U655aZK4F4n3D8eX7l68brGYlTtqeoZLMuGAfgxuvWLjFuQNbx2OhWc+OLmKMj9yPVQ==
X-Received: by 2002:a05:6402:42c1:b0:5ec:c990:b578 with SMTP id 4fb4d7f45d1cf-6009008eb55mr20726488a12.19.1747924969155;
        Thu, 22 May 2025 07:42:49 -0700 (PDT)
Message-ID: <eb21053c-c1ae-4e51-bcc5-4e3762a489ce@citrix.com>
Date: Thu, 22 May 2025 15:42:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/boot: attempt to print trace and panic on AP
 bring up stall
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250522075440.99882-1-roger.pau@citrix.com>
 <20250522075440.99882-5-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250522075440.99882-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/2025 8:54 am, Roger Pau Monne wrote:
> With the current AP bring up code, Xen can get stuck indefinitely if an AP
> freezes during boot after the 'callin' step.  Introduce a 5s timeout while
> waiting for APs to finish startup.
>
> On failure of an AP to complete startup, send an NMI to trigger the
> printing of a stack backtrace on the stuck AP and panic on the BSP.
>
> This patch was done while investigating the issue caused by Intel erratum
> ICX143.  It wasn't helpful in that case, but it's still and improvement
> when debugging AP bring up related issues.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

