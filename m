Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547E79C6DD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 08:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599937.935556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfwo9-0003IY-RD; Tue, 12 Sep 2023 06:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599937.935556; Tue, 12 Sep 2023 06:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfwo9-0003Gq-OU; Tue, 12 Sep 2023 06:23:33 +0000
Received: by outflank-mailman (input) for mailman id 599937;
 Tue, 12 Sep 2023 06:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lhkB=E4=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qfwo7-0003Gg-Hp
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 06:23:31 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3b47fe3-5134-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 08:23:29 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-401d6f6b2e0so39381815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 23:23:29 -0700 (PDT)
Received: from [10.5.2.12] ([15.248.2.224]) by smtp.gmail.com with ESMTPSA id
 bs11-20020a056000070b00b0031fbbe347ebsm602603wrb.22.2023.09.11.23.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 23:23:28 -0700 (PDT)
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
X-Inumbo-ID: e3b47fe3-5134-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694499809; x=1695104609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrBLkgo2WY6KpVXj/Wo7T0oMCvgXinsixbl861VxIIk=;
        b=qOBJsLpSTovVdl2VMbKf0knNGZuZFGTzn/8HbtXDhFBT9voi+FvCDSWVMbTJXSgoXE
         U2XTdEzfrt8MMNGOgjWwzN7sWpKpf5b/5mTL3dxdgoln5DW0rh7Kb5+ev91rdq5D4H1T
         095MaTw/dkvV2VtSGzgtPr5DxFeykGVYHbDmdJ0WKySRmUrKmKVycY11egJDST9vP3lP
         Arb+lqWlPCbUoWeP7jFINDk1n2pUFnI+zfPG175o/u2KmKzXbwfgtBA1t4yhEx5VeppN
         r9nNXj4W3AKXNeqy2HKU2mqCnspbKmhMVoE/31XyH5DDavXwPw73FnfFrV4lat4mfUwH
         QJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694499809; x=1695104609;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrBLkgo2WY6KpVXj/Wo7T0oMCvgXinsixbl861VxIIk=;
        b=hPygH7FW5YCwGtv2aZpYBtFNx6F1piiJIRhRLSu9NfNrtgmwM+zQwGBfiR4HWb4bJI
         GAgwofFK3GPVpuov08m/WQKzswwQ3PeJ0kaggO794yjcsKO5ENOn0lOPMEsk6vyR9vED
         y1jVzG8q7m/V4D5JI6e+clpip/o79YQkBgCBOWaFIOYKRXEzHu/uq+b+oH7Aexybkq5R
         cbpX0cCh6UIKeXFVaH2pc3OitOpgpQQ1Iy7yQk06aDswlBK5moXWZYKCnN0mdAExNWcI
         wNParB6BRJSBtr50k4Tr9kdmnZZN6SGNZEXlHhakklY2oHksJ+RKX75ssHBoGt0uB5nu
         5NcA==
X-Gm-Message-State: AOJu0Yz3ZK3M0peLq9jOpckLE2Tx0fpBCWctKcAKe76oV0x1qez+MTss
	m6Egm9XR3wP5ysdvmVUwAM0=
X-Google-Smtp-Source: AGHT+IFsxggATDO3/WXN4NlkqQ+XGwbCfK3FYInd9FMii5Gwa2SHQvLjRYF77W4QFvgD++0bB0mi1g==
X-Received: by 2002:a05:600c:205a:b0:3fe:1fd9:bedf with SMTP id p26-20020a05600c205a00b003fe1fd9bedfmr1074271wmg.11.1694499808912;
        Mon, 11 Sep 2023 23:23:28 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e260dddb-8479-e011-d679-a985979cb3a6@xen.org>
Date: Tue, 12 Sep 2023 08:23:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Reply-To: paul@xen.org
Subject: Re: [XEN PATCH 10/13] x86/viridian: address violations of MISRA
 C:2012 Rule 7.3
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <63f0d6385f302517244604af5536ffebd74ba589.1691053438.git.simone.ballarin@bugseng.com>
Organization: Xen Project
In-Reply-To: <63f0d6385f302517244604af5536ffebd74ba589.1691053438.git.simone.ballarin@bugseng.com>
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
>   xen/arch/x86/hvm/viridian/synic.c |  2 +-
>   xen/arch/x86/hvm/viridian/time.c  | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


