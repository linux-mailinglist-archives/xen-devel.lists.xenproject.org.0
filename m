Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C5F5B1F9D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 15:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403373.645462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHur-0001VJ-N2; Thu, 08 Sep 2022 13:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403373.645462; Thu, 08 Sep 2022 13:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHur-0001Rg-JX; Thu, 08 Sep 2022 13:50:01 +0000
Received: by outflank-mailman (input) for mailman id 403373;
 Thu, 08 Sep 2022 13:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XUpx=ZL=citrix.com=prvs=24378778c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oWHup-0001Ra-TJ
 for xen-devel@lists.xen.org; Thu, 08 Sep 2022 13:50:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c786709-2f7d-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 15:49:45 +0200 (CEST)
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
X-Inumbo-ID: 0c786709-2f7d-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662644985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WTWJeHaJMMC/+qrhcERcfsYiSD2yI/KRfMGHIF3psOM=;
  b=FCkfesZhjbDxGmDk2JldPztZzWrEGLUDnhKQpooC+vBartpjsei+cfI2
   WvsZijCRt5kl4nWSBcYoWy7Q7dVGMNhtzxw0NdanfHjExyNGuIGZH3xFY
   LhUhrvhllMy651lhTPCI1SMirmc9qn6iA1t34Po9NvR57mzGEu5BcS3J2
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79228995
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/iCwv6CqPVwwWhVW/2jkw5YqxClBgxIJ4kV8jS/XYbTApDJ03zVRz
 mBJWG7TPPzYYmfxedB1OY2y9UIFvMeBx9A2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpFs/Lb8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW0fl3dplNQYSB6kJ1tl6C1N27
 aA7BS9YO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQTNpcBTHZQwJIloNAYgytOypmmP+Y3tTr1f9Sa8fvDmJllwggeWF3Nz9RP2ABphvpn+ku
 2/+wE6gBDcjMeOY8G/Qmp6rrrCWxn6qMG4IL5W/8vNpm0GC3Ww7BxgfVF/9qv684ma7WtFSb
 UwT/i8jtoA29UqiVN67WAe3yFaBtwIcWtdNVfU96RuMx7D85wefD3IDCDVGbbQOttIyRDEs/
 k+EmZXuHzMHmL+aU3WG7Z+PsCi/fyMSKAcqeissXQYDpd75r+kbkBPJRdtlDOi6k9zpBTbs6
 zSLqiEkgPMUl8Fj/7W2+xXLjiyhorDNTxUp/UPHU2Tj6Rl2DKa7Zpal8lid7utFJZyxSliHt
 WID3c+E44gmFo2AmiWLR6MWALij6vKBMTvdqU5uG5gn53Km/HvLVYlU7SE4LkpvNMsJUTvoZ
 kbJvkVW/pA7FGC2d6ZrZJn0B8k05a/4UNDkTezPKN5PZJFrc0mA5i4GWKKL9zmzyg52y/h5Y
 MrFN5b3ZZoHNUh55Aa/WcgW6PgP/AQv6VzeT6LD10iE/KXLMRZ5Vow53EuygvERtf3a+luOq
 o0DaKNm2D0EDrSgP3C/HZo7aAlTcCNlXc2eR9l/LLbrH+ZwJI025xY9K5sFcpctoalan/ygE
 pqVCh4BkwqXaZEqxGy3hpFfhFDHB8wXQYoTZ3BEALpR8yFLjXyTxKkebYArWrIs6fZuy/V5J
 9FcJZvaX6sSFWScp21DBXUYkGCFXE3y7T9iwgL/OGRvF3Keb1ehFiDYkvvHq3BVU3vfWToWq
 Ly8zALLKac+q/BZJJ+PMJqSI6aZ5yd1dBRaAxSVebG+uSzErOBXFsAGpqVsepxdck+emGPyO
 sT/KU5wmNQharQdqLHh7Z1oZa/yeweiNiK2x1Xm0Is=
IronPort-HdrOrdr: A9a23:Yuzwb6wn3KrZfJ62Hz3pKrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.93,300,1654574400"; 
   d="scan'208";a="79228995"
Date: Thu, 8 Sep 2022 14:49:16 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V5 1/6] libxl: Add support for Virtio I2C device
Message-ID: <Yxny3IZ/k3FVYb1J@perard.uk.xensource.com>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <8b47d98cec83ca33a2b409c9371356820dd91b7a.1661159474.git.viresh.kumar@linaro.org>
 <YxdyGXxois95bNdI@perard.uk.xensource.com>
 <20220907123224.rz7vvope37l6l6mg@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220907123224.rz7vvope37l6l6mg@vireshk-i7>

On Wed, Sep 07, 2022 at 06:02:24PM +0530, Viresh Kumar wrote:
> Hi Anthony,
> 
> Thanks a lot for the in-depth review, it is really helpful.
> 
> I don't have much knowledge of the Xen code and wanted this code for I2C and
> GPIO to be tested on Xen for the work we are doing around hypervisor agnostic
> backends [1].
> 
> I started looking for a simple device's implementation and began by (blindly)
> copying code from Keyboard device and so much of wasted code in here, which
> isn't really required.
> 
> On 06-09-22, 17:15, Anthony PERARD wrote:
> > On Mon, Aug 22, 2022 at 02:45:13PM +0530, Viresh Kumar wrote:
> > > An example of domain configuration for Virtio I2c:
> > > i2c = [ "" ]
> > 
> > Is this doing something meaningful (with the whole series applied)?
> 
> If I am not wrong, this is required by parse_i2c_list()'s implementation.
> Without this I don't get the I2C device populated in the guest.

Sorry, I should have added more context to may question. In my mind, I2C
is just a communication protocol between a device and a CPU, like USB or
PCI. So to me there is missing information about which device or kind of
device to present to a guest in this example. For example, for PCI we
give a path to the device (via bdf=), and for USB it can be a kind of
device to emulate or select a device based on the path to it (bus,
addr).

Cheers,

-- 
Anthony PERARD

