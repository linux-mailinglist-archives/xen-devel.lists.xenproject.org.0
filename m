Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B6B843D9A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 12:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673917.1048491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8N3-0001QL-F6; Wed, 31 Jan 2024 11:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673917.1048491; Wed, 31 Jan 2024 11:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8N3-0001Nf-CO; Wed, 31 Jan 2024 11:03:09 +0000
Received: by outflank-mailman (input) for mailman id 673917;
 Wed, 31 Jan 2024 11:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKKJ=JJ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rV8N1-0001NO-Mq
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 11:03:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4f363231-c028-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 12:03:06 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90B00DA7;
 Wed, 31 Jan 2024 03:03:48 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1ED513F762;
 Wed, 31 Jan 2024 03:03:04 -0800 (PST)
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
X-Inumbo-ID: 4f363231-c028-11ee-8a43-1f161083a0e0
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] xen-analysis.py: Enable Xen deviation tag at the end of the line
Date: Wed, 31 Jan 2024 11:02:38 +0000
Message-Id: <20240131110241.3951995-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie is enabling the xen-analysis tool to parse and substitute correctly
a deviation tag put at the end of the line containing a deviation to be deviated.

Before this serie the only way to deviate a violation was to put the tag in the
line above:

/* SAF-<id>-safe deviate the bla bla bla */
<line containing the violation>

But there are places in the code base where using the tag in the line above is
not convinient, for example:

if ( (expression) &&
     ((expression with violation) ||
     (expression) )
{
  [...]
}

In the above example is better to have the suppression comment at the end of the
line:

if ( (expression) &&
     ((expression with violation) || /* SAF-<id>-safe deviate the bla bla bla */
     (expression) )
{
  [...]
}

This clearly brings up the question about the code style line length, which in
this case needs to be amended for Xen deviation tags that goes above the limit.

Luca Fancellu (3):
  xen-analysis.py: Use named group for tag regex
  xen-analysis.py: Substitute only the comment instead of the line
  xen-analysis.py: Accept deviation comment at the end of the line

 docs/misra/documenting-violations.rst         | 10 ++++
 xen/scripts/xen_analysis/cppcheck_analysis.py |  4 +-
 xen/scripts/xen_analysis/generic_analysis.py  | 14 +++--
 xen/scripts/xen_analysis/tag_database.py      | 59 ++++++++++++++-----
 xen/scripts/xen_analysis/utils.py             |  2 +-
 5 files changed, 67 insertions(+), 22 deletions(-)

-- 
2.34.1


