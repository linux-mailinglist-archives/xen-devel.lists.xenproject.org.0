Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D2A3FB7EB
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 16:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175135.319131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKiAf-0006rS-JR; Mon, 30 Aug 2021 14:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175135.319131; Mon, 30 Aug 2021 14:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKiAf-0006oG-FG; Mon, 30 Aug 2021 14:21:57 +0000
Received: by outflank-mailman (input) for mailman id 175135;
 Mon, 30 Aug 2021 14:21:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKiAd-0006oA-7D
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 14:21:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4746e4cf-ac10-440c-81b6-d8526a2208cf;
 Mon, 30 Aug 2021 14:21:51 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-PyzHeDe2Mt2FblOKgDm-nw-1; Mon, 30 Aug 2021 16:21:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 14:21:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 14:21:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0018.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Mon, 30 Aug 2021 14:21:47 +0000
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
X-Inumbo-ID: 4746e4cf-ac10-440c-81b6-d8526a2208cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630333310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xii7PDzU4s36YozdzydL5n2RSRE7oBhPf5oF5CiDtG8=;
	b=HDvvzHp+fmWhWWj8eL8KI9ofhRRYL5JYaR6TDCk0+ve2iwzMinV9DtTSedIAXkuq1D1kZ1
	NESBETcD0uy7VX4OPw67LAkzbvIZEeSIpmo0tBSgAyeBgxrLi/n056+9Si0fJde8ybeMJ2
	LQOCqfi24rjisCXpXc8eIVfEXI3dS/s=
X-MC-Unique: PyzHeDe2Mt2FblOKgDm-nw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4SNdw6aemzIRsXCKbMm+FqFHLuERGgNJMfvfYXabkqb6B3o0cMo8n+0hF0RjD/IDsOqr5cGYPfu3kLA3779uzJTWL713iSJ+0wZMMgHQBQNck8tRjmOlsW8wIkDRfU8ylmeZ0GOHYD5iXXgAy7AZpIoD/YLHDhzOLRDq0eb+3NRJQepVq3AiKCrfU1qzw/EEPLHQxKyFM8t5j4UtGITRD302VLSuHqT+7MHUdxoRS9wps4UvxuQebLj0qUuwfHPuqgbnCZSxoihRaF8ebkBHZAwDwkkesV8piF3kpVnW/1IsgkdGjU679nT2OVu7RyeRGfv9p3tuwSRVOxrrsmczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xii7PDzU4s36YozdzydL5n2RSRE7oBhPf5oF5CiDtG8=;
 b=dk3s7f92hheRZoFpNhEDa5o1KOxO9wonW9foJh5NU0AyHU54P7JCYjeSISIlKLRuJV84N3jXKaRDFhIJ/BVyVpx/V4tUjjc4BLXT//W2jUWBkBSjY+bXTboN4LWtqcTXWdT6ZNPI24r6eYbtBYuc7pmyTeHDksL579XCfsYFpsZ9m2Ifhjl6mqoWXkD0AXTr3qI9DnagjVLwYR+u3N6XVDBI1ZPOJHhkCtYwJ4cyzagOS8ohnXSY8k52uzCxguAi4NEKpjJYRcc2es93Ad6dIZ3er5B3W+tX21PGn/ihhpragsg+zT0VU/N/md5nxo0ZQqZZoQoAODekj3lf7lYlSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EPT: drop "tm" field of EPT entry
Message-ID: <4e4363ce-fb8a-b2ed-3a01-75efebb3ba3e@suse.com>
Date: Mon, 30 Aug 2021 16:21:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0018.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63d4b7ba-d364-4642-a788-08d96bc18039
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53250FCA51969CD302CDF6CBB3CB9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mU5tOvGIiwD3/d0+unrsNEsxnymxwRKJClnbh74Qc2yJIknVNm6TiXCPafT2v6dEiYtw0yjoBvRaA4Adt9Qe9aap++6KajTpJ1Fu/E8MzUtnglXqC1lh7p6K4LMgNsoIRW4hftEvKUz/7Tt3Sjs2eeqP01NzcHu3li6sNg70DjCa5DuH+DHShOfvKfJt29tv7f4+xIiMCvbiFLkVmdpxFo1FQmriLlP0Q+Ubdk6E94zrj6RJ07gt1TxHVnSWsqBGyEkGkFHuC7hHc61Na2t17w/MooRy9UsFiSz+cwLsB+pOxNL+srjE0dkP1DjYOUF4DUv9PuWlt7hTqvsSc+Tl4XQ7Rswvhb3WrEkFMD/D5Hob5awZ1WUhERQ7CVienFADBA56Y4+dodUwyIjOhxZMK65c6jJcUVwivISEgNO8qlzJWoPMBnV3MA0PaxWHq3WBPNNj9r/SoUA8hzXHMe9FizzWzyHvpY/crRGgE0gDtyhH0/2Lz0OeSHm7Sf4cEckf+Hi3cwvIxp0GiMnU3826reWh8R1df6fMJ9Acnj3RrOxDxKQ9bNzlEQ+eIj4uTEzuMvnHUTlAFbvoucqWZGR0LU4h7cqgnXwaNLMm4XdboH/htksUgBYBsY4t7U1d+Wi6Oq4FHm3e24M+LDhomPB/SfyeQVlOLYaM+r6xqkhoUNBo7dOi80lQe8ZLN/7P4Yc7dRr3Zx5Qk/slNuA3/0vN2J2eacIyN2UdO2OZ0xc7EOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(346002)(39860400002)(136003)(86362001)(31696002)(6916009)(316002)(2616005)(36756003)(4744005)(26005)(31686004)(4326008)(54906003)(16576012)(186003)(956004)(83380400001)(478600001)(2906002)(5660300002)(66556008)(66476007)(8936002)(8676002)(66946007)(38100700002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dC9vdGNRSGszWEY4NzBvSTB3Z1UzMzZtVG92eHE5eHdNbG80U2FxZ0VPQjNv?=
 =?utf-8?B?N21iUmVabzVHWk4wdEpEZHcvMCs5QjlZRGdNdlUxVmxSeGI3UWRxYlp4aFhM?=
 =?utf-8?B?ZzVjOG1yS3JDM1dBQ3hNYk5FVFVUT1I0aHpJaXVqbzhPNTlYSXFPZ1VoTG1t?=
 =?utf-8?B?cVVTSWlnazNqcityVkt0SHFZOG9CZlNsRUg3RjBGa29ic3ZkL3U3cUdKckxJ?=
 =?utf-8?B?WXRzd3BVWEUvbmJxTEtjTkNoZFRaaEFVSHBDMkJta291SnRqTkkwaTU5TDUv?=
 =?utf-8?B?cFBWeUY4bS9GTjE2MEZSaUhqMHRNeXBYQ0IzZG5ZaG9KalJhNkNUYWdmcitR?=
 =?utf-8?B?Skd4SDZnZ3NNSWlaZ0J6MmMzY1JyUExFdnBhbFpMdXhyRFk4ZGx6VXRwcG1m?=
 =?utf-8?B?THlMUHZ5VE1nU0E4dFhPMjNRd2FZQ2lTbDdHcjE1YzJ4Z3A2UWw5blYyeDgy?=
 =?utf-8?B?RCsrSDZzWHdZa3BjblNlWERtUzVPMjA3SXNjem1GRW15RkJIOTY0NlJ3a1JO?=
 =?utf-8?B?NHhoN2xMOUJzY0l6dEdRY1oyVFgyaHlqbG5OSG5mQWtONTYyQkU3UGtVbWxi?=
 =?utf-8?B?Slk1ZTBpNU1Qdk5YU0t1azRLNzhESXRQa0wveDlwS3duUmFlSzB5UWt6Wndn?=
 =?utf-8?B?Q2VTMUxDQjAyMUdQcUxYMDYxMXhYUE02VmFOdWNLTVQxTmoyNEh3QWxvajQw?=
 =?utf-8?B?cGpOZVQwRVN4R0Y5d2VvUWtRZ1dZTUxqR01WOVNJYmVaWWVnUU1LSXZ4OGY4?=
 =?utf-8?B?cjNRWU90cGlrS1VmdDRLVDlpd0RCZmtDdXRpNUQwYXBQS3FlU2tLV0M5OVQx?=
 =?utf-8?B?ZnlrVU9EdHZUblZwNEdVUlNQS2NtOWI0RnZuYWxKUE9CSWZsZk5QbFZ2aG1w?=
 =?utf-8?B?MDh0UkpCc05wb1J4ZGIzdkhTUDRwMnZqRlNRbDN0eTN5bUtkSkJpeVdzdXNN?=
 =?utf-8?B?MVZrbTlPR1FrM0tXMnVmQlBvaHJOQ0EvWFl5VkpjSzFiWittc1N2dHBLV2du?=
 =?utf-8?B?SW9vNmh3WFpQb1VUNUNMa3JlWk5YL3RaMUhUMlFlbVVpTTQ3Q2NsZ3p1S2Iy?=
 =?utf-8?B?REd1ZUp6VjZEc1ZsemEySDI2MjkvTGlLNHJPUHJhQi94bWRlUkRCbkE2YW53?=
 =?utf-8?B?VVFXSU14ZUlPRkJYOENjM0RucVU4Q2I3STQyOTIxZ2tMQ0hGMjNEZ01GL2Fw?=
 =?utf-8?B?dGQ4a3ZtcXRTeUp3NnlFU1ByQndySkwvc01ETWk0cEVWOEhRdUlOd3ZLZEpi?=
 =?utf-8?B?Zm83T01ZVmhJb0ZDdkZCQWg0RVl3d05sSlBtK2ZnaWtld3FuYlFFKzVVLzJN?=
 =?utf-8?B?cFFIR1ViWFF6VU90OElNZHBPNFZZQkNTZm9aLzY1Q1BqSGhGcFYwNmh3K3dw?=
 =?utf-8?B?ZWpmY3NWbkNZRktDWmtzOENBR3QxOHhkYUd0S0VDWCtoU0dVaFNOdG5tQXli?=
 =?utf-8?B?QlExVVJvMmxvb2wrWEM5eU8vOVN5NnVKWWtjL29hTXBIM3lFNmNydUpjN2o3?=
 =?utf-8?B?azJ1UnhxYnRyRnNuNWJiTXJsTTdSVlR2MHBvclJhK0QzSUIwSVEvTXpTZXdP?=
 =?utf-8?B?WlE3RnBUbmdvYnFwcEFGbGNNU1A0R2o1K2hCZkw0NU10aGlHZ1ZGT1QzbkVM?=
 =?utf-8?B?bUpFZm81cm9SN0c1MVBhZEpER090VTloYTI1emxyQWw5ZzVwVncxY2dYTzZR?=
 =?utf-8?B?dzNhblErRHJsRlE0UzNYdUd5Wk01WHU0NFNPOTRNUDF3SHR4Tkp6YzBxTWR5?=
 =?utf-8?Q?NXftCob0YtRGV7YJA0GJGKunMMidE7sdFojxgv3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d4b7ba-d364-4642-a788-08d96bc18039
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 14:21:47.4667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJsh48rsuAoKgSBNwWdk8hZ4DVmUuH+JOAVA90mJXoTfigZIqcYeIUVCDeSCJdAsureRAFlZWZlQjv+8o4youg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

VT-d spec 3.2 converted this bit (back) to reserved. Since there's no
use of it anywhere in the tree, simply rename it and adjust its comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -46,8 +46,7 @@ typedef union {
         mfn         :   40, /* bits 51:12 - Machine physical frame number */
         sa_p2mt     :   6,  /* bits 57:52 - Software available 2 */
         access      :   4,  /* bits 61:58 - p2m_access_t */
-        tm          :   1,  /* bit 62 - VT-d transient-mapping hint in
-                               shared EPT/VT-d usage */
+        _rsvd       :   1,  /* bit 62 - reserved */
         suppress_ve :   1;  /* bit 63 - suppress #VE */
     };
     u64 epte;


