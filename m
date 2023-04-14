Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089866E1DFC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 10:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521037.809293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnEf4-0005BI-IO; Fri, 14 Apr 2023 08:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521037.809293; Fri, 14 Apr 2023 08:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnEf4-00056v-EJ; Fri, 14 Apr 2023 08:20:02 +0000
Received: by outflank-mailman (input) for mailman id 521037;
 Fri, 14 Apr 2023 08:20:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM4c=AF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pnEf3-0004z5-6Q
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 08:20:01 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2540f0c4-da9d-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 10:19:59 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id l18so16577613wrb.9
 for <xen-devel@lists.xenproject.org>; Fri, 14 Apr 2023 01:19:59 -0700 (PDT)
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
X-Inumbo-ID: 2540f0c4-da9d-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460399; x=1684052399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFpxARKtWgnRpMlcvrYFS8qiTmLjgx1JA4OmnpxuvH0=;
        b=i1mrDdZ2WYg3txNAEHG2ymhXtYk+Lkrdbgr29/1uLP+RlIPXAVE1f5+6f4pVZSeoPv
         QqLV0bq5fqSLfOWGHFiPV2aDFsNtM7X1aDAKVdN/9Zys0DM3JUEz20mKkDw1efDqGIMy
         7r0zYt35/5c5uh5T9RsNtPSsdKA/3bVmHEuxGVdp12QnqqrLJ4HtyA3V5rIcSI6Uw80k
         MfVI5C8HzqZTxoBM69TJREJ5VHbqU1rdmUhr6tuBf1sZK2rPnf8fvXcB5nRqmyPmW3ts
         F85p9gDc+v7OuzJPtqCDXlMZuD4vFjzWzGpR3jUPhHKny/XPZM4xPZFOfoZf4p70nhhs
         Uo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460399; x=1684052399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFpxARKtWgnRpMlcvrYFS8qiTmLjgx1JA4OmnpxuvH0=;
        b=j5ilrHbStK23TPQJA5/4Rfqi5fJjfTLIDmTFDLjSJGzHaOTxG1uGUM/SSE2wp/NoRF
         YrH5fO0VkKDyYnN2JbvoFRoqdzIRU842xiJTHR6rN9vj20txnLCeRjE5kG9lRnVvpSdu
         6XtI8HMq+6V/IZ6lzSXjc+I18cQAXqY3gF8BrutkMePYuB6SB7WS3i7ZGIKwRZXuLMtn
         bw6tdMuLXJywbIJbXTtSEuVfS9eH4FPX/1l4OA0hIgzV1/sYZ+a0iMWy5fqlesKXgaUs
         lVcXoOFXcp2Z0eI7yOu+DqdX4l3MelhccAI4S+5XOdcJue0CusVyAindDDdx3cDBxaXb
         R4dQ==
X-Gm-Message-State: AAQBX9cUSQA5WeIZPX5vas9Kl5OWHiDQx/1HXi/jLMTAaLZ5yzLhlPv5
	kGqHWKitxZZbNnQFvUdq7I6tMd/0OZ71rl21NnUmMw==
X-Google-Smtp-Source: AKy350bilVUh/+x6GI8LJs/DLGS/LheJiFQC0zsKEuCnmKW1U2zt3b1JRIHKo8NndQZkyyldYZbAsSVDi49Jjok7GmY=
X-Received: by 2002:adf:e48f:0:b0:2f5:a50c:167d with SMTP id
 i15-20020adfe48f000000b002f5a50c167dmr867559wrm.3.1681460398710; Fri, 14 Apr
 2023 01:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-12-jens.wiklander@linaro.org> <d354fee8-4d02-fe5f-1ff1-15f96efeb13f@xen.org>
In-Reply-To: <d354fee8-4d02-fe5f-1ff1-15f96efeb13f@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Apr 2023 10:19:47 +0200
Message-ID: <CAHUa44FM5yQ+e=ruPhTxFttGTE1HQvruX-7XAiqVnW4b-mQgcw@mail.gmail.com>
Subject: Re: [XEN PATCH v8 11/22] xen/arm: ffa: send guest events to Secure Partitions
To: Julien Grall <julien@xen.org>, bertrand.marquis@arm.com, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 13, 2023 at 3:24=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 13/04/2023 08:14, Jens Wiklander wrote:
> > +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> > +                                      uint8_t msg)
> > +{
> > +    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
> > +    int32_t res;
> > +
> > +    if ( msg =3D=3D FFA_MSG_SEND_VM_CREATED )
> > +        exp_resp |=3D FFA_MSG_RESP_VM_CREATED;
> > +    else if ( msg =3D=3D FFA_MSG_SEND_VM_DESTROYED )
> > +        exp_resp |=3D FFA_MSG_RESP_VM_DESTROYED;
> > +    else
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    do {
> > +        const struct arm_smccc_1_2_regs arg =3D {
> > +            .a0 =3D FFA_MSG_SEND_DIRECT_REQ_32,
> > +            .a1 =3D sp_id,
> > +            .a2 =3D FFA_MSG_FLAG_FRAMEWORK | msg,
> > +            .a5 =3D vm_id,
> > +        };
> > +        struct arm_smccc_1_2_regs resp;
> > +
> > +        arm_smccc_1_2_smc(&arg, &resp);
> > +        if ( resp.a0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 !=3D =
exp_resp )
> > +        {
> > +            /*
> > +             * This is an invalid response, likely due to some error i=
n the
> > +             * implementation of the ABI.
> > +             */
> > +            return FFA_RET_INVALID_PARAMETERS;
> > +        }
> > +        res =3D resp.a3;
> > +    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_RET=
RY );
>
> This loop seems potentially unbounded to me. Can you add a comment
> explaining why this is fine?

In the FF-A 1.1 specification
(https://developer.arm.com/documentation/den0077/e/?lang=3Den) Table
18.26 at page 330 it says that FFA_RET_INTERRUPTED and FFA_RET_RETRY
should be handled in this way. When looking at this from the
hypervisor's point of view it is troublesome since there isn't any
guarantee that we're progressing.

We should be able to rule out FFA_RET_INTERRUPTED since non-secure
interrupts should be masked at this point. I'm not sure if
FFA_RET_RETRY can be avoided entirely, but we should be able to put a
limit on how many times we're prepared to retry.

How about setting a limit of max 10 retries and treating
FFA_RET_INTERRUPTED as an error? Or is it better to not loop at all
and treat all but FFA_RET_OK as errors? What do others think?

Thanks,
Jens

>
> > +
> > +    return res;
> > +}
> > +
>
> Cheers,
>
> --
> Julien Grall

