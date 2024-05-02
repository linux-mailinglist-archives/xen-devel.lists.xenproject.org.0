Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6400D8BA243
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 23:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716194.1118304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2dwn-0002T3-ER; Thu, 02 May 2024 21:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716194.1118304; Thu, 02 May 2024 21:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2dwn-0002QG-Aj; Thu, 02 May 2024 21:26:33 +0000
Received: by outflank-mailman (input) for mailman id 716194;
 Thu, 02 May 2024 21:26:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/qc=MF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s2dwm-0002QA-QY
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 21:26:32 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4717131-08ca-11ef-909c-e314d9c70b13;
 Thu, 02 May 2024 23:26:31 +0200 (CEST)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-43b0b09d012so22998271cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 14:26:31 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 fe13-20020a05622a4d4d00b0043842dc662esm847101qtb.4.2024.05.02.14.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 14:26:29 -0700 (PDT)
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
X-Inumbo-ID: a4717131-08ca-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714685190; x=1715289990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=puzZpPNPRb+k9eiyXOVXkia9Jhh8mI5WHhsTAdJSu5A=;
        b=TwNK4CD5j+RWEXZfzo/tWy6Djgdibeh3GQp3+s2vAf6Gpa1S3ptwEMZbBh0FxbEdj8
         CyCUvCs5mGmOHRMX9kIBtRY6XBpvPACRaq/1Sf+9gotr6hm7UwSP7zOBNqEtCRL5Kb2g
         h9NWHwUHxxcYj56zFNDAV78o5vkLAxXKZlBcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714685190; x=1715289990;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puzZpPNPRb+k9eiyXOVXkia9Jhh8mI5WHhsTAdJSu5A=;
        b=LANAZ7ObW5dWarR5mplOTmUu2imTvCOKWU6qGq6KHYSfT0y60ZHksexhizbUxuh6+B
         5gfTyqWlPk/Ww1gebpvgnXW2nLH9RhUFfJk9KQvpAbNPAJ1lVHJRpiCJDEjtBxUFT+zr
         mh+BlhBmzipMt5pg6r1hg8W74U3wbpCQ18E3+qg4EtkhnRrZ59fluWsgt9fD+GNYndbh
         GicBOWpEkz2uqsVYWclrRcu2Q8VLm7hiOU7fj+v/O4Z966S2gZXC4YmP4qVlNHpZVv9T
         rQ5WfskjOR8ZYprkx2sWrSCqK6i58/pqXQoQkbCYyQ6x+VIdJpQuLyiIr28gB/L8yz5M
         lslA==
X-Forwarded-Encrypted: i=1; AJvYcCVa3bp/wfxc3eX8n33vdOP2KU9cYSdHQL2SeeTXaykkB/2mZSta++r7JXpb1NYHHUqF7MYq9Dn2s4xF9YUVdwbtyuW5sCK3XSQ67ZqpHJw=
X-Gm-Message-State: AOJu0YynQme3v2XgQ90fLyo/ZH6gjm/oEpE6voxoBuWzWDVBO1CzGoRB
	+SPD+vP4EU1otOycSmrF0Z+axwLu0gaAzRbIqQWZxOtyh4UDhCXNpOmtFUbnzFmlr0BhKXDcR0h
	w
X-Google-Smtp-Source: AGHT+IEQnOofbtvgxyovuEHj+AaVfJaKZ9Mk/cnvTyaAcKk0zU/yIbTZDKKFlw4TFIx5ZQl2xFleJQ==
X-Received: by 2002:ac8:5f0b:0:b0:43b:7:7d81 with SMTP id x11-20020ac85f0b000000b0043b00077d81mr847617qta.66.1714685190221;
        Thu, 02 May 2024 14:26:30 -0700 (PDT)
Message-ID: <e2eac84f-eb83-4658-9b48-6315f6418ac0@citrix.com>
Date: Thu, 2 May 2024 22:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/tests: don't let test-xenstore write nodes
 exceeding default size
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>
References: <20240502132136.532-1-jgross@suse.com>
 <3c5ea8e3-87ce-4048-a3f1-7a963706f5b2@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3c5ea8e3-87ce-4048-a3f1-7a963706f5b2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/05/2024 2:25 pm, Andrew Cooper wrote:
> On 02/05/2024 2:21 pm, Juergen Gross wrote:
>> Today test-xenstore will write nodes with 3000 bytes node data. This
>> size is exceeding the default quota for the allowed node size. While
>> working in dom0 with C-xenstored, OCAML-xenstored does not like that.
>>
>> Use a size of 2000 instead, which is lower than the allowed default
>> node size of 2048.
>>
>> Fixes: 3afc5e4a5b75 ("tools/tests: add xenstore testing framework")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Thanks for figuring this out.  I'll give this and the return code fix a
> spin through XenRT and check there's nothing else unexpected hiding.

All seems happy.  I'll put these in in due course.

~Andrew

