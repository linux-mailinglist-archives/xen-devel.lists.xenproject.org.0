Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301523040BE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 15:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75152.135247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Pbc-0001PP-C5; Tue, 26 Jan 2021 14:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75152.135247; Tue, 26 Jan 2021 14:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Pbc-0001P0-8f; Tue, 26 Jan 2021 14:46:08 +0000
Received: by outflank-mailman (input) for mailman id 75152;
 Tue, 26 Jan 2021 14:46:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=icyM=G5=bounce.vates.fr=bounce-md_30504962.60102b2c.v1-748f99c19f3042a5998b2433d434209f@srs-us1.protection.inumbo.net>)
 id 1l4Pba-0001Os-9u
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 14:46:06 +0000
Received: from mail180-30.suw31.mandrillapp.com (unknown [198.2.180.30])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bad2aa1-a1a5-483c-a744-e694da3957a4;
 Tue, 26 Jan 2021 14:46:05 +0000 (UTC)
Received: from pmta03.mandrill.prod.suw01.rsglab.com (127.0.0.1) by
 mail180-30.suw31.mandrillapp.com id h20liq22sc0u for
 <xen-devel@lists.xenproject.org>;
 Tue, 26 Jan 2021 14:46:04 +0000 (envelope-from
 <bounce-md_30504962.60102b2c.v1-748f99c19f3042a5998b2433d434209f@bounce.vates.fr>)
Received: from [185.78.159.90] by mandrillapp.com id
 748f99c19f3042a5998b2433d434209f; Tue, 26 Jan 2021 14:46:04 +0000
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
X-Inumbo-ID: 0bad2aa1-a1a5-483c-a744-e694da3957a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mandrill; d=vates.fr;
 h=From:Subject:To:Cc:References:Message-Id:In-Reply-To:Date:MIME-Version:Content-Type:Content-Transfer-Encoding; i=samuel.verschelde@vates.fr;
 bh=RW7sr6LW9GPkqj34XobUtpydLsomu+7/EdOOsWPHzfE=;
 b=WSjZlmHC3hEFRq3oZjmhQ+kyf8AtNhtSehpizLk9/XJyT5ht+llcet/UYhGVLIGeQsHfYdXYm0J3
   kGY09GRZ3Zx2qjKynKb2gLmjt5TqAEFKuPegt8xXwStc1eTLBj+iJh/TXsGmJvMexGl6l6CO6ohi
   KN4JrwK1yNkW310SgCo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1611672364; h=From : 
 Subject : To : Cc : References : Message-Id : In-Reply-To : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=RW7sr6LW9GPkqj34XobUtpydLsomu+7/EdOOsWPHzfE=; 
 b=obTKIbWWUKpbmjEApcML3afoxdYxcEyqUWSO+5JEYx4S8tulU9nyN9Hz7wGOCEVNCx5sh/
 OO6ndUvbnuwlqKtk0Q0ro9POUkcNFQQ0kNIna/hnJHX3tfXzBv6alJcpg17Q/CWBNr/++ft8
 1KaUx+fiVW8jafQldxbXdwWkorMr4=
From: Samuel Verschelde <samuel.verschelde@vates.fr>
Subject: Re: XSA-332 kernel patch - huge network performance on pfSense VMs
X-Virus-Scanned: amavisd-new at vates.fr
To: xen-devel@lists.xenproject.org
Cc: =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
References: <dc5d60d7-1ada-5eb1-ff91-495d663ca89e@vates.fr> <20210118100340.6vryyk52f5pyxgwv@Air-de-Roger>
Message-Id: <88ceba57-2def-145d-19b2-3daba2bbc9c4@vates.fr>
In-Reply-To: <20210118100340.6vryyk52f5pyxgwv@Air-de-Roger>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.748f99c19f3042a5998b2433d434209f
X-Mandrill-User: md_30504962
Date: Tue, 26 Jan 2021 14:46:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 18/01/2021 =C3=A0 11:03, Roger Pau Monn=C3=A9 a =C3=A9crit :
> On Fri, Jan 15, 2021 at 03:03:26PM +0000, Samuel Verschelde wrote:  >> Hi=
 list, >> >> Another "popular" thread on XCP-ng forum [1], 
started in october >> 2020, allowed us to detect that patch 12 from the 
XSA-332 advisory >> [2] had a very significant impact on network 
performance in the >> case of pfSense VMs. >> >> We reproduced the issue 
internally (well, we reproduced >> "something". The user setups in this 
thread are diverse) and our >> findings seem to confirm what the users 
reported. Running iperf3 >> from the pfSense VM to a debian VM gives 
results around 5 times >> slower than before. Reverting this single 
patch brings the >> performance back. On the debian to pfSense 
direction, the drop is >> about 25%. > > pfSense is based on FreeBSD, so 
I would bet that whatever performance > degradation you are seeing would 
also happen with plain FreeBSD. I > would assume netfront in FreeBSD is 
triggering the ratelimit on > Linux, and hence it gets throttled. > > Do 
you think you have the bandwidth to look into the FreeBSD side and > try 
to provide a fix? I'm happy to review and commit in upstream > FreeBSD, 
but would be nice to have someone else also in the loop as > ATM I'm the 
only one doing FreeBSD/Xen development AFAIK. >
I would personnally not be able to hack into either Xen, the linux 
kernel or FreeBSD in any efficient way. My role here is limited to 
packaging, testing and acting as a relay between users and developers. 
We currently don't have anyone at Vates who would be able to hack into 
FreeBSD either.

What currently puts FreeBSD into our radar is the large amount of users 
who use FreeNAS/TrueNAS or pfSense VMs, and the recent bugs they 
detected (XSA-360 and this performance drop).

Additionnally, regarding this performance issue, some users report an 
impact of that same patch 12 on the network performance of their non-BSD 
VMs [1][2], so I think the FreeBSD case might be helpful to help 
identify what in that patch caused throttling (if that's what happens), 
because it's easier to reproduce, but I'm not sure fixes would only need 
to be made in FreeBSD.

Best regards,

Samuel Verschelde

[1] https://xcp-ng.org/forum/post/35521 mentions debian based Untangle 
OS and inter-VLAN traffic
[2] https://xcp-ng.org/forum/post/35476 general slowdown affecting all 
VMs (VM to workstation traffic), from the first user who identified 
patch 12 as the cause.


