Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5ED345CD2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 12:30:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100635.191892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOfDt-0001fW-7N; Tue, 23 Mar 2021 11:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100635.191892; Tue, 23 Mar 2021 11:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOfDt-0001f6-2q; Tue, 23 Mar 2021 11:29:21 +0000
Received: by outflank-mailman (input) for mailman id 100635;
 Tue, 23 Mar 2021 11:29:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOfDq-0001f1-IP
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 11:29:18 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3c87e2d-ec61-412d-a176-35a9d68645e7;
 Tue, 23 Mar 2021 11:29:17 +0000 (UTC)
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
X-Inumbo-ID: c3c87e2d-ec61-412d-a176-35a9d68645e7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616498956;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=xEu885UNxUN9j/ytsYtUWP7Zn2rlbDCRHxIrln+6bdg=;
  b=U0AP6Hq7N06uyU3TyEckr5gM3XXAH8U7ri+w3bTtBUSkbDlQePFeNLms
   unPx7LQAc8aI8gJX/0okSKjIqGvnyoH1vusP2RAjzMgwBiGXDckWJRxhO
   QlfFhf/wuMP9Yak23ZgUXbtaNttiwgYE69Apdd6Epcb0ws36S9dZOcMW1
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FcKmANCDRKhTvWpykVbRCe2zOaj4T2YZDC3GwJvLY9s5tsPfpQeUh6XJ2N48IbBnAmlxdIGAO7
 X1oe7/vwp7NyWXwCr79zTbmJRknU+Tz7QE99ia+hBwKSMh8+xq+BWjiF4PKiwGOZ86+gi4asxA
 O4DkgOsDfYjNg64tEx8H0q/abQ5JNWi2y+xNEjymTuJSHO6JAZOOoDIyIYE9ZSWM39fUBBEFzL
 OosO/Y7TZ6BEBvC18/o4HcoVFxCaNWxY0u5yr5stH3B7fIxW+jzm/RIJsp2AyVCvyty56r8H43
 gtY=
X-SBRS: 5.2
X-MesageID: 40267227
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EcQ/i6kqvxtzx1Kfqpf1NN5Zj2TpDfN8iWdD5ilNYBxZY6Wkvu
 ql9c5rtyPcojAXRX0mhJS8KLCNKEmsi6JdzKswGfOZXAfgsHa1N40K1+Hf6hDpBiGWzJ856Y
 5OaK57YeeRMXFbid/9+xSxFNwtqeP3iZyApeCb9Ht1SBEvVqcI1WZEIyK6NmEzewVcH5o+E/
 Onl616jh6tY24eYMj+JnRtZZm1m/TxmJjrYQELCnccgWHk4F/GhoLSKBSW0gwTVDlC294ZgA
 74ujb04b+irvGlygLNvlWji6h+osfryddIGaW3+74oAwjr4zzYB7hJavmuvCo+pemu7Fom+e
 O83ysIDoBSwFeUVl7wjDfR9yPc8BAIgkWSu2OwsD/Ciui8bA1/NOZ7v6J+VXLimj8dleA58I
 lum1iBv55yCx7dmSjmo+LDUQpnjCOP0AofuN9Wr1d6FbEGYLt0q4EC+U9OVKgNBzj77oc8ed
 Mef/301bJ1fV+CVXzfowBUsaaRd0V2OzKgZFQescqI1DU+pgEF82IogOgWnnIN7/sGOuJ5zt
 WBC79pkqpPU99+V9MEOM4xBfKtDGrDWBTNN3/XG03uEOU9N3rWrZmf2sR82MiaPKUSyp08gZ
 LAV04dim4oZ1irNsGUxp1M9Xn2MSyAdAWo9+ZzyLRnsrjhTKfmPES4OS8Tutrlqf4eD6TgKo
 eOEYMTCfT7JXDjHptI0mTFKu1vFUU=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40267227"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHtUgSQ3L2eCDLD8uqsXMoj5mZJJ11b9WTeFo1rpv7VZjGxPjQ9P1s1WdqVWlorEyzhHHXxW2YEPa6keoqlHZYfPjClT0RfgFWuBLPywsExQuefl9dWKqO1hlQ4XXaLen2tmBgEZ/tXwlc0iE/vkw3LUIt2S52todPpuxreJD2GAZ3QlAT3b/aX9Jx0Rk4tsMawq/8AHAX4cYxfYZRuaIjOo49lnxRX0B0qIkdQywf2+kKrZPviwmWJ02etkgs94aQad319OzS9R8D5I7shBprshAOOwsIZCTAyUPnc8L5EZGL+pWZK2mg49D5Bjpg/PTLW2WWWfkzaymq4BZYJMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS+XhQJ/OeI9zJkeGx8nS0NK3z03BOORSOXTHp1QKnk=;
 b=ZofZqpyzFeiPia7AwmtQupQGU7rUECY08b/0f2+OQe+awb0byLabJtg9B4csIUnLM+47xLdmHYHGZf/9ZmhJVpps1BWk7lPauUiJ9LmEygLPF2V162XKqtg3+R1BY68ibAPni24vZyHO7lmXmq8weNdX8FF9+LJmSEIcgNXHlx7Vkwo7PvVgMaUjun/Vb5ivW5rKV5vGAaDAOXOwL7pvsMHYMbQeyMVr+tMfU/5kMhyxQohKUvEmLvIgjIaJedRMbz7F0NnuYdWp0i2YLKGR3Mh6uTUYvrqE9v9SIPi4cwyshQXhnzcFraZvRlX/YwJOFo86aCD3NiidM9pT9UaIWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS+XhQJ/OeI9zJkeGx8nS0NK3z03BOORSOXTHp1QKnk=;
 b=JRnGmCeG8xBqMGokL5fvMNLPUwNARF5ZO+KwlJ6Ozk3RRsHKnelgyee1pKUpLp2RiOU6r8Sr1cj+pzBTJmdzQ95ixhPhMq0fDUtOEXC9aQ0AO2F//Um0cz/F1iql/RM6AkSmSdZRCTdlufnvMdEh72af3uzewgF4sFJGhjjteEQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] hvm/mtrr: remove unnecessary is_hvm_domain check
Date: Tue, 23 Mar 2021 12:29:00 +0100
Message-ID: <20210323112900.40723-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3d43334-5169-4e91-a3fb-08d8edeee1de
X-MS-TrafficTypeDiagnostic: DM6PR03MB5339:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5339F2248FDE6ED2FB1F877D8F649@DM6PR03MB5339.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x6B0qNoRPpSzMfEj+2HTFCTubrge6uZZxNYRmqp4NtHWCW2MWuOjRPAkjqb0aEdEDDJypWTHusvOMga30E1HdABwsztcw0KyqOx+gcHXoqNzqLMB/eEMVpMWsuA0s6nFrlA6rHhHakDE/3YBn1vXpLD2NhCofNg4p3f3cHKHBU63XEv7cJxkeXUsx4lOjONif7q5ehmGg/bWTlUXpLEFD8KLXvQPUc+4jtr+NTbODsBM0+SB/INfyj6JoeUPfHojPYp3a+dWW8f49HaGm9Jn74KJfIQmJA5lCGtKW50iiBpbv4E5EDosqS0AJ7UKN98D4u/RXwjiFljbvTt6kz90x29wmA1EmXiR1hcP4EOk2+q2ga+ehAtRIJvLq1Z/NTMi4ovHNd+V7cvrfSl7D9JF2qdw36v3XvwzMNPfCE4HqBlr0hizdoEbM507uppKMziks5MvJBrG6fN6CeQB+X/0tNuNTJG8vGCQ2tWvMnrt5KSqLgtaEHACX4UhUuQ2Y0q+1xBTPUSzahUU/u74Q2aKJ6TgkL11AR7WlE4WMuMhVhphs5R4oP4odehOyFM4BXixlc083DC5rPNnz5oTMSPZ5Tin+NL58gQwIsLi8/qye7Mka/lsHyqbZN6sDXCEcAT5Va1tA7/O+OEwIcKcbJqU2SkvF46D2RBBj+d8hsz0o0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(478600001)(38100700001)(6916009)(26005)(186003)(16526019)(1076003)(36756003)(8936002)(316002)(6496006)(8676002)(5660300002)(4744005)(2616005)(4326008)(956004)(6666004)(6486002)(66556008)(66476007)(2906002)(66946007)(83380400001)(86362001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?di84VnVMd2MyWGc2NVJWYXRPblZCQndkWnYrQkdZVDhSOUxDZktza09QSUtS?=
 =?utf-8?B?aWhhV1NlcExWUitEL21wWWRZVWZQZzBTdW1XMURrQmcvR1NZWFhpMWRCRVN3?=
 =?utf-8?B?OEp0azFQd1JvLzNXcGFkaldPTlFaY2RWb0pVWnBpcTVRaUpGcjJNTGFuK1hR?=
 =?utf-8?B?VDJVeVloM1NlT0tZS2RvN2JHdTZuUGZZWmUrRmRDaklIdmVwODJ0bnlWR3hB?=
 =?utf-8?B?bVAzbytEUm1IWjZLcjlMc2dBWGtiZklkL3pZUE16NUo4a3VMOWVyaTNkSVlV?=
 =?utf-8?B?dmRsdmo4QTRjZEJxRzdXMWhUNHd6SThtdHNjbzBTWkRPMFc0M0JxcUxVTXlD?=
 =?utf-8?B?TElvT3QyK0lYbTJkWlZ0VSthYzV3bkM3Rk1CdzQ3Vm1DQ2g5QlhTUkYwNFRU?=
 =?utf-8?B?UjJPcWE5V3lqdGtESkdjTmlLVFdDSmdyMXdNV1doWG5RT2I5SGxObEtGVEJN?=
 =?utf-8?B?WVRhZm1MU0Nzb3FWMmhyVzVyNm5IL1hONlczUS9IeEZ4eEErUnVTNFBvaFJy?=
 =?utf-8?B?cDVLaEVUTEFwTUZRNzV1Rk1LRngwWnZ5ZHBCbWRMbmVZUWF4d3ZwUEIzQnk2?=
 =?utf-8?B?MkdGcFVBcmJaLzlNVU53SWxSU2F4bUJ4Q2grbTZXUWVaQzdDbmdxeEQzUFZq?=
 =?utf-8?B?YjV3c3dtNDRMcGhYTXE1SmNqc3NEU2V2bVAxZnh4c3FKa0lDRzlmM21jb0RI?=
 =?utf-8?B?bFJUQ1p3aGhDL01NbFYxM012SXZzUkN0azN4SSs0Vlk4d3pUaEQyS25CajFT?=
 =?utf-8?B?Rk83V01QVi9YWkpTZVNyZEVDd2hpRDRHanp0VDh1emVxU245VkNKOU1hdTNk?=
 =?utf-8?B?Tlh1N3FhNzU4L1Y0Z3RBc09HQi8zNWVITE9CQ2crVmZTeWJJU2xKV0h4Yzlp?=
 =?utf-8?B?ZHo0cFB3dDFMWE93S2t5Y2tma25KeWs3a3VaWFJ4SVBhaWpWdkIrOHRNaTJQ?=
 =?utf-8?B?TkUxRkNmL3BVTjNBZUtNNU1CTm1YcHJMd2hBT0lsMEI4bGFzdk55blY1MTBi?=
 =?utf-8?B?aXlNMFZ1eTN6V0VXNGVaUnYweEpHbnMxbzlRYm1OaGpzaHh6YjlUNUlDei94?=
 =?utf-8?B?Q2ZnYXZrOThjNXIxd3ptSUZRNlNmKzF1QVZCOG1VUU5ac0tNM0gySnNxS2Nq?=
 =?utf-8?B?WE1pd2d0c0hGSy9MVmw0M0FUWnU1cXN0bnU1eWkyZzM2b1M2V05FT0wzQkpq?=
 =?utf-8?B?OWw3VUx3YkVjY0QzdHlTVFlKTHBkVVVPaDBWd1hLUnh5ZHptTjJTWG4vK0Ev?=
 =?utf-8?B?bEx4T0EvcTlsWkkxYXcvaFNSM3BVcEJMdjFCQ3VTN2VVZmVPZzArTkVVb3NU?=
 =?utf-8?B?SVcxS0NCbk5JOFZEdTFVUEJkTTEydExCYllEaDFhbUU4TERSbThySmFYcDB2?=
 =?utf-8?B?cFJPejdWZk5JdFpGMC9CaDE1SmR5YWdHRTU1dDJRVjcxZ3dJZnZacUFWTnY1?=
 =?utf-8?B?R1dKUmkrN01LWHVhdjJwdnJSeXdYWVJHMGZaaWZpeGhkWDkxSzlYcW9hOUxr?=
 =?utf-8?B?TngwZ1JYVTVTMWdlQUtJMTZLSFhaSVBMR1ZCbTZ4bGJuTVdyRTdkdTYwMHBa?=
 =?utf-8?B?TFl0NXJCaFYxZUdZWUI5VTE0cWhHVW1xVVdWV3Y1MzAzNGFVRk90VzVTazU0?=
 =?utf-8?B?dUF0UUpobW9JQ2VYbFNuQXJVNmd1RU16NDE3WVo2TW1UZzVUd0YySW1IRTJy?=
 =?utf-8?B?WS9vbHFUWUlScm9rNnR4b240RmkvQjF1czhoQmZETEdlcW5uR2d0aW1WSHVJ?=
 =?utf-8?B?S2pKRDdJMis4ejdHb2M5Q0FIc2h2am55RmFzWXZMV2VPcU5FTHRWa1M0cTgx?=
 =?utf-8?B?QzZNaWJ1OUM5L2Nna0I2dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d43334-5169-4e91-a3fb-08d8edeee1de
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 11:29:12.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a2sFHFctOhvi0iN8RiUQ33CLJjudZ52fM4OIP4TcNPuC9rG4GHwQL9JXAfR0DIgZuh/p3rSqXhSR/LzygkdiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5339
X-OriginatorOrg: citrix.com

epte_get_entry_emt will only be called for HVM domains, so the
is_hvm_domain check is unnecessary. It's a remnant of PVHv1.

Shouldn't result in any functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/mtrr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index fb051d59c3f..82ded1635c3 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -851,10 +851,8 @@ int epte_get_entry_emt(struct domain *d, unsigned long gfn, mfn_t mfn,
     if ( gmtrr_mtype == -EADDRNOTAVAIL )
         return -1;
 
-    gmtrr_mtype = is_hvm_domain(d) && v ?
-                  get_mtrr_type(&v->arch.hvm.mtrr,
-                                gfn << PAGE_SHIFT, order) :
-                  MTRR_TYPE_WRBACK;
+    gmtrr_mtype = v ? get_mtrr_type(&v->arch.hvm.mtrr, gfn << PAGE_SHIFT, order)
+                    : MTRR_TYPE_WRBACK;
     hmtrr_mtype = get_mtrr_type(&mtrr_state, mfn_x(mfn) << PAGE_SHIFT, order);
     if ( gmtrr_mtype < 0 || hmtrr_mtype < 0 )
         return -1;
-- 
2.30.1


