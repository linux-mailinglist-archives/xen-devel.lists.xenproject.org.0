Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1344F332372
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 11:57:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95326.179935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJa3U-0004H5-2I; Tue, 09 Mar 2021 10:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95326.179935; Tue, 09 Mar 2021 10:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJa3T-0004Gg-V5; Tue, 09 Mar 2021 10:57:35 +0000
Received: by outflank-mailman (input) for mailman id 95326;
 Tue, 09 Mar 2021 10:57:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWC+=IH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJa3S-0004Gb-DK
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 10:57:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97ef1804-c7ee-45f7-8908-73b2de59e1df;
 Tue, 09 Mar 2021 10:57:28 +0000 (UTC)
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
X-Inumbo-ID: 97ef1804-c7ee-45f7-8908-73b2de59e1df
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615287447;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=0wIkc+GpCCB80ud8uU0TvIrXl/rwMlgfoeQP0uwLugc=;
  b=htAeueqcN2wo+lKqCd9opg82BGzqft7xQWDOqheqaL+ZzB45DYfRKYED
   mqDIjbV2crLTttohVlABjxvqDeTuB9B/dyoYc18mvEYjw8iJOwblp7Sco
   Pe1YpRpHLulwz3eb2P26D/S5cjURT6nnxd0dsSW77nw8HFtj5RtubOmpv
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CPCq6Nyzrsa2KXb/D78yQk7+aPyRpj0OjMwHjZA4FUVi3kpSKIfD4MLNSeUCkqusFqnguXmY95
 4D+rjCaJW2AdchVn9AbQ+W8+c8sMxmzSqaqdUdWoCrbADFt0eQj/vGLmOyZo+f1NhbnbxfR7e1
 vlKf6CSoyo3S4IlDSm5B71I/b7HhiFWFqqxERgA+7ElzxoVpXddKEwKmyxL5DAtQeCzpTBuUoq
 9uy0ZwnPdA4b4KwSl3IngitmtqV4SAPqgCSRZ7kUzAYD37iVxLWU1spW/faEFCL3HOpH5hXBr9
 8xA=
X-SBRS: 5.2
X-MesageID: 38758766
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="38758766"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7jBZmSfj1lqdD7Z6CFcZao7LmUm4tkSYtd/rtwb4F/3c+vQHXtnsZf0KLV4UwioHRW0wMShL5yv5W1K4Rnswa17KSBzTnpdhbkY7YhcYVnr7BlcIZjLW8rpm5FNycOaUPJo10YhhA5H0L2Lq5+8zFUX28xgXAr9Axr9kNw+yB9BEWPMYV59l5nsoHuuHUeDQUfyidFE13vsicyvK/FqD7yo2Oj+HLhlYOz2gPViIMHnNdDp+5fPE/2GiC5xrvsf+1Ajt0/9z92EjKnOLGGCesmu/ZRBupTBld8q8G7fBBlAClvyZ2dbPQSe4nR9ndqZI9tMihajFFTQ25ktf92hhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqAp3HV28uCxTYHCtex8ff3bCSR1XtAN4nU6VEb7wkM=;
 b=K3zWG2W82URziBMbuh0Yh+oj92AkPkDoJAsyHwPzvmh/6KVPxjDpqQDHF5IWWIbEhTVKS75OhyKo23dN9OLW5gQA9IyQ4PvZUD7k5W82RonMtton6Um+yqRNgHVDzwAvSIsiWsBbfZT2HsMHNiIU2oathMy85/OJU8p7dmJW551NmWU8LZ3U+vn5SFyqIZ0HvqhYWsaZXlVj+9HXSdtbMhpoGhpfRxQGNUwt0X/MmalY/KBplxc9LgCVENafHfUSpGeA8qm+gTgg+LgLepqDxw4PPrgAd/ilIluShSLxyjHGbEinWqvcYaPCmwUwq8eAI6MN7fKJ5RreM5tQhlXIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqAp3HV28uCxTYHCtex8ff3bCSR1XtAN4nU6VEb7wkM=;
 b=veSwSFav0fOMBwMaMOb0hVvkKeO6CbFwJg9BQQLiC8CDqI/jeeZwWek1OU32L/VYgiCpkIcTeZyqqFhJexsgJXBWnM6+7uI9kBKD1ukNeTl5FcmuhQMy5QkAkncbgQNFmSyp4CdMyZP6kOATtvz1eoPAMTJ9yILjnrz4Avlba2A=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
Subject: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible MSR behavior selection
Date: Tue,  9 Mar 2021 11:56:34 +0100
Message-ID: <20210309105634.7200-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0496.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf6ad9f1-c697-449e-cee7-08d8e2ea05c0
X-MS-TrafficTypeDiagnostic: DM5PR03MB2841:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2841125322122DEE048563D98F929@DM5PR03MB2841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUWg2fQOZGGem1QUz7pcCRS9wrEHufDDsEmgAttbL8i4OxcKoRJuGqJRJc/8dlicxDpjGIjXWUGw+SAXJYtRgTdUy9SmRPZODKpF4C5E3z4X2NMoOB1ctqkWLRvfSepPlfvuZC3aKMGuAwKtU+NMeqFGnl1t3p6WVjBwIO/8KNc4UXL3RdbzupJIqfCkLcX7PnwIsFrrNc/VZsHNeyuuFimhi7yLs+A/RK5Q8f8wxqlONaRfPBWW/gmMpDjyoUIBaQv1Q8PEQsLp391bI+Qp1BkCWjYq9JykKvxwyFIUJuC6okWWpD+sEBfYcAiL2Uq4aYAtV/2irniZudtxNJ7WdsG4TRCz0D3TpoPqIl/WalKa0qDMA1UNVJq7tE0G+Pwbrocsuu8Lp99//3Nq92U7zJvuAEkL9++SGO+289TcCIGlvnfc0M6kc1gLHeVOLW9puuAHYfqQtbVYMRx9ZU4BsXjU9tC04Bz9Ny6YjpsTVcTjtS7Je3EN6QqKXDPa/xazsKqPZqR8sFrFAQ4+oT+bZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(478600001)(83380400001)(26005)(6916009)(186003)(16526019)(6666004)(1076003)(30864003)(2616005)(2906002)(956004)(6496006)(5660300002)(8676002)(54906003)(86362001)(316002)(6486002)(4326008)(7416002)(8936002)(36756003)(66946007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NUNXVmNSWnV6NGFwby9rNFEvOHJhREJaUGFxdjNaQURqQ01zcjh6NVpEOGMw?=
 =?utf-8?B?NnVOZzNyRm5yODlKemdma3ZrQy9aTEtBK3hYTHQ0ZUl4VlJWemNNZ1d4b1dE?=
 =?utf-8?B?MEVFZGdEUkpvaVgxSU5EYVZZYVR1MGM2U1lpVnBmNVU5OGQ5Qm9BVUtIenc1?=
 =?utf-8?B?QUhoNGd5WEg1clN6cWlBODEyZ0p6MVkzb0IyZGs4c09HMlQyREZZdVFiMit3?=
 =?utf-8?B?dnBsaVRhZTVKbU5Ta2RoT1pYUXZuTHI2NmRqOXZ3S0xjeVdCMkJ5NzdkcjBL?=
 =?utf-8?B?VVR3WUFMUmg2VVZmcTBjSDlMV2RZZ2VISFhzOEJTVmVEem9VR2pGRThvSUor?=
 =?utf-8?B?aXpRWWVqUWw2K3dmQnd6WDlzNUVrUnlZQ0V2dWRLMnV4TmhRdGZSYU9KUTNZ?=
 =?utf-8?B?ZGhBYzdwc25WYitYTG13T3lrTG5zelJkeTM2Lzk3REUxczRGU255akRJZm42?=
 =?utf-8?B?TVM4QnR6K1o3c3Aybk0vT0FQT3RBZWM2R25Nb2ZjTGJ1M0RDb2JIVncvQTJM?=
 =?utf-8?B?Z1dDZmg4aFBQN2FnZjNHNlU1OGdCUHUwa2JVcjkxWEw0KzlnREFYOU1JdlhG?=
 =?utf-8?B?S0NoeTRwSjM0WFRaZzhhWDFWcU1hVjJMMFRxWW11bG0wYlQwQ3ZweVYzNTFP?=
 =?utf-8?B?bnJMcFlHM1h3bjNsTXNrN3BSQkNkNk05emZPcm9YZFVqcjV0K0M0WHZiWWIz?=
 =?utf-8?B?Y1h2dzFMME9OakZxNldRNVVjdTVyOVRwWGRwTkVaUnIvaWppZHQ0ekhMRXlH?=
 =?utf-8?B?ZWZuRzFLcjF1WUFmUzZDYm40TGZXY3d0ZG44Y0FwZ1NWOXJmUkxuT1h0SnZj?=
 =?utf-8?B?VnNkQW84b0FGcUVyQjZhcGlHbDF1d1F5KytqSWl3b0YyWWtacTNpbU84VFR4?=
 =?utf-8?B?ZDF3UU0xTTc5U0NzVHRkL2pxbHVOZGw0aHpvc0pxUzJVVldCV2xPVW5Yc0lG?=
 =?utf-8?B?Y2doK0hoTjlZa2xLd29kU3JialRZZm5kZWpkaGpqRG1UU2pZU0JyZ2dpWVli?=
 =?utf-8?B?NC9heFdYdUVQbDhkbkkzQ2pQMlR4eWc1WXJLOU5UZlVrMW1vQkF2MlZtd2xl?=
 =?utf-8?B?NGZOWUF5amdCVXRtS0JBSE1GZDgyRDJlbzEyL3JoMU1WUllVOG5VaUZwUlR6?=
 =?utf-8?B?cTRRKzRyY2NNek82M0N4MWsybkpxMmQrVUZnam83MkVjTVVvWFExbWJCSHMx?=
 =?utf-8?B?c2FjWTBPMW1peEFFLzlHNzBnam4rb2lpWTBUT01OWTFiMElQRG5odTVYaWVl?=
 =?utf-8?B?RjdZb0ZNY2s0RGpxNnlKUlcrUzd4RW1nSXdJb0l6SkhabHBPTkFmWllMSXA0?=
 =?utf-8?B?bTNXL1dpdHpaOG9ReEc2M3A0REZDSWxzdkJ4SUNUN2VpYyt3SDBNcEl3N1M1?=
 =?utf-8?B?SVh0MG9jdzhQUVVFaHFzekNUVExMRnBYM3NudWQ3SmwvWXBRK092anoyTWhs?=
 =?utf-8?B?UVhQMHkrR2pBQ2JQNUIzMFlVRWpFZnNSOTR4TmpMQ3BrcXhmOVA2K1ZWWDls?=
 =?utf-8?B?U3c3OHZxT0k5dWI3RlUwVE9ZMUp3RUQrS2l3UHdxL0NrTGJaR016b0dsWFF1?=
 =?utf-8?B?c20xSjlYTXBUSXhobnZYQWxXd1FSdktIWWVuTmZUT2YydHpTVHN6UnhwU3RM?=
 =?utf-8?B?aXUxamVReC9zWnJ1ZWxTbU8yUTRNVmR5K2FIN1ZuTWVjVkJKWUFpalJZYlpI?=
 =?utf-8?B?dFFnME5TeTZhQzBMdjRiMFgzbmZrZzFFR1hVZVRKaHhaT3FZYll1Z0NHRVJm?=
 =?utf-8?B?ZUFIQ2pvWGUzR20rcHBnVU5QZ21aaGE3eXBqRmx1cm5JWVZjRWRiMWtvczdR?=
 =?utf-8?B?QTNUT1NydXh1TExKTTNLQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6ad9f1-c697-449e-cee7-08d8e2ea05c0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 10:56:42.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9wanGOjm2bRpfzms3kbaAn9KM3l3C3qbg9Nhr99am0qdUPUrukHpXPtTDPESCdkL5YpqqON+fiO2W7dCv9Bxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2841
X-OriginatorOrg: citrix.com

Introduce an option to allow selecting a behavior similar to the pre
Xen 4.15 one for accesses to MSRs not explicitly handled. Since commit
84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
handled by Xen result in the injection of a #GP to the guest. This
is a behavior change since previously a #GP was only injected if
accessing the MSR on the real hardware would also trigger a #GP, or if
the attempted to be set bits wouldn't match the hardware values (for
PV).

This seems to be problematic for some guests, so introduce an option
to fallback to this kind of legacy behavior without leaking the
underlying MSR values to the guest.

When the option is set, for both PV and HVM don't inject a #GP to the
guest on MSR read if reading the underlying MSR doesn't result in a
#GP, do the same for writes and simply discard the value to be written
on that case.

Note that for guests restored or migrated from previous Xen versions
the option is enabled by default, in order to keep a compatible
MSR behavior. Such compatibility is done at the libxl layer, to avoid
higher-level toolstacks from having to know the details about this flag.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Boris, could you please test with Solaris to see if this fixes the
issue?
---
Changes since v2:
 - Apply the option to both HVM and PV guest.
 - Handle both reads and writes.
 - Rename to msr_relaxed.
 - Introduce a Xen commnad line option to set it for dom0.
 - Set it unconditionally for guests being restored or migrated from
   previous Xen versions.
 - Provide the option to dom0.
 - Attempt at adding the ocaml helpers (build tested only).

Changes since v1:
 - Only apply the option to HVM guests.
 - Only apply the special handling to MSR reads.
 - Sanitize the newly introduced flags field.
 - Print a warning message when the option is used.
---
 docs/man/xl.cfg.5.pod.in            | 19 +++++++++++++++++++
 docs/misc/xen-command-line.pandoc   | 17 ++++++++++++++++-
 tools/include/libxl.h               |  7 +++++++
 tools/libs/light/libxl_arch.h       |  5 +++++
 tools/libs/light/libxl_arm.c        |  6 ++++++
 tools/libs/light/libxl_create.c     |  7 +++++++
 tools/libs/light/libxl_internal.c   |  3 +++
 tools/libs/light/libxl_types.idl    |  2 ++
 tools/libs/light/libxl_x86.c        | 20 ++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl.ml      |  4 ++++
 tools/ocaml/libs/xc/xenctrl.mli     |  4 ++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 10 ++++++++++
 tools/xl/xl_parse.c                 |  7 +++++++
 xen/arch/x86/dom0_build.c           |  3 +++
 xen/arch/x86/domain.c               |  9 +++++++++
 xen/arch/x86/hvm/svm/svm.c          | 10 ++++++++++
 xen/arch/x86/hvm/vmx/vmx.c          | 10 ++++++++++
 xen/arch/x86/pv/emul-priv-op.c      | 10 ++++++++++
 xen/arch/x86/setup.c                |  1 +
 xen/include/asm-x86/domain.h        |  3 +++
 xen/include/asm-x86/setup.h         |  1 +
 xen/include/public/arch-x86/xen.h   |  8 ++++++++
 22 files changed, 165 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 040374dcd6..72b7927483 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2861,6 +2861,25 @@ No MCA capabilities in above list are enabled.
 
 =back
 
+=item B<msr_relaxed=BOOLEAN>
+
+Select whether to use a relaxed behavior for accesses to MSRs not explicitly
+handled by Xen instead of injecting a #GP to the guest.  Such access mode will
+force Xen to replicate the behavior from the hardware it's currently running
+on in order to decide whether a #GP is injected to the guest for MSR reads.
+Note that the guest is never allowed to read the value of unhandled MSRs, this
+option only changes whether a #GP might be injected or not.  For writes a #GP
+won't be injected as long as reading the underlying MSR doesn't result in a
+#GP.
+
+This option will be removed in future releases once we are certain the default
+MSR access policy has been properly tested by a wide variety of guests.  If you
+need to use this option please send a bug report to
+xen-devel@lists.xenproject.org with the details of the guests you are running
+that require it.
+
+=back
+
 =back
 
 =head1 SEE ALSO
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4737c92bfe..6cf61a5c57 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -740,7 +740,7 @@ Specify the bit width of the DMA heap.
 
 ### dom0
     = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
-                cpuid-faulting=<bool> ]
+                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
 
     Applicability: x86
 
@@ -789,6 +789,21 @@ Controls for how dom0 is constructed on x86 systems.
     restore the pre-4.13 behaviour.  If specifying `no-cpuid-faulting` fixes
     an issue in dom0, please report a bug.
 
+*   msr-relaxed: Select whether to use a relaxed behavior for accesses to MSRs
+    not explicitly handled by Xen instead of injecting a #GP to dom0.
+    Such access mode will force Xen to replicate the behavior from the hardware
+    it's currently running on in order to decide whether a #GP is injected to
+    dom0 for MSR reads.  Note that dom0 is never allowed to read the value of
+    unhandled MSRs, this option only changes whether a #GP might be injected
+    or not.  For writes a #GP won't be injected as long as reading the
+    underlying MSR doesn't result in a #GP.
+
+    This option will be removed in future releases once we are certain the
+    default MSR access policy has been properly tested by a wide variety of
+    guests.  If you need to use this option please send a bug report to
+    xen-devel@lists.xenproject.org with the details of the guests you are
+    running that require it.
+
 ### dom0-iommu
     = List of [ passthrough=<bool>, strict=<bool>, map-inclusive=<bool>,
                 map-reserved=<bool>, none ]
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index a7b673e89d..ae7fe27c1f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -495,6 +495,13 @@
  */
 #define LIBXL_HAVE_VMTRACE_BUF_KB 1
 
+/*
+ * LIBXL_HAVE_X86_MSR_RELAXED indicates the toolstack has support for switching
+ * the MSR access handling in the hypervisor to relaxed mode. This is done by
+ * setting the libxl_domain_build_info arch_x86.msr_relaxed field.
+ */
+#define LIBXL_HAVE_X86_MSR_RELAXED 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index c305d704b1..8527fc5c6c 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -85,6 +85,11 @@ int libxl__arch_extra_memory(libxl__gc *gc,
                              const libxl_domain_build_info *info,
                              uint64_t *out);
 
+_hidden
+void libxl__arch_update_domain_config(libxl__gc *gc,
+                                      libxl_domain_config *dst,
+                                      const libxl_domain_config *src);
+
 #if defined(__i386__) || defined(__x86_64__)
 
 #define LAPIC_BASE_ADDRESS  0xfee00000
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 5e2a209a8b..e2901f13b7 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1222,6 +1222,12 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_update_domain_config(libxl__gc *gc,
+                                      libxl_domain_config *dst,
+                                      const libxl_domain_config *src)
+{
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 46f68da697..1131b2a733 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -2287,6 +2287,13 @@ int libxl_domain_create_restore(libxl_ctx *ctx, libxl_domain_config *d_config,
         unset_disk_colo_restore(d_config);
     }
 
+    /*
+     * When restoring (either from a save file or for a migration domain) set
+     * the MSR relaxed mode for compatibility with older Xen versions if the
+     * option is not set as part of the original configuration.
+     */
+    libxl_defbool_setdefault(&d_config->b_info.arch_x86.msr_relaxed, true);
+
     return do_domain_create(ctx, d_config, domid, restore_fd, send_back_fd,
                             params, ao_how, aop_console_how);
 }
diff --git a/tools/libs/light/libxl_internal.c b/tools/libs/light/libxl_internal.c
index d93a75533f..86556b6113 100644
--- a/tools/libs/light/libxl_internal.c
+++ b/tools/libs/light/libxl_internal.c
@@ -16,6 +16,7 @@
 #include "libxl_osdeps.h" /* must come before any other headers */
 
 #include "libxl_internal.h"
+#include "libxl_arch.h"
 
 void libxl__alloc_failed(libxl_ctx *ctx, const char *func,
                          size_t nmemb, size_t size) {
@@ -594,6 +595,8 @@ void libxl__update_domain_configuration(libxl__gc *gc,
 
     /* video ram */
     dst->b_info.video_memkb = src->b_info.video_memkb;
+
+    libxl__arch_update_domain_config(gc, dst, src);
 }
 
 static void ev_slowlock_init_internal(libxl__ev_slowlock *lock,
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 5b85a7419f..f45adddab0 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -644,6 +644,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
                               ])),
+    ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
+                              ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 58187ed760..1656f2c730 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -19,6 +19,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         abort();
     }
 
+    config->arch.domain_flags = 0;
+    if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
+        config->arch.domain_flags |= XEN_X86_MSR_RELAXED;
+
     return 0;
 }
 
@@ -809,6 +813,7 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
                                               libxl_domain_build_info *b_info)
 {
     libxl_defbool_setdefault(&b_info->acpi, true);
+    libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
 }
 
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
@@ -851,6 +856,21 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_update_domain_config(libxl__gc *gc,
+                                      libxl_domain_config *dst,
+                                      const libxl_domain_config *src)
+{
+    /*
+     * Force MSR relaxed to be set (either to true or false) so it's part of
+     * the domain configuration when saving or performing a live-migration.
+     *
+     * Doing so allows the recovery side to figure out whether the flag should
+     * be set to true in order to keep backwards compatibility with already
+     * started domains.
+     */
+    libxl_defbool_setdefault(&dst->b_info.arch_x86.msr_relaxed,
+                    libxl_defbool_val(src->b_info.arch_x86.msr_relaxed));
+}
 
 /*
  * Local variables:
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index a02e26b27f..4789e42e91 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -48,9 +48,13 @@ type x86_arch_emulation_flags =
 	| X86_EMU_USE_PIRQ
 	| X86_EMU_VPCI
 
+type x86_arch_domain_flags =
+	| X86_MSR_RELAXED
+
 type xen_x86_arch_domainconfig =
 {
 	emulation_flags: x86_arch_emulation_flags list;
+	domain_flags: x86_arch_domain_flags list;
 }
 
 type arch_domainconfig =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index d2a312e273..566c12cb26 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -42,8 +42,12 @@ type x86_arch_emulation_flags =
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI
 
+type x86_arch_domain_flags =
+  | X86_MSR_RELAXED
+
 type xen_x86_arch_domainconfig = {
   emulation_flags: x86_arch_emulation_flags list;
+  domain_flags: x86_arch_domain_flags list;
 }
 
 type arch_domainconfig =
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 9a8dbe5579..2f658a6418 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -233,6 +233,16 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 
 #undef VAL_EMUL_FLAGS
 
+#define VAL_DOMAIN_FLAGS        Field(arch_domconfig, 1)
+
+		cfg.arch.domain_flags = ocaml_list_to_c_bitmap
+			/* ! x86_arch_domain_flags X86_ none */
+			/* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
+
+			(VAL_DOMAIN_FLAGS);
+
+#undef VAL_DOMAIN_FLAGS
+
 #else
 		caml_failwith("Unhandled: x86");
 #endif
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1893cfc086..9fb0791429 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2741,6 +2741,13 @@ skip_usbdev:
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
                         &c_info->xend_suspend_evtchn_compat, 0);
 
+    if (!xlu_cfg_get_defbool(config, "msr_relaxed",
+                             &b_info->arch_x86.msr_relaxed, 0))
+            fprintf(stderr,
+                    "WARNING: msr_relaxed will be removed in future versions.\n"
+                    "If it fixes an issue you are having please report to "
+                    "xen-devel@lists.xenproject.org.\n");
+
     xlu_cfg_destroy(config);
 }
 
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0ce29e91a3..74b443e509 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -256,6 +256,7 @@ bool __initdata opt_dom0_shadow;
 #endif
 bool __initdata opt_dom0_pvh = !IS_ENABLED(CONFIG_PV);
 bool __initdata opt_dom0_verbose = IS_ENABLED(CONFIG_VERBOSE_DEBUG);
+bool __initdata opt_dom0_msr_relaxed;
 
 static int __init parse_dom0_param(const char *s)
 {
@@ -282,6 +283,8 @@ static int __init parse_dom0_param(const char *s)
         else if ( IS_ENABLED(CONFIG_PV) &&
                   (val = parse_boolean("cpuid-faulting", s, ss)) >= 0 )
             opt_dom0_cpuid_faulting = val;
+        else if ( (val = parse_boolean("msr-relaxed", s, ss)) >= 0 )
+            opt_dom0_msr_relaxed = val;
         else
             rc = -EINVAL;
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 5e3c94d3fa..86e5b506ce 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -683,6 +683,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
+    if ( config->arch.domain_flags & ~XEN_X86_MSR_RELAXED )
+    {
+        dprintk(XENLOG_INFO, "Invalid arch domain flags %#x\n",
+                config->arch.domain_flags);
+        return -EINVAL;
+    }
+
     return 0;
 }
 
@@ -852,6 +859,8 @@ int arch_domain_create(struct domain *d,
 
     domain_cpu_policy_changed(d);
 
+    d->arch.msr_relaxed = config->arch.domain_flags & XEN_X86_MSR_RELAXED;
+
     return 0;
 
  fail:
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b819897a4a..4585efe1f8 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1795,6 +1795,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     const struct domain *d = v->domain;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
+    uint64_t tmp;
 
     switch ( msr )
     {
@@ -1965,6 +1966,12 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         break;
 
     default:
+        if ( d->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
+        {
+            *msr_content = 0;
+            break;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gpf;
     }
@@ -2151,6 +2158,9 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         break;
 
     default:
+        if ( d->arch.msr_relaxed && !rdmsr_safe(msr, msr_content) )
+            break;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  msr, msr_content);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index bfea1b0f8a..b52824677e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3123,6 +3123,7 @@ static int is_last_branch_msr(u32 ecx)
 static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *curr = current;
+    uint64_t tmp;
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x", msr);
 
@@ -3204,6 +3205,12 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             break;
         }
 
+        if ( curr->domain->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
+        {
+            *msr_content = 0;
+            break;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gp_fault;
     }
@@ -3505,6 +3512,9 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
              is_last_branch_msr(msr) )
             break;
 
+        if ( v->domain->arch.msr_relaxed && !rdmsr_safe(msr, msr_content) )
+            break;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  msr, msr_content);
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index e5a22b9347..74e71403ff 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -875,6 +875,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
     const struct domain *currd = curr->domain;
     const struct cpuid_policy *cp = currd->arch.cpuid;
     bool vpmu_msr = false;
+    uint64_t tmp;
     int ret;
 
     if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
@@ -986,6 +987,12 @@ static int read_msr(unsigned int reg, uint64_t *val,
         }
         /* fall through */
     default:
+        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, tmp) )
+        {
+            *val = 0;
+            return X86EMUL_OKAY;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
         break;
 
@@ -1148,6 +1155,9 @@ static int write_msr(unsigned int reg, uint64_t val,
         }
         /* fall through */
     default:
+        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, val) )
+            return X86EMUL_OKAY;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  reg, val);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 23bbb6e8c1..d217c223b0 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -749,6 +749,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
         .max_vcpus = dom0_max_vcpus(),
+        .arch.domain_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
     };
     struct domain *d;
     char *cmdline;
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 3900d7b48b..7213d184b0 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -437,6 +437,9 @@ struct arch_domain
     /* Mem_access emulation control */
     bool_t mem_access_emulate_each_rep;
 
+    /* Don't unconditionally inject #GP for unhandled MSRs. */
+    bool msr_relaxed;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/include/asm-x86/setup.h b/xen/include/asm-x86/setup.h
index 642a5e8460..24be46115d 100644
--- a/xen/include/asm-x86/setup.h
+++ b/xen/include/asm-x86/setup.h
@@ -65,6 +65,7 @@ extern bool opt_dom0_shadow;
 extern bool opt_dom0_pvh;
 extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
+extern bool opt_dom0_msr_relaxed;
 
 #define max_init_domid (0)
 
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 629cb2ba40..f9d0e33b94 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -304,6 +304,14 @@ struct xen_arch_domainconfig {
                                      XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
                                      XEN_X86_EMU_VPCI)
     uint32_t emulation_flags;
+
+/*
+ * Select whether to use a relaxed behavior for accesses to MSRs not explicitly
+ * handled by Xen instead of injecting a #GP to the guest. Note this option
+ * doesn't allow the guest to read or write to the underlying MSR.
+ */
+#define XEN_X86_MSR_RELAXED (1u << 0)
+    uint32_t domain_flags;
 };
 
 /* Location of online VCPU bitmap. */
-- 
2.30.1


