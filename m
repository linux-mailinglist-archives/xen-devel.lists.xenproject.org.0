Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B370AC517A
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998502.1379221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJvnG-00039G-KR; Tue, 27 May 2025 15:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998502.1379221; Tue, 27 May 2025 15:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJvnG-00034u-HD; Tue, 27 May 2025 15:00:42 +0000
Received: by outflank-mailman (input) for mailman id 998502;
 Tue, 27 May 2025 15:00:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBPV=YL=gmail.com=anthoine.bourgeois@srs-se1.protection.inumbo.net>)
 id 1uJvnF-00034o-Ey
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:00:41 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a2a48ce-3b0b-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 17:00:39 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4c6c0a9c7so2447774f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:00:39 -0700 (PDT)
Received: from gmail.com (163.red-2-139-141.dynamicip.rima-tde.net.
 [2.139.141.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4d0884cabsm9243985f8f.82.2025.05.27.08.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 08:00:37 -0700 (PDT)
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
X-Inumbo-ID: 5a2a48ce-3b0b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748358039; x=1748962839; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EbcGE31liYygPaQlvfT4jgI++U+bqFAoIpuS740Bkik=;
        b=OotDrrKPVy03v42PWnbkb9yYI5UzLqupOLsEUAVy9CvJ5U8IeCpVfOdRr5gh9irxmk
         D1AWwOz31l9f8wmbhYUl/zEOqWm1VSUA9uMxNJy1K3R3EXBOYzNLxsrGUs+sPqpzk7D+
         tnD5kft+RmGhIPD0oTsOa2UP2CTEVip9OU1uqM8IMmiukrrllEIIGLHx1hmct4ZsnFYV
         ZgdP6Jkoc7SJuhMvL7PkV8Tu1YoApIl8iMKbq+JFfh493T4yLGptLJCGzQJwYvmJR8BN
         1eNcRAwDmTkC6HYzE6eccak3zxnZWG9UttX2GN3eZKInbZdNRasLVPU1+F0CUkC51Ch3
         A7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358039; x=1748962839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbcGE31liYygPaQlvfT4jgI++U+bqFAoIpuS740Bkik=;
        b=ZtiTq2wbEHlGjkCvRFHDWpkOSzbh6/bmmx4K9f+IgAFcnazxExpo2RekP+2yemiTFM
         cF/5tQxvQZmkNN3zZ5tNpl5PlGB0UUDYjIdBRXTFJL1lqb5GJljQdNl+BoprNAq6ikYB
         or9VfjjYBwb9+9WANVly0Y58fOnoyNDLoE2s+xVkZNDgFdpJQG25lYeHw32+3N5WpUs+
         UKJP3UzWMuxxILAttKnknLSWNHDu5nYdX4nhji1M89Nven1RiCLi2Or0GjHIoE7p5rOF
         qSkcMIafOyshML7wbhKj9hwekWBceQzfE8eDNk7+JUPC3/1vO/PWawvwc9ZPhEBeIodz
         q6kg==
X-Gm-Message-State: AOJu0YyTSp7QHQWCqT42Td31WP5P+CbbXJqzWNJJxORFGTC7yLR0JndL
	yhK3Ra8i8hwCfjfoYVkN8oAZOrkYIyF8EOpFbDo+PG+zyPTrbYciGG0+cXTznFc43aE=
X-Gm-Gg: ASbGncvmOzubntl6zLMnIUHzSCEqE72jAuDt4vgHC3jzbJlrj2ZCf7uLj78xUmluOCZ
	AHKISgBO9cc+YuHWFxgQBXvKSIT4HD36VnnAZ9ikZ677197t+i+ee2iNVIi8ShbGevPylQHacnU
	TFzY6bgMJ7LLLIMZgR2TH7zoth8VLcIBFZCVNmafqqN29l4EzXzxkNveKIh8/2kA7DmDLL5Nx4b
	4t+Eg1asvANtVLe8ZblYo6cMY+tK7zsWU4Evw0rbME+HrSmSSdQB4WefE2Jnq7iilWaoRfVFu2X
	RHRu1FI6tEmCTANn6LER/HUMyv8VlZqiTiL0NLf8996q5MNCcQX21jtNrNoeQ5BUK1jMg+3koPQ
	foMwdLB6y6bQlTeAdA69IXv9wlRfARxwGrU1SNGY=
X-Google-Smtp-Source: AGHT+IH15dJpxkf7h50kEGkZNLHlucOkokN10sU+swFjECtylsCGjkGPcaoYMRF9DqmdzO0zdwfXGg==
X-Received: by 2002:a05:6000:2503:b0:3a4:d7b2:4b16 with SMTP id ffacd0b85a97d-3a4d7b24cd5mr6113681f8f.16.1748358037694;
        Tue, 27 May 2025 08:00:37 -0700 (PDT)
Date: Tue, 27 May 2025 17:00:35 +0200
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] x86/hvmloader: fix order of PCI vs MTRR initialization
Message-ID: <aDXTk7zLqD4jMuMu@gmail.com>
References: <20250527085504.77444-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527085504.77444-1-roger.pau@citrix.com>

On Tue, May 27, 2025 at 10:55:04AM +0200, Roger Pau Monne wrote:
>After some recent change the order of MTRR vs PCI initialization is
>inverted.  MTRR will get initialization ahead of PCI scanning and sizing of
>MMIO regions.  As a result when setting up MTRRs the MMIO window below 4GB
>will always have the same size, and there will be no window above 4GB.
>This results in malformed and incomplete MTRRs being setup.
>
>Fix by making sure PCI is initialized ahead of MTRR, also add a comment to
>notice the ordering dependency.
>
>Fixes: 2c3dffbaa324 ('tools/hvmloader: Replace LAPIC_ID() with cpu_to_apicid[]')
>Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

