Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A453A7E7EE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 19:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940710.1340376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1q3m-0004f7-Cz; Mon, 07 Apr 2025 17:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940710.1340376; Mon, 07 Apr 2025 17:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1q3m-0004ct-AE; Mon, 07 Apr 2025 17:14:58 +0000
Received: by outflank-mailman (input) for mailman id 940710;
 Mon, 07 Apr 2025 17:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1q3l-0004cn-Fg
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 17:14:57 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3f0363d-13d3-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 19:14:56 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso2680627f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 10:14:56 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a6a60sm12394313f8f.29.2025.04.07.10.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 10:14:55 -0700 (PDT)
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
X-Inumbo-ID: d3f0363d-13d3-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744046096; x=1744650896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=63P1a7xFlz9Ke0yGoOyltps5da/mpQP2BUKQqRM9a7g=;
        b=D1T2NKReHa/+sC+joXwqs/pZ/uLtCuh5Bt5Wo9xErwzw0QHsgWm/epvAb0l+UgpAA6
         XDr2m0TLRm0sCnLOqKaIPTZ0Ki5NXFfwUKrccCF5eaW3jtr/iqRSwNExsMF9Zh3nv8H1
         vM6qeAnT58eCN0ntNJjnb86JJcB66E1DhH1HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744046096; x=1744650896;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63P1a7xFlz9Ke0yGoOyltps5da/mpQP2BUKQqRM9a7g=;
        b=Ae8ECOatz9DCNCKPqRlKC4hshUnxERZuribb9o4eZ+TArnslp/0mY4oMbE0GcaiUPv
         K2TeeJ24mvHkeTGC16NKnnPHy6XPBsqtaDxA5cVKK4SruOoXO5in8ZbWrGWpA3gy26Pg
         xhZhIwKQWxovz4qD9v/UQkQD5lKiYdk3zB62Rn8o3kzn8rMjLv2CqrRFirodpu595TXP
         Vn/Dty1XLUVKchTcCG3jA9Bd4qDavbw3r6GbrWy1qk2DReQUnfy34hCkRs2ICOMrnfpc
         TY/issN2Claa7Irgj1GVtwQQSUT3pG0do72GgYpv7Oq545stQ0i78vAsnW+wNgJaLTBQ
         BEFA==
X-Forwarded-Encrypted: i=1; AJvYcCW2Jy7g1HgbG3kwU1w6MlxK6UiX/1Zf4FuHxNVI/sxJjeoWTwkYeYqr0igS2/R9rUbMEt4gd7bN2D4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGmtmnh03KuRuH2Qweb9kur6FHMyb39GQnEbJI4Cfj3yJOSOWV
	1i72eRIAIjFfXxT3CfNJoVNVXIzigNz46cRWewUxEbXYAirgvE34Ho0lbbqR7Ro=
X-Gm-Gg: ASbGncswOVNYMMBSkvACFxirmYW68ysksRf0zhz4nYnHTQyii/QLbXu+nUfWRn5FjeW
	c8/fB4EJv5ED7G6T6+c7qmnc3kCZ9wWFVLtHnrlvpZabI2YgZ0OwtTL6SP3tQ5ZAHv10JdLsw6p
	MTtYg2RE7mKI3m3OYkPj6sq7QBbstPWkEPbMVnVcCGGTsEWnvHVyx75V/lWpC+1GUHL1ocnxJ77
	fatLddVqh5AWfstrUnHose9p0sUuLJcue+RX7ytoymk64DGx14Lpf1f1N2eeNvAzLHkr2nnoJIU
	iDKX/H7XBlCq/zumA9B/Xi9F5Srp3x9fakJMP4njsZRXdauTOM5dxJbNR4uiAMGiAOSW7JKGI5u
	rQqprOSkxdg==
X-Google-Smtp-Source: AGHT+IG/5nicpik17TIE0yhmABrzCdidSs/7DiuUUl+XnGDAhnUgwSpboqii/czoGzxgqYYI73jI/Q==
X-Received: by 2002:a5d:584c:0:b0:390:e853:85bd with SMTP id ffacd0b85a97d-39cba93ce16mr11487041f8f.48.1744046095872;
        Mon, 07 Apr 2025 10:14:55 -0700 (PDT)
Message-ID: <e93abe58-a9a8-412a-afce-fe76e54ab2fb@citrix.com>
Date: Mon, 7 Apr 2025 18:14:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH test-artifacts v2 14/12] scripts: build initrd cpio
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
 <20250407123448.1520451-2-marmarek@invisiblethingslab.com>
 <16f91d01-ea1c-43ec-a5d8-a55bb84fe94b@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <16f91d01-ea1c-43ec-a5d8-a55bb84fe94b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 6:11 pm, Andrew Cooper wrote:
> On 07/04/2025 1:31 pm, Marek Marczykowski-Górecki wrote:
>> Build initrd format directly digestable by the kernel. Additionally,
>> include it itself inside as boot/initrd-domU file, for domU booting in
>> tests.
>> This should avoid the need to repack tar -> cpio as part of the test
>> job.
>>
>> Keep generating initrd.tar.gz as that's still used by older branches.
>>
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> ---
>>  scripts/x86_64-rootfs-alpine.sh | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/x86_64-rootfs-alpine.sh
>> index b70b3a5..13e85fa 100755
>> --- a/scripts/x86_64-rootfs-alpine.sh
>> +++ b/scripts/x86_64-rootfs-alpine.sh
>> @@ -58,3 +58,8 @@ passwd -d "root" root
>>  cd /
>>  tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
>>      bin dev etc home init lib mnt opt root sbin usr var
>> +mkdir boot
>> +find bin dev etc home init lib mnt opt root sbin usr var |\
>> +    cpio -o -H newc | gzip > boot/initrd-domU
>> +find bin boot dev etc home init lib mnt opt root sbin usr var |\
>> +    cpio -o -H newc | gzip > "${WORKDIR}/binaries/initrd.cpio.gz" \
> So, after looking at this a bit more, a few notes.
>
> Trailing \ needs dropping.
>
> initrd-domU probably ought to be named initrd-domU-base.cpio.gz so it's
> clear what it is.  These are easy to fix up.
>
> Looking through the current initrd.tar.gz, we've got:
>
> $ ls -lah ./var/cache/apk/
> total 1.9M
> drwxr-xr-x 2 andrew andrew 4.0K Nov  8 15:12 .
> drwxr-xr-x 4 andrew andrew 4.0K Sep  6  2024 ..
> -rw-r--r-- 1 andrew andrew 425K Nov  8 15:12 APKINDEX.73fc500b.tar.gz
> -rw-r--r-- 1 andrew andrew 1.4M Nov  8 15:12 APKINDEX.eb46142e.tar.gz
>
> which (alone) is 5% of the size of the initrd.  I'll submit a patch
> separately to drop this.
>
> But doesn't this result in initrd.tar.gz being included in initrd-domU,
> and then (doubly) in initrd.cpio.gz ?

No, because $WORKDIR is nothing, and we put it in /binaries at the top
level which is excluded.

~Andrew

