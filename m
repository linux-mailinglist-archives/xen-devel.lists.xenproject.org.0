Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676272F9B2A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 09:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69429.124235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Pq9-0006oH-TP; Mon, 18 Jan 2021 08:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69429.124235; Mon, 18 Jan 2021 08:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Pq9-0006ns-Pz; Mon, 18 Jan 2021 08:24:45 +0000
Received: by outflank-mailman (input) for mailman id 69429;
 Mon, 18 Jan 2021 08:24:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1Pq8-0006ni-1Y
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 08:24:44 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b52e4244-66c2-4bae-be94-1db5a2354c17;
 Mon, 18 Jan 2021 08:24:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id 6so8234729wri.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 00:24:42 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id k9sm25868034wma.17.2021.01.18.00.24.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 00:24:41 -0800 (PST)
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
X-Inumbo-ID: b52e4244-66c2-4bae-be94-1db5a2354c17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=HK80wLbKJkvGm5M9365zUmMZ/k5vIKOFna5l5szP7Rw=;
        b=IfIcjdkYyyDIPLStuMxh6RJZCVVuefcn0knnh1KJ4FZPPaYtyu8qIzkPDNIBE5Noro
         cE6EVh0qcKVmw53gCVG2oQg/KL8yNxUagoKmR6SIJ4SfkJBF5Rq16RsvxLMcFhflBeno
         jcTpOmvscCAgiJ2DzTkvWzrSN+++HC5H+AbHyiuWch0QzTplpcFq9owlp5N0IZMWVNTq
         c/CgmvUUjj0wlHbbo0nXUmIncPs9++YpAxvExl+tU7jw5HOmV/sgMNOCdW1jBlzP656A
         9TDcclkxRqkqrevV+eFZgmBZti8gH6cpLR7EWUqvAGFwoGvDE3R19I4r8wq+MWeiish6
         tTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=HK80wLbKJkvGm5M9365zUmMZ/k5vIKOFna5l5szP7Rw=;
        b=nEGPZfe6rY6Fp3J8ZToA7Gil2D9x9AxvisBpLE3/nzChH6SFK3tGB0CfGsQqdau60D
         w2K6QnJp6nuKgYQPbNzBcq3YOo2k4KA45TfXfC763trn7IIiUR3lKjH2uUiFivSa6B1u
         +9ynfL9WlrGVV4VkVNgwPApI5hlw6hUoYTdWITVYnn3ta5d7wbD5b9pTRMIGE0Tr32TS
         aE6+noX1gJcCO53dVmlL1CU+tUgTxcXqXZgwzGH13s7bG46PX/BoFG27fAWhs28xpKI4
         SvKLNZc+0t+bf1EzrIbON5948ZOq3wuge/yxj/fRPjm/7DUjJG3+7ZJZYht4EJlzmqXd
         RC/g==
X-Gm-Message-State: AOAM532ivkdTRsE+bTJ7Dnw/BwasrkED4CJgfQTj9z/ya5tvJGfUaAwi
	faiULRhF4uNtCJZ4KH0vVDE=
X-Google-Smtp-Source: ABdhPJzlrQNnYqKZLibCddUojhX7hngthn7sdl1f/LedkNQutVObtJyu1fYaY9dDeiU+0WkCS5Qtug==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr24091551wra.426.1610958282199;
        Mon, 18 Jan 2021 00:24:42 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-3-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-3-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 02/24] x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
Date: Mon, 18 Jan 2021 08:24:40 -0000
Message-ID: <00ba01d6ed73$5e7eab70$1b7c0250$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQFNQuSuqPXsx2A=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Oleksandr Tyshchenko
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Julien Grall =
<julien@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V4 02/24] x86/ioreq: Add IOREQ_STATUS_* #define-s and =
update code for moving
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> This patch continues to make some preparation to x86/hvm/ioreq.c
> before moving to the common code.
>=20
> Add IOREQ_STATUS_* #define-s and update candidates for moving
> since X86EMUL_* shouldn't be exposed to the common code in
> that form.
>=20
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
>=20
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>=20
> Changes V2 -> V3:
>  - new patch, was split from
>    [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it =
common
>=20
> Changes V3 -> V4:
>  - add Alex's R-b and Jan's A-b
>  - add a comment above IOREQ_STATUS_* #define-s
> ---
>  xen/arch/x86/hvm/ioreq.c        | 16 ++++++++--------
>  xen/include/asm-x86/hvm/ioreq.h |  5 +++++
>  2 files changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index 468fe84..ff9a546 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -1405,7 +1405,7 @@ static int hvm_send_buffered_ioreq(struct =
hvm_ioreq_server *s, ioreq_t *p)
>      pg =3D iorp->va;
>=20
>      if ( !pg )
> -        return X86EMUL_UNHANDLEABLE;
> +        return IOREQ_STATUS_UNHANDLED;
>=20
>      /*
>       * Return 0 for the cases we can't deal with:
> @@ -1435,7 +1435,7 @@ static int hvm_send_buffered_ioreq(struct =
hvm_ioreq_server *s, ioreq_t *p)
>          break;
>      default:
>          gdprintk(XENLOG_WARNING, "unexpected ioreq size: %u\n", =
p->size);
> -        return X86EMUL_UNHANDLEABLE;
> +        return IOREQ_STATUS_UNHANDLED;
>      }
>=20
>      spin_lock(&s->bufioreq_lock);
> @@ -1445,7 +1445,7 @@ static int hvm_send_buffered_ioreq(struct =
hvm_ioreq_server *s, ioreq_t *p)
>      {
>          /* The queue is full: send the iopacket through the normal =
path. */
>          spin_unlock(&s->bufioreq_lock);
> -        return X86EMUL_UNHANDLEABLE;
> +        return IOREQ_STATUS_UNHANDLED;
>      }
>=20
>      pg->buf_ioreq[pg->ptrs.write_pointer % IOREQ_BUFFER_SLOT_NUM] =3D =
bp;
> @@ -1476,7 +1476,7 @@ static int hvm_send_buffered_ioreq(struct =
hvm_ioreq_server *s, ioreq_t *p)
>      notify_via_xen_event_channel(d, s->bufioreq_evtchn);
>      spin_unlock(&s->bufioreq_lock);
>=20
> -    return X86EMUL_OKAY;
> +    return IOREQ_STATUS_HANDLED;
>  }
>=20
>  int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
> @@ -1492,7 +1492,7 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, =
ioreq_t *proto_p,
>          return hvm_send_buffered_ioreq(s, proto_p);
>=20
>      if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
> -        return X86EMUL_RETRY;
> +        return IOREQ_STATUS_RETRY;
>=20
>      list_for_each_entry ( sv,
>                            &s->ioreq_vcpu_list,
> @@ -1532,11 +1532,11 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, =
ioreq_t *proto_p,
>              notify_via_xen_event_channel(d, port);
>=20
>              sv->pending =3D true;
> -            return X86EMUL_RETRY;
> +            return IOREQ_STATUS_RETRY;
>          }
>      }
>=20
> -    return X86EMUL_UNHANDLEABLE;
> +    return IOREQ_STATUS_UNHANDLED;
>  }
>=20
>  unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
> @@ -1550,7 +1550,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, =
bool buffered)
>          if ( !s->enabled )
>              continue;
>=20
> -        if ( hvm_send_ioreq(s, p, buffered) =3D=3D =
X86EMUL_UNHANDLEABLE )
> +        if ( hvm_send_ioreq(s, p, buffered) =3D=3D =
IOREQ_STATUS_UNHANDLED )
>              failed++;
>      }
>=20
> diff --git a/xen/include/asm-x86/hvm/ioreq.h =
b/xen/include/asm-x86/hvm/ioreq.h
> index 13d35e1..f140ef4 100644
> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -77,6 +77,11 @@ bool arch_ioreq_server_get_type_addr(const struct =
domain *d,
>                                       uint64_t *addr);
>  void arch_ioreq_domain_init(struct domain *d);
>=20
> +/* This correlation must not be altered */
> +#define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
> +#define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
> +#define IOREQ_STATUS_RETRY       X86EMUL_RETRY
> +
>  #endif /* __ASM_X86_HVM_IOREQ_H__ */
>=20
>  /*
> --
> 2.7.4
>=20



