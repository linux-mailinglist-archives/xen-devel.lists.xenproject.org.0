Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026C4B54A29
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 12:45:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121796.1465880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux1HI-0003x4-36; Fri, 12 Sep 2025 10:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121796.1465880; Fri, 12 Sep 2025 10:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux1HI-0003ux-0Q; Fri, 12 Sep 2025 10:45:16 +0000
Received: by outflank-mailman (input) for mailman id 1121796;
 Fri, 12 Sep 2025 10:45:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux1HG-0003ur-EB
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 10:45:14 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fdf6f9b-8fc5-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 12:45:13 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45b9853e630so15579835e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 03:45:13 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd0a7sm5996429f8f.39.2025.09.12.03.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 03:45:12 -0700 (PDT)
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
X-Inumbo-ID: 8fdf6f9b-8fc5-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757673913; x=1758278713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+SerKqr29Yusp9y32AqQh/jGFD6z1ygWrvyt8tzKHQA=;
        b=Os12OWjCAFzRgREs6fjfvQdEaj2z9QPS6mLlwprUYv09XW0R6EAb0lcfIAwMjfCBz/
         RSQ1HyS1tb1UPxVDGTHnSLlZd6W8r6aGuJYOlCDp42WE50qqkXPvSrLdbaG8TAcHeC4x
         3vHPX5eSJHXVw8EgnT3P8Ln8RiyyAIZY2wZMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757673913; x=1758278713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SerKqr29Yusp9y32AqQh/jGFD6z1ygWrvyt8tzKHQA=;
        b=SxCpKcJTBP9SAu9SmLZxan8GfFDVme+qqPREV4H31D9VSTCjiBvhCaXLM4NbG+doXM
         saU4czFhH2MJcWQwv0awqUyW4ctfuYNShcVoUfwdWSsWlfvRuHqMFAYf3ohU4CpkHXSI
         zJent0eeR2tsNl0//jBz9C/D1CRVjh1TiDfVCgDkFzKKxHYnC+qv523aCrw4QkSpexyh
         h+F47NLidhsA6nxshSjSeUqTB+aA4N0t55P92vl075SxqIUzLRWgjcPg6Jx582CWDVyX
         J8gG2eNT339/QRyKLKZJFdB2iomsSFFS6JWep2o9LdLCk1Lk48bcCq6NDrhKQD++girl
         FzwA==
X-Gm-Message-State: AOJu0YyfANc0DwiuI1mGW7eKKPoT8RHOVDnuAKx6icoMmgp/G/bPSxOt
	8PqepeHOGHVNOORue1jcqOXyiFYFnA6rnb+Y6rZL3g3NuLfZ45PwzqNk5SVIgqD1kcQ=
X-Gm-Gg: ASbGnctGURQQ/mEs6DQ67Wm+XnH98HkUvtPsU3MwGa4cUSf6PL0G58AatCfHutoP4Hu
	kiJn8A9bdelk6asJjmW7G273VjKuk/hEy5JlIrPIfRVHIpLHpSqu7v7bznkOAN32JY1bKRxsEME
	OBDSwbr23qimlci0NcQJhhWdpwPWEEzjMH7bwjBXk7OpF2tRyRsi+20/2by71F687ygXoC+MZKV
	KfbqV4ndusKiuf9gW+UL01Za6E1MMgaKJihDRBFRbw7RMog0DdKIqFZlfIlXIUsqrLCjBeB/fNt
	DadIWgrxQw4wZ5saKi4LTXeyzFHVaRAcEcfovncRs2keDScQQuAYgjDTKw+PJ0mIbGiJY6l0Pqi
	V1JUxMWiZWPaqvE+iIleMq5WA4K8cyecZH7kNe2uXPvMybPhUwedZWBvonCAP7Ol1drOe
X-Google-Smtp-Source: AGHT+IE5rf4mYeX5A/w4dbxr3y/pBz57ItSkxCCGExoopy9i+GO+g9OS5noavYIsUUwaAHBMWa9VJg==
X-Received: by 2002:a05:6000:471c:b0:3e7:b3de:6895 with SMTP id ffacd0b85a97d-3e7b3de6908mr683473f8f.16.1757673912860;
        Fri, 12 Sep 2025 03:45:12 -0700 (PDT)
Message-ID: <69f88053-9aa3-43ec-bae1-fd762f6a4522@citrix.com>
Date: Fri, 12 Sep 2025 11:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3.5/5] CI: Make qemu-smoke-x86-64-gcc-efi compatible
 with Debian Trixie
To: dmukhin@xen.org
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Victor Lira <victorm.lira@amd.com>,
 Denis Mukhin <dmukhin@ford.com>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
 <20250912011534.1889763-1-andrew.cooper3@citrix.com>
 <aMOHxLQd7y01e9FY@kraken>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aMOHxLQd7y01e9FY@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2025 3:39 am, dmukhin@xen.org wrote:
> On Fri, Sep 12, 2025 at 02:15:34AM +0100, Andrew Cooper wrote:
>> The OVMF package in Debian Trixie has _4M suffixes on the files.  Have
>> scripts/include/xtf-x86-64-efi check for this before falling back to no
>> suffix.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

Thanks.

Testing revealed that I also need:

  -drive if=pflash,format=raw,file=${WORKDIR}/OVMF_VARS${suff}.fd

because the cp has ${WORKDIR} as the destination, so the file retains
it's source name.

I've folded this fix, and
https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/11334759836
is happy now.

~Andrew

