Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77293F830A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172694.315125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9hq-00062I-HJ; Thu, 26 Aug 2021 07:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172694.315125; Thu, 26 Aug 2021 07:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9hq-0005zb-Dy; Thu, 26 Aug 2021 07:21:46 +0000
Received: by outflank-mailman (input) for mailman id 172694;
 Thu, 26 Aug 2021 07:21:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJ9ho-0005zV-Ut
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:21:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4363dd9e-063e-11ec-a9d2-12813bfff9fa;
 Thu, 26 Aug 2021 07:21:43 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-1Fl3RP9ZMlWqEjUZnXP8xA-1;
 Thu, 26 Aug 2021 09:21:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 07:21:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 07:21:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 26 Aug 2021 07:21:38 +0000
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
X-Inumbo-ID: 4363dd9e-063e-11ec-a9d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629962502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GoVpa6yo1+kqij+kyNC8NWRYKew0xeVGaGvImNjjnKY=;
	b=ItTvqhR7IjPTBEGM9S+XVozO2t0N6ibP09ke4OHyIYWnz77A04kuJ9ewPvF4wyeMRL8gTe
	1A7FbJ3TEx42AqIayrktQuax3F1611C8dKcfFEy381kyIoWlRGbrLJNBatJ2nhsoDzMwmD
	pYM2KGEeBBMDLJWv4LLkI5Lrj7AnFUU=
X-MC-Unique: 1Fl3RP9ZMlWqEjUZnXP8xA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENzH9yS6PesDTLC3Lx+4FUNqNKR/p5rmFgDoTXvqRrm1d64rhoZ7aJ9u+C3lCri8qb1VnrFSKTa2iEqPhJ6pVqJslRdroDVD7iE7VJ3ATAxkX7G1nEFJi/tbAvylVuirAHY6JnsB4BgfSTjKEwyMIPVhOM2jbQM6opEOjONzwqYkLffredxTOFEd+qguOOA2g9IvCr0T8QBwFMbtreggHzyVz+34a7fl0Af6DGKTULz1Mp9ydiyLnHO4kWjZ5ucx0gPZMa5w8KZ/c9ZMzLov1j7eXDFGBs/UtUFlYe4xgveqyrNGzjBHL6tTFJrtf/ZXNhd2cCgTxJ6h8sbz9eiiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoVpa6yo1+kqij+kyNC8NWRYKew0xeVGaGvImNjjnKY=;
 b=l/kWjkCrHY15W6IrAYBF86uxYdsEq0X7yWTEH9fn3GcBF4WdxsrIq8Kb61wTosj+jUBQR5cEBcaQIZfY/7XnDzwgomAExfgWa/ooBgUaKL/rb4YEBhBGrw9sWusmwp8lBijrzBXIp/nVgw6buO5k8VYAerrYi5zNrQbpnVtA8DIlUbg68m/T2PH75rrwsTC3eBcyg3JTQnA46qI1qwqUj2utHs4kzFvZy34vWqEFtSheR+RtIFx55JMhEH5nG/ESH3FAPVtJ/e3L53+MYn13LhO9PtxgZH4VDlpAn1pw4IH234TaSsoOb6j0JMSemZyOWFX2zTcvDE126wEhyWFF7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7] AMD/IOMMU: further work split from XSA-378
Message-ID: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Date: Thu, 26 Aug 2021 09:21:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0017.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45caf0f5-9ceb-4cd9-f579-08d96862254e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304A45027EE37F1F600AB2FB3C79@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LAELJp3XwXPxkCtvc0Vev5bk3VYF0stMewB8spa8dAkVVYHuFjYcNhOrC52gxwDgXwV6yNwf1cgcSvnH5Z8rfOEW/fo4GsedxBFtrGj1aWZ673ditOjyKAhlrKm12zHPitF9jhon0/1qDoEKR5tZmcbhmUOlR0tL0F/b7RtTuIFupse4tR1/ehFVw/DK23NKMZCqO/ibNTa+hmiufKlC6vcpMizyh+Wpg4g4W8eLOiQup/6a/JWyZ6yHpJACqMw+QDzx/NDUv+nRIDUYFsYW8rtmtMwWC0kctARnSWgWiHDQJBdFQs6rEni25kkUL//J+7t/NPZvVJvmvpO49izkLv13v+0qv+nAGTSEJk03Y49YwV5gKM91z2Oecm4IisknA5aMx0YTKkLHf8SkJiuBhgNe3SRTI/AA97TGIUtDf0gLecaiCtdke27lHvOJIn33vaSyM1m3inPitOHExpVqdUpRQKTqZ46FBKAuvjspv1jV68tYForxniQUtBWYGY48k9I4ZFM7M71meoR8iO26bvpsYBqGxV5HErjdEBiOhDi8dDO1+VyPtcI/njZ9tCEx7khISNZMtklPJLc9odDL3z6MXEbG+RKmgdXBeCH9nLTXq83zu4WH9q3qmRVpsa7N1rkwrZVWEpVOSCn2g2ykM0XyIszrg8C9+5IdWgfXUiR/5h9PqwjYjZ3g0DS+e1Od3FTZJWySUGm4iQ9Kgp5/pfEuUZcFkg6b2vxe/skgHIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(186003)(36756003)(8936002)(956004)(6486002)(4744005)(498600001)(66946007)(66476007)(66556008)(8676002)(6916009)(26005)(4326008)(86362001)(16576012)(38100700002)(31686004)(2616005)(83380400001)(31696002)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVhuZktiZ2pORzIxYTFmZTk0Ynk0QlY2cmRqL3ZqTWxkM0FiZHR4RFhWRGhw?=
 =?utf-8?B?NVFEVVJQbU9EZjlxSjJqUW1kNUhDaUt4aWZIeGpBUmZVcU5NRkpzZk1RN3Jp?=
 =?utf-8?B?ZnFLMTlJVTZ0Y3R6QVFNSGZSM05LcEd0VFdWMi83ckJqM28ySE9VSTZQV0F3?=
 =?utf-8?B?ajYyL1hvc0dhMnZWYUs3VDVydWdpbTBzUEFhNVUzK2x0MEg3VWF3UEhodm5x?=
 =?utf-8?B?TlZJZkE1cUplbTYzVjgxSkc3N3llMWtGd1VrNGZrM0FtQW9EWm1QTGRFZEpY?=
 =?utf-8?B?UUw2SHptSlR5TGFmMyszblFEbzViY0xnV0tXcXBkeW5YdG5FODEvS2phenc4?=
 =?utf-8?B?MVE4WmJ0ZWZsSWlocnJkU0szSDY2d1kvRVU2Qmx6R1YweHVqUWd1TlhVbklE?=
 =?utf-8?B?UW9GODI2L1hvV3Z2WnFZMzRHcHRNN3FPNXJTTzhnOFM4Q3B6YmpEM0RLbGFK?=
 =?utf-8?B?NXlYKzk5SkN6UnlLMjBDL1lPK1VuVzhYbHB5c0ZJczRFRkIyZEorR0dnVEcw?=
 =?utf-8?B?TlhOQmJGMkRzVXVPZGVhL3Z3M0RwekpjYS9nMUt6SjBTSjFRRXdNQ3d3aFU2?=
 =?utf-8?B?ZVUwREtHV0FyWWhLaHlnODQvdDhRNWxKeGFLWmN4VjlOQUZ5MnVKV0JIMEhT?=
 =?utf-8?B?YXROU0JxYU9wZElMZG8vZkNKNXRQMGVHV2pma2loVDlRMkVUU3E4enVqS25s?=
 =?utf-8?B?NE5Zdmh6UE91a1h5TEY2Q0NIUDNmM1JpRlBJVDZ3anJnQ1FjRjVBTEZ3NkM3?=
 =?utf-8?B?QVB4blBMUG9FZTFyMEF5K3RXdnJQV0gvV2tILy9tMmUyWElkTWNJcTZnalRW?=
 =?utf-8?B?NGtvTGs3UW41cFo0VDNRaGlnMUZkVkZiSVBYTmYvU25EQ0hHcCtOTWZDanI4?=
 =?utf-8?B?R1pZUndDWFd1b3ZtSy9NemlMZmFqYXZDRlYzUDJuNU1yMVNObWx1Z05QcFpZ?=
 =?utf-8?B?UCtPNHdXZkFSOXJxUlVpMEx2U3hJUm05VUlVOWcvdHRqZ29pT1lkRFBlSjF4?=
 =?utf-8?B?TXAyRzhYakpUeC9KMU9ab3ZmdkR0SnEyb0pXTm5ZMjhsVHNSc05wbFhIcmRl?=
 =?utf-8?B?WmJtZlE3K3pMTnhLSERUSWJkcU96WHl1cnlLMWViYUozdmhxaFdzNXY1TjJO?=
 =?utf-8?B?eThuVG9yVlNhTFVRQUw2UFc3ZFJad0RUZHBZdXNxcEtMVENMOU8raEFZVGwv?=
 =?utf-8?B?UG1Pb201OGZBY1pyVExoSFNpeEloUUZrRDNWSytGK2Exa084YmVnYzh1VWZK?=
 =?utf-8?B?bXZYOENtZE9oV3h3Y3hLMU40VFNOandvLzU2MlZ6S25SMWtYaG84cGE1UHJP?=
 =?utf-8?B?dkQ2b1ZMSlVGT3hHaXVtUUlpQWZVYzV0YjZDZHk4bktiaGdhNTFQajZXK1F3?=
 =?utf-8?B?Vm0xTnZ1ZTRnRWxndm5reXc2K0JIR2ZVSjZVeXZIVVZiMUM0Wi9jWU5WM3Z4?=
 =?utf-8?B?TjkyQ3lvMEhwRGNiMlVXV3l1QWxDQzF3ckFydXRsWXFTaW1KNzdCYmlaS3Iv?=
 =?utf-8?B?N1J2U0JBYlJ2V0hOV0ljV1V4by9xRnVINHZqNVRnM1dBM2ZzTnJEOFk2bWlr?=
 =?utf-8?B?UzBUZ293dmxxMllHeFgxNGNrRW8vRDc5ZksyYmxaeGtPaFRBWW8wRm1mTTc2?=
 =?utf-8?B?REcxTklRenV2aytyRWF6VHA3MlFVcnE2K25HclRGL3RlUklQV1BJQmZxbUxk?=
 =?utf-8?B?YnBTLytGSVBpb2ZVNUFKMERsb09DOTk2RUFOVzJ1S1JXMnRTZlhkVnN5b0VX?=
 =?utf-8?Q?hE7SM50Qo1FelSr9aEAYx9iiLyJ/lCy74khoSQh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45caf0f5-9ceb-4cd9-f579-08d96862254e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:21:39.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCRHuVGJiqbeRMrNlO/G/LCX8ZOT7T2e/+WCcM4D38BSLNDNemZq5RzsJLFzfz7uMA04fWadnPqQ6c1OjLXBIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

Along the pieces that were determined to have security relevance
there are quite a few more fixes / improvements (or so I hope)
which were decided to not become part of the XSA itself. Hence
also why this is v7 and why several of them already have a
Reviewed-by tag. Here we go.

1: check / convert IVMD ranges for being / to be reserved
2: obtain IVHD type to use earlier
3: improve (extended) feature detection
4: check IVMD ranges against host implementation limits
5: also insert IVMD ranges into Dom0's page tables
6: provide function backing XENMEM_reserved_device_memory_map
7: add "ivmd=" command line option
8: respect AtsDisabled device flag

Jan


