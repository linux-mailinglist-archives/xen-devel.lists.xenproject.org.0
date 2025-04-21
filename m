Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF6A956F7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 21:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961429.1352845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6xGZ-0008Ju-TP; Mon, 21 Apr 2025 19:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961429.1352845; Mon, 21 Apr 2025 19:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6xGZ-0008I0-Qh; Mon, 21 Apr 2025 19:57:19 +0000
Received: by outflank-mailman (input) for mailman id 961429;
 Mon, 21 Apr 2025 19:57:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J93P=XH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u6xGY-0008Hu-GL
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 19:57:18 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d15e8355-1eea-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 21:57:13 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so3811602f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Apr 2025 12:57:13 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa42082csm12682161f8f.3.2025.04.21.12.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Apr 2025 12:57:12 -0700 (PDT)
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
X-Inumbo-ID: d15e8355-1eea-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745265433; x=1745870233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fCI9GIz3tQx69mZRHQOydIWdQRCRJDxY6m4AQBClgkE=;
        b=eqsZXtyq70BNcj14YFbHrbBtHaww3VMlUHg11HCrBIGQPxYF5ln2sr9f0A6vhQUz+Y
         5QVm0zu+q7PZG7oEWpYXee3QH0QsuQi4wsLpPDRml6PnVGTClLbyoS50Ab84riWAS7C8
         yj0Kmf473lJNHM2qdJ1KmSvf69dpGe5pAtsVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745265433; x=1745870233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCI9GIz3tQx69mZRHQOydIWdQRCRJDxY6m4AQBClgkE=;
        b=DaPQO6DdR0sAAYmV/YHcPqjQKk2Rr3kuBmAK4TcvKft2vAAAztLiYnY6I+Dgd14tIY
         GJ1/CjYaFSweqYZII6EyyPkcO43OphFaSGEADzVzcWbrPzgITtj39axpVqwI9svSphm+
         ExaOKte/4A+EqA+XHfwUcVtD4gJQcZ0lXi9gYj8UPONGFbNafm1Rxx2ooa5NdiEUeWYO
         g2ToKLaHbGul7oWTAiRhzY7tgQzC0BhL1FYvA/Mg/fje3S2IPaAqxreaylrtkH7kGD4r
         tf6N5/FCkSJG48Y+ftW8B36ruxNXrE4ZYB82POnjwHxS3gADeWeEAn/Uk78PyAHeByg4
         Orog==
X-Gm-Message-State: AOJu0YxxSTlD+r7FN3zQeD6TL1GijS+GrespNxM70w1+A+kLVNvYXoib
	5Wa0Rc6/fRv5ex4cKo9Bx+RQsEBWFhckvytt47O7MjlWI50fCZ431dnK84FuvYQbplolW+qo0bx
	ovDg=
X-Gm-Gg: ASbGncsBRhhy72zA0+3FZz64Qasg7ffTbQITO7gJ5aWM3Cz/Cc+LyJ7UBY3gymw+hGz
	cziidF7pZGv4GXzTjebfxBrBN3rzHF9n+Auxcxe9Xki897TuhHX0i8A69444fDBlD6XGSYpjbVe
	KecJ8o7vMfN9LZSNEkelISu60rnZ/6moprkc18gkV/Uw61WtRr7WMTq1vyTV+YmbJxM9iE61Wv+
	iff3XAW58qSrbP3VgwUHKTQjsXMYu/bYvYWwVn2SYH9RseoYZiWPwH1tTFO1vUx6JfOdJoDWBDa
	swlZgmc/wCl/L5qkpzxjh1VhcF0cUwqYY4BR6HHiLJPQYb90V3YuSg==
X-Google-Smtp-Source: AGHT+IHJWddlpzHq2KGpbGF2LNXbLCMSu1y87N/iQhJVRiZ1J0zqEsCQ3bY6drnrT2v8sSAPHNXo+Q==
X-Received: by 2002:a05:6000:240a:b0:39c:2c0b:8db4 with SMTP id ffacd0b85a97d-39ef8ba5d0dmr11598487f8f.10.1745265432840;
        Mon, 21 Apr 2025 12:57:12 -0700 (PDT)
Message-ID: <92af3712-a163-4aef-abc9-beb8d1d1eda6@citrix.com>
Date: Mon, 21 Apr 2025 20:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Nested Virtualization Bug on x86-64 AMD CPU
To: REIMA ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
Cc: xen-devel@lists.xenproject.org,
 Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>
References: <CA+aCS-Ha4jSYFfxhOwMGiGJPdCOtgBJLt=3Q=v9dfp6SQJys4w@mail.gmail.com>
 <1415ddc9-81f3-4d50-b735-7e44a7f656d5@citrix.com>
 <CA+aCS-H2wkiVOMvCS7cCPojduXdStMYzHn7SxintNyg0vS_Bhg@mail.gmail.com>
 <CA+aCS-E0WtbnSM7FuPL0jruXLjdFaZOa9aS0gyy_x5JDRWh50A@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CA+aCS-E0WtbnSM7FuPL0jruXLjdFaZOa9aS0gyy_x5JDRWh50A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/04/2025 6:53 pm, REIMA ISHII wrote:
> I am writing to follow up on the bug report I sent, regarding a BUG()
> triggered in Xen when performing a nested VMRUN with CR0.PG
> <http://CR0.PG>=0 in Long
> Mode. The issue was discussed with Andrew Cooper at that time, and I
> would like to check if there have been any updates or plans for
> addressing this issue.
>
> To briefly recap:
> - The problem occurs when an L1 hypervisor, while in 64-bit mode,
> executes VMRUN with CR0.PG <http://CR0.PG>=0 in VMCB12, targeting a
> 64-bit L2 guest.
> - Instead of raising VMEXIT_INVALID, the system encounters a BUG() at
> `nsvm_vmcb_guest_intercepts_exitcode`.
> - VMEXIT reason observed was 0x402 (AVIC_NOACCEL), although Xen does not
> support AVIC.
>
> Andrew pointed out that this could indicate either a missing validity
> check (as the state LMA=1 && PG=0 is invalid) or possible memory
> corruption.
>
> Given that this issue could potentially allow a guest VM to trigger a
> hypervisor panic, I believe it might be worth formally recognizing and
> addressing.
> May I kindly ask if this has been acknowledged as a bug internally, or
> if there are any plans to handle this case safely (e.g., raising
> VMEXIT_INVALID instead of BUG()) in future Xen releases?
>
> Thank you very much for your time

Sorry, also fell between the cracks.  I've opened
https://gitlab.com/xen-project/xen/-/issues/216

Again, no idea when I'll have time to look into this.

~Andrew

