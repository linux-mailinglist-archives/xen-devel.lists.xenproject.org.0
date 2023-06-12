Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5134072C354
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547049.854234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fzB-00077H-9X; Mon, 12 Jun 2023 11:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547049.854234; Mon, 12 Jun 2023 11:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fzB-000759-5S; Mon, 12 Jun 2023 11:45:25 +0000
Received: by outflank-mailman (input) for mailman id 547049;
 Mon, 12 Jun 2023 11:45:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8fz9-0006zd-Ld
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:45:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d3a3d42-0916-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:45:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9196.eurprd04.prod.outlook.com (2603:10a6:10:2fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 11:45:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 11:45:21 +0000
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
X-Inumbo-ID: 9d3a3d42-0916-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YibojOIAdW5tPGK2VycNy0yipEcUu2k0A+xhpKTNoBQVWarroikS4pJgYoWE2YdEC/r23QEReyAv7AjGOmY7D9vkNR96Ehxpne1hEh1U+7XMj1YUXFDMdPgvJtimLuXngLHgczOXXuKPPg+GijS/qUkDIkh+qBAay3y456kPP9J0daF8dUxWZDEDk3yMQjy8Q4sbYY9jJikd/GuEeHH+Rg6y9Qh+f5maaZqHp5Y2LY9US6nex5FYBdQtRJkeyw67IHpTl7i3xAsnXkJqVpRSNesxbxHeI1eppYJMz3U4AVAqGfJrcHewubHgVsb8/tu+hPZDeNZ562UwcC/9OnCDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1YzWXeZ3z6bC+mXj26Xjsu53Z/uSpydklQeVDdytmY=;
 b=kpp+DfTPJPbW4bTuPk3rGFXT4nT+rPAivFHH61hAZk1GPWdCVe4yz0JC8WVRxYeqZpwLq/KGV5hTKzGLLp9LvPLLYPlsHwSK7DeSEc2Rf2Aa10iT7KA0waQ4qHy0zI440FYoJRgy1xTmKjS4M7M8oX8aRSCJkSkt/V2Mogf0os6lHN0xsCIR8C3vLDSnqC1Pc5YhVTXAvyaVLW0DoB8fsHVLJ+mnR4aaonLr50W9d14DiDeD2vnkPgc5R13MwZ6PzfZZ7SrCfy2cbDn59kO/0Zm5IYckCjZKYjGaFHUrmj/0Ny8YY/zhz6auWv7Ol18UQ/JPmskxYn32cZxWXcx1HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1YzWXeZ3z6bC+mXj26Xjsu53Z/uSpydklQeVDdytmY=;
 b=orqTSxlynbBkXGxentfJ0rDR9LeM/IaftWeMPCXKAPSprBAkCDGzmQla3YrkuNHVQnrtZsU1m3tKhP+1/LdkcDnRBaDRD3iClFkHVWoIlL2lMDRTArb4hwyMCQ2nqfpi4DoMVaXVPgRCHyhd6PqOfwCbHkLlUHQIyEyKDFQzDhlaQ04aY3fvs6XmmzFM4zo9LXW3bjJSox10BkuHQHctYVaTr7tQDANx3ds3SlfTcd5UrASBOrC7lgzQKnte5yJWfpcdl3BYj5Ai7nuaYcTsLGAbGuOAxQWrzAwIijHcnZC05AP0uQQmag2sc9H1W/Q4zAv9U74DX+IcFdgy0ObV9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc7b72ce-2426-4452-bff6-f98b07b5a41c@suse.com>
Date: Mon, 12 Jun 2023 13:45:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: [PATCH 1/5] xen-mfndump: drop dead assignment to "page" from
 lookup_pte_func()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
In-Reply-To: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd76939-9ab7-4e30-f616-08db6b3a80d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	arLVgovyo329rgDR+VnOfp7vWkCeFN5E9CfnqrV+WFUgpMAaGpajNNTC7UKw+m7gbqLxw1yx1CnvgZTFaOXElcF0HEzxIMBJrq5Qkhz+75PdBBs/QQZca3nqyFev+EzRTiJGPc1Fw7yEctA1N0sP/dzMJIdP+WKe5S+dj4JiqqChuWQrxDY1Dhxh7BcvHXOIWLLZMgqxmR2MOQywaWlXfgE/r5m2Olx/iRTj5NbIjJx/f6ckAK+Fk2PZRbixZz9BXGppA6aQeSiEC/4W1XB2ltm035Ergrvsq85E+iPNeaHlSF/z+4qODTAq7e3JOsy87k7Ju4nmDaaoHZKy3p9krmJVUZ9gwWRYNdWbFRuS5OPZwL2wkBCqcir6+sF3un5MsQXF2Wppe2aDb0/HPaVZadbjD+A0TL/b5KdT8pepK/DCavIK6k6jJ5/XGrhdxIUcaAV4GTprxOsKoYG74eqrQL0US8J9BJ8DpsoMbml4zC/CGCijhkDtzBDm0aZa2Hc1I46vw3BkU0J0x2UeLpZ929vl7SkmBYUfAn+I0Qj1cVtvI/rVCmnBsavamvc4LODXsbb2dkiZ5tdpqly2bmP6TWCWltfomqh4BehlI2ak72tqF6sCU9TphBIQKWT+BWPvsFQuvUiXx6z9uQF2JhvJO/jTEQF4NniGBw12UXT5FIcHkYAqW44NtKGwIR5QL/Al
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(366004)(376002)(346002)(136003)(396003)(451199021)(54906003)(5660300002)(31686004)(4326008)(66946007)(66556008)(6916009)(8936002)(8676002)(41300700001)(316002)(4744005)(186003)(2906002)(478600001)(66476007)(6486002)(6512007)(6506007)(26005)(36756003)(86362001)(2616005)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkJTUUNlZzJ5ZExMb0Y1Z0pOVURJVkcyYU1FcXlFUnpaZVhseUd6RXYxcW5W?=
 =?utf-8?B?UW1tUWpsbGVhSmx5NnNoVEpYQ1RGL0tFelFnWUV6M2QxMHhScTdDSERUVzJ5?=
 =?utf-8?B?WnRHN0dIRDBkY1JIbmJuMk54VGVoZ0tSbVdXQmp2VVNIWGpGVDZiYU5SdTRm?=
 =?utf-8?B?alo5VXVleEI0Ynd6YS9zaXlyR3VIMmVadm9BWE9jY3pJWENhbWpuNDFna0dn?=
 =?utf-8?B?MEo2dk95bTJtWHZ0VE9oMTdBUjczeHZLaWJpVk1xMmV4NldNOEdBRDl2UFBz?=
 =?utf-8?B?dlBGbVZjK3VDSG5ITEdiTDFVVEZnTzN6aVFnblhVZTg1YVZVTEJFTUdCODhB?=
 =?utf-8?B?MTh1Tlg0MU5IeUJIUHc4enVtSjdFcjZmeUpwM3gzZEo3bFIzYjBIRlIweHMr?=
 =?utf-8?B?Ujh2Q0RMQnAzVmhtTUtwYURCTzBrVWRwVFZiaFFYUW0vSVhFTXlYTVJHT2V4?=
 =?utf-8?B?TGdDbDVEemIvcEt0SVYybW5GKzVDTDh6Nk1JbXFKdlJ5ZHM5eXl3WVdJdW9h?=
 =?utf-8?B?UFpCdzhHSDhsbmYrN3ZEd1hrUHZwMUF4WlBkWS9YWVY5bE5JYkh1UGVpbjlJ?=
 =?utf-8?B?M0VnMWxVdHhVUk92bG5kMDF1UTgrNEhuZmZ5Sm50T1oxNmVCZm5ua2VvRDdi?=
 =?utf-8?B?Y1h1UVdwRHNnQkFLTlFCYkdSTnplcGx2MldxbzBrTmVmNFFpNlBLY1oxMWZs?=
 =?utf-8?B?YUczc1VINktkTzBKKzdnWW42UXE4STJmL1ZwWnpFSXp5ZVQrdnZYM1dIMUFv?=
 =?utf-8?B?cU5rVGhyWkxzRHVwOVZmZ05DVjZjU1F2NXJqYjBMQUc3LzRVN2RmNUUzb1RH?=
 =?utf-8?B?R0NEd2ttd3ZvVTV4UzlJaDRtZnpSeXVJNjFVK2U5Q0l2aTNma1FnTDY4RlUz?=
 =?utf-8?B?VStvWVcrWkpuYXd0c0ZhOWhUTDVqcWR4SGRYejJEMFlEWkt6ell3OUNXRzln?=
 =?utf-8?B?cXVCRjU2c2RCQ3ZjUWtVdGEvY2VTSW00WGlSNVA1VG1vMzMwODdBUXNwQW9i?=
 =?utf-8?B?M09QYzlnUkxSL1c5QWxTUzJybE5EeUFIVGZMQS9xamhqekVuYS9VYlFmbGtF?=
 =?utf-8?B?MERrb24vRzBjYlkyS0MyRG1rS2xRZkpsRC80MjlXczB3MkMxTTZYOFdjVjFo?=
 =?utf-8?B?U3NsTHFESUQ2Tkc3ZmEzaTlEejY4TnZCbmZ4MS9qVEJnZWFxUDBmRlBkaW1v?=
 =?utf-8?B?SzR3R3hlanRtWkxpdGIrNWczc1lseVBpZnhIUGV6ay9LbkF0ZldjWE1sbFVw?=
 =?utf-8?B?c1pIeG11ZjFZMEtlakFmcGZrQWYwUnNtaDVrV0hORnQvdng5dUdyalVrekFr?=
 =?utf-8?B?cXNaSUhJN2lUdmVSaTZUMFJlTXFMSGhsM1dERkhYWjZRdXRrcTJuNW11R2la?=
 =?utf-8?B?MGwvWTB3SlZDTUtvUE9kRGtaSWd1SnJybjNTbXArTFA1ZmlwSVN0aU84OXFt?=
 =?utf-8?B?eG9lMTk3THVEYXZCbGgzdmZFNmJSWTRZTjlXQW5pa0FraTNoM3FLYnFQeS8v?=
 =?utf-8?B?OVlhN0dRSkRMNXlWS0VKVGtPR3pWeFBIYXlwYlpMdEo5SDBUVm8rTUxQVGVP?=
 =?utf-8?B?QUNoeXRoYkc5UDdoZDlBeVVkdjlFbDBHYVhuTGFOZUExUEx5bVFEamNQMkVK?=
 =?utf-8?B?bHg2eGFFcER4VlpseWdCSXI1ZDhPSHltT2hEZGEzbGxqMHpMNURWTXAyWmFH?=
 =?utf-8?B?Zk9Kbks2TVJueU1VWWpIblZOZnZKVVlHOHNyMHRnOWNOcUNpdU5JeENmSUFW?=
 =?utf-8?B?RmlzVDVFVWtudW1BOEx1VHRzazlUR0NicWNRSXhYK2t5aHNhRHI2ODVMbk1C?=
 =?utf-8?B?bzNLcmljcVN5VXpWQSs4OW14K0VNeENXc3JIWDFrSWlJWFBqdnU5Mlg4aHdZ?=
 =?utf-8?B?cEtmUEZSenJvWmp6dTlXYVhMQm5hSUtlVU9OSnROT09Qd3hiL0Q2MGJnMEhR?=
 =?utf-8?B?SlZROHd1NUYrRkNVTjAyVFU5ZzAyR3RYNWZTUWpEWVFnOWNDL1IxUHZETkxG?=
 =?utf-8?B?anFESnI4TUdSUXQvdGdmMVJPNlNKdkdsK01nczNpU2cyUWJ1L01IWTlValN0?=
 =?utf-8?B?ZTltU1V5M1lzSzZMV3J6bTdETFJqY3RKS0ZqQ3hkOWJkdndUNHFGL2VVTHEy?=
 =?utf-8?Q?SXrc/SN2JKNre5A+BOvsdE6aB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd76939-9ab7-4e30-f616-08db6b3a80d1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:45:21.7926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjfulOSW86MDsYfvM438jEvZq2+rmKHzLe20+PzCZVEkVxKuNkXwDobZZKeCFR7PDwpiEdj+9j9hEFMeRXAm1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9196

The variable isn't used past the loop, and its value also isn't
meaningful across iterations. Reduce its scope to make this more
obvious.

Coverity ID: 1532310
Fixes: ae763e422430 ("tools/misc: introduce xen-mfndump")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/misc/xen-mfndump.c
+++ b/tools/misc/xen-mfndump.c
@@ -265,7 +265,6 @@ int lookup_pte_func(int argc, char *argv
 {
     struct xc_domain_meminfo minfo;
     xc_domaininfo_t info;
-    void *page = NULL;
     unsigned long i, j;
     int domid, pte_num;
     xen_pfn_t mfn;
@@ -301,6 +300,8 @@ int lookup_pte_func(int argc, char *argv
 
     for ( i = 0; i < minfo.p2m_size; i++ )
     {
+        void *page;
+
         if ( !(minfo.pfn_type[i] & XEN_DOMCTL_PFINFO_LTABTYPE_MASK) )
             continue;
 
@@ -323,7 +324,6 @@ int lookup_pte_func(int argc, char *argv
         }
 
         munmap(page, XC_PAGE_SIZE);
-        page = NULL;
     }
 
     xc_unmap_domain_meminfo(xch, &minfo);


