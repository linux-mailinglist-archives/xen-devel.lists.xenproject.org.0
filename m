Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C734310C5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 08:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211668.369296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMNE-0000mw-VP; Mon, 18 Oct 2021 06:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211668.369296; Mon, 18 Oct 2021 06:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMNE-0000k2-RM; Mon, 18 Oct 2021 06:43:52 +0000
Received: by outflank-mailman (input) for mailman id 211668;
 Mon, 18 Oct 2021 06:43:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcMNC-0000jw-VL
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 06:43:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf6c4380-2fde-11ec-82cb-12813bfff9fa;
 Mon, 18 Oct 2021 06:43:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-HK9oMB9zMsev9JrDuoitdw-1; Mon, 18 Oct 2021 08:43:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 06:43:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 06:43:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0602CA0023.eurprd06.prod.outlook.com (2603:10a6:203:a3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 06:43:45 +0000
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
X-Inumbo-ID: bf6c4380-2fde-11ec-82cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634539428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6RTaJnDpsf+3jxyWaCH4JPBdEEWZCkOkmhH6iZy3jXA=;
	b=Ox6oqHGQ++rTXHMNRLCRt4jbAkSxpxCkrJUUaFvElUc1tleHMuFjuSEgJcGAIn1VCfp/H9
	oV4sFDDcmHY4jbmkTUOGdmZhbdtcGjNPP6bzBQX8cUAcx6lFHb2igbmUkMvt/uV1RgWo8i
	y27gfL2UjrIOXk+rGueSKH+Ta7u/FkY=
X-MC-Unique: HK9oMB9zMsev9JrDuoitdw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQtCReAI+ENiYmID3+qHfozYnPfMAFcXTIRQ6/r3SGzSQMA4PBI8fEb8X8ZHwk5zGI2OSFCu0l8JsZDFjNBJK3DLFjIhOq0ym+LFunKIZb1gW6FBZSm+hm0lVqkqCsHrNzWfBPuEq6YYdZXU6hqU52F77GjjgVGVwE+3VWJRIHCjRkqt3xPyIADDKVoNriWxUTjROlw2jtJtGuGlOS7Uc99sOC89Ypa+sow0Nr/n+KQ8HFHX6JDDQ46+eAG7CKNC5IFUu4d0ng54PRJ3+y6F5YuEDKmzsyYfnSoPy+3D/rdSatTbUdHzw0Uh/vQkAiU2jrw4KFx+xJrQfMsm2j0AsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RTaJnDpsf+3jxyWaCH4JPBdEEWZCkOkmhH6iZy3jXA=;
 b=PIvfPttuiC/JagytyKYJ0B+qSQ2SSvlxY9W62EamaP2R6kesYhJ2f+opRZyDucwSLsv1OrL+PXuLOynsHeDcbqUm/qt0XOc3wR4zabF+4O4dhjjcv64FY9EOJS2RxlOXN/x+iQSaRZk3tzIp5weUY0oBDYHKOamzQoKeDWa8liUuuooLsramKmmOnNvb77G1LhGD4TzGY1oo2WuEz+2EH70M25zStbxbl9j+q/RqKzoQ8EtNlJRjnvl5U/LE7tCzcZ2S26cIvtosiG52zySKN1LCXyUVpkyIdaDEGSAYZxpYP46o6ViwHHADwA1oj8fNB4YNe7IEHlqFStX63g4xUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: correct cleanup after failed viridian_vcpu_init()
Message-ID: <55570db5-3823-8996-f69b-c2b00bcd4227@suse.com>
Date: Mon, 18 Oct 2021 08:43:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 069c3b5b-6b75-4db9-ef3a-08d99202a22e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4847D88017B6B3C5DB9B680FB3BC9@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v6orTniFQbMASZdHuYLVDWB2Lvq/RKBoPD+oMQabJiqPOQk84v0w2aq062Myc720e4L+E5KizTaGRon6pNoTCA5c7bwsXu6DOvxNyHtmDm6dE2E9WaXwNAGwNhqH5nmCbaUl5qRxWdS3czKhvtIUDZQ+POpAvrZaCiQeZE1LIHmNqf8v87QcoT0Ym992qKhJvRFuH1kuNpCT9m2MpuupbSaxz82UqKC/T/0mhBp3X88tBRIdoopoV3f9mZw326wu5Nd30NRE/Q94v0x4znw9mD22j8MFY7vgyHHi0TpS1bDWM6hXmEjXtllBxtJz+XZMdwg2XP4n6X2t1V9qb0gQ7QyVEAsvktQZImpnlmTbMQZ/zThDjnUk1PRKJRrXEnF7OC73FIT4Da2aJgjZov9gMkEBbuvOclvsw1xr1D0nXmAkhWmGwbjhwamki/o+gjuulQBsFl+y6vfY6nSQGtAQ9ChQMxWFYQr0b7CJgOF8dtnk+czTcbInSqxPVyuvGM5nburuS7CByIV3jNp8f+4W9TFHnwe0hcFNnaEXSSpH8UQ3T58vUNqIuItpVyHuVFEdZS4sTw6uVWEfk41qTvBwpLox5xnQD7hYWwwK+yUTaRHu+EqJhhSVMobdY/1FNzKv1oSaJXbZOFhLlQALgvVc4GdcV8E4q+LxVDeoG/yq6PPLEC9k2/5XKEM7oP76hch7vyFvKtCg41x2r6/8ZG9iu9I+xGAJyQyo1yuPPEfIb60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31696002)(4744005)(6916009)(54906003)(4326008)(316002)(5660300002)(8936002)(66556008)(16576012)(66946007)(2906002)(6486002)(186003)(8676002)(956004)(36756003)(2616005)(38100700002)(26005)(66476007)(31686004)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3FpdlUxd3FnQ3lPYnRxdWxwQVRKZDdKZ1ZVdkNacDRqY2xCcmlvU2VibTZE?=
 =?utf-8?B?cEpGVnhKNGd3b20xUko4RUFwSzdtU3R4cXZDVXBQVDhnUVJPcWluTDBIdUVZ?=
 =?utf-8?B?OXVhUmxLNVYveUxSMUQ3OTQ2S3dvek1jeWxpOSsyMFBYZWtxeHhZcDlQNzk0?=
 =?utf-8?B?QWU3a0ZOMWV4K29veG0xNW5LSWJTbkw2aUttTXlvYkpXSStGUktXT05EVXVT?=
 =?utf-8?B?UHhmQ0k3VU40VlhMSVc4bS9ZdC8rbCtTNkZtck5hTzhyeVFBMC9CVThmLzJY?=
 =?utf-8?B?eWxPa3lTNzlDZFp1TXgzRjBxUGt5MUpybjdqdmNIN3RGaE1aOEhHYzdxalZB?=
 =?utf-8?B?dlNTK0tkczl1eC9HMFM5Z3VkQ1M2d0VucTY0amJnYkxnTmR3N3VPTitJM3ZI?=
 =?utf-8?B?OFVSZVNNd3VGWUIvYVRhNnBUQXF1OS8vVE9XYTU3UGNtTEdXVGNRQUczdWsv?=
 =?utf-8?B?cHJMbzVoLzZaUnlQMWFEYnFoVWZPeG1KVDlXaHRMM1Z4UFZWTXJlQzlneHZV?=
 =?utf-8?B?RFlzaDk0TkdadWV0RzVqNnBDMHFSWTVKamhBSVNOZElQSmYrVWJqbDEyL0VU?=
 =?utf-8?B?RzRoT0M0OWRoY0MrWU9CSFFITGpmYVo0OXJ6TG9yOVN3aVhMMi9rb0xvWU53?=
 =?utf-8?B?U1E4MkdFeDRZVVJXNnpockdiU09nTGZPOXlyekxzcGZyRk5hNWtKMDZSMmxn?=
 =?utf-8?B?TDZ0UGtxeGZkY1o3OThvU203dHFMTnRxV0pDVi95K3dDQkY1Zkh6M21HREZT?=
 =?utf-8?B?bFV5bFQ4ZUhZRGRtWitvaHhNN2hNTHBnQmdlTmgyaTdSODhzREpqUk5zOUMr?=
 =?utf-8?B?TmhBcnN2a3Q1bi93ajB5SGtpT0pRWWo1WlhQUFNLQXJIYThRd2l1L0dBeGM0?=
 =?utf-8?B?dlE4R2gyRTJxMWtZbW83TXkwbnZZU1h0S2lNQmZ2NXFRMkx1N3J3R3BxQ1Mr?=
 =?utf-8?B?VmZ3bUdFK3ppNHFKMnhhN0ZndWxoWEEyN1pLa25LK1ZsSEtFaUwrZ3lTNlBn?=
 =?utf-8?B?cEx6Ynl2OTVkZXVtOHlnVTRubkhHUFpMUkNrVStaNjVMMllDRXA2ZEd5OG1M?=
 =?utf-8?B?MkxwZDBTWkpDaVl0bmFqQVc1SHlsWFdaZDd0cFg0KzRRQ3IzelVOMG1RVWRU?=
 =?utf-8?B?WHRKVHZEUHpJL0pLRERBRzFTUjVXZ0w4Q2ViUUN3MTRRRXJuazV2TmxobFV1?=
 =?utf-8?B?RndMYVNFQkJ1UXNBTjdrcFg4S0NSbytsWkRzdVcxMHBvdWZFd3ZRWmtnUm5P?=
 =?utf-8?B?OUZPWG9INzQzNWUxQUJabTRoQnluS0xqV244NjRESFpaYUYvRCtYNFB6Mkph?=
 =?utf-8?B?N3N0aTU5ZkdNZVNvS3hFYU03QzE1dS9WNG9mYmxwdlIwanlxQ1dOT29admdU?=
 =?utf-8?B?MkROcW1XeFNzVWlmcG9QR3VXU0J2RjEzOVdWdlg1Zlpjd096UzA0SXN1bmN5?=
 =?utf-8?B?Q0RWZHRaTTlGWStDb0d2L1hZWDBNamhSYXRYQ3U0RnAwM2lXbVlwZEdyYWc4?=
 =?utf-8?B?QXNwMGU4V1Y2TUlaY2dBWXRKVFBZclhyQ05EWDJiSHZ0YVNvYytQY0FZaFFR?=
 =?utf-8?B?VW8rZXBJQ2cxU2dvZ0diMDExVEZKOHZCVTBpRUNIZ1dEL29ZTTNJeTZXMDFF?=
 =?utf-8?B?VmtoT25udUd3bGZ5L0YvbFZoQlRmbmZLZzFSVmJZMnlWbGpmZCtnMlNNdE5C?=
 =?utf-8?B?Nis4c0Z0L0dxcnZGQ3VYeVYzcmFvTG05QjJyV3plWjA3L1pEYTNJaGVCdUd6?=
 =?utf-8?Q?BkpntRsfeb7NTaLs7k5L96eOZuQSBWGN07CshWT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069c3b5b-6b75-4db9-ef3a-08d99202a22e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 06:43:45.8870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DodYLGA1+0QvW5K14Fv6EWCFnkiz49eOwLOI8W2lOIDZLd+SaZ6A2r5mLo0Oje2iFzBylkHjL38hDMlRqguNGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

This happens after nestedhvm_vcpu_initialise(), so its effects also need
to be undone.

Fixes: 40a4a9d72d16 ("viridian: add init hooks")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1583,7 +1583,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
 
     rc = viridian_vcpu_init(v);
     if ( rc )
-        goto fail5;
+        goto fail6;
 
     rc = ioreq_server_add_vcpu_all(d, v);
     if ( rc != 0 )


