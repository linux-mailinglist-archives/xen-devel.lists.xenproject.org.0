Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF668379665
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 19:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125433.236144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgA1p-0007xC-2r; Mon, 10 May 2021 17:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125433.236144; Mon, 10 May 2021 17:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgA1o-0007vL-Vh; Mon, 10 May 2021 17:49:12 +0000
Received: by outflank-mailman (input) for mailman id 125433;
 Mon, 10 May 2021 17:49:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lgA1m-0007vD-WA
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 17:49:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgA1f-0002Xr-T4; Mon, 10 May 2021 17:49:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgA1f-0002Vw-MJ; Mon, 10 May 2021 17:49:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=E2udCdJwYYDlQ9mifrWd88GpfICPpwhmU2H5E9V1TkA=; b=YpBZg09oDlqn+2b+xjeHWn3GFd
	D38oEx/qje9TsZDhxowC/BND0wZCrIe6Zo0ZNTDs6sbT4rhX2Lww+NO0EJV+LOoWdqEm5jque/wF+
	akN7bdCzFqtW1uucx2c6aGpMeWzZ2980v+gAWg7E2lDQg9K9R7Hj4Lyv/yd3HT8XF8oQ=;
Subject: PING Re: [PATCH 00/14] Use const whether we point to literal strings
 (take 1)
To: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210405155713.29754-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <05eaa910-7630-d1e4-4b70-3008d672fe5c@xen.org>
Date: Mon, 10 May 2021 18:49:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

Ian, Wei, Anthony, can I get some feedbacks on the tools side?

Cheers,

On 05/04/2021 16:56, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> By default, both Clang and GCC will happily compile C code where
> non-const char * point to literal strings. This means the following
> code will be accepted:
> 
>      char *str = "test";
> 
>      str[0] = 'a';
> 
> Literal strings will reside in rodata, so they are not modifiable.
> This will result to an permission fault at runtime if the permissions
> are enforced in the page-tables (this is the case in Xen).
> 
> I am not aware of code trying to modify literal strings in Xen.
> However, there is a frequent use of non-const char * to point to
> literal strings. Given the size of the codebase, there is a risk
> to involuntarily introduce code that will modify literal strings.
> 
> Therefore it would be better to enforce using const when pointing
> to such strings. Both GCC and Clang provide an option to warn
> for such case (see -Wwrite-strings) and therefore could be used
> by Xen.
> 
> This series doesn't yet make use of -Wwrite-strings because
> the tree is not fully converted. Instead, it contains some easy
> and likely non-controversial use const in the code.
> 
> The major blockers to enable -Wwrite-strings are the following:
>      - xen/common/efi: union string is used in both const and
>      non-const situation. It doesn't feel right to specific one member
>      const and the other non-const.
>      - libxl: the major block is the flexarray framework as we would use
>      it with string (now const char*). I thought it would be possible to
>      make the interface const, but it looks like there are a couple of
>      places where we need to modify the content (such as in
>      libxl_json.c).
> 
> Ideally, I would like to have -Wwrite-strings unconditionally used
> tree-wide. But, some of the area may required some heavy refactoring.
> 
> One solution would be to enable it tree-wide but turned it off at a
> directroy/file level.
> 
> Any opinions?
> 
> Cheers,
> 
> Julien Grall (14):
>    xen: Constify the second parameter of rangeset_new()
>    xen/sched: Constify name and opt_name in struct scheduler
>    xen/x86: shadow: The return type of sh_audit_flags() should be const
>    xen/char: console: Use const whenever we point to literal strings
>    tools/libs: guest: Use const whenever we point to literal strings
>    tools/libs: stat: Use const whenever we point to literal strings
>    tools/xl: Use const whenever we point to literal strings
>    tools/firmware: hvmloader: Use const in __bug() and __assert_failed()
>    tools/console: Use const whenever we point to literal strings
>    tools/kdd: Use const whenever we point to literal strings
>    tools/misc: Use const whenever we point to literal strings
>    tools/top: The string parameter in set_prompt() and set_delay() should
>      be const
>    tools/xenmon: xenbaked: Mark const the field text in stat_map_t
>    tools/xentrace: Use const whenever we point to literal strings
> 
>   tools/console/client/main.c         |  4 +-
>   tools/console/daemon/io.c           | 10 ++--
>   tools/debugger/kdd/kdd.c            | 10 ++--
>   tools/firmware/hvmloader/util.c     |  4 +-
>   tools/firmware/hvmloader/util.h     |  4 +-
>   tools/include/xenguest.h            | 10 ++--
>   tools/libs/guest/xg_dom_core.c      |  8 ++--
>   tools/libs/guest/xg_dom_elfloader.c |  4 +-
>   tools/libs/guest/xg_dom_hvmloader.c |  2 +-
>   tools/libs/guest/xg_dom_x86.c       |  9 ++--
>   tools/libs/guest/xg_private.h       |  2 +-
>   tools/libs/stat/xenstat_linux.c     |  4 +-
>   tools/libs/stat/xenstat_qmp.c       | 12 ++---
>   tools/misc/xen-detect.c             |  2 +-
>   tools/misc/xenhypfs.c               |  6 +--
>   tools/xenmon/xenbaked.c             |  2 +-
>   tools/xentop/xentop.c               | 12 ++---
>   tools/xentrace/xenalyze.c           | 71 +++++++++++++++--------------
>   tools/xentrace/xenctx.c             |  4 +-
>   tools/xl/xl.h                       |  8 ++--
>   tools/xl/xl_console.c               |  2 +-
>   tools/xl/xl_utils.c                 |  4 +-
>   tools/xl/xl_utils.h                 |  4 +-
>   xen/arch/x86/mm/shadow/multi.c      | 12 ++---
>   xen/common/rangeset.c               |  2 +-
>   xen/common/sched/private.h          |  4 +-
>   xen/drivers/char/console.c          |  4 +-
>   xen/include/xen/rangeset.h          |  2 +-
>   28 files changed, 113 insertions(+), 109 deletions(-)
> 

-- 
Julien Grall

