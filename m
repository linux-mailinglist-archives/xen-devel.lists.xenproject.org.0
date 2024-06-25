Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4652C9160EB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747415.1154810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1NN-00053B-1J; Tue, 25 Jun 2024 08:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747415.1154810; Tue, 25 Jun 2024 08:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1NM-00050Y-Uk; Tue, 25 Jun 2024 08:18:04 +0000
Received: by outflank-mailman (input) for mailman id 747415;
 Tue, 25 Jun 2024 08:18:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM1NM-00050S-5x
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:18:04 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70be83e1-32cb-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 10:18:02 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a725282b926so251957866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 01:18:02 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7263b3d60esm91016866b.113.2024.06.25.01.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 01:18:01 -0700 (PDT)
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
X-Inumbo-ID: 70be83e1-32cb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719303482; x=1719908282; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VUYKywQBrLkclOIZnMGllCl7h16rvDZuu2uxxo77hMU=;
        b=YPe0G4wRJFfcfbqYEiFDmbtaVBO6wItsaL1tjhUdxH+j+v7r0csb5Xr3/9/9vGLjil
         jXqZ1NbzklrtxjVioKMQ3MxM+Mq2Tl+XSb/sbnEOLggikljTrs4HnWCInkKJNc4vsBWE
         tOLjouy6ka+H4z4UCfyykZGO7W+C9Ts1i2nWN+2YZa6biN/PWnyQ5xTxNiIHRRE5w78K
         jrNucl/9gOrOcEMQMSJiNdK5Fe5t5LlmzAGbCfHy/AH9Br+e9/ymf3CPKKjUWi67Ulvt
         WQY1uC1P5R7D9HP/uUM8RtSaQUg6atXK1o3pmjMkCepkgkL0HPpuPzSR9yLQFbfDMLa8
         sDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719303482; x=1719908282;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUYKywQBrLkclOIZnMGllCl7h16rvDZuu2uxxo77hMU=;
        b=D2SAo3JFDa6huRF7JIPhT2W2cSRqMHwQKV454ueWgIQLN3XFuqrbL/ehOcvV0X/0sr
         SAq3bNodmwBnUuMKJfm30ZNmKqM0B8oeN6SVUiQLGZ/SSRBykoZg3YvGkD6Kh4ZskwAq
         U/9e5APZEL8jmIkWldKhS50BCTg7iUONTSb8twHQp80FR+2t0jlW1Ha5E2kZlWLIh7hm
         NMA6Ps3p61Z5AaWwHjZ+plDbardqWB3z4wlNipTS6Jx0oJDXub+4ZqfZWv9HNq8w4TW+
         MJD5exT3FrLGq36nLt2MVM8DeHQzybdeaI3CWWcwc67IdvD55l3wuSe7PMXT/0cXEpZc
         DgxA==
X-Forwarded-Encrypted: i=1; AJvYcCWcwpPusb45bWmgs7yE75QIuguzksC8F56BI5u5mwd3uFAt2d/Ah+OsFld4sn+7GijFgrzx+j2Yy8RaTEBjgI1anZzz3JEdny13rePHMkQ=
X-Gm-Message-State: AOJu0YycT3ox7xu0lnYCrCEmrQ/5/bzJc/xrJcHrTnBVZ9pA3gpn3j9I
	gPd2vX/rS0aBOSI/QskR+5sF1Sd3eC1ez3QpBKG0sq13lw5EoQpc
X-Google-Smtp-Source: AGHT+IHDLoLNR8S9nh1g//JJBhn8X4vjLxnjaohGsmQ8yC9pU48moDGcEn/MdoKQJjYQTKRLMJvGhA==
X-Received: by 2002:a17:906:a2da:b0:a6f:61c7:dea7 with SMTP id a640c23a62f3a-a7245ccdab7mr403722166b.18.1719303481492;
        Tue, 25 Jun 2024 01:18:01 -0700 (PDT)
Message-ID: <bbf169b395fe8a911f7daf602e088ba6058be868.camel@gmail.com>
Subject: Re: [PATCH for-4.19] gnttab: fix compat query-size handling
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Tue, 25 Jun 2024 10:18:00 +0200
In-Reply-To: <00bb4998-d0a7-43dc-8d3c-abb3f66661cc@suse.com>
References: <00bb4998-d0a7-43dc-8d3c-abb3f66661cc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 09:30 +0200, Jan Beulich wrote:
> The odd DEFINE_XEN_GUEST_HANDLE(), inconsistent with all other
> similar
> constructs, should have caught my attention. Turns out it was needed
> for
> the build to succeed merely because the corresponding #ifndef had a
> typo. That typo in turn broke compat mode guests, by having query-
> size
> requests of theirs wire into the domain_crash() at the bottom of the
> switch().
>=20
> Fixes: 8c3bb4d8ce3f ("xen/gnttab: Perform compat/native
> gnttab_query_size check")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <Oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> Looks like set-version is similarly missing in the set of structures
> checked, but I'm pretty sure that we will now want to defer taking
> care
> of that until after 4.20 was branched.
>=20
> --- a/xen/common/compat/grant_table.c
> +++ b/xen/common/compat/grant_table.c
> @@ -33,7 +33,6 @@ CHECK_gnttab_unmap_and_replace;
> =C2=A0#define xen_gnttab_query_size gnttab_query_size
> =C2=A0CHECK_gnttab_query_size;
> =C2=A0#undef xen_gnttab_query_size
> -DEFINE_XEN_GUEST_HANDLE(gnttab_query_size_compat_t);
> =C2=A0
> =C2=A0DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_compat_t);
> =C2=A0DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_compat_t);
> @@ -111,7 +110,7 @@ int compat_grant_table_op(
> =C2=A0=C2=A0=C2=A0=C2=A0 CASE(copy);
> =C2=A0#endif
> =C2=A0
> -#ifndef CHECK_query_size
> +#ifndef CHECK_gnttab_query_size
> =C2=A0=C2=A0=C2=A0=C2=A0 CASE(query_size);
> =C2=A0#endif
> =C2=A0


