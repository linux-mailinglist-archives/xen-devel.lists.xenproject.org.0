Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3AD220D6C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:52:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgtf-00078W-NS; Wed, 15 Jul 2020 12:52:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlgd=A2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jvgtf-00078Q-1G
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:52:27 +0000
X-Inumbo-ID: 088c1d60-c69a-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 088c1d60-c69a-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 12:52:26 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id o8so5454984wmh.4
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2020 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=fEeJUzeiSumgRw9T0OyH3bypZsgbZN1x4P+ytx1rqpo=;
 b=YHZmbHhK33cWVHMUVxSJ70Mc1qf7jAWXbHbSKUHLXLbEoV/40+5ZVqIhNynlfC6Yo9
 vMxBrjQJ0L8NeOC5fHI2i4AS8e06h9OM+5k1vJzmbdmB54ab8f+p/MXRfJm52dK4Ar2Y
 1GMGT8YElk9shCxTysBRF9DB0PnoA2J8lvHV8TIFyKt9PGsOxBxEiuBFibHrHc5PG+vL
 9VJ4Q8s9W8XqFdf0ZRa97+xHAXxWoTYK4DgHSjxt24mRe0bjaMlVwIAxajRaCujbztRG
 VWRdDtyltVxFJ4T3xdSN7Tx/dFasKJq//7dRF5/d0Jx2qZvUmEF94gxAnNh/A87sYoiT
 zokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=fEeJUzeiSumgRw9T0OyH3bypZsgbZN1x4P+ytx1rqpo=;
 b=dVM75sPECMACQYiZz1PsU2bzw/PATcwvEEJ5B2NeWGEipORfyHfpUp0UAd/ulKD2Bo
 82ImDrBDnHoJuR9rusdoT452ZLW9ZjoPgUrkafiPxpuorBoZ/+LvheYunOZP/J5s1swT
 OD4ykvW/aYHLaTcIROLPT/PUuMrJSBO64P7znkD/logvgqD2FyBIh1HBEhzbZWTZUqn2
 TucWjaPBLUQy79f0PZG6/zdT/6c0TWFHXykmv/bJtzgZsHty1g8VoD1bATId8xQhzuwy
 8eVhfn+nal+AX8ypjc7/HP4Nr3N2vCjI2TKt4/j0vq1cBgy/HM0ctRRoYVuZMZAg4T2J
 F+3w==
X-Gm-Message-State: AOAM531TY5JG9L8aZvfMx9zYLakJg4owoATCllEAktq1DRC5BelYHRkS
 iKvG9xk5TYJF50qv34lvw2g=
X-Google-Smtp-Source: ABdhPJyRf2ux3L4qR8fbzruJmkOJXiisUgDHh0YQ+1kQsKwIcGuxsmkYCmEdHittxerszi2tOjhzrg==
X-Received: by 2002:a7b:c18f:: with SMTP id y15mr8733045wmi.85.1594817545545; 
 Wed, 15 Jul 2020 05:52:25 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id z63sm3645724wmb.2.2020.07.15.05.52.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Jul 2020 05:52:25 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <42270be7-43d6-ba53-3896-e20b5d7e3de0@suse.com>
 <ab92e0ec-d869-dae6-f47c-b7ac55bea326@suse.com>
In-Reply-To: <ab92e0ec-d869-dae6-f47c-b7ac55bea326@suse.com>
Subject: RE: [PATCH 3/3] x86/HVM: fold both instances of looking up a
 hvm_ioreq_vcpu with a request pending
Date: Wed, 15 Jul 2020 13:52:24 +0100
Message-ID: <001d01d65aa6$c9c57400$5d505c00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKAf3+muaXr7mwqqHZG6k9bSD0TwwGy5eBrp6a2GcA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 15 July 2020 13:05
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Wei Liu
> <wl@xen.org>; Paul Durrant <paul@xen.org>
> Subject: [PATCH 3/3] x86/HVM: fold both instances of looking up a =
hvm_ioreq_vcpu with a request
> pending
>=20
> It seems pretty likely that the "break" in the loop getting replaced =
in
> handle_hvm_io_completion() was meant to exit both nested loops at the
> same time. Re-purpose what has been hvm_io_pending() to hand back the
> struct hvm_ioreq_vcpu instance found, and use it to replace the two
> nested loops.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Yes, much neater...

Reviewed-by: Paul Durrant <paul@xen.org>

>=20
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -81,7 +81,8 @@ static ioreq_t *get_ioreq(struct hvm_ior
>      return &p->vcpu_ioreq[v->vcpu_id];
>  }
>=20
> -bool hvm_io_pending(struct vcpu *v)
> +static struct hvm_ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
> +                                               struct =
hvm_ioreq_server **srvp)
>  {
>      struct domain *d =3D v->domain;
>      struct hvm_ioreq_server *s;
> @@ -96,11 +97,20 @@ bool hvm_io_pending(struct vcpu *v)
>                                list_entry )
>          {
>              if ( sv->vcpu =3D=3D v && sv->pending )
> -                return true;
> +            {
> +                if ( srvp )
> +                    *srvp =3D s;
> +                return sv;
> +            }
>          }
>      }
>=20
> -    return false;
> +    return NULL;
> +}
> +
> +bool hvm_io_pending(struct vcpu *v)
> +{
> +    return get_pending_vcpu(v, NULL);
>  }
>=20
>  static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
> @@ -165,8 +175,8 @@ bool handle_hvm_io_completion(struct vcp
>      struct domain *d =3D v->domain;
>      struct hvm_vcpu_io *vio =3D &v->arch.hvm.hvm_io;
>      struct hvm_ioreq_server *s;
> +    struct hvm_ioreq_vcpu *sv;
>      enum hvm_io_completion io_completion;
> -    unsigned int id;
>=20
>      if ( has_vpci(d) && vpci_process_pending(v) )
>      {
> @@ -174,23 +184,9 @@ bool handle_hvm_io_completion(struct vcp
>          return false;
>      }
>=20
> -    FOR_EACH_IOREQ_SERVER(d, id, s)
> -    {
> -        struct hvm_ioreq_vcpu *sv;
> -
> -        list_for_each_entry ( sv,
> -                              &s->ioreq_vcpu_list,
> -                              list_entry )
> -        {
> -            if ( sv->vcpu =3D=3D v && sv->pending )
> -            {
> -                if ( !hvm_wait_for_io(sv, get_ioreq(s, v)) )
> -                    return false;
> -
> -                break;
> -            }
> -        }
> -    }
> +    sv =3D get_pending_vcpu(v, &s);
> +    if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
> +        return false;
>=20
>      vio->io_req.state =3D hvm_ioreq_needs_completion(&vio->io_req) ?
>          STATE_IORESP_READY : STATE_IOREQ_NONE;


