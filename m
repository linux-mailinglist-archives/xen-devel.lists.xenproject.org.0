Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA25849C03
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676067.1051886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzAV-00082B-Gb; Mon, 05 Feb 2024 13:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676067.1051886; Mon, 05 Feb 2024 13:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzAV-0007zk-Db; Mon, 05 Feb 2024 13:37:51 +0000
Received: by outflank-mailman (input) for mailman id 676067;
 Mon, 05 Feb 2024 13:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3Sh=JO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rWzAT-0007lD-9T
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:37:49 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf48ad15-c42b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 14:37:46 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5605c7b1f32so1260760a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:37:46 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 t6-20020aa7d706000000b005605ebacec5sm1316929edq.43.2024.02.05.05.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:37:46 -0800 (PST)
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
X-Inumbo-ID: bf48ad15-c42b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707140266; x=1707745066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnfkxvKA/F7T4oAMOqBwsz1+RAZM28v3kElo3Ihlm40=;
        b=N7oOqWurJC3ly7Kt9R9NDxGOf6FXOCE4o7KYqY4vicYQSll7dpEljrcrJW3uEQnHT6
         JAIupPWJrPRcOVw6AN2NM5l0bnnQXhNjczwmu3Ph4owtebWI/2WF5LK0bOx9PicOW2T0
         COeThe+QJyNvHg3uI16fPQiUtJpqcxMt3o2n0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707140266; x=1707745066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FnfkxvKA/F7T4oAMOqBwsz1+RAZM28v3kElo3Ihlm40=;
        b=sP6pUMj/YgUbA5BXjy+AyTIojshG9RetaRGIPWTEPl8a4TEJHiKkwTOSot2GpPHKVM
         Iri3eOWplDsMLJ4BBRXO1cIqwMJDMVI2wYrznJceB2FpiSjDjLz+J/9G1hEQo+0c/aSz
         c2kMv67D8lznId2ZSQpPZ18Xhc631RS+wmUoBHDiG+saIeQEruO9OU7UrsGgdjq57wOL
         74rMfp4ApaMQQmrb2z9z3JuvEazdyQUdiPUDHWuPpyDGtSDfWAdxAjELpsJ9TibgyzPX
         PvvSPw3N+6QDd4eA7ETn3ym7f6W9BL7OHnGiwewGS6P+f6hsx29IiNLzfPMw1l4nPj9M
         9cYw==
X-Gm-Message-State: AOJu0YzutLs+fUjvjenexGgcY5waPWbMZHmCYPEAxd3n4WOMIGVh7Wh/
	lUXLY+6iEHqQsb/8/HD8rBhKmiaUUb1pFAodsmVSf1T8Kpk9o40Kojv4ufExG1Y=
X-Google-Smtp-Source: AGHT+IEdjklQk1J1uFuhCunR9Omu2Q8a/zfcPD3G9knP9utjOu0NtazleXZNdCLZ6wfO+MHl9xMGNA==
X-Received: by 2002:a05:6402:2c3:b0:560:e6d:4ce9 with SMTP id b3-20020a05640202c300b005600e6d4ce9mr4074250edx.41.1707140266348;
        Mon, 05 Feb 2024 05:37:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWFkthbLqPvaJSaA9iBjEobrjoS8HfMQoyannNe3oMrwtpazljfnUWFz07v4/RZKuYqkvIAiZDSW895cSaqs07vtUKC1zlVZqgs/jX3jozoCKajdSSL/4wUjRM+iO69g1X7Gfi0sxCIphNApPG/OF/7sJcWy/w6Dj17tiS31wOiYxNs
Message-ID: <35a04808-9ff3-474d-a394-169fd787d468@citrix.com>
Date: Mon, 5 Feb 2024 13:37:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] serial: drop serial_rx_fn's regs parameter
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <df7f2df7-d45c-4c96-a84a-5ca816a5b733@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <df7f2df7-d45c-4c96-a84a-5ca816a5b733@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2024 1:28 pm, Jan Beulich wrote:
> It's simply not needed anymore.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

