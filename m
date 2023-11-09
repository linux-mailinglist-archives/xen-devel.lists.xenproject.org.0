Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD747E6DFB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 16:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629729.982106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r17Fy-0002K7-U5; Thu, 09 Nov 2023 15:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629729.982106; Thu, 09 Nov 2023 15:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r17Fy-0002Ho-Qr; Thu, 09 Nov 2023 15:47:46 +0000
Received: by outflank-mailman (input) for mailman id 629729;
 Thu, 09 Nov 2023 15:47:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amlx=GW=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r17Fx-0002Hi-HY
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 15:47:45 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52a4cb6d-7f17-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 16:47:44 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4081ccf69dcso13231595e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 07:47:44 -0800 (PST)
Received: from [192.168.12.204] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 bd13-20020a05600c1f0d00b004065daba6casm2474789wmb.46.2023.11.09.07.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 07:47:43 -0800 (PST)
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
X-Inumbo-ID: 52a4cb6d-7f17-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699544864; x=1700149664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIsrAhFpMhYGb51ZGgcGzzrbHAXCESCLllmiiSnB6FE=;
        b=MxJ0qwaPoF0RZLeHSW+YF03SF0swwDsdjmWZqG82x9TQRTKVJx3kYOAIspF83SRg+l
         V8fx373OqhOamEuhqi47I3e2Jgem5QL2DG67JHU2bceicnl6lDmjrE6KUVhGUjJslWaZ
         ebEtCNO4lgS9YtrHHC1Qx2SiNre3ecK8JR7LZZj6qw5Z0+gOD5aOgGWtzVeNc+3805Kw
         WRxiTcPRkTOKSzBF9i1y2icIfVVIu458Jc5PIBAklQIN5OIlDv/j0GRsgzKey9VgRdB6
         vVJhuhwO3agC4AGOOxtgqIk9jy5ur+XR231imvDaXK1HG1MZnW9r6QltiVts18Co1WNV
         AHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699544864; x=1700149664;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIsrAhFpMhYGb51ZGgcGzzrbHAXCESCLllmiiSnB6FE=;
        b=Z2hFIHgQnuJf0F0ZZP6Ihj+OmgvyIeCHx5n2PGA1iiyUBbTrIMmi4pzEGOF3OxczOs
         kHHQ0TPKMNy6emmzckUp9vrZP5EUEhmKvMzc6mB9QPRwqQFxP1oiFSVGNPugZLS4FUth
         /aOEhndJn3vM+QcedxRfHQFXHLlflxMzHTtnhx/Vc83riworcfidUcegxO2A+k6FhyRj
         UeltXuhuwbyWDDOjfrIcBF0EazGmhKAtTkju4VC+vIo6OsKk+ncwxpb/1lidA2nf35Zs
         RlcGULL85dIIL7QyjyIsWjRW8pm4hx+KWteqE538e/L28JSbV7pZlsMyfdJun+4Ynm0j
         qy2A==
X-Gm-Message-State: AOJu0YxKMw2YrL3s6x+yY6z/Jsd58rYA5NMlptYbNbNiKZ8eCc7kxgcw
	Pul89kBE7PdrlU/XY613SfU=
X-Google-Smtp-Source: AGHT+IEwP0rH0HLKuGubI2Y6aunJib5CTC75Re2w2jGBSptDq4tJ55ycLtpSsU7u+qT3BGAgZ/1AWw==
X-Received: by 2002:a5d:5087:0:b0:32d:a3cb:4059 with SMTP id a7-20020a5d5087000000b0032da3cb4059mr7030714wrt.24.1699544863643;
        Thu, 09 Nov 2023 07:47:43 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b1ec4c57-954a-45c0-8ef5-0b63a7f54b3a@xen.org>
Date: Thu, 9 Nov 2023 15:47:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH] hw/xen: clean up xen_block_find_free_vdev() to avoid
 Coverity false positive
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org
References: <1c312ba88e0928527dad6bc2e1b73d8cfe4b7f48.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <1c312ba88e0928527dad6bc2e1b73d8cfe4b7f48.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/11/2023 15:30, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Coverity couldn't see that nr_existing was always going to be zero when
> qemu_xen_xs_directory() returned NULL in the ENOENT case (CID 1523906).
> 
> Perhaps more to the point, neither could Peter at first glance. Improve
> the code to hopefully make it clearer to Coverity and human reviewers
> alike.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/block/xen-block.c | 24 +++++++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


