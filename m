Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958324B2962
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 16:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270588.464925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIYAE-0006ZX-Mi; Fri, 11 Feb 2022 15:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270588.464925; Fri, 11 Feb 2022 15:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIYAE-0006Xe-JR; Fri, 11 Feb 2022 15:48:50 +0000
Received: by outflank-mailman (input) for mailman id 270588;
 Fri, 11 Feb 2022 15:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ifew=S2=linux.intel.com=srinivas.pandruvada@srs-se1.protection.inumbo.net>)
 id 1nIY8c-0006V5-FV
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 15:47:10 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcac54c6-8b51-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 16:47:07 +0100 (CET)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:46:52 -0800
Received: from ankitata-mobl1.amr.corp.intel.com (HELO
 spandruv-desk1.amr.corp.intel.com) ([10.212.170.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:46:51 -0800
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
X-Inumbo-ID: dcac54c6-8b51-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644594427; x=1676130427;
  h=message-id:subject:from:to:date:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pVxiaW+vV0quQ79sfEqbYXTjlLZHvVBgUsqT5Tk+lEY=;
  b=GZ4Jw9NuIjrxD3kvZ8YYjDICHW1THznaLD4AcksdQsl1saARH7MhpDZQ
   shPkeSj9i7XfkHlMWK5OHj36yscUVxhWMIXVZTq+da+Ugim5c4usuzFli
   wdHBtxmrpNpdXZfx8Sn8iH2fmN6uC54G/MTOmnmFUocBX3+VeleNZ0Jxw
   pYscTCUwJyLvrxmPAWajgkYeLnN/p+cwrFIhFeHEY7tSGs+dsopJRklX2
   1GR/8syo+ecv9HDuUcPDuRL78DBnWjgANS8gyIH4LQUeAYpCezF+Zcumf
   6ACCqNevuG6xX80GRieeFP+b99N763V8HzLun1idCRp6/psjGCaFsEfzy
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="274310314"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="274310314"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="542134195"
Message-ID: <077501bfcb710c66754c61d69e45cac66fccf38a.camel@linux.intel.com>
Subject: Re: [PATCH V2 5/13] hid: use time_is_after_jiffies() instead of
 jiffies judgment
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Qing Wang <wangqing@vivo.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,  Alex
 Deucher <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>,  "Pan, Xinhui" <Xinhui.Pan@amd.com>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,  Alasdair Kergon <agk@redhat.com>, Mike
 Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,  Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, 
 linux-media@vger.kernel.org
Date: Fri, 11 Feb 2022 07:46:51 -0800
In-Reply-To: <1644546640-23283-6-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
	 <1644546640-23283-6-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2022-02-10 at 18:30 -0800, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> It is better to use time_xxx() directly instead of jiffies judgment
> for understanding.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
>  drivers/hid/intel-ish-hid/ipc/ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-
> ish-hid/ipc/ipc.c
> index 8ccb246..15e1423
> --- a/drivers/hid/intel-ish-hid/ipc/ipc.c
> +++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
> @@ -578,7 +578,7 @@ static void _ish_sync_fw_clock(struct
> ishtp_device *dev)
>         static unsigned long    prev_sync;
>         uint64_t        usec;
>  
> -       if (prev_sync && jiffies - prev_sync < 20 * HZ)
> +       if (prev_sync && time_is_after_jiffies(prev_sync + 20 * HZ))
>                 return;
>  
>         prev_sync = jiffies;


