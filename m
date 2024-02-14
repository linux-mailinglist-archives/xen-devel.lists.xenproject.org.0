Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A86B855088
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 18:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681116.1059717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJFQ-0002JK-Sg; Wed, 14 Feb 2024 17:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681116.1059717; Wed, 14 Feb 2024 17:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJFQ-0002HD-QB; Wed, 14 Feb 2024 17:40:40 +0000
Received: by outflank-mailman (input) for mailman id 681116;
 Wed, 14 Feb 2024 17:40:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Sn1=JX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1raJFQ-0002H7-4N
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 17:40:40 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ab6d35d-cb60-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 18:40:39 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3d01a9a9a2so232713166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 09:40:39 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 vi16-20020a170907d41000b00a3ce31d3ffdsm2365838ejc.93.2024.02.14.09.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 09:40:38 -0800 (PST)
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
X-Inumbo-ID: 2ab6d35d-cb60-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707932438; x=1708537238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aQhl2xza4kDvBJT8FjINNxnWqWGuSlxm9Fy5soVkgw=;
        b=ad5+Q5bGEdnWshFtiLT9/RJyDkjH+Lu745byYwUS3D8WF6ywOvVtATbhwPDyMAaYHw
         KfU4ZilmWLj2rZRGfEEcKI5oKwR6BS2z6NlqQpC3qstAxKy0eUVQ7m0g0oq1TcTYZYuu
         NLa/OW9H11/ZGDkqdM1CKV8hv9PJYNTHSxlNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707932438; x=1708537238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6aQhl2xza4kDvBJT8FjINNxnWqWGuSlxm9Fy5soVkgw=;
        b=T1qbQZqTWHQWmULqPPMf0KvLPb+huIQCHzawI/iaCCOe53rtZSlwZzhvw7vxjLFgaW
         dVKEZWQgaJPkfboUGx2hvGFSAJeizRuVOKP0JXprMFw4jEgGZQ1B6XCo2hw9WKXdqHnw
         CPuEDwlWM5qEoF8G2qXto+f0INhgu2HQF1cZ5BS38i4C47JZx8sTKvPHaTZh3xmP+/ih
         5B9gz0aE/R9c92syWqnlbGNgdkVB0dll06A8B+cJr/DQNJf9srzwuJQE+Ofy0AGfrRJY
         OG4/c4hSGiFJqX/jgAJNrioI0g/AZ1cL63sycw/iw/Ne91082fFMLP2qPeLqlQaoUBTR
         CE2g==
X-Forwarded-Encrypted: i=1; AJvYcCWmBfXfj6jSv1LlN1KzhzZ6hStWiPt/fzOWNITqugYXKqAL0uLt8rKvLFXdNnAuSBPjAueDZQY0iQNcMs+2aI3nXr96pDeJpK2SRl4ObJk=
X-Gm-Message-State: AOJu0YwWMrRxK6QAhQFGiETM947Pn1nLB1aPOq96ytOugLurbdjDqrOg
	X/Hf9TTtlp5z2C5uP05fErQnCPfr/ot8e1zBqAZtoyJJ1GNNzI+DsRF4GAfBDiTtUilRCTFkIvi
	p
X-Google-Smtp-Source: AGHT+IHHHayKrVIUAC/GRYv65r4Qcoqr/R2fQt0T6z9BTgKrggS1InhOJvMWu3MQ5zpDeQko+V0XnQ==
X-Received: by 2002:a17:906:6606:b0:a3d:11a4:6f90 with SMTP id b6-20020a170906660600b00a3d11a46f90mr2166833ejp.43.1707932438534;
        Wed, 14 Feb 2024 09:40:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVyP7Yi/LGMnS+Lq1JxwBm5l/IasMJpl/BxowRmPay0R/i7FL8J2tObgihqBmArhdW5jhMhHkLbJd+AQArSMFcU6BJwPM8ZlZEec1iV9NPhTD7uv2Z2xo8DuHlrv1nCUfYixenVHugV+4BacMkFieeXjE74KZ8mkyEU2Fs4OQ==
Message-ID: <a628abf7-a04d-4c32-ad49-a2fe073f3286@citrix.com>
Date: Wed, 14 Feb 2024 17:40:37 +0000
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
> +static struct p9_fid *alloc_fid_mem(device *device, unsigned int fid,
> +                                    const char *path)
> +{
> +    struct p9_fid *fidp;
> +    size_t pathlen;
> +
> +    pathlen = strlen(path);
> +    fidp = calloc(sizeof(*fidp) + pathlen + 1, 1);
> +    if ( !fidp )
> +        return NULL;
> +
> +    fidp->fid = fid;
> +    strncpy(fidp->path, path, pathlen);
> +
> +    return fidp;
> +}

GitlabCI has something to say about this. 
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1176787593

I think they're all variations of:

io.c: In function 'alloc_fid_mem.isra.8':
io.c:566:5: error: 'strncpy' output truncated before terminating nul
copying as many bytes from a string as its length
[-Werror=stringop-truncation]
     strncpy(fidp->path, path, pathlen);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
io.c:560:15: note: length computed here
     pathlen = strlen(path);
               ^~~~~~~~~~~~

~Andrew

