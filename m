Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930777E7AF3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:35:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630050.982726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nui-0006pB-Ol; Fri, 10 Nov 2023 09:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630050.982726; Fri, 10 Nov 2023 09:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nui-0006m4-LW; Fri, 10 Nov 2023 09:34:56 +0000
Received: by outflank-mailman (input) for mailman id 630050;
 Fri, 10 Nov 2023 09:34:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bl7O=GX=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1r1Nuh-0006lQ-Ko
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:34:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6670bd39-7fac-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 10:34:53 +0100 (CET)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-p2v5uzDvM6ehzhb72x1exA-1; Fri, 10 Nov 2023 04:34:51 -0500
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-670aa377deeso24008426d6.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 01:34:50 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-177-79.web.vodafone.de.
 [109.43.177.79]) by smtp.gmail.com with ESMTPSA id
 c10-20020a05621401ea00b0065b11053445sm2811472qvu.54.2023.11.10.01.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 01:34:48 -0800 (PST)
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
X-Inumbo-ID: 6670bd39-7fac-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699608892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NTsnJdGxjDhEztAzuwhMU9JIn1bpNpwf04ZyYJ9l+1w=;
	b=N1cCdATOHICQxTquEQhctxRhWEV8QlLMW6oxO92W2c6zgNVtx8/11QSOGZXuvl3wB47eUy
	gk9DKI0/yU7GYHYPf9j41zM8aK5AP7CjcdzZrl63ejjLjasJLf/yRx7cEndwTRfRoKwMSL
	tXNoGMZ/GM/8b7oVRNhrH/zXFhX1bJg=
X-MC-Unique: p2v5uzDvM6ehzhb72x1exA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699608890; x=1700213690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTsnJdGxjDhEztAzuwhMU9JIn1bpNpwf04ZyYJ9l+1w=;
        b=UteQVQgaGd1rPX4SxrQAscsz2FdnTqMciElwh3b7Vg+DgH5Pu8OsXHY/dvGQNMPtni
         tml9iojp+xmGyJvLMRRIVDPEHV5YBXIfdKkQwrwxIRDf2Fjmj33zqDnB959ZLGS8UheO
         FaoJGWEFPZw92B9ylemFQv9vEcvjcoODRn3dde8wd+UX4xTrgpaBP5SLTRRbqbm/7a76
         tZMMavNtn0UeVg7BLSq4URXTrlEZGN11/s6R7oOnFPr3xhf2U4J/M0HO3QkG2ak/yw6V
         Y5EAnpMuDlifea0hFT/dDWRYgc1D+IOdZ8lfsX4oD2i+U5evPt2ABFePVoj6GECuNm0+
         8kFg==
X-Gm-Message-State: AOJu0YyzyPPLk3g0BuxZnDhCyea77IS6FpfXrMw28wy+CzuKBO0Ydpi4
	MaK9PDpf8yGoXwosGuC0yvtGNqb0crucwkuZyqU5zFfP7ASR1EMxtnfKVyxrrY+IhzWT404Jo60
	i+2if/2gSGMNKCIQugFVCDkz7txw=
X-Received: by 2002:a05:6214:d0a:b0:649:384f:ed4 with SMTP id 10-20020a0562140d0a00b00649384f0ed4mr7770138qvh.19.1699608890528;
        Fri, 10 Nov 2023 01:34:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJLKg/dvgvKTN/DZXV+SdBghD+/OdrnZF612WtjGvCnfTt3oU2Kv4nG/OszrlY8jSPg7U6cw==
X-Received: by 2002:a05:6214:d0a:b0:649:384f:ed4 with SMTP id 10-20020a0562140d0a00b00649384f0ed4mr7770066qvh.19.1699608888278;
        Fri, 10 Nov 2023 01:34:48 -0800 (PST)
Message-ID: <0795d03d-602d-4064-a3da-c019e4d12189@redhat.com>
Date: Fri, 10 Nov 2023 10:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include/hw/xen: Use more inclusive language in comment
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
References: <20231109174034.375392-1-thuth@redhat.com>
 <2ae66eda-3560-2930-4bbb-87345a719f32@suse.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <2ae66eda-3560-2930-4bbb-87345a719f32@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2023 10.30, Jan Beulich wrote:
> On 09.11.2023 18:40, Thomas Huth wrote:
>> --- a/include/hw/xen/interface/hvm/params.h
>> +++ b/include/hw/xen/interface/hvm/params.h
>> @@ -255,7 +255,7 @@
>>    * Note that 'mixed' mode has not been evaluated for safety from a
>>    * security perspective.  Before using this mode in a
>>    * security-critical environment, each subop should be evaluated for
>> - * safety, with unsafe subops blacklisted in XSM.
>> + * safety, with unsafe subops blocked in XSM.
> 
> To avoid another round trip when you send the patch against xen.git, as
> already asked for by others, I'd like to point out that the wording
> change isn't describing things sufficiently similarly: "blocked" reads
> as if XSM would do so all by itself, whereas "blacklisted" has an
> indication that something needs to be done for XSM to behave in the
> intended way. Minimally I'd suggest "suitably blocked via", but perhaps
> yet better wording can be thought of.

Ok, could then please someone from you Xen guys get this fixed with 
appropriate wording in the xen.git repo? I never checked out that repo 
before and before I now spend hours and hours to figure out how to 
contribute a patch to Xen, just to replace a single word, it's way easier if 
someone with pre-existing Xen experience is taking care of this.

  Thanks,
   Thomas



