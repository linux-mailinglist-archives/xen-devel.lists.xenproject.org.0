Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4331080DA96
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 20:09:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652499.1018372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rClf1-00040o-Nz; Mon, 11 Dec 2023 19:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652499.1018372; Mon, 11 Dec 2023 19:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rClf1-0003yE-LD; Mon, 11 Dec 2023 19:09:47 +0000
Received: by outflank-mailman (input) for mailman id 652499;
 Mon, 11 Dec 2023 19:09:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O2vV=HW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rClf0-0003y8-0M
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 19:09:46 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d77b91f1-9858-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 20:09:43 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c0e7b8a9bso61501415e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 11:09:43 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k42-20020a05600c1caa00b003fe1fe56202sm13793951wms.33.2023.12.11.11.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 11:09:42 -0800 (PST)
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
X-Inumbo-ID: d77b91f1-9858-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702321783; x=1702926583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ugMp53yu5NQP2c9KbHSQSEGZHGWXUwREvhXL0oUC0CY=;
        b=pqbSmbN7By68XyOT933uj/fxbH9eTbg7ROJu3EwEEka7a7YKlh9qB3ykgPJcGD3gOc
         8wydCfZ0XWY1qxH1h2iyNy7pSKpuNDppnCamJdxxdYw2euYVIFfZv2SVtzLgr515aICB
         Gdt+7hrA2uSPJJ5Le7FZive2Qt0tmdyH942Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702321783; x=1702926583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ugMp53yu5NQP2c9KbHSQSEGZHGWXUwREvhXL0oUC0CY=;
        b=CgzBG28QvSfj/jQBK5+KwVFgTv+KWU44FigGlU/Oy7DwEepezZxgZreL9wpTVRKubl
         5KiccvNvNXrrWrL7hpWxAVMvLF96J7zr0QXx2qhnvYWZNbvO+E9kNFfTYv8hStoXZh5n
         HqsPboq2ZRDEX4blVqNvHeVd1dbmAni60kvcW2JfS8eJcI0wAO4eq4PFz77oSC82HTWS
         NhP5kLBg3EiI4Mj/KsZlloP8tO85/l2veYaIpYCHK6jPmAdR9WPFpl9BNW9gUtCezOxt
         52Kns4cVkwZLpTOfPcQRjVthZWrxO14hhlzYyO/8RCA07tXxGZUo6wpqoaJmC4zc0aZ1
         GPGA==
X-Gm-Message-State: AOJu0YxvQ+JMWp6xdxrTQuKUZOUJjraQvSKFRoBPuZXgKFsQFrOzWH0k
	TKga1agjsN5MkIZFlLDEtxCOFQ==
X-Google-Smtp-Source: AGHT+IGSJVAG4qxJZxjgKWk72mDzk4vN+w1NQpTytT0pp/BuwD0Z9MfItWG2RoK6CMX6wHINTpNpxA==
X-Received: by 2002:a05:600c:3107:b0:40b:5e21:dd26 with SMTP id g7-20020a05600c310700b0040b5e21dd26mr2684914wmo.84.1702321783032;
        Mon, 11 Dec 2023 11:09:43 -0800 (PST)
Message-ID: <1381882f-530e-4fff-8a53-83665e84fcf8@citrix.com>
Date: Mon, 11 Dec 2023 19:09:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/pygrub: Drop compatibility symlink
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <20231123163023.2158134-1-andrew.cooper3@citrix.com>
 <761cd868-10f7-49ea-ba3e-ba61bac5ce83@perard>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <761cd868-10f7-49ea-ba3e-ba61bac5ce83@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/12/2023 5:07 pm, Anthony PERARD wrote:
> On Thu, Nov 23, 2023 at 04:30:23PM +0000, Andrew Cooper wrote:
>> This was declared deprecated in commit 10c88f1c18b7 ("tools: Install pv
>> bootloaders in libexec rather than /usr/bin") in 2012
> This commit only speak about wanting to deprecate the full path to
> `pygrub`, and calling something deprecated in a commit message alone
> isn't very friendly. But there's a better commit calling for the
> deprecation:
> c31d6a7ee2ea ("libxl: Warn that /usr/bin/pygrub is deprecated")
> even if it's only in a libxl log message at run time.
>
> I hope we have a better schema to deprecate things.

Oh, I'd not even spotted that one.

This patch was actually triggered by newer versions of RPM objecting to
absolute symlinks.

>
>> Take it out fully now, 11 years later.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Beside the commit message that could call for a better commit, patch
> looks good:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.  I'll adjust the commit message.

~Andrew

