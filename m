Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3F26D0314
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:26:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516625.801046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqPw-0006jd-Qs; Thu, 30 Mar 2023 11:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516625.801046; Thu, 30 Mar 2023 11:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqPw-0006gn-NR; Thu, 30 Mar 2023 11:26:08 +0000
Received: by outflank-mailman (input) for mailman id 516625;
 Thu, 30 Mar 2023 11:26:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqPv-0006gd-8Q
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:26:07 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8e2fd4a-ceed-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:26:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8468.eurprd04.prod.outlook.com (2603:10a6:20b:34b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 11:26:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:26:03 +0000
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
X-Inumbo-ID: a8e2fd4a-ceed-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaJO9OHr6FA//Q9hwgzmYIpkbpmei5cDC09U3SFkty1bDplYEPFxI17Vu3XiRCejhmVnwPsPbwUjvTJ2XX1hNSlPI0o2PJUm6A6fuoGqbhtEStfEAGS/yDoKZ5+JY8r3NPVewjV/IgQW+Z8AfpZGvwNPsxMUUz0Ed3NGnyHVGIRGh1P2Oh4N36I5Py4pQBSVaDO5vvV21LgMxP6V13NiiOWIJ0jCAyKhtzLwbLjkcYG0CRd1y4XUPZ3lFYHBShnL4Nd05Y3axEdtQbfeoJIAeVQUt+V794EMLrayudthVG4LqXe811Ta1Wi4n3Yq5MaZ1R+KIk2DY5ZNPgQbZ3dXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hACkpCooSftjlIisKDKVvGugJLC80byuS3ebKyYgdUY=;
 b=iI2cFAyrS6xSRYX+RoDIAOnvmxIAghIRkcKHdg1WxqaUYWVDFZTLY9TX4IxP9l6A81y+CZo4U3uK2zCREUcfsdFf9lDAH8u7IWVT5lvXOWtplF7RHEfTPo+HoMdfRVDsi0kdkX+pSIabipMsqry5KRkJu8zHJP6iJqk2rMH3z4OpThWQg8CcwNtjs0rAmdsLknDnFq0Rc2yHNYK6j+sAaw3Zmu5zWZrZn5DuxZ5Bre4Kq9VhTA++taJsWrHH+RBNHx9eYXxIJflY9JnUZj6sRanzS9G67ZLrIEPL+zJUS4Ux3vjOhOIqT38Uig5OqddZ4PZHGh4zS1DDwJoEymm04A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hACkpCooSftjlIisKDKVvGugJLC80byuS3ebKyYgdUY=;
 b=ffIssB7fastpYQGXzHQhQEaq0TEv03XSu/se4dTmKbVSiRfxnqVdcIxg82rXZBJGt5tgWWxDBuEA1C/RJSnLx98jdyHYgONZX2CmHXLgo0ozA8AWgYIesBOM/Db4LjvLRkwB2gi7pKXPcgst56mwCPNG92+/lKo1CGl7Uy7APlTgBk+6TB11T1OEqwTCUBIe4g8ijrq/kkvX1PUC8ne5HxrcxNPTG80C//A8xjFbEoztokFeLyJvOF05TELVqERDd0Xp3r1SXtw2Di2qCyelB7A6F2rZqZHyYQZqgVl2fWX3PrVQUgRTjyXLXYVtbnSGF1tpSKaJpkJA0GR0nnJayA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44271af1-a6ef-325b-9e56-0c35b2716c58@suse.com>
Date: Thu, 30 Mar 2023 13:26:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 02/13] x86/shadow: drop redundant present bit checks from
 FOREACH_PRESENT_L<N>E() "bodies"
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
X-ClientProxiedBy: FR3P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b85f931-04f1-41fd-6136-08db31118bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MJ9VEG6HGPTLtZ69reXyMBGc4Bxbg90hPPUpVHRUEx1+ZN0q4e4ONy56dnGInFxFA7wEY7kuzs0q/GYUDNdurgLI4NNAZcHNv943SAa4qWl0POX+bzRqYefjVAj0HpQQBFd2HdyE59xOv0obM9/PPPlDqV9yGZhke8KjU4g/PJIVIxHQR8LRpXL+gK3842u3alMlQN1bRTe6SBi4MAbVDdnzhX0/pmMRefHDPppUEqtwc3jd/tcAd8TFB6Py8ZoYf/GCOwr2EORFjsHGg8QQ/gfzOK1VCDKWl0URsCNBO8NCAFhn2iQhHOUrWx69l5YmGLCxfFkMZIxucq+G61jUkp6ioWnBdiIFa4+vytbpwBwmFNFWM4C5eEE141KgSkQaj1PxvFtVpDXUswV04x+L8UUD7992dnOmc6wE6ybcrKHDgY0x2MTkvFd5kiBwUQzqOBUJm3ereXonRoxOZgGuEYNJ2kDX/mjIZV/GxOTVabOEQs1lK5yhEKqUvdYf235hUS7/RvrwZ6FKKAlRYOj0ESaLubkB5g8HFF1dXrWV/MIlsBJ39NyIbxLuZjXbobPss5nsToUtP9MAPLy4zMkm/O+1ClUHks2cbZv+btdmMLsvY2lTzFa2MmVqngfltscAHy18qQ7bbSjYBRYPQIEiULfYj2pz8H6iXb5JtwzuVvhl+pg6T7pjCSZQltDuF+c5Z9cWWnx5WJwl2nlLRTTcEj/JU3FDY0jGbY8RGWXoQwg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199021)(2616005)(83380400001)(6486002)(478600001)(316002)(186003)(26005)(6506007)(6512007)(54906003)(2906002)(36756003)(5660300002)(86362001)(4326008)(6916009)(8936002)(38100700002)(41300700001)(31696002)(8676002)(66556008)(66476007)(66946007)(31686004)(45980500001)(43740500002)(414714003)(473944003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3p2TWNrMXB3anhXS2lOY09ncHdXbjV0TkpUREliMFpTc3REWXhxcE5uSjR0?=
 =?utf-8?B?cUVsY2lTeCttZVRvNlo2bzZyZEp1dDNlQlk2MnNyNDNoS0dRQUNtQXBjK1dM?=
 =?utf-8?B?M0RnaFZDdThMK24wczVLOFVsUFg3M0dIL211Sm11allTRlpyaFRTSG5Sd1I3?=
 =?utf-8?B?cVBnMW9xVFlNeWlCZWZJSEI1Tkg3VGwxSGE2UzFGZldWSHhVUnJSRVdmdlEy?=
 =?utf-8?B?bit2SXdoRXJwOUY1dG12T2ppalQ3VDMrVkRlVWgwSXJkOFVkMmpTbVlhdzRE?=
 =?utf-8?B?OE55elV3QXlwRkhHTDl4OTVsbVAwQU5CYnlmMSsyMDAyMEVzZnN3blRWZ3po?=
 =?utf-8?B?aHV4SlZiQkg2Nll5djA5U2ZxWkhjQnRlbFpMejgzdGwyN2hPdDNQMlJtWHUw?=
 =?utf-8?B?TndYd3pocG9zRmZSMU1GaFNna3QvYTJhSW8xMDEwL21nZ1Y5Z2NNV0oxSVZn?=
 =?utf-8?B?YlNHUWNYQ2FLTGtuaStnTDhGME03M0xMK1hiT2toVTdCN2p5dDhnV0o5Z1R2?=
 =?utf-8?B?WmxEZzEvTGpyb0lmS1BDVTFpVzZwbWpEMzExS25SK04rVE10NDU3M04xeFRB?=
 =?utf-8?B?TW1IOHo0Q2hOL1JjbmdmYnpya0hLS1pianAvWGhhOWg3a3p0V282SEgzeEI5?=
 =?utf-8?B?ZlJGbVlkMU1Nd0lwSklIMzRSYnpYTkwxVERwTWM4eFBsTXhYSmtHbkR3Qyt2?=
 =?utf-8?B?dE9WMnlLNis0MmFEcHRnVnZIRU1ZdnovTnZqMzBxNk9DMVh3WnMxZFdUTjFP?=
 =?utf-8?B?MDlLUkZGQzRTb1NDQjhSUDBqNmNOOW4zc3N1VDBpU2hVTFpXODVMYVNySDlP?=
 =?utf-8?B?WWtyQ1pYbmsybmhHdHJFRDlPc3RCbTZIejRON3VlaUVrL05WNmpJQldkWDVI?=
 =?utf-8?B?R3ZPZGVTUjRoM3pJcU9lb3RzV2d4a0hkNGxrdjFhcHJCeTNlWkxSeTIraVlm?=
 =?utf-8?B?alVMcEwwejB2VU04L1RRVm1oODdDSmVhTElsa1FHVktkU0pBU2Qyd2dacGZI?=
 =?utf-8?B?Rlp2VEJGbUQxaXdzRUhMNCt5QXU3K0ordndCRWpUb1h5S2V6b24vS1FiRlh4?=
 =?utf-8?B?QTJpUmJNMHREVHlMcUdBSHhrV3BzR0lGR2RNTW5OWTluREEzVlJpQkEzZDQ5?=
 =?utf-8?B?ZFVnWFFaNWZGaCtpY21oU2xLbytiK1laV0xodG1YM1ZrbG9NM2pVbHZqY0RZ?=
 =?utf-8?B?SXplaW5FV0RDMHBRSEtUTDNxcFN5MUY5Q3pNY01sdzUxMnZGT3R5UW8zb2xQ?=
 =?utf-8?B?NUJQQTRFNnVKd2hKOFcrQ082a1FLVFNLVDVyRVNRRW92TVNsTERWQkI5TVE1?=
 =?utf-8?B?L1VUcnEwTEJ4Wm0vdkY2bVJrWTNkTHlSNitNNHdObUhPZ3ErMkUvSk5ZRGdn?=
 =?utf-8?B?S01xZ1hyOC85d1A3NzhsaEJPdlBaZ09mVmlGNWp2b0F2cGdwaUZvMGc5RU5D?=
 =?utf-8?B?ZmpnSDVoTTBlN2NvR3lYRTVCaVBpd1ArYmJSNElDSDNLa2RBNDhRbkIvSUl6?=
 =?utf-8?B?Ni9VWThpbWdUNkVCSGo0MmtsOTRSOG1qUzhXRTBqZ1NyZStJc2F1dEN4ei95?=
 =?utf-8?B?YyszUzFROGlkbm1lZ0IzN3E1OTdvRjExTVZwQkFGUG5FSG9HSTFQSmdBMGZN?=
 =?utf-8?B?bzdCcTd1MzBoU1V5Q01IQUZwUmQ2L2QyNXdBQjRyWkhnVW1SYUhoekU0NUJl?=
 =?utf-8?B?TnRIZGVxZ2NXNjlnWmllNTlSajlPT045Zlh2bDBRN2dZdG5pa3JMUzM4RTNa?=
 =?utf-8?B?N2R2L3p1OVhXNGR2SHR0bjhFWHhzREZ5YWNkMTEzNVdpZnU5K2JQUEJrcnF6?=
 =?utf-8?B?M3VFdmx1c21zV21weGxWcnJURGQ5REdLNFRaRHBrZTBFdnUzTkFPYm5NYkVG?=
 =?utf-8?B?YUF3aDYvUUsreE5XbGExZGd0Y240bk1aY01yT3U5WGRrWmQ4OXc0ekdMU2px?=
 =?utf-8?B?QVlkUHd5WTg0MVpVR3ZYVjZybktyUUhaeXlmNDdUVytzSlJEb1RUL3RMTnhJ?=
 =?utf-8?B?ckNpdzltSmR2andnbUZyaGExQm9tVHBVdWZiZTlGN1ZyUFA2WVNwVXQwVWdk?=
 =?utf-8?B?T1JaVGtKRmhxVkQwdXAwblNwTlNWNWRYL0RwK1pLaXRCem9FVk9jMWVBRGdU?=
 =?utf-8?Q?0Yc/DVi03kGnyP+ONbjygOjYG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b85f931-04f1-41fd-6136-08db31118bee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:26:03.6108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csN4KbAjQJRFIa6oF57piRbfjOQdCUbvH02Pmp+AeztFyLdfVkFa1/m37nlR1YvG17Z39nXGdpeF1l2tQbHOqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8468

FOREACH_PRESENT_L<N>E(), as their names (now) say, already invoke the
"body" only when the present bit is set; no need to re-do the check.

While there also
- stop open-coding mfn_to_maddr() in code being touched (re-indented)
  anyway,
- stop open-coding mfn_eq() in code being touched or in adjacent code,
- drop local variables when they're no longer used at least twice.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Re-base over new earlier patch. More mfn_eq().

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1289,12 +1289,8 @@ void sh_destroy_l4_shadow(struct domain
     /* Decrement refcounts of all the old entries */
     sl4mfn = smfn;
     FOREACH_PRESENT_L4E(sl4mfn, sl4e, NULL, 0, d, {
-        if ( shadow_l4e_get_flags(*sl4e) & _PAGE_PRESENT )
-        {
-            sh_put_ref(d, shadow_l4e_get_mfn(*sl4e),
-                       (((paddr_t)mfn_x(sl4mfn)) << PAGE_SHIFT)
-                       | ((unsigned long)sl4e & ~PAGE_MASK));
-        }
+        sh_put_ref(d, shadow_l4e_get_mfn(*sl4e),
+                   mfn_to_maddr(sl4mfn) | ((unsigned long)sl4e & ~PAGE_MASK));
     });
 
     /* Put the memory back in the pool */
@@ -1320,10 +1316,8 @@ void sh_destroy_l3_shadow(struct domain
     /* Decrement refcounts of all the old entries */
     sl3mfn = smfn;
     FOREACH_PRESENT_L3E(sl3mfn, sl3e, NULL, 0, {
-        if ( shadow_l3e_get_flags(*sl3e) & _PAGE_PRESENT )
-            sh_put_ref(d, shadow_l3e_get_mfn(*sl3e),
-                        (((paddr_t)mfn_x(sl3mfn)) << PAGE_SHIFT)
-                        | ((unsigned long)sl3e & ~PAGE_MASK));
+        sh_put_ref(d, shadow_l3e_get_mfn(*sl3e),
+                   mfn_to_maddr(sl3mfn) | ((unsigned long)sl3e & ~PAGE_MASK));
     });
 
     /* Put the memory back in the pool */
@@ -1352,10 +1346,8 @@ void sh_destroy_l2_shadow(struct domain
     /* Decrement refcounts of all the old entries */
     sl2mfn = smfn;
     FOREACH_PRESENT_L2E(sl2mfn, sl2e, NULL, 0, d, {
-        if ( shadow_l2e_get_flags(*sl2e) & _PAGE_PRESENT )
-            sh_put_ref(d, shadow_l2e_get_mfn(*sl2e),
-                        (((paddr_t)mfn_x(sl2mfn)) << PAGE_SHIFT)
-                        | ((unsigned long)sl2e & ~PAGE_MASK));
+        sh_put_ref(d, shadow_l2e_get_mfn(*sl2e),
+                   mfn_to_maddr(sl2mfn) | ((unsigned long)sl2e & ~PAGE_MASK));
     });
 
     /* Put the memory back in the pool */
@@ -1390,11 +1382,10 @@ void sh_destroy_l1_shadow(struct domain
         /* Decrement refcounts of all the old entries */
         mfn_t sl1mfn = smfn;
         FOREACH_PRESENT_L1E(sl1mfn, sl1e, NULL, 0, {
-            unsigned int sl1f = shadow_l1e_get_flags(*sl1e);
-
-            if ( (sl1f & _PAGE_PRESENT) && !sh_l1e_is_magic(*sl1e) )
+            if ( !sh_l1e_is_magic(*sl1e) )
             {
-                shadow_vram_put_mfn(shadow_l1e_get_mfn(*sl1e), sl1f,
+                shadow_vram_put_mfn(shadow_l1e_get_mfn(*sl1e),
+                                    shadow_l1e_get_flags(*sl1e),
                                     sl1mfn, sl1e, d);
                 shadow_put_page_from_l1e(*sl1e, d);
             }
@@ -3558,7 +3549,6 @@ int cf_check sh_rm_write_access_from_l1(
 {
     shadow_l1e_t *sl1e;
     int done = 0;
-    int flags;
 #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
     struct vcpu *curr = current;
     mfn_t base_sl1mfn = sl1mfn; /* Because sl1mfn changes in the foreach */
@@ -3566,10 +3556,8 @@ int cf_check sh_rm_write_access_from_l1(
 
     FOREACH_PRESENT_L1E(sl1mfn, sl1e, NULL, done,
     {
-        flags = shadow_l1e_get_flags(*sl1e);
-        if ( (flags & _PAGE_PRESENT)
-             && (flags & _PAGE_RW)
-             && (mfn_x(shadow_l1e_get_mfn(*sl1e)) == mfn_x(readonly_mfn)) )
+        if ( (shadow_l1e_get_flags(*sl1e) & _PAGE_RW) &&
+             mfn_eq(shadow_l1e_get_mfn(*sl1e), readonly_mfn) )
         {
             shadow_l1e_t ro_sl1e = shadow_l1e_remove_flags(*sl1e, _PAGE_RW);
 
@@ -3595,13 +3583,10 @@ int cf_check sh_rm_mappings_from_l1(
 {
     shadow_l1e_t *sl1e;
     int done = 0;
-    int flags;
 
     FOREACH_PRESENT_L1E(sl1mfn, sl1e, NULL, done,
     {
-        flags = shadow_l1e_get_flags(*sl1e);
-        if ( (flags & _PAGE_PRESENT)
-             && (mfn_x(shadow_l1e_get_mfn(*sl1e)) == mfn_x(target_mfn)) )
+        if ( mfn_eq(shadow_l1e_get_mfn(*sl1e), target_mfn) )
         {
             shadow_set_l1e(d, sl1e, shadow_l1e_empty(), p2m_invalid, sl1mfn);
             if ( sh_check_page_has_no_refs(mfn_to_page(target_mfn)) )
@@ -3646,13 +3631,10 @@ int cf_check sh_remove_l1_shadow(struct
 {
     shadow_l2e_t *sl2e;
     int done = 0;
-    int flags;
 
     FOREACH_PRESENT_L2E(sl2mfn, sl2e, NULL, done, d,
     {
-        flags = shadow_l2e_get_flags(*sl2e);
-        if ( (flags & _PAGE_PRESENT)
-             && (mfn_x(shadow_l2e_get_mfn(*sl2e)) == mfn_x(sl1mfn)) )
+        if ( mfn_eq(shadow_l2e_get_mfn(*sl2e), sl1mfn) )
         {
             shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
             if ( mfn_to_page(sl1mfn)->u.sh.type == 0 )
@@ -3669,13 +3651,10 @@ int cf_check sh_remove_l2_shadow(struct
 {
     shadow_l3e_t *sl3e;
     int done = 0;
-    int flags;
 
     FOREACH_PRESENT_L3E(sl3mfn, sl3e, NULL, done,
     {
-        flags = shadow_l3e_get_flags(*sl3e);
-        if ( (flags & _PAGE_PRESENT)
-             && (mfn_x(shadow_l3e_get_mfn(*sl3e)) == mfn_x(sl2mfn)) )
+        if ( mfn_eq(shadow_l3e_get_mfn(*sl3e), sl2mfn) )
         {
             shadow_set_l3e(d, sl3e, shadow_l3e_empty(), sl3mfn);
             if ( mfn_to_page(sl2mfn)->u.sh.type == 0 )
@@ -3691,13 +3670,10 @@ int cf_check sh_remove_l3_shadow(struct
 {
     shadow_l4e_t *sl4e;
     int done = 0;
-    int flags;
 
     FOREACH_PRESENT_L4E(sl4mfn, sl4e, NULL, done, d,
     {
-        flags = shadow_l4e_get_flags(*sl4e);
-        if ( (flags & _PAGE_PRESENT)
-             && (mfn_x(shadow_l4e_get_mfn(*sl4e)) == mfn_x(sl3mfn)) )
+        if ( mfn_eq(shadow_l4e_get_mfn(*sl4e), sl3mfn) )
         {
             shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
             if ( mfn_to_page(sl3mfn)->u.sh.type == 0 )


