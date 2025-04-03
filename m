Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3311A7A20C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936683.1337867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Iui-0005qS-FJ; Thu, 03 Apr 2025 11:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936683.1337867; Thu, 03 Apr 2025 11:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Iui-0005oz-CQ; Thu, 03 Apr 2025 11:39:16 +0000
Received: by outflank-mailman (input) for mailman id 936683;
 Thu, 03 Apr 2025 11:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0Iug-0005ot-QV
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:39:14 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43be9055-1080-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:39:12 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso5219465e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 04:39:12 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1794efesm19532625e9.28.2025.04.03.04.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 04:39:11 -0700 (PDT)
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
X-Inumbo-ID: 43be9055-1080-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743680352; x=1744285152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rTMWurCpWgTOvf6a0uahbEIIuA5Ty1vkIOgyropEq9U=;
        b=HvDOBtoaPcwWFoY9SKZNSiQHi9jrmvO7+3C1EeFW+Zl/wCr87OW5k6CFM097xAXBNe
         jhZaycSpwWrR7YEx87fko/1+CAwDhHuh92sPa3UHV/i8Tit6kzXnjOgtUzcLFAFwk+61
         ZTK0EvQkG8BrUSQoDst6JGsDD0+T5hHL1yflE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743680352; x=1744285152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTMWurCpWgTOvf6a0uahbEIIuA5Ty1vkIOgyropEq9U=;
        b=dxYhtoCscr7/bKXzUiXN258N9RAa4GM0y1C9J8bfMZ/PcC2ihCP8t+OhMSgeWLGUFn
         +xeCn7OfXuOXmX6b4EJgnAYzqi9XVSm5XsiRIBIVNOre/p8Hr/wJX8xVf5HI77vXwLk2
         InPL1BCYx5c0wQ/fx82HdpzesTJPyMQ3Q75Z6/NPMThaEjUt4tPcuSA0hMY8bKO51lJS
         hUaJ9D06P8r6hrJdjjHQRe7t+tmTss7CCGO2EMx2w6Srqtr1J+V20FzeZHCLSkLGJMHO
         rvRgqBo+o3dzcdoxbj6Mc3tV7osaPI8BfUKHm8NbM9pdBql5ZJAJBYOG8SF3HI7ozwbO
         dCag==
X-Forwarded-Encrypted: i=1; AJvYcCXxX4M/85u004OGQR0ct+FFErA7u+o0WTyR3iI7JVkPm5/R/FuQBfk3zBoGfUgI+M7Q45Zy75rTZ30=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzawcmGQGoskZ7cJr5ixYbeKJf9vpMy7E3q4IjpmLRnYPzE6e09
	EtV38aDKIH4nZsBH0qeOu+xaAQePSpdIYmjhAknTB3aBM2fIILrF+Szu8rASzp4=
X-Gm-Gg: ASbGncvBnLV6FwROBM0IZm0knMI9fjpdXitfa5jMng8tz+hysAdNsLBxxh0efkRlouo
	6I/wp3zmDEswusCUYrsNAXoKKY+x91RkT4ADLWv3FpcxZu1ZDFOQ7yivegBo0V/HI+DbBv6/Foa
	OFpogjU+H6ai8L9zeN8efmLOVi3ihzufv4tkeNphZ/1CUE0mHZhcxCDKvTSGPWiavWmLreK/W4g
	jcBASrYv65BIVfD/ZgGSiemu3zDJBn8K0pxUelMYQlxO++sajoIIwsJockqRJ5IK8g9xKXlsmoR
	a8MkI6fpmYjcpWkRBL+PuQe6d/slf1N1omhO+PKCTCOVcxZavahGP++dEldkW96mTt4ZjHtUDNg
	UUD337c+OTQ==
X-Google-Smtp-Source: AGHT+IHgVchqpuBULl5UDc4oZG8lq5DaOdKDDMA3dT4/IUoFya2aky68HJyCDiMD1Ou++8AdBSzmTg==
X-Received: by 2002:a05:600c:510c:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43ec139aa3amr22108695e9.8.1743680352227;
        Thu, 03 Apr 2025 04:39:12 -0700 (PDT)
Message-ID: <d832f7c5-5a59-46c5-b5c6-109dd13a77e3@citrix.com>
Date: Thu, 3 Apr 2025 12:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] ci: prevent grub unpacking initramfs
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
 <e1d07b26a92a45ed387594dd789453def1ef1eb2.1743678257.git-series.marmarek@invisiblethingslab.com>
 <a64136e8-c74e-4f47-b52f-cd5b25c57b2e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a64136e8-c74e-4f47-b52f-cd5b25c57b2e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2025 12:29 pm, Jan Beulich wrote:
> On 03.04.2025 13:04, Marek Marczykowski-Górecki wrote:
>> It fails on larger initramfs (~250MB one) and sometimes even smaller
>> depending on memory size/memory map, let Linux do it.
> Iirc grub only unpacks gzip-ed modules, so wouldn't a yet better approach
> be to use a better compressing algorithm, which simply as a side effect
> would keep grub from decompressing it, while at the same time moving
> farther away from any critical boundaries?

Yes and no.

This is going to change anyway when I (or a delgee) moves initrd
generation from the test step itself into the test artefacts repo.

Switching to a slower algorithm will impact every test step right now.

Real systems doesn't see this in general, because it there's an
uncompressed microcode container at the front, and it's not identified
as being compressed at all.

I'd prefer to stick with Marek's patch in the short term.

~Andrew

