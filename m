Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA75BCACB3F
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 10:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180310.1503514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXjp-0001bo-5C; Mon, 08 Dec 2025 09:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180310.1503514; Mon, 08 Dec 2025 09:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXjo-0001ZB-VH; Mon, 08 Dec 2025 09:41:00 +0000
Received: by outflank-mailman (input) for mailman id 1180310;
 Mon, 08 Dec 2025 09:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RPXi=6O=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vSXjn-0001Z5-I6
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 09:40:59 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faf3c0fd-d419-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 10:40:50 +0100 (CET)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-45358572a11so2430022b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 01:40:50 -0800 (PST)
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
X-Inumbo-ID: faf3c0fd-d419-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765186849; x=1765791649; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIFD83Wxz40U48Ctw0c9Ht8sg1gr5GRjFCzPgyPZPJo=;
        b=bkB1Fa45dGcHWKgd9tecq9+CY2Ze4Q0N7bbBWBHnF1xKkQsb8iPioqfn7gJcpxlulV
         wQLVbambqFzhmBvl7MIvOpwtgsWHswMQcyqP+L76RsgnvaTGJp3dAnWi1tAmtrMkXf3Z
         ytS8v7CDi9Ml7xBNFFS3xA1nGKN5bd7ct/jdryD2vr5rGC/4hL4Fg8g0aCr4HaLiShvo
         06CoRsgyflh42S64LvCP2/Y8Z1kOia+Pf1x5YPubtvOsqMZEOPjnzykiPERLOLej8L+8
         IELzHDILu4Qcp3VDiuqODYYK3AEe6Maygbpd/OVbTqkK/J1uaNlrzUEmLB0b7WENxd4o
         NAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765186849; x=1765791649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EIFD83Wxz40U48Ctw0c9Ht8sg1gr5GRjFCzPgyPZPJo=;
        b=ENgNYg25pmc/87txcemofnjX6WBEGbalpwYVe/XZ6EiGxvvS/qbxoChhgSvZ+GGiIP
         vSxd16QnGW7sHvDQAqBpMcFi2veH5pKleF41wQSlhOnFpw1PGOMm3ioef02gF7I5MEC+
         cTB1Et4KJ0Ijg06L/iyEjjuTxNj5q+/oiRZJVCmiFO4tuY7fw0KQ9D79Vw91LRBplGY+
         xqYtKQKvL3t6BzEqk1dTpAUoVo5VxyqsEhX3Eq4B4+bFtn2+q9bEesfmFUvhH6U7J0Lm
         FS73aUrKTp48B4nkCLeO7eAWvdDq8IkCuqXu9QMgw+D5AzLo98qbXFxF6kXyh5vIHem6
         Y4Xw==
X-Gm-Message-State: AOJu0YxUZi4n9V3l4MBdpH3lOhKkVv2Z1KHd4p0MLrV3wYuKYc5FmM7J
	saHu/BWmzb8A88TDcxPcu+ZsaUZZeqrbK0od0TnKpGpGeGyM2jRrSP41DsvKZIPd68qYd23RrAp
	Hy9maTw+5/PodqjDsAePV1xX4N2oifZ8G5Y0aEUHeJg==
X-Gm-Gg: ASbGncsrnjvDU2Sq7qNe2lzJgH5hV44C36Ia5Vl3Vn36G/Q8CNMSAVLiNL/SeORYZYn
	MtKd2KB6ZjOy4ufY87LAurciBXfEc9EQ2bUKWL8MwRNMq0Sh8A0axUaKn4yWre8nsszjb83K9zj
	X6l0X8/RvKIckh4QxM36tQVOhqNC2H0hrPZrOnufPmILTlCeWLdj2GEredmhI6e1fBgyT+xcXpS
	alDdqOFXtcHzJuS45+8FT6KRamOCLPHU1vnus8WpoQRtVW5hzsNtxTaeeR2vYONVsUAiFS7wWyF
	O+V4xFWH/R9Iz96UtnGLzaefOg==
X-Google-Smtp-Source: AGHT+IEKT+4egPm5WvU+agT/vWIne15K7uj4Zo04IdXSSGMNn7bhT+RAwPtWsuOYagkFaU+ofk+vVGTbGQDj2wBQx6g=
X-Received: by 2002:a05:6808:6ec6:b0:450:4628:e3ce with SMTP id
 5614622812f47-4539df5ff2fmr2689925b6e.15.1765186849132; Mon, 08 Dec 2025
 01:40:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764930353.git.bertrand.marquis@arm.com> <6832face6780228ac2704da70d5ddbd7f00dd385.1764930353.git.bertrand.marquis@arm.com>
In-Reply-To: <6832face6780228ac2704da70d5ddbd7f00dd385.1764930353.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 8 Dec 2025 10:40:37 +0100
X-Gm-Features: AQt7F2oIssacjv1vBGPB0rVqwvkLpr6MbrJeb2oZWb_4ypnAU6SFG7xYQeHp23Q
Message-ID: <CAHUa44GCWkH_9Wz7KZas28n1VXCK=-RtH6b1mVNfm=BoLP_buA@mail.gmail.com>
Subject: Re: [PATCH v1 01/12] xen/arm: ffa: add FF-A v1.2 function IDs
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Dec 5, 2025 at 11:37=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Bring the FF-A headers up to the v1.2 baseline and fix the function-numbe=
r
> range used for ABI discovery:
>
> - update FFA_FNUM_MAX_VALUE so the FF-A function-number window covers the
>   full v1.2 range, and derive the ABI bitmap bounds from
>   FFA_FNUM_MIN_VALUE/FFA_FNUM_MAX_VALUE instead of hard-coding
>   FFA_ERROR/FFA_MSG_SEND2
> - define the new v1.2 function IDs; CONSOLE_LOG_32/64 and
>   PARTITION_INFO_GET_REGS are added for ABI discovery even though they ar=
e
>   not implemented yet
> - extend the firmware ABI table to probe RUN and
>   MSG_SEND_DIRECT_REQ2/RESP2
> - while there, fix an off-by-one in ffa_fw_supports_fid(): the computed b=
it
>   index must be strictly smaller than FFA_ABI_BITMAP_SIZE, so use >=3D in=
 the
>   bounds check
> - Also fix comment as call IDs reserved for FF-A are from 0x60 to 0xEF
>
> Keep FFA_MY_VERSION at 1.1 for now; we only advertise v1.2 once the
> implementation is fully compliant.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v1:
> - Add CONSOLE_LOG_64 and rename CONSOLE_LOG to CONSOLE_LOG_32
> - Set MAX value to 0x8E which is the highest abi value available in 1.2
> - Mention in ffa_private.h comment that SMCCC is actually reserving 0x60
>   to 0xEF included for FF-A (and fix previous FF which was wrong).
> ---
>  xen/arch/arm/include/asm/tee/ffa.h |  3 ++-
>  xen/arch/arm/tee/ffa.c             |  4 ++++
>  xen/arch/arm/tee/ffa_private.h     | 21 +++++++++++++--------
>  3 files changed, 19 insertions(+), 9 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

