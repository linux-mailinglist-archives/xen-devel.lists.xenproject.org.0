Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B93D2F4E5E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 16:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66573.118304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzhvm-0005eP-PQ; Wed, 13 Jan 2021 15:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66573.118304; Wed, 13 Jan 2021 15:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzhvm-0005e0-Lk; Wed, 13 Jan 2021 15:19:30 +0000
Received: by outflank-mailman (input) for mailman id 66573;
 Wed, 13 Jan 2021 15:16:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gThW=GQ=bounce.vates.fr=bounce-md_30504962.5fff0eba.v1-a9cbd0d935154d9396236eaa209e28db@srs-us1.protection.inumbo.net>)
 id 1kzhsa-0005TJ-0e
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 15:16:12 +0000
Received: from mail179-20.suw41.mandrillapp.com (unknown [198.2.179.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7db8fbdd-766f-4281-8a22-af929ccf6e8d;
 Wed, 13 Jan 2021 15:16:11 +0000 (UTC)
Received: from pmta04.mandrill.prod.suw01.rsglab.com (127.0.0.1) by
 mail179-20.suw41.mandrillapp.com id hvs7bm22s28u for
 <xen-devel@lists.xenproject.org>;
 Wed, 13 Jan 2021 15:16:10 +0000 (envelope-from
 <bounce-md_30504962.5fff0eba.v1-a9cbd0d935154d9396236eaa209e28db@bounce.vates.fr>)
Received: from [185.78.159.90] by mandrillapp.com id
 a9cbd0d935154d9396236eaa209e28db; Wed, 13 Jan 2021 15:16:10 +0000
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
X-Inumbo-ID: 7db8fbdd-766f-4281-8a22-af929ccf6e8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mandrill; d=vates.fr;
 h=From:Subject:To:Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding; i=samuel.verschelde@vates.fr;
 bh=6mquQNTDYf+5up03b65QDZPULiv8bF4QViT8BB7mmzw=;
 b=bTqhfwOmJoaecOgULj1tr+l86B/w6JlW7ElmAx3slNDnCxEn9LubI1QDsPeXFe+X02YeRbN3nYRP
   TVEikBpllwe6/MPxez8KbJdp4Ub5r7YOnXJyVJvD6PFSi0nlHuno8TWJXMcRYH3NER7Hz7Y2bdOH
   bNxRd7iFyRnMAUThhiE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1610550970; h=From : 
 Subject : To : Message-Id : Date : MIME-Version : Content-Type : 
 Content-Transfer-Encoding : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=6mquQNTDYf+5up03b65QDZPULiv8bF4QViT8BB7mmzw=; 
 b=XOD3OKgOmgxW+1MJ8UGhdaCyXCSIVmI9+sY1hNGQWisPbWMJ4p1U4eRxFoR5mtAFbRAEhU
 NSkIHhsBCojnhc9/LqVZBlwuA53Y97cngJAqjFt4vtYsQpSVY5xEK4I+IqCx7n9vFoLtlI6u
 ciTg5u9aAhFytB+X/a/nL5C/dEsjY=
From: Samuel Verschelde <samuel.verschelde@vates.fr>
Subject: PCI passthrough regression on BSD* guests since 4.13.1
X-Virus-Scanned: amavisd-new at vates.fr
To: xen-devel@lists.xenproject.org
Message-Id: <45e416e8-f2a6-1a55-0f66-dc82e4d72a84@vates.fr>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.a9cbd0d935154d9396236eaa209e28db
X-Mandrill-User: md_30504962
Date: Wed, 13 Jan 2021 15:16:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi list.

XCP-ng users have reported a regression with PCI passthrough in XCP-ng 
8.2. We're using Xen 4.13.1 + patches (like Citrix Hypervisor 8.2 does) 
[1].

Symptoms: after a shutdown or reboot of the VM, the passed-through 
device can't be passed-through anymore.

We've build various versions of Xen with select reverted commits for 
users to test, and they helped us identify commit 
6a1036e28240217d1dbfcb096800313a468cdb0e [2] as what caused it.

On IRC, royger confirmed having reproduced the issue.

Best regards,

Samuel Verschelde

[1] 
https://xcp-ng.org/forum/topic/4001/passthough-on-8-2-hangs-on-vm-reboot-and-stops-other-vms-passthough-devices-working 

[2] 
https://github.com/xen-project/xen/commit/6a1036e28240217d1dbfcb096800313a468cdb0e

