Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9ACB2375B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 21:10:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079135.1440102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluOV-0003BC-4h; Tue, 12 Aug 2025 19:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079135.1440102; Tue, 12 Aug 2025 19:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluOV-00038s-1v; Tue, 12 Aug 2025 19:10:47 +0000
Received: by outflank-mailman (input) for mailman id 1079135;
 Tue, 12 Aug 2025 19:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BkKW=2Y=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uluOT-0002eX-Kh
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 19:10:45 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c1a90bd-77b0-11f0-a328-13f23c93f187;
 Tue, 12 Aug 2025 21:10:45 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so3778217f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 12:10:45 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4530a8sm45046198f8f.38.2025.08.12.12.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 12:10:44 -0700 (PDT)
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
X-Inumbo-ID: 0c1a90bd-77b0-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755025844; x=1755630644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gwkf35IKqMkIlNl9yA5fGHvhKn8wkfiIrpd1gBUtckU=;
        b=Z9SXSyu3oHwiQ3rI56rdlgDpQWk3/SNj9BCpmD5SUd+WiMq+R+VcmIJL7i3OOUFsC+
         AYfMHCXA7Jl0tGIVdHL8PFPj4HJ46H7PlNoBs5YLlHN23b+iy/F2uwn4Bu7ypU7OBOO8
         1kvoZtpDTeuCv+/OSlk0wCUll83Z8CinkeS1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755025844; x=1755630644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwkf35IKqMkIlNl9yA5fGHvhKn8wkfiIrpd1gBUtckU=;
        b=mNP45hCrhepnd+PJhVGk9h+q4zUHzxNNG/qXq4Ggk93duTTF0QdfoRNucWu0OFQpc7
         xQVZEeUSpI307jVsWo86xfeY7i0mAi0wImsJBs6FwzuYVAQ6X2VPTDRMb7giQdH57L3V
         mSqMox2ozJ8sNizXFe3flw7ToIKyKlsgzJrx/VZrM6+ZC/czjQUs6wp4e4Nsgn+EbVK/
         rl3lxbwfJxHmwMr+wWjMOuKGr6bxfuCxA83hqQkLR1+z/trSKgpwBDBhUU5vX+kNLEL1
         qO0pxkYrYvffBBV3okMrboEgaYF6P2xhDSLjsWE0yu8h/WqNCva0legtvxcX8A5Kr6t8
         uMnA==
X-Gm-Message-State: AOJu0YyjgWDNKYutvT36WJnCIeibJDExeTCoDOfQVI2vb37/XgsB38mC
	XbVvmsJfiGvq+788pSoqAmACKecYIs9bnbIyOD2VhnaSUMVrk8T+GcyyKL7Fm0BZDBU=
X-Gm-Gg: ASbGnctZR6FYt6tXEUTNi4ppU+JqGHg9Yjm4bJT+Cim8LaT1eC2zEyzfSLtPw3YiUzd
	i/Ihl0airnh4TEQBH/vM/TysizVkBIlF3xFGN+vNcbCqvjAxEBT8Buz5In+fQYmkA/uW0vBZgcA
	spuUvv50x4Sfak4+rsGQQ4iJltsiFn3XrwRxhNVafsaXAhyN/mm1cgDPDt/dRN1ikVKPif/aDOs
	Gz2GQvaGTBCjaQqEcT++U1Qs2VaRTAyV5f2d98UsLfQAIw/vUtaU+4Y/+qtX/eOcHUOGbWfMCXO
	WXDAy7VEuU4Sn/5S6RMJorgYCjDZl1vwi1GOBpi2Zwb47K6xIFD8BogtmbEDnSNRxShK1STVaK/
	t6QtS6yXg94HuQfBvvqxd9/699LLDu69GoSZIaXgNrm3xQRLbqhECVObGgSESgD6fpPlu
X-Google-Smtp-Source: AGHT+IGLEEproL9S5eXAiaagxXJyixn2MGxqc8jZjqWJG1RF9GzyvXfDla4rq9zKQC79nfzUmSN/FA==
X-Received: by 2002:a05:6000:1a8b:b0:3a5:39ee:2619 with SMTP id ffacd0b85a97d-3b917ebb5bamr97068f8f.47.1755025844442;
        Tue, 12 Aug 2025 12:10:44 -0700 (PDT)
Message-ID: <c435b168-888c-4953-97df-2bab8f9e5e02@citrix.com>
Date: Tue, 12 Aug 2025 20:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Turn debian/12-x86_64 into a non-root container
To: Anthony PERARD <anthony@xenproject.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250812162950.1903901-1-andrew.cooper3@citrix.com>
 <aJuOP52xGg8hUN_H@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aJuOP52xGg8hUN_H@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 7:55 pm, Anthony PERARD wrote:
> On Tue, Aug 12, 2025 at 05:29:50PM +0100, Andrew Cooper wrote:
>> From: Javi Merino <javi.merino@cloud.com>
>>
>> Since commit 4611ae6fb8f9 ("CI: save toolstack artifact as cpio.gz"), the
>> various automation/scripts/* no longer need to be root to correctly repack the
>> initrd for test.
>>
>> Signed-off-by: Javi Merino <javi.merino@cloud.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>
>> Xen 4.20 and later uses debian:12-x86_64 and also contains 4611ae6fb8f9 so
>> this is safe to change generally.
> I gave it a try, just to be sure:
>     https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/1980442689
> and staging-4.20:
>     https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/1980621317
>
> (all the failed build should be because I was lazy and didn't rebuild
> all containers or didn't select a subset of the builds. All test passed
> or are skipped, which is what I was looking for)
>
> So:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.  I'll commit and deploy this now.

~Andrew

