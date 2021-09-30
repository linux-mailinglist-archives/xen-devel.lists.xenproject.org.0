Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2796741D9DF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199854.354157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvFi-0001dx-Dw; Thu, 30 Sep 2021 12:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199854.354157; Thu, 30 Sep 2021 12:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvFi-0001b0-A7; Thu, 30 Sep 2021 12:33:30 +0000
Received: by outflank-mailman (input) for mailman id 199854;
 Thu, 30 Sep 2021 12:33:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVvFg-0001ab-JK
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:33:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 371278c1-16b9-4cbf-a985-0a39ed8ed55a;
 Thu, 30 Sep 2021 12:33:27 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-ctqt8nizO3K9nubEjvT3bA-1;
 Thu, 30 Sep 2021 14:33:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Thu, 30 Sep
 2021 12:33:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:33:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Thu, 30 Sep 2021 12:33:22 +0000
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
X-Inumbo-ID: 371278c1-16b9-4cbf-a985-0a39ed8ed55a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633005206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dINmbKQuoSuwcjjwI59ZTgbgDNydobyH36DWyQ4IiJE=;
	b=WlAIKKVHRalHZB0DwbTf+PUIgvl/v0Lt8tHEYJDFPsTnArvD7m0/au2hFUpNib+kZpPLJh
	+p+ypZlOiQZqfDGaNZM97LurrLKY/pCAnVc/RldhaD7auRSdChA+0zwOO84r1tzw+vDhfv
	bRf/fhP6x9kXC0xgCGawuappabyK31w=
X-MC-Unique: ctqt8nizO3K9nubEjvT3bA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzNZyUHBnVlMrwGfmd5Y4uqUB3rUrE0tAzJFk0dVmWutdzE+lekRPYgv3jDjdVA3+Wk9jgMax6x/cS35wdgAB+csU1XDYI95aANMyV+yJ5bGj0T2Oyw+3fiY8tmiv1LrGrfAEeTR8PGcHQq5zJRHHb0fqjjVWxgVaXXUXFbhHup0fveK9tOA68u51C1UDj8n/ilofh6E1IrC2mnUY/g0XbyD0s1RIclLH4z5ImwjbZmA5eyywt8Ac177KUFrs/7buZRQIaP8hOWdqVBT9YUbzdJ2COXvuLyMnzIfeHkLq206zs+Qw2xTjuCIskpheT4RhYG+CgfegbdYeKh9Z1uVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dINmbKQuoSuwcjjwI59ZTgbgDNydobyH36DWyQ4IiJE=;
 b=a9eKSJlRc1RmDIs8axrWEnaHFRrA/wXsVoVTxo2iyqr4mvwxOfkLLKgN+Bc0cYvsCDBfcHyvL4kgL5iC3cFLGagIKxyDkKcJmM/YDDyjjGxkAK+6l+YMcAvmY27inOiURPwEgSDPEdD7IVo0j1Rnjr/VWKpuLNHDjr0LwHOGl/wqYZzM2txSd5UXfNv1YbOIhPByyMhBDbT2i3m9W/Rf3BownjbLBsDp5eGTTIDZY2bdXWfQ+Ab/2YG3KZ6cWHG3jvAPoCyLLH0p5fswwuo7PEJMu1UeXgBheC9ywxtBu2jRzy3DXjt+bAudY5GaMFOBNz0kYHmx4NMIePka9b+ZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/6] xen/x86: PV boot speedup
Message-ID: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Date: Thu, 30 Sep 2021 14:33:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 145504e2-5acd-4064-9e41-08d9840e7de5
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393332E315927CCE328E05E2B3AA9@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+gk4dW9Mi/6VrXtJN5I+qBA7rRec8OQONkT/feLYU6MPVrQPjeASSk5E+nPUPIk8KQchuwyvjIF0gH0/6bIUwln+dpVKXbsiT9/oBlsggKqtLB+vvu5MpWhB+EQf+X1IyE88j3/7KoDxDpFxX4iI8uDsx+m1duIExdllLwGnbFc6igv99NqX/O5stJIDscimoUkSeU3nN+nVMPnWJi25OGQAtvW+DDmigIUEexUHmpUtmAS09zM8+GS4LcEdh2rIUWygMblw9amIBkPATKRfpJuQEpcg3yuYb87ytvC88tPjzGoD1bKbPAw7onznskS65dl/DPNZ7O4YGj3ifH6WpuGhlSQHOtVe6mHG9RBckRMS76qBUZBsEubbvB4w7cOAcdJyWQHyyxwE5ucVpFqocUm/gtFjF70Hcy2tDilj8tqQzjazP/PM0AnBlJEnqlPLGnY7BWdd/Q/3Ff5VRd2ZHCSF0Q6OS3Cbq0QCCSF6/LLQclwSfQUGONSE0UQOu4r+w8rKo4yzFsw71SnCZ6Z0130/waBw+QHjj84KCf97cpkm+5akP4gnTqhcYyv4God4Hc6yzoYB6aAm6Oyv717Vjis8Fw0LW+eS6cUENaOz7Gh163KvMW2/ouwwqZP9WXMykhFVS3tbCCquk6lPTVJzlEsB1GM9S9nVsRvUuqB7hhxoyOiR9Ew63qHAZphQbHSHNIQdbh0UvqPRchGGNb0W6CNObMC628P7GIg4uDI3v7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(66556008)(66476007)(2616005)(31686004)(4744005)(36756003)(508600001)(26005)(956004)(2906002)(66946007)(86362001)(8676002)(6486002)(31696002)(16576012)(8936002)(38100700002)(316002)(110136005)(54906003)(83380400001)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1hhbkNESDgzNUpoczZ2UHBQb3loeGdSYmc0RGs3WGlrSmJYMWVqMUJhWXZr?=
 =?utf-8?B?Y0dFaE1zWVRiaUg1YjN3L1F5b0QwUzhBVG1RbnBLN3BhZ0pwMG1FdGl5YWNz?=
 =?utf-8?B?RERHL2h1dlpJOHlyaEh0ZUQvNTcyOHMvR1lvU2dNVlZEWmJDd3VZSFJsczds?=
 =?utf-8?B?eWNRWlhTWHdnTFhnOVNpd0lrMU52RlY1aWNjdldmRGZWR2FXREs2ek5MeDRq?=
 =?utf-8?B?VDdiWWdxWTFSZWdrWXF2YTBTQnBzTEtOTFhBcjhOWGdtcGpvTjRVWWszR0Nn?=
 =?utf-8?B?dk1QRTc1YlR4bExEcTRFdXBFRyt4dk95ZG1kcG9HYUVNWXdsdzBkTHdrVTJG?=
 =?utf-8?B?YkVHcVU1Vjh3ZzRWSENPU2dveitwb3dRVFBKUDljc1A2SXBlMHBGZE83Q1VM?=
 =?utf-8?B?TkJ4bjZmRkxGR0pvTHdoZDkvcnM2alZsSkdpUlVJaGVaYXZ6bnRVNXlwMGlm?=
 =?utf-8?B?N2p2bEdIZzJqdWJWUXh5c1JqZVZpVWR0c2M5Ulp5VGRnUlhXMWJldW9RT3Jv?=
 =?utf-8?B?OURaVENVY3crak56TUtRdmgyWkt6TVM5azVoZ2NYV2d3akVOYk8yeG8xcUov?=
 =?utf-8?B?ZFhKWkRPUmRDNXlVVGpNM01QeUcvN3EvVUtPVU9lejljTXVWODVERC83UGcw?=
 =?utf-8?B?K2FTalhKUHEvYXZlQVVYbklmNW4zd0x4bmI4TXdKSCtJNzZaYXE0ZDByZ1lH?=
 =?utf-8?B?R0J2SSthYURtRERtcGNET3M1SWxQdGh1M0N6bmFTdEM1alBVYk1ubytsT1FV?=
 =?utf-8?B?UU1DSGpoTGhKU09Pa003dmdxRXdueG1PL3RzNEVpS1BZRUhBdk5KRXpRQkdv?=
 =?utf-8?B?dzFqTERtL05OVTBsaUV4WEFyREZDcGhybUUzT0JyTlI2cTJHWGViVFpSU1JD?=
 =?utf-8?B?ZXl5V2tjb05KeUsxQ2V4RDRiUC9kdDZuMHNXVUtCWnZuc2xUUnV3MDREWlhT?=
 =?utf-8?B?UTFKNW8reTV3R1dWVnNhYXBSSVpETHhiS2dxYi8zUzk5U21oN0h6WHdaQURG?=
 =?utf-8?B?MXZ5L0xISElPMEIvRUp4ZThJRU1UZkVtM2VqdGdkUTgvU0xWeFk1TmFWQUd6?=
 =?utf-8?B?MkVtbWdXdVBXS2lraDh3Rm9OZk5WeUYxUGo5b1VPalh3RkljaTFGYmNRVVhM?=
 =?utf-8?B?emcvMUtMdGs0S1VPd1o0Z0lCWk8yb1JXUU84ZlR1R0RnODNjdFJveFAzQ0VZ?=
 =?utf-8?B?TjM1YWdFZFVzRktpVGVtUnQ4Tm9tNkdwNTFvZ2dsM2xadWMvRzh2K05TSXln?=
 =?utf-8?B?MnBCNU40SkpCQWhHT29TaGhFSlBlVlBrRXBPdmxlZ1lQQ2pJNWx5d3dsb0Yv?=
 =?utf-8?B?cEptWUd5bXFCa25SUGNMUXVaRzJ1Y2tIb1VHWGpmNkhmNkNQamxIWGdGdWZW?=
 =?utf-8?B?Unc1NXR4MkNjZmpta1hKTlRzVWU3Mlo0d0p0VTR1NS94alFJajRXS3U2M2dy?=
 =?utf-8?B?aVVrTEI1aUM3YkJ0c0FoOUxsb0VpeGJaYWwzSi9qb1JTOVBYNWRxU2JlZUdn?=
 =?utf-8?B?K1N5cmU0UkFwR0NVaFl1TnJRVDlyUkltVDU5RTB3M2IzemlqR2NKZTFSODRq?=
 =?utf-8?B?ZFQxaC9Va2FGY2JSSGxKQ2JFTjJlZFcyWDhiZGhIM0ZhUUhEcDVlL3FlanJx?=
 =?utf-8?B?Z0JwdVpKOEpvT2hPM2pWWFRvdkJScWsyZnl5cUVVZUsyNjdJWnU1N1BGUkYx?=
 =?utf-8?B?RkZZS0cyckNXRFRoanZSaU84OUNnUG1USXVBQm1qNGEzQmc2MElidkdZTTFq?=
 =?utf-8?Q?/PEu0jqNBcW0wPB5oOkUgG7r9lRBGWQexFBtp7w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 145504e2-5acd-4064-9e41-08d9840e7de5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:33:22.7384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDNSFHOsNsp3WrDw566oCfQV4enP/5r9f3FhoSkz9jrndrNJsrXGblX/GtE/ZqLWM+onV+sr75/sAAYkbMQRJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

The observed (by the human eye) performance difference of early boot
between native and PV-on-Xen was just too large to not look into. As
it turns out, gaining performance back wasn't all that difficult.

While the series (re)introduces a small number of PTWR emulations on
the boot path (from phys_pte_init()), there has been a much larger
number of them post-boot. Hence I think if this was of concern, the
post-boot instances would want eliminating first.

Some of the later changes aren'r directly related to the main goal of
the series; these address aspects noticed while doing the investigation.

1: streamline set_pte_mfn()
2: restore (fix) xen_set_pte_init() behavior
3: adjust xen_set_fixmap()
4: adjust handling of the L3 user vsyscall special page table
5: there's no highmem anymore in PV mode
6: restrict PV Dom0 identity mapping

Jan


