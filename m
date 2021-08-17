Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10B03EEE57
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 16:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167888.306515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFzvi-0002GA-KK; Tue, 17 Aug 2021 14:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167888.306515; Tue, 17 Aug 2021 14:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFzvi-0002Dh-GM; Tue, 17 Aug 2021 14:19:02 +0000
Received: by outflank-mailman (input) for mailman id 167888;
 Tue, 17 Aug 2021 14:19:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFzvg-0002Db-Ow
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 14:19:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3aa3319-bee6-4ffc-b35f-7b021d9d1ade;
 Tue, 17 Aug 2021 14:18:59 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-_O-m-UZNO2qNlLKNRE1WRA-1;
 Tue, 17 Aug 2021 16:18:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6669.eurprd04.prod.outlook.com (2603:10a6:803:125::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 14:18:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 14:18:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0145.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.18 via Frontend Transport; Tue, 17 Aug 2021 14:18:55 +0000
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
X-Inumbo-ID: b3aa3319-bee6-4ffc-b35f-7b021d9d1ade
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629209938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Y2rxcoZFOXHVvpU2N0ib2jFMGgi4FKvKeff0a1h5Ag=;
	b=epmO4QARIAvSyBVhViVG4oT7ZUFUvq4w0C4KR/HHL8WIlfZ7a3xUsIh4+nJTzs6D+ntF4w
	mjLbGdKZwtW7b5fwGut5DJgWtwkUfnZqSZr8KMu+cTGIoaFhGG1rqKUVcsG0tpVGg0dq+s
	sVhD8zWBcdUDScjzG3L0ylfrRQgx/xo=
X-MC-Unique: _O-m-UZNO2qNlLKNRE1WRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlRhZwCUVk8n09e/eQMMcCIkJURTuj9Z/WYejbmY3eEcEsTOBSz5UiCed7kQeExlRm2cTOxHR1ptmaM04WMp7NnBvmSaziFWtjuRmMDDQECYuMYNeVfgKN840wqnjOsmZkxZGvwxhbDDZst5xXU2AV3d3J47+h1K6GW9Tzn3bHBROIGTS7Sy55ANkKnJzeK5HpUv4kq2O9mz9wevZIGSwD4IorQrv8AqEMdSqZJiO9PoG2seuVVsB+angJHEWx3kAl+hYBliVxqwUfvX6sBCWKgSjFp3/8KSLYPwPQyG+XaI7zjSYzt9ujtzCqmxfTn6DeDeR3L06BbffLUGGSuFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y2rxcoZFOXHVvpU2N0ib2jFMGgi4FKvKeff0a1h5Ag=;
 b=S5Z5wIrK9R/XwdtefkMepnj/5Eg4n6ae391FL/2wKLvQuBUkYt22okMn8lUtdIWEJ0hQ2rDsjM9LHGO+LhSIvRT0cXT39UTeXthdmeuESRUa2yVzl9UtpjJCZa6tlLYRtXkun5yGHC0Nh6dpJJNpI4O8A2a2nqLb8bNJqmg7pbkiIiq7IipENpinATsQ35WS9gA7nxHkrmWKQPo/wY4ew4/PINt4jVbULZn8DPb9H/iQvBeiIGvtuR43y8Soldl/JdCEF+g8jFEYBF/1NxHvMcAnVNDZReO6U/ApW20izSIsVTmEYS4w3QH2bMWGmSAQSHfxsT27ZTpB2n7PZvv1qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] tests/xenstore: link in librt if necessary
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Message-ID: <3efcfc3d-54c8-7308-2288-9f57ed0fca0f@suse.com>
Date: Tue, 17 Aug 2021 16:18:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0145.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41223837-8510-43eb-c31b-08d96189f2af
X-MS-TrafficTypeDiagnostic: VE1PR04MB6669:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66695A716ACAFBC7713B30DFB3FE9@VE1PR04MB6669.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4s77wLwM2YYvquSAjVGEkeLwAJZoBfi89OH4Hf1uWM07mbSUOgjm7SGz/r+5ApCtOJZBEnN3YaKCjMBoITTjDGIwrAzYOsGp0aZYSInsw5II/LmdhE3TOFH9jK7DiH0Sq6pLyttJeqEJ+4SZhGFc8w5xDcDYSUlf4ifx2skHhIMYxTqBN80CO4J+iBAvLJggF698lpQRdSteSXvo9L2DXO//AsZGk2T+D9uCbAQGnR9YOxAe212LoEl+s200xpDAbkUJl6CmzXTaPF5tjuTcSk/ZuoiGK5zEYmRa6iamIGvWblrdY0RPiY/OBh4m+Rpi1Y117XFcmG9dL9GvSxd0JJj4/UrPuO5igCRmm3U/ucIpMXvRvmLvAri9NBDoajiviAjz7q6wOjLgYykGuJSnSO4uQIat/Ko23Ul/nB5uZJjnplKsHjJu08Keh8A2Sv7fEv8NmsvXdUWXoIxZVjuKA+6ytS9Tc1FXSfd/hETYu4ZapiNSD1XzeDMDtdH/pmcFGqQpDbgcAmiXGeG06vvxRPfKeEgQlY8P8khUXl8OuphsOHV/ggBbYV7VAYiHrzmOtpfuOZGbYdR9H5sK9bIYDrzLAKi4VawJEnjBewNGZ5lebN9yVlTG5BkMsWnI4LbLruHbWr6FGr5rAt7rx0RPpNM7LssCWn7ylvnAvmG76CSJ08d0xdT2va3h8ZXQXXKTOMzhUYQ9Md5acrU5syjn+wfYmrmogIm0aP5r7+ez34U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(376002)(136003)(396003)(346002)(31696002)(8676002)(66946007)(956004)(2906002)(2616005)(38100700002)(4326008)(8936002)(36756003)(66476007)(86362001)(66556008)(16576012)(186003)(4744005)(316002)(6916009)(54906003)(31686004)(83380400001)(26005)(478600001)(5660300002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkxZNk1hZ0tkU083ckdOc05iaXdmMkoyZFdCNldiUHZicWF0eVVxTXhnS1Fx?=
 =?utf-8?B?ZlVHZFkrWUZUUFZ5cHQvT05EeVpUSEZqTGZXQWtGSWVVU2w2U1h4eXlFcFM0?=
 =?utf-8?B?cFU1Q3hhUGxTcXRqZlFKMkdXT0xJSUIyTEIrdlFtZ1I0N0ZRT1ZwZWIxODho?=
 =?utf-8?B?cDBBT1N5czNjV0RlRzd2ZndYdUYrV2F2R1JubnU4WDIrWmExWmVKeFZIMVpZ?=
 =?utf-8?B?QVAzVmFodXJaWE0zZGJNRFBJZkJscHBxTUVUR0t3L3dLelhtZkNoQk9IMHdO?=
 =?utf-8?B?Qm5iRDZVVVd6VFFSbmRLTTcyZGRMY0FjYlB5dWRET3BlenRaKzRNdUY2K0VE?=
 =?utf-8?B?Q1pRblYvcHZSS2IraFRlVWlkc1F2N25jd0JrZjUyekJZRWNkMUxHa3h4Mzdi?=
 =?utf-8?B?WXpodnBKSkNNM2NFQkNvK3A4ckNsYk5UUlpKbTFTTHU2ZEgyT2UvdjF2ZElS?=
 =?utf-8?B?b3BiY0paSjQ2aEF3SWNHVTNiMFB5M01UTmJVREhQZTQ0YVN2VDQvU09YamU0?=
 =?utf-8?B?bGRPNzR0YTJIOUtsUGU2MEZIYnVoanlISlA5SmR6c3lxZm81bUtjbzNnUmtX?=
 =?utf-8?B?QW90elBDQkROZXFSSDJQTmRXYytHejgzT09UR0YxbzlPRm1sRjR6cXB1eUsy?=
 =?utf-8?B?NHYrMW5vaHpuV0J5YmFodXEwN0g5alhnR2J4cVE5MGM0S2hncE16Y2RSdnNC?=
 =?utf-8?B?Sll3S1VZWFBKMk9qbjZSbG0xZ1VFenZhRXk3dWtvTzdLc3UvMlp1RG1uV3J5?=
 =?utf-8?B?eFdEMlNKUmlETWdwL3NTU2RDWkRHTTNQYmxMaS9FUThaU1czZ2E2K3RxelYz?=
 =?utf-8?B?cEp5M2FLT09TM0lZY3F4WFFUcUJRREJNNFQxdkJZRGw3VGQrcFIvbHhaVXRt?=
 =?utf-8?B?cnB0QThia1VEY1Q4LzhrakJaRFh4aDI1aXd3NGM4U1gzSFZhNEw4eG1QTEM0?=
 =?utf-8?B?MGxXZ1F0c3BQUGp6VDJLb1l6VERhR0ZaODN4a1Q2T1BvelpidWJSbzBSeVNU?=
 =?utf-8?B?MjRJKzE5cXI4VEFIdVVTWGZVY1IvYmtiYVd4dGNhbE9Qd210RUZZN3poY0VM?=
 =?utf-8?B?TGdrVjE1VkFEaTc3bmlCeTVBYWpibEtDRHhJMzNoR3o5T2NuNXFrRGNBZi9m?=
 =?utf-8?B?MVJVaktXYWNrVDUrckd0b1dDQ0lkemduY0YyRnFucU4xQWpWWlpML0FYK25N?=
 =?utf-8?B?SHg3UXpOdWE2QkphbnNzdGptOU0wR0R3ZzR2OVpOTTQxSTJ5UDl4R1JKcldK?=
 =?utf-8?B?bEtkb3dlNEl6Z0hYaFEraXQ2Q0tBSmJ3bVo2STBhU3lNVWtTTi91WjlSdHR0?=
 =?utf-8?B?d1FOOU1uNDlKL2ZablNONkJiV0F0U1NBcW56YUVONkQ3Skd1eGo4U1dYMktG?=
 =?utf-8?B?U2N4RERmZ2NNWkhJN3hWNERWM2JGREhxNmFxVzBuK2hnLzhjZndEVFZkWW96?=
 =?utf-8?B?N2ZnUXR5dVE5ODZ6M1dLVU4wVWpJbGNYL0tld1M3Qm1tQ2NYaG84aHdrUzV3?=
 =?utf-8?B?RmErTnRyTlY2eFdQcS9rTFFUdWZDclhOOFJmOThPcWNjMnZuRWdabVVQME1u?=
 =?utf-8?B?TnNUMnR2K3d0UiszSHg3R0tNN2ZGOFhoNDhjN20xd0tZVy8zcEV0VFY0U0Fs?=
 =?utf-8?B?dlFPQlFtWEJQS1ZPMi9DZVQvWGVNZURjVmgzVnpyL1BEM05ZTkIzdXdaNkRx?=
 =?utf-8?B?Y2FRV3pUUys1T01DdnprR2pmekYzNjF0cTlINEV2YVplZy9NaUw0bWFicHlJ?=
 =?utf-8?Q?dRBex5PNVj8ud9baOqhdR63ddC6SEWNqOZxp9XL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41223837-8510-43eb-c31b-08d96189f2af
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 14:18:56.0434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiOZPwpSYRY/biFhCDn/30tphGebmUa0cRITdi0DNFfPZx1hXvg+xpFGWlfAWLGp/Nnq16B/+hJShWQfM5UYHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669

Old enough glibc has clock_gettime() in librt.so, hence the library
needs to be specified to the linker. Newer glibc has the symbol
available in both libraries, so make sure that libc.so is preferred (to
avoid an unnecessary dependency on librt.so).

Fixes: 93c9edbef51b ("tests/xenstore: Rework Makefile")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use --as-needed and put last in LDFLAGS. Restict to just Linux.

--- a/tools/tests/xenstore/Makefile
+++ b/tools/tests/xenstore/Makefile
@@ -33,6 +33,9 @@ CFLAGS += $(APPEND_CFLAGS)
 
 LDFLAGS += $(LDLIBS_libxenstore)
 LDFLAGS += $(APPEND_LDFLAGS)
+ifeq ($(CONFIG_Linux),y)
+LDFLAGS += -Wl,--as-needed -lc -lrt
+endif
 
 %.o: Makefile
 


