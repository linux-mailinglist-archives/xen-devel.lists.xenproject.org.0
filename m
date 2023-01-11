Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFBF665D12
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475344.737010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbXr-0005KZ-Bn; Wed, 11 Jan 2023 13:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475344.737010; Wed, 11 Jan 2023 13:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbXr-0005II-8c; Wed, 11 Jan 2023 13:53:35 +0000
Received: by outflank-mailman (input) for mailman id 475344;
 Wed, 11 Jan 2023 13:53:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbXp-00047w-ET
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:53:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2048.outbound.protection.outlook.com [40.107.13.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55891915-91b7-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 14:53:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:53:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:53:30 +0000
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
X-Inumbo-ID: 55891915-91b7-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URIUJvBUnhD4gku6qib2sVtrZYoKIBmoNUghFiwwgyeCoScB/mUwsrbzK8K5W4tyzqxwCr7zhRYfIpyZ8wMjLAjydK0/g42FepxwPItjpLnwUxtlHE5B8zWKCQSe1rl+StcCTQ2ryrmWj4K1nibMoXRGtdXpcRhlFYWvjSntKPo0gr/iFVEjLXj6o0XCP2NYW7o1YF+LhZ3DIc7wdbvBHCtMygtMAUo0bLZB9kmYbhCrLqpW65Tjigt6uQny5XOLok3DNLR3aCscbI8T/ylM5XWRxjMwbuotsWwjcR9Mqs41iCKajdhRCaelFc96sKMnDHZjTqa89u+iEyh6y332zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfV7FH4PlbLPIPiG+PzMORtLnBIDSYzDeJCNwEUQtis=;
 b=Ow+4oszuWC7+szzZOqmusakF1TkHARoostoEZWy7tldhwsEl6s3oM/wYm8fxzaUljzfMcDTC3MsJuoFlmbvzWUeRpmfdB/k+w51kAf4CsAWCi7WkjYzpMPAImpqx8hNwm9Qr5odM7Y5vv7TGUVqeeY/ULR/wKW5aN8god6ck7GQv46oeqzlVP+QUbooE1XVIhAbkm4GsJMbcnoUABlJtUGzxP+oXcBS6La2nlT3DMbrX6oFQuM4OynXvqO5t9az6MlVcL6yX0NXI1CVBNn0+5VGB7C41FNcBaUvP40rMlz+C2YSQebaW3saoDDuVZ2FQ/xJzDUokzqlqNIW551Dgag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfV7FH4PlbLPIPiG+PzMORtLnBIDSYzDeJCNwEUQtis=;
 b=bIS/MneUtTtRjQmNLzGJJdMBFWtz09BScvbX22KDROsyUmACdCZLYqsDabtUbLqaXt1rZlVpwtbXq0OK5TOzEyHLI0dfwpngM6eMsWqQQeAyk0YgGIniXBikGDzPDr7UfTFPdLml9TovrdhahCyBhx3IC+NZMhBNErmIg/GXxux1axKJJYJFd1EP3IreZc+CWZ1SauoCHQ/RiWl7VORU/JyQAzH0cEQVdoFV6ZvXhNO6lrJP5vEp3JX71aRPxiHcP5Q+zHpjs005pyMK3uOLfYnkOgiPcLpmDExMsIBZ/VL3L/zffCyt+fURzlqkIfsxoW2Ripa7FmJqw3p4BvKC4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dddaefaf-3112-e33a-4430-d3cc6b0ec2ca@suse.com>
Date: Wed, 11 Jan 2023 14:53:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 3/9] x86/shadow: rename hash_domain_foreach()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
In-Reply-To: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b00fea-09ab-4c99-1dbb-08daf3db38fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yBVUELvVhxkKF3Wuker5LK7J1dyVEsyW9Q4c9eq63mJ2ZH1TnGw4BFsN1AVle+6wVMvk7SGA19QkRtSD2Sv0//rRMDp7P5BAirODYFkmyebvRJ/kbuRTkU9OXNhog7Bbmm3EC3oMjPRvL8I0J/shA2AcOoSt5HLdqY55x2IZTMlX/Bll6TBCEg+6WyWx7VHs5dR9HBDWLRQtviiUYoXYmXqxGVLhZrYC6Ex7x8gTYEXcWUh/7iI+s+LIkARol2eDFvrMZr0dkSEMUtLqMFoSiq4W4rKwm3tQaTxyi649bQOQO1WiAkKhPisQxCsTLCcfgWb8hiwC0H1s/MaRZkMWvAhOPuU7Xg0wCbs8wi7HiIpbWSEy9TAteJzhDcRz3G1cgjMounCr5GEW5Z3RajbpA8bIHRSJvPmI13QorIopYNiOii0oDSkInNAZ1B3OAnPpyGbTW0BBTcweogFkkhQv8x16Gu2sHVXWkCju70XkvdRKcxVEoiP6XOok876JTkwiPt7OESPuQUCb3LJ0ewXDvrBU8a+EFQveFIfwbIB3Fo9coxUeupWWYdhv3qWYOuax6xmrzk8TLPWymSZex0S/APoN9nGBrTPz54J8wjtPu+zeT6nwKrVrk7KODxnwk0zPeVW8aXEr7VNWL3FDiQedMJdmpU2zcvSMVHsLhvlqpNWxBF9rGJf/onHqtLlpFG5FW6W9m7kax+tyKjMuF2O6DB5ythyxloNmrkn1Esr9cbs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(316002)(4326008)(66556008)(8676002)(6916009)(66476007)(66946007)(54906003)(26005)(6512007)(38100700002)(2616005)(31686004)(86362001)(186003)(31696002)(83380400001)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3VoZzNrWG5tdjA1Y0t5eFhVeXJ0bU1qeVJuZll5L1VJV083QTFsN3RMcVFv?=
 =?utf-8?B?OUY3TVdtQnhESE9teGpJSVBNczJSRnB1RXFQUTdKa1dPemxqY3FoRlRkUkh4?=
 =?utf-8?B?VDBUWC9QV3N0WGNFT1FNMXQzRlgxZXI2UG5TVS9LbG9VS3lJS2lJQmRxOE4v?=
 =?utf-8?B?RFdSTXpEa3FGMGhJTm5ycVZUcGdDZnZDak9zK2NmM3g5NUY5KzRsUVREbjF0?=
 =?utf-8?B?Q2R6Z0krZ0s5RUY0WjZtQXdScnFKSHRyK3pMTWc3eFozRnFVYWtKNTIzR09h?=
 =?utf-8?B?T1hJRjE5Z0p4bmp1WWxwWWxVaGtrODJhTG9BajNReitmNlVZQlRLblNlNkdG?=
 =?utf-8?B?NGM2eFZqNHVmQldUTnExMWVxbTUyK0d6Q3JSRzBYS2tOaXAvR1ZMQkdYUUtj?=
 =?utf-8?B?Uld6QTJNYjUyUnVvdWtOekF1NGFGaTY4MGpmMVVETzVlaS9ZRGNBTmlZN3Fh?=
 =?utf-8?B?bFpTTHBGaktYT09FWURCandRblBkdWJrOVpyNzdrR2ZLa1Z3em5naXlXNHli?=
 =?utf-8?B?SHhBOWhjcDViN29SNDEvc2FhdHJjWTlNRFRaa0dFMm1aUFdZZzY4ci9zb0t5?=
 =?utf-8?B?MHNicnVkenE5em53N0xrZFZaWUJaY3MxSytDOWlxT1lkcE55cmpQa20yVEFx?=
 =?utf-8?B?SjY0dGJxaG9iZUZlcW9ZODZ6NDVGTmh5cktxdkpzOFV3bjJEdTVKcXFxdmxN?=
 =?utf-8?B?WkpoSnhWVVAvZDlDdW1VWk01WGJLNzNKN2N1OFlMREprR1BsdGZKZlprNDQ5?=
 =?utf-8?B?SEVoeUtOelVHN3pXSFJvdUdtOEFFMm8wdUpRbDE3QU9NajdsRkFBSStEMVhJ?=
 =?utf-8?B?Vk0zUnhTYzErZGpWc2t0NXlRaEdkdkZXNGFlSU0zaUkwZENkQ0Znd0FNWDk4?=
 =?utf-8?B?OWlucC95bFIvdDVPOVFqcjNsb2ZzU0NyUTFCMGtNSUdZZnN1VENIYjFiV2hY?=
 =?utf-8?B?TVhpc1BQMnM4ZEJpSzQxdzY5RldRT01xZ2Y0cWg1R3Zsdi9RalBOREswR3RU?=
 =?utf-8?B?NE9FcWtRT2dYTVRCNDUvb3BEZDd4aW1kQ0tIZFBuN1Q2a09VejJxTmFEUEFj?=
 =?utf-8?B?a29obFp0NXJDZkhHV2Y5RFBoc01qNDNtc0tMcWw5Mlg5b2Q0WDNmOGVHdjNz?=
 =?utf-8?B?MHR1eVBhN0tRUDBOS3EzTkxidnN5cHpUQTJXelg4M0wwMUZLVzViZWZaVWl6?=
 =?utf-8?B?d3JCRnRBNFBWZVN6TkFESUNQVzNGMlFIV1FPQ0JFOS82dVBialVpMHBVYVJY?=
 =?utf-8?B?bExBUUpoNkYrc1kyZE5YdWFEc0Z1R3Rzb29RdExvdDBnLzZCMXBtaXBWWGpQ?=
 =?utf-8?B?Ui9PSjgwQXZtdHRHdG1jM1ZqYmZobDQzM1hBcGFFbjZSNGdkQ25BSDhxU0t5?=
 =?utf-8?B?VWtDRXdnSDZBcmttclBQQmJ2K0tvY28yOUxtcVB4M2w0N283eVlxTDNFQ29F?=
 =?utf-8?B?dDM2bmNpOHNQb3NjNzZGRUZZSTVXMlVzZTBNdW9YN3ZRSnMyVlZ5NUxsbG1X?=
 =?utf-8?B?OTVFOWVTbXNYZ2hWZG1ZYWMxaEN1ZVVsRnNCZlhZeUdYYVYvNXFBRkoxd3p3?=
 =?utf-8?B?UXZUYmJ2Sjg4K1hTTHpKcEkwYUFBc3Vwc2xVczEzWXVVSEhOKy9qbFBNVEN5?=
 =?utf-8?B?bDVoVVlCNVhLS2ZsVnE3cC9IdWhpbzJieWlBc0VCSlJRZFhocU5UOGVybHFX?=
 =?utf-8?B?Rk90cGFtc21VZHAwSGNxSGpSNG5YNHVQaUF0Z3FieHdTWkVMRmEvdldQc0hs?=
 =?utf-8?B?UnRvOE9nY0dCdlNNb1Jwa0J3a1hnVktQRDJoWHR1anBXcDFCZllEYVExV0wy?=
 =?utf-8?B?YWhzcGZ1SkZld2thWEFSQ3p0MGJnWUt3Q3NMTG1vOWxCbHRlYWxFejVjbzJT?=
 =?utf-8?B?UUpGRlJDTm1KVllZaUV4UHlUdlVsSGlkVm5uUWp3eUFnNTZjbG1hbnhtZjhp?=
 =?utf-8?B?Y3g5ek5HWkN4WDNtcmNlb0RxaDNuQXl2QktUZW1xY3M2cDYza0ZvcmZPSUZI?=
 =?utf-8?B?S2pod09MeWVHMWNjeWlZNXpHTWZIdnlxZjdsUE0yaVVxdHY4RmgwUGFVZFZ6?=
 =?utf-8?B?djEwU3M3SWVKYkRPdkZnNmpWMlRsOGlYR2IwVGMxSG9ZUENXd0NnY0svck9u?=
 =?utf-8?Q?0jl1o2m0kv+2TpFP5dz5Yx7CQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b00fea-09ab-4c99-1dbb-08daf3db38fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:53:30.6874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tjwHUZPplVPns/+4HE8dfFY4HNDs2WIGua3tH8rxVltNrEzsV+Q6b/lnKvCSeZ2tvlqx2kXoT2cSzZs5DH/eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551

The "domain" in there has become meaningless; drop it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1640,15 +1640,15 @@ bool shadow_hash_delete(struct domain *d
     return true;
 }
 
-typedef int (*hash_domain_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
+typedef int (*hash_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
 
 #define HASH_CALLBACKS_CHECK(mask) \
     BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
 
-static void hash_domain_foreach(struct domain *d,
-                                unsigned int callback_mask,
-                                const hash_domain_callback_t callbacks[],
-                                mfn_t callback_mfn)
+static void hash_foreach(struct domain *d,
+                         unsigned int callback_mask,
+                         const hash_callback_t callbacks[],
+                         mfn_t callback_mfn)
 /* Walk the hash table looking at the types of the entries and
  * calling the appropriate callback function for each entry.
  * The mask determines which shadow types we call back for, and the array
@@ -1784,7 +1784,7 @@ int sh_remove_write_access(struct domain
                            unsigned long fault_addr)
 {
     /* Dispatch table for getting per-type functions */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
 #ifdef CONFIG_HVM
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2),
         [SH_type_fl1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2),
@@ -1969,7 +1969,7 @@ int sh_remove_write_access(struct domain
     else
         perfc_incr(shadow_writeable_bf);
     HASH_CALLBACKS_CHECK(SHF_L1_ANY | SHF_FL1_ANY);
-    hash_domain_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
+    hash_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
 
     /* If that didn't catch the mapping, then there's some non-pagetable
      * mapping -- ioreq page, grant mapping, &c. */
@@ -1997,7 +1997,7 @@ int sh_remove_all_mappings(struct domain
     struct page_info *page = mfn_to_page(gmfn);
 
     /* Dispatch table for getting per-type functions */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2),
         [SH_type_fl1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2),
         [SH_type_l1_pae_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3),
@@ -2021,7 +2021,7 @@ int sh_remove_all_mappings(struct domain
     /* Brute-force search of all the shadows, by walking the hash */
     perfc_incr(shadow_mappings_bf);
     HASH_CALLBACKS_CHECK(SHF_L1_ANY | SHF_FL1_ANY);
-    hash_domain_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
+    hash_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
 
     /* If that didn't catch the mapping, something is very wrong */
     if ( !sh_check_page_has_no_refs(page) )
@@ -2128,7 +2128,7 @@ void sh_remove_shadows(struct domain *d,
 
     /* Dispatch table for getting per-type functions: each level must
      * be called with the function to remove a lower-level shadow. */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
 #ifdef CONFIG_HVM
         [SH_type_l2_32_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 2),
         [SH_type_l2_pae_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3),
@@ -2173,9 +2173,9 @@ void sh_remove_shadows(struct domain *d,
 
     /*
      * Lower-level shadows need to be excised from upper-level shadows. This
-     * call to hash_domain_foreach() looks dangerous but is in fact OK: each
-     * call will remove at most one shadow, and terminate immediately when
-     * it does remove it, so we never walk the hash after doing a deletion.
+     * call to hash_foreach() looks dangerous but is in fact OK: each call
+     * will remove at most one shadow, and terminate immediately when it does
+     * remove it, so we never walk the hash after doing a deletion.
      */
 #define DO_UNSHADOW(_type) do {                                         \
     t = (_type);                                                        \
@@ -2199,7 +2199,7 @@ void sh_remove_shadows(struct domain *d,
          (pg->shadow_flags & (1 << t)) )                                \
     {                                                                   \
         HASH_CALLBACKS_CHECK(SHF_page_type_mask);                       \
-        hash_domain_foreach(d, masks[t], callbacks, smfn);              \
+        hash_foreach(d, masks[t], callbacks, smfn);                     \
     }                                                                   \
 } while (0)
 
@@ -3163,7 +3163,7 @@ int shadow_domctl(struct domain *d,
 void shadow_audit_tables(struct vcpu *v)
 {
     /* Dispatch table for getting per-type functions */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
 #if SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES | SHADOW_AUDIT_ENTRIES_FULL)
 # ifdef CONFIG_HVM
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l1_table, 2),
@@ -3210,7 +3210,7 @@ void shadow_audit_tables(struct vcpu *v)
     HASH_CALLBACKS_CHECK(SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES |
                                          SHADOW_AUDIT_ENTRIES_FULL)
                          ? SHF_page_type_mask : 0);
-    hash_domain_foreach(v->domain, mask, callbacks, INVALID_MFN);
+    hash_foreach(v->domain, mask, callbacks, INVALID_MFN);
 }
 
 #ifdef CONFIG_PV


