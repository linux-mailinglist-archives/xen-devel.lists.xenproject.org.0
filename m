Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161DB1B8A2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 18:37:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070765.1434435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKfP-0006Ns-Ps; Tue, 05 Aug 2025 16:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070765.1434435; Tue, 05 Aug 2025 16:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKfP-0006LM-MV; Tue, 05 Aug 2025 16:37:35 +0000
Received: by outflank-mailman (input) for mailman id 1070765;
 Tue, 05 Aug 2025 16:37:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yoJv=2R=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujKfN-00067g-TP
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 16:37:33 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b9a7d7d-721a-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 18:37:31 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-459d7726ee6so17417505e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 09:37:31 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e58542f3sm10789375e9.10.2025.08.05.09.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 09:37:30 -0700 (PDT)
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
X-Inumbo-ID: 7b9a7d7d-721a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754411851; x=1755016651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DcTrrKHCxjGpWj0rumg0FDiXmLUWF4il3f7mb5TP3tM=;
        b=ZKDSWYErL7CZ5v19TYP7AC1dgDCI0JuCQOqu9t0PapYlHj0S+xPeFrBBGdyxf9c1r7
         VlUTMMOJL0U1dpKQRwnLcpG84p+CHdOjC5Yi0Mt729ZwlY5GLg6vJycT3oLrQU4bl0h2
         ML4qyUJ3HzF4aC7wLGGjU9SVnpW5floEOR4UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754411851; x=1755016651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcTrrKHCxjGpWj0rumg0FDiXmLUWF4il3f7mb5TP3tM=;
        b=IaYVDtGClwWsBOij2Ppjx5mgbuz9gXAcrBWcZ2cBVZGHVfGVM8Jjs5zhvdIwfk7EJs
         J3phb9DXGV8nYoBSBdMSRVcRefTtncEz7xlzBmt4+V22IMlgh9IBCEC00pIxsaHG7Udj
         HIJP9Oz4DiL8hmsqJXttwhWJLN9FG4KCf5WDP6R9my0Ju3KkfSoSchtOMDtuc6BdIact
         P1LZaFQk2chNHEQO+6VZ2uiosLt4lwjLEequ9NDm5t9EBnlSo92DriVdPgN3xmKXXe9K
         pK0Nel8hISbZvDFaqmqJ6WevYjnOqJgW3hCfn3DTO6bB6SuVScQFWjCmLLk0mwIacEZq
         wlBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwTHfbPML3ArH78ao0YGTB+VP6Q+F+3W/QaAo1cTUz0KrmUhQUtnsr5REmiBrgcpovWnqP/wgBNqQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySLOfWY0dvZXMFVMCHdF1uROS0HhSHCgxItCiP3dqAGGjd4dTX
	gaUeAro4sHtdaqWkSMqhmyIvgzpDBHPDrc2OXvEi4cstP/Et9g8tabcZBmqAs8OUQVk=
X-Gm-Gg: ASbGnctQGJkWueALTK5YpaMg1C7url+8/MjzuAnWDwZesJR8+HXI7tm07LQBvR8FL9p
	9wBgXKWWZwzCzgcrY8dB3EGpwf3zcmr+seiM+m3qyHMNJ6jNzoI0RAz5xALMnv02T8E1oyT+Cmt
	zqaUAqXHTFzfpkNf9SqJ6HhF6JreqARrpaA/IBm8UJjTs3r4eetjuTU1HcIR6fi36HEM7XzeEPB
	kVdq9ZEUfDT8CGEeZMdcmEJ/yWNqrvSbs0Rm4p8RWKDFLPL3560Z/w3O9df7sUkEL6Y8iGPpnuT
	uRJ5Xkp6QvhiBclY93pBve1WwLUMmxPm23VS6TjwomEiWWnZWk9bq3jabaV29nsJZycsRjJcFPm
	snLHt3TDMYcBhzXaVDMN+KKtBcGjfVY/qfq+xurgOHH1WeSuCVe+Og0XkVdW6mUJ7tmyV
X-Google-Smtp-Source: AGHT+IHHjz5bsg0TqLNtqa9cAyBQGg/tEMn9oJQ/u5n9sIdIsm+p/d+DdO22Xpxu19u5Q+Qh9egT0A==
X-Received: by 2002:a05:600c:4e10:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-459443eb330mr95296375e9.8.1754411851166;
        Tue, 05 Aug 2025 09:37:31 -0700 (PDT)
Message-ID: <68bed4ac-aa27-41cc-b8f6-ff8483371211@citrix.com>
Date: Tue, 5 Aug 2025 17:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] efi: Call FreePages only if needed
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
 <20250805163204.3631483-2-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250805163204.3631483-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2025 5:32 pm, Ross Lagerwall wrote:
> If the config file is builtin, cfg.addr will be zero but Xen
> unconditionally calls FreePages() on the address.
>
> Xen may also call FreePages() with a zero address if blexit() is called
> after this point since cfg.need_to_free is not set to false.
>
> The UEFI specification does not say whether calling FreePages() with a
> zero address is allowed so let's be cautious and use cfg.need_to_free
> properly.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

