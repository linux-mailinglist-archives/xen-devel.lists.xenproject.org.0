Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E32232EA2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 10:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k13s2-0007wf-TT; Thu, 30 Jul 2020 08:24:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gz/s=BJ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k13s1-0007wa-C3
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 08:24:57 +0000
X-Inumbo-ID: 263902b0-d23e-11ea-8d1a-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 263902b0-d23e-11ea-8d1a-bc764e2007e4;
 Thu, 30 Jul 2020 08:24:56 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 184so5397644wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2020 01:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=gkmi/TXVs4ZmKvtSxhf+eynPuMipQNvbn+uYn5T7hX0=;
 b=mGPBjbxeVfIIOf9/V1Yn2FIMYIDBTMV1k45ZZcvJJTGvAVB94XRRsXKPOQCEsTMb/5
 /HU7hhf70aafn211z/rC3xrygc1Zr1K/knCZMEdXWVamLndWBXjacNBiZiFj0gpK1rYg
 HTaWLW1Ndccf5xxnH6+awGVC7MOCeB/8/px2eLQ/8azzppDUUP29FWZ8lTgsG5qACR8t
 BGYEM4GEj/L5eHY5s0ASe9iwmfJMV42svTqer06nVhYUcfPxVpzmuslF3L1ZXTZtL01R
 y9+rmS2g0vfmK9i+vGw587QiE9//Rl20x1GYEil3p68Xlx6qipl5Nx372jSCKEEbMux6
 fS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=gkmi/TXVs4ZmKvtSxhf+eynPuMipQNvbn+uYn5T7hX0=;
 b=oohbu0H9OHSXgf4WZXxIcRm5ZkZj27FGU5hyPrEtAZ58xcYP7fHA6pRB4bYJVFG6hO
 60pIUApp2h2TAJd7dS8IaDRfuuRQ95tAw7C/xkzPyA6WmoBKvy+BwkIkygfXUZyoMFZc
 x6I5TiN/aIDfbxA1KomUl5ujac2SlP6YCpHY2YZuzPzVz3wvoW/bfcVKcuc84MuHR5dj
 Ec/sPaENvzsp3/haSo4LE/VYwXtCI+jo5Z464GEot48zLdkAG39VYzgg/rfzjB0FYcoe
 /74wwrBjRpwPqCsX5KquLL6nNsUqGfTWoR6adRbGU3ER5bfAu28GnypPPC6GHZv7u3xK
 w8ng==
X-Gm-Message-State: AOAM532G16eyKzn53LdL+e5U4Ya+VOauSvcQYgRxgUZvQlZOpfFuZ1LV
 GQmBhgT1PXb/KuuCZYnb2Q8=
X-Google-Smtp-Source: ABdhPJziACfL7t1vVPOuUiwQWcV38y2I8CeaCYe9vYcHrqlz6OymBOEMRcAAd5Q8S1Vj9yPaSt0reQ==
X-Received: by 2002:a1c:5459:: with SMTP id p25mr12679563wmi.85.1596097495637; 
 Thu, 30 Jul 2020 01:24:55 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id a123sm8884260wmd.28.2020.07.30.01.24.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 01:24:55 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-4-andrew.cooper3@citrix.com>
In-Reply-To: <20200728113712.22966-4-andrew.cooper3@citrix.com>
Subject: RE: [PATCH 3/5] xen/memory: Fix compat XENMEM_acquire_resource for
 size requests
Date: Thu, 30 Jul 2020 09:19:42 +0100
Message-ID: <002a01d6664a$2d6d28f0$88477ad0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQF6ExwjYkgZ+OK4ROtT1vtJIEnjiAJEb1e+qcZJK6A=
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
Cc: 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 'Jan Beulich' <JBeulich@suse.com>, 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 28 July 2020 12:37
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<George.Dunlap@eu.citrix.com>; Ian
> Jackson <ian.jackson@citrix.com>; Jan Beulich <JBeulich@suse.com>; =
Konrad Rzeszutek Wilk
> <konrad.wilk@oracle.com>; Stefano Stabellini <sstabellini@kernel.org>; =
Wei Liu <wl@xen.org>; Julien
> Grall <julien@xen.org>; Paul Durrant <paul@xen.org>; Micha=C5=82 =
Leszczy=C5=84ski <michal.leszczynski@cert.pl>;
> Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> Subject: [PATCH 3/5] xen/memory: Fix compat XENMEM_acquire_resource =
for size requests
>=20
> Copy the nr_frames from the correct structure, so the caller doesn't
> unconditionally receive 0.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> ---
>  xen/common/compat/memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
> index 3851f756c7..ed92e05b08 100644
> --- a/xen/common/compat/memory.c
> +++ b/xen/common/compat/memory.c
> @@ -599,7 +599,7 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>                  if ( __copy_field_to_guest(
>                           guest_handle_cast(compat,
>                                             =
compat_mem_acquire_resource_t),
> -                         &cmp.mar, nr_frames) )
> +                         nat.mar, nr_frames) )
>                      return -EFAULT;
>              }
>              else
> --
> 2.11.0



