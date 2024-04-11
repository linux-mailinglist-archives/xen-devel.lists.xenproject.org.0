Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F88A15D6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 15:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703954.1099992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruueT-0006S0-Bb; Thu, 11 Apr 2024 13:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703954.1099992; Thu, 11 Apr 2024 13:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruueT-0006QT-8r; Thu, 11 Apr 2024 13:39:41 +0000
Received: by outflank-mailman (input) for mailman id 703954;
 Thu, 11 Apr 2024 13:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P8ns=LQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ruueR-0006QN-NV
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 13:39:39 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f06861d9-f808-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 15:39:37 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a51c8274403so628697366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 06:39:37 -0700 (PDT)
Received: from ?IPV6:2003:e5:8705:9b00:4df1:9dd5:4f97:24a?
 (p200300e587059b004df19dd54f97024a.dip0.t-ipconnect.de.
 [2003:e5:8705:9b00:4df1:9dd5:4f97:24a])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a1709060d4a00b00a46a9cdcfa5sm759701ejh.162.2024.04.11.06.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 06:39:36 -0700 (PDT)
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
X-Inumbo-ID: f06861d9-f808-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712842777; x=1713447577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nw5oWo8SbG/JjbLUd+pDYICRWpYvqotAi1XzjeWc850=;
        b=baSmZj9l0bCLgI3cmMSRalYGXli8nMSTTZaOTjNKYlfuzJCnUjN31WW1ibgvpROlrh
         U+RyV+0+RenXvyJ4LDIpMxJpfeAMom5J7KgopPVITBUo51X0LsXfnNweP1IHdZAENree
         oZKEaQ+J2jpma/cZPnlC6RAwKMq/F+cyJjOHjztepVX4qPPtrF4g+DJavhkjJmqbANT3
         /zo2TO7BflSacXWxnapbNcfCx3Bq7iG8iTl3VkY07FfqsTZqAdPaJdufLHhBbSgmvHRg
         4FOZls8YTV+AMRjcAipWhh/i/V8pbknL/aR3Pxf2VIxARJEHfheP3X/ra825nU9FOY9B
         Svgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712842777; x=1713447577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nw5oWo8SbG/JjbLUd+pDYICRWpYvqotAi1XzjeWc850=;
        b=LPtpH+bh8IP8C+Mb9PHQzby4YJGvhA5U/nvR5BODSsKsniofHlKYgAcKYpNRNIMygV
         +55mCN2LyXBwLQlYXdaP0Z4ksbnUbhqXYUT610EONueLqly4XnUL+UrbKAS744e56WBg
         HP/yj1Qn4P8aS/s3jYboP+fiC8KJN1KHpuemeGbeWFCKujqFh1jm5VfnYK6Zbk2oe2Fo
         2yiv2T/QBspaYAKf+YUzaExW1YUJrX4fFpJ5qp13bEX/AEa8AFgy1vEE7OPAVcobIadd
         GMj6cCOlOQDB/w42eG1YlYtOKDy/X3Idwb+pKb7wZ1RRyTPtvvUZ5kV5oepkl7R/OFBW
         eyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjKpFBtr4Eu79aUEXVXh55TFoHmYp58n5lvYpdSuB/SUwpWIutkI5z3+x4zwlDSr6bGnBvDsKzH1lWtoQKUA9UaNOwdB13jKUQ1WL8S3U=
X-Gm-Message-State: AOJu0YzceCbr8wdi2urvjfZ0vv/XoVliGz8aAKu9Vk6Fs+jO9wsr1TBp
	m4z2ueK4YkCnWKI4wv7P9S0VNZVRUP9AubVerngcqdr5sXrYOrTOE7lULO8nHmk=
X-Google-Smtp-Source: AGHT+IFDZdEXgvpYFvYDPlTbFe/I24LhPGaam33E+x0qZmk8Ha0VpCJchtO79TGC7Q5GKUPegeSFeg==
X-Received: by 2002:a17:907:ea5:b0:a51:c281:60f3 with SMTP id ho37-20020a1709070ea500b00a51c28160f3mr4251234ejc.77.1712842776616;
        Thu, 11 Apr 2024 06:39:36 -0700 (PDT)
Message-ID: <99c720a9-b042-46d3-8182-cb9bcabb89db@suse.com>
Date: Thu, 11 Apr 2024 15:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/x86/xen: Use try_cmpxchg() in
 xen_alloc_p2m_entry()
Content-Language: en-US
To: Uros Bizjak <ubizjak@gmail.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20240405083335.507471-1-ubizjak@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240405083335.507471-1-ubizjak@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.04.24 10:32, Uros Bizjak wrote:
> Use try_cmpxchg() instead of cmpxchg(*ptr, old, new) == old.
> 
> The x86 CMPXCHG instruction returns success in the ZF flag,
> so this change saves a compare after CMPXCHG.
> 
> Also, try_cmpxchg() implicitly assigns old *ptr value to "old"
> when CMPXCHG fails. There is no need to explicitly assign
> old *ptr value to the temporary, which can simplify the
> surrounding source code.
> 
> No functional change intended.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

