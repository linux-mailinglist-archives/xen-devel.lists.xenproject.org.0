Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE4C394695
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 19:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134042.249624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmgSp-0001Rz-Gp; Fri, 28 May 2021 17:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134042.249624; Fri, 28 May 2021 17:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmgSp-0001OS-CL; Fri, 28 May 2021 17:40:03 +0000
Received: by outflank-mailman (input) for mailman id 134042;
 Fri, 28 May 2021 17:40:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WKFi=KX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmgSn-0000ZU-Sk
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 17:40:01 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1022678-1dab-4265-9269-6e686d82b118;
 Fri, 28 May 2021 17:39:58 +0000 (UTC)
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
X-Inumbo-ID: b1022678-1dab-4265-9269-6e686d82b118
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622223598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=bvVMuM/HMP8ABLm9/U9j8KYIq8D0Cdsi9pnwcgfazSA=;
  b=LyTRiMgARwxMWJf0iOd0g6fgO7fNYbrWhEyQP2s+C4Lsm5vv1lY/MbUj
   U+Y18oCC0BjbkvU6LMB4Jm2FdiEeJJYFc0wGbh6ZarJf/fXB4mfbe8c7Z
   pmyc/qetIPim+qZRxmRkoIQbt5uvoyfEOvCiuVOMutw0XkAAa6dRsJKQN
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rBocOdJhVqCmH6Cs3RDUktMijpi94EDlr3TPpoipgHSXRpfQt8xXzV4nr2u4VPFAwQYamS0j3z
 WGqlE0yh3MUwfLWCFLZug/A/90JJ5NU6D/81PbvM45GbvK82Cjh3BtOtUnBMPl9WtNVOxrHgG7
 nIAMR9+qnfYqY5VWIDhqUCvBJFxFlIMAItwRphJ1r2QgCCgKu0hRGILEo1a+EwTN2l7HY0NhVt
 7p+gM7HXOEJy75EklgygIqAJnYUFaW/ib7RLgUV5fTrRYPbWqVNCSaKYY0q7RjAnZzUlG+Jtvq
 p24=
X-SBRS: 5.1
X-MesageID: 44631976
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:C2n/V6B4SRnrqn7lHeiTsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6Le90c67MAzhHP9OkPUs1NKZPTUO11HYVb2KgbGSpgEIXheOjNK1tp
 0QAJSWaueAdWSS5PySiGLTfqdCsbv3hZxAx92uskuFJTsaG52IhD0JbDpzfHcGIDWvUvECZe
 uhD4d81nSdkTN9VLXzOpFrNNKz5uHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX262oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF3nAiW0idvrD
 DwmWZmAywqgEmhOF1d4CGdmzUI6QxerkMLkjSj8CLeSaWTfkNJNyJD7bgpPycxpXBQ5O2Vfc
 pwriqkXqFsfGT9dRLGlpL1viFR5z6JSEUZ4JguZgRkIPAjgZ9q3MAiFRBuYdg99ByT0vFtLA
 A4NrCj2B8RSyLAU0zk
X-IronPort-AV: E=Sophos;i="5.83,230,1616472000"; 
   d="scan'208";a="44631976"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VL4xxXwrS9wor3KCFhWxFqH85w/w/lqVzjp0ykSTdTuosQ2UxDusrYYy5o5ajI0mzb5xOF2T+z5g70TuAslv2bB6jxe5JcWc7q2ysf9f1BaSLXmE39SlNh+YP7nJh7xpC7hqAAdrrZsxQJql5lh8bpJ8MEvu2CT+cCWGOMkar8v7lxJZXxQTPnR9Jy35gnQGsSZCOIF/m6dx7ivSFZYCwfolPm7Qp/uTcRu5WA20MHwYo1Y9cNmuSUqX5Zsev9J5rP+F3bjwLbuhhqXoo5jVpc9wfkjnlL8Slif+rgFVnU/ERurtAA9/jBl7CMeZlQCeuCQjUniO4SbL/e2z+07liA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJvcxRwg22ywwmHcBxf934ac3uryD0pmSSRdtpvFX8U=;
 b=PVu8KguDHiNNM7R3JAZFYL3XKaxTMwDG+R6RQljmh/PG0YB5gNFOIFrdkHRnrK9ZUx9rxkFckBdoV2Q6B0ydPbUoDc/DRq3cCds8TF2UjH5gOhU3VLJKTn9wN1+3lFchdr/RmIsEahld4I79lw3pEy9JWOcpKP89FXrpqjoG04jBOGd5FyEMcBKdt3aTh0QP6mNwwIURyT92Az+2KwWkH2p1lM8evfgIf8DeFFD8G6kuiW3k8viy7lnJ9BCKvO5p6t1aUiQw0Vb/XIQf5WwHh0hrYZnPzRalWH01zWVSBHgaLF51SjPRY8tYEommPD65CVQIEk7EayHtDNTvEYOXvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJvcxRwg22ywwmHcBxf934ac3uryD0pmSSRdtpvFX8U=;
 b=f5WRMDZSbDPh7hqA2tz1KmBVpBEO3Kf/o/d9srbj8eeX3loE7hg53UwXrkxGr0xAhu+4d8+kawQRrSXiNWFazcelrE5vcJ7tYEa2IYkf9XO9cIq6reQ97rCqFXT2cmH+ViGyoAanFDbjj+5swEmF23kedbRWZOP506L6jreizxk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, George Dunlap
	<george.dunlap@citrix.com>
Subject: [PATCH 2/3] x86/mtrr: move epte_get_entry_emt to p2m-ept.c
Date: Fri, 28 May 2021 19:39:34 +0200
Message-ID: <20210528173935.29919-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528173935.29919-1-roger.pau@citrix.com>
References: <20210528173935.29919-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c37482d-435b-4952-7e5d-08d921ff9acb
X-MS-TrafficTypeDiagnostic: DM4PR03MB5966:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB596663A2A7AF2CF3F984B64D8F229@DM4PR03MB5966.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h3hnrmg3OiMYZGcJHHwtV98Ty13QItmCXyTTQku2UDTDqmsN+owKX7p8flQvmxoJ8xs3r4TTyFTDz/9BHACM6+7FI3iNsTxZqcDjwX6t6/dLBzFcBOm16XGb4ZC0xxRsVb1B0xzBrtfMe9XXxaz1b0AzNkTbGheMo3eyj7GQYoSCbX3F8HIRLK/s/oUEj4ilC0eX6sgF1RM00bdXHJBFivRAohWv6ywY2JGqUVk/qJR2JPBveIy4E/BoZmwjFKkXUewDNGzJbVbaEP45xwIXl1sXEBJCcfbRHkrCrGoxppfRgRkYBRwCt41LG+lZIF1JE0Kkf/v3OmjYlvCeTUu005WZlx7MC+IWkqDjds1ELir39znwkB1CzoKlL3b7tWtYfO3XYUHL+swJDwqoG4byQtaeMT8yCx6tF3mpkrC8mE2dy8nz9s80C7+Yy5KlfclIRCAeqBqevs6rUnejKZw6A/Raomf05OhWEfNg6BH9iHl1W8GOcYTymZhNDV6QzxaZ/WcPMSS3Yt2pPZb05voaCeemNHkPmSxnPsgrJffbW5iROx/yPF8QAgxlBhaa/7BxqfQOWzmNn5BZMkIHb4qo1boKejh5VE0rlM6vgN0SCs8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(6666004)(107886003)(36756003)(2906002)(26005)(2616005)(66476007)(316002)(66556008)(186003)(66946007)(16526019)(54906003)(956004)(4326008)(38100700002)(6486002)(30864003)(8676002)(83380400001)(478600001)(8936002)(6496006)(86362001)(6916009)(1076003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VyttYlNnQzBIZ0hYSTZmVk1BWjNJUURKNGF0TzlQNGxzQ3pRY2VtTG5hTVhH?=
 =?utf-8?B?M1pkZHBkdjg1cjdtRkdVZmJuaFhVTXllaVAwUkduMXdoK2VQLzBVN000QVRE?=
 =?utf-8?B?ME9xQXFJemFlVEdyUjQrTUJqa3NRWTlpVU1MUXdsM1lCekwxZ0E5a0U0VVBo?=
 =?utf-8?B?bDc1aVl6V0haM0E0QnpzaUNITWIwemhoTnlwOXh2SXFPZ2ljUUpkV2UvT0Y4?=
 =?utf-8?B?ME5Da2Y2N3FOQlFIeDJlMUQ3ckRXT05vWktJcEphUUl3SitwYWtuYTFmc2Q4?=
 =?utf-8?B?QjhnU2x5NVJmOTBSMjdqVE42OXl1czRrK3VEeWY1aEZuTDQ2M0pBR0tkSFJn?=
 =?utf-8?B?T2dJRDJqd0ZMUDB0Y2hHUnE1Qm45SjRITlZNNTdpUnhyYXpaUmxNSEtGamlR?=
 =?utf-8?B?T1Y2Sm1MZExmWDVtVGdUYXBGM3lndzBPNTMxQklSU3JpVjJxNklkQU92WDJH?=
 =?utf-8?B?YXZtQUVOSElLaW5VY09aS2pIQndNQ3FSeHVLcm9Fb2hhMnFIRXBNeDFVT3hj?=
 =?utf-8?B?bllqR2pNdjRRekpZazB0bU9kYW5HcEFZeTJLOGt4eXphK3puN0JkTFRZZ1l4?=
 =?utf-8?B?d2UwSkhBN1FhSG5ZMzVGL0dmT01NTnFSN0R2MWpYY1BXbmhkUk91Y2tuM3VW?=
 =?utf-8?B?Qi9EbkZQZW84Q2hSczVmS1NoYmFCNGwvQUVOb1NIMmhycTdXWlRROXNJNFdx?=
 =?utf-8?B?ZFUvUEJDRWdPd1k4ZDcrMHQrOG5mcDR2L1BJcHJzSWN2MnVhakk1MC80SjRH?=
 =?utf-8?B?VWhNUzBHUDkzZDAvNU5SZDZ3Y3ZncGtjSktnOVB2Q0xmdTdzL1BLNTVIV0th?=
 =?utf-8?B?alZYOWw3bWlHS0M5OUU4Q3hSSHlWckFOclFsTndrYWFFS1A0aEU3NGN5YUZh?=
 =?utf-8?B?VnJHRGJkcjJGV09WNUVadlUyOUE4dktvdTRhMTc5ZWJoM1dyM2JHNGJFWncw?=
 =?utf-8?B?QnUwMThXQXRkTTZYUlZCWGhmZ0ZFMUhrM29TMVp4NVpWdUQxSDBkNHp2V0h5?=
 =?utf-8?B?STM1ZFNqSTc0NXJjUzdCUG1Sdmp6WjlYbEZydHdSMWNLSVV0Yk1wZlY4ZmNL?=
 =?utf-8?B?YVpQWXJmM2xFajc3ZStlK1NGaHJISXJLZk5qYjRYbXBBaVBkQmVxUEZhV2Z1?=
 =?utf-8?B?L1ZvdGpPeUNpeWxFRmxGbGQvNG9iN1VUSEFrL2I1N01VeXNGTW9HbGJRVmpT?=
 =?utf-8?B?TUIxUnFGZDdMUi9pWVhWSEVCZys1QW9IL1FlWTE0TEk2OGkyTGhRMkNyWmxB?=
 =?utf-8?B?R3R1QlZQK3lxQVJCcEJkUG56dENnL1JoL2NaZnhZamlQbVEvbThOd3BmOTY2?=
 =?utf-8?B?MGpBQ0g1Z3BTSHNsWDJDcTYzcy9idWVTeVpaZWhPNnpndjMzaGZibjZmRkdW?=
 =?utf-8?B?ZTZSenJTS290YzR1bzU2YjRuaDlOazAzbVdDTjlnYVB1N3c2Sm05WWM1cUxz?=
 =?utf-8?B?blIzNHBOM2FyQW8xM0JsYTY5ZWs0dEt5UDJ2UUV4emptblRTMHFkUG9FNTk2?=
 =?utf-8?B?UXMvZmo3UkY1Vmo2ZG12Uk1tZGpXa3NKQWlVOVQ4djBiU0hyTW4vYUxmYmh2?=
 =?utf-8?B?cWdRWS96OE0ya3Y3YXEyelhXOGlNRW5uSVYrbnJ2MG0ycVRQQmNZYXN6UkU1?=
 =?utf-8?B?UEV2ajBacENHNGY1bG1Pd1g2UWtVeFNMV2JCbHY5Sm9SSWVhNmtsNTZKS0tp?=
 =?utf-8?B?U1lteHprcHQ4c0NzWDdSRlhSYmlCZEM1VlU5blZrb1lrOGw3YVVYMkVHTEox?=
 =?utf-8?Q?eFa9dZX5alb8nhd9tJPuUSoeWWLWMOStaBk/ZQP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c37482d-435b-4952-7e5d-08d921ff9acb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:39:54.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiGorM+JTj0lcezfzXSFfpp9FQvYBQOtEOMU32kLtWGxw0Z/FqNT1CP99ZxVDAWJN6Pcn/q5LqhdAnwEwc+IgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5966
X-OriginatorOrg: citrix.com

This is an EPT specific function, so it shouldn't live in the generic
mtrr file. Such movement is also needed for future work that will
require passing a p2m_type_t parameter to epte_get_entry_emt, and
making that type visible to the mtrr users is cumbersome and
unneeded.

Moving epte_get_entry_emt out of mtrr.c requires making the helper to
get the MTRR type of an address from the mtrr state public. While
there rename the function to start with the mtrr prefix, like other
mtrr related functions.

While there fix some of the types of the function parameters.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/mtrr.c           | 107 +---------------------------
 xen/arch/x86/hvm/vmx/vmx.c        |   4 +-
 xen/arch/x86/mm/p2m-ept.c         | 114 ++++++++++++++++++++++++++++--
 xen/include/asm-x86/hvm/vmx/vmx.h |   2 +
 xen/include/asm-x86/mtrr.h        |   5 +-
 5 files changed, 118 insertions(+), 114 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 82ded1635c..4a9f3177ed 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -194,8 +194,7 @@ void hvm_vcpu_cacheattr_destroy(struct vcpu *v)
  * May return a negative value when order > 0, indicating to the caller
  * that the respective mapping needs splitting.
  */
-static int get_mtrr_type(const struct mtrr_state *m,
-                         paddr_t pa, unsigned int order)
+int mtrr_get_type(const struct mtrr_state *m, paddr_t pa, unsigned int order)
 {
    uint8_t     overlap_mtrr = 0;
    uint8_t     overlap_mtrr_pos = 0;
@@ -323,7 +322,7 @@ static uint8_t effective_mm_type(struct mtrr_state *m,
      * just use it
      */ 
     if ( gmtrr_mtype == NO_HARDCODE_MEM_TYPE )
-        mtrr_mtype = get_mtrr_type(m, gpa, 0);
+        mtrr_mtype = mtrr_get_type(m, gpa, 0);
     else
         mtrr_mtype = gmtrr_mtype;
 
@@ -350,7 +349,7 @@ uint32_t get_pat_flags(struct vcpu *v,
     guest_eff_mm_type = effective_mm_type(g, pat, gpaddr, 
                                           gl1e_flags, gmtrr_mtype);
     /* 2. Get the memory type of host physical address, with MTRR */
-    shadow_mtrr_type = get_mtrr_type(&mtrr_state, spaddr, 0);
+    shadow_mtrr_type = mtrr_get_type(&mtrr_state, spaddr, 0);
 
     /* 3. Find the memory type in PAT, with host MTRR memory type
      * and guest effective memory type.
@@ -789,106 +788,6 @@ void memory_type_changed(struct domain *d)
     }
 }
 
-int epte_get_entry_emt(struct domain *d, unsigned long gfn, mfn_t mfn,
-                       unsigned int order, uint8_t *ipat, bool_t direct_mmio)
-{
-    int gmtrr_mtype, hmtrr_mtype;
-    struct vcpu *v = current;
-    unsigned long i;
-
-    *ipat = 0;
-
-    if ( v->domain != d )
-        v = d->vcpu ? d->vcpu[0] : NULL;
-
-    /* Mask, not add, for order so it works with INVALID_MFN on unmapping */
-    if ( rangeset_overlaps_range(mmio_ro_ranges, mfn_x(mfn),
-                                 mfn_x(mfn) | ((1UL << order) - 1)) )
-    {
-        if ( !order || rangeset_contains_range(mmio_ro_ranges, mfn_x(mfn),
-                                               mfn_x(mfn) | ((1UL << order) - 1)) )
-        {
-            *ipat = 1;
-            return MTRR_TYPE_UNCACHABLE;
-        }
-        /* Force invalid memory type so resolve_misconfig() will split it */
-        return -1;
-    }
-
-    if ( !mfn_valid(mfn) )
-    {
-        *ipat = 1;
-        return MTRR_TYPE_UNCACHABLE;
-    }
-
-    if ( !direct_mmio && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
-    {
-        *ipat = 1;
-        return MTRR_TYPE_WRBACK;
-    }
-
-    for ( i = 0; i < (1ul << order); i++ )
-    {
-        if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
-        {
-            if ( order )
-                return -1;
-            *ipat = 1;
-            return MTRR_TYPE_WRBACK;
-        }
-    }
-
-    if ( direct_mmio )
-        return MTRR_TYPE_UNCACHABLE;
-
-    gmtrr_mtype = hvm_get_mem_pinned_cacheattr(d, _gfn(gfn), order);
-    if ( gmtrr_mtype >= 0 )
-    {
-        *ipat = 1;
-        return gmtrr_mtype != PAT_TYPE_UC_MINUS ? gmtrr_mtype
-                                                : MTRR_TYPE_UNCACHABLE;
-    }
-    if ( gmtrr_mtype == -EADDRNOTAVAIL )
-        return -1;
-
-    gmtrr_mtype = v ? get_mtrr_type(&v->arch.hvm.mtrr, gfn << PAGE_SHIFT, order)
-                    : MTRR_TYPE_WRBACK;
-    hmtrr_mtype = get_mtrr_type(&mtrr_state, mfn_x(mfn) << PAGE_SHIFT, order);
-    if ( gmtrr_mtype < 0 || hmtrr_mtype < 0 )
-        return -1;
-
-    /* If both types match we're fine. */
-    if ( likely(gmtrr_mtype == hmtrr_mtype) )
-        return hmtrr_mtype;
-
-    /* If either type is UC, we have to go with that one. */
-    if ( gmtrr_mtype == MTRR_TYPE_UNCACHABLE ||
-         hmtrr_mtype == MTRR_TYPE_UNCACHABLE )
-        return MTRR_TYPE_UNCACHABLE;
-
-    /* If either type is WB, we have to go with the other one. */
-    if ( gmtrr_mtype == MTRR_TYPE_WRBACK )
-        return hmtrr_mtype;
-    if ( hmtrr_mtype == MTRR_TYPE_WRBACK )
-        return gmtrr_mtype;
-
-    /*
-     * At this point we have disagreeing WC, WT, or WP types. The only
-     * combination that can be cleanly resolved is WT:WP. The ones involving
-     * WC need to be converted to UC, both due to the memory ordering
-     * differences and because WC disallows reads to be cached (WT and WP
-     * permit this), while WT and WP require writes to go straight to memory
-     * (WC can buffer them).
-     */
-    if ( (gmtrr_mtype == MTRR_TYPE_WRTHROUGH &&
-          hmtrr_mtype == MTRR_TYPE_WRPROT) ||
-         (gmtrr_mtype == MTRR_TYPE_WRPROT &&
-          hmtrr_mtype == MTRR_TYPE_WRTHROUGH) )
-        return MTRR_TYPE_WRPROT;
-
-    return MTRR_TYPE_UNCACHABLE;
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 7e3e67fdc3..0d4b47681b 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -417,12 +417,12 @@ static int vmx_domain_initialise(struct domain *d)
 static void domain_creation_finished(struct domain *d)
 {
     gfn_t gfn = gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE);
-    uint8_t ipat;
+    bool ipat;
 
     if ( !has_vlapic(d) || mfn_eq(apic_access_mfn, INVALID_MFN) )
         return;
 
-    ASSERT(epte_get_entry_emt(d, gfn_x(gfn), apic_access_mfn, 0, &ipat,
+    ASSERT(epte_get_entry_emt(d, gfn, apic_access_mfn, 0, &ipat,
                               true) == MTRR_TYPE_WRBACK);
     ASSERT(ipat);
 
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index a3beaf91e2..f1d1d07e92 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -20,6 +20,7 @@
 #include <public/hvm/dm_op.h>
 #include <asm/altp2m.h>
 #include <asm/current.h>
+#include <asm/iocap.h>
 #include <asm/paging.h>
 #include <asm/types.h>
 #include <asm/domain.h>
@@ -485,6 +486,108 @@ static int ept_invalidate_emt_range(struct p2m_domain *p2m,
     return rc;
 }
 
+int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
+                       unsigned int order, bool *ipat, bool direct_mmio)
+{
+    int gmtrr_mtype, hmtrr_mtype;
+    struct vcpu *v = current;
+    unsigned long i;
+
+    *ipat = false;
+
+    if ( v->domain != d )
+        v = d->vcpu ? d->vcpu[0] : NULL;
+
+    /* Mask, not add, for order so it works with INVALID_MFN on unmapping */
+    if ( rangeset_overlaps_range(mmio_ro_ranges, mfn_x(mfn),
+                                 mfn_x(mfn) | ((1UL << order) - 1)) )
+    {
+        if ( !order || rangeset_contains_range(mmio_ro_ranges, mfn_x(mfn),
+                                               mfn_x(mfn) | ((1UL << order) - 1)) )
+        {
+            *ipat = true;
+            return MTRR_TYPE_UNCACHABLE;
+        }
+        /* Force invalid memory type so resolve_misconfig() will split it */
+        return -1;
+    }
+
+    if ( !mfn_valid(mfn) )
+    {
+        *ipat = true;
+        return MTRR_TYPE_UNCACHABLE;
+    }
+
+    if ( !direct_mmio && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
+    {
+        *ipat = true;
+        return MTRR_TYPE_WRBACK;
+    }
+
+    for ( i = 0; i < (1ul << order); i++ )
+    {
+        if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
+        {
+            if ( order )
+                return -1;
+            *ipat = true;
+            return MTRR_TYPE_WRBACK;
+        }
+    }
+
+    if ( direct_mmio )
+        return MTRR_TYPE_UNCACHABLE;
+
+    gmtrr_mtype = hvm_get_mem_pinned_cacheattr(d, gfn, order);
+    if ( gmtrr_mtype >= 0 )
+    {
+        *ipat = true;
+        return gmtrr_mtype != PAT_TYPE_UC_MINUS ? gmtrr_mtype
+                                                : MTRR_TYPE_UNCACHABLE;
+    }
+    if ( gmtrr_mtype == -EADDRNOTAVAIL )
+        return -1;
+
+    gmtrr_mtype = v ? mtrr_get_type(&v->arch.hvm.mtrr,
+                                    gfn_x(gfn) << PAGE_SHIFT, order)
+                    : MTRR_TYPE_WRBACK;
+    hmtrr_mtype = mtrr_get_type(&mtrr_state, mfn_x(mfn) << PAGE_SHIFT,
+                                order);
+    if ( gmtrr_mtype < 0 || hmtrr_mtype < 0 )
+        return -1;
+
+    /* If both types match we're fine. */
+    if ( likely(gmtrr_mtype == hmtrr_mtype) )
+        return hmtrr_mtype;
+
+    /* If either type is UC, we have to go with that one. */
+    if ( gmtrr_mtype == MTRR_TYPE_UNCACHABLE ||
+         hmtrr_mtype == MTRR_TYPE_UNCACHABLE )
+        return MTRR_TYPE_UNCACHABLE;
+
+    /* If either type is WB, we have to go with the other one. */
+    if ( gmtrr_mtype == MTRR_TYPE_WRBACK )
+        return hmtrr_mtype;
+    if ( hmtrr_mtype == MTRR_TYPE_WRBACK )
+        return gmtrr_mtype;
+
+    /*
+     * At this point we have disagreeing WC, WT, or WP types. The only
+     * combination that can be cleanly resolved is WT:WP. The ones involving
+     * WC need to be converted to UC, both due to the memory ordering
+     * differences and because WC disallows reads to be cached (WT and WP
+     * permit this), while WT and WP require writes to go straight to memory
+     * (WC can buffer them).
+     */
+    if ( (gmtrr_mtype == MTRR_TYPE_WRTHROUGH &&
+          hmtrr_mtype == MTRR_TYPE_WRPROT) ||
+         (gmtrr_mtype == MTRR_TYPE_WRPROT &&
+          hmtrr_mtype == MTRR_TYPE_WRTHROUGH) )
+        return MTRR_TYPE_WRPROT;
+
+    return MTRR_TYPE_UNCACHABLE;
+}
+
 /*
  * Resolve deliberately mis-configured (EMT field set to an invalid value)
  * entries in the page table hierarchy for the given GFN:
@@ -519,7 +622,7 @@ static int resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
 
         if ( level == 0 || is_epte_superpage(&e) )
         {
-            uint8_t ipat = 0;
+            bool ipat;
 
             if ( e.emt != MTRR_NUM_TYPES )
                 break;
@@ -535,7 +638,7 @@ static int resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
                         e.emt = 0;
                     if ( !is_epte_valid(&e) || !is_epte_present(&e) )
                         continue;
-                    e.emt = epte_get_entry_emt(p2m->domain, gfn + i,
+                    e.emt = epte_get_entry_emt(p2m->domain, _gfn(gfn + i),
                                                _mfn(e.mfn), 0, &ipat,
                                                e.sa_p2mt == p2m_mmio_direct);
                     e.ipat = ipat;
@@ -553,7 +656,8 @@ static int resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
             }
             else
             {
-                int emt = epte_get_entry_emt(p2m->domain, gfn, _mfn(e.mfn),
+                int emt = epte_get_entry_emt(p2m->domain, _gfn(gfn),
+                                             _mfn(e.mfn),
                                              level * EPT_TABLE_ORDER, &ipat,
                                              e.sa_p2mt == p2m_mmio_direct);
                 bool_t recalc = e.recalc;
@@ -788,8 +892,8 @@ ept_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
 
     if ( mfn_valid(mfn) || p2m_allows_invalid_mfn(p2mt) )
     {
-        uint8_t ipat = 0;
-        int emt = epte_get_entry_emt(p2m->domain, gfn, mfn,
+        bool ipat;
+        int emt = epte_get_entry_emt(p2m->domain, _gfn(gfn), mfn,
                                      i * EPT_TABLE_ORDER, &ipat,
                                      p2mt == p2m_mmio_direct);
 
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/asm-x86/hvm/vmx/vmx.h
index 534e9fc221..f668ee1f09 100644
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -599,6 +599,8 @@ void ept_p2m_uninit(struct p2m_domain *p2m);
 
 void ept_walk_table(struct domain *d, unsigned long gfn);
 bool_t ept_handle_misconfig(uint64_t gpa);
+int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
+                       unsigned int order, bool *ipat, bool direct_mmio);
 void setup_ept_dump(void);
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
 /* Locate an alternate p2m by its EPTP */
diff --git a/xen/include/asm-x86/mtrr.h b/xen/include/asm-x86/mtrr.h
index 24e5de5c22..e0fd1005ce 100644
--- a/xen/include/asm-x86/mtrr.h
+++ b/xen/include/asm-x86/mtrr.h
@@ -72,12 +72,11 @@ extern int mtrr_add_page(unsigned long base, unsigned long size,
                          unsigned int type, char increment);
 extern int mtrr_del(int reg, unsigned long base, unsigned long size);
 extern int mtrr_del_page(int reg, unsigned long base, unsigned long size);
+extern int mtrr_get_type(const struct mtrr_state *m, paddr_t pa,
+                         unsigned int order);
 extern void mtrr_centaur_report_mcr(int mcr, u32 lo, u32 hi);
 extern u32 get_pat_flags(struct vcpu *v, u32 gl1e_flags, paddr_t gpaddr,
                   paddr_t spaddr, uint8_t gmtrr_mtype);
-extern int epte_get_entry_emt(struct domain *, unsigned long gfn, mfn_t mfn,
-                              unsigned int order, uint8_t *ipat,
-                              bool_t direct_mmio);
 extern unsigned char pat_type_2_pte_flags(unsigned char pat_type);
 extern int hold_mtrr_updates_on_aps;
 extern void mtrr_aps_sync_begin(void);
-- 
2.31.1


