Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B90A7E5FC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 18:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940552.1340287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pA0-0007Od-8t; Mon, 07 Apr 2025 16:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940552.1340287; Mon, 07 Apr 2025 16:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pA0-0007Lr-5I; Mon, 07 Apr 2025 16:17:20 +0000
Received: by outflank-mailman (input) for mailman id 940552;
 Mon, 07 Apr 2025 16:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1p9y-0007Ll-Q3
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 16:17:18 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c686749d-13cb-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 18:17:18 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso2022567f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 09:17:18 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b760bsm12598130f8f.55.2025.04.07.09.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 09:17:17 -0700 (PDT)
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
X-Inumbo-ID: c686749d-13cb-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744042637; x=1744647437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UGizbuRXYzF7nTZrASmKVPyPZOmxaFSBHvFc7XsqrCU=;
        b=ifym7EN7NOtzFN44Zt6+Jr9kt2ZUpFTMz/BleLqQS2fR0QBRqboAefoQy1MjBWToPv
         NHgVKgIUBFYSQGG9lGtRdFXawln+/13v92Oix7jWmNEbcasI9ohCCgk72neeKWJ6hJE2
         zFfJhi9qnHjVZ18873qE4AHqM5/uCfKSr1ems=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042637; x=1744647437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGizbuRXYzF7nTZrASmKVPyPZOmxaFSBHvFc7XsqrCU=;
        b=mqDnOfwB9FH6k1Gr+KbisA9Ee//WmZB8wVr8UMykyRy176FWqgr4fMV6nQIS93MP/q
         24reDXp17xHFhTGDH6HTFiGshawFK++TMLfI9KgNsWQi4Ei+CeGGMKOO6xh6nXfQ+m73
         iaU+QXr0g0gWQfK8d3cfHNfwaA1D0IKFLp0elhqKnWa9VxvMyjyppj48Qw4q/3U3hq6I
         HUzMW6Uc8PfjuH26PX2+TIkaADqtZxxV2X3qV9yBJot32yB1890LdKtTxS0T47iwvYII
         D0qBFHUB8zjvxGceCePGGBWt0gij1AVreWrki/STFSZz3xRTI0xGTZzyBoppDp94/jvW
         aS8w==
X-Forwarded-Encrypted: i=1; AJvYcCVLPznif8u0w5uHXqlFtJQP1xfAUUT+FJEMiaOxxY4Ch91F1Tx9NADFfpO4RxpjuH82svEfG1gDJHE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywkm4XC3fo8lBqiw6aEG6mk1TkZD2c4RBbKjftMpGjVTXBmTKvF
	L9VbY3mDthXx2MOLN3p8CFekx+bKvY1DM6vqB1CxK7cJblk2jwmFQB3GuSlujxM=
X-Gm-Gg: ASbGncsOxekSaFS76iTm5bMPulukWA3W1CC2c5KlMRQzndpiHWdIAoD6JSIzk4Xl2zr
	uXb8u6VED5YYEPURZUl+ASwd7sEv0HvbV/k4Y/RwQiCtX77rGSmqb9PuTbOevk3v/v/LPxmUAxd
	V/r/b9paTUO6yGy4s775xKFJVb2VpSjjWAulY7230Pp6dLbTF5ucC4VdFqlnP6OINlmnnHC3XtT
	QO+jCwUZDQkLUdSS1Qy8KfAqfZdb37elRUi2lwf8YPrWAK2GFWlLFXJdGR6QtQJZeruOxOSgQ+I
	O1G7kOQONsyCAdHzpVFb5K8xZ5GSDLvmGbHp3qWOLsL6i5anC1Ypd1Q4suDqkJNrsx+1B9f501v
	8GpvASxA8dw==
X-Google-Smtp-Source: AGHT+IGP2yvZrB5Gu+fPKU+xYt1BGz981SHSVsXQfV3kh/3j9fBxQUAn/t4ydiv7GHWejaR8KEf2mg==
X-Received: by 2002:a05:6000:440d:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-39d6fd06920mr5903580f8f.55.1744042637449;
        Mon, 07 Apr 2025 09:17:17 -0700 (PDT)
Message-ID: <a2b01279-4e67-4ce9-9752-21c16c33fe32@citrix.com>
Date: Mon, 7 Apr 2025 17:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH test-artifacts v2 14/12] scripts: build initrd cpio
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
 <20250407123448.1520451-2-marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250407123448.1520451-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 1:31 pm, Marek Marczykowski-Górecki wrote:
> Build initrd format directly digestable by the kernel. Additionally,
> include it itself inside as boot/initrd-domU file, for domU booting in
> tests.
> This should avoid the need to repack tar -> cpio as part of the test
> job.
>
> Keep generating initrd.tar.gz as that's still used by older branches.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
>  scripts/x86_64-rootfs-alpine.sh | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/x86_64-rootfs-alpine.sh
> index b70b3a5..13e85fa 100755
> --- a/scripts/x86_64-rootfs-alpine.sh
> +++ b/scripts/x86_64-rootfs-alpine.sh
> @@ -58,3 +58,8 @@ passwd -d "root" root
>  cd /
>  tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
>      bin dev etc home init lib mnt opt root sbin usr var

What's required to drop the tar version?  Presumably merging the rest of
your series?

> +mkdir boot
> +find bin dev etc home init lib mnt opt root sbin usr var |\
> +    cpio -o -H newc | gzip > boot/initrd-domU
> +find bin boot dev etc home init lib mnt opt root sbin usr var |\
> +    cpio -o -H newc | gzip > "${WORKDIR}/binaries/initrd.cpio.gz" \


