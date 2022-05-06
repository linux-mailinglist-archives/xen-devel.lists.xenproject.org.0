Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB67051DDA4
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 18:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323353.544954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn0rS-0007VH-6f; Fri, 06 May 2022 16:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323353.544954; Fri, 06 May 2022 16:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn0rS-0007Sj-3k; Fri, 06 May 2022 16:31:22 +0000
Received: by outflank-mailman (input) for mailman id 323353;
 Fri, 06 May 2022 16:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uW0u=VO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn0rQ-0007Sb-SN
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 16:31:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4b4d7b1-cd59-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 18:31:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80B7F61FB9;
 Fri,  6 May 2022 16:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEF1C385A8;
 Fri,  6 May 2022 16:31:16 +0000 (UTC)
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
X-Inumbo-ID: f4b4d7b1-cd59-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651854676;
	bh=fqSe8gBcsjumhyxaOhPZoyaVhRLo0kUXBBdD3j0zYdY=;
	h=Date:From:To:cc:Subject:From;
	b=dmUfhjsDKvRAvpiKXqtSwwF9HcBhmx6+a/CNOLTbt6UWJ6Jj8NgRE0KTJVeTliybg
	 aeHncVtOFmfXlJVN4DzS5wgPdhf4RwJz8lfkRzWdJGBohC4qvB93411uHbyNAOhNby
	 WwkZevH677cQpGYxDeq/MBk8TGgL+vw37rL8iqZWdKzmXIHtAogMEdVUjAgD2fzkI+
	 gFhu6fP4mWr9mrvDFMMLmqgyyV0EiIVXNhTtkPohz/AqsctBHLZqqpU2McTFUrbNpb
	 xM11A9oujEd3h7TaLQPpU4Za/p/Aa+eSKfjWWq5qsRkjgXwws0sd6s8RMIRsAbBxmT
	 jwfMMvGnzu9MA==
Date: Fri, 6 May 2022 09:31:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jbeulich@suse.com, andrew.cooper3@citrix.com, julien@xen.org, 
    Bertrand.Marquis@arm.com, roger.pau@citrix.com
cc: sstabellini@kernel.org, george.dunlap@citrix.com, Artem_Mygaiev@epam.com, 
    roberto.bagnara@bugseng.com, xen-devel@lists.xenproject.org
Subject: ECLAIR Xen x86 results and progress
Message-ID: <alpine.DEB.2.22.394.2205060919400.43560@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Roberto kindly provided the ECLAIR x86 results:

https://eclairit.com:8443/job/XEN/Target=X86_64,agent=public/lastSuccessfulBuild/eclair/

Click on "See ECLAIR in action", then you can select "Show 100 entries"
and see all the results in one page. As an example MC3R1.R1.3
corresponds to Rule 1.3 in the spreadsheet.


If you are OK with this, I would like to aim at a follow-up meeting on
Tue May 17 at the same time (8AM California / 4PM UK). If the date/time
doesn't work, I'll run another Doodle poll.

By then, I am hoping that the group has already gone through the first
20 rules in the list, up until Rule 8.10. Is that reasonable for all of
you?

Cheers,

Stefano

