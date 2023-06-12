Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9230B72C35D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547063.854264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8g0U-0000FD-4Q; Mon, 12 Jun 2023 11:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547063.854264; Mon, 12 Jun 2023 11:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8g0U-0000A3-1S; Mon, 12 Jun 2023 11:46:46 +0000
Received: by outflank-mailman (input) for mailman id 547063;
 Mon, 12 Jun 2023 11:46:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8g0S-0008F8-7B
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:46:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd3a102c-0916-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:46:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 11:46:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 11:46:42 +0000
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
X-Inumbo-ID: cd3a102c-0916-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2z65NHZLHfHzPGCAaoJqmkwopKeWpZen0NY99NV8MNrBvKSxWzhbSm8iSIJUf5XNlNJH6KrsiGWIu5ZMxQXuPzr/ikF/5jio70MCwLdCXLRrv62FHLHYet/7pfrzTsKtfor8vKpSkAodyXqwy5FsdYLkQddIBkRKhNzTHUMkN5U4bllZB4wYY7UWi6JKGNChwLca4oCfFYQLK8tbuBjp3d62b/kNfF4WVe23FihmuEmn0w37wCiXc0sIodAVw2n0X1eTXnoKxgY/d567MLKYEPeGErJCsJ/FMJvtiUys9/DQb2WGG+DRLhRy+4q5ClzHPP00xqOI8BaJ3cBbS8SRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPVECL3iX1325C06pRAn0RbvmreO2AjYKQ1yM2vVRJ8=;
 b=Hb4EbkjUfxA6eW8v6YqVI0lcy8GneIngjRiI0Ypb5Z14bv9DNLRZ/+rFsw+Wb6W7BmBU3HXLaG1QzwzRmtgyjcaVvUU2Gko9exWNs5ST+8zRi28jU24vVElYHUPc54I31o7LM55z3Xudun98GWPeP5zGEqkWWooKxq8GQL6CaT+J1sdO0WYeV6HPN7PiOP2JCrx6TW0J40dXcfcvvNxWWcaSgfWp+RyYPzGqXHHS9Ycw2fwWPzuB0pE9JAUZBPFzE+zEtZ31fQhLH05VDv5ekfcGW79dvQMp+rdT1NnGOv9/yfhFby1/YLL42ZAcFIcU3Y2qP6ns4NSnF/rcdlHFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPVECL3iX1325C06pRAn0RbvmreO2AjYKQ1yM2vVRJ8=;
 b=3uTip3c+Hntan0MmCkFCY9GXmpA27MUEZ0tmcnb7l/S98uqt8YiW5C+QZ4eTQzENtRWDFs85Yr3Yx3Og3U28bhdgAUmhhq86RXsUY6RMJwfqzdjppSSan0GwwMRkE8RwG/xULGcQ6Vnvt2MU0mG2GXFqzTQfs/C2Bid7kmlDcdr2tfh/LPtlQGdLE+CbQx3KkjCyr08UGOJiDNE7UzQPVGl1VGeY9KpIuQEX1v818CaClYFDc8zBtJkIUsUHj1S9huSZnZ7y9JtqUdLj58IbkdYdIZSDaidpcLveYsC5XYAEDAJVxDGGRY5EIAb2PFjSCd7b0iKX8xeHL8m4ImQdww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe8cb20f-8541-19a9-a0cf-06e9206b1299@suse.com>
Date: Mon, 12 Jun 2023 13:46:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: [PATCH 3/5] libxg: drop dead assignment to "ptes" from
 xc_core_arch_map_p2m_list_rw()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
In-Reply-To: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: dbdcf97e-575a-459e-318d-08db6b3ab0be
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dmzPkbX53d/WwDSxNKurA3qeSA/VaGO/h5QllgK5+u2QFoFOiNErvfrycOxP+5Ruu7Bzo325I7Fc6Fi1qS734r6Ta9gb6mJW8Ga91WxprE/p0+uVSrkgzaTkTh0lL2TOYbgC+SiA0vlz/KTSHPxNbrR20wp4ak1lZ8rXqLNbPu3ojZ06Z6uw/kWWQhro6/yxn+uzIzkMEnsCYA3ZerKNH1rSmxIZX89xE6blLHyOYSgkRCyWufrPUd154upPTLmj8DcU85d3BdqIjQzAvo5tzqWUXfuW3puSzAAASz2m3ChdV4XD/V1fzc8bhZoCcTgmP26epmYLASCgnS4tHKVQQ2cEvVYLuccEKEFMH12HWkIihf0eLAC05oBdgK+8EFEbtVqESr+F4DGrCGqzjLq5vAVHX2llSglyKxKLLVO6gL1stUH0g1lSM7Bp9zxB85ul/jnVGUfLQ8hVhmfa5EAkPe9M4o2hLKI5E2Ofisg8BIUJy8AEd3Ci6nncNUD6vAPC6wU9U74GVvJwnoS/ONBVMtRm7rjzb89XH8BEimBLgFPYv6YwzPDAw/m3Doza65eg4JmQ/DobUIdYlvx1Im/SHouua/+xOepqFhuPQuVGp88YdOZUzfFJs1tHNPNCpvSyQssunFKO1nxcL5UK4P6duRIPuzS753e2caZbJWE1fkUFLLxqK4AEgsQQl9zyHxa+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(478600001)(8936002)(107886003)(8676002)(54906003)(6506007)(5660300002)(41300700001)(316002)(6486002)(66556008)(6916009)(26005)(186003)(31686004)(4326008)(6512007)(66476007)(66946007)(2616005)(83380400001)(4744005)(2906002)(38100700002)(86362001)(36756003)(31696002)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cC9hT2RmcmEzdm9KL1FwODhjRnVoeEFyRkZVSWEwcC8zQXRKc3pLRWU2SHJk?=
 =?utf-8?B?MUNSMzdHc25nVTFwRTdBcGpweFU5bWdKN29KN2lxZEU2dTlkYkVwWXJmMngx?=
 =?utf-8?B?QkoweWUxVjlIc1dTYVFVRDd3RDl4aDU2R28yS0RqSkpOV1k5NjA3YWt4VWtX?=
 =?utf-8?B?WUFKUkFnREl6dyt1b3JsUDFRTUJEa21BN1lZV3JZSTlrclVaV3Z4RHROWE5V?=
 =?utf-8?B?cEgvcXBOWUo2WVZIWndab3h5U2FGaHpRNnU3Qk5EbUNGdXBGK3hpS2xWMEhr?=
 =?utf-8?B?bGx0cm02YWV0YUZZOXhGd1NZcVg5Wk82SlBvczY1RGNodHBKYldMZGxtVGlp?=
 =?utf-8?B?TXhISExxMlplZ1NXdXI0clRwMG9HelZUUGFKTzVKWVNpa3NuejBRaUhOMGd6?=
 =?utf-8?B?cUk1RGhvNzBnRjlWblI2eXpIdE5Cc1VVVWY3MCt2WE1tM1lvKytrbHFNMFV5?=
 =?utf-8?B?UmUzRjFkdlFSN203d21SUXl6Um93V01POFFJdEFGVGNXZzJsR01uQ2dWcURl?=
 =?utf-8?B?bGpRT3gzcHdkSmpDL3h0NTl5U3lma0pSZmJQS2ViTWp0U3N1cTVBa2Z6dWs0?=
 =?utf-8?B?ZDAyYVdlVEUwdnRVYlBodnhMZUp2WGN1WEV4SWs4YnNZWW9hY2xyZjMzRjd2?=
 =?utf-8?B?MjVBYVFuYmtTSjRaajdoeWJhN3pEdEhaaE9jcC8xa1RYN090OWxJMGJvaFFR?=
 =?utf-8?B?c3FQSU9oV2Y2NnJtZGh6NWNQN2VWVjVGdnpKa3pDZTI3bi9xWEhoYmpHQ21s?=
 =?utf-8?B?cWI3RXphNkdPa1BuNXBGMFJiY1BCUHN2NmJOYlZiTnNVbG9OV055QnJqWEpI?=
 =?utf-8?B?ZjhOMDdiN0VVMG1wdXd2YXRRN2tlMlZ3ZUdaRFFjMWd4RTJXKzRaMmFzcDVx?=
 =?utf-8?B?Y3NYTnJ5RlFpa1NXMHA0alpHakJDRk5ZeEo4ZjA3aFZjK2h2QkNYTlptME81?=
 =?utf-8?B?ZzB6aU4xSGFscjN4a3Rpem8zQTR4SVdXdkpQMmhmZURnVWlxdmM5QjZaNkU0?=
 =?utf-8?B?MzRMb20vek1UM1B0RlVnckVZVndmTmpZWEJnbmF1VkVhclJzUXdhYXg5VGRW?=
 =?utf-8?B?cDRoN0NLWWR5MWxaTWgxeTAxdlNIWEhVc1FMT1F3cFVvUXBtNzZNY2ZFRHZo?=
 =?utf-8?B?TjRPKzl2NmRZdjE3aFpGRGZ3YzJieGhGdkM5T3NnYmYwVEd0TnlnTExBWEFR?=
 =?utf-8?B?M1krd1ZIV0dNdnFib0t1YzdhL0E1SE03N1hQa3ArU3loUXBRVHViUWFib2tE?=
 =?utf-8?B?UVF4WVZEaURjN3BZclZhYVZueU5sd0lPZlFVQnlLamovdVBlaTBZTnVIY2do?=
 =?utf-8?B?UDZiTEtadS84SDlmQmRHVEJTT0N4OTE3NHNWWkR3Y1B3b2I1WXR4RlNxS2VY?=
 =?utf-8?B?bTI1VUJONityZm1LVmh4VkY2ekZRVGtLTkdGMFRyTmgrMnkvMkI3MlNLQjll?=
 =?utf-8?B?NzZ5bGRCQVQ5Tkhodm1ha3JPaTY2SWVud2RyS0JuZUpURlFmeVZCY3VuT1la?=
 =?utf-8?B?ZkIyWXViM3FMYVVKY0x4YTBVcytxOGhFOEtnZXJIeHluQStlYVFOUEc4d055?=
 =?utf-8?B?djZCNWZSTkpjNTloSEZ3d2pld3hNM1RSZ0hqdkZzVFdONmRPUHlnamlnbEU2?=
 =?utf-8?B?RzY3MW52VHh5NUJHcjJLV2dMQTBxWXRkN3VLYU50UjcvVTJ2TnZEeXREcFZ3?=
 =?utf-8?B?aEJUV3cwMFNUN2JUdzM0TzVwWWxCQmo3M0lWSEdlbkV2STNqT3NVQzQxU3dk?=
 =?utf-8?B?dmZkVTN5S25YanlNSmNUb0pqVkdrQUEvY2UwMWxLa0VLa0QzeUs1ZHFxUGQr?=
 =?utf-8?B?Ky8yV2hnbWFITDFoc01BOU44RjFKVHhPYXljQWFibEpsQ2toQmlPdjZSZGpR?=
 =?utf-8?B?RWFNMU92Z0RCNWVXalJpdklDMmJLVEllL1pmZ3pzTDdSYnlVKzVwQkh5b1Rl?=
 =?utf-8?B?emZsajIvYlF6Zmw3S29WdnROTmVIdmFNbDBGS1c2aFdxQklRTnE4MUZwaEhh?=
 =?utf-8?B?ZkNXbkVKV0Y0K3dBSGd1N0JSRzdjZDY4TmYvMndMTUFVYWNjVkQ1MDA1Z0JO?=
 =?utf-8?B?dzVtZWtoVGRnSGxza0w3bXc0OEU5czVueC85Z2ltU0V1TTMzaHBFM1VMQTZx?=
 =?utf-8?Q?tjIMk8+uVFQ+J56ZYc4obFOjy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdcf97e-575a-459e-318d-08db6b3ab0be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:46:42.2189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chZI6/Z//fRkk4+b/7Hm0CbFeNURtfK+8CT/r9k2Hed49sL6V1eYZRbJHuf5x1fH9/9NRFCUztb5J99RUClfyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9424

The function returns immediately after the enclosing if().

Coverity ID: 1532314
Fixes: bd7a29c3d0b9 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/guest/xg_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -210,7 +210,6 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
         }
 
         munmap(ptes, n_pages * PAGE_SIZE);
-        ptes = NULL;
         off = p2m_vaddr & ((mask >> shift) << shift);
     }
 


