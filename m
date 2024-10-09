Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6398599730C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 19:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815060.1228790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaVf-0008OB-3E; Wed, 09 Oct 2024 17:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815060.1228790; Wed, 09 Oct 2024 17:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaVe-0008JF-WB; Wed, 09 Oct 2024 17:30:03 +0000
Received: by outflank-mailman (input) for mailman id 815060;
 Wed, 09 Oct 2024 17:30:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyzk=RF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1syaVd-00080r-CE
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 17:30:01 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bcb8ae9-8664-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 19:29:59 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a994277b38bso2659966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 10:29:59 -0700 (PDT)
Received: from localhost ([52.174.59.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c914d785b8sm1670114a12.30.2024.10.09.10.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 10:29:58 -0700 (PDT)
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
X-Inumbo-ID: 1bcb8ae9-8664-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728494999; x=1729099799; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDVxceK/6e2NS88Sl12jmXsa7ieisTvRCN42J7N2qV0=;
        b=bxw2qz2ltdsm5Qs/0YJK2F8Qz4UOxH2lBjPvLc3znnBb+sTI/f5d8I3oYikgkHl1rq
         j+XyLBNu2qlCGjijUPXXGMFs6/k0+RbOm6+55PJbzHEmNSTxQ3EVXwEjeWEXvPfvlr8n
         nXdQh8F29DZG/r5uORY2EaBgJ7DXLVLaUIDro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728494999; x=1729099799;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TDVxceK/6e2NS88Sl12jmXsa7ieisTvRCN42J7N2qV0=;
        b=pS3mPzrkmtSqbAV1GFTB/ZPK9xQcM0CMUzMPbbYkbg8Oie6ysuXBqOUDbKPSnnG/gn
         rSOIrGq1slUuijYNmtyzK+ZwB7Q62vXfdY6B3sQPlThnIdmqcwaD31SQhSd9cbUzIVzm
         cBscXmG12H4UkzSccu6qlwwDpKw4XB+V1HkMqd9aS+OW9fmXw4Dz5Daj9dB4wpZaHe9S
         oyA0zqHWHjajKDiJ3JUufyFRVq2h5Pz6A+HdjuEmcf4165eCaURyeQT+qUtz076SzOiD
         UtTIgy8yRDCY7oxZLTYnAU5U+2afpJxWCDjDh4xdib/jPYacfzp4R/lfbrv0HGHVc8HG
         CZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBJef8d6oiSJPStQTZDmJorURJ2E8xXFJKmGp3ZgisSLNtePx5Lt354ez83n0h8deFVAEc2b57veU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyx5EYVHs8LhzSrFsvlHIkGSNzFCzd8QpJODWKrrzGW2Akx6EUp
	LVB7PDJufSKFP+/OIOUht0YeRT7Qh/t+8sxT1ZILhzOFTeHO3Rum+kzn4hTfXVA=
X-Google-Smtp-Source: AGHT+IHl2O7dEho1WjXNV6q0flapU4qsOcp6lvMINBl45Mu9BUDiLHF7c/4mzgzlAv1A6ae6iIaSQg==
X-Received: by 2002:a05:6402:358e:b0:5c8:8652:dfd1 with SMTP id 4fb4d7f45d1cf-5c91d526420mr3397695a12.1.1728494998788;
        Wed, 09 Oct 2024 10:29:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 18:29:57 +0100
Message-Id: <D4RGC7XGA2NU.A2M108CWPB1O@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Xen-devel" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 09/11] xen/x86: Derive topologically correct x2APIC
 IDs from the policy
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-10-alejandro.vallejo@cloud.com>
 <56fc2b5e-54c6-46df-a044-de6efcc427d4@suse.com>
In-Reply-To: <56fc2b5e-54c6-46df-a044-de6efcc427d4@suse.com>

On Wed Oct 9, 2024 at 3:53 PM BST, Jan Beulich wrote:
> On 01.10.2024 14:38, Alejandro Vallejo wrote:
> > Implements the helper for mapping vcpu_id to x2apic_id given a valid
> > topology in a policy. The algo is written with the intention of
> > extending it to leaves 0x1f and extended 0x26 in the future.
> >=20
> > Toolstack doesn't set leaf 0xb and the HVM default policy has it
> > cleared, so the leaf is not implemented. In that case, the new helper
> > just returns the legacy mapping.
>
> Is the first sentence of this latter paragraph missing an "If" or "When"
> at the beginning? As written I'm afraid I can't really make sense of it.
>
> Jan

It's a statement of current affairs. Could be rewritten as...

   The helper returns the legacy mapping when leaf 0xb is not implemented (=
as
   is the case at the moment).

Does that look better?

Cheers,
Alejandro

