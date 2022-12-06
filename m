Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F966445A8
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 15:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454989.712593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Yxl-0001Fz-K5; Tue, 06 Dec 2022 14:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454989.712593; Tue, 06 Dec 2022 14:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Yxl-0001Cy-HH; Tue, 06 Dec 2022 14:30:25 +0000
Received: by outflank-mailman (input) for mailman id 454989;
 Tue, 06 Dec 2022 14:30:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2Yxj-00018I-Qr
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 14:30:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 843a65fe-7572-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 15:30:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7777.eurprd04.prod.outlook.com (2603:10a6:20b:236::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 6 Dec
 2022 14:30:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 14:30:20 +0000
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
X-Inumbo-ID: 843a65fe-7572-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzJCu66DFxBies2HHkP7UAeJ9kVEhYZoWoH936ZfjJZVtuxM5ZH3vlLXxcQav/5TPxB+YHH8Ekfh4wV0MLUbKGLoBdqihYOt9vHq62d07XbSqtUqhqHrce0sn6KITkRUi+yWadsgInkXCTQHvjbLAwl6TnqeFegmldrSGL9kCodBaAzaSLETENtnVz8l6Jg6VN5ebklxqcjLKvN5yfEwH0Ne0xHL1b45zOFcTz1AJj8rE/CUFH69/EHikAB++6MjkjSMsCCJkAKfhnVN+h6eioUwDH67qEE4GnghSRk8bTlgL2xJBrbAuIvi8rYnqJj9wqkRERieC8FP9pDtAzI5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyu2+YfJV0EpE2YDnKXKJULDV8ySfKA8696Hu52AWbs=;
 b=jBv6GZAo7RzJJTuGA7ErFjLKixWZVHo4HliMRPVXabl6OaIRswCb9bzJgVjAIZKMKFocFW7fcpow4bcuo2E7CtNB9T+EuCPJOIFfI3oK0IlPnCS1r/JhTjX5pVZ2KXEL3aXaarrAgRPxtaBVsy99R1yF30HuannBlEu0ZKj37A3SkuEzUkgbCgIko0w8S54dKJvGodxcvIej1ucaP3jHfZe2qa1GsOFyD4CQwlwQgYac+KOu3eU9oTxtypjpkSmUv4AnGmgrXllc5nz8qC7y0NQ5oovz+48HbB6l1A3Yrw8iY1lNR1Mc9ipK1iZ9gk+msU8MeJ6dtoDWVDmb3X280A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyu2+YfJV0EpE2YDnKXKJULDV8ySfKA8696Hu52AWbs=;
 b=klrcxAHU0CN6eTNPOpUL1f3shx4YMReFhrMbhQUuPGj5VGauIhN1QYLSErBIx8umCIoWVkVKD5GqzzK4yabe40ZL4CHBI0dYq9pn5/H82xbs0rKNq4UDq+agwspLQNUscvhGsxN5NroIlIp2U1+yA7qmTA/IpkDbLBNQz8K4hFtIfjNLohKE5t/ObJKv0uWoL1sCc5NDm6FBnujvQefRG/9NUn8dMhjoObfnnQmS2r607vvoFyDXgY+c1NMjErNV8/pCcrYnStOhZ9pBTHR7TukdFsDExy+aI8Ij/1QKmjTKFHBkCNi+a7P+KTccUX3/k1yDa9IhMpumpISpQeM0mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5fd43248-225e-99c0-7bbb-65e7cf7f08d1@suse.com>
Date: Tue, 6 Dec 2022 15:30:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: [PATCH 2/3] x86/pv-shim: don't even allow enabling GRANT_TABLE
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
In-Reply-To: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 8391832f-4087-47ef-5a6e-08dad7966780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XyiAPu/vDqTg0Zd22S+hqA+KQ+Clf5KfpQKrQo41TuCc6O+/9vdKzPDmZ4OkKbWn+ZV/lpwcITaA6vA/gGhsTu2W0XyUuyKpq1VwoldRMMsMZYEnvb/Lie4s+LoQy+f8+HNy7NNIr1BV9agXKtWJcdy4mn44ZDtYO0dE6x12C+8f4U0cSq1O/rMU/2yqjDoRTauE0xy/vbgak5PbsjVpmd90NeMu15Mp5jhif+IdIFMHKt5rQOXi5o0YdokWB6xY1BO1zGyBdjfztZGi5tcQrb/4lpiDZWNG9YfvGjtkDZ9XLVuWD1VIPDq2VvBvT3qyfMuRUr6PmNJHZ1owv3/DTe8OupM+fKRjLt6fPFfBzMBU894MamWZirRQr77Yf2S31nzuBqF/VdlWEymvr6gUY7vm3GD3tBhyyCKjB1VvlCupYXjoJ7fgJagzoIzgw5ZjRPHA7LAMD84g0gNuySl+HshFk3aFo3VbOuKPzrLN2ssakQL0WS6xRyVDmPmUark9e3ExqMSQDCVrzvvOcHZ6q37SGEYMR8Dh1TO7NnDM9wBRJosa5CvP3zUmXNbWWiCqjs9l7OM0ocOzo2y8WVFpSIiKJYe2PcF/Wgl9aN83b5uVLXD7Vf8F6pn/i8ELrEFjdLOSvjRVbKu7fU3rujDsMGG81XU8vK5x+pCXrxyzdQmV7UjrJqH6GH3G/e3A6S2EndqmoZ88Eu0A8u2bOIFt8cgl8eRUSYLWi4YYvKipf9s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199015)(8936002)(41300700001)(38100700002)(5660300002)(31686004)(4744005)(66946007)(4326008)(66556008)(8676002)(66476007)(186003)(6486002)(2616005)(36756003)(2906002)(26005)(31696002)(6512007)(6506007)(316002)(478600001)(6916009)(86362001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjluSXlBU0tCRDNqNVpFbDZtMXhVRUREbXl6SnIxZnBxQXI4bGVVS0NqTFRG?=
 =?utf-8?B?V3loQlJlUE00YThiL3oxaWlnQ2xyT1FOajdNYlhGcXNMMitqOGFRcmRuY3VL?=
 =?utf-8?B?VXBtcnNrbXUxTERGN05KSXpmODlPNDZIeGlpbGJySlhYMkJySVV6dHVxZEl2?=
 =?utf-8?B?b2NRdFlzTlRIRHZCTHJ0ei9VWG0yckhrYkxuZ3Q1TnU4bCtQSG1hZG1GZ3NL?=
 =?utf-8?B?V0FKd0twTENmc1IrRkVmUm85bFozcjFLR1dHMjBXUlV4dlhQWEhrdzdrN1Ji?=
 =?utf-8?B?ZXpES2ZIQTZaYXlaUXdyREZhUDhiUjFEckhKdWViQXFlVkRvVXpqYVQ4TnNN?=
 =?utf-8?B?bUxTSGd6OGlOZ2duUlhVcVFGenFsaDhVTWxEN0N5aG0yR0xMdUU2a2QzaEYw?=
 =?utf-8?B?ZGRRWGV2VWViaENFRUhmL3VLbVNtK3d1YWJwNjlaaXUwS29Rd2V3RXpuejY2?=
 =?utf-8?B?YkhDd0QvSm81ejdSbGJPNDAvYlZsWXhsQmNyeVlQV0liU2pZL29tNkFoRVdx?=
 =?utf-8?B?Zkt2eXZubyt0VTRTSHlzeU5hUnN3d042R2c5UHVudngzcjJFZ2UvT1QxSkFW?=
 =?utf-8?B?dTNaeS9tdkJwSFJoNHZFaDdxK25ZQVdja21MUDNIRGJ1eko1cmFhLy8vOUlr?=
 =?utf-8?B?K01BaUhtcHZncDd3Ty83bE1jb1dJdVBkWUF0R3liUi9oK3hJOUJZNmhoSDJH?=
 =?utf-8?B?WXA0RTE2U1FIVWVvSm00c295R09HYVhBTFVpWEdwOWtmVWF6dFErY0JpUmtp?=
 =?utf-8?B?MmhKMmdHcXVhbnNaVDBmU2pCcDBsNmtpS3NSb0NpbitpcW1hSHYyYVJuMEtm?=
 =?utf-8?B?bWYvVVRSclNPOUZGdzBwcTVBMjBMUWN0MkVHVmh1cVoxWXdRTFNsdnpRdmVr?=
 =?utf-8?B?VDE2TkdhQXNHSXRDZlFkektlRnpmYzJMVWsyN3hqVk5wK0lsZTlkaGFqcGFp?=
 =?utf-8?B?dVBVVjhxWStkb1ZuRllTaHhRTC8wZ2podkM2TTMvdEJrS2U3VjBLa2NVNnFY?=
 =?utf-8?B?MFREMGhUdHZ6R0k2NUZDbjRWWm5Scks2QkpvU2cwbVg4bTU2T3JlbzR0QUcx?=
 =?utf-8?B?bXdBMmZ2NG1BS0xnWUIrQWRTWkJRSm40dEJpYit6dDNGTkpPYTBSdDJrRER6?=
 =?utf-8?B?VjVkZkJMS3VhWm9hbEJhcHV1RVUyL2lvZmJWUkRtWVp4MGFvclpFcjR5WU5Q?=
 =?utf-8?B?M3lRaU1JbGN0YUtlcjY3blV1aHFOSGtoYmdPUXBhZkNWeUt6OTAxdHV2ZExO?=
 =?utf-8?B?UGJ5RVg2b05IOUFIVytHZkFibzF2ejQ3UjBFL0Nkc29JaEdwZm5GNEdBRFJI?=
 =?utf-8?B?NVZSQTI1MEVqMkJzejNDSE5DbU9QNHN1WUtlL2t6OGpOVFRZOFcvSjBCMnlm?=
 =?utf-8?B?V3N0M2lsMWdjbEhYZ2xLbUtOUkd1QnZIZCs3UWlPNmt0UW94bmJ6Y1lML0V0?=
 =?utf-8?B?OEdldU03R2x5Qmp5S2VWTW1xajdibEN6Um9kL1hJaTlRZlAzZW5RdlQ1N29j?=
 =?utf-8?B?a3lVOTFkaVFQMUxLckFHaW0rd1R0T3ovMjR2ZkU2RjBZdkdmbFFBc1R2Qm9Y?=
 =?utf-8?B?N1hnQStpTlNWc1djdnBTRm11eHZ6MmFVak1FblRHU2dFd2RNaXZCU2VKMDZm?=
 =?utf-8?B?Zk15YnBsaXZwRWlnL1dvNGh6VGFrSnpXU2VjRS9UQ05BdHlmQ0U5YkorRDBx?=
 =?utf-8?B?Y3RGUEZrYUpST1hKZkl3bGpNanRoUXlsK1UvZmdEWG1tV09MNnRmR3ZPVStC?=
 =?utf-8?B?YkdsVW5OU2tXK3QxUTBJSXNlOUQ0R1BQWWh1NjE1Z0hQQU5UZE1KNlMzcElr?=
 =?utf-8?B?MEdJK2crSUJJWTVLc3FBZnhIWWd0TEFSYThiQzNHbm53UWRqSHovNTRjYzNz?=
 =?utf-8?B?UUtWaHozb1NON3d5WnVCeXN1VW1na2pBWVpxQnV2dnpTejB3NXp4WGJnajZF?=
 =?utf-8?B?R3ovSkVrcUo1bEo4SE1oLzcxNTZXOG42Q2tqcEwxcGhmcHo5S3ZabUtCV0Fm?=
 =?utf-8?B?TzdrdGJQdnJHd3RHOHNtRkp5VUM2cUQ5Q0M5a3o3MFVsUlFhOGE5MW5hcXFK?=
 =?utf-8?B?ZEIwUVZjYk5SemRWTGwybWhEWlFHR0V6SGJpV0NNRWdJSFBMdVVkeW1nZHFR?=
 =?utf-8?Q?6+v1+LFmwo6kQ+jSeQA5euWDr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8391832f-4087-47ef-5a6e-08dad7966780
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 14:30:20.9127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I36oY7F6mmFurbhEZ8IaI1OPCKU7fEyzjsHA3ZPb4mO4UO2QNQv7ObfPSmN69Qse1PEPPzfZm/+iNWsi/MS1rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7777

Grant table code is unused in shim mode, so there's no point in
building it in the first place for shim-exclusive mode.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -9,7 +9,6 @@ CONFIG_EXPERT=y
 # Disable features not used by the PV shim
 # CONFIG_XEN_SHSTK is not set
 # CONFIG_XEN_IBT is not set
-# CONFIG_GRANT_TABLE is not set
 # CONFIG_HYPFS is not set
 # CONFIG_BIGMEM is not set
 # CONFIG_KEXEC is not set
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -14,6 +14,7 @@ config CORE_PARKING
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y
+	depends on !PV_SHIM_EXCLUSIVE
 	---help---
 	  Grant table provides a generic mechanism to memory sharing
 	  between domains. This shared memory interface underpins the


