Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A42AD4CC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 12:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23270.49931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcRiT-0007xF-AR; Tue, 10 Nov 2020 11:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23270.49931; Tue, 10 Nov 2020 11:21:37 +0000
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
	id 1kcRiT-0007wq-6t; Tue, 10 Nov 2020 11:21:37 +0000
Received: by outflank-mailman (input) for mailman id 23270;
 Tue, 10 Nov 2020 11:21:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcRiR-0007wl-QU
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 11:21:35 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3517021-0cb2-4b29-977d-6736856d513e;
 Tue, 10 Nov 2020 11:21:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcRiR-0007wl-QU
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 11:21:35 +0000
X-Inumbo-ID: c3517021-0cb2-4b29-977d-6736856d513e
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c3517021-0cb2-4b29-977d-6736856d513e;
	Tue, 10 Nov 2020 11:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605007292;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=20QXgotj5x48Q6AvWXydhWzP6NnSp3hXwDVA7/Nfln0=;
  b=J5L1625tE4Ry4Vq6Ng+gEVMObi7wfn0X3wcGjWlqnEJ50HCbHEqGaI0k
   gff+U9IxNwfzxNhpuCjktFmEczyyftAZdn2ceJAJPEV1K08F8iZQI8Fbm
   CnKIqfTim15GQZd24rGN3rDZcFhnIsplVZzv3NbNgFOK2J+QV9EiTnczQ
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rY8dTgtPw1dSAE2RV36RZyLKPoltQCfrWr83Ca+GEp/iGkuwWLKwrbDAohPVxaGBef1n0XNqFB
 YisKQsuzNCFMvR+0GW7297Hh0x62QS1XFvLLSxdG8QtFJsMYX12+wRP6MXO6Os1Y33T8jk7NuD
 0+7xo9HPfKlZrNAHvU27zNZttLCz71YRvwRKpl1+qmhm96wsUM3qC/VvefXmex0FF7+7M/mG9I
 pxWMrB8u4w6FYcbN+D6MqRR1Prt9H2c2bvO6QmxxElWsfAkmgOVIevejfUWyjsGtwWhj269buI
 VL8=
X-SBRS: None
X-MesageID: 30866721
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="30866721"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZYqYnqHQMEAbcdWtZuN2LplM1suIqrgijIOMaIoFTHd5MWOYFfi9AUmbN5+ITxIqdZwhD5eqY9cPHgOSgUclNfgtveUZ4Y9EQpAlfed1n9eB6L2z+t33fL4mygr7WxM7rntAnGTG9YUVus11I36ojNbqf23uwdPOgVK9FdUexCU2pWBITMu8T8MZ+9L3AqZ02zViq/yNdCCAod0zXihVmgIvATaS3tfUEN4GgSPNw92YO/xttvfayYyM4nuWQWnNat6/mugZyjasmekzTPkQyp2IJfFXS0UfuUGHoBDgj09b03ku5oBQCiwwfohW6l77f8Mze9vGl5CUCbMEMx1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zev643dNXnzkIxRBXaETPFQbhApcmzn+jO9AJuSQBoc=;
 b=cINt2kjwED8dBxKNTpT+Y7ELGB5kpMo53UsC0tMLUo5BctMLB7t2IlvVi7RVu9+qiW0GXwJM723Y5VorXS1bG7DhkqF5CqDRir09WJK9W0flNrlZUEgQEymWJxcqbAi8S550I6GJ44DSiGV/jouDQ55qfHxGpRBWs1tmREnM6f7xeJZC4e/XunlhDSUNdNE4724wewvW9LMhBaDhHZvHc3gwM0BFvUvo4buqOaAgU8aJVkNAYJuaODIWzWloxh6Dba7KVjiXzLm0srRJxyhKNm+ZSATovpyRxCwEYauxUcUNPoZ1RwxKRqHIuXKM48Cfe8+aPXQCv22BtuIl8niv/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zev643dNXnzkIxRBXaETPFQbhApcmzn+jO9AJuSQBoc=;
 b=AA5ze/ISY2b5QccFYhV3LkLIBhBOzgkECoZfoQjUR4zFEiSSawlJ0TwUPDdirRcKzN824tPvxeGC9vRR9VmZp6WTJo6Q63X8yTLrDFz7bZ/IMW0L3vOLt2uMTZYV1OdTRNU1d0T5GgK/v4ikyQIudV9iFocmWE34nDpiq7Wt+6A=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] docs: fix documentation to notice credit2 is the default
Date: Tue, 10 Nov 2020 12:21:18 +0100
Message-ID: <20201110112118.99960-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a7952bb-8d6d-4656-a37c-08d8856ac375
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB34839044CD0453E51A4848BE8FE90@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DYGzYNC01QXPpSBNsFuybWAiW+j34PN0AMswtntlZKWqKP/SMvxHENTkkv1NNswnR5yaVGKvWLIhUsVFAIkavR75bI543Rf7NETZLnUB7Hq6a6gIxi1xcX40Lw+Ii8gLRN78lh/ZtspSfAb1X+LPyvIhIGx85IcAq/PS1/kGjSMdk5z8rZiLdJQzyEcwV1uRqHgaksKi+w0EGcWQbZy/DgM5y4L0DyTFB9Aqzh/8CpDHWvsJDEAcFANc+d4zIxcWTD6j8UkR3nIvVgjQQdXJGEj0zifAyL7/m9xpH4qBflObxhyFR1pcHO7L/+XaNVAA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(6486002)(8676002)(2906002)(478600001)(54906003)(2616005)(316002)(26005)(66556008)(6496006)(83380400001)(956004)(66476007)(8936002)(36756003)(6666004)(15650500001)(1076003)(86362001)(16526019)(4326008)(186003)(4744005)(66946007)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 5ULcHBEE77M7FAYE7U/qQN8csKnSUcPzDo5UQK0kGJ82Dw5YiO7ZWMDuAsc+Pkfub9x59XWZGer+RFsJYJ2Omiy/j6NHqr8ColuZNu3iqaJtz158CYBQ4WSmPWMV8YfwTJYWX9JSN6YFxglgW8TgePgzftaP7wH615tHg6kC7fVbUWGkEhLV6TMgc1iB6gUcWyAfBchuJBjfBO1jLkgP+XTJCpPyHjv1QSKVFFGPP86EDsbv8xZQVrzF/G6zjxJiIjmrRAQQKnA1GUrVCujT/QZrKopo0EaVu44TMdM49Ym/R4/y8Wv7DjJ6+Rn1mdvdfIW39Xfm46ABCgn0KDvU11PKF2eVKUB2XtAqCQgjesjZ5FbWNcvfpg8y7EIe6P0vp6G5assklNiXDWyj5mLwLvA+PX7aVyN5GcM32AAiXoJpR8wamfNBcC8Yi5zN2tqMLacaucUvJ9rn4RP8Jkhd8HHVwOPKI4WVNXzprJ8KohuSjAD+icIXTrph6CzBmuZGdk+y/ou9Uh8vEBCRqquyhZytKh0e1/vhhLlRSHEPGRd8c9kk4M+cMWGNy1d6ZibdAfAvPu2qKb0BGTUhR+Jhtx0xG+v5QCgzIAV48EntIYg//deDkAuJJDMlYOlz+RXrpf/b+fkx2ZoNmH/o6I6fl+3i/nRxJss9/UKrHprdE1rBSRaIqzhE8J+PDMue7Fz4UNONsL9j7kffSqrPEJIoR5iD6PShSP9GtpkbBcoAhomR90rC/TDHqRQTqZD6edGy7hVz/gy6fwN1/CyPg5dAM3No/VeMla0GbkzRI5hXgtiAjhHECeahUn2llR0l0rfqoyj31mfAFS81mt+mcKteiDnxQEP0RkdAwMSdPJTfaq3AsZQegrgEj4y8SavQVh69/ysrjMNaGWjH1CJdev9iNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7952bb-8d6d-4656-a37c-08d8856ac375
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 11:21:26.6254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T56s3huhVtp3PgjpeGURjQnM4QiDlX6s6ra+TmgsCcWBwhNa3TRz6DrESXes8fhgPW4zx1B/3Xe2JEiyVBAwfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

Fix the command line document to account for credit2 now being the
default scheduler.

Fixes: dafd936dddbd ('Make credit2 the default scheduler')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/misc/xen-command-line.pandoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4ae9391fcd..789aead148 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1876,7 +1876,7 @@ with read and write permissions.
 ### sched
 > `= credit | credit2 | arinc653 | rtds | null`
 
-> Default: `sched=credit`
+> Default: `sched=credit2`
 
 Choose the default scheduler.
 
-- 
2.29.0


