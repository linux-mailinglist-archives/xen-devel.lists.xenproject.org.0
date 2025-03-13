Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAFAA5F3B9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 13:04:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912000.1318365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tshIh-0003Bx-J5; Thu, 13 Mar 2025 12:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912000.1318365; Thu, 13 Mar 2025 12:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tshIh-0003AE-GI; Thu, 13 Mar 2025 12:04:35 +0000
Received: by outflank-mailman (input) for mailman id 912000;
 Thu, 13 Mar 2025 12:04:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEXk=WA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tshIf-0003A6-Mi
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 12:04:33 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 530bf270-0003-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 13:04:32 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d0a5cfd7dso5448395e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 05:04:32 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188b74b0sm18221265e9.15.2025.03.13.05.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 05:04:31 -0700 (PDT)
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
X-Inumbo-ID: 530bf270-0003-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741867472; x=1742472272; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2tZOlM7k2gq1swzyi43UR1lAocCDXQgjJRYeYxhBXE=;
        b=NConlRURd3ZrNrYpjdbEo3AvRkDC1xx50LsS34Pzgw8WbV/aWc+P1Js29aAfoS5xou
         uEq3nCsJyj5sZ3SBH9xXHN5J6PWKRI8uXIFCS56pKCyP6h02assmV5/40+eIBeMGxq9N
         pubq669SFSxFVRseD5VrTRTrW3pGMXx1IY10E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741867472; x=1742472272;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D2tZOlM7k2gq1swzyi43UR1lAocCDXQgjJRYeYxhBXE=;
        b=Pyy7bMDe2Q8Dnmmq8iQ6+0a6CPCot4OV+6QyRhV2/MLooUJTgMsqqWdbzloDDk0W/K
         DizzYJX4RcHMowGN6FiPxXaXKlRjeQ49czIVnEJBOwrptDaeCpXmwNoAPknpUqPI68Ye
         WpiaNAnrtwZQ/9VnFyk0Ae5SPVdfE60usgP099xXnrGyz7HWv2VV6IKNccjRS/YwpP7O
         +B5/qjt/hoTVrO5nFfz2UiMHI12sCtV6EX/RZXoWLlgqVFyERc6yMPOQjAvci3Da/RO0
         mbY3XunsptV8PX/JKa9yi3FGxDHN5kyx1SwFsWIkdG9ZYNe6I7hmVNhcfPsLYnPtmDb/
         lUyA==
X-Forwarded-Encrypted: i=1; AJvYcCVnc8HoLf0U0bzQR/gak99cVPUgrU2Ej5rxkk1ZKVAmO1BiBxO1hgmfLH5d5JyQhS4i59CfoIFOREI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzopRifgHg2HIy8btpO29okff+ztlrIymJncJbFWX3j0IK99njw
	qw81/fxUyZ8cVBSWWX4o2iN8AkI/rgoHhIMhW4hVLa2cmxYv36HVFgox+B+4DOY=
X-Gm-Gg: ASbGncvcMHTAw7ukimvWWUxG4xP6P9daYKYFe00dFl0FecK6kZ8E/7sUqHlBiVa/vCZ
	2TYv0kX9KlqbyhGSIilvboMZp7r4dgV7Sf3X2Kdn7ORPmwDcSWy3GsmGvGYsmMYLpy21IKMzHvQ
	Ll5ViICHuikBqZbmmkXMo6yG33oMyyy/ljhFNFIZrdiK5c7tNNRKYtAQ+6WpCGqenK1+c2YguuW
	XmqHhxdg9NNbD5QRDw8sw6Z0OjBgtr9UCEVx6aZ6VFb/zwRXQS7P8kkKR8WDD85Wb3jupvl5bm5
	vL1YBzaKEugwDQf0BKHjHaCYCyu4UQBJiAJYrgSkT2GJaiXWkio=
X-Google-Smtp-Source: AGHT+IGKAxH44nv//3jnZUxxFxAWmkENI+PQT7HH4RA+rPv7ii8IDfHniSV20xxePffPIy6PsJcPjg==
X-Received: by 2002:a05:600c:1ca6:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-43d024ddd61mr91369435e9.28.1741867472153;
        Thu, 13 Mar 2025 05:04:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 12:04:26 +0000
Message-Id: <D8F4HFBN0ROG.3RRD7E97NYUHD@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Penny Zheng" <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>
Cc: <ray.huang@amd.com>, "Dario Faggioli" <dfaggioli@suse.com>, "Juergen
 Gross" <jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v1 05/19] xen/sysctl: wrap around XEN_SYSCTL_sched_id
X-Mailer: aerc 0.18.2
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-6-Penny.Zheng@amd.com>
In-Reply-To: <20250312040632.2853485-6-Penny.Zheng@amd.com>

On Wed Mar 12, 2025 at 4:06 AM GMT, Penny Zheng wrote:
> The following function shall be wrapped:
> - scheduler_id
>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/common/sched/core.c | 2 ++
>  xen/include/xen/sched.h | 7 +++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index d6296d99fd..ea452d8b3e 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2052,11 +2052,13 @@ long do_set_timer_op(s_time_t timeout)
>      return 0;
>  }
> =20
> +#ifdef CONFIG_SYSCTL
>  /* scheduler_id - fetch ID of current scheduler */
>  int scheduler_id(void)
>  {
>      return operations.sched_id;
>  }
> +#endif
> =20
>  /* Adjust scheduling parameter for a given domain. */
>  long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 559d201e0c..9bdeb85aa4 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -849,7 +849,14 @@ int  sched_init_domain(struct domain *d, unsigned in=
t poolid);
>  void sched_destroy_domain(struct domain *d);
>  long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op);
>  long sched_adjust_global(struct xen_sysctl_scheduler_op *op);
> +#ifdef CONFIG_SYSCTL
>  int  scheduler_id(void);
> +#else
> +static inline int scheduler_id(void)
> +{
> +    return -EOPNOTSUPP;
> +}

Is this ever used when sysctl.c is compiled out?

> +#endif
> =20
>  /*
>   * sched_get_id_by_name - retrieves a scheduler id given a scheduler nam=
e

Cheers,
Alejandro

