Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC68A34A9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 19:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704866.1101439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvKfu-0003nJ-BI; Fri, 12 Apr 2024 17:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704866.1101439; Fri, 12 Apr 2024 17:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvKfu-0003ld-8V; Fri, 12 Apr 2024 17:26:54 +0000
Received: by outflank-mailman (input) for mailman id 704866;
 Fri, 12 Apr 2024 17:26:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOJy=LR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rvKft-0003lX-Fo
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 17:26:53 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d911dff8-f8f1-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 19:26:51 +0200 (CEST)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-434d0a63151so6483091cf.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 10:26:51 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b7-20020ac812c7000000b00436866ec688sm1289554qtj.0.2024.04.12.10.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 10:26:49 -0700 (PDT)
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
X-Inumbo-ID: d911dff8-f8f1-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712942810; x=1713547610; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2mUX9Nqb3J1dCvcnsbb0Jn9olFQe/ejrVijowOYkwYs=;
        b=r+Kp3WL0bi4UkRjMCJhuGF1txAqMZJaYu9NyspVgz71HuTQgOgr6aQj4IkdS41a/mG
         3WVh25n/8mKRZhoeUg+2n8mOAvJkmRtRVl4ZoJ8Q+bjdWESmWHj58K5O2FA4fjg0TSFM
         mhi8znmYCbHOog3OUc9n7gzA9k02Dyc0V++6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712942810; x=1713547610;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mUX9Nqb3J1dCvcnsbb0Jn9olFQe/ejrVijowOYkwYs=;
        b=VWQLRgApP79NDvxiWzLfoRxfvRu/PJ7dC1hHyhEMxgBPBjC6EyuOKJxBJSEd0bHWgi
         XHuKjs5j2QNt/5IzlxrdgiX47cOv//58FBsU7ReqSnQdWitFcaGRRHCM9eFOJSp2ti4U
         k/TtaRFV6mEMo3LJRvjKXYjfFo0GuAoLAsxNJ3cVUoN3n69z21iT2I4GdBIw3uSicSgM
         3tl3pI4nJlhrGQVJIakPccVRc0h8rBU8co+sa6WAjhw26Zn8VvlXPYShQXKDAwff7uKm
         qWTx3wuNKLZerbxWQRIP/zn0mJciPSY2IMCY0UfWE62Z6mr1TkUEGvHY0LsOzgvcNrf6
         0dqw==
X-Forwarded-Encrypted: i=1; AJvYcCWkBqgmdSO+Sirm2PLG2IQHzUp0zCLb4PJFhWntIJyjhYKUJAT8DwMhUH8ouVBxvCDEMzaNiGboUKqxP5Sh0896C+qq4y3IitJr6EKGC6k=
X-Gm-Message-State: AOJu0Yw0pY3GDqoFgFei6wVMFJRhIYjUaOQ6/U2dTiGSIrswgsW85Gdd
	Qbor4i5b1jiz9RKj1oQZl2QKn97h8nd+lgFKBYXk90SwE+8T+SMbjOeREpucZxidMv6ON8A4KEs
	jedo=
X-Google-Smtp-Source: AGHT+IEWQW7x+Lg8RColcBB7+YR/jx6UdpqEZqUAxg58hOEi8X7lJZWlnygKJlluedSCCTkgohO+uQ==
X-Received: by 2002:a05:622a:15d2:b0:436:96be:20f with SMTP id d18-20020a05622a15d200b0043696be020fmr2178244qty.4.1712942810214;
        Fri, 12 Apr 2024 10:26:50 -0700 (PDT)
Message-ID: <e31bc365-191b-43a0-9e88-4dcf8452a061@citrix.com>
Date: Fri, 12 Apr 2024 18:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 0/3] x86/iommu: Drop IOMMU support when cx16 isn't
 supported
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1712915011.git.teddy.astie@vates.tech>
 <727d038c-6401-47bf-b1a6-23a554c6154c@citrix.com>
 <1e7bf9be-79b6-4147-a92d-37298685056a@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1e7bf9be-79b6-4147-a92d-37298685056a@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/04/2024 4:51 pm, Teddy Astie wrote:
> Le 12/04/2024 à 16:49, Andrew Cooper a écrit :
>> 3) In patch 1, you shouldn't modify x2apic_bsp_setup() like that.
>> x2APIC && no-IOMMU is a legal combination.
>>
>> Instead, you should put a cx16 check in both driver's supports_x2apic()
>> hooks.
> In this case, you mean both intel_iommu_supports_eim and iov_supports_xt 
> (AMD) ?

Yes, with the changes in the appropriate patch.

~Andrew

