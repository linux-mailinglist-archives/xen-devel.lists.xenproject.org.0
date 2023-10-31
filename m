Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ED97DCCF0
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 13:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625675.975177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxnn6-0004un-TJ; Tue, 31 Oct 2023 12:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625675.975177; Tue, 31 Oct 2023 12:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxnn6-0004ry-QW; Tue, 31 Oct 2023 12:24:16 +0000
Received: by outflank-mailman (input) for mailman id 625675;
 Tue, 31 Oct 2023 12:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G+CR=GN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxnn5-0004rj-68
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 12:24:15 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 665fe5c5-77e8-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 13:24:13 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so8890959a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 05:24:13 -0700 (PDT)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 e1-20020a50d4c1000000b0054026e95beesm1067952edj.76.2023.10.31.05.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 05:24:12 -0700 (PDT)
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
X-Inumbo-ID: 665fe5c5-77e8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698755052; x=1699359852; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rBP6Lco2nCJnauHXufL8NfhYVLMmUe6mgXHE9mvnoJI=;
        b=Z4rzbjh6+bAQNi+w5pR8SgNczrMCAzYnUXRtKNzpn7TO/bipzxj9v/kA8gw0aSNLcc
         vG9SxPdRUw1ShUv5ZZ1LHQydt3sPlut0uSJMfbwxdnM8TGRqsp0hR43+ytZPqkPxHgeC
         Msn82VIM1uhZyo10VznQw45NR/QPfUy25atWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698755052; x=1699359852;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBP6Lco2nCJnauHXufL8NfhYVLMmUe6mgXHE9mvnoJI=;
        b=Uuh3NjFISNBB553L9H018BsculddBww5+SlVzVqRs1dkc/e1En+wcFi7LcUNo7oeU7
         T5Av5oN8Yvo2BIkrM4YvK0WdNDx7h3hkItSd1zvIzgksfBadpXUABjzTpI7Jas0ZKcMv
         BFx01z8EsZiijGTJsRoTgmjZ+OWGH8rnLNO9QPtqvc/RBpUdy4xGNLljhpuHL0gR+wUV
         9jndwIAX8PyShwC7wmWf1OdETHAPHJf9WewA1rfW/5vvGCDzl8pqUvPs7H8pJGNR06Pl
         2J6UghYHENnWoV6Bk60KmM0jT/HM+gADEs7i0uMBS+laNLJU7t+c1kdjJF1G7JOuyM80
         OcGw==
X-Gm-Message-State: AOJu0YwN8UCJBWcKXBWuWCJUGsvfQNpr1XQkP/KvmePO1vPu3J+fGa3t
	C6YLNMyuZTIJlycur+640XeyLZuuuykRAdM9V4s=
X-Google-Smtp-Source: AGHT+IHBJOkLsApOCzaz94nXmjkrPK2A7ynUC1RFMIAVf1huDavQZNhmEDRo19Pjd6TbtuY09awSMQ==
X-Received: by 2002:a50:fa93:0:b0:533:4c15:c337 with SMTP id w19-20020a50fa93000000b005334c15c337mr10746526edr.16.1698755052540;
        Tue, 31 Oct 2023 05:24:12 -0700 (PDT)
Date: Tue, 31 Oct 2023 13:24:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.18] docs: Fix IOMMU command line docs some more
Message-ID: <ZUDx67jQrGQcy68-@macbook>
References: <20231031120215.3307356-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231031120215.3307356-1-andrew.cooper3@citrix.com>

On Tue, Oct 31, 2023 at 12:02:15PM +0000, Andrew Cooper wrote:
> Make the command line docs match the actual implementation, and state that the
> default behaviour is selected at compile time.
> 
> Fixes: 980d6acf1517 ("IOMMU: make DMA containment of quarantined devices optional")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Henry Wang <Henry.Wang@arm.com>
> ---
>  docs/misc/xen-command-line.pandoc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 6b07d0f3a17f..9a19a04157cb 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1480,7 +1480,8 @@ detection of systems known to misbehave upon accesses to that port.
>  > Default: `new` unless directed-EOI is supported
>  
>  ### iommu
> -    = List of [ <bool>, verbose, debug, force, required, quarantine[=scratch-page],
> +    = List of [ <bool>, verbose, debug, force, required,
> +                quarantine=<bool>|scratch-page,

I think this should be quarantine=[<bool>|scratch-page], as just using
iommu=quarantine is a valid syntax and will enable basic quarantine.
IOW: the bool or scratch-page parameters are optional.

>                  sharept, superpages, intremap, intpost, crash-disable,
>                  snoop, qinval, igfx, amd-iommu-perdev-intremap,
>                  dom0-{passthrough,strict} ]
> @@ -1519,7 +1520,8 @@ boolean (e.g. `iommu=no`) can override this and leave the IOMMUs disabled.
>      successfully.
>  
>  *   The `quarantine` option can be used to control Xen's behavior when
> -    de-assigning devices from guests.
> +    de-assigning devices from guests.  The default behaviour is chosen at
> +    compile time, and is one of `CONFIG_IOMMU_QUARANTINE_{NONE,BASIC,SCRATCH_PAGE}`.

Do we also want to state that the current build time default is BASIC
if the user hasn't selected otherwise?

It's kind of problematic though, as distros might select a different
build time default and then the documentation would be out of sync.

Thanks, Roger.

