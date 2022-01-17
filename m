Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80FB4905FA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 11:33:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258094.444076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9PKG-0008R5-Mo; Mon, 17 Jan 2022 10:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258094.444076; Mon, 17 Jan 2022 10:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9PKG-0008P3-J9; Mon, 17 Jan 2022 10:33:24 +0000
Received: by outflank-mailman (input) for mailman id 258094;
 Mon, 17 Jan 2022 10:33:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9PKG-0008Ox-4S
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 10:33:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5673353-7780-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 11:33:23 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-S_N6po9lOrG8jfAnsILlBw-1; Mon, 17 Jan 2022 11:33:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB8061.eurprd04.prod.outlook.com (2603:10a6:102:bb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 10:33:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 10:33:20 +0000
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
X-Inumbo-ID: e5673353-7780-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642415603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9p2FnDlGq3VBWQOmMwyci8eqZUNpfuOw5fbZAPjHtec=;
	b=gXhosIYWv86JGcfDkow1uwgpFgCHk9rv2sGsJSppkr9Jufj+8RUh3nKlmE/wUVzJob0LFG
	+TKfez4Kud3P51OI10wAU5jUWxfZOEi7fa2R21UQzDKPYs9qm8fIMXES6QYd1qj8KhrjOq
	FTvOdh2NQpvx8TPbr/rsiDIRFPqMmEU=
X-MC-Unique: S_N6po9lOrG8jfAnsILlBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfObYwdVaSNb2BO9tDsRfmI5V//sQvqd34P1LD1ZQ+2XI2WAo8b+pT5Qw1N7YJsfm8EfqlHtPmKpf0xiZjpj+/7yKI8XqPofVL0yjJCful7zKLb9dy9IH6bnLjjVdWsD+Bj4Pcq/XAoE0RFVMvPYXWNXgSrdu0j9jNIF7EtvsycNb3kbOpkD3yFoKWRlyMLe24WPKlxe2Ib/YP8os0+XFPZ+xs8UZyjoURL34EWXCNpP2wmHVLJyaIiXJLMCkFJKI5j4d+2/HyIyA9OaHTxJe7ZcKhqP7bX7EdwWUHIxv1vn8+HIBydBcXtFKQ+fRcFkh8Asg2zONRRiUmIHZCBlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p2FnDlGq3VBWQOmMwyci8eqZUNpfuOw5fbZAPjHtec=;
 b=BNrbCddovBo9lERnUDAnbLpvYKPNGCtQ8FY3ibKciAbCe9zALp/qRiA11oAhtVnAmks++X+TTGS5Tjjn49lmPtTz2jBtyHoUVNuJ3yTL0kmwEeyNSPW9wy8u21WsXCCIW4JSvydxTPQmkgRVo5qfjlozuFfPIEFgYvsbdd//DOWzATqYTI/Xgk41TJe8R71v+72lsAmee3nAutnyqHh47k5zae7zn9q8tHdqZp2xZXYpEhke4ccrw8kJMcmwWKwnYY8rkwn4CRgOJPGD/NeZogLj7RKsuAylQyeqktP+hEZqOKetc/IhBJe5puaCb8H/sysV4dWPMqhinUjL0m/7ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <362d1e97-c9c4-3d52-be6a-3fcd5fd0a27f@suse.com>
Date: Mon, 17 Jan 2022 11:33:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/APIC: drop 32-bit days remnants
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0043.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88d1d4e7-778f-43a9-d10b-08d9d9a4c83d
X-MS-TrafficTypeDiagnostic: PA4PR04MB8061:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB80610C305417E57FC62BEFC5B3579@PA4PR04MB8061.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/fUHQfSlhgmNzrvcVlJi1TwEbQNMIkJfk7Bk0akpZoKsMaGF1DkTlnKpPM1O2NuqjHjdCGEzWitiUo3jfsjdSJhRY2lp5mw/TPw3qmg16/kD7q1qqoNUFsF5D5nu48HBH7JlUh151xKVDsk4fKh/nSY4G8d9GC0tDx9B7FZQifDbXiCOaKFyapkOS9AO5b1wv3AVYQxTNXjAKJEdy9Jt9qsbF+7o8pmqueQbHLNkKWBHxWbJ74VNCv/wykLU+NwAxmA4ceDJYLbIBD7+3DxXaqmrjDieXHhZ7WCAKhwNKEaPfm7H59mAZy+ciqHAyPvHN8IZOjDPy8CJhrcKMDPRFqxEBxxjGfrOMs/lXd5e14/QNtdu2l63Y5XrM+pMz0au8Ci/vdsrf3kPmweLlpji2oK1ha5n0R57Y+bAVIAJqFUiBcto9USJLsGdPdSNWbH4v2i/QgT/XMukRAbrsO/96Qlh06Gdm72/mAP3jWEpXl4V6/0zqjohJ6NPlGSnMUKE27JdyYnDC0JsCGQDs+skhzlsu7jhru7d9E7g/Hsyfz+OZ4x+g3G1pAK6TaoN3N9ZmrB874ZQt2h4dmZm7C4qWCYMZ/eOJZ0EU0mxjzs3qRGa8ZKILphI13aI0QI4P/dLmC4TwHkyqt1KV3IWjCm0rHHx7aFJL0h1cBEzXo8b+V9iHFFHPacuITO03g31VbiUB4pzCF3u4j6LUEBnBSnsE311OdTGvYoE15j/pNE0WvPAQAK1yMsVGl/7/csMTfLH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(5660300002)(8676002)(6506007)(26005)(38100700002)(8936002)(6486002)(2616005)(31696002)(86362001)(4326008)(66946007)(4744005)(6512007)(66476007)(66556008)(316002)(54906003)(6666004)(6916009)(508600001)(2906002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWJBMnVaT2t3cE03UEhRSVNiNU05eWpjcEtDY1R6dlNJeHpUdytwZmFFRXJD?=
 =?utf-8?B?NFp5SXhSQVY3RWRiY2FiWEVPblUxY0NaSEZxaUpBd3FkUDJYSTZDU0l2VEpB?=
 =?utf-8?B?dzJJamFWME5Mczg4K0RPVXkxYS9xLzhGNFlEbzRoc3h6enYrb3pveTlWUWV3?=
 =?utf-8?B?STUyMldza0V2RmM5YzRZMXJHeVlXb2xsendLVTU3b1huNEl2eE5ld1FZYy8y?=
 =?utf-8?B?NlI3UkUyL3AvcEtCMDRqV0FubDA1OCtkM0pEa2hVeU8yTmxsYVN4MmV1bzhS?=
 =?utf-8?B?TTVxQUpuOWZtaUx0QSs4NHU2dnN0RUwxZXhwUmxVQ3k2Z290a3BTVVJxNElr?=
 =?utf-8?B?SFFuRFN4d3A1dHQyTS9rSWNHbEwzYXBPZkVEaS9PNEVyUHhvRFdPUlh1cnJq?=
 =?utf-8?B?MTdNUmpvVnhhbkZqdkQyekFmTEtnNklwWE1EQjBURGpEU2tGSDBuRDVBUnp2?=
 =?utf-8?B?YjZyQVM3MG9DV2Nncm43YkZoOE96cnU1Wnh2SFdRMjU4MFhnTGxIQ29pb3pX?=
 =?utf-8?B?RGZ3b1NlQW4xUGRtckNvdnNrQmlhNG1GdDhNaitQV2JlMzQwRi9GeVEvdjUx?=
 =?utf-8?B?MFlqc3Y1VlRJSCtOOUdIblBoNnhsNTVZcWJQeVVCS1ZScEU1dXdDV1BqZnQx?=
 =?utf-8?B?WDRMUWNtempGTVMxYW1GRWJGcEVBRzZLa3F6d3hkZzViNGtWalQxVXlqZDhy?=
 =?utf-8?B?RW5zSjNrT0JnSWJuUzZjQ3NIeVkyQmhnUTN6aXhvZzl0R0VoajdWUW5TZ1ZI?=
 =?utf-8?B?TnkyOWhnNElOaHpJTnIwdkxxSTdLRlc0V1h6bnV6aGJwYVhtU2hMaWhOMUdC?=
 =?utf-8?B?YS9mN1lFeVFPK0szOFR2a0dqRDNURFB0SXM4dU82WjVqd05PYnBDREx2WUNF?=
 =?utf-8?B?bjdQa0w1STlPQW9nRWR3eG9zeXBsbWhsK0ZBMjdkb1UzRXJjbU5lSWw3WFdB?=
 =?utf-8?B?ZWZTRWg0a212ZWsrYkFLNVFrUWdrcHF3L2RKOWtxWkFWT05VSUNlaEQ2MlNo?=
 =?utf-8?B?SzZvb3FxY2FwUjcrc210NitEQkhKQUhzM1hPNlRkczZ6Yng4akZpSmdFZjVh?=
 =?utf-8?B?bXVZRmhxWndoclViMmQydTVrMXAwREZ0bnFvL1d0M1FubU0xanNGNXVueFJF?=
 =?utf-8?B?T0NWR21JZ1lrTENhNUJOb2dPa3YrTDMxSitCSGxINTE1OVJiZGdMUXBoTm80?=
 =?utf-8?B?Tyt4ejFsZ2o2SzZGcDNGZ2FyNnNsVzgrOC9Uc0M5eUwvVXg3RE1CclBkdEhy?=
 =?utf-8?B?SlhnajNzczFXRFV2akVGRDFGUWRxUjFyR3NZVkVNZmtaREZQWVV4cE1rQTU0?=
 =?utf-8?B?U0xxemlnMlh5ckpaeGJkOWRtWkI5R0tOTHF6ZURjQzRiQldNYndDTDhJYlFC?=
 =?utf-8?B?N2orME9Xajdxd05YZUg5Z01tNVR5aXIxRyttK2gwTHU4N0hwSjRRL29kaHBk?=
 =?utf-8?B?Z0c4STVmQWVWd2tXU09GQWx6M2tLRlBzakJlVUJ4UjIxRDZqdzcrOGlYMU8y?=
 =?utf-8?B?Vlp2TEZiL0hiaFA2QjErcCtXSDRrWjBCQVpCanlPd285WnhTam10U0x4cUVz?=
 =?utf-8?B?T1dHSXZwOWVrV1JJYVZEaW1YeWxiTk53ZU5WbHV6dHBoT0hzNDBQRCt0bDVQ?=
 =?utf-8?B?Z042cXB3MjJSYlI5M0VnNmh5MXJvWWU1clQ2ditJOG51SEJDRUdNZ0xPMTN0?=
 =?utf-8?B?Z01uU2FWckVhdU5kYW9KRVJRRGtGSXRDQXZCdnJtbnJBMVFqbytSQTBsSnlC?=
 =?utf-8?B?dmNxWGplSXg0NFlmTkt6YXJFOHo3V0k4bGVSYUFIdGFwK09xUitaWjBCRnE2?=
 =?utf-8?B?TTMwUXBUYlFrVi91Z2F1SnZUalNqY2RhQm0wcnUySjVTSWV1bmNaNjY5ZXlN?=
 =?utf-8?B?OU1YOW0vcjhRdjBvS05kWFhVMmtlRFFQSG5NNGZPMVZxTytjVkRocHFLT1FJ?=
 =?utf-8?B?WXhIeGk1M0ZqQnhiS0FXMWQ4WGoybE1VUmNrMWl3UTNKOGZFbzhyeVRLUHEz?=
 =?utf-8?B?bGwxeEQwOC80d0pJeDFwRzBYY2Z6N3dnMFRHZzhLOGpRUS9oK1NEQ3F2NjN4?=
 =?utf-8?B?amJhYjM2WkRPYXZ1Y2ZHbXVrV2RzTVB3Ym9CbEF4WEJqUldQYnFTQ1RrMldD?=
 =?utf-8?B?akFORlNlNG45T2puMEZlUDdXTkpoM3grRG5DZ1pLSUdQRGFWbDRTUXQ0K0FG?=
 =?utf-8?Q?BMaOUBnd5c+6kjqzQFBdssU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d1d4e7-778f-43a9-d10b-08d9d9a4c83d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 10:33:20.8363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8J8Cp6ftQKZsieK7uSl54bc0G6+VhcG+lR+S7ZHfLb0bGnd6HUq+BlUfIvWC2ZqB6D3+mbVKzDlpmQc4tircdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8061

Mercury and Neptune were Pentium chipsets - no need to work around their
errata, even more so that the workaround looks fragile.

Also ditch a Pentium-related and stale part of a comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1042,11 +1042,6 @@ static void __init wait_8254_wraparound(
     do {
         prev_count = curr_count;
         curr_count = get_8254_timer_count();
-
-        /* workaround for broken Mercury/Neptune */
-        if (prev_count >= curr_count + 0x100)
-            curr_count = get_8254_timer_count();
-        
     } while (prev_count >= curr_count);
 }
 
@@ -1056,9 +1051,6 @@ static void __init wait_8254_wraparound(
  * this function twice on the boot CPU, once with a bogus timeout
  * value, second time for real. The other (noncalibrating) CPUs
  * call this function only once, with the real, calibrated value.
- *
- * We do reads before writes even if unnecessary, to get around the
- * P5 APIC double write bug.
  */
 
 #define APIC_DIVISOR 1


