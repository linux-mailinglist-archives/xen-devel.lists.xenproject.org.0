Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EFA2A86EF
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 20:20:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20131.45778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaknr-0001yl-1n; Thu, 05 Nov 2020 19:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20131.45778; Thu, 05 Nov 2020 19:20:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaknq-0001yM-Ug; Thu, 05 Nov 2020 19:20:10 +0000
Received: by outflank-mailman (input) for mailman id 20131;
 Thu, 05 Nov 2020 19:20:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=68sV=EL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kaknp-0001yH-I6
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 19:20:09 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1a86649f-01c4-4bc5-b26d-88252e96dbd4;
 Thu, 05 Nov 2020 19:20:08 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-vtJzjy-UOM6fM7ec1V9FfQ-1; Thu, 05 Nov 2020 14:20:05 -0500
Received: by mail-wm1-f71.google.com with SMTP id y26so693308wmj.7
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 11:20:04 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id z2sm3604747wmf.45.2020.11.05.11.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 11:20:02 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=68sV=EL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kaknp-0001yH-I6
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 19:20:09 +0000
X-Inumbo-ID: 1a86649f-01c4-4bc5-b26d-88252e96dbd4
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 1a86649f-01c4-4bc5-b26d-88252e96dbd4;
	Thu, 05 Nov 2020 19:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604604008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wPUgjqaNXtymxlf9iwoyhzdAiVmjShyhmkwdqKM2PxU=;
	b=WYiGTMwUKv7lznSPP19w30QsUOqvu6ja77X46oHZNEhmlmgPGOz9soedxRWQVJEdUFfkEr
	+HE5tPtLiLrWpSCsNGpK79br7sANGuclfcvRWvWuyRB7oKO6/XbNuqkaEGVv3iPvDk2v10
	vwg9VRp90jA2sTUKWtHvkozP7ZQHdY4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-vtJzjy-UOM6fM7ec1V9FfQ-1; Thu, 05 Nov 2020 14:20:05 -0500
X-MC-Unique: vtJzjy-UOM6fM7ec1V9FfQ-1
Received: by mail-wm1-f71.google.com with SMTP id y26so693308wmj.7
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 11:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wPUgjqaNXtymxlf9iwoyhzdAiVmjShyhmkwdqKM2PxU=;
        b=XCnGx5fT2f0MNmyZQ4sOADGzvNj1eWAaYVO2CZyomL5yhemXgqo7el4mtXJidcAiRO
         /P92DrlmYv9a7YnrdkLU6t0EDL6qdYym47ah1lZ4YnBLRyWBfr0r1tvYtTSw/S+Qy21z
         HQ8auCHpngDABKhZ+y8IR+8Y2psLvUOmeIKIBvd63YqEtE6Ra/mL3ZxgK62w4i/OPAa9
         SYU6GNdJgf+BXO60ICtKOI8md2lziKgTU7zq16BaWD2hPSEaEW6T6AZaIE4cyPGsguQ7
         TvMykNIFRjBrXchGM4p4wESJ5FpI1Y9q/6T37s3jon7ta325xaxRKxuJcK91bU5HQVFT
         mWZQ==
X-Gm-Message-State: AOAM531QwTdMT8oE2CiU1zcPG4uTFM5Zh1dR/FgfwiacXDav3BEgbyW8
	zWXL2yiy/xmSJBbWEl6XdnrcnHDM/5I7D7aynOZEWnjhFbDgc8bcBtc9SL5jJB1cFWLrCmEQsr7
	ffyu0+Lom9pPnFy2o9H+XNmEYVbo=
X-Received: by 2002:adf:fdc7:: with SMTP id i7mr5113120wrs.198.1604604003736;
        Thu, 05 Nov 2020 11:20:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6AqeaQNElqhuMF+A5YAtRgxx2ExbJf92kxIDaCjH5t2qx4qZclDeMeBM1iCvyk2Wtwmx0Pg==
X-Received: by 2002:adf:fdc7:: with SMTP id i7mr5113102wrs.198.1604604003606;
        Thu, 05 Nov 2020 11:20:03 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id z2sm3604747wmf.45.2020.11.05.11.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 11:20:02 -0800 (PST)
Subject: Re: [RFC PATCH 12/15] stubs/xen-hw-stub: drop
 xenstore_store_pv_console_info stub
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 masami.hiramatsu@linaro.org, Paul Durrant <paul@xen.org>,
 andre.przywara@arm.com, stefano.stabellini@linaro.org,
 takahiro.akashi@linaro.org,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, stefano.stabellini@xilinx.com,
 stratos-dev@op-lists.linaro.org
References: <20201105175153.30489-1-alex.bennee@linaro.org>
 <20201105175153.30489-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <11afa6f8-ec49-ab2b-2011-ef22665cd0c3@redhat.com>
Date: Thu, 5 Nov 2020 20:20:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201105175153.30489-13-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/5/20 6:51 PM, Alex Bennée wrote:
> We should never build something that calls this without having it.

"because ..."?

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  stubs/xen-hw-stub.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
> index 2ea8190921..15f3921a76 100644
> --- a/stubs/xen-hw-stub.c
> +++ b/stubs/xen-hw-stub.c
> @@ -10,10 +10,6 @@
>  #include "hw/xen/xen.h"
>  #include "hw/xen/xen-x86.h"
>  
> -void xenstore_store_pv_console_info(int i, Chardev *chr)
> -{
> -}
> -
>  int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
>  {
>      return -1;
> 


