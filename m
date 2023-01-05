Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F2A65F0BC
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:04:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472013.732099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSj0-0003kT-F9; Thu, 05 Jan 2023 16:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472013.732099; Thu, 05 Jan 2023 16:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSj0-0003hZ-C0; Thu, 05 Jan 2023 16:04:14 +0000
Received: by outflank-mailman (input) for mailman id 472013;
 Thu, 05 Jan 2023 16:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDSiy-0003hT-GS
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:04:12 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2085.outbound.protection.outlook.com [40.107.241.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97d2e2b6-8d12-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 17:04:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8046.eurprd04.prod.outlook.com (2603:10a6:102:ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:04:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:04:10 +0000
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
X-Inumbo-ID: 97d2e2b6-8d12-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr++NsNdGlT6TtWx6/n2fQDVYMbGG7WnSMBPz5KHSmGDF9QPtDETIPnA+CjBMH4oPBWT2bwfWX4suSbXeGIypOwZCQRpTh1AompNiWRAlvR3hIiY0nJ6hTmozX01k/WZA6eOtK75QCrBTeKQR+G1WaHokMXzv0nXtNRfUHLzLajaYJfDUasD8xfrsGU7MFRG3/BJ9VBHUTxL2ixjbZZ2EnZb7G1bYkJODXyMMoBjDClEwluN71Ga3FRwXt5oxS0IRdnWM/ugNIysCEu5Rdy/khqVLzO7lWhksIzdRGFzZ/+e/VN1Gehli+018mZsv3P2TtkPaY38eJzZbIkw8YXx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiwgHbCRXYI+56kwUcOCgcEtwg3HWt+T1yYbvqBjdYM=;
 b=LcDpJmTakRzhrmgRdUK6CYYQUe0Rpt+3dW/0+TdMvxGSu5wItFqSnWTvbFLKR4YBDH+/JywaQUpwL9yhMcnLvWM/D5C0zA2YEDGLw5fY/zeBJaEVxpNejZnxLn4w6Jb601ayQPlXmww48lJ/pgMbM5mRfQSt5gOHzYXyaObjKhmGfZjdUFATmi4zgh1eQ/oWwBXca9YnX/MtE58FQs8z5x4RM+1kLU9rpQ2nKQ0Ud1rVQICgmbyBefN9mQX5W96KKsYtEVKVaFnXZDiRS3JYnAZXMz3oHl1/RxrogIen7ZkcMsa3CECnCh0Qr6OJ7nX81OaF8klNdkZfUL2ewxuwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiwgHbCRXYI+56kwUcOCgcEtwg3HWt+T1yYbvqBjdYM=;
 b=NAkNqr3ZTsQ6QsEjVhcI8ueY+7QrN4VUuvFkAFkIBTqeEiP8EK3GFw+kTVoxokZpp3tcgyQ50rlfowHZT2mHmtJ8bO7cwH0+ZvuRqrS/xNDtOH1pKNpb5As/6l6bz9hxEvnMpGV1XSQAr78B20FqnpeYx9qqTgpMjjxd3sx2wYsWM7tt7XicuathzWeoFk3oyXJWGEYNilzhN7Lp5fiK6nVattSg4Ms4s2y7LgUMitJsfCqLLjh17w6MDqRdI+R/7eEFeh1uVpTEcYZEbkqzXPXorlJbcP7cEdugdfQdxDp6vfhcavgfjh4WiZC5HA4/cdAoh38HmJwfxWfWYyMTpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76cc0b4a-27ca-21b7-841f-315f31833762@suse.com>
Date: Thu, 5 Jan 2023 17:04:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 05/11] x86/shadow: move bogus HVM checks in
 sh_pagetable_dying()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
In-Reply-To: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad15354-d748-4b28-5a12-08daef367af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oYfdVss4Qr69VnO87usxY+HEyw1UMO6LfKX7cL5QHL01Mt22PQlDL5/zr1VOP8m1OrKHXDzroJIOagvtHhs5VJshZ9zWSssQg8wJwZGSQftieXSqaXPiyqP5iFbKoxFKDMnugdqNysq0ufCb6z23gJhGZQ/ACGXSCmvnosYxC7LHTT/v5eVGacB0fGH7hQU7mZscidMDPnLVNxMjPp1o5TXjuAH9zYz0ZiwZdUxYaQLj3jpAH55VHpviJqWUZ/Pvd+ZWyAFsCa5XOtvNj7ZeQfA5VCJfF5BGJ0J3lOzwMAyY+IHhW9v1FhSvh9MZRZMajp4UAdrdhnIp0EszcdOAZiAc7pB0ZeLiOp5Y+1Bp2ucVv6AU3Y+AYW0pOmDOuga94WxnnOMxxbYsE9g6CJEQYswex1lqIg2icEE27CQR2kyYAW+IDv5Qt++uedbM21KfOkcyVUIub6qjbAf6/ddZtYqD/nDB1qxHZR65Xkh3AgeLR0WZ+RsGO1F+Kd5LdEsWzQGtNBiE+u3g6pgdgyaVm3Ahl8R0oa9oVXrKnNyiOXXU8haTqfJoTwyceF3PXyReiWQPWt4FHhhCSxSxdJRkIZlCj8JqvqSKR/QqG0C6JP4QOKuYcEYlHv7QoxVk6QXiFJcli4eT3ZWzLZ5clpiVFL6G5oUFms8D7bmZJej8ORwu7IjmR7IKs3QBUTKBi+E+qF1RSt3RQ6vhA1UH/prX8PXLBvvwziV9e+3XaIN3KlU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199015)(38100700002)(6506007)(316002)(83380400001)(31696002)(4326008)(86362001)(66476007)(66946007)(5660300002)(8676002)(2906002)(66556008)(41300700001)(8936002)(6512007)(26005)(186003)(2616005)(6916009)(54906003)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnFhWjJXUGdxZlNaaUlpcldMNkoxeDlveWwzRmgvaCtHTUwxUStzMHZISmRX?=
 =?utf-8?B?d0JabDZKaU5sZldrOW9Bck9aVTR1UHZ1Z3RuZG0xM0FrVGdoeDdsalZJb3Fm?=
 =?utf-8?B?WFpLaThBVTdMbVBMTTF0Q1hwMnRzSkhQR0NGbGordmNVbWQxQ0xRN1VRSUFw?=
 =?utf-8?B?Nm9ZQnR1bVJza1k5RWJNQXdhQklhMDVOZ25sREpEU29zaDhNZTcyNytKUU94?=
 =?utf-8?B?WVp4NjM1aEZPRlAwQ1QraStXOFdRVEsvUmFtOWt4eXk3aFdoMGg1SllxbUE5?=
 =?utf-8?B?aG5yb3RlM293bFpPc3o2WENPVVJNT2d1YTdxS2Y1YWd6bHhPbjFVNENlMlNX?=
 =?utf-8?B?UktJVEI5WUcwb0x2ZGRISFZiMXozQy9zbC9LSWFsWmhXQ29PS1M1UUFjUFY4?=
 =?utf-8?B?TzZIM3JVbG9qV2YwU3FXOStZS2s4M2tMdStmYlh3VDUzNnFsWWFJY0txYXlk?=
 =?utf-8?B?VWZobVdUbkJTRUdUNE02UDlHaDR4Z2ViWUZpbVpYNndTRFVkN08vYjVtYlBl?=
 =?utf-8?B?anJPdnh5LzYxdHRVU2VNbzFQdE4yR3RZNnlVMFZtdnNqTXhhM1lCd21LTnNM?=
 =?utf-8?B?bUozelNDNEFzWUlaQlNuU1lTaVptNnp3aUljNWsxZ0xpVVdxdm9ZdC81R3lC?=
 =?utf-8?B?YnpvMzYyZHpBbTV0bFUxR2lvYmYybHMwbmhyTkJud2tUTG8ybUpyM1pLeGcz?=
 =?utf-8?B?eG52QWlaTk9kYVRsRTI5L2JyaGhKL3FNZUMySDA1SE0weURNYUdNTDdqeHV3?=
 =?utf-8?B?VVVSSEQwKytISWt2djdNQzNnV1doaUdQRThlOGRBTjdRK1l5TGdVMlpNYk5W?=
 =?utf-8?B?WEVuMU9wQzlkRDJvMU1WNnloQkdpNmVpVWM4WG1UbmVPK1AxYzVCQS9PVGw4?=
 =?utf-8?B?MEJndjhqTWFSYTN2cWhCdEFnNFRUcU1HZURmVlVmSGN0TWZISCtJK2g3Ukhz?=
 =?utf-8?B?TmtTKy9vNjR2UWVaSld0SVUzc2QvUXJTV3JTWkhCaWNEa2hzVkw3UTFCYllD?=
 =?utf-8?B?NHB0elJHbmEwd1Z1bjlodGpZbDNodko5MG1iM2tGSUt5bk95YlVuZmx4bzZJ?=
 =?utf-8?B?ZzV4cW9HbHgvMVBlSnIxVmdnSjI3K3FLUG5qTEhDa1IzZGJUT01qaFA0bjM4?=
 =?utf-8?B?YzZlM25DUGRwS2ROL29VOGkwc1BrMTk5Sjc5WnExSkFCOEpjVEFiUkF0ZXE1?=
 =?utf-8?B?NFRRM0FCUDhLQkZ5RFJpbXJvdHJEdm5VdUh3V3czU240REM0OXV1ZU11SWg1?=
 =?utf-8?B?TVpoSEEvMTc0bGhOWjdJTXdPemRENkxJMFg1azhxRDhTdWxycktuMVNJSEdZ?=
 =?utf-8?B?T3ViTGxJTXVFWVQya0pSdDRRSGl0bmw2Y2pzYklaSmc3dUt3bU93a0I1ZmFt?=
 =?utf-8?B?Ry9JT0d1eWlpSExkbnc5eHVjWjkwL0QrdjFOc2x2QXVrME9NeWs1a0Vjb2d1?=
 =?utf-8?B?RE1HallIbjU1RXB3SHVRWVNNRkhZQTlpQUEvNjlQbHBnblpMeEU5cEZKRUwr?=
 =?utf-8?B?ZnpFMldiazBDeGxzKzlIRnpBdnhzVytmSGxhblQxYUdLSWErelBJYXJWaFFM?=
 =?utf-8?B?azZldVY1bkxCZlZxdkU3aHpYRWt1bENYWjJhczY3UFR5MEtFVDlxZkZGOWdy?=
 =?utf-8?B?ZEladDYvRXBodXRrT1huNFd1MTNEYzU5aUkwYUM1dGxsUmJxdVRwK0JBSk5n?=
 =?utf-8?B?cHg3MUY4SGRVMkdkaDlZQThtKzFXbVhBL2FIaC9qcnl4RFBaS3ZOMUlzeEp5?=
 =?utf-8?B?dm9HTG9VMlNlQXFWU3d2V0hBTVh3YzgraFAxRUJUMnpodWpPcVNBVGd1M25U?=
 =?utf-8?B?aGRiOUlpdlNCamhlVDBrY3R6UVp2K2d1bFd2UTBrcC8vRlhlRUNhTytVNlYv?=
 =?utf-8?B?T0l6N0hrTks4NzhJSDVOaFJMQnhqd09NL2lVM3JxSjZHeXRvQjA0L01iZnpz?=
 =?utf-8?B?MVNvZGMxQ0NjODJvQ3dZUlZzaldiNWs0VTZSYW9WL1JIeERPMWs4S1dvR2FW?=
 =?utf-8?B?V1hZTFMybGx1WmxLT0t4Ti8vNk5FVGlHY04zaUs0MFlGN3NZc1Rtemc0MVJP?=
 =?utf-8?B?QlBCTXdncnJHb3NLbWk0dzZQNG4zdE1yR3BjL0FlR3FreWo5ektUaWRCSEVh?=
 =?utf-8?Q?Yg4FF3Svc/nM8Gbgn54ejbmmZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad15354-d748-4b28-5a12-08daef367af6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 16:04:09.9084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTjYqBoyreX/HEhw3Arn7DPnliwAhjDiE6xN38Kxx3c/YlAgml3JHhNnV0QlXADvtvFKRxHymfFrEBeHvvuoPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8046

Perhaps these should have been dropped right in 2fb2dee1ac62 ("x86/mm:
pagetable_dying() is HVM-only"). Convert both to assertions, noting that
in particular the one in the 3-level variant of the function comes too
late anyway - first thing there we access the HVM part of a union.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3780,6 +3780,8 @@ static void cf_check sh_pagetable_dying(
     unsigned long l3gfn;
     mfn_t l3mfn;
 
+    ASSERT(is_hvm_domain(d));
+
     gcr3 = v->arch.hvm.guest_cr[3];
     /* fast path: the pagetable belongs to the current context */
     if ( gcr3 == gpa )
@@ -3822,7 +3824,7 @@ static void cf_check sh_pagetable_dying(
                    : shadow_hash_lookup(d, mfn_x(gmfn), SH_type_l2_pae_shadow);
         }
 
-        if ( mfn_valid(smfn) && is_hvm_domain(d) )
+        if ( mfn_valid(smfn) )
         {
             gmfn = _mfn(mfn_to_page(smfn)->v.sh.back);
             mfn_to_page(gmfn)->pagetable_dying = true;
@@ -3854,6 +3856,8 @@ static void cf_check sh_pagetable_dying(
     mfn_t smfn, gmfn;
     p2m_type_t p2mt;
 
+    ASSERT(is_hvm_domain(d));
+
     gmfn = get_gfn_query(d, _gfn(gpa >> PAGE_SHIFT), &p2mt);
     paging_lock(d);
 
@@ -3863,7 +3867,7 @@ static void cf_check sh_pagetable_dying(
     smfn = shadow_hash_lookup(d, mfn_x(gmfn), SH_type_l4_64_shadow);
 #endif
 
-    if ( mfn_valid(smfn) && is_hvm_domain(d) )
+    if ( mfn_valid(smfn) )
     {
         mfn_to_page(gmfn)->pagetable_dying = true;
         shadow_unhook_mappings(d, smfn, 1/* user pages only */);


