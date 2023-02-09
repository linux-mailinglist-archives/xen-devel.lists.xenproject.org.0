Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17AA690C62
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492566.762174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8UU-0001x4-JQ; Thu, 09 Feb 2023 15:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492566.762174; Thu, 09 Feb 2023 15:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8UU-0001ub-GW; Thu, 09 Feb 2023 15:05:38 +0000
Received: by outflank-mailman (input) for mailman id 492566;
 Thu, 09 Feb 2023 15:05:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rTn=6F=citrix.com=prvs=3970fcfec=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pQ8UT-0001uV-Q5
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:05:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 336b1d49-a88b-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 16:05:35 +0100 (CET)
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
X-Inumbo-ID: 336b1d49-a88b-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675955135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PjNIe2uJUTNVgm09BTrA+sVuQ00HBFz5tLePF6521FQ=;
  b=ci9PI5C+/YzkkwayWJd38faPLXZuAnP81TLMoytNoUPGA53bEH8MO+Un
   wtrGYEUZOOkP8h2PcMiDfMEswdItOGvOYFgMnrY1JLx6UlM91F83Q0UOH
   x8FTN4Cj+pqf34ZQqVBbPjchyS+NtiqX+4sxIFbYAtKmlszB42iruvng8
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98797387
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:N5/Kl6zDfJEWZWKdCuN6t+e9xirEfRIJ4+MujC+fZmUNrF6WrkUPy
 mIdWDiHOq3eZDCnc9lxYYiz9RwDvJaAx9FmQQRrpSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPaET5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVwU8
 eRFKC0nVzKSiN+rnu/rac1Fov12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZQFwRfH/
 TKZl4j/KjcabPfYyjTbyS+tjOvjnQGjApk4BLLto5aGh3XMnzdOWXX6T2CTrfS8i2a/XcxeM
 E0e/icyrak0+1evR9O7VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebT4g2
 0KNntjpLSdyq7DTQnWYnp+WsDezNC49PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiisywWl7gVy8kR2M2T5lnCnj+o4ITJTwQ8+wHLdm+j9UZ9dYmjIYuy5jDz5O5NNo+DQnGdv
 XIPnI6V6+VmMH2WvHXTGqNXRujvvqvbdmSG2jaDAqXN6RyQoXq7IIBNyghcNUhUL5hZKRzNS
 Wvq7FY5CIBoAFOmaqp+YoSUAssszLT9GdmNas04fuaicbAqKlbZoXgGiVq4mjm0zRNyyf1X1
 YKzK57EMJoMNUhwINNarc852KRj+C0xzHi7qXvTn0X+iur2iJJ4pN443LqyggIRtvvsTOb9q
 Yw32y62J/J3DoXDjtH/q9J7ELzzBSFT6WrKg8JWbPWfBQFtBXssDfTcqZt4JdM4z/QMzrmZr
 yvsMqO99LYZrSaXQeltQik8AI4DoL4l9S5rVcDSFQnAN4cfjXaHs/5EKspfkUgP/+1/1/9kJ
 8TpiO3Zasmjvg/vomxHBbGk9dwKSfherV7WV8ZTSGRlLsEIqs2g0oOMQzYDAwFXU3Tr75Zj+
 OTwvu4ZKLJaLzlf4A/tQKrH5zuMUbI1xL8as5fgSjWLRHjRzQ==
IronPort-HdrOrdr: A9a23:j59A267GIJjTEHl8uAPXwPnXdLJyesId70hD6qm+c20sTiX4rb
 HUoB1/73XJYVkqKRUdcLy7Scy9qDbnhP1ICOoqXItKPjOW31dARbsKheCD/9SjIVydygc379
 YHT0ERMqyIMbG4t6rHCcuDfurIDOPpzElgv4nj80s=
X-IronPort-AV: E=Sophos;i="5.97,284,1669093200"; 
   d="scan'208";a="98797387"
Date: Thu, 9 Feb 2023 15:05:14 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v2 1/4] Build system: Replace git:// and http:// with
 https://
Message-ID: <Y+ULqoKAd3qTeA5I@perard.uk.xensource.com>
References: <cover.1675889601.git.demi@invisiblethingslab.com>
 <75d91def8234bceb41548147ee8af5fea52bd1d6.1675889602.git.demi@invisiblethingslab.com>
 <CA+zSX=a68fwMjAVRYC52894L4VsaHz9KACRVoewAyBTiNKJuYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CA+zSX=a68fwMjAVRYC52894L4VsaHz9KACRVoewAyBTiNKJuYw@mail.gmail.com>

On Thu, Feb 09, 2023 at 02:01:52PM +0000, George Dunlap wrote:
> On Wed, Feb 8, 2023 at 8:58 PM Demi Marie Obenour <
> demi@invisiblethingslab.com> wrote:
> 
> > Obtaining code over an insecure transport is a terrible idea for
> > blatently obvious reasons.  Even for non-executable data, insecure
> > transports are considered deprecated.
> >
> > This patch enforces the use of secure transports in the build system.
> >
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> >
> 
> Hey Demi,
> 
> Thanks for this series -- we definitely want the build system to use secure
> transports when available.  Can you confirm that you've tested the "+s"
> versions of all the URLs in this patch, and verified that they actually
> work?

:'(   -> https://gitlab.com/xen-project/patchew/xen/-/pipelines/771746628/

Our GitLab tests are very unhappy with the switch to TLS. Too many
containers aren't recent enough, and don't have the right certificates
(Let's encrypt I guess).

I've only looked at two failures:
    ubuntu-focal-clang:
        fatal: unable to access 'https://xenbits.xen.org/git-http/qemu-xen.git/': server certificate verification failed. CAfile: none CRLfile: none
    ubuntu-xenial-gcc:
        ERROR: cannot verify xenbits.xen.org's certificate, issued by 'CN=R3,O=Let\'s Encrypt,C=US':

I'll try to have a look at updating those containers.

Cheers,

-- 
Anthony PERARD

