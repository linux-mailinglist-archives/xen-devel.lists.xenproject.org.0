Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D7900C9E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 21:52:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736611.1142720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfdd-0006kj-OM; Fri, 07 Jun 2024 19:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736611.1142720; Fri, 07 Jun 2024 19:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfdd-0006ht-Lf; Fri, 07 Jun 2024 19:52:37 +0000
Received: by outflank-mailman (input) for mailman id 736611;
 Fri, 07 Jun 2024 19:52:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G7b/=NJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sFfdc-0006hn-Gd
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 19:52:36 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c025b62-2507-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 21:52:35 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42138eadf64so23561375e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 12:52:35 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c19e567sm61990025e9.1.2024.06.07.12.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 12:52:33 -0700 (PDT)
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
X-Inumbo-ID: 7c025b62-2507-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717789954; x=1718394754; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OZR5Z4FZDaVyZaOFYSyVepY1mSOtms4IyKreQI/Tdt8=;
        b=aBdnN0GGrO95x3MxRC1hP4U3yd45XPB2IZ16V9RSKJm73CnmDcin13Owhwk1STt1EX
         7bjKdaAgjor9bzg4/7pNoCTCjevN0qFgbumHdF/EoB2rSgBggF2BWkds/JM4VgjQdJbb
         TLk9achZp3aongVb64kHWopkJ4mfHtNa8CzUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717789954; x=1718394754;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZR5Z4FZDaVyZaOFYSyVepY1mSOtms4IyKreQI/Tdt8=;
        b=sG2GKNAlBUCS9HVgsYmO4XR61wufN4t6fwp3twsAXfeKE/1YIgJtkaTGVUgzVBrsLS
         b5+shoQBHZY8IBl5fJ82Y9RHnEdxdPVfn7Samh3//KoOtd1KxDAgRVf/ZjmJ7Uhemlpb
         bD01SMqBbaB0J3FEgHoDo7v2E9FL4AQa5+jpmQoLkiWMrXQTFII31i+G+xLGQMxcVOGu
         P7GMZwqwUky6SLS0JxmxHJNUlWdhQTXUTH0h516NSyrCM+3vF1P9ZHGTDVRH/a5qRcOJ
         2DpA8e7L/ER7sZiniTZ0KZqXYgQFEJ0xZCsAPJ/u1kA7Q7PvOOvETjwbCbScmREWZqCO
         qOTA==
X-Forwarded-Encrypted: i=1; AJvYcCX4lYlHDp3bV/DwaI8sX9KzRRMn+V+gNk6pcSa4cIeHXb3wcVWwhhWPs2rPsAoCKB7b8Dfccifr1hNxUL7+lnDI5eK7Z5NjOi3hiDaS6nQ=
X-Gm-Message-State: AOJu0YzYn+dDYCbgGPEiBtsq5MVNd7C2SLuByf6R+QI2T2lhIGoagcOV
	D1OHUffxpPnCoWR84j7rqYsiRM+hrHQnG9uTDOGWhDmMr8XxHybHudLxHjLmJjkR9k39G3QSr7m
	VTVA=
X-Google-Smtp-Source: AGHT+IEwD7O0SxodzlQfbKwVENZVJGDlzOwZspVwNUJ2KfEtadHXcc+CtnM40Z6RJkP/Wc1JggRYwA==
X-Received: by 2002:a05:600c:474d:b0:41f:e2c5:6618 with SMTP id 5b1f17b1804b1-42164a32877mr29529755e9.32.1717789954184;
        Fri, 07 Jun 2024 12:52:34 -0700 (PDT)
Message-ID: <9cbb6dce-b669-4237-8932-b5cd64eb7288@citrix.com>
Date: Fri, 7 Jun 2024 20:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Segment truncation in multi-segment PCI handling?
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <ZmNjoeFAwWz8xhfM@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZmNjoeFAwWz8xhfM@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/06/2024 8:46 pm, Marek Marczykowski-Górecki wrote:
> Hi,
>
> I've got a new system, and it has two PCI segments:
>
>     0000:00:00.0 Host bridge: Intel Corporation Device 7d14 (rev 04)
>     0000:00:02.0 VGA compatible controller: Intel Corporation Meteor Lake-P [Intel Graphics] (rev 08)
>     ...
>     10000:e0:06.0 System peripheral: Intel Corporation RST VMD Managed Controller
>     10000:e0:06.2 PCI bridge: Intel Corporation Device 7ecb (rev 10)
>     10000:e1:00.0 Non-Volatile memory controller: Phison Electronics Corporation PS5021-E21 PCIe4 NVMe Controller (DRAM-less) (rev 01)
>
> But looks like Xen doesn't handle it correctly:
>
>     (XEN) 0000:e0:06.0: unknown type 0
>     (XEN) 0000:e0:06.2: unknown type 0
>     (XEN) 0000:e1:00.0: unknown type 0
>     ...
>     (XEN) ==== PCI devices ====
>     (XEN) ==== segment 0000 ====
>     (XEN) 0000:e1:00.0 - NULL - node -1 
>     (XEN) 0000:e0:06.2 - NULL - node -1 
>     (XEN) 0000:e0:06.0 - NULL - node -1 
>     (XEN) 0000:2b:00.0 - d0 - node -1  - MSIs < 161 >
>     (XEN) 0000:00:1f.6 - d0 - node -1  - MSIs < 148 >
>     ...
>
> This isn't exactly surprising, since pci_sbdf_t.seg is uint16_t, so
> 0x10000 doesn't fit. OSDev wiki says PCI Express can have 65536 PCI
> Segment Groups, each with 256 bus segments.
>
> Fortunately, I don't need this to work, if I disable VMD in the
> firmware, I get a single segment and everything works fine.
>

This is a known issue.  Works is being done, albeit slowly.

0x10000 is indeed not a spec-compliant PCI segment.  It's something
model specific the Linux VMD driver is doing.

~Andrew

