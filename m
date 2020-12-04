Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCBE2CF7B6
	for <lists+xen-devel@lfdr.de>; Sat,  5 Dec 2020 00:53:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45116.80599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klKtG-0002gU-LM; Fri, 04 Dec 2020 23:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45116.80599; Fri, 04 Dec 2020 23:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klKtG-0002g5-IB; Fri, 04 Dec 2020 23:53:30 +0000
Received: by outflank-mailman (input) for mailman id 45116;
 Fri, 04 Dec 2020 23:53:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WR05=FI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1klKtF-0002fz-9x
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 23:53:29 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bebb1a3-9dd5-46f3-b3af-da086547ca40;
 Fri, 04 Dec 2020 23:53:28 +0000 (UTC)
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
X-Inumbo-ID: 6bebb1a3-9dd5-46f3-b3af-da086547ca40
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607126008;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XWm9eAAQQ9rWakVKjBaxzrEdqMCR0yQ24/rfWLPC13s=;
  b=BE3QBf/vh/iqYT0607LXMGsKsNm0pyI9AfqtQQskknsq/j3voNfKX6ef
   QRJG8+IC2JMkJ1xQM6qLKCMP3OoT4B0ovHPHXfqtDm0joZ7tuWNyWJzFa
   tiz3sTVEQYRQNEZqtunQwbZdW25HA2flKYv9J1oxXjQ9zWsb6lj8dhdkR
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Kr6p4B4Tg8SnCWUjVp3uCMfjkdSA6hGWWNfrhsvm3O3kq78gY5qtrOauAvWXZx2RrNR/XsORq9
 Jr1Zw/Jh6wsdmjstdmLw2JktekReRxzMTbBy7Ura4Y6c0jrgcbJO+I+fJtlvNyPJkzmYoaT0mY
 +3YNPxj67OZpNUp2kzytiftDKvzVsnizq4Cwp78JNSSdgpXk03CshGQfLkgYXhe8xqCPQQp2Be
 Nz3uEh+UZcJWM5FH9kVcxCbC9iLXM5RMaRWaNo4sH5sjvNhZ40QcHdf8WcDXJRyqcCTGRQBRB2
 arA=
X-SBRS: 5.1
X-MesageID: 32816974
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,394,1599537600"; 
   d="scan'208";a="32816974"
Subject: Re: [PATCH v2 00/17] xen: support per-cpupool scheduling granularity
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201201082128.15239-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a12de6ea-584c-49ca-3a09-f94b65933a62@citrix.com>
Date: Fri, 4 Dec 2020 23:53:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 01/12/2020 08:21, Juergen Gross wrote:
> Support scheduling granularity per cpupool. Setting the granularity is
> done via hypfs, which needed to gain dynamical entries for that
> purpose.
>
> Apart from the hypfs related additional functionality the main change
> for cpupools was the support for moving a domain to a new granularity,
> as this requires to modify the scheduling unit/vcpu relationship.
>
> I have tried to do the hypfs modifications in a rather generic way in
> order to be able to use the same infrastructure in other cases, too
> (e.g. for per-domain entries).
>
> The complete series has been tested by creating cpupools with different
> granularities and moving busy and idle domains between those.
>
> Changes in V2:
> - Added several new patches, especially for some further cleanups in
>   cpupool.c.
> - Completely reworked the locking scheme with dynamical directories:
>   locking of resources (cpupools in this series) is now done via new
>   callbacks which are called when traversing the hypfs tree. This
>   removes the need to add locking to each hypfs related cpupool
>   function and it ensures data integrity across multiple callbacks.
> - Reordered the first few patches in order to have already acked
>   patches in pure cleanup patches first.
> - Addressed several comments.
>
> Juergen Gross (17):
>   xen/cpupool: add cpu to sched_res_mask when removing it from cpupool
>   xen/cpupool: add missing bits for per-cpupool scheduling granularity
>   xen/cpupool: sort included headers in cpupool.c
>   xen/cpupool: switch cpupool id to unsigned
>   xen/cpupool: switch cpupool list to normal list interface
>   xen/cpupool: use ERR_PTR() for returning error cause from
>     cpupool_create()
>   xen/cpupool: support moving domain between cpupools with different
>     granularity
>   docs: fix hypfs path documentation
>   xen/hypfs: move per-node function pointers into a dedicated struct
>   xen/hypfs: pass real failure reason up from hypfs_get_entry()
>   xen/hypfs: add getsize() and findentry() callbacks to hypfs_funcs
>   xen/hypfs: add new enter() and exit() per node callbacks
>   xen/hypfs: support dynamic hypfs nodes
>   xen/hypfs: add support for id-based dynamic directories
>   xen/cpupool: add cpupool directories
>   xen/cpupool: add scheduling granularity entry to cpupool entries
>   xen/cpupool: make per-cpupool sched-gran hypfs node writable

Gitlab CI is fairly (but not completely) reliably hitting an failure in
ARM randconfig against this series only.

https://gitlab.com/xen-project/patchew/xen/-/pipelines/225445864 is one
example.

Error is:

cpupool.c:102:12: error: 'sched_gran_get' defined but not used
[-Werror=unused-function]
  102 | static int sched_gran_get(const char *str, enum sched_gran *mode)
      |            ^~~~~~~~~~~~~~



Weirdly, there is a second diagnostic showing up which appears to be
unrelated and non-fatal, but a concerning non-the-less

mem_access.c: In function 'p2m_mem_access_check':
mem_access.c:227:6: note: parameter passing for argument of type 'const
struct npfec' changed in GCC 9.1
  227 | bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct
npfec npfec)
      |      ^~~~~~~~~~~~~~~~~~~~

It appears to be related to
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88469 and is letting us
know that the ABI changed.  However, Xen is an embedded project with no
external linkage, so we can probably compile with -Wno-psabi and be done
with it.

~Andrew, in lieu of a real CI robot.

