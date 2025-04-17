Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C9CA92873
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 20:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958426.1351269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5U4s-0005Nu-V3; Thu, 17 Apr 2025 18:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958426.1351269; Thu, 17 Apr 2025 18:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5U4s-0005Ku-SP; Thu, 17 Apr 2025 18:35:10 +0000
Received: by outflank-mailman (input) for mailman id 958426;
 Thu, 17 Apr 2025 18:35:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CA5y=XD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u5U4r-0004ra-Dv
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 18:35:09 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa2c92e2-1bba-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 20:34:58 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so1115953f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 11:34:58 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43be53sm410892f8f.41.2025.04.17.11.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 11:34:57 -0700 (PDT)
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
X-Inumbo-ID: aa2c92e2-1bba-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744914898; x=1745519698; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tiOKK0JJwuw4VVwf5VrZi2QtVGcEQ2/+52p9IOBo8n0=;
        b=OJmNfLK+ymMN3S1ZPDcakRGwEkI1In29hDbbkxFxPknkJ2kxS/+5FZ9wzUTqxzNOWz
         7F/ZHnr1XbFwOQOrpDXEPMAviiNt+b2VK/i6XJZsJDsT41Q9xJAPsCwuG0RJ1TSRPZ4N
         vA7GYKZiF2rGJL33K4hgWvS9W2Jr0wLrBx61o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744914898; x=1745519698;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiOKK0JJwuw4VVwf5VrZi2QtVGcEQ2/+52p9IOBo8n0=;
        b=rtdLdIBbLBzkGm4kuraMPe6M/w+2qQ2RzKUPNuTFh+exbjs96EcMMDS+BZodvrbK5g
         GxlbZeA/3sKlslde5jYuvvDc5x0CxnIQo2lW2y1cC+5i3kiXguUi4JZJe6WlWFtNaSpB
         VXqogDBglrDsmhJFVTrwilPD9SRXPMgdXtAlDKnqgVBUaqdxR58e2heoi3lct1RXTz0m
         Bzqmnwo5+1MacJkNJTtaIUGjp8ula/2piCzX+XDp/v4W4bZUMYR2r2Whh23I+YXO3xqL
         JnL4MtFyWfttffm2eKF6Zq/eMTLV0JdR/TjfGg5n+hVJw8ZBrowF6wRHeocGJ5J5bPlc
         eYbw==
X-Forwarded-Encrypted: i=1; AJvYcCWc3Mbk4wmh7BZHFFx3LKyfOHDOHKMRuV6QXYhJT1CyvUyFCC7/tF9oiUDty/j64TASZHKCdkStNdA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynahtalOa9HitLJsgelx+VQA7XI+QXAb4v4RvKOw/Kp9biocIg
	mbzmC7+f/vnlJ0RqEqECI2ntJaYmL/Ly5320tL/l+y1Py2mlr0Muq2v/A8uMm20=
X-Gm-Gg: ASbGnct30QJh08SaxPPOv8HM5sG0AukWU0SS+CbAN22DexSEUQv88dEoMoZ1LOnsINL
	DNv98kgLQDV59PqNBmXqBI2aS+lJQedCJIDVHPOKFrAD2B5953QHrUv+UlDS9O7DLKtEGVnvRZQ
	JByUrcJOL7eOW4J/SHkcp8BP+NommrTzIo6p10+OogS6HP/XRdCFcmNP/uGyvdeUKET5ZrXZ1PH
	m8dWn3IGFuGG37dWjncVyXPzejT5T9eKJaDxuf65K+U+PGMZalSWPsb0E996fqINYBAEbZ5+so5
	7jgfzPMu1pQ5gb7HoFFTrqkdTjsR85q+WU3Z47biamFnR8Ffnw6B4CreAfs4CbecnPS1goK1U/t
	rLD0HCA==
X-Google-Smtp-Source: AGHT+IHzuXP0YOpuY+HGs2pHLodgG7qdzk98erPJ5sZzzMW/D8fPUPdsTT/AUnDXdzeGxNXobSSIfA==
X-Received: by 2002:a05:6000:2509:b0:39e:e75b:5cd with SMTP id ffacd0b85a97d-39efba2c98emr32043f8f.3.1744914897723;
        Thu, 17 Apr 2025 11:34:57 -0700 (PDT)
Message-ID: <3930d99e-d35c-4170-be09-01abc7be51df@citrix.com>
Date: Thu, 17 Apr 2025 19:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] compat/memory: avoid UB shifts in XENMEM_exchange
 handling
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Manuel Andreas <manuel.andreas@tum.de>
References: <ffd8f532-6714-4f56-a358-71ab580202b6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ffd8f532-6714-4f56-a358-71ab580202b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 3:08 pm, Jan Beulich wrote:
> Add an early basic check, yielding the same error code as the more
> thorough on the the main handler would produce.
>
> Fixes: b8a7efe8528a ("Enable compatibility mode operation for HYPERVISOR_memory_op")
> Reported-by: Manuel Andreas <manuel.andreas@tum.de>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

