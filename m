Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E0526308
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 15:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328479.551502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npVaJ-0000g9-NQ; Fri, 13 May 2022 13:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328479.551502; Fri, 13 May 2022 13:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npVaJ-0000dP-Jn; Fri, 13 May 2022 13:43:59 +0000
Received: by outflank-mailman (input) for mailman id 328479;
 Fri, 13 May 2022 13:43:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9K7m=VV=citrix.com=prvs=125a2c5b7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1npVaH-0000dJ-O9
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 13:43:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb11cea7-d2c2-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 15:43:56 +0200 (CEST)
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
X-Inumbo-ID: bb11cea7-d2c2-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652449435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rQC07PpQMF9xJzVeoTFgYv9nHEd76NhVdm5OojvYYRk=;
  b=EJ2ALCsbPOjScQKSds/p96WEsKlwNiVdXQyhh4Oi1DEvfmpg6s0tSmSS
   q9BBHClsHL0JQRz4vMjBJvm9YLkZA2/oyslicfEKQRnHTC7c2BEcFMIt3
   eqln/bjuRnaEfJhjs+Je2aRzCDmJEmI+xkyPfv+jlMJFp767tHvGAFDRO
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70639408
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5Hueh6z6LqTcGtcI0sx6t+dRxirEfRIJ4+MujC+fZmUNrF6WrkUGz
 jAWDW2AO6uKN2P1Loh3bd+y80pTvZeEnNE3S1Y6+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12IPhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplj5jgFRY4Mob3ns8DDiVRCCtDDadk9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6BP
 5RCOGY3PHwsZTUQBUgaJJM/gt7z2FTYaTh7t1aLqfootj27IAtZj+G2bYu9lsaxbcRKnG6Iq
 2Te5WP7DxoGctuFxlKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWCpC7Yrw8QcOFWOPNn1AiWwJfk6SSWUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb1Eqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzrNAuBRPtfNi2mUBb/zt64oEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AAyRcJxr2jyoyb5Jei8BQ2Sw28zaK45lcLBO
 heP6Wu9GrcNVJdVUUOHS93oUJl7pUQRPd/kSurVfrJzjmtZL2e6ENVVTRfIhQjFyRF0+YlmY
 MfzWZv9Vh4yVPU4pAdass9AiNfHMAhlnTONLX06pjz6uYejiIm9E+laagfeNbBphE5GyS2Mm
 +ti2wKx4003eIXDjuP/qub/8XhiwaAHOK3L
IronPort-HdrOrdr: A9a23:k38+baGgrS5znY7kpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.91,223,1647316800"; 
   d="scan'208";a="70639408"
Date: Fri, 13 May 2022 14:43:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [OSSTEST PATCH] ts-xen-build-prep: Grab newer NASM version, to
 build OVMF
Message-ID: <Yn5git1z9Xfz5HwM@perard.uk.xensource.com>
References: <20220513133534.88564-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220513133534.88564-1-anthony.perard@citrix.com>

On Fri, May 13, 2022 at 02:35:34PM +0100, Anthony PERARD wrote:
> Recent versions of OVMF now need a version of NASM that is newer
> than the one available on Debian oldstable/buster. They want to use
> NASM 2.15.05 [1], which is available in Debian stable/bullseye. The
> need to use a newer version started with d3febfd9ade3 ("MdePkg:
> Replace Opcode with the corresponding instructions.").
> 
> There is no backport package available but the nasm package from
> Debian Bullseye can easily be installed on Buster as it has few
> dependencies and are already satisfied.
> 
> [1] https://github.com/tianocore/edk2/commit/6a890db161cd6d378bec3499a1e774db3f5a27a7
>     ("BaseTools: Upgrade the version of NASM tool")
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

A flight with my change:
http://logs.test-lab.xenproject.org/osstest/logs/170388/
(ignore the failing "libvirt-build" jobs which shouldn't be part
of the flight ;-) )

-- 
Anthony PERARD

