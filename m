Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA905B842D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 11:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406870.649268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYON2-0005tK-OA; Wed, 14 Sep 2022 09:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406870.649268; Wed, 14 Sep 2022 09:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYON2-0005rX-LS; Wed, 14 Sep 2022 09:07:48 +0000
Received: by outflank-mailman (input) for mailman id 406870;
 Wed, 14 Sep 2022 09:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cVK2=ZR=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oYON0-0005rN-N8
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 09:07:46 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b22d0c8b-340c-11ed-a31c-8f8a9ae3403f;
 Wed, 14 Sep 2022 11:07:45 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id h8so17649200wrf.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Sep 2022 02:07:45 -0700 (PDT)
Received: from [172.20.8.228] ([167.98.135.4])
 by smtp.gmail.com with ESMTPSA id
 z13-20020adfec8d000000b0022a297950cesm13462479wrn.23.2022.09.14.02.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 02:07:44 -0700 (PDT)
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
X-Inumbo-ID: b22d0c8b-340c-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date;
        bh=S3hbsnsO8bUP9TSp7ZglWfwWoT4ej0T3vP2Vf4axeRY=;
        b=G7jMJbsndfm2/QKZljNIpEuHp+Nieo2q5dF44Ga2Gd7uQyl4bDAB4lpIV97YVjZUNG
         5l2wpV4wp59OQrqv1gzPkT4A1SFJEDOjCzUpAQCJN60PCuz1hHUrmuVV5feyVOo27ja7
         tT8HOSzVz58NlbGZD1sw2PYQH00itM5CRhaVShG1+4/nSbu+2loATpGlSY1wjCVO4W/9
         avKIktGjEkFiV1Om8Qu2A+Vuu9ZiMayZmxsflrcIFwpa0d9BNgqnVfTVMbNelkPCludl
         POhE8/XFnLAxKapqupXD35EQFrUr9Lx0YPYXsluxELh7TzXdtxpftT/3VdHgG+B7Kf/6
         GG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=S3hbsnsO8bUP9TSp7ZglWfwWoT4ej0T3vP2Vf4axeRY=;
        b=Fp7paX0IXqKh2K1F70H0sFLDjqj6mPPG4Mapx+LKxNgzxMs+R5UU4szppGZQCOlYyR
         WB75uhrC7SzmFSsHq1u3iGnSKw8mz7HmscHsA3/QtG9MGpSQ1NUrTSGfvPJXMMJkZ3z8
         lExQ6D1/fhFvUs4C/tY9iH5ZMWxIK1XDPLjSsLNzHLjwFS6ab1VusgF38lwYcq/XVNPX
         HNqO4M6+72eRPwRtbDpGLW5/DC50H4/u4w4qWMwvD1TJBXHjHB2juyxo8JXG+qumP0Q+
         phflbzIQvUpEBxZi9ca/0wCmCrcJcyVFgSQSkNPeP3QfZcjO6R88LDYIhLXIzui865Gw
         qchg==
X-Gm-Message-State: ACgBeo19JqFA+WI0nO9Bsg+SR/jdWdi10mUpUbL2Q6a1XLT8EbsgvU87
	1Q31170pKy87d+k6VzFTfJI=
X-Google-Smtp-Source: AA6agR7d57jlvfQGD4mmVzestJI6g+JSFVhlnr9SWQBdqsNpL7CF9bwHEO3iRUr/ROcB4KuBgxJNjw==
X-Received: by 2002:adf:a70b:0:b0:226:e1f5:7889 with SMTP id c11-20020adfa70b000000b00226e1f57889mr20199977wrd.108.1663146464747;
        Wed, 14 Sep 2022 02:07:44 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8be84a25-c31d-fd88-f913-c03c15046a55@xen.org>
Date: Wed, 14 Sep 2022 10:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
To: "Ji, Ruili" <Ruili.Ji@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Liu, Aaron" <Aaron.Liu@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993C52DD9A881FACE6FA28D9B419@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993DC46EDF5D01ED20E2E179B479@BL1PR12MB5993.namprd12.prod.outlook.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <BL1PR12MB5993DC46EDF5D01ED20E2E179B479@BL1PR12MB5993.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/09/2022 04:02, Ji, Ruili wrote:
> [AMD Official Use Only - General]
> 
> 
> Hi Paul,
> 
> Could you help to review this patch?
> 

LGTM. You can add my R-b to it.

   Paul

> Thanks
> 
> *From:* Ji, Ruili
> *Sent:* 2022年9月7日 9:04
> *To:* 'Paul Durrant' <paul@xen.org>; 'qemu-devel@nongnu.org' 
> <qemu-devel@nongnu.org>
> *Cc:* Liu, Aaron <Aaron.Liu@amd.com>; 'xen-devel@lists.xenproject.org' 
> <xen-devel@lists.xenproject.org>
> *Subject:* RE: [PATCH] hw/xen: set pci Atomic Ops requests for 
> passthrough device
> 
> FYI
> 
> *From:* Ji, Ruili
> *Sent:* 2022年9月6日 15:40
> *To:* qemu-devel@nongnu.org <mailto:qemu-devel@nongnu.org>
> *Cc:* Liu, Aaron <Aaron.Liu@amd.com <mailto:Aaron.Liu@amd.com>>
> *Subject:* [PATCH] hw/xen: set pci Atomic Ops requests for passthrough 
> device
> 
>  From c54e0714a1e1cac7dc416bd843b9ec7162bcfc47 Mon Sep 17 00:00:00 2001
> 
> From: Ruili Ji ruili.ji@amd.com <mailto:ruili.ji@amd.com>
> 
> Date: Tue, 6 Sep 2022 14:09:41 +0800
> 
> Subject: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device
> 
> Make guest os access pci device control 2 reg for passthrough device
> 
> as struct XenPTRegInfo described in the file hw/xen/xen_pt.h.
> 
> /* reg read only field mask (ON:RO/ROS, OFF:other) */
> 
> uint32_t ro_mask;
> 
> /* reg emulate field mask (ON:emu, OFF:passthrough) */
> 
> uint32_t emu_mask;
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1196 
> <https://gitlab.com/qemu-project/qemu/-/issues/1196>
> 
> Signed-off-by: Aaron.Liu@amd.com <mailto:Aaron.Liu@amd.com>
> 
> Signed-off-by: ruili.ji@amd.com <mailto:ruili.ji@amd.com>
> 
> ---
> 
> hw/xen/xen_pt_config_init.c | 4 ++--
> 
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> 
> index c5c4e943a8..adc565a00a 100644
> 
> --- a/hw/xen/xen_pt_config_init.c
> 
> +++ b/hw/xen/xen_pt_config_init.c
> 
> @@ -985,8 +985,8 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
> 
>           .offset     = 0x28,
> 
>           .size       = 2,
> 
>           .init_val   = 0x0000,
> 
> -        .ro_mask    = 0xFFE0,
> 
> -        .emu_mask   = 0xFFFF,
> 
> +        .ro_mask    = 0xFFA0,
> 
> +        .emu_mask   = 0xFFBF,
> 
>           .init       = xen_pt_devctrl2_reg_init,
> 
>           .u.w.read   = xen_pt_word_reg_read,
> 
>           .u.w.write  = xen_pt_word_reg_write,
> 
> -- 
> 
> 2.34.1
> 


