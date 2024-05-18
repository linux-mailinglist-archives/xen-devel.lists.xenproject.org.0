Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4FB8C90BA
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 14:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724788.1129964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Img-0004Zl-4y; Sat, 18 May 2024 12:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724788.1129964; Sat, 18 May 2024 12:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Img-0004XA-1j; Sat, 18 May 2024 12:03:30 +0000
Received: by outflank-mailman (input) for mailman id 724788;
 Sat, 18 May 2024 12:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e6GZ=MV=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s8Ime-0004X2-DY
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 12:03:28 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1dce1cf-150e-11ef-b4bb-af5377834399;
 Sat, 18 May 2024 14:03:26 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-571be483ccaso5800556a12.2
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2024 05:03:26 -0700 (PDT)
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
X-Inumbo-ID: a1dce1cf-150e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716033806; x=1716638606; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDgUUedlq+wHsurHoYWZ+h5FGofkrPEY4psJ90oQjvM=;
        b=m3xSkOfxG1sWL1FyTZR62FO6g6E2lrRakRFcU5BOzuzdpSmp5pVAjMez3b5wTyOFoN
         23E4+hyt0ZCo7KqKf/WDNp95rCBKLRCgR1b4BkFQOsRM715yWfoOCMeajDw6pzcdo8Rp
         +3UMz4O4tL7W21bp01saL04IqWKOpoUEOaJbSnS6Sd/6Lyh3Zei27sVb14DzDT4YJHIz
         AaldyDPkiqtzAqHwZcm8yLGVPmHbHrJVJ5RpEXUerUxB2/bWTMzjMnbF+kD2UNp4U5jf
         bnzq8Ik4mcSlAxJPk0CvuVXwhfgB4SqxC2AaSYJM9YGRlDxvsockVjPoPPo9vnTsXrCQ
         +2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716033806; x=1716638606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDgUUedlq+wHsurHoYWZ+h5FGofkrPEY4psJ90oQjvM=;
        b=wjq0fdG5V0UxBbae/Ko6QU2vX3p0ZYXGMcYCPpDkaULJiQZUjqL+2smX77rcTFo9hq
         yHZOeOK0l59j58RfbLTHcskbYPEKPDU2/45sfIzkeYOcsPnPyHozJLLFmbZgf3b/yxyz
         i4MLVzskeh274FUkgVimekHN42kK1bbQjtmiBBDUnndrX2h7wr5JV0tX5NWdO9aIcevb
         3KHttBM6prprJe1h1WsFVRBoI1T0BZtjISFJ00SZs5efnTAM81qkPSIo9ciZWe4b5OHA
         Gc1X/J1jsP0p2rVQvA4cNqbotZiroIgoc6LRgb/RuKYM0fBzKf2yIBfKXR9EH2iItAXy
         zHIQ==
X-Gm-Message-State: AOJu0YxN/UbpTzJml8ECNVW5Rm/LOr0s5f727oGYAtYWYT8aaPow7xDo
	j+GPSPJn+hOaPl+IsQRvjp/R0FEpwkglY+9Q9LqUtRn1IpdFq8Li9l0JDkDsN4DlAefcuIlujhd
	IobLrWNrUIHU0Lez5/gaYzIPv92uk4A==
X-Google-Smtp-Source: AGHT+IHaTJoKJIJ8/GHVEkMkHqTQxfgtLCCaacZHTEAmxDhn1JYC/8rUT+fuiknbF9yX8kKLX84YABTlF1KzE9hkvg0=
X-Received: by 2002:aa7:d74b:0:b0:574:b113:6677 with SMTP id
 4fb4d7f45d1cf-574b11366ecmr14327163a12.17.1716033805527; Sat, 18 May 2024
 05:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240517140506.8460-1-leigh@solinno.co.uk> <20240517140506.8460-2-leigh@solinno.co.uk>
In-Reply-To: <20240517140506.8460-2-leigh@solinno.co.uk>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 18 May 2024 08:03:13 -0400
Message-ID: <CAKf6xpvprAScrAKN_s1K7EXc+mNXyvS7-3iaqhK8Cu=BKCYrEw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] tools/hotplug/Linux: Add bridge VLAN support
To: Leigh Brown <leigh@solinno.co.uk>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony Perard <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 10:05=E2=80=AFAM Leigh Brown <leigh@solinno.co.uk> =
wrote:
>
> Update add_to_bridge shell function to read the vlan parameter from
> xenstore and set the bridge VLAN configuration for the VID.
>
> Add additional helper functions to parse the vlan specification,
> which consists of one or more of the following:
>
> a) single VLAN (e.g. 10).
> b) contiguous range of VLANs (e.g. 10-15).
> c) discontiguous range with base, increment and count
>    (e.g. 100+10x9 which gives VLAN IDs 100, 110, ... 190).
>
> A single VLAN can be suffixed with "p" to indicate the PVID, or
> "u" to indicate untagged. A range of VLANs can be suffixed with
> "u" to indicate untagged.  A complex example would be:
>
>    vlan=3D1p/10-15/20-25u
>
> This capability requires the iproute2 bridge command to be
> installed.  An error will be generated if the vlan parameter is
> set and the bridge command is not available.
>
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

