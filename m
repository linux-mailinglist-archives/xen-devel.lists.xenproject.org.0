Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A11741B22D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 16:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198032.351330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVEBf-0003pT-4Y; Tue, 28 Sep 2021 14:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198032.351330; Tue, 28 Sep 2021 14:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVEBf-0003mz-0A; Tue, 28 Sep 2021 14:34:27 +0000
Received: by outflank-mailman (input) for mailman id 198032;
 Tue, 28 Sep 2021 14:34:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYy3=OS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mVEBc-0003mt-T6
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 14:34:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c224ebe-2069-11ec-bc9b-12813bfff9fa;
 Tue, 28 Sep 2021 14:34:23 +0000 (UTC)
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
X-Inumbo-ID: 2c224ebe-2069-11ec-bc9b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632839663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f/M1jQ2L65vBY+5NOTnXuTSK69Cn7Gv109tQtoDyCZQ=;
  b=e+6osednOVPo8jlFrpPzUjR3fQqNh+7PMG5tfNRGVj2hpniQ3PcHOCMD
   97sJy1Fko0r4gnA1R8kAFhPWcsjpaGBvyOl/jdDID67iE9X4GTI9zw0w6
   BfyolqR1BDOc+gQMBVWmsXsVwpX9VhKWiEnuRpkMpzFKh3HOX3i8WdH1H
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XHx0p4GWcpWl7gaTST2+Tdfmmeveplcbwb0/+o1oFrOlW7eY9ICW7FW6/NbSqGU67QBFwgtt1s
 Bc9x71w8tSWoUxnm+d/DiKItlUkqLa+3bDefJl+7iqpdqhKiA6kPFeKJ9nJ2utWG/BuXvGHKE6
 g6z8FVfwkWjrteaEBeumYeRcBJsTKN4iafMp06l2n3UvFDLsLIxrKt3Q+b1lVy/VGpLSRsdO/g
 agbUfBIQodtNprQfHbutS4/vCVYQYT1Fcf442McHMMv5ktZUMTgx6tQKSMbloJZnxiF800uwQK
 2KyqUcOSRc/VAa6e47rLX3NO
X-SBRS: 5.1
X-MesageID: 55646089
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kTn6O6xJGVr7CMI7vdp6t+e1wSrEfRIJ4+MujC+fZmUNrF6WrkUFx
 2ZKC2uAbKyOYmf2Lt4jaNi09h9U6JLTzYRgSAI4qSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrRp2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+5V7
 tpQrcKpdSIoP4aSxucHSkRcLAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY250QQaiGN
 5txhTxHdCTSfR9qYVQuBdEyt+X4pXDSUHpWpwfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKa9lq8i+mJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80igkoLU29UerZsLgRBD+q3mB1jYdRNh4A+A88BuKyKff/0CeHGdsZjxcbN0rsucmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewc6aS0K/sG9ub0WjxPkEIhgCrfoiuLcTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2NADv6v1oRiJqNItzwsAeHvZ6sOa7DFjG8U
 G44d99yBQzkJb+KjjDFZOwQELyz6/+BPVUwanY0RMJ5plxBF5O5FL28AQ2Sxm81bq7omhezO
 Sc/XD+9ArcIZxNGioctP+qM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/plZ
 snLK5/2US9BYUiC8NZQb7xGuVPM7npirV4/uLihl0j3uVZgTCT9pUg53KumMblisfLsTPT9+
 NdDLcqaoyizo8WkChQ7BbU7dAhQRVBiXMieg5UOKoarf1o3cEl8WqS56e5wJORYc1F9y76gE
 oeVARQDljISRBTvdG23V5yUQOm0AMkj/S5lZ3xE0JTB8yFLXLtDJZw3L/MfFYTLPsQzpRKtZ
 /VaKciGHNpVTTHLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 u3yzB7fTLoCWx9mUJTcZsWwwg7jpnMagu9zARfFe4EBZEX2/YF2ACXtlftrcdoUIBDOy2LCh
 QabCBsVv8fXpIox/IWbjKyItd7xQeB/AlBbDy/Q6rPvbXvW+W+qwIlhVueUfG+CCDOoqfv6P
 egMlqPyKvwKmlpOorFQKbczwPJs/cbrqp9b0h9gQCfBYWO0B+4yOXKBx8RO6PFAn+cLpQusV
 0uT0dBGIrHVatj9GVscKQd5POSO0fYYxmvb4fgveRio4SZ2+PyMUFlIPgnKgytYdeMnPIQgy
 OYnmcgX9w3g1UZ6bofY1nhZpzaWM3gNc6Q7rZVLUobkhz0ixkxGfZGBWDT954uCaokUP0QnS
 tNOaHEuW1iIKpL+TkcO
IronPort-HdrOrdr: A9a23:Ix1i1q4JSmKmWkK5QgPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.85,329,1624334400"; 
   d="scan'208";a="55646089"
Date: Tue, 28 Sep 2021 15:33:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v4] xen: rework `checkpolicy` detection when using
 "randconfig"
Message-ID: <YVMn1TW8mKpAwImA@perard>
References: <20210928083944.780398-1-anthony.perard@citrix.com>
 <bdd68129-0415-2018-c0bf-98687094dab4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bdd68129-0415-2018-c0bf-98687094dab4@suse.com>

On Tue, Sep 28, 2021 at 03:46:01PM +0200, Jan Beulich wrote:
> On 28.09.2021 10:39, Anthony PERARD wrote:
> > This will help prevent the CI loop from having build failures when
> > `checkpolicy` isn't available when doing "randconfig" jobs.
> > 
> > To prevent "randconfig" from selecting XSM_FLASK_POLICY when
> > `checkpolicy` isn't available, we will actually override the config
> > output with the use of KCONFIG_ALLCONFIG.
> > 
> > Doing this way still allow a user/developer to set XSM_FLASK_POLICY
> > even when "checkpolicy" isn't available. It also prevent the build
> > system from reset the config when "checkpolicy" isn't available
> > anymore. And XSM_FLASK_POLICY is still selected automatically when
> > `checkpolicy` is available.
> > But this also work well for "randconfig", as it will not select
> > XSM_FLASK_POLICY when "checkpolicy" is missing.
> > 
> > This patch allows to easily add more override which depends on the
> > environment.
> > 
> > Also, move the check out of Config.mk and into xen/ build system.
> > Nothing in tools/ is using that information as it's done by
> > ./configure.
> > 
> > We named the new file ".allconfig.tmp" as ".*.tmp" are already ignored
> > via .gitignore.
> > 
> > Remove '= y' in Kconfig as it isn't needed, only a value "y" is true,
> > anything else is considered false.
> 
> Seeing you say this explicitly makes me wonder - is this actually true?

I've check that this was true by empirical testing before sending the
patch. But the documentation isn't clear to me about the meaning of
'default y if "m"'. So would you rather keep '= y' just to stay on the
safe side?

> At least when modules are enabled (which our kconfig is capable of even
> if we don't use that part of it), "m" is also "kind of" true, and the
> related logic really isn't quite boolean iirc.
> 
> Everything else looks goot to me now, thanks.

Thanks,

-- 
Anthony PERARD

