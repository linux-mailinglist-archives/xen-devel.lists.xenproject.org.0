Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC2D4631D9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 12:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235023.407793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms10m-00035d-1k; Tue, 30 Nov 2021 11:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235023.407793; Tue, 30 Nov 2021 11:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms10l-000336-Ul; Tue, 30 Nov 2021 11:09:23 +0000
Received: by outflank-mailman (input) for mailman id 235023;
 Tue, 30 Nov 2021 11:09:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms10k-00032v-HV
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 11:09:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7f34a8c-51cd-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 12:09:21 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-Wg8E3tANNva6eXib62xdGw-1; Tue, 30 Nov 2021 12:09:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Tue, 30 Nov
 2021 11:09:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 11:09:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:20b:f0::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 11:09:17 +0000
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
X-Inumbo-ID: f7f34a8c-51cd-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638270561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wW7XifaUEYXLL4FguvwqN0+Lhg2xtOpvU/gE1fjfuIE=;
	b=aGL/oSJeGjWop3zAW5A8a42bUyxkgh7FmVWOsFC7HdN1vm+LQ0lSniGrQ1cbcr9xZq5Af4
	jwE3Vvv0lwlyCLRdkj/CDK6vgaJ1hkGL6UIBgHCCQv7Gwgv3t39sCHRPNIxa2imx7vdqL8
	dXEV3CxofcKKp5IBrM3F1AHrj3xAlRQ=
X-MC-Unique: Wg8E3tANNva6eXib62xdGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMvILX4eLttZ/ZpfTb8/b4nXHW+efh12l7ALvb/LXBR0WSkfR+DGR6CJcIndiGLRC9H4UAu/4ppN+Dd+f19JPRxXNlnPOiJclE+M9EAUQx0Zg18/mfgqOYe+6xR8/DOiLug4VqQVyQt6d1DaeIDeBgQIru2qkP/b63eZlW25CRVquNevx5zlbbtGJ08LeMq26nB5kiywZDxRupLqnFB5/NvRtd+BPCpNqpkLEGeRPog11xer7cZWKWalo9MbFKMu8r1uDwTaRT91kdgdvzhdtR9LT08tCYSae0P9fYLwHowTwaltiE7Y6DAkz8FiwEbTaqfjK4RE81XHEh+Np/8Xgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW7XifaUEYXLL4FguvwqN0+Lhg2xtOpvU/gE1fjfuIE=;
 b=eXCO2MEL1gljxyr4oAyH8I3K+shwPauEU62Jt6vHG+Npj0jYZNNkFtsQ+OjJqQ2EcGLN/Xsk/i5kXWAB4ftcdt2eVh1H3DTiZdljsroDhFbj0p+HYzqoi6BMPJjW2TXZuekWV/C7YOcDozz5NEqhjWJjCuDQWBHzTJHH0pSmr33j/d7uXyA3cp8bLi8ihKJC5+dCMq3Feic0GOxFxihwAsCnHWXol0DGByjHKFo0iYIk3WUjlDWBTntuRoDHevGBrh+4lXT8EBeBkXv3aFe6RayYsS+UJEvSgBhogt4od9C/9igVw/9TQ6koNhRBQI1GlQMMyFrKN3aVxi1VjFUbHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d687d64-1cf0-8965-0569-bce27cf0a8b7@suse.com>
Date: Tue, 30 Nov 2021 12:09:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: x86: insn-eval.c's use of native_store_gdt()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0068.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c330508-d735-4b73-0203-08d9b3f1da02
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61734B5E936265CCA9CFCE26B3679@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4zBA6zLON2y6ZdhxQDEBtPACaJ8hTk3VXVKTSVrE92oA7aj0yNvm9qNJfLIpeVo0PphDgjp5mzYDEr8RaTAlBBIdSR78FVxQTpUm5dkmGrCGG4Q6uOXkhif0qmFGwzrZi/bM0iDPdSlLD391q6yfkR72ZhxpzyF24gP9v5jA4lZF5BGwjiHYUa5ns4lZXgLXNmJxlC6q4viJBg1yBZFXrEOT5MIteYHWXNdtJU4cuLTFnJ+hoqn3YDTiHdrDmsnCpcC1ukfVnNm29HShJPLhbH8RFSm5Dpw7yrMy8jW2tUXXB482Oc8fGQ622i9e6ScVl3ULxAIOxH0KSvfSSKwkguunciZcPJUM8ouI8YDy8rBVmfXpEpqmh0sG0zx5X3yHeRTaLR0yXOVbKjA3+quhkCN7vysE7p3kw7iQKX6Pn3L1VyUd8dHg0g7JD5s3FDnMkpkH6WD+NIqmIiCnJC8Zp5Xcllia2dXVSl5Fl+ZsYz6ZrbdIy7clqSDjifayrWhpi1sD9ym97Qfms+8Pr6u1Y2C/tJpfPySCgeXArVCjIvI41sjozP3VgajeusAweHgfwGyVa2Wz/EHOJuclfP2/QbDkQon0sQy/3n4zhiMaSXQ8FHBuQxtrg/KmfJY5/QcuJQNgdP57xR6CByyem86qu6Jp9XnZTLJUoGK/XT7+Z/P91fEdOrwhZEHvvKjSmwiOkxUi3xlKRMhUhlvGVy6InOgBEbKDFG6+Kct4xP8U+po=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(8936002)(83380400001)(508600001)(110136005)(4326008)(956004)(8676002)(31686004)(38100700002)(316002)(2906002)(4744005)(2616005)(66556008)(31696002)(186003)(54906003)(66946007)(5660300002)(26005)(86362001)(36756003)(66476007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejBjblduekZSdXM5dFdqWEE2ZElKZ0RTTkxXMnVuOGhsTXk3SVp5N0EvUXVs?=
 =?utf-8?B?MHlrbzY0aTBaN0VwSStXYTdSMzQ1SklvcFU1SDBkYkkyTUtvblpRZGRWZkVv?=
 =?utf-8?B?Vkw4RDB6eG5RWnVKSkpuRTF5bVdraDg3RnR4emt3QlFIZHZib1dWaXNUMG5s?=
 =?utf-8?B?Y25LQzdyQkttNTRhN0gvY2hJU2xncGh6ZVlwSzNyWkdWaC93UGZpcXo2TnBB?=
 =?utf-8?B?dU15MlFqL2ZVSkNJZVNTTmM1aXdUN2o2bVBOZXRWMFRFUTZGQVJnYWxoZUhz?=
 =?utf-8?B?b1FXelhENFcyUzJ3WXV2SUNWV1R2eTREY0t5anR4OEFHNVNtTnlzcDVwenBE?=
 =?utf-8?B?eWZxNWdoRW1zQTNac01jVHZ6Sy9Vc2xXL0ZheGFuVkljMU5QRnFpY0ZremIz?=
 =?utf-8?B?ZCtNM2xJeE1sREpIbnZjVFRPL0RlWVVPV2dhVXVKVktzTk5XN1d4RzMwd1pl?=
 =?utf-8?B?QXZucjh2bnkvOE81WGJRdkVHa3JLTkV0OVB4QjdDYWUxUHNFbktVZ1NoSmRP?=
 =?utf-8?B?dVdUVEk1OGNQazBPTk1VVWdDQllteW80NENqR1F2cnRvT3pyOXJaTExRd0JV?=
 =?utf-8?B?eDV2SWZTQUg4cno0dkJyeWhqZkNDT3oyYUp0aGxlOU9YZVpxKzNyMSszSzZI?=
 =?utf-8?B?RCtxSUJYUjViV2d1cTB0R3ZjK3ZGRDdNalRQZVFEbkVBSjNYaHROUjJLdnk1?=
 =?utf-8?B?V1NZbVpKR2NBc3p1U0xzbE9aTTBYQUg4cysvdERXWElIWFRjWmZENjZIN0pZ?=
 =?utf-8?B?RU1jYjhsRmNtRFJQbXNHY1hWNmNyaFFsbWhCZHdmVVBlbzVnWEwvbXFlS0ZO?=
 =?utf-8?B?YXlvaXVHT05kK3RURC96STV4d2ZYaXNZRlBjb3hSZi9rdHR0ZlB4b1BtZnpr?=
 =?utf-8?B?SmNZUGFUcTlzYVJvTnRSOUl1aDkzd2lRTFBSeEN1NklMNVJ3ZEc1WmhyanY2?=
 =?utf-8?B?QmtsZHlMdk5mOUJDZzlBWmNRbG9MUzlVLzRrYi9VbnVyS2JneWlSUTA4cEZP?=
 =?utf-8?B?UDBnQVc5cDBwMnQxMkFaK0lRR3FjeExNZ0N3N0FPSHFnYnU2TnBucnVBS3Z4?=
 =?utf-8?B?RFNpeG5qSXlQbE8rYmlCMlJqZXpUVXUwUHU0MDRtYzl1S2cwVDFnU1VPWjRY?=
 =?utf-8?B?aVpTMzdya2VITEk4Tm8ycEg3ODRycGpaODdUMHZHMS90cVNISGVnK2RBVk5q?=
 =?utf-8?B?WWY2ck9mcGpGNjBNTDB3Z2FJYkE5dUZZMk1kL0ZVSkdYNzdaVk96bjRCcVYv?=
 =?utf-8?B?SHczZXFSMWlQUXZoazNvU0V6MVhoYjlpVkZjZit6WTRaQTFsaGMzU3daVnIz?=
 =?utf-8?B?T2E2Y0NMRnNldzhxbHRuK0ZZTXJ3VTYzUUpHSmExc29YQmVXRGNucEZPSXFE?=
 =?utf-8?B?bFNib0Zpb3p2K054OVdYR3hNdW5BNUdqdVJJZDdWcmhsZlg5R01SL25JNnlJ?=
 =?utf-8?B?TFB6YUlPK3BlUEoyNk5kRzFvanh2am9FVmgyQ1JRVUl5ZDhCb2lNS0tubzFL?=
 =?utf-8?B?UitQTFBqd1p2eE16VllNZzNLVmQ0WFBROVVscHVTbm4va3Brb2pIb3BmS3pZ?=
 =?utf-8?B?YXZsbWRNUXJxQTJzY2l1dmJnUlNEV0YxWGRyZkY5N2p4QnFodmZUSW5yYS9O?=
 =?utf-8?B?N09ZWEtWY2RXZnlVWGZLQUFneTEvMjF1clNDQ1RQWE8zT2lWQWpPWkJEWlNL?=
 =?utf-8?B?SitJaExzQkhDN2Y0VDZvb29vNmw3YTdwUmVJV1RhOHBOMTExaWtnaC9oa0Zr?=
 =?utf-8?B?UjlNQVJwamdxQkcyTGpYaVg5VUY4UnM2c1p3U0RjcUVidnFIOXFmUnExbDh3?=
 =?utf-8?B?Y0NGTHRPdHV3Ukh4ZUowOXJ6bXdCL3pMN0h0WUZBd1FBY3pKdHJEOHRPMlF2?=
 =?utf-8?B?aGtuOGZUdzNGazJZdXV5a3RHUGJKYkI2bWIyVGUzRnNJV3NpbTNvdHJHVXhQ?=
 =?utf-8?B?a3RDVTZMQ1FCQ3k0YllvOTQ0cE9GUlNvOWsycWNHQXdSK2IrNldhV2RwOHpl?=
 =?utf-8?B?WUtQNXZSTzVWQ2FYYW01RzcyTnlIUnhPeXJsQVdKSUtCQnhadTJZeUJhbHVs?=
 =?utf-8?B?UkpMdlJPK0puNHRURU5lMzJLTE1rT0dMbkY0SjM3TEt0YlErRndjRElXQ0Jq?=
 =?utf-8?B?UXVTVXhobVVJclMycnpzanF1NHJJbS8rSEI3RHVzN2JZSnNkS0FwK1hZVVA4?=
 =?utf-8?Q?WsMk4/WwvlH7f77tvzyOC9M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c330508-d735-4b73-0203-08d9b3f1da02
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 11:09:17.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rXd5F4VPcxu9vqfSFgB574cCNQCoqs9mdhVcFaN69wWkSTrnEXRrf79QwutPnwTlac8mHGMzaRTiwzUSsPQ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

Hello,

I think it is b968e84b509d ("x86/iopl: Fake iopl(3) CLI/STI usage")
which uncovered an issue with get_desc() trying to access the GDT, as
introduced by 670f928ba09b ("x86/insn-eval: Add utility function to
get segment descriptor"). When running in a PV domain under Xen, the
(hypervisor's) GDT isn't accessible; with UMIP enabled by Xen even
SGDT wouldn't work, as the kernel runs in ring 3.

There's currently no hypercall to retrieve a descriptor from the GDT.
It is instead assumed that kernels know where their present GDT
lives. Can the native_store_gdt() be replaced there, please?

For context (I don't think it should matter much here) I'm observing
this with the kernel put underneath a rather old distro, where
hwclock triggers this path.

Thanks, Jan


