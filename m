Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE58FFDB6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 10:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736365.1142421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUW9-0006BJ-Pb; Fri, 07 Jun 2024 08:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736365.1142421; Fri, 07 Jun 2024 08:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUW9-00069o-Mu; Fri, 07 Jun 2024 08:00:09 +0000
Received: by outflank-mailman (input) for mailman id 736365;
 Fri, 07 Jun 2024 08:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sFUW8-00069i-3L
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 08:00:08 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f41c7c4d-24a3-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 10:00:06 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52b9dda4906so2599756e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 01:00:06 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421580fe3bfsm80158245e9.8.2024.06.07.01.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 01:00:05 -0700 (PDT)
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
X-Inumbo-ID: f41c7c4d-24a3-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717747206; x=1718352006; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VTtkiNImIN3ua9NrmdiQNM3YVloWaIf5tYaV6iwsIIc=;
        b=IKUnsLchyPefXtUynb6zYq+mQ106d1pnlsckwPWObkZJ27HakniULzNj9xzbXdpdDS
         IOkO0s+caa2Seh+7pB+HRnWZsPo32wwBkfc7STTcJO3Wyg6pWYVEAoqb9QFcmsfcrpND
         wa9IHTkXMaTBeYLTOto3xb+kVUDd/33TwT1J7ZTGNy7hhApY3lkve2r04S6wpluQSD6A
         UAJj4ShI9+M6zaVdD2XDekiHEZheJiDJSKDzDnM7GNa1d0dCkYqCZ35vSD/gxD+Ldu4O
         a7pTuGkyZtFG8vCIUTM//MSjbnNtpQWJJ2AVkz0+swWwbBZTN0igR3bIvKdn9rKkn1WS
         5vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717747206; x=1718352006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTtkiNImIN3ua9NrmdiQNM3YVloWaIf5tYaV6iwsIIc=;
        b=oUfSsEU2PkMsPMPXenuOMpxx4yHyvN3+ZK3bZs3G1aIdz4sdw0aTqf52JfBgOTfT4z
         o8E2LCQj2ky2FKo6FA7s1iNLaZ4o39vrXbfaYDxN+9sK2ElGrgczKnkcM7fwqCuYpwa3
         s20Vk/Yrb3bd3D/zWDPbFzouTMi+eU9USrKE35/A6+enG4ELTOZM5JRP5KgD5t5kVxke
         8Xwv/LyjuPea8UNg3kR/5driFL/z3ZNFm09OPoT6/vQISzBVPtPC58fJBXE7RmNJX1mW
         asG1vQtNR+8nFBC6PQSfOkl0qeeDgIVYcltT02jCfN/pKpNzge5oDPIbWR/iBZwRW6nT
         gjjA==
X-Forwarded-Encrypted: i=1; AJvYcCUVJFwkcB9LZdF5uoTDijUsbUfIx2C2bs7stKHciRIeWxExwg/rGKHUHYizYfmhxINDJ57E0MLXSjFi3BYuZtPSBpscqnUbhEA7VuJ5S/E=
X-Gm-Message-State: AOJu0YyX8WT8Wr+y5POQhO0zAiS5XlbkjcSmbICk2SiBJQZSjFj2Qyxd
	kl34+Y4aGEI1sxpZbzOqHS8Jkjve1VCfDmkbeFAF9Io1gyo96tFtu2EooKkQhw==
X-Google-Smtp-Source: AGHT+IEvbSd1W7VTJCDcPcqLPtrk5YnhJpD1OrUF2kHJMJC2UppgsCUQ3+ZpXuAU/2nG/AWTl/MMQA==
X-Received: by 2002:a05:6512:2027:b0:52b:9037:9965 with SMTP id 2adb3069b0e04-52bb9fc8ae2mr1353513e87.48.1717747206057;
        Fri, 07 Jun 2024 01:00:06 -0700 (PDT)
Message-ID: <5f2f3407-7374-45eb-bd06-b7b47ce31fef@suse.com>
Date: Fri, 7 Jun 2024 10:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 06/16] x86/nestedhvm: switch to using_{svm,vmx}
 check
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <63ba1d4e043315693957093688670d36ffa65d28.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <63ba1d4e043315693957093688670d36ffa65d28.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:18, Sergiy Kibrik wrote:
> Use using_{svm,vmx} instead of cpu_has_{svm,vmx} that not only checks if CPU
> supports corresponding virtialization technology, but also if it is
> supported by build configuration.
> 
> This fixes build when VMX=n or SVM=n, because then start_nested_{svm,vmx}
> routine(s) not available.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably, as said there, with the introduction of those macros
moved here, and title/description adjusted accordingly.

Jan


