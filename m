Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF791EE55
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 07:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751947.1160062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOW8C-0005YT-OH; Tue, 02 Jul 2024 05:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751947.1160062; Tue, 02 Jul 2024 05:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOW8C-0005W9-LL; Tue, 02 Jul 2024 05:32:44 +0000
Received: by outflank-mailman (input) for mailman id 751947;
 Tue, 02 Jul 2024 05:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H732=OC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sOW8B-0005Vu-3S
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 05:32:43 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fc503f3-3834-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 07:32:40 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so1460880a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 22:32:40 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58614d503b1sm5172349a12.67.2024.07.01.22.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 22:32:39 -0700 (PDT)
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
X-Inumbo-ID: 7fc503f3-3834-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719898360; x=1720503160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RQmNimGTwbyU0lMcgMTmjU9W8YZSy3um1R4GV8sDAQ=;
        b=VPaZUyFg+Gf2HNOmxE/PnUrncRQiPxdYQnCJG+Aa/yij1fEW+ByxWNGsTZ34XuZygg
         h8OdXz3AqzZozd3M+o2t7gNfH2XwaVMUGn+A/Z2OI0MKPhTLqfodGFvnPhejc82YC0Ig
         VuIXgi4LxAk6T9kzkKK97cV2ne81dODdSPHc1KdP/940Tj0J5/VmZPccmOI96/TonUIa
         TyowrezKO1nM+aN57Ek27Gstklggt8B2PvIEdnmoDhsCEIppI0gDopfk2ma/nVkXhzIt
         2XISVCtyNYTgJQFfwpvefV6fo/LOCkDbA0I2JTX3DUR3WNqB+EVUH+16Vmlt32rZS/hV
         /jkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719898360; x=1720503160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RQmNimGTwbyU0lMcgMTmjU9W8YZSy3um1R4GV8sDAQ=;
        b=eYoByYjArYIBWo37BKY8EgDemAq5qYEAhlqBSAsH7SCtSENpUvTVrA6KZnb5tPh9iI
         /DXQc+YA8EzDJ/fpWrjHcx6FE6OYEphIQU2IItcynjR3NhbjmL03chgK1Ioih0hY1LS0
         CQOf9YVk45wc/ACpFNApH6INR0PgpwfnZOx531wBec2CT8mwjm4hrr5BCpk+9oncTJjU
         +6dLTqxtnD43k+jRRIeze+ndESBluphRze+f7UGCWBrhM2VWcq2L0AGEbz8bmqXu3bSd
         lD5I8ab3Dtqx9yWhdFRrbzkEW+ceR09FHTcfykCm8V50cb+hoyZ6mFkY29FCv5dLslw/
         2mig==
X-Gm-Message-State: AOJu0YwQ4hj6Ogne5VJuJEY1vmbsq3qCOMzc9vrlhgTnwHShedQaDV9O
	4pFT1mA33Pm2i+0Pec6GmlTrqsyIA2QAZ+G0vBwnvBSJ9wBCN1LGs3jmsvGic2E=
X-Google-Smtp-Source: AGHT+IG7s/PANsQ9QBr6GFjCz2u7TSS1xPzmScR7zZMqRAiIi0fE1lWFC3LJwuAC5VdzYjnW+FNGsA==
X-Received: by 2002:a05:6402:84f:b0:57c:f091:f607 with SMTP id 4fb4d7f45d1cf-587a0b0379emr5364857a12.29.1719898360020;
        Mon, 01 Jul 2024 22:32:40 -0700 (PDT)
Message-ID: <001b72ce-8ffe-49bd-9f63-f10eebe61745@suse.com>
Date: Tue, 2 Jul 2024 07:32:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>, boris.ostrovsky@oracle.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, jbeulich@suse.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20240702031010.1411875-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240702031010.1411875-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.24 05:10, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Fixes: 8310b77b48c5 ("Xen/gnttab: handle p2m update errors on a per-slot basis")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


