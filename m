Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4129330A71
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 10:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94736.178354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCRa-0004VZ-CN; Mon, 08 Mar 2021 09:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94736.178354; Mon, 08 Mar 2021 09:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCRa-0004VA-9J; Mon, 08 Mar 2021 09:44:54 +0000
Received: by outflank-mailman (input) for mailman id 94736;
 Mon, 08 Mar 2021 09:44:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCRZ-0004V5-3h
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:44:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCRZ-0000w7-2v
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:44:53 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCRZ-0002JG-21
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:44:53 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lJCRO-0007yq-5O; Mon, 08 Mar 2021 09:44:42 +0000
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
	bh=Aj0EJl06pIis/syNLPV8aPivy3Qr3YYxG+jlAI5iJvs=; b=TrdmLuzBNgDJk2s7ZmGpmZX8eU
	2OTmewJOTbItl1xWklCtRvnx7n6oDR+cbu4vGglpwzxsSrgPYJObSyF76jqjoUJgxBbRG7g8EVxZ+
	X4WtFA0VUu2YlNcuyvFQSAEnCqeGbPotJu4TO03UtzaIMYvaT2QbdpALsXtJ5IDqw9RY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24645.61961.964574.269753@mariner.uk.xensource.com>
Date: Mon, 8 Mar 2021 09:44:41 +0000
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    =?iso-8859-1?Q?J=FCrgen_Gro=DF?=  <jgross@suse.com>,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for
 xprintf() and barf{,_perror}()
In-Reply-To: <0249af89-ced0-0f7f-d370-9ffade6b1678@xen.org>
References: <20210305124003.13582-1-julien@xen.org>
	<20210305124003.13582-3-julien@xen.org>
	<0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
	<74568cd7-143b-48ad-b9be-bf4229655376@suse.com>
	<7eb12174-3268-ccdb-df9c-c4fe23d3a332@xen.org>
	<24642.14600.124181.19574@mariner.uk.xensource.com>
	<0249af89-ced0-0f7f-d370-9ffade6b1678@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for xprintf() and barf{,_perror}()"):
> Would the following comment work for you?
> 
> /* Function pointer as xprintf() can be configured at runtime. */
> 
> I can fold it in my patch while committing.

Sure, thanks.  FTAOD

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

to that comment addition.

Ian.

