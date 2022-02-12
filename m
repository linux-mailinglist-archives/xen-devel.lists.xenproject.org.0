Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AE34B3696
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 17:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270808.465132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIvYb-000354-CD; Sat, 12 Feb 2022 16:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270808.465132; Sat, 12 Feb 2022 16:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIvYb-00033I-95; Sat, 12 Feb 2022 16:47:33 +0000
Received: by outflank-mailman (input) for mailman id 270808;
 Sat, 12 Feb 2022 16:47:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gda3=S3=mit.edu=tytso@srs-se1.protection.inumbo.net>)
 id 1nIvYa-000339-Ct
 for xen-devel@lists.xenproject.org; Sat, 12 Feb 2022 16:47:32 +0000
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 772730df-8c23-11ec-b215-9bbe72dcb22c;
 Sat, 12 Feb 2022 17:47:30 +0100 (CET)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21CGkxsP010096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Feb 2022 11:47:00 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 1847215C0040; Sat, 12 Feb 2022 11:46:59 -0500 (EST)
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
X-Inumbo-ID: 772730df-8c23-11ec-b215-9bbe72dcb22c
Date: Sat, 12 Feb 2022 11:46:59 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Qing Wang <wangqing@vivo.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
        dm-devel@redhat.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, xen-devel@lists.xenproject.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V2 00/13] use time_is_xxx() instead of jiffies judgment
Message-ID: <Ygfkg0n6RvvJYMJa@mit.edu>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>

On Thu, Feb 10, 2022 at 06:30:23PM -0800, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> It is better to use time_is_xxx() directly instead of jiffies judgment
> for understanding.

Hi Wang,

"judgement" doesn't really make sense as a description to an English
speaker.  The following a commit desription (for all of these series)
is probably going to be a bit more understable:

Use the helper function time_is_{before,after}_jiffies() to improve
code readability.

Cheers,

						- Ted

