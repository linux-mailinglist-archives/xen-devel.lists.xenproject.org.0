Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7FB7F2B21
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 11:59:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637736.993743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5OTp-0000u4-6L; Tue, 21 Nov 2023 10:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637736.993743; Tue, 21 Nov 2023 10:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5OTp-0000rh-3i; Tue, 21 Nov 2023 10:59:45 +0000
Received: by outflank-mailman (input) for mailman id 637736;
 Tue, 21 Nov 2023 10:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVyF=HC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r5OTn-0000rR-Hp
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 10:59:43 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12d11931-885d-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 11:59:42 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso26655945e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 02:59:42 -0800 (PST)
Received: from [10.95.175.211] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c429500b0040a4cc876e0sm16479782wmc.40.2023.11.21.02.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 02:59:40 -0800 (PST)
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
X-Inumbo-ID: 12d11931-885d-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700564382; x=1701169182; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0aBbFlNNIGjyQCXLjrh92AJeZxwPUBKAFPiK1JRzuDE=;
        b=e8QTsEnT/O44sTeLLy3toH0D0lOsLtpkPpMQ1GnnthQalsnB1NvSyUC7JQuXAXWE8v
         +RsquxrD/FRIJ1pnXIbkWRJP9fQU2sNE83KpsbW7RafoBO6uK4vdMNjgNvN2H/371GOL
         WDnDKJ9VlJhMc1KHvjB2M2tIH0/Ibjha8Fq+kibr+rzmalV3yqkFhyRPqnqnj3fskBOH
         yAHJ9lO12535rd8cqUtZsdUxzThFACGBD8nXfLhfkBl/kdY9p0UKYOCu9QmmPiWg6eEM
         IpyYjW4gsU7WUQn1vffwDp6VgmHzAvxN02SaeEKYxD97xnKqT/HIPX7ZipfT3Cic5pDD
         bl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700564382; x=1701169182;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aBbFlNNIGjyQCXLjrh92AJeZxwPUBKAFPiK1JRzuDE=;
        b=Lv3TN3mgkFxWcWfQ8PuAlyeeXe5gw/55rh/rcOIdtcR5w+y3F9lskX6j252ZWKp3P6
         qBCEVPEJSGJTXdg9Or/ybZmeUqmVeDdYwM0AmixE9/3YVEad6GjIosc5ULzqIsM/ZF8u
         yFremHFf3STIVU6KGqYuNWY0KPdOktWZCU1M5a3X8SX66vFhu835rS5QJFNpiOYOnQTE
         bQg43YY60ux/pSujdMm5ULgC+QwQFRgMnGPq981cpj27O00vstMHnHs21c0IWkd7bzyg
         gNeHoBE80wegYN4ysDuh+kPhfg9hCUhfOqYaCSiM1jea5GIrlDcLVLyMBqGnGcHA55v7
         ahEA==
X-Gm-Message-State: AOJu0Yzlxi40cbbdnwEsIt6UM947FABoP2iaRcloKRpY5XcmDR5qguzh
	gCYmH1kKW8z+7yPN1nxgBP8=
X-Google-Smtp-Source: AGHT+IGlIetHxet5t4JoCfSOc3aRa0aU712VgafZ6O28U+VrbIAHSvlMGOBLHgze6oP5stvgX5rjlg==
X-Received: by 2002:a05:600c:1d23:b0:40a:4c7e:6f3e with SMTP id l35-20020a05600c1d2300b0040a4c7e6f3emr8048958wms.21.1700564381817;
        Tue, 21 Nov 2023 02:59:41 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <edeb4a60-0011-41ed-9998-25ab1a439b62@xen.org>
Date: Tue, 21 Nov 2023 10:59:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 2/3] vl: disable default serial when xen-console is
 enabled
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org
References: <20231115172723.1161679-1-dwmw2@infradead.org>
 <20231115172723.1161679-3-dwmw2@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20231115172723.1161679-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/2023 17:24, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> If a Xen console is configured on the command line, do not add a default
> serial port.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   system/vl.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


