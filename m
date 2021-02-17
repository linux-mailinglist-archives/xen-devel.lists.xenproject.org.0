Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F0831DE9D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 18:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86390.162188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCQyW-0002RO-6U; Wed, 17 Feb 2021 17:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86390.162188; Wed, 17 Feb 2021 17:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCQyW-0002R2-37; Wed, 17 Feb 2021 17:50:56 +0000
Received: by outflank-mailman (input) for mailman id 86390;
 Wed, 17 Feb 2021 17:50:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lCQyU-0002Qx-Ow
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 17:50:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lCQyU-00006z-LQ
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 17:50:54 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lCQyU-0000ku-Ja
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 17:50:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lCQyR-0003yD-8i; Wed, 17 Feb 2021 17:50:51 +0000
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
	bh=eeUEqWk2bSDD/sRRFkEI0O2xe4p+VmENySKL0yccvbk=; b=IIsohx6sG67H+6I1JX2ipDeeMF
	ZFwA0OwiT0ZaZKsMGZxrPPDOY+YHrtxlstfmjLBaFI1DumudSmfutrltXemO9aIC9uAvWbdLbneVI
	zr/ZZQq20PRATNcioapQcntd4+LNqIym8QpfVpylSNhY6c5SDbZgnTMibI5hwz0LABxw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24621.22394.619514.991835@mariner.uk.xensource.com>
Date: Wed, 17 Feb 2021 17:50:50 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 3/3] tools/libxl: Rework invariants in libxl__domain_get_device_model_uid()
In-Reply-To: <20210217164251.11005-4-andrew.cooper3@citrix.com>
References: <20210217164251.11005-1-andrew.cooper3@citrix.com>
	<20210217164251.11005-4-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 3/3] tools/libxl: Rework invariants in libxl__domain_get_device_model_uid()"):
> Various version of gcc, when compiling with -Og, complain:
> 
>   libxl_dm.c: In function 'libxl__domain_get_device_model_uid':
>   libxl_dm.c:256:12: error: 'kill_by_uid' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     256 |         if (kill_by_uid)
>         |            ^

Thanks for working on this.  I have reviewed your changes and I see
where you are coming from.  The situation is not very nice, mostly
because we don't have proper sum types in C.

I'm sorry to say that with my release manager hat on I think it is too
late for this kind of reorganisation for 4.15, especially just to work
around an overzealous compiler warning.

I think we can fix the compiler warning simply by setting the
`kill_by_uid` variable on more of the exit paths.  This approach was
already taken in this code for one of the paths.

I would prefer that approach at this stage of the release.

Sorry,
Ian.

