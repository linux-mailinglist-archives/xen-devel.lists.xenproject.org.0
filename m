Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84556A7B029
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:10:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937298.1338304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0RpJ-0007WL-6Y; Thu, 03 Apr 2025 21:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937298.1338304; Thu, 03 Apr 2025 21:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0RpJ-0007Ux-3d; Thu, 03 Apr 2025 21:10:17 +0000
Received: by outflank-mailman (input) for mailman id 937298;
 Thu, 03 Apr 2025 21:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0RpH-0007Ur-SY
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:10:15 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 087e501b-10d0-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 23:10:13 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43948021a45so12891115e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 14:10:13 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d980sm2752115f8f.61.2025.04.03.14.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 14:10:11 -0700 (PDT)
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
X-Inumbo-ID: 087e501b-10d0-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743714612; x=1744319412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TW8Oroj/D4tDzD3qVELBJ6TjX64+nF5h2ffccKh1nBc=;
        b=anjJYv+YOa874TnXkyG1AtUEUVi2+d6BtOHJSD/SvcnmfVGv1EzSP7hpLn25Ils7Q3
         uBE5JpALugzacA6i69vDubg6mgxvZfbeIs2wa9fQA538E0tFx+15b4KUxkrPTgbSNbTx
         2lkiKrDRsinelQxsRy9jRQ0GarlNvl9VamIhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743714612; x=1744319412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW8Oroj/D4tDzD3qVELBJ6TjX64+nF5h2ffccKh1nBc=;
        b=ooH/sawsXohJHoq1JaioM3FEDUE90hDAAVnROhl75TpK995VoVYx7jv3lWJo9rg+jM
         FF541ARVSibGa13Hq9bo1Q7Lkjye3/ZvqIf9RI2edfRdCl1korzmRI6sh51aBVD3ZXx4
         x0tQpXdyRzraLTfPhgo1hIO5yrZ7YtttZmeD0OvjYJQ8eiHpPujJXfGIjHn44gwoe38+
         UhnqgvAK10SvWayGFPRZWWLpJ2UqNmvcRS7gTYHiCdD1Q3N0y1Ph3KC60KHy2hgOTg2w
         EPM8VCn/Te8t1IcW1LTHh686EaTp+olZS8ApQaR8gazd5cnAdIusmlhMC4yZGdyvVlQ7
         +95w==
X-Gm-Message-State: AOJu0Yw28TWaBJTSFMbcVAQXdtG8P4tepoHqWWGqqJKyWiIyjbD+/JOK
	dCE3KC6a309MwyjCnTeVJEcRebwKbD0RZBPXvg5yfqA4DcxOIfP67C4o/Dnk/OY=
X-Gm-Gg: ASbGncsiv9FatxpjT36ioWpmWfPZj28zCUAbjiSsxMMtvv+KFJtFJ10a60CTNltB8em
	cepMN8SYwuftq00TxWULSIuj+CGQ4azwX3HmtwxruWsj1dsbqbhx9AfrLlNYMrg0P2hULbzetHG
	kolXXUeRMUcUO6gJ7ICRFKDuCz/Wl1hug6Cx2Zq4iCL4KdO6TUG4WamZTcLbVSdZEOf0isaZhfX
	3TqBbcJzrbwjjv8SHMWSxdU4oP4HmTBk9so7amSw9rZ85MfjKPYEVuln/OCXBN4MNJk1omIdhMk
	asWRUeng9RgxCW5i7IyFY2BwMZGwyGSiTHay05JBLzOBxGwVLREahIHjxSLGcsHOpjqkWuIb4Vt
	uT0gFlgwtWg==
X-Google-Smtp-Source: AGHT+IE9J3Y7cAR/abYni8N7xA7IBS/suZQtN0NT21A9PxblcnyN9Cp+qvzPooiTan7B97n31YW9DA==
X-Received: by 2002:a05:600c:3d94:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43ed0bc8d58mr2542905e9.11.1743714612399;
        Thu, 03 Apr 2025 14:10:12 -0700 (PDT)
Message-ID: <99c9bfee-cf7a-4a38-a3bd-2475197ba3f7@citrix.com>
Date: Thu, 3 Apr 2025 22:10:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Swap 'const static' for 'static const'
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, consulting@bugseng.com
References: <20250403204301.1658436-1-andrew.cooper3@citrix.com>
 <5e92df092cc323b061716004fdd41c33@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5e92df092cc323b061716004fdd41c33@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2025 10:04 pm, Nicola Vetrini wrote:
> On 2025-04-03 22:43, Andrew Cooper wrote:
>> MISRA C:2012 Ammendment 3 (which is under consideration, but not used
>> by Xen
>                ^ typo
>> yet) is more particular about the order of keywords.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Any specific reason not to give [1] and [2] the same treatment? Other
> than that, looks good to me.
>
> [1]
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MISRA_C_AMD3/X86_64/9616508934/PROJECT.ecd;/sources/xen/arch/x86/genapic/x2apic.c.html#R4145_1
> [2]
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MISRA_C_AMD3/X86_64/9616508934/PROJECT.ecd;/sources/xen/arch/x86/hvm/dom0_build.c.html#R13937_1

Oh, inattention to detail with my `git grep`.

I'll update to include these.  Thanks.

~Andrew

