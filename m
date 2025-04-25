Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85489A9C938
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967954.1357676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IUQ-0000qU-Lh; Fri, 25 Apr 2025 12:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967954.1357676; Fri, 25 Apr 2025 12:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IUQ-0000oO-I5; Fri, 25 Apr 2025 12:49:10 +0000
Received: by outflank-mailman (input) for mailman id 967954;
 Fri, 25 Apr 2025 12:49:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c45=XL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u8IUP-0000oG-IP
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:49:09 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad16b48a-21d3-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 14:49:07 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so2364201f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 05:49:07 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8cab5sm2334028f8f.10.2025.04.25.05.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 05:49:06 -0700 (PDT)
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
X-Inumbo-ID: ad16b48a-21d3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745585347; x=1746190147; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=goEFQm6UUepN+Hlb8LvhjG4jRriwiif1mEOmVObzBlY=;
        b=Mse2ZrcJIokFody3KNVPq/cd2H5inYQtkYstgR45EAZflxhpxIKH0tOBR0fNMUp8X7
         OEfvOmjBN2yZyqrs6ODwp6TryeIEMbKAXMh5HJDpy7NBBDQe/vMcElQ6ZD2kEIdY4iXc
         6l7z/O97FbjGsHxe8a/0kgZrRkdMQq36mQ4Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585347; x=1746190147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goEFQm6UUepN+Hlb8LvhjG4jRriwiif1mEOmVObzBlY=;
        b=UdZH8Lr0TyUkg9uC36sdsqi9bZAo3PI/Kas2B0+ZqrUoj4gSKcOhhFgXNBqgS94pIS
         KbZvFL5Z/Ar3zKuGh6ni/7Z/bqyxvZ+rmOHmNV1LCJHZfCH3gka6lpGYy1QwWrFgXMRv
         mknWMzrc7ezqiwc2S/cfFLvJ+Gvp9Sd9ZMoQM9+b8NGZzeV933tdjWXAXQ2BY5sS8ky9
         ORcxxJspfPXs9//CNKobPTyS6nzmFFwtLqJDWMJ5e/DI5Z1Dj4QqxdCQjj8bmRTHzkQO
         TFAYiduzjQ5J6WCbFYsndCalJUL2MVpbtlsIzjXDHBt1cuA7SDAVIiOU8kWRaMNGvQsN
         vprw==
X-Forwarded-Encrypted: i=1; AJvYcCXumdKk43Oh5aqQn/Sys2W/rfVYv9giYgfmtsfd7D2IvRmGadTMuErX8oGMNFcQccW1eSqxJFG63ko=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+lhJlgXCxnb0PsFrykgqHGcwIYWxQM9hE/hE1r6+cqSbTxYr+
	OyE/9ky2+wyjhcyu7cNWILk9/nyqlqQIGgaDS21V7OjorFBt3NSLifNP0WDbtH0=
X-Gm-Gg: ASbGnctKwU/ft5shjmJ+4zhBUrrIT70mnXg24UIv5MFasiXbyq3ssbUIHkF9rDu0loQ
	zr3XfJUvuHy9MFdLSU8YgarQgHskX9uvOKm4ZLT1teLgbbJRfQ+I/nM9obCAFYXWvX4od39lcJM
	Mm+yGFnij1wj+nvZ4UBG4NrSTH8/5x8OL3g70WHOiwQ7p55tYTDZPaSs72aF2QpB04LeNxWp4wK
	Ob/fBJZ5SbrdUTbJavEeqI+7qoxS1jmhaEFwAlc0p/dof3lVanPJ5BkQ06qSDqVAM/IBfYpuVR0
	KxTmiMh3WQS9eMqUDCm2fZVR8/vT5hdHIHj4AoI0TC5ujqWqtNG5f7hX7pnhLrb9d0y0MYXDyhj
	pADh5n3c04HsQnVYV
X-Google-Smtp-Source: AGHT+IEwn/QA63mX9XmMzn+ztIlQR2m8zJSJJ7pl0zNtaK+nBzX4M4q7WMg0721gIZNqHxN0elI8Sg==
X-Received: by 2002:a05:6000:1a8e:b0:39c:30f7:b6ad with SMTP id ffacd0b85a97d-3a074d46321mr1893853f8f.18.1745585347081;
        Fri, 25 Apr 2025 05:49:07 -0700 (PDT)
Message-ID: <027a1f67-7de1-4f48-9de6-c79f6f09c92a@citrix.com>
Date: Fri, 25 Apr 2025 13:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/mm: Introduce mm-types.h
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
 <20250425112415.245585-2-andrew.cooper3@citrix.com>
 <b2883538-8cea-4fde-b42b-55455fa810ca@gmail.com>
 <f278eec0-2627-4598-bcdd-ee2bed4b71a3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f278eec0-2627-4598-bcdd-ee2bed4b71a3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/04/2025 1:45 pm, Jan Beulich wrote:
> On 25.04.2025 13:29, Oleksii Kurochko wrote:
>> On 4/25/25 1:24 PM, Andrew Cooper wrote:
>>> The type used for pagetable attributes/permissions is currently unsigned int,
>>> but needs to become architecture dependent as PPC needs unsigned long.
>> Not only PPC, RISC-V needs it too.
>>
>>> Introduce mm-types.h to house pte_attr_t.
>> Do we really want a separate mm-types.h?
> I think so, yes. It'll (hopefully) allow to avoid including xen/mm.h in a few
> places, in the longer run.

Yes, that's the intention.  We need to use this pattern here and
elsewhere (especially sched.h) to avoid having most TUs pull in most of
the world.

~Andrew

