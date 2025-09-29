Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E32BAA7C7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 21:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133344.1471472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Jia-00036l-0a; Mon, 29 Sep 2025 19:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133344.1471472; Mon, 29 Sep 2025 19:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3JiZ-00034t-T0; Mon, 29 Sep 2025 19:39:27 +0000
Received: by outflank-mailman (input) for mailman id 1133344;
 Mon, 29 Sep 2025 19:39:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bM2=4I=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v3JiY-00033Y-EN
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 19:39:26 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00d48e92-9d6c-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 21:39:24 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso28169615e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 12:39:24 -0700 (PDT)
Received: from [192.168.101.81] ([217.65.134.12])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e59abdde8sm3726925e9.2.2025.09.29.12.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 12:39:23 -0700 (PDT)
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
X-Inumbo-ID: 00d48e92-9d6c-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759174764; x=1759779564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B6d4sRolAyHHh0+NKbkmnD5c3XSjQ9m4SuLVmyGF7Xs=;
        b=I/T/5sVqumrUl7qcAOtqJKCYP1d35MtjH1VM1WZykMXikweTCbwiGVxe/Xqz2e1+jO
         XpUWkQ3pP1ZYcdkYK1wjuri95xXksJhb1cpISg3wbVjoDbQq8X98TZX1rJuar8OSJ50A
         5PEPYD8tR2KrjkhMekcUJ6DyfcokdEMlWlmDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759174764; x=1759779564;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6d4sRolAyHHh0+NKbkmnD5c3XSjQ9m4SuLVmyGF7Xs=;
        b=PbMwhOnckRiZM5ybEklBxWEbFx3/SeUrCyv9gKy0xM5HzZ/iCfwNEqFHg+P4LphJh2
         06iowCsOHVaoHEYBc1ShkniEB+GMPUviugl3hzondlUx9gE24Ldkn0oGkjs2YV2QXXMp
         ocrPsVo+6iax6/0WMFDQJx6AqVQ0K0d876X5YGqIL9EPvgjrn/Ng9vBgcyfm9uZHFTsW
         69ZSHSQOonRjgZx7QWjQEqeFrnH2PMTHJeoJKxL29QW2tcyYMZGqeiHycRFkPzBD+1X3
         g8eW+A2zDCGVxkcsdNVituaXo7G1CFNtycxvtMzA859hmgmEhWWnT8mA3CRQhXDTFKJR
         gujA==
X-Forwarded-Encrypted: i=1; AJvYcCVRmEFaZ6vwSE2H8fndFwgXkPkbBXJUzY+TITv7j58nCTZa+aoiQr1000p9y0GjyAq95KU8E+58zpc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzozUOwZcGrEUgAPdZUAMU+4RODkJGPxvf+GJOnaD4K9EhK7Iiw
	UhMPbug4++NCkhN/hd4dpgVt1G3rFrHUEvEb8gqySGFuUk2lSqN/LArfDMBIH+j1KNg=
X-Gm-Gg: ASbGncvNo/NSEo9Pf0NYdgWhsZCssDT8ONSZmyXH0jaW13UQUYdQ+pef+uEq8ViqnEg
	RViDm77qfUX12YA4Au93viLEhyNZkIVztssslu7Nl8oP3sYvPs1ANRz8i+Wm7F9OSRfkcZT69+R
	ec4ttac3RFnwcukwcG5kJcCvsL/Z2j75722huh/hm01LHJFdzAXJ8QOwSenLmzh6w7VC2wPwRvQ
	95eDf4nk3lK9ce7N56hVjTCWKXLBvecD8pLbpMPYYBV0cNzO9jTugfVPssPoCMT8EPMqJgAihC8
	vhEsVVKWDj71CJg/ZDcY2iXxnY3EnOV3aP7DKvtJLKpRGEuifWskPpYPvy/3MMHEPFnPa9gdTkq
	bUR/7+wimslhMEtx6M3JQVgY9eh+ppPDCpoisRSxgXBNAzqgYOw==
X-Google-Smtp-Source: AGHT+IGbc1FrwtGRqd9+Qt82VBloU79OFkbKdf+sjeDd4eRS/8HSYy2qGbSgZEUWIGLc8YfBAbTQ9Q==
X-Received: by 2002:a05:600c:8b2a:b0:46e:5019:69e0 with SMTP id 5b1f17b1804b1-46e58aabf99mr15338755e9.5.1759174763948;
        Mon, 29 Sep 2025 12:39:23 -0700 (PDT)
Message-ID: <45afdc14-7337-4786-b3ff-e3c07a6b5f71@citrix.com>
Date: Mon, 29 Sep 2025 21:39:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hap: Inline "flush_vcpu" in "flush_tlb"
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bb570008f237cb77f2c74c5f025375ca6c4f140a.1759148418.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bb570008f237cb77f2c74c5f025375ca6c4f140a.1759148418.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2025 1:36 pm, Teddy Astie wrote:
> flush_vcpu static function here is only used in one place which is just below
> where it is defined. Inline the function to reduce the noise and clarify
> what we are doing.
>
> No functional change.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Have you read the commit message introducing this pattern?  It's
11d9e114b53045e5f2009a26dad1d0d0f7df441e for reference.

The compiler will do the sensible thing.  What matters is the cognitive
complexity of the source code.

~Andrew

