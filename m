Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B53AA5F3AD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 13:03:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911990.1318355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tshH8-0002KM-Ad; Thu, 13 Mar 2025 12:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911990.1318355; Thu, 13 Mar 2025 12:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tshH8-0002IA-6O; Thu, 13 Mar 2025 12:02:58 +0000
Received: by outflank-mailman (input) for mailman id 911990;
 Thu, 13 Mar 2025 12:02:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEXk=WA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tshH6-0002I3-Pv
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 12:02:56 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 191cbf44-0003-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 13:02:55 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so12182445e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 05:02:55 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a74d558sm51559765e9.15.2025.03.13.05.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 05:02:54 -0700 (PDT)
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
X-Inumbo-ID: 191cbf44-0003-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741867375; x=1742472175; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN/JkfFOrGNcRQigNiWgcYxWtxaIAr9r/It3ImjB+Uw=;
        b=DdXozzwNvL2+YHLIp62xnHIQor6GXgAAnzeC8BacDdJQRsVMqMuFGDLBVWSFrDW2/S
         SzAh2fku0Ee3lZYIGABqiVojWTjar56RMvMThVSUuuV3c6YTr1xBD4M9PFRODKhLSUx4
         PuB0ZOrpPD/RlQderO4oKUhKOy19FhkG64wCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741867375; x=1742472175;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YN/JkfFOrGNcRQigNiWgcYxWtxaIAr9r/It3ImjB+Uw=;
        b=qOLp4m22hqGlWrKZPtKDZVzBEfqTP/G3PmY1/Tvyfe3aMu2r3T46xsbXXl+ysuCmyT
         JJIJv5r3AeR1r4gTH9MBiBvmEhAmRTIXD2QTHikXzFuX3stM0QzqtHnM77QLwYUhW5rr
         xBCwmQx6UQjwCxTLjPmqb4iKqqH2KBtWRVbKBlvIIgAfjZQ51Z6ejdotvvXqEHIpABH1
         Iy/4UhDB3kDXtCcuG9EubikuobpYVXEc3JGDTWsk8DJxdsD9iLlcI/OV7MHxmhqQcZ7h
         PMRcN21d/XtkcXM+K48bKIuyLuUtRQWOGt04IxvHDA18pfhw5zyhRXHf5LSw8n9L7wGA
         nRiw==
X-Forwarded-Encrypted: i=1; AJvYcCVu4vc5Tw78nEYOQmGeN9/a5baPcO5hGC/gH/ODwRpQ2aFVM95Q2/4vjk/rr3Tm9ld9/pIKT+sxWbc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyobjO+t+h8IteCtCC/I4I85wcQ3vvANjO0edY4mbWPsAuYYMOg
	d0sYrzFyT1VHiN95cqsN+HIVCdj33vDDs6E9gbLtxoBZwnU5TmaeU5v5j9evqDs=
X-Gm-Gg: ASbGncs6YemB1xzWZAAxvDhgIuDUv7gMKEyRvX4GmQMlP0qMtSHwiI7XmwGzzr0p8o2
	cSMp5PMKP+eHSJq9RRxqQPGud5a5VbXACMCE1ow2WHSia2YdHDVSyDWEl+f8wbW71XuQs9cDiXu
	jrJXxBGfiA/zecn9gtqqzu/vodOnECCsiPxYSRh/RSqVpk7o6Bd+DxrGt9voeDiTvZbXZiFypqP
	TDlx4IQAy5iD8bQg0Ycw0MXAtYsGVqQTKdq1Bp9Ceeew65RbmfLMtHl/K9rWYudLfYw5A8ZE1sF
	3e0io1/9FzP9NkQAZnnDcnOCKQlg4FfUc/8VM0kjXXUPi9xo9Q4=
X-Google-Smtp-Source: AGHT+IGWPUBXy9ksslRKcbtuA0IxyvyHZChrQLrq6FtP0a6lTz0bscZbrD4bQ7qm5q9BAbyRKBOi7g==
X-Received: by 2002:a05:6000:18a2:b0:391:9b2:f496 with SMTP id ffacd0b85a97d-395b7c44cbcmr1620503f8f.16.1741867374837;
        Thu, 13 Mar 2025 05:02:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 12:02:52 +0000
Message-Id: <D8F4G80E0LHU.5GHN1ZVVNHYB@cloud.com>
Cc: <ray.huang@amd.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel"
 <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall"
 <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 03/19] xen/sysctl: wrap around XEN_SYSCTL_readconsole
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Penny Zheng" <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-4-Penny.Zheng@amd.com>
In-Reply-To: <20250312040632.2853485-4-Penny.Zheng@amd.com>

Hi,

Ok, so readconsole is done here. I see how if you're also removing the cons=
ole
handler for the sysctl that's a bit unwiledly to do in one go.

I think my earlier remarks still hold in terms of removal of else branches =
of
ifdefs.

On Wed Mar 12, 2025 at 4:06 AM GMT, Penny Zheng wrote:
> The following functions is to deal with XEN_SYSCTL_readconsole sub-op, an=
d
> shall be wrapped:
> - xsm_readconsole
> - read_console_ring
>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/drivers/char/console.c |  2 ++
>  xen/include/xen/console.h  |  8 ++++++++
>  xen/include/xsm/dummy.h    | 11 ++++++++---
>  xen/include/xsm/xsm.h      | 11 ++++++++---
>  xen/xsm/dummy.c            |  2 +-
>  xen/xsm/flask/hooks.c      |  4 ++--
>  6 files changed, 29 insertions(+), 9 deletions(-)
>
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 2f028c5d44..6e4f3c4659 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -336,6 +336,7 @@ static void conring_puts(const char *str, size_t len)
>          conringc =3D conringp - conring_size;
>  }
> =20
> +#ifdef CONFIG_SYSCTL
>  long read_console_ring(struct xen_sysctl_readconsole *op)
>  {
>      XEN_GUEST_HANDLE_PARAM(char) str;
> @@ -378,6 +379,7 @@ long read_console_ring(struct xen_sysctl_readconsole =
*op)
> =20
>      return 0;
>  }
> +#endif /* CONFIG_SYSCTL */
> =20
> =20
>  /*
> diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
> index 83cbc9fbda..e7d5063d82 100644
> --- a/xen/include/xen/console.h
> +++ b/xen/include/xen/console.h
> @@ -7,12 +7,20 @@
>  #ifndef __CONSOLE_H__
>  #define __CONSOLE_H__
> =20
> +#include <xen/errno.h>
>  #include <xen/inttypes.h>
>  #include <xen/ctype.h>
>  #include <public/xen.h>
> =20
>  struct xen_sysctl_readconsole;

That forward declaration should probably be inside the ifdef

> +#ifdef CONFIG_SYSCTL
>  long read_console_ring(struct xen_sysctl_readconsole *op);
> +#else
> +static inline long read_console_ring(struct xen_sysctl_readconsole *op)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif

This is only called from sysctl.c, which will be compiled out. Why is the e=
lse
needed?

> =20
>  void console_init_preirq(void);
>  void console_init_ring(void);
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index afc54a0b2f..35d084aca7 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -186,18 +186,23 @@ static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAU=
LT_ARG int cmd)
>      XSM_ASSERT_ACTION(XSM_PRIV);
>      return xsm_default_action(action, current->domain, NULL);
>  }
> +
> +static XSM_INLINE int cf_check xsm_readconsole(XSM_DEFAULT_ARG uint32_t =
clear)
> +{
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, current->domain, NULL);
> +}
>  #else
>  static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
>  {
>      return -EOPNOTSUPP;
>  }
> -#endif
> =20
>  static XSM_INLINE int cf_check xsm_readconsole(XSM_DEFAULT_ARG uint32_t =
clear)
>  {
> -    XSM_ASSERT_ACTION(XSM_HOOK);
> -    return xsm_default_action(action, current->domain, NULL);
> +    return -EOPNOTSUPP;
>  }
> +#endif /* CONFIG_SYSCTL */
> =20
>  static XSM_INLINE int cf_check xsm_alloc_security_domain(struct domain *=
d)
>  {
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 276507b515..d322740de1 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -62,8 +62,8 @@ struct xsm_ops {
>      int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
>  #ifdef CONFIG_SYSCTL
>      int (*sysctl)(int cmd);
> -#endif
>      int (*readconsole)(uint32_t clear);
> +#endif
> =20
>      int (*evtchn_unbound)(struct domain *d, struct evtchn *chn, domid_t =
id2);
>      int (*evtchn_interdomain)(struct domain *d1, struct evtchn *chn1,
> @@ -266,17 +266,22 @@ static inline int xsm_sysctl(xsm_default_t def, int=
 cmd)
>  {
>      return alternative_call(xsm_ops.sysctl, cmd);
>  }
> +
> +static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
> +{
> +    return alternative_call(xsm_ops.readconsole, clear);
> +}
>  #else
>  static inline int xsm_sysctl(xsm_default_t def, int cmd)
>  {
>      return -EOPNOTSUPP;
>  }
> -#endif
> =20
>  static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
>  {
> -    return alternative_call(xsm_ops.readconsole, clear);
> +    return -EOPNOTSUPP;
>  }
> +#endif
> =20
>  static inline int xsm_evtchn_unbound(
>      xsm_default_t def, struct domain *d1, struct evtchn *chn, domid_t id=
2)
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index 0a5fc06bbf..4c97db0c48 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -24,8 +24,8 @@ static const struct xsm_ops __initconst_cf_clobber dumm=
y_ops =3D {
>      .domctl                        =3D xsm_domctl,
>  #ifdef CONFIG_SYSCTL
>      .sysctl                        =3D xsm_sysctl,
> -#endif
>      .readconsole                   =3D xsm_readconsole,
> +#endif
> =20
>      .evtchn_unbound                =3D xsm_evtchn_unbound,
>      .evtchn_interdomain            =3D xsm_evtchn_interdomain,
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 7c5e7f5879..7c46657d97 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -934,7 +934,6 @@ static int cf_check flask_sysctl(int cmd)
>          return avc_unknown_permission("sysctl", cmd);
>      }
>  }
> -#endif
> =20
>  static int cf_check flask_readconsole(uint32_t clear)
>  {
> @@ -945,6 +944,7 @@ static int cf_check flask_readconsole(uint32_t clear)
> =20
>      return domain_has_xen(current->domain, perms);
>  }
> +#endif /* CONFIG_SYSCTL */
> =20
>  static inline uint32_t resource_to_perm(uint8_t access)
>  {
> @@ -1888,8 +1888,8 @@ static const struct xsm_ops __initconst_cf_clobber =
flask_ops =3D {
>      .domctl =3D flask_domctl,
>  #ifdef CONFIG_SYSCTL
>      .sysctl =3D flask_sysctl,
> -#endif
>      .readconsole =3D flask_readconsole,
> +#endif
> =20
>      .evtchn_unbound =3D flask_evtchn_unbound,
>      .evtchn_interdomain =3D flask_evtchn_interdomain,

Otherwise, same remarks as in the sysctl hooks for xsm.

Cheers,
Alejandro

