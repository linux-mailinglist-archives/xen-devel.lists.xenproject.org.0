Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B757ABCEFC
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 08:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990451.1374398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHG8p-00037q-G1; Tue, 20 May 2025 06:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990451.1374398; Tue, 20 May 2025 06:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHG8p-000356-Cg; Tue, 20 May 2025 06:07:55 +0000
Received: by outflank-mailman (input) for mailman id 990451;
 Tue, 20 May 2025 06:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHG8o-000350-5C
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 06:07:54 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3cfc58f-3540-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 08:07:52 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-601fb2b7884so2260260a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 23:07:53 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4cac58sm676754566b.168.2025.05.19.23.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 23:07:52 -0700 (PDT)
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
X-Inumbo-ID: c3cfc58f-3540-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747721272; x=1748326072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XycbkiQmhIxEPpBh104BHF4ytnsP39YhNYXlKMRNcMk=;
        b=IKs9rYHByhzMF0+H9Ye/GV3+z3vjCmh/9m2ngQ+4VdkW2cPDT0RT/3GxKTwWgVdgJ+
         OK6DcFgptopGtwYf+2JRB1Aj2kI+S/QDqJcHIyCi1jXJ+12TSseXLuY7eCBSTLHlTV39
         3HxRUOO8P5FRwtM4K9jaMz8ssVHrsDXHLXbnLjqP9jNUq+owpoxFYLWgkv1pKlTomIOB
         h4R3P7mQV4s1+BTpjRUBVf9IMpe5Y0zsu+HmLhVBWpbivgKOioDgPGtS9IJNFY5EhAWQ
         s3F8KuX1o6X61Pxwq+3DKx2LSsXWcTqYHT2f6SizT9st/Ts5ZkgcEp1ozeKb7HI0mual
         PPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747721272; x=1748326072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XycbkiQmhIxEPpBh104BHF4ytnsP39YhNYXlKMRNcMk=;
        b=iLf3BVJ3JJLlhaFrw6WqHdPBcJJOp1rrETaWtvdkFtn8iNXbiWRPqv983HE193k3XH
         Ophoi5WGHOHG6bqJGB8xMiBMBtk+/wtpL/+fSqvrluwJLY9pZ+oNDoppX2ZcIzQlZtJq
         Nxn40RCccrDty3HjCtgqjWv8eVT8SdahVkQh8vDVX6WsgmEHcdt8QLdlnj8I+t6gHAuX
         oJ8nHmGYNGMgMaOOa/KJh4Ju7I13TKBf+TRJBppdFadsJ+ZII2mvdstPnE6QF16ONdYK
         hNboBF7qVfK6WBXkXJyxZyLeLdy/invIh4szQtvqihuqLB2gux4Huw6egkIQslEq9PlA
         FLdA==
X-Forwarded-Encrypted: i=1; AJvYcCW3mRgA12fA/16vMEQMiEmOJhPngp+nc2Kqt/xvT38B7Ri9tTPJwB3M63UTmseu9T7GJzGsgLiDksM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySxfBFYdhPOUhPckKz1rvWz9DCcS0HK7GFPWfA80kb/Ew6T/OZ
	JK9an59dJTgjCAnO1zNuYrcRQO/hVVql8qoAuCRHRCqk68d2PRE1dJ/1c+STc+NBHA==
X-Gm-Gg: ASbGncvelIYln1TtWZY5A4gOjxW34fQZ9xHjsG3aqVKkVKnEzZ4xYLVUmYHS8/HrtaH
	F8tDEkFbcu7P80ymlHUGHx0aBlLzJHRU56HNtNPDNum0Y6c8DJyIl+sT1279YcVQTwU8V+HOWwl
	HM9nm0a1ySTZtx0h6ux+UfJ++fDAUxCk4uSPUudr53153XXM8VR6Argb1IlnIPiWyWfzEzK2QBe
	Ej32lzo8DqRDPlPGFP+6Y2+x7wqYF5kwvqSeVHkyjN0q3pUEzWfbukekgK89xkAizOp7y/FcXUD
	CuMOxqtKd6MntdkNhnnDYe5G/iClD31fxBw4eDoDKoD0cklKpX82ykTKvveQqQ==
X-Google-Smtp-Source: AGHT+IHrYawBBcaK6pJi6/b/iFegOKbWdIfEgLGAhIwRTrxKjyuYBNBQFCgHfOyvcp/QlgMpSfdE4w==
X-Received: by 2002:a17:906:c303:b0:ad5:fae:6288 with SMTP id a640c23a62f3a-ad536c1a829mr1093829566b.26.1747721272467;
        Mon, 19 May 2025 23:07:52 -0700 (PDT)
Message-ID: <b375ff7d-5c0f-46cc-9a0e-4bfdde2f66fa@suse.com>
Date: Tue, 20 May 2025 08:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen/console: rename switch_serial_input() to
 console_switch_input()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250519201211.1366244-1-dmukhin@ford.com>
 <20250519201211.1366244-2-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250519201211.1366244-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 22:12, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Update the function name as per naming notation in the console driver.
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


