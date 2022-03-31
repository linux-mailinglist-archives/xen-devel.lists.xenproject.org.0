Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3094ED730
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296833.505397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrKC-0003Ys-2S; Thu, 31 Mar 2022 09:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296833.505397; Thu, 31 Mar 2022 09:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrKB-0003WU-VY; Thu, 31 Mar 2022 09:42:39 +0000
Received: by outflank-mailman (input) for mailman id 296833;
 Thu, 31 Mar 2022 09:42:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZrKB-0003WO-Ci
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:42:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6a353c5-b0d6-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 11:42:38 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-zsqP0yAXNNS0xCdoxS-UfA-1; Thu, 31 Mar 2022 11:42:35 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR0402MB3415.eurprd04.prod.outlook.com (2603:10a6:209:d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Thu, 31 Mar
 2022 09:42:34 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:42:34 +0000
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
X-Inumbo-ID: e6a353c5-b0d6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648719758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Pc2vGAcBdNdvOMgm5cOr8HDjrJP6wj0L/4UaA6G/Ao=;
	b=RRsoEnOa3CqMhZ2KRXLoENOe66dCpwojIu5jWqlO0gjQ3fdmIn/FDF3jBMPUnoTxCjI1Z0
	95Q+QingvYHHTZBIUKVBd9kq9wQWiew4Elq9C5CQj1YzJewjBLdsiOELKjm9zp/NH5wU2u
	Z3SehiUMzD0EFRYuqkkcO93Y1PyjDJo=
X-MC-Unique: zsqP0yAXNNS0xCdoxS-UfA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6ACTviJfosqzr3fKCyf85Z9zk+L+g+qVw72VbB2NLCqtOCKdESkljJBy0xs7CR7sl32XnvPgm2D55wsSOGqiKue3bR8q3bxYG1ZwNvtohAc5CohUapiblyEaztHiGORjPQvo3Vj0+oRv21MDlSMLvxENoag4QnocppFYALesjf8m4Rhl5hr6Gs3x/gGGFeHZsGgDnHgHQyntwNlo/tFkoMgMjCgGa2UKErdJK0nm5hVWECV8TUU+dzOIYC7qWoC07LfNIblGWbsyMJKI/bM2qodZh8iJlY9M+cO3yoAWmInQsbQrmlzLXpz9263nlfEz7PnECZBYybzMXsC6V3ygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Pc2vGAcBdNdvOMgm5cOr8HDjrJP6wj0L/4UaA6G/Ao=;
 b=G1v/DI3636MCFmgNYJBlnGy+YTeXC0zgzhYR31bC4P5J5NMGWIDUTDiXBysFGIF+7iAPELbEYSpXueawHOOuyAfuL9G5f4lqkHtf0SlRwr9QI4Kx2KiTZ9b+Rr8rZiD4+Tn5VftmDx65S3/fXjDeUcfBlMwTWrkcoU/6vCx8kvsUGzL6Sat1iMctg9IrZ0Ey/CObMcs6h10fJ6psLHvpDfcg1LVqxs6+pC85YcqABzO9nLW56KEgW+KReU67CVbRL9vEQCXw0ZO40kgWp2ItS0A4WbN1YeJFw/sCO3lfAxLCnF/bLZtQhPz+IzYlqtI1bsqmpogEizoLNFlB0fXSHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
Date: Thu, 31 Mar 2022 11:42:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/8] x86/boot: (mostly) video mode handling adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0006.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f098096e-9b54-43b2-93da-08da12fac83f
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3415:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB34159545975CB0DBA500759DB3E19@AM6PR0402MB3415.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	90uQZhYGyKvibb17CQg7z6uKo4zlCE9i/JsEaalfY28teYizJsMiYZqRDVLVUt9h0SJV3CfXJPpt03PsiiXZgBZ4rwmok6gOL6G7lIKeiP0RcIlLHddlmHtoNB3s0kYfIYNKoW3sydcIVqo2SA3pOg0AsGpq2Tp4Wgs0nLm6meJzjROCPDga1MPrkf1XGAAMrORFyF4xIm+NSsSLXnktT432aqzN4ABEBOBanWxFybVdVrTe6jF18y5UDGskqckYW0wf7GnYGmy/QDCm9nEpTx0d3hAyUmvpT7lnJYnJX4eGFJCdhT15OBHFre/KqCAk6M20mW9Ao+vurzRCCh9rhwR3ZKFSvr7toan05+XsOVnlw/9t4ZxyvHSjvRmG7Xbg8xJ35dxSfqDXc7P7lYFNJSbI59A9Rku35FveR5D21hSm6mfK3+XtCJN9N7BJXFnflJxKwd3wSZ2mXBDkshRGHdikGIbDdEisFDHzCBrDNuIR1zy7BsgvY6amEzR/MwQb8fDT87CcPCWL5YV6CPp4TSm1QYr7CnEMm3I/oQLbR+gz8CfeOP0FxLp4pBeJS8fQIWRW60wv35zQ4/rHrM7MFnBPueOXYTzw8AsDDADpwHL36LsIdo6BRE69x64+hQZe9VCaJdqb4SmIJzHgppiWBafbqsFW5xJX+zQV9xOQvUf2fl8Gxs1FSdtKIPDc2Qi3ruCu7IYmAlxqiAnpPhJVkw7SwFv/jrekMQ3KdJRbjV+x2jy05n9VhYSsITWtsQxK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(8676002)(54906003)(4744005)(6916009)(316002)(66476007)(66946007)(66556008)(5660300002)(6512007)(6486002)(6666004)(31686004)(36756003)(4326008)(508600001)(6506007)(2906002)(26005)(31696002)(186003)(38100700002)(86362001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0JWTVpEOU02eERNRDNCZTVXUmNBUUVSYlFsUHJSN0pHQ0hHVVR3N0tlM0Fy?=
 =?utf-8?B?OWI2TWVmYkhrdXJIc1RLMU0rd0ZYbGNiZWpGTVhxMmszY3FwaDdHUHlnSGNW?=
 =?utf-8?B?Tkx1cytQTUdWSG9SQjYyNHZpLzN6QzNvcGt0SkIwY2FIMW1sSzZzd2hiT2JX?=
 =?utf-8?B?czdmT3hqb1VTQ001dUMzL25yL042bVNzMkxCQXNrUVZ1RkRwK1dtMjNXTHNw?=
 =?utf-8?B?YUhmUVVtK2k0VGxxcDJ0U2xpR2hDMEtGdFpDRUdacVUxWW0zRzV6WFozUExH?=
 =?utf-8?B?cnBvSFJMRnFTT2RydGdyazVGSHcxNWhGbmkzRHp3a2R1eUFOMDA5dEtGVkl1?=
 =?utf-8?B?aVdraFI0MjVyRU5WcGlWOFhOU2RibXRJemNoWnlOcjE4UXh1THdSTzFtczlV?=
 =?utf-8?B?K1pCRElCTm5VdlF4Y3J1WHhBYmovZmVtRXV2cDZEQ0tUbGZmdFRWeE5NV0hq?=
 =?utf-8?B?eWNwTTNFOXZEQkl5T0locGhML1ZGOWtua2t2OXYveUFka3c5MTE2ZlM5SzdH?=
 =?utf-8?B?KytJU1pVQ2pMajNtOGd3Tk5JWHVCMHhjNWJSNyttNmlzUGRtNDBJRGhzWG5j?=
 =?utf-8?B?dTgvaTZZdkt4Y3ZrSjRmNERXRm84WjRzUWZXUFIwL2k3ZFVCNnNIcEZjL1JZ?=
 =?utf-8?B?djJndWFnRzhNZURzNVhkNENpbS9UaUFseEo0WnMzeHduT3ZETW11enRpczN2?=
 =?utf-8?B?SithbUJST1lsZHc0b3c1SzlaQU1JQ3BZZ1A2dnBsc0crYlB3RHRaSTVkbXgx?=
 =?utf-8?B?Ti9scU5SdXZVaUhoUFRTby9QdEFXUHpwVVJRMkVEU1dQMUhyekg4S0psQlp0?=
 =?utf-8?B?SkdpdkdIRFZ1MmRuVTdOK1A1N1RoZGp0Yml6TkNPZXRUdURuMDEwQkhKYUFR?=
 =?utf-8?B?QURwRlpHYTd6MlUvLzRZNXA5NjFZWEFibGs4K3JGZTNxZkcwQVEyWnhGOElm?=
 =?utf-8?B?cnp0c2FpYjZlVkxhU0djSmExQTJjNWZJdFZwL3FuUGpPOTRGQlp2SmlnTDZ3?=
 =?utf-8?B?aVB2dkRFcjUxWjczV0pzeWdvZkxQVU5Gekd2SjNxa0E5SGhtdWVXeUVleUNh?=
 =?utf-8?B?RTBiZ0xrV2paZDhNNnNicUcxWXNyN2Z5VHRBNE1ub3ZqRkQ4TWRNQ1BkaFR2?=
 =?utf-8?B?Sm1CYnZtTGczR2tzSUZJSlplcnBLSEx3UExJOWJuR3hZRTBnamRxRXhRVGdr?=
 =?utf-8?B?NlJUZjd6RWtyY1psQXVxT0ZmdC9tdFJkaDkzanQ5VkFLMHg0bkFFOSsyMlk2?=
 =?utf-8?B?b1hMbmxWcnpvZzZleVA5c3JmV01pdTQ4aEdrcm1QVHlBUCs1WjJpT1lwV2V3?=
 =?utf-8?B?WjhjTmc0VlBjcnd1VjFpdDZibUZybUdrSFhpcFN6aVpra25sei9QNnRjTC91?=
 =?utf-8?B?RXJEOGpKdzBveEdJbXNrcmZSZjhXUW1McVV3Tm96T21wQWduM0N0dk5xbldX?=
 =?utf-8?B?K1Qwa3IwRHZvbEhQdVdxWVQwczIrQisvaVpydnpqRUtEYytFZEV6bFpQc2VF?=
 =?utf-8?B?YnJJQXhQYUdWOU9DeFF0N3dvY2E1eHdxSDFvQk1vN2t4b2NqUGlLN2NjZk8v?=
 =?utf-8?B?NkhkY1ZHYmRkTDlVUVRzZi81aDNrSFh1NC9OTWh2YUQ1Z1FrVE1aWHVyNzJM?=
 =?utf-8?B?OUFtbHFDRHRDOXBQODZORGdaWGVlNFpvcmFaK1lNUkdPZExmZkNHUEV3eGZZ?=
 =?utf-8?B?b3FzQkZtQkdVUGhIaUx1L3Y2bjNlbWNVU1JldFRONjVKM3g0bjhyUGwrdHhP?=
 =?utf-8?B?Y2UydHM3cVd4c2ZTTHd3RFJyK1Y5UHRyY3I0Y3VlVUhMYXEzckJXSTUvcmlJ?=
 =?utf-8?B?QnlZd0ZJNEFEaVhmc3I1K2FmQkRxUEZVU1dwT0pBNCt5b1RwanpDM3B0M3Ax?=
 =?utf-8?B?SkJDNHpsWlBPVzhXaGRrUGdidkUxVEtmQUhrblF6d1FBTVQxbXJsaXNTdVhj?=
 =?utf-8?B?ZmF3R05GYXZrSE1GaVFBNzJHSEFIVjhqT0twb2dRS0dsakMrZVAzR0JhZnlz?=
 =?utf-8?B?VjEzU1pmMGx6NjNmYi9xZXVoaFFuekRiWnJ6SkdvbTNVU0hJVG9VaWVpVGR2?=
 =?utf-8?B?Q2tiNGxOd1ducnRjV0RkR0VGako2azhQeXpDSXBUeENQY1hCeVdDL24zVSti?=
 =?utf-8?B?M2xIV2J1RG56L1REZS9MSHlRczVjcEZrVzhFS2xGenJ2YzQ1bTdXdDBqLzJ6?=
 =?utf-8?B?MW9iUXZTUmQ2eENnODBHekpMdEE4blhpcXB0dS9ZMmU3QnVZTE5JSy9lRlMw?=
 =?utf-8?B?UTZVUFJmTExlbXhxSGRxVWZ0VVI4YlFlOGlSSmN5ZWd2TWJ1cElWeDhBRFVD?=
 =?utf-8?B?UmFyRVZ1MHh4UFNpSWdGbHVIMzd5RXNBeVpjcFIzUDNWbW5nMGJjZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f098096e-9b54-43b2-93da-08da12fac83f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:42:33.8954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZMr3Y9DXc9gf+0Yrm+yuWXalIywFIZmGL3AimR8TWQJtqq6lj7S+G3E2QSGYCvihh1vZFs4nptQvwIMwVOHmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3415

v4 largely has some re-basing changes compared to v3, plus one new patch.
I have to admit that I find it particularly sad that the enhancement done
by patch 1 has not made 4.16. This series had been submitted well in time.

1: make "vga=current" work with graphics modes
2: obtain video info from boot loader
3: EFI: retrieve EDID
4: simplify mode_table
5: fold branches in video handling code
6: fold/replace moves in video handling code
7: LEA -> MOV in video handling code
8: fold two MOVs into an ADD

Jan


