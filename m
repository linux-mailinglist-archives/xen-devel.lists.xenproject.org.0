Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CD3220D14
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:41:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgiN-0005lQ-7N; Wed, 15 Jul 2020 12:40:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlgd=A2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jvgiM-0005lL-1O
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:40:46 +0000
X-Inumbo-ID: 66a4b71a-c698-11ea-8496-bc764e2007e4
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66a4b71a-c698-11ea-8496-bc764e2007e4;
 Wed, 15 Jul 2020 12:40:45 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id j18so5431599wmi.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2020 05:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=E+I8EfTeFx1/UnlGUZwBvvu7W6m8tC1xvjyjldd37z4=;
 b=QX4Ffz+zCiY3Kd1lmv566FAMC77/M9sCMCoD6VU8Uf/qeL9eoPnf1+lGqHFSYgKWhH
 8OZ+8yJWl7XiqXM6TTH5BdF6CKFe0IwUB47yY1MdFgoCwNCm1aKAtyR9rwQxdXWyIAIi
 wJRMomvBvR5HRFLVKyUAT9nTgvAXLTltC3pXA4g69S2gsvZN1mcga/q9rIPJH0Yh4bYz
 7O5UIbykPqgSJ1LYAdV/U6ser0QSFm3ghiqmYfYQXUL44pejl8rwTC/kGyQ7SZHvzbTP
 BS7LoBSw9FWdALjqS63mlxrqX+DFBdpd1Q8kH4ozvnizp+GCqaM6fuwJCzW673MNbx6V
 vrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=E+I8EfTeFx1/UnlGUZwBvvu7W6m8tC1xvjyjldd37z4=;
 b=XBXpNo/3/E0sjgVvuAyOtWjLVECkmHjL2VgaGAFS1J0LIDXyldqt+ExKPAhYxFMQHh
 NJed+O4xDHoxPpAyxSle7NHZ7TanOAyC7VoC826G1zmMYKZLNixawjhaiaPoWdY9vv/x
 ebOyVDY1y6T54TIKZDq+HOpB5Q2UVPRIkB/AZMSxFLYX3uAFSZnPZ18e0Lv9gMCrQF8/
 LlSuKo94+LuQpQAiFq1sHY1F3faAkT8FlaLTFhu5oxl2n75/MOv94n7pYqLWfbZEaHqU
 XyDEYZTvglmGrIuStpvQwYfFZTmPDZE1JNntdMFK7dvjJWWoR6eBz7xDizt5W1pIGqam
 GLdQ==
X-Gm-Message-State: AOAM5305qP5URBa2cAmUjQ6BW/xWOOas03fGAy+TMrFqDi0A2d6G4BZf
 CSeAwf+lVHBNlSKxJ/cRGcE=
X-Google-Smtp-Source: ABdhPJwftzb8sDNUbxsD5Bw5mIOCcXj/8l2kWfOCzVtIe3uxTuvsz2WCH1wbVo3egyz7Q8cbtaSwGQ==
X-Received: by 2002:a1c:4183:: with SMTP id o125mr8473288wma.101.1594816844364; 
 Wed, 15 Jul 2020 05:40:44 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id q1sm3343050wro.82.2020.07.15.05.40.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Jul 2020 05:40:43 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <42270be7-43d6-ba53-3896-e20b5d7e3de0@suse.com>
 <94d683d7-302b-f0c2-0108-3f6d76b8df9b@suse.com>
In-Reply-To: <94d683d7-302b-f0c2-0108-3f6d76b8df9b@suse.com>
Subject: RE: [PATCH 1/3] x86/HVM: fold hvm_io_assist() into its only caller
Date: Wed, 15 Jul 2020 13:40:42 +0100
Message-ID: <001901d65aa5$27c03560$7740a020$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKAf3+muaXr7mwqqHZG6k9bSD0TwwIgwNaGp6NEmZA=
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
> Sent: 15 July 2020 13:04
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Wei Liu
> <wl@xen.org>; Paul Durrant <paul@xen.org>
> Subject: [PATCH 1/3] x86/HVM: fold hvm_io_assist() into its only =
caller
>=20
> While there are two call sites, the function they're in can be =
slightly
> re-arranged such that the code sequence can be added at its bottom. =
Note
> that the function's only caller has already checked sv->pending, and
> that the prior while() loop was just a slightly more fancy if()
> (allowing an early break out of the construct).
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -103,23 +103,12 @@ bool hvm_io_pending(struct vcpu *v)
>      return false;
>  }
>=20
> -static void hvm_io_assist(struct hvm_ioreq_vcpu *sv, uint64_t data)
> -{
> -    struct vcpu *v =3D sv->vcpu;
> -    ioreq_t *ioreq =3D &v->arch.hvm.hvm_io.io_req;
> -
> -    if ( hvm_ioreq_needs_completion(ioreq) )
> -        ioreq->data =3D data;
> -
> -    sv->pending =3D false;
> -}
> -
>  static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
>  {
>      unsigned int prev_state =3D STATE_IOREQ_NONE;
> +    uint64_t data =3D ~0;
>=20
> -    while ( sv->pending )
> -    {
> +    do {
>          unsigned int state =3D p->state;

I guess this is beneficial from the point of view of restricting cope =
and...

>=20
>          smp_rmb();
> @@ -132,7 +121,6 @@ static bool hvm_wait_for_io(struct hvm_i
>               * emulator is dying and it races with an I/O being
>               * requested.
>               */
> -            hvm_io_assist(sv, ~0ul);
>              break;

...(as you say) allowing this early break, but a forward jump to an =
'out' label would be more consistent with other code. It works though =
so...

Reviewed-by: Paul Durrant <paul@xen.org>


>          }
>=20
> @@ -149,7 +137,7 @@ static bool hvm_wait_for_io(struct hvm_i
>          {
>          case STATE_IORESP_READY: /* IORESP_READY -> NONE */
>              p->state =3D STATE_IOREQ_NONE;
> -            hvm_io_assist(sv, p->data);
> +            data =3D p->data;
>              break;
>          case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> =
IORESP_READY */
>          case STATE_IOREQ_INPROCESS:
> @@ -164,7 +152,13 @@ static bool hvm_wait_for_io(struct hvm_i
>              domain_crash(sv->vcpu->domain);
>              return false; /* bail */
>          }
> -    }
> +    } while ( false );
> +
> +    p =3D &sv->vcpu->arch.hvm.hvm_io.io_req;
> +    if ( hvm_ioreq_needs_completion(p) )
> +        p->data =3D data;
> +
> +    sv->pending =3D false;
>=20
>      return true;
>  }



