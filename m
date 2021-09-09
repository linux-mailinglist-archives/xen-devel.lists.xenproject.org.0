Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5A4059CE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 16:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183322.331427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOLTy-0002tF-Uk; Thu, 09 Sep 2021 14:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183322.331427; Thu, 09 Sep 2021 14:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOLTy-0002qk-RP; Thu, 09 Sep 2021 14:56:54 +0000
Received: by outflank-mailman (input) for mailman id 183322;
 Thu, 09 Sep 2021 14:56:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOLTx-0002qc-Ec
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 14:56:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2222d6c-c232-4888-be03-d4703148f5af;
 Thu, 09 Sep 2021 14:56:52 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18--BbNBVHTO7eMSYyU5GdQqg-1; Thu, 09 Sep 2021 16:56:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 14:56:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 14:56:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0213.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 14:56:49 +0000
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
X-Inumbo-ID: d2222d6c-c232-4888-be03-d4703148f5af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631199411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MQGjhvRmw+/DydvCB7DT+8K9D0V+T+CrHAAC2eFUce4=;
	b=gcRo7mTja9lIro+PZOBYEpOKcyj0BuqoK8janPP3TWgFBNj4NDiimYVf41GFhNhemQ6C5S
	5niYCtRnWxz4JH4E++mlQbTrRky+2nx3RNl93tqUqhOx/4abgpAkttbfHVDwkbwSM/ldbJ
	p1wKs2PFGgTMFnbuEJXhxMqisIm3aWM=
X-MC-Unique: -BbNBVHTO7eMSYyU5GdQqg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVC/sKZRrV6eljHWC+2OsplFxjOmhizqj88M6VidgFCynh/t0CPQmMCJ+6JYnPqgboD3d7D1jHfEy+17Ss8/MJWt7IQ2xcCIDiX6hwMd/RiUBjLzR0rv/49XyT2JMSM0K+0WSVb87jB+22koKE2fo0iyiG61Sw1txZHpPtKrFDALU87DTCkIp8EhLFIQL1AsKayb+QcuV8CLcLEihgObh33CAJsJu9NjLKbbx07QgtTEixsGWoloRLy2Qx/Igkg4g1QxHvbpneZFQGGLDB1Krkqs3UKfdDVQPQTkDkDZOUM75wgwr0Qnp0zu6TZImig6TRXXXlWbpb6L7J1KEog4bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MQGjhvRmw+/DydvCB7DT+8K9D0V+T+CrHAAC2eFUce4=;
 b=OUMr46FNoLsuwW0uEstPr9F3E3Aj9DZ8hntFl6ULQB2W+8jqfvO+LSgqjFYsy/mtFfvq4Kl8N2AHrNAcpLrkDEHZdi3F1eAuIzgPb12nia8n4HXbTKjqKLjfYGAR96QznUXcKDUKw03ZCRnh+ICtZWzrKNmc9lSPIhS6J7vLrQFMKvE/PLsheVpdOeL0A6IueK14DP+irL0vG8HEr+N//d34lXvaKPwrebnur8Ealkan4GU3p4BOoQHNqniPnhgiXseYk4HYuYQsRNEeuI+3dRL1JUsY2P/DuUT9Byilc18ND94lheiQYl5Wwvq/5/lXi8R4Csy3VVV+zt6FoqJkZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: correct asm() constraints when dealing with immediate
 selector values
Message-ID: <87278164-2395-1fb4-7569-9151d0151e8a@suse.com>
Date: Thu, 9 Sep 2021 16:56:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0213.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e703931b-0c66-4282-9691-08d973a20d3c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6861829793C22BAEE67FBBB9B3D59@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IVI+AuAVHz8676GPm3n/8RuMwdCMrx+4DB7ye7cNGJ+RAZnk3/aYTomV6yWYEtYbbtQZ+sE1aZl9RQrlJOSgKk5I78lHa4FLE8yBwaU4G/CNonwKZbMU2yAJXu2k2hOayjGEWWy1A8NeYqW/sNJ0lb9GSMPQNzJkoCo1eDuvFWtVM2hrhI+duTB8VOmyXv9Ut4OwqOChImlLs2aH0+++1K+iWWK0jTBW0kYNajS1LWTgRvpSh9o+CYeA6Jqv3xN2lsoxKZ9VFQumdmHuTI2twBFt+U254KLV2VET8AsLBBejA+1hkdq2PQm2DQ33NXXk9rb2o34pwPctVZtjhV0IdUCbBvXBkhotjAEc9KowkTKLUS/IVe26pu8DRB4f5tFALC6FK0M9IU2x3so/wpTSV50pDT/1FuhmJ3QUXmwpg7oQhGXDud05OXpSkdmAbWUdISyxhZVCrr/zNWBkvmEvvT5pZzrDv4u23TMZHgNiILG5faBc2+/b4GgCB8+yMLt00nFiNy8ZkXPtsfkxiQn5ea2utJzjHdLeBJfhfRYayCLCWTeH5OSjkG1IByka05WU59rdmZhpYVMrXzvXrEwXRRpZ+SyrDJ0+6lLe75k5udnzSsjhAIdqZQi62w8vPOWkU1ykwKnaJtXb0YIOcWlBG7j0o41GQvfEPK0DW1vvCLi1sTDd4l07ZgSQS4OLoAo1UdEhN/YK35e1KQd2wp80ZE+r9e0eGJh9hwcfejEzdTw5cqanLLl+rN8Wf3S2s/hban+nNIWW7Zl1nC7n6kb3uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(366004)(346002)(39860400002)(376002)(186003)(86362001)(31686004)(26005)(6916009)(83380400001)(66946007)(66556008)(6666004)(316002)(4326008)(31696002)(66476007)(8676002)(54906003)(956004)(6486002)(16576012)(478600001)(2616005)(36756003)(8936002)(2906002)(38100700002)(5660300002)(14773001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MExJa2U5UllGa1dJdDI4MmJSbzV0ZlZydlNIdEl1NXdhTU5wRnhxbGp6MmJU?=
 =?utf-8?B?VXVrdGFJWnNFMnhtYlVXd1pHQkROVlpJdlR4cGNiZ2dZalo5R1pXUnpOT0F6?=
 =?utf-8?B?MUM4VTlDVnBQMXhGb3ltL2FOZEx0V0lRU3dwTXZxdUp2RXJqTytibUx3TXlk?=
 =?utf-8?B?N2hqSGJ1KzVHdEhOdjdSRk5VMnBXQVFIMkR3cjlPaE1aWFloRGVvZ0lKeHph?=
 =?utf-8?B?bFR2Y004Yk1RemRNWjBFZ1VsZDVyamkvbit0bDhjbnBlcklDZVVxc0Y2VENv?=
 =?utf-8?B?cC9ady9WaHNNc0NYVktXakxiUDQvbDZnb2F3T25IbWxpWTRITkU0MDUyTVZE?=
 =?utf-8?B?bVMrWXBFcUxnektMM25XeHc3a0tjdG1VOFgvUVVYbWJsU1pxdlhzc2U0TU9u?=
 =?utf-8?B?NGQ1Rm1EdHQwQ2dvZlM2ejVYemtKcmhTcStWeXRUWGlaRHNzMDNBS1diWGdI?=
 =?utf-8?B?VktHS3N0TjBWbDRpQktScmQ0M3NmRVhaYlZUR0dIdFJZaGZLbkYwcTFUYzVW?=
 =?utf-8?B?bFUza05BbmV1NWRIZDlHVkRNL0FpSUFpWFdFM1lHMndkdlpaVzFUK2RNdU15?=
 =?utf-8?B?dkdMZlI0N3NnN1B5bTJJZW9jR3YyUzZFZXMwNkdtdDBHRGpkSStSOXY4b3Rp?=
 =?utf-8?B?RkcwKzNJbmVxNG5UWWFyRjI0bE9rOGVGWXNOaVJDM0V5bm5QQ0g5RkxVdS9z?=
 =?utf-8?B?TVFIN1ZIdUFTMzFpZmtxRmQ0R0cvSzA0T0hodWlrV0RsOGsveCswZkc1WWFs?=
 =?utf-8?B?WVZPelF4Y2hMM2RUYmI5Ymt3ZzJCK1RHQWhVeW9Ic3NYQ29nZ1VMM1Jka0tp?=
 =?utf-8?B?UnJ3ZVh6Z2lDWHd6UUtRVHlKVzZCSUZsMzZvc0wrczBIMFVXM2lySFFVbExo?=
 =?utf-8?B?K08rT1lNUDRON1BCWm90SEZtSFB5TURqZ0RuK09EQjA1TFZKSFpaNHJHb0pv?=
 =?utf-8?B?UndnVlJ5U1dEUG51MlNlcTg4RENROStSSnVvb1RFSUV6UnVpVkF0UnpyMmdx?=
 =?utf-8?B?cXBoZzJ1Q25pTDVrY1c2aHBPR25DYU8yMGlYT2QrZ3Z0OThndDh3QnBjZGhZ?=
 =?utf-8?B?eUg5ZWFYR0E1NWxITTVuMERWazMvR2d5YlhOZ2pwb2R1U0JRMzRpNkJUWW1H?=
 =?utf-8?B?d2I3LzhjSHRuaEtKemtlbVFNQm9oN0xYSGlOUE5GNUVDa242ZFdzNlkyc29o?=
 =?utf-8?B?NTRLeG9NWkxLc0w5OWdvMnB2TnFjUnRTbDdSbHcrSXI3NnpadDBtVThLVU5h?=
 =?utf-8?B?WnlNVHB0clgwWWMzbE1TdFdhM3B2Rk4zTnArcUF0ZVVGU0x2YWJNVDlrSHNE?=
 =?utf-8?B?d0FUNUFkaEZWZklFd1ZRSm05NGpIQjhDeVRjVkY3akxyYWxCOFhVZE9TeTQ1?=
 =?utf-8?B?RDZ3SU1pYjBtUS9qME02WHpwR29SZ0dWeDBUWm5FQmZ3UEcvd3NMcDF1VUds?=
 =?utf-8?B?S3JiV1ROdXZpMElRb2xQQ0huOWNKM2cvZ0NQVG1sMFdnSmFSMTJyUmtIN1V0?=
 =?utf-8?B?empIR2dWbU51aFdweGJqbXd3czhkYWQvYUhjM3loVFdRYzBZK2FLTmgzWjVq?=
 =?utf-8?B?TUJ6WTlyVFZUb241dmIyU2RsU2N6V1JPbTdIc3dwRVZGVWtTN2krMjNsNThn?=
 =?utf-8?B?YjN0WENCMDlVSVdvblA2dDBDYUhManFxL0hHZm5COEYzTXZrdExqUkc0bUwx?=
 =?utf-8?B?TkxuVUJCNkRqNHR2NGQyR2NEYVdGcStNYnpibStwQVpNaEtsQm1pQzlsQW9Y?=
 =?utf-8?Q?WdMCXuaaQOZretgrwqIixsXTioWT1A6E94tv2gL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e703931b-0c66-4282-9691-08d973a20d3c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 14:56:49.5385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93HMGiRI/rspO8zkSs4plFO+/DxMNHDcxm+4a7AXXkBIWPuvIdD5pDTYfwRLzZqiZjlZA0YfCODyvrJxZkSPFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

asm() constraints need to fit both the intended insn(s) which the
respective operands are going to be used with as well as the actual kind
of value specified. "m" (alone) together with a constant, however, leads
to gcc saying

error: memory input <N> is not directly addressable

while clang complains

error: invalid lvalue in asm input for constraint 'm'

And rightly so - in order to access a memory operand, an address needs
to be specified to the insn. In some cases it might be possible for a
compiler to synthesize a memory operand holding the requested constant,
but I think any solution there would have sharp edges.

If "m" alone doesn't work with constants, it is at best pointless (and
perhaps misleading or even risky - the compiler might decide to actually
pick "m" and not try very hard to find a suitable register) to specify
it alongside "r".

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -736,7 +736,7 @@ void __init detect_zen2_null_seg_behavio
 	uint64_t base;
 
 	wrmsrl(MSR_FS_BASE, 1);
-	asm volatile ( "mov %0, %%fs" :: "rm" (0) );
+	asm volatile ( "mov %0, %%fs" :: "r" (0) );
 	rdmsrl(MSR_FS_BASE, base);
 
 	if (base == 0)
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -248,7 +248,7 @@ void do_double_fault(struct cpu_user_reg
 
     console_force_unlock();
 
-    asm ( "lsll %1, %0" : "=r" (cpu) : "rm" (PER_CPU_SELECTOR) );
+    asm ( "lsll %1, %0" : "=r" (cpu) : "r" (PER_CPU_SELECTOR) );
 
     /* Find information saved during fault and dump it to the console. */
     printk("*** DOUBLE FAULT ***\n");


