Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBF334FE1F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:36:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103829.198011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCN-0004Y4-Fs; Wed, 31 Mar 2021 10:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103829.198011; Wed, 31 Mar 2021 10:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCN-0004Xf-Cu; Wed, 31 Mar 2021 10:35:43 +0000
Received: by outflank-mailman (input) for mailman id 103829;
 Wed, 31 Mar 2021 10:35:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYCL-0004XZ-BR
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:35:41 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b5e75a1-b357-4113-91e5-f4aa7e3306d6;
 Wed, 31 Mar 2021 10:35:40 +0000 (UTC)
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
X-Inumbo-ID: 8b5e75a1-b357-4113-91e5-f4aa7e3306d6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617186940;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=lXblGJuTWXkI6+BzR09qzE74qpS68r0DGSrFHambnJc=;
  b=aIfBtvwGeD1Req2y3jjdAcDSw4w5hDRZELcot/K8SYKYz0NWg+S9b4uj
   Ocdm0x/qMPBuZnMtHmFIC/apxyAAMVnc0kwEoI06xOp2C3kmtZGS9Uxvf
   MvLRBk0MXto+gJUM6Lm0PgW6liOEKWgbfTp806vZ/Mhes7xUucyF6KoYl
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NbvWk5CaU+ZTzThIwBlND9TovZdaEiHDNfJRP/OM6osZi0ynmbZ2YjvQk7L6MqhQx9MNWtvTlw
 pxoagTdwNdtnzNeGVeJ8VCC0DT4o5KmG8BxirZDAsIzrFSfoyt5MY82YPlpmM3COdWXoL+t+5Y
 3si7uh/8DeOp7ykzsAfEE9QKvxQG3YfJcoOtVDeppbMyEJhBWaklVYdPsKwKtIjq93xNrBpcqw
 oe0zk30p6SAq5J3fccjFf5EEd4mR1jTtINkpsmqk2pkHDl+iBd6JU1GeO+/ykhsuDNDmy+IZZR
 u7E=
X-SBRS: 5.2
X-MesageID: 40415641
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NtJ0oaFWq0EWyM6TpLqFMpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrR3TA+ZlppbQAJLvKZniChEKEDqFHqbHjzTrpBjHk+odmv5
 tIXqBiBLTLYmRSot395GCDfeoI5Pmi3OSWifzFz3FrJDsaCZ1IywtiEA6UHglXaWB9ZaYRL5
 aX6spZqzfIQx1+AviTPXUZQ/PF4+TCiZOOW3U7LiQ64wqDhy7A0s+YLzGk2H4lMg9n8PMZ3k
 Xu1yf44aiitP/T8G6n60bjq654tfGk5t9KBMmngtUYJDP2mm+TFflccozHhh8ZiqWC70srjc
 ntrn4bTrhOwkKURE6Zi1/M3BTtyzkn4XOK8y7mvVLT5fbXaRh/Lugpv/M8TjLpr3AOkfs57Y
 dwm0WejJZTBQOoplWE2/H4EytEu2DxnWAvioco/htieLpbUpB9h6oF8nhYFZ8RdRiKk7wPIa
 1VAMbQ6O0+SyL9U1np+m1mwNmbVn8uBBuxQk8bpsyP0zRN9UoJtncl+A==
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40415641"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3xwStePB3EOcI+Ob3u5/H0pd7o2fee7nqKiC/XU8syvXuK6dD5brIPPly3f2++n9p+J9bCA+X0YzeI50QE8IFzT1/93n+bL3CrwqMG/KRkyAgdChP76dNyJZ6il8QCgwXB4Kk4JaPcL1XZquurQ5KU6GpmYdfx61qTN+wvohFxuGxeGPJO5v2kS1Uc1yDBQ2LJ1ik865sZXx5FAMpJEVNy0DMo1pa7UjS7i24M06eHLNrGm8pTXgtArRVLmVH0v8ZdLEw3+/wOA+lF4Ml9UuWVJBlovCkRAcqJHcr1dCw5wuTScRj56G5GPlGFQLVhC66dNAV4GE/J68Tcbc1SwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5uDutd4OrUzZF9dpiK3BecJLbNCTSNgtYFMzSQYNMk=;
 b=fn1w84bu9urHhZPeRT/7Z+OhoB7kUz4AEXF/MCr3B+S7QUglCo8Md8xMEmlzbfNS6lytwhdMsHqTXIaz/z88LD9W4sIXB0MXvAMy2/9WDVJ3n0W7MXcD7WCYieN0X3mKXoSnKKioM7XCt/eP0OnPW/xh8YEMY+/7BstvAA4XCQoczUU65qymuitoG74wknN0Tccp8nSdgb4/h+aLHplHHAySBMUDnCEOMYljMQAy9o30FBPyLD1qE0UAb1Y2487TksBH4dwuClX8WLvOoOFU9wFFPMTytNG/A76EI5A5kpEbv6hj9ZJlkbbkYBcGteHVld8NHt0PO7P1Nadet3Csow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5uDutd4OrUzZF9dpiK3BecJLbNCTSNgtYFMzSQYNMk=;
 b=YgSqCHGhCtI5g4I67Y83LyA47HV8r/FvwQAMB36KCemNwN3qHaXj9YIbjQqKLOQ3pQYLjmjCrHe0wMDXTQvUFfYl9miN3GL9B+cG3fE/hkbUv4StLTozDeOprEDZ3leHlir8GUqOPE8QfzH2z33NNaVVSo3TJG2ad3p/w+WFSUI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH v3 00/11] x86/intr: introduce EOI callbacks and fix vPT
Date: Wed, 31 Mar 2021 12:32:52 +0200
Message-ID: <20210331103303.79705-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 524e110e-4121-407f-dd59-08d8f430b83f
X-MS-TrafficTypeDiagnostic: DM5PR03MB2777:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2777995DB746EBB824030B6C8F7C9@DM5PR03MB2777.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wjwNH9xCrrZJnCYbGU3HPWlLBn/HzHGLXPY2sqmoVzo1D32w+CE+GeAY7w84HNNmZg3cW1IJmlKKlhAQXgeXNyNP9YyztfpS8I5QtFDhub+pSZG1KgrXE89pv55SL8ZTssnlPi/QHIhC36ckUyuG/6zFQfhHDtIo8uE1XQBJsuFoX29IUMIHZCfW3arqs9VWaPSSqZxdumIMBi1vMurrr/8FemdbQDs5lB2DQk3kB1a6GQQUbw4eoBK/8qPFziSCB5Wv7dttk65MtOEqdIQ6lEwI5fyNKXIKsJVDbFIYZoRKWMVMbVcjXxBcppytJVRsbuDMwdJwlYGfCsMOD3dN7sfIgmDkIsyO6ZkOss961R6tAioyGoqXI5DSAI2EpDVMf1UKdTeDJT+S3zq6UtUlrRFWku4dRWQ9m+IeJOLijo18AbNOJG7XVxB12kgm4EVAXoAfJkwbAaF1QUhSPmzCGExJLLmb+m3W2JP98vYIgqDSAcckUdihjb7QXiPsBV6FWmr+cp3MTw3wmMC5z+mEPBvcWxcS5iGdiYWfYXUddSAyC4Pz3hMeXns8fbqe2eG3v+8EsQ7rZkAKFKNCLFn0Ly31lw+xaqfP6DTs3YYKLgLm1tY8i008kwO8V9nlJ/fHxMHsCgxE7HOLDmymCMOhaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(5660300002)(186003)(66476007)(16526019)(26005)(6486002)(8676002)(36756003)(86362001)(83380400001)(38100700001)(8936002)(956004)(54906003)(1076003)(6916009)(2906002)(4326008)(316002)(2616005)(66946007)(6666004)(66556008)(478600001)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VVBNZUJQSVJWQU5mTFlaNmoxblMzS2Q4ano0K3JsSVc0MllBaHBZOFdiaFRm?=
 =?utf-8?B?V3R4NkVVeTQzZ2FuVXRUbjNQcE1FOTBaL2ZQNnFaZDc4ZnI0Y2l0eUphYkVk?=
 =?utf-8?B?VjZIVFRYTEROOE5tSXcvTGo3NjJSL3lQbVFWZ2lCczJHc2o5WnRaRm1FRDZM?=
 =?utf-8?B?MWVRUDJsazNDdEdhNXRMbWI2MGM5R3BaUEhsTjJQcHpkQTNPaEhDNWcwaTc2?=
 =?utf-8?B?MEZvOXNnbGRQc0VpaE1vQ21Qd0h1NkRpWitLbHlkUnpra0E1WExleFBVT2s0?=
 =?utf-8?B?eXNyb0VNcUJtVGgwaFdWWmU2RTYzTEhlWjgrenVvZFRNVFdmYmxXbzlocWF2?=
 =?utf-8?B?NExtVjZIb1AyNElzN1FORTg4MEdPRkt4T2FYTDl4YlZ2SG5Ba3BMSlk2UktU?=
 =?utf-8?B?RUZDWXhmWUUzSHdiMFJ3dEFvWUdweDZ0ZEJsYTEyeTdwR3p0SVAvVjZOUjF3?=
 =?utf-8?B?bVFQa1FpTUxkNXlCbjFSVHZOTldDTnhXd241emE3NGMvYTRYS0Y4ZUJZNER2?=
 =?utf-8?B?Nk02dWlDTHFNdFpaRmIxenM0elc4SVhRM2FoMDJXdXh4WmFxL0N5RkRaR1ZO?=
 =?utf-8?B?YU5jTlJxV1ZoWDk0aHlMLzFzbUFzaFg3aXlkYjhkdFNEL2RUY1Z2a0FmNUhP?=
 =?utf-8?B?YklyU0dyRE14bUtCemNEMGQvRWtEMzF3TWJhYTU2Q0xYdlR5bmZyRXVSNFE4?=
 =?utf-8?B?Y1VCOXJUSGduNHdYVm12cGxNQ21hWCszQ1NkelNmR2lHRUlGNzcxUHRlNWRl?=
 =?utf-8?B?dEx0QlZwZWJ4RGZOaTkzUFRENWE5MkVWM3d2bHQ4a3ErckxqVWhzSzA1c242?=
 =?utf-8?B?NW50UmhKOWxsdzhJVzJ2T3Nsa3R2S2pOYzhHZTJDSmVHN2dqWDEzMDBpeUN1?=
 =?utf-8?B?UUtEWVlScFNXdW1nUXJHOWZKUy9US04zSWtVaEw3V1NUZDNicEcrVmhnU3J0?=
 =?utf-8?B?RkVMb3JiYTBUaXhwMnZHaXZqMm9iYjVQTWpVRkprMFBGbGZnM1cwMzFVSElY?=
 =?utf-8?B?K0NDbWswRmx4MnJmZjUwMHQ5YXJNaXZaTkh2SnEydEsyV2NWTll2aEZCcWFm?=
 =?utf-8?B?Qml1bGdPc2kzblFCeXJpelhWdkN4U2JxYUV5VXRDT2JGTUtVSVBHUTNORHJO?=
 =?utf-8?B?WmFQYzRXeFArM1pIdnlaalRVdlorUGlBUFV1SDFLYUsyWGVuUXVCU2lFaU43?=
 =?utf-8?B?OFFUd0JzMXM2WnVBODFRSUNsaFhCck1zcG1wWUZ5THdxcENrUGhIS2FvYTQ2?=
 =?utf-8?B?WjlGU2FMTUY0REN5aXlIRHAxcU5kU3BkR0JxTVJ5UnBvQ2J5SEtmUlpPcjJY?=
 =?utf-8?B?NllRZmN3cExYT1FzRS9HV0xva1R0Y1lzSklZQXlucExoL2tjdm9iTGVuVDNV?=
 =?utf-8?B?N2djRjJXdHc4c1hLRy9yVmRXMWhhUHg3L3hwOSt1SDRBK1hyaHR4aW93MEZl?=
 =?utf-8?B?WFQxL01iVENWR20rYWkza1VFZGZWZEtEQi9pcnFGZklacGlSZVcvcGkwOGRL?=
 =?utf-8?B?eWhrQndZRjY0WXhJWVBtY0JYdEttT0F3R1BkV2k5VFZrN05Xb0ZBUHFxNjNH?=
 =?utf-8?B?QXArUmQvWUVwU1ZLcU1pWmYwd2NuKzVUWHB2RDBYR1BHemlTRFE2VmJxT1li?=
 =?utf-8?B?cy9LUlQvVXJyVkdNanMvQkNTMGpjK2JpNzkyNGtEc2M5QTIvSWlEZTRwRFk4?=
 =?utf-8?B?ZmJla1V4ZWlrUmlZZ21YajdOV0tRTDJLY3VTYXFsM1JPYVova3VWRmZvU0cr?=
 =?utf-8?Q?d2vituBZ/oMRPz/lpHrPpOiJmymYRq42rtUM9h5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 524e110e-4121-407f-dd59-08d8f430b83f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:35:36.0860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xrAnvZDTI2EZqncl1vLzRgVfjnMzRpnJGaHRD6M+qrpGOJlyaiqVbq+zOI8Ok3freC/CwE3XdYanXdSCX045g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2777
X-OriginatorOrg: citrix.com

Hello,

The following series introduces EOI callbacks and switches a number of
subsystems to use them. The first one is vmsi and dpci, which are quite
straight forward to switch since they used to open code hooks in the EOI
handlers.

Finally HVM virtual timers are also switched to a different model where
EOI callbacks are used instead of checking at every return to guest
whether a timer interrupt is being injected. Note that such change also
fixes a bug in virtual periodic timers that prevented injecting to a vCPU
different than the one where the timer is assigned (and that would
currently match the i8259 target).

Those changes are paired together so that practical applications of
having EOI callbacks can be seen in action.

Note that further cleanup can be done, but I think the series is already
big enough and provides a clear benefit.

A couple of notes from the testing performed:
 - PVH dom0.
 - Windows guest, limited to 2% capacity to test delay for missed ticks
   mode - time is consistent in the guest.
 - Windows guest migration.
 - PCI passthrough to a guest.

Thanks, Roger.

Roger Pau Monne (11):
  x86/hvm: drop vcpu parameter from vlapic EOI callbacks
  x86/hvm: drop domain parameter from vioapic/vpic EOI callbacks
  x86/vlapic: introduce an EOI callback mechanism
  x86/vmsi: use the newly introduced EOI callbacks
  x86/vioapic: switch to use the EOI callback mechanism
  x86/hvm: allowing registering EOI callbacks for GSIs
  x86/dpci: move code
  x86/dpci: switch to use a GSI EOI callback
  x86/vpt: switch interrupt injection model
  x86/vpt: remove vPT timers per-vCPU lists
  x86/vpt: introduce a per-vPT lock

 xen/arch/x86/domain.c             |   4 +-
 xen/arch/x86/emul-i8254.c         |   1 +
 xen/arch/x86/hvm/hpet.c           |   8 +-
 xen/arch/x86/hvm/hvm.c            |  23 +-
 xen/arch/x86/hvm/irq.c            |  63 ++++
 xen/arch/x86/hvm/rtc.c            |   1 +
 xen/arch/x86/hvm/svm/intr.c       |   3 -
 xen/arch/x86/hvm/vioapic.c        | 149 ++++++----
 xen/arch/x86/hvm/vlapic.c         |  74 ++++-
 xen/arch/x86/hvm/vmsi.c           |  35 ++-
 xen/arch/x86/hvm/vmx/intr.c       |  59 ----
 xen/arch/x86/hvm/vpic.c           |   9 +-
 xen/arch/x86/hvm/vpt.c            | 476 +++++++++---------------------
 xen/drivers/passthrough/x86/hvm.c | 219 ++++++++------
 xen/include/asm-x86/hvm/io.h      |   3 +-
 xen/include/asm-x86/hvm/irq.h     |  21 ++
 xen/include/asm-x86/hvm/vcpu.h    |   4 -
 xen/include/asm-x86/hvm/vioapic.h |   2 +-
 xen/include/asm-x86/hvm/vlapic.h  |  18 +-
 xen/include/asm-x86/hvm/vpt.h     |  26 +-
 20 files changed, 601 insertions(+), 597 deletions(-)

-- 
2.30.1


