Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB6A6D032D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:30:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516644.801106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqTu-0002Tr-0X; Thu, 30 Mar 2023 11:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516644.801106; Thu, 30 Mar 2023 11:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqTt-0002RN-TP; Thu, 30 Mar 2023 11:30:13 +0000
Received: by outflank-mailman (input) for mailman id 516644;
 Thu, 30 Mar 2023 11:30:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqTr-00017i-Ro
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:30:11 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe02::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a683b9f-ceee-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 13:30:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7262.eurprd04.prod.outlook.com (2603:10a6:800:1ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 11:30:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:30:08 +0000
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
X-Inumbo-ID: 3a683b9f-ceee-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZg0rSseGpV+uzGMN3CDD6fzLffFmJQacHnt3j6X5kZmjcacOTKDYIwtz0iSsGmecLRnjW2U2UV/WNPwomnRE2VD7xZXfp0y18ao0tigI+DUgVKlQLfVWa6ZhJO/k/R8tSF51Fw3xWAh8cEHBW/DRXptN4VDG53HXp4DY7R1s6l3ISXXoH+2BA3BVvp+SZAPsCyFKW7H2ZMwRLG4PoGrf6s5hX1/jZ8wVqTU+RSM68snYriEvZzPxYoKGpiYSRhmbymHu2jrofJILIFs/+VqH0/CfeCKYM8jZaSbnmDFLKS/Fh5lclbP+eaRy2Hx2GlYDQu2Zc9fIKDuYPG28NJZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nCRqVSKvE7qJC49XJOcofUh4xS4zVFI7oAhMmha4Gk=;
 b=gBKO7HrQfPQ1p4JYHO5L+RwKoialoaGihzmoYjE0OijJM51XrhQXMgh8qVdNJAqCpf4U9eOerzqWhUsgFzx1uO5UBkCvKRSEQemb9j3qZpAeu0OyvQq3gYcutlAEWkRFM2bfebDYacXYh9+ii2OZ3jU+btqLkYxkxmBGCkexEV1bHb1VLoTk4EmxL1hxrVwtr+TqBzG1Tu0o8wE1D2Pj0Qxu9HYRZQCnli5JKa4Tb5fKLAggkgbqZkU7CzL7bXE8nxUmtISsFmegbtuvx1lVZqyVlAi1uG2p+8skDAVtMojw8D24YUmpXR4ZApnIeIcGr6Uw8ylyOA7G+rBxMZVAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nCRqVSKvE7qJC49XJOcofUh4xS4zVFI7oAhMmha4Gk=;
 b=AsZrtxFlawKcFYr6M3F7gfKCIqdlDG4+CcaCwREo2YZ4zmUpLom7ZY74V2ZnEo1JFGt4DKEfhHzbjeDZIkIaMrWEtaRcYGxUlniq3vGoYfcvQIZn9WaLlALSUZBj5Ev7IJteP6i1LxYir3xgzuJRkU7XayzZiD73XtLBjHO6h7O6OdGARmTZ1wdWq+LQUMi0XnUFUNPwkQpzHG4CIJT61wAncKT3OsQEPx39qeSliqAqiUl458e1Dk1QsBYFjpdcCziOEBFJG8P8ZJHchJqlrD80FtMu8MUp3TJTuszG7XdCE08nm4NMFElOyVxKZhvJceRIsrNiGIojdNVTXvN5ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66c0efb0-43d4-9e8d-4429-1f2732d2fe38@suse.com>
Date: Thu, 30 Mar 2023 13:30:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 08/13] x86/shadow: sh_rm_write_access_from_sl1p() is
 HVM-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
In-Reply-To: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae4d77c-384e-43e2-a875-08db31121df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uIStktsr9a8Mz2F4tWJ9KB+kdMaBOITVxPp8pMlZPamUt5M6J5G0YlDJwkzP9f8hF1rlSHQ+HS0lyWn/brRyCJ/v/xR++tlknSyPoVvHBPbwljx+dXup4YczSnRBxNl4tuWBLn/ifAm1MFaC4cAdkYYQkE7Oj7jsm7virMYgFSKUsdMctXfOiTR5A3WS/H2J2RItzsTxkweeAhL//iXgIJsfEc+icb7VOqew4yfU+SCIpN99Qpkem3h/KHYH2MIVV8faS2jA5cko6OH6duYuvKm2Dm1o316jIKs42+bAMj+AzwQYs/NifUgLqyG8fv58aa2Njo4nQ+wctBJCNhmpi9ffxdRRii3xbxiBSx5BfjAxf4ZVu6qPGU8f0XitfaBwISfJM35isJW6ASkWY8aQ7JZ/ce5YPpocH2x1Jgl1zxZg4OgOJpQFzqmUjHMWqhpFb5WeE1qlFWJ/6Iaz1fc+rHoY1kVN6atoJsXhkm88jWeyv6VCFweLzg98xd1MBTNimdEuKXJDxI1lV4jq+zIkOl+akbEdENOj4xBMrAttlLnZKkBp/sjp5HwDSJt0tQQDgfUK5fBw7/G6lebJ2HSc6w/M114GlU925z0q/I/dH8drUqiIeliIhvekLFgfvjrx/J9wjrgP0e/hyMszEhVl4Crk39Tylt4CVUaEI0izpcdG/n4Du47QgQdBI0kdHRaW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(136003)(376002)(39850400004)(451199021)(2616005)(83380400001)(6486002)(26005)(478600001)(316002)(186003)(54906003)(6506007)(2906002)(6512007)(36756003)(5660300002)(8936002)(38100700002)(4326008)(6916009)(66556008)(8676002)(66946007)(31696002)(66476007)(41300700001)(86362001)(31686004)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ti9pM3BOdy9EaUtDVkVIMDJMdnlGSTkzMjF5NGU0RWpEVmcyQ3dONnhHWGFu?=
 =?utf-8?B?alNoR0xxMUFXWHlFRE5Xb0w0dzF2SGFUNDdQVTd6MGM1b0t4SHJjd3IyYlZw?=
 =?utf-8?B?Rk40QjdtdDNod1hYVk5FUFhFRG5QVW9iRHZ2MFprbXJCUnNKd0U4YnFybXow?=
 =?utf-8?B?emp4cDRIdnN5WnpUZmNSbE9YN0ZiSU9hdWE1M0ZUR01jNEdDanFpNHArVE55?=
 =?utf-8?B?Z0cvUkZQc0I4c0svKzhldkEzeDh4L1Y1cmJCMkVDVFZCcUdiRGxRY3JLdmc4?=
 =?utf-8?B?SHNyaTdKTEFmNDJ3ZXpxTjhDNmNvSVg0aldLcGMyMWtQdXVWa1RHUmpMTTRn?=
 =?utf-8?B?ZVliaW1MMXJVSzZhc2NYNENRSWtkZERaTHhTTWpEUHg2Y2RscWJmMmpRMWdm?=
 =?utf-8?B?b3NqUzBRd1l2WWgxTU55VFh4REoySkpnMXlFdy9HYmZMWGx0c1gvWDYrT1Rq?=
 =?utf-8?B?QTBkL3RwVkdmalM0VG1yay91SjFpYSttMWpXUlYvd3lCd244S0hlbXdNSS9x?=
 =?utf-8?B?MkVBb1JuYnB4ZHJmR0RLTytCQXlZdTg4UCt5S1hTZVlqbzlQTHhDQ01YTWhM?=
 =?utf-8?B?SkFiMHNDajg0M2Jkb2VGNmRSY3FMRTFjdldpSXV1aXZPM3NIYnU2K1JWRXVy?=
 =?utf-8?B?bFFSNUp5N3NwTTRERFpJZjRadGRBZlovLzhYUTE2Vk5YNGw3Vnp4WnhaNk5q?=
 =?utf-8?B?U21WVlNpSmlCZWxWMFZQNGE3Zk40ZXNRYTVRL0ErK1FxeUVBdVF5QlN6aVgr?=
 =?utf-8?B?cEpFam95Ukxia2dWSjRkNElGdDRKbDY2K1hvQlFXOGhRMEVhengzR0FVRU5W?=
 =?utf-8?B?d1BJZDFUaWlld3NJVTMyNjhMQzVUakRRaVFlMjVlai9ObU56U3d4Uk5CdEZw?=
 =?utf-8?B?K3JZbFBFYk1QWHlpTUVYYmRwb0dkOWFUcWVpei93Z0JGNTBlbDRVd2lUZlZM?=
 =?utf-8?B?UVpXbmJYeWZ4T3M3Tzdva2QwVXgvVVM3K091ZUNySFh6VFRqVXRBSzg4RldJ?=
 =?utf-8?B?TGpjMXF4QXNBa1BhMXJuZXNQR1JDaGQ1c1JvNjFTdzduQmJzcDNNOXhCN2NK?=
 =?utf-8?B?TktReUFDOXlYaXdSdEpvYkNpajl1b0sxMnFwUTJFYWtud25hOGRTTEY2aDhk?=
 =?utf-8?B?Wk5JSm5SUU8vcEF1QkxLbTE5dEJKMCtpcVlIbjlQSVBBMWFqak5UdWhJNGhu?=
 =?utf-8?B?S21saWVqVklhS2F3RXVtOEJ6V1pFK1BjdDMxWlF4Yyt3V1Brc2EvMzdwSkkx?=
 =?utf-8?B?ak1VZGNWNUVPVGxucytHNDNPR1lIckl5ZXFSRkJYbnBmQk85SFhaK1RveUtJ?=
 =?utf-8?B?MXVVNmFpUHFsTG1RNkQrWHhmajVUZmJNWEovaW1jY3czSDhVYXhBN1p2NDRO?=
 =?utf-8?B?aHFYU0xUblljaGVXamtLWXYwV2NuUlNWdGJWTGVjRHJZUEx5YXAxT1FWaWdK?=
 =?utf-8?B?NmN3SzU3c2pzR3gwV3VIb1RpUGx1dnJIQXRKR0xkTnY5YllOMDVMRGxuL1g5?=
 =?utf-8?B?LzNEcGgrOFlLVm5QUFZHL213VkwrWXh0WlVkYzBwNytTYmZGWkl4ZXRNejJt?=
 =?utf-8?B?YmJBc3FtVVI0QldpQmFIWk55SjltbkxncFdpeFlESzhLd040Y0pEZlRsbnVK?=
 =?utf-8?B?WkFocjVjL01kL0l6ckhqQU52cGNaWCtOL1dwRklYRDNHN2QxZUFiVVk4c2JC?=
 =?utf-8?B?NUdGbUE3Ym1RN2ErVks3RGlZTzNuMHk4M09nTXhJYkdScWxjZ3k5eWd0YUEx?=
 =?utf-8?B?d0tDUGhMMUV0eEpRNkpNK2JBVGhxRHFsaTcvYkpEaHpBOFdOOXkwRXFjc3ZF?=
 =?utf-8?B?VStDUnRrUUo3QjRZWHVxODc0NkVMcXRwWHpNdURZWVFFWndkbGlJY2VQSEpW?=
 =?utf-8?B?WmxXQ0lqMlFhbml1QWE5dUpUZ2dJMGFOamJGS0piK1lEUEJKVFphNzFDRlhG?=
 =?utf-8?B?bXY4NTZTWldNSmpKU2VBeVFyczNpdXJkbm81bHV4Ukt3MEdSdlRaT2xubnVX?=
 =?utf-8?B?OWVZdkdMdUdrMUZJbjBJcjF0VktoNXRxWFJUWTZOUHBiZGNCeE15c1U2cmZj?=
 =?utf-8?B?QTVvcXJmMlg0ZzlGTjVwK25yS1pOMS9UOGtCWFVSdHIwS3BIbTMxSGI1V2Vt?=
 =?utf-8?Q?3ViN2mJCfT1ZFz6xnSbSWGYUX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae4d77c-384e-43e2-a875-08db31121df1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:30:08.6150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/Wgysh6oGrNNa+Ugu85SAHMhmby4TqCDZlSd5NgHAJJoTt1TKIUU84V+EK72KKBimwQKvtvsT8zqfAtLM/fkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7262

The function is used from (HVM-only) OOS code only - replace the
respective #ifdef inside the function to make this more obvious. (Note
that SHOPT_OUT_OF_SYNC won't be set when !HVM, so the #ifdef surrounding
the function is already sufficient.)

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3429,9 +3429,7 @@ static void cf_check sh_update_cr3(struc
 int sh_rm_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
                                  mfn_t smfn, unsigned long off)
 {
-#ifdef CONFIG_HVM
     struct vcpu *curr = current;
-#endif
     int r;
     shadow_l1e_t *sl1p, sl1e;
     struct page_info *sp;
@@ -3439,12 +3437,10 @@ int sh_rm_write_access_from_sl1p(struct
     ASSERT(mfn_valid(gmfn));
     ASSERT(mfn_valid(smfn));
 
-#ifdef CONFIG_HVM
     /* Remember if we've been told that this process is being torn down */
     if ( curr->domain == d && is_hvm_domain(d) )
         curr->arch.paging.shadow.pagetable_dying
             = mfn_to_page(gmfn)->pagetable_dying;
-#endif
 
     sp = mfn_to_page(smfn);
 


