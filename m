Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7501A3340E5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 15:58:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96162.181692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0Hi-0004fP-OZ; Wed, 10 Mar 2021 14:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96162.181692; Wed, 10 Mar 2021 14:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0Hi-0004ez-Kh; Wed, 10 Mar 2021 14:58:02 +0000
Received: by outflank-mailman (input) for mailman id 96162;
 Wed, 10 Mar 2021 14:58:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfCg=II=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lK0Hg-0004eu-AW
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 14:58:00 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d0a4aba-b078-4f67-8c49-6751fc07056d;
 Wed, 10 Mar 2021 14:57:57 +0000 (UTC)
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
X-Inumbo-ID: 5d0a4aba-b078-4f67-8c49-6751fc07056d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615388277;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=4nMsvboqKdWWSmRA52cQ6+vWf67vuT3NwByJv3JcYk0=;
  b=dad1Y6rAKgHWY4uvse+kmhlqwNx412Z1PzOHq6tr+LHEU62F2YfqYNxU
   NEGnqFaxA4/TbtoLmOnfh1M3FRkwJ6M5GKrQOGuTCeCKOG+B8uGhXD27D
   Qk06PLutenmIM7maksYmErksUbYzMDfuOTtVurP5Rnuw1Iy0MRRKAvD9M
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fs6RWvyVOEZKbBuJiKmDd6WMfPz/I2ZqNmy50M0RuCOY3bKk+RnlATWInZk7qhKI+8XI56FICq
 c0Ic56oFl9IWaw/15GHIXS3yfgSdHy93lc7e23IssnXTgMzR4p1Q1lZTTegtHXgr5+XhwLZEtQ
 4GYT/ppTYrT3CK/tpTYFtFPyPRCUUX3g9u3/XZgeYQGJu27j2/9GC+D5C3b7fzxcJ+PtiTqZ78
 MfZzzCkIkaROsdmmJKCBr6uGtn8V7mBMEIbLYr+2TYF6HTMOUzhm5WfB+KyXCKaXNYCWUggjOp
 rPk=
X-SBRS: 5.2
X-MesageID: 38872585
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zqy7e6rZx/X1nsjhtPEC+E8aV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.81,237,1610427600"; 
   d="scan'208,223";a="38872585"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O06zGy5SgFnCJgLjOOgSnim+yNykOoDrMWVQkmSsGcS+fP02FnXJ3IN8W7RdsQsAUA4wPi2Lb5mgIrI7dCbte1FnSAC/6IQ4Dkbc5YmyHzQR0MAyIeBLpwjJ3CzHz8NvuSw8ZFheT71jvFH/ghJ/AVwcmSPPo/buDkEcAtO+UVoV1KIeTOP1eSJpegXCI/zfR1Bo03955T/2oYNb+g/G4W96IWKRfvkucCi+jFeugn1M493KsUoY1HE8QGMnN/uGni0C88etr9S8AeA00RAJVs2SnQpWLyMYNbcFlgg+hkCuvfTmyTiPch/QCsAZeM8AkQYYnCez1wsBGUX/XAqh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwShmI2TmKE7lBcmbu0IcWjuophqoO1gHU2oUZDU7Z8=;
 b=YE53sUfXvTeCpEB6DgpuRB8e5uaNafJ3B+bjrme94FDriIX3d6yPa9FVPmYFSWiooMGtAMJYbOydx+DTpkdh6CLOW5hf8NNSGCks+dfMEZdFyfJl85VThtaQCuly+Emwj3azf9/48QYO/rll7HKkPPQpcL+Nlv70mPd/SHrZ1of9UhjFhxA+rVFeYAygQ+7HiRokfiW6dFSJ+UKCE0IojGRK4Kv5o2ryCyZWuuLu9hOb166m0J2SwU8wZkjExmGkkCll4NUUXk4o0W8A6ynlniAExH4vF2EXQOVuKLjU/o+rNEjjraDr0VVxigbBO4sh6YiUAKAGSPFmNKdfYil9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwShmI2TmKE7lBcmbu0IcWjuophqoO1gHU2oUZDU7Z8=;
 b=qgM1vYixnkhqwcGMsT0UHpDv+fvXlmV9dayzycj3thxT7zVChNwlmVde2I1DzGq2uofcMQx3xbNpRbtZBFGNm5d5m/j/NwvnLDzrEbd3mhaPXQKatYwc3fIpb7bEc7rzsRmiXi8YS8smLR6O1B4M2MMuCt0/yS6MhDRWKCCq7DE=
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
Date: Wed, 10 Mar 2021 15:57:30 +0100
Message-ID: <20210310145730.27951-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0444.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55ba6e0d-329c-406c-9b14-08d8e3d4dd2b
X-MS-TrafficTypeDiagnostic: DM5PR03MB2777:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB277776D699238EEDE4B7EB4A8F919@DM5PR03MB2777.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YPjI3dL7q49/oxcZ4GsOGTKi49ZpcvSm4vC0lim5CrVJshPSL7X/zTex7FDP6H4F1h2pEbLJpv+DlVgrYSXUO3FoQQNIcGuLVLUGMNUGnKDaUUg8vobac/i5hW650lZjKMvIUHITsWBspWH3QnsDsCUOKuyF6bQrqy8IQHtFy5Vm18IHFJYu3qxWoUPE8NJVRtAwCX7gIMykNIP+SDab1yuo/QYT2G4qYQPNU/IUY9ICXT2fl5IjmAGCuuly/vc2df4wcEHxmMr5xr0PyUXNUjFw4XBzJVSc+yGRAcaAEs8/z184by5vutl6zCkdWki07r0pYotdApPaY83er2sviFvkOBW4RrEBbfVt5xyxx340l78afUAYtaA3U4m81XnEZ0XJKr3d4voGnefX3oUgbqzwTouV2H78gwID6+Hh8HXwshmLlKsRCxX3ZkeC611bF2XqNK+j3AsbfP3BHacL3p4Oysn30H9EnCjCmBQmEaFrX+oLF0+7A4I1ZGiHUBNezGyD0dzimDRkV8Yfks/KRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(316002)(478600001)(54906003)(6666004)(2616005)(6496006)(7416002)(956004)(6916009)(26005)(36756003)(86362001)(83380400001)(186003)(16526019)(6486002)(1076003)(30864003)(66476007)(66946007)(8936002)(4326008)(2906002)(8676002)(66556008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UnA0c0FMZDZHbm41MWYvZVExblNid3FsQmtmWkpMb2Jsc1hjdy9lQ2FacURy?=
 =?utf-8?B?OVE0TEZxbWZZdFczOUxvVzVuNW1uRC9OMGNlU2xhb0dkbE53Z3FUY2Z0a1Fq?=
 =?utf-8?B?Zjl5OG9MMXY2VHprRTZDajhXenVjYVlkK25tY2Yzb3ZSWnJ0dXFsajVsSHNy?=
 =?utf-8?B?R3loZE9pVXM3QXR5RTNoaUpXb3QrbUpCdkI2Ykc3U1YvNFFRSU41NjZsRVBP?=
 =?utf-8?B?dGRaYTVKZWd5SFRjalF5dUgwYWVOVnRZTmt6WnhCK2VSdi9PcmhpRGRyVDc3?=
 =?utf-8?B?bFp1UmlFcFV6Y2NtcWcybUlXNklmem9Ba3NscnY2MlN6K3NkeW5YS2w3TUZQ?=
 =?utf-8?B?OExUTEQ5SE81a3ZrSUFpQXJNaDJ6LytiNU5mRG85Ulh5OTEwczVTa1l2VEU1?=
 =?utf-8?B?UnlPbGNRQUNzVUE1elBidFlSQ3dFQ2RlZWt1c3NlcER6UklXZ085ZUxGWURB?=
 =?utf-8?B?NWxkemRSVjY3MkVjODNHSmQ3UEl6dHRBMWYrNDJVcTY2cExZa1h6TG1Icm9j?=
 =?utf-8?B?OTlHTlpiWTc5RXZxRllRVk45UVY1UlFLdHN0am5wT05ua0ZSR2krNU56eE12?=
 =?utf-8?B?OHpnQ1ljMjM3MGFvZ3NhS1U4N1VYdUpDUEl6SWwvUCtIc1J4c2p5MzFkdmFG?=
 =?utf-8?B?amR4WnhCMmdTclJJSGJRQzY2ajI3SWRPQmc2N25qb1FDQ3dnNk96NGd6dzEv?=
 =?utf-8?B?WjNYV1dad2xCa3c3dmpKWC80czBTWmNNckFIRkFDV3NuS2hsYTZmQ0o0blVj?=
 =?utf-8?B?WGpudWgySjBpQmJkMDNrSFpIYU5USDR2ZFlwQVhxUmdQWWwyTE1JeU1SR0g0?=
 =?utf-8?B?Uk9QblJlSnM0RmZ3WFMvMkVsK0ZsaTJTMjluQkh1REJFUzVDcnZaaTdwc0tz?=
 =?utf-8?B?UVZibUMwdEhTSWJBc0JKaHQyL0xsNGNCUFRiSnB1M1o3Sk5OWDJrVlFPZUVT?=
 =?utf-8?B?NWk5amZSbHoyNFQ2UWhUT2NNK2lNcFpuUDIyL2JzZDBjbEovbXdzazlTTjNm?=
 =?utf-8?B?TEZmYUxhbEJMWXBML0xFOGRkNFBSbmJLZ2RoODM1UXNqcVcrLy9wa2doQWJz?=
 =?utf-8?B?WW1GZjd0a3VaZU10eUIzTDRYVFVDUjZIWjZIWmFTL3BZY0o5NWhyMk5yb21U?=
 =?utf-8?B?cFZ2ZVQ1U0ZVbVYyK3ZhZVJuZTR5cXBhMTV2L2pZTjNMcDFtZURadG1TcHVU?=
 =?utf-8?B?NDlaY3AxVWNYNDRLdzhTeVZJOUJ3dnJvaU15RGhRT1RBNzdXbGRIM1FxY2p4?=
 =?utf-8?B?UTdUL05XZm8rS0VHV0k1b1kwY2c0NzJ3WEhNYlNSL05XUnFXdDU5YnhnRDVJ?=
 =?utf-8?B?TGxjd0FabVFLUHhrSVRJZVZVM2kvM2VBTk1QR2hxSEIraXJBMnBvcXJ0bWEy?=
 =?utf-8?B?dnVuUmJRMjBYSVlnd2l2b3hSdHdqVmt2d093TEJkbzlUdm5JWmJkSnRvYis2?=
 =?utf-8?B?dWVKalZxZ29seWgydFlvYlpnaktlYUduWWgvUHVJWlNSM2xURlFVaDh0M3Bt?=
 =?utf-8?B?RnJrTjcwSVRwb2RacmJ4bHRXRTE1UlArYitsMjMwYzlMdE82N3l2S21WK0Zv?=
 =?utf-8?B?WW1DL2NyUmV2TW50VHNycEVVa0s4VlRycjk3aDllYy9qS2hiU2F1YzhMaXVa?=
 =?utf-8?B?Zi93Z2RnNlBDNEJvTEppY2tVTTdreUtzcjdtVEhBajFuMHZnYndtQVMzdEl0?=
 =?utf-8?B?UXpzam50VHNlOWFXaXFNMTM3QjN2QytYQWFYbHlBeFoyUmdQUVM3OEhTUDNz?=
 =?utf-8?Q?fHaBLH2/Jcefr/hIcFpnmEQ3LEXGwM/D2QrEDBe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ba6e0d-329c-406c-9b14-08d8e3d4dd2b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 14:57:45.8299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1pn6HOCB1907cdgozPmy/Tzc68yk2LOdoH9MTV+SzpulwRa5M3gSEC7qR7644ea6oPXMdPeBxBnJ4ophCiW2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2777
X-OriginatorOrg: citrix.com

Introduce an option to allow selecting a behavior similar to the pre
Xen 4.15 one for accesses to MSRs not explicitly handled. Since commit
84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
handled by Xen result in the injection of a #GP to the guest. This
is a behavior change since previously a #GP was only injected if
accessing the MSR on the real hardware would also trigger a #GP, or if
the attempted to be set bits wouldn't match the hardware values (for
PV). The reasons for not leaking hardware MSR values and injecting a
#GP are fully valid, so the solution proposed here should be
considered a temporary workaround until all the required MSRs are
properly handled.

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
Acked-by: Christian Lindig <christian.lindig@citrix.com>
Reviewed-by: Ian Jackson <iwj@xenproject.org>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Boris, could you please test with Solaris to see if this fixes the
issue?

From a release PoV there are risks of taking this patch, as it touches
several different areas. So it could break MSR handling or domain
creation. I think however we would be able to spot such breakages in
osstest.

Not taking the patch would put us in an awkward position if people
migrating from < 4.15 find their guests no longer boot (or crash on
migration) on newer Xen versions, hence I think we need to accept the
risk.
---
Changes since v3:
 - Slightly adjust commit message.
 - Change the description of the option.
 - s/domain_flags/misc_flags/.
 - Adjust setting of misc_flags in create_dom0.

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
 docs/man/xl.cfg.5.pod.in            | 16 ++++++++++++++++
 docs/misc/xen-command-line.pandoc   | 14 +++++++++++++-
 tools/include/libxl.h               |  7 +++++++
 tools/libs/light/libxl_arch.h       |  5 +++++
 tools/libs/light/libxl_arm.c        |  6 ++++++
 tools/libs/light/libxl_create.c     |  7 +++++++
 tools/libs/light/libxl_internal.c   |  3 +++
 tools/libs/light/libxl_types.idl    |  2 ++
 tools/libs/light/libxl_x86.c        | 20 ++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl.ml      |  4 ++++
 tools/ocaml/libs/xc/xenctrl.mli     |  4 ++++
 tools/ocaml/libs/xc/xenctrl_stubs.c |  9 +++++++++
 tools/xl/xl_parse.c                 |  7 +++++++
 xen/arch/x86/dom0_build.c           |  3 +++
 xen/arch/x86/domain.c               |  9 +++++++++
 xen/arch/x86/hvm/svm/svm.c          | 10 ++++++++++
 xen/arch/x86/hvm/vmx/vmx.c          | 10 ++++++++++
 xen/arch/x86/pv/emul-priv-op.c      | 10 ++++++++++
 xen/arch/x86/setup.c                |  3 +++
 xen/include/asm-x86/domain.h        |  3 +++
 xen/include/asm-x86/setup.h         |  1 +
 xen/include/public/arch-x86/xen.h   |  8 ++++++++
 22 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 040374dcd6..ae084252e0 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2861,6 +2861,22 @@ No MCA capabilities in above list are enabled.
 
 =back
 
+=item B<msr_relaxed=BOOLEAN>
+
+The "msr_relaxed" boolean is an interim option, and defaults to false.
+
+In Xen 4.15, the default behaviour for unhandled MSRs has been changed,
+to avoid leaking host data into guests, and to avoid breaking guest
+logic which uses #GP probing to identify the availability of MSRs.
+
+However, this new stricter behaviour has the possibility to break
+guests, and a more 4.14-like behaviour can be selected by setting this
+option.
+
+If using this option is necessary to fix an issue, please report a bug.
+
+=back
+
 =back
 
 =head1 SEE ALSO
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4737c92bfe..a0601ff838 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -740,7 +740,7 @@ Specify the bit width of the DMA heap.
 
 ### dom0
     = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
-                cpuid-faulting=<bool> ]
+                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
 
     Applicability: x86
 
@@ -789,6 +789,18 @@ Controls for how dom0 is constructed on x86 systems.
     restore the pre-4.13 behaviour.  If specifying `no-cpuid-faulting` fixes
     an issue in dom0, please report a bug.
 
+*   The `msr-relaxed` boolean is an interim option, and defaults to false.
+
+    In Xen 4.15, the default behaviour for unhandled MSRs has been changed,
+    to avoid leaking host data into guests, and to avoid breaking guest
+    logic which uses \#GP probing to identify the availability of MSRs.
+
+    However, this new stricter behaviour has the possibility to break
+    guests, and a more 4.14-like behaviour can be selected by specifying
+    `dom0=msr-relaxed`.
+
+    If using this option is necessary to fix an issue, please report a bug.
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
index 58187ed760..ac09897a63 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -19,6 +19,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         abort();
     }
 
+    config->arch.misc_flags = 0;
+    if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
+        config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
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
index a02e26b27f..a5588c643f 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -48,9 +48,13 @@ type x86_arch_emulation_flags =
 	| X86_EMU_USE_PIRQ
 	| X86_EMU_VPCI
 
+type x86_arch_misc_flags =
+	| X86_MSR_RELAXED
+
 type xen_x86_arch_domainconfig =
 {
 	emulation_flags: x86_arch_emulation_flags list;
+	misc_flags: x86_arch_misc_flags list;
 }
 
 type arch_domainconfig =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index d2a312e273..6e94940a8a 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -42,8 +42,12 @@ type x86_arch_emulation_flags =
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI
 
+type x86_arch_misc_flags =
+  | X86_MSR_RELAXED
+
 type xen_x86_arch_domainconfig = {
   emulation_flags: x86_arch_emulation_flags list;
+  misc_flags: x86_arch_misc_flags list;
 }
 
 type arch_domainconfig =
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 9a8dbe5579..6d0d7dfd5e 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -233,6 +233,15 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 
 #undef VAL_EMUL_FLAGS
 
+#define VAL_MISC_FLAGS        Field(arch_domconfig, 1)
+
+		cfg.arch.misc_flags = ocaml_list_to_c_bitmap
+			/* ! x86_arch_misc_flags X86_ none */
+			/* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
+			(VAL_MISC_FLAGS);
+
+#undef VAL_MISC_FLAGS
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
index 5e3c94d3fa..b212729880 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -683,6 +683,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
+    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
+    {
+        dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
+                config->arch.misc_flags);
+        return -EINVAL;
+    }
+
     return 0;
 }
 
@@ -852,6 +859,8 @@ int arch_domain_create(struct domain *d,
 
     domain_cpu_policy_changed(d);
 
+    d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
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
index 23bbb6e8c1..68454df8ed 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -749,6 +749,9 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
         .max_vcpus = dom0_max_vcpus(),
+        .arch = {
+            .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
+        },
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
index 629cb2ba40..6bf1e8cccb 100644
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
+    uint32_t misc_flags;
 };
 
 /* Location of online VCPU bitmap. */
-- 
2.30.1


