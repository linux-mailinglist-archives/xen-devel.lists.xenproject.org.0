Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA59A1CEC9
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 22:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877349.1287503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcA4V-0007uA-Ll; Sun, 26 Jan 2025 21:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877349.1287503; Sun, 26 Jan 2025 21:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcA4V-0007rz-Is; Sun, 26 Jan 2025 21:21:35 +0000
Received: by outflank-mailman (input) for mailman id 877349;
 Sun, 26 Jan 2025 21:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tcA4U-0007rt-8C
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 21:21:34 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83cb84d4-dc2b-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 22:21:33 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2161eb95317so64871125ad.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 13:21:33 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da4141e2dsm50143635ad.124.2025.01.26.13.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 13:21:31 -0800 (PST)
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
X-Inumbo-ID: 83cb84d4-dc2b-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737926492; x=1738531292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYxKemM/xZvwRVD9aoAgaA6gwfgdoNiv4c107IIPZT4=;
        b=k4v/goeUeTgNYUVg2wwUF9pfXnOekRpLQzzLkXDtamao/6hoeB/9NgMXmNuOORGoi1
         tbKmALFUizZAzJl36C0yfPK7+ohHmsupQCiTqP5Ibw8ISsPtHIy644gpp8DoMtUeKxL3
         zbAPVxA7KQEHTD0pO5VgSWdVdMpLVx04W//z5PkZLsWNtrkIgNsYk03TfjvlMGmYbh1R
         cQVMCIipTA5VX/1l3eVbhBWEJGQitpNYZdR7fT9/he3+1XB9Z2905F5Bi/VSSuRiIrfl
         0rnBB81ud00lAIZklC7gDHrVawU/eVXt6be4/yJJHtgotCV65rFAQSmP/LoaiJrkGJA7
         tcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737926492; x=1738531292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYxKemM/xZvwRVD9aoAgaA6gwfgdoNiv4c107IIPZT4=;
        b=u4XQM6s0Cs67Z2zTQgRAmyeTJx9pgCO/FYzazi3+l0eTQwnx24AhOFdcwhnEwF1UJz
         OtEXcshXHnJUk36BeIRYcEI5LMdh9Csuw4pyp2ZaJ6QzBp79R4HoH16qjA+CePqwU3eO
         CVEUJ/evjCeNFc4EWyNH0iktqC7JTNeEm8fg/xfi0AVG7/0wO8WQiqQ3zzh+ZBfxmARS
         JCTAhv06TY8wwWCgRMyAHKVt/cz6i77iEDCmwU1+IOwXiNDW2AwxfJTF3+rjywsLhBNQ
         gtc3Nx9tQxd4PjZE0595YvecA67xt1NJQ2Dg7KCRRw36zPYy5K1+exo2BbD2s5jWZX43
         QyRA==
X-Forwarded-Encrypted: i=1; AJvYcCXPOhzYubAmqqglZgWppZclAz84O8vl1fCDZ+urg/lftOrJ6dkojFdFbHqZxp5Vm2QZFdrIzHWPR5I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6/XQcW7da49v8w7TbByavAyGdRNXGy6BZRDYUEpCwoouSIf0e
	GJh0BpEWf4b7HqWj+yNnmL0DNU69WKlR9U2s4cBeucSQXiZ9TIYY7lijMv398HM=
X-Gm-Gg: ASbGncsoLwIaizblLwFKoUPbcelpta1ssqPFUknurZxCukz7uXNPdiBr/L/vNnLwQdR
	4qnYQA5cCvJmWbxfXPXym1RmDCUmlHt7Kr1hbMpRTN0Ks3GS7YufpubPZWHL21klJTgcbEYxtgH
	QoIttkPkzhgJ7AqayyRCBSAXxjUBtlpBDEL54WpDFTcf+/DWPmSbpJ8lybOMVlq2ZTvqPtc38F7
	CbTsgMOseDtc59KJogposq8qJTkn1J5JOkc+xPwhYivN0gcxkGJROGeULgCghYVSw7sxMxyIilc
	syFb+IiPgFx4Bv36TZJw8RL7/nUESo57uIr7hrkT6WpAOns=
X-Google-Smtp-Source: AGHT+IEK/IDwjYTfcGC9vytnhg57Unum7j14HBhQ+TRt9SQk9fY2DLtXa4M3MfHh3b7yHzuy9lAQFA==
X-Received: by 2002:a17:902:c951:b0:216:5268:9aab with SMTP id d9443c01a7336-21c355e832amr552530105ad.46.1737926491907;
        Sun, 26 Jan 2025 13:21:31 -0800 (PST)
Message-ID: <6fcaa7b1-ba43-4a3f-a560-5d05a57cdc7c@linaro.org>
Date: Sun, 26 Jan 2025 13:21:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] cpus: Have cpu_exec_initfn() per user / system
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-19-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Slighly simplify cpu-target.c again by extracting cpu_exec_initfn()
> to cpu-{system,user}.c, adding an empty stub for user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> Good enough for now...
> ---
>   cpu-target.c         | 9 ---------
>   hw/core/cpu-system.c | 7 +++++++
>   hw/core/cpu-user.c   | 5 +++++
>   3 files changed, 12 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

