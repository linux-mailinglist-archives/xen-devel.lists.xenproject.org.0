Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214DA2B218C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 18:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26796.55287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdcZ1-0001Vo-0R; Fri, 13 Nov 2020 17:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26796.55287; Fri, 13 Nov 2020 17:08:42 +0000
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
	id 1kdcZ0-0001VP-TU; Fri, 13 Nov 2020 17:08:42 +0000
Received: by outflank-mailman (input) for mailman id 26796;
 Fri, 13 Nov 2020 17:08:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uoW6=ET=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kdcYz-0001VK-2y
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:08:41 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d62c5ed-c900-49b3-a869-d62e6cc43343;
 Fri, 13 Nov 2020 17:08:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uoW6=ET=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kdcYz-0001VK-2y
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:08:41 +0000
X-Inumbo-ID: 9d62c5ed-c900-49b3-a869-d62e6cc43343
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9d62c5ed-c900-49b3-a869-d62e6cc43343;
	Fri, 13 Nov 2020 17:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605287319;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=nEhD71WdBPiSRNX2ZLtn5P4iTtAdnrsZyLi7zEsS+A4=;
  b=UNxy3TS1/UxrRuKKtgXKcwrzIShUM2F/wBD3co0r6qJLuSVxFXkahln7
   AsEtVln2cfx/W3RU+dtA958wtM7Ppx+tvWXMQDtmMnnXTuZu0FPu2ZZVi
   T/+HgppWPyhs1Z40pYmxYT8f2jrDfOnzXqu7UM6aaFKF9QcnSVEYjPc8t
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XsaHqAbAQP7zSTmVpevWowNZDlhPkxRdQ6hjjLhwWEZU79VInI4rsVuVFU5PBLMCEvsB82ME+q
 nY9qbIjRNk40TLSAtuKvnmSmgKoQexwDsYw9gIuCC1X2NXjQuz4ZNp1slakFlhBALLzMJpBWJY
 xXFwj+zI8tCMwFbyWeadmd+fzgGMMokKSOHBhfcjdQPQgK54fsEKuo7T3xrw7skiAq4UaKcODi
 p2vI5g43vJbIOjDg/+kp/+aWTaMwY/yOz7P2gV5Ijr2BUi5t4Mx1tkpvfn8IuN4HIT7Io2DEzL
 pXA=
X-SBRS: None
X-MesageID: 31482236
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,476,1596513600"; 
   d="scan'208";a="31482236"
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
To: Bjoern Doebel <doebel@amazon.de>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.co.uk>, Eslam Elnikety <elnikety@amazon.de>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20201113141823.58712-1-doebel@amazon.de>
 <de06e7ce-65cd-95fb-5862-0135e2110a99@citrix.com>
 <c216f07a-df70-ddb5-46fd-7b61e36fa6fc@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fef34a7d-d156-94a7-56ea-1b754b6be776@citrix.com>
Date: Fri, 13 Nov 2020 17:08:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c216f07a-df70-ddb5-46fd-7b61e36fa6fc@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 13/11/2020 16:55, Bjoern Doebel wrote:
>
> On 13.11.20 15:30, Andrew Cooper wrote:
>> On 13/11/2020 14:18, Bjoern Doebel wrote:
>>> Right now we do not have a mechanism to determine the version of the
>>> currently running xenstored at runtime. As xenstored runs throughout
>>> the
>>> lifetime of a Xen host, this may lead to problems when newer user space
>>> builds are staged. Then, the running xenstored will no longer match the
>>> version of the installed xenstored.
>>>
>>> To allow users to always identify the running version of xenstored, add
>>> a linker-generated unique build ID to every xenstored build. Add
>>> functionality to log this build ID into a file upon service startup.
>>>
>>> Signed-off-by: Bjoern Doebel <doebel@amazon.de>
>>> Reviewed-by: Martin Mazein <amazein@amazon.de>
>>> Reviewed-by: Paul Durrant <pdurrant@amazon.co.uk>
>> I understand the problem you're trying to solve, but why is this
>> anything more than just enabling build-id's by default across tools/ ?
>>
>> There are already standard ways of interacting with the build id of
>> running executables on the system.  I'd strongly discourage doing
>> anything custom in xenstored specifically.
> May I ask what tooling you would use to interact with a running
> process' buildid?

Amongst other things, yes.  Although as Juergen points out, we want
something which works with stub domains as well, and "normal userspace
tools" won't cut it there.

I still think a first patch in this series should be to turn build-id's
on by default if supported by the toolchain, generally.

~Andrew

