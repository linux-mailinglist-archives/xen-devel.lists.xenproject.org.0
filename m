Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5370A4C24D0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 08:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277932.474795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN8z8-0004ZQ-GU; Thu, 24 Feb 2022 07:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277932.474795; Thu, 24 Feb 2022 07:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN8z8-0004XL-Db; Thu, 24 Feb 2022 07:56:22 +0000
Received: by outflank-mailman (input) for mailman id 277932;
 Thu, 24 Feb 2022 07:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bEeT=TH=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nN8z7-0004XA-D9
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 07:56:21 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40b8cbe6-9547-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 08:56:20 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id n14so1252945wrq.7
 for <xen-devel@lists.xenproject.org>; Wed, 23 Feb 2022 23:56:20 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:b013:cd66:72b0:92c8?
 ([2a00:23c5:5785:9a01:b013:cd66:72b0:92c8])
 by smtp.gmail.com with ESMTPSA id x14sm2352487wru.0.2022.02.23.23.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 23:56:19 -0800 (PST)
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
X-Inumbo-ID: 40b8cbe6-9547-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=75MxyoNLX+jup+3IZc6uzyBIvH5fg0GcSMBv0gLbqp0=;
        b=H/k93g5NLzzNzoxwKfe8LDJebraiMpZshak6/6jcSf6DsqkHkkV04+FC8w+9g4X5O4
         i67rWmn6FZzAaPLQOfopBkul41ZHkuq00QhdDDMqGX8M3JlCV3a8Y1rd7cCQ36tnAWDm
         2PCOHNQgY19f9sETQeDKCUzMKN8iGa9AmkvQbdtzTRhT1y3hqXhY6Ov+grh4i6snLmy9
         YZ4Zp4zMStYeQQvxHizbceIgiugE+u93IalzdR1zeea2lDN+nvICdisUCtxCH2HFrFXg
         SMijirS44Gbqxa7cfV1p1qlGwE4HtKgVkBegRQXpPSjp1enh1CnANa4XgIpVHZjHSPDg
         itqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=75MxyoNLX+jup+3IZc6uzyBIvH5fg0GcSMBv0gLbqp0=;
        b=FtZ/bhluh/pH56OjBS4Tu+ugSTFMKWc07qIyo4M3oc2l11eEc69xSM2MO2S2umA6hW
         k7einVD15PyqA+tCZngqDnMKiImcGg0pL9yL//ZOJFATwxcDTOgR11O+dYDHPWu1WloS
         8Y9zAL4tUonBsrfEp/GGCTW4bD14SDtIMCYkabJfaA2+Od8KATwvwDljedLGcNzjmjKg
         VL9+f/1pceYUgeksdJJe1WVQUaPi98eqActlguewA+O8x0sNMLDHXw0JrgrLQFwPr3oQ
         JC8jBqUHJdT+U42eEOAaGNUEs796SK2JGoWhgocaDPyzKsucqbmtECr263BNa/xZrU9v
         9DXg==
X-Gm-Message-State: AOAM530JZ1LRcWgCYbu6JHr8aJr8gczN0JnlRnBbpqk0xTw07aWO9VhC
	CFpZC6vmTj0ROIgnjjGiVyn1kBrE6/e2Lg==
X-Google-Smtp-Source: ABdhPJyx+djfyMcrNLUFaHnhzbfJAxxXHv1T/rgX4SDnFbAEIFbr1U7OG74bMhel4A/hupIb0z20qw==
X-Received: by 2002:a05:6000:18ad:b0:1e8:cbe1:afd with SMTP id b13-20020a05600018ad00b001e8cbe10afdmr1188474wri.352.1645689380036;
        Wed, 23 Feb 2022 23:56:20 -0800 (PST)
Message-ID: <d9969551-77ca-fda7-b30a-da5d9e1dfcd6@gmail.com>
Date: Thu, 24 Feb 2022 07:56:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 2/2] Revert "xen-netback: Check for hotplug-status
 existence before watching"
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Michael Brown <mcb30@ipxe.org>,
 Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 "moderated list:XEN NETWORK BACKEND DRIVER"
 <xen-devel@lists.xenproject.org>,
 "open list:XEN NETWORK BACKEND DRIVER" <netdev@vger.kernel.org>
References: <20220222001817.2264967-1-marmarek@invisiblethingslab.com>
 <20220222001817.2264967-2-marmarek@invisiblethingslab.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220222001817.2264967-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/02/2022 00:18, Marek Marczykowski-Górecki wrote:
> This reverts commit 2afeec08ab5c86ae21952151f726bfe184f6b23d.
> 
> The reasoning in the commit was wrong - the code expected to setup the
> watch even if 'hotplug-status' didn't exist. In fact, it relied on the
> watch being fired the first time - to check if maybe 'hotplug-status' is
> already set to 'connected'. Not registering a watch for non-existing
> path (which is the case if hotplug script hasn't been executed yet),
> made the backend not waiting for the hotplug script to execute. This in
> turns, made the netfront think the interface is fully operational, while
> in fact it was not (the vif interface on xen-netback side might not be
> configured yet).
> 
> This was a workaround for 'hotplug-status' erroneously being removed.
> But since that is reverted now, the workaround is not necessary either.
> 
> More discussion at
> https://lore.kernel.org/xen-devel/afedd7cb-a291-e773-8b0d-4db9b291fa98@ipxe.org/T/#u
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Paul Durrant <paul@xen.org>

