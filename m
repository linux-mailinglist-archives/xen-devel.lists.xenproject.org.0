Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557D4295053
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 18:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10111.26684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVGYF-0005sm-4i; Wed, 21 Oct 2020 16:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10111.26684; Wed, 21 Oct 2020 16:01:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVGYF-0005sR-1P; Wed, 21 Oct 2020 16:01:23 +0000
Received: by outflank-mailman (input) for mailman id 10111;
 Wed, 21 Oct 2020 16:01:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVGYD-0005sM-Jj
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 16:01:21 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03e97207-5d55-4983-b852-8b5cc74957ce;
 Wed, 21 Oct 2020 16:01:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVGYD-0005sM-Jj
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 16:01:21 +0000
X-Inumbo-ID: 03e97207-5d55-4983-b852-8b5cc74957ce
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 03e97207-5d55-4983-b852-8b5cc74957ce;
	Wed, 21 Oct 2020 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603296079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5+br0Xv6fhu7mhelHBzTWatSM7V/mNQlATYx3z4riCo=;
  b=Tw4+N/XXkZJIGj/fY58xclfXt+qomSZnXrN34bTRPi6d++oTN4WBNJl4
   TR4p+JelUi/fnUKhsDQVYi7/vglW/if6TzrSyJV1G2Aj9/MnqMHDkuBfz
   YMthS4+fuLwE4ovvrGxf3rNAL2f3SrvBzkEgqtqUOnaQKtxss2zu9AH/T
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: N42q3vuJLIAiwoCu4Kq/cxmzAQfIFgbCbdyQ7yGARdoQIOLcHZzx1wG3MWOojlhDrHYb4xMjGn
 4WWm+s5WKDD10Q0TE5VPnc0CAC1CWHXouVf4j2NM7tNBXLlaB5ZgDT2zm5M8nLjJFlJ+0EM/M/
 i5p9JVP4Xo6Xh2QpDAN9u2fHOf2sZKmQOKHebugY5yoChpnIwHbcUCCaaxpJMRuiPwSHuuZGFZ
 2LYQ0wNn74tldgUgmu6am8HaK3dgnpfo1iZcg2NivF6B+Y5rNbNM17vet/aJDIbXQKXjs7rVqa
 nc8=
X-SBRS: 2.5
X-MesageID: 30555846
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="30555846"
Date: Wed, 21 Oct 2020 18:00:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/8] evtchn: replace FIFO-specific header by generic
 private one
Message-ID: <20201021160028.j4shjjvdysfti747@Air-de-Roger>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <3fea358e-d6d1-21d4-2d83-d9bd457ba3b5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fea358e-d6d1-21d4-2d83-d9bd457ba3b5@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Tue, Oct 20, 2020 at 04:08:33PM +0200, Jan Beulich wrote:
> Having a FIFO specific header is not (or at least no longer) warranted
> with just three function declarations left there. Introduce a private
> header instead, moving there some further items from xen/event.h.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: New.
> ---
> TBD: If - considering the layering violation that's there anyway - we
>      allowed PV shim code to make use of this header, a few more items
>      could be moved out of "public sight".
> 
> --- a/xen/common/event_2l.c
> +++ b/xen/common/event_2l.c
> @@ -7,11 +7,12 @@
>   * Version 2 or later.  See the file COPYING for more details.
>   */
>  
> +#include "event_channel.h"
> +
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/errno.h>
>  #include <xen/sched.h>
> -#include <xen/event.h>
>  
>  #include <asm/guest_atomics.h>
>  
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -14,17 +14,17 @@
>   * along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include "event_channel.h"
> +
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/errno.h>
>  #include <xen/sched.h>
> -#include <xen/event.h>
>  #include <xen/irq.h>
>  #include <xen/iocap.h>
>  #include <xen/compat.h>
>  #include <xen/guest_access.h>
>  #include <xen/keyhandler.h>
> -#include <xen/event_fifo.h>
>  #include <asm/current.h>
>  
>  #include <public/xen.h>
> --- /dev/null
> +++ b/xen/common/event_channel.h
> @@ -0,0 +1,63 @@
> +/* Event channel handling private header. */

I've got no idea whether it matters or not, but the code moved here
from xen/events.h had an explicit copyright banner with Keirs name,
should this be kept?

Thanks, Roger.

