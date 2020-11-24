Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6416D2C1A47
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 01:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35311.66771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khMfM-0006cd-4r; Tue, 24 Nov 2020 00:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35311.66771; Tue, 24 Nov 2020 00:58:44 +0000
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
	id 1khMfM-0006cH-1S; Tue, 24 Nov 2020 00:58:44 +0000
Received: by outflank-mailman (input) for mailman id 35311;
 Tue, 24 Nov 2020 00:58:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpYA=E6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1khMfK-0006cC-Qb
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:58:42 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce88a05e-d02b-4883-989b-0dccbfe11bfc;
 Tue, 24 Nov 2020 00:58:41 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rpYA=E6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1khMfK-0006cC-Qb
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:58:42 +0000
X-Inumbo-ID: ce88a05e-d02b-4883-989b-0dccbfe11bfc
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ce88a05e-d02b-4883-989b-0dccbfe11bfc;
	Tue, 24 Nov 2020 00:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606179521;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=AXk/zYR173btMvz+fOH+QB2vsjO3ci4oUuKHh0S1jBc=;
  b=UTVFd4MYtGWT32BNHsFI3B0kpNABSWgRk6rKlhavvjV/7GFzffgAGz41
   LPQesFRI9kkVtASQsPXoKedZoCqXKjbhxvdgKJAFXG5x5UmpppFRgWKAG
   rtF4JTicVyUyINroErDACtj5hVoQ9g9LQf94etRf7D7Ww+iT++7A267XO
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6K45fDnuX7TsL/uMrd1UGzoTP9lDxlozUYwdwgMcu+Vn/qruYU3plmNu/YBrw4I3/qsCYCPKqF
 2Gk/JzBVrtI8L84wNNYpDVQD8jfg4N1zuEiMochvgyB5tPfeEVhu+S3HtJx3AMcCG39rWsnoZ7
 16hxb/JqPDNTqOaAw2/uk8JQnsdLxtuPA0C9bX37JPs/HmZrluSHVc3yWD5ACDNA2YCKBhqsO9
 ulgrH2WNSfg0xCuyIYGcPBBN+Jv1qx8FTvKSmIzVhIMLMt26GoIICjed41ctTu1zkXRcGY0Mxy
 zm4=
X-SBRS: None
X-MesageID: 32135498
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,364,1599537600"; 
   d="scan'208";a="32135498"
Subject: Re: [PATCH v2 4/8] lib: move parse_size_and_unit()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <eaffac30-8bd0-6018-5186-ca53d1becfe5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1bd906ff-0b37-07de-75ab-84a169151c2d@citrix.com>
Date: Tue, 24 Nov 2020 00:58:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eaffac30-8bd0-6018-5186-ca53d1becfe5@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 23/10/2020 11:17, Jan Beulich wrote:
> ... into its own CU, to build it into an archive.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>  xen/common/lib.c     | 39 ----------------------------------
>  xen/lib/Makefile     |  1 +
>  xen/lib/parse-size.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 51 insertions(+), 39 deletions(-)
>  create mode 100644 xen/lib/parse-size.c

What is the point of turning this into a library?  It isn't a leaf
function (calls simple_strtoull()) and doesn't have any any plausible
way of losing all its callers in various configurations (given its
direct use by the cmdline parsing logic).

~Andrew

