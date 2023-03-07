Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E63E6AE6A6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507608.781341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaES-0007wh-Fh; Tue, 07 Mar 2023 16:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507608.781341; Tue, 07 Mar 2023 16:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaES-0007uI-Cx; Tue, 07 Mar 2023 16:32:08 +0000
Received: by outflank-mailman (input) for mailman id 507608;
 Tue, 07 Mar 2023 16:32:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZaER-0007oM-0w
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:32:07 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 994ed4e5-bd05-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 17:32:06 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id k37so8222147wms.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 08:32:06 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c08a400b003eb39e60ec9sm12904679wmp.36.2023.03.07.08.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:32:05 -0800 (PST)
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
X-Inumbo-ID: 994ed4e5-bd05-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678206726;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wo2nyWezgMrUSlQ0ywENZ53M6vCjCPPkUb3T+chO/ow=;
        b=AshgV2GkS3+RJ66KSYKxKsVqzQEIJwVxbG6KKWmadPR8f/xY9MC0l6y1LEJJgG6c2O
         Mm+2WyRKFOB4C70Orht0cDGvuWfgQK4+AJTZamTFkI9TmkfLe9bASReZfLK5rrwAb8iY
         zq4M01CvOlBH9yj/KIX9UZ3JPJDNWpY5WFJUJypWob4T4I38Uk1xlUdXUQ95sYCUBOeX
         DDmQHExGpDdQ37phxvZ5CCxc7Mo7zFOoNbZSziyX8ngYtOcMmdFIAPJymAiOJL7E/M06
         vARZntRkURBnlIc+ZNfMLgZAxHuXz8AB4a30DcX0SzzNph1MBsgV7B1E6tFKCGI+Jefc
         gG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206726;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wo2nyWezgMrUSlQ0ywENZ53M6vCjCPPkUb3T+chO/ow=;
        b=5SfDcDSU0VTODSQs3LSamEDx4rr1Oo/lH7TtjYUO7Q/bBWUDb078BsJ7TgrdnU0Qq6
         bZAwmrvjmW2pr/SuOqZuXOLe18pGUsZQAmQpGQUO4chbHfAiEqwBgNNRNseE9HWxL1Id
         AYKbsgoCyFVq2HUBP4ErgCfbDDeigVsJaaOTad6M58olCbwIGADmCFPI5EQ7WR/l7Jlz
         iZyFUwC2mc7kiFgLCo2f0/XwISCCTo/uZOkqrAZgoAJxmdN5FPxvfdakq/AJdjhZNDx8
         +YCX7ZpYOraKhPBTfxVcQPOsHzkYC2BH9qMKAmzqGdZbD9MX9Z+3gxXT9dkwOd5Z2Xy+
         Q9pg==
X-Gm-Message-State: AO0yUKVC5Bvy6B4dpyRgU81dzO6V2WiJT5smnCu7XkiecquvlIvrLRMR
	PN1n5wHS31/qrB2R90JxSc8=
X-Google-Smtp-Source: AK7set/xpPfPLlbGNMfKXMxS/ilt+eY5w31j/giuEfniudx9Hi9/ZBYwx7Pn8FmkseeM0nBv1XRf6g==
X-Received: by 2002:a05:600c:35c6:b0:3eb:42ab:7b5 with SMTP id r6-20020a05600c35c600b003eb42ab07b5mr13836003wmq.1.1678206726019;
        Tue, 07 Mar 2023 08:32:06 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <a40bc7ac-59f8-0b16-fdcb-c7d17234fa55@xen.org>
Date: Tue, 7 Mar 2023 16:32:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 26/25] MAINTAINERS: Add entry for Xen on KVM
 emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <945564aa2d51aa6cd6f9b179981ca3ded5c94190.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <945564aa2d51aa6cd6f9b179981ca3ded5c94190.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2023 16:21, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   MAINTAINERS | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


