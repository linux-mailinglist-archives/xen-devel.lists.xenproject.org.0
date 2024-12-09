Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8714A9E947B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 13:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851160.1265279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKd33-0003pM-CD; Mon, 09 Dec 2024 12:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851160.1265279; Mon, 09 Dec 2024 12:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKd33-0003mK-9P; Mon, 09 Dec 2024 12:39:37 +0000
Received: by outflank-mailman (input) for mailman id 851160;
 Mon, 09 Dec 2024 12:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yTwD=TC=exostellar.io=maksym@srs-se1.protection.inumbo.net>)
 id 1tKd31-0003mE-TZ
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 12:39:36 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a41e208a-b62a-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 13:39:33 +0100 (CET)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-7b6d24069b2so86025885a.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 04:39:33 -0800 (PST)
Received: from [192.168.1.76] ([188.91.253.160])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6696acc74sm329635666b.134.2024.12.09.04.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 04:39:32 -0800 (PST)
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
X-Inumbo-ID: a41e208a-b62a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exostellar.io; s=google; t=1733747973; x=1734352773; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRUTaSdtSTWDNx2ubmJEe+KjO9kK07Vwb4Eyr3Ojt1w=;
        b=nVkTQiGEMKEjlByXt9Xl0yNvzkyjSnU4bMuPNeZIba41GazicKNZ2EvLDQlGUnPZQC
         SMVhcb/MDgi9L1WDkzHckFtpRv+ZUESmb1VEzfuIOU3T3bU9vd/aQixUkSK6qevyxMOF
         EWaJ4QqT2zF5kDfPwElOavMJ+woO5bi4CWjSq0BBbCaFWgmwpbDRUE5+LTszDUEwoVuU
         OP/oVG2se1p7BzxtYoqCskGzwig7F5J6p3HS5yrMHlohm0B6MBLk5hywUyIeaStNkJGE
         871gRZ7HLuq62ZQDKF0pAbmkQR9mVULdwqEIjCn2F5PEZylvnoSrdHN+Yad822c18K04
         24nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747973; x=1734352773;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRUTaSdtSTWDNx2ubmJEe+KjO9kK07Vwb4Eyr3Ojt1w=;
        b=Yg3qGtf065Oj57QBf1fq/YWtzy/fuNxJGi03j9t9u+hUhG2XqVO5Rn/st2QvwxpIHD
         W5TbbDpqI2N8L7S8OCHwSfVLwM2y5rqRASNMKIAarZYke5keKBL/hAgfDKeEp35MHhrU
         9/dUojL+mGI+F7kYmp5cpx7So0gwzbn9bVLw+C5PA1GgnTPh0dIdv5hUwtKSxpXo8gcT
         pbXOKMA3poMICnJjj709ia87OzBldZMg2gSMku+odccRhhuJ03GiQ+BRNdcyF0mAjX3q
         fhdngAbMc6ifk/li6Lp/uSXMoQe5GtQJqp15J64G/NHgp8oDL1MXUgFCLXQakrIfHi/5
         f6eQ==
X-Gm-Message-State: AOJu0YwxobWZdmRwoN9KpcMwaDy4QI02TdKXABLeuErAD1Q2Lw2Q1DiH
	N130pjQnR/IVpukqRGWQbDMmrkbtJNHzWg/JkfoMrfCWJUP8iw7/w5pZxoph2YI=
X-Gm-Gg: ASbGnctiYPOnKzM9KE1evLPkTjhY9sSCiO2OdpVTYdRUOz0ywV2/tF1Koa3MQPg5pKq
	kTN+HZ/K5te71BGxk5+txreWNWqk5k1vM8z6Ui51aY4IFTxBo/khJ1m27WWxzpsW6fU1Vp4QCeA
	LUxd3CoLUy5tJeww/EYYvCicpe1E2BuYupQf/LIES8R36J1Xxk1GcVszBTIkCKBsh2lxBbc+sYg
	Cwk/cmbNMbRPlpwfKC6WuJOcJ6gg+QDM4zInbUqSUubEP16gSrJCI8=
X-Google-Smtp-Source: AGHT+IGUN0y5tavLjGg8nctS+87f9zbgPbgkotfQ+C/sUG31IJkgL5wL2zKycZaYTebhyfsU6ab9rw==
X-Received: by 2002:a05:620a:2b8d:b0:7b6:cedf:1b4b with SMTP id af79cd13be357-7b6dcdd0b6bmr28812585a.7.1733747972695;
        Mon, 09 Dec 2024 04:39:32 -0800 (PST)
Message-ID: <813d9908-48e4-46ce-87c9-7414170e6a6e@exostellar.io>
Date: Mon, 9 Dec 2024 13:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Grab mm lock before grabbing pt lock
To: Dave Hansen <dave.hansen@intel.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20241204103516.3309112-1-maksym@exostellar.io>
 <24b8d4a0-36c3-4404-98aa-7d8e2c67ac95@intel.com>
From: Maksym Planeta <maksym@exostellar.io>
Content-Language: en-US
In-Reply-To: <24b8d4a0-36c3-4404-98aa-7d8e2c67ac95@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/12/2024 19:52, Dave Hansen wrote:
> I have the _feeling_ it's just a big hack and this code throws caution
> tot the wind because of:
> 
>>   * Expected to be called in stop_machine() ("equivalent to taking
>>   * every spinlock in the system"), so the locking doesn't really
>>   * matter all that much.
> 
> So the patch here kinda doubles down on the hack and continues the theme
> because "locking doesn't really matter all that much."
> 
> If so, it's not super satisfying, but it is consistent with the existing
> code.
> 

I indeed could not find reasons why locking would be strictly necessary for correctness here. On the other hand a 
clearly benign warning should not be triggered, especially considering that panic_on_warn may be on on some systems.

