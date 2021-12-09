Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1A246E8C3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 14:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243010.420267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJ7c-0000dr-Dj; Thu, 09 Dec 2021 13:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243010.420267; Thu, 09 Dec 2021 13:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJ7c-0000ax-AT; Thu, 09 Dec 2021 13:06:04 +0000
Received: by outflank-mailman (input) for mailman id 243010;
 Thu, 09 Dec 2021 13:06:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xsbi=Q2=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mvJ7a-0000aq-KN
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 13:06:02 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c235390d-58f0-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 14:06:01 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id t9so9586768wrx.7
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 05:06:01 -0800 (PST)
Received: from [192.168.1.186] (host31-48-92-117.range31-48.btcentralplus.com.
 [31.48.92.117])
 by smtp.gmail.com with ESMTPSA id k37sm5755667wms.21.2021.12.09.05.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 05:06:00 -0800 (PST)
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
X-Inumbo-ID: c235390d-58f0-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LC8hO528Kw/xQ5K88skCc+CMxlULIAtCChCBikBnpLo=;
        b=pK40YuriLpUlZDGKNg/C0wlMX4fRUBgtIPgCglEokB4hYvozRhF2tLMTISjjBpM15A
         sYLB2tAsrVNbrMfe/03hPtaZlO19oz2Tg1/nqvBuYEICb0m2P665W0m2VmxVBdanPL34
         6iYSx8gP5JbvkNSAPVvUHcrceRGYw2dw8228Nn1p4Ial1kjgChgvVAeCLC1CJJH9pTNi
         HXT1UTVPWBI7fj5+3rUzmP+XhTxjzyEoL9T0Xu1d+7XshxJjTw4bUcVpsfI4Q6LrSYcg
         KrXD3LFhSRDa3Y74TgLuXxDw4L4nnmSI0WWYzCtPzwO7zAcWQlE0sj6pSK+v2Tg5HZbY
         +MFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LC8hO528Kw/xQ5K88skCc+CMxlULIAtCChCBikBnpLo=;
        b=ztEU7FcitXOrZDDzpUODtXaMSh7h8HdiIwZ8tXtyBvJup9eyktcqeEIyKSPAQVcKbn
         +ZLNI9SYiLmayAKIVwgfquHTUGuF+NnHjDtIgM3UNp40glVXF+Q6EovBpO37GC7PKKZK
         nMdlWz7gKMboaG8BGOsexqbCySreMJ55j8jKskD7DKHXSfyt+PCiaJP5xqHeGdtPei+R
         6Nvez00txufTG7STfnBV/2WkX+xgF5M6A9I5mxRxZ+pMPYjGiRUw20r5/IJxoOUjMTZt
         z9v87RmTWfp4Bq09bUfb9c2SQ1wtvcXJA7lmF1Sm+82y7ZA5x7tGbwEwdbHqdFskhFkE
         v/ng==
X-Gm-Message-State: AOAM530Llxkh3nKzkbeOdbD5T7Wt60WxhgGilJTWIFySqT5Lkyt0Nz/5
	8N3LG+iRah0PXsHpu1GZOOY=
X-Google-Smtp-Source: ABdhPJz6hUnrgVOY+NEaMvUs0zGfXvVM+QkTdbNntvL7JE9muAcVg/ZkHfVhG0faCpVI7jpIoKqcYg==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr6346168wru.182.1639055161239;
        Thu, 09 Dec 2021 05:06:01 -0800 (PST)
Message-ID: <7e535b83-ebae-1a72-f43f-897d80ca9411@gmail.com>
Date: Thu, 9 Dec 2021 05:05:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Reply-To: paul@xen.org
Subject: Re: attaching device to PV guest broken by your rework of libxl's PCI
 handling?
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d82be159-c4a4-73a7-9fb5-2128b6925e3d@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <d82be159-c4a4-73a7-9fb5-2128b6925e3d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2021 04:17, Jan Beulich wrote:
> Paul,
> 
> in 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
> reflected in the config") you've moved down the invocation of
> libxl__create_pci_backend() from libxl__device_pci_add_xenstore().
> In the PV case, soon after the original invocation place there is
> 
>      if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
>          if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
>              return ERROR_FAIL;
>      }
> 
> Afaict the only way this wait could succeed is if the backend was
> created up front. The lack thereof does, I think, explain a report
> we've had:
> 
> vh015:~ # xl -vvv pci-attach sles-15-sp4-64-pv-def-net 63:11.4
> libxl: debug: libxl_pci.c:1561:libxl_device_pci_add: Domain 18:ao 0x55a517704170: create: how=(nil) callback=(nil) poller=0x55a517704210
> libxl: debug: libxl_qmp.c:1921:libxl__ev_qmp_dispose:  ev 0x55a5177047e8
> libxl: error: libxl_device.c:1393:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/18/0 does not exist
> libxl: error: libxl_pci.c:1779:device_pci_add_done: Domain 18:libxl__device_pci_add failed for PCI device 0:63:11.4 (rc -3)
> libxl: error: libxl_device.c:1420:device_addrm_aocomplete: unable to add device
> 

Wow. It must be a year since those patches went in... Most of the 
context has disappeared from my mind.

> Since I don't fully understand what that commit as a whole is
> doing, and since the specific change in the sequence of operations
> also isn't explained in the description (or at least not in a way
> for me to recognize the connection), I'm afraid I can't see how a
> possible solution to this could look like. The best guess I could
> come up with so far is that the code quoted above may also need
> moving down, but I can't tell at all whether doing this after the
> various other intermediate steps wouldn't be too late. Your input
> (or even better a patch) would be highly appreciated.

The commit comment explains the problem that it is trying to fix but I 
agree that it does not call out the new sequence. The issue IIRC was in 
what happened before the call to device_add_domain_config() and what 
happened afterwards. In fixing that I guess I missed this immediate use 
of xenstore.

I *think* the correct fix would be to move the wait into the end of 
libxl__create_pci_backend(), which is where the frontend and backend 
state nodes are now set.

   Paul


> 
> Thanks, Jan
> 


