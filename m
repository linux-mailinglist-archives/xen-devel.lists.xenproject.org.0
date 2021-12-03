Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C26467716
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:09:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237520.411956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7NG-0006l0-2J; Fri, 03 Dec 2021 12:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237520.411956; Fri, 03 Dec 2021 12:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7NF-0006j7-V3; Fri, 03 Dec 2021 12:09:09 +0000
Received: by outflank-mailman (input) for mailman id 237520;
 Fri, 03 Dec 2021 12:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt7NE-0006im-WE
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:09:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d10b6660-5431-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 13:09:08 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-ajWXNYwuOJ-jlQmmTUi3NA-1; Fri, 03 Dec 2021 13:09:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 12:09:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:09:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0168.eurprd06.prod.outlook.com (2603:10a6:20b:45c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Fri, 3 Dec 2021 12:09:04 +0000
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
X-Inumbo-ID: d10b6660-5431-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638533347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EEAm6RV7+XIh6QsPEcjZTodJxZuPMJwRlxvbvSLKLZg=;
	b=I1Nd1QRcUu6HyqARmHV/qgikkgFje0LdfvsrsNMy12DDB4ioPdG6Z9N3+Melc8BcvkH7Zo
	HSkMUIQENZIJJZaxP4e8AkTpq+VzcLeF7fFjQ3yYbd4Yk7dp5m/+sWqiLvMDdNyKvIWfRz
	LtEmbKeTR4dzhK7eU/IugSXP79xCeLg=
X-MC-Unique: ajWXNYwuOJ-jlQmmTUi3NA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUSmjy3mo8kcJaKxpaLK5FFGUYK/OqtdjAS2TJxvBdA20u22M6hurjFzCYoJOaJhz8jpubtnM12K5JJdCJJKL1PkyuZJHLNewPoQ843ltvrVqWl4cR4rZqf3y60cJMAUm3kzBXlwl4imjSufnAYgmgEHXbxpis5YylrB7CjR3H8FMo7EGOeN5u2+G+52nGtKTWWW2//AxWM2O9VlNDN+BFHZnwDZADhkV9RkAgb3+rFnCr4FyKOyoi36EXh4waGNDKjq9t57xSZLSFT2pSapES48LM7bxblBHSO4FaZ/w+ruVsL/zzB1QYsOBNRcyhTj18R4lmtKAreNFrlSKMVcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEAm6RV7+XIh6QsPEcjZTodJxZuPMJwRlxvbvSLKLZg=;
 b=QyRZMjbkOpclCTHyxwhyVL0O9RFSpfWZbkFHxIkW3nqdfNO3fk946iFXbNxNuS9Ib3YGSeC4SjAV/uWkWBFjt0qYxldwbZ5BWua55jP4jg0+AN4JednA0eQzuRBaxj6xxF4a0WXojipUR1dasVHBTaku/CH2i0+Uu+Ea+5bY/PI+UOsq0VunSAALZ8seQC+0+Te33oPPeGugFhXgYoQU8RE71MB+9yq0PiTWL286SV5rlOZrXdSQZg1mrCZYY/GZsZG4LZD/VsJrfvbh9qHGmkPcE/6pbEdTqsSjMxGGGG3eb23QZ28Cs2gSORLGhkswTsfWHRbebM98h6fz3xhU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <94338540-4bcc-7ad7-9de1-944c0dc96709@suse.com>
Date: Fri, 3 Dec 2021 13:09:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools/xen-detect: avoid possible pitfall with cpuid()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0168.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6714bd0f-aad0-49b6-152b-08d9b655b3be
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41911C673A609DAA1A03379EB36A9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JSAl1RhD8/ndmaUjPV+zdV149R26xoP3R8bIXh9ACZnk/DtjbEbJsBizoVktmmaVCAOqzwq0U3rI9kGnqO/HuDnsmFJ7DV8X5vVUGfAvJB0AJJY97XQDRx92wF12h7p4l5gzYsQ7jVudIehqIfgoHK1gA8U6E9TwwXtT2fhEE1SEGnqJZBw/MZocAmfuDDv2JZwT/cKpOZ8bOsJPVz1ynO0JVqzvNaOKcfuWYODG3v2ihYEXUMTL2HNNTW0q6/F/hk3vLjl3izFIEpxLkGDyg7Yk0hjpwCN4Qz1VcyC6kS1KYlwPpUvHz0hAwklCdICnc7SYaKNDej+C6+UrhsRJ9Y3an+or8MqiIFEPFJdiJHm9NNWDXMSxICkVoT029w5KaqNNvINCld5grvSO2q5F0W04KYW6u+bZ+hqCjbhk/nEXpwOLPAmvGiYkruaetfyAAbocIgrLv4/jqXmmQ8Aagnqn9xWPRlkD+YZad86jyLgXmTIdDptR+URrtozBS32Nl7GMY3AZpHx7cCjHM19Xx+QYlUQUZDTTar7AfI+eG6mPUs0qhcZpZbesSjjy21uygfX9cUgz1AmnS78WuTOifksoJW5Dxi5ha+mgVsibuJkSZC8B0xfD2/d5FXIqRWejECEoNVVLfvoU3wU8j6Iqw9iAqDqlWkDsqDw/rX0qNXM3BkhlG6Fkx1ybiwWjynYBOVfjcgBrftE6tbJyZKNZnqcSr+8vNBiWGp/ip41WVV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(86362001)(8936002)(5660300002)(2906002)(4326008)(8676002)(83380400001)(508600001)(54906003)(6486002)(956004)(36756003)(2616005)(186003)(38100700002)(26005)(31696002)(66946007)(31686004)(66476007)(66556008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGVwZkFQZGxQRnFJSVRULzBNa1VTUktYejBEeUUzZEJxcmV5eVNDK0M0UDNa?=
 =?utf-8?B?REpKK21NSmNDLzE1b3RpTm1nMERPZExtUExnNjljWklmb21IekF3MTZpbWpX?=
 =?utf-8?B?N1dQZWVtY3ZFeEdwMDJ1azIvWFlScTA5MVlHN0ExTmRUaEt3d3ZSSEhSWTkw?=
 =?utf-8?B?RnJ2QUFoaDY1WU1nVGp4WUpqdXlFSVJiNlg0dkg4cWVCOGNERkFEaTljNVph?=
 =?utf-8?B?Y1dkTUtDaUVLVWM2STlnYWF2MTBRRXBKRlZQYUZGM2gzSTh1VS85aFFGTHAy?=
 =?utf-8?B?eUFkdHZXSUJEenJUWk9wV0dkMnkwNlNvUmlYWis5T09ySjJLNmpGT1dyZStj?=
 =?utf-8?B?RE9Zd1BlNVU3QjQ3d3FMSzdYZjFJenRGamkzWGtFejA2VEJGRlgwV1dqbHpj?=
 =?utf-8?B?dWZzZ2ZWc1hYTmpaOUJuUVBXem1FMWtoNlZIL3A2ajBUb3JPUGlOWGlKUjhN?=
 =?utf-8?B?T3ZDWXk4RGFLajZjWk5ManVIakZ2UVViK0ZoOTRNeEdqMkJvM0xJWE9iM2Z2?=
 =?utf-8?B?ZFdwQkdqRTV2dDFwN3ltYyt3R2k2aTlpMUErN2hWeVh2QmJOZTRjYjRyazZw?=
 =?utf-8?B?NUZQMmJwZU5KcWRkT2YyQ1RRMFBpdDMrV0lna0lVdnhYMFBJeHgvbHFNRnQz?=
 =?utf-8?B?TU9DVnd3TW9nRHd5VnhHU2phOGpaNzhINlY4b1ROVmZ4MXZhZHZsK21mQVpp?=
 =?utf-8?B?T1dxVzFQTnpCWUZmOFZsVm4wc1c4ZVpWR1FUckQ1c3JOaEZXd0lOZkRNREVh?=
 =?utf-8?B?SnpJTDVkZytScmhQLy9UU21hamxyVE5UTS9sYkRNL05CNEc5RGtYNFBFSXB4?=
 =?utf-8?B?c2laNGwwcGY3b08wdWdaWEJMKzRrOUFtTVZwbU9iZG0rZ1NYdTdhdEt2NGJh?=
 =?utf-8?B?dlI1RU5Qa0pBcUdJYzU4UlIxVGJOTTJzQyt6TG9jQ3lUaG9UUmlwUDcwT1VG?=
 =?utf-8?B?TVRETHVVZUprdk5TNkNMdFJlK0FQTzFXUjRwWVFkRGkxaU9SaFBJQ2dHWGdi?=
 =?utf-8?B?STZ5R2VhelEzR0Zkc1hoTDd2VVhXWHg0UU1SMHV3WThtalVmNkR5NHF2YXg1?=
 =?utf-8?B?TUJHTnpkb0phbEVTOU1FWFJ0VTdCRGhKNCtMYVgxSGdSOGE5ZXRjNnR0aG5V?=
 =?utf-8?B?aDJMUHl1ZE9xRllSaWh0a2txWGJISkZIZm9ERkorTE5QWU5iV3FQbHlaa0xq?=
 =?utf-8?B?aXhxbk53OU40SmlvdU5VWnFob2Z0Q1RRclVxc0s5WkNTYVNKTnM5eHRUQzNi?=
 =?utf-8?B?ajJSK2ZWdTQ1WjNHekhUVTJ2UFRKSzVDOFNLWnRkbWk5alN4RzdhRU9EejNU?=
 =?utf-8?B?QW9JMWs3b1hsNjY5M2hQMm9zajQ4K3JaWHBUR1IyTU5XL3VabnN5RnJUY3hw?=
 =?utf-8?B?R1Q0R3JacFdENWc0SkF4NVVhb3RwNEJVc3VpTFIraW5RRzU0VHdTUXcrMUg5?=
 =?utf-8?B?eGZvaTRCbjZXN0xmSHlmRjlOMXZKQ0Z3bXBlOFNzSE1Jbk12UEN0UkMwcWNm?=
 =?utf-8?B?WjJBT25ML2pHUHhMWjlacjdyQmZYazFlK25kWDU2Qk9PdXhEakhFdkRGb092?=
 =?utf-8?B?U3NhYUxINjNpazJvTXhoSTRFUUo0ZVBXemJvTU4rd2VwZHozRXpiaE1EZ1Nx?=
 =?utf-8?B?bDN3a3IvZm5UY1UrZzFvMVhaQnEwejFTTzZqbzU4ZUlSSE9TUkEvcVkrNm03?=
 =?utf-8?B?RUJlcWxleGNvcGVMV2pQN1hxN3lEM1Y3VWdFYTNZbi95dkU3YnF5NnFyN0J2?=
 =?utf-8?B?d2hWL2R5RlhHNXN2eEVXcWhPTEpiZVJjVmNMQTZWRzdnRHRnN09JdVQ3WlZi?=
 =?utf-8?B?bnYrSXl4dXUwN0tlMEJUYzJseDNva3Z5TFJSWUFad204RnJTbXJKOW14RTlw?=
 =?utf-8?B?UWRQTWt5azhCOFB1amM3UVZaT0RSRzJxN1FDSXh0di9LaFZhaTdEekVtdzlx?=
 =?utf-8?B?RDlEOU1VMjIySlErZllOa3E1R2VYK21BNzFmQ1pyMDhTY09VZTUwS0V3TEM1?=
 =?utf-8?B?VnFyaUFlNXFBdURFalU1Vm9RTkEyUk5WRUhhQzN5eTVUVGdBcit5M3MxYkdp?=
 =?utf-8?B?WnlQRG9mVGh5eUwvWjNKa1lCeXNXT29pckhUYnBERDRYMEd1TmFnV0pJb1Rs?=
 =?utf-8?B?OHJ1UXJPRnh2K1pkaWtEYTBSSGg0VDRTeHcwVG5veVJKeVZxaW9wRDFxdTh0?=
 =?utf-8?Q?+/bSerdUjr/nBZyZZc2LoLg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6714bd0f-aad0-49b6-152b-08d9b655b3be
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:09:05.4709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYlXlLyJ52J+Z6KoH2Buu3WJXzZSD5N1A1Yc/eEixMJvP1m3ZoD5c+5k76h8Vhq8/0UpN23TqkX88z6t8lA1xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

The 64-bit form forces %ecx to 0 while the 32-bit one so far didn't - it
only ended up that way when "pv_context" is zero. While presently no
leaf queried by callers has separate subleaves, let's avoid chancing it.

While there
- replace references to operands by number,
- relax constraints where possible,
- limit PUSH/POP to just the registers not also used as input,
all where applicable also for the 64-bit variant.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm pretty sure %edx also wouldn't need to be subject to PUSH/POP here,
but I didn't want to go more "against" the comment than obviously
justifiable by the input registers used. In fact I've observed gcc to
pick %edx for putting "pv_context" in.

--- a/tools/misc/xen-detect.c
+++ b/tools/misc/xen-detect.c
@@ -52,17 +52,19 @@ static void cpuid(uint32_t idx, uint32_t
 #ifdef __i386__
     /* Use the stack to avoid reg constraint failures with some gcc flags */
     asm volatile (
-        "push %%eax; push %%ebx; push %%ecx; push %%edx\n\t"
-        "test %1,%1 ; jz 1f ; ud2a ; .ascii \"xen\" ; 1: cpuid\n\t"
-        "mov %%eax,(%2); mov %%ebx,4(%2)\n\t"
-        "mov %%ecx,8(%2); mov %%edx,12(%2)\n\t"
-        "pop %%edx; pop %%ecx; pop %%ebx; pop %%eax\n\t"
-        : : "a" (idx), "c" (pv_context), "S" (regs) : "memory" );
+        "push %%ebx; push %%edx\n\t"
+        "test %[pv],%[pv] ; jz 1f ; ud2a ; .ascii \"xen\" ; 1: cpuid\n\t"
+        "mov %%eax,(%[regs]); mov %%ebx,4(%[regs])\n\t"
+        "mov %%ecx,8(%[regs]); mov %%edx,12(%[regs])\n\t"
+        "pop %%edx; pop %%ebx\n\t"
+        : "+a" (idx), "=c" (idx /* dummy */)
+        : "c" (0), [pv] "r" (pv_context), [regs] "SD" (regs)
+        : "memory" );
 #else
     asm volatile (
-        "test %5,%5 ; jz 1f ; ud2a ; .ascii \"xen\" ; 1: cpuid\n\t"
+        "test %[pv],%[pv] ; jz 1f ; ud2a ; .ascii \"xen\" ; 1: cpuid\n\t"
         : "=a" (regs[0]), "=b" (regs[1]), "=c" (regs[2]), "=d" (regs[3])
-        : "0" (idx), "1" (pv_context), "2" (0) );
+        : "0" (idx), "2" (0), [pv] "r" (pv_context) );
 #endif
 }
 


