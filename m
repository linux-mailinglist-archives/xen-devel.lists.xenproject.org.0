Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AFA49B590
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260377.449752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCMOq-0004NL-Dp; Tue, 25 Jan 2022 14:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260377.449752; Tue, 25 Jan 2022 14:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCMOq-0004LE-AS; Tue, 25 Jan 2022 14:02:20 +0000
Received: by outflank-mailman (input) for mailman id 260377;
 Tue, 25 Jan 2022 14:02:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAYL=SJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nCMOo-0004L8-Su
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:02:18 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67efcc77-7de7-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 15:02:17 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 r2-20020a1c2b02000000b0034f7b261169so1919781wmr.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jan 2022 06:02:17 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id 9sm22356144wrb.77.2022.01.25.06.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 06:02:16 -0800 (PST)
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
X-Inumbo-ID: 67efcc77-7de7-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GvV+xNRtZLIMNEQnG51h8ZugFDkjuKP1UVK/mYBRxII=;
        b=MV7J+7T6Mk5zsK3Wf9ewuOCyZkutph2SgAC3Kzaa2jv6UeEX1iVCWR8Wfgc9Msh7xT
         T2Jr9kKxCaZAdiXYS107Hp17pMiM4WtLfxL91zD/RJFCP0mmAUUcqMc0XM21ddiHLzab
         rAkGTBGo/kqy6JllBcVWdFedjXOiUDXerkWdMYg1v/41z1AoW456dy/finc2nGxghsiV
         5QBUHl38DT2/Qq6e5MBUe/YUCj6i8O+fVBk8yPQjHd2dz65C0iHHW1ZD+Xwwqw7oVh7+
         HGFmGm5PaSGx75LUEOYnIVIPf5JtryYzg3PcYxvZDjqIFBbqeX+256dAiRLlseHtFD+k
         n8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GvV+xNRtZLIMNEQnG51h8ZugFDkjuKP1UVK/mYBRxII=;
        b=whhb7IrqarUzrb2cW06FV69iENWuxmojS1H6393uBVhXJYuT2co/es5tJDFwDuCuhJ
         d3iRFccoTHrrQ9MK1oz26LKRppUye2sIZL2dLm7eRDBl9D15n9kYFVw970yW6bYGCcor
         XY3A8gicLV2zcW89RtebH1+Nx/0qbeQaup4CgEmm2oow3xg3n1TGtjzJTbHS9/bwyu0F
         2zvMnS8njlEGzDw/wLuNoUn0VrR+4lN6YxI8c/9GSMs277Z4bBnfvzA4gdLEeaHJGvyP
         G2QMyZzh6yDTJbiCHuUyKGJ6cNKBQKbk6U5ak0fDH1/TZEHVxyIbGcl+y5LtyKM6k36K
         eOMA==
X-Gm-Message-State: AOAM5308e3N6iE+sUKRHLUpaLJm05Zry+jKSZwieaChXv8jHPtjx3QAs
	vpoev1nXzhrCi0Nx4LDZ8Vo=
X-Google-Smtp-Source: ABdhPJynkoPCTEsiUAwniYVIygV6cGBsSd0Ivg84wu+znpwtfdaALDpzyTy83oqPGQsHx1Si8iGd4Q==
X-Received: by 2002:a05:600c:1c87:: with SMTP id k7mr3214155wms.60.1643119337439;
        Tue, 25 Jan 2022 06:02:17 -0800 (PST)
Message-ID: <73294d6f-265a-ebb9-acd2-6b8dd786c29c@gmail.com>
Date: Tue, 25 Jan 2022 14:02:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] libxl: force netback to wait for hotplug execution before
 connecting
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, James Dingwall <james-xen@dingwall.me.uk>,
 Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>
References: <20220124160248.37861-1-roger.pau@citrix.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220124160248.37861-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/01/2022 16:02, Roger Pau Monne wrote:
> By writing an empty "hotplug-status" xenstore node in the backend path
> libxl can force Linux netback to wait for hotplug script execution
> before proceeding to the 'connected' state.
> 
> This is required so that netback doesn't skip state 2 (InitWait) and
> thus blocks libxl waiting for such state in order to launch the
> hotplug script (see libxl__wait_device_connection).
> 
> Reported-by: James Dingwall <james-xen@dingwall.me.uk>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Tested-by: James Dingwall <james-xen@dingwall.me.uk>
> ---
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Paul Durrant <paul@xen.org>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>   tools/libs/light/libxl_nic.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
> index 0b45469dca..0b9e70c9d1 100644
> --- a/tools/libs/light/libxl_nic.c
> +++ b/tools/libs/light/libxl_nic.c
> @@ -248,6 +248,13 @@ static int libxl__set_xenstore_nic(libxl__gc *gc, uint32_t domid,
>       flexarray_append(ro_front, "mtu");
>       flexarray_append(ro_front, GCSPRINTF("%u", nic->mtu));
>   
> +    /*
> +     * Force backend to wait for hotplug script execution before switching to
> +     * connected state.
> +     */
> +    flexarray_append(back, "hotplug-status");
> +    flexarray_append(back, "");
> +
>       return 0;
>   }
>   


