Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02190619EEE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 18:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437802.692296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1or0do-0006yx-QJ; Fri, 04 Nov 2022 17:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437802.692296; Fri, 04 Nov 2022 17:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1or0do-0006vr-Lq; Fri, 04 Nov 2022 17:38:04 +0000
Received: by outflank-mailman (input) for mailman id 437802;
 Fri, 04 Nov 2022 17:38:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hzer=3E=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1or0dn-0006vj-4F
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 17:38:03 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e2a76ab-5c67-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 18:38:02 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id cl5so8013596wrb.9
 for <xen-devel@lists.xenproject.org>; Fri, 04 Nov 2022 10:38:02 -0700 (PDT)
Received: from [10.85.37.166] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a5d4307000000b00236883f2f5csm3823997wrq.94.2022.11.04.10.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 10:38:01 -0700 (PDT)
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
X-Inumbo-ID: 6e2a76ab-5c67-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vMeDD9OFej7/HtR8QIaN555ulxMS6lA7UV50wOqUVB4=;
        b=lXtpgEYuW1pdBz8aq6j15drhUo9VObzsGpfBwQfeBl1U6Tm9sL8N7IV1CSoyJGnR37
         rB+dz3FRpG9vPMkn/A6N1apBIzsmbOaODzyUVixwGNwIxgscsgVRlswck12I5hYSn9QP
         B+8JHhWll7XCulfzBY3ne8b42gWyccjevElfC1A201TCQFKvnOBQB8sMJZZJuHclN2Om
         NHAgNqUZvGvk3qNVGeAj4CGgwmDE+PAwN8EgotouRssiewoIqdbTMqiWJp08UxifWdmP
         WCkKVeZU/ZxaZO90inbN2zFc0QnEjx7ZKvRyckTmeWSjabTKeC6DJNbjyIAE60GZDxmE
         Xixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMeDD9OFej7/HtR8QIaN555ulxMS6lA7UV50wOqUVB4=;
        b=IiEfs3kPrsuc9Y1JOh4AoSkp0darX6JjECKaaGFpqTh56yc2rVphAQ99g1xE+/kCOj
         uQQOyskuFX5G2HvzboiLQryCbiGQO3Zkd7IFc0+bg3CaOxUj/0BSD1TeTD/8OfMIRqSw
         nLkersXY2bupUPz+OSoaslVXefslS/khHrdGZRh3dBj4fG+2CkwPOPqxl7RZZK7WAklY
         VM9udpEdtNr10TngwzPyOt/BQlzCbvJCLobNZKyQnb8DMR5eGCtLabSlqsIVz60hFXRq
         LazKQooLoGdGrMhGwhsrvsIvHN/BtNmhmvZgjos0IfDxl5wQXRkUfYbOO1OO/Pbtock9
         VJiQ==
X-Gm-Message-State: ACrzQf1cwoEeH5jRrElXDPObNgL2RLyZBsLxcfH2wE3v7Eiw5Q9ARIcQ
	LvI5QUtWzj2kkmNJkdaVNg0=
X-Google-Smtp-Source: AMsMyM5UKQh5a8rsvtrdsTxI43CyztD0sdTIWgUuqB3GUOCyj/YG8GmJ6NIAntjZwjO+UofLN0HK9w==
X-Received: by 2002:a05:6000:104:b0:236:a6f4:c67f with SMTP id o4-20020a056000010400b00236a6f4c67fmr23197448wrx.82.1667583481403;
        Fri, 04 Nov 2022 10:38:01 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d93ad249-8b6e-2ab4-482a-bfd8a07eb6b5@xen.org>
Date: Fri, 4 Nov 2022 17:37:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the APIC
 assist options
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Wei Liu <wl@xen.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20221104161815.38007-1-roger.pau@citrix.com>
Organization: Xen Project
In-Reply-To: <20221104161815.38007-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2022 16:18, Roger Pau Monne wrote:
> The current reporting of the hardware assisted APIC options is done by
> checking "virtualize APIC accesses" which is not very helpful, as that
> feature doesn't avoid a vmexit, instead it does provide some help in
> order to detect APIC MMIO accesses in vmexit processing.
> 
> Repurpose the current reporting of xAPIC assistance to instead report
> such feature as present when there's support for "TPR shadow" and
> "APIC register virtualization" because in that case some xAPIC MMIO
> register accesses are handled directly by the hardware, without
> requiring a vmexit.
> 
> For symetry also change assisted x2APIC reporting to require
> "virtualize x2APIC mode" and "APIC register virtualization", dropping
> the option to also be reported when "virtual interrupt delivery" is
> available.  Presence of the "virtual interrupt delivery" feature will
> be reported using a different option.
> 
> Fixes: 2ce11ce249 ('x86/HVM: allow per-domain usage of hardware virtualized APIC')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I find the logic in vmx_vlapic_msr_changed() hard to follow, but I
> don't want to rewrite the function logic at this point.
> ---
> Changes since v1:
>   - Fix Viridian MSR tip conditions.

Reviewed-by: Paul Durrant <paul@xen.org>


