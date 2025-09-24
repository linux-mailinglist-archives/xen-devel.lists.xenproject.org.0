Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44217B9AC21
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 17:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129539.1469455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Rfz-0003UW-NY; Wed, 24 Sep 2025 15:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129539.1469455; Wed, 24 Sep 2025 15:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Rfz-0003T2-KF; Wed, 24 Sep 2025 15:45:03 +0000
Received: by outflank-mailman (input) for mailman id 1129539;
 Wed, 24 Sep 2025 15:45:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XUMG=4D=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v1Rfy-0003Sw-0M
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 15:45:02 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e1e7c46-995d-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 17:45:01 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45e03730f83so31301765e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 08:45:00 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e32b4db71sm627895e9.1.2025.09.24.08.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 08:44:59 -0700 (PDT)
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
X-Inumbo-ID: 6e1e7c46-995d-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1758728700; x=1759333500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x+IHe9qKQVrqrZmSJcCWnSM95WGYUKAaUtGK45Vyh9I=;
        b=JCDjJvpJrfSE7si8YjtP+jivMJO92JYhSjiVmDjEk2MO4NVkDFSRYIMR82b1MavJRs
         886tmUlXohdoYbmOQHsQpflphY7FbrbO3J7srPPzYJzpTTmsln5LffmH2FXG5qhI2KhE
         I5HB7jigz6XztIgDwH0uu2tPWNbPKkxVGOXQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758728700; x=1759333500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+IHe9qKQVrqrZmSJcCWnSM95WGYUKAaUtGK45Vyh9I=;
        b=MpYx13736VSZaZ7tIt+xpvThjF/egp67c6wR8JggzhQS0fwLe4VgTGDW62RbF0qmcC
         VmkXhDjRZXN0BkU0zpRth420KfeCe7r5ENKVlfSSeWycTuPjXJdyx9ach8h8hJf+i50C
         1Ds+vP76R/lrxlo3S1UwszBzrq/W9At8F5J2s6CYX7/SHDeYsI5TLkv/45XDFszxpGw2
         eTnfmyzwOrWJX8vKGldFbGUaPjF5xWR/qUjj+x0safyNMmnrwaVOmu7NZmt/4i6Sq0FX
         QFNmpsMLHEyccBbY3qw6sz2+YHXyjkgivcIQP1Tosv2NzVxCnkf2fYFftx1xytGhKLnk
         bpvw==
X-Forwarded-Encrypted: i=1; AJvYcCVR0ZobqehvdEtHmSjW1TuME9Ruic+J1cdxpLbddYsljYxvUmfD/RCTJGexAZrYvXeYVpTD/vnIjVY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA0oC8ECoUcuQbO4OGjal+RhsIY4fEOUP+lKwCtOp92RDXN3Ls
	HNTMcKgbLMwM3Y7SASjLyN8Bg7raw4T83NVzdS5UCYLVRruAgdnHwv2O8KbkP0RmgLs=
X-Gm-Gg: ASbGncuiQ6xOIxRuFqBaYAH+YhbTlN1kEmc3ilUCFdDgPh7ksCzFI4KtJK3qEj2HfMB
	0K/0KsNDOeyAytOqp1frefkRwL+xZ3juG6d2cXwNBvvhfnVdZabcyGpz541D+ovjLCsjbb8kcBK
	wG12z5vIIZard9W8srQO7NTD7rLtC79UwsZocJi0WBIwrLXeBg11PMzwz97DKe8WVbYHvObcOdw
	1eyBWWt/uGhT+zeMR0l/AwjIA2xMBRdEXd30F0s1sZWveqkWS69ij+I80SEldvpEH59gY9Mm5FJ
	bLt3Hp7CPhisS+ycMXG1QT/biEfqYHV9AABbgWEt69+NWE7sAH7Q/7dPSIXTXgxk4oxMcp1FiGH
	2To6M6QkB8ev15y/oOdtLKiygnHUcEB3z/oHbqs5sCL9ga7zJHlGf/kI7JRMMJ4pt7tkI
X-Google-Smtp-Source: AGHT+IE2Fxv2nPIF15hQ4Z5YMTqJ5ocrjxDevA9lxfUnk2qmvzgeqB+K/1s1jaY/GcRPraEbvCNO6A==
X-Received: by 2002:a05:600c:3b8f:b0:46e:23d3:6415 with SMTP id 5b1f17b1804b1-46e3299ee26mr3675385e9.6.1758728700121;
        Wed, 24 Sep 2025 08:45:00 -0700 (PDT)
Message-ID: <ee10a58f-80fa-40d4-8045-c413054baef8@citrix.com>
Date: Wed, 24 Sep 2025 16:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/xentop: Add documentation for physical CPU
 monitoring feature
To: Jahan Murudi <jahan.murudi.zg@renesas.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250904172525.2795998-1-jahan.murudi.zg@renesas.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250904172525.2795998-1-jahan.murudi.zg@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2025 10:25 am, Jahan Murudi wrote:
> Add man page documentation for the new '-p/--pcpus' flag that displays
> physical CPU utilization metrics. This provides hypervisor-level CPU
> usage insights alongside existing domain statistics.
>
> Changes include:
> - Add '-p' flag to SYNOPSIS section
> - Document '--pcpus' option with description
> - Maintain consistency with existing documentation style
>
> Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This needs a release ack now for Xen 4.21 (CC Oleksii), but it's a docs
patch for a new feature so ought to be considered.

~Andrew

