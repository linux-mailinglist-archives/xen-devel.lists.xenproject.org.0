Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE03B7D8E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 08:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148129.273652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyTva-0007Cl-AB; Wed, 30 Jun 2021 06:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148129.273652; Wed, 30 Jun 2021 06:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyTva-00079m-6S; Wed, 30 Jun 2021 06:42:30 +0000
Received: by outflank-mailman (input) for mailman id 148129;
 Wed, 30 Jun 2021 06:42:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lyTvY-00079g-TL
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 06:42:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75188b07-987f-4156-905f-388f965d37e6;
 Wed, 30 Jun 2021 06:42:27 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-PmaHPqjSPN2V8IqbvnCH4g-1; Wed, 30 Jun 2021 08:42:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 30 Jun
 2021 06:42:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 06:42:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0074.eurprd02.prod.outlook.com (2603:10a6:208:154::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Wed, 30 Jun 2021 06:42:22 +0000
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
X-Inumbo-ID: 75188b07-987f-4156-905f-388f965d37e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625035346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fh/shTkGqvJB/J9EVTLYqycPvu55Go8cyuPpvmDnTHk=;
	b=NB9CkaTNvTQ6rPI77lY/yOIw/bjFtGb5owKf+1kGtWqkI269lAewOQ8/wYRbuesr/HVPcp
	B8GLRAm6IL7+z7HUo4giex8hcNy54u2xlSoMC45D36gPGzg422jFhNXfxBiQKWfu9QA037
	L7en2+R15SiOyKgezZasVKK6bHOM2/Y=
X-MC-Unique: PmaHPqjSPN2V8IqbvnCH4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6Lo0dnjJx6mgtK9SJQ9p2jn/5bANM1ht5EyYYvjLuWACq8R7chjM/9HS/YSXtz4sxCvBELSXVF56DtoHb3YlEPDYgWjyHRWSrKFq8Z9dg05aceC2GSh3piCbU1dMHmlxHqKCIVABI98HDdy1HQknHHSClla0nS5dvEcDKU2qXm47nVIQz50uT6IGEtvb0l1txpt+si0UZEf2um6H0rKp7BTpT4xypVhonk2k9gnA168C877pru3Rh60Q77Pj7dpKkBZNbZKmiXjs3e8lKlrY7adkrWqI5ruFr/2kZIfrgiLSnRdan05MKKQsi0hGbK4w+9TDBaGXMJGS6q2HqkaGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fh/shTkGqvJB/J9EVTLYqycPvu55Go8cyuPpvmDnTHk=;
 b=JXIJhdcYvI+H8ytxiQk7+jraTJEOiWEwi7ldXTIeb1A5rm/xLUzbz3yCXo3reKKzkmi2wPGa6VSkQW60CwRUkvO1zZvHMMweQX/ZwnGXF6H0CfmzLKOCw5c7lF7n4VzCJs2U5dDijoGRj/aApghnLvGOODGugMvvUWJ/DA9o8x+YGuDZDj1IZLjnbwMUSJgmlleOnDJmMFX4VIvvenQML7i/gDp4fxE5ZBbJrXunLhtVZC2wD/OZ7a90ULw4/uAgLAt41hKrYGCmKFvVMaBB2DxKYwgnLSyAf61cZqiXmDK5gHlv5SBtiB087PdpbSM5CVwsFTOqVWXv6cHDS5XquA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: bugseng.com; dkim=none (message not signed)
 header.d=none;bugseng.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: drop callback_mask pseudo-variables
Message-ID: <b791d89f-5c9d-9c04-00ed-0cbaae68536a@suse.com>
Date: Wed, 30 Jun 2021 08:42:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR02CA0074.eurprd02.prod.outlook.com
 (2603:10a6:208:154::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eef15c18-e403-42a5-bc0b-08d93b923725
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606B4B639FB0C7922E90568B3019@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hATEY8hErKieU6tg/2Yy/KWp6oSwirGvHX8yWaDGzEbNVdLN15k6CyoExVmOKFa9JLPBgTjqLddO9ZLvPsAKY5DS3gsmc8QLPUp+zk2Pa7Z+h/C0iMbMhQ9ZIfQEMd6zoztDpDztrr7LYYg+Q2wPZ82sNGL/Wd0yN3oWB/sPjxR/VHDLQRQQijgTZgzYnX7I0uf/nxdVSa9thxec1Sh3ooE1YyTq+Jo3zCMCFqI6BGBJpUhrxKqzAu//ZsY+lrzDUgyXMqGB4CPkAkkJBRX7X1Z8OKnQRir4hBbYvJD6KHd69mkgRRNBZ1lUJmRyIFlTkACsVsWDPmsicl7Vt3rrCI/sY4AvILtxAFv/xnLwZGTF7pT43Ba+PbHiiMaGmdCQ5sSPFSwjv66j2u2nAmErrgTsHV+9InEgk+tKwcDnjkLcpLF66LXaH8UMcE37mn2eLSmnROMvabEm19zCBoEHHntxZPlkRBylIQkaiUDSlw8rHuOe3HMxjzW/QStFT6Rh7nqh35uTiHec8dP3yqtlj0c1zF0QdLp0qDvZInE1kE4o0/3SF/s3v1oLNId7D2WwP6iyH3mmgTG2p9/l3qeaQi5bLXB3JcbhHnRi7/LbLR1FQkb0MbV2xWyeJ6o3S0SgSvHP4BFZDAKc7EChlNgQX+MNXAB1W+x8+iLRLHAF/Z7jHH8XUY3o39tl38A2PSM9s/TX+1cZn/CQqlCtlu9cfw9ZVWyEMC5gG19/suFhlng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(366004)(396003)(39850400004)(8676002)(16526019)(2616005)(956004)(186003)(4326008)(5660300002)(66556008)(66476007)(8936002)(31696002)(316002)(54906003)(66946007)(38100700002)(16576012)(83380400001)(36756003)(478600001)(31686004)(2906002)(86362001)(6486002)(26005)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXM5cWI2dHVVZDQzTFkwa3hrcWpGVXBNZGV2VUxGMEdHWkpwdHdaYzdqTWxN?=
 =?utf-8?B?REwyVVdzckd4SlQ3cis1UXlxQUgrVEY3QnZDRThob2JaVEhTRVZPdFZDRzNm?=
 =?utf-8?B?eWF5WDhxb3FnekxFTWlpdkFIa01JdTY2MFdMc0FZY0lDaXJMTmpXRXdaNE1v?=
 =?utf-8?B?RlZTekFhYTJPcHlIOFFyVzNyOENMNzJLeFg3dmZGY1JDc3drdUI0UVUrQmY1?=
 =?utf-8?B?dlZaRmtOOGhxOHB1NlZUbmMyTHMxY01VQ0tuV3hOOE4wbnV3WVk4MkdCU1Jh?=
 =?utf-8?B?UVNFVVZhbnVtaGtLUmUxdE1NM1RRWEoxa3Z0REl2TFkyalVvWDI2ODhFMmJD?=
 =?utf-8?B?aG1VOXM1cUExRjBFMW81c3FKdDNOeTFGWVBPTmtOWjFlTzd6d1pZNC8xNzZ2?=
 =?utf-8?B?VDlTODJhQktVU2pOTndhNHhTajd1RW80SVVTSStLUlI3UVJId0RHcSt4MCtp?=
 =?utf-8?B?YlR0UUJhREMraXE1WTBvM0swRTZtMnVSVnc0YnFuUUZKajJUOWhma0taZnZh?=
 =?utf-8?B?Wk1nQ1ArcFFoa1U1WGdhY0x3MVBBMWx0blM2Yk9wSGVkN2krVjFMMlMwaTVW?=
 =?utf-8?B?d3hhQmdYeGtXemdQT1FoWWRLMy90NnJUTnhFdGpWMG5mME5KWlA2TkMwUFk5?=
 =?utf-8?B?Y0owa3ZTdXlhanMrS1V0MVdVOTAxbGQvNitPMUVSQWtIcnVoVjh6amNKeHNh?=
 =?utf-8?B?N1plYllvaTNoYjF3eXBGSXFXMWdYYzN1UTdSb0lHbFBPelo2N1JlMGtHVXFC?=
 =?utf-8?B?MkEyaFFZM3lXanpPNDgycVU5WDdsK3RFTTM4NE9BWkVvRXNjRnRIZVg3di9x?=
 =?utf-8?B?TklaSGZRQUozK0ZnRmRSRXRUSTRPMXlPTHBadzdKSzFRTGZVcTc1NHR5YmRL?=
 =?utf-8?B?b0xjVHltVVRaUGgyWlpaT1A0cUh5K0JFeFVyeGg1QktEZmQxU0J1Tk9ZSW1Y?=
 =?utf-8?B?dGdqM2hCL2VHc3JhWStqSEZ6ZytZUzRoaTBsVFlmN3dQYnd6QVF1YmdsbndP?=
 =?utf-8?B?NlMxTXUzQnJOOWQ2UGNkMXJ1aVlRVW5PcDlKL1MxRUYrV1pETk9hUHZzUFIw?=
 =?utf-8?B?bWNRdFplRnhkRFI3QlVrT0g5di9WOVl4WFlPNnh0LytaT0lBRERPcWpPWGM3?=
 =?utf-8?B?ejcyQTlVaGE3ajBUb0ViWk4zVXZFY2E5RlNUaVZsbzJDcTQ2cS8yZm51OGZP?=
 =?utf-8?B?VFZsM1ZIcmRKUjBpaGdLRmMyaEhBS0xNQng1ejl5cGlZd0szNi9VcXVMdHJ3?=
 =?utf-8?B?c1c0YlV2QkJ2amdCQXNxcGxKcnNNM3laNHp1UlpjamJCZ1lwVS9hNE11dnMw?=
 =?utf-8?B?Mms0OUozcFBySzJRYmtPeExEaGx2UkRLYWRsYUtNVGlEV0FOUlZYM2xkSEdu?=
 =?utf-8?B?bUxsaFZSc0NWaGs5NEVnU0l4a1RMYW52dFN0SnhyK1dIM3pSZXpqV2h3ODFa?=
 =?utf-8?B?UmtKZWxiSGx2WmRjWiswSWorS1dOaGQrbWoxTUlvL0NweTRtQXFSTmZWM1ZX?=
 =?utf-8?B?ZFVqNXBaaGVLcFdJS2t2bXBXb3hNMHp3VzVQeU9nRmNXL2xOQ1YyczJlWVYx?=
 =?utf-8?B?d2pYbGFnWFFneUlvQ2VldVFUVTdHVEppdEplVzI4UStQd0VaNUlmeFFVWFMz?=
 =?utf-8?B?RTIvZUJYbHJYMGhNZkgrYk1Id3R0UlRRSlNuL3g2SGNNSml6ZzYzRDdIaXBm?=
 =?utf-8?B?UWh6RnZQaDZyOXZDNm1SeWw5WDdybXQ5aFBTa1FrVDZodk1kYjZVWkgyT2Z3?=
 =?utf-8?Q?GzWJCXTYKFZt2zGArPdoN4dPxLFdyEFtJCLUKaj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef15c18-e403-42a5-bc0b-08d93b923725
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 06:42:22.7169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9ghueK9LSzj+KBNdWPmzwNeDxp4LlMKs/Vwp3V9zCIKPeOZRK0lE2ihsTxy7sG5avWkFNDL9BLyug/lsOKSYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

In commit 90629587e16e ("x86/shadow: replace stale literal numbers in
hash_{vcpu,domain}_foreach()") I had to work around a clang shortcoming
(if you like), leveraging that gcc tolerates static const variables in
otherwise integer constant expressions. Roberto suggests that we'd
better not rely on such behavior. Drop the involved static const-s,
using their "expansions" in both of the prior use sites each. This then
allows dropping the short-circuiting of the check for clang.

Requested-by: Roberto Bagnara <roberto.bagnara@bugseng.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1626,12 +1626,8 @@ void shadow_hash_delete(struct domain *d
 typedef int (*hash_vcpu_callback_t)(struct vcpu *v, mfn_t smfn, mfn_t other_mfn);
 typedef int (*hash_domain_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
 
-#ifndef __clang__ /* At least some versions dislike some of the uses. */
 #define HASH_CALLBACKS_CHECK(mask) \
     BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
-#else
-#define HASH_CALLBACKS_CHECK(mask) ((void)(mask))
-#endif
 
 static void hash_vcpu_foreach(struct vcpu *v, unsigned int callback_mask,
                               const hash_vcpu_callback_t callbacks[],
@@ -1829,7 +1825,6 @@ int sh_remove_write_access(struct domain
         [SH_type_l1_64_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 4),
         [SH_type_fl1_64_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 4),
     };
-    static const unsigned int callback_mask = SHF_L1_ANY | SHF_FL1_ANY;
     struct page_info *pg = mfn_to_page(gmfn);
 #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
     struct vcpu *curr = current;
@@ -2004,8 +1999,8 @@ int sh_remove_write_access(struct domain
         perfc_incr(shadow_writeable_bf_1);
     else
         perfc_incr(shadow_writeable_bf);
-    HASH_CALLBACKS_CHECK(callback_mask);
-    hash_domain_foreach(d, callback_mask, callbacks, gmfn);
+    HASH_CALLBACKS_CHECK(SHF_L1_ANY | SHF_FL1_ANY);
+    hash_domain_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
 
     /* If that didn't catch the mapping, then there's some non-pagetable
      * mapping -- ioreq page, grant mapping, &c. */
@@ -2044,7 +2039,6 @@ int sh_remove_all_mappings(struct domain
         [SH_type_l1_64_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4),
         [SH_type_fl1_64_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4),
     };
-    static const unsigned int callback_mask = SHF_L1_ANY | SHF_FL1_ANY;
 
     perfc_incr(shadow_mappings);
     if ( sh_check_page_has_no_refs(page) )
@@ -2060,8 +2054,8 @@ int sh_remove_all_mappings(struct domain
 
     /* Brute-force search of all the shadows, by walking the hash */
     perfc_incr(shadow_mappings_bf);
-    HASH_CALLBACKS_CHECK(callback_mask);
-    hash_domain_foreach(d, callback_mask, callbacks, gmfn);
+    HASH_CALLBACKS_CHECK(SHF_L1_ANY | SHF_FL1_ANY);
+    hash_domain_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
 
     /* If that didn't catch the mapping, something is very wrong */
     if ( !sh_check_page_has_no_refs(page) )
@@ -2307,10 +2301,9 @@ void sh_reset_l3_up_pointers(struct vcpu
     static const hash_vcpu_callback_t callbacks[SH_type_unused] = {
         [SH_type_l3_64_shadow] = sh_clear_up_pointer,
     };
-    static const unsigned int callback_mask = SHF_L3_64;
 
-    HASH_CALLBACKS_CHECK(callback_mask);
-    hash_vcpu_foreach(v, callback_mask, callbacks, INVALID_MFN);
+    HASH_CALLBACKS_CHECK(SHF_L3_64);
+    hash_vcpu_foreach(v, SHF_L3_64, callbacks, INVALID_MFN);
 }
 
 


