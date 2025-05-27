Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ADEAC4EF5
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 14:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998386.1379116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJtoJ-0007LM-MO; Tue, 27 May 2025 12:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998386.1379116; Tue, 27 May 2025 12:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJtoJ-0007Jv-J7; Tue, 27 May 2025 12:53:39 +0000
Received: by outflank-mailman (input) for mailman id 998386;
 Tue, 27 May 2025 12:53:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJtoI-0007Jo-9V
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 12:53:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ae248aa-3af9-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 14:53:37 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so45857415e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 05:53:37 -0700 (PDT)
Received: from [10.81.43.171] ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6b29633sm281869405e9.8.2025.05.27.05.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 05:53:35 -0700 (PDT)
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
X-Inumbo-ID: 9ae248aa-3af9-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748350416; x=1748955216; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jDxMqCbJ31GJsysLj04fvyIc49yzVVvkUrD0csHQrik=;
        b=jNP2WAIEvKtJuzcowbVZm3fQ+XuioeWY0HwMCLPH9WWcVKTr2uxx45wvQ0iKLhEima
         c6wEga9tKDk8xxrPmnGlwppra+fxtr7lCHYmgEBMJWAB8vGgZDLRJlBwwT8jhvG7eF43
         5KrCGIHHui606x5c12S6iMtUlmcjIE8Jgi9Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748350416; x=1748955216;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDxMqCbJ31GJsysLj04fvyIc49yzVVvkUrD0csHQrik=;
        b=iN/bOQwHPp8/HEm5dhTJHRi1k3jIRCK9KMtEYcT0vzVIpmYLvx5qrGIqnLVmAGbJbx
         hOToXg6TIYfGZ9HO70OIeZbn9WmpRcCoHXyVoDtNOdwxCP06mFwqUGCtoPE0itaUCRHi
         P97Dde9Ubpcywf/UQIzbo8cKPpKrTqhZ3EjI28sHjY5ir1+8Tx3zJM83wSea5u53XHSk
         MdLoDwoldT/YwxScTW353ykK5ekjKkD423xERkUGzPK4kWlbJwamAkMxAx/m/Jc46QtL
         G/TsEYUpLelasVoV+xotByuGUQMbL9kS4z0ikLs3kpoPiaoUWWELfhIY5C33Was8MkCw
         H7uA==
X-Forwarded-Encrypted: i=1; AJvYcCXN3dWC53wqnFhRbVmSDVosvpTQNZuW+WuPRVMXw7seqDqYkXcKSHHchpeih8aH2JqdWwLgLQZeo9s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyB++/60Du780eRb+OeAmsHPVbHiTg2smnY0yCjWSD+UycmxI/4
	X6IoTxRtmArSNLCIgoN9etRiP1yQhnct578YYF6KryGNkwIOJGzbuTIAHKDVC0AGy78=
X-Gm-Gg: ASbGncud/OqJFoXwk4/LMnzRAv4pO38ORLnY9JfMJvwJWpCO3WOBB7+rDM1yCjRwhB9
	+85nuEubdFWEwBRFu/+ag1giuMcXcNuPsAnvJjsdYQV/0G5KocPG61OOIRwlqr5G2NVu8+zzKYN
	h0GBrcAt2OQEXmOtFhrT87AUWRDn32317JZwtVOX1HULbTFFI3zvRvJK/1FIPIV4CYUPTRUO8EN
	bCiaNsjYDtCTPECzjemTWLvmmwS8O5LBKtC3C4BR2JRyAlJxNj5ZOY3G70/VJb2fwgrQygYwnRj
	dwclarGPIuG4Z/lOFsoHRdHWJHH9Ba/ziRbJ1GcP3pzcyElb4yqvey+Oc7EvUg==
X-Google-Smtp-Source: AGHT+IHZ18+0WLyq2lWNQ0tbsHv2rtYT4Rkp8J9sAVYbYze0jr/srmFucbmheW5Kwm5bRqWhmzBdkQ==
X-Received: by 2002:a05:600c:4e0c:b0:442:faa3:fadb with SMTP id 5b1f17b1804b1-44c917f3ea8mr133628375e9.2.1748350416322;
        Tue, 27 May 2025 05:53:36 -0700 (PDT)
Message-ID: <b19800c6-ef39-479c-a320-f2eabf546bf6@citrix.com>
Date: Tue, 27 May 2025 13:53:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ACPI: move scheduler enable/disable calls out of
 freeze/thaw_domains
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <974033e9ff0df3ce8a74efaa33f1cee1dcbdb030.1748340071.git.mykola_kvach@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <974033e9ff0df3ce8a74efaa33f1cee1dcbdb030.1748340071.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2025 11:04 am, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> The scheduler_disable and scheduler_enable calls have been removed
> from freeze_domains and thaw_domains, respectively, and relocated
> to their usage context in enter_state. This change addresses
> the concern about misleading function semantics, as the scheduler
> operations are not directly related to the domain pausing/resuming
> implied by the freeze/thaw naming.
>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

FYI I've kicked off a run with this patch:

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1838715729

which includes the real suspend/resume testing on several pieces of
hardware.

~Andrew

