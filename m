Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBFE26DD75
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 16:05:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIuXd-0002CZ-Sv; Thu, 17 Sep 2020 14:05:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t+a8=C2=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kIuXd-0002CU-4z
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 14:05:41 +0000
X-Inumbo-ID: 99113d77-4a8c-4aec-a6ed-7d16e06c17a0
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99113d77-4a8c-4aec-a6ed-7d16e06c17a0;
 Thu, 17 Sep 2020 14:05:39 +0000 (UTC)
Date: Thu, 17 Sep 2020 14:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600351538;
 bh=Yp5K/iWOPd8nhjYdnPcLfQ+IACU7VyMEyY73vCD13ok=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UINcuSnu5IMLTEqX/DIm0xXl16wT9+6UEWM2PrS9SqX/jLkOaKAjW4iu8y0J20mvV
 GAufT2g/TP0VkTDGkiC2J93a5sIUPXgnxSh1UK8wjsjyHVY4LIUzaoyuMklIrlgnys
 /0dzv668Duq0skHV9Ivj+R1Zsl71gZ76zIW+Vup8=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v4 4/4] efi: Do not use command line if secure boot is
 enabled.
Message-ID: <Rtytoe06osw9o7-z0sRD22p_KP8B2SVSp6Ae6IYHyhS_LpwthJkTMwDc1tICmBReafaZOLSu0nNVPV3ceUTqUnjP7dc4DrsMHhjPwfze3X0=@trmm.net>
In-Reply-To: <3def666c-c5f1-a520-18dc-6c1c61026b57@suse.com>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-5-hudson@trmm.net>
 <3def666c-c5f1-a520-18dc-6c1c61026b57@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thursday, September 17, 2020 8:51 AM, Jan Beulich <jbeulich@suse.com> wr=
ote:
> On 14.09.2020 13:50, Trammell Hudson wrote:
> > If secure boot is enabled, the Xen command line arguments are ignored.
> > If a unified Xen image is used, then the bundled configuration, dom0
> > kernel, and initrd are prefered over the ones listed in the config file=
.
> > Unlike the shim based verification, the PE signature on a unified image
> > covers the all of the Xen+config+kernel+initrd modules linked into the
> > unified image. This also ensures that properly configured platforms
> > will measure the entire runtime into the TPM for unsealing secrets or
> > remote attestation.
>
> The command line may also include a part handed on to the Dom0 kernel.
> If the Dom0 kernel image comes from disk, I don't see why that part of
> the command line shouldn't be honored. Similarly, if the config file
> doesn't come from the unified image, I think Xen's command line options
> should also be honored.

Ignoring the command line and breaking the shim behaviour in a
unified image should be ok; that is an explicit decision by the
system owner to sign and configure the new image (and the shim
is not used in a unified image anyway).

If we have a way to detect a unified image early enough, then
we can avoid the backwards incompatibility if it is not unified.
That would require moving the config parsing to above the relocation call. =
 I'm testing that now to see if it works on x86.

--
Trammell

