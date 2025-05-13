Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BDEAB5AB2
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:04:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983137.1369488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt2r-0001hK-BJ; Tue, 13 May 2025 17:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983137.1369488; Tue, 13 May 2025 17:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt2r-0001es-8D; Tue, 13 May 2025 17:03:57 +0000
Received: by outflank-mailman (input) for mailman id 983137;
 Tue, 13 May 2025 17:03:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0QL=X5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uEt2p-0001em-Ti
 for xen-devel@lists.xen.org; Tue, 13 May 2025 17:03:55 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f61f8f5-301c-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 19:03:53 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso58467385e9.2
 for <xen-devel@lists.xen.org>; Tue, 13 May 2025 10:03:53 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7dd5sm215452485e9.35.2025.05.13.10.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 10:03:51 -0700 (PDT)
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
X-Inumbo-ID: 3f61f8f5-301c-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747155832; x=1747760632; darn=lists.xen.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdiKmgPiB83vyJbNLyqD6vCzUOha0hDNrkNpiC/2CX8=;
        b=AQ27NaMJkxHF59O1egyWODt37+j7G6HBrm1MMp2X+9j5NEap+Z4rsIO9l+TY+eJzrb
         nTO38jIqWCQY+NIqGYCXBE7fF/r0EZegPAktimt3keZUuIn3vbhgYGZZQLxM22ns2GXq
         3ABiMN2kw9tTg9uaAUI8rtBTQOsf4nIgbx7eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747155832; x=1747760632;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CdiKmgPiB83vyJbNLyqD6vCzUOha0hDNrkNpiC/2CX8=;
        b=CdTTfgTljN/WfM6Xa+pxdTfKxSV/4eg4bXoQos55+90J+T3EZDknr+XH1ebBbhBLXH
         bXu5lMfywgEL/Kzf93E6sphKCCYVvv9cr6mqhsqnufpGrZm3xi8S57CZ9j/ZN7tu8XrX
         M53UhsecqyK48t6AiIDlZk+XipsPXkuFseFz1VPWcUBaBuWmZinvHR+l8vwPO2ljx0zj
         jSPrgeB1hjoJz0Gc07EIngxr6ltARp2oIAzroGC3b959dz6+w3/3o6CQa0Ogbjhm3H9M
         eY/yRiSTJTw0mryjnjZdNrNE9ColufTP9IyFlytUOfplzPSkRpv6R8AcX5+tRLlwdW5g
         iZ4w==
X-Forwarded-Encrypted: i=1; AJvYcCW6dByw8u1yvwFAN1FhMJVSJobBcJGiP1bZ1CR1DvWTstte8s+3KbKTepqbA6Lz0svyxUokfYxZEqE=@lists.xen.org
X-Gm-Message-State: AOJu0YyLUR4FI7MwKzT5XMTNeoesaXRaqoiiQLpg7+hX9BzFe5YQxq8N
	FIUFg5e149hANHlewD3sSIQbPCBAyXuR0OTOMqu8iBXbC+4P0FbgOhAiDQeQ/WeTJqYYzCrZ1Dl
	d
X-Gm-Gg: ASbGncsFWpfO+u+EVP/pSRhhGG6bLSn9z+HtdXBabGPIf4vEK5/cYRWfrpgmjECZKDN
	T1GtugUciGayC8umZivp/8lc24bIBsLLIul1dOS78LiTeA748rFpoDMQV5ByyjOQsnvwu0B3f4T
	ybD5Y57faF85yGqF5j3yAcROz4ibf82tL1Q0FRGpd7BVVVTmKm7NpDPni/a5jcb7gqUbaINH3v2
	UlgTj/6bWCFPVQncCrcfwcBZ+uDNCCjUghhFX3ORsySLNSFrUTsPrteDS6sFSWuepMiHC/TV+/3
	QOHAhNyUrFqW2hEtwjv67jrAdGqyi5AsLLSfOgaqQYDjw4bNXeTyjyYEEnMWOHphjiHXtPgnWxB
	V5eFbNnRxVhja6l69
X-Google-Smtp-Source: AGHT+IFsHFUoejrqrNdXTxQcPHJd+q6q34anRsCYXGuSkQdKkx7aDqCHjt0t1A7Bq6ooEOFq8jkq5A==
X-Received: by 2002:a05:6000:2907:b0:39c:1429:fa57 with SMTP id ffacd0b85a97d-3a34968fc0emr71795f8f.3.1747155832320;
        Tue, 13 May 2025 10:03:52 -0700 (PDT)
Message-ID: <6ff1387d-6577-455d-8a1a-0dee04907b1c@citrix.com>
Date: Tue, 13 May 2025 18:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "xen-announce@lists.xen.org" <xen-announce@lists.xen.org>,
 Xen-devel <xen-devel@lists.xen.org>,
 "xen-users@lists.xen.org" <xen-users@lists.xen.org>,
 "oss-security@lists.openwall.com" <oss-security@lists.openwall.com>
Cc: "Xen.org security team" <security-team-members@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Xen Security Notice 3 (CVE-2024-45332) Intel Branch Privilege
 Injection
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Researchers from ETH Zurich have discovered Branch Privilege Injection,
a bug in hardware prediction-domain isolation whereby an attacker can
cause predictions to be tagged with the wrong mode/privilege, and then
use the incorrectly-tagged predictions to mount traditional Spectre-v2
attacks.

For more details, see:
https://comsec.ethz.ch/bprc
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01247.html

Intel are releasing microcode to address as part of IPU 2025.2.  There
are no software mitigations available.

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20250512

~Andrew, on behalf of the Xen Security Team.

