Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DFA697AAE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 12:28:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495871.766312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSFx8-00052j-Dc; Wed, 15 Feb 2023 11:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495871.766312; Wed, 15 Feb 2023 11:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSFx8-000503-A7; Wed, 15 Feb 2023 11:27:58 +0000
Received: by outflank-mailman (input) for mailman id 495871;
 Wed, 15 Feb 2023 11:27:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSFx7-0004zx-IP
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 11:27:57 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb2ac7af-ad23-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 12:27:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7363.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 11:27:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 11:27:54 +0000
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
X-Inumbo-ID: cb2ac7af-ad23-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzmABHkc7jRkL8uK/xfg5j9Nalx0miVaoav38962gBhqedvgRC83/+Lt618UGMVRVI5apUY1SoeiWiYfl9vSd87SvBgj7fMhT4PFUzTsqZs4Uhp5F4J2W+brpQlO+2mf3y/z0tAC+9rscVhhBsoTbRihUm9jThBUEolxk7tgo3AipeC4kOuNn5iFVFyEfPqEovPSF5gOMSjH6b4mPN0DgOMNciP/SXZrRM9H2Age6x29tFNeBFOj3vBoRj8QbcjaH1pcp6XWWd9nqNTe7xIo9h6J43FM2QG9BVHqCxSOWDclkWSNTE8dSF2OOrwZiu6AsEo7XZuF6s0IY5QLqMrjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2S2Z4nHnnZXHuZpBETj8tDkAK/fJe7Xebpm35w1m4Q=;
 b=QaK7lUquOyk2fJBwyxAn5sWY/oYTvLlaAPgU9w8IFCE9r4NEuqhrmoP88iubPD17uvqoQUcKBOyb37Djaer92ol74AhLUYEPXDQoCm46pO/jQRlCyabNWtAaM8dsjM2H1tF8M+oN+3emK3gLeigrMosM/AcvOgv8ZXldk8/Jes3ICZXIkiSUyQOoG/+k3w8SQe4gWVOXhZwazPq2mjiRnkPDHilnKryod7XReNAJ0HUg/1WniEb+196KXFg2E625DR/eYQyLhNowVt/uM85ScCurZ1Ba7drDaYFA27d9ZJ6YCojmgotOlkcrMEjEr+AkjASr3Ib1HhQF6amBYvZX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2S2Z4nHnnZXHuZpBETj8tDkAK/fJe7Xebpm35w1m4Q=;
 b=j97m5VMDKDOoa2TATWQd4y20tnTqfrN9hfw77nnN49bvqdARZjQpl0TGH5/64EKqy3F5VTRcSaf3F5WvH6dpeHuBikmEeFOUiRsu87040Duq1cburLJ7cYPM0F8+r+yKjoO8tN0Vpn3NYiZJnvDnjtCYhSYy5OQftfEMVJEV2877MNDPgbwoemC2gAUo+xD0pchbR5lEbQGjsGjQJ1q9DfI1b0ZQXkO3sPqahWiXXn4HilTMeuSkicnZaUysMCyQuReGFyLGTZMVqHyfrq51YSHMEuQea5ClEeIcEIjgnIzLJj7hHDuVjZr1p194jiBD/ETPO15ZPzyJYy5+zqW8eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <215515af-cfb9-3237-03ba-3312e3fa0d34@suse.com>
Date: Wed, 15 Feb 2023 12:27:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Xen: drop leftover VM-assist uses
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: 965e6e28-9fd6-4d39-6fed-08db0f47ae57
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3I/qKrkoS2CBG+VKmKp11HjZwK5lNU7vSEm/tBIgeIKXAorUz0nlZNeBSmGPGYviU++CNV1Ska0Jv03GdJhPiyW5gkfcZoRHR/yPEwzVZ1BkiMTy/LaFYsiSqSvYPHt0EYrB0VcoDi9Dcx6KeVDPnHDiwlch+iW8GDfrlJuFy6o4Ll35FYMqYNwEnwOKjK4tM3SHtaRmZFYq8PSVyZohlWNQiajaFcuuUbubGLgj8WcRpsuMH3OJjo2LixUmXjrfOPJ5UzSac7ci1iQAlEVdaR90++C3nehaN9GKNgPnLWI/Ji12youjus1tJkYrcNuqxcNT/4OL0UzE6xOVUlPtM3vMAgOTiLhhdgkoDepPb0zBkIEQK7kzl8O95a7YZrBlCnaKdOe2LEQIcySkEiCXyPYbODctzSH85fYqecdhPH62Ef/hfR+3VrMy2CaSTyIr24oQh72+wiEmUk09KGWC+dXT3zQQ2cAyICA7F2d3CFurqVvizeOTtwzC1lTSEx5+ILXCCOIGfej3/L5RCAW18QF+masXp6V1BF+9F8EmE/28cEJ2eKpzk0cWKASk/0HYgBG/lnsCOdyR4IADmt6z5++Nlp7vVmJNlK0J7x+YppFhHz+DDovkTxEH9WgC5onscWPNKo3teJumhknwbC/lNTTfG4hC3fSfekcxac4cFvtm5pIGs9jIUWPGVSn0F+pd/6xokuNq4mHqOHFbVjqmZiAG04Z1nvpKnvhmwI1dn18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199018)(8936002)(86362001)(31686004)(4744005)(31696002)(41300700001)(38100700002)(5660300002)(4326008)(2906002)(6916009)(8676002)(66556008)(66946007)(66476007)(316002)(54906003)(2616005)(478600001)(36756003)(6506007)(6486002)(6512007)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1B2TzdZd3ExbkxEOXcraVFRSkZ1R1hCQnNLMDJOcEpYb2szaFQvbVN1WVl3?=
 =?utf-8?B?NE9kUm9uR1M2dGRRcVplNjlxZTVQR1BXTVJvY0t4REUwQXVISERhWXpwMUhy?=
 =?utf-8?B?eXVjS05SYXdwc2c4RVFRVmZwa1dMeU5uQ3c1UXdPQ1lzREtyeHl5SEhpYzB0?=
 =?utf-8?B?UFk1QkpiaGYraFdsVWorYnRoa25KQlpMdmlWTnNPdG1hdkVvSEhtZ3YrRU03?=
 =?utf-8?B?QU9aQ0tTRW1qOTJmMWd4SldzSlV6ZnBlOTBqaVN6Zk5tdFYzOHk2MEorVHlO?=
 =?utf-8?B?dmRUNGdaWWRyQTNGbGtCbHBBQjA0cTQ4VkxlaTlNSkpwTStoemlXTnc2MGpy?=
 =?utf-8?B?eE53TUFOdUpzTTR2ZnowS1JlMnpaOU1ZMVhTdWY0SXdkbDRHVWJVVzVudHRB?=
 =?utf-8?B?QXZwQmowSmlEWGJuUjhuS2dLN04yaDNuc1EvblNtRFJsUVRqMlFrZ0V3R3p4?=
 =?utf-8?B?YlpNU2QwYUFuQTZxS2x1b1RvRG5KVVpzeHBZbThDRDJqZWUzQk1lZGhwY0Vx?=
 =?utf-8?B?a1lGZXRTSUJSd29mcm82OFRZQ3ovSjZsYVgxK2k3a21YdXl1YnBVV2xiWUd5?=
 =?utf-8?B?U1JYaFRtZ2xSR2I2aTdpTmNJb0xxcERQUlYydzFZNFdPVFJRRDlXZmZPeklp?=
 =?utf-8?B?cGlsd3BCZGwydUowRzJNZTJLRDUwclBvNU0rY0NaV1doUkhpVWxQODZJVGFv?=
 =?utf-8?B?R25KRFJ2VmpERXhNZ3VFMVdFTm1VSFU5aVFOZGtvYTkySU9qaXUyT2h5VVQ2?=
 =?utf-8?B?SThDai9BclM0b2xDc0ExVlMwNFRCQW4rZ04yVE80OTBmcDBRazVTOHBnNDNl?=
 =?utf-8?B?a0VOQ1lFdG1aWlNETzI0M2hBb3RvMDNuKzlvbDV2MCtQMUNURFMrdWErRy80?=
 =?utf-8?B?a0NHOW1oK1lVUUdaeUtnYkZCUjZpdWpSMjZKYi9lYkM2bFE2VUZOYmZYYXJy?=
 =?utf-8?B?MnVSYlk0bkU2ajV3SG5KQW14ZXJxUDFqc2xRSU5yRlRjYnJrYzAvMGNVUVU1?=
 =?utf-8?B?aXdWbmN5Y0VycHkvUkhKZHlCSmIwWHlpcUdWNVgzWFZmZzV2RWIrcjdRMDgv?=
 =?utf-8?B?RVdCby9tMUw4eXJwakxtMW85alE3bVJET2h1d0hoZ2FBQTFJQjFjTEVuQUdh?=
 =?utf-8?B?MmxJVnRtb0hpL2dJcGYyNU5JUU5SQ0xFNDdPYUxXUnBPVzY4dWN2VUN6VUVY?=
 =?utf-8?B?M2txTmtJa1VZSC9jVkp1dFRnYVpkUXR6UzdqcTh1V2Ixdk1vNThXZWhFRU5j?=
 =?utf-8?B?ZVR1MnhBNXowaGpFWVFwUlBUNlBIQ3l3eVZkeExiK0FPbmdrTEVwYjNiS0dx?=
 =?utf-8?B?bmQxdzIrY0EwZnBKVXd6Sjd2UXZ3Sm15YlRwNm1HalErbEhaeTYzb2Q4R3Rj?=
 =?utf-8?B?VERBYUtkaWRTbkJVcmtkYWNXMXNWbUdMcVV3RlROVjJKTDRlNTJiRGhnK1lq?=
 =?utf-8?B?UzZKMDBmSzA0S3EwRGprbHN2YWZUcSthMHNjT210REk2NW5MMjlUTE9wZ3A0?=
 =?utf-8?B?U2tydTNoV1VoZmx6SmRpMnd1YUd0aVpheGREcExVSVlMMk5kd0ttY2FTQWZQ?=
 =?utf-8?B?Nzl3YnY4RU9VMVVQdVNYbVlrNTRCNHpBMDIyUGV6V3FmTGZONkozVUZ1Q2s1?=
 =?utf-8?B?aW5aRWNLWDhyWXh5R3poZWhySW1WUFR0aXBCc0pWMjFyS0lGb1FCYnkya0Z0?=
 =?utf-8?B?TzN4bE9Ndm15UmhpTTFIOTVYbXFRR1NPbktqZDI1bE0zbDR4ZEZFc1luR05W?=
 =?utf-8?B?SjkxMEJOdTdtWElSMnJ0c2VFaEVTVWhFVjhIdHJHdHE4b0MrZi9IOEhPemNy?=
 =?utf-8?B?SHpJS3pEc0R3Mjg4azduM3EzOU1MRHh4eFZIWlp3aFVtWTF6ZFhiaVlnVDAz?=
 =?utf-8?B?OGdpeTdBclM5YW53OUc0bUdFNWozSnhHVlp0eThqQ3JLNXQ0MkxzSHVvMS81?=
 =?utf-8?B?eEVpZ1NZb3RZcHBpdWw5c0s0YmE2TDUxWitrSXd2eUhUWUs2S0R0V2Y0elV3?=
 =?utf-8?B?d3E3V1F2ZWhyTU5CQWVTMitsN25ZcHBCMmJUMm5kcm5iRHErWHY2RjFMZTlv?=
 =?utf-8?B?eVVOdUJmYUNUNnMxZ0FXaEhXTFlVSE1YeDA2UXptVWkxTDlCRkxwQmk1Q3Bq?=
 =?utf-8?Q?EcnhsX9U/kXGpjdXbjaoBCvQT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965e6e28-9fd6-4d39-6fed-08db0f47ae57
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 11:27:54.6992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wbCQyeLfp1f0kfNnMahbWB2rO3KbEPaNeCfG8vWLdtGgJBQhnghFwIINHtI48WhOgDdgSOZrFAUuT+q+YUSdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7363

Both the 4Gb-segments and the PAE-extended-CR3 one are applicable to
32-bit guests only. The PAE-extended-CR3 use, furthermore, was redundant
with the PAE_MODE ELF note anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -934,12 +934,8 @@ void xen_enable_syscall(void)
 
 static void __init xen_pvmmu_arch_setup(void)
 {
-	HYPERVISOR_vm_assist(VMASST_CMD_enable, VMASST_TYPE_4gb_segments);
 	HYPERVISOR_vm_assist(VMASST_CMD_enable, VMASST_TYPE_writable_pagetables);
 
-	HYPERVISOR_vm_assist(VMASST_CMD_enable,
-			     VMASST_TYPE_pae_extended_cr3);
-
 	if (register_callback(CALLBACKTYPE_event,
 			      xen_asm_exc_xen_hypervisor_callback) ||
 	    register_callback(CALLBACKTYPE_failsafe, xen_failsafe_callback))

