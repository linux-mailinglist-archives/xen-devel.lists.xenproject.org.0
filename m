Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D9C307645
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 13:45:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76988.139203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l56g6-0002S8-2I; Thu, 28 Jan 2021 12:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76988.139203; Thu, 28 Jan 2021 12:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l56g5-0002Rj-VS; Thu, 28 Jan 2021 12:45:37 +0000
Received: by outflank-mailman (input) for mailman id 76988;
 Thu, 28 Jan 2021 12:45:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgTx=G7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l56g4-0002Re-Dx
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 12:45:36 +0000
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b289c31-15be-418e-a191-cc1cee2c06ef;
 Thu, 28 Jan 2021 12:45:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id m2so4204595wmm.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 04:45:35 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id 17sm5604203wmk.48.2021.01.28.04.45.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 04:45:34 -0800 (PST)
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
X-Inumbo-ID: 1b289c31-15be-418e-a191-cc1cee2c06ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=5HZmOnhuwAj2v4zjq2s472s3S/ZmtFf7k2VzcL5KLLM=;
        b=Qms3RaHi+DvRsyyVaA/lNb2x+IrecvIp5CtMyJpm7xAOAi/8NAtORBAhvmx11wzXLv
         0ouZxQpC9uYV5vW6X67XvMSkWR/ggSVLhOm27PP7UxfwsAQTGPOmA2yNmcHiDjFfWwss
         eBEfdEs4UCGEYBj82nVFBnqdavV6VSzc4oYc4xtQ2uMzZWTLO8MOY69WXej1GhK31y0j
         DPMjvHpFWGo7sMsAzKDn/JiZTGTQq4UF7cddWbIBL8wqCgmfSVmShpz7EyblfUO/9Z6s
         yPyPVwgNVDTnn4VELCA27skTX4hjgKumiXQG9o1lRxV0QGqfaB6y8ZvtyXntR6ssvRNn
         5z0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=5HZmOnhuwAj2v4zjq2s472s3S/ZmtFf7k2VzcL5KLLM=;
        b=DYy61i9qn9yEkAbdTYqDr/9/Z9yT9B3dkvP1kmX62hQwbo7UdaKFcBGFQ/AFVOOQQR
         xAFTb7IEslwK3V5seLZaehtlHXczyBTvnCz+qrY7kOK15fFbj9vB+KzzENGbJJf+Fnba
         ifwNffTXqxVari4fMP8xdb16DEW97+TDC5/QpME9MP4w5JAZVeV7/als/OOAXYdnGWLI
         bMWXK85txDqVnfogDQS5QnLog+4QvK4L4XhdstnPRnF0VkTuD2Xg4eocr/AzAmBAw81v
         +NbzX0B0M8O3j4HqPTWoZ7XJBUOP155jpG9ZRrTlg8IHmWFK38wvyXrgLkY6P50XHQYL
         i4uA==
X-Gm-Message-State: AOAM5312hhb7l+7n6V+XvqkngGG6/pxaNj5VMy9+RwdkK+PE8nmI2ImK
	vBPvOPq/CxdJJcIZQBpY0GE=
X-Google-Smtp-Source: ABdhPJygj28s4pfoQGpSH5eZqlVdE6ngPXXE0+aDXsnRk8MZgUwIBGcqrIXjj28iGOSOXrpaDMpHCQ==
X-Received: by 2002:a1c:3882:: with SMTP id f124mr8508548wma.56.1611837934699;
        Thu, 28 Jan 2021 04:45:34 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Xen-devel'" <xen-devel@lists.xenproject.org>
Cc: "'Wei Liu'" <wl@xen.org>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Juergen Gross'" <jgross@suse.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	=?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
	"'Hubert Jasudowicz'" <hubert.jasudowicz@cert.pl>,
	"'Tamas K Lengyel'" <tamas@tklengyel.com>,
	"'Manuel Bouyer'" <bouyer@netbsd.org>
References: <20210128120152.9908-1-andrew.cooper3@citrix.com>
In-Reply-To: <20210128120152.9908-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH v4] tools/foreignmem: Support querying the size of a resource
Date: Thu, 28 Jan 2021 12:45:33 -0000
Message-ID: <029301d6f573$783c9a10$68b5ce30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGhwFBtvDP1/NOJjC1fTcVPiTmZCaqnZhkg
Content-Language: en-gb

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 28 January 2021 12:02
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; =
Paul Durrant <paul@xen.org>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Juergen Gross =
<jgross@suse.com>; Ian Jackson
> <iwj@xenproject.org>; Micha=C5=82 Leszczy=C5=84ski =
<michal.leszczynski@cert.pl>; Hubert Jasudowicz
> <hubert.jasudowicz@cert.pl>; Tamas K Lengyel <tamas@tklengyel.com>; =
Manuel Bouyer <bouyer@netbsd.org>
> Subject: [PATCH v4] tools/foreignmem: Support querying the size of a =
resource
>=20
> With the Xen side of this interface (soon to be) fixed to return real =
sizes,
> userspace needs to be able to make the query.
>=20
> Introduce xenforeignmemory_resource_size() for the purpose, bumping =
the
> library minor version.
>=20
> Update both all osdep_xenforeignmemory_map_resource() implementations =
to
> understand size requests, skip the mmap() operation, and copy back the
> nr_frames field.
>=20
> For NetBSD, also fix up the ioctl() error path to issue an unmap(), =
which was
> overlooked by c/s 4a64e2bb39 "libs/foreignmemory: Implement on =
NetBSD".
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>


