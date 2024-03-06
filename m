Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640028739F0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 15:57:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689355.1074234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhsiF-0004YX-3W; Wed, 06 Mar 2024 14:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689355.1074234; Wed, 06 Mar 2024 14:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhsiE-0004Xg-TY; Wed, 06 Mar 2024 14:57:42 +0000
Received: by outflank-mailman (input) for mailman id 689355;
 Wed, 06 Mar 2024 14:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KzOk=KM=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rhsiD-0003UR-FQ
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 14:57:41 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e12f3e17-dbc9-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 15:57:40 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-513181719easo5058917e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 06:57:40 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o6-20020ac24bc6000000b0051357109ac6sm655578lfq.285.2024.03.06.06.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 06:57:39 -0800 (PST)
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
X-Inumbo-ID: e12f3e17-dbc9-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709737060; x=1710341860; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AkU99RQm0D8QAcmE/0JdPnQp0d5kBtsxpW2db+mpxqU=;
        b=VkWMaujaqiAl1CzP9hgMo7Z1hPvQAoN1/+inrH354bVm7H0yHrVpifiLn5cNvxT2X7
         JFiP4aFV3Tn3/XWClX/yFKzwts8JuD0HKdj/3p1Oe+O7LXEXF6RxBjRCG93/aZy1Qz4w
         +zPgo4xFC0axYXxwE24LedNXLMttTg06ZS/Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709737060; x=1710341860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkU99RQm0D8QAcmE/0JdPnQp0d5kBtsxpW2db+mpxqU=;
        b=IKbX8fcPms0DXdYIocJmvPf/yG3U6Nasj3EjRBvM3KHuIHy4cDT5dyaN/BoiqcAMYD
         Ug2mt8yNUJS36uUce1G90T3aAFLMH5BKeuPT8KcS1BMhGH9Ppd0uKb0gzOmK+mqugsCv
         nFhNbp5bZpGPIbUXjswXPe2MsPCdfLEd9XO0Xlhhmh2LHYFlJpYOGqgGORB3NiXteLo7
         nPobWyCnd5b6UXF2ygyGceF9UZc6apzAQpgpqhsFOr8UVdUpA4DxEmgGaJ+Gul4i4Owq
         wPOe3xTfl33mqUI3EajPCmkwh49HBjJ21sClSeeqFl5wyR3lWGq+8YNRJZ5mrePj7oLt
         4GdA==
X-Gm-Message-State: AOJu0YySJeEyNMWJLMZljC11+UiZSjlMkIwOmK70xJnIU65/qanhr9OL
	7Sy21Y60WKmFUAEAkakCDpwUcX1KPGFsdIqcXYZq6sbQfYn1AJ54YkpaUI09CI0=
X-Google-Smtp-Source: AGHT+IFLPh00ZEJr+NAP9NsmNiHP/Db2TyelAP2m2+Rjl2brrhXwhkYfbDDmdaYxzfHLepT7v31OFA==
X-Received: by 2002:a05:6512:39cd:b0:513:46cc:8966 with SMTP id k13-20020a05651239cd00b0051346cc8966mr4626055lfu.2.1709737060404;
        Wed, 06 Mar 2024 06:57:40 -0800 (PST)
Date: Wed, 6 Mar 2024 14:57:38 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] Kbuild: simplify as-insn a little
Message-ID: <4e090535-c31e-47f6-a560-047fb36aff3e@perard>
References: <089964f2-1b2c-4ee7-92cf-f50f2e967d5b@suse.com>
 <d3998117-23c1-4481-bfa0-ce66eb4279e8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3998117-23c1-4481-bfa0-ce66eb4279e8@suse.com>

On Thu, Dec 07, 2023 at 11:49:04AM +0100, Jan Beulich wrote:
> As of 732571959f17 ("xen/build: use new $(c_flags) and $(a_flags)
> instead of $(CFLAGS)") -M options aren't part of CFLAGS anymore, and
> c_flags isn't supposed to be passed to this macro. Drop the now dead
> part of filtering.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

