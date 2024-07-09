Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6F92B5EF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 12:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756171.1164695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR8Sk-0004Bi-FP; Tue, 09 Jul 2024 10:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756171.1164695; Tue, 09 Jul 2024 10:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR8Sk-00049E-CS; Tue, 09 Jul 2024 10:52:46 +0000
Received: by outflank-mailman (input) for mailman id 756171;
 Tue, 09 Jul 2024 10:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cUMd=OJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sR8Sj-000498-0e
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 10:52:45 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e605df0-3de1-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 12:52:43 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-447f2f5891cso9553861cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 03:52:43 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-447f9bf4317sm8971451cf.93.2024.07.09.03.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 03:52:42 -0700 (PDT)
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
X-Inumbo-ID: 5e605df0-3de1-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720522363; x=1721127163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rkEqfGYJGpPzhfQt/2efXrN3UR+BKrwJd7jWOFgGeTs=;
        b=lGylmwEXsVf0FiTUHomBgFYzhMUP2NIJqzYs7oJZV1MhGe5EZjfkJ/qxAOIn1hCp9q
         +deuwO+YXptcwYQ0NpOgJYVoUkZQW1yPqn2gOX+xwjZ1C4Kl4stVSmTyVqGCTy5kQvzv
         TsjwPRV7+1ZlGeZOmxxJnCIhTJtulAX7gTsXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720522363; x=1721127163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkEqfGYJGpPzhfQt/2efXrN3UR+BKrwJd7jWOFgGeTs=;
        b=BmZu6ZZhF6++Pq05fSEjD9NXzDW31WG/7TfkReD0IZpMuS+68nkfcqf9g+WfEW5556
         QSMNqokgZmpv775fB38rCiD9G+RiwIEJJckhQliGLV2xm0KyOLgX6On5E8oDU3aNup3F
         +A3Ozsf9CmCzpXdLeoYid9I0bgof1SWx0/WIMIoAvpLDeyQxkU+x3C9NFNGoT+36GKSi
         gDYpTaf2NX/tdsVTYT8GwU1lbLSLDarhVjBAEK3A5+G+t+UrSR6V/CQ6eJ48aX77JDvC
         ZIWzR39RzOw7SWK9Hrvom4D1rzVPwwN+PEIv5quIdXBHajBCLa6Yr1iSAMiLFAA/thwW
         6K5w==
X-Forwarded-Encrypted: i=1; AJvYcCU5WJJND5tXeRXke+dfvfusmRUjhArF/1Acr1lPIPTOW3xrVU0va4eXXPj+XnjCL9Ier8cl0maVos2Ek7o9p4l1kxZN1zWuR62FTd/f7Bc=
X-Gm-Message-State: AOJu0YyPxF9X1H9gOWcCKgrQzS3ypqOoOk15Awu8f6w4aEsXdpGHAW6O
	3dNiKdvpKUbWdMdbwTxlt6+J8zoW+s2/YB5jn9o2oIIx+CFd0u2WZ9FWB+ddzKUN4Vq9kuDEXZ0
	M
X-Google-Smtp-Source: AGHT+IHQaJNBcwVVYyENLmeZjSQ9DUo9wZyxUcJkbN7td5H8gqqgQYNMa9cKk1YILnjegaOnSgShpA==
X-Received: by 2002:a05:622a:1ba2:b0:446:55f1:bc66 with SMTP id d75a77b69052e-447faa627e3mr28742431cf.68.1720522362732;
        Tue, 09 Jul 2024 03:52:42 -0700 (PDT)
Message-ID: <5ee79ef2-6c68-477b-a3f9-3a190f99ca0e@citrix.com>
Date: Tue, 9 Jul 2024 11:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ppc/shutdown: Implement machine_{halt,restart}()
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20240705182311.1968790-1-andrew.cooper3@citrix.com>
 <20240705182311.1968790-3-andrew.cooper3@citrix.com>
 <f3bad5a8-077e-40e7-abff-7a2cc0027d2b@raptorengineering.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f3bad5a8-077e-40e7-abff-7a2cc0027d2b@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/07/2024 10:21 pm, Shawn Anastasio wrote:
>> +    do {
>> +        rc = opal_cec_reboot();
>> +
>> +        if ( rc == OPAL_BUSY_EVENT )
>> +            opal_poll_events(NULL);
>> +
>> +    } while ( rc == OPAL_BUSY || rc == OPAL_BUSY_EVENT );
>> +
>> +    for ( ;; )
>> +        opal_poll_events(NULL);
>> +}
>> +
> Other than that, looks great.
>
> Reviewed-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks.  Fixed up, and queued for 4.20 when the tree opens.

~Andrew

