Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C5957E4A3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 18:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373362.605528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvmv-0006JU-Rx; Fri, 22 Jul 2022 16:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373362.605528; Fri, 22 Jul 2022 16:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvmv-0006Gy-On; Fri, 22 Jul 2022 16:46:05 +0000
Received: by outflank-mailman (input) for mailman id 373362;
 Fri, 22 Jul 2022 16:46:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEvmu-0006Gs-Pt
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 16:46:04 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c64a0319-09dd-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 18:46:04 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 h206-20020a1c21d7000000b003a2fa488efdso2956984wmh.4
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 09:46:03 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a5d5256000000b0021e2fccea97sm5190509wrc.64.2022.07.22.09.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 09:46:02 -0700 (PDT)
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
X-Inumbo-ID: c64a0319-09dd-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4QDc6LB7WD6UjcOQO3uE4zZfyNkWEGaSGSScriALPlk=;
        b=bljsnDCAgXPpnNugMC/7l9VySSwvdcAfTzOK58EZTvWjmLvB0VSzFMa39U1zm3UmPz
         i1guJjOKQZXPl5uMN5Rf9ZUUCvywJJ2Zbes0Y4DQokQcq38hw0upAkFyWe6OYXRIQe00
         73mYIX4bUTQCwVM7VKq0aRZND3gRi3u0a07VW+KfKP1bCH6ahRGc8Nx+vNrwaBhNzmxs
         jL26xJOnJCA0zNNRU68uOjnJj0p7LfjTzVq2F47S6UNwXsTIXE4FDhvCmAPxpNj0Yl6x
         TiX8lGWO4jlBd/fN6aWPbbIE1akhtA14YmqEGALlO1GSnebdvFFedgr9JL6ihLyyq4xh
         iUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4QDc6LB7WD6UjcOQO3uE4zZfyNkWEGaSGSScriALPlk=;
        b=7X8GdyUjZmdty0z4fwe7AgDWF4gdkM+1uNrxDlD+xPF9r2BiuHt9XmTgpVOAPYk+pJ
         j3WH60ARyT9GzUTgiAJRKIg7MdU1RP/sfda3tFYBNXCj80x6IlhGQ4FOQf6BsuSK3BKL
         7cL72tfiiCkBu4jEHWB598n895Bt7lRZ0G7ObiGLAh6cuypJmbXcjioNmwwilM07YZIA
         c5JC3rbUbmoKRXkZXipD0W/G9W+r4LbtHl2j0DYLfkIQ5hGczzva+C6uXB2ArTvIAYl1
         i8z+jgbrgtmzTjKz8gotGTEruEn3lu133CUPbMUtUoEj00VICgL3SeYk8cRYKegTpUcR
         RjPg==
X-Gm-Message-State: AJIora8yS/7jyFYwkGQ+H4MXR2SreQAv9iHh33FDhukwO+/R5JHUtn05
	iGYhVDSOQ95pQOCZeYQTJE4=
X-Google-Smtp-Source: AGRyM1uoLq4T/BOu9lZ6KnZRpHeL8WT3PoelJf0Xwac46MWXuMvdIqEHS+4DuGkfA74JpOqlHbghXg==
X-Received: by 2002:a05:600c:591:b0:3a3:205f:e2ca with SMTP id o17-20020a05600c059100b003a3205fe2camr409346wmd.147.1658508363466;
        Fri, 22 Jul 2022 09:46:03 -0700 (PDT)
Message-ID: <077f367b-b9fb-0711-fdea-00250cd96a19@gmail.com>
Date: Fri, 22 Jul 2022 17:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 04/14] IOMMU/x86: new command line option to suppress
 use of superpage mappings
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <7e587d78-43bf-70e5-b629-b7fbed0ae0fc@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <7e587d78-43bf-70e5-b629-b7fbed0ae0fc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:45, Jan Beulich wrote:
> Before actually enabling their use, provide a means to suppress it in
> case of problems. Note that using the option can also affect the sharing
> of page tables in the VT-d / EPT combination: If EPT would use large
> page mappings but the option is in effect, page table sharing would be
> suppressed (to properly fulfill the admin request).
> 
> Requested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

