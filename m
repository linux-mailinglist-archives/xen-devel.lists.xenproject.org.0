Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16BF8550B9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 18:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681122.1059728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJMs-00031k-PO; Wed, 14 Feb 2024 17:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681122.1059728; Wed, 14 Feb 2024 17:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJMs-0002zn-MT; Wed, 14 Feb 2024 17:48:22 +0000
Received: by outflank-mailman (input) for mailman id 681122;
 Wed, 14 Feb 2024 17:48:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Sn1=JX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1raJMr-0002zf-TL
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 17:48:21 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d641b48-cb61-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 18:48:19 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-511acd26c2bso950025e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 09:48:19 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 un8-20020a170907cb8800b00a3d0a094574sm1753623ejc.66.2024.02.14.09.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 09:48:19 -0800 (PST)
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
X-Inumbo-ID: 3d641b48-cb61-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707932899; x=1708537699; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vxfOdf0wghA/C5YJTyJEu20TyJgflNsMVkLrPyiVqYM=;
        b=GkWZovQGopacuErvpLga9wkXIAXXqg/XXVUhcMSiQ6PNRuSCf+HVQOnoBuo/z0MIzY
         GN6WNU+n6KnVGW3Xukswqx7lmbgrunmSxGsdjZmzq5fWBfg86XFVcDLcfPTBOaZXswuj
         bFhqirTRBH+Lh/OzHxTZqG6r6/CFGzJ/4jIrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707932899; x=1708537699;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxfOdf0wghA/C5YJTyJEu20TyJgflNsMVkLrPyiVqYM=;
        b=eqZaJscPBs5Z03A+q+2+XfMjLtkhHob8pSEDHsR4atoOMTd5lLcOfg1yYHnONpNkyT
         UgNsdRwKX09VSFVdLTHo4rc5f3oVVgYDd3uUme1wKDh+O2Sw+MhGy9abe88MQFgMIPI8
         qWMaxnmvM25/utayEz1c1xX/Smv1QBCNRjE97Bp2UidoDgHB8E1QPf0FstKA8Z6Bc7Tq
         Z10k0bS3h8NIVlA7gGL+w1/h/3+HwQENWY9bVFaGE78/iZ8jIJiU6x42Jd8Dt8uP4fVS
         YtSJNKeISnKA/NJKEmXwG5Mtmwyg1zpZSkXVoclxjxnd+fY3Fcq7TZ4D5HVm0UsBmew5
         S1sw==
X-Forwarded-Encrypted: i=1; AJvYcCXxEPl2YVSu6fhbBxdPc4YWKP06hXv8bahALjkmXM7iru+8SEqxHwPfCXrlRANS6m8GqZU7s0l13INx6tchcgxCZ7m0pwPgG2rYgzMKH2g=
X-Gm-Message-State: AOJu0YzrPBZEVGzOayKYjxk3pIwf/MTF4TLgr+m8OXJdZYDc3xfX7/f5
	9vvpbrkIA7HFHgZzS17B4dL6/lDQJmNPRqkUbNyvcWRS/A1+UPMjPN7YrlncqCk=
X-Google-Smtp-Source: AGHT+IHcCsjGSYit/C03zWXaZ+zt34W2264AYLdpxnqSLBMBDoKwJuSmN+irHoRO6Jxb9OT/u5b2/g==
X-Received: by 2002:a05:6512:3b8f:b0:511:42b5:5616 with SMTP id g15-20020a0565123b8f00b0051142b55616mr3401152lfv.17.1707932899325;
        Wed, 14 Feb 2024 09:48:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUU6XyYERw9vJpORWmi4nDk9bV4b4yFrGZsy1IiB4ZDy0RD90kFYlKu1MHkcOIbzVNuq35CFh6fsZ3v7xCrZwm16CMGzVtvxSvRmQQHmKGBAnaOrgpE5W9GAq2d49DVJ+dndnF7tTZ2Cl/VsOvAUmIVsIiQg9t4Nvxx3r+l4A==
Message-ID: <4af65d74-b465-4f2b-9c4e-b1dab9a4ea7a@citrix.com>
Date: Wed, 14 Feb 2024 17:48:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/22] tools/9pfsd: add 9pfs attach request support
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240208165546.5715-1-jgross@suse.com>
 <20240208165546.5715-8-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240208165546.5715-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/02/2024 4:55 pm, Juergen Gross wrote:
> +static struct p9_fid *alloc_fid(device *device, unsigned int fid,
> +                                const char *path)
> +{
> +    struct p9_fid *fidp = NULL;
> +
> +    pthread_mutex_lock(&device->fid_mutex);
> +
> +    if ( find_fid(device, fid) )
> +    {
> +        errno = EBADFD;

Also, FreeBSD says no.

https://cirrus-ci.com/task/6634697753624576

io.c:580:17: error: use of undeclared identifier 'EBADFD'
        errno = EBADFD;
                ^
1 error generated.

Need to use EBADF.

~Andrew

