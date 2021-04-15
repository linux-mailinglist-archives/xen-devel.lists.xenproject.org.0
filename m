Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE19B360C28
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111328.212943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3I1-00033e-VJ; Thu, 15 Apr 2021 14:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111328.212943; Thu, 15 Apr 2021 14:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3I1-000339-PG; Thu, 15 Apr 2021 14:48:17 +0000
Received: by outflank-mailman (input) for mailman id 111328;
 Thu, 15 Apr 2021 14:48:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lX3I0-00032q-On
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:48:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 636f3f57-afef-4453-82f4-e8ec4e66ea69;
 Thu, 15 Apr 2021 14:48:15 +0000 (UTC)
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
X-Inumbo-ID: 636f3f57-afef-4453-82f4-e8ec4e66ea69
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618498095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=cd3CoYPuX3aw4POTIwakPsHJdWcXzR23STMzF2A8Gxg=;
  b=dxZCOVXaztatAZycjsW7KWiGOhFLnrceOx2KJaVtIRtHGi8fiAq8nwlp
   mLxL2/jFqLQAT7lcQQrOboIrT7NkDiI1dDlUJdmUxp8CZQZt2Xz/Sl8Mh
   Rn/Uxr/cTnjBSlJFWjipcFM2WtszYeF0bXvhky4Z9QDGgnPxob4QQsB3R
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MSxrH3aSPgtVH+NdE4xYn9oXog9R0vvuNeeioSsvCurZ58i3UO1iu4ue43Ag/7/fOuIUqH0WaZ
 6Oh5lK98YuqloLN8CDhO4fgxDOROOzdvbUHTrAw7oRbf6HoYkFyJE+xu13tOBITEI8itT0loBd
 /HL5ChFlWeD0s6n12931fccHJ10MmHxLYIRGyzuI/rhOs7qYswW45oKoYo78/b9MX0Fwsg32O3
 jYtg0Ixp+mBA52sd0YozhJKeal30rucfXMUJIoWDtUOGmyOM3Y79Mpf/ntkocydlIZHpdP6zqw
 o/8=
X-SBRS: 5.2
X-MesageID: 42063248
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7GzHpq3tLbHCxB2Q/wjQxgqjBTd3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcBdxi1SYzzrdnFebg9AGJY/Cd
 6g/cJBvTWtYjA6ac68C3kDUYH41qH2vbjhZgMLAANi1RmWgVqTmcPHOjW7/jNbaTNAxr8+7X
 PI+jaW2oyPu+y2oyWssVP7wI9RnLLau7l+LeyKzvMYMzD9zjuvDb4RIIGqmBAQjKWR5E0xkN
 /Kyi1QT/hbz3/KZGm6rV/M9mDboU8TwkTvw1OZnnfvyPaRLFlRa7sj9PBkWyDU5EY6sNZ33L
 gj5RPii7NtAQ7dhyO43tDUVnhR5zuJiEA/mu0ehWE3a/p4VJZtq+UkjSZoOaZFNif75Ic7Kf
 JpHcHR6d1HGGnqEUzxjy1BxsehUW80GQrDak8eutaN2zwTp3xhyVAErfZv0ksoxdYYcd1p9u
 7EOqNnmPVnSdIXV7t0AKMkTdGsAmLAbBrQOAupUBvaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuemr1YPf+nKFjw1ToeiGQTD7twsZR69xSobvnXofmNiWFVRQHj9agmfMCGcfWMs
 zDea5+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49RhagucTOBor2tvHKUfraKbb3eAxUGF/XMz
 8mZnzeNc9A5kekVjvTmx7KQU7gfUT54NZRHcHhjq0u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66itqu6oGKx7FvZ9mkBAGsYMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYjhyUt3RCw
 wag1hs46q4I9ixyEkZepyaG1Pfq0FWiGOBTp8alKHGz9ziYIkEApEvX7E0Mx7KGRxzkQNDs3
 xCdwcAe0/aGlrV+OaYpa1RINuaW8h3gQ+tL8IRg2nYr1+gqcYmQWZeYySjSveNgQElRyNdg3
 p496N3usvGpR+fbU8ExMgoOlxFb2qaRJZLFh6Maolvlrf3Qw1oVmuRiTuGixY8R3ry+ywp9x
 /cBBzRXcuOLktWu3he3Kqvyl9ye2mHV29ba3xxs+RGZC/7k0c29dXOSru40mOXZFdH//oUNy
 vdZyAOZil0wcqs6RKTkDGeNHkvy5k0JNbBBLA7f7y74ALqFKS40YU9W9NE9pdsM97j9tIRWe
 WEYgmPMXfWDfgq1wH9nAdSBABE7F0f1dXm1x3u4DLmgDoRAf/OLE9nQL9eCdeG9GTgT+uJ1p
 I8rd9dh5rFDkzBLvq9jYfQZHp/DzmWh0icZeQhs4pVsqI/r6EbJeiSbRL4kFV8mCwjJ8L1nn
 4ESKt14Lr9KpZiFvZiDh5xzx4MrpCzN0MlvQz9P/8mcXwsh3HdOcmV47Cgk8tZPmSx4C/5OV
 yS6ERmjo/4dhrG8b4REKQrJ2tKLGA69XR55euHHregQjmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 I/x92TheeYe27Z3w/X1AELb55mwiKCQcmoBhiLFvMN29umOU6Uiq/v2fWNtl7MOHKGQnVdo5
 ZEe0wWZtlCjTdnrLRf6FnMdoXH5mQ/k1Vf5jl7kEXKwYbO2haDIX17
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="42063248"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eu3d2bpmFRGe6lIT2/uzTKh+x+7uSTvY9+by+wK49IVfnGA/FpG0RFmiw6tf7ODc5UnVmxyFPKsKw4fPckivj3LCOu564Odwtamit3NcJgy8iHAgw0QitA6pjyuPYA8Qw0RPLWFIbLqv5NiiyXMwca4ezXIN18KchTa6KV/1/7Xj9TpcJWjmZ538wHFdgh5cxbeM2UABRIa6erOSsujRHbNyY/1f9dS6OXeB+gEu9l9mA4+999KdxezLhnI0BHlG2F0Pg9u5ycHhTAYcZ6cvJK593OqQrjbkjeuZHUDx4EidyrrE5b0In2jVn44WRzl7xmLOTlkEPC1h0EDc2BOQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwyYue/XhqLfsb2rqRAARfa6x/vmze08A9OfANytI5g=;
 b=em+XRa27kQZBPzF/kO2KzlZTx1K76oBJGlXrNoPKJ6A0G/A+qnd5ThmhV0aDV8+D7Qz/Vf7YmH0AOO0pbv2EA7X4Z0PIP9JqoOduyV/FwS6yNPPi+UYtUiL8HPPcX/6YNti6P4VQHQ6+4vgxsxDhRwLXkyOmPyxk/1+lXhVMbbY3gNDkCR+tOWZjlN1xt6Ho/iAFmyl9/J2pekEBXA9ONetA3kphWorkupbMtqptDl8h1iZpo6ZJeniBkCRFVXs6zMXxd0M/TPy+m4/B7jiMHOrCDbkogO/vpp+lakisyJbqtUFHgnVpmOkeEDFys7DfpvuelVKkvxzFQCdBWg6umA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwyYue/XhqLfsb2rqRAARfa6x/vmze08A9OfANytI5g=;
 b=JwGj4kzlXyu9mS9h8m4BqHSxtisGu16lf2P4AQa+4Vf8hZ44XF2NsQ8hqxiQBsUzpgEMm3gysU2QRAbHWgjBCSBlGll+5Rra3XDZXemw0oTyPfEfu1c+4oKrENmK0SmlyGINd7msTyxKl4V6jKKzJjq9B4IGnF/L65bDfx4K3P0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] x86/amd: split LFENCE dispatch serializing setup logic into helper
Date: Thu, 15 Apr 2021 16:47:30 +0200
Message-ID: <20210415144731.3356-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210415144731.3356-1-roger.pau@citrix.com>
References: <20210415144731.3356-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0034.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::22)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9f4d596-5332-45fe-6375-08d9001d7c91
X-MS-TrafficTypeDiagnostic: DM5PR03MB2843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2843EAC7709CA86FCF8CE45F8F4D9@DM5PR03MB2843.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rHN73m3+DJp2fBe1TB3iF6vCRhrih70InOCOrLA6exbXz8hRwh1FltfpoZwyBkh4NTcOnulf4hsAAEwZUS42TG7i18iZPzO8ir+VhoGfHPdqGPGwBf6mBbbr89mS99xaX1t3OAzh3I3R+FfSGJOt6Kjt+gssXfbx7mEvPlbyb94iwwPvsxv0ZT5UezuxSNMlOH7FFHN8n5QU3ixlNtlv/usij77vfc2KpnFjvI8tnwGBjHMx2AuDwab4Thm7cK6fAV9xp6GcfBhsez8C+pLLOs8gg44Xby6GXX50UqsZZItyU5g6+STfpFGdcrKzQKAy707C3FHkTazp1F2PQsqH9H9ZIoMbxufYxqXSx4Rr7iV5ePMEMl9MvBX+Git+j8Ui3x8m8y4Dq0XjtijiT16DrngOSfG0ysuqirV22qEqtTCuar8RhtS7ZvVcUFeqj0O80aLbVYzTI8avAC28LZHdLVS6RwBukA/nyeU1ctOh6kK+lMiXaB95wJ5JZFtPhCiJmwcO8MLUkqZPeIfdtn9gN/5tf9JMO74AYrYQUR2FYcsDUga9qFBUq1t9TVGkHEJZvoR7ZaSunRYuvkp0QdvZWYO3DMTvXl+O3vjHrPV6Iuw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(956004)(478600001)(38100700002)(8676002)(6666004)(5660300002)(1076003)(8936002)(66946007)(2616005)(66476007)(66556008)(26005)(2906002)(6496006)(6916009)(6486002)(83380400001)(36756003)(4326008)(86362001)(316002)(54906003)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y3kvYTEzdU9paHZheVlUaXFQZ0hUVzdVUDdGWHlML3VRY2h4akx3ZWp5U2wy?=
 =?utf-8?B?dGJEOFN6L0J2UmgvN05rZDl5S2Rlc1JvcTY5Yzlkb0crd0l2MXJEYjRwRDFh?=
 =?utf-8?B?UFFHQW9mSUlnTlBKcjFWZTljUEhzVmhCdzhNdExsQkFGeHZkK2lZZEpkNkZs?=
 =?utf-8?B?aEsyZnJ1WVlBRUR5RHJHeXVoSE9sYXhVWWVnZkE2Vk0rd3FQalQ4aWtEODBz?=
 =?utf-8?B?NXdpa3JERXpscHhvUUtuNEZDWjl2allaNUQzYitHdVYwcVlZT0E5UDVSMFd5?=
 =?utf-8?B?Y3YxdkpOOE5ubVFYcHUxZlNiam9QaExQMXNiNHZyaXpqUmU3ckFVRHNsMmY5?=
 =?utf-8?B?azMxY0p3Mk9DdnR6WVh5dSs2dWc4ajJrZURPenBRT1hxcnQ1dFVkSDBzVkM0?=
 =?utf-8?B?djFUL0djbFc2bUpxSkloY0ZORlo1ZituOFB1SnFybnRRemNINVpXK3hJeUxu?=
 =?utf-8?B?bEZBd1NUdmpRQXBxQnNCcGhHZ0YrL0NTTmVJTC9maW8xRlpSbXZmdTdPNmFs?=
 =?utf-8?B?ZTlsYVhHdXRtck1KaFlGWkJaVS9PUHlrcjVybElvZGtESU9nUFMzbVVSMy9J?=
 =?utf-8?B?Sk1CSjBWU0dWblpxdGJUbmJNSU5GYzdWb0FibDdCSCs1Mkttd09rM0pqdGx1?=
 =?utf-8?B?cFVIVWZCcXpyN2thTEZ3Z1NJZkFMaDF2d0JmYllEL0RuclQxblZZRG5zQlEw?=
 =?utf-8?B?KzU2TmtKbXp4a0VYVS9FTjlieFdmWVdhaWZ2L0xVODZGSmhwb0dMaTVVRXZS?=
 =?utf-8?B?cTQvWVZMTDFvd1g4MGR3WVBVL01pdm1lbVFFSVlMOWRCZ05ONTVTSklVaUov?=
 =?utf-8?B?dnhpRk9LUDVQOXA4SmI0UEZPK2NIZGFlaVVoeGg4VUgyTFYxck1hbmQ1cVBj?=
 =?utf-8?B?YnpvTVJoZmJDd1BGWDNPTXJSV0V3ZkVDb0EwZ05oZkdqdjlkajhldFJ6MWox?=
 =?utf-8?B?eEJBZmZjbFhoODBNcm9NZnIveDFraFZqSnRrL3gxSkhMQUFPYzhUdVBFdlkr?=
 =?utf-8?B?KzRyUDFuODVpOGxaUFJhak5KK1QwbjZtYWZ3Sk1BcnljcG9XUjN1WUVpRW9l?=
 =?utf-8?B?Zk4xdG5sQnpGRUFhNkVkcDU0NDVYOUhJZHF2eEtlT0ZVekwyUXY2RXhnUW8v?=
 =?utf-8?B?QzNtSm5ZSis4ZmF6aHcrM0wwTWFqeDlidXIyRkxZZ0FjVW9PVWI5b1gzQUtH?=
 =?utf-8?B?YTJCZm5EVzkxYzJsSEhYUUVTakFDZk1pUVlQcG41L3FZaFZuQ1loTDJRRlht?=
 =?utf-8?B?RGdRcURBTGFlN04xME1OcTk5MjdhYzFLanAxR0VTZ0hqS1Nzb09hTktzUmo0?=
 =?utf-8?B?TW15d2dYdnk4V3EzdHhWcHRHUjBocFFoVldoTkNSWndJSDNrdGRsbDZLNGFx?=
 =?utf-8?B?b2dqdlRTYVYzL2JhWGhLOEF5TVVCMldZYWV2M3BkVklsMjdwbU85Z2FCRFg2?=
 =?utf-8?B?cjFhSTVEVEthdmdyaUVMT2tUcktoYWdMcVpiREdqWlQ3aWFkSXcxWisxUWZQ?=
 =?utf-8?B?MGFla1ZHamNPVjl5Yy9VL1JBdFozRmRFZHZkbGNWVnhsMGlkZ2MxdTg5ejc3?=
 =?utf-8?B?b2VESVdxTld3RjVwYjNhdGpNREZ2OUVaZjZNQ3RnYWM1aGlQa1pnQ2diNkZD?=
 =?utf-8?B?aXA2WDM3N3N5eTBPYmhaS0p5VlpWRnFOaHZScWp0cnZTYjRiZDU0dGZ2cE9a?=
 =?utf-8?B?YjdQUGxHY1VsMmZkQ2ttQnFHd0s2cktxdjVnc2FCeWEreE1JU2tHOWpRZGo4?=
 =?utf-8?B?dnJNWlIvdmlOVzhuRnZ5U1gybWdtRkVuNm9yK3N5OHUrdXpoWUpDeUxaOHRX?=
 =?utf-8?B?MFV3YjNKVG14c0lDZlErZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f4d596-5332-45fe-6375-08d9001d7c91
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 14:48:09.4640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoA1qmNjF0fG0R8JKbabjlhkNO2NGEV9Mq53HYwTeXkGmYWE0xCcYP+phEHhjr14CcqMMjyl0HKxExckm8d66A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2843
X-OriginatorOrg: citrix.com

Split the logic to attempt to setup LFENCE to be dispatch serializing
on AMD into a helper, so it can be shared with Hygon.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
 - Fix typo in commit message.
---
 xen/arch/x86/cpu/amd.c   | 62 ++++++++++++++++++++++------------------
 xen/arch/x86/cpu/cpu.h   |  1 +
 xen/arch/x86/cpu/hygon.c | 27 +----------------
 3 files changed, 36 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 8bc51bec10d..9c8dcd91eef 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -642,6 +642,38 @@ void early_init_amd(struct cpuinfo_x86 *c)
 	ctxt_switch_levelling(NULL);
 }
 
+void amd_init_lfence(struct cpuinfo_x86 *c)
+{
+	uint64_t value;
+
+	/*
+	 * Attempt to set lfence to be Dispatch Serialising.  This MSR almost
+	 * certainly isn't virtualised (and Xen at least will leak the real
+	 * value in but silently discard writes), as well as being per-core
+	 * rather than per-thread, so do a full safe read/write/readback cycle
+	 * in the worst case.
+	 */
+	if (rdmsr_safe(MSR_AMD64_DE_CFG, value))
+		/* Unable to read.  Assume the safer default. */
+		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
+			    c->x86_capability);
+	else if (value & AMD64_DE_CFG_LFENCE_SERIALISE)
+		/* Already dispatch serialising. */
+		__set_bit(X86_FEATURE_LFENCE_DISPATCH,
+			  c->x86_capability);
+	else if (wrmsr_safe(MSR_AMD64_DE_CFG,
+			    value | AMD64_DE_CFG_LFENCE_SERIALISE) ||
+		 rdmsr_safe(MSR_AMD64_DE_CFG, value) ||
+		 !(value & AMD64_DE_CFG_LFENCE_SERIALISE))
+		/* Attempt to set failed.  Assume the safer default. */
+		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
+			    c->x86_capability);
+	else
+		/* Successfully enabled! */
+		__set_bit(X86_FEATURE_LFENCE_DISPATCH,
+			  c->x86_capability);
+}
+
 static void init_amd(struct cpuinfo_x86 *c)
 {
 	u32 l, h;
@@ -686,37 +718,11 @@ static void init_amd(struct cpuinfo_x86 *c)
 	if (c == &boot_cpu_data && !cpu_has(c, X86_FEATURE_RSTR_FP_ERR_PTRS))
 		setup_force_cpu_cap(X86_BUG_FPU_PTRS);
 
-	/*
-	 * Attempt to set lfence to be Dispatch Serialising.  This MSR almost
-	 * certainly isn't virtualised (and Xen at least will leak the real
-	 * value in but silently discard writes), as well as being per-core
-	 * rather than per-thread, so do a full safe read/write/readback cycle
-	 * in the worst case.
-	 */
 	if (c->x86 == 0x0f || c->x86 == 0x11)
 		/* Always dispatch serialising on this hardare. */
 		__set_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability);
-	else /* Implicily "== 0x10 || >= 0x12" by being 64bit. */ {
-		if (rdmsr_safe(MSR_AMD64_DE_CFG, value))
-			/* Unable to read.  Assume the safer default. */
-			__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
-				    c->x86_capability);
-		else if (value & AMD64_DE_CFG_LFENCE_SERIALISE)
-			/* Already dispatch serialising. */
-			__set_bit(X86_FEATURE_LFENCE_DISPATCH,
-				  c->x86_capability);
-		else if (wrmsr_safe(MSR_AMD64_DE_CFG,
-				    value | AMD64_DE_CFG_LFENCE_SERIALISE) ||
-			 rdmsr_safe(MSR_AMD64_DE_CFG, value) ||
-			 !(value & AMD64_DE_CFG_LFENCE_SERIALISE))
-			/* Attempt to set failed.  Assume the safer default. */
-			__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
-				    c->x86_capability);
-		else
-			/* Successfully enabled! */
-			__set_bit(X86_FEATURE_LFENCE_DISPATCH,
-				  c->x86_capability);
-	}
+	else /* Implicily "== 0x10 || >= 0x12" by being 64bit. */
+		amd_init_lfence(c);
 
 	/*
 	 * If the user has explicitly chosen to disable Memory Disambiguation
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index 1992596d1b2..1ac3b2867a0 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -20,3 +20,4 @@ extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 
 void early_init_amd(struct cpuinfo_x86 *c);
 void amd_log_freq(const struct cpuinfo_x86 *c);
+void amd_init_lfence(struct cpuinfo_x86 *c);
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index 46293f1f367..2272e1113f1 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -32,32 +32,7 @@ static void init_hygon(struct cpuinfo_x86 *c)
 {
 	unsigned long long value;
 
-	/*
-	 * Attempt to set lfence to be Dispatch Serialising.  This MSR almost
-	 * certainly isn't virtualised (and Xen at least will leak the real
-	 * value in but silently discard writes), as well as being per-core
-	 * rather than per-thread, so do a full safe read/write/readback cycle
-	 * in the worst case.
-	 */
-	if (rdmsr_safe(MSR_AMD64_DE_CFG, value))
-		/* Unable to read.  Assume the safer default. */
-		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
-			    c->x86_capability);
-	else if (value & AMD64_DE_CFG_LFENCE_SERIALISE)
-		/* Already dispatch serialising. */
-		__set_bit(X86_FEATURE_LFENCE_DISPATCH,
-			  c->x86_capability);
-	else if (wrmsr_safe(MSR_AMD64_DE_CFG,
-			    value | AMD64_DE_CFG_LFENCE_SERIALISE) ||
-		 rdmsr_safe(MSR_AMD64_DE_CFG, value) ||
-		 !(value & AMD64_DE_CFG_LFENCE_SERIALISE))
-		/* Attempt to set failed.  Assume the safer default. */
-		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
-			    c->x86_capability);
-	else
-		/* Successfully enabled! */
-		__set_bit(X86_FEATURE_LFENCE_DISPATCH,
-			  c->x86_capability);
+	amd_init_lfence(c);
 
 	/*
 	 * If the user has explicitly chosen to disable Memory Disambiguation
-- 
2.30.1


