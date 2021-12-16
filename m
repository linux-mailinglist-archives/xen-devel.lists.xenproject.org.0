Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF0476F00
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 11:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247854.427420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxoAd-0007RX-Or; Thu, 16 Dec 2021 10:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247854.427420; Thu, 16 Dec 2021 10:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxoAd-0007OK-L7; Thu, 16 Dec 2021 10:39:31 +0000
Received: by outflank-mailman (input) for mailman id 247854;
 Thu, 16 Dec 2021 10:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQEQ=RB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxoAb-0007OE-Mm
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 10:39:29 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 721daaf8-5e5c-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 11:39:28 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id k23so37876450lje.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Dec 2021 02:39:28 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v19sm1057662ljg.8.2021.12.16.02.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 02:39:27 -0800 (PST)
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
X-Inumbo-ID: 721daaf8-5e5c-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=S9gPEvO2N0R3SennJHgX65rGApE7aq/6AsLKv+zK+iQ=;
        b=akD4OTh/XVYX5GqjKC1KRmMihJOhlZMlHxrQQkxQLd7CEK3GH2hPfkGhHPQg+cnkuM
         YBnUBXK0Qomf2avCzZ33YlgHbgCjVUtAsn36PdSFMLPf7Z91UQmqOvJo8vb1Cjk2Yzdk
         M8dFY5VU/hI5pBWu7YnTAopyVJ0y4ahQ48H3r5kiJDst+mgMv9ZkI9hgTt3GhmDcOGdY
         IXS2DNDXfBmYYSSljGTiaXWPyduiorpAMO4pgij6YJcUGeihSiKuICv0/2ot3eT/9jc1
         OXfiyJk6RFBf2eJ/92Bim/W2ON+n0ct8jNIj5Nk6cmkmy6xq1MRfYyfN8rrAjDrVCkg5
         P4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=S9gPEvO2N0R3SennJHgX65rGApE7aq/6AsLKv+zK+iQ=;
        b=fdgF6JjJCgjym2FmaBQG9oSvJy7/9Konvwdsrs7NDNkWPvoHd5PdRC3AlG18P1oyd3
         Ltz8f4bCVsH4OvV/b7T4Ak69GudNU0yG+a5ocB+/F29I2vWsZyxNNPP+6MwJJCTbFSjm
         HkEO4Xv2VlRKvl5ztQ3Upb3H58o6dHmWJupi54cn4q1BZ4wVIG4RPwoRAkeLnq85VKrL
         BPskJoV355yU3cmym3ARiE/2uVqrtUUS/gsWfVXy9yuhn4ixBh9Yg/DRdeQb3ARCBjMG
         XqelX6K/oTULooI2a5JSKYOP7YOjGfRkdFCI/AK5o8XfCBb6w4AH4dGp8sSQ9o9W5Ayd
         tLVA==
X-Gm-Message-State: AOAM532T0qRMdlWvw7nyl01Th172swlEoRADgJ79RbmqlTHM/egm2H0Z
	R08wWnV7+MN0no9RxTXI95c=
X-Google-Smtp-Source: ABdhPJxGWr1dMPBdXJtO5Peo58fCIy0G/TQd4vKlsz2PjOw6pZ9igzzjIkUZ0bblTF9g9+57iAshzg==
X-Received: by 2002:a2e:948:: with SMTP id 69mr14863025ljj.82.1639651168180;
        Thu, 16 Dec 2021 02:39:28 -0800 (PST)
Subject: Re: [PATCH v2 14/18] IOMMU: fold flush-all hook into "flush one"
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
 <d0c860ea-2134-d8dd-9bf8-87cd9c1a9305@gmail.com>
 <ae7ba1bc-44cf-9b7f-87e7-f962807ab508@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <890b2930-04d2-6024-30bb-bb6a3c752cf4@gmail.com>
Date: Thu, 16 Dec 2021 12:39:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ae7ba1bc-44cf-9b7f-87e7-f962807ab508@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 16.12.21 10:49, Jan Beulich wrote:

Hi Jan


> On 15.12.2021 16:28, Oleksandr wrote:
>> On 24.09.21 12:53, Jan Beulich wrote:
>>> Having a separate flush-all hook has always been puzzling me some. We
>>> will want to be able to force a full flush via accumulated flush flags
>>> from the map/unmap functions. Introduce a respective new flag and fold
>>> all flush handling to use the single remaining hook.
>>>
>>> Note that because of the respective comments in SMMU and IPMMU-VMSA
>>> code, I've folded the two prior hook functions into one.
>> Changes to IPMMU-VMSA lgtm, for SMMU-v2 I think the same.
> Thanks; I wonder whether I may transform this into some kind of tag.


[IPMMU-VMSA and SMMU-V2 bits]

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


