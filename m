Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E241A790C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:02:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOJJs-0000j2-EQ; Tue, 14 Apr 2020 11:01:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=akv/=56=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jOJJq-0000ix-3B
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:01:30 +0000
X-Inumbo-ID: 4aa0134e-7e3f-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4aa0134e-7e3f-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 11:01:29 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w4so14798921edv.13
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2020 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=IYQt+wstownzl3M07D6wi0vNLLoZDIkGEmMlQWfbV3Q=;
 b=ALHLJvOrB8wRB83tQVQXAO4LBlFFom5lsqC+l21Rib3Cqbe4lMSR6vhTLNz7H5psnO
 jxP0UEK4El3SCNLPnpaJiHlkRipDxJXBr+/tVTetxM87550de98bI4TwICGJFV6pwgu4
 fPfQrnUI7gfKPZ7xSEHeJ0ypwZ9yEqwhUIIqVkyHD9lBxS2hKZoifKrcFLVF8NtaTFyU
 QdLMFTqHM/VYm33q1TvbE1AgIVmTOiqbQWFz1ppZ/7ZXPUlU7mJVOzZvNLagVXN3ShXF
 dnyxKM18KFmHdSANvyNvW9zBoc0vAqlOoHx/hP985juBGFVlIGvVvElfMUPdfXuUY46Q
 S9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=IYQt+wstownzl3M07D6wi0vNLLoZDIkGEmMlQWfbV3Q=;
 b=YGzeMGgmE9iOBPJS8YPng5/Cfb79WvLGD6Gbk80p81WL2L3KExvoH5E+odQhhUg+Zy
 Q+OrQqQM0h7i4V8WaD9IDH9KX6dGeetwlNTz2qBp6oJhHlG4xpalW/JuV+RPRX63oAAO
 CuHuDAUmstAj9PqqAJc5HNASY/tcr7j3NS7/ewoCi3lcTAwP+QZjiBRZxUPUOvVseoGz
 Z2k741zwrzTAOA8JmG9utSA0128R+oyOItf0j1D5MO5zpAv2OM2QTMiW11nQUuEX0KLK
 i52DyjLm4pojIediBvaKRAb9a1fQB04/my1w17fAqlOc+fJI6ydqneqCE87fm2uWh6NN
 JtoQ==
X-Gm-Message-State: AGi0Pua347UktrxHdU1JxwebfVfjfIFGwTnUl57QrhscXABzd95uF4i5
 Q9WIBcbI2M3Z2nkic4D1ITg=
X-Google-Smtp-Source: APiQypIvCfP5WgKgoR+zjmovT3bA56T09FvjRLUDZ5InOkRypd/R7AFLmOmykkeKIcg4Mr2UtUVIqA==
X-Received: by 2002:a50:fe05:: with SMTP id f5mr17323030edt.338.1586862088465; 
 Tue, 14 Apr 2020 04:01:28 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id y10sm1999903ejm.3.2020.04.14.04.01.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Apr 2020 04:01:26 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Shamsundara Havanur, Harsha'" <havanur@amazon.com>
References: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
 <c7882dcb-9708-414c-98fb-0a0283db0f34@suse.com>
 <612892f2fed5cb02cbec289589e437d9badb8cc1.camel@amazon.com>
 <6e3732e8-01d0-e9de-e89a-cd1b5833e5a1@suse.com>
 <a102ec836a00714678fb3aa46787f597c9044f29.camel@amazon.com>
 <cfe18a03-854d-8b91-b333-ae2cefe3e1c8@suse.com>
In-Reply-To: <cfe18a03-854d-8b91-b333-ae2cefe3e1c8@suse.com>
Subject: RE: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Date: Tue, 14 Apr 2020 12:01:24 +0100
Message-ID: <000001d6124c$0aced570$206c8050$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFuCy2uGI4jNh4hl1w2kkxxIVrUTADKkfs7Amx1u9ABXrUQQAMwPUabAgJH1CWo+j890A==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 ian.jackson@eu.citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> >
> > Previous commit enabled MASTER for all functions. I am bit confused
> > here on the consensus on enabling/disabling/retaining BME.
> > Should we even care about MASTER?
>=20
> With the commit introducing its universal setting, I'm afraid to
> avoid regressions we can't sensibly alter the behavior unless it
> can be explained clearly why the original change must have been
> outright wrong.
>=20

Well the original code IIRC had no justification for setting BME and =
doing it unconditionally does seem dangerous. Could we at least make it =
configurable?

  Paul



