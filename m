Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A796B9B77D7
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 10:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828553.1243473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RlW-00009O-Ln; Thu, 31 Oct 2024 09:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828553.1243473; Thu, 31 Oct 2024 09:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RlW-00006n-JC; Thu, 31 Oct 2024 09:46:54 +0000
Received: by outflank-mailman (input) for mailman id 828553;
 Thu, 31 Oct 2024 09:46:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6RlV-00006R-EG
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 09:46:53 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c682d29-976d-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 10:46:50 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo615571e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 02:46:50 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd947bf4sm50473595e9.27.2024.10.31.02.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 02:46:47 -0700 (PDT)
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
X-Inumbo-ID: 0c682d29-976d-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzMiLCJoZWxvIjoibWFpbC1sZjEteDEzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBjNjgyZDI5LTk3NmQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzY4MDEwLjA5ODk0LCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730368008; x=1730972808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d083J0Qsv4GOhbNwD3J4VxLjKt7VnKAN8bclVp8ujXE=;
        b=GtF9LK4Hou5a8KPw9YRu2loL2K4MFoCAzYrUGgt+QJTy1OpHRGiAmbvmOO0mDvBrK7
         aP1Fm37gy1u9/AQYj4AgP2hsQL4T4cnv0QywPKr7WfPzj6tzyd4rkcvaOY4Ux7K+CUwx
         egbFSE+TiXyw9dJZNVB9spMWqLiKmwloyzGHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730368008; x=1730972808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d083J0Qsv4GOhbNwD3J4VxLjKt7VnKAN8bclVp8ujXE=;
        b=cTVmJTpjkPRuQ9RqtsEo6DBBxe0kzS5jbfqrssco7ozNfCy7wBxRP5SFY37tbCPaMy
         Rpa6rvbg/8dcD4EguKPXJLr6PA+QnOSqDIa90oAaFLmlT+64KGeRIiLI6maZP8AE/sah
         rWGU/tgxf5tiOJ+K2aikMovGIUlpFxZtOYw6cUYB8n2gdOzD1UC95G4NGVM1nYT5muNe
         9jGaMjinyPo7T9jKKFQFDgVj5vkcmRtTXykXutS4+Mf9q0c5l3ySOIrsMGpoKtB0dlrj
         6YmYBKQZfNuMYSj4iw3Gf1KTWym5Ll8wjs2dloIOBi4blFVFyOXW2paoc8MB6DtKLd9V
         8Alg==
X-Forwarded-Encrypted: i=1; AJvYcCVcx4JPcvu5qsFs3RpRhC2Trb7JRW2u8H0W7wO3bOi/fgLABbAswQFe4u3C9IlIi2Oen6yBQbhHNcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPaBH6tx1v3E3lvErOvJiHU7WMLAzTkh/VFx79GVXjIdNIY77Y
	oFKufHjLhAJnYCXe1yvi6gQ6i2KG6OnDBevHHt1kj9lBAaXE5IkjyaeIgIUxAgc=
X-Google-Smtp-Source: AGHT+IEYTiqYXVWZfySnkP3dtE7Tmc/ORAHSK5eOnvSYSYUKKQfoMsO4cx94DSSFwJmCaFCJZ6h9yQ==
X-Received: by 2002:a05:6512:4022:b0:539:e333:1822 with SMTP id 2adb3069b0e04-53b348b7dc7mr9700016e87.4.1730368008098;
        Thu, 31 Oct 2024 02:46:48 -0700 (PDT)
Message-ID: <c84ef564-98de-451d-af4e-04e824231ea6@citrix.com>
Date: Thu, 31 Oct 2024 09:46:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] Config: Update MiniOS revision
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241030180332.2726909-1-andrew.cooper3@citrix.com>
 <a76d84a3-d150-4836-8ad2-ee0eeabe557b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a76d84a3-d150-4836-8ad2-ee0eeabe557b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/10/2024 9:25 am, Jan Beulich wrote:
> On 30.10.2024 19:03, Andrew Cooper wrote:
>> A new branch from xen-RELEASE-4.19.0, for now containing commit
>> a400dd517068 ("Add missing symbol exports for grub-pv").
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> ---
>>  Config.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Config.mk b/Config.mk
>> index 03a89624c77f..aa3d5843f1ed 100644
>> --- a/Config.mk
>> +++ b/Config.mk
>> @@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
>>  QEMU_UPSTREAM_REVISION ?= qemu-xen-4.19.0
>>  
>>  MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
>> -MINIOS_UPSTREAM_REVISION ?= xen-RELEASE-4.19.0
>> +MINIOS_UPSTREAM_REVISION ?= xen-stable-4.19
> Wouldn't we better use a hash here, like we do on staging? There had been
> cases where it wasn't safe for the used commit to move "automatically", and
> the same could occur on a stable branch. The hash would then be replaced by
> a release tag when a release is being prepared (again like on staging).

It will only be getting build fixes, not new content.  So it will be
stable-enough in that regard.

Otherwise, its hedging my bets as to whether other changes will be
needed before we cut releases.  All of this comes from the fact that
we've got a couple of rolling distros which end up up-to-date even on
the oldest trees.

~Andrew

