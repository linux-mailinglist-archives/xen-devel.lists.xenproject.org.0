Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704591E8467
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 19:12:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeiXx-0002nM-Sp; Fri, 29 May 2020 17:11:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHfH=7L=amacapital.net=luto@srs-us1.protection.inumbo.net>)
 id 1jeiXv-0002nH-R1
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 17:11:51 +0000
X-Inumbo-ID: 7c4c02fa-a1cf-11ea-9dbe-bc764e2007e4
Received: from mail-pl1-x62e.google.com (unknown [2607:f8b0:4864:20::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c4c02fa-a1cf-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 17:11:50 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id q16so1397747plr.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 10:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=nGp/+75iqlq3uduDZuD3kTDOrfn+KoznVQbzyWd/W0o=;
 b=Iz5G/NbYnESBfEH6EWdVjujs8eFUmFP+RhrFVUnFccpnXv4Fa/BMMly6nTeGCYKQNz
 C8wEVN7Kny21GRz8hF5Q3DYntTnHnUP4Bb6E83XcTorLX6s0lCKByUnCXxHn0Qt87hIL
 a0Z3Hue9PxXFyB8S7an2uFhZkyhX47Ewf9Ct5tsdtdhtUH/nsbizxhYF19tREa6fIVtT
 PpeK7rJJcszGtoMaiZGWrzO1cp53RsPAYS3GNy93jxWxzsXT1QDnoq9MV/++bGm12YKg
 NEwfwlYSkboqITa2pkQa+0WBMg4DtDLrqQhTq2xfBYHBfSCvwkzHMejnXMDnUP6al0IK
 Eq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=nGp/+75iqlq3uduDZuD3kTDOrfn+KoznVQbzyWd/W0o=;
 b=E2Dui8Kh2afqdGn4gZUej3prUsk0uvBt79ma1kVfFNAHCRl736sf2cJ9QElefBc1cK
 tvIgvkpZmVRCNB3rHsrCxL0o4I2iseABJCCldzlumBG9EdAotEaAi1tvnG4ya7UkQaiJ
 SWskJD0KPjzg5fXcKcNn/Dip8gNiPa76Xfl7xCMnnF7br1nL40Gs+aeXrNI7OB0rFNgl
 +DPAmKa56zWI7dMtSYYFRFLVeCXJlNvIP1rzKFMVIaVcaxHB27cUQnSVdnS8+PODOW1n
 4z1DIUn14tLjnZKoDOX6rhQR5a2KaaH9pewBqHJCDrB5QoFtR82CukPzSfw3+Xs12FYZ
 UWzg==
X-Gm-Message-State: AOAM5324+DeLR1lZa28VH4hKiQXl+JgAwCzAp9q6I/pbghVbG2imnc1H
 rvp+XIVqCXANurpPDP23HWlbzA==
X-Google-Smtp-Source: ABdhPJxU7IET/hCFPb/sQTpkd+UhssO24dR0raJ+KxqwUUO0QOtBkWnqsfO01aR/A7zGCXOYcrsdlw==
X-Received: by 2002:a17:90a:9c6:: with SMTP id
 64mr10932757pjo.83.1590772309919; 
 Fri, 29 May 2020 10:11:49 -0700 (PDT)
Received: from ?IPv6:2601:646:c200:1ef2:2dc1:c1e9:9ff7:54d4?
 ([2601:646:c200:1ef2:2dc1:c1e9:9ff7:54d4])
 by smtp.gmail.com with ESMTPSA id n8sm32418pjq.49.2020.05.29.10.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 10:11:48 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [BOOTLOADER SPECIFICATION RFC] The bootloader log format for
 TrenchBoot and others
Date: Fri, 29 May 2020 10:11:40 -0700
Message-Id: <7FE0DF48-C221-460E-99D5-00E42128283C@amacapital.net>
References: <20200529112735.qln44ds6z7djheof@tomti.i.net-space.pl>
In-Reply-To: <20200529112735.qln44ds6z7djheof@tomti.i.net-space.pl>
To: Daniel Kiper <daniel.kiper@oracle.com>
X-Mailer: iPhone Mail (17E262)
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
Cc: dpsmith@apertussolutions.com, alexander.burmashev@oracle.com,
 krystian.hebel@3mdeb.com, hpa@zytor.com, michal.zygowski@3mdeb.com,
 grub-devel@gnu.org, x86@kernel.org, javierm@redhat.com,
 kanth.ghatraju@oracle.com, ross.philipson@oracle.com,
 xen-devel@lists.xenproject.org, leif@nuviainc.com,
 trenchboot-devel@googlegroups.com, alec.brown@oracle.com, mtottenh@akamai.com,
 konrad.wilk@oracle.com, phcoder@gmail.com, piotr.krol@3mdeb.com,
 ard.biesheuvel@linaro.org, andrew.cooper3@citrix.com,
 linux-kernel@vger.kernel.org, mjg59@google.com, eric.snowberg@oracle.com,
 pjones@redhat.com, lukasz.hawrylko@linux.intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On May 29, 2020, at 4:30 AM, Daniel Kiper <daniel.kiper@oracle.com> wrote:=

>=20
> =EF=BB=BFHey,
>=20
> Below you can find my rough idea of the bootloader log format which is
> generic thing but initially will be used for TrenchBoot work. I discussed
> this proposal with Ross and Daniel S. So, the idea went through initial
> sanitization. Now I would like to take feedback from other folks too.
> So, please take a look and complain...

> In general we want to pass the messages produced by the bootloader to the O=
S
> kernel and finally to the userspace for further processing and analysis. B=
elow
> is the description of the structures which will be used for this thing.

Is the intent for a human to read these, or to get them into the system log f=
ile, or are they intended to actually change the behavior of the system?

IOW, what is this for?=

