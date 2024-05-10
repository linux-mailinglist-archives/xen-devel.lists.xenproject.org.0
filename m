Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B868C2B8D
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 23:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720063.1123022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5XWc-0007u9-OQ; Fri, 10 May 2024 21:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720063.1123022; Fri, 10 May 2024 21:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5XWc-0007sq-KX; Fri, 10 May 2024 21:11:30 +0000
Received: by outflank-mailman (input) for mailman id 720063;
 Fri, 10 May 2024 21:11:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5XWa-0007sM-VW
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 21:11:29 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd19c30c-0f11-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 23:11:27 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-78ecd752a7cso170143485a.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 14:11:27 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf31171esm214186085a.116.2024.05.10.14.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 14:11:26 -0700 (PDT)
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
X-Inumbo-ID: dd19c30c-0f11-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715375486; x=1715980286; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CfTRCP8kjMYc4ed/WJ8lC8rhANgJZgIfNM6JbRDL/G8=;
        b=tqd86d7KU+jUcAjJFsYBjaYKoIPMRr+HYA5jBflS10TQpWM6FAeL6pzy4OYpqfH9bw
         Nrynocq///E+2146+gmsTXJIkLVppXixUAFW64PnF1+5JBHTw2iGw5tikkHegLdC17lJ
         Kf5cwhVVbW0mjm7Ij24MyItFNhOHECb2NRwnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715375486; x=1715980286;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfTRCP8kjMYc4ed/WJ8lC8rhANgJZgIfNM6JbRDL/G8=;
        b=IF4JNtsP075HgOJjY+KjMwCVJdqakmCTLRDfwaYxf1QsABLHbaUce7JborU2SrBxvp
         KzmKrM/eikQt4EBu9QupxX2myStRe1WYRsAqM3QV/BNZqmdzWi4X7mDEHnWkQ7vpd+eT
         cUXBXZ99FqS1CFd7XQdksU+lHruFXwFiI5Rlu3PloLhB7aaJ4a8Dq0S1yokxS+VTu4ja
         gmRGLnd0rCQMBVe4DGTagamA2ARrD8EgzWLCG7WR0RVrE/cjO+FkTK5eKxkoUsHmrepR
         RU1SVKDo+Nv42HBEReRCKPK8XM6SWjVvIiYNKaAlwY8zh/4d44pUxCni8lqDIUCyO+FA
         Fs/A==
X-Forwarded-Encrypted: i=1; AJvYcCVz7XT6Mff1zw9Zb7/G1gpxr5S6+/fS8Ii08VIm+TO0gRLtlq4/bi+f4OF4ZJSYhhtRMrCJRQDQqshvBOOT2EC26sQ5rxGuTuUDjycUuqw=
X-Gm-Message-State: AOJu0YyDu21Uo1mIeBE0Cs+3eVXLVbFp1alofiIdIbuIBF0iCGTyCmwV
	CiaHHgKezbmuMJAL5cdHP0CUkz5oNvj8hyFriaBQzGUZ3Q7DMiGyKqsbrXedsGk=
X-Google-Smtp-Source: AGHT+IEgIzkrMVTTP0mKdRizot2RI2Tmzb+sPPsSxvmM6DYh7QQdGMFH2m4xGTONIkSV0ZSWlGXoXQ==
X-Received: by 2002:a05:620a:148c:b0:78e:db73:913b with SMTP id af79cd13be357-792c75900famr432670985a.28.1715375486535;
        Fri, 10 May 2024 14:11:26 -0700 (PDT)
Message-ID: <78fcd0d2-00fc-41ea-a531-7edbb8201dfc@citrix.com>
Date: Fri, 10 May 2024 22:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen: allow up to 16383 cpus
To: Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240510141636.20543-1-jgross@suse.com>
 <9650300c-9947-4d1d-87d5-aaa6102bfabf@xen.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9650300c-9947-4d1d-87d5-aaa6102bfabf@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2024 10:08 pm, Julien Grall wrote:
> Hi Juergen,
>
> On 10/05/2024 15:16, Juergen Gross wrote:
>> With lock handling now allowing up to 16384 cpus (spinlocks can handle
>> 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit for
>> the number of cpus to be configured to 16383.
>>
>> The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
>> QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.
>>
>> Add a support limit of physical CPUs to SUPPORT.md (4096 on x86, 128
>> on ARM).
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> I am a bit surprised that this is kept given you added SUPPORT.md. I'd
> like Jan (or other x86 maintainers) to confirm they are happy with the
> proposed x86 security supported limit the SUPPORT.md.
>
> For Arm (only):
>
> Acked-by: Julien Grall <jgrall@amazon.com>

XenServer is currently at 2k and we're waiting on this series to move to 4k.

I'm happy with this being the security statement for now.

~Andrew

