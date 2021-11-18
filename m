Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8674562C4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 19:44:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227553.393586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmNV-0003Pz-Ov; Thu, 18 Nov 2021 18:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227553.393586; Thu, 18 Nov 2021 18:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmNV-0003OD-LZ; Thu, 18 Nov 2021 18:43:21 +0000
Received: by outflank-mailman (input) for mailman id 227553;
 Thu, 18 Nov 2021 18:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezFO=QF=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mnmNT-0003O7-Ij
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 18:43:19 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6551fb05-489f-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 19:43:18 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so546097wmj.5
 for <xen-devel@lists.xenproject.org>; Thu, 18 Nov 2021 10:43:18 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:70ff:9fb9:79eb:9599?
 ([2a00:23c5:5785:9a01:70ff:9fb9:79eb:9599])
 by smtp.gmail.com with ESMTPSA id y6sm689594wrh.18.2021.11.18.10.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 10:43:17 -0800 (PST)
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
X-Inumbo-ID: 6551fb05-489f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7zaYDU3ZePpTlInVD9URUJQdW+RJPtCVuC+0we1A5PU=;
        b=YVqzRhI7cTKLSbXJ1gXDgTEW4P/Xq2L881IPVgYgyS1s+oz3EONNUY+vqG6dMKkdPR
         RyIu4uvmi8fZvkGb/wQIbaZg0ZThlX9IXkiP225FD1iOEo+Y8AKAGxrDFWMXk2yUmwMt
         C8lo80a9kgL2cDVo9T98gJRMFETPwzPXyu5/BNiiHCwXV/GJb6/wubLP9+cX57ws24yl
         47QE1jDzAnLu3RkoWFhWeV+7S6OK5/kxHHm/DMKXg4RyIf9ssq1vmXPMkje+FLQaTLZo
         Z4Gb0O4NbRGmodfs3LkaGm3F9tEVugd1zVJnFkcC50+ZEDjEDaEPrcBbMWD340r0ag9r
         JC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7zaYDU3ZePpTlInVD9URUJQdW+RJPtCVuC+0we1A5PU=;
        b=1FRXbapTRSvSBevXx+6mVSH0Sn+9EpmraloQgkyAzUl8Sq0aiW/7RY23oUVN3XWJqm
         M8fmxL1hMIXfg2yj4iwKzvJwdi68J1+Y6dVQPNxhhSmZYTChJBJZWrVLLTJaEByI6mX2
         MkDtvnrRL3t8RCJpMFF0XN+aMsRvMkZw6kdDf2a5pdpN4KT6Z3kcM3rw8N6gWZT0RxIW
         F2Sa44lZtGk77lk7WEVstgUzKzcuOqUoGoyP/LLKTlhZOWzjAkLY9YKbbi0dlZztFlSe
         x6c+XRU2Hqu0XqBmk6jC52YIek+L3+xgF3+c+XIE9NOX/MX15kEu2ilo7WABhB0Txd+B
         pyUA==
X-Gm-Message-State: AOAM533Hg5m8OaYX8hVPJYWt/iiK97xI/RCxpJJcH8wsnxrY9GREPlOF
	DAmBnKMsys4b8Giu2XHbgQw=
X-Google-Smtp-Source: ABdhPJz6KWvuZzHQbxdPfhqOhQQqELzEpZ40tHOTjWphOG0F7DeV07P3vaibjQadsB74pvdu1k1agg==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr12780919wmh.86.1637260997697;
        Thu, 18 Nov 2021 10:43:17 -0800 (PST)
Message-ID: <018da83e-3371-dd7d-f08d-0488e19670ac@gmail.com>
Date: Thu, 18 Nov 2021 18:43:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Reply-To: paul@xen.org
Subject: Re: [PATCH 1/3] x86/Viridian: fix error code use
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
References: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
 <cf0d323d-6ef3-0b35-8423-5adab75ab4f1@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <cf0d323d-6ef3-0b35-8423-5adab75ab4f1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2021 13:13, Jan Beulich wrote:
> Both the wrong use of HV_STATUS_* and the return type of
> hv_vpset_to_vpmask() can lead to viridian_hypercall()'s
> ASSERT_UNREACHABLE() triggering when translating error codes from Xen
> to Viridian representation.
> 
> Fixes: b4124682db6e ("viridian: add ExProcessorMasks variants of the flush hypercalls")
> Fixes: 9afa867d42ba ("viridian: add ExProcessorMasks variant of the IPI hypercall")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

