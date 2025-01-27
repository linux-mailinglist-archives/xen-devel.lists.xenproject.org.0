Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD11A1D9DF
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 16:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878059.1288235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcRLN-00015M-DW; Mon, 27 Jan 2025 15:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878059.1288235; Mon, 27 Jan 2025 15:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcRLN-00013A-Aj; Mon, 27 Jan 2025 15:48:09 +0000
Received: by outflank-mailman (input) for mailman id 878059;
 Mon, 27 Jan 2025 15:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fFPb=UT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcRLM-000134-6K
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 15:48:08 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 199566fd-dcc6-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 16:48:06 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so3328333f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 07:48:06 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c402esm11566456f8f.97.2025.01.27.07.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 07:48:05 -0800 (PST)
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
X-Inumbo-ID: 199566fd-dcc6-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1737992886; x=1738597686; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HwOUrFPP3C74s2uL0aHvL48yitbfvYFsp4Fk1YJxfg=;
        b=Xytr+TyzaUYxC8nPo04CYZkh2bYkVETX9oa5rW9unRSryAjsG5OZpDocZx3I5BsXqt
         GVmk+EyDYKocOBH7/hG05zQ3vPMYNPD8DDp5jV1Q+5nibBuQ36SsWGAXjO/wjuv2mvcz
         5tOJl3CN8Rk88i67Flq7oZ64qucWC3GAwjpGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737992886; x=1738597686;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3HwOUrFPP3C74s2uL0aHvL48yitbfvYFsp4Fk1YJxfg=;
        b=UNqFNDclW3JS/o4g6p1KKsF5lASILAbpRIdi8T2fYjCL1j3VVcDbHgFTJ8n54tgIE7
         QEgLJ2Aowe+oOZ/izWH5mSDgUQWgb39/oNUJatVayV0YLt+6rxQ0r0szlPmavRQ4SLoq
         KyVh4Nhnvchzql4/0HL3+Nkw8AAm2qzEVb1nTEqqS8lg8l/MsKtQsgh6s628Fjt4h0A6
         QwhrCcS/A9fhKP2uAWxFu2JCB/rS3b7WFk5AoGRypdAzmh2kXzcHSv//xEnFiar4YwnD
         B9e8jZBZjNw7zftXCbBiRC3qQ7yQjNJRVoPdEbAhJ3TDARvP0KJNK3XQdaAsevtwZs5q
         2CoA==
X-Forwarded-Encrypted: i=1; AJvYcCUI6Uw2PPKpOYdzG5YUq/6Jh14En3zzZC6wkYxwIx0DsAKxPuLnrzzxZV2ero8IDQIaYghPU/VoIDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylOkJ4bUluqizHdHxw/wnfiMkVK7oJN91F3nqJExy8VXVElAUx
	IUGo061m9SDhX9fY2h+W0aI26BEzE9YRHq080zpFtrCOjEeQQhk9y8vIso3+aaM=
X-Gm-Gg: ASbGncuulCu24kN8lAhrOW5V///f5wtYJ4J18LsNvMGy2loHs9xnrCI4rjbxzM+38sB
	pYHkhRQQybvJOB1Imu0liZBxgimXnAycbCNPmIeJEZqyj54YMqI/ss3ygBNeq8wjQWjN1bIBGdh
	rYeoJ9n0WHZ5XecvgXh44BdFjtFyXWeBqezjFEnIhhW1MWmHYzHgl5WPKnE2bX1Clsly9dCtsij
	5Y1pFhhfFBYaHMEp5bYuCJaSoezejJ5oWx0Oke5hdOo/5he0mUgdOD2BVVAy2aalSsPBMVOGyf+
	yBi45HKkZOj+2uJ7AE+qC+l7NdD1GTbew18=
X-Google-Smtp-Source: AGHT+IH9BRN3AfKnxcDIKp+YtA+mU8O15XvSZ+2w2Llkgmxfmz2yoAu/cYRr5RzCOGrh8la4VDpCjw==
X-Received: by 2002:a05:6000:144b:b0:385:df43:223c with SMTP id ffacd0b85a97d-38bf565c029mr35524706f8f.13.1737992885848;
        Mon, 27 Jan 2025 07:48:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 15:48:01 +0000
Message-Id: <D7CZ23KACJ16.A4EFWQ1X682K@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 11/12] x86/fpu: Pass explicit xsave areas to
 fpu_(f)xrstor()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-12-alejandro.vallejo@cloud.com>
 <1f1ab2d4-73ad-4562-b3c5-0b423b56aed2@suse.com>
In-Reply-To: <1f1ab2d4-73ad-4562-b3c5-0b423b56aed2@suse.com>

Hi,

On Mon Jan 27, 2025 at 11:05 AM GMT, Jan Beulich wrote:
> On 10.01.2025 14:28, Alejandro Vallejo wrote:
> > No functional change.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> > ---
> > v2->v3:
> >   * const-ified v in fpu_xrstor()
> >   * Removed v in fpu_fxrstor()
>
> On this basis the parameter could also be removed from fpu_fxsave(), by
> passing in fip_width instead.
>
> Jan

Could be, but there's not a whole lot of gain to be had? The access must be
done either way before or after the fpu_fxsave() call, and a parameter must=
 be
passed (be it fip_width or v). Passing the vCPU encapsulates the access of
fip_width where its actually used, which seems more desirable, I'd say.

Cheers,
Alejandro

