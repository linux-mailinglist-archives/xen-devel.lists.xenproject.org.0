Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E304894F89
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 12:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700081.1092671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrb28-0003ux-2w; Tue, 02 Apr 2024 10:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700081.1092671; Tue, 02 Apr 2024 10:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrb27-0003tN-VW; Tue, 02 Apr 2024 10:06:23 +0000
Received: by outflank-mailman (input) for mailman id 700081;
 Tue, 02 Apr 2024 10:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy/k=LH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rrb27-0003tH-9s
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 10:06:23 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7484c3c-f0d8-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 12:06:21 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-789e6e1d96eso335022385a.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 03:06:21 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l23-20020ae9f017000000b0078a0df3489esm4162746qkg.116.2024.04.02.03.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 03:06:19 -0700 (PDT)
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
X-Inumbo-ID: a7484c3c-f0d8-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712052380; x=1712657180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bHLiCHNhEUF9zO2t/2Q4Si9jViFJmKa7PKdsYBlyFeA=;
        b=fvzYGmmXGNGpXQbjzVzUBmSbheOFIKhfYr5qvafjWhhMopjFeHlXg8b0YvbXn/m50g
         cpHtMGe2AfdxZTdvoYjA/rtXGxtDxFJWwoSdphLqt7pQvWi22cDF1nfPN60w4PBsf+Ad
         Rj5zKa2s9/EuTxHqFu9fE54RxwM0ekdSy3+X8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052380; x=1712657180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHLiCHNhEUF9zO2t/2Q4Si9jViFJmKa7PKdsYBlyFeA=;
        b=CIKoqrMpODZw0dV+LnA1QZE5DOQnv2PI9LOnKNqXuRb0Ym0msJ/k1UzAhVE9gq0GQq
         DdeA/1Hfsbqtu06vvijA6Oc4bvlXV/eeGnwmSjiLYbWTuzmizBJbwVpuIeUnecJoN1Rv
         WLRTs5fnis2SqELvfAUEL6M7r8LbK7s49q+eb+m1GcHbSAvB8vH5xJq7Qq4upEIqoPTF
         TPxbUHeAKKKUiGBv1DydYcMJsVvcf9PfjwXJwF+9bmCqKq74UkuSeweyIzJbliI89+hQ
         afR/Voh1GiaDWLS+33eeRPNd1Vyeo0DZifIMw4L6w/fKcOFzXxIEZ/B8QF8qP8xxBEs9
         fhIA==
X-Gm-Message-State: AOJu0YxheUJ9ihEKSvHL5MReb5SDJzXBethCETl+id9NF8tZgqEGxKT0
	QbE2iVinXbxnfLC/ISGNv9rAmMOQuIfCnrv5XQ+P5HsPziB/a6oElrbVAp/Vwjs=
X-Google-Smtp-Source: AGHT+IH/ScLdPorFApCaaE3eOLo+GnDQdvZuDx9bHyeg8ClIYNxwtLqX07BSsgVatVnis83HCW+c+g==
X-Received: by 2002:a05:620a:7e7:b0:78a:74a2:5009 with SMTP id k7-20020a05620a07e700b0078a74a25009mr11518421qkk.9.1712052380028;
        Tue, 02 Apr 2024 03:06:20 -0700 (PDT)
Message-ID: <dab5588c-0084-4b94-b018-1a7bfa6034ea@citrix.com>
Date: Tue, 2 Apr 2024 11:06:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/video: do not assume a video mode to be
 unconditionally present
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20240328153523.4155-1-roger.pau@citrix.com>
 <20240328153523.4155-3-roger.pau@citrix.com>
 <9d8af8b5-2a14-44bc-89c6-b616e79cb259@citrix.com>
 <546155eb-1dd1-4944-bb14-2cde551cf35c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <546155eb-1dd1-4944-bb14-2cde551cf35c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2024 10:54 am, Jan Beulich wrote:
> On 28.03.2024 20:58, Andrew Cooper wrote:
>> On 28/03/2024 3:35 pm, Roger Pau Monne wrote:
>>> There's no reason to assume VGA text mode 3 to be unconditionally available.
>>> With the addition of booting Xen itself in PVH mode there's a boot path that
>>> explicitly short-circuits all the real-mode logic, including the VGA detection.
>>>
>>> Leave the default user selected mode as text mode 3 in boot_vid_mode, but do
>>> not populate boot_vid_info with any default settings.  It will either be
>>> populated by the real-mode video detection code, or left zeroed in case
>>> real-mode code is skipped.
>>>
>>> Note that only PVH skips the real-mode portion of the boot trampoline,
>>> otherwise the only way to skip it is to set `no-real-mode` on the command line,
>>> and the description for the option already notes that VGA would be disabled as
>>> a result of skipping real-mode bootstrap.
>> IIRC, Grub defaults to using no-real-mode for xen.efi.
> That's our MB2 entry path which forces skip_realmode to 1. The xen.efi boot
> path doesn't, but similarly skips entering real mode (retrieving desired
> data via EFI protocols instead). Imo if to be retained, the above paragraph
> would want extending some, to cover all the cases.

What I mean is that Grub's 20_linux_xen script writes a stanza which
includes "no-real-mode edd=off" for any non-PC platform, which includes EFI.

~Andrew

