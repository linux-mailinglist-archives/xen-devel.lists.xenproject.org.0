Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E322DA85BC4
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 13:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947230.1344902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Cdv-0005QS-BO; Fri, 11 Apr 2025 11:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947230.1344902; Fri, 11 Apr 2025 11:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Cdv-0005OA-76; Fri, 11 Apr 2025 11:33:55 +0000
Received: by outflank-mailman (input) for mailman id 947230;
 Fri, 11 Apr 2025 11:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3Cdt-0005Nl-Oo
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 11:33:53 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7d653e3-16c8-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 13:33:52 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4394a823036so18856335e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 04:33:52 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f206264a1sm86325815e9.9.2025.04.11.04.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 04:33:51 -0700 (PDT)
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
X-Inumbo-ID: d7d653e3-16c8-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744371231; x=1744976031; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eavN+UxZaYl9HVpFgZ9FL+Zw8ouiUxvVX8+glAOBRgs=;
        b=Cbx1kK5auMWAOqnlEb4MFF1nBjG/lPWNdDl9tPFU1RRQE8Wfyn+iMQ9cyXT9X1ksyK
         /u6A/Ez/vN05QsOsupLQYhZg6lT2ECUVqhhzykezcTwmY5vt7Hm7y9ovfXTQf8daacjs
         xdZUtuudEbvBVG/hw+naN9YDanMMEHWT+dcR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744371231; x=1744976031;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eavN+UxZaYl9HVpFgZ9FL+Zw8ouiUxvVX8+glAOBRgs=;
        b=q0WjlTPMIaroxaagEiwB8GFh0BA30a2aeHpKc+BfelqJ3ROeia3S8ED6fPCrcj/MCF
         xvrYu49k/R1SQrG7UgNFG7zWHS5z0Wo8DVns7INkmgJFn9y5Bl+MMjREILdJaDdcX4ec
         DGxqKGx94nwU3hWBejDN7Uwa4cy8Cm+9DikQ3yu9ijdNjLjCSUzmJ5wlES6vBUfTLbS0
         3sfDKNhF5PHFf1anVmubvCVQM0Oh4xTGbJGbBBNztBpvTx+cU+JMyktCsmtbuzQX34Yg
         D+ZfCK2JW8pShPfZmOqTsFRikoeB5fh0ret+AGRHl2Xi9Rti/VQByOSm1x+/BVSZrbDP
         OGPg==
X-Gm-Message-State: AOJu0Yx2ayzgWV+FgLV0KBihsikpS+jHORAolHyhyUsQXFNY1EnhVTqs
	Dg79u0RzYyarRdNlmWKqV9uvIf5kAbIfnuV/96HTv9rxiqoFIL+OhHi8ak5PRAI=
X-Gm-Gg: ASbGncul3Qyn+verUzaGE2yyTg98OIznH0wrno8PoOXYrrHK4Z6LjJU++oq2h6b7DFX
	dpTRpRnOFWGGxqm68G+GKLNyPfDM04ycLyisQa1NOyXXxXeFfUlB+2CCbu5GaW9Isy/kY0qggXP
	VsE/OPGqiQpwfPkk+Eo7xUeELynr9mqXBevM2kjLmAOok0g6+IMEEqW6+R9SAF+MJ4GV1u7cPYw
	7KqBlu24VKaoGOgpl1LHQ9hQv+8l928kBLPUk5WuGtyeHiq/P6SirAcrlvetEjuJKI6wZM7gsH5
	KFjC2O+wrwvWoYxytnZ2wAWXolVhjq6jsRIw2bMsYlQKDdHq34pRCD0aq44IoE1+GtMxN8Di7Gk
	sJ8Ct7A==
X-Google-Smtp-Source: AGHT+IEFslOQgXVd8i8pO2DTOLdsROWwMCJCdrusA8GIaJPiiY5vN8mBBk+w6QQkb9SEFMUpjeb8mA==
X-Received: by 2002:a05:600c:a02:b0:43d:7bfa:2739 with SMTP id 5b1f17b1804b1-43f3a9a6f5dmr17815855e9.23.1744371231447;
        Fri, 11 Apr 2025 04:33:51 -0700 (PDT)
Message-ID: <7dd33457-f748-45b5-b885-eb451bdab9e9@citrix.com>
Date: Fri, 11 Apr 2025 12:33:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Rework rootfs generation to make a cpio archive
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com>
 <20250411105217.2141356-2-andrew.cooper3@citrix.com>
 <Z_j3wXtigDHb6i6P@mail-itl> <de67e64b-beb8-4fb0-8ad2-323ff8ef53f9@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <de67e64b-beb8-4fb0-8ad2-323ff8ef53f9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 12:09 pm, Andrew Cooper wrote:
> On 11/04/2025 12:06 pm, Marek Marczykowski-Górecki wrote:
>> On Fri, Apr 11, 2025 at 11:52:15AM +0100, Andrew Cooper wrote:
>>> diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/alpine-rootfs.sh
>>> similarity index 75%
>>> rename from scripts/x86_64-rootfs-alpine.sh
>>> rename to scripts/alpine-rootfs.sh
>>> index b70b3a54ede5..c29c92d1c682 100755
>>> --- a/scripts/x86_64-rootfs-alpine.sh
>>> +++ b/scripts/alpine-rootfs.sh
>>> @@ -56,5 +61,17 @@ passwd -d "root" root
>>>  
>>>  # Create rootfs
>>>  cd /
>>> -tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
>>> -    bin dev etc home init lib mnt opt root sbin usr var
>>> +PATHS="bin dev etc home init lib mnt opt root sbin usr var"
>>> +
>>> +case $1 in
>>> +    cpio)
>>> +        find $PATHS | cpio -o -H newc | gzip > "${COPYDIR}/rootfs.cpio.gz"
>>> +
>>> +        # Print the contents for the build log
>>> +        zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
>> add 'v' to cpio above instead?
> Oh, of course.  There's another instance of this pattern in argo, which
> I'll fix up too.

Apparently not. 
https://gitlab.com/xen-project/hardware/test-artifacts/-/jobs/9695952322

I expect the -v is getting swallowed by the pipe.

~Andrew

