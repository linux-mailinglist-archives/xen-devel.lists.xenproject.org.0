Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80619403A8D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 15:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182026.329426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxYq-0000u7-N8; Wed, 08 Sep 2021 13:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182026.329426; Wed, 08 Sep 2021 13:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxYq-0000r0-JP; Wed, 08 Sep 2021 13:24:20 +0000
Received: by outflank-mailman (input) for mailman id 182026;
 Wed, 08 Sep 2021 13:24:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNxYp-0000oA-IN
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 13:24:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad47221e-1c2a-4667-93a8-040045733c19;
 Wed, 08 Sep 2021 13:24:18 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-wwpW5kiPO_GK1N_zeZd9Yw-1; Wed, 08 Sep 2021 15:24:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 13:24:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 13:24:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0015.eurprd09.prod.outlook.com (2603:10a6:102:b7::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 13:24:14 +0000
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
X-Inumbo-ID: ad47221e-1c2a-4667-93a8-040045733c19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631107457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7205OxPodD00LxNwAZNGY+4ROFN3Gj6YfOBp01MwvY=;
	b=B7Qk1rwKzQrJUuLsdzJ8HI3ujMUSYD2p+z8Z1ZAPq5wzqFsiwYFqLmRfw8pbgTg7E0F8/x
	pEY2GQqTB6cOXVgSz0f4Mt9jBgbFYet+mUbTmdDbZ/hfhWtoJuuBK5pakE067DMzo2dZjR
	1csXkdI+J/2vtnFYdeeMBP+5+O1kAcw=
X-MC-Unique: wwpW5kiPO_GK1N_zeZd9Yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIP/5zXDu66XxYAvSMmlJnEGwVejDrOAIIVPvE7yTQLlg+b9bpEhWm6S23eYH/AbEU3U+UAlfpw33Hv0ocvGWPx5n+uGDkUUeB/8R+apkkwNzAdPVYx/w4XwBdZZxQyDuePkL3tQzta8Mgicgz2Dmak55mKDRvvJPysAbh/nTTImp4Ma2rSnJNdvViuI0iEWOgTwIZUj+b8w5S3cEj2Dbi7gLfm2Vg3G2T7MfXOeh1qsO4JRMUP24EZj4+EWrS6VZuz0gdtboXR7HouSJd0ffNS/9rreDMOiXTnqR093akGDgpxc9moEitBs/rsVEzh10p8VdjO/nnvm8zqb+YoVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=J7205OxPodD00LxNwAZNGY+4ROFN3Gj6YfOBp01MwvY=;
 b=iHAbpLehg3Bgaj2ZoRxL1VyG2NTeRLgGeVT5BUVofh7yUWW6J3aD4Z3E5xCa+idoXUGTSgVV18h6CEkBnxAwBDHQQzNtFY/n2L2O1UpYZkXWysmENsBzXjhRXQ/ZIM0YTjJE9IJKFxTG2VfBsbJQYs18+oG+JTFELNo+1C3iKrInItHhFpmObB7th1qBf4jty5/BDDKNkw8f4ocqhIDeTxa2OQx7u77Dz7c+lMbaSV5JbktFbD1yH5ZhJZt7bGfN3tsancPHiGsyUdBzFHVqIZOP1TFCJcyVqYWoWq8GYKzFkLwDB1+mQyd92cvTbDM1K+JD2WY0Hdq+DhXv5lZhJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 3/3] x86/boot: fold branches in video handling code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20bf2b1c-9c4b-bf9e-bf57-d0ba18e6458c@suse.com>
Message-ID: <33dc91cf-1c80-b386-f9e0-6cdb8e32d5d0@suse.com>
Date: Wed, 8 Sep 2021 15:24:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20bf2b1c-9c4b-bf9e-bf57-d0ba18e6458c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0015.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8993c5b-e677-44ad-01a6-08d972cbf439
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63043ABFDCC3B6B1F54F648AB3D49@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FKDFgccG75koD33zy5xgGuLGH60kMjSbkr3Y1cTXm3nTFnSkRWz66FWmPwxNGPvHEAAQuShyn3hslcXct5GP8sS46c7oT2VvjHBL1RvOustCw/WL489JubmHjUQKVg7z0eM0VzLdr0IiSgTqopsmyVnZf1suPpOI+tm/Hrtpih2T1rHn31aYo3EwzGO6TYLFY0h6L75CtaBHiuFb07bkJQt0clLPrm21ogQWMb/9nHj0es3N1tqwjwpJRdy8fJdJiY+1WFgIe0eywdZF1BNjNnrH/KfApWpL9VyNb12gIu3FTfA/wZl72XRY6RYHu92WMV5DpHsPyPIItQip3O91mq+GB4g6oFFX00J13ZZ3wyf2VxWI10DD7MFfQWoQKDeKu2pP3CYRyCL2yAxjcru8tT2bKI4rYaI7MleBJ1T4qGwk3jt+MiDSJvesmDETqo16igcSYepdEUe3z3xwTDwRdQ4CdLzSBhnyYSYP1hvERymqMC0u8fRyqbQ72L2P9GLuDx270ncoqcAVaguD1RAgnAHozt0b0Kbo4IJAv+zgXtxIrh/067VtKvs2pvASCV7JLvI1vQGP5dGZSkZubf88sH3P1T7CUTKftBLGATN92djXiwu4fIyjSnuz8rCuN6OCcR1inNiLZ4SUOsGI7bRNMUwcT3qzE1rWmKLA6JdYbyAJzUGhteGHKyqrl21zJMCQoJ7kQjxQGt0ByWDbB7LRa/OcqXrNGJh0DphPbOOGDYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(39860400002)(346002)(376002)(8676002)(66476007)(54906003)(4326008)(66556008)(31686004)(478600001)(66946007)(31696002)(83380400001)(186003)(956004)(6916009)(26005)(38100700002)(16576012)(86362001)(316002)(4744005)(2616005)(6486002)(2906002)(5660300002)(36756003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3h1b3N3OE5uZDVRS3hJV2FYMWg5TFlYOGFrTDAzQVR2ZE1xNVFNc2Z4UVl0?=
 =?utf-8?B?L0VMZURGbXpBV0JSMDBEekRPblhIZE9LUXN6cVYzYlVlVm9FcVQzVUlKWm51?=
 =?utf-8?B?Q2lSUkZmaVBpYmUyNzRaWitNTTZtcERTekZxV3Zab1RWWm5qdUszbGMveHVx?=
 =?utf-8?B?b3pOMkJiWTVyOWxpZ2xOc1JVSnNaNE1KQit2UFA3RmZ5bHRxaHV2YTl2QlIx?=
 =?utf-8?B?NWlUSm81dFRZN1RwazhMN2FLYXNDbm1yMHBscTJSektYczRCaUNrMThMemg3?=
 =?utf-8?B?eXl2WWI1QWNFNFFEamdNL2kxTDdlbjU5ZnhFVnYyNEhqcGxMaFdqNThCQ1Fi?=
 =?utf-8?B?ckdJYm5VdndRU0RHaGhXYm51eFoxMEJBU3o5TEFKZXhqekdEYS9GUE5LSDdi?=
 =?utf-8?B?R3lCdm9xakdmYjlCYWRlN2VIL3VDcjZycGRNN1phQUVhQThuRDR4T2Y3dUdk?=
 =?utf-8?B?SHk5cmd6YlprR3N2OUtvTWRxaXVHODdra2lJL3BsTjdSVVJWRER4dFgwWUJy?=
 =?utf-8?B?UzA1bXdHZkFQQzlFRFFWNVlNYmJFWjZ6YVZLT2JpV1UraktOYUd4NVBobmUr?=
 =?utf-8?B?RDFxOHVVWS82bGNPSjhqWDhKTVBBZS9leUNQS0dNTUVDQzFWekJUVVNNUTJr?=
 =?utf-8?B?VTFhbEMyZDVsc21QSVVNSitWK2V3Q2FObjJ1SzZYbk5DS2tzc2VxVkFZZ1FZ?=
 =?utf-8?B?eXpXMWtpaUY2WGdCc3dLQ0hidnRoR0F1UlVPRWQ1OVhDZ0JqcFVqUDkwdW9i?=
 =?utf-8?B?UTNEdEMrUkc1WkUyc0ZOdlZ3aElLZTdrWnpYOEZPcTZrL1hHWU9JSFJvbTRo?=
 =?utf-8?B?ZWRZY2cwRW5SSTQ1OFF2NThQenBjUFFFMHFlUENnU0s0U0xkMUJkdG9qSWU5?=
 =?utf-8?B?K1R0clpCRkpaczk0Y281ajlUQzdNUXlpT2sxUGhWdnFKVjUwWWtpRzNoenpX?=
 =?utf-8?B?MnBkS1lSR1AwN1NYMzBWdzkxNjlIZnZjYkZCWnJTb2FmWTNjVHMxNzdLQjhG?=
 =?utf-8?B?bGpIVFFudll0U1hKZnZIdi9BczZpeU1nMWtIaGFZRW5tU3BjYXFZaVJnSUlu?=
 =?utf-8?B?Kzc4anozNHZIVzFCdlVCYllmOWc4TjM1ZGNPVExZS3RHcmlPcUhDSHZhM2w2?=
 =?utf-8?B?S04yVGtwYVRQV1Jja2VKUFFueG9ubkt4eUZVdlpQYVJDVkE2SGp2ZzNqdUNF?=
 =?utf-8?B?ZE40WWl4TzBsWUpQcXdUdGRHaHM1TFBSYkR6cEk0MzYwakhSMi9Da0lOSncx?=
 =?utf-8?B?VmhwNHB1eXB3OXZkVHB0V1NaQ0ozTXdVaC9SL2R1WG9aaFlhVnI3amxZdnpz?=
 =?utf-8?B?UWxBUCtUZnU5SWF6M1pYSC9uQkN2TGNzK1V0bEdiWHVIdTJFSGV5aWhGa3pR?=
 =?utf-8?B?Rm1GK0ZQSCtkTndnM1loaXA2aHFBZUFBaitIQW5ncmduNERWbTBsT0xHL3Ns?=
 =?utf-8?B?Z1IreGdyLzNIOFpWMXZXY2hET2FlczlKRFZ6clRvaDQ5b1VRMlNwenE0ZHVx?=
 =?utf-8?B?RFNXY2xWTnNBUkZuTWsyMVNPM2JwRTh5ZnE3RTZ0RC9GZlU2R0tCRktpcGgv?=
 =?utf-8?B?SGxKNUlaRXZFaCtGUWljcDc4a2pZbHlXOXFTdTlEbnFObkk4QUVJL3ZweHBU?=
 =?utf-8?B?WXl2aG9BZW9mWTRETjRONDA5L0JseUJJS2M1MlBsaE9rbVQweFdoUmpVMUR1?=
 =?utf-8?B?TSthMHhXSDNURTVxSTlHODZQQ3R2TS9DbTIzaUdTblZYaUd0THMvYUIwODE2?=
 =?utf-8?Q?Z7n9MgOfJxTavl24HijFShvLFFHae/9lItJWKSW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8993c5b-e677-44ad-01a6-08d972cbf439
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 13:24:15.1799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbfrS1LMEkPJ6ZgBkIZGOo0awUX2ws4DRB5M6V9AwVPH3CAXZaO5IuB8/XVJ+ikNsa1O3vMHbxQQBXltMNuqJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

Using Jcc to branch around a JMP is necessary only in pre-386 code,
where Jcc is limited to disp8. Use the opposite Jcc directly in two
places. Since it's adjacent, also convert an ORB to TESTB.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is an easy change reducing the overall trampoline size a little.
We're pretty close to needing a 4th page, which I'd prefer to avoid for
as long as we can.

--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -332,8 +332,7 @@ lment:  movb    $0, (%di)
         cmpw    $0x656d, (%si)          # 'me'
         jnz     lmhx
         cmpw    $0x756e, 2(%si)         # 'nu'
-        jnz     lmhx
-        jmp     listm
+        jz      listm
 
 lmhx:   xorw    %bx, %bx                # Else => mode ID in hex
 lmhex:  lodsb
@@ -401,10 +400,8 @@ mode_set:
         cmpb    $VIDEO_FIRST_VESA>>8, %ah
         jnc     check_vesa
 
-        orb     %ah, %ah
-        jnz     setbad
-
-        jmp     setmenu
+        testb   %ah, %ah
+        jz      setmenu
 
 setbad: clc
         ret


