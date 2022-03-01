Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EBE4C8A4A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 12:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281253.479505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP0L1-0006f3-Bh; Tue, 01 Mar 2022 11:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281253.479505; Tue, 01 Mar 2022 11:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP0L1-0006d5-7J; Tue, 01 Mar 2022 11:06:39 +0000
Received: by outflank-mailman (input) for mailman id 281253;
 Tue, 01 Mar 2022 11:06:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP0L0-0006HM-4A
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 11:06:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9c78dd7-994f-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 12:06:37 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-64P3WOMhN2WodCFz9b4a_g-1; Tue, 01 Mar 2022 12:06:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8095.eurprd04.prod.outlook.com (2603:10a6:102:1c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 11:06:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 11:06:35 +0000
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
X-Inumbo-ID: a9c78dd7-994f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646132797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Hcjv5yq81hzSD4vfgXUo4NPyGvjN63yGcHqxJqVJiY=;
	b=BbRJWy+XxuD5k03LhPXhyTru08aIU04K7RjO8+8nvvgy6Z0NhqeYaxFLsJbh2jKYvKYH10
	+wATSF3+Omb6Lgg80+WME0Y7YcOB8CVquf5XdItemWVwWNNFBVS4tIg2Dg//LHcPs0N5Hx
	M/t/5/O/EpzazG1Wgu9AXYje52sQr0w=
X-MC-Unique: 64P3WOMhN2WodCFz9b4a_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoYDXQIh6HdPVxe+FEDuGpz8xMLiqZzSV6fkP+UPJ+Ok1/PTKfjN/ocImxVrNI9eImI0iPYxYfqs6V244N1FuhLmKvtBNjyfuFkBj+h5RzS9xl8tLwzyy5B6S+7PK3re+0aHd7zEayMDKbfLJr52h01abo1B7znC7bX0ZmASA4lD4aNGkC5IsLkUfhFcVhQokxVC1wQRkwUFzCEoWSQ1odXON4CbCjQ+W75FEC2fmDwMhgdSx9XajGOsddfWCyBs8d7yzCn6H8iZ/hl2f1DGk315+XoqQak7HmLfjCM2MKXesEdHEUq5R7Bba1XBUjaEgTSOW7Z64XvKstzP+cHUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Hcjv5yq81hzSD4vfgXUo4NPyGvjN63yGcHqxJqVJiY=;
 b=fuRvz87fIqhfNko060phsYx6S1OJVgl4BX08S8RPneS2gvQYhT+kGwL4C7RccNxdpYLfAqx9Xmpq3JjXMYmm5Zsm+svkIrnMlTDomYBOOoHu/Z1kgvav52AzenfHQXqf5MJpGtqIh0V8dryHw21PU7nVZiZn+9YydadRTJbvvVQoPJwyUD9+ss0h4nmp/DVxcXOlHv2Wa9hB0RmuUBIGbaPfZi2CxpkoCYdwaSoMh2k9Tb3+T1mWD3nFF6iVnMENCKVwkc6NIgNTpG2uy/K+SZIBxCs+qo3T7IhsPpdqLYzdX6edu50VxCJA/9J6JOEMrmf6hWMtpI0ZvOuxwbwGyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61bbf544-74ac-b698-425a-d1db80acab43@suse.com>
Date: Tue, 1 Mar 2022 12:06:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 2/2] x86/time: add CF-clobber annotations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
In-Reply-To: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0024.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a595ae01-3f95-4936-90b3-08d9fb738cb0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8095:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8095B43E39479F0F6ED6C34BB3029@PAXPR04MB8095.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8bIr4f7BfXW8zS8WBQy9sw8bXKYzfv8zssvTh0yvT1fgJGd1E3Cup7RGVvXw7AbT+08WrthkGvPM1wFep+aUVrHLxsIvl7chNRB0VoP9cwVULDsh85O0kp0AXndLANayqgAj8l/O2R2PBgDDOg748SI+v8faBjkeGScduc/5npIY/T76Z/vXcxGSDFXj/Ok9oEmVNQXxTgMIWDHAM/9u95hOuauU5VmJE8NsI72MYb+ZZCneJWMoEiUhsnuaNqYnuuiZNHbDYf2OylwwDY5XFFBsxu49I2oY84jmx5hWdAO5Mez3q8eYVl218nTKOO2ZsZOvupd4DbyR/z8iWQn/b6q+JDBz17TOVrcD7gZB76ERIoSGrZGKCkq/gr7hFoub1AKatECC1gYXi0hSNZ1feOHA+0JUSyirkRpPbMKWxCO1C/E1hYsAztDO9QDG2uhAr7nvHKjXZ1gX7GNDyT4hAcr1Xy2CqSmZPVotuToo93kW5hk9+w3WA6hn2SGticOQSgMWwLV59GwVqgwzdjyvregSelagmH34ohEu6JhXM9tKKHW3zNeDeo6IhkE0NkUMvvntJxPlNsA54u8d6/pjOKJGOL9q09Gkeq9tnAJ8gbLVjpheNMq5zgQ2rNX337u6n/pzEXWV/RmaFzhFJiVtOqmvvuskY5naREh0Fy0+53sJk/jki4vqC/9aq7S9g3msUUpR8uefJkE7WH6s15dCGfbiGL+yFrs9kbGZnXifyWR7LJquD2XPtJjatkCekgwW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(31696002)(86362001)(6512007)(66476007)(66556008)(8936002)(83380400001)(316002)(38100700002)(4326008)(6916009)(54906003)(66946007)(508600001)(6486002)(8676002)(2906002)(2616005)(186003)(31686004)(26005)(6506007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2ZpcEIyWDR0Q3cyNVFqRUFnN2VtdVAyb2xLOG92a1hEVnI1SGpRYWhZK3pV?=
 =?utf-8?B?QUlwQTYvOWgwZkt1aktxZTU5U0JYVUpObUltUnRlSDJPaEkvWnh6bCtnUFVu?=
 =?utf-8?B?WCs1Nkd5TU9EeC9MSFJCY09DODBUNE03OTg0ZHZvTGZiODNDNnJwV3NKMytv?=
 =?utf-8?B?MGNxOUsrWlJ0bFRhTGN3ZTRudVJiSHhoVERtZ0paVGRuOGZPekZyaS80ajl1?=
 =?utf-8?B?akFTOFNwOUtldTg3bEJmZnVubk5aVE5LV0R5UEFDVzZMc2Vsc1cvM1pkN1Z6?=
 =?utf-8?B?blZMOTVsRVQ5Z2pLYlFlNFVXaXo2emJwSVhIVUEwOTdpODdhMHJDWk9qT082?=
 =?utf-8?B?bFVibDdPVVlSeVBSUUkyYnlvWDdybzRVRzNpRk1vajNRekRrNUlDdjlKc01y?=
 =?utf-8?B?bTJDT1FVTWxYa0huMVBFTHBJMnkwZ2liajlnVFR3T2ZHNzd5MjZpMVZDSTJP?=
 =?utf-8?B?SlJtN2xXREd1OENxVG9UeTFSL3I1SVhxWEFiakduZHFyMlhoUnZnQytSeG9v?=
 =?utf-8?B?RVdMN0ZxTXdZTzJWU2tXTW1pRjJLcnR1UEs2ZjFLVUE5V0oxVzBGYzdJMHFi?=
 =?utf-8?B?UWhYbko2T1U2NkJyMHRQamJrV0lsckRFcFZXNm1TMzRtSnVKOHg0ZE5DOWJM?=
 =?utf-8?B?Z0VoS1UzU3lORW5MMG80ZGNqQ0FGelhRUGVhWHBKaDF5ZEFOaXZ0T1lKOTA0?=
 =?utf-8?B?SkFmRERlQ0l1blFiYmRnVTJxUlJMSVVRWk93eGsxVU5ZZGRUbksxQTBXYmtj?=
 =?utf-8?B?UENJRndNM2pYVEg2OVl5NkRRc01PeFNlc1pNTll5ZXZSckVJWHpMRXAwckRL?=
 =?utf-8?B?cmV0c2J0cTFVZzl5WVo3MTU0WjdNKzNkdlUwWkltYlFVNm5HVVVzbEpFTkUy?=
 =?utf-8?B?Ull0NnV3eWNCYWxBS3ZYMURVL3VBTzYxUklFL2J3N2RrOWY2KzdVUHNIaXho?=
 =?utf-8?B?aWNxMkh2Q0J2MG1KNDVnVGtqSlZ6YzdsRlFvU3UrbXg1alZZSndLUnVMcUNi?=
 =?utf-8?B?THlVVk04Vk1Pa1d1NWhZc2lKTFZiNFNId09jRmEvOXMwL3VORzlvcVJQK2Zy?=
 =?utf-8?B?cnpjWHI5TGJiWWVNNzRIdFlGL1psME1GM1VHTXBPeTczZE9hZXVLREdJTEpn?=
 =?utf-8?B?V3hHbFlSaFNnWHQwQkVIeFdzRFZ3V0JpeDh3OEZIL0ZpNUV6SHVPeHJMaXVr?=
 =?utf-8?B?SzdBSGp1U1kxdUZ1dTBKVTRTTlRlR0RuUzhZU3hiNlNtdUVNb09lQk1KdDRh?=
 =?utf-8?B?ZGh6a212TUtQdmFyZlpwallsRUUrTHNBdUptSXV3eit6ZFB3Z0Z1dkhvN1Vp?=
 =?utf-8?B?SngxTHFmVHlMNWV2eDQ4clFTVlFOREdLWFJScTBSejdpQUtRYWFiYVMxckZE?=
 =?utf-8?B?QlVPMm0yeVd3U085am1oT1RhZ2VXeSt6Rld2TjA1enI3ZXB1a2xzaXRYYThH?=
 =?utf-8?B?OFl2VDM2VVQrNXk2aTdsZXlCdE9TcTdXTlkvREh5cDIrc2V1aXl0dUtwcUxq?=
 =?utf-8?B?SGFzN3dKT2F5ZDQxQlg4TzFEYjllamZKVWZrZDMrdnBOeEtRa3d1Z0ZjcVhm?=
 =?utf-8?B?QnAwOUk4WjNTUlVIWHhZVmRTU2ZpSjRJVlcxT3lFU25aR2p4Sk1ZYzFqcXJH?=
 =?utf-8?B?a0lnZ2VWTzdHT2Q4R0dvdkNWa1FKNWhmenZzZlI2akRONXFlMzNFSkFmVzFm?=
 =?utf-8?B?bzVoWjdobzgwK1RiK25TY1VxZDY0dmtpeU9iMTg2VjhER3NraUpXYUFJZHRO?=
 =?utf-8?B?Y05xSTBuNHlka0Q5OGMzTVhYYXVNTUtuTXFWWUxiWCs0dEt0b2RWOUdIby9p?=
 =?utf-8?B?UHVDVFlGZXcwZUJ5Mk1xMit1UlYvcS9jU1ZzdFFlM2pieVZtK2RpaDF1aEJr?=
 =?utf-8?B?UFQwUDhvcDBmQ0o0V3pLSTJleUF6SThrdWRPbXZ1ZWlBMmZNZ0NHSTJ3bjVC?=
 =?utf-8?B?ZERTc2pjZm1mNUZJeEtQdDBFeFJ1SzdtWXJXMStBeTZBTzlURXhWYWdKazJa?=
 =?utf-8?B?bVlKUGJ3RE1qODhsYUJESllKeFJPa2pvdzBNRWtpMmZVTzQzWU5ZY1p5OGhN?=
 =?utf-8?B?VGg0OXRPWXI0dE54Y00xQXB6N0RqMXV3ektYdUw2Q0JNcWkwWFVHQWk2Y25t?=
 =?utf-8?B?THdKUkNSek00em9GRmt0OUQwRjhwd2RxNlhtZGpaNGxENi9aTXVESWlxd1U2?=
 =?utf-8?Q?uQmSpnVlc+8M/FT9lw2Gy5Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a595ae01-3f95-4936-90b3-08d9fb738cb0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 11:06:35.1078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyRoRVU43jPHoeLfyRyqCSiFmtTG2dwJ+cSbAKveiE8YqwI7GAdfN7rTyp4qou2AcwMkYVpRdTlqDgtPtUdFbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8095

With bed9ae54df44 ("x86/time: switch platform timer hooks to altcall")
in place we can further arrange for ENDBR removal from the functions no
longer subject to indirect calls. Note that plt_tsc is left untouched,
for not holding any pointer eligible for ENDBR removal.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I did consider converting most of the plt_* to const (plt_hpet and
plt_pmtimer cannot be converted), but this would entail quite a few
further changes.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -375,7 +375,7 @@ static void cf_check resume_pit(struct p
     outb(0, PIT_CH2);     /* MSB of count */
 }
 
-static struct platform_timesource __initdata plt_pit =
+static struct platform_timesource __initdata_cf_clobber plt_pit =
 {
     .id = "pit",
     .name = "PIT",
@@ -483,7 +483,7 @@ static void cf_check resume_hpet(struct
     hpet_resume(NULL);
 }
 
-static struct platform_timesource __initdata plt_hpet =
+static struct platform_timesource __initdata_cf_clobber plt_hpet =
 {
     .id = "hpet",
     .name = "HPET",
@@ -528,7 +528,7 @@ static s64 __init cf_check init_pmtimer(
     return adjust_elapsed(rdtsc_ordered() - start, elapsed, target);
 }
 
-static struct platform_timesource __initdata plt_pmtimer =
+static struct platform_timesource __initdata_cf_clobber plt_pmtimer =
 {
     .id = "acpi",
     .name = "ACPI PM Timer",
@@ -683,7 +683,7 @@ static void cf_check resume_xen_timer(st
     write_atomic(&xen_timer_last, 0);
 }
 
-static struct platform_timesource __initdata plt_xen_timer =
+static struct platform_timesource __initdata_cf_clobber plt_xen_timer =
 {
     .id = "xen",
     .name = "XEN PV CLOCK",
@@ -780,7 +780,7 @@ static uint64_t cf_check read_hyperv_tim
     return hv_scale_tsc(tsc, scale, offset);
 }
 
-static struct platform_timesource __initdata plt_hyperv_timer =
+static struct platform_timesource __initdata_cf_clobber plt_hyperv_timer =
 {
     .id = "hyperv",
     .name = "HYPER-V REFERENCE TSC",


