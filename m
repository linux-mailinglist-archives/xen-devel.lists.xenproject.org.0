Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B433D373
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 12:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98271.186311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM8KR-0002Qn-H4; Tue, 16 Mar 2021 11:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98271.186311; Tue, 16 Mar 2021 11:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM8KR-0002QO-Di; Tue, 16 Mar 2021 11:57:39 +0000
Received: by outflank-mailman (input) for mailman id 98271;
 Tue, 16 Mar 2021 11:57:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QY9G=IO=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lM8KQ-0002QJ-Dj
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 11:57:38 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cf8c17e-c1ea-47af-b483-bc3c613230c4;
 Tue, 16 Mar 2021 11:57:37 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id 18so61937343lff.6
 for <xen-devel@lists.xenproject.org>; Tue, 16 Mar 2021 04:57:37 -0700 (PDT)
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
X-Inumbo-ID: 6cf8c17e-c1ea-47af-b483-bc3c613230c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e4Hc1uNcOeVtQqWE85Je96hp9PhB4a4FXst+jLi+FjY=;
        b=BsfHeOktPXzSzeNBLAa6HH7mzTJgO3UKkpX7XeuRz89dtvyKU1n57zjm+5YwgioyzD
         KFdnSobjpeBBvNMCjAqcthnPbGKPDp8515uCIiU8v3qLTmqAjnPCHiuCGOLyc74tZXMw
         3zB9XmgpFrLx0rkscSR7hTZ+OHY8jCCTvF2OXVi2CLSCeIwg51TBbF0cZRy93A0TYaYZ
         HjgVVyJq9wTo1u46qMAlBrFO+RXLlhgpfFD77saFptl5dGJF3oeMPszKr2JgSnuF4b6Y
         e/e0DCO+tnzNICi9OeXBJWnyplBROR+TzGR953a0NbBiY0Sz0/I6gCgb34bjcKuGWylA
         8yZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e4Hc1uNcOeVtQqWE85Je96hp9PhB4a4FXst+jLi+FjY=;
        b=tpDRrxcdPZIdibQJvccjA8pddGtp17Zl3HEFMsFsCqgV5wdHfUDsBAox3S07E3xlV+
         HQ0SaBqGFHlhsDxfB3xR+SiLD7CcwISb+Oe9+ZE8If/In9+2d+jFpo4dBcSganc4Y1TU
         ElSaFqX1dNRIKQhWLCU5ZS/5YrDFIV5Qwm+YFHphVe5k5dm7J866BpG7swg9abk/kr5C
         fKmSj66Prfl9h7MSqbE9jrdwbH8vP+/cESIadeVbgPsdwwS8tO8cSiKzb2gNsNy653zp
         n6LbfQI8cS9fd0uAYrdVrq+hcgkrfYfifILeP3DDMqCpmmhEDSPuZNazMTRx/pqhasGd
         AaRQ==
X-Gm-Message-State: AOAM533AsNph923icrsYBJJBUWunuhOTf0w7G4I2Q36+d2zRd7GYLN0z
	U4liVcaFn7aw9MHHEjwzD7GSWFboRfe9sanoQz0=
X-Google-Smtp-Source: ABdhPJwsCbOdhZOxyX7/7EhZgnH+9wIxsRYLSDbsAQ5l0OB5n1goXOJu3JRTIwzpG9BjsnR7kzl83TbLCdWVLYaUrqY=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr11383621lfo.529.1615895856149;
 Tue, 16 Mar 2021 04:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <s6DNE-pStgBNMxxe8WkUZJbkqMyjdifBDHA_3gMGdC6oE1rweg8Au8ZPHaDFkvT0ETGykePtDj02LphVIWtdfyFQ9ZBFMjKJq6UNzY4BiAc=@protonmail.com>
In-Reply-To: <s6DNE-pStgBNMxxe8WkUZJbkqMyjdifBDHA_3gMGdC6oE1rweg8Au8ZPHaDFkvT0ETGykePtDj02LphVIWtdfyFQ9ZBFMjKJq6UNzY4BiAc=@protonmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 16 Mar 2021 07:57:24 -0400
Message-ID: <CAKf6xpsfh_w2TnJWH1wYSOcRhBETRxU61paovoMN+O2Mz4UEWw@mail.gmail.com>
Subject: Re: AMD Ryzen 4000 (Mobile) cpufreq issues
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 11:03 PM Dylanger Daly
<dylangerdaly@protonmail.com> wrote:
>
> Hi Xen Developers,
>
> It appears AMD Ryzen 4000 based CPUs are not supported by `xenpm`, runnin=
g `xenpm get-cpufreq-states` returns nothing and `get-cpufreq-para` returns=
 `failed to get cpufreq parameter`

In dom0, do `modprobe xen-acpi-processor`  and see if `xenpm
get-cpufreq-para` works.  Xen needs Dom0 to load some ACPI info before
xenpm can work.

Are you running Qubes?  For some reason xen-acpi-processor doesn't
load there automatically.

> This was somewhat expected as Ryzen 4000 series CPUs are quite new, so as=
 a workaround I tried putting `cpufreq=3Ddom0-kernel dom0_max_vcpus=3D8 dom=
0_vcpus_pin` onto CMDLINE, from what I've read this should essentially pass=
 control for CPU frequency scaling down to dom0's kernel (5.11.4).
>
> However acpi-cpufreq doesn't load, when trying to insmod it I get the fol=
lowing error `insmod: ERROR: could not insert module acpi-cpufreq.ko: No su=
ch device`
>
> I can't seem to see anything related to Xen relinquishing control to dom0=
 in Xen's console, any help would be appreciated

I haven't tried using cpufreq=3Ddom0-kernel, so I can't help here.

Regards,
Jason

