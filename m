Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588D308736
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:06:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77811.141189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5PjA-0003ot-98; Fri, 29 Jan 2021 09:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77811.141189; Fri, 29 Jan 2021 09:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5PjA-0003oT-5g; Fri, 29 Jan 2021 09:06:04 +0000
Received: by outflank-mailman (input) for mailman id 77811;
 Fri, 29 Jan 2021 09:06:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEfz=HA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l5Pj8-0003oO-OH
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:06:02 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cae8ac3c-a65f-4da4-8312-decf2bb7739f;
 Fri, 29 Jan 2021 09:06:01 +0000 (UTC)
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
X-Inumbo-ID: cae8ac3c-a65f-4da4-8312-decf2bb7739f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611911161;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=+Pwlva5qEZYQQd7eMR0UfQ5Q/mEV29/BMaP52I74Er8=;
  b=IPd+xtm+TpEraOTGx7bFaeeg7pMaDYX3GInSwgrPpW6yddEhuavk5mjy
   z4UBHkvslh37NK/QBq2HmI1PLXtP5SMwkvOyJHJ20EfJ7q5eeJ9ZVdBKm
   7wT7AWpnB+vn++0DOK1IfkVrNGJIROCBNdtmQ5jgxnoCuJRuPvZWHacwX
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yUhqcFN9uStfSliSXHGpRcbe47B6ur7VzX8NTHdE1Ob1EM5WNWUWkcnMBw7EQKchV9o3r4gcEB
 Qh/4kOZuPEp7YI82GXXY1T60K6qKdxX4IY5ZNXczaUhdXsVBtX6bP6k22X39A9KLltKG7LKU6J
 OQi88AofkvXAr6PM768OLwPOvjYzEg2W2mTSTrkha3UDhQ8bSJFNhOh6CTRge/5Ey5KXUYU9Jq
 8dnT3DBfx96bRcDJa7bXYmFfkcAxZS6Uxd70hhtg5xCUXqSO23qAGdiZvoRx5fVhlxbPbAK5Yh
 gu0=
X-SBRS: 5.2
X-MesageID: 36511941
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36511941"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0g4Z/4WxR6LbWo0Ay5FT32P5bOtKHfoQpH1Q/otUUqOLx3fFXY2EIXSJ6ZghzsIb1qFvQPmLtXSdg/aso7zOG9v8u8g6K2OyVGQkfVFejJgwXAU9chKlT5o6Ij3jnx0zhc8K7sl8G0SYUVwjQsUN08E0lBp7DgORmHqSPlWElMSwKX8m4ULjRX0gtmzzEbFjdvJitHjvcm9aOkpyE2TaArJYeoP4epopQLu11p9Kr5cqzxi1RXCbwTFWKoH7P2SE0H2Br/gxOOeFsZlvrdGTJs0M/FjhbgEWdZwPQFsq/LeUL2Yg6sIbeXtyGWjOWLcSJCEh8X0p7APhxm99dLBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfK1gAKaxc06QxEGH4rsRQ2svR0t2dib7ZOV92E0sRA=;
 b=gI0llmaxQETsVYoBCMj6iWtIxA2RTbQhKWoIK3TvYapJKnGCfol+yn/zxwh6yDaO5Vs/fz0V4yJJMCfEQzMKZHf9DSZhWzYcDbsnjck/XwZBY4S1CpXXdbObuH+mDLdkhdtXNTlvnroPeee0OOK2HqAc2mRLvaZCBFjWmiCfU3Qjndg2fzqsYDgmnC2g9zNGJw4vtzrNp6zHkR+n2ArsmGjY0E8xmdTo+CDA+tsjQ/acKybe8o7BvhJj111fiONiU53kfmteeVm9+Hj/3KPQevIJQsAxUreqD8bKmruDClIslKHX/f5p6Kiq96ps0yfcHg7OPmGfNH6x4M5fSsxEyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfK1gAKaxc06QxEGH4rsRQ2svR0t2dib7ZOV92E0sRA=;
 b=mxgJnBVbdC19WYMBPkq0Fi2UhVhkJ+8A1vPKlr41Qkc6gZ4F6dqQ2uCUKhewVMoA9xUaA0JBHIjOiewHMJQ6AEhEPHdP5s0M1iJDsbuurxENAxWlE+I38NVFmJ4vT5lJh+vicsXFm2dMxW10VxygBZrIsuGsFJEkrhknq7YlnnU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pvh: pass module command line to dom0
Date: Fri, 29 Jan 2021 10:05:51 +0100
Message-ID: <20210129090551.15608-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0012.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a19e268e-7f19-4a86-7e9b-08d8c4351741
X-MS-TrafficTypeDiagnostic: DM5PR03MB2842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2842297255A2649723D3F2578FB99@DM5PR03MB2842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QWPFPM1aD6DhUSMg69u8E1p3Pb5MI2hGOc5MgiVj4w4dhBdix4qqXJzKQISg0rQZu+ojLF46kup5eIoYj2Z3r0sA0TzPXQ0wrKiAKho4I7BeqhtZjvDadrod9oMxcTKh6dKjZAa4il2Jg/Hum/DE2Ylf8jw6/oTw2OyxkKA31ShLhq5WPygEFNA/CvTlG6/R7TuY7LBipAQEdFPkWqS2Y650ndJTO8e3nCUtCZtnrcljVTU8UpbC9JldsHb+VfeODXrtdN5TPKromC+GU5DUS1uQxIOO0lcYfkWhTNc0D6q/J4VCWtA+dJuVzG2iYlTqjktXibWcNA3vP38/Dh2I2k4mXwe4YQXmTpxWLAliPjRbDueCbXaqD0mDDwQeIqVBmsxzve6AzfIy6jPRgWmL3hNFunnJriUknpjnNjiUcigwcwQXZQw+mShxH1jPmD41rocmb8Rqg1BjAb7E75dhAJJIPnIvrrSzNgObTckEksQ423AD5Pn6jl7csSrokyDbNOXAB1Zc1LacFD2Hn8uKZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(26005)(6666004)(66556008)(83380400001)(54906003)(86362001)(16526019)(1076003)(316002)(478600001)(5660300002)(66476007)(6916009)(66946007)(8676002)(2616005)(2906002)(36756003)(4326008)(956004)(8936002)(6496006)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dzh2MEN5S2lncDFVOXRBOFd1bzZzRG41eHJjS3FLdUgvbGFzZDZ1M2FJb3Fn?=
 =?utf-8?B?UzBoTFcvMUJXK3A3K1h2R0VQR1Y2N1A0MXA3bFArZVdHWVBNVVB3T2hNVEpP?=
 =?utf-8?B?eUEzYUVhUjJaYzIxQmU4NGFtL2hCNnM3RnRYY1lnWWw5MHZ6a1czUjVRN3VN?=
 =?utf-8?B?Qm9wU1JuR3JUM3FUZDdIU05LRStxZnZ4ci9zbmJncitxTm9lZW5iMG5waWtC?=
 =?utf-8?B?M2lRYi9tNzlOVlVhVjc3OEFrVmNYNUIzZFZuMytXc1FuTnF2dnpyTTdSKzZY?=
 =?utf-8?B?SHdUZEpZWlBRbkVlcXZ5OFF6dkZkaFMxanR6MEhBWG1jeHNmOHF4V2dlKzdT?=
 =?utf-8?B?WjNBNnBvaStYOHpoaTV4WUVPRExoTUtOWUVCNGJZeHhDaUhjYklPa1hLVlFm?=
 =?utf-8?B?aTVFK2U1OEY5eUx0emtxdnNlaGFFQXVEWDdYS2NmNFFjVlFXQmVRbjZHMjFv?=
 =?utf-8?B?TUZkVDJldU1BTVFabDJ2Wmx2M05wa2xPRUYzVGlmUHBURkovL0thWWZOSWx4?=
 =?utf-8?B?TEtlclFFU0Z1Y29LSGtCV1ZZd1I1NWF5THR5QmNEckhTVk9kY2NSUStvYlk3?=
 =?utf-8?B?dDB1dVZNeHdmTUFhbDhRVGFrcEF4OFIrWTlucG1RVitqMUl4MmFSbEE2aTlw?=
 =?utf-8?B?YVRTZDVOaTNmU1hlVDg1N3RpcUdWRXJWbHJyUjd5THdncEV5ZTVETGZuMjBs?=
 =?utf-8?B?d0NoTEhiZUYrVUVldmkxZkE5TGlBd0dsNCtxOUphOGJhcUxTRzdwTzFnUFdO?=
 =?utf-8?B?THlTdG1JU2d4ZkpEQmJCUUlqbE5hTkdOREZNR0FxeHZhbnd1UFV2TisxalRN?=
 =?utf-8?B?Z1hOazJDZ1BDYkVvZGZxOVhzc3NqNHNZMXFkMms4QU52dkRjeU1RTVIvWk9z?=
 =?utf-8?B?a1hBKzM4enk2SUlnbHFPU3dSSEFHVFZ3L3ZuWSthT0ZkNnJ1TE95MVRvNVBX?=
 =?utf-8?B?YjhDMGpFNEV1alc0VXlJdTJudDVITHJBbloreXRwQWpuTnF3YlNTOHU1Tm8r?=
 =?utf-8?B?UGdXSEM2NC90b0l3Wm5OWS9uV09vN3VxbFVmRjFwS3ErdGRzbjF6aWtObnlV?=
 =?utf-8?B?Zit2dFY5SWdveklPM1pYYWVSOHB5bE5DTkdJTlRIdTZwdHE2N1pJK25lTk1C?=
 =?utf-8?B?dnprMlIzdUV1emY3ZHBwN1U1M0UxZFRlTjVWUGMxTUw2YmFXNUhvN3pNWmJ3?=
 =?utf-8?B?MzhXODdXR0pnTmxxZGdCMmRib2s1V21Id0ExRmtSa1Iva0FNeGN1bHFyVDlM?=
 =?utf-8?B?WG5tQ09MVVVHRzFyV1I2SHN3NGYrak1RUUswUzBjTkUxeTh6blRGT3hvTHB5?=
 =?utf-8?B?c0FsUEgySW5EU3ZzeDZCZlhWTm9KRmZ0TlpkOTFDekVVaGdQbVhuWnBsK0p5?=
 =?utf-8?B?Yk5KNFBYcERXTUF4UkVTV2Q5SGNhWnVMY3dybG9kcXhZNkp6VlM5WExGem5v?=
 =?utf-8?B?a1pZSWx5YlJRay9uelFhRmtoR00zZC8wM1RUdUF3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a19e268e-7f19-4a86-7e9b-08d8c4351741
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 09:05:57.7674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5f2xcm7HGuYeNj4Qd4k2UvYwvAv5dBNkgNaX7Fa/R3d9afnkUuRc+Xl7o2I6YR7uPkGnLob92+X4oxNvtdYAdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2842
X-OriginatorOrg: citrix.com

Both the multiboot and the HVM start info structures allow passing a
string together with a module. Implement the missing support in
pvh_load_kernel so that module strings found in the multiboot
structure are forwarded to dom0.

Fixes: 62ba982424 ('x86: parse Dom0 kernel for PVHv2')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
NB: str cannot be made const because __hvm_copy buf parameter (that
maps to str in the added code) is bi-directional depending on the
flags passed to the function.
---
 xen/arch/x86/hvm/dom0_build.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 12a82c9d7c..5f9281ce30 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -617,7 +617,21 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
 
         mod.paddr = last_addr;
         mod.size = initrd->mod_end;
-        last_addr += ROUNDUP(initrd->mod_end, PAGE_SIZE);
+        last_addr += ROUNDUP(initrd->mod_end, elf_64bit(&elf) ? 8 : 4);
+        if ( initrd->string )
+        {
+            char *str = __va(initrd->string);
+
+            rc = hvm_copy_to_guest_phys(last_addr, str, strlen(str) + 1, v);
+            if ( rc )
+            {
+                printk("Unable to copy module command line\n");
+                return rc;
+            }
+            mod.cmdline_paddr = last_addr;
+            last_addr += strlen(str) + 1;
+        }
+        last_addr = ROUNDUP(last_addr, PAGE_SIZE);
     }
 
     /* Free temporary buffers. */
-- 
2.29.2


