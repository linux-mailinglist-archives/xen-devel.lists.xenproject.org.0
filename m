Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F194F40F667
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 13:00:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189294.338900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRBbf-0007cf-Sx; Fri, 17 Sep 2021 11:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189294.338900; Fri, 17 Sep 2021 11:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRBbf-0007ap-PH; Fri, 17 Sep 2021 11:00:35 +0000
Received: by outflank-mailman (input) for mailman id 189294;
 Fri, 17 Sep 2021 11:00:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mRBbe-0007aX-K6
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 11:00:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dba2181f-69e1-4b5f-b8a3-f1100c411361;
 Fri, 17 Sep 2021 11:00:33 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-b6cIs-thN3izIHwwUkJOkw-1; Fri, 17 Sep 2021 13:00:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 17 Sep
 2021 11:00:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 11:00:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 11:00:29 +0000
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
X-Inumbo-ID: dba2181f-69e1-4b5f-b8a3-f1100c411361
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631876432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuyVlwQZ1n9cLvqfMjg3BbUkdLGOi0HDaN5Q34aqRMQ=;
	b=K57bYeG3KBdY8QhHH9Vp3dz2R9Aq/MRvrpSqZClyLMNJVSU7t6D/Ts4kZXWEskkKwA95od
	F9uaNjg4QHR+U86DDVXeec3lRHubvj+rLwgPD27p0gv5a94c3lMdK1Jv40nmhtg/zHo26h
	xFaWnHLgZXAcRzpUBoCuSZ23bl/MY70=
X-MC-Unique: b6cIs-thN3izIHwwUkJOkw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYJZ7k/9X7JNJ6/GnKJzg9BIvtA3j4USwP1Ex1TNefCsbHoP0NPKNR3ExXpLS1JVlbtxyISc0EpQ0PMctg1YiZLO+2SBpjTzf72u72Uzfcklu0hm6OZhtS3lMhb57gpkfRlMRoToofI8BClumvvSq4i/1DCUXoJ18BdZQ+5JOy3xDXEwIBv8dAZnrK7YV9Y4T7thzoUUVR0zzWQ7iZrM69Hmu7n6uQh6URtFxc4b00AqzuZ4YzwO8FSF0dF+IFftX5tT7we84/bLHwdJQozds2E8EwBZzP1OwtwNbe28FI8xH+BCO2TsiJ6mM9lSDdrY6jmZ/qw8/Qm7gAUFqwMm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=BuyVlwQZ1n9cLvqfMjg3BbUkdLGOi0HDaN5Q34aqRMQ=;
 b=i5Me0uXErtVNAnAKKchHQHNN/ffI2xdc0wS+m3YraATuQCCiSpiefsr8/QwRDzkc/HEvMfghYBBSpXf6yrvlz28BJnLgfVO5oYAiNNL7UB8JAmU/iaqu/pRqAb38z8/6LnOm1jyrU66mHO7RS0O2xvCxntl/n1qxKAXHRXDb2m4K9IUABVMnE039y4Nh7ElcTCA+zRHK0ey5lD9Yz6kr0QVwyGc4Oz/irjGIZMI+iFQFASzZNRGxD6UwWIIjdKjDkb6LXWDnreMMDh8f+uWZWXoIh/y6dJLWgP/yNzBu5VUQQzkkgzsyjnkYKhENJQPjpxM1X/VK8BF1juXStIiPFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 2/3] VT-d: PCI segments are up to 16 bits wide
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <c0a460c0-9d7e-c015-37cf-4775bdef33a8@suse.com>
Message-ID: <ee538608-4be8-b277-099a-fa82e0b59a9c@suse.com>
Date: Fri, 17 Sep 2021 13:00:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c0a460c0-9d7e-c015-37cf-4775bdef33a8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c89d7dad-b80d-4b95-4a6c-08d979ca5cf0
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70408C7624923F179BFEB71EB3DD9@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xtbHt0eMcwhs/HIEjft8nVeEPQDIuasyXFXMg7NDZAc9rxQ3c7W8YhK6qB3Gb2eUmxltkI4I8WI14MHl/MT4XMFb7fC11iluNXL3r0ivMP/XWs6XcMIMGMLC4UKOr5ctL7SoVrKTCDiUCnFU9x1dyvkVS8mF7+VGZcsvJFumj1CEnVoZW9p9PFdGARq15m7TVyMvyX9K2Lgl/muhTtPD4/jsAnAc9ihFmCaYcgGCHk0lt+qTo9kXSZ1XrW+iBKCErlosef51SllNBtr3ga20xzwf1WQsQglpqjlQzyAob2LO4HmuaJVtZxIyQJ/DX9eNh+jzESSAxvN5SAN0TwJWkxe1kxZLhgcpZ9Gte1Tlvj8juL4sLjfFW+stY1mpwI9RWbmXFKnU4a5Afmo2ahTkKfV+xONhjN05tW5ZAFa8RPppP7pp//0taF5kU/EB84mXia0fmPusFTfQh2/vjZY/Jd6qoGAMUV3c0XCC+5semxblCjZr6Ai7SgHapLaxmOJY8Z16HPS4qhxGSAq2cpAL7OnbmCa2o0r0zH/FQ4HuGCimlMrCLw9W2G36xg1udnlUltZWlUEDdezsnz4KGRlYYErxv4gGERGtHeAfwQVxp0jlR28a1D2zY7dxo1xv9GewQD4YQDxZJPYBTKVjPT7Df6h6RgtzJEVbiTiWNr1BZCzfVphCUxAEUrlJeRb8Gm5SZdFhmZCBoYiC9vNSrl/Cos/SOukEhGPd5rSE/5PcTIU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(186003)(54906003)(4326008)(31696002)(5660300002)(956004)(6916009)(36756003)(31686004)(66946007)(2616005)(8676002)(508600001)(8936002)(66476007)(38100700002)(2906002)(316002)(6486002)(26005)(86362001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGtJTTZxQytYOHBwdlJuTGVhUlBYRnVxNlAzaEd5b2ZiM2RwTjNDcTdaYjJa?=
 =?utf-8?B?NEdXTjl0dlVIdTZJZHFqRVRuQURrcXZKd0Zua2dMM1NvVGdSVW5qRzQ4RXZm?=
 =?utf-8?B?T0tlWE4vR2FCRURqOXgwbTVsNDJlL2tzRGx4dHU2dHZhR3BPUzlFOWhUdmdT?=
 =?utf-8?B?UDVENWxzMEZ2WEoyMmlRcjNLNTluT2YxY2hyUWI4YVd2SzRGQ0dTOUZIYVZv?=
 =?utf-8?B?NmErcDRyVkRGQlpZdkdLRFNiSkhHTlptZDFUdUcwSmxIRnFMS21HcTFxaGpX?=
 =?utf-8?B?bmRMRWJJcEUxNXZMQllQdHNPNzQ4UjBnWjNNaG1zY2kyUjNONE1xSkMzNW5p?=
 =?utf-8?B?aXprQ1pSMTJmd2xjYkdnanBrR1dLMnVuSE15VisydlVpNjZVZkdYa1NsdEVW?=
 =?utf-8?B?cGh4NTBrZEJtbGdqeGhZM3QwTHNuTUJ3NEI3UWw5ZkJPQmJYa1grUXNMMWlw?=
 =?utf-8?B?WVhFRU85bkc2MjNNUUt0V2cxMys2YXdGNllHT3p6ckQ5VEwvR202MGR4Q1Rp?=
 =?utf-8?B?TTJ1NVNtSlBTYml6ZUxBZ2puUjZjT2NUdVMyKzlUbU85YVpGNGRDVmE4Zmg0?=
 =?utf-8?B?RXF1UHNLbDI2TVlUeU1oL0pjcG5zYzFIM2lLSjR3b1cvV1E1cThBZ1RsWHlw?=
 =?utf-8?B?M0dGMVNCdEJxL3AvamFxOFN0VERGV1FSQmRrVzkvUmVwWWVWdmNaVkN1N0Jq?=
 =?utf-8?B?dGgvVHJVK0dTTXZKd3hzNzJjcnpFY1NQekhPdXFMOWcxdDF5M0UzbXRnWlJD?=
 =?utf-8?B?LytWQXdPNTlLeTh3OWovUE56czF1SUNiV2hqTXpBRWttQTFqOUhCNFlPcUZC?=
 =?utf-8?B?MVBQNGtTRGxnaEFXbzVLeHpzdXhDVUhRbW52K014dUExcWlmbmd3NlkxOC9K?=
 =?utf-8?B?emJkdnlUL1VKSks0TlhkSkZXS1lnVFZVOUltZDhrNHphWGhwL1djQVQ0eEUy?=
 =?utf-8?B?eThwbWM4ajRnckMrSjd2cTRTTU1UVStOL25VeTZ3NFpPc3pNWUg2Uzc4bjhN?=
 =?utf-8?B?Q1Y5WUVLeUJvMFNRY0dqbUIyTjhvK3hvcGRubXc0Nm5nM3dpbTRrWk5LV1lD?=
 =?utf-8?B?UnM3TGdmNjkwaVZsdnluNWpFVU5wbm9FRCsrTkhTczN2aFhmV0N4VG0yMmdi?=
 =?utf-8?B?NTB3VmtwVFlQK0MrQjBoSXMrVUtIRFFmZjVBZExKcXBXakF1RzVnL25jYVoy?=
 =?utf-8?B?RTh0aTZoWllDSHlBTmxKMDN2YzFhd2ZvdlU4NHNnaFpkelBQWDRBclRkSE9T?=
 =?utf-8?B?RmhjK3dFNUNsU0lSVzhIa0tMd2FsbzhnWmVpRUZwZ1liT25ETXhYaWVIaUwx?=
 =?utf-8?B?anc4aEhhcll3OUxIWDVqS0txSzdCSkZpRUdzU2xpMzF0RGJGL29DU0haMU9T?=
 =?utf-8?B?SmU0NGx4Qk1aU2JHR0hSVEJGSG5aRzhWNm5XcEovOE5WQzFlN2ZUeGxZRjEy?=
 =?utf-8?B?YThSbmVqbWtENTVGVFFXd2VrZ25oMU1xV2dpRHNFMFZ1bkV0Q2dwdHR5Sm1m?=
 =?utf-8?B?cWJXVFMyY3psSjVzYU9zclpEL1RDSFhldDRmeENvaVhrejNFVmF2UkNFd29Z?=
 =?utf-8?B?aU9qY2dWKzM4dElEL3VGaDNUZGpqRTg1MGUwNlhSaDVNYkt3MWtUQnBYZWRu?=
 =?utf-8?B?a0d5V21Rd2RKcndna0VCSHR0ajM3N21GVm9iakVqd01Za3hTK01qUHdkMWJ1?=
 =?utf-8?B?OEZqUDYrdTgzZ2dCZEoxRSs5OHJQNXpwSThOSTVJaW84bmJ4ZHRDangvNnA2?=
 =?utf-8?Q?8OoWNk7nYOijk6dPXqmX5ASyyUsur1oLKt5lddF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89d7dad-b80d-4b95-4a6c-08d979ca5cf0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 11:00:30.0851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hj01Lu5gQS6Ot+0CwKoGTFOL5UQK4MhZCIgrDQ9K82wYZxGX014HfOp8vcWCA2DUk8H1WEatH5pbNQ2uY1sJnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

We shouldn't silently truncate respective values.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Strictly speaking we shouldn't use uint<N>_t here at all. I wasn't sure
though whether going straight to unsigned int wouldn't be viewed as
introducing inconsistencies.
---
v2: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1462,7 +1462,8 @@ static int domain_context_mapping(struct
 {
     const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
     int ret = 0;
-    u8 seg = pdev->seg, bus = pdev->bus, secbus;
+    uint16_t seg = pdev->seg;
+    uint8_t bus = pdev->bus, secbus;
 
     /*
      * Generally we assume only devices from one node to get assigned to a
@@ -1677,7 +1678,8 @@ static int domain_context_unmap(struct d
     const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
     struct vtd_iommu *iommu = drhd ? drhd->iommu : NULL;
     int ret;
-    u8 seg = pdev->seg, bus = pdev->bus, tmp_bus, tmp_devfn, secbus;
+    uint16_t seg = pdev->seg;
+    uint8_t bus = pdev->bus, tmp_bus, tmp_devfn, secbus;
     bool found;
 
     switch ( pdev->type )


