Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CF0396E03
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 09:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134713.250581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnywa-0005vZ-MG; Tue, 01 Jun 2021 07:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134713.250581; Tue, 01 Jun 2021 07:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnywa-0005sp-Ib; Tue, 01 Jun 2021 07:36:08 +0000
Received: by outflank-mailman (input) for mailman id 134713;
 Tue, 01 Jun 2021 07:36:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tu9B=K3=rmail.be=alien@srs-us1.protection.inumbo.net>)
 id 1lnywY-0005sY-U4
 for xen-devel@lists.xen.org; Tue, 01 Jun 2021 07:36:06 +0000
Received: from mail.rmail.be (unknown [85.234.218.189])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0cb89227-cc56-4064-ac7f-4ecf78fadcc8;
 Tue, 01 Jun 2021 07:36:05 +0000 (UTC)
Received: from mail.rmail.be (localhost [127.0.0.1])
 by mail.rmail.be (Postfix) with ESMTP id 2A030B11353
 for <xen-devel@lists.xen.org>; Tue,  1 Jun 2021 09:36:05 +0200 (CEST)
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
X-Inumbo-ID: 0cb89227-cc56-4064-ac7f-4ecf78fadcc8
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 01 Jun 2021 09:36:05 +0200
From: AL13N <alien@rmail.be>
To: Xen-devel <xen-devel@lists.xen.org>
Subject: pci passthrough issue introduced between 4.14.1 and 4.15.0
Message-ID: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
X-Sender: alien@rmail.be
User-Agent: Roundcube Webmail/1.0.9-1.2.mga5

Not 100% it's a bug or something i did wrong, but,

with xl create i start a PV with 3 pci passthroughs

after wards, xl pci-list shows all 3 nicely

looking at the domU boot logs, pcifront is only creating one pci device 
and lspci in the guest shows only 1 pci entry

in at least 4.14.1 it still works.

looking deeper, if you start with only 1 entry or 0 and you do 
pci-attach for the other pci entries, all of this works fine.

this is the pci section in question:

pci=['0000:04:00.0,permissive=1', 
'0000:00:1a.0,permissive=1,rdm_policy=relaxed,seize=1', 
'0000:00:1d.0,permissive=1,rdm_policy=relaxed,seize=1']

this works fine in 4.12.1 and 4.14.1, but fails in 4.15.0, however

booting with pci=['0000:04:00.0,permissive=1'] and then doing

[]# xl pci-attach <domain> 
'0000:00:1a.0,permissive=1,rdm_policy=relaxed,seize=1'
[]# xl pci-attach <domain> 
'0000:00:1d.0,permissive=1,rdm_policy=relaxed,seize=1'

also works,

Regards,

Maarten (alien on Libera and OFTC)


