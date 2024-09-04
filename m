Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BEF96BC58
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790220.1199951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp9l-0001K0-Og; Wed, 04 Sep 2024 12:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790220.1199951; Wed, 04 Sep 2024 12:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp9l-0001HB-M0; Wed, 04 Sep 2024 12:30:41 +0000
Received: by outflank-mailman (input) for mailman id 790220;
 Wed, 04 Sep 2024 12:30:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slp9j-00086h-W5
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:30:40 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e4c2ffd-6ab9-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 14:30:39 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so86113766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 05:30:39 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89890090a1sm801930966b.49.2024.09.04.05.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 05:30:37 -0700 (PDT)
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
X-Inumbo-ID: 7e4c2ffd-6ab9-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725453039; x=1726057839; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Ta2ZfMKm0Gt6yNA4Vm71RUEKrDG1NVGMtu5zOLBYlo=;
        b=rVsdxbx8WReLkFYXpktJ/XM8f/jGShOn4gxBFd8mwQ7De+973aV1BmOitUMYiVGeb8
         04x8hnz+MPjeASIbiedeYHRQF2MqwdFMvSQe/TmEfFt0iXGzJ3I1EaJ3af1OgEqlIKyD
         eB9AObw4k8XNCw0G9039R4dctBT6FQLwe2eao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725453039; x=1726057839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ta2ZfMKm0Gt6yNA4Vm71RUEKrDG1NVGMtu5zOLBYlo=;
        b=YZVPGA9VyhzMOSxn31tSV6LKgCORXtwiIm5GO0H6mZ5uaEHRkf2FTs/mzMZOj0OBK+
         9OMo2pD7OzyHEE2lUFaroYaQ5GBgIeLCjnjxALKEg473QwdFWZrLPR4DXrczkygdFdRV
         h/Pp2cOaqrgtIVr+aal2OEPyywddVa+3dZ1Ua7YrgXUFYNffU9JbAu4Bxtz/0QI8SHeU
         KCxMX8tzfXasmSiSnLzdL81BXjNlBIy3Lmq88ZWaCgVtwG5Rh43Xp0AaUj+rOqTDFWuJ
         RCLnuELu8yLMvnnHzZcXeGfjFKKgL2yCEtPpDO85AcpuMkBmtdh07HSqRFQ2lwsz8gAT
         jldQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV2HJdqIZX8q3Z7OddQ1qAHGTOrIdxR0bFrbdr8M9O3GiBYwfIT8yjFeP+Y3tJE6GpxmGo/sXTVH0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6MKOpmQ/AeVBMtgIxDPn4zd55cgpSAZCYb4jx52pRpUMseNy+
	SPBG/b/Upk0GFlh9Cp7pbLGnDlXThpMJrbnkQ9COkr0hLwCvbMntNR0jl/BKRWM=
X-Google-Smtp-Source: AGHT+IGjD/IMJu0k2+DFRUzJnfGd4dqij6FdC6AU1iaWLD+ud6fzTn4YlWa/GzlpIg8w5N8WKUZ3CQ==
X-Received: by 2002:a17:907:72c8:b0:a7a:ab1a:2d64 with SMTP id a640c23a62f3a-a8a3f539e9cmr177704966b.58.1725453038265;
        Wed, 04 Sep 2024 05:30:38 -0700 (PDT)
Date: Wed, 4 Sep 2024 14:30:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/7] x86/time: introduce probing logic for the
 wallclock
Message-ID: <ZthS7PwABiQiCCWI@macbook.local>
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-5-roger.pau@citrix.com>
 <bc1bd23f-edf5-447a-9799-bca0a6cd696e@suse.com>
 <Ztg9VeXxdM2iBLOR@macbook.local>
 <dde7fd70-3273-4569-b412-d276d4974882@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dde7fd70-3273-4569-b412-d276d4974882@suse.com>

On Wed, Sep 04, 2024 at 01:49:36PM +0200, Jan Beulich wrote:
> On 04.09.2024 12:58, Roger Pau Monné wrote:
> > I had it that way originally, but then it seemed the extra
> > indentation made it less readable.  Will see how can I adjust it, my
> > preference would be for:
> > 
> >     panic("No usable wallclock found, probed:%s%s%s\n%s",
> >           !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
> >           cmos_rtc_probe ? " CMOS" : "",
> >           efi_enabled(EFI_RS) ? " EFI" : "",
> >           !cmos_rtc_probe ? "Try with command line option \"cmos-rtc-probe\"\n"
> >                           : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n"
> >                                                  : "");
> > 
> > But that exceeds the 80 columns limit.
> 
> Right, formally the above would be my preference, too. Here two shorter-
> lines alternatives:
> 
>     panic("No usable wallclock found, probed:%s%s%s\n%s",
>           !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
>           cmos_rtc_probe ? " CMOS" : "",
>           efi_enabled(EFI_RS) ? " EFI" : "",
>           !cmos_rtc_probe
>           ? "Try with command line option \"cmos-rtc-probe\"\n"
>           : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n"
>                                  : "");
> 
>     panic("No usable wallclock found, probed:%s%s%s\n%s",
>           !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
>           cmos_rtc_probe ? " CMOS" : "",
>           efi_enabled(EFI_RS) ? " EFI" : "",
>           !cmos_rtc_probe
>               ? "Try with command line option \"cmos-rtc-probe\"\n"
>               : !efi_enabled(EFI_RS)
>                   ? "System must be booted from EFI\n"
>                   : "");
> 
> Either of these or anything more or less similar will do imo, just as
> long as the ? vs : alignment is there.

I think I prefer the second variant, as indentation is clearer there.

> 
> One thing I notice only now: The trailing %s will be a little odd if
> the "" variant is used in the last argument. That'll produce "(XEN) "
> with nothing following in the log. Which usually is a sign of some
> strange breakage.

I've tested this and it doesn't produce an extra newline if the string
parameter is "".  IOW:

printk("FOO\n%s", "");

Results in:

(XEN) [    2.230603] TSC deadline timer enabled
(XEN) [    2.235654] FOO
(XEN) [    2.238682] Wallclock source: EFI

Thanks, Roger.

