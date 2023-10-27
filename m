Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D578E7D9547
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 12:33:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624337.972840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwK9D-0006IA-O7; Fri, 27 Oct 2023 10:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624337.972840; Fri, 27 Oct 2023 10:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwK9D-0006Fk-Ko; Fri, 27 Oct 2023 10:32:59 +0000
Received: by outflank-mailman (input) for mailman id 624337;
 Fri, 27 Oct 2023 10:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwK9C-0006Fe-4O
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 10:32:58 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24c23b6e-74b4-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 12:32:35 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so15444845e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 03:32:35 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b0040775501256sm1300940wmq.16.2023.10.27.03.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 03:32:34 -0700 (PDT)
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
X-Inumbo-ID: 24c23b6e-74b4-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698402755; x=1699007555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EnKvJtLdMM1klAtGShdO3PmXCUUiIZMF8/1aPxmDPfI=;
        b=dhYkoX/m2dPnJrTZbdHie3tSY0RerR6z+M2k5+I5Z8i9iP0a6LNoKqlhwQt0C0IwTh
         r2LeKM5hkabKNM7PfnoIo4TFAUuchpZsg8eY25uIbNx1TlfE6CmYf9bNgdP2Ph2MGPk9
         pOPRQH2pc23J/8HgsrmavuKwN3mMzM19f1+lAc4lS3RENZ5s7xrgHFO5ZNDhdhTIBFf4
         f5H0ztScOFpnP/gZTXR++wcXWOY0rm9e7f3CM2PYYil8PfOBmw3l5HpFmupCHLkzR953
         Z06HOgE2rZzAfNpR3J89OTguZWDetqeBQOyJYDTP4w6ivVhbOQeuA7FsucQZEjaFc6Vv
         h7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698402755; x=1699007555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnKvJtLdMM1klAtGShdO3PmXCUUiIZMF8/1aPxmDPfI=;
        b=hTBvtEVoMZ9klQi8TT46UkpaDMoipKpYvFCNEsbCouSaPjGWArYQCoRiLK7FqqUWyb
         pcUXJS/DSNy21l2jCfN870W3RJTWsEecLwUB0Z/HK2HpS9Quix/qEk2dCJAHKd+oOTiq
         BckJXJKkt2Q7sogkPwAG5fdIynO+1JjayYPhvqMsH/RkwlWOmCI95cg9VFA9ztODEH1k
         HLfJ2/Y1OOCdboq1ym2ymF3UjpwqydRJ2wqCIeEzLQuKK+otOrzZQxL18wcMkFHYuYpq
         Duq1tecRrw0RdSCFsik1cLv9tDVkzL2Ou9/2gpnnxRAvGMHM0/i2PfuyNhn320fcdL7j
         mHyw==
X-Gm-Message-State: AOJu0Ywc7hTOiL+IjOrVj3d60icZo6v5abME2PCyfaQOBsn+HOn3t8qW
	5/Epym+rw0VmkgB0t8WyJdo=
X-Google-Smtp-Source: AGHT+IGWDabcILZvppndibIT+VlcAXisSRXRTOoY9Ub291eXsQSLS1cJV/CaQEshHMvzRuA7gSjyGg==
X-Received: by 2002:a05:600c:1f94:b0:406:7232:1431 with SMTP id je20-20020a05600c1f9400b0040672321431mr2033254wmb.33.1698402754916;
        Fri, 27 Oct 2023 03:32:34 -0700 (PDT)
Message-ID: <c538ea45-dac7-49f3-ad50-8c3a59755dee@gmail.com>
Date: Fri, 27 Oct 2023 11:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 13/28] hw/xen: automatically assign device index to
 block devices
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, paul@xen.org, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-14-dwmw2@infradead.org>
 <74e54da5-9c35-485d-a13c-efac3f81dec2@gmail.com>
 <f72e2e7feed3ecf17af8ab8442c359eea329ef17.camel@infradead.org>
 <9fb67e52-f262-4cf4-91c2-a42411ba21c4@gmail.com>
 <b6458e730fd861243f534e33a48a857122e77ed5.camel@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <b6458e730fd861243f534e33a48a857122e77ed5.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/10/2023 11:25, David Woodhouse wrote:
> On Fri, 2023-10-27 at 10:01 +0100, Durrant, Paul wrote:
>>
>> This code is allocating a name automatically so I think the onus is on
>> it not create a needless clash which is likely to have unpredictable
>> results depending on what the guest is. Just avoid any aliasing in the
>> first place and things will be fine.
> 
> 
> Yeah, fair enough. In which case I'll probably switch to using
> xs_directory() and then processing those results to find a free slot,
> instead of going out to XenStore for every existence check.
> 
> This isn't exactly fast path and I'm prepared to tolerate a little bit
> of O(n²), but only within reason :)

Yes, doing an xs_directory() and then using the code 
xen_block_get_vdev() to populate a list of existent disks will be neater.


