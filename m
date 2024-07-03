Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2CB9263E5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:53:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753161.1161447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1Lt-0006TO-0Z; Wed, 03 Jul 2024 14:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753161.1161447; Wed, 03 Jul 2024 14:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1Ls-0006Rj-UK; Wed, 03 Jul 2024 14:52:56 +0000
Received: by outflank-mailman (input) for mailman id 753161;
 Wed, 03 Jul 2024 14:52:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9qc=OD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sP1Lr-0006Rd-IZ
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:52:55 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec983f3c-394b-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 16:52:53 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-79c072af217so414953985a.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 07:52:53 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e3699edsm54324506d6.3.2024.07.03.07.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 07:52:51 -0700 (PDT)
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
X-Inumbo-ID: ec983f3c-394b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720018372; x=1720623172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5y07oGoQriSa75lz2aYy+xFi65mOsfj21SReRJAYAH0=;
        b=VZObGjBltrk7p98qCm+2c3aRAAsZOjs4CmJ6qZxSr1pPAqIeslHJBWsEPirUj81ScB
         G/UkLpJzKkggKxn9apDeHSz9+21h9lN0r54TwQhyNb+xecQluQwhdwRKkIyqSK8a8MdU
         oVvRVu450gqdr/SsYnDa44Eb5u678CUYI+STs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720018372; x=1720623172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5y07oGoQriSa75lz2aYy+xFi65mOsfj21SReRJAYAH0=;
        b=oitEbWwlX2Y7/NVwjsaBtwW/Q4BYOPI0n5U5xcYax9MjMItyjghqT2sDFmKtwj2+mB
         804UxieRdE5QNlZYUhyXSmIUiU2T13qV75Ay6EEIIgvhn7EfybYAUH1Mqx9+rADQ+E/R
         Oxke/j+Nm3k4Vsgw0sPJKzdvbymVFYNI6mlGJ43E7u+uqJ0GKVenX/dhmFiB9HS9zPiC
         Bqcb8MVZv7fWeBMlM0vNts/XdrHVdJ9Dkgcn1weRjwsh0mVkhrQUP96HxTPG5EtImlKe
         A3LCBkLdQrP+eEdJw42u8xQDCelVhBvczhhYeL6PcA/8MPQe+wErL/4rE1vHyzt2KN3u
         hJpA==
X-Gm-Message-State: AOJu0YyE8y16+6Wj7b3sllRjJtfniXkVIsb4S4sgBwyhZiin/WVB85Q2
	KfJN8xmBsMGC+hCiLJwP+aFsKaN9rYBmnu8RK3UgxnerUSpcev5JvFU+Qwh2KNY=
X-Google-Smtp-Source: AGHT+IFZsTnjC8HrxYV23imo1Yxk8qOxfPSYJNoYsem/h3kF5fDF/HIzQVD/h/rn6AuIs3iwB1LG+g==
X-Received: by 2002:ad4:5aee:0:b0:6b5:db40:8dba with SMTP id 6a1803df08f44-6b5db408febmr58056346d6.11.1720018372159;
        Wed, 03 Jul 2024 07:52:52 -0700 (PDT)
Message-ID: <6b05b04d-e2a8-42ba-b040-78638fa7b51f@citrix.com>
Date: Wed, 3 Jul 2024 15:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 3/4] CI: Drop bin86/dev86 from archlinux
 container
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
 <20240703142002.1662874-4-andrew.cooper3@citrix.com>
 <ZoVjg-HBZdoa-B5A@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZoVjg-HBZdoa-B5A@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2024 3:43 pm, Roger Pau Monné wrote:
> On Wed, Jul 03, 2024 at 03:20:01PM +0100, Andrew Cooper wrote:
>> These packages have moved out of main to AUR, and are not easily accessable
>                                                                    ^ accessible?

Fixed.

>> any more.  Drop them, because they're only needed for RomBIOS which is very
>> legacy these days.
> Is there no need to modify any build script in order to prevent
> building QEMU trad (and thus rombios), or it has never been built on
> Arch in the first place?
>
> (or maybe all releases that we support no longer build QEMU trad by
> default?)

Qemu trad is off by default now, but the ./configure script will sanity
check too.

Also, Archlinux is nonblocking because it's a rolling distro and
periodically breaks older trees because of an updated GCC.

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

~Andrew

