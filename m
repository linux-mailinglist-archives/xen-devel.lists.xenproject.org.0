Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7822D1A7ED9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 15:52:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOLyp-0003Uz-TZ; Tue, 14 Apr 2020 13:51:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=akv/=56=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jOLyo-0003Uu-O7
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 13:51:58 +0000
X-Inumbo-ID: 1b6d6a82-7e57-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b6d6a82-7e57-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 13:51:58 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c7so17238338edl.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2020 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Dt4k/XK02DKznW3AtMB5fBluLBEtE4XZYUVoLyAo5OI=;
 b=Bb8OWHD1S8wERsZ8egEDK6JyXn3BFxSUvv6owRD4zsyO/WeK0OYo+d02xUHTgQzwU+
 nITDN06ziZ/Et3TOdvhjB79PXJOAVQJns8XL3tKdrk0tyxFXKKjLhSpOV/HCCW+0rvps
 BlihrX8cWdpwEAwLSwp+NbQoJzrKaldX3+IupUD8kY0hUnPI4aH42VMKJ4HQzSU7COSC
 ApWF4QWOd6XrNGqgnk3mzt4zC3+bCnhu0gMT9gY9qQMxZ/a3UDtiXVLc3W/f/nDNpKT2
 f0qkci+AQRXQdhjEnXxu7VZCtSi/OwJW9d9YCfQhj5e7isCf8lbdEMW3NWJfmH5GDud1
 AxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Dt4k/XK02DKznW3AtMB5fBluLBEtE4XZYUVoLyAo5OI=;
 b=s0auJi5CiVOn0UgLWzHI5MqIS1/xvTM8CNSChJPwnU0i8oMDt0x0yIs6K4ad8llkZQ
 0YVslrYkS93hIEKxL3xl+AI5e+UF5B/1hTIysUWtnMjYrRSFhKNstnKvRu2BcGGTc1hN
 sfja+p8ZA0g0ioD8s1lEWQPgArOFA24597ObwIatTFB7OAByB8njYwsySkeMa5ZGmFQj
 jJPEBo8iY8RqZS4VsjZdt/cUv16JenFHA9OIVZZuBnT4gcT8TGVHeaWCulTHIVJ107B7
 PNnK42mMsdh8N8OaupYX7A6Uotfj4KirkjvQM8UKXar38Oq/0YjLapLuKA+DMp4kAv5Q
 ANAg==
X-Gm-Message-State: AGi0PuZ2gwhJc+MD8wGA6akzfwtzT9AwWd+6wNt1euQXtb9rrlkGnl6r
 1n2pd3DwdsY8ON7qC1mk+Ag=
X-Google-Smtp-Source: APiQypJuTNJl1rR8LpqjRGggIxFj3l2PNaTP7edKekQqUOxXv9qwpnmQrgEws7+mjZaFmHP1oH5Djw==
X-Received: by 2002:a50:bb25:: with SMTP id y34mr10159597ede.237.1586872317204; 
 Tue, 14 Apr 2020 06:51:57 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.188])
 by smtp.gmail.com with ESMTPSA id sb17sm1580667ejb.75.2020.04.14.06.51.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Apr 2020 06:51:56 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
 <c7882dcb-9708-414c-98fb-0a0283db0f34@suse.com>
 <612892f2fed5cb02cbec289589e437d9badb8cc1.camel@amazon.com>
 <6e3732e8-01d0-e9de-e89a-cd1b5833e5a1@suse.com>
 <a102ec836a00714678fb3aa46787f597c9044f29.camel@amazon.com>
 <cfe18a03-854d-8b91-b333-ae2cefe3e1c8@suse.com>
 <000001d6124c$0aced570$206c8050$@xen.org>
 <90fd6e75-32b6-a140-1d20-083947bf1681@suse.com>
 <000001d61254$020b0dc0$06212940$@xen.org>
 <7c9ba731-bde1-96d7-6d93-9d33160f749c@suse.com>
In-Reply-To: <7c9ba731-bde1-96d7-6d93-9d33160f749c@suse.com>
Subject: RE: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Date: Tue, 14 Apr 2020 14:51:55 +0100
Message-ID: <001901d61263$dc9d58d0$95d80a70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFuCy2uGI4jNh4hl1w2kkxxIVrUTADKkfs7Amx1u9ABXrUQQAMwPUabAgJH1CUBoTRAhwIYHsW9AsXKQUsB0SSrKai37Mbw
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
Cc: wl@xen.org, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com,
 "'Shamsundara Havanur, Harsha'" <havanur@amazon.com>,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 14 April 2020 14:43
> To: paul@xen.org
> Cc: 'Shamsundara Havanur, Harsha' <havanur@amazon.com>; =
xen-devel@lists.xenproject.org;
> andrew.cooper3@citrix.com; ian.jackson@eu.citrix.com; wl@xen.org; =
roger.pau@citrix.com
> Subject: Re: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode, =
after all resource allocation
>=20
> On 14.04.2020 13:58, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 14 April 2020 12:40
> >> To: paul@xen.org
> >> Cc: 'Shamsundara Havanur, Harsha' <havanur@amazon.com>; =
xen-devel@lists.xenproject.org;
> >> andrew.cooper3@citrix.com; ian.jackson@eu.citrix.com; wl@xen.org; =
roger.pau@citrix.com
> >> Subject: Re: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode, =
after all resource allocation
> >>
> >> On 14.04.2020 13:01, Paul Durrant wrote:
> >>>> -----Original Message-----
> >>>>>
> >>>>> Previous commit enabled MASTER for all functions. I am bit =
confused
> >>>>> here on the consensus on enabling/disabling/retaining BME.
> >>>>> Should we even care about MASTER?
> >>>>
> >>>> With the commit introducing its universal setting, I'm afraid to
> >>>> avoid regressions we can't sensibly alter the behavior unless it
> >>>> can be explained clearly why the original change must have been
> >>>> outright wrong.
> >>>>
> >>>
> >>> Well the original code IIRC had no justification for setting BME
> >>> and doing it unconditionally does seem dangerous.
> >>
> >> I'm not viewing this as dangerous, merely as (typically) pointless.
> >> A well behaved device won't start issuing DMA requests merely
> >> because it had its bus mastering capability enabled. (And in the
> >> context of some IOMMU work of yours you actually stated there are
> >> devices where clearing of this bit won't stop them from doing so.)
> >>
> >
> > It's a line of defence against some devices at least,
>=20
> What defence? Once we're past hvmloader, the guest can do whatever it
> wants anyway.
>=20

My observation is that it is typically the device function driver that =
will enable BME, and that may come after a device-specific reset has =
been done. So, the chances of the VM surviving in the face of buggy h/w =
is higher if we don't blindly enable BME early on.

  Paul



