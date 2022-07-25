Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D6557FEC5
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 14:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374544.606608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFwtj-0006OF-1k; Mon, 25 Jul 2022 12:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374544.606608; Mon, 25 Jul 2022 12:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFwti-0006M5-UQ; Mon, 25 Jul 2022 12:09:18 +0000
Received: by outflank-mailman (input) for mailman id 374544;
 Mon, 25 Jul 2022 12:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFwth-0006Lv-Jy
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 12:09:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a36fdcc-0c12-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 14:09:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0401MB2434.eurprd04.prod.outlook.com (2603:10a6:203:35::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 12:09:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 12:09:14 +0000
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
X-Inumbo-ID: 9a36fdcc-0c12-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ohx1BLH9T55WAC6EnItWbmBSSSvAKIY7vRT3PYfFShYfvGXingPhyAfVFfYwNesEyQ+iplQs5C1ysAzIQkVA9VNM4EA2NprJE3ZylnxC3VBdyhBlC4LKbeQ2KA6K496V4a6flMF6Yus2J0GTqh2HeQhW44PYxddsrhlLXVj19kfU6/qtWB7biSgp3LNjQv3CfeNcW4O1RTjukWRdoNXDyxlwID73Snp/Hymgi6pxCjvHo1EMuPq33lKNEhhm8oldLSQ/KskykXfnIjle7kgJdF73kv7dtLp+OUUAMjSbCpmC7K8uohpOTQ/kWSl0FsksaZoknu6YCc8ESBVFF9kzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yXpgIEPCLYefS8RgPyuvc9ydQjRfy2PsDfZ9Qamkm0=;
 b=hEpVXk3P+TAndDrk1rIUcwEW1+ChCtznmLS9bTFzbU5yWo3JZln2lFPCjwmlkhZ/4kwgsZ9/+ExQaVGeIWGDfINSoF+AZZ8eVv6gSkfQezyDhqY+EDssuRY5L0Tl4ydBaIkMEjmAN8nJOpuzAqnn8Nt+Sf9riHmXeD/1C15u+zHfczA3YrHXvJZx0eGXmEUVrmQUxxz8sWQ+qfRa2Eb4antNAlo0sW82PPQz4czpWo9IPNwCBE3J9TdF6z8RVG/IPWdDd2QdB0VJU+LN+znupgNzQGv4NQZePxPZM2B+ciWAUmpt5X8J25Uv2v24AnOqZafKmVBGGO4gv1PzEU5EKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yXpgIEPCLYefS8RgPyuvc9ydQjRfy2PsDfZ9Qamkm0=;
 b=X7o9ssrAsyK1uqv00ytPYMRv+yXVyOAb0zLodItaf0aNNXqyUyh/EP7MGm65u3YUGjokB4p4CONLoMlBj2dz7pp87OdAVh1X5L6FahylNdIIBni1DslVixev8d9ih1f53tfoGQqH/lsms0a+KTn8uTVru0YkQnh6CKWzuQpl1NWQbcH6HNjivr5QBmmW3lhBf/1CWbVlgUqpw0hz1QqHOss+YTeWzZHmJSOEeYNeY/8mFZqBaCrzPYr7Sek8QBvQRw+1w3LSVECwZKUjpUSs/HEUDtswGwsRnjrBLGxTeZXOWjQFr101jAziZyC1Lacp0yrCKJG3QhaQP599alQUYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3327586c-1489-4af9-0fa2-29f48d957954@suse.com>
Date: Mon, 25 Jul 2022 14:09:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: limit issuing of IBPB during context switch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dafc363-c6eb-4e01-b5e7-08da6e367d7b
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2434:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9IHe25fSq52+X3qntK22Oz+oinjTB/vvKMN4Y1fd84JwL3TXh2cdfv5aMQDENl6iugWIUyx6yBunzO+iV1KyX2tivWdm+k/FdCgWtmo+PyzSGMVFW9Qodg8jq6YcMqpLsgySo9ksqS1JuaPFfG6PLCVoJ/ir2gnhaf3ziG/DmIte2IY8MfaubSoT03RqvBq0lOQMM3ay+AVbyDLc6UcejC+SybCRzYKRC00TfHhN98a/pAJd8T8ue97weVZka4CgYt0fhjoBZDL6F+Cu5tQkco8nz+N4qkVH0nFAC6M5ryDPwzw1xvG8ADEfykGML50dOyvCworBD/2OWPpqfBiQowh0jdHgs14k1G2tspjJDPcp08UNNye20qipJhUlyIuSuFlhdjqHiCYZSkwR3Nf17vi316H9SAM/5CKIiZZIzDLQ7DVjriPIICMYvwf/fZ5EbF7fSSaT0H2kFOVA0/Pt8vf2N3JJX8UWo/EvBDE1lCau+KuzbWwQf5P11uBz0Y6oP9jCYocBN3Z5zOayWLoMfj1+W2VAya5xjmkiUhCfEyJIEnxo+UOpGoHQFcM6icms5gwUqE7dVYxmvflQqSgpzJP7DYgv3LwwCLFW/3bW4BCBBGq6xC+3+BiQ/AgeghpGwq4FgHtNpREj+wttf4+IU5Gm2ZM/T7x6VZTeI2u4VGptGbsCFUdDwcyuTaNIldqfQf0BaiIM45WJVJfc/JQEDnZJt9IjLNEifx2FG7gEXxZjB1IxyyKUTvXRn4DP1VLttZR8Zoe9Nk9edanTxp8Y63HIEKopl7irHoLvHCVU/JjPQtMMRY1ah+qbtaRQWfnuRfp+eA3A1pMXX4LQdPS+HQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(346002)(376002)(136003)(186003)(36756003)(2616005)(66946007)(54906003)(6916009)(66556008)(4326008)(6506007)(8676002)(31686004)(66476007)(6512007)(41300700001)(26005)(2906002)(38100700002)(31696002)(86362001)(5660300002)(4744005)(8936002)(316002)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmlmaVRBOC9sd0hISW56Tm5GTVZhdG9FSEhxK3lGT1R5NVA3dHhaNzJkRHQ0?=
 =?utf-8?B?Z0ZwTXoyVDBpLzN4Q2FCMzAvZEJwQjBoVytYTFpCL2NKaTNnMVphZTBKRXFy?=
 =?utf-8?B?NENIanQ0WDBvWUtBYTNKajNxRG5zcHNRTS9hdGo4MUdGTUc0VDZUYzVnYm9y?=
 =?utf-8?B?YXZCUlA3SVlrNnFnaDZCV01OR0NiTnFOeitZVmV1amlnTjl2VTJ3d2pBN3Jp?=
 =?utf-8?B?Ryt4Tk1zNkNaNE8wM1RxUWNjNCs2V2ZrMnVJcmd5enpMT1luVjk4YU1Najd4?=
 =?utf-8?B?UzZwcEhFNnltOWNuNldWSzA2bkowZ2s0TUo4SjhLcUtDUkRLdFNUSDh4cFVC?=
 =?utf-8?B?ZXVxYmc5bGN3Rnc5QlhPbGFWVjY5ZFZnWVZuTzJWU0gxZklUR0F6bXkweCtZ?=
 =?utf-8?B?Y3dIQlVtajVOMlR1MTU3YTNjam1ocXdNL1FBd3RPRjVkSk5SQUJpaVorVW5K?=
 =?utf-8?B?dnpTODBsZ24xMnRqK0lMUmdwQWV6dFlHbUo1dDZScXV5YkE4WFArOUk4Yy9i?=
 =?utf-8?B?MDF2L2RtVEFTblBseWJPd01CenI2bUFrazJkM0J3cHRDYUQwZ2RIMVBRajFY?=
 =?utf-8?B?MFhQRGc2L01JKzd5Vi9mQkVzaS93WDZ5QXVWVi9hZVA4NzBnbUFvT2p5L0pl?=
 =?utf-8?B?QUpwMUJ0clBsUFpNVGZ3c011WElBdW1LN0JRcTl2Y1luVUJoYURtckROU3JF?=
 =?utf-8?B?UmE0cTdDMnI3QmhpTnp5MWhGYnRaVWUrdWZwRXBpUDJ5ZUF4dUxYaFRYK1g3?=
 =?utf-8?B?NWNPSGNqeG81TGplc21jTzdpRHE4TlNVNDFGamQrMUNEVU1OS3FBeHJTQ0JZ?=
 =?utf-8?B?ZkVPQU5rUVhQOUgrc3MwLzFzOVFvbkV5bjBCOTgyNzgzQllnekw4V3FVV3N4?=
 =?utf-8?B?eTA2Ym1ZRVl2Tzl4ZUNLYXBwSGVtT2ZkeC9Rbjc0R09LYU44SzFSUUlsSXdx?=
 =?utf-8?B?YTE1ay9NdnNXTHhwSG5DV3NZQVR0N00wTEpvcEwvZThicHVsa0NFaW9STFFp?=
 =?utf-8?B?M2lQMEs2TWVLdDBaZlpWMzJLdG11YlZ3eWVyQmNLcDVuTWJ2Y3VYcElDUTlS?=
 =?utf-8?B?b0dnWnhDa2hWV2x0eFg5YkFwendPQ1cwS0VBajFDMUhzYjBxbzh5NGZVcHhv?=
 =?utf-8?B?ZWpOdGxHQjQ5UUUxVmFOeU95Sm1kYTJQMXAxUzhSMU1HaGlzMWZ5ejNXZTNs?=
 =?utf-8?B?OHZYWGNQWk13YmpVempqZis2YUswWDhleHdpRi9kMDVrTUw2ZTVlbjJWTDZy?=
 =?utf-8?B?WXVSZTVKM29XMWhyeldOT1YvbkcyWjdCYjdpUklmbmUvWXFCWFhBcko3cG50?=
 =?utf-8?B?VElYbHBBOCszTFJCZVA1RkFNYmRzN1Q5cVdhTk44THNmY2tKY1FpRHh3ZjJQ?=
 =?utf-8?B?Mzcyd3JKQW1Yd2EyaHBGekNuVE1wblluNXhzZExBeFZDSk9pL3lFZFlzUEIw?=
 =?utf-8?B?dGlIdEZSQ3hJTitTSEhHUTJsL0FVWkx5VmNNcEVleG5iNkw3YVdYaCt2Q0NZ?=
 =?utf-8?B?bWpoUnFFbGJrTjhlangxcGNIK3NSYnJ2MWJYOWh1MkYyc0NTZURzQVBrUi80?=
 =?utf-8?B?akpSV3BnMVAraUJPdXpOdkMwS1I3eE11WmcwTUpxTnJkemRCZ1piam1pQ1Ru?=
 =?utf-8?B?djN3YmlmdkJ4WENCSXExOFh5S0Q4TUdwVGRFY2NBdlVjZ3VsQUtIeE1RRWRv?=
 =?utf-8?B?Vk05dTlRNlNxNlgrNFBWaXB4N09aRFRuckxFeDJOb1NaaFNBTVIraVpxeW9O?=
 =?utf-8?B?a1hmb3B2YTJTUDVrNGpTbUE3NXRmamprbUdFQndXT05ndjR1WXF0UEJOU2RE?=
 =?utf-8?B?NFQzaTZvdUdzZVA5ckNMK1dDdVVoWURncVZJQVQwMmxuUEoydjk1dGVib1Rp?=
 =?utf-8?B?RTlXSjlGWkhMYnBVSU05RGl6Q3o5OE5aMVZKVE1aZ2NKa3pxWkhYcmRwdXIx?=
 =?utf-8?B?S2ZKL3lwNWE0ZWhZUDEwU3BEMTZjZjVJQ2xMNm5Od0FiYzI3Nm5ROGlCcEhQ?=
 =?utf-8?B?UXJMNXg2R2liZ0dHSWNjQVYyZlVkRkp0RWdQQVRnYUwxTHlGTDNnaFRYcTBn?=
 =?utf-8?B?Nlo4eWM2b2txYnFSUFB6RDlCKzdubzNXVDEycEJsU005NEFMa3hDWU8rLzgy?=
 =?utf-8?Q?rj6IJb5YTU/rsrxbGEgijf/JO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dafc363-c6eb-4e01-b5e7-08da6e367d7b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 12:09:14.0613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdykzJ86Bdydfa4rwsWsnrNZi5rgvp9flFtFAV5dvrEvAn8ZWIcfQekG7vYIo72CNki6sVOJxAW9fDSFMSfsrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2434

When the outgoing vCPU had IBPB issued upon entering Xen there's no
need for a 2nd barrier during context switch.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2098,7 +2098,8 @@ void context_switch(struct vcpu *prev, s
 
         ctxt_switch_levelling(next);
 
-        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
+        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
+             !(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) )
         {
             static DEFINE_PER_CPU(unsigned int, last);
             unsigned int *last_id = &this_cpu(last);

