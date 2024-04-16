Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6649C8A6D8D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 16:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706993.1104445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwjXr-0000Kh-BA; Tue, 16 Apr 2024 14:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706993.1104445; Tue, 16 Apr 2024 14:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwjXr-0000Hp-8D; Tue, 16 Apr 2024 14:12:23 +0000
Received: by outflank-mailman (input) for mailman id 706993;
 Tue, 16 Apr 2024 14:12:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BYTd=LV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rwjXq-0000Hh-4w
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 14:12:22 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56596c60-fbfb-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 16:12:20 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-434d0a63151so25182051cf.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 07:12:20 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f16-20020ac86ed0000000b004348d54a873sm7252351qtv.57.2024.04.16.07.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 07:12:18 -0700 (PDT)
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
X-Inumbo-ID: 56596c60-fbfb-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713276739; x=1713881539; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ps/yRs7ta/rexAfAl8oEbhrvs+o+iKFPkkoXWreyqXA=;
        b=TVQ+kHgBNErH4uD4TxMni+eN92EnJcyYOsB4urw5Xi1Er6N6A+aK1FOEwOQW5Ev7JU
         80+zDZ09r3PQ5UIFk0zUdsdDVd2Wso4gV/YYlaTugDRe3c2nXcjOwx6vpEVpTtJRgUwY
         dJ9AOpoyMr5fMQuU/CPqjmHQp4iHhFAcvvI/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713276739; x=1713881539;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps/yRs7ta/rexAfAl8oEbhrvs+o+iKFPkkoXWreyqXA=;
        b=H18mRQ7z6klQeXc9d/Ptvny9z37ImmF9GA4sYqZyocMOktYIc643yfIbrvlaMvRII7
         qzDIcffhcpkvZUK1KLmxq/5rHNAg6Ji8uxbM64VG1RspnubBIzbWnILZhBEfbl0zVM2l
         zOoqsOJXvZiLOYwSyR0XStTxFCzg/NKFZ6CLo8bty2Wj0uwawrJK6l96TDKz9QqlyN5U
         e9fgA4EMczDBN5EGXaQyDAzu491wx+DPh8OOsA1dT90yYmQBcBmxLValSDt8m7aODBRZ
         8wsq6EUUgTqNwggRwlskxHwQUi/NgI9urOmmWjuiMRTM1byBDCsysgdHfeL2mV2iGHgp
         zY/g==
X-Forwarded-Encrypted: i=1; AJvYcCV4bn8E+fDpkSXJmPVk3bOyd1iAsSR3cdoRNqucv79BJQUYpw0yA1UIUPQhrHmR4+WNkE1TH/SrWgjyW6iBWdMXGIotuCJN2C3W5c97WLI=
X-Gm-Message-State: AOJu0Ywn7dU9QqB6QEz9XAkmknWZFyAokmhFsSh4R1PsP3HsaAk0rcD3
	iONbl6nfoCqfWS0jeEuie4AnX8pK1CZh3qBnIQFbX9a1fShBnc9Ee76Flsn1Hb8=
X-Google-Smtp-Source: AGHT+IF5s5EqAUpF+JSJlLZ4kRyJMFGmeEaZdWqByGvM4YOX/YIGQZoLm2pYdKpfwpMORQlp3pDnqg==
X-Received: by 2002:a05:622a:164e:b0:434:767f:2999 with SMTP id y14-20020a05622a164e00b00434767f2999mr17288608qtj.33.1713276739415;
        Tue, 16 Apr 2024 07:12:19 -0700 (PDT)
Message-ID: <4915dde3-e798-4eb8-addd-b65a417cf3de@citrix.com>
Date: Tue, 16 Apr 2024 15:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Allow supplying a dynamic start ASID
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com
References: <0d4ef987825080715873360c8b41ebb467b7dfdf.1713257278.git.vaishali.thakkar@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0d4ef987825080715873360c8b41ebb467b7dfdf.1713257278.git.vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/04/2024 9:54 am, Vaishali Thakkar wrote:
> Currently, Xen always starts the ASID allocation at 1. But
> for SEV technologies the ASID space is divided. This is
> because it's a security issue if a guest is started as
> ES/SNP and is migrated to SEV-only. So, the types are
> tracked explicitly.
>
> Thus, in preparation of SEV support in Xen, add min_asid
> to allow supplying the dynamic start ASID during the
> allocation process.
>
> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>

Mechanically, this is fine, but is it going to be useful in the long term?

For SEV and SEV-ES/SNP, we must run the VM in the single fixed ASID
negotiated with the ASP.  This is not not optional.

For non-encrypted VMs, we are free to choose between using the remaining
ASID space as we used to (i.e. run it per-pCPU and tick it over to flush
the TLBs), or to run it in a fixed ASID per guest too.

The latter lets us use INVLPGB, and would avoid maintaining two
different TLB-tagging schemes.


I'd say that we absolutely do want INVLPGB support for managing
non-encrypted VMs, and we cannot mix both fixed and floating ASIDs at
the same time.

We should seriously consider whether it's worth maintaining two schemes,
or just switching wholesale to a fixed ASID scheme.

I don't have a good answer here...  If it where anything but TLB
flushing, it would be an obvious choice, but TLB handling bugs are some
of the nastiest to show up.

~Andrew

