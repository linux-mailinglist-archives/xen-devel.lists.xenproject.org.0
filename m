Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A86C6974
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 14:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513872.795544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKxc-0002ph-9H; Thu, 23 Mar 2023 13:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513872.795544; Thu, 23 Mar 2023 13:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKxc-0002n0-5p; Thu, 23 Mar 2023 13:26:32 +0000
Received: by outflank-mailman (input) for mailman id 513872;
 Thu, 23 Mar 2023 13:26:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJcj=7P=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pfKxb-0002mt-Es
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 13:26:31 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51a501c5-c97e-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 14:26:29 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id j24so11587068wrd.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Mar 2023 06:26:29 -0700 (PDT)
Received: from [10.95.168.169] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 e8-20020adffd08000000b002c592535839sm16164499wrr.17.2023.03.23.06.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 06:26:28 -0700 (PDT)
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
X-Inumbo-ID: 51a501c5-c97e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679577988;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rKET1aT3FbBnUdm/K9FEcjVZRNjwaUpj/1PJCNfW5XA=;
        b=Ji+IUlqR5wLNisxWvoXPX2JYZxwCrZqPfRcPspeqv1zrQle+46O+N0v/sQXLjTCY5U
         9fUpVfP4ebgHMGIf3yQwwwiXrpxbzNtKtd1sU9obxAYRuv9eHj0yXoHhiDldD79hDgr7
         3wTVErC33TWmR15dgrBvdGozeKEOKnkO22S3E6CcFWOtojsvorU6iQvT2EeDJ4qpLnhU
         6sjYCbZwq+DFsRV+ILsu2XayNJTTpqamy1UK5GQlVN6Q3Ah/yrWO4730XCVGbss0LC/J
         HmrZD0/vZHXbSGf92KmNysJr3qvM91AFE0HIRYFOUy50fBpfdxnmhY/RDgQbR+DHxT2C
         pxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679577988;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKET1aT3FbBnUdm/K9FEcjVZRNjwaUpj/1PJCNfW5XA=;
        b=H3kacj9qs6TZY15H/L4sZv6uCowz+vWnSkfBbRabl/ynDPOMPGmhDV3BcuG36nb8qO
         oq6mV4GHJX0+7RKTZOSZ3ehWqyA/mjXZR/U+yCw/2lEICpIs2lePPWeW7ze6mQaT7eoH
         g5boAVNdY8LrT5LpRIerxTvyWDY0TVDiGcXx+xi/WngWLZSoVC+RzbYSQdaaNkxWEIq+
         nFnjllWURe+JxewqNOBnq/Aptnv47rmQ4YVZvQf5suNSKSFPBtRN7KiIXkmqhNhGl9WB
         /Zf2shkkXPdTpayr7Sbn+tVMAajNI1QddlYsaOB+oG10RyN/CPQi8TddIADxXuw7tRQv
         opxw==
X-Gm-Message-State: AAQBX9fY8xhWMwQFCvtGg2t/VE6rNjHQIwIEbpgsH78WUo3Ydz85WpAl
	03sjkJqNyrvk7sTYB6TMmzQ=
X-Google-Smtp-Source: AKy350aee0JqiP1q0uzCYme5AlSYOtzrw8JV1YEAx8bdGDp75DOMnA8S1e5wMHCE35DI2Xy985uEgQ==
X-Received: by 2002:adf:fece:0:b0:2d1:481d:5863 with SMTP id q14-20020adffece000000b002d1481d5863mr2921691wrs.11.1679577988524;
        Thu, 23 Mar 2023 06:26:28 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f2f3ddbc-c39f-a0b9-3174-a95d5e391bdd@xen.org>
Date: Thu, 23 Mar 2023 13:26:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] hw/xenpv: Initialize Xen backend operations
To: David Woodhouse <dwmw2@infradead.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 xen-devel@lists.xenproject.org, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
 <20230307171750.2293175-10-dwmw2@infradead.org>
 <209fe980-7f9d-4d79-90fb-12e38f12b2bc@perard>
 <5dfb65342d4502c1ce2f890c97cff20bf25b3860.camel@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <5dfb65342d4502c1ce2f890c97cff20bf25b3860.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/03/2023 10:57, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> As the Xen backend operations were abstracted out into a function table to
> allow for internally emulated Xen support, we missed the xen_init_pv()
> code path which also needs to install the operations for the true Xen
> libraries. Add the missing call to setup_xen_backend_ops().
> 
> Fixes: b6cacfea0b38 ("hw/xen: Add evtchn operations to allow redirection to internal emulation")
> Reported-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xenpv/xen_machine_pv.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Paul Durrant <paul@xen.org>

> 
> diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
> index 2e759d0619..17cda5ec13 100644
> --- a/hw/xenpv/xen_machine_pv.c
> +++ b/hw/xenpv/xen_machine_pv.c
> @@ -35,6 +35,8 @@ static void xen_init_pv(MachineState *machine)
>       DriveInfo *dinfo;
>       int i;
>   
> +    setup_xen_backend_ops();
> +
>       /* Initialize backend core & drivers */
>       xen_be_init();
>   


