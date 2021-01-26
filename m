Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB74303F28
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75050.135018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OfX-0002PQ-9j; Tue, 26 Jan 2021 13:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75050.135018; Tue, 26 Jan 2021 13:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OfX-0002P5-64; Tue, 26 Jan 2021 13:46:07 +0000
Received: by outflank-mailman (input) for mailman id 75050;
 Tue, 26 Jan 2021 13:46:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4OfV-0002P0-PQ
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:46:05 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b5908b1-84cf-45b5-9fea-10353d0c8443;
 Tue, 26 Jan 2021 13:46:03 +0000 (UTC)
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
X-Inumbo-ID: 1b5908b1-84cf-45b5-9fea-10353d0c8443
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611668762;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=8jlAk/+hcS2q12O4W8sLjaWYrl5uLbNjBVKzLRfyay4=;
  b=LPM+IFIZwCFWOpLZ3wQeDWiI0DOytGKqaLPpRziWbh623ytAgf3t8tKF
   FSr5Zx4JBFSjzMBx5b5SgECEg2q+dKt7PUN57m/+3lGT7iHROZUtcl90A
   i16cgRDabJcJjprmCsgGJLXi5o3igDhWTrmz2sOTyBsaFSHrMSruNEbcH
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sZgn3RhQ/trF7Sgc0Bd270VFLNw5syGxo9vL58/Fx8cDtveu8yVrLEENKK8oojfqjkR2MYMC1N
 FuhL2iCa4kSlamUUT1Jfr3FybpKL77pw17v6YrLRobVhypsCKC1gnOuzerCNr4aEUpcK3SjkSO
 4dwc0Ov+hMAQ1CBqYSzE94RYUqs5LVIRuKeuhQFMUYYx5q3Vs5ShRs+kBWF5aI37C56ieto9jq
 UraXjQQCwxwJczO5B9vX5Dh0TWxkRuOlFFcTpgxnAFTRqL5e9iuYuwxFvI+99c4ifyFgXOgJ6z
 TmQ=
X-SBRS: 5.2
X-MesageID: 35832599
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="35832599"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jwup+EkFQevKWFB/Ow/pxgxrAyqvfhNVh5Vu/kAV20b9tn+AuGOodvB6p/UpS8q4/BingpnT6ejsCCZluV5wiDL0JIjIK1fiGfKxKwN+74XR4eXmnmm+geUkoUgqkPF1HA54ls7dCGRlVvDCXWqoc/Bmo2fibtRdg9q6aV2ubYSu0WBWrYtLufce4EtNSU4ya9G5JzdkKVUSiIwePAhwEQk+K1e6iP7Zo39xm3p978HHYoHyLnklWBCPHW49TdosHHWEb82T9GH9xV6qAHuEV9gMeon0QdFq55vqlrpDMnYkxKSe/CMrD9M2vfkNouQdYomi5zj6ShJSRlftdr+mWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/c+b3S0LGQkX6kBUON/6KhhOsUbKxaBEHggBbYMk9A=;
 b=PsgC2LfJkqHVCqCticp0CmbwsBTp90fg3Su0xubLqo2GFPlbpCyjvyhByKktt5mt94GoabIU1w3TZhdZdFipHCmVcCC+qCPiSFOn4Au5bljSB7iy12IlsbzbHidsf80rUtTdpff3vYYjsueMDtx2piJ2JllidiRnww581kXctVAIbP1Vr6/evVIiYUhJIdT9U/0G9b0+i3RvuadEq1Cn7a+mmvw0+ZRgZ1fZZsArdZtvZpejnCDtsSbRNeNk17QVnnoEg80VwA/ZAMN9E5WcTLZIssrAoEah/CamSqUtzdoJGKMygM8BHFHpd+sfu80NvUDy09P2jTOg26J47Q9QeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/c+b3S0LGQkX6kBUON/6KhhOsUbKxaBEHggBbYMk9A=;
 b=rGRYszbflPE6AmDVklLakEvA3VSZuih3jilv+I617TmTr4CcbR/M9znWszoQSth2pb+3NSpaE+drJAZEsifW97RpcctkVimFS0r151baTdK1wXlu18hxhy0PTNSN5X0dmVTrAE4o5talwpXXJukJQMaVmVhqu90P5rLI60Lw/7g=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH v3 0/6] x86/intr: HVM guest interrupt handling fixes/cleanup
Date: Tue, 26 Jan 2021 14:45:15 +0100
Message-ID: <20210126134521.25784-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0185.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::24)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d269ea3-4da5-4181-60fb-08d8c200b703
X-MS-TrafficTypeDiagnostic: DM5PR03MB3209:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB32097AFF518BD56ABA4C3F888FBC9@DM5PR03MB3209.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H8J3H6PtEKkB94jKcTEz6hqvQ1lZdWa0udSkiiQFT1qdC3J/RxCFtl6DvUSec/9tMh0y8CpX1KesAKBQXFW/xnhM/msvE/Up26gPeYCmcUPVMGaW+N8lrQ76YLY5IpmwgOTiX1LPoQEyCCGJq6lXExPxyHOWqbcusyWBcCmeWp4z1ABCLY9tptrSaup/O+fp5aOVtm6tZBmiVP97HlmNIHaWcutdTLaUzVsigtc26ApkGLi6QLnZBMIdYYVWU0CTUgUMBpVJp8utbquaLZA4Hvizyd6g53/74Brig8ay7TFxGidpKsZ0Ey3iNc39FFhKPIxPdzgbcWS1d5J2wjVrGytPz28X4pJF+53y3KDuKAyHOVFYnVL7+nnDS0OdUX3kBQJ+a7KX9tTbWGm8q1OOBXlGP1my8WMx5jrI+63qdj1jciE0qa7OLXwA3X+jfhntNmIRswEe9/Jm0Cy4kFkF806wNxrwMEK6dmfbgvyZomu1Y+s0BpZoWluW4KlIL1yhqPBQ3ZdazI2gusu0yRhd7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(6666004)(6916009)(66946007)(8936002)(956004)(86362001)(36756003)(478600001)(2616005)(8676002)(83380400001)(4326008)(6486002)(186003)(6496006)(54906003)(16526019)(2906002)(1076003)(5660300002)(66476007)(316002)(26005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aGs0dDRTNG12T1pCeDFDYkh2TU9abzNOUG9TV2t1TDBKM2o0K0RFUzRNaGdB?=
 =?utf-8?B?SXZtTmsrZklVZ0I1VTlUU2lzTkE1TUtJZE9zOUZ3M2FVRE1DK2tiZVdNbHRC?=
 =?utf-8?B?dkdKZTZvaXJCazd5TVdMQkFub3ZxUnhqMFJsV01TZHBvc1R6UjJJSisyNEpV?=
 =?utf-8?B?UHlPUzNlbVByNkJNaVplY25GYS9DRWdoNWNtWHhmTmRwMVgxdG1VUGg1QW9o?=
 =?utf-8?B?cHZEVGduaUxaMzNSUHdaUkJRemt4bzg3V1gyY0kvRWx5VTdQc0lBbngwQW1r?=
 =?utf-8?B?aVdlcW8yQ0tVNEZoOUN0elN3RDY0ZUlGWGthTXFzSFpmajZHSkg4QklxMitj?=
 =?utf-8?B?ZWltNXJrMEtIZTQvTGNCWmZNN1NYYndsVEY0K0lqc3lWSGx0aWR4NE4zeU9S?=
 =?utf-8?B?dFR5MTVaMkYwdE4rUW5oSE82UnlITVMyQ0JwcXZxWlFsenZJc0ZSVVJXWnZG?=
 =?utf-8?B?aDgyYjNEeE5hYk85eUM2K1hCQ3cxaUx4d3YwTEI0aFdPWnVxZFpTWVQ4M3lK?=
 =?utf-8?B?d0F1M3RPYUdwZTd1U3R1dnczRUhwYmx0ZUYvQ2tQSGMxeVNISHR0eFVaTGNh?=
 =?utf-8?B?RnhmOTF3WitzbXl6OUhtcjcwR0JpRjZoRlVTVUYzZmFKNmhLWmdiZVJKVFNx?=
 =?utf-8?B?QlJ4L0pscyt6UGc2c1FoQWdPdkRza0pKN0hlZW54SFN4d2lNKzQyOVhwNzJv?=
 =?utf-8?B?Tjk3Y2NhMEVBQzhVUDdrZzFvWjQrU0ZwaUlEcG8zZVdwaWx3YnlLMm8vWjBN?=
 =?utf-8?B?WjdDWVBrdndiZkoxWlNnbEZvRGNzd2JUaE9WSzlnVDlOeUxWMHBIeU9TSEFI?=
 =?utf-8?B?UnUwTTZJajJQNDZaSjdwV3pEUWpUbVBqbkttZWZsMzF5Z3NtTzdKN3N3b0J2?=
 =?utf-8?B?ZHRGMjFYUFRLVC9ZZXpxY1BmZ0hSYnlWRlphMzhRZ1ZJbkZEbDFrN0pZM2Yv?=
 =?utf-8?B?R0tWR2dzVUNXdndkUGRuVVZTLzBOS00xWGdnQmZFaHcxZnlRdmZOQzVxaXZC?=
 =?utf-8?B?VUFVS1ZGN0ZJMlBOVW4rSEpKcjZiN1NYeDlmZDJSRkF0MUVwVFpkaG1QeVVp?=
 =?utf-8?B?aXkzV2JwdDB6UlN1Nm5pcFRSRkRUWkRMa08zQlVjeWZIM3R2KzhiVWN5bFND?=
 =?utf-8?B?djRhU0UrWEZlZnNyR3dnT01CUGx6M24rb2xWaHhKWUpEK2U4YXRpVUhvN2RJ?=
 =?utf-8?B?K1VFL05jTUpPdkxUTXM3ajg5UmhNallkOGxkY2tXYXBEcHlUUmpNc09FT0Vq?=
 =?utf-8?B?K3pPZEhFaGl2RmoycHdrZHRyanRnQW1jL20wOXRtcklMVm13RThYTU41NDU5?=
 =?utf-8?B?TklUVE0vaXFCK2NraXdwMmNNaUE1cHNMLzNucGR6VHgreW1VY29VYlo4bnp5?=
 =?utf-8?B?T1ZmVkNRcno2NUV6a2ErbkZqVVh1TERvcE9Wb1d2UVR2WWU0UTdNSFRhZ2tl?=
 =?utf-8?B?Q0phNzMrRFFvWGRlREcxWHRnQ2lrclRBSGtDTkhRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d269ea3-4da5-4181-60fb-08d8c200b703
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 13:46:00.1535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrQ4Qld9PtnveVFg181OpKnj++ZWzANBmQSHawj2GGY0d50yCctYOmDupPeccPV5gbBRGm7JNyxZnksM7UyF4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3209
X-OriginatorOrg: citrix.com

Hello,

The following series aims to fix some shortcomings of guest interrupt
handling when using passthrough devices. The first 5 patches are
bugfixes or cleanups, which I think should solve the issue(s) that
caused the dpci EOI timer to be introduced. However neither me nor
others seem to be able to reproduce the original issue, so it's hard to
tell.

It's my opinion that we should remove the timer and see what explodes
(if anything). That's the only way we will be able to figure out what
the original issue was, and how to fix it without introducing yet
another per-guest-irq related timer.

Thanks, Roger.

Roger Pau Monne (6):
  x86/vioapic: top word redir entry writes don't trigger interrupts
  x86/vioapic: issue EOI to dpci when switching pin to edge trigger mode
  x86/vpic: force int output to low when in init mode
  x86/vpic: don't trigger unmask event until end of init
  x86/vpic: issue dpci EOI for cleared pins at ICW1
  x86/dpci: remove the dpci EOI timer

 xen/arch/x86/hvm/vioapic.c            | 19 ++++++
 xen/arch/x86/hvm/vpic.c               | 36 ++++++++--
 xen/drivers/passthrough/vtd/x86/hvm.c |  3 -
 xen/drivers/passthrough/x86/hvm.c     | 95 +--------------------------
 xen/include/asm-x86/hvm/irq.h         |  3 -
 xen/include/xen/iommu.h               |  5 --
 6 files changed, 52 insertions(+), 109 deletions(-)

-- 
2.29.2


