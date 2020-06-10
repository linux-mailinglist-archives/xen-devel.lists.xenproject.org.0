Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110481F533A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 13:30:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiyvw-00062m-EY; Wed, 10 Jun 2020 11:30:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mslP=7X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiyvv-00062h-HB
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 11:30:15 +0000
X-Inumbo-ID: c07828b8-ab0d-11ea-8496-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c07828b8-ab0d-11ea-8496-bc764e2007e4;
 Wed, 10 Jun 2020 11:30:14 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id o15so2114828ejm.12
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 04:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=8HzsMIiKuP2G/hGQcApryDlLyVRbXcUAjhYoJ5bAwlM=;
 b=XZxAaySneL/Ab4rOquIdrLw2MoBYIXgYwEifXn9L/6zD/fN2YDpLrJKAc6d/A6y2dQ
 8+E8HQa5gEe/8mbpUuBHRxHCTjqXfHSWvROlFsUPY/aN4uOHCKdQ00sQBDrXXyWVo4xn
 WAJNpCNCLbTZg51etPyv/Go28PHy2evq54o7OPIUT4vsV7svXaE84yQHeqm/xSYEAypx
 3Ma2Bc0SsgL8T7OoyymizKjvYd/knZDFw/dLNt9OBMcSu4CLvi0AEhX8gVNGKKYVe94G
 iA8ujLHm16wa0YU+2AHlTRout10Mfqf+dZlbcWkjsRGbKqbv/ny4+tORmtA9hhLl0C2S
 cgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=8HzsMIiKuP2G/hGQcApryDlLyVRbXcUAjhYoJ5bAwlM=;
 b=MBzGfbEcdeGBE0B9/O0cy8r3mt6J2kX3cWxpNY1h2JEnjLAPLcdL1YxmvUMQGMwcrS
 Ola4qjo0L5EnbvDhA1YZfPKLlVgVa/5xYwidJiUVGiASwaqssb1+bpF256Kb8QmLWblJ
 UGy2SsMhPqe/gcfbZbRBMapWk+vdgMkdm7muOS9otrep5z8WsTRIPPzIgzq1SmYa6kWu
 H/aN1HNvAESNULkR1zHj1RugqnmnyMa8Xil8zzImK6sJn1goCF22z8vk4uV77iFARKqn
 zLoOAvoGDtnoYlJSKFAaPSfkkBhDmhIYZ13bEAfY/04zvXiVGnGG5awC6/8imeXIqaC4
 iLUg==
X-Gm-Message-State: AOAM531LvK+J55MhfZP5YrOzjjVQKToiU3m2mbHr3aQw2O5mhGlKy3BB
 zBqbS6ZpWJXOk8B5JiUBzsY=
X-Google-Smtp-Source: ABdhPJzCldndimsop3VFc/On+vU9yOEcHGDvMel0MZOU+iDsRvCnwQiyHZ7xez7nLmVOhYgRLuIElg==
X-Received: by 2002:a17:906:2c44:: with SMTP id
 f4mr2988490ejh.183.1591788613706; 
 Wed, 10 Jun 2020 04:30:13 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id o7sm12973718edj.52.2020.06.10.04.30.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 04:30:13 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>,
 "'Jan Beulich'" <jbeulich@suse.com>
References: <24288.49140.163747.998808@mariner.uk.xensource.com>
In-Reply-To: <24288.49140.163747.998808@mariner.uk.xensource.com>
Subject: RE: Build fix backports for 4.9 - 4.11 inclusive
Date: Wed, 10 Jun 2020 12:30:11 +0100
Message-ID: <00e201d63f1a$81a74150$84f5c3f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIXAb/N9ElW9Z2nLy7CtXFSbxUYoahQLn+w
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
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Ian Jackson
> Sent: 10 June 2020 12:12
> To: Jan Beulich <jbeulich@suse.com>
> Cc: xen-devel@lists.xenproject.org; committers@xenproject.org; Wei Liu =
<wl@xen.org>
> Subject: Build fix backports for 4.9 - 4.11 inclusive
>=20
> 4.9 to 4.11 don't build on Debian stable, which we are now using in
> osstest.  This is because they are missing a number of compile fixes.
>=20
> Where things are straightforward I intend to backport these and push
> them to the relevant Xen stable branches without formally posting
> about them each here.  I hope that is OK.
>=20
>=20
> So far I have identified:
>=20
> For 4.11:
>=20
>   2b50cdbc444c637575580dcfa6c9525a84d5cc62
>   tools/xentop : replace use of deprecated vwprintw
>=20
> That makes it build.  I will push it shortly.
>=20
>=20
> For 4.10:
>=20
> That and a large number of fixes from Marek Marczykowski-G=F3recki and
> one from John Thomson.  Additionaly there is a problem with seabios,
> which is missing:
>=20
>   8c3f57ea1217ea0c80a72898bc35baa0e14af0e0
>   ssdt: Fix building of legacy acpi tables on current iasl compiler
>=20

Something like this is hitting me building 4.11 too. Weirdly it does not =
hit if I do a clean build... only incremental:

make -C seabios-dir all
make[3]: Entering directory =
'/local/scratch/pdurrant/xen/tools/firmware/seabios-dir-remote'
  Compiling IASL src/fw/ssdt-misc.hex
out/src/fw/ssdt-misc.dsl.i      4: DefinitionBlock ("ssdt-misc.aml", =
"SSDT", 0x01, "BXPC", "BXSSDTSUSP", 0x1)
Error    6155 -                                                          =
       Invalid OEM Table ID ^  (Length cannot exceed 8
characters)

ASL Input:     out/src/fw/ssdt-misc.dsl.i - 102 lines, 2567 bytes, 35 =
keywords
Listing File:  out/src/fw/ssdt-misc.lst - 8393 bytes
Hex Dump:      out/src/fw/ssdt-misc.hex - 4096 bytes

Compilation complete. 1 Errors, 0 Warnings, 0 Remarks, 2 Optimizations

> I think this can probably just be cherry-picked onto upstream seabios
> 10.2.
>=20
> Wei, should we do that, or should we try to persuade upstream to make
> a 10.4 containing this fix, or what ?
>=20
> I don't yet know if this is a complete list.
>=20
>=20
> For 4.9 I think probably all of the above.  There is also a build
> failure I don't yet understand:
>=20
>   ld: =
/home/osstest/build.150951.build-amd64/xen/stubdom/mini-os-x86_64-vtpmmgr=
/mini-os.o:
>   in function `TPM_TakeOwnership': gdtoa-hexnan.c:(.text+0x829a): =
undefined reference to
> `unpack3_TPM_RSA_KEY_PARMS'
>=20
>=20
> Thanks,
> Ian.



