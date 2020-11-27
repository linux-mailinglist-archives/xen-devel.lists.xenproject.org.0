Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083BF2C66E5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 14:34:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39347.72220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kidt8-0000x4-C6; Fri, 27 Nov 2020 13:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39347.72220; Fri, 27 Nov 2020 13:34:14 +0000
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
	id 1kidt8-0000wf-8q; Fri, 27 Nov 2020 13:34:14 +0000
Received: by outflank-mailman (input) for mailman id 39347;
 Fri, 27 Nov 2020 13:34:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kidt7-0000wZ-6G
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:34:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57d78dd0-a197-40d1-a976-7e92f73930b3;
 Fri, 27 Nov 2020 13:34:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 081C6AC23;
 Fri, 27 Nov 2020 13:34:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kidt7-0000wZ-6G
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:34:13 +0000
X-Inumbo-ID: 57d78dd0-a197-40d1-a976-7e92f73930b3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 57d78dd0-a197-40d1-a976-7e92f73930b3;
	Fri, 27 Nov 2020 13:34:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606484051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+GnPMFkpmvYnH9SSx8g39Wy3zLm8uM9xXY/9+JAMpA=;
	b=XYTi4itoSDeaJs25MP6jc9C6HWEv9TV1owHWcMi56kTge+JInmBYU0RFhFe2Fq0gmf8kvx
	CUcQmT2bNomV1CAsIcS4qDdn/wjUGhK30V7mmYSRC3VEACiKmP1jXamdASTq+W0cvzSwP2
	UgUlX3oqqnQ6B23v6GU6gJgF4qpoW6o=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 081C6AC23;
	Fri, 27 Nov 2020 13:34:11 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] xen/pci: Move x86 specific code to x86 directory.
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1606326929.git.rahul.singh@arm.com>
 <3500f44e3b6f8f05f9d05fa170817d5bc6f39f22.1606326929.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8da65cee-2229-bb11-89f3-0a7db80e999b@suse.com>
Date: Fri, 27 Nov 2020 14:34:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <3500f44e3b6f8f05f9d05fa170817d5bc6f39f22.1606326929.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.11.2020 19:16, Rahul Singh wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -14,9 +14,6 @@
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -#include <xen/sched.h>
> -#include <xen/pci.h>
> -#include <xen/pci_regs.h>
>  #include <xen/pci_ids.h>
>  #include <xen/list.h>
>  #include <xen/prefetch.h>

At least the latter two of the lines you remove are clearly still
needed here, and in such a case are better to specify explicitly
than to depend on other headers including them. Since xen/sched.h
very likely also gets included indirectly anyway, I'm inclined to
suggest to drop this entire hunk (which ought to be doable while
committing). With this
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

