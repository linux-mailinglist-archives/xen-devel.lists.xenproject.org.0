Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE5C6A215F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:21:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501399.773123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVcgn-0004l5-Gp; Fri, 24 Feb 2023 18:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501399.773123; Fri, 24 Feb 2023 18:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVcgn-0004ig-Dn; Fri, 24 Feb 2023 18:21:01 +0000
Received: by outflank-mailman (input) for mailman id 501399;
 Fri, 24 Feb 2023 18:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kVlj=6U=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1pVcgk-0004ia-W4
 for xen-devel@lists.xen.org; Fri, 24 Feb 2023 18:20:59 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb116856-b46f-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 19:20:57 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id l1so41383wry.10
 for <xen-devel@lists.xen.org>; Fri, 24 Feb 2023 10:20:56 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003e876122dc1sm3967939wmq.47.2023.02.24.10.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:20:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 53E091FFB7;
 Fri, 24 Feb 2023 18:20:55 +0000 (GMT)
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
X-Inumbo-ID: fb116856-b46f-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8a4GZn4ha/5hEHiBbNnraxRAqCIgTi7PRjzwWK8+ESU=;
        b=N1DAEs2WC/OXmk0i+ZhAPYAdw9TMRfuFPwvVoLS/i4fgwhLiNb58S0qxDWWTFQKmaF
         H+G4FKG1baO9JRqcZBwejznUAe+mlZtpxsSTRaJvMVS0lQ8y84yhUmNcamMi71go3OcU
         VB6i6jotD8Vl1MPaGl4yCeRXEsSb7MTwNSoLoFSXGLPOCDFeZ6SRF22sjaPq1r5KNWTp
         6hQIj9SQcvVYtpdJqNP8+DLnhpJgspir+XLh4XWPr6K+46kHKXNN7ezcCYwSS/ofPDOU
         7rAHSLsxEHRvMwQGaSymKIMHrs0cMrBlfygbY1jHM/atrOeCGTRrdGegtGPphx7NavL/
         2bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8a4GZn4ha/5hEHiBbNnraxRAqCIgTi7PRjzwWK8+ESU=;
        b=T0qkJ4Rp5bc9T/TAz3pwD+fRxs6iskZsIdLyQc9Ufcv40Eo2bBXw5jKwfIWndBEssG
         O4eMcEVOjUYR+pxDFrtzKWqNMK73O5QRRzTEYgFvEl+3sCVivPEKVF+frMXvFprWJ61f
         P1P4cDru6naxq4W2hCnOFc2hUTPxjuHveO765Hl37HENy4oJ+pcmY1PerqOzMfMP15Iy
         BIbp4jTN0kisD3Eru1pJ6soO9X8PUS2AesQpvhhbgP4Dmymk+P+UmL4yx0A85p2Hxq3G
         y7Lnyw2ssc+2fy0Nz+viXVCDOz3yTA3S4/RW1a8FqKjxMWlI/Seiwo+g4fcOc/nsihwZ
         687A==
X-Gm-Message-State: AO0yUKXh8tOq2SMmoL/7rY7M08kFcWMbJda8Y4cFRDY1lJnmjFuO7xuo
	awOlphPLR9Ls7zxkh2Dp2U192Q==
X-Google-Smtp-Source: AK7set8UPFrVTjYS0MJCgqyh+wW7y7tnk9QcLIurR75ujbKeyLojHM11V5UzbFoZuqm3NOPolHAXfA==
X-Received: by 2002:a5d:5274:0:b0:2c7:1e32:f7ff with SMTP id l20-20020a5d5274000000b002c71e32f7ffmr2555417wrc.16.1677262856092;
        Fri, 24 Feb 2023 10:20:56 -0800 (PST)
References: <d9beee5f7b4a4acdb5f5eff8af55bed50b33d722.1676971686.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, Oleksandr Tyshchenko
 <olekstysh@gmail.com>, xen-devel@lists.xen.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Sebastien
 Boeuf <sebastien.boeuf@intel.com>, Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [RFC QEMU] docs: vhost-user: Add custom memory mapping support
Date: Fri, 24 Feb 2023 18:20:31 +0000
In-reply-to: <d9beee5f7b4a4acdb5f5eff8af55bed50b33d722.1676971686.git.viresh.kumar@linaro.org>
Message-ID: <878rgmorg8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Viresh Kumar <viresh.kumar@linaro.org> writes:

> The current model of memory mapping at the back-end works fine with
> Qemu, where a standard call to mmap() for the respective file
> descriptor, passed from front-end, is generally all we need to do before
> the front-end can start accessing the guest memory.
>
> There are other complex cases though, where we need more information at
> the backend and need to do more than just an mmap() call. For example,
> Xen, a type-1 hypervisor, currently supports memory mapping via two
> different methods, foreign-mapping (via /dev/privcmd) and grant-dev (via
> /dev/gntdev). In both these cases, the back-end needs to call mmap()
> followed by an ioctl() (or vice-versa), and need to pass extra
> information via the ioctl(), like the Xen domain-id of the guest whose
> memory we are trying to map.
>
> Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_CUSTOM_MMAP', which
> lets the back-end know about the additional memory mapping requirements.
> When this feature is negotiated, the front-end can send the
> 'VHOST_USER_CUSTOM_MMAP' message type to provide the additional
> information to the back-end.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  docs/interop/vhost-user.rst | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 3f18ab424eb0..f2b1d705593a 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -258,6 +258,23 @@ Inflight description
>=20=20
>  :queue size: a 16-bit size of virtqueues
>=20=20
> +Custom mmap description
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++-------+-------+
> +| flags | value |
> ++-------+-------+
> +
> +:flags: 64-bit bit field
> +
> +- Bit 0 is Xen foreign memory access flag - needs Xen foreign memory map=
ping.
> +- Bit 1 is Xen grant memory access flag - needs Xen grant memory mapping.
> +
> +:value: a 64-bit hypervisor specific value.
> +
> +- For Xen foreign or grant memory access, this is set with guest's xen d=
omain
> +  id.
> +
>  C structure
>  -----------
>=20=20
> @@ -867,6 +884,7 @@ Protocol features
>    #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
>    #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
>    #define VHOST_USER_PROTOCOL_F_STATUS               16
> +  #define VHOST_USER_PROTOCOL_F_CUSTOM_MMAP          17
>=20=20
>  Front-end message types
>  -----------------------
> @@ -1422,6 +1440,20 @@ Front-end message types
>    query the back-end for its device status as defined in the Virtio
>    specification.
>=20=20
> +``VHOST_USER_CUSTOM_MMAP``
> +  :id: 41
> +  :equivalent ioctl: N/A
> +  :request payload: Custom mmap description
> +  :reply payload: N/A
> +
> +  When the ``VHOST_USER_PROTOCOL_F_CUSTOM_MMAP`` protocol feature has be=
en
> +  successfully negotiated, this message is submitted by the front-end to
> +  notify the back-end of the special memory mapping requirements, that t=
he
> +  back-end needs to take care of, while mapping any memory regions sent
> +  over by the front-end. The front-end must send this message before
> +  any memory-regions are sent to the back-end via ``VHOST_USER_SET_MEM_T=
ABLE``
> +  or ``VHOST_USER_ADD_MEM_REG`` message types.
> +
>=20=20
>  Back-end message types
>  ----------------------

This looks good enough for me. We will see how it works in prototype.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

