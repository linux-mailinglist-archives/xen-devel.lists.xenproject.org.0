Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22C64B7AF5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 00:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273586.468833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK6nF-0003GU-E1; Tue, 15 Feb 2022 22:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273586.468833; Tue, 15 Feb 2022 22:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK6nF-0003Dd-B0; Tue, 15 Feb 2022 22:59:33 +0000
Received: by outflank-mailman (input) for mailman id 273586;
 Tue, 15 Feb 2022 22:59:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0FC=S6=gmail.com=dmitry.torokhov@srs-se1.protection.inumbo.net>)
 id 1nK6nD-0003DX-CX
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 22:59:31 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee3fb26e-8eb2-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 23:59:30 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso4654740pjt.4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Feb 2022 14:59:30 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4e4a:b0ff:e926:40e2])
 by smtp.gmail.com with ESMTPSA id n85sm10430319pfd.142.2022.02.15.14.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 14:59:25 -0800 (PST)
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
X-Inumbo-ID: ee3fb26e-8eb2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ydg/QaEHk+YtzGHqWPzjDmBjfyy2f1JmjiAxPzP8crc=;
        b=neA8UZ+ztvqI+c9Y0GhuINKiFZbH9bwEKDbDdCj/aBEOg8Je4KJR2FY7wqhQqcBAYk
         3Wy+WGL8h5hMZhHiRrJnELKEzNVne+rWwRiNSK+LaaB40t3gKAMZ5iPl6SH4z0sCF1sK
         WeebZKAyrtHxpGEBt52RHDKoImWcRYibqiE5YdJSrERCh5ErepkYhiOc7Yw8VRa7JtSJ
         adEHSUdt8ZETIXkSrLoXpm9wbvKFejNQ1Fv3M/q0bRnt69wRrVeApz/eynGg7QDAnCzT
         uJF8lE/RahbG4H9xVfC7Tm4Wgh1nT1vyrj+ukgd4F45LFSngNGYO0nz3bd1+0RfzB/uo
         Q/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ydg/QaEHk+YtzGHqWPzjDmBjfyy2f1JmjiAxPzP8crc=;
        b=rrX/9m/dUA0gBgIKTuOucjai8w6p5rggoP7MYJfHADccd+N4s4gq2yFPZdcJyiP0Zh
         jDwY2/DQYDyu249fBUgazXKL5zmpHheIOH+CY7lr0Qbxia06ptVRMCLflf4v/uvGi3P5
         HkC4nZCHb4OfyQ3w/zxjyD2etSwX1tjQRzww0MRFHkPip+dBdOppRHfXUjlD5m/KlLRK
         jQAv5/k//myEXhM2/vfj98d4FkGuqWTmvzH3f6yXlnJvql++38/PBaijy2jqU/WdTWHD
         unVa/WYQIoBA+SSMWavNsikW5NMPXDvvykO3WHWV8LYNX6qBNjZ2mdrq34/T6NoJ23R6
         nTXg==
X-Gm-Message-State: AOAM531WR028QUfcOtyG7tf+m1vlagtQXwOR7N8oFfg3fQKidhE+W7Lb
	MR6NA00Eu9+AZE/SSJ3zoZ0=
X-Google-Smtp-Source: ABdhPJzD5VTWuMUJjUi6d0x1rXiN3okRfTcvfy3+tsDIIsH6bfb6SZ+FiyUr2n1wCBp6WTu5fGOOUA==
X-Received: by 2002:a17:902:f686:: with SMTP id l6mr1079179plg.7.1644965965923;
        Tue, 15 Feb 2022 14:59:25 -0800 (PST)
Date: Tue, 15 Feb 2022 14:59:21 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Qing Wang <wangqing@vivo.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V3 6/13] input: serio: use time_is_before_jiffies()
 instead of open coding it
Message-ID: <YgwwSUlZVakiYF8j@google.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
 <1644890154-64915-7-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644890154-64915-7-git-send-email-wangqing@vivo.com>

Hi Wang,

On Mon, Feb 14, 2022 at 05:55:43PM -0800, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.

I applied changes by Danilo Krummrich converting the driver to use
ktime_t (see https://lore.kernel.org/r/20220215160208.34826-3-danilokrummrich@dk-develop.de)
which makes this change not applicable.

Thanks.

-- 
Dmitry

