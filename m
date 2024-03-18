Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A143387E681
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 10:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694564.1083393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm9hi-000442-W6; Mon, 18 Mar 2024 09:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694564.1083393; Mon, 18 Mar 2024 09:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm9hi-00042C-TU; Mon, 18 Mar 2024 09:54:50 +0000
Received: by outflank-mailman (input) for mailman id 694564;
 Mon, 18 Mar 2024 09:54:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8te1=KY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rm9hg-000426-Ox
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 09:54:48 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dca18fa-e50d-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 10:54:47 +0100 (CET)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-789e83637e0so154835485a.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 02:54:47 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 pi20-20020a05620a379400b00788406f9c7dsm4410200qkn.101.2024.03.18.02.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 02:54:46 -0700 (PDT)
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
X-Inumbo-ID: 8dca18fa-e50d-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710755686; x=1711360486; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vb7sv4C/b8dEhPARry4PDXgALgtTgI/ctLV7gaE2U48=;
        b=IQg6fwrNzbQdUosOUlxDf7G0SGwY9XWxi8ZkJbabuGmaL2BoHEip5cfkrIsCUGNv3M
         kJqiU/B27wpJLuudqHCBTOLPPVzWNF3pIIkHmcmm9D1EXwlhWoHHr3oCndXINK2kqUV1
         HG/PGe4xEn3CuLwpTpLAM6mDWJxs9631qDF+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710755686; x=1711360486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vb7sv4C/b8dEhPARry4PDXgALgtTgI/ctLV7gaE2U48=;
        b=AxuToZn5wV6wcvB8hwZ4dzh4498JFJqB6C1x+fcqJI4Lh/Y+VktCcGOCGOJdiCeLal
         WGrJPDWGm6ixGxKUzePbHFo/brckcRKeoxlMpOJAqd7O07L3nshwUwaZ5Z5fHF0MtsUk
         6Pm8roGh5+H3e35gpnbDO8kD/gapJoYhbqImZ7nyJD4esXuv9UocbZO7WJ9LY1vx43oD
         EVuICRoN091XPw0P1vcAMZ6la45VhezR4fM+gqbBA3p1dR8bMm1nP0IxGEZhRgdvpeE+
         C2WfJwj2ehi2NfUpKyFzyBG5d325LDKaQkdCzb0TfuQTU1vF9sqcLd2CJ/5L8JGLzJ5t
         7wZQ==
X-Gm-Message-State: AOJu0YwTvn4s2i2IkoLiV4Es6CYx5iIoTbOAEUqN1g0excdg9jiyJKRI
	0l2kUdajCoL65YrLG2RfrY2i31OtqzDrYrN2jrlipDVzcU3NvMsXgLIFFk6wMZM6m2ySiRePPYS
	W
X-Google-Smtp-Source: AGHT+IEMBr15bIUQFDJFkYcY7gMhbzh5b6DT8qTSxGgHIif9R82yvmomHsd0XxGcqKqmfRHwkfQaxg==
X-Received: by 2002:a05:620a:c0d:b0:789:e71b:f2e4 with SMTP id l13-20020a05620a0c0d00b00789e71bf2e4mr7957629qki.63.1710755686464;
        Mon, 18 Mar 2024 02:54:46 -0700 (PDT)
Date: Mon, 18 Mar 2024 10:54:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/boot: Improve the boot watchdog determination of
 stuck cpus
Message-ID: <ZfgPZEAhNUtpwiqv@macbook>
References: <20240315195704.3423282-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240315195704.3423282-1-andrew.cooper3@citrix.com>

On Fri, Mar 15, 2024 at 07:57:04PM +0000, Andrew Cooper wrote:
> Right now, check_nmi_watchdog() has two processing loops over all online =
CPUs
> using prev_nmi_count as storage.
>=20
> Use a cpumask_t instead (1/32th as much initdata) and have wait_for_nmis()
> make the determination of whether it is stuck, rather than having both
> functions needing to agree on how many ticks mean stuck.
>=20
> More importantly though, it means we can use the standard cpumask
> infrastructure, including turning this:
>=20
>   (XEN) Brought up 512 CPUs
>   (XEN) Testing NMI watchdog on all CPUs: {0,1,2,3,4,5,6,7,8,9,10,11,12,1=
3,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,3=
8,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,6=
3,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,8=
8,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,=
110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128=
,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,14=
7,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,1=
66,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,=
185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203=
,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,22=
2,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,2=
41,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,=
260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278=
,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,29=
7,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,3=
16,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,=
335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353=
,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,37=
2,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,3=
91,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,=
410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428=
,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,44=
7,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,4=
66,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,=
485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503=
,504,505,506,507,508,509,510,511} stuck
>=20
> into the rather more manageable:
>=20
>   (XEN) Brought up 512 CPUs
>   (XEN) Testing NMI watchdog on all CPUs: {0-511} stuck
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

One thing has to be said about the previous message: it was hard to
not see it when all CPUs on the system failed the watchdog test.

Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

