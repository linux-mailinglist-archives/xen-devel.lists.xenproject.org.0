Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992CFA5F2BF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 12:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911945.1318316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsgyq-0004NY-1m; Thu, 13 Mar 2025 11:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911945.1318316; Thu, 13 Mar 2025 11:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsgyp-0004M6-V2; Thu, 13 Mar 2025 11:44:03 +0000
Received: by outflank-mailman (input) for mailman id 911945;
 Thu, 13 Mar 2025 11:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEXk=WA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tsgyo-0004Ly-8X
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 11:44:02 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74cf6aaa-0000-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 12:44:01 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39143200ddaso532135f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 04:44:01 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d03e2448bsm52007035e9.1.2025.03.13.04.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 04:43:59 -0700 (PDT)
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
X-Inumbo-ID: 74cf6aaa-0000-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741866240; x=1742471040; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJQB8DvVnfT03BdpUrS/G0RkWNXtCa6OJMD/PQfWZrs=;
        b=DtKsU6Alp4PAUFzE2FaFWnDQjWxilrTE/f4PXgkFLq2STovtEli7qy3vd2J35gyit+
         yki7vn7YeMwX3TyrvsnlLCGafnUkLrG0zCy+4uzISBYercudBssE/YTNzDtU7PNvRa0k
         LxwvG406GN0xtXx48zd+5CTcZkp3Jjy0UwiFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866240; x=1742471040;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rJQB8DvVnfT03BdpUrS/G0RkWNXtCa6OJMD/PQfWZrs=;
        b=topW66HGjENGuDLKOG7+pq7pMmUzamKX7dv8MSPjJb7AIAAH4Wwxuxwe+hxIoTK41o
         AOfWvZOU8SbBVd+u7zdBZHB0UKB9odafyMFCUifMaKNdvV56EguLW2eZ6SXxFpAzyibI
         p/Ul2JCPNW0T19fE0zfIZJGKlg/5nMPWWwYyX6lKOecDJl1hSV+nNa+IScALGzIV/j/y
         +rn4s6dHxDLzSIRL9UvdE1DyrhUt9lLZEcAYzTy3KhU0TZivLfktp4mNS0uYfUzO5CUg
         x2xMCnBQCKP5mTpiCbbgNEBVUoHMpULzOkVhYOmkshjIxiYPKGdivQA6/DrET4OAg/nb
         910w==
X-Forwarded-Encrypted: i=1; AJvYcCWRhEx4eDBhC8/jkGGwGV99Nqgh4PNFbH3rueiiqMuODAUirgbnxznujm16aLqLw3mpAqM349THk0M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJvQrwvluQAGYevgDem3bK31An4XK1EJGkBv8J9DWxZbGWcpfO
	P7UEqYTJTcjp3yFSQxjgZcQLoSPLhIe2X8je3SkUn0If//7nwXB0YCiRJNvR6RH9vDUVhwo11Po
	u6DQ=
X-Gm-Gg: ASbGnctmtBRLDW1OCcuLGQDJmydR9IxlSVF6Lsq6P60F8oMr7pfglSx9n5M6kv5mLlj
	Aub9Kk+uqdx5aAqpAJ9qwiHvr0lVj7sDRBQVoITbdQaooqr8CKwRZhxJvMA5mKwauoWl9PXnrJJ
	2vqyMFYC6tbFQ0B3w6mIbWZuCEaulo8gru+B1Ij36BPX7aUN60bQncY/ZE6JMzJ6KooFI+hCxuM
	y1qXl1mOctt8ioS4kFS/sjPbZy+fumO9gxLbhAY8IEORLbteiUaZ4o5fJl89MMf3s4N/oTd7qjX
	Kj4eo8R/H5dkDGOHBDlbxZHguWsFur8367srGrMKJlwvhKceBYA=
X-Google-Smtp-Source: AGHT+IE7eC/mdnBSVTjY/AChHzeU15NP5mQsMxeau1PBHXPWFqD5/x+Kd8Dpvx1mC9XlKjSUzv8H1Q==
X-Received: by 2002:a05:6000:2aa:b0:390:f400:2083 with SMTP id ffacd0b85a97d-39258949d55mr11959712f8f.0.1741866240296;
        Thu, 13 Mar 2025 04:44:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 11:43:54 +0000
Message-Id: <D8F41PA5JHTU.ABSSG427OH5@cloud.com>
Cc: <ray.huang@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 02/19] xen/xsm: wrap around xsm_sysctl with
 CONFIG_SYSCTL
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Penny Zheng" <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-3-Penny.Zheng@amd.com>
In-Reply-To: <20250312040632.2853485-3-Penny.Zheng@amd.com>

Hi,

On Wed Mar 12, 2025 at 4:06 AM GMT, Penny Zheng wrote:
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/include/xsm/dummy.h | 7 +++++++
>  xen/include/xsm/xsm.h   | 9 +++++++++
>  xen/xsm/dummy.c         | 2 ++
>  xen/xsm/flask/hooks.c   | 4 ++++
>  4 files changed, 22 insertions(+)
>
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index a8d06de6b0..afc54a0b2f 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -180,11 +180,18 @@ static XSM_INLINE int cf_check xsm_domctl(
>      }
>  }
> =20
> +#ifdef CONFIG_SYSCTL
>  static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
>  {
>      XSM_ASSERT_ACTION(XSM_PRIV);
>      return xsm_default_action(action, current->domain, NULL);
>  }
> +#else
> +static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif

Doesn't this need to be -ENOSYS instead?

I'd put the ifdefs inside the function (making the signature common) and
then have the body ifdef-ed. But rather than that, I suspect the `else` bra=
nch
can just go away because...

> =20
>  static XSM_INLINE int cf_check xsm_readconsole(XSM_DEFAULT_ARG uint32_t =
clear)
>  {
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 8c33b055fc..276507b515 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -60,7 +60,9 @@ struct xsm_ops {
>      int (*sysctl_scheduler_op)(int op);
>      int (*set_target)(struct domain *d, struct domain *e);
>      int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
> +#ifdef CONFIG_SYSCTL
>      int (*sysctl)(int cmd);
> +#endif
>      int (*readconsole)(uint32_t clear);

... either you remove this field or make the dummy handler. Doing both seem=
s
redundant.

The dummy handler would return -ENOTSUPP, so the field is benign (in which =
case
I don't really get why it must go). But if the field is gone, there's no ne=
ed
for the handler to begin with.

All in all, removing the else branch in xsm_sysctl would make everything
consistent. Same in the files below.

Also, you may want to add the readconsole hook (and its handler) since that=
's
a specific sysctl that would also be disabled by !CONFIG_SYSCTL.

> =20
>      int (*evtchn_unbound)(struct domain *d, struct evtchn *chn, domid_t =
id2);
> @@ -259,10 +261,17 @@ static inline int xsm_domctl(xsm_default_t def, str=
uct domain *d,
>      return alternative_call(xsm_ops.domctl, d, cmd, ssidref);
>  }
> =20
> +#ifdef CONFIG_SYSCTL
>  static inline int xsm_sysctl(xsm_default_t def, int cmd)
>  {
>      return alternative_call(xsm_ops.sysctl, cmd);
>  }
> +#else
> +static inline int xsm_sysctl(xsm_default_t def, int cmd)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif

Same as above

> =20
>  static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
>  {

> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index ce6fbdc6c5..0a5fc06bbf 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c

Same remarks here as in the header.

> @@ -22,7 +22,9 @@ static const struct xsm_ops __initconst_cf_clobber dumm=
y_ops =3D {
>      .sysctl_scheduler_op           =3D xsm_sysctl_scheduler_op,
>      .set_target                    =3D xsm_set_target,
>      .domctl                        =3D xsm_domctl,
> +#ifdef CONFIG_SYSCTL
>      .sysctl                        =3D xsm_sysctl,
> +#endif
>      .readconsole                   =3D xsm_readconsole,
> =20
>      .evtchn_unbound                =3D xsm_evtchn_unbound,
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 389707a164..7c5e7f5879 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -856,6 +856,7 @@ static int cf_check flask_domctl(struct domain *d, un=
signed int cmd,
>      }
>  }
> =20
> +#ifdef CONFIG_SYSCTL
>  static int cf_check flask_sysctl(int cmd)
>  {
>      switch ( cmd )
> @@ -933,6 +934,7 @@ static int cf_check flask_sysctl(int cmd)
>          return avc_unknown_permission("sysctl", cmd);
>      }
>  }
> +#endif
> =20
>  static int cf_check flask_readconsole(uint32_t clear)
>  {
> @@ -1884,7 +1886,9 @@ static const struct xsm_ops __initconst_cf_clobber =
flask_ops =3D {
>      .sysctl_scheduler_op =3D flask_sysctl_scheduler_op,
>      .set_target =3D flask_set_target,
>      .domctl =3D flask_domctl,
> +#ifdef CONFIG_SYSCTL
>      .sysctl =3D flask_sysctl,
> +#endif
>      .readconsole =3D flask_readconsole,

readconsole ought to be included, imo. And its handler wiped out as well.

> =20
>      .evtchn_unbound =3D flask_evtchn_unbound,

Cheers,
Alejandro

