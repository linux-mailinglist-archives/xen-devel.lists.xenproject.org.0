Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA37CA5D0A2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:17:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909086.1316154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts62O-0000QD-12; Tue, 11 Mar 2025 20:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909086.1316154; Tue, 11 Mar 2025 20:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts62N-0000Ol-UH; Tue, 11 Mar 2025 20:17:15 +0000
Received: by outflank-mailman (input) for mailman id 909086;
 Tue, 11 Mar 2025 20:17:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts62L-0000Of-SN
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 20:17:13 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cee29f4b-feb5-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 21:17:08 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so4681759f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 13:17:08 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e222dsm19075319f8f.72.2025.03.11.13.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 13:17:07 -0700 (PDT)
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
X-Inumbo-ID: cee29f4b-feb5-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741724228; x=1742329028; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=da4t1uU9hY6xerZJCoOF6RZuZ45wNLb8GcrSLMZ7rYU=;
        b=XVJv0YvQHbIRHowhDUkPqN19o3WppvmCJNQzJ+PmSYrw+ue1qGZS8gOUB0Gl3IkfDM
         HpaWXbK+8cNdI3Fl16He/WDWJcmO3Zsdv0WS/tVZW3vzbZf4Pw2MBpU+h3HBlLeTen1C
         WeehNjcuuMauVugIPKbyJAcHxDzPbFwccywJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741724228; x=1742329028;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da4t1uU9hY6xerZJCoOF6RZuZ45wNLb8GcrSLMZ7rYU=;
        b=VsA76iUDS4hC6jUFf+3ki6BTR0eEghnmVmRUzSb2lkfDP3d3nbepUR35ah0hgqpgzh
         BixPwHWrqN8tez/S7ZMJh32nPh5VW8zK/1d2Ra6Kv7p8D9QHFfVrC9nzGwgOtQAabHmy
         Di8Yn3LThkF0TggBlwq7ZzY2G0jclhkcNkpNh93WZscOV+0iFVXAopUBYBRT0KKOq17u
         /18jSxkzofk5n077ZyeroSrcTMu+SSMVXrOb9L/96ICYEzg74DND5VvqMSfCdcJOr2JK
         4S9dIwMsqQhhBgb/BmskuJc6SIzm+LWkfSc74+3LlUPSSlcfnvHWxpLYi+ZH3t2Jwpc/
         0eqA==
X-Gm-Message-State: AOJu0YzN9E1yhNUaRWY1vdf/gZE1mYQTYfgu1BgfDbc23o1HKRc3MLVs
	4Dd+I59Yt0+Mz4JAXzqxIILklhQrS2h0rrs9asXR+nI4D9gCqn5ER40X/QO4/pk=
X-Gm-Gg: ASbGncslBxxVMKIjBpy5Off58uR1iq3JX3ZsxNri8Ldr+K94JlEyTAFPdCNLldRIYcX
	zqqc2BwZ/op4HUChetNMQZ/pDr84gRngk1v80rZUUNhaxzj7Gs/u+v+OI1dP6odVeGua2lz7H98
	s+9PHkck+gIGWN/u+NBPhR9d6xRuxUUrLr/1YmLcc5hifWiGnu5DmypXM9HkWoX8J1tg5ObHRov
	O0aR5mRWfc60bdbB6yXc+lhpMwuNNRBidTh101oKaF6oDd5yfY323yBLTFgA4B7a5UnNwXKagHJ
	ItWudSbHZyV3y6fWsOyohWhXmefw68Ihq1eKoQA2iAR5ZOa37OAY0Fm+wd6X+PW4ESl8Q/WDmb3
	KrJhjhvMg
X-Google-Smtp-Source: AGHT+IGuS1GfO+XenCRYXvQ5sLmaWbCOo3aLpe988exkpKNNS9hykVycnWPuA9L1mgrNkaeY6/nx8Q==
X-Received: by 2002:a5d:47c1:0:b0:391:2bcc:11f2 with SMTP id ffacd0b85a97d-39132d2ac45mr13516401f8f.1.1741724228093;
        Tue, 11 Mar 2025 13:17:08 -0700 (PDT)
Message-ID: <cbf75ca2-5370-457b-9aff-399d605028be@citrix.com>
Date: Tue, 11 Mar 2025 20:17:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MISRA: Rephrase the deviation for Directive 4.10
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20250304235701.2770842-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2503041616560.1303386@ubuntu-linux-20-04-desktop>
 <08bb0c67-f5c4-401d-be63-5c20d0297b59@xen.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <08bb0c67-f5c4-401d-be63-5c20d0297b59@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/03/2025 7:48 pm, Julien Grall wrote:
> Hi,
>
> On 05/03/2025 00:17, Stefano Stabellini wrote:
>> On Tue, 4 Mar 2025, Andrew Cooper wrote:
>>> The use of "legitimately" mixes the concepts of "it was designed to
>>> do this"
>>> and "it was correct to do this".
>>>
>>> The latter in particular can go stale.  "intended" is a better way
>>> of phrasing
>>> this.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.

>
> Going through my email, I noticed this patch was not committed. I
> wonder if there was any reason?

Urgh, it was supposed to go in ahead of 3da2149cf4dc6 ("x86/IDT:
Generate bsp_idt[] at build time") which uses the new format.

Also ahead of XSN-2, although the part needing this has been deferred
for the meantime.

But eclair is still non-blocking on D4.10, hence why staging is happy.

I'll pick this up in my next sweep.

~Andrew

