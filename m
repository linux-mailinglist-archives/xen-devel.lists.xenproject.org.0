Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF126401C14
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179837.326253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEG1-0007sw-5b; Mon, 06 Sep 2021 13:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179837.326253; Mon, 06 Sep 2021 13:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEG1-0007pU-1c; Mon, 06 Sep 2021 13:01:53 +0000
Received: by outflank-mailman (input) for mailman id 179837;
 Mon, 06 Sep 2021 13:01:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNEG0-0007pK-0a
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:01:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 994aa0fa-0f12-11ec-b0a4-12813bfff9fa;
 Mon, 06 Sep 2021 13:01:51 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-A-cj4z9TPxa0qOumc9_p6w-1; Mon, 06 Sep 2021 15:01:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 13:01:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:01:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0226.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 13:01:47 +0000
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
X-Inumbo-ID: 994aa0fa-0f12-11ec-b0a4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630933310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C0VetijaR8xkFGTQTUwV6cJiozc54HeEusdPV3iHAi8=;
	b=UOa/xj8QqxMsM91USdtP/TgHQ3lZcGg68peADaIWNS7N8KIflac2ukZ4SCZwSGbAHJgcsz
	uZSjEJfZwEg+BlVennC51N3cTkfv43ak/AYdCak5MucW9+8bofx9uCBYnUW5O7a1H0lfmY
	j//yN4NOCz2bVRDrUV9bzJsgba4a6pA=
X-MC-Unique: A-cj4z9TPxa0qOumc9_p6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrsUmg3yW6KZu0bukEOz0NRdeY/4rpJse07BhCHEWkbgLQr8Itr1Kj3+cMcdbccwLiD3Cjj/lDmfUGZpw2rEmwtrOV1o0zwwl6y15Ve02ICKH3cU75wHQyKO5h4hB1oxCtfte6QmpVe9bbpA5EVsEpnZWe4laLDAjRzp2S43QHg5VehRI0mE6oglth8FYbgoQmxQtvbLeo8t7LXLg6pDqLFMWzL0osvGNAAWSWO2SSQY6i7C1gF7ECg3ZFk/54orM+/zxFlF3UX74rkUwIcadlJEiizeLTWFEYZlEEPxcMMSiRF8Do0EYoBCuxn2vjj8kX65t8M/svQG7jWCfEgGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=C0VetijaR8xkFGTQTUwV6cJiozc54HeEusdPV3iHAi8=;
 b=JyFs+DCOG0DB8e3UF2xtNB4E5nlICNQquHcqO9YeI21xgUbJt/Vg2TJZxT7hedCORe0uorQL/si889p/Y8+Pmlq7R9/7KLOX8Q/y65xWuwVzBmgGeNt1MfZcfelqoVOha65tP/pfsSaPxhjDjvguhEbalMD3bBwHQBhIWDIsH6xZemzlKH8BMg6U8En7MQWXMRTi4tD6nY5xXHXFOQRcQ8DAgvqLCUAjSMHn5u8eM1Kj40yB3rRbOjdeOzPj+RrfrMMx+3dTPSHKN89QGMWGZbxRZaWhiMYDhCsTZhZ/DjuGBZdUHL847Ae+HmoJO9xzMcCEPtVSjpGSlZQiHd61vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 4/5] x86/mwait-idle: add Icelake-D support
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Message-ID: <f18d6203-7cde-40be-e645-f5460259c416@suse.com>
Date: Mon, 6 Sep 2021 15:01:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0226.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 877498ab-33e6-4fa5-75b7-08d971367c48
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608D8A7F316FC9D680208E5B3D29@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	txKJ/x3HL6XEsk8VSDAPxfPxRVWf5wotqkw6RHCyU57bMCSD4kCO1DwYDnTOmfMLPxuR/T9ldhGy5bwR8KFQmL15w+2aFnVhdH/PfzBOtse6flTqTTbnkv3trrQ4vmrF4xA/rXpwRRDnYLKCpk9ZbtXtdItZTcwqKs6vEMsLWxE0z0sEdWTStnbe243cFJjFHWY+YmPT2P60mVw6a2Jw9MJZtX9tHOl2neDJ71JulngDDYuDyIHhMvR9rIPk+bvfZH6mOLzl9YxetKjNhPS/tEoyuQcGUthu8KkD0fpFIzbNCdptKyRCsSiPf1uq9UnyBOcVI2wRYDiG0kBrVyEwZ0/QI3zllb3965UANPvZPhGFvKXKWQUJvXcmhs+6XEAmO9neJh6PY6ejTrrDtFjASito7CfCQA0Gut9m9z0gBPHCQtCgOGpaJCgw57WcCOK3Zakrq1v1zAy5mY28+n9Ymj3Oci//GJZ/7qB195xHEfyjoeVrj2cEEBwZFGMFruUwUnIw+JZ7vD/6WJ9aFRjgfdZYfIJJ6bAut+Qh6OysRIAsmbJqKbZgWJAOvs3AYDb7V91PnFCbdbwKEHNs+nXxs320h2xKIp5ddK/6AoSjWg1ynpZzAtHbbtjYgXkardvsqS/YLAEom6AuQp9I6hTsN2hgpteLF8H1r/6zWKOIub7IuoU+qmAypx/cwHe8thwhuTtPK5X3HLmqJi3eAdFmY1IOe93KyoLUPt80W4Vhd/8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(366004)(346002)(376002)(26005)(4326008)(86362001)(186003)(6916009)(316002)(956004)(66556008)(4744005)(38100700002)(31696002)(36756003)(5660300002)(2616005)(66946007)(54906003)(66476007)(478600001)(8676002)(31686004)(6486002)(16576012)(8936002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWF3UkpMK2hyUmV0M1hTUDNNb3l0ZmRkQm83OEh0VmQyVzJ0dFBqT3pFQVcx?=
 =?utf-8?B?eDdNSVQ1SE8wWEsxUFRJcFBMYkxOQ0ltTUE3SWRML0wvNk1kQ0VLNU5IR29N?=
 =?utf-8?B?ZUhMWnJISFhQR1BOR3hSL1JZZURsS3JFNWtNRFRQUUhadlQxL3kxSUVyeEUv?=
 =?utf-8?B?Z1VrMzcvbHI2SzhYUzY1RzdoTVVmTGphaWpZUHVvM3JUeUoyWW5wdFMxcGJl?=
 =?utf-8?B?VzdtY0twZkFBR0sxSHdSWk9FamJWS0JGelJNcWI4OExtQXA0WTFIZi9zTmxh?=
 =?utf-8?B?Z0IxUmhxRDEvclRSOHRHa29DaytUTVV0UG5KbzJ5enpXdXJJeDkrUHkzWmlQ?=
 =?utf-8?B?Ymc5bktNMzhMbnByZEhWZ2VqNmFGTjRwTTVUM2JjRmN4bVk3Mm5oelFqOWwr?=
 =?utf-8?B?Wm9SN0FJV0JTS1NQVUROTUQvdEtabWJsYlgvNTJuS2Z2RDMxU0lsRXRMQ2dp?=
 =?utf-8?B?QmhRL0F3bEJ4aWlvZ0NTcGZ2L3AxVWtqWnRaOVdFU0t4KzFPRWpBRkVyRkM3?=
 =?utf-8?B?NkZudk5vLy8vdS94eXQ2a1UwVFgrME1LSEhKWklGZVA4TWhJQmdLbEwrMmR0?=
 =?utf-8?B?WXM5WjVuWEFOSXplczQwR3lwTHo3T3hzeU9zNm9BTzZDTXR5MWlkRnBkbVNS?=
 =?utf-8?B?RSt6elJzS2tGM0dZK0gyM0FsUU5Fb0hZZ0U1bUhHSmJnNEJ1SWdaNW5IRUEz?=
 =?utf-8?B?WlNPenhMQ1ZhTTNvU2JaaGVIWFJMdWFLRTEvdjFua0ZBaUFaRUtuYmhxeS9a?=
 =?utf-8?B?dkRQVGhWL0lvbEdNVUpRbXZGQWsrQ2dhdWV4RURFVGJ6WDlHSi9aR1lwODR2?=
 =?utf-8?B?NWc5dFdQclNNMXJMamwyKzJBTDlmd2l6S09uMXRVWldsVVB4UkMwT04rMlZB?=
 =?utf-8?B?MXRwOVpMT2YvS0s1Y3VLanVRYTlZZnhrekhMcklKWGUydGFTK2h0eWhNcWd0?=
 =?utf-8?B?SU8vTW51SS9lTXFPTnREeCszU0pHbmJVZHhhM1hKcXpMWm5yWXpHTDdyMGFW?=
 =?utf-8?B?MHRFdWtUR09ld0VhR0owandNY0RBK3J1N1N1SEhIVWNyNUYyQmMwRFpSRHI4?=
 =?utf-8?B?TzJ5MG5hZ0I3SXRid2VjSmswUUlMN1RRbnN5c3RQcnNkT3JFQUJUMkhBbnVL?=
 =?utf-8?B?c2pDNG45Y05DOWMvelBTRzgreVJMRi82QlRCbVl6ZnBTTW1ycDJYd0JBaGNU?=
 =?utf-8?B?THdrcVMxV242MEVuTmdwZ3pJNHd1Wms4TFZFMVJ2TjlTM2lIVGZTT0srMEoz?=
 =?utf-8?B?MUZLV2l3MjhtcWRlazNmOUVpeW1vdWdIQVQxdWIzYTJvcWd0WEx3VVRmNm16?=
 =?utf-8?B?RG01dVFvTlphdkgxSHFTQ1pCTEtqSUI1a2RUTDBJMko0WEFmSzBxK0pEeUhH?=
 =?utf-8?B?UytCejZRU3FidSt2K1dMYjdQOHpjN0RtdVVyYksyNkZ3OEdTdmt4RTd4bWdQ?=
 =?utf-8?B?OU14MWEvTEFWR0xRdStTRER4VUFjTkNSTWZCNS8rUXZzZXc3NWdBaHQrZndP?=
 =?utf-8?B?cUpJRzJsL0FhMTNMWW0wRXIxR0h5SHFjWUVwd21iYWkzcWlVRXY1NnE0WFR6?=
 =?utf-8?B?RG9majhKMjZ6YzZ5WHBMZ3hOOGJKaGdNcC9scHltWmxkOVpZcmEvZlNSdE9r?=
 =?utf-8?B?dnJ4QXVzUVZTak90U1NEWHA3cXl0WDdqZW0zSmVEYXhSTWY2RmxKeWpTQkZK?=
 =?utf-8?B?dElrZnNyZ2NsSnl4SzQ3c0FkV0g1S2FDZHJzM1laVVdMQ1B3Yms0R2QzdjVi?=
 =?utf-8?Q?g6SjCp7nkgPZiibm/vS9jUAWACVYG7MG/lQ8/BP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877498ab-33e6-4fa5-75b7-08d971367c48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 13:01:47.7651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LG5szUu94mJS1RPw6ilyEDfhU1Gv6yB8pB8NaGL9KMs+Ovb+MB0KUw/FnSh1/nCSAk5xjlXiv2amEQbsUcTMSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

This patch adds Icelake Xeon D support to the intel_idle driver.

Since Icelake D and Icelake SP C-state characteristics the same,
we use Icelake SP C-states table for Icelake D as well.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Acked-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
[Linux commit: 22141d5f411895bb1b0df2a6b05f702e11e63918]
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1021,6 +1021,7 @@ static const struct x86_cpu_id intel_idl
 	ICPU(0x9e, skl),
 	ICPU(0x55, skx),
 	ICPU(0x6a, icx),
+	ICPU(0x6c, icx),
 	ICPU(0x57, knl),
 	ICPU(0x85, knl),
 	ICPU(0x5c, bxt),


