Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714BAB93831
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 00:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128102.1468576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0pLC-000381-QB; Mon, 22 Sep 2025 22:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128102.1468576; Mon, 22 Sep 2025 22:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0pLC-00035j-N2; Mon, 22 Sep 2025 22:49:02 +0000
Received: by outflank-mailman (input) for mailman id 1128102;
 Mon, 22 Sep 2025 22:49:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v0pLA-00035d-UK
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 22:49:00 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 538d4158-9806-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 00:48:58 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3f2ae6fadb4so2929125f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 15:48:58 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269800530b7sm144312795ad.18.2025.09.22.15.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 15:48:57 -0700 (PDT)
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
X-Inumbo-ID: 538d4158-9806-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758581338; x=1759186138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PW1DxOozcSBOC2kGlK4owxTShNLt3wMc0LQR2Roa+jU=;
        b=H0TuYhmJYsagWFl40T9AeepPHUh9NjgF8JVnkNrmpl/WWzkz18JYSceCNBQK9JMJge
         1wupe0mPMGwwVVWiMkya3bDDJGnf0URbuJVHLJbAAwG8hCilsLC10ys23OKCOwS2o/cX
         k6co4Xd1q98g2qMYe29FPjVYJSmiJ1lzNb2zqPkGFvsxDVGmPOtaZtdVJZPDWhMMXKLV
         JAqbCkaywNq6brEFUKlO13X+jL9IKyESAah6e6xiA1OPyNsn8JVT3pOANmJd17AneXfE
         +F6zvzo6K/x89mKjxHUp63ndPX+FXp36eUrWpGB9iG5KU3P5txfKfF9nqoV22mu/Rg0M
         Yt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581338; x=1759186138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PW1DxOozcSBOC2kGlK4owxTShNLt3wMc0LQR2Roa+jU=;
        b=lkKDyHCBVBJjc0W1hwZOl3D3L00mze6b46TZ7307rsFAmpm/AJ9SDyHXP8mtDJ0kYZ
         Vz2ybcwTCJeImF9PR0zDdLV36OLELThQqLzVlr4+MuVKFrzwa3OysPC6y6FKMHnnWc2X
         ZCtLsUcxx522ZTv8c8N7dQzTn3gAE3vB53qGTrFEGW7Jygtty2a1RIrE4DyEc0Wbg1AF
         WO1byNbzVtIkkEPKlfNSZ6oeJ5VSv9WZRR/w3R7vIry52rR5jcRhLyDZdzYJORDmZ1su
         AZZSrCk4u5tOQZfpgZwYaplxYwsQaWPeUWYK6Kjn/BV0ZMQuvfTAx9cxMQ/19K5CLv5J
         QlcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeyWLM7yj70NORklT6/utBjgozLUEZnU95Dmt26HhmE5YWP3b3/wA/h1Bo20pSkihSfybBJfwQPrw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyp1DygWC6vMuYyfS9lvPSZrrsBDPDeZ3a6TKp7XDds58DcsUJk
	bY5HzgNN7CvWwp3NgFAa4L6ZuemAYhFwOHdZ7W3ZCFoOz9qtY2a5PjLgvgKP8t81EQ==
X-Gm-Gg: ASbGncuWoKcPie9PXqe+ikzSSpN/+WM5e2sB7ZCCU6CrcBcYqrvY8cWm5ubF4GYdUok
	yx+003uC1nQXG+KcF0N6wPGe2YekcWGiWArGkHzYRY7fzBOE0dfkseTWN0Am9jfSN6qd7HNcDBM
	u6Wuson1DHN+rmh0slF8pG/gh/rHueClgZJkgCFgKjdGXAcPFzc+F7cy6RyoYfqbE11gLZls4nk
	9uBSRmH8RK6C1eW2s4XHWQNhk/U6WpQ/UsNy8i4ZMBBn8Vtx2C3WR19/R8vAP94uXRLxVrRWVrZ
	Op7oNWO/0jPglk+SPXZgnCsEx0qQlJYRCDr8aUA1NAtg95Nth5CUhE3gyYKo9hLtj+EMIXmXHYO
	LLCN/JseBMiD+xI3ceVvbFjmYYix4VzzYsnO0H9VZtlI=
X-Google-Smtp-Source: AGHT+IHxLwq8YJ+Le7Qe9XKReLYZdjF5aLLqotGFK4bL8gH1oUqwVAOQBMUnkujQ8eW0af7AUW24zQ==
X-Received: by 2002:a05:6000:2003:b0:3e4:d981:e312 with SMTP id ffacd0b85a97d-405cc70f7eemr264302f8f.62.1758581338257;
        Mon, 22 Sep 2025 15:48:58 -0700 (PDT)
Message-ID: <0e901379-41a0-4fa0-bfbb-3407162437ff@suse.com>
Date: Tue, 23 Sep 2025 00:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] xen/arch/x86: reserve TXT memory during Slaunch
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <8d5ba2e7a0a8bd05bb9cdb89db3f15b831f7f4f7.1748611041.git.sergii.dmytruk@3mdeb.com>
 <45ed8b90-ce0c-419e-9c7d-2ab58ee539a2@suse.com> <aNHBIkJt2HvxlcMe@MjU3Nj>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aNHBIkJt2HvxlcMe@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.09.2025 23:35, Sergii Dmytruk wrote:
> On Thu, Jul 10, 2025 at 03:00:07PM +0200, Jan Beulich wrote:
>> On 30.05.2025 15:17, Sergii Dmytruk wrote:
>>> +void __init txt_reserve_mem_regions(void)
>>> +{
>>> +    int rc;
>>> +    uint64_t sinit_base, sinit_size;
>>> +
>>> +    /* TXT Heap */
>>> +    BUG_ON(txt_heap_base == 0);
>>> +    printk("SLAUNCH: reserving TXT heap (%#lx - %#lx)\n", txt_heap_base,
>>> +           txt_heap_base + txt_heap_size);
>>
>> Please log ranges in a way that makes it unambiguous whether they're exclusive
>> or inclusive (especially at the upper end).
> 
> I'll use start:end notation which I think suggests inclusive bounds.

Please use mathematical notation when logging ranges, i.e. [a,b) or [a,b].

Jan

