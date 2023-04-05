Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EBC6D7715
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 10:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518324.804730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjydJ-0007b8-Ub; Wed, 05 Apr 2023 08:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518324.804730; Wed, 05 Apr 2023 08:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjydJ-0007YX-Ra; Wed, 05 Apr 2023 08:36:45 +0000
Received: by outflank-mailman (input) for mailman id 518324;
 Wed, 05 Apr 2023 08:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mHoi=74=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1pjydI-0007YN-Hn
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 08:36:44 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd3badf8-d38c-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 10:36:42 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id r11so35341365wrr.12
 for <xen-devel@lists.xen.org>; Wed, 05 Apr 2023 01:36:41 -0700 (PDT)
Received: from [192.168.0.106] ([91.123.150.38])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm13806796wrr.100.2023.04.05.01.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 01:36:40 -0700 (PDT)
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
X-Inumbo-ID: fd3badf8-d38c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680683801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgcwjOGVr1lFUtMdP9HgDE1IUQk05oAJXW/E6R9ojlg=;
        b=nec8S49q1O8S+prmVrvx7Te7QroUTNSdm/2WXcKzONbDjQRldGX1Mr7AS5BMRnpwzP
         Nk1iu58bReXmw1Nv7CXSJm837UmL4XYMoKX7p5TGsKI8pateVn9ytaqVESFUiEYRNDDF
         Wz7crxIvJVPfuF/dxsSOW+MTBhBpyCAZN9nDGEvgnmM1OEeGUTjTUqvIyo261MZyRqhH
         VpkfV3Qil6dw/9FOxhTsQiQGWhQZUcNzYYDfmy1RAsP7FuBsuRk9wuB/q+a7cyMCmnrc
         ntv3d2jT7y7j1QVVSaz6LYyQ43woWI6jy14pLOAFsareox5dkCBhP4XzqMyP4KQPWIXo
         Iylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680683801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgcwjOGVr1lFUtMdP9HgDE1IUQk05oAJXW/E6R9ojlg=;
        b=v3lpE0u/UpHrPqpzQqzA1X5A4tfsPEEglxuf5Hl6BXJouWd97XxSuOxpgwnxJjcgGY
         inUDQQhXqV/AT1DAW9yKS5FQGQWcxkACF+Gws+Ij0hrpYzbRRqzs18F/gy+hYjS28vRN
         TLpjx6/xF7qv7xXy3doGvsklw6S2d+WSskLOKlZHQ1uMg/FE1yVujMXTEN5chh5DwUP/
         jTBpiBpuUjabGutHHqZFyO5a3WcfdxiXfCT99rwU+rO6X6EF6sWKgIArY7r3RBGzmUH+
         6cvAKJtyxr4arIDR7dhbA6vdCPuCeriSjtP42oQqp/2VdOUxzFzVPqdOuikAHuLSBWEE
         M53g==
X-Gm-Message-State: AAQBX9dQBQWBZlM4dNAxU8uJqnZs8kEkRdtyTQU9FfjDcqAwjKWy3twQ
	Q6VSEAWYM/08rmSa+E+PHxQ=
X-Google-Smtp-Source: AKy350Yx9d0su5dgNq1fXie+FM2THoKzDb9lZNmvrjool5qMebXAgSseo4f31iSy9RiikftaOrgnYw==
X-Received: by 2002:a5d:5188:0:b0:2d6:a357:f138 with SMTP id k8-20020a5d5188000000b002d6a357f138mr3257363wrv.18.1680683800918;
        Wed, 05 Apr 2023 01:36:40 -0700 (PDT)
Message-ID: <37fa3d37-5ee7-863c-48cd-1ce313c8e296@gmail.com>
Date: Wed, 5 Apr 2023 11:36:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V2 1/2] docs: Allow generic virtio device types to contain
 device-id
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Juergen Gross <jgross@suse.com>, stratos-dev@op-lists.linaro.org,
 xen-devel@lists.xen.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
 Erik Schilling <erik.schilling@linaro.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <c5d2ab978255ca84197c980cbfb9a504e7c625f8.1680653504.git.viresh.kumar@linaro.org>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <c5d2ab978255ca84197c980cbfb9a504e7c625f8.1680653504.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.04.23 03:12, Viresh Kumar wrote:


Hello Viresh

> For generic virtio devices, where we don't need to add compatible or
> other special DT properties, the type field is set to "virtio,device".
> 
> But this misses the case where the user sets the type with a valid
> virtio device id as well, like "virtio,device26" for file system device.


ok. For the record, a valid virtio device ids can be found at:

https://docs.oasis-open.org/virtio/virtio/v1.2/cs01/virtio-v1.2-cs01.html#x1-2160005

I don't know, maybe it is worth adding that link to commit description.


Also a NIT, is this example "like "virtio,device26" for file system 
device" precise?

According to
https://www.kernel.org/doc/Documentation/devicetree/bindings/virtio/virtio-device.yaml

the virtio device id should be in hex, so for file system device it
should be "virtio,device1a", or I really missed something?

With updating description if NIT is correct (I don't know, maybe this 
could be done on commit):
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>



> 
> Update documentation to support that as well.
> 
> Fixes: dd54ea500be8 ("docs: add documentation for generic virtio devices")
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V1->V2: New patch.
> 
>   docs/man/xl.cfg.5.pod.in | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 10f37990be57..ea20eac0ba32 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1608,8 +1608,9 @@ example, "type=virtio,device22" for the I2C device, whose device-tree binding is
>   
>   L<https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml>
>   
> -For generic virtio devices, where we don't need to set special or compatible
> -properties in the Device Tree, the type field must be set to "virtio,device".
> +For other generic virtio devices, where we don't need to set special or
> +compatible properties in the Device Tree, the type field must be set to
> +"virtio,device" or "virtio,device<N>", where "N" is the virtio device id.



>   
>   =item B<transport=STRING>
>   

