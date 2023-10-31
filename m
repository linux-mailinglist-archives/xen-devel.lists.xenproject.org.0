Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A37DCDBF
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625713.975267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiJ-0003ur-3q; Tue, 31 Oct 2023 13:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625713.975267; Tue, 31 Oct 2023 13:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiJ-0003s3-0k; Tue, 31 Oct 2023 13:23:23 +0000
Received: by outflank-mailman (input) for mailman id 625713;
 Tue, 31 Oct 2023 13:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1/u=GN=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qxoiH-0003rs-KZ
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:23:21 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a7b8669c-77f0-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 14:23:18 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C777DC15;
 Tue, 31 Oct 2023 06:23:59 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 156833F738;
 Tue, 31 Oct 2023 06:23:16 -0700 (PDT)
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
X-Inumbo-ID: a7b8669c-77f0-11ee-9b0e-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH v2 0/8] clang-format for Xen
Date: Tue, 31 Oct 2023 13:22:56 +0000
Message-Id: <20231031132304.2573924-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

## Introduction ################################################################

In this serie, I would like to get feedbacks on the output generated by the
configuration of clang-format, unfortunately we can't use only clang-format, but
we need to call it using a wrapper, because we need the information of what
files need to be excluded from the tool.

Another reason is that clang-format has some limitation when formatting asm()
instruction and most of the time it format them in a very ugly way or it breaks
the code for example removing spaces that were there for a reason (I don't think
it's a tool to format asm), so in the wrapper script we protect all asm()
invocation or macros where there are asm() invocation with in-code comments that
stops clang-format to act on that section:

/* clang-format off */section/* clang-format on */

I've read the past threads about the brave people who dared to try to introduce
clang-format for the xen codebase, some of them from 5 years ago, two points
were clear: 1) goto label needs to be indented and 2) do-while loops have the
braket in the same line.
While point 1) was quite a blocker, it seemd to me that point 2) was less
controversial to be changed in the Xen codestyle, so the current wrapper script
handles only the point 1 (which is easy), the point 2 can be more tricky to
handle.

## The clang-format configuration ##############################################

In my clang-format configuration I've taken inspiration from EPAM's work, then
from the configuration in Linux and finally from the clang-format manual, to try
to produce a comprehensive configuration.

Every configuration parameter has on top a comment with the description and
when it was supported, finally I've added also a [not specified] if that
behavior is not clearly specified in the Xen coding style, I've done that so
we could discuss about adding more specification in our CODING_STYLE.
Every comment can be stripped out in the final release of the file, but I think
that now they are useful for the discussion.

The minimum clang-format version for the file is 15, my ubuntu 22.04 comes with
it, we can reason if it's too high, or if we could also use the latest version
maybe shipped inside a docker image.

For every [not specified] behavior, I've tried to guess it from the codebase,
I've seen that also in that case it's not easy as there is (sometimes) low
consistency between modules, so we can discuss on every configurable.

Worth to mention, the public header are all excluded from the format tool,
because formatting them breaks the build on X86, because there are scripts for
auto-generation that don't handle the formatted headers, I didn't investigate
on it, maybe it can be added as technical debt.

So I've tried building arm32, arm64 and x86_64 with the formatted output and
they build, I've used Yocto for that.

## How to try it? ##############################################################

So how to generate everything? Just invoke the codestyle.py script without
parameter and it will format every .c and .h file in the hypervisor codebase.

./xen/scripts/codestyle.py

Optionally you can also pass one or more relative path from the folder you are
invoking the script and it will format only them.

## What I expect from this RFC #################################################

I expect feedback on the output, some agreement on what configuration to use,
and I expect to find possible blocker before working seriously on this serie,
because if there are outstanding blockers on the adoption of the tool and we
can't reach an agreement, I won't spend further time on it.

v2 changes: I've introduced a way to suppress the code formatter on certain
piece of code, currently it is implemented inside the exclude-list, but we could
do in a different list, it's not very important at this stage and I did in this
way just to save time.

Here is a link to the current serie output:
https://gitlab.com/luca.fancellu/xen-clang/-/commit/8938bf2196be66b05693a48752ebbdf363e8d8e1.patch

We could reason about the output, arrange some meetings to discuss about the
clang-format configuration if we think we could go ahead with the adoption.

Luca Fancellu (8):
  cppcheck: rework exclusion_file_list.py code
  exclude-list: generalise exclude-list
  [WIP]xen/scripts: add codestyle.py script
  exclude-list: add entries to the excluded list for codestyle
  [WIP]codestyle.py: Protect generic piece of code
  [WIP]x86/exclude-list: protect mm_type_tbl in mtrr from being
    formatted
  xen: Add clang-format configuration
  feedback from the community

 docs/misra/exclude-list.json                  | 113 +++
 docs/misra/exclude-list.rst                   |  37 +-
 xen/.clang-format                             | 693 ++++++++++++++++++
 xen/scripts/codestyle.py                      | 289 ++++++++
 xen/scripts/xen_analysis/cppcheck_analysis.py |   6 +-
 .../xen_analysis/exclusion_file_list.py       |  52 +-
 6 files changed, 1159 insertions(+), 31 deletions(-)
 create mode 100644 xen/.clang-format
 create mode 100755 xen/scripts/codestyle.py


base-commit: 9659b2a6d73b14620e187f9c626a09323853c459
-- 
2.34.1


