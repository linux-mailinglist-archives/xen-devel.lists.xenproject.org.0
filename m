Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5015E91534A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 18:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746832.1154039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLmNf-0006sk-JL; Mon, 24 Jun 2024 16:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746832.1154039; Mon, 24 Jun 2024 16:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLmNf-0006qI-Gj; Mon, 24 Jun 2024 16:17:23 +0000
Received: by outflank-mailman (input) for mailman id 746832;
 Mon, 24 Jun 2024 16:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SfmV=N2=gmail.com=sherrellbc@srs-se1.protection.inumbo.net>)
 id 1sLmNd-0006qC-6e
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 16:17:21 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a0259d5-3245-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 18:17:19 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-797f1287aa3so293900785a.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 09:17:19 -0700 (PDT)
Received: from smtpclient.apple (ool-44c00bfa.dyn.optonline.net.
 [68.192.11.250]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef32f9csm35844516d6.91.2024.06.24.09.17.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2024 09:17:16 -0700 (PDT)
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
X-Inumbo-ID: 3a0259d5-3245-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719245837; x=1719850637; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6TuVR671VZ9BWKMH/gVFkMAcPcaJpkStk5/9B4NKdA=;
        b=SO3rpgUDcuxcnYx0GttkGMf6m/4Z9g3LY0v7yfwN4W3tA93dXTe0ODQPWIJpggaqta
         9+hItcT+v2hsJMmrSliMu4wl2rV7t+bCDueZZe/CirGH1RX+atf6/J3/Qg74uQVynWka
         wcgHxTPnRjIrkApl+PUcFKJRJTozQexFTC4FkYhQGc3fxKUF2WmTK1rSzBibyfao6RR2
         K616vV9P1Xe5iI2fdfJ1pQx/yB5Mhn4fp5E/ehuYprut7eqjFhUNM/pLJeK/vmAdoyHg
         UI1V2tuN28+BnF4q1ycaGTIt+s7cLKi+taUMRdbTabtG8Td6Abj5Kcs8QIfdRNRFkXp7
         6KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719245837; x=1719850637;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6TuVR671VZ9BWKMH/gVFkMAcPcaJpkStk5/9B4NKdA=;
        b=ZDeUvkfWHAoo8215v54mVoQsC/t/imhv46UXKah96bMxRSCvvcNVu9w/wwd4iTCxeG
         nT8Yl8Wrn2XCTqSefIM1X/6ARuaJNAPPL4/Nvzxw1zi5yS9soSri4qZMrpJRktUT2RFR
         IcpuqbqQTmjSk9zqIo8QTqUKZW+0SJsCMCQapMbZwy7Ri7yZNQldizoI2KSdD5wEY13F
         hwoh0W4CVWatiV3S/0HLJDZ/fJM3BUSdgo54h++ctubSDoPUYgU5FUfK1R4rtzAaDt3D
         FtYEOPOYvZo3EeUZi1Mk69IoAyTaE90tY+Vo9A0bJlGGl9PwI88tKuDK+JnQVYJU+d37
         aUhg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Sh+OoDe3iWgW13D4uHrjfNCxwxSzUN49sCJ7AeBiD3NhjbtlEbK2zCleHeNdha3sYLS077k3/JtohpHfnUgwMz4ai+lsvhuXRY+wIIs=
X-Gm-Message-State: AOJu0YzVkPBjCHG6Z7yxo6uB74U14u48z31LwJcLTzZMX9iNn9bdFnxW
	UH9Ee11WIK8fR+xYPk62ReN6AYZDUzOCU2yvp4k25jPr5omZ+aD8
X-Google-Smtp-Source: AGHT+IHF9Dp0n4wTdOw00QkcvfZxeXZaPfhZluq1Vk9wgrLjwesYk5sTOpSWjOWjNWBwBwC6B7lKrw==
X-Received: by 2002:ad4:4505:0:b0:6b5:a38:bc78 with SMTP id 6a1803df08f44-6b53bfeaf30mr56405116d6.59.1719245837258;
        Mon, 24 Jun 2024 09:17:17 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: E820 memory allocation issue on Threadripper platforms
From: Branden Sherrell <sherrellbc@gmail.com>
In-Reply-To: <23f4b971-a161-47db-85a7-54f50300d039@suse.com>
Date: Mon, 24 Jun 2024 12:17:05 -0400
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
 xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CBB9871C-177F-4EA1-B33B-ED2756963976@gmail.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com> <ZaeoWBV8IEZap2mr@macbook>
 <15dcef46-aaa8-4f71-bd5c-355001dd9188@suse.com> <ZafOGEwms01OFaVJ@macbook>
 <7BAC7BB5-C321-4C34-884A-21CC12F761BB@gmail.com>
 <36d581a0-f144-4756-b345-8b74ccc25c74@suse.com>
 <70B65B5D-C075-4D8E-8D2B-08A1930EE68B@gmail.com>
 <23f4b971-a161-47db-85a7-54f50300d039@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3731.700.6)

Sorry about that. The thread quickly diverged from the core issue to =
helping diagnose GPU issues, so I thought it best to circle back to the =
ticket reference to realign.

In any event, if there is any aid I can provide on this front please let =
me know. I have worked around this issue for now by rebuilding my x86 =
dom0 (Debian) kernel from source with link at 2MiB rather than 16MiB =
(default). But this is a rather annoying requirement when updating the =
dom0 kernel. If there is any information you need from such an offending =
platform as this one feel free to let me know and I can test or =
otherwise provide relevant information as needed.

Branden.

> On Jun 24, 2024, at 9:40 AM, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 24.06.2024 15:07, Branden Sherrell wrote:
>> What is the reasoning that this fix be applied only to PVH domains? =
Taking a look at the fix logic it appears to walk the E820 to find a =
suitable range of memory to load the kernel into (assuming it can be =
determined that the kernel is also relocatable). Why can this logic not =
be applied to dom0 kernel load in general?
>=20
> Because PV requirements are different, first and foremost because =
there
> we have pseudo-physical and machine memory maps to deal with. As you =
can
> see from [1] I've raised the topic on how to deal with PV there, but =
so
> far there was no reply helping the issue towards resolution.
>=20
> Btw - please don't top-post.
>=20
> Jan
>=20
> [1] =
https://lists.xen.org/archives/html/xen-devel/2024-06/msg00831.html


