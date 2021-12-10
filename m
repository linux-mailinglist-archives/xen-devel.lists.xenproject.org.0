Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79331470151
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 14:12:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243842.421931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvfgu-0005Xl-TD; Fri, 10 Dec 2021 13:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243842.421931; Fri, 10 Dec 2021 13:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvfgu-0005V4-Pm; Fri, 10 Dec 2021 13:12:00 +0000
Received: by outflank-mailman (input) for mailman id 243842;
 Fri, 10 Dec 2021 13:11:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvfgt-0005Ux-3n
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 13:11:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0f5c077-59ba-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 14:11:58 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-qqQw9l26MBKMpBmJ721SDw-1; Fri, 10 Dec 2021 14:11:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 10 Dec
 2021 13:11:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 13:11:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR07CA0013.eurprd07.prod.outlook.com (2603:10a6:20b:46c::10) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 13:11:54 +0000
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
X-Inumbo-ID: c0f5c077-59ba-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639141917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NIgRq885eRJJwq0chVRIWHi4lkmdLRe+pMw/ZXiNwIY=;
	b=bikHoMlNXKwyXlOJbVQK6JSKg82nGy2K1XXjqTkaCfAdVKi3711bLoZJeenI69s+X4y7Qp
	GxABZFrI8J8FmteD7oM+qSO9daTMYIWTV9S3v9b3LWq/8kx41t7e1pkyxLK/lYJ7Ayn1Ep
	np6zQ2I6fyuhDvft+gEdUOghOPSwo6c=
X-MC-Unique: qqQw9l26MBKMpBmJ721SDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Au2WrLVUovDiaHq6s75yPHTEWcuTpllDQ6WMRgLObLYEJSdMVIB6aJZzIf06BkPw2/kkv+l48z2X7q3fZglXu1oZdbqGL7g1Ii1xArEFnenS+Km1fqDfo1pIjzE2H3e8zpPG6RlMyrLFXphnCTbRYpNbiEUGjPlpf4KXElWxj6SiEnbSPBGoKQp6U7BtDiJJG0vrJCwi3DbSpAQ7sZaQB/cAPctouZexfSjOn+6731luo4jfzSVoN1TjvH4XpLzrC0GgMs1kEDaLWNu1t4sdzAyiFlUEq2GFc3N11wAauKKuZybdBwzp3qMH5f1Ljxtphf+ClfWLF9gI4rF4kaLJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIgRq885eRJJwq0chVRIWHi4lkmdLRe+pMw/ZXiNwIY=;
 b=QulPQKC3rC2rqKUf4pzrNCw773CQLstUS9UM0yGc/QLt/U4MHVfoAZSMmYb+pKGXQ5522d/fNKclhoqVgqMIUYaOL90Qa0DWdBlB3sTS11Sopi4UkfHpf7YySGNlyL8F1jCnlYjqIfGXM7tgBP9N8XbHwJw3708Cy9A+6d7x9/vBhX1mtCNVfv+noOY0RsRm6DSZMIQQHb7k/35Z7EypQT3xr6vWitjwYRosNE5kSadTntZ9Tz7KeebkdKgQvHz1JacJqtCG14T4Qz+lIU/HFkQ1oQMTTywcz94dqFtRmeyqThLi49by/jiOD1rj31ZB1PRwK5l/M+LImmDUeNWb6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac9ffddc-b102-9876-7a46-345078c3423c@suse.com>
Date: Fri, 10 Dec 2021 14:11:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] libxc: avoid clobbering errno in xc_domain_pod_target()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0013.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee446aee-c12f-4515-aff7-08d9bbdea358
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2447D84C36ED50CEA8F649BDB3719@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EHqO0khfUijBYrqSTgD4c5KJbdabEiFczjPTuVZxmkKh+QTwGlclwHvjpdEz5KJo205U4M8FYqinrmqGDdj1Efz/KgxsOrhL8f5I+itJ2hiZX9Z7/EOzMF4oKHN4721Ab3b1tOQ7oNKjgSqtMbNeQ3h9GPWDaoM8/0yOjY3xQHezSi8qqG+DMRfhqP5oj6W3iJKj0ZKv7FXDsBXn+E0D1kjOC4HAv6IxL83EMnWZQpeU67YG2yjtGwOWLFlByZVFPv0SRW4fABYmoyPRSeJcLxcsSwJoS1dgjC1KN68vB6gTnVgk5c8Lz4Knqp6NSTbFOS+Dpd+zouq8fDs5HufRDTrltdgd9DMqY7xwwDAcrKWnEMYrzLAK21wf7CFY/wdNmjslqppmCSsUvMltaIIh+xYuPs4VUUK1Diz/7dX55bZRYdt0JyT8UDTIDWkoiozTN67Fp9nj2ICUdbMgOJyUudMbAT4RPXN1LjERwVm8n8zYt2pB8XJ0JbfeprYdbJStbimlM7l7xKTUEkiGShER6PCZVpb4jRccHr6mzwDLMKmw/aH0WzwLL7xahMzDJ19NbLU9si2R9JOTt3lFKbEwsGBr4IR9MXM6ARhY/b3orshciUhUBTzpZjZv+iaKBRE2DjwroSSOr4acEM9C5LmpJOscJyXN/n2J8nIcUJ0QNuVhcsfxFkuP4pFwkGimvUHiiopZB9ge5eVTS80AYRMDvIxBm27fAtudrMi/B0+j20IJxYyXMvZYTBGfP/XtqOWV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(956004)(36756003)(66476007)(16576012)(316002)(38100700002)(2616005)(66556008)(26005)(8936002)(66946007)(508600001)(31696002)(83380400001)(8676002)(31686004)(107886003)(54906003)(186003)(86362001)(4326008)(2906002)(6916009)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekhKN2N4VUI5LzVqcHVuZXBqN0hWdk9jS256OGEvRmNwcWdjai9ibDZnLzc4?=
 =?utf-8?B?ekJwZ0w0bE9hQ3B0YXhubFhwbnNyWEo2dGlFelZlbXZ2ektxNmY2R0JQYTFZ?=
 =?utf-8?B?L2lXdVhWTG13UndoN0JZT1QydXRaQ0pWMXZoNjlxYW1VQW5nRDN2dTljdlpJ?=
 =?utf-8?B?VHArbjgwNjRWYlZLNlM2WEJ5TDREczZOc2tMM0VIVkVETmFVYWQ5dnk5K2M3?=
 =?utf-8?B?RjAvbjFaR2FpdVN6aDRNN0hwZnFJWkluZE1XYzNLWHBtSXRNa1NBZVBxNGho?=
 =?utf-8?B?ZHFzaVp4ZDY3YkdLNjRJQ3NxTUhwdkVOcWNGRm8vMHpPUEpiOTlWY0RmY3lu?=
 =?utf-8?B?STRiM0lOblFic3Jxd3NKYWhoWCtNZnJDYm9aVisxbm1xRmg0aFZ4RU9QQndG?=
 =?utf-8?B?UExVd0U1QVVQMjdzSm9McWtTdE1zcVpTVE5NVVYraU16UXZGYVI3SVgraTRD?=
 =?utf-8?B?c2sxZE5va1dXaWVob0FtMnBjRlRmZWp6Y0UySk5IbFF1ODZsUTdaV25WRURS?=
 =?utf-8?B?OXQ0Q09vTDZBS0dGaEJ0a3JZZWhiRnozUmxLTzN0b2V1Sk5MRmZLUXZOVCtk?=
 =?utf-8?B?YlJaZ3Y3YlE0UTFhMmNFV3hhNWZRODNUOE5xQkZLdEVVdjl4UzVzbGZlSkZW?=
 =?utf-8?B?eThVSkY0YVJ1UDNydG0xV2twV2F3aGJMQ25mMHZqajF5K0JPaUd1UmFxMEpW?=
 =?utf-8?B?enVuazRkbHl4RFJyZzUyUXhoN2FtTDRwdHh2VmdlYWNYRVMxQTQvK3JBcXRo?=
 =?utf-8?B?MENpQ0NuVUYySHhmbGFPUVFJbjR2NEtzVWhZTU8wRnZ3a2hFbStkNHJDV3BC?=
 =?utf-8?B?ckpUdkJCTHhTeVlBUjBBUWxyM1h4aXpaUDVqOEFyNHFRQmhFeVl3clVORHVC?=
 =?utf-8?B?a1c0TFhxckVoa0pjM3E5TGU3YUg1bXE1b2R4cE40WFJTd3lsWXpIRXdRd1JY?=
 =?utf-8?B?alpmNG1ucFFCMDFja2YvbHZjNElua1FxVGZqVGxUTkhidWhHTUpkcUh2ZHBj?=
 =?utf-8?B?WXhSL3pac2VuMWVxS254SDlNQUhBRnEwczZuK2s2WVdFcTRPeU91UGNzZURF?=
 =?utf-8?B?OUN6TkMxMGQ0T1RadDAzZ1VKdzFmb0FZd1RlSW0xcDFaQnJHNmJ2c0owR0I4?=
 =?utf-8?B?TkF6aWQreGVQbk0xTkNzV3VUbUpFWHpBTmdHVTBpU1dOSVIxZTVsb2h2Ykhv?=
 =?utf-8?B?OFM0aXJWVGJzVm1ZbHJzWXBLQ3NDQUlwSTdrUUYyYitjSDBoQ3YyZ1Z4QlBp?=
 =?utf-8?B?TS8xRStlVm14LzViNGJYejQ2cjAxSUpweXFGK3A4NWhSSHBhVFN3eUFuY0M2?=
 =?utf-8?B?b2pIalkxK0F3dWtwME9EYUF0Y0Y0SFNSR0NPeHNZZFg5RHYvMkZLMmd5b3VR?=
 =?utf-8?B?aDBBd3JXSTNNQy95SUxQb3FFdkszY1dQNFFjK1EvVVBaTno0QTI3am4rRERz?=
 =?utf-8?B?T3RxZ242VTg4TEx0Q0FpOFlVZVlWWXA2bTdGOFFKWFhnM1UyNEJKanI5aTFO?=
 =?utf-8?B?eWRZcXRVZy9kRUk0TG5IaWd4NHM3bVRySDhYUlY3MU95UFpQNWlGT1ZZeDcv?=
 =?utf-8?B?dFlLYWNaY2JtL2tzZFRXZnNzL1VQenUzMXM4UW1pc0gyWEF6YmJ1Zmp5Ynp6?=
 =?utf-8?B?UzFBbE52c0RSZVYvZDI5c0F6QXNwbEl3SmVwU1JNamRrQnBKdnlYYWlGRHUw?=
 =?utf-8?B?cjlkRnRIODEyenBNbVljYy9RTmc3UW5jM3ZHN3QrWWViaXphTkZWWHYwbkUy?=
 =?utf-8?B?MmQwUmk4OW9iSWtUSkNNeUhrUlRYZ3Q1Ky9scFg5NUsvUVJoQ2htMCtXdWxl?=
 =?utf-8?B?dkp1YlpTRnA1bTBLcVNxaXBkbWoxZnlUK0VuSkRSQURuRHpnN2kzT2pSNmpx?=
 =?utf-8?B?OFI4WDhiRkg0ZDFqeFlTdkNjaDZtV3RwVjVEdW1BcFk3eUlyamFrRkJxcjZF?=
 =?utf-8?B?Wndka2F3QzRVbElMU1RQdmRJczlDdFRvWnJIekhvc3ljK0JGdXp4V1Q4Z0RR?=
 =?utf-8?B?YTFyOHArRTZQVXZRRjM3THVNY09GOC92bjhwTTZjSG14RmJHNlBOdWJNYmpG?=
 =?utf-8?B?Z3gyRGlkVlFGNWRocUpTaG9XbmtzRzlkZS9EN1RHY1d2UkNFTXJEbU51dWo1?=
 =?utf-8?B?dWJvU1hBRnpHb2pyWFh5MldIbVNEMzRnR1orN2JPTEVKTG1WUlc0ZWF0ZW90?=
 =?utf-8?Q?3MlyPASiSXBm1BQqeN0QjrU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee446aee-c12f-4515-aff7-08d9bbdea358
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 13:11:54.8627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39yMXKz0QEaFCHC8Bd7Vy9AhA3y5UuSDE/qAlBt7xsvjWU3DxzBBc5hcuqg3P/sxGJ1CwtDxDNhZvS9szApyaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

do_memory_op() supplies return value and has "errno" set the usual way.
Don't overwrite "errno" with 1 (aka EPERM on at least Linux). There's
also no reason to overwrite "err".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While the hypervisor side of the hypercall gives the impression of being
able to return positive values as of 637a283f17eb ("PoD: Allow
pod_set_cache_target hypercall to be preempted"), due to the use of
"rc >= 0" there, afaict that's not actually the case. IOW "err" can
really only be 0 or -1 here, and hence its setting to zero may also be
worthwhile to drop.
---
v2: Don't save/restore errno, as DPRINTF() already does so.

--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1230,13 +1230,9 @@ static int xc_domain_pod_target(xc_inter
     err = do_memory_op(xch, op, &pod_target, sizeof(pod_target));
 
     if ( err < 0 )
-    {
         DPRINTF("Failed %s_pod_target dom %d\n",
                 (op==XENMEM_set_pod_target)?"set":"get",
                 domid);
-        errno = -err;
-        err = -1;
-    }
     else
         err = 0;
 


