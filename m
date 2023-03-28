Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2F6CBCCC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 12:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515650.798741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6qP-0002QH-5X; Tue, 28 Mar 2023 10:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515650.798741; Tue, 28 Mar 2023 10:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6qP-0002OG-2j; Tue, 28 Mar 2023 10:46:25 +0000
Received: by outflank-mailman (input) for mailman id 515650;
 Tue, 28 Mar 2023 10:46:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cOFk=7U=citrix.com=prvs=44429d01f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ph6qO-0002OA-3k
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 10:46:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c66d5cf1-cd55-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 12:46:22 +0200 (CEST)
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
X-Inumbo-ID: c66d5cf1-cd55-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680000382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KjxABWvDmB1pgxMHLN50dAXerqKDFh0e/CViqJ3PLt8=;
  b=JBiWy6QL5H0f9xWw0zg6BCfU6kYUKaN4wQQ/XCpkKc71mcr1uVGSILx1
   hpEoYKqA1+0RMqo9xDLMjsW1pykObOzq4xcp1vYBZd+TuxTTfHpFGyyqo
   2y5PYuXexWNXSKk3JD/i+FpNYKnB16l08isBCljQOHohDlF0pxes4Pxtj
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103709986
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6rhWoa+XAk0V6kPte653DrUD8nmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 zYWCmqFa6zYNDD3LtBwaYi190gCu8DdmNRiSAc9qnw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqob5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl27
 MQxDhcqKSmBuMOuz5GwZc9XmP8seZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0Mxh3H/
 jOXrzqR7hcyP9y0k2KD0yqVp+LMhSjgZcFVP56F36s/6LGU7jNKU0BHPbehmtG7gEOjX9NUK
 2QP5zEj66M18SSDT8L0Xh65pjuIux8AQct4AuQ85AydjLDJiy6GAkAUQzgHb8Yp3Oc0SiYtz
 UShhM7yCHpkt7j9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRnsy
 jWDtwAihLEei8Ea2qH99lfC6xqlp4PATwo8zg/WQm6o4A5/aIO/IYev7DDz9e5BNo2QSlCLo
 VAOmtSS4e4DC52AjmqGR+BlNLO04bCDOT7Vg19qFrEg8Sig/zioeoU4yDJzOkZvdNoFcDnBY
 UnPtAcX75hWVFOjZ6JzZJ+qDNoC1bT7GN/4TPHIf5xFZZ0ZXB+K+mRiaFCd20jpkVMwiucvN
 JGDa8GuAH0GT6N9w1KeTv8Qy7YxyggixGnYQtbwyBHP7FaFTCfLE/FfagLIN71nqvre+2057
 uqzKeOy0i12dsrZJRDVzq8LInMBAl4AG6v5/pk/mvG4HuZ2JI0wI6aPnuJwK9w5w/Q9evTgp
 S/kBBIBoLbrrTiecFjRNCg+AF/6dcwnxU/XKxDAKrpBN5ILRY+0pJkSeJIsFVXM3LwylKUkJ
 xXplijpPxiudtgk025HBXUFhNY+HClHfCrXV8ZfXBAxfoR7WyvC8cL+cw3k+UEmV3To5Jpi+
 u37iVmFGfLvojiO6u6MMJpDKHvv1UXxZcooBxeYSjWtUByEHHdWx9zZ0aZsfpBkxeTrzTqGz
 QeGaSolSR32i9ZtqrHh3PnUx7pF5sMiRiK26UGHt+fpXcQbl0L/qbJ9vBGgJGqMBDuvqPX4O
 o24DZjUaZU6obqDiKIke54D8E70z4KHS2Nypui8IEj2Ug==
IronPort-HdrOrdr: A9a23:F+X/qa2dHNIo6OuRXXqvrAqjBHUkLtp133Aq2lEZdPRUGvbo8f
 xG/c566faQsl0ssR4b+OxoVJPwJE80lqQFmLX5X43SJDUO0VHARO4N0WKL+UyaJ8SUzJ846U
 4PSdkYNPTASXVBoILdxiLQKbodKd+8mpyAtKPl400oZydMRIFP0zxQNya8NQlNaDQuP+tbKL
 OsosVGoja7eWcadK2Aa0UtVfTYutvOmInHTHc9dnwa1DU=
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="103709986"
Date: Tue, 28 Mar 2023 11:46:09 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Dmitry Isaykin <isaikin-dmitry@yandex.ru>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Anton Belousov <abelousov@ptsecurity.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v5] x86/monitor: Add new monitor event to catch I/O
 instructions
Message-ID: <615cc24c-9ab8-47dc-bad3-f45258494428@perard>
References: <7bd5ec4ff75ea0157d782f8820db1d17b6ad1289.1679406554.git.isaikin-dmitry@yandex.ru>
 <77245440-079f-50bd-7237-a44317642b3f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <77245440-079f-50bd-7237-a44317642b3f@suse.com>

On Tue, Mar 28, 2023 at 10:59:37AM +0200, Jan Beulich wrote:
> On 21.03.2023 14:58, Dmitry Isaykin wrote:
> > Adds monitor support for I/O instructions.
> > 
> > Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> > Signed-off-by: Anton Belousov <abelousov@ptsecurity.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> On top of Kevin's R-b and besides Tamas'es (to-be-re-instated) ack this
> also would preferably get one from Anthony.

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

