Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A809411FD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 14:35:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767735.1178434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYm4g-0000ag-AL; Tue, 30 Jul 2024 12:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767735.1178434; Tue, 30 Jul 2024 12:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYm4g-0000Y7-7I; Tue, 30 Jul 2024 12:35:30 +0000
Received: by outflank-mailman (input) for mailman id 767735;
 Tue, 30 Jul 2024 12:35:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jiA=O6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYm4e-0000Y1-Sv
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 12:35:28 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32ea0d7f-4e70-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 14:35:27 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52efdf02d13so7241527e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 05:35:27 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab50cbfsm637122266b.47.2024.07.30.05.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 05:35:25 -0700 (PDT)
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
X-Inumbo-ID: 32ea0d7f-4e70-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722342926; x=1722947726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qtq7TsueE9u8/FdZWfoI543ZcoeEgBnk907nQynhQME=;
        b=vDuR5+sWYl+vcBiC5JWO4Jq8UDsJM5+ghA4eivI2aNtYl8VPnTyVQAhMBwlXYkBImw
         nLrHwZxXOk7KTJwLBsk/OH+Udd7uabc4vDy3p7UatSByg5A9EZTzZMbmLPcEfd1RQZqs
         apb0yPph9cUCMxURYECB8FhxNPJg2PyVsTGJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342926; x=1722947726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qtq7TsueE9u8/FdZWfoI543ZcoeEgBnk907nQynhQME=;
        b=lGACZ7ypcjQf+UxyXrgPHT/2CE9rhaWHx/vhkm57wp6PbwwtF3Ooqyf/EnFxGealSD
         qS6hiysTyWoAmOh+7kyKCL6E5p4GFOk0emN/WNlyvbUfMvbHSn2UwgAHl7NJk75HbnWG
         TerF6QApvWDnS2zVXnyHyN+2I17TcZulH3hVEvctmvCAYBBgvYfCfxEebTBRKADHWPpq
         axiSqO68aZTcgeYKArj5CeJD3qNJc92mUv092NcSvb6jkdiuSYe5cA+oRqHwraUCiiuc
         8Ox0rr6H3+hMztVRtOfSxqJcj6Q98unkWhoVt4M6A9tZwmXRWz7pQvyKO18xxFP6vYhM
         1+hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB88T1wemksoYWxmghpqUv7+25m8DNi+cqhLu+hm3AJjETywIM5vr5kR9X3k3ZgXU51s6CXsPkusltu1weuxf6CQ15lYJ2EXAdgSrPT90=
X-Gm-Message-State: AOJu0YyaPal3vGwBx6mWHFTUvnkwJuLwCBubguLUqSHDAUJhII7HdDs5
	SRDWnhkQ/O9jJke535xz9yAEPXj4BFvmkVFxq+9Xj0Em3rYhzya8PT7m8JsStts=
X-Google-Smtp-Source: AGHT+IGQOFsuca8btLLS8EWo8r4Hsp71Cx4HwmYxXwM+p8dwdrMnJ3nl4YA0f4o74R8eF0uiGOltKg==
X-Received: by 2002:a19:690b:0:b0:52c:8075:4f3 with SMTP id 2adb3069b0e04-5309b2a9f7dmr8067255e87.36.1722342926340;
        Tue, 30 Jul 2024 05:35:26 -0700 (PDT)
Message-ID: <ef4b21d8-a5a9-4d24-bf18-908b5ee067db@citrix.com>
Date: Tue, 30 Jul 2024 13:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: split XSM from Flask
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Daniel Smith <dpsmith@apertussolutions.com>
References: <d7289554-258b-4f75-858b-64005e9ae9be@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d7289554-258b-4f75-858b-64005e9ae9be@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/07/2024 11:57 am, Jan Beulich wrote:
> XSM is a generic framework, which in particular is also used by SILO.
> With this it can't really be experimental: Arm enables SILO by default.

It's stronger than this.

XSA-295 makes SILO the only security supported configuration for ARM.

And since then, no-one has added LSE atomic support to ARM, so this is
still the case even on hardware which can be driven in a way which isn't
susceptible to LL/SC infinite loops...

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -768,13 +768,20 @@ Compile time disabled for ARM by default
>  
>      Status, x86: Supported, not security supported
>  
> -### XSM & FLASK
> +### XSM
> +
> +    Status: Supported
> +
> +See below for use with FLASK and SILO.  The dummy implementation is covered here
> +as well.

This feels weird, although I can't suggest a better option.

XSM isn't optional; it can't be compiled out, nor can the dummy policy,
so it's weird to call out what literally cannot have a statement
different to the rest of Xen.

Combined with ...

> +
> +### XSM + FLASK

... this wanting to say "Flask (XSM module/policy)" IMO, maybe what we
really want is:

---%<---
### XSM (Xen Security Modules)

Base XSM is a security policy framework used in Xen.  The dummy policy
implements a basic "dom0 all powerful, domUs all unprivileged" policy".
---%<---

intentionally without giving a Status.

Then, the two blocks below are clearly alternative modules which have
optionality and different support statuses.

~Andrew

