Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6A441A322
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 00:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197280.350314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUzBu-0003Pc-8G; Mon, 27 Sep 2021 22:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197280.350314; Mon, 27 Sep 2021 22:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUzBu-0003M8-3H; Mon, 27 Sep 2021 22:33:42 +0000
Received: by outflank-mailman (input) for mailman id 197280;
 Mon, 27 Sep 2021 22:33:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5dgL=OR=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1mUzBs-0003M2-Ix
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 22:33:40 +0000
Received: from mail-il1-x12f.google.com (unknown [2607:f8b0:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d6f68b7-db2f-4bf5-8530-fedd7bda7fec;
 Mon, 27 Sep 2021 22:33:39 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id i13so21078829ilm.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Sep 2021 15:33:39 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id y2sm6427866iot.45.2021.09.27.15.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 15:33:38 -0700 (PDT)
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
X-Inumbo-ID: 6d6f68b7-db2f-4bf5-8530-fedd7bda7fec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LOsuwHDiPC+PPoCEQN/qtQeyMVFZbR3g1AzPIbWGz1s=;
        b=YTqmdXk5vu2O6Z09DphFzhzdWxPQ8jmaJFHrIsMI+6Jhr8dovpFIgf0hfWsFZmWJGq
         EVBCGkS1YFFNZ8M01WgONYjDBxGTGP/DCZWSKVCmRzFam2Hh4IgqxVmjePf268PGtV81
         f5vMDXMmwBYUfauwYcel2Rv7+Z/vgk39qzYsRkTAosBsqgB4GwDsvm6cOxLKEb7WhBzu
         TSGL2cQt0huoDrGurVnZof3FIGpxyaHR8+jLKBQHjcW0vLlSgpEdy3xv/8pfNM0RjCzL
         S68pit92xtiJTYJshqe0ROVs/67npCPOQRoa5DA5iXWksCwd+SjdXeI2A9yZ8hXhKis6
         coXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LOsuwHDiPC+PPoCEQN/qtQeyMVFZbR3g1AzPIbWGz1s=;
        b=QnyLgKsnVbL44MDpOMvcFR8XcfrpXJBp60aqjhLj7OQMTF6Kr7kkEupqvZDnTqVRnk
         CuhGZgG/V4e9lhSLHSywkq/NJ95Sbs93ANMaOk6k0PaJskqc5Bjq1Fa9vg0DDRoB9hK3
         oLOBwEx3befay3JQfqS5124X2J29B06qFo1oOSJHfwgM4Gkgjf8J7NzQR9UyT8kbJD1O
         Al/A03hixKWWHYzu+PWe8WWyOlSO8kePbZvHbd4rRZoRtVIX1Yu3dToMEQW/JDa57jmH
         U2gv/fBtRPKbuev8bHzBzCa9ZchoK9hFv2WLfNNGy1LXPEcJ1dl2wu7zm2aATntQFX2E
         b0pQ==
X-Gm-Message-State: AOAM531XDJYEUzTtq6FXmXY0RpJ5XHuq1Kwird0AMHyZarzRMFqqvPmo
	+bmkVlF/LWcYx9/hLemmpYDXHw==
X-Google-Smtp-Source: ABdhPJwueWxtKqjP8KyNWWEV43ZHbAJgLgbtzL1ErWyEowm3/77Murhw193eceS6jFlQ9sjaEQjTVg==
X-Received: by 2002:a92:da85:: with SMTP id u5mr1851944iln.213.1632782018707;
        Mon, 27 Sep 2021 15:33:38 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] block: second batch of add_disk() error handling
 conversions
To: Luis Chamberlain <mcgrof@kernel.org>, colyli@suse.de,
 kent.overstreet@gmail.com, kbusch@kernel.org, sagi@grimberg.me,
 vishal.l.verma@intel.com, dan.j.williams@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, konrad.wilk@oracle.com, roger.pau@citrix.com,
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 minchan@kernel.org, ngupta@vflare.org, senozhatsky@chromium.org
Cc: xen-devel@lists.xenproject.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210927220039.1064193-1-mcgrof@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <c17004ed-884f-5a97-c333-602e3f9903e7@kernel.dk>
Date: Mon, 27 Sep 2021 16:33:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210927220039.1064193-1-mcgrof@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/27/21 4:00 PM, Luis Chamberlain wrote:
> This is the second series of driver conversions for add_disk()
> error handling. You can find this set and the rest of the 7th set of
> driver conversions on my 20210927-for-axboe-add-disk-error-handling
> branch [0].

Applied 1, thanks.

-- 
Jens Axboe


