Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C98F80344A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 14:18:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646925.1009594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA8pm-0007rp-96; Mon, 04 Dec 2023 13:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646925.1009594; Mon, 04 Dec 2023 13:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA8pm-0007pB-6a; Mon, 04 Dec 2023 13:18:02 +0000
Received: by outflank-mailman (input) for mailman id 646925;
 Mon, 04 Dec 2023 13:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA8pk-0007p5-NR
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 13:18:00 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bb60d15-92a7-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 14:17:59 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so45846985e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 05:17:59 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 fb13-20020a05600c520d00b0040b3e7569fcsm18522993wmb.11.2023.12.04.05.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 05:17:58 -0800 (PST)
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
X-Inumbo-ID: 8bb60d15-92a7-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701695879; x=1702300679; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=33Rutust3RPtLW6QbveDXqKoII39w2irxSt0w099HAg=;
        b=vH1wNvf8FVK//3t1JJtumnu+hll2Ye+HGncxhzAngoAKNsl3GRB0C0PfIGq1wBXLsC
         7EM+Njd3vnYZVy1p7W6Z5jyEHkMqhqgXNa0WGYm6MkrPZB1ULFIpopXJ0HquDx95M+3f
         bjPQB0Dov9LPenyZLNBrzfWgacVAMiJZpLCr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695879; x=1702300679;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33Rutust3RPtLW6QbveDXqKoII39w2irxSt0w099HAg=;
        b=YJJgaMG3SGwIl/gJGaNhPqDdyP8r0cFtTMajdFm1FZc+NyLhazDDszcpJy2bpcsYdt
         Obhp4eJHL+DHLL2a9kZYa/IHPTd9eRtQvYsJbbJ5WjzJwcXJl/MvS/PXlOutrdt49WOd
         JWDIe9apV1wswmTZPDIwj4LBakNjpQycFkwX55VPa+I27RV6j51Y0iQAKoc2ts40nnaf
         +tHwAp13Sf0J1wjJxHwNRtPLEPZQA9WSjFeAxwf8mkg8tuSuSk0D6eu//OkrroUfGX0H
         kd4q7C5biW2KT+esLYSUs1pfdiGjgLKTCzxsni9TwKAkAy1Fl4qgxRWdDLm4GZI5+HOq
         1xFg==
X-Gm-Message-State: AOJu0YzWi2YN4iEbaLkX5dW/DvyghU0aGzIbHxLl7oHPpo9ubYXW/7AA
	8Yp9fpJU5NMKWvc9cGX7lzpzug==
X-Google-Smtp-Source: AGHT+IF4BybFkBkpeYuBYL/57F4U8qGRqM0vMd8ifiIciKjA0LQQfQpKQY3u3kE8arABqJe0KUt2mg==
X-Received: by 2002:a05:600c:1d19:b0:40b:5e21:bdb0 with SMTP id l25-20020a05600c1d1900b0040b5e21bdb0mr2178658wms.63.1701695879214;
        Mon, 04 Dec 2023 05:17:59 -0800 (PST)
Date: Mon, 4 Dec 2023 14:17:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] bump default SeaBIOS version to 1.16.3
Message-ID: <ZW3RhTc9RHFCLkSN@macbook>
References: <03a33b69-b028-4f30-bd26-4e347c2c5c87@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03a33b69-b028-4f30-bd26-4e347c2c5c87@suse.com>

On Mon, Dec 04, 2023 at 12:12:58PM +0100, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

