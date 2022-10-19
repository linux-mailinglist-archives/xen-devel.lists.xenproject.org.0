Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDC4603AD9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425564.673472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3ie-0005ef-Sj; Wed, 19 Oct 2022 07:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425564.673472; Wed, 19 Oct 2022 07:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3ie-0005bi-PK; Wed, 19 Oct 2022 07:42:28 +0000
Received: by outflank-mailman (input) for mailman id 425564;
 Wed, 19 Oct 2022 07:42:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3id-0005MY-5o
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:42:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 935eeb23-4f81-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 09:42:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 07:42:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:42:25 +0000
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
X-Inumbo-ID: 935eeb23-4f81-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4yvjRXlAT++a4p1luomrB4x147nghCWDomEr2n7DVcb3AWHSjhyhebOaJ7nIJyTNShCuWEXtT8BxyuYZkdJ7D0721FYvOSU2QJAAQ/kE9WUNcbvrGR4fLg7dooTBAiq2KnrhzUrkFmm7MxMnji6XGKA2MRQaKPQQmVhSAr1k3UGpvKriJ8p2tM+Gtl6O9Zi0svGb4WjomuXcxYSl+628iT8u4895IfcOSCzT3dG8cSi7F4gXl3q4Zv0jN2FS3NDEDU0cBiNMfDh2R34XLE5q5CgMTSjLDPdfAsrOmCARc2p4jJhASGYIuuEnPu73Fk+OxxHpwtyY/v6fcoYfigLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVtvQDy47SYv74CafBwlr5zPDrPScUVwTLeJSlDM1jo=;
 b=UNUC8NnMwE8gLZGE1PcvPoqx6BSnrQyQlFbaq4RRlE3Ppscup7lfUvZmaZ5Wa2Fs4GP1v0I32nhtpf42DXRUnU16IHRiHBgbBC82xZKGTKnK2ujj1SeLKrwm0zXybbcWO+kTUprWzXMs+QBMRhaQHaBrg9q0MhJ402gP5/3WShDrwAV1umm+np4OUflCFGJkJmyatvZKGgCqUfEhNcmqIZLVFtpev0EyZg1XzHJRh25IiXfQ1WECxA6TC75buIun8KkBXivBU+1tDHgbIN8gwp66mKC+AmD8T01yJcngOfzPETPPR8HJgFM6EOiZkjE3iZ18kroij86gTch1I15H6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVtvQDy47SYv74CafBwlr5zPDrPScUVwTLeJSlDM1jo=;
 b=htwLii9fKmyNouln8Q+nQ5QTcuu8R9f5JS5z36E/WLTpZEcCV21lH+Y/oNuGHzKezLmy3z9k9tWLtF6Bb+8P1hCLQeJLi6ck7WI2p9hvk79gJBQmqc4HEeuBo1fc00/t55ynhYkujmbykavlHRAsje7iefMhhXTfhureA2ljV7tgB2WSDJORefPdi/+u2VmetHcrmkFTfMZsBmoPQWIhofXOH8HKIRvU4WtpLdFQxV4hHP+1EgwwPF/8D9Nudx4K6aVk8DUFYCemgAo8wq0Mz+0ksUb17fciX0JJYT7hSutUCichXArf6gvGEybT5mYgT5lxIV5NWKn896FTrBAsGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb3be891-1dad-43db-da69-f20a471ccdb7@suse.com>
Date: Wed, 19 Oct 2022 09:42:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: [PATCH 06/10] x86/mem-sharing: copy GADDR based shared guest areas
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
In-Reply-To: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: e617502b-760b-4131-68c1-08dab1a576b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K3AP1NupAyj7rYhopa43ytpqqHS9B34FnfPkd1zCKA/FJUP6YUaDPbb4besXONadrX8+lp4qYabOcw7jI+PP5AdpBUdU9N342Xx9Zg9S77wrD9ZUZRXPLFa6WDHziSE1BXgwCPIg6HoOpinBgY2tTa3i71umP/S8QKqRFYjBg0XXR5xPx/edbg6P1fOV+zO3adY9guxDUL9SCTWGmrQi3XUx9KlyK3AaWRZxuhRWhA5r1CDc6JHdMUxdKyLw8JVczPKv+aIy6OpKH6xSyKwjG4iG3ogF6zL7Qf+EvNX/CdokT7YkiaBbQHA72jTArkjIbBTu5SqyfZApLDZ3qnStU91GikxoZ5fe9NbxODoBv/Ui3K3kVkbRnMeE1iODTRkIxlgl+vXrGBJjrzIGRB/2xpvDPTE/4e5NIMsollfbk5IRFtMfBCIFPdvwiiDoioyElP8e4w7PKhVNVjMOAQ0Ly1Ob58bieBmu76Lv7F7fLOfUk7I/4PJKmKhDOLEGL8nJ/KDecZ0b/X6MiY8OR7g5sOae1WuqcSdVGLYDv5HPXyOJrVcrA5jdSW51odkKQcoMlg7xG+RGqKluarSiV3GuX8VZ+bOz4LKE0kRWfiX5F4Her9hO9bgCdO7il9GDMK+M1+vVMNuE0K0/jnaZLpuxK7UMRhkAuvwriV817VlIZ51xYs02MUvKqz7ys8d126gsXxaY8RdCLggilSgW/H/3xAVH5DICJErMCF8fPClz4S66ObBBqtHg7bsrkiJZ/exHpcjJJzoeIm5KZxItyoRlFum6BXmFcIxSgRWAmG4RFic=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(36756003)(31686004)(86362001)(31696002)(38100700002)(2906002)(5660300002)(186003)(2616005)(6916009)(83380400001)(26005)(6486002)(316002)(6506007)(41300700001)(478600001)(6512007)(54906003)(66556008)(66946007)(66476007)(8936002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejdkc1hnM2F6ZEt2aXovOFl3SVJXV0wra3dDb29XK2RITVhtZUkvNmk5cVcv?=
 =?utf-8?B?YWRPMVJ4RVkyVER4SkRUbUEwdjJ0dXFrNVVlWE4xdVBHcmFIVlZEalV3Nmg3?=
 =?utf-8?B?STh3amFOS21KMVhvS3owSW9vZTQrb00yUzdyZGgyUG0yZUV1Z2ZxSWRXSFlu?=
 =?utf-8?B?U0NFUE5KanJGcjNOZ2YrRlAyNDFkWndEVmtHSlJnNTRqeU9ycG9BUTRzcDc1?=
 =?utf-8?B?SHVMNDE0MWlUZHBURzVwaTJyUTUvUWZFbGl3UU83Y0xPNS9nK3B1UFhsbGZM?=
 =?utf-8?B?SU82TnNjYTNEenAwUkJHU2E0YUpIbEtyelpJVnpaQ0NLekZ0NTZaT0VjcHhF?=
 =?utf-8?B?ZkZla0R6VFpRWWZ6YTduM290ZWtwRWQ4cTg1YWVBRk9ybXl1TEZ5cTY3SFdR?=
 =?utf-8?B?S0RaVnJuN0ZKWU1KU3ZweEIycFJwNTVMK0RPM2NoRlo1M2tZeG9BK25XUEY2?=
 =?utf-8?B?TVlONm1lK2lSM1JCVTZLZGpYcnlRYk1ZY0RSRjN6Q3dYSks3RytISTNGVE9o?=
 =?utf-8?B?OFpWQ3lCNVZ4S1p4Z0hzUUNQQ216V1Rtak12dnlONUtlTXdqNEZPNzk3WTBh?=
 =?utf-8?B?bXBJUXVJb2QreGZZMnB5cmZPV2dvaFFCSWNUdUJtRHIxL1JtSTlGOC9mSkNH?=
 =?utf-8?B?M09uT0lPT1RVazFCTUg1a1lydzV2c0NNOGMxQmM4OTRvRnNrZlAwVVhidEw1?=
 =?utf-8?B?Q2wxaldtMC9jZ0tWcVhldkc0ajBqQmN4S1JHUk5nOWNtTlBySUFHN000ZURW?=
 =?utf-8?B?NXo4V0hYS2ZQbEpXcUtPOFd2MGhVandSd1BrNXRzNm5KT3RoZmNVZVlDbldE?=
 =?utf-8?B?a3hzZDV4SGdEU3RXaE91OTdodmVRbDlhUmNOVVdsc2tQNTVSMkR0RkVjbm95?=
 =?utf-8?B?NFgvd1RSbzE3bUJwdkpGd1RTaFRNV2o4Ulk1M0xoMTZiWUl0MlZIcE5ZelRG?=
 =?utf-8?B?YWI3OVJEeHRCdU4zVmdFVnZNUmlsMUVQOXNhTkZrYzJwRDhwUzhGaHVnSkRF?=
 =?utf-8?B?aEFOVnBjSFVUclVTMkJlWUwzT0pDWEFiditFWi9kQTFwMlowbnpJL0wvZGph?=
 =?utf-8?B?U0pHRkcyQTEybG4rd0NwWm5PcjNCeG1sYVJrSlY1VTJpU2h3L2VmVDE5QlVk?=
 =?utf-8?B?cU9hSXJoWW1YdHY2K01Yb0grWG0wTmhUYUJXeWxDbzFQam40Y05TUzhSWWRr?=
 =?utf-8?B?dGlmaHp4ekZuU3VDK0w2UlV0bmdpWGtWV2NYRWo2RHkwS0xJc1g3emJ5VEtJ?=
 =?utf-8?B?VEhqcDRLYkJ6YWZPVkYvamhSNmxxYUxoVG14RW9lOFVJVENzaUJWc09GNmxF?=
 =?utf-8?B?enM2RHZnSmVQbjJyODUxV0pTVzR1OUpUV1dSSCtLWk5FTStVRTlOZDhIci9s?=
 =?utf-8?B?TVJtN0pabGorT0NVVmVMOVRaaVZ5cmZBK3h5SUJaNStZTDZnTlhnMXppbmMz?=
 =?utf-8?B?WWZ3VUgvbityWndrazVRbWZlMGRtbDg4UGRpRkdCdGo5alZacU82aEoyQmJG?=
 =?utf-8?B?aTd6MnkxUmwyWDRlL0JsSUdMNG5nTUkvZ0Q5TzNqajhWTXJJa2FzK0RmMXZ4?=
 =?utf-8?B?VzBHc3B1bHVoZXVNYnV1d3Y1em9hZjFVUW9EaXRrdWV3VllQam5hSjNndXVJ?=
 =?utf-8?B?dUJZNmhUU09SOXdZU2l3QnYxaWo4REp4NzBJQXBGckNMN2h5QytsTUxXVEFy?=
 =?utf-8?B?VGFBM0l3N1pCYjBCMkRuRmJBYVJaNjNMcUtKSSsraG8zYU9XcEF1ZjB0VUxo?=
 =?utf-8?B?NUhHc1ZtUmFqSk5VQW92KzB5WExyai9PN1B1ekI1VTRZMzJOR0lndC9iZDYv?=
 =?utf-8?B?VGlqRkhoSUxNcUpKOW8xN1NUTU5UK1dKUXNOUFBHb2poUmluRDNpRUVjZEpv?=
 =?utf-8?B?cHFYTnZHdjMvWDRuTU1HT3pvQW82L1ZGS2FBYVJybnVSZ2o1THYwQjdDOEEw?=
 =?utf-8?B?dDkwaGVrL2NGL3lyTUsvQWRWclBoYmFmMmtwYTQ3L28veUVwc0o0RWlpOHo3?=
 =?utf-8?B?WU41U2g1ZEVObFdVeW5MejJrcGxKaVh6dzQyaUFSdkZLajlvZUJlUHhoaVVD?=
 =?utf-8?B?UGZtdXNBOE9VbW5jVWs5SWcwcUwvc3lJZVRTM091MU5PbU1RVUlONk5CMy83?=
 =?utf-8?Q?rx4mqiGbuHxYxDZrxucdt85bN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e617502b-760b-4131-68c1-08dab1a576b7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:42:25.2047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvL1Y3Uv16KC+CwCwPZN27LxL0jMZp3cTYlOUXiWW4jXzSOdVsQ2OP4wBnvWjOU+R+2lZK6lXxI6GVauvnip/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, add the necessary fork handling (with the
backing function yet to be filled in).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc
     hvm_set_nonreg_state(cd_vcpu, &nrs);
 }
 
+static int copy_guest_area(struct guest_area *cd_area,
+                           const struct guest_area *d_area,
+                           struct vcpu *cd_vcpu,
+                           const struct domain *d)
+{
+    mfn_t d_mfn, cd_mfn;
+
+    if ( !d_area->pg )
+        return 0;
+
+    d_mfn = page_to_mfn(d_area->pg);
+
+    /* Allocate & map a page for the area if it hasn't been already. */
+    if ( !cd_area->pg )
+    {
+        gfn_t gfn = mfn_to_gfn(d, d_mfn);
+        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
+        p2m_type_t p2mt;
+        p2m_access_t p2ma;
+        unsigned int offset;
+        int ret;
+
+        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
+        if ( mfn_eq(cd_mfn, INVALID_MFN) )
+        {
+            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
+
+            if ( !pg )
+                return -ENOMEM;
+
+            cd_mfn = page_to_mfn(pg);
+            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
+
+            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
+                                 p2m->default_access, -1);
+            if ( ret )
+                return ret;
+        }
+        else if ( p2mt != p2m_ram_rw )
+            return -EBUSY;
+
+        /*
+         * Simply specify the entire range up to the end of the page. All the
+         * function uses it for is a check for not crossing page boundaries.
+         */
+        offset = PAGE_OFFSET(d_area->map);
+        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
+                             PAGE_SIZE - offset, cd_area, NULL);
+        if ( ret )
+            return ret;
+    }
+    else
+        cd_mfn = page_to_mfn(cd_area->pg);
+
+    copy_domain_page(cd_mfn, d_mfn);
+
+    return 0;
+}
+
 static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
 {
     struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
@@ -1745,6 +1804,16 @@ static int copy_vcpu_settings(struct dom
             copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
         }
 
+        /* Same for the (physically registered) runstate and time info areas. */
+        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
+                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
+        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
+                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
+
         ret = copy_vpmu(d_vcpu, cd_vcpu);
         if ( ret )
             return ret;
@@ -1987,7 +2056,10 @@ int mem_sharing_fork_reset(struct domain
 
  state:
     if ( reset_state )
+    {
         rc = copy_settings(d, pd);
+        /* TBD: What to do here with -ERESTART? */
+    }
 
     domain_unpause(d);
 
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1559,6 +1559,13 @@ void unmap_vcpu_info(struct vcpu *v)
     put_page_and_type(mfn_to_page(mfn));
 }
 
+int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
+                   struct guest_area *area,
+                   void (*populate)(void *dst, struct vcpu *v))
+{
+    return -EOPNOTSUPP;
+}
+
 /*
  * This is only intended to be used for domain cleanup (or more generally only
  * with at least the respective vCPU, if it's not the current one, reliably


