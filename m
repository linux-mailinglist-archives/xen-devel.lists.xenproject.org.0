Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8C99AB01F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 15:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824202.1238292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3FJl-0006KF-BH; Tue, 22 Oct 2024 13:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824202.1238292; Tue, 22 Oct 2024 13:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3FJl-0006Ic-6Z; Tue, 22 Oct 2024 13:53:01 +0000
Received: by outflank-mailman (input) for mailman id 824202;
 Tue, 22 Oct 2024 13:53:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AXx/=RS=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1t3FJk-0006IW-HV
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 13:53:00 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2abff19-907c-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 15:52:59 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c99be0a4bbso7584322a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 06:52:59 -0700 (PDT)
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
X-Inumbo-ID: f2abff19-907c-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729605179; x=1730209979; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uSklaj1Iow3OC/fgWLoyafNoKV4KALgVR05ccdjFQ5Y=;
        b=orpuRdVAo4phS9VA8CV5aLwNPePz8DFRzgwgMYLRWQX4usRj29mpg/gSAZR5bt4v92
         jOo1He03CDJeD7z4Bim3FSzAqhazzEOOhCqaZnCu/R1QlIFDCmPNlzvpcA3sLaNbrX+y
         SySUyj8cx23RT/dLRtHEvz3glbupBixrEInIsz1EUMEdzw0elctTLBMswF3bb/KsDQH2
         kGdylQ5bY7+Nws3iiwdfWrl6i5e0pOHgcxoKTi9A7o3XeohuWC+oNoHXaXxwvEOXjeKe
         IAWu3zfoGwWtTLA7wkVMX2Xjv0SEFrCRg1kD+aZ+GhIRqBKnPVhnT/RXfe0dVXuVfDIv
         izFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729605179; x=1730209979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSklaj1Iow3OC/fgWLoyafNoKV4KALgVR05ccdjFQ5Y=;
        b=j0sMEIJ24hebqbAjRx/05K0hVhAYytUavz4BNTtpgkMx8oyYMy0fiOkO354HF54BBx
         ieq82mnjcAGc8ymjr4wMJoyfGVdTqPcnKprAPSJMVaY4m53EebUtbrcjqgq+1i+bwwCd
         aWtLe/PHM3AX+zfpjn+X0nW5QBbJbSzjZfmMxT6Uu1aIoY4L+h0eekTpkYloOdP7fO6R
         oJuFuEZ/yBNewZPeTnKb/T7sj//kV/hPRveBHHB9n1WKjb9X/x3M2KWPaSjlU68Behfp
         qcrwhSBXGWvOO0RuQBmGJtlOOI6tGpgygpXNSzhFV40g2lDi0voafEC6eszhSnUkAgyx
         DLFw==
X-Forwarded-Encrypted: i=1; AJvYcCW2l97o0K1I9WhEjd8qaGH6o2hTyVHVkQJZ2jfTusNM1jTuBIhR7tsPl9bvEjwW3+jG9h4Sn5PqMMc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuwikSvdMv26K55yPMC1a7PbQcqnQuzK1s6FjyW7TjGri+Cj/G
	9PooAWxrgAPuTGoY6NJM7ZcLTKwD0lhMRHrWBkiabGRO4M8ET0xBjnes2U6Tk4AKGyx4PsLR8am
	mKbJn7RTx+UtqLZfoelXuCxCsO9I9/Xoc9Z57Kg==
X-Google-Smtp-Source: AGHT+IE5idqcDxn3wPR9rUM7wB07gzbhBWxNVeTb6QnYbSe3NEms4jgZVc6CzAlgkUpwqfNlfo1Al3BdpWyeSBwHypc=
X-Received: by 2002:a05:6402:210d:b0:5cb:78b8:7056 with SMTP id
 4fb4d7f45d1cf-5cb78b87ad7mr2740671a12.33.1729605178869; Tue, 22 Oct 2024
 06:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20241021073957.1851500-1-edgar.iglesias@gmail.com>
In-Reply-To: <20241021073957.1851500-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2024 14:52:47 +0100
Message-ID: <CAFEAcA_M2HsgKM2idG4030JTZWEUFfm_2Ae980zyh0DGhe-p=Q@mail.gmail.com>
Subject: Re: [PULL v1 0/1] Xen Queue
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
	paul@xen.org, edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 08:40, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> The following changes since commit f1dd640896ee2b50cb34328f2568aad324702954:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2024-10-18 10:42:56 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/xen-queue-2024-10-21.for-upstream
>
> for you to fetch changes up to 676a68fd4850924db73548c9cb20ea484709708c:
>
>   hw/xen: Avoid use of uninitialized bufioreq_evtchn (2024-10-21 07:53:21 +0200)
>
> ----------------------------------------------------------------
> Edgars Xen queue.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.2
for any user-visible changes.

-- PMM

