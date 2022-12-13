Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA0064B420
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:25:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460526.718458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53PA-0000dK-VG; Tue, 13 Dec 2022 11:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460526.718458; Tue, 13 Dec 2022 11:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53PA-0000a3-S2; Tue, 13 Dec 2022 11:25:00 +0000
Received: by outflank-mailman (input) for mailman id 460526;
 Tue, 13 Dec 2022 11:24:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3cNm=4L=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p53P8-0000ME-Om
 for xen-devel@lists.xen.org; Tue, 13 Dec 2022 11:24:58 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c65a23eb-7ad8-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 12:24:58 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so7621859wmb.2
 for <xen-devel@lists.xen.org>; Tue, 13 Dec 2022 03:24:57 -0800 (PST)
Received: from [10.17.77.104] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1c5444000000b003d1e051f671sm12240135wmi.9.2022.12.13.03.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 03:24:56 -0800 (PST)
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
X-Inumbo-ID: c65a23eb-7ad8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zzKSrhRjNKwDPrxvmmbmQD2gMH3MjOqGUB1YYKIlmc=;
        b=g4/+bZT2eqxOtIwW+DvoGleVrRvlfq3wog3BvMaXR8zPCVuSLDI0m2Kr+7/gUjjtoy
         Z0omMWFAGHUXmKiKcPxmvRxVDb+5nDzhCA5yBlqIQ1pIizR9SW4XnC0XmjOXs+U9PD95
         ICuHQ4QxHXzqjCHp0Q2rlkyX2zQ8e+8mC+gcbxbxofLvEeQm5Asr6y6nn/Ytg2AbJTMM
         2Lhw6763aGFByjeu+zy6K2ciCEftIYBfrpjcVMndZMtah7jHWUItQhDNKIxOSsYmJaMs
         dvflc6ZiXgf54BwqAZRvt10rXOJDLBxrdYQv8MKGzfn+t29c0tpeTKlBWKqZ2zGEeAYF
         BKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zzKSrhRjNKwDPrxvmmbmQD2gMH3MjOqGUB1YYKIlmc=;
        b=25KwmcCjGgP0BDNyBWCeLuj7bG/zZSB8zvhph/hwjjlQi4od8ihIv72GUDfKf8Tmd/
         29hyqjwYSg2EEOXAK5xWUiioTq61LbJKgvyMTWBtPYXGh5zKMZMDTQFZ1bSSskxUOy8i
         /+cgTendVEA6M5KRe2K3wm4U2sTa8HUw7xeHbwRom0lywNp8d7yCoBBJSOtQl3ginXzh
         5eZ4Ke8LNF6ysQIQSZW+NLAgCHvJzTtCpJix9fr3Wi7SnkMcwywTAtUj1Ajqx1kZUFh4
         IoF4ZeNFFic0WPGULsQukD8FX7QAVRMakFlX8ZIEMYLp9ipOrn8SmoAyfoYElityC6d9
         4GRQ==
X-Gm-Message-State: ANoB5pnCWkRhvpq3b8LX0VlAdynLzJOxW7iZGT9lwkw4cROIXTbY1/4w
	7g5603MNaHaFLCHZGi6JftY=
X-Google-Smtp-Source: AA0mqf4BOJ2Lb3iJ25AUgRIHFcXdprIhJXCpxVoJG7rrBf2qKQqMO5cyjUkUgx80BRHLPzGpXznk5g==
X-Received: by 2002:a05:600c:3d15:b0:3c6:e62e:2e8d with SMTP id bh21-20020a05600c3d1500b003c6e62e2e8dmr15122741wmb.40.1670930697287;
        Tue, 13 Dec 2022 03:24:57 -0800 (PST)
Message-ID: <93a31fd0-d610-aee0-31a0-cf0e21ed8057@gmail.com>
Date: Tue, 13 Dec 2022 13:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V9 3/3] docs: Add documentation for generic virtio devices
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1670925998.git.viresh.kumar@linaro.org>
 <a0eb1c6d571cc3ed9ca7dd71dabe3aba6e69100c.1670925998.git.viresh.kumar@linaro.org>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <a0eb1c6d571cc3ed9ca7dd71dabe3aba6e69100c.1670925998.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13.12.22 12:08, Viresh Kumar wrote:


Hello Viresh

> This patch updates xl.cfg man page with details of generic Virtio device
> related information.
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>


Now it looks perfect, thanks

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

> ---
>   docs/man/xl.cfg.5.pod.in | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index ec444fb2ba79..024bceeb61b2 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1585,6 +1585,39 @@ Set maximum height for pointer device.
>   
>   =back
>   
> +=item B<virtio=[ "VIRTIO_DEVICE_STRING", "VIRTIO_DEVICE_STRING", ...]>
> +
> +Specifies the Virtio devices to be provided to the guest.
> +
> +Each B<VIRTIO_DEVICE_STRING> is a comma-separated list of C<KEY=VALUE> settings
> +from the following list. As a special case, a single comma is allowed in the
> +VALUE of the "type" KEY, where the VALUE is set with "virtio,device<N>".
> +
> +=over 4
> +
> +=item B<backend=domain-id>
> +
> +Specifies the backend domain name or id, defaults to dom0.
> +
> +=item B<type=STRING>
> +
> +Specifies the compatible string for the specific Virtio device. The same will be
> +written in the Device Tree compatible property of the Virtio device. For
> +example, "type=virtio,device22" for the I2C device, whose device-tree binding is
> +present here:
> +
> +L<https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml>
> +
> +For generic virtio devices, where we don't need to set special or compatible
> +properties in the Device Tree, the type field must be set to "virtio,device".
> +
> +=item B<transport=STRING>
> +
> +Specifies the transport mechanism for the Virtio device, only "mmio" is
> +supported for now.
> +
> +=back
> +
>   =item B<tee="STRING">
>   
>   B<Arm only.> Set TEE type for the guest. TEE is a Trusted Execution

