Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43433AB679
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 16:49:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144012.265159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttKb-0000UN-6X; Thu, 17 Jun 2021 14:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144012.265159; Thu, 17 Jun 2021 14:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttKb-0000SY-2Q; Thu, 17 Jun 2021 14:49:21 +0000
Received: by outflank-mailman (input) for mailman id 144012;
 Thu, 17 Jun 2021 14:49:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lttKZ-0000SS-AY
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 14:49:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lttKZ-00030d-7e
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 14:49:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lttKZ-0003j3-6V
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 14:49:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lttKU-0006qd-Ai; Thu, 17 Jun 2021 15:49:14 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=apCRNlutG6gde4fZIvTvumMxgbmHH/P+Hax+AURj52c=; b=CmUNRlxGDD2sbA0T0kp9NUJkIu
	kPBrHs/w1U68NA+VeoQksHhClFBwc3Kkr9b6GQM7t94Q5xwpx83Dk7MmocT80BtYmVn6Znz6zsIz4
	NHFwEsQVFqMc8KVR8YL277V0dSrpIni68c50Zb6zxzkDQHobKxYHm7VUu3xDmwosE8to=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24779.24810.167567.520077@mariner.uk.xensource.com>
Date: Thu, 17 Jun 2021 15:49:14 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    xen-devel@lists.xenproject.org,
    Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>,
    "committers\@xenproject.org"  <committers@xenproject.org>
Subject: Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions -
 FAIL
In-Reply-To: <5537bc9b-0a71-60f0-efce-d0d33301fe45@suse.com>
References: <osstest-161917-mainreport@xen.org>
	<7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
	<b57c2120-2f86-caa7-56ec-e215a7ad0529@suse.com>
	<637ff3c7-afeb-aae4-0f1d-5ae168e01e01@citrix.com>
	<99833b7b-f626-fac5-d426-109afd4ffa38@suse.com>
	<24779.18584.523983.904660@mariner.uk.xensource.com>
	<5537bc9b-0a71-60f0-efce-d0d33301fe45@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions - FAIL"):
> If any OS made such an assumption, then I don't think it would be
> a vulnerability either. It would simply be a guest kernel bug then.

For the avoidance of doubt:

I think you are saying that if any OS did make the assumption, the
resulting bug *would not be exploitable* (by an unprivileged guest
process, or by a PV backend it was speaking to, or, somehow, by
another guest).

Ian.

