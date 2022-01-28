Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B686449F855
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 12:32:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261966.453895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDPUT-000503-14; Fri, 28 Jan 2022 11:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261966.453895; Fri, 28 Jan 2022 11:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDPUS-0004xK-Tp; Fri, 28 Jan 2022 11:32:28 +0000
Received: by outflank-mailman (input) for mailman id 261966;
 Fri, 28 Jan 2022 11:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1b2=SM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nDPUR-0004xE-Rc
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 11:32:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f71ad9a2-802d-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 12:32:26 +0100 (CET)
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
X-Inumbo-ID: f71ad9a2-802d-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643369546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e5q/44vJODyf7qMYzeeneh5rniTWVTHCWe3p4+g/FfQ=;
  b=FpHdmOuVzR3tviwZjJaFH6ggJwOVopY1Nlpv0fWMBlV+K8PBjYNIao3H
   GtItkzoKadT/hGbfzomYtCbrU1NcfJyuwFVm/TpD3ZK5zB00m9NwpQ4U0
   HV4VF1HvTgpWI6NBb1mTkhZ49z5VoHv/2ov5193bspyGEh/0nMVP6TbkG
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uJT9nUtCfec8y9bMNecZjcfkqlY6PtU3UBiAAvtOU+YTcFwJP0lHQwW//7vPAGmYiSsAbS6PmV
 fPG+PLRIVOfL2cCcxarx/MoHsb639EmL2LbTuGVf86iuhuvf8sls5iIF58yk7I1Vh0PFntxxNr
 nN8JIVK+IGa0C6XBUxkuPeDBwRb/JL7d56NqyN9M7SmX35fb+3q3ViIFwx98IS8Fbdmu9GUz4S
 IrUh+DiNdHPE5ozUgZT8UxcWFzzD3PQRdCRPDY3zc1i4+WI1mQRPCmBY0ujvTZg8za5+Ga6nWK
 Hqyie2U1v1+wAwNSKLlDQNvj
X-SBRS: 5.2
X-MesageID: 65153195
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:V+nho6rsg4A133KS00Qf+7YKUoteBmKyYhIvgKrLsJaIsI4StFCzt
 garIBnTOvneN2ahLopzaoixo0xT6JCGzd42S1A6rS0yHyIW85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILpW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbKUEUBwMbXXobs2VgdUHg10MrMbv6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZdANGE2PUmojxtnJ3Y+L6pnvOCRgHjScXpFjHOupLANyj2GpOB2+Oe0a4eEEjCQfu1rmUKfq
 nPD7n7OKBgQP9yCyhKI6nupwOTImEvTUo8ICKex8PIshVSJ33ESEzUfT179qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O/I+wBGAzOzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/vrGDhuvbu9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT03SfxGujvoPwESUw+Anacmiq8F4+e9vwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yP7JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiJNrKigbArLWdrGR2Cg2bKgggBd2B3yckC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+bFPiXNEulYaAbfBgzc0E9iiF+Lm
 zq4H5DSoyizrcWkOnWHmWLtBQ5iwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNy4/AJuyA8cXhS9rbEQEYAfzs1B+MNnH0UvqX8ZtFVXR3LY9nacco
 jhsU5joP8mjvRyeq21CNsGs9dI7HPlp7CrXVxeYjPEEV8YIb2T0FhXMJWMDLQECUXi6s9UQu
 bql2l+JSJYPXV06Xs3XdOiu3xW6un1EwLB+WE7BI99yfkTw8dc1d3yt36Fve8xcew/ewja61
 hqNBUtKr+f6vIJoosLCgrqJrtn1HrImTFZaBWTS8Z2/KTLeoji42YZFXevRJWLdWWr49b+Mf
 +JQy/2gYvQLkEwT69h3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAn+YLtxG3V
 0SD/shhFY+IYM61QkQMIAcFb/iY0a1GkDfl8vlocl7x4zV6/eTbXBwKbQWMkiFUMJB8LJghn
 bU6oMcT5gGy1kgqP9KBgnwG/miANCVdAaAut5VcC473kAs7jFpFZMWEWCPx5ZiObfRKM1Urf
 WDI1PaT2ewEyxqQaWc3GFjMwfFZ1MYHtx19xVMfI0iEx4jejfgt0RwNqTk6Q2y5FPmcPz6f7
 oSzC3BIGA==
IronPort-HdrOrdr: A9a23:dMSS56BcTpKH6cTlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.88,323,1635220800"; 
   d="scan'208";a="65153195"
Date: Fri, 28 Jan 2022 11:32:15 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v9 04/30] build: set ALL_OBJS in main Makefile; move
 prelink.o to main Makefile
Message-ID: <YfPUP6iAatz9JPaS@perard>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-5-anthony.perard@citrix.com>
 <9bd4d8e6-d426-97be-f1d4-429a793f888c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9bd4d8e6-d426-97be-f1d4-429a793f888c@suse.com>

On Thu, Jan 27, 2022 at 04:50:32PM +0100, Jan Beulich wrote:
> On 25.01.2022 12:00, Anthony PERARD wrote:
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -285,6 +285,16 @@ CFLAGS += -flto
> >  LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
> >  endif
> >  
> > +# Note that link order matters!
> 
> Merely as a remark: I wonder how applicable that comment is anymore.
> If anything I'd expect it to be relevant to $(TARGET_SUBARCH)/head.o
> (Arm) and boot/built_in.o (x86), neither of which get named here.

Indeed, the order here probably doesn't matter. I tried to build on x86
with the list reversed (so still leaving boot/ first) and the build
works. I didn't try to boot it.

Maybe it's time to retire the comment?

> > @@ -407,7 +417,7 @@ $(TARGET): FORCE
> >  	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
> >  	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
> >  	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
> > -	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) MKRELOC=$(MKRELOC) $@
> > +	$(MAKE) -f $(BASEDIR)/Rules.mk MKRELOC=$(MKRELOC) "ALL_OBJS=$(ALL_OBJS-y)" "ALL_LIBS=$(ALL_LIBS-y)" $@
> 
> I'm always a little wary of using double quotes when it's not clear
> what exactly a macro may expand to. Single quotes at least have less
> restrictions ...

Using single quotes sounds good.

Thanks,

-- 
Anthony PERARD

