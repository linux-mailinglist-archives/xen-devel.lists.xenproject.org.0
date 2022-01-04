Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8B483DF0
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 09:19:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253026.433981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4f1i-0004DY-0P; Tue, 04 Jan 2022 08:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253026.433981; Tue, 04 Jan 2022 08:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4f1h-0004Bk-Ta; Tue, 04 Jan 2022 08:18:37 +0000
Received: by outflank-mailman (input) for mailman id 253026;
 Tue, 04 Jan 2022 08:18:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BGw/=RU=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1n4f1g-0004Be-Kp
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 08:18:36 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8de3217-6d36-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 09:18:35 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id o30so20179153wms.4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jan 2022 00:18:34 -0800 (PST)
Received: from [192.168.26.12] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id m17sm41615338wms.25.2022.01.04.00.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 00:18:33 -0800 (PST)
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
X-Inumbo-ID: e8de3217-6d36-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lbXqZVNJvY5+kdPmrg3YYJtBkJnqT/DS0rv5v+un5OU=;
        b=iSzzEfXjnRxWfOz1EL4Ye/iW9Gg0emidMI9GL+af+FHIAC6GBtwgvkfkeQzGYgpgVX
         jpiy9LAkHRyo/X4gsNnc7pGwD3En6XxvgHRlkpdcVGcxpaKg4XBitB3lPjsc5Uv7LtaE
         NecQAdR8mxfkay5ScWRy60o+XyXdS6Z3vK5CwxjQjlYJyWcRlK1oqqsc6LGqn7Ax5gTK
         ZPSumm96FwwAcU3ntw73fxSouAQXA2Ihk/YmWOA14zBILVPe4lQTnWxyjyO0uI+CzJoX
         vVx9DeNZ3V+6uhw+gj/ffangdaA0tqtSliYHVYEF8DFI7osIRsxsJR96mj7b0IMQrUFK
         7QGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lbXqZVNJvY5+kdPmrg3YYJtBkJnqT/DS0rv5v+un5OU=;
        b=2f3O2AnQatirRO4cIG2vGlHMkTabSQ9JIdfw8m7jl5ghgc2RO/JHBsGVEtkKbRIBBj
         zp4Cs7jmH6b2zTslJJ9lZod5CeTuRG7vBAf08lDH3vFkWQYMV1caXh9AILVaB2mxfAFi
         pLyMxpCitHZq/s742ReinrZKMW1Sfp5VNGLh4frk+rWTLZi1HDwQuWuCePDn8EgWFvpz
         kqB2hd27z8oGW5gjJOyZP1jiojrOL4TYa0hfsJ/9c2Okz4jJPNK3M60/yCthkn1e26F4
         CuHearQ+V95hbvHtbgau8/tm64z2p1m8tb9HOl/PHRoPyQupuqyuQILqsZ7pi5Ho5bA4
         j5PQ==
X-Gm-Message-State: AOAM5307EiLicTasq/lhMJpmHKOfNcSOBOdftQe3eB1DztnNLrkeQ2Kw
	04K5kJBbNflCoI/ttS9wR6Y=
X-Google-Smtp-Source: ABdhPJy5/c6Qoz7DWoPIiBm0B+s3BMmRhhgB2IGPEXe60XakRIQJaCYhjgFDANVsCPYUIEojQ80+rg==
X-Received: by 2002:a05:600c:384f:: with SMTP id s15mr42391165wmr.179.1641284314091;
        Tue, 04 Jan 2022 00:18:34 -0800 (PST)
Message-ID: <eac0e202-2567-548d-1574-b8f231990cae@gmail.com>
Date: Tue, 4 Jan 2022 08:18:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Reply-To: paul@xen.org
Subject: Re: Ping: [PATCH] libxl/PCI: defer backend wait upon attaching to PV
 guest
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <stefano@stabellini.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com>
 <5fcd3250-03a5-aa91-ec8b-9a891958134d@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <5fcd3250-03a5-aa91-ec8b-9a891958134d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2022 07:53, Jan Beulich wrote:
> On 14.12.2021 08:49, Jan Beulich wrote:
>> Attempting to wait when the backend hasn't been created yet can't work:
>> the function will complain "Backend ... does not exist". Move the
>> waiting past the creation of the backend (and that of other related
>> nodes), hoping that there are no other dependencies that would now be
>> broken.
>>
>> Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are reflected in the config")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Just to make it explicit: I have no idea why the waiting is needed in
>> the first place. It's been there from the very introduction of PCI
>> passthrough support (commit b0a1af61678b). I therefore can't exclude
>> that an even better fix would be to simply omit the 2nd hunk here.
> 
> Anyone, be it an ack or an alternative?
> 

You can add my R-b FWIW, but of course I am not a maintainer.

   Paul

> Jan
> 
>> --- a/tools/libs/light/libxl_pci.c
>> +++ b/tools/libs/light/libxl_pci.c
>> @@ -157,11 +157,6 @@ static int libxl__device_pci_add_xenstor
>>       if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
>>           return ERROR_FAIL;
>>   
>> -    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
>> -        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
>> -            return ERROR_FAIL;
>> -    }
>> -
>>       back = flexarray_make(gc, 16, 1);
>>   
>>       LOGD(DEBUG, domid, "Adding new pci device to xenstore");
>> @@ -213,6 +208,9 @@ static int libxl__device_pci_add_xenstor
>>           if (rc < 0) goto out;
>>       }
>>   
>> +    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV)
>> +        rc = libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected));
>> +
>>   out:
>>       libxl__xs_transaction_abort(gc, &t);
>>       if (lock) libxl__unlock_file(lock);
>>
>>
> 


