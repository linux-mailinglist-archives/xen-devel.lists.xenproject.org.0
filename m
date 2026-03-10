Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPJZAZIjsGnYgQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 14:58:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69225120D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 14:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250138.1547600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzxb4-0001KN-Gu; Tue, 10 Mar 2026 13:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250138.1547600; Tue, 10 Mar 2026 13:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzxb4-0001Hl-E4; Tue, 10 Mar 2026 13:58:06 +0000
Received: by outflank-mailman (input) for mailman id 1250138;
 Tue, 10 Mar 2026 13:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xtLP=BK=canonical.com=nick.rosbrook@srs-se1.protection.inumbo.net>)
 id 1vzxb2-0001Hf-RS
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 13:58:05 +0000
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 280db40d-1c89-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 14:58:03 +0100 (CET)
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2D8BF3F78D
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 13:58:03 +0000 (UTC)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5fff2d5756fso4741146137.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 06:58:03 -0700 (PDT)
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
X-Inumbo-ID: 280db40d-1c89-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1773151083;
	bh=Z/PYnzyJL6zP+aWtvHJwSYzvqQxLGB8OMV1YGzIoCCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=GskMFkflCxKzERaY25RjiwFjxMcgoqTHn1R0Y2YpQEMqkBw2d0gkmtVjAS06W2hSJ
	 6sQvAyEiEMYA0O56esM9FhExa2p7ShggQ1yNoGpgc3IL3jfgjQ9fx57/CVJ2kJAqmc
	 z4BhAfs3zFELre2/YDxN5+FbcT7r0G2qFYWGFeOFlvSmQKQ55pfqLddmntocRMqfH+
	 XfsPZXdhE2RsGh7eKkOj6u5fT6J4dhefQGWMHcPS8jEMKM6Mozgti4FibFpdYKdT07
	 sVArQpoGydbtjyTEpuDxbXO4RkWb2VxgOplL+ao0cypAAoVPSEl8rZH4yfyvYX6+OS
	 2gRZRXV4YVDN6J33Ap8flqz3LpW/Ng55GN0FBY/BY9T/rUkiafC3bPb4KaJ84oSHMT
	 hO9Wyy/Xtit/7f/abGnnWGJ/4TXuGzAQRLEJo5Ira8NEhYYggvC/4z1g7/e5ZC8t4l
	 68zv3bU73BCmPK3fHfIlB2/qjrp6btvSNENxHY6GqrKRZHx8FbBisj8t4xtlrcUAng
	 VHj7lxdvhK0C4uZcj9zTaiF8SqbUIq/0P4AJ8wVsim99vaim8AZSLbaGqGvZNAMJIj
	 ICUp2cSnQW544uGnlF0WW+lM47I3758BSPYmJjjB6wnXBJBkkpqeUHAZRsMooKXLcu
	 t0YhI2bLpzy5Ka9eXQY2roEE=
ARC-Seal: i=1; a=rsa-sha256; t=1773151082; cv=none;
        d=google.com; s=arc-20240605;
        b=Fyzt2go6A1YR2v1umCDt0VC87kpMxzvRnd6Hmqai8UAgCNoHGr0O+Yz4fzrkvBWj1I
         nzv2010AwiCkMHTsJ9MN1m/nRPVkjIMBpML5NQ+FWO0B5ST89S78ESVycGiaac3cQiB2
         ON1XLb03BaIQvvPCV+c8EMr/GFTENighUgXq55WOkIieg8jMoYwLbY20JRFG59U4adfZ
         08ME5S25UoCXCozIC1BvjS8j5p6oelTFKsEp4E/c087pgUn+fwWugoaIBJEqdVYqOEvB
         4QYifsmAgQm6Dq/+caevqmKAdWtNsfXa8VDKGOPbuGNKYQXzZ+vesUNRtbgRkPgNaeQB
         LMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=Z/PYnzyJL6zP+aWtvHJwSYzvqQxLGB8OMV1YGzIoCCo=;
        fh=GG3qP5pAj8neOF7eJs2TsVLgJFvZh3XvVRvvhfAQMzA=;
        b=i38BuFxKs8CNaHq48hI1VKVnaBFV7e5rsbU5NHRc3V2CNIyq17HZcYRyLIVfWdpz/5
         RIOxRb2mPGHh9oq0+FZWMO3B8xE+LPWEb5F3ZFcq2vnEEb3se91zzSMU48UP7fodeN+M
         68uBp+96NnrPmi6mlJjEeKfToBkNgcQ4JEaEto/t02eHid9rctGm6pgyhzKcfrh8hsvG
         Kw2E8n8mzbpzuvONsZ1r86m/Y9eEFYTagQSIwr1iEh0FmpqvyVRE0tmz2bB4cz/DJp5T
         rozY+n4utcrE+COh4M5UbvwsKZ/qFu/FFJH7Hz3vs4+fvRZZZ0RiSXleLPHAw3yctefc
         Kx0A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151082; x=1773755882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/PYnzyJL6zP+aWtvHJwSYzvqQxLGB8OMV1YGzIoCCo=;
        b=HvpYUprfe9NOZhh04umHQeaAgMN9M5VjuRAf1vwZmpABKhQaV1cbjttytxhYN1y84q
         ekrKaADbF3yENBGgHY+bK/G61mjoTaQXH/gfhgRLPigeGMA9Ga1Y9Dfn7EkRg1vie9Xt
         HRd0K8jiELlVSlulKo0gK523YifiDtMlVsm2sMxiQch8PT/Qvjuc3kU2gFH/mSenExlU
         0i+1LYFLLlEzHRQGhrXqPKlRuLpwiSdyUHDAgNGmn5Ko7hccisuL+ogE9lfsMXwF5y1X
         84OuyXeIcydlLj3s+RP8b0mfVU6R4EPr+Uh8+RgwYtog/CRwKo9I6SPcawQSlxCHlGTb
         ETxg==
X-Gm-Message-State: AOJu0YzabTon/cAYSU36XnDI+fTHogfbwyEAJr2yoOo7tA8wvoUccODs
	gOYWBMMppP3CgHnPRqlBmEFJUaG09s8LccG0Vv5nSMWLDC0quOkMu7y/0QXfJr0hRpcy6iq4IZq
	DX/EQWuvNbgYQjnnqBola1Xpv2qp4CS3rQEHrRaP/eqFGrrM+tlTMAfke/3K+5iTRQsur/3nYbs
	kyXxRQT/wb+WWiOe8RPoHOj+jZ0PmIAMDdMTjQYda5hijpORvp/DUqmAExNU0=
X-Gm-Gg: ATEYQzzEv6ALU4hOIXW6eabNT0iHSpsjR00nMu4XhpBdUuJNPRDfmnb+MX04N3TgZ9P
	5ksAjqQAkWKNFJyZcGLm08ccvhjC2NEgiC8gAknxzEUF0mrd6dGjAXkPr0q368fzEQIwBenHDvv
	EJb7toaHgJE8hJqi/zNhB95C9KngFjtr2j+ih0y97wkup7Fj2Fd7J9LgdaQGtkkwfeSsUv1HENL
	p4i
X-Received: by 2002:a05:6102:3f0e:b0:5f5:4055:4556 with SMTP id ada2fe7eead31-5ffe5ef61f3mr5221857137.4.1773151076285;
        Tue, 10 Mar 2026 06:57:56 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0e:b0:5f5:4055:4556 with SMTP id
 ada2fe7eead31-5ffe5ef61f3mr5221820137.4.1773151074350; Tue, 10 Mar 2026
 06:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-10-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-10-jgross@suse.com>
From: Nick Rosbrook <nick.rosbrook@canonical.com>
Date: Tue, 10 Mar 2026 09:57:43 -0400
X-Gm-Features: AaiRm51XO1_uiu1CVtnFq_O9sbsjJ7JISVvlAgVOf0T9WAmvHD0P3QquLwgQmhY
Message-ID: <CAEN5XSFceQZd3AV0MsmvWtbEecVj4J4gDeHMagG51=B0uKWkAw@mail.gmail.com>
Subject: Re: [PATCH 09/11] tools/libxl: add support for xenstore quota in domain_config
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <gwd@xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5C69225120D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email,ubuntu.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:gwd@xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nick.rosbrook@canonical.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[canonical.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nick.rosbrook@canonical.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 8:53=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add support for xenstore quota in the struct domain_config. Initially
> it will be used only for migration of a domain.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/golang/xenlight/helpers.gen.go |  6 ++++++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/libs/light/libxl_dom.c         |  8 ++++++++
>  tools/libs/light/libxl_domain.c      | 10 ++++++++++
>  tools/libs/light/libxl_types.idl     |  1 +
>  5 files changed, 26 insertions(+)
>
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight=
/helpers.gen.go
> index 6c9af904c5..416c2d3e07 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1286,6 +1286,9 @@ if err :=3D x.TrapUnmappedAccesses.fromC(&xc.trap_u=
nmapped_accesses);err !=3D nil {
>  return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
>  }
>  x.XenstoreFeatureMask =3D uint32(xc.xenstore_feature_mask)
> +if err :=3D x.XenstoreQuota.fromC(&xc.xenstore_quota);err !=3D nil {
> +return fmt.Errorf("converting field XenstoreQuota: %v", err)
> +}
>
>   return nil}
>
> @@ -1825,6 +1828,9 @@ if err :=3D x.TrapUnmappedAccesses.toC(&xc.trap_unm=
apped_accesses); err !=3D nil {
>  return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
>  }
>  xc.xenstore_feature_mask =3D C.uint32_t(x.XenstoreFeatureMask)
> +if err :=3D x.XenstoreQuota.toC(&xc.xenstore_quota); err !=3D nil {
> +return fmt.Errorf("converting field XenstoreQuota: %v", err)
> +}
>
>   return nil
>   }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/t=
ypes.gen.go
> index 5393277190..7e7292cf70 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -629,6 +629,7 @@ VmtraceBufKb int
>  Vpmu Defbool
>  TrapUnmappedAccesses Defbool
>  XenstoreFeatureMask uint32
> +XenstoreQuota XsQuotaSet
>  }
>
>  type DomainBuildInfoTypeUnion interface {

For the golang stuff:

Acked-by: Nick Rosbrook <enr0n@ubuntu.com

