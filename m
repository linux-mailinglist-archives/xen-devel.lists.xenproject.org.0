Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B0652800
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 21:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467360.726420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jOx-0002cW-Ps; Tue, 20 Dec 2022 20:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467360.726420; Tue, 20 Dec 2022 20:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jOx-0002ZJ-NC; Tue, 20 Dec 2022 20:39:51 +0000
Received: by outflank-mailman (input) for mailman id 467360;
 Tue, 20 Dec 2022 20:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LdMQ=4S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p7jOw-0002ZD-9O
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 20:39:50 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7238a313-80a6-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 21:39:48 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id a16so19221126edb.9
 for <xen-devel@lists.xenproject.org>; Tue, 20 Dec 2022 12:39:48 -0800 (PST)
Received: from [192.168.1.93] (adsl-139.109.242.138.tellas.gr.
 [109.242.138.139]) by smtp.gmail.com with ESMTPSA id
 z1-20020a1709063a0100b00780982d77d1sm6113916eje.154.2022.12.20.12.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 12:39:47 -0800 (PST)
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
X-Inumbo-ID: 7238a313-80a6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KjJ7uMP7eIamctIsWG+Yk0O37QW7sAhIw8pT8Xgx72c=;
        b=NgITedsQHRu3/K2wqodtFxIVZvgjpFEwc1+Q1IIaZof5Z9Ty4h384lom1cmtGYjA2t
         /h2AzmChidYtS8v6MS/QHdQ10rxkFA9/uRw2CYsdR7HVD3HHm5C4/1TwdkJjefqQ66Cz
         V/BLU6SNLdcLODP1YQpHJDsyZiGxec3MpwaDFrFPAUYF9YjW2RqSfReQLJ/MS2o/M+IA
         qRHBGCDmzfaCTUmb68CHgyRYH3DesB3A+5uGleo09ezYbfNDTetVUko3PWghHbHfQrp3
         u8+mVju/BxgEzTIsVG4SHgEpA8vBK10B0eBn7Vc3Ux0zKGLpMoI3DlzowIWv8Drdulxf
         fK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KjJ7uMP7eIamctIsWG+Yk0O37QW7sAhIw8pT8Xgx72c=;
        b=KIC1CzzC5uC12EfrCMtR8EmFHeKOFA8ymQP9pGYEdO8Q7oNthZJ7kxHYeD9R/bVJGO
         ogeCOoypMeJolB8luBIRrG0QJ6J3G3sr0eJzWjCdf1+LhvOlHBzcS9lS33bJM2HnNdy2
         gHRbmtkgyRPla9+4wGDZzplJ9HYw8RXSbvyPSBbGWrZkPNCwqDnskDA8DFtPapbdV4Ke
         slirCZUO1AloNJLs23Dc3qc01zrPL9wWzQ4h8aPE0yJeAPcrzlnwK/d/HSpVhCGmGwzZ
         J2BWYa+z9TngaCGsAV+EkgNrNnNmtuhczzUDml/oVj1AsGwCHag/hyqGDOtVb8vER1xa
         nanQ==
X-Gm-Message-State: ANoB5pl7aijLkBY2gqMrJuz36pmBeC1Rx8j9fKSpKAkGPPOG0es+4YOb
	+OckfBcSbx7z0+Fv8HahTpo=
X-Google-Smtp-Source: AA0mqf6l8NKDA0gl4xS0dLy7CGpsSI3swH7DybYPhD/pgEKURSSWLKc93VD5royDWEKOnsztQWzIXA==
X-Received: by 2002:a50:eb01:0:b0:46f:9507:36bc with SMTP id y1-20020a50eb01000000b0046f950736bcmr51284199edp.16.1671568788333;
        Tue, 20 Dec 2022 12:39:48 -0800 (PST)
Message-ID: <936f9395-c551-9277-0b9b-975ffb566ecd@gmail.com>
Date: Tue, 20 Dec 2022 22:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 0/7] Proposal to make x86 IOMMU driver support configurable
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <4b45cde3-52e1-15ae-7b6a-84c0d5141cc9@citrix.com>
 <6966791d-23d5-2613-da53-044b1621e3b5@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <6966791d-23d5-2613-da53-044b1621e3b5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/20/22 12:09, Jan Beulich wrote:
> On 19.12.2022 19:28, Andrew Cooper wrote:
>> IOMMUs are more tricky still.  They are (for most intents and purposes)
>> mandatory on systems with >254 CPUs.  We could in principle start
>> supporting asymmetric IRQ routing on large systems, but Xen doesn't
>> currently and it would be a lot work that's definitely not high on the
>> priority list.  At a minimum, this will need expressing in the Kconfig
>> help text.
>>
>> We need to decide whether it is sensible to allow users to turn off
>> IOMMU support.  It probably is, because you could trivially do this by
>> selecting CONFIG_INTEL only, and booting the result on an AMD system.
> 
> One other thing Andrew and I have been talking about: We probably do
> not want to tie the IOMMU vendor control to CPU vendor one. IOW we'd
> like to be able to e.g. build a hypervisor supporting Intel (only) as
> the CPU vendor, but at the same time having support for an AMD IOMMU.
> 

I totally understand. I am not aiming to tie the AMD/INTEL IOMMU support 
to any particular CPU vendor.

>> For the names, I don't think AMD_IOMMU vs INTEL_VTD is a sensible.
>> Probably wants to be INTEL_IOMMU to match.
> 
> Or simply VTD, covering the case than some other vendor comes up with a
> clone. But of course we have that same issue with "AMD" and Hygon ...
> 

I prefer INTEL_IOMMU over VTD, I think.

> Jan

-- 
Xenia

