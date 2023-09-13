Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A3C79E03E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 08:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600980.936857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgJl1-0001cB-3m; Wed, 13 Sep 2023 06:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600980.936857; Wed, 13 Sep 2023 06:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgJl1-0001aS-18; Wed, 13 Sep 2023 06:53:51 +0000
Received: by outflank-mailman (input) for mailman id 600980;
 Wed, 13 Sep 2023 06:53:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hMa=E5=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qgJkz-0001aM-GZ
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 06:53:49 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a431597-5202-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 08:53:48 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9ad8d0be93aso133050266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Sep 2023 23:53:48 -0700 (PDT)
Received: from [192.168.4.254] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170906b30d00b0099cc36c4681sm7888784ejz.157.2023.09.12.23.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 23:53:47 -0700 (PDT)
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
X-Inumbo-ID: 4a431597-5202-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694588028; x=1695192828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BzbVHFGOVCgL7KE/e/0dFUDjnBt1RrZg5wAJI/dSlzc=;
        b=rQ1WJVDbebd8HO5IpDpY7URg4pAHA0TTD7w+uqZEba5UtVo8kiDqhBHLLVQt3RxdYS
         oPPMwTRMclXuG7HHdeuABQ0I5LKw7yhfPxpUQVlT3nJDcNpcfjA0RmR2xIg9+KoX7sbx
         IK2c0R7HPMBQN7Ctb3AU9Ukbb91iyd8liv2Tzzw5QqOWrK/DM+aWB67QnYhadFTACi5/
         PTlNMzm2ttnKyt3S59JglClZO5KWImxkaHDcolBq+iJXnTkj4Nl1BRdJgjLooan/5c+t
         9p53RkWgjXKbK/fR3bpEoOiUyZly2rUbe/E1yUzq5zXBmHqVmvKD55IXzi5VsKMPWrNt
         Q31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694588028; x=1695192828;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzbVHFGOVCgL7KE/e/0dFUDjnBt1RrZg5wAJI/dSlzc=;
        b=J6mFVhTVc1fkPV87OLnBD/Hx6nfP/klVuCqPRAxws5OKDi8KDUamzSTWMWnwarjQrl
         5MZG8JxiZsb27eyVOq9OXoxHKTUccwuh15hwvHju6UPNeCL0+gs9+433tZ3rOuz0J97T
         s0yDxk0cOzlgrvwOhotc6lqKOxHe3pXR9TmcOskUgQ2j35KR60vSelLmCXV8R96yuu0b
         LbdxZKzO2W2oXjjEw1bOBsriSlwf+8Ej01Gnxehx2Z/EFjUiUuNENCNK/HOYjLew74W1
         xQjSa1KlHLIoozeMsl7PSkJ7f2MWRTQmebQzLVFEwnwsL6xuJ6ZV0wv0bZi1DyYkmSiX
         nudg==
X-Gm-Message-State: AOJu0YzLyODUQD8WuhluCJUapqIQDV5JK5AIRrC3u046kzZY5yTeRBOA
	SxnFMK+NQ/YvQf8Inkn4xxtUCyKv+46g5jn8
X-Google-Smtp-Source: AGHT+IHb8WOQojNVt2I87dLU+c2aGqwX2Ek5eQxdvutw/T9/8qdHjhUliydIH+tleMidTILMI8Tc+g==
X-Received: by 2002:a17:907:3e9e:b0:9a5:7d34:e68a with SMTP id hs30-20020a1709073e9e00b009a57d34e68amr6507289ejc.28.1694588027842;
        Tue, 12 Sep 2023 23:53:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <66fad344-5781-1a33-9399-a6fc97bbfb29@xen.org>
Date: Wed, 13 Sep 2023 08:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Reply-To: paul@xen.org
Subject: Re: [XEN PATCH 08/13] xen/hvm: address violations of MISRA C:2012
 Rule 7.3
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <d1be6a0bad7e5cd6277a7b258a1fa70e58a68140.1691053438.git.simone.ballarin@bugseng.com>
Organization: Xen Project
In-Reply-To: <d1be6a0bad7e5cd6277a7b258a1fa70e58a68140.1691053438.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2023 11:22, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
> states:
> "The lowercase character 'l' shall not be used in a literal suffix".
> 
> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> 
> The changes in this patch are mechanical.
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>   xen/arch/x86/hvm/emulate.c | 2 +-
>   xen/arch/x86/hvm/io.c      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Paul Durrant <paul@xen.org>


