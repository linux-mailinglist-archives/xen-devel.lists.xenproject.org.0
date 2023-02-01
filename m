Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9EF686098
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 08:31:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488139.756072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN7aF-0007tz-Op; Wed, 01 Feb 2023 07:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488139.756072; Wed, 01 Feb 2023 07:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN7aF-0007rU-Kw; Wed, 01 Feb 2023 07:31:07 +0000
Received: by outflank-mailman (input) for mailman id 488139;
 Wed, 01 Feb 2023 07:31:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ku+U=55=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pN7aE-0007rO-6o
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 07:31:06 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6224fcd2-a202-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 08:31:04 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso2073111wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jan 2023 23:31:04 -0800 (PST)
Received: from [192.168.1.93] (adsl-184.109.242.224.tellas.gr.
 [109.242.224.184]) by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003db30be4a54sm835517wmo.38.2023.01.31.23.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 23:31:03 -0800 (PST)
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
X-Inumbo-ID: 6224fcd2-a202-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JCnrAqJEVHxPW26rKJcQaouQVlcy/LvyniwfBABmy9A=;
        b=Upepx/mL8v8t/75DyHuAfV7cncRLiuGRg8qsNZLgendg8s45aaYTQ1rfiCR2HVjGN0
         6Rc7fVFueSx0W7P6wnPriRjbKSJlzr9cWB8OLR8vTuO6QAul6A5aSFZ0twIWwm/ZkwqQ
         gNXDcY5epCbXhDOxchVD3p2x5r3UsMnBc0f/OQ/XRZk5on55tqwZO/dPqWOcnhjtQRNX
         z7f7gxj2Bb+8RzoNKJnyLhuVsnby3pQSbVz7/GzDGIojUtTUpQbtoaS41Hs05y5zCPLN
         XoQO2FeO5gT2jT1GFIZwfxmXlG8TsKuBPjAS8FTUbbYBBdqsZ/7sOwIDx3AEG+OFgRZk
         hBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCnrAqJEVHxPW26rKJcQaouQVlcy/LvyniwfBABmy9A=;
        b=peftM/b+vfHgyDt63iYNUNF3+vZmM46KeE9e2SQ6mLmi8DPK8xe2ceJqDAORVblLyX
         kRCLr9xxjtJOzmnk5IYF9u9011WkwzoD9QW9Y1VqiJalzbduVuTVsrXnTAj8XNTEldoI
         KLjIP3/bqgHsnlS8wgPuSnyd1Qk+gxTIh1fYDtxAQC8/H2lTmI3+FDlJGE5TLemeFv+h
         IowvZrpd7OhdppKM8nFwGvQ3kyXuIJeAPTfdyfVoyxsBATnKsTXLoo/N5pzDrPAdEObw
         0EgsSKXcpitR6wDbNuLuEx+8ItlnaTdka6QSbqECargl9jrVhXi2gy12jziqRHpIlmk8
         OEYw==
X-Gm-Message-State: AO0yUKVlA3Le8Lkb6mVmk+lOt7Viaf7nEngDocrU+pqwfkKgCujmvhmt
	TFA0v2aA9K6MHTuUyat8MWE=
X-Google-Smtp-Source: AK7set92n7LTq8tO2jp4NicCauKVDFLRK0yHDSiDCYdWUWvIwqMmjzpVz/s+GGlA627bH8laZqpx6w==
X-Received: by 2002:a05:600c:3489:b0:3da:f670:a199 with SMTP id a9-20020a05600c348900b003daf670a199mr898894wmq.36.1675236663422;
        Tue, 31 Jan 2023 23:31:03 -0800 (PST)
Message-ID: <b8415b36-4e99-9d85-1621-ffd7fe05b2d1@gmail.com>
Date: Wed, 1 Feb 2023 09:31:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/5] x86/iommu: make code addressing CVE-2011-1898 no
 VT-d specific
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Beulich, Jan" <JBeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>
References: <20230124124142.38500-1-burzalodowa@gmail.com>
 <20230124124142.38500-3-burzalodowa@gmail.com>
 <BN9PR11MB5276023EB640F1CE9DD72BEE8CD19@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <BN9PR11MB5276023EB640F1CE9DD72BEE8CD19@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/1/23 07:07, Tian, Kevin wrote:
>> From: Xenia Ragiadakou <burzalodowa@gmail.com>
>> Sent: Tuesday, January 24, 2023 8:42 PM
>>
>> The variable untrusted_msi indicates whether the system is vulnerable to
>> CVE-2011-1898 due to the absence of interrupt remapping support.
>> Although AMD iommus with interrupt remapping disabled are also affected,
>> this case is not handled yet. Given that the issue is not VT-d specific,
>> and to accommodate future use of the flag for covering also the AMD iommu
>> case, move the definition of the flag out of the VT-d specific code to the
>> common x86 iommu code.
>>
>> Also, since the current implementation assumes that only PV guests are
>> prone
>> to this attack, take the opportunity to define untrusted_msi only when PV is
>> enabled.
>>
> 
> I'm fine with this change given no functional change.
> 
> But I'm curious about the statement here that the current code only
> applies to PV guest. I didn't see such statement in original mail [1]
> and in concept a HVM guest with passthrough device can also do such
> attack w/o interrupt remapping.
> 
> Any more context?

I agree. I phrased it that way because currently the mitigation 
addresses only maliciously injected PV traps.

> 
> [1] http://old-list-archives.xenproject.org/archives/html/xen-devel/2011-05/msg00687.html

-- 
Xenia

