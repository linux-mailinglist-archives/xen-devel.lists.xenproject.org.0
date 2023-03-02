Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC6A6A7D98
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 10:24:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504772.777138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfAU-0002Ct-Fi; Thu, 02 Mar 2023 09:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504772.777138; Thu, 02 Mar 2023 09:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfAU-00029V-Co; Thu, 02 Mar 2023 09:24:06 +0000
Received: by outflank-mailman (input) for mailman id 504772;
 Thu, 02 Mar 2023 09:24:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKVd=62=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pXfAS-00029H-RT
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 09:24:04 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9670e5f-b8db-11ed-96aa-2f268f93b82a;
 Thu, 02 Mar 2023 10:24:04 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id c18so10226905wmr.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 01:24:04 -0800 (PST)
Received: from [192.168.18.179] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b003e7f1086660sm2433070wmo.15.2023.03.02.01.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 01:24:02 -0800 (PST)
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
X-Inumbo-ID: f9670e5f-b8db-11ed-96aa-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b0qXziU2kgjH0TZQt3xevl6U/O4itqCH1ZpiUXv//eE=;
        b=KtPocXbqDmOO5ZjCj3xn6FgFwyfqNPp4zf2WJeQB0MARMaoljjKAJI1xOxJN1ju5wB
         2RdElejciAvbWdYAa4uK7+PNWOCNeyXjby/LFlTd/ShVm/G/ulGJrlIjToTCdwHRrpGd
         xa1/KzlP9ozvbkPQ0MVBhFuA4z70ItAoBvnj6+ccpBpn5eHPdKjDXqZ9gl/l1Hz90agq
         pa0XykVvbs+76TeJD2S2z9mQIXf1suUyv5d5rJut0+HZ1sXTBr+/PgT/F2hjQQytXgl4
         kBXYbawPkEtO5Sj+jj4YwP+zyshJjTu4eQwxzgDgIRGDX9mzSbfZMrcebEzTjc7xuY3d
         7pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0qXziU2kgjH0TZQt3xevl6U/O4itqCH1ZpiUXv//eE=;
        b=Kiw5sowndhv3kW5Enp644f4yq06mbDiRaxhTwR+5GGtcwclL1RYF68DZ0+Zwpft7Sb
         /xOaDgDsaCuVN0S10vN+/i3v1ejPTUR5W4c1WpY9r+V5wCcaWInYH0J/f+ygaGa8wXO2
         JmL63/O96VP1+EPIxFBL40j15a4/oN8hNwV7UFO38vf/aU34mHdEkE9Qd08DpxkvJbgx
         HPG8ZlesRtz4PoygWCC2OqWV+8FxOakqjeU7bJ0VI8hDRq81lw8n9c5IS+JFMHBSuwlP
         kPVzsPsBoMhoTtMrztm6Ng2h/vOhnu+qZF5oGt2ypzkE0akk8NAeHUq9IDxmpJrwp/5b
         UbSA==
X-Gm-Message-State: AO0yUKX76VnMAKzY94QIjXmWhHWza99YCm9ScLU//vbqllWi/VkYnfQE
	QizHW9KgPOz1P57lAQT4KOThR1elS+RvGQ==
X-Google-Smtp-Source: AK7set+ym9ykTwOMi28fEvALCmeDGZ2dhHjQl02bl2h80f3u229Rr/idbCkhHxjwvyZ50NmnlfV1Kw==
X-Received: by 2002:a05:600c:314e:b0:3ea:ecc2:daab with SMTP id h14-20020a05600c314e00b003eaecc2daabmr7907127wmo.3.1677749043250;
        Thu, 02 Mar 2023 01:24:03 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8e00217f-d67a-af35-bef5-d2dc5077c543@xen.org>
Date: Thu, 2 Mar 2023 09:23:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: memory access atomicity during HVM insn emulation on x86
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aa65b90a-5875-9306-692d-d3221afe785a@suse.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <aa65b90a-5875-9306-692d-d3221afe785a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 08:35, Jan Beulich wrote:
> Hello,
> 
> in (I think) Intel SDM version 076 a new guarantee of atomicity of certain
> aligned 16-byte accesses appeared. While initially I thought this would be
> another special case we need to invent a solution for (it still is, in
> certain cases, as per further down), I had to realize that we don't even
> guarantee atomicity of smaller accesses, including as simple ones as plain
> 16-, 32-, or 64-bit moves. All read/write operations are handled by the
> very generic __hvm_copy(), which invokes memcpy() / memset(), which in
> turn do byte-wise copies unless the compiler decides to inline the
> operations (which from all I can tell it won't normally do for the uses in
> __hvm_copy()).
> 
> The question here is whether to make __hvm_copy() handle the guaranteed-
> aligned cases specially, or whether to avoid making use of that function
> in those cases (i.e. deal with the cases in linear_{read,write}()). Both
> options have their downsides (complicating a core function vs duplicating
> a certain amount of code).
> 
> As to 16-byte atomic accesses: The SDM doesn't restrict this to WB memory.
> As a result, in order to implement this correctly, we cannot just utilize
> the rmw() or blk() hooks, as these expect to operate on guest RAM (which
> they can map and then access directly). Instead the path invoking the
> device model will also need to cope. Yet the ioreq interface is limited
> to 64 bits of data at a time (except for the data_is_ptr case, which imo
> has to be considered inherently non-atomic). So it looks to me that as a
> prereq to fully addressing the issue in the hypervisor we need an
> extension to the ioreq interface.
> 
> Thoughts anyone?
> 

Does the interface need modification? As long as 16-bytes are copied 
to/from guest RAM in an atomic way then how that data is passed to/from 
a device model shouldn't affect it, should it? (As you say, data_is_ptr 
is a different problem).

   Paul


