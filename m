Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B99914FEB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 16:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746702.1153833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkh6-0003vV-6F; Mon, 24 Jun 2024 14:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746702.1153833; Mon, 24 Jun 2024 14:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkh6-0003tN-3g; Mon, 24 Jun 2024 14:29:20 +0000
Received: by outflank-mailman (input) for mailman id 746702;
 Mon, 24 Jun 2024 14:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IpOW=N2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sLkh4-0003tH-JQ
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 14:29:18 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22adce08-3236-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 16:29:16 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a72477a60fbso158169566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 07:29:16 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a710595adedsm273690766b.214.2024.06.24.07.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 07:29:15 -0700 (PDT)
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
X-Inumbo-ID: 22adce08-3236-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719239356; x=1719844156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m3SdMcYnJ55tPmreppreg/UrG6xInFR5S4Utq0FJfIU=;
        b=Xr6vNR94N+enxsDNaPKwAItHXfmf3bqdX/und2lhDNkkJG9I3GLtEJ9EtG3Pn1jTUy
         OhXcUKaJcZ+ntt1n39MTCoiM4xoZRGKYaG6INHi8MUj22JDeBCabO+dvP0zVDbHw6Soq
         0zV+buG8TgmZg0X8829WqcbbgTSiECpP4dOk6GWb2MOgX9XoqKhyv6Tm/m0Bfw4to//s
         CM+Yw1Dvm92Bj496yPNjmt+b80eFmfR7Vj9mQ/Pl72sDAEi+tlFmf9x1giZ/3GOHHGdm
         LNcgUi6gNgoOXeCg5jsjTL9lgr/w5LBbrbmp9A//gHoHF0ygXRqXnraTPL/TkNBv0ndn
         Ww5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719239356; x=1719844156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3SdMcYnJ55tPmreppreg/UrG6xInFR5S4Utq0FJfIU=;
        b=KKMafrkHDDT+1qvtzXYv4j+4tnV8UFFIgQMcsWl9AHCPRHPPtGardMBGdhWqfUUCLH
         iOCB803ziIHWrAkZ3iNMbsvMKK4qORKJn1fHn5H3ooaNsFLSQTaI8Lt+j1Jr1npx3cO8
         tuKdisn+aLv86bo8GxcwoWgLUxcLMuTgKNQdGVwyx3W/lPcAkt84U96bz7zdAc62dzSl
         noxUGR3BIkT7bK9dT+yG04WrThTZnOwFHRluXyv7gY4EPT+W4BaDb1zGlLiZyc6fDNQo
         QCgBo28VTyEw0ibVR7rwDg6fJaoAdSmXTgX5L2tt7LEmEW5mz7FmVuEbb1Sumx5w7Fk4
         PISA==
X-Forwarded-Encrypted: i=1; AJvYcCXwLQxf8mv3hUwhQxCQjUzchUzINpmb8ZbntEMU2Dy+HJBvd68IXDSRmDmvxvBHOozjBhnAueT4KCAGrzAohApD+YhG1Bi1te1BhXLgMDM=
X-Gm-Message-State: AOJu0Yz+F7yXVnXPMU8nbNjR94SbbGmA3pzGMM4R4ftC6iYOo4NpwERj
	KNAi48LYhtbhK7CYBFcHiTRvpzVNGMkyqnHNIujrzur+Gtsqn6YtEsc49EhhP44=
X-Google-Smtp-Source: AGHT+IH05SxNgarU73bcvncRGWPtcsIEhPhO6HvBZIN9kJzmvPZv7SsGWka+Eygq6+GshEIHdX1QIA==
X-Received: by 2002:a17:906:6a87:b0:a6f:51d8:1963 with SMTP id a640c23a62f3a-a7245bada5bmr281959966b.43.1719239355865;
        Mon, 24 Jun 2024 07:29:15 -0700 (PDT)
Message-ID: <1944dd3f-1ba8-4559-b71a-056b9309ab58@suse.com>
Date: Mon, 24 Jun 2024 16:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in xen-blkfront regarding sector sizes
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Christoph Hellwig <hch@lst.de>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>
References: <Znl5FYI9CC37jJLX@mail-itl>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <Znl5FYI9CC37jJLX@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24.06.24 15:48, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> Some Qubes users report a regression in xen-blkfront regarding block
> size reporting. It works fine on 6.8.8, but appears broken on 6.9.2.
> 
> The specific problem is that blkfront reports block size of 512, even for
> backend devices of 4096. This, for example, fails 512-bytes reads with
> O_DIRECT, and appears to break mounting a filesystem on such a device
> (at least xfs one).
> 
> For example it looks like this:
> 
>      [user@dom0 ~]$ head /sys/block/loop12/queue/*_block_size
>      ==> /sys/block/loop12/queue/logical_block_size <==
>      4096
> 
>      ==> /sys/block/loop12/queue/physical_block_size <==
>      4096
> 
>      [user@dom0 bin]$ qvm-run -p the-vm 'head /sys/block/xvdi/queue/*_block_size'
>      ==> /sys/block/xvdi/queue/logical_block_size <==
>      512
> 
>      ==> /sys/block/xvdi/queue/physical_block_size <==
>      512
> 
> and then:
> 
>      $ sudo dd if=/dev/xvdi of=/dev/null count=1 status=progress iflag=direct
>      /usr/bin/dd: error reading '/dev/xvdi': Input/output error
>      0+0 records in
>      0+0 records out
>      0 bytes copied, 0.000170858 s, 0.0 kB/s
> 
> and mounting fails like this:
> 
>      [   68.055045] SGI XFS with ACLs, security attributes, realtime, scrub, quota, no debug enabled
>      [   68.057308] I/O error, dev xvdi, sector 0 op 0x0:(READ) flags 0x1000 phys_seg 1 prio class 0
>      [   68.057333] XFS (xvdi): SB validate failed with error -5.
> 
> More details at https://github.com/QubesOS/qubes-issues/issues/9293
> 
> Rusty suspects it's related to
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/block/xen-blkfront.c?id=ba3f67c1163812b5d7ec33705c31edaa30ce6c51,
> so I'm cc-ing people mentioned there too.

I think the call of blkif_set_queue_limits() in this patch should NOT precede
setting of info->sector_size and info->physical_sector_size, as those are
needed by blkif_set_queue_limits().


Juergen


> 


