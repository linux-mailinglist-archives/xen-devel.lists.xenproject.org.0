Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4779D5166
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 18:12:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841623.1257112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEAiH-0004UO-Gr; Thu, 21 Nov 2024 17:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841623.1257112; Thu, 21 Nov 2024 17:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEAiH-0004R3-D3; Thu, 21 Nov 2024 17:11:29 +0000
Received: by outflank-mailman (input) for mailman id 841623;
 Thu, 21 Nov 2024 17:11:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3MJ=SQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tEAiG-0004Qx-DJ
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 17:11:28 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2d5dfa2-a82b-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 18:11:24 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a6acac4c3so209374366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 09:11:24 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f4368c12sm100656466b.177.2024.11.21.09.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:11:23 -0800 (PST)
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
X-Inumbo-ID: a2d5dfa2-a82b-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImEyZDVkZmEyLWE4MmItMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjA5MDg0LjMwMjg4NSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732209084; x=1732813884; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yyZzh2Ogl+3p13LwNAsbOxgCiYq7nOJGL01u1B7IFUA=;
        b=RkVIvU5gprBVcOW+3X6Z2A+VsLyDUCGiPZLwjgMqh2nj6T1nN1UgMLhDECwVEoPPMr
         twrIPmaLdweDZfiTib5CCyBaLmn7ihrM8OzvtcyAandsfKrYd0wz5Ih5UTZ6rd28NspH
         niDayTg5D9j5ywOvIZBW8Yi5E/Gc+kXkoPQZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732209084; x=1732813884;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyZzh2Ogl+3p13LwNAsbOxgCiYq7nOJGL01u1B7IFUA=;
        b=BtrEkzQnzGF/5cBlBrBgh01P6Bu0Ef750/ZobEClhK7p2N2XddteVhyXWpFGEFxkXS
         wwT6fcfQoHjCKdUCIuMltsUzk3LKyLEums0tWfQwCZyj5SCuf9JMB2az/c32hV1fqqHd
         lOZuVI2LqKkYwBsnZa9zeHe2Wpi6shvOLu1D48/Df0laKy2Ua5HTIpVJu+ibQlEcb/8f
         wXx+OL6kRms+LLw5BYNsafONeXJwWLXhjs7QortWxnC2uz8nXhWeM4nnjy1C1Ra9usZC
         QJF3SdnM4ln2XTczRKXZnjgpdrxlM5yz47dqSfNCGKljM58ZCQBxh9UkfAgNGWs2hFve
         YcWw==
X-Forwarded-Encrypted: i=1; AJvYcCX0PCPNTw/OIqU995PBdvY6685ExGa7CqBbWZGf7fvzH37xyxKfnlwzdLfalzJJCMWPY/JZhT/JKoU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaW7etea6izwsLpbQPgGEaerzrB8ncRBoEFfg2gCx2g1bdnJVi
	vKrg1KAA69Y4IadX8oB3gy/K0KMhlrxdSl5zQLx+bDzKMJFloT/1DRk7vKi/iPw=
X-Gm-Gg: ASbGncts+ixZHpWoBDUeD3ZxKhlwh5xG3zbJFLSZYsqF1NsoiLzKl2U8I33nw7nZbny
	tnT6KfIhrccraMHkNcURyF0FMMfJi4isZVsThTHhYEfVZHKyyOEtmWFFvyi9RTlbFc8wT68ZMrB
	6fZZGHiU7sjFLWBjVbtLM2SPvP1hJSSKVYpTX9sQ/PerOZCJzuUgO2YnqneC9LEb8Y1RTxOHhP+
	aOJ/FVayeRXZ/UEGMKg4nvEQ0u1IFMHma1FEP+iRs9ArDv+0lMBOavY538=
X-Google-Smtp-Source: AGHT+IEVjC3zVmsyZckboYUrguWOc7/n6lPRPQxd4WGy4w4VYezBeqPuodK3nrGKL+pZR2K2tB/Whg==
X-Received: by 2002:a17:906:daca:b0:a9a:17b9:77a4 with SMTP id a640c23a62f3a-aa4dd5521d1mr754416866b.20.1732209083679;
        Thu, 21 Nov 2024 09:11:23 -0800 (PST)
Date: Thu, 21 Nov 2024 18:11:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/pv: limit GDT and LDT mappings areas to max number
 of vCPUs
Message-ID: <Zz9pumdfsaBUP_27@macbook>
References: <20241121111218.50984-1-roger.pau@citrix.com>
 <Zz9YM_MB1AoLqSIE@macbook>
 <b2d3a42f-b599-455f-ad15-716dd7552208@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2d3a42f-b599-455f-ad15-716dd7552208@suse.com>

On Thu, Nov 21, 2024 at 05:03:21PM +0100, Jan Beulich wrote:
> On 21.11.2024 16:56, Roger Pau Monné wrote:
> > On Thu, Nov 21, 2024 at 12:12:18PM +0100, Roger Pau Monne wrote:
> >> The allocation of the paging structures in the per-domain area for mapping the
> >> guest GDT and LDT can be limited to the maximum number of vCPUs the guest can
> >> have.  The maximum number of vCPUs is available at domain creation since commit
> >> 4737fa52ce86.
> >>
> >> Limiting to the actual number of vCPUs avoids wasting memory for paging
> >> structures that will never be used.  Current logic unconditionally uses 513
> >> pages, one page for the L3, plus 512 L1 pages.
> > 
> > This is not true, I was confused with the logic in
> > create_perdomain_mapping().  When create_perdomain_mapping() is called
> > with pl1tab == NULL and ppg == NULL it just allocates the L2, but not
> > the L1 tables.
> > 
> > So the purpose of the create_perdomain_mapping(d, GDT_LDT_VIRT_START,
> > ...) in pv_domain_initialise() is even more dubious now - as it just
> > allocates a page to use as L2.  I'm tempted to just remove it if you
> > agree, since I don't consider this useful.  The allocation will
> > already be done at vCPU initialization.
> 
> If it's done implicitly there, removing is likely fine. It feels like it may
> have been necessary to do this explicitly earlier on.

Possibly before you introduced the create_perdomain_mapping() the
initialization and allocation of the L2 was needed in
pv_domain_initialise().

I have a patch to remove it, and as expected nothing seems to explode,
so I will send it.

Thanks, Roger.

