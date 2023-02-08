Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D602E68F100
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 15:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491860.761195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlcr-0000Ir-0R; Wed, 08 Feb 2023 14:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491860.761195; Wed, 08 Feb 2023 14:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlcq-0000GC-To; Wed, 08 Feb 2023 14:40:44 +0000
Received: by outflank-mailman (input) for mailman id 491860;
 Wed, 08 Feb 2023 14:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPlco-0000Fx-Vz
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 14:40:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f373742-a7be-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 15:40:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9343.eurprd04.prod.outlook.com (2603:10a6:102:2a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 8 Feb
 2023 14:40:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 14:40:39 +0000
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
X-Inumbo-ID: 8f373742-a7be-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rg+DYWikV92fFanUpOwhcZxGlJq/ruCM5CLDg+JFbUDihhNYIG6kZNEu0LzaTo+eCDyOo7JJqsGrfLnX1by26/GEvS6K2su4M43iiRmRSoLE8qBIA9yaVRnHnkiUOYrlEv6X6DqbTyFYWK1wdBhBuzcNinQX3ZhC1dXopCByc8refTsi6a8G0s/Xtg/D4UB0hV8VeNiuT9yKIkY+KuT/lF+zNN2fpF3ZJh5aW2v2TAoC4HyYVuakmPQAwF8fiYKnoDCboaF66BSA3FBMRSenmDPtNF589fBxsT48N4lCM189v/02KWOwcsJDwKExOi+zdXdLkbg/nBjjLofxsvw+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TjoransTycJI2ib6c9uLYqwWZI2WbBm/YXVnWC/riQ=;
 b=YrVqfj3kxbWLMnr5jBfyTa/EhciqLXcKUdRByEiYpDexHKm1ZLAuR37OXPiR1dP0KXqxsU3QRzfJk5u9WLuyGLQMGrAxMQ5cEEBqraBO0ArDsmAUlYPBS2VwWcFuQsD5aLDyE1IMdSpC2zGjjSelCX0mcdsiy2a3RbpZ0souzFa10k7mtrGfM2zhG8y0abTuQIuZkop87su7yiqVmzJmkb6ZEtE+r4nzlVpIdTldlZzqGlxO0poVYbcs31e1Spn/7Ccq4Iu2lbsBNAEoGyr8OcFBd+8LQrUQGaXi4qIo1zeqjLv2IGFweuBgfoWNJr+4h8MiIQFABnesn1IFvq41Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TjoransTycJI2ib6c9uLYqwWZI2WbBm/YXVnWC/riQ=;
 b=0FpbdIv26A9IGOnz1qaRhQ/T3XvsltXaLoz4e3KjD75ORO3dNqmfzQZaCIkxQzK4LBgpk9yW0ZHZ7j/4A1NqIn9vOJKlAmO11l3c6Oiq5Sh06TXqc6dR+qmHuG3QY/UQvGvUBVkjD3nHp04C7CkQslrwXoBoZHfGuf+XJ4T5rAa+5ZbXaYVxcKbHLTqOzP5rZf31sKt+t163efuRlpNrCFHvCdLukOYiG2Cd7hjkvQ0jgP3FvcBdqxekrAs7idjRUcN5DU9N60aIPBr9a9QlmaRdtaAhhveyUaI7Z1+qSfv+tAoxu67lV0tLkgyptHXR6h5HD8KQ1TZl9tfK/Zxc6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96b0ebc7-4cd6-9053-06a6-78dfc0666b8a@suse.com>
Date: Wed, 8 Feb 2023 15:40:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/p2m: tighten old-MFN check in p2m_add_page()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 329425c6-94a8-4030-a2d6-08db09e27267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1lMLreEldrL65iOZLfh2qWemUfBqXSbSoue2HJr1BfIwkLfb6lp4YUYxflulXqcD6vpPpvHevMr2puasB8zJ7y0BS2qkJiZyewIDjgmyg/LNYUCdkcVWpXhc15f2F9EFQy0wuHpl83YcV2Btgxju1zyznBkOehHq0yAUA6lfFeQEC2C9BfkQ/QyQifUqZ/sDm7O1elT43cOMopoMbKFUwYXo+t47UxhthmhFd5H/GwAStIUT4J+0IBKgLPIfotJmtL/0Ke7e0kRuUcpZiYxLn7YddDC7ijdIgsyMCO8iS2b3Km/Z7qSWQhdo3V5vYzPmVuvJkn3ki5mdBZqMODEfm0GHVNxthsKmohm6QlNrWaxBiS6uw9JpM00hXx7Z802EAEfhLhtSadKkKPxgfVFqA6805CP0LrV1Ci+HlXhPe5EIBN122mzu6+bBcAUeKMJjtqOIsn6hk3mdGDHcmj/7kihYhBGK8kmzQxggzfvdsYSMsuAgSfwuK9Rhax95z8tfmyMRWSIJnZw99wrk/u93XtuR6k+DURHah2BONgfqzVWb0wx0sgNLe/e5EGD8FvXPgtMJy0nF4oYfPMsIQJufSlsH/SylpKn+dUbyblMEHbldVl6/Mo/8H15UuEOYCowGFPJaHTM2xjvdKldW4rRhbRZTdRiUPWZxSLo1zFiaBij4A5RbMX2NykzfkvyKrw2VI7QcVnDP1UlIKG7Dme3rWUx7qqlxhdp/NIsGBLNU1Do=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199018)(31686004)(83380400001)(6486002)(36756003)(5660300002)(2906002)(26005)(186003)(31696002)(478600001)(6506007)(6512007)(41300700001)(54906003)(86362001)(38100700002)(2616005)(316002)(66946007)(4326008)(6916009)(66556008)(8676002)(8936002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUIzRFNlLytndExlYnpPWkoycGsySTBUbGpNNTJuNmpBQkVTdGFnTTdHemNK?=
 =?utf-8?B?Z3ZKQllrdm9yc2VueERucjJTdFV0Nkpod3BZU2FOUEN6bk1wb2xDV3VpczZD?=
 =?utf-8?B?TmFZKy9jUEZhWmdyME50S1hoUFdjaVZhMHJHTnRGUDdaMm5JZzJlK0JDYlRS?=
 =?utf-8?B?aWtnU3R5ZTE0UmFZVFFyTHpyZzNsckc1WXhUWi9uTTU4UVN2dmg5QmJxUGF0?=
 =?utf-8?B?VUF2YzFaRVEzSzhDcGI5Q1U1cGtneHdwMTk3b1d1OUFaeTRObXl6cVNPcFE3?=
 =?utf-8?B?VFZIR2srMjM3dnFYL1cxdUYwS1F0a1FzS29FRmtwSzRhQys4Rzg0aXQ3Wnhi?=
 =?utf-8?B?bDdZVVMyWlRVUDcwaHAxNjZrakVhNm9SMG1uTjBVNm1RYTZjUjN3SWdTVTRq?=
 =?utf-8?B?T04vQWZFbWl4SjVXK0FVd0dabmpnakxXT2VWT090cVBUUk5vOHcrRytiWk45?=
 =?utf-8?B?NlJZOEZqRmQwczJqZUxPVjgrL1lkak0wZ3hlcFZHQ2dNclhoUU9vY3crRnRK?=
 =?utf-8?B?MXRrSDVZTTZaL2tTN25vdzBqSDJlWWtxSFFSLy8ydFhhVjg2aUxpOGpQU3dk?=
 =?utf-8?B?Mk1pSkVYRDRBKytldlpXc2hMVG1JelhTRURGbHNPVlRGYXkrT0Zyc3plMmJI?=
 =?utf-8?B?R1N0SnU2LzhaWFpzZVQ3WjUyR3NjRlVISTBiSzlOR1RJeUpQMTlRU29jODhO?=
 =?utf-8?B?blpSNmxjbG91cFNyYTNFY0E1NUFZTW9IWlQrVUgzc0J0UFNhb3hYWkZGU0t4?=
 =?utf-8?B?aW9WWE5iVGl6N2VUWjgyZ01qT0dGcCszUDNjc2JwelpZcTJpenlLeEViaVQr?=
 =?utf-8?B?TmNnbVIyVXFLeFFNR0toU0t3V2FacXdOSUpyZWJ0V3hGakJJT2FmLzNkMkRE?=
 =?utf-8?B?UmdpQmJCaVNOdHVnVmo5OWY5cEJlZWlIRTAzM3JLS2x6dGdIRXpTaFNoUUhr?=
 =?utf-8?B?Z0loelZzb0E3MGROUU5kWllITlhrLzhpeEhDMnBPOFkxVmJEQmtDTTZmVzJx?=
 =?utf-8?B?MnpuMDBDQzV1a2hjMVV5cXNMa2krZ2QyV01KRnNtVy9HeVk5MTdnYlVzYzI2?=
 =?utf-8?B?V0Z0ZHd1SWhrcjlnclBlYzdITWd2MndDaXA3cTFZSWxpSDZUWXNPVGpmbXho?=
 =?utf-8?B?MXlpOXNoMFhLSGgxTnRzNnpyd1grdlQ2RjJMSXdnMi9DOTVrSnc5TkF5bXF0?=
 =?utf-8?B?QzJ5TGRqQ29sRnJZZDNWMUpsWVpEYm9BMGkwRnE2NDBUUUlhMS9STENSRGVX?=
 =?utf-8?B?dE9temd5TkR1S3lIS1hBZ0h0UlVqeWpXNkh2TnByM3lCMDBtYXA1dHM4aEZ2?=
 =?utf-8?B?SGdLRHE4UElyNEttOWRXT3p6NGF5ZXk5eURSQUh1NDBqVXRNUGlWTWJURGx6?=
 =?utf-8?B?Y2FTZ0ZvcGl6ck1hSHRXQncvRG9Ud3U3N1BaK1hERUlrSThvTzlqaDdkdXRz?=
 =?utf-8?B?QU9HTG5WVXRjMnlCWGJWZnliNWc0bHZ2a2paMjJ6RHkzZEJGbUxsY2duTXdj?=
 =?utf-8?B?OHRpajRRMmg1bklZSCtndS8vWXhGaWNZd1h5ZU1QUEQ4OHhsRFlVMllVK2Vn?=
 =?utf-8?B?VHE2VFRxaE4wdWFvdWFkUzFzUFkrQ3JQTjRLVmc0Y0E3b1VsazJFbFNidmZu?=
 =?utf-8?B?L203aHJkMisybk5qRTdCQWZtUnI5cG9iWG54ZnN1dFovMjlwMlgwZW9aVVhn?=
 =?utf-8?B?Vi8rOHd5Q2xvOGZtRU5wN2J1STdVTjFsaTJLbWxnWnRxVlJXelVyaGljWU5Q?=
 =?utf-8?B?akJLeXFWa2FobGJlMXdMdHFnckExK2M0YkZubGhPNjlPVVMyNXpNcURNNkdU?=
 =?utf-8?B?T3lOT0txZkNBbXZpS3JKSVpDY1lld3Y5Ty9ZeFYyRHNYMzBvSHlpYXY4R1U3?=
 =?utf-8?B?dG1uWVFEYjlLVTZpTWlZY1JnanlDSHQ5UWlwZGUwZWd1b1paTGdvN1NwUlJS?=
 =?utf-8?B?T01OMHpHT0FiY2dvR1RSVURUM0o0YURBbGVZMGRrSmluK1FmL3p0VlVOZ3Az?=
 =?utf-8?B?V01oYmhwWndxUDVKckRzMGhzdnRoNE11YzVuY3ovODdNU3lRajZQdVorQm0x?=
 =?utf-8?B?MFNrSXdiSlhBZjZBcmpqcUxJTUJ6TDdkZHBmakNHZldoSXFaa2JiNkJ2Q3Bh?=
 =?utf-8?Q?xVuf9Wgs2R31KZfEPaM3iiMCC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329425c6-94a8-4030-a2d6-08db09e27267
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 14:40:39.1272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oblWzcvq5dAlDDDnWgZtGOFvQ6iaP/5c85oKwstmwc1/2Os4faazSHFwnNNipUqXIY93wPRJXPgX9pNWuOTqyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9343

Just ahead of the logic in question we've translated the subject MFN to
a valid original GFN, in order to then translate that GFN back to an
MFN. Restricting the call to p2m_remove_page() to the case where these
two MFNs match is too weak. Instead refuse the operation altogether when
there's a mismatch (which likely indicates a bug elsewhere in Xen).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If we were certain that a mismatch indicates a bug elsewhere, we might
want to consider crashing the domain instead, to limit damage as well as
to make sure the issue is actually noticed.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -714,13 +714,19 @@ p2m_add_page(struct domain *d, gfn_t gfn
                       mfn_x(mfn_add(mfn, i)), gfn_x(ogfn),
                       gfn_x(gfn_add(gfn, i)));
             omfn = p2m->get_entry(p2m, ogfn, &ot, &a, 0, NULL, NULL);
+            if ( !mfn_eq(omfn, mfn_add(mfn, i)) )
+            {
+                P2M_DEBUG("old gfn %#lx -> mfn %#lx != mfn %#lx\n",
+                          gfn_x(ogfn), mfn_x(omfn), mfn_x(mfn) + i);
+                rc = -EXDEV;
+                goto out;
+            }
             if ( p2m_is_ram(ot) && !p2m_is_paged(ot) )
             {
                 ASSERT(mfn_valid(omfn));
                 P2M_DEBUG("old gfn=%#lx -> mfn %#lx\n",
                           gfn_x(ogfn) , mfn_x(omfn));
-                if ( mfn_eq(omfn, mfn_add(mfn, i)) &&
-                     (rc = p2m_remove_entry(p2m, ogfn, omfn, 0)) )
+                if ( (rc = p2m_remove_entry(p2m, ogfn, omfn, 0)) )
                     goto out;
             }
         }

