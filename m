Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103E2ABAECF
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 10:34:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988867.1373272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZTK-0000Do-7X; Sun, 18 May 2025 08:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988867.1373272; Sun, 18 May 2025 08:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZTK-0000Bu-3i; Sun, 18 May 2025 08:34:14 +0000
Received: by outflank-mailman (input) for mailman id 988867;
 Sun, 18 May 2025 08:34:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGZTJ-0000Bm-0R
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 08:34:13 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df1be496-33c2-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 10:34:10 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ace94273f0dso589807966b.3
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 01:34:10 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-24.ptr.icomera.net.
 [185.104.138.24]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d437763sm407674966b.121.2025.05.18.01.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 01:34:10 -0700 (PDT)
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
X-Inumbo-ID: df1be496-33c2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747557250; x=1748162050; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WmLQ68jYJsxKS7twVfeUcQ1E0bg8HqQ2/0I3qrqIpA=;
        b=DYWo8grPTMnIxplWViceClI7QLYi3EX/eUo99CS6GAuqkURvBD81tH4TaSnAEMmxoQ
         IaeAJV4WvF1BUl1r1FNZRbPc1OKvEd0lAlyn0YSeRXLJ4I/EVQ4ze0jYA6VfobBN/7qp
         jqvF56ukuqMdNXCprRPG3n3GwAnwB7FBtg/nHJyeCeJH2Qs/nEybPWesH4eG9R899yFy
         KAz9+nnfLJlLN+1kyXmGUwk4yHxbWDgOovAhMrlldPyp8HSpecQsFP/XvCDQQa62VVn4
         Hbtq1Yi+jhDNfe6Y4/krLeJ6wq1fko+u55twH9gSlU5OfdmjgOSTQ3QksGQCha+uqD2x
         bzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747557250; x=1748162050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WmLQ68jYJsxKS7twVfeUcQ1E0bg8HqQ2/0I3qrqIpA=;
        b=PEIp4h4fJeimK/m3PEBSOhAMDn587hpm4ih6/Ld6+U3NYnJOes4bA+EOYSWmZ1L4fC
         W9UrHYM45TAaAH0TnjE6YaOs1AUcRXz+VqH3jrooYvQcGjKT+oX2CXH79xBUnrpO+zpc
         qHlzs15cQqms3bd1XR7P0Nn55xefmjcAGhsVbndaLcY693EzKCVDyJ3O6OdVPoaSsshZ
         JAKAfi9246G4uzCj00eBJDsUkxU3dUy7ovvNqGvDb0sKX6opjCpIoTzMyVltJTNMQ1aQ
         im3Ct5KdeaUnV/EWGARCvPLOKpfTIWUpEcVjLqe3ePDFuf9V+aseZk6fDbN1uN7iEITs
         lLrw==
X-Gm-Message-State: AOJu0YxTzyiKyzq9NCAU9cmb7Y/wAUfPhqyPoitLUdg+YgmUf5rjdSn3
	pYmNgaDEYUDULuX/JwCtGAKD2jdYjk9J2RRvwBrojPOvQz7kTT37sgu5SqLUxVYzkQ==
X-Gm-Gg: ASbGnctOQwPbc1sx/JPUCMYpe5vF17ZkBFKyO1Q9tbO/wzBqNxKBjSKJw22snGHJgMs
	kutNipmd7H6+i1zJaYxiYXfMqAvpAm6xSIBq/Bp+nG1OhkSfi/QJckoyA3DUcfc7wNsRlp64Xx/
	IR2nc06IDLY6UCc9mjH2EUArbzctm98QE4CHRgtU5ScpGvAELU8n3NO/TmDCSp7Ra84CNM6NuFT
	4Eh0xerdvDW1Y2IyB/kIbfn6yGeY5WWUldGJsI+DzzRKhRmbCZo0v+U5eNNVAviSluRqErMdTHa
	u4GFmmWNCUQ/4rHxreK20JNrmCTvOe2hjcGStFXUD6dMaWqmOcVde/nuv8hcnkdLvVMjM/3YYRP
	jhZ7+F9MpICku8K0R0Bu5SgpB
X-Google-Smtp-Source: AGHT+IG8smgzLPQse3YG8qsW+/1ehpL5ng9CIo4OzJliXTGQ6vgoK+4xPAiR1sftyrUT486YbhcRYQ==
X-Received: by 2002:a17:907:72c9:b0:ad5:2137:cc9e with SMTP id a640c23a62f3a-ad52d438319mr944396366b.3.1747557250314;
        Sun, 18 May 2025 01:34:10 -0700 (PDT)
Message-ID: <1e5f21df-2108-47f1-a59c-7869c6edc447@suse.com>
Date: Sun, 18 May 2025 10:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/22] xen/lib: add implementation of SHA-1
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 trenchboot-devel@googlegroups.com, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <7fcab16c3efbc0eb28e0f8ec0d9c9d3188881ad4.1747155790.git.sergii.dmytruk@3mdeb.com>
 <fdc5b712-4c93-42b4-a1b7-d992c720c387@citrix.com> <aCjSz6QXHiFtAjFP@MjU3Nj>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aCjSz6QXHiFtAjFP@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.05.2025 20:17, Sergii Dmytruk wrote:
> On Wed, May 14, 2025 at 05:58:59PM +0100, Andrew Cooper wrote:
>> Please crib from sha2.h as much as you can.  Use xen/types.h, drop the
>> double underscore in the guard, and provide a link to the spec.
> 
> Until yesterday CODING_STYLE instructed to have 2 underscores, so I
> thought sha2.h is outdated.  I'll switch to <xen/types.h>, although it's
> overkill there and only grows header dependency tree (it also brings
> extra symbols thus hiding missing includes elsewhere).

If xen/stdint.h is sifficient here, I'm pretty sure Andrew would be okay
with its use instead of xen/types.h.

Jan

