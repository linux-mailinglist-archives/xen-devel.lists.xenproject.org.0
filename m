Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C964ED6E8
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296798.505339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr7H-0006YT-Kv; Thu, 31 Mar 2022 09:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296798.505339; Thu, 31 Mar 2022 09:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr7H-0006Vx-Fz; Thu, 31 Mar 2022 09:29:19 +0000
Received: by outflank-mailman (input) for mailman id 296798;
 Thu, 31 Mar 2022 09:29:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDhN=UK=citrix.com=prvs=08274bcc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZr7F-00057w-Kg
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:29:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 078302f6-b0d5-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 11:29:15 +0200 (CEST)
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
X-Inumbo-ID: 078302f6-b0d5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648718955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=c5A7oIriEvC0cGBbEld53uU0PBaaj0rfbtF3sBKzgsc=;
  b=R0b4lnJSgvIRoDHzGad5BszSC2BSy7vicKHlecNvMXTYjv7IY8rOus+c
   zhkS1QLl1nenAnT8lOWum3FKDMYiYZB4/9OwXWqILFsrN7Cxa+AaMh1rV
   ADsFtbfzmje8/dBvAQD7ckpgNALlZJr53zi+z/hYpSMBw7C0I1jTye8GB
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67539612
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:veW5h6gM68gxNXnct1mPywiqX161dhAKZh0ujC45NGQN5FlHY01je
 htvUGmDb/2CMzamedp2YN7goxlUvMCAzodgHQNsrC40RX8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFjU4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YRwXYaOcm8A0aAJ3TBpMZKEa5pDrMXfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiBO
 pFIN2M1BPjGSyJLCEU0JooVoNn2vUvQcBwHmVOVh7VitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRABsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4CNNl5lGO7oPv+CnGPVpdQmJfR/A2u5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoetcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HwgbQ4xawZRGp8crVnl
 CJe8yR5xLpSZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBc3bJtbJ2W0P
 xK7VeZtCHl7ZiHCgUhfOd/ZNijX5fK4SYSNug78MLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOXePq9dJfQFXdRDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvcFzihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:2dF9Y6trh1B0lQASU+QIUQco7skDctV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVMqM03I9urtBEDtexzhHP1OgbX5X43NYOCOggLBRuxfBODZogHIKmnT8fNcyL
 clU4UWMqyUMbGit7eY3OBvKadD/OW6
X-IronPort-AV: E=Sophos;i="5.90,224,1643691600"; 
   d="scan'208";a="67539612"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpLmc0/tjlz15C+5QsU5BPWMrreIlg87qk2h1hAwvKFMA4JSMnIiJ+bed7qbcz7O/3ibR6hod9CIpUb1++hxfFr+jdmhk/v2i7bJeAV/hgI5a+GclmOYWwh0xxR83Pq1c1s+rRkHhPzJhTi3LSAvTg8EFvcimvw4cVu2z0L2voxMBQzrg+6gsvEEAjkERwSVBSG31KrJf695EvBvSJQbAI8wJD5YFgRNhBSRPAr0gVuaDHMYs14e9Uu+RTimgvtTlUc90oh3eqsmQRp0WTP2N4JbDYV+ZA/4DdWRn8nSEVTY3CMX/Iwrx2+qJtzP5O2XzqzlLMPB52p/Thmnc691zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5Fvyon9pP8jficILgXhOuMiNAjcLMUPifEHs+FbT5Q=;
 b=m00sqj2yWV4/MJH+wrIfSyPL0A3m0F/tcXHvOwnsnyJVuxUBhIm/PwkbFdItvM3R4qZSYv3Rc9U4GgZ1Zudxqi/E09PbYkFJT9ttUXlgzGfkHToEhM0GiU0H1RKi/gxqcJHMVJmUFVht6LpqcKMHUgbr1ecalahNPq1aO2yY6fNoeDcD0oHpXJZ6WqwwCwq78y2kWebFU4e4wsxd88WTLA/m3q4EkbDk/I5avgOi7OEdjp0JEZUNxvKyG7fJ9p+CDnRNSeMFLQRpDKRNYr0ldfjifUeyvDJKl1mFoy3GsefxnMk11Rz4lE51RLNyOFySDJ7iyUtimbbYq+/eLehcow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5Fvyon9pP8jficILgXhOuMiNAjcLMUPifEHs+FbT5Q=;
 b=dsg/0MDuWbreaQ5P93GNc1j1Gm9WOp/mw+2G3FHE5SP+JsVg7eJBJHKI2DQS0SRdrD1rgGA0LCeJ7wuwY+w+tBm7uSwz8urziQAtEC47scdNRTuEHYwRhENCOwJ35my1AP+Z7v7zhLlqkBBLIEdiyK3wUHjodfQZKlERkglAn+E=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD
Date: Thu, 31 Mar 2022 11:27:17 +0200
Message-ID: <20220331092717.9023-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331092717.9023-1-roger.pau@citrix.com>
References: <20220331092717.9023-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd6ae490-2884-4e34-8165-08da12f8e6ff
X-MS-TrafficTypeDiagnostic: CY4PR03MB3112:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB311245364FF410758064244A8FE19@CY4PR03MB3112.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PHUojfE4w+p6R5/PzlOPH07MTcALZzXZyONewvPPLNyEFx+AgpvUG0DQ64rqf/VsfNT0DsRYgODWgKCd3GURIhvLReo1J8SL9jZijRCt2OxXRZzTaTA6VX8F+LHvrCB0YuMl0feRLWeRhEyem2Kq/9xp81qyHS+3MVWnqH0PULQMzM9X48JTEo2yFOXmADC5xfhxyaHIKAXTec4wDteBGt/FOu1mSe7wkLig/lQALAMoRT0hG+AJ3H6jheqtynLFgcSfQAm/iLYw63+Mq7NqvEUIeCdFNqelLJq/kg9rJhtkQ31+psTH6RlhK9FM/7QUDox28Gr2AU83I/oHI56g+VsMrqkc8FymcKOBBMhrk+eQJy+JtAZBTtGXKHSI+cy5SPPSVP9Zg2gDTJ/2LaHD6UcSG9/nHyux4b/LcOrc6J8g1CHO91A+3ZIw+YQxV8vMxBG7Bj4pazuGrHskCxPF0wGsQdVPqhdzNfRR6UoI+bkWbgdsPSxcDK3iV3UGKBJ9ILR3jBmCj5y1AcdXxvElAIJIbuB0een51RPRiVS4SJuo/1cAd5925lvlqc3JahAYXYSQMpXJPRnXpMwT6j6nqqYgYRoSDiE/tTa69urL2VuxTEWVaWFcIBQDe9LDmuTL4aK+z60u/7Q6NJXZFYFj5h6Aj7BppnTUCOQ6mIM2oh89/EG3RzsqE+8th/6fzY71obdXg2sVEvH8dYGSnehU071wJ6fx9fsRLJiWUI3qpcQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(186003)(1076003)(26005)(83380400001)(2906002)(6506007)(2616005)(6666004)(66556008)(5660300002)(54906003)(6512007)(82960400001)(8936002)(6486002)(966005)(66476007)(38100700002)(8676002)(6916009)(4326008)(86362001)(316002)(66946007)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTdLaXh1VWhzN1pMdjhrb1RYT3o1OFlmeGVmUVRqMDd2R004cWx6UlpYT1B3?=
 =?utf-8?B?dVl0QlJhNHd3RGM0M2VXVHl3L2dxdyswQ2dIKzJFNElubitOLy9GdEEvZExC?=
 =?utf-8?B?SFJjamE0N0Q4RjVGMVNzR2dUVVk0VldrZlFwZ09QN2R4Nm9LSFV0empTMno1?=
 =?utf-8?B?WGdhMUhUaGJlOXp3czdHd0Z0bCttTlBOamVYMGJML3JBZGRJUm5IbUVBTmVD?=
 =?utf-8?B?SHVxT2d3YVA2T2dobWJKaTJMY1hEbmlabjdYZW5Eb1JGMEVGUlBCOFI3QjMx?=
 =?utf-8?B?cW5vcXpvMzdKYW5TdmtnY2tXM3RtYTNVRWlIVEwyT1NIbnEwZUZYV1hWOGd3?=
 =?utf-8?B?SXN4Njh6a1hkL2dPUVZyTGxYUUczaDNZUGE4QThNQ3kzVXhYOUdLTUxJbmtN?=
 =?utf-8?B?Z0N5M1FKR1FHWFFLcVJDbzByWlRSU2poanR0ek4wRHhZY0Y2U3pQd3NDSTQv?=
 =?utf-8?B?VzBvSS9VaXZKaUVpamdBOEVLRGdOSEpVWjNYb0ZJSFU4RzFDZ3VvQ3JVUFBS?=
 =?utf-8?B?Q1hNc1pWT1hVVUZFZXVjajJLTnJ1ODNkWjA5M2pTWUtFMjhkdVBuN05zSElp?=
 =?utf-8?B?M3JyT3V1a3d6YXJRWDBYUWJWK3BGaWNNVktkQit2cWc3NGNLS0pSLzc4WGZn?=
 =?utf-8?B?UmVhd25UcElpOEJYbUdYa0t2OEF4bkE4dHhrY0piR3NjOVBoU3BMOUdoSk5l?=
 =?utf-8?B?YjBmbjR2ajZNTW5WNFVySHRxRldGbFA0aEowUGRXRVVvTTFPckNqdlVZV204?=
 =?utf-8?B?dExwK1grZnhSai9jQVZlSXRXTFlSVVZNeW5GY2hLWDRrWHRIZzlSNUZtZ0kr?=
 =?utf-8?B?bHRjSXpUd1VRMGZ6NHhKemU2eGsvUDYxZTk2UUVLbzBzQlNvOVN0eHpGVE5m?=
 =?utf-8?B?azR4TjZiVEo5RmFsNDgzRkNmQmNkWHVVZGYrV0U0NTBWMkk3b2R6bUl2VHY4?=
 =?utf-8?B?SVlHeWtNY1Z6R0RwTTdNanRPaXJyak1aNGkveGFpcmhzc3FiR2xtNnJtQmxr?=
 =?utf-8?B?TjgxamVVL1Q3ZlQ4a0ZwY3lSb3ZjcjE2TjA5VDlCaHN1YmhEUXl3ZWt1UHVJ?=
 =?utf-8?B?bWdpQjRrT05WeEtyc2xFZlBqV1V6bEp0YUpRSmlob2Rwa3NaR0hxeHo1WjZZ?=
 =?utf-8?B?a2lQY3hLQjFwV1IvNktKeG0rYktjQUY5NnNNYUwzTjQyMU92aU1GSkRZY2sr?=
 =?utf-8?B?ZXZPWHdHemw0bHVYbS9EQ2lkZUx6RG9jRVJEYVRXZU1xY0d0L1pCTXB4NUxS?=
 =?utf-8?B?TkdMNmVUUGt1L2FOQXRpaGovc1Iya0ZPTDZTaHlBR3dkWTI5cm5KeVpaWWZz?=
 =?utf-8?B?RjR1VFV2a1BESHpzTW1vTEtDYjhvaWtRL015WlpJdEdaQWR1TnBuU3lHWURu?=
 =?utf-8?B?dmNKeXAyeHZzb1UxclJWTWxrS0ZTbGt5dlE1QVlIMEJTbWFVMmQzT3E3ZTNR?=
 =?utf-8?B?VmZMbDMvVllvVzN5WDdhalRmLzNQZUFZQUFFTW5pTXR3ei9IN0dka2wrTzl2?=
 =?utf-8?B?ci83Mm02YmJZTUszdWgzckFHcGlodzRxM2drUi9hUURhV1RBYnJFVEJyQkU3?=
 =?utf-8?B?amJYd29XUlB2SjNyUFMySjZZY2lyVG9MbWRLUXl6eDJ0ekJxRWdOQ0czSTUx?=
 =?utf-8?B?N0p0Ymp3Nytrd1VBSjVXNXByZ3NOUVJhRGtaUnRJZFBhbkl2RURJYXAwQVg1?=
 =?utf-8?B?RENiaE4wcmRwdHdDTG40UncwaXlsMFBOdDhWYnZDaDFmaHdqWjNGZy9IYzBr?=
 =?utf-8?B?VFJpM0ZSY2NNWWtaWXV0Rmh3bUJ3MGZGbnRobEc4VTRpWW5JZ3MvRldZdzBv?=
 =?utf-8?B?WlVKRno5ckJQOFRSMzBTY1Y0UDFVajJaTWNZaXlTanZlV1lTUHpRYUs5a2Nt?=
 =?utf-8?B?Y1BEampPT01kNU9OdEJLZWZ2K3J6OXNFeTdxRCtUY1h3ZWJVaUd3UFhmbmg5?=
 =?utf-8?B?RTJJZm1GSWVpTGxPZ0VPRkNlSEFDZWM2SmlQTFQ3UGJ2SzZMVmFiRklab1FT?=
 =?utf-8?B?MmRicjM4SUJiNWZxWXNPTVRQZDRvZmt4WE40ZUo2MkJxN3dpRG5oSDJubWU1?=
 =?utf-8?B?T3VseUVDT29TOE80MlJ2eUFvMFBLUWtEdXhFb08vem1pWElnNGFnVEhEY1Zj?=
 =?utf-8?B?UFZxaFpmYmE5bXNabi90aXZHR1V6VUFzeXBNQ205SHovcC9TcGtCRUxqRmNN?=
 =?utf-8?B?ZGQ5ZnB2MS85ZGlEYVJqa01mSEFGSWdKWkhzYzI1RGxYUDN2ZmZyVGNnMHNi?=
 =?utf-8?B?alQ1blkwUExncEZVOFI0WVdIYkRYZGxTQjhxUFEyWW1NMWxmSHdtKytKMFRX?=
 =?utf-8?B?bjk5NHpRblBYbTkxVFArMmVZQ3FDZ3hNMTRZeWYrTWxEKzFTR0NFbng1ZGty?=
 =?utf-8?Q?GF+ruYJlm5K2B1fQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6ae490-2884-4e34-8165-08da12f8e6ff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:29:06.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKLy/wCHLyW8HTqC4qb3GrGfBg2QQMNthzETkWl7URg1q334ui4ju5XpYHKS7RhdWge+ASShJPqYVEE1/1Gx0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3112
X-OriginatorOrg: citrix.com

Expose VIRT_SSBD to guests if the hardware supports setting SSBD in
the LS_CFG MSR (a.k.a. non-architectural way). Different AMD CPU
families use different bits in LS_CFG, so exposing VIRT_SPEC_CTRL.SSBD
allows for an unified way of exposing SSBD support to guests on AMD
hardware that's compatible migration wise, regardless of what
underlying mechanism is used to set SSBD.

Note that on AMD Family 17h (Zen 1) the value of SSBD in LS_CFG is
shared between threads on the same core, so there's extra logic in
order to synchronize the value and have SSBD set as long as one of the
threads in the core requires it to be set. Such logic also requires
extra storage for each thread state, which is allocated at
initialization time.

Do the context switching of the SSBD selection in LS_CFG between
hypervisor and guest in the same handler that's already used to switch
the value of VIRT_SPEC_CTRL in the hardware when supported.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Fix codding style issues.
 - Use AMD_ZEN1_MAX_SOCKETS to define the max number of possible
   sockets in Zen1 systems.

Changes since v1:
 - Report legacy SSBD support using a global variable.
 - Use ro_after_init for ssbd_max_cores.
 - Handle boot_cpu_data.x86_num_siblings < 1.
 - Add comment regarding _irqsave usage in amd_set_legacy_ssbd.
---
 xen/arch/x86/cpu/amd.c         | 116 ++++++++++++++++++++++++++++-----
 xen/arch/x86/cpuid.c           |  10 +++
 xen/arch/x86/hvm/svm/svm.c     |  12 +++-
 xen/arch/x86/include/asm/amd.h |   4 ++
 xen/arch/x86/spec_ctrl.c       |   4 +-
 5 files changed, 127 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 4999f8be2b..a256a9d882 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -48,6 +48,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
 
 /* Signal whether the ACPI C1E quirk is required. */
 bool __read_mostly amd_acpi_c1e_quirk;
+bool __ro_after_init amd_legacy_ssbd;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
@@ -685,23 +686,10 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
  * Refer to the AMD Speculative Store Bypass whitepaper:
  * https://developer.amd.com/wp-content/resources/124441_AMD64_SpeculativeStoreBypassDisable_Whitepaper_final.pdf
  */
-void amd_init_ssbd(const struct cpuinfo_x86 *c)
+static bool set_legacy_ssbd(const struct cpuinfo_x86 *c, bool enable)
 {
 	int bit = -1;
 
-	if (cpu_has_ssb_no)
-		return;
-
-	if (cpu_has_amd_ssbd) {
-		/* Handled by common MSR_SPEC_CTRL logic */
-		return;
-	}
-
-	if (cpu_has_virt_ssbd) {
-		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
-		return;
-	}
-
 	switch (c->x86) {
 	case 0x15: bit = 54; break;
 	case 0x16: bit = 33; break;
@@ -715,20 +703,114 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 		if (rdmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    val &= ~mask;
-			    if (opt_ssbd)
+			    if (enable)
 				    val |= mask;
 			    false;
 		    }) ||
 		    wrmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    rdmsrl(MSR_AMD64_LS_CFG, val);
-			    (val & mask) != (opt_ssbd * mask);
+			    (val & mask) != (enable * mask);
 		    }))
 			bit = -1;
 	}
 
-	if (bit < 0)
+	return bit >= 0;
+}
+
+void amd_init_ssbd(const struct cpuinfo_x86 *c)
+{
+	if (cpu_has_ssb_no)
+		return;
+
+	if (cpu_has_amd_ssbd) {
+		/* Handled by common MSR_SPEC_CTRL logic */
+		return;
+	}
+
+	if (cpu_has_virt_ssbd) {
+		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
+		return;
+	}
+
+	if (!set_legacy_ssbd(c, opt_ssbd)) {
 		printk_once(XENLOG_ERR "No SSBD controls available\n");
+		if (amd_legacy_ssbd)
+			panic("CPU feature mismatch: no legacy SSBD\n");
+	} else if (c == &boot_cpu_data)
+		amd_legacy_ssbd = true;
+}
+
+static struct ssbd_core {
+    spinlock_t lock;
+    unsigned int count;
+} *ssbd_core;
+static unsigned int __ro_after_init ssbd_max_cores;
+#define AMD_ZEN1_MAX_SOCKETS 2
+
+bool __init amd_setup_legacy_ssbd(void)
+{
+	unsigned int i;
+
+	if (boot_cpu_data.x86 != 0x17 || boot_cpu_data.x86_num_siblings <= 1)
+		return true;
+
+	/*
+	 * One could be forgiven for thinking that c->x86_max_cores is the
+	 * correct value to use here.
+	 *
+	 * However, that value is derived from the current configuration, and
+	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
+	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
+	 */
+	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
+		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
+		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
+	}
+	if (!ssbd_max_cores)
+		return false;
+
+	/* Max is two sockets for Fam17h hardware. */
+	ssbd_core = xzalloc_array(struct ssbd_core,
+	                          ssbd_max_cores * AMD_ZEN1_MAX_SOCKETS);
+	if (!ssbd_core)
+		return false;
+
+	for (i = 0; i < ssbd_max_cores * AMD_ZEN1_MAX_SOCKETS; i++) {
+		spin_lock_init(&ssbd_core[i].lock);
+		/* Record initial state, also applies to any hotplug CPU. */
+		if (opt_ssbd)
+			ssbd_core[i].count = boot_cpu_data.x86_num_siblings;
+	}
+
+	return true;
+}
+
+void amd_set_legacy_ssbd(bool enable)
+{
+	const struct cpuinfo_x86 *c = &current_cpu_data;
+	struct ssbd_core *core;
+	unsigned long flags;
+
+	if (c->x86 != 0x17 || c->x86_num_siblings <= 1) {
+		BUG_ON(!set_legacy_ssbd(c, enable));
+		return;
+	}
+
+	BUG_ON(c->phys_proc_id >= AMD_ZEN1_MAX_SOCKETS);
+	BUG_ON(c->cpu_core_id >= ssbd_max_cores);
+	core = &ssbd_core[c->phys_proc_id * ssbd_max_cores + c->cpu_core_id];
+	/*
+	 * Use irqsave variant to make check_lock() happy. When called from
+	 * vm{exit,entry}_virt_spec_ctrl GIF=0, but the state of IF could be 1,
+	 * thus fooling the spinlock check.
+	 */
+	spin_lock_irqsave(&core->lock, flags);
+	core->count += enable ? 1 : -1;
+	ASSERT(core->count <= c->x86_num_siblings);
+	if (enable ? core->count == 1 : !core->count)
+		BUG_ON(!set_legacy_ssbd(c, enable));
+	spin_unlock_irqrestore(&core->lock, flags);
 }
 
 void __init detect_zen2_null_seg_behaviour(void)
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 91e53284fc..e278fee689 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -537,6 +537,16 @@ static void __init calculate_hvm_max_policy(void)
     if ( !boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
         /* Clear VIRT_SSBD if VIRT_SPEC_CTRL is not exposed to guests. */
         __clear_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+    else
+        /*
+         * Expose VIRT_SSBD if VIRT_SPEC_CTRL is supported, as that implies the
+         * underlying hardware is capable of setting SSBD using
+         * non-architectural way or VIRT_SSBD is available.
+         *
+         * Note that if the hardware supports VIRT_SSBD natively this setting
+         * will just override an already set bit.
+         */
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
      * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 40ff28ecf1..9b8f8d21bd 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -3133,7 +3133,12 @@ void vmexit_virt_spec_ctrl(void)
         if ( val != lo )
             wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
         current->arch.msrs->virt_spec_ctrl.raw = lo;
+
+        return;
     }
+
+    if ( val != current->arch.msrs->virt_spec_ctrl.raw )
+        amd_set_legacy_ssbd(val & SPEC_CTRL_SSBD);
 }
 
 /* Called with GIF=0. */
@@ -3142,7 +3147,12 @@ void vmentry_virt_spec_ctrl(void)
     unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;
 
     if ( val != (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+    {
+        if ( cpu_has_virt_ssbd )
+            wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+        else
+            amd_set_legacy_ssbd(val & SPEC_CTRL_SSBD);
+    }
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index a82382e6bf..6a42f68542 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -151,4 +151,8 @@ void check_enable_amd_mmconf_dmi(void);
 extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
 
+extern bool amd_legacy_ssbd;
+bool amd_setup_legacy_ssbd(void);
+void amd_set_legacy_ssbd(bool enable);
+
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 0d5ec877d1..495e6f9405 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -22,6 +22,7 @@
 #include <xen/param.h>
 #include <xen/warning.h>
 
+#include <asm/amd.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
@@ -1073,7 +1074,8 @@ void __init init_speculation_mitigations(void)
     }
 
     /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
-    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
+    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd &&
+         (cpu_has_virt_ssbd || (amd_legacy_ssbd && amd_setup_legacy_ssbd())) )
         setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
 
     /* If we have IBRS available, see whether we should use it. */
-- 
2.35.1


