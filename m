Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495FA7F7375
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640615.999065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6V1T-0005Oh-ID; Fri, 24 Nov 2023 12:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640615.999065; Fri, 24 Nov 2023 12:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6V1T-0005Mm-FU; Fri, 24 Nov 2023 12:11:03 +0000
Received: by outflank-mailman (input) for mailman id 640615;
 Fri, 24 Nov 2023 12:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AaTM=HF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6V1S-0005Mc-Gd
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 12:11:02 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87a65753-8ac2-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 13:11:00 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-332cb136335so1207233f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 04:11:00 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d21-20020adf9b95000000b003316debbde4sm4199405wrc.48.2023.11.24.04.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 04:10:59 -0800 (PST)
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
X-Inumbo-ID: 87a65753-8ac2-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700827859; x=1701432659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJXfCJVZvdFYPHULZOsT+q7fWluyt0q88PvXUY5K+jY=;
        b=iUbMmv/lFdkH0Tut4joZC/zC9gyo6sY8SO8qhjcNdfOgyYfh46wkDH2YtQvxFdSt3r
         rOBManzX2r31j+DtlKuICQ/d/o570aITlGhovRL2irJOYgODTVmv97JWyK0Wgwbs/tbJ
         2JaJPwnCJvPVyTQLAd85TGmtHsXCbnGHK2+sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700827859; x=1701432659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJXfCJVZvdFYPHULZOsT+q7fWluyt0q88PvXUY5K+jY=;
        b=g80Co3ej8ei12n9nIUj/LeU68kqWI/s3nRXrGvHvfY+0Ja3EPo/DELWGHfoHE3fg8N
         X2lgujwRApuNsOEwaIWw48KSaUsQocmX8khM239UQedC82I91tCYfcPi6+0YpTfcVbv+
         c+mPn1Zb/m449UAJUvoBzbE2ADJcvHCvqhFYCzK3mGbvfDb5x9gm6H1oU1TKmCeuLgkx
         Uk4VjzMb1t0ThwkVD1RT4wRh4NFEdMO6ihyxCmzzEeLAppcHyQaJHQWMjb9apZq3o8KN
         6laRWw/OTCLtvYj2Ztn82yNyeIofuH9I4yUxYALlBszufn/ocCDhkUyTXDyO6bgGQ8yF
         YYYQ==
X-Gm-Message-State: AOJu0Yw9QmirRx0ZfWf+NSe9yjiheCHuWLMyA9x6NIE06NL1xwS7vagr
	G0RfJFTqL1BbfUlne48LhN+eqQ==
X-Google-Smtp-Source: AGHT+IEWApM9qH0qZ3j2gWSDKCnmKOmVwJrZp9ggS2Sfjn3IJs8aZPWa/rR2BAqfbLPgexQFKXT/8g==
X-Received: by 2002:a5d:6188:0:b0:332:ca69:2fb5 with SMTP id j8-20020a5d6188000000b00332ca692fb5mr2085306wru.11.1700827859509;
        Fri, 24 Nov 2023 04:10:59 -0800 (PST)
Message-ID: <3706e5a8-7893-4e4e-a9b2-60517720f2a7@cloud.com>
Date: Fri, 24 Nov 2023 12:10:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] livepatch-build-tools: remove usage of gawk
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@cloud.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20231123160535.18658-1-roger.pau@citrix.com>
 <20231123160535.18658-2-roger.pau@citrix.com>
 <CAG7k0EqQZLZDMMJg=20EgnKwhbXZ9US-9zMs0NkJD7eWYR2vtA@mail.gmail.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <CAG7k0EqQZLZDMMJg=20EgnKwhbXZ9US-9zMs0NkJD7eWYR2vtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2023 11:43, Ross Lagerwall wrote:
 > On Thu, Nov 23, 2023 at 4:08 PM Roger Pau Monne 
<roger.pau@citrix.com> wrote:
 >>
 >> And instead use plain awk.
 >>
 >> There's no need to use the --non-decimal-data option for gawk, since the
 >> numbers that we want to print are already prefixed with '0x', and so 
plain awk
 >> will do the conversion from hexadecimal to decimal just fine.
 >
 > I don't think that's true (at least with gnu awk 5.1.1):
 >
 > $ echo '<e98b7>   DW_AT_byte_size   : 0x14' | awk '{printf("%d\n", $4)}'
 > 0
 >

I think it's a FreeBSD quirk. From their man page:

 >        Historically,  awk did not accept "0x" as a hex string. 
However, since
 >        One True Awk used strtod to convert strings to floats, and 
since "0x12"
 >        is a valid hexadecimal representation of a floating  point 
number,  On
 >        FreeBSD, awk has accepted this notation as an extension since 
One True
 >        Awk was imported in FreeBSD 5.0. Upstream One True  Awk has 
restored
 >        the  historical behavior for better compatibility between the 
different
 >        awk implementations.  Both gawk and mawk already  behave 
similarly.
 >        Starting with FreeBSD 14.0 awk will no longer accept this 
extension.

I'm guessing the latest FreeBSD doesn't have that behaviour either?

Cheers,
Alejandro

