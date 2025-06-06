Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F84ACFEB0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008243.1387492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSzd-0004H6-Ii; Fri, 06 Jun 2025 09:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008243.1387492; Fri, 06 Jun 2025 09:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSzd-0004FI-G7; Fri, 06 Jun 2025 09:04:05 +0000
Received: by outflank-mailman (input) for mailman id 1008243;
 Fri, 06 Jun 2025 09:04:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNSzb-0004FC-Bg
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:04:03 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3031a8d9-42b5-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 11:04:01 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so24328365e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:04:01 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451f8ef98b1sm37805535e9.1.2025.06.06.02.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 02:04:00 -0700 (PDT)
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
X-Inumbo-ID: 3031a8d9-42b5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749200641; x=1749805441; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N/pwpR1wZgNyQUp3b4XDKg0uOmmDvQmw5MfQwI5UI6w=;
        b=BNVUpm2ZHT/LfkpH5TIqMd8DoYP3G8MzPfTOsM4GMg8HqDqbCUGIetgMzYo6KznxFj
         QXHErPQ/hItJsjS3Xvpf/UsrzHNk6JFnv4EJgK36fWIaF93PkstEEABg1ZN1JBHQXpA9
         pyHSMpy4yDdLeWc73PBquUzguZ1Fk35loEO3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200641; x=1749805441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/pwpR1wZgNyQUp3b4XDKg0uOmmDvQmw5MfQwI5UI6w=;
        b=wRe2wfVvc1/tMuuEq3OCTFj65s9gzQeEfC0ksExXW9ZlF6mriFz1ONS5xmvMEvkHch
         udIXASN/zl0Bv/UzIlEpxJyHHwuRBxvVAqLIrYhb6nw92ROZsF8Pz5IfNUEROYkwHEnV
         h35QRkvc/TbKfLWPV0EYbmodGCzZa1vd3Yu4DrqKqXh4ctpYsOg55DHQP7F4caqEwfdY
         57IAFBYlv3T48V8jRbNG8oxmzBb6x2qyBulFs9NW/bSeLRWSwdNHAm0/6+gxV/94RJFE
         dxsWdbdjlCfWuIWhcpEYMKsjr6qQNImnw6fIIUNyDcuAYq/NvqNDvlZISwCsd2y8DUUb
         rtTA==
X-Gm-Message-State: AOJu0Yziq8xPlbk3SSES6bNzfa7JumLNF4Y1VjKMtMpF40Xb0GwqKq/5
	i+jVtJNkMduZgI07qfBHCdVjUp/pWdeyzUYRqrixZpy+EQIils/O9bMva3sISp2cBIa1SyZlrBx
	Qt4pv
X-Gm-Gg: ASbGncteeyzP6hrWWKaj9Cgg8NnuLCexaubcxnu51fzfQfq2tYNeR+BA4G1Rnx3Aqab
	QA4vFfNzSmCeMq6rzoDSP1ckmdaUG3PgVuUYztbwzTP9VVTxPLgaW+BQYQRP9Gw/9LIpVQLsdX1
	g2DXwU+bx8Go1ZP5BMSSs1Dtn7Ivdi0fto1RXsFd2fGrF6le9qC02wpTptajQZp/s/ylZz23Mbo
	JnNAdmKM3O1zNn7We/YgemvIDWF/qsIKkQdDLXRhA/y+t9ICKCQtw9cmV7j5uxqt/eez0z5dHYN
	IEbf+5MgEVh7O41aRuFtno/M3aYBrrriyC1LQFUMWWyzlBTBO4teFy8jTIrFUaaDxA9VIpKJG1q
	gHdEOkY153k3jlAWyD2q68Mww
X-Google-Smtp-Source: AGHT+IHO1kexPx1BpsdJMljr2CT3uDUXPGYUvzf9DtILXnxJ7eMTaYD+4i2d8XMtHzA3HrK9imTi7Q==
X-Received: by 2002:a05:600c:c178:b0:442:dcdc:41c8 with SMTP id 5b1f17b1804b1-4520147f531mr22898695e9.19.1749200640906;
        Fri, 06 Jun 2025 02:04:00 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:03:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 11/11] docs/man: Document the new claim_on_node option
Message-ID: <aEKu_zUz4AglecrQ@macbook.local>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-12-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314172502.53498-12-alejandro.vallejo@cloud.com>

On Fri, Mar 14, 2025 at 05:25:02PM +0000, Alejandro Vallejo wrote:
> ... and while at it, add missing relevant links to xl-numa-placement(7)
> in xl.1.pod.in and xl.cfg.5.pod.in, which describes libxl's behaviour on
> NUMA placement.

Oh, here it is.  This should be part of the previous patch.

I still have my concerns of the option being generally helpful, as
said in the previous patch it would be better if this new per-node
claim mode was somehow tied with the soft-affinity placement by
default.

Thanks, Roger.

