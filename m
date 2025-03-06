Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB68A558C8
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 22:30:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904035.1311947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqImA-0000Lz-R0; Thu, 06 Mar 2025 21:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904035.1311947; Thu, 06 Mar 2025 21:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqImA-0000KR-Na; Thu, 06 Mar 2025 21:29:06 +0000
Received: by outflank-mailman (input) for mailman id 904035;
 Thu, 06 Mar 2025 21:29:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZnl=VZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqIm9-0000KL-Ep
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 21:29:05 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 067fc71d-fad2-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 22:29:03 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso6907915e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 13:29:03 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c1037bfsm3165902f8f.96.2025.03.06.13.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 13:29:01 -0800 (PST)
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
X-Inumbo-ID: 067fc71d-fad2-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741296542; x=1741901342; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ePZsY2YPqfwv5T7iRc2mfz+Cu0h7RJAvx8epUW+pRqU=;
        b=NVvfrcJ0FRv1+WxSLrSX4/VnxtppoHSxMnDit9mwMUAFabIiE3GnY+WtIMNiOhqB3o
         0l/aSytmW+c6k29/7mckXNM2Kqw+3RIv4MI3BdwzbFWbn3vXEnN2rd1XQ7o3Qy3dmF4W
         b5/vqFQiV6fas+SJO5nQW7A16wUwM0i+MxYj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741296542; x=1741901342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePZsY2YPqfwv5T7iRc2mfz+Cu0h7RJAvx8epUW+pRqU=;
        b=AGGECtp8nx0j2rRm7Y3CWMbhjdl+BuI+vO+MbKZgICmtWYlgDeAnP9lHxrZ03IyDYU
         0eL3awSOApRBKZ+bmAOsX7XIvbb5zgwbHPhoPBqWZZ9Gj8o71IFNRPfgo3ps2X1nz/2L
         myzhEiHOa84Rnl+kU9/6dJABGcOiHW7SqEdP9/idVM8FhBbxgbyUekeUiXSi7J7ffyTe
         zubsLZ42Nxf5SpXEcanAYk3FGQZFE0h4Jb9P0VgTqI1moHjKAJI3pWrOT1K6po1BsVdq
         LXosLEz3UbCj7NlCPkJDoBsaP0RBUN23CxNFJxNdRFZR0KRoZ9EOkjdrVdGwbEGJlN/d
         194g==
X-Forwarded-Encrypted: i=1; AJvYcCVr73LhEdoHagcClul/UJDIoJ1aQ6W2uSqf9Ja3P3pQ5VJCzTUpb99ttfGwJ2r9XgmCERp54sKeW68=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyF9zytGs0uHpgqlZh1D54nrE52jApDN1VZdcWyWMswsjGs+e/p
	kVN1/9Wze45TpsNJWW09KAWPrwcrf8uQ4qKgUYLVxKCv5HGX3AhJn3XPTICWcz4=
X-Gm-Gg: ASbGncvtLiMJtfIxtVKgJRQd2fLPanKDWhVrf4LeegQ2UhAPIXLszOC7zaB3aZJnJZZ
	u+lquxe52UxX2h4xeg/8rdQ473rNvanN0O2zNswl+Hhn049+n1a8S/glIwgrG3kKXMBxUpu//oo
	3sn1ECG7Z4e9qOB4exv3fCOafBHkzb8L672LU4F8oBn7pO0+G0/ndmREzFfWTH/mcgqrbS+8kQr
	86Prr+XKEbImGEkho4hsdaYBpdb6YNncolKmQ+uiqL5stSH5QYuCrZgNaed8v/bLNzoDfd+6/em
	jHz1QGrIoofVaA3oBTyPyTEjR9RkskotfZOCEumlFkClvQYaJccCpsaPa9YSrjzq96ceienik5Q
	XIev6CmfH
X-Google-Smtp-Source: AGHT+IFZJFB2e46X8r7vydaRizOOUaKwtIi82BHda2iaQYExYNrjP0ienWROv1NDsz+h7QGCZKwZSw==
X-Received: by 2002:a5d:6c6d:0:b0:390:f641:d8bb with SMTP id ffacd0b85a97d-39132d98b62mr478689f8f.36.1741296542686;
        Thu, 06 Mar 2025 13:29:02 -0800 (PST)
Message-ID: <7da64dd1-2510-440f-b165-f64c0a873575@citrix.com>
Date: Thu, 6 Mar 2025 21:29:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/domain: Annotate struct domain as page aligned
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250303232941.2641306-1-andrew.cooper3@citrix.com>
 <20250303232941.2641306-2-andrew.cooper3@citrix.com>
 <abffca04-ca4f-4d62-8c2d-c687550ca8c3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <abffca04-ca4f-4d62-8c2d-c687550ca8c3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 9:23 am, Jan Beulich wrote:
> On 04.03.2025 00:29, Andrew Cooper wrote:
>> struct domain is always a page aligned allocation.  Update it's type to
>> reflect this, so we can safely reuse the lower bits in the pointer for
>> auxiliary information.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Dario Faggioli <dfaggioli@suse.com>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: George Dunlap <gwd@xenproject.org>
>>
>> v2:
>>  * New
>>
>> Interestingly this does cause two changes in the resulting binary, both caused
>> by GCC electing to use a more complicated addressing mode to save one ADD
>> instruction.
> That's on x86, I suppose?

Yes.

>
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -645,7 +645,7 @@ struct domain
>>      unsigned int num_llc_colors;
>>      const unsigned int *llc_colors;
>>  #endif
>> -};
>> +} __aligned(PAGE_SIZE);
>>  
>>  static inline struct page_list_head *page_to_list(
>>      struct domain *d, const struct page_info *pg)
> I understand struct domain is where you need the annotation right away, but is
> there a reason not to do the same for struct vcpu right away?

struct vcpu is more complicated.  It's multi-page on ARM, and I have a
strong suspicion that alignment is going to have to change away from
PAGE_SIZE for architectures wanting to use larger page sizes.

e.g. with 64k pagetables, I expect these will still want 4k alignment,
and therefore they'll all want changing. i.e. I'm probably creating less
work for someone in the future by not annotating struct vcpu. ~Andrew

