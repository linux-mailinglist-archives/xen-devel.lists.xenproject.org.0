Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441782222A9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 14:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw3DR-00027H-Su; Thu, 16 Jul 2020 12:42:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QxFF=A3=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jw3DQ-00027C-5a
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 12:42:20 +0000
X-Inumbo-ID: c93d5f7a-c761-11ea-8496-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c93d5f7a-c761-11ea-8496-bc764e2007e4;
 Thu, 16 Jul 2020 12:42:19 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q15so10177282wmj.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2020 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oOd1Aym1uv5KKe0noR2NOU6jCkeQAG1+aul16luO/II=;
 b=jBNP5ouL0+8xKV29EOKkSz3SM9MGHRvLpSfh57q6k0ZmGC6AuoHr5/pRHNZsFha63n
 zAYARYNEzq1JyGWj6cF3Dc31X/7NKIenLGrJT14qD8souxjTj+5T64F0dNSGHP1MyxbH
 AnD6VP9wQpDfjcuG4emJJ3xr5PiBvqldx4mgzyutHq6y8iqW6jBuhhyUOWFXZ+L+zVtc
 8G+0AXHVVtrp6TGrGgDl9ohF6tJ5HiI9oXTEDAPTvB8Zzy5mhBmZGosjMpaEUjC018EY
 Cg0JDZ6Ls7mP0XYf5wglWJSDeJG9vUlXPNgjVB6O3+2f3WvVV+3UmF+KWHMCzH9cQ/Rz
 Czrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oOd1Aym1uv5KKe0noR2NOU6jCkeQAG1+aul16luO/II=;
 b=pKLTMZtVPr4dD69pLI2QePI6KG8XgE79a28cfzbR1QnbBzbEw6VonFSt91BfTz36qe
 x9FfAGih68KMSF8QFEO0yRYnzmyAQpAJ4n5XJHxV36QQDBNaMIwc8btcCPM+zRULgksl
 dAafUa3iot8yKLIkiuhqKPpi6dCSY2i/tBZQ3MeZ2vTBIQyGRcqa02cTN7Ozwh4E7WMk
 hH1RnMcoZ8C056jOlO5kXrYhK7ySPvqqKxNxt1CBNXnMFsUY5yz0jeUmGNloUrEezWyh
 c5O3opYTtCHapp2v/622RljN/o6VdqLa2q7/GA8/PXWav0y+vgP9S/EXwfmxxKxCMsVZ
 EtZw==
X-Gm-Message-State: AOAM532EiBxyLLOrpGMmRRrCo9AxYB5BQCxQbFk1NKwn5a11Wj7iPVm4
 xiLSSibfzX5p75MLmQt+V0I=
X-Google-Smtp-Source: ABdhPJwiubA6N1ZbLaINf6jicEifGqUVKpccq2W4gVLvNYVc0q80pSswMs28W2q5IWZjl2OdrdelKg==
X-Received: by 2002:a05:600c:218f:: with SMTP id
 e15mr4078065wme.187.1594903338621; 
 Thu, 16 Jul 2020 05:42:18 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id k131sm8613997wmb.36.2020.07.16.05.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2020 05:42:17 -0700 (PDT)
Subject: Re: [PATCH-for-5.2 v2 1/2] block/block-backend: Trace blk_attach_dev()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200716123704.6557-1-f4bug@amsat.org>
 <20200716123704.6557-2-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1cdce80f-ef11-b495-98ec-d76dcc6cc729@amsat.org>
Date: Thu, 16 Jul 2020 14:42:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200716123704.6557-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/16/20 2:37 PM, Philippe Mathieu-Daudé wrote:
> Add a trace event to follow devices attaching block drives:
> 
>   $ qemu-system-arm -M n800 -trace blk_\*
>   9513@1594040428.738162:blk_attach_dev attaching blk 'sd0' to device 'omap2-mmc'
>   9513@1594040428.738189:blk_attach_dev attaching blk 'sd0' to device 'sd-card'
>   qemu-system-arm: sd_init failed: blk 'sd0' already attached by device 'sd-card'

Oops, the current error is:

    qemu-system-arm: sd_init failed: Drive 'sd0' is already in use by
another device

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  block/block-backend.c | 1 +
>  block/trace-events    | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 0bf0188133..63ff940ef9 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -888,6 +888,7 @@ void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
>   */
>  int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
>  {
> +    trace_blk_attach_dev(blk_name(blk), object_get_typename(OBJECT(dev)));
>      if (blk->dev) {
>          return -EBUSY;
>      }
> diff --git a/block/trace-events b/block/trace-events
> index dbe76a7613..aa641c2034 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -9,6 +9,7 @@ blk_co_preadv(void *blk, void *bs, int64_t offset, unsigned int bytes, int flags
>  blk_co_pwritev(void *blk, void *bs, int64_t offset, unsigned int bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %u flags 0x%x"
>  blk_root_attach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
>  blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
> +blk_attach_dev(const char *blk_name, const char *dev_name) "attaching blk '%s' to device '%s'"
>  
>  # io.c
>  bdrv_co_preadv(void *bs, int64_t offset, int64_t nbytes, unsigned int flags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
> 

