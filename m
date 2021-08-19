Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F113F19A0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168741.308084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhNq-0003RT-TN; Thu, 19 Aug 2021 12:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168741.308084; Thu, 19 Aug 2021 12:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhNq-0003OQ-PT; Thu, 19 Aug 2021 12:42:58 +0000
Received: by outflank-mailman (input) for mailman id 168741;
 Thu, 19 Aug 2021 12:42:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhNp-0003OI-LJ
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:42:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhNp-0007XV-KI
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:42:57 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhNp-000441-JP
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:42:57 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGhNm-0001fD-AW; Thu, 19 Aug 2021 13:42:54 +0100
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
	bh=Sa/tiZ33T+jYbrw7owB5hnEtX5+4loym9YR5MGuPCvQ=; b=x4EXhaWryQCEUrK7heMFMgFcOF
	HvvC24+72biFvTl6ZJ5mKZPsqmzhaYC5gnN5a/XoZVnd6BpqG5/G1HVL+J1mEOfJTh8R/2xyv1tFe
	CFm+tdWfBci6RTm+5eQVaEkPDlfibuw3If0F6yHl7bwQczyI0Eg6BDiLk7KKAU9JTRbI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.20942.73057.370395@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 13:42:54 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
    osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable test] 164237: regressions - FAIL
In-Reply-To: <63c26289-4797-9ac0-af95-56b6efd64cc3@suse.com>
References: <osstest-164237-mainreport@xen.org>
	<63c26289-4797-9ac0-af95-56b6efd64cc3@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-unstable test] 164237: regressions - FAIL"):
> Looks like this didn't sort itself (yet). Do you continue to be
> convinced that it will, eventually?

Indeed not.  The error message is different now.  The guest installer
reports

2021-08-18 18:14:09 Z 172.16.146.47:58906 <12>Aug 18 18:14:09
choose-mirror[2883]: WARNING **: broken mirror: invalid Suite in
Release file for jessie 

which is bizarre.  I didn't realise this test was using jessie,
which is ancient.  These tests seem to be hardcoded to use jessie.

I'm going through the git history to see if I (or someone else) wrote
anything which might explai.

I suspect this might be obsolete pvgrub1.

> Additionally I'm puzzled by these having been in the "are not
> blocking" section up to flight 164202, and have since been in the
> "are blocking" one.

Probably, the Debian mirrors changed to drop jessie.

Ian.

