Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46217F4138
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638548.995215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jBy-0007Uq-Ed; Wed, 22 Nov 2023 09:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638548.995215; Wed, 22 Nov 2023 09:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jBy-0007T2-Bq; Wed, 22 Nov 2023 09:06:42 +0000
Received: by outflank-mailman (input) for mailman id 638548;
 Wed, 22 Nov 2023 09:06:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0DV9=HD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5jBx-0007Sw-4d
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:06:41 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72095b34-8916-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 10:06:39 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40839652b97so29739175e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 01:06:39 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c4fc500b0040a5e69482esm1500682wmq.11.2023.11.22.01.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 01:06:38 -0800 (PST)
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
X-Inumbo-ID: 72095b34-8916-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700643998; x=1701248798; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nyfehAvDs1a7UP28726nOsokn+9IAkiWNm3KTOoYYmc=;
        b=a04g2ApXsoJ5BzkNVPWy5n1uPVMoVQ3KrFJJ1bGxsxph4tJh9C4g4G1kvWswvnepMk
         AtF9pF8cd+UV9MSXXwkIP6jzrR5ju9m4e5y7QGKE5MUqz4NxJZq22FhapICNOJYUMGka
         zvzfLamBhcdLQZriwgxocBXULhZkOux49haCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700643998; x=1701248798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nyfehAvDs1a7UP28726nOsokn+9IAkiWNm3KTOoYYmc=;
        b=CIORh38prBK/X2aNd2BaBKOYP3yNgMRZzASlHqffguyf1KewcXWSDeZFv9+5i6XtYK
         d6CWdEZCD4SotTwMDovo0aihK8Dt+MF9vyh5loANQMTVqURewUIh7fVGEWjL9MCZHA0R
         4Rf7vrKKujs84TMAtLlw4VUlRe9I0lePfTTrvFzKupQDIKNh52d0iSywT4X4P08H1zJV
         k17MNrbgbSBMneUcUSNGt2JZVNHoem8hKXIVILTb6D0kx3Iu8aJJyBa3X8tORbXamxsD
         T+wXDDPjiCflgEcEjHypvCBYTC5hUhhyfuTAlF8La1Nprw2aPnOrgPuTnB0kYITKMlvR
         b+Rg==
X-Gm-Message-State: AOJu0YyJbXRAXOdzrFAPdp824ApUjMLiQcwEWE5ND7K8hujWXJK1ybr+
	3c5Q042W4NvbJv2avITulnsmBw==
X-Google-Smtp-Source: AGHT+IE/zY5HSomJu5EwcONEnkua7WegyhZnScS8fN6uugrXj5sfSh5655VKwNiGpP62K2PJJ2nTQA==
X-Received: by 2002:a05:600c:45d3:b0:408:5ba9:d707 with SMTP id s19-20020a05600c45d300b004085ba9d707mr1445743wmo.16.1700643998477;
        Wed, 22 Nov 2023 01:06:38 -0800 (PST)
Date: Wed, 22 Nov 2023 10:06:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH 4/5] x86/HVM: drop tsc_scaling.setup() hook
Message-ID: <ZV3EnVFk7DtlLyXS@macbook.local>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <d5b7124f-b7cd-4a3a-b12f-e8e315e9f89d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5b7124f-b7cd-4a3a-b12f-e8e315e9f89d@suse.com>

On Thu, Nov 16, 2023 at 02:32:47PM +0100, Jan Beulich wrote:
> This was used by VMX only, and the intended VMCS write can as well
> happen from vmx_set_tsc_offset(), invoked (directly or indirectly)
> almost immediately after the present call sites of the hook.
> vmx_set_tsc_offset() isn't invoked frequently elsewhere, so the extra
> VMCS write shouldn't raise performance concerns.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I would be lying if I told you I understand guest TSC management in
Xen, but patch does keep the previous call sites with adding others
that are indeed not hot paths.

I do wonder whether it would be possible to set this before the domain
is started, as AFAICT the TSC scaling ratio is only set before the
domain is started (either by domain create or other toolstack
hypercalls).

Could we maybe further limit the write to the case where the vCPU is
not running?

Thanks, Roger.

