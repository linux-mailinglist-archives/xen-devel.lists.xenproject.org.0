Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC57D1848B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 12:01:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201455.1517092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfc8a-0006qX-7v; Tue, 13 Jan 2026 11:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201455.1517092; Tue, 13 Jan 2026 11:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfc8a-0006p3-2v; Tue, 13 Jan 2026 11:00:36 +0000
Received: by outflank-mailman (input) for mailman id 1201455;
 Tue, 13 Jan 2026 11:00:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sxhW=7S=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vfc8Y-0006ox-7H
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 11:00:34 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14045f7d-f06f-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 12:00:31 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-59b685d2b79so7128609e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 03:00:31 -0800 (PST)
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
X-Inumbo-ID: 14045f7d-f06f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768302031; x=1768906831; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0gnlK1/Td8avc+cb1w5mS2e0lT26/bH6sbsF4/FYnvA=;
        b=Sf9yxpJBPZmDxIF7W4xQI3QRQYsU0jdnnyhA0ohypTXnAh98aiY7/kzN3gwuFhkxdF
         Bhse01CqlkSesmE1qF+5mQc/GClBXTaS9DnU+BqjsaD3R0sinmhhZ87B3afyvcSnKU65
         APp3DjlAXZ0Ca3aVr48xoPrBsD9lwacUDJnxdWNRc6QDbdiXQcERR2Z0D32+a/ZTOXbQ
         zCFId6QKOxC1zAwBFMmm+T27IBZVqTgpVAhiPtfys9ltI0SWM/SbDCQbz1RrVQM0QqzN
         gI5dMYF6HmBNw0yTVH+svyqkLCDe0XUOifPtACXdPoPpGq2CSWIc/3F+iJoS1/X7vlxs
         iwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302031; x=1768906831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gnlK1/Td8avc+cb1w5mS2e0lT26/bH6sbsF4/FYnvA=;
        b=au/lTeD8oLBZeheQ6i84oW/lBlJXc4PodYXElDU1+Pkji7P8zZcJupotqmVGCKin/y
         b3Zrl1dBhoC2wp6hNDTIRGTrCEoMgF9RRcOOFQQmi+NgE+ynCbVX38vhmvbYV8a346H4
         oSIDRH580b86JnNe8NdPydjOGvoWtuUcD+JGWEHE50jE5bb+X24jepmLLRj/FPjQTANW
         uH4G6M+lCLNMDl2sQPk0vN6Y/e4kLQ8uHF6gOBhdsmE81fI6Dc/lymqzscXL1/gpmUr5
         FPgM1tQHc/qRcSxxMuG32/BXmt6XYVlxs5FXazahwCnsUU840Me9KIxlb5F+OV0quj1I
         zO5g==
X-Gm-Message-State: AOJu0YzPuOOnWbxuxB/nylJpNIm6/Wm1QkLC2xeNFD4+HIZleLO5GOC7
	/Ge5nqXHifTLrojY4tNYWU9pKqhEPT+0vsNFywzzyCKUB6GqhAvXkgt2TRdVBaDaWIkG8nLCgio
	xaHwlbFFRRmeLthVs0UHNGJUetlo2/LshGwLq
X-Gm-Gg: AY/fxX5WX8NE4fC5YRSRct3CFKmx7TOyzqgLKnJ7CGGya6mCs+B27AofdZ7BQ/J98DW
	U00tt5hpLnRIn0FtakneoX1ncLfmffOqAF6Va0KoLoFYN2uNtaLHRegcZo7tBMohIcP4KGHNOde
	Vr/mXBwYNlvCMDcm15KMRsphgy+X170Ty7C1w5hLjCkL8iP6W5rch5Pi1mbjuGKQx7ot1lX+4zY
	W1tkaxM3SbXDsa+23KeZ2MwyZnQ+fpgUv+/TqWOzgHpRIvlPMWYXWJb2elMkZe3rZw9oQ==
X-Google-Smtp-Source: AGHT+IGsfxQGiZJPZpv/ChWQS78nbpbCLpKJyCHDX7eqDB6Bqx6IkHw24ioTPD5ffpQxpue5vNWI83nXQth7KF/+H+g=
X-Received: by 2002:a05:6512:3c88:b0:59b:8cca:9546 with SMTP id
 2adb3069b0e04-59b8cca9a9amr2647366e87.30.1768302030439; Tue, 13 Jan 2026
 03:00:30 -0800 (PST)
MIME-Version: 1.0
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 13 Jan 2026 13:00:00 +0200
X-Gm-Features: AZwV_QgWQXcD146F7QjCdEH4X5JB3HIdcMaFLl10QUnnnn44Sk6YUlxeGDTtUvM
Message-ID: <CAGeoDV_aYQogU+eb-oGt9i2LrBU9Ak1vayh7dLZSmYEihN-deg@mail.gmail.com>
Subject: [BUG] LLC coloring: parse_color_config shorthand/UINT_MAX/partial
 configs + missing newline
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

While investigating the Arm cache coloring, I noticed a few issues in
parse_color_config() and one minor logging issue in the DT-related changes.

1) parse_color_config() appears to accept "shorthand" forms not described
by the documented grammar

The function documents:
COLOR_CONFIGURATION ::=3D COLOR | RANGE,...,COLOR | RANGE
RANGE ::=3D COLOR-COLOR

However, as implemented, inputs starting with a delimiter may be
accepted and interpreted as if a leading 0 was present. For example:

",2-6" -> interpreted as "0,2-6"
"-10,2-6" -> interpreted as "0-10,2-6"

The reason is that the parser calls simple_strtoul(s, &s, 0) and then
directly checks for '-'/',' at *s. If no digits were consumed, start
becomes 0 and s can remain at the delimiter, which then gets treated as
a range or separator.

Questions/proposed direction:
- Is accepting these shorthand forms intentional? If yes, I think we
should document them explicitly (both in the comment above
parse_color_config() and in user-visible docs).
- If not intentional, we likely want to reject by verifying that at
least one digit was consumed for each number before accepting '-'
or ','.

2) Potential infinite loop/hang for ranges ending at UINT_MAX

The range expansion loop uses:
for (color =3D start; color <=3D end; color++)

If end =3D=3D UINT_MAX, incrementing color wraps back to 0, and
(color <=3D end) remains true, resulting in an infinite loop inside early
parsing. The current bounds checks do not prevent
(start=3DUINT_MAX-some_small_number, end=3DUINT_MAX)
from passing.

3) Partial global state on parse error can leak into later init/config use
parse_color_config() writes into the provided array and increments
*num_colors as it goes. On a parse error it returns -EINVAL, but the
partially updated outputs remain.

his is particularly problematic for the cmdline parameters, because the
utputs are global and can later be consumed by llc_coloring_init() or
dom0_set_llc_colors().

A concrete example is "1,w,3-5":
- "1" is parsed and committed
- at "w", simple_strtoul() returns 0 and does not advance 's'
- the code then treats this as a single color 0, commits it, and breaks
out with *s !=3D '\0'
- the function returns -EINVAL, but num_colors and the array already
contain a partial configuration

In other words, a rejected configuration can still leave xen_num_colors
or dom0_num_colors non-zero and the corresponding colors[] partially
populated, which risks the feature being initialized/applied with an
unintended set of colors.

I think the parser should be fail-closed here. Minimally: reset
*num_colors to 0 on any error path (including the final "*s ? -EINVAL"
case). Ideally: parse transactionally into a temporary buffer and only
commit outputs on full success.

4) Cosmetic: missing newline in printk in domain_set_llc_colors_from_str()

printk(XENLOG_ERR "Error parsing LLC color configuration");
without a trailing '\n'.

I wanted to flag these issues in case you=E2=80=99d like to address them in=
 the
next revision/follow-up.


Thanks,
Mykola

