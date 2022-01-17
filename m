Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762AF4905F9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 11:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258091.444066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9PJD-0007p2-AF; Mon, 17 Jan 2022 10:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258091.444066; Mon, 17 Jan 2022 10:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9PJD-0007my-5w; Mon, 17 Jan 2022 10:32:19 +0000
Received: by outflank-mailman (input) for mailman id 258091;
 Mon, 17 Jan 2022 10:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9PJB-0007ms-Sc
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 10:32:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bda1983d-7780-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 11:32:16 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-o30-2_7AOqSrc-r2smC8hQ-1; Mon, 17 Jan 2022 11:32:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB8061.eurprd04.prod.outlook.com (2603:10a6:102:bb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 10:32:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 10:32:13 +0000
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
X-Inumbo-ID: bda1983d-7780-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642415536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iJTv3lvJMS3Sd/lLe8RAePN9QmHhfw7Jcahlxzy1KOU=;
	b=VSjFnh2eVAu3uBRJx6GgsErROv9YmLHj0LZ9prBrsu+BGBAgBLxLAm5/gfIs/6PLoDkMLa
	agObkXZpWP1LPoS5yhJSIgU0r63G3QRuRlvyEtz1+GfJxGhuLQ8FEP57jiLDuWPWzmGEju
	733PSZSIeZxSgWX5TXWpEwXAC/sWBOo=
X-MC-Unique: o30-2_7AOqSrc-r2smC8hQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGbN3ZjTCyMiN3fmPhNv35s0ZvxUBX21IQS9XOTYduqzRd+6zyDf+kuGEnf8BTmnPPtOGrBuROWaKOZWWGCdMSRdmDiTz1jBx+Zwez0b8+1zmXNE06u6EkARDdjfYpI1dbZMbSYlgfovL5IOT3p2DWfKtQdupWod3h9Pa78uji8Ns75c4vH08eQ3hYRQd9Iiq5QsHSTUfuYtMLDblfJVQJOPVo8gAF7VXpAhcOIYU95Uq94/YjEaBJc9Hm0usZhS71h05/feZ9i068AzMDBXzF7qFiIWwSPT23GMcl38VX3qqsmPUkAluJ/NQgqP5cuGmwrfH3Vb7acnJ3/Pkb12Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJTv3lvJMS3Sd/lLe8RAePN9QmHhfw7Jcahlxzy1KOU=;
 b=d254MCTXh9VNVHmL7aYLDwudTFo6KfizUE5oGlNxdTp7o02mdoYw/F7fplZDvUyBgicnbBYaTkqDlmuTqGuyJuWqdGQ2yBbcxfiIlBbbGUAYFC8aEHxzb3TocyMvQivogHO0WESpgM3dDMzPql29oJxOaY1PN3NZPYta0bRPgAW/2RmOYN5X9JA1PB3cMTyH9G4XUBrJ66dsoUQ/DVGtukO54mHTKVjETsYFERE1kyN2zM1KRwYE0g9WMJ5mzdwQsEM8fyJ4AHJQH/BWxsHqVfSIZuQYb1/OCUMMXhYKxqWtgtlQCEtFM0dErKvusDseRWHJaWAwHdwhJBs/2M0C3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f79f1e1-119b-b8fc-11a9-5f56bfc163e7@suse.com>
Date: Mon, 17 Jan 2022 11:32:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/APIC: no need for timer calibration when using TDT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0037.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8e2e9c0-6747-4f10-e8f6-08d9d9a49ff2
X-MS-TrafficTypeDiagnostic: PA4PR04MB8061:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB80613CFE752E92EBB4DF4398B3579@PA4PR04MB8061.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wWW+W9VdoNy4AzJOcUaPjuYFFSRbRdbCiNfSn0XT8Yp5lgcfzFiJeUsZMb/Ks17SF7csxxa8A1teTkH18N779eIYSSKaDm/SURqXOXgStIVptKwOiEzpFeQR2HDZNV7ZRlHaNAzvieX3Z6WsGDtfnJO9JRmZ2i+xteKxOgCEB91T4zIH62h+LWe1ujOAy81FeT658Py3Vuq9bkZyHBbXXQCDVIzTTtUG7AI+ke2q5fOPmOKhuFNUx/ZRG5wDj9YE/nEXTfIUxe+DGVC4bXnh2CcywWek9OjDuTvHNE40hf2Ls1FXmi/lA/i0Oe8j+h5ZOeRDhlDNHPEn+1Pb8JpKfzma+lj0MXRKMfguQor7K2KqZZ9bJdEDXNTMbjLQOADwFFnG0IAdZp+JaPCUv+NG5Mwp1C02T6TQxQNgxviqslz1LAUaryRVKcTU3L4O8b+b4+dCx6t0Ann3Rjl66YqSiNkm6m4801I7uivzp80obt9fYU52fxPjtvLytfO5wQ4uBaSZF7he2rIu+vP/mu9Tcgc1bI1yDq7nRZbkQtmxdPvmM0EXZIXOyLOt0B1VO5tr4XTV5H5/lZtWAENLQAzOu9jCXXcCjfR2gBDyt971pkshwaN4Zr0zel/MyL/p1/1LnzZiH9QwfN8PNmIh/ZgqcNjVjbls3SIin134dR5IejMnjMs++SmqjAHrYDEj48rsmZVr04ER/jQVqdxNTVPLmVjbR9zo90bjgX1ano0zwFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(5660300002)(8676002)(6506007)(26005)(38100700002)(8936002)(6486002)(2616005)(31696002)(86362001)(4326008)(66946007)(4744005)(6512007)(66476007)(66556008)(316002)(54906003)(6916009)(83380400001)(508600001)(2906002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d29hVVFkb0NCK3o5bmdhQXpKdXZ3MGFBWjFWTjNmREZQQlBoMERDQVRkVFhq?=
 =?utf-8?B?Und4cy8yMGhNUHBERG5CWHNVUDZoUlVNQllLdnRRWUEzTWRwUEZzWlhONElr?=
 =?utf-8?B?bTAva2hQT1dJTi9aS25UWTdLNVBRd1RxaU1MZ2JiMVV0OFd4SmEyNDZBdGRw?=
 =?utf-8?B?ZXZEWkpQWkJXY29XSy9DbjBsNENzOGFVbE92Nml1aEFOb3ZEM05vazFEd3VK?=
 =?utf-8?B?VHpoV1UvSnUwcWxPMUx2QWYzTk5OUFhOYXgyaFplZk5nc2R4TUFMRHQzOVl2?=
 =?utf-8?B?eForZS81WHdZQ0Y5aFdEU2xkSWxNZVBKZHdJVkdXT0V6dWgvc1ZiSVdkVHF5?=
 =?utf-8?B?dDk2U3dJbU9uK2hYWlQ0Wld6T0RBTUZYZTBLNUhxSE5tSnNkaFZyVW95M3ox?=
 =?utf-8?B?SjFxUkc1NCtCVXFIUmppL1Z1Z3oyWkJDQUovbGh4bE5Gd1dENVR4bzBobnNK?=
 =?utf-8?B?SXArd0g0TTlUWE5qWXdrNXZwWHpXMERrb1BLb3c5THJRcUFoSHNnUURBRUo1?=
 =?utf-8?B?eGVyYnhwemxieWxhengyci9IRlBEZ2Z4QmU0K3d0Um5ZQ2ZPQjZhRFFZNVND?=
 =?utf-8?B?VFBhYktoMVNleHhPdnpCNjNKYk5FWmVDSURmV1BETXV5aDRzU1BWQmdnV3pl?=
 =?utf-8?B?cW9EeWdQNmZnV0xBU241aUJ1R2ZYb1crcEYrWC9ETkFxdzliYWdYcTNRMmw2?=
 =?utf-8?B?L2hxSFRVSU9nVFhEUlFpbXNZK3cwcUxYdkdlRlRvSDJoN3V5dlVqSTNZMFpL?=
 =?utf-8?B?djl3c3RLMjA5NlppMWxyMDJ0WldMYTh3eFZodEF2MDVCa2JOQ3ZzcHZvSjZr?=
 =?utf-8?B?cDN1SE0vK3ZzUWY1WWE5TFhGc3NITnNjRkFKRkhPTmFuaGhCUUNoQUM1aVdJ?=
 =?utf-8?B?RmU4WDlBTHFWY1Z2eGNzQUNvbHZqcjZnMTlwL1FDYmFZVWExZ2dCVU1laTlx?=
 =?utf-8?B?OEVXL1dJd1YwRkFZcGhLd0R4TUJhVEF3bmlJekRQU01YbWRpd0dSZStFTHh1?=
 =?utf-8?B?NmNiSlcwYnMwNzlveXFaUlROK3lpa1EwTGFRVG56SHNlbHMxQUVNTjlUaG9l?=
 =?utf-8?B?VldsVHhCMVNjdzEyQUQvVENQZVdJQWN6TWRsYjI2REI5ckRGMWNIVGZiNnAx?=
 =?utf-8?B?SEQvMW9vckVycWU2ZXkrZ3dGYktYbm9IdG9TYjFpa0QrTEtyczR6c1QxRWVj?=
 =?utf-8?B?cjlack9PcU96dUh5Qmp3OEVCOTJ0SGNrMlZvajdOVXFDVXZTOGZTc1BEUVNa?=
 =?utf-8?B?UVJVTXMyWldVOExkL0E4QmtlSHZYbDhmUEc4Ky9ua2g2bmdQZkRScUVvUHJx?=
 =?utf-8?B?SXprelg3WmpnV09zNS80c1dKUUkxQmY5bUtEcFdkTXNobGJpbEdHd1RUdnVO?=
 =?utf-8?B?ZFp5K1lLai8rVm5HZE15eXJrOFhWMm5ER3E0TFMwVFFOTFI1WUcyZUdFUmVm?=
 =?utf-8?B?ZlNXTlBSUWRpTUZDLzNnaHRwaUxFbElLc0NwSnBhQUtaNFVKZFZlZ0ExNHBL?=
 =?utf-8?B?WVdkNHYraGNNc1dtZDU2Tm5ZTEdiNmRSOUJpVXBWR05UeVQzWm5LcEFDY1lp?=
 =?utf-8?B?RWR0Yy8zaG9YRFdiZ3g2dkcvN1Njb0RpWEdRTEFGZHVlc2VUeFdEOVlBU0tD?=
 =?utf-8?B?VTgwbzZpUUI5RXVxR3BqWjB5MkpCTS94MFEwdThWTkhZTVR5SlNUaXljTVhP?=
 =?utf-8?B?aXVoVGwxVFBJaEJXZWM1RVlrMGpCSktIM0h6T1hUc3I0aU0yZ1BYaTRkcXJk?=
 =?utf-8?B?RnJkem1JYWczaWpiTFByQVFPYWpUWGlPN0QrTFN2STc4VnE4VjFKS1g5aXVi?=
 =?utf-8?B?SldDK1JOREY2YkVHWHgvNFFIOVJoeTVkaGtMN3RRd2d0bmwwMzhpR0dXeEtG?=
 =?utf-8?B?d1JrN25wc25NbEh1L0ZTNHZONUI5VXNRYk9FZVBtenpEYkZyMkV1QlBwQ3lH?=
 =?utf-8?B?VDdaQWE2S1A4R2NkcjFLdk80aEJoVThXMVNPejN5a2ROekNkSGpjVEJwVUZp?=
 =?utf-8?B?MVgvMC9iMzdKdkVidkxxNXJRMFRtYm04ZWtLcmF1VXZvMGE1RUR1cTZpVU1S?=
 =?utf-8?B?QVdWU0hMcTNWRE1XaEdvcGpRNk5MT1d0QUxHRGswUVE3eDlxS09rL1loWjg2?=
 =?utf-8?B?eStzdEJST2NlSWdxb1VHcWV5bGdlMXZMVzlVRnU5YzkrcVh6M2pocUhybGpP?=
 =?utf-8?Q?mBzu9cc/7pmJSlGhDtcnnXY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e2e9c0-6747-4f10-e8f6-08d9d9a49ff2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 10:32:13.3075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9Vc5hgyEj6klZp3lLmpqfpBdhknbIaEBVpQEcuYAWzHSqlGNpsue/5+30HsHPv/MUJ7ArJWD7d+VNGZOW3IHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8061

The only global effect of calibrate_APIC_clock() is the setting of
"bus_scale"; the final __setup_APIC_LVTT(0) is (at best) redundant with
the immediately following setup_APIC_timer() invocation. Yet "bus_scale"
isn't used when using TDT. Avoid wasting 100ms for calibration in this
case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1292,11 +1292,15 @@ void __init setup_boot_APIC_clock(void)
 
     check_deadline_errata();
 
+    if ( !boot_cpu_has(X86_FEATURE_TSC_DEADLINE) )
+        tdt_enable = false;
+
     local_irq_save(flags);
 
-    calibrate_APIC_clock();
+    if ( !tdt_enable || apic_verbosity )
+        calibrate_APIC_clock();
 
-    if ( tdt_enable && boot_cpu_has(X86_FEATURE_TSC_DEADLINE) )
+    if ( tdt_enable )
     {
         printk(KERN_DEBUG "TSC deadline timer enabled\n");
         tdt_enabled = true;


