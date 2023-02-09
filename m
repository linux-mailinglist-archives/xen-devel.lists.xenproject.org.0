Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64372690C40
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492549.762151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8Kp-00086t-E5; Thu, 09 Feb 2023 14:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492549.762151; Thu, 09 Feb 2023 14:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8Kp-00084W-B8; Thu, 09 Feb 2023 14:55:39 +0000
Received: by outflank-mailman (input) for mailman id 492549;
 Thu, 09 Feb 2023 14:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rTn=6F=citrix.com=prvs=3970fcfec=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pQ8Ko-00084Q-8B
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:55:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce6cb417-a889-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 15:55:36 +0100 (CET)
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
X-Inumbo-ID: ce6cb417-a889-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675954536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A6hlMDSnlzJyxRxqV+a44ni/qT+xG0p++0x6TFrshFA=;
  b=OFL8zCQJ+r7YUaZMr6dqesVVoroCzHJqvdTyK5KBikaZIQcuK/qc6kuz
   HtMuNI6gaS2knFV68zCdGF5IqZIAt1/Hgu7C3yjxq5w7xntAe06kyud4T
   F1fe4u6DoJmXQMwlauF+qPTwUIp8/AOJC75FGNh+pevI3N83zhWjMcI8S
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98795105
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:YkO3p6ni/sFpTKKW1XsGUbXo5gxYIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbWT/VP/qDM2Txc4onad+/ph5Q657SytA3TlQ9rSAwRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5A6GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cBHCx0qQzeyvPKrh7KxEvhUrcQbDfC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfI+
 TObpjykav0cHP665yGV32CQvd3ClBHHf9I2SLnny8c/1TV/wURMUUZLBDNXu8KRhkO7WvpeL
 VIV4SskqaUu9E2tQcL5Vhf+q3mB1jYGUtpNF6sh6QeCyoLd+QPfDW8BJhZNZtUpu84xQT0Cz
 UKSkpXiAjkHmLaVU3OG6rCMrT6ofzdTJmsLfywsQg4M4t2lq4Y25jrTT9NLAKOzyNrvFlnY2
 yiLtiM3g7wZkOYB1rm38F7KhT6hvN7CSQtdzgzWRWuk6gpRbo+5a4Gm5F7X4OwGJ4GcJnGdt
 X0NgOCC7+QDC56cmSjLS+IIdJmx7uuBGC3RhxhoBZZJ3zeg5X+lO5xR6TdWJUF1P8JCcjjsC
 GfRpAUX4pZQNXmraKZfYoStBsBsxq/lffzbUfTTYstLc4JGXgaN9yFzZmadx2no1kMrlMkXM
 5qBbdylC3pcDK191Se3XM8Uy7ptzSc7rUvWTIr+xg6q0pKfYmCUUrYPNFaSbuE/47iAqQ+T+
 NFaX+OGwgtSePfzaS7W9cgUN19iBXo0H5ftsORMa/WOZAFhHQkJEfjKy6kmfI9jt6tQn+bMu
 Hq6XydwxV7yg3SBNAuLb2x4Za3mdZFlpHk/MGonOlPA82E+aIDp/LpHX5QydLgjsudkyJZcQ
 /YJdsqaC9xTWz/H/HIbdpC7o4t8HDywjAeTMi7jfDg+dZd9QxDh99n/Ow/+8y9ICTC43eM8v
 rmh2wXzUZcFAQN4A67+avii0lewtng1g/9pUg3DJdw7UFro2JhnLWr2lPBfC9EBL1DPyyWX0
 y6SAAwEvq/drokt6t7LiKuY6YCzHINWBVFGFmPW6bK3Myjy/We5x4JEFuGSclj1WHvv/aS+Z
 c1c1/zmLOAch1FOrpZ9FLBwi6k54rPHrqdX1A1+EF3Xbl6gDfVrJXzu4CVUnvQTnPkD41LwA
 x/RvIAAYt1lJf8JDnYteykIScmk5MoEh37S56wkGG763A5Oqe/vvVppAzGAjylULb1QOYwjw
 Ps8tMN+1zFTmibGIf7d0HkKqj3kwmgoFvx+68pEWNODZh8DkAkqXHDKNsPhDHhjgf1oO1JiH
 DKbjbGqa190lhubKCpb+ZQgMINgaXUyVPJilgdqy7ehwICtahoLMPp5r1wKovx9lEkv7g6KE
 jED27dJDauP5Sx0o8NIQnqhHQpMbDXApBOsmwtQzDOIHhP5PoAoEIHbEb3dlKz+2zsDFgW3A
 ZnCkDq1OdoUVJ6ZMtQOtb5N9KW4EI0ZGvzqk8G7BcWVd6TWkhK86pJCkVEg8kO9aeto3R2vm
 AWf1LooAUENHXJK8vJT5kjz/eh4dS1o00QbHK89pv5URjiMENxwsBDXQ32Mlgp2D6Si2SeF5
 wZGfKqjizzWOP6ykw0m
IronPort-HdrOrdr: A9a23:FN3p0a7BwaKnnOyN8APXwDjXdLJyesId70hD6qkQc3Fom62j5q
 STdZEgvyMc5wx/ZJhNo7690cq7MBbhHPxOkOos1N6ZNWGLhILPFuBfBOPZqAEIcBeOlNK1u5
 0BT0EEMqyWMbB75/yKnDVREbwbsaa6GHbDv5ah859vJzsaGp2J921Ce2Cm+tUdfng9OXI+fq
 Dsn/Zvln6bVlk8SN+0PXUBV/irnay3qHq3CSR2fyLO8WO1/EiV1II=
X-IronPort-AV: E=Sophos;i="5.97,283,1669093200"; 
   d="scan'208";a="98795105"
Date: Thu, 9 Feb 2023 14:55:16 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Quan Xu" <quan.xu0@gmail.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	"Roger Pau =?iso-8859-1?Q?Monn=E9?=" <roger.pau@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jun Nakajima <jun.nakajima@intel.com>, "Kevin
 Tian" <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Tim Deegan <tim@xen.org>,
	"Christopher Clark" <christopher.w.clark@gmail.com>, Dario Faggioli
	<dfaggioli@suse.com>, Rahul Singh <rahul.singh@arm.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 4/4] GPL License Boilerplate: Switch from HTTP to HTTPS
Message-ID: <Y+UJVDMif6BeCqtN@perard.uk.xensource.com>
References: <cover.1675889601.git.demi@invisiblethingslab.com>
 <6ff3e64e1dafd869caf23660cafdd46070209e2e.1675889602.git.demi@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2302081456060.4661@ubuntu-linux-20-04-desktop>
 <Y+QuaDrn6EUti0ZR@itl-email>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y+QuaDrn6EUti0ZR@itl-email>

On Wed, Feb 08, 2023 at 06:21:08PM -0500, Demi Marie Obenour wrote:
> On Wed, Feb 08, 2023 at 02:58:38PM -0800, Stefano Stabellini wrote:
> > On Wed, 8 Feb 2023, Demi Marie Obenour wrote:
> > > Obtaining code over an insecure transport is a terrible idea for
> > > blatently obvious reasons.  Even for non-executable data, insecure
> > > transports are considered deprecated.
> > > 
> > > This patch changes GPL boilerplate.
> > > 
> > > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > 
> > For the licensing boilerplate, I think it would be better to switch to
> > SPDX instead.
> > 
> > That said, given that you have already done the work to covert the GPL
> > boilerplate everywhere, I think this is OK. But if you have time and
> > energy I would love to see a patch switching to SPDX in as many places
> > as possible.
> 
> The only part of this patch I actually wrote is the commit message.  The
> rest was generatedy by:
> 
>     git ls-files -z |
>     xargs -0 -- sed -Ei -- 's@(http)(://www\.gnu\.org)@\1s\2@g'
> 
> followed by the usual git stuff.  Do you know of a similar automated
> tool for SPDX conversion?

I did this with a little script in the past:
    https://lore.kernel.org/xen-devel/20221103115204.49610-7-anthony.perard@citrix.com/

It could be adapted for the different licenses.

Cheers,

-- 
Anthony PERARD

