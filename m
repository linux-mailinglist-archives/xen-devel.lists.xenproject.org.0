Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39A2B5BD5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 10:33:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28826.57954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kexMP-0004TP-Nb; Tue, 17 Nov 2020 09:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28826.57954; Tue, 17 Nov 2020 09:33:13 +0000
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
	id 1kexMP-0004Sy-Jc; Tue, 17 Nov 2020 09:33:13 +0000
Received: by outflank-mailman (input) for mailman id 28826;
 Tue, 17 Nov 2020 09:33:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kexMO-0004St-DI
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:33:12 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5d6a6da-4398-4d29-8b60-0e95b08a84a9;
 Tue, 17 Nov 2020 09:33:11 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kexMO-0004St-DI
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:33:12 +0000
X-Inumbo-ID: e5d6a6da-4398-4d29-8b60-0e95b08a84a9
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e5d6a6da-4398-4d29-8b60-0e95b08a84a9;
	Tue, 17 Nov 2020 09:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605605591;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=xlG7GF5iQJSjzhvJ2z7oBn5133kFgRL6UqiHO3w5Ib0=;
  b=ZhG7heNB+/Cn7gGtf0ucn4K/7tpRzkFBTN6eGn4zkOejTBtT6nVZ+w8s
   NoW5fE0hnpTqMVQM7HsDy+s5/XWXUCJdiBhbOKYRZBg+Jx1Wm9GVf6FKv
   ge4lUzic7vatTeirAcYWza+nSx2squRchfI1JxbAUNc5G7ywUc3tTTh2c
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MVcem7/R8ipHHc0XKl+LBw+5fuQUs0WbPWPwBrFI56J6Ug6URM5um+tZorIdD0HekuaRYeOCdB
 sottx6pJVaV6UOAVv7qHTqFHpJuVfbw/Qk+SSotgpymE3NZUioxAfu6lMuscL4Sf2ss1m2asF3
 SDMiSc0lybJVTXjmSPwox0IgU8k9amdoya6yz1nXybtmcYEAwM5ukgqMsqxsHxd/9LpKbBuser
 CH+dMgI2oO4W/gZsMnqclArt35muVQkCqCzFr3Z/Z7BBsiCoszmw4ttOhrIHwpj3a/DQ/5YgJA
 ja8=
X-SBRS: None
X-MesageID: 31290796
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,485,1596513600"; 
   d="scan'208";a="31290796"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1AtNCC+ZLrLl3p3xVuZkW+XNrFVX2geWb+E9luuPKBCXzHlX41r6kyzwHfO4RFPVJZuQqVjrjdz+ZxvoUZ2d1uXFvCANAyh6B+V8wdE0/4eMCrAegy1/zeD50P9G7M3xokOHdpslwUwsCODwHllybi6BLgew/+m7x7XOiXRXOtchr5flgirZFUXhCkagvnMc+ODJhs8VggirD4gqj9Za64ZkomqRKrpwxkqM8oOgrW11OHrSk2zJXvPzgIxCLuiW0xCIVeMXv1XWbuIsdAxWFB6OwxJ0Nhfrk29v1zaee14MKpg11wANY9sn6ELF3j80ws/lt6hURdsHLyhTf15jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBXLBz2fRRUloLhGoC6sj4nzp8i6aSdhXeuRHbff3uE=;
 b=UE9GRdJ7xOObGjwWyLcHTlAUD3LRFRr1dljswLjg1N4glGaIQ5va+7WstMXMRp3CGDRMFbfSUdcGtaAEbHQ44K5w0JFouxPBsIFU6laYLfukBXE3kYG0KdVYh4Di8G3hBHlriVDffjuu2u7+7Zzrmf/THOEfpUSTs1cqjI0NfanuANYPbEmhiPCZqH5KVWI0vXgKb1ejaOH29oRuCqzz85xCm/NyoRS3vXRulTnGg+IiUJmF1x4DOu/1rb8mt9987K+tIhYi3O9egYfFY4gjAtSbSsMzE9bDhRhevFwaN8bVJNFZ/S9hxxV3KHgtVo2nKErnIQzacuWgt7KSfxS59g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBXLBz2fRRUloLhGoC6sj4nzp8i6aSdhXeuRHbff3uE=;
 b=KjwU6zrJjgSeFZtPXN5DyxWM4FzmRYTg7H5m2tRxnKihdFqwE9oB4oAQqFEi6arf3m6NC+JGxcsIlMTBWEp3hMqH3J/XjbkT1A6+xklkqqfC5Y5Ewc8H9HAVHd8BdZRnOk045z2XxNfxNDqQqaN+u7rNdxf/wVxrwB/HSSAJufY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3] docs: fix documentation about default scheduler
Date: Tue, 17 Nov 2020 10:32:58 +0100
Message-ID: <20201117093258.26754-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0357.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbacf35b-28ef-4774-8f58-08d88adbca19
X-MS-TrafficTypeDiagnostic: DS7PR03MB5526:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5526C71471C702D3512814E28FE20@DS7PR03MB5526.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HirnF6bX2ZTY8IPPAeCN4LNHmiusui7KWs33UJfOaximO4KjMCC54aU6nvzVRcc10rOulgeYOFjweFNnP8nxN7B1zc5lwvJxfv8MTElkSqKqbqC9qWpCXaFxAhCnIBlnL6itt6dgnuevhXukDRySaDom4QMPJgRZPQs1XYcgQOSZaWOYuv20ls3gOFe3WQZFwoixwZcg5YwsImTulBT0Bz8Brw7BFl/yhA1Ia9+rv82NKNxYqIJG9WA3xJ2itqr2Os7jI5jTBrZ/jn/TTBNeYwbOhwD0b4MqAloX8fRs3ceCU4FGpp7xIuwIVzTRTsqn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(16526019)(186003)(26005)(66556008)(66476007)(66946007)(6666004)(5660300002)(4326008)(1076003)(6496006)(36756003)(956004)(316002)(54906003)(478600001)(2906002)(2616005)(6916009)(6486002)(86362001)(83380400001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: r1ZwQmRyPzIf8iZmv82x7Y6h4mDOhAgsZzO5h37wFnYCO0m5+zFqee48JpTVCVipH4XArI4NjAKyLEpCl7O6YpJvI/7wOp3C9tRBTMpY2G+gJTID2QB6N+cK70RVNFfMRPQYQt8ixQ1pMI9CPYZRIYubGToRjlADlIXsUPasv3Gg4S5oLps/zxmb2SJs1CASJqJLd/OyHdpjXRrCBll5WN4UIwhPc6D2uiwcH6IEAIpgtMTpNjcHu0QWOdkYKbDGR76KUodYt2JdYsjnk0xURAhZA8Rr5buaO5q3aT4RoY/lzSg/4k0CvY/5HALYUMoRBu+yRQat9ziDJWXsILiKCEijNSbp+tD52Fm2hHRaQvAN/NbtrfoWsuoeV/yQSH+leXYKJlKms+XhwfZH2P4hVaBHx7RtrLa3bjqspOLJ+4gkn9XSNQlg4oRh8IWS19NzFKaQiQUkqFMD0lPWOgybeFwy+ta8dJHXixK4ZlX9YSleqZrawwY7xbIKP6cTBHzGPTjmbjke5nreDsurEckdK3/746JQ4tg9B2F5ufSLHty0CWZSzS+9ztfaBA8Di++cF8SZRrfMMenNcY4oJJFO72fd2vTfJ2SCJu4Aj5sVphwKNM5Dy4DNiQAbKTJUF8sxamrVm0Zbu+H06VBbd11uHNIPhHbVcANnJDxYHxAkBy+c4MiT0p2Zgn+TmdCqIhdd4VN0BpjsqtCEVv7TSkrYq1mUalLXdLxfL66wgGxIpZydhCoqCTkIoLsWgKg+7F6JpYJKMK+hpl/jYTz2Jhhv27Fwkt3UJTimR51LUA5Io5JiJ+Owqe6QRTMQGqE1k5ApvQ4oTxLQxXkY7QMhhrpHq+DH8urwsn1phqO5rDMiuNnFDqARSHPGA+k4Br8QuTY6nNuhx+211VQem94FM/RVLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fbacf35b-28ef-4774-8f58-08d88adbca19
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 09:33:06.8209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wt8OyLBLpKOpjFxLHcJglRgmQO4l2FuYJud96mwFKEdJatOekde6Ca/mU4+u+r9w20w5Wtnln1swgWhxjaZ1jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5526
X-OriginatorOrg: citrix.com

Fix the command line document to account for the default scheduler in
Kconfig being credit2 now, and the fact that it's selectable at build
time and thus different builds could end up with different default
schedulers.

Fixes: dafd936dddbd ('Make credit2 the default scheduler')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - List credit2 as the default scheduler.
 - Note that default scheduler can be set from Kconfig.

Changes since v1:
 - Point that the default scheduler is being selected by Kconfig,
   don't mention the default Kconfig selection.
---
 docs/misc/xen-command-line.pandoc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4ae9391fcd..803243c3fa 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1876,9 +1876,11 @@ with read and write permissions.
 ### sched
 > `= credit | credit2 | arinc653 | rtds | null`
 
-> Default: `sched=credit`
+> Default: `sched=credit2`
 
-Choose the default scheduler.
+Choose the default scheduler. Note the default scheduler is selectable via
+Kconfig and depends on enabled schedulers. Check
+`CONFIG_SCHED_DEFAULT` to see which scheduler is the default.
 
 ### sched_credit2_max_cpus_runqueue
 > `= <integer>`
-- 
2.29.2


