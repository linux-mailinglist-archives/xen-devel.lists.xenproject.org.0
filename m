Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55CF8C1F7F
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 10:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719569.1122389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5LK1-0003Uy-TN; Fri, 10 May 2024 08:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719569.1122389; Fri, 10 May 2024 08:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5LK1-0003TI-Pd; Fri, 10 May 2024 08:09:41 +0000
Received: by outflank-mailman (input) for mailman id 719569;
 Fri, 10 May 2024 08:09:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YvKo=MN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s5LK1-0003TA-1M
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 08:09:41 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a65ebd29-0ea4-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 10:09:40 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51fdc9af005so2762397e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 01:09:40 -0700 (PDT)
Received: from ?IPV6:2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c?
 (p200300e5873ca5006aafb7a77c29ae5c.dip0.t-ipconnect.de.
 [2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7dd4sm156394666b.139.2024.05.10.01.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 01:09:39 -0700 (PDT)
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
X-Inumbo-ID: a65ebd29-0ea4-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715328580; x=1715933380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOA3rf3iEwXBosJZswL8rY8kkufkCURmYw7VrB7WzZY=;
        b=E7JK0ADc93nphX7/RhJGXumlGh9KmCzErcsLagVR0EoFzkle7Eu6UUyZvILto7Mv0u
         6kIQUAZ20lRPlxgH+UXSjVA3K99XxQPayEBSbfwrJ1D8Wy0YLK6WM1px6FE37mj5KteR
         fFtuss7t6fYEr79XsOG6SF5ro2fnT3vfLUooSfvV41SGHLmYVp1WqXTp+q7j7Anw+lnv
         kDkC6aFYMMggI8PT3PwuKWmUzuQJNNq9010K1E+hephsF7QFQUZtKV6Typ0KIGRgseGM
         njeUxKYO44uZhpZSwek2mQoAAx69uKt9SZPn/dVNE/YMghRYBur7xIoEu7CiMAxTMENw
         UNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715328580; x=1715933380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOA3rf3iEwXBosJZswL8rY8kkufkCURmYw7VrB7WzZY=;
        b=fit5F5MmJHrI1KXC3fLjAOpmxWYzKglwY4F/9rpkUXrvSxtIIjTxjILet7eOG5Yp4k
         5FUmgrzBp1lz062Zmjh1JCCVfAqINFHhnlNmiPUfsCpvg4JoOGmrU3DXYaj1O8rvuiYk
         wYyMw3YeJNWIs/iSzk7FVGEY/4q7I/bULMqxDeH4Ql49YLOwkiwA1jD+HJK91BzqHc+U
         HhsJLJLWGQ+Iq0OMByyuabSSQdOE58jrv7VgOW3iOKF40Fnr7VS3o0nsOEZqItN61PIH
         BqddMUwDpvc1tg+a5cfqA2ewTzFRvlIHWyyx4qPko7Xs14IjyVkp/HbJGPOGOw2b+yfj
         lQHg==
X-Gm-Message-State: AOJu0YwR5qT93C/dxg3czEPdAajfJoO1eaC1x8/bfLtP/XMPExtmKLRs
	gKl8gWcnP3ia2N5lJGt8xyK2B4q3tTgg6v1eqnqtDGHKVQ7bVmiIl2xKyE0ygZ4=
X-Google-Smtp-Source: AGHT+IHtDaPtq3+zWdvt/+QCSVMqgZzNN1SJ3jMP1mQYF2RqhDLEuqTWeGEoaIonyooUIL8R+/1DAg==
X-Received: by 2002:a05:6512:3f20:b0:51d:4383:9e59 with SMTP id 2adb3069b0e04-5220f86c902mr1439410e87.0.1715328579679;
        Fri, 10 May 2024 01:09:39 -0700 (PDT)
Message-ID: <817f6c43-101e-4e9c-9ab7-f99c960d3499@suse.com>
Date: Fri, 10 May 2024 10:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen: sync elfnote.h from xen tree
To: Jason Andryuk <jason.andryuk@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20240410194850.39994-1-jason.andryuk@amd.com>
 <20240410194850.39994-2-jason.andryuk@amd.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240410194850.39994-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.04.24 21:48, Jason Andryuk wrote:
> Sync Xen's elfnote.h header from xen.git to pull in the
> XEN_ELFNOTE_PHYS32_RELOC define.
> 
> xen commit dfc9fab00378 ("x86/PVH: Support relocatable dom0 kernels")
> 
> This is a copy except for the removal of the emacs editor config at the
> end of the file.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


