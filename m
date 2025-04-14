Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CFCA889D5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 19:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951008.1347160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ncj-0002H1-UG; Mon, 14 Apr 2025 17:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951008.1347160; Mon, 14 Apr 2025 17:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ncj-0002EH-R6; Mon, 14 Apr 2025 17:29:33 +0000
Received: by outflank-mailman (input) for mailman id 951008;
 Mon, 14 Apr 2025 17:29:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Nci-0002E9-N4
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 17:29:32 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 069a6596-1956-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 19:29:31 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so47553725e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 10:29:31 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2a13sm180941335e9.10.2025.04.14.10.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 10:29:30 -0700 (PDT)
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
X-Inumbo-ID: 069a6596-1956-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744651771; x=1745256571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R9CaE9Jjuz4sTEOU81Mn38hbKic4iVV4jbRNDLyRxYg=;
        b=IzvqiYIv6um1lilALBa1VlC09nroVdbnTKi0OgKpnZGMTyoS0iVkok2FdVR9KC+rL7
         VYuftNYQ1sPbkTBsi17S/rmJqFhxNF4guB/NKn84h5f0JoJM87yPRpnq7vuMq0AQjcIt
         Orc2cvy1u+rxA+Ekq4vl2hl3jzFv6fVU++Fu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744651771; x=1745256571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9CaE9Jjuz4sTEOU81Mn38hbKic4iVV4jbRNDLyRxYg=;
        b=tcriQSsp24ludqqHqsh7+0KbW5A1V94eqUV/tPYXJMcxIeScXDxsxXa+L6WYA76c6A
         bYc2JG5ql5uhtiP+AoCzsAjD1wg7iNOcum1qWbH0tv9R7Er9HGDLEkOD6uYt3ZnER800
         yN7QnpIELgC4VCZ+vDT9BCNcFhSW5c5ydN3Np8eH7ZaFU2n0kOAtxb48ss0DJ0GEb0sG
         z67Y8DEX4VQVnfJvwnFsebM2VwCiaa+AFDPfIqHyyUR/d89VE/8pDToMzm51LVerq7tb
         MZWWZZfBi0cBvViOUs/Wh3p1GkKNYkvHdrSmPjXdyQayFaB7fPlHaFCltJAHdoap49Hy
         GExw==
X-Gm-Message-State: AOJu0Yw9pwbAK2Wnu9kOgztYDuYS2Bj4NkEQr9E6mM9p30r6ylFiGJxp
	SoHSs9OWEePqrHdAogP3n2PXVVefmnw2qlarKnyN2Fy10YxO5I9bebCLZrC7Y5Q=
X-Gm-Gg: ASbGncv1xaRBLAgobVqSSxjy58ZIlHFaWITIgn9oeHpoiGJUalgFRYbwCKodCliuMkJ
	HwMTIQpwKRIwd65/dzvxsF8slnf7NBh25655GBr5NYcFDqTYeLlOOoAcus9RxV//c22/NWa/JAY
	xheqH1sTklMA4Vw8QHuV+5bBPm/WRhHdR9NDyTWtl1vzTWAfpHpHwO3Gl2njmgqiVU1gW+3Ukbj
	pM8scEuUljMHk1shW16JecZrjbevW3CQ0VoWcnk5FTYYZWlUiKoki/6j/qn0B120ikdS2eSLV1N
	rEiqYd+HV/TvVYq665kC1GrX+04aMsn1Vioawxs9wQmyo+wfuwChBPcOcRHTVtKEHJnBxx55VdS
	x4/nf9g==
X-Google-Smtp-Source: AGHT+IGfBHaH5kpBPtjLBJ31++qQOIPA20539x4C2hIptA/H2+a2o0zdDulx6BtKc+lZvMy6sPBM4w==
X-Received: by 2002:a05:600c:5107:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-43f3a93379dmr106409215e9.6.1744651771197;
        Mon, 14 Apr 2025 10:29:31 -0700 (PDT)
Message-ID: <58ca1f1d-a050-4f63-ad0f-a50bb72fee8a@citrix.com>
Date: Mon, 14 Apr 2025 18:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] CI: avoid repacking initrd as part of the test job
To: Anthony PERARD <anthony@xenproject.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
 <20250414110903.2355303-3-andrew.cooper3@citrix.com> <Z_0-dX2FkS6TCv-U@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_0-dX2FkS6TCv-U@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/04/2025 5:57 pm, Anthony PERARD wrote:
> On Mon, Apr 14, 2025 at 12:08:59PM +0100, Andrew Cooper wrote:
>> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>
>> Use the new test-artifacts which provide rootfs.cpio.gz rather than
>> initrd.tar.gz.  rootfs.cpio.gz also has all the necessary top-level
>> directories, and includes the rc_verbose setting, so these modifications can
>> be dropped.
>>
>> Having that, do not repack the whole initrd, but only pack modified
>> files and rely on Linux handling of concatenated archives.
>> This allows packing just test-related files (which includes the whole
>> toolstack), instead of the whole initrd.
>>
>> For xilinx-smoke-dom0-x86_64.sh, this involves instructing grub not to unzip
>> the archive, as doing so corrupts it.
>>
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> This patch seems to depends on the other patch series for
> "test-artifacts" repo.

Yes, there's a large interlink, although the other series is fully
committed now.

>
> I've tried to compare the rootfs fs generated by this repo, and the one
> generated in the "test-artifacts" repo, and I think there's a few
> changes, at least for the arm64 rootfs as the changes have probably
> already sailed for x86_64, namely:
>
>     Those don't exist in the new rootfs:
>         rc-update add networking sysinit
>         rc-update add modloop sysinit
>         rc-update add modules boot
>         rc-update add sysctl boot
>     There's `echo > /etc/modules` been added.
>
> But I guess none of those matter, as it already works on x86_64 tests.

Those changes are discussed in the other series, in the relevant patches.

modules is deliberately removed; we don't build them (properly), and the
scan on boot puts errors onto the console.  Emptying /etc/modules is to
remove af_packet and ipv6, again because we don't have those as modules
(we build ipv6 in).

Modloop seems to be scanning other devices for filesystems.  networking
depends on sysctl, but I can't see any of them being used, and the arm64
tests work fine without them

>
> Overall, looks good, more common code between tests!

Indeed.  We can always put them back in if they turn out to be needed.

> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

~Andrew

