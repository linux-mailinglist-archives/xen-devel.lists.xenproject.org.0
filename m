Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE1E2E9CE6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 19:19:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61478.108245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwURY-0008HT-61; Mon, 04 Jan 2021 18:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61478.108245; Mon, 04 Jan 2021 18:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwURY-0008H4-25; Mon, 04 Jan 2021 18:19:00 +0000
Received: by outflank-mailman (input) for mailman id 61478;
 Mon, 04 Jan 2021 18:18:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rg9=GH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwURW-0008Gx-KB
 for xen-devel@lists.xen.org; Mon, 04 Jan 2021 18:18:58 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89b92f51-75b1-4220-a090-a1c784bc2c83;
 Mon, 04 Jan 2021 18:18:57 +0000 (UTC)
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
X-Inumbo-ID: 89b92f51-75b1-4220-a090-a1c784bc2c83
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609784337;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=BlUFkan+LOCc+M6/VhVi0B0vMGyxrobsMguTVvujdxM=;
  b=LEHtO+uJ6nnYzoiiCB3Yr1em3b1+hxGT921CS8Dvf/WZvX1NIvKpt0iC
   HfsI2V312a24GBeydPOHZaNFCK/SFKLr9jDUMkN2grnnSlJz1jl+8KftV
   LPQcDqhyVqEum6KMnRPZ/XrEQI4grBJPSGapypdAE02ZT7T2GbJaHJTa3
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8ehZUpTU/04iyBdr5tMFPs+fIoMfJg0L8PHL9S9tWHPfzjrP16ow4PyS2ufWD07W9My/CV0mpQ
 hlz+QNm1hZF23iRoXkTiSFdBIXd53pGLeaODQh15N6wKsLhMrSfdbkKx1prg+gNkWdGucuinqa
 uYawVUTg5USAG1x+4jChftYF6fOj2/E8ANZPyR7nZJluw5CK7415YoAhabZNARILyQQkrlo/DN
 HiwjzK3ea6IzDWyp5z5+ARNo8nSnBWaNug6WXkBSrk+XHdPwVqFh4NcXh1J3RyL9H3Fq7zmKRd
 Dyk=
X-SBRS: 5.2
X-MesageID: 34726612
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34726612"
Subject: Re: Identify an specific DomU inpecting all pages in memory
To: =?UTF-8?Q?Charles_Gon=c3=a7alves?= <charles.fg@gmail.com>
CC: <xen-devel@lists.xen.org>
References: <CAAQRGoBko2ksX7s_DvbwK5L82-tLz0YXsV0vqfToZHeODJBtbQ@mail.gmail.com>
 <21be2d74-a1d9-176f-70fb-7f86724a965b@citrix.com>
 <CAAQRGoDcTxDyQh_2gES6L7wEEn8YES0MHp4zS5mLhhjC5j0w5g@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a415871e-9f90-6beb-55b0-5cf9c9656dd1@citrix.com>
Date: Mon, 4 Jan 2021 18:18:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAQRGoDcTxDyQh_2gES6L7wEEn8YES0MHp4zS5mLhhjC5j0w5g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 02/01/2021 19:20, Charles Gonçalves wrote:
> Sure. 
>
> The goal is to emulate a scenario where a compromised guest attacks
> another 
> tenant in the same physical host reading/changing the memory content.  
> E.g., extract the RSA key.
>
> I'll be in the domU kernel space. I'm assuming that the guest is able
> to exploit 
> any vulnerability possible. 
> Effectively I'll be changing Xen's code (at least possible) to
> *emulate* a vulnerability 
> (e.g., undo a patch).

Ok, so in this scenario, you've successfully exploited a privilege
escalation vulnerability in Xen and obtained code execution in
hypervisor context.  There are some security fixes to choose to revert
for this purpose, but none I'm aware of which will make the attack
payload trivial to pull off.

However, I'd suggest that you first try writing a new hypercall to do
what you want, so you can get used to coding in Xen context, before
adding the complexity of trying to retrofit it into an attack payload.

If you've already got code with works for dom0, I presume you're keying
off the hardware_domain pointer?  Either way, you can look at the
for_each_domain() construct for how to walk the domain list, or
get_domain_by_id() for how to use the hashtable to look up a domain by
its domid.

~Andrew

