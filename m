Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F303F8522
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172866.315433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCNh-0007tP-9x; Thu, 26 Aug 2021 10:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172866.315433; Thu, 26 Aug 2021 10:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCNh-0007rA-4D; Thu, 26 Aug 2021 10:13:09 +0000
Received: by outflank-mailman (input) for mailman id 172866;
 Thu, 26 Aug 2021 10:13:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCNf-0007qx-GT
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:13:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79cce263-1024-4ace-b294-bfdd397adec2;
 Thu, 26 Aug 2021 10:13:06 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-c8x5EJWoPj2o37x-fKw8NQ-1; Thu, 26 Aug 2021 12:13:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 10:13:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:13:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Thu, 26 Aug 2021 10:13:02 +0000
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
X-Inumbo-ID: 79cce263-1024-4ace-b294-bfdd397adec2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629972785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hQa/9SwHdYSmIaKcr2ur3F7Nh9AkGZdaHPjcAeya7kI=;
	b=jEQ+1hnhM4y1xKZa9OYMJOfMrM3iXmN7eBRXY8VFCE3f/g7MEZFflckPL1SAQhRmeOTbDE
	LJ48MxtL1AVdHLlqMPyfmzUVMr/VWmF7bg18MkCqruJBELs4ditiJhrDCH0plh2yhi8BSH
	cOxuyxNl2ubkgN6IyQuM4s5KP0K8VdU=
X-MC-Unique: c8x5EJWoPj2o37x-fKw8NQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oo2PBL+hRbSLfUD/N1JVULL5lDjX2XfNmdJPdrDw3aOXlbMe07YBj4bPYy8S9D6iafYfHUunHQl8CfwtpPMKSDLzs7RutRwGM2wqig0l/YauN4+UC6B19lw4/R3J5rFT9QIHxn6n9xARwh7qiugpgigG+52LzVA3j+tA2Uzg8rvvWYUqcJQb4Xjvg+kSGkOxwPQ+k0yQ2C3F5Lxi+z8dwd4gKSK2jHoSXddCpJOxU3ncOvy3qAgc0r1n35GIwpR8t/cNg1jGVrTv0ywD+nk4Uye22AIJuLn6lES+Ed/pBMaUG2yRkzPds+LoNJsMePVCkuiVXtIxEp0Z1fSkAlanzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQa/9SwHdYSmIaKcr2ur3F7Nh9AkGZdaHPjcAeya7kI=;
 b=TEAIEXK1EqZvTz5cBRyqBW8Bq0eQ29Ps47FDbwdsD1Qrv5Nl9uvTWCTFNTtOEZT+uw08Y6sV3I0l80C2RqwXCGNkFDZtFY1z8mlsbEUrijPsY3XntSHTkhu16o8jk/qoQd+AZKikbAxbnxxR1LOrHH+CZMt0lp+R4tyr0a6NIB+j5g3WwUmg1bwoQVCYv+YQICrDCx6KUut3uMSuvp7xMLu64zixTdg+wZTtY1Hkryqfh67SnDrEahkv4YPdsyj2Qod7GaBPqbPShjGb2ashK07GaDA22vKEUscoFtda+gBU4G8W3X7PJ+hNJfLdWlePMU57jNqIvhkMcvsQkEafQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 4/9] gnttab: drop GNTMAP_can_fail
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Message-ID: <761f3ea8-bfc9-4a8b-7878-2ff9e3047309@suse.com>
Date: Thu, 26 Aug 2021 12:13:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f23ea41-2c84-4e83-25ad-08d9687a170e
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31203FF76C931B76BDC455B5B3C79@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	esao4TVFkHE/TfWCrhbCY/sqBseJZIFkRyZsGW7MMXKAHlETJd/Lg6CQxZ6wT1toi0jDeOpDkc41W3SCuVnUL77XxFqX+6gXRhnbTCa5QT5E6tS/m2W6UQCF+iIWPi0MDIFZCStGLjs7WRxlYv34Lbgh/FHP0mCSJxvKg0iV6/dBhjYifqLa62XlSUC0bUW+Z85l+DbYullPA8tezIJs5P7SbDm+8T6y8s1Lr9M1CQfb2JIaFP41ahOKVOQ5GGdo5f9S+GR785LAiq2ovyCHPdtKI6WALpXHc3ji3Ock3dt7jLEg9VWyQAIPfuzDfsdq9lz6Zo5GegKqHJhzeOWs0jgjKLi03VOp2KPyhi8r9MZCei4CrEe8K5mUhjLU5mGPDjrD4Eq7KtOu4Q8YBf3bGeKPBYpUQdsB2rGFKybh7ElymhgjWB2Hr60aD/E95qoTBCNkFrBvhtjgqJVQwn3ndRtdvsO7sVpaI0uNgrAaa/7Nl74/8gmKU5ZFVIWFm6Sez2QCU+oxDGj/mdmcPM4B0svk2HSnX2trrBjLcV7+CVGaXGB0XBsh7WTd6JpSFe8OzKDu9Aaj8pn14HYZmHmypk74dWmQsKOpmKH6+vytE/tXnBJ3jneNXyYubdDUFF7DFgNr5yap5IyyoWvxNx+TuOD6zz3fGVZsk5gs+FY7jXLDtA0cCvmV1y6jSl4qNHfNwhT2xxK+CFenXi/gZi1uZBbpkxB7+svEgQPPsD45Dsg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(136003)(366004)(396003)(346002)(956004)(66476007)(38100700002)(8936002)(8676002)(6916009)(6486002)(31686004)(5660300002)(66556008)(186003)(36756003)(66946007)(2616005)(16576012)(26005)(316002)(2906002)(54906003)(31696002)(4744005)(4326008)(478600001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEROZmg1aUxwZTZQVnc2anVuWU1OcVNOVGtvai9TZUs0TEhoa2ExbFJQV3JN?=
 =?utf-8?B?K2JBR0NpclhLNXdhNVYwWHUwcUJtRjAyNDFjaDd6MDBqaHZlYVRXMFg1Y1Vo?=
 =?utf-8?B?Qmp5aUdxY3F0OUdkdmM4SGJSVktiRHdXM2d0c2VibEFhTml2eXJ6M29TYW1G?=
 =?utf-8?B?Q1JUaXpablUxeCtTbzBUemlqNzJWcFVtaGQwWndJeHQ3M2tSRWo5RzYyd0Uz?=
 =?utf-8?B?Zm03YmpWY2Mzc00reW5OUGp5UE92SmswajFQLzFTZjFEaVQ1TUh5VVhhU29v?=
 =?utf-8?B?QVlYZE1lc09QaW8yeXpvZU5naFVPNjFUdFh5ZkNhcnB0MmRUT0V1MnFPR01F?=
 =?utf-8?B?TmlyMUt5bjNxZzl3amFjTk1QeFpMZXpjQ25LaEo1Wk4yTFc3RktqSGE5Ylh6?=
 =?utf-8?B?RGwrYkZiM0E5aC93cHNlZ2lVVzczS2ZsSG50WE9qMnJFaGYzc3J4ZkpWZm1R?=
 =?utf-8?B?OGxycVJqZTI4VHVDZFBHV3l3b00rbVFheXZzYmFYblZwMGltTjRwSS9reVd3?=
 =?utf-8?B?M0Y1WEFjekt1djBOWHlMNzhzL1RqM052TTBMdjhUZjRBcHRxNFBrOFc1WHE0?=
 =?utf-8?B?TWxLSWgybEhFdlR2K1AySkFkM3hSZURGWFk4bHJGcVNoQURpYXZJTVpvYTJ0?=
 =?utf-8?B?LzNzRWlnUHRxQStmYUtITVcrVXp5azdSdHhORVdlWDFFK3hXVzNIVURKZElk?=
 =?utf-8?B?Q29uUGNwZm8xSGZiZGtlandGZStkQ3FRSTVha1VuaDkyR1B5b3gyMnFac0VB?=
 =?utf-8?B?NmVVWkNrVUU1V2p4Vlp0RWE3eElHSW55OEwxd3VNR1A4azJ0UGVWV1FzeFNh?=
 =?utf-8?B?cmJQdG5uS2FEYU16alpBQjUxVkJyWU5WNVUrZFZXZ05Uem1wUXRuelRmQkJ5?=
 =?utf-8?B?QnJGaHMrRDd3c0o0K05Wb2Q2ODJUVFhybmJhTjZISnlTYlBxMjVxVWxYVVNV?=
 =?utf-8?B?VDNQbTY0MlRFZTd2SFZlSzZObElySURjQ2E3L253VDVodkxYUHE2RFhMM21u?=
 =?utf-8?B?U3VacXowT0dZSTZZamptTXdMbk9oSDZUNllsYVZwa1hyejdpT0c4Z3NEaVEv?=
 =?utf-8?B?REdtY2Y4WHNhVWhrS04zcm9HbXB2UWNTT05YNUJoNWNiWFI2VjBDcFYvWW42?=
 =?utf-8?B?clh0SXE1WXJGQmhNOGh0TklSV0kwR3ZSVXd6Q3hMWjZnWi95ZVd2R21rWmh0?=
 =?utf-8?B?dGx4REJwenBWWkVyOWgvQ0NIV1EwejdzN1BGRVBLK29JcnI0SUFSS1AxQnl6?=
 =?utf-8?B?LzhQcWpFSzVPUmlxSXdBeUY4OFErZ2ZJYzREaW1yaUwweDJySXNoQUFzYnNY?=
 =?utf-8?B?M2tZK1hTQzFTTHJLVkh2QXl0dkhzOVIxdEhzbFpBN1FPSTljRVlIMWk2VGtW?=
 =?utf-8?B?Z1FzdHl3VEEzcUs4dWJobXdhR2hPS21kZDl2Uy8xZzUxU3Q0SzMwRlpyZjAy?=
 =?utf-8?B?SlNqWVlza25uMnZUMjAvZ0cwR3pyQzB3eHBQSDI5Ry9iNEFSWFBFODZtOEVJ?=
 =?utf-8?B?RldDM0pUMnRXejU4QWd5RTBZUnU1SDdGRkxmVFQzWHR1NEJjRHdIL055eGFw?=
 =?utf-8?B?NEFBd1UyNU4wSi90d3lRVC93d1BDRFNQV2pTUllzanA3anAzb3RjS1g1LzFv?=
 =?utf-8?B?M2Exb0R6UVhQMWZndHlZM2V3RnRneS9oNDJ1UTJKR3RyQUVmT2g2RWtlQ2lj?=
 =?utf-8?B?a082UEUxWkx1L1Q0NzREWElXNFdVamJ4aUxyUnFndjhQcGN3WmU0M0d0R3RP?=
 =?utf-8?Q?Pm7ui7FCA7KSuwVQ0auyIurOr+Cj3U4tJ5XUGje?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f23ea41-2c84-4e83-25ad-08d9687a170e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:13:03.2587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7hYJu0tpdQ1P3/ez0akFyNwuruyNALGBh8tVvnWDiQyWLvm/gvgDDxZ7I5VtK7g/MZgd3fZGyLvC0FWvvQ9Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

There's neither documentation of what this flag is supposed to mean, nor
any implementation. With this, don't even bother enclosing the #define-s
in a __XEN_INTERFACE_VERSION__ conditional, but drop them altogether.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -628,9 +628,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flu
 #define _GNTMAP_contains_pte    (4)
 #define GNTMAP_contains_pte     (1<<_GNTMAP_contains_pte)
 
-#define _GNTMAP_can_fail        (5)
-#define GNTMAP_can_fail         (1<<_GNTMAP_can_fail)
-
 /*
  * Bits to be placed in guest kernel available PTE bits (architecture
  * dependent; only supported when XENFEAT_gnttab_map_avail_bits is set).


