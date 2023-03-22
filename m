Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E36C468C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:36:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513256.794015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peut1-0004A4-8p; Wed, 22 Mar 2023 09:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513256.794015; Wed, 22 Mar 2023 09:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peut1-00047h-5G; Wed, 22 Mar 2023 09:36:03 +0000
Received: by outflank-mailman (input) for mailman id 513256;
 Wed, 22 Mar 2023 09:36:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peusz-0001jq-Ga
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:36:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4e0f30a-c894-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:36:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7641.eurprd04.prod.outlook.com (2603:10a6:10:1f7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:35:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:35:59 +0000
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
X-Inumbo-ID: f4e0f30a-c894-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrCAUnBywKtY8ZQ6FXXQzx5sfC4rqLyIjbjXkpYzJ1d0gFPx0eIiKUcUY7bhMPCEPFJWZqOH26kEDB0ygtUMEcisuDIuprohlDN0g1bT2snJ5w3dHmWin+HASgp/YccLDR3oRv9zoDJ8Mf3jZ2il/PuiSf+CE94THZXcCmgTsgF5RfU/qMk2DyOfukKwmO2Ta0weqQrWdbSu4YYnFhNsgf+oA7/Og0MxLMdZo0uPTgnJmDBIDwfG5h6pIrbJ8++mz4Gb22HFFVlhdPoBmC8niJkiEZKd9DyX23KDGxGUqjlvaPQc+eS1onSRpoPNyfjD+RhgRF23x81PLch+cACtDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UD+Cm4n1hMaiv0YQYjnlNZKs67pHNL/O4K2oCASMyfw=;
 b=JgdODgcEgga9wAiyeifR4A/bj9S59s2TDEeMznZ4v/G2YocYOrK8VOZdDrZ1vFFjpXWk3GAGBRGKPTH99a/gvGiOfK1yxZHq8c9W6gCuneb1pCPQPtEEHzjCWsCzr5OgPJg3hmuJpiNTbP6mjZyMDffmwO1kInJA47yw57+BO4OhmbSzMfuASs8DhQGBhSgkVGh4wRLAZS00JLHh/qVVcsRmX/lp20txTEzur632QFJYuWQ81UcT04KGmY8R2PCtLJAkdsPxb3OPOs5KSPoiagyOlH/n07NtNnRQm/R5kHgUjyjXb1DVKbizqoB6diK14T6tebd+IbuJKKjKwNMj8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UD+Cm4n1hMaiv0YQYjnlNZKs67pHNL/O4K2oCASMyfw=;
 b=xZQpZrnXgN0AJj5uEji76qTOSc3BdiB5NMQBPNV6IqpqKXe5jUdc3rwR+v74oCXv2nO07pkbQ8T2hdRkt4mborZ+lpPtQCE5ZZzkkUHGtBq36TS8GCVTpIIPThhWaDd6VtvBhV0Hdgm6dgjjcyRgx1FiSKrUsm8w6gD5F2PddPe7W48v4BjEWaw9b4y7doAJ1ntAFfAh3nlEYjdJGCOMdqPUHGhknw2mmOcXgL0wIaF3ApvTygH6sM3bJqbx3ScPPDYLcTQr1lfajrg4fgXUWhOD2LLomg/7GLyrvQ+FvurnHNANdfLpu8EfVbykXCMCdYFbYtyGn7m7y53Xy7cxBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6ef377e-731e-faa4-aa43-ef40ea34be07@suse.com>
Date: Wed, 22 Mar 2023 10:35:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 12/16] x86/shadow: make monitor table create/destroy more
 consistent
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bafbbeb-5ce6-4fed-28fd-08db2ab8d837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CrKsTN6f+u1fptsMZUPigNOt8rPKzbcYc3qkX3sUIiqciz+nyqUXr+wUr/mmBfzw+yrtpkWxZJcHtSHnvLjyQ4h9mXq6/oOeAAByKTmE6QYHoa3xG+Gx+Qn4V3ClMG4+12O7FY0PTUTnQGxNdR8MuQY8KHaOr0zS+tK1oob4YhzWqArWHJB8K9bmqVhG78MUb9niN/8Ft/aqqy6rCcooVGZme1LtSRvMAODQrNXZz4QEqdbHWvnX64BAKML3V5D/Z7HrJjdu5FVN8cNZMy46VYx1DigwJZZ5KJcuUOjihdwwRUtGJie9x7/ONAekcG1QxpyxhbgLkIvms6wkzNZ7qc+gp02wOVcyaLcUyu9sr4ClTRl1TT1LBVpv/btXiIMdy4/wRhXjSZri0gMzb5LZqMb0c0btDXWF0yrfMAZYnbhie7Hh9PJtmF1vEUmg0T8gkfU93r4uM2zgjTQ0tSpzDTc5BeC1sW37KzkKbvUlNAjnqNGmyDU2lNpTH1tyVNEB4mTQ6vARinb/d4h/vdpUO55oDrG7ePinRch0jhx6ZCvXs6EpTGTYQ3/Opo02MgI0oqmASMWqtyEQV3oUkc9x5gcU7ZCqmXWJCs+YDqRNsGnGBHEJEAetP/MT1ICVlZs1CLHYA5SKn0GZYDYTdnTBw1JqSKC+ksw3Qd0n11WkkCcsyBKGYtKrooR/qC+sWqRqW1tThj0LKRlZvBMZf8S5T/W97Za3HOHlxKgIGUz04no=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(86362001)(31696002)(36756003)(38100700002)(83380400001)(8676002)(4326008)(316002)(478600001)(54906003)(66946007)(66476007)(6916009)(2616005)(6512007)(6506007)(66556008)(6486002)(31686004)(26005)(186003)(66899018)(5660300002)(8936002)(41300700001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE53RklnNXVkMUp3OER2YzBXK1NPL3dvcytXclZ0Y3NkRnkrWEx2SXY2dlZB?=
 =?utf-8?B?Ui9seUh5V3Z6OTFqdXVRemdwa3B4TDg0RVNjbWkybWV1V0dZQU93MWNZYVZU?=
 =?utf-8?B?QmtPWWZMVTlKdDlvN0M1UENVWEtUbTFtNjFPaFc4MUN4Qk55UnJ6VmFNWU5k?=
 =?utf-8?B?eWw4YVljVHN3enVqMTBQbldGWEN5Ulo5YmgzZGh2TXpSbnJaVkx5MkpDY2ts?=
 =?utf-8?B?SFZ6SGN0M25wakt2U3FjYlU0WlMrcFZ6bFVlbjZ3UlN2MVFsNUl3VGtramk5?=
 =?utf-8?B?NTJKaWNiOWM5Si9veU0rbUFLeEVEcWEraWRzUGpGdU02U1NlQkVna2xrQmhW?=
 =?utf-8?B?T1FFSkxzUGpDeDQwNXdnRlBuUkI0alR5VnUybG5ENnZZODlaY0xlYys2dEdT?=
 =?utf-8?B?U1dhYkZhUmpRdzU5ZnNodUF5eGIyQmZBcUhuZ21wZndpR3JJSGhhVTAyUnJu?=
 =?utf-8?B?REpaR2N3QnRySXZFTmltN0kvZXlKa2dDMnBpMm1YRUppNXhpQ0tpN3FZR29I?=
 =?utf-8?B?UGI0a2lxU1pFclRrWnAyQlFLcXoyb0tVQzE4eDg1cGtza1Zyck5VUTF2SWVB?=
 =?utf-8?B?WExBcVBrbFVhTDgvUnp3c0pRbnBaSmtGWVRhcERQYUVXQ0xEaWpqcXplM2ky?=
 =?utf-8?B?ZG1oWU1LTlhWR2VqT0V2V2tkTXVmMHlmem9JTnBFRncxK3N5K1FZMkQ2L1BY?=
 =?utf-8?B?L1ZyTkt6bWNJOG1wQkdEVWE3bjlUVTh0R1YyS0k0MmhaeE83VWs5UzgxVFIw?=
 =?utf-8?B?aElEeWFXdmF6UWxuRHhiSGpnZzdCVzduQWJ2T1dqMkgyaUs5bUhpL0JCTVpD?=
 =?utf-8?B?RWw2dmVjZ0phVkFPQ1d4dlNJZEVyWUw1S214WTdEbHRENjcrbmR1eldabUFQ?=
 =?utf-8?B?SFFiZVRZN2tpVjI3OTc3OU43NGhkZEFUUFhGcXZtZHhwbW1jWktlbm00bEY1?=
 =?utf-8?B?RGw2OVJTQlk5NmVzZktoclRURkZrY3ZhbWxkUHNoWUQyMzV6dmxlZFF0Rk1p?=
 =?utf-8?B?SEI0OFo2YmJueFlQakk5RjVWSUVVRXZVbEVPeVR4M3k5T1pkNWRoNSs0Ymxn?=
 =?utf-8?B?aXVGOTNmc2VHUUFxakJORTNpc1lwVUs5ZjJVbHpubFozNG56Qnk0MkgwSzdM?=
 =?utf-8?B?dEJzc0lVbkY4eFRScU1QenkxeUN1WHFsWUd2bjVPUHZUb0VRR1R5WmtPMmor?=
 =?utf-8?B?azhEckRvb0kvOWY5MkUwRDkweUp3WjFEUFhxWHdWaDR1MzMrVEhOWWFCSmRh?=
 =?utf-8?B?SzJPNm11Y2xJV0lzTmQwZ3ZPcGxhR0VMTi9lMEhJZzlORHIzWWswcFR5M1J2?=
 =?utf-8?B?TE5yNUsyeG0wTVlGN3JWMHNacjJDd2pXRHVENk1JcG42L2MrQzB0TnJXbko0?=
 =?utf-8?B?RU1pcjhyS1FpcUE0RUQ5eXVWQ2J3TERpb3hOUDUramY4UUw2bklpbll2eXQr?=
 =?utf-8?B?MVFVdkRjczlVS053d3hMNXZOdzZCV2dFR0xSWlBzY3ZMRW43cnBaRjVTNjZ2?=
 =?utf-8?B?alVxUndEaXZqbVFMUitEYUhLQ0VCWHc3TDREViswMFhoc0x0bEFNam9meHZT?=
 =?utf-8?B?cnlvYWJLYjREclhUSXN5OXc3MFMrT21TVUQ4Nk9jWWphNi9HK1dTSWdOaGxq?=
 =?utf-8?B?d091VGlIN1ZZMzZTWjZXL0VvK2RQK2kwUUFmN3V2TFVacE9wTVpnWmNjRE1T?=
 =?utf-8?B?VzBGTzZtTkxZemU5U3A4WnV6T1dZWGEyNzdhRHZNelgyZW9ObWUwYlBhdE1B?=
 =?utf-8?B?M0VLcWM4MDVDTTF6MEVWSENEdjlWeVljRW1NZVc4Y2xGaHhKRURMQnFrY3pa?=
 =?utf-8?B?WkNqUDJ6Uk5CVTFPcjU0ZmR5RTNzcHREUGsyRUdnTEFrY1QrRDJ4OU1yaW9K?=
 =?utf-8?B?MjFzQlpVekJGaDZueHE1SVpabWRTU3hQeEZtVmZsZzlPYlRYa2ZQOG9iUm1z?=
 =?utf-8?B?dWRZd2ExNHJXeEo0VjIzTis2UUh1R1FiOXBIcVVibVdNM01ncTdGYm5mbEhW?=
 =?utf-8?B?TlFpODBTZUZabFBNLzBmZlNqbjZyUHRIK3hwajlEUzRyck02NmZXVUg4dUY2?=
 =?utf-8?B?ZkMwTi9xSVF0Z1lHSlFxTlNoa242NDhVQ0hpY0E3a3YzT29iZUFkbmRCUjZY?=
 =?utf-8?Q?mZRr4xQjMev+bTWnoiJ37zS39?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bafbbeb-5ce6-4fed-28fd-08db2ab8d837
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:35:59.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qssu2Omg9wHLTslHR6lk2EUlFAvv9+RSHVUTgMHThOCzfRy7tGjLF/w0TY8W8lwo1riZUmrnq+hA6Y1wy3J5UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7641

While benign at present, it is still a little fragile to operate on a
wrong "old_mode" value in sh_update_paging_modes(). This can happen when
no monitor table was present initially - we'd create one for the new
mode without updating old_mode. Correct this two ways, each of which
would be sufficient on its own: Once by adding "else" to the second of
the involved if()s in the function, and then by setting the correct
initial mode for HVM domains in shadow_vcpu_init().

Further use the same predicate (paging_mode_external()) consistently
when dealing with shadow mode init/update/cleanup, rather than a mix of
is_hvm_vcpu() (init), is_hvm_domain() (update), and
paging_mode_external() (cleanup).

Finally drop a redundant is_hvm_domain() from inside the bigger if()
(which is being converted to paging_mode_external()) in
sh_update_paging_modes().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -129,8 +129,8 @@ void shadow_vcpu_init(struct vcpu *v)
     }
 #endif
 
-    v->arch.paging.mode = is_hvm_vcpu(v) ?
-                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 3) :
+    v->arch.paging.mode = paging_mode_external(v->domain) ?
+                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 2) :
                           &SHADOW_INTERNAL_NAME(sh_paging_mode, 4);
 }
 
@@ -1811,7 +1811,7 @@ static void sh_update_paging_modes(struc
         sh_detach_old_tables(v);
 
 #ifdef CONFIG_HVM
-    if ( is_hvm_domain(d) )
+    if ( paging_mode_external(d) )
     {
         const struct paging_mode *old_mode = v->arch.paging.mode;
 
@@ -1864,13 +1864,12 @@ static void sh_update_paging_modes(struc
             make_cr3(v, mmfn);
             hvm_update_host_cr3(v);
         }
-
-        if ( v->arch.paging.mode != old_mode )
+        else if ( v->arch.paging.mode != old_mode )
         {
             SHADOW_PRINTK("new paging mode: %pv pe=%d gl=%u "
                           "sl=%u (was g=%u s=%u)\n",
                           v,
-                          is_hvm_domain(d) ? hvm_paging_enabled(v) : 1,
+                          hvm_paging_enabled(v),
                           v->arch.paging.mode->guest_levels,
                           v->arch.paging.mode->shadow.shadow_levels,
                           old_mode ? old_mode->guest_levels : 0,


