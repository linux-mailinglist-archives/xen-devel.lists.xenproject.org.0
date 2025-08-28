Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058B4B39EEE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098830.1452784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urciB-0004fC-B0; Thu, 28 Aug 2025 13:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098830.1452784; Thu, 28 Aug 2025 13:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urciB-0004df-8E; Thu, 28 Aug 2025 13:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1098830;
 Thu, 28 Aug 2025 13:30:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCus=3I=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1urci9-0004d7-HI
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:30:41 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3002a8f9-8413-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 15:30:39 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DU7PR03MB10945.eurprd03.prod.outlook.com (2603:10a6:10:5b2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 13:30:35 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Thu, 28 Aug 2025
 13:30:34 +0000
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
X-Inumbo-ID: 3002a8f9-8413-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJ2o53RPn+iZP6K3L2wQsLZGvjuuQbrgBIFp7ZP7WgTwMY2hIugmi+zgnK0UHhglq2A0wOIwzLq/g0a8JGlwqUayq5k2rtXaTF8eUqK0lg3+KlfjmKarILL7ga5wSaxpgUvW9SzXh/ryNlBZEwGAKj43Ih8A0MbbNBw39ThWIn8rW5hfmOeDgCJglAqs3V05bk8jBe73HR++q4z+RgdS8t5xt3p/XnUuj2f9XUZafo5Bp7rU2oQfbui+EioACqneFK0my3ePlWeCpjy7cEJn23Khekvn8G6JagxA2cSO/1Kmcyy4n8zJTi5uHP/+sThNT6bmj2N78HnzanNZQHqmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rm0yVg8vleStWIYb3XGZ4+MQnADbqmPVnNiSbaXYdfQ=;
 b=xi27NwpW7wpwXZPzyZIrgdigBzRMnZSZWwPFnp+41pTgyWtuMiSSeOQem+QcnqPIp2IE6f2mneauIBrjf5F5swKsdj2bQKWb18Xfwn2uiWc+jpxY8DhLdJZMQ+4S7ukrplRdq+kvzIsWFIN/9DMtcD2mIWHFQ6pDVQKSMR7RDef3RpT4POq3TpEjSKGzzTPAb21qwKyMkpVkeLw4l1a/SSRw2QJYsNhb18tQfYBIUfIxFvF9S68PiTpNe7Oy36weiocDqVLv3RsTkTUzc2TeafzWFdR5BYiqhc4vWEslYgg2BFhLSZdkYeS/jq8r85KzB9BMeqJGKTf79SPetg061A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm0yVg8vleStWIYb3XGZ4+MQnADbqmPVnNiSbaXYdfQ=;
 b=A9J4a9re1Jf4truOVfrTJjyhUmWuIbHS3Osjn/QL96Br3mb19USe4F33Lk/xLejpV7jZvW1ABki++Bgp53EG2H28tbwkchjzxmd3dWt4qd04uy2mS4s7F0kNSVxnoX5kDDkhnbAHDaGQ+5DIJyOE+rGvYvb4ocAzgmsxRWVCQz+s2yzao6cxPbGn3pXY3JJ7BSUlVTcTC3HFEseoCgDIKoOLb0GmjiPoVFkWTc+hre9vsEyZrkuXuQ+fwqdJlvV2MPbhtxLP9+3kt8i0nOWfeaPWqDm7L4+E2AFNWypPxJlgfKXS5myvzcmPMOb2sVFeK2tSMJsNcDeq/A8kmQFwPw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v5 02/10] xen/arm: scmi-smc: update to be used under
 sci subsystem
Thread-Topic: [RFC PATCH v5 02/10] xen/arm: scmi-smc: update to be used under
 sci subsystem
Thread-Index: AQHb+v2VN6PNmY5o9E6echLDtYWg47RvkxgAgAbZdoCAALH2AIABK1sA
Date: Thu, 28 Aug 2025 13:30:34 +0000
Message-ID: <22a4bcef-9665-4758-b81c-0361fed1e4e4@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <a6a538ca4c02483e745f18db4f74504dad525fe6.1753184487.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2508221709020.2743087@ubuntu-linux-20-04-desktop>
 <1f64aa13-d9d3-4b58-9581-a45f7173430b@epam.com>
 <alpine.DEB.2.22.394.2508271239020.3391208@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2508271239020.3391208@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DU7PR03MB10945:EE_
x-ms-office365-filtering-correlation-id: 02564bd6-6de0-4f89-1e4b-08dde6371195
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eUFRK3pINlpQTEhMYkRQK0hCZi9JZGhXMGZPSHQ3VXlYdGxHSkNRaWNNL1A4?=
 =?utf-8?B?Y0sycDMvWnhGQUxjUngzYUFRZjErY2RKQXp5UXpHZEF1ZDF2L0VVeXJxQktt?=
 =?utf-8?B?WUR1NXFtcmVCOXRaWUNSWnNxMHdxMVI3RDYzUjFSQlJhMkR2Z1phTU9VSmtG?=
 =?utf-8?B?TVVTUkcyNHcvcnpUU3ZCYTRvbGV0cDZUUDE1S1JMWGhrUTg3eExLbzVkZ3Fz?=
 =?utf-8?B?MGV0SlgrdGUyT3plMjBYRXlOL3AxT0VMWUI0akFVTXI5dVpyRVc3eCttRzY1?=
 =?utf-8?B?NVR1cUxxVGVNRmVOOVF5Z0VhRS9rVUIyeXhYQzBEdjhIV1gxMC9wVkw3eGZP?=
 =?utf-8?B?QTBHTVQxZXl1VGc5eW9STkRzYTV0ZStMSWw5V0FrMHNyT3Nzc2hJcCtnOUdk?=
 =?utf-8?B?TXh5eGRjSzlqMlloYnU0Z2kzOUxmbzVVNm1tdmM2Nml6eVdkTzNpWVJRUE1W?=
 =?utf-8?B?UW96ZldHR0ZiVXI0SExha1N5UFRWdEEraThZaW03aElvZ2Z3QWk1VlhPWG14?=
 =?utf-8?B?Z3VyMWpuQmVsbGlOZkxiOTNHSmhVYnh5dmJoS29OaEdiakpYaEE3L0dObEJv?=
 =?utf-8?B?UWUzTjZqWXJHcFZ6T1IxeWZXQUUySmF3SDI4M3VBbVB5cjZvbXVQczR2MHZZ?=
 =?utf-8?B?WU5uUHg3cERId0o1VU5UZXAxTG1EbWlHR09VV1piWWF5ZXUxYklrUlZrS1dD?=
 =?utf-8?B?TitaOGVPSi8xMHptanZXeUp1OG5sbmVkMHRpRzUwN3lDSGhFMDk4M2JaSDVK?=
 =?utf-8?B?NGcvVlppR3ZMdjBtSGRMelRoQm1NNWhoVkhrOS8zTHdVbGlrVWxwRCtJVVhM?=
 =?utf-8?B?cWc1MjhpRTQ5bnQ5NDNZMFVMY2dkekFqdktoM1k0dU4vUWVCSUJLQ3JCUlJr?=
 =?utf-8?B?YTRTN3RNdFFoZitlQjBIMGtlNzhTelFjbkZoTHNZMDdLRE9yT0lZd2JwT2hz?=
 =?utf-8?B?eHRmRU9WSkU5QlREcytLNGxpU0JuWnRxb3pTUTFHektBdTlVTEdCVnRjSjJB?=
 =?utf-8?B?c0ZEWXh6T1h2ODBHZkNGTnk4Rnlpb3FDU2xiRjBHTThPY1RSUXNqUmp2U3M0?=
 =?utf-8?B?UUxYUjB6TUk3TmJ1VS8vMmpXOGZobCsvSFlLTVEwd0I1Z3oyalQ0MmcrditZ?=
 =?utf-8?B?K1F0RUhDcDZLYnFDeXJ2ZXNoQ25OOTIzV2ZkWmh5L2czV0pPMnNJQ3pVUHFy?=
 =?utf-8?B?MVlHM0VaQkFjQ3crL2Y0cWVpejFIUytyOUw0bkxuLzZibmF3SGJKRkdENDVa?=
 =?utf-8?B?ZmZZUkRDZW1WcjJQdVNwK3JKL3JXcXZqT2JVempsa1BMd2NDRGJXejJMOG5N?=
 =?utf-8?B?d0tZTHlRcVVvOVgwVi95eDBnU0NaWkx0Nkp3amN4MDcyQzNCR1VHdUhVU1Jy?=
 =?utf-8?B?Y2QrZld6ZlREY05lTTBFR1VPYngrVGJ1b1FZaWJMV0ZQeUZRZ0grVFhKZXlj?=
 =?utf-8?B?aDYyMXFWWm9pdzdreFhyRG80ckYrajJoOTlocCtIZnlZeGtGS1gwcUlLSEFU?=
 =?utf-8?B?anJpT1l0UUhvdlRBbEpINzdvT1AveENVWVpBaEswVmtKc3RyWUhrS2NLWExL?=
 =?utf-8?B?R1ZwU0ZsUWYrcTZpdE56bEVJdkNMUTZkcmtOeG9hd1BZQzVUclYvSWV1VEY2?=
 =?utf-8?B?MTBDcGRSRDBQNU1xbWdETkszVnVsNW91Z1dZazBVaHdkcnBoNDgyaEJXc1Jo?=
 =?utf-8?B?N29GU2NHS3V3TEkrRjJHRmtmWjhFUzRiZUhYbFgwY2JzcHpxN2pPMjVDWERu?=
 =?utf-8?B?bzYvUDRDTndFa3Z1dmxGdFBpNHFybm5lRCtoTVk1b3pMc2YvajMyV3o4V1hs?=
 =?utf-8?B?Tk92RW9hczV2SHNpeUNCVXlYZTcwZlZFS1R1MXcwbkpnU0ZSLzVMbXNyYkdy?=
 =?utf-8?B?OFo2bi9peVJvVFlwT1JPb0lzSUg0YmE1OE1GRmdyRy96dDhRNGRMa0ZUTTUz?=
 =?utf-8?B?OFVwYUZNMThrRHhtWCtXaFNxTWpsbklBK3BwTTRUODVTYUwwUEZmVFB4U2Vk?=
 =?utf-8?B?dHhlbHpXVHBnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VzNSNVBDTHpCajhBdzA5RGFhVkJqZkNPdFB1S3BFN1lpTDZmSmhMVC9ibXRp?=
 =?utf-8?B?MWlaK1lTVm5hMEJSMXdydHJoTHk5OWtHOUpaWlhoR0loUEdLUnBaRTFkSHVU?=
 =?utf-8?B?NWhhVmNlOWdDcVk2WXR2WEFWMUErY0doUlcyL2U4NXJHS2JMc3pjVTZudWxT?=
 =?utf-8?B?d3Z0UHBVSWxyc2JMY1hrblcwK1g3eElJUzFTdlovbEh1OFdCOW01TmR0aUF3?=
 =?utf-8?B?Qmt3U0plQ1hrYkpBWktoRjcycFFQaVZUWGNmSHlSZnhUUHRTd1VzWXBwYldZ?=
 =?utf-8?B?Q3JDWVZiTk1TSmV4K0F2dmNzL2F4aUF5OGhnN0tsbjhYMzBtRjQrMnhReEZF?=
 =?utf-8?B?T0RRMGhkaW4yL1R6cyttWUN0Qm9PSlk2dmY2MHZ5U2c1NnNoVEZoWU1UbjB3?=
 =?utf-8?B?MU1jRXVKZmkrcllLY292b3VZU2k4b0RnVXRiZjJETVBEMWhLOCtzMCtidmQ5?=
 =?utf-8?B?RUlZU0JPOWlERnFTY3ZHZ1JGNmE1ckF6VWlQWjFoeHVHRnFyNnU1SVJpb0do?=
 =?utf-8?B?dWJoR3NDMzFZNlRRZWFzUlNUWDNYb0FYalRSR04waFlkNUdENjkxbEFQMHB3?=
 =?utf-8?B?NThiY2Q3V24ySXQyZVhhdEQzQnVpN0FOcURqMTh0WHA3QytSNWhNYWx0ZVM4?=
 =?utf-8?B?aVE0aW5wZHJGZTA4d3pxdUljdmc4b3MrbjFMRXNhSnYrUWNaTGVHMlFhWEVS?=
 =?utf-8?B?eDdhUVNPNE45V1FnMUgydVpqWlg4VjVYN01PVVNkbG94SWQ2YXZVMXdnbnAy?=
 =?utf-8?B?RTZENGhiMUY0WmM0UGZtOElKUzlSKzgxTFJiOWhlZEQ4VzFBeGtVczZoMFox?=
 =?utf-8?B?eDJtQUUzQ2VDbk4rUktqTG9tQ1M3em42VWtFbFpzL0RuT0szRFpLa1NEZlpE?=
 =?utf-8?B?R2wvNHhzbWNzZlNsK3I1VnRzcnpvSnFqNVpTYnBuTXRGZlZUbDdiT2U0YzdN?=
 =?utf-8?B?U3JhempSWlI3V3dkZHlEZlJMWHAzQTJ4MVA2NWhZanVlOFE4UW9vSDh3UENR?=
 =?utf-8?B?Zmg2SXA5ZmRKVTE5dHRrMnIwcXRweG9WdGF0TW00bzg4cVhHQmR3MmJwR0xw?=
 =?utf-8?B?ZlYyNmtwQks1bkNZSHNBaUtrQ1pNWk5DeG9BMTZCV3MrazkrWVdIRGtZb0V0?=
 =?utf-8?B?VlpJcTUxNzNlNENrMWt1NHBHTjhwR3MvUEI4bGFlTk5ESzZ0Ly9CTEQ1Tkt0?=
 =?utf-8?B?Y3FKZ0tGa0dKdnZGWFJQU1VCbFN0RXVnVDVNc2FkaG50SUxscEZhQ3d2Wm1V?=
 =?utf-8?B?SkJzY29SaVM1Mm94Ykg5RnIwaU9USE5OZ0Zoc1V3NGxXWjVvWlZ2dnIwNVhh?=
 =?utf-8?B?b0srakFHTDA1ams5V3JicjFLZzFhQ0c0c3FscGNkU0xKY3l2MG5HdXZxYTNO?=
 =?utf-8?B?NzllZXNhZ0FJeSthMXY2UkhWNDZYR1ZnWlhIcDZBTjFYK0I2UzlzWktoNjRM?=
 =?utf-8?B?c0JPaGNUTmJub1dFVFNDMld6NGw0eXpINTJaczVLYUtPNFhVN2R5Z29KY082?=
 =?utf-8?B?VFNvRWlNV1dxL3hOSmNKcnYzQjlPRURIN0d0a0tEdjRtQ29OeExnM3N2V1FX?=
 =?utf-8?B?TlROZ3FaVkdHSjVsNmxFQklBcHRqSkJMTkhxNFBnWUU0ZXQxREF2Znd4VWpa?=
 =?utf-8?B?VlMrUTc3RXRyTWNIdzE0UVE3c3QxLzFLajUvRDBhM29QeHdISmQ5ZVhJc3dh?=
 =?utf-8?B?OURlZkU4akpPbDhtUnhmVU5keVFRcWF0VlZhK1U5YlFSbDBvOXFmenNwMGlw?=
 =?utf-8?B?OU53QmVZWG0wWEx1SnRwS0pPL0Z5OGswd2JuRlMzcnBkOWZ0QVcyUHJVbnpF?=
 =?utf-8?B?ZXJNc1lXMmRrTmNhYkVjakx4eHIxOGNQbCttZXdjSEtXYjVXYXdIZWRkSlRV?=
 =?utf-8?B?N04yMWwyalgrejczenRnTUhFSkhCMC82S0s3T09BbDAwZG5tQmswYS81eGxk?=
 =?utf-8?B?bDBvdHVLUzB3SEFyNmw2QTkwS241TlpNdFZKT2Z0dmp5MW5ONmxZU044SG5r?=
 =?utf-8?B?RjV1WTR4ZU9Yd3hZR3NqNkFPTm5vYlpyRnRzdUkzN0ZuaDR6Q1VHQUdWUGtx?=
 =?utf-8?B?OERYeWpMOXlGME9TTW9aanZsenk4NWJSMEh4aHRiSGxRRFJxV3JuU3Y3K05X?=
 =?utf-8?B?UzhqNE84a1lWT2E3YkE3VmhnYUhRRkVjbTNPenlDRis4ayt0Y25VMUZ5TFgv?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2980D032881064FAF315DFB29F0222C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02564bd6-6de0-4f89-1e4b-08dde6371195
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 13:30:34.8910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azH9PB6g7s4/ZPLK9XG0YFrRfpjO+Biy6djH2UKKKcPz2HA/hej0YNIoRUNCKJpNn9opAI7gz+2tZ2WEOxkbuE77lrQBxhzCc+Q8Ux4gcT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR03MB10945

DQoNCk9uIDI3LzA4LzIwMjUgMjI6MzksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24g
V2VkLCAyNyBBdWcgMjAyNSwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiBPbiAyMy8wOC8y
MDI1IDAzOjI2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4gT24gVHVlLCAyMiBKdWwg
MjAyNSwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+Pj4+IEZyb206IEdyeWdvcmlpIFN0cmFz
aGtvIDxncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNvbT4NCj4+Pj4NCj4+Pj4gVGhlIGludHJvZHVj
ZWQgU0NJIChTeXN0ZW0gQ29udHJvbCBJbnRlcmZhY2UpIHN1YnN5c3RlbSBwcm92aWRlcyB1bmlm
aWVkDQo+Pj4+IGludGVyZmFjZSB0byBpbnRlZ3JhdGUgaW4gWGVuIFNDSSBkcml2ZXJzIHdoaWNo
IGFkZHMgc3VwcG9ydCBmb3IgQVJNDQo+Pj4+IGZpcm13YXJlIChFTDMsIFNDUCkgYmFzZWQgc29m
dHdhcmUgaW50ZXJmYWNlcyAobGlrZSBTQ01JKSB0aGF0IGFyZSB1c2VkIGluDQo+Pj4+IHN5c3Rl
bSBtYW5hZ2VtZW50LiBUaGUgU0NJIHN1YnN5c3RlbSBhbGxvd3MgdG8gYWRkIGRyaXZlcnMgZm9y
IGRpZmZlcmVudCBGVw0KPj4+PiBpbnRlcmZhY2VzIG9yIGhhdmUgZGlmZmVyZW50IGRyaXZlcnMg
Zm9yIHRoZSBzYW1lIEZXIGludGVyZmFjZSAoZm9yIGV4YW1wbGUsDQo+Pj4+IFNDTUkgd2l0aCBk
aWZmZXJlbnQgdHJhbnNwb3J0cykuDQo+Pj4+DQo+Pj4+IFRoaXMgcGF0Y2ggdXBkYXRlcyBTQ01J
IG92ZXIgU01DIGNhbGxzIGhhbmRsaW5nIGxheWVyLCBpbnRyb2R1Y2VkIGJ5DQo+Pj4+IGNvbW1p
dCAzZTMyMmJlZjhiYzAgKCJ4ZW4vYXJtOiBmaXJtd2FyZTogQWRkIFNDTUkgb3ZlciBTTUMgY2Fs
bHMgaGFuZGxpbmcNCj4+Pj4gbGF5ZXIiKSwgdG8gYmUgU0NJIGRyaXZlcjoNCj4+Pj4gLSBjb252
ZXJ0IHRvIERUIGRldmljZTsNCj4+Pj4gLSBjb252ZXJ0IHRvIFNDSSBYZW4gaW50ZXJmYWNlLg0K
Pj4+Pg0KPj4+PiBUaGVyZSBhcmUgbm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGluIGdlbmVyYWwsIHRo
ZSBkcml2ZXIgaXMganVzdCBhZG9wdGVkDQo+Pj4+IHRvIHRoZSBTQ0kgaW50ZXJmYWNlLg0KPj4+
Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBHcnlnb3JpaSBTdHJhc2hrbyA8Z3J5Z29yaWlfc3RyYXNo
a29AZXBhbS5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgTW9pc2llaWV2IDxvbGVr
c2lpX21vaXNpZWlldkBlcGFtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+DQo+Pj4+DQo+Pj4+DQo+Pj4+
ICAgIHhlbi9hcmNoL2FybS9maXJtd2FyZS9LY29uZmlnICAgICAgICAgICAgICAgIHwgMTMgKyst
DQo+Pj4+ICAgIHhlbi9hcmNoL2FybS9maXJtd2FyZS9zY21pLXNtYy5jICAgICAgICAgICAgIHwg
OTMgKysrKysrKysrKystLS0tLS0tLS0NCj4+Pj4gICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2Zpcm13YXJlL3NjbWktc21jLmggfCA0MSAtLS0tLS0tLS0NCj4+Pj4gICAgeGVuL2FyY2gvYXJt
L3ZzbWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArLQ0KPj4+PiAgICB4ZW4vaW5j
bHVkZS9wdWJsaWMvYXJjaC1hcm0uaCAgICAgICAgICAgICAgICB8ICAxICsNCj4+Pj4gICAgNSBm
aWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspLCA4OSBkZWxldGlvbnMoLSkNCj4+Pj4gICAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9maXJtd2FyZS9zY21p
LXNtYy5oDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZmlybXdhcmUvS2Nv
bmZpZyBiL3hlbi9hcmNoL2FybS9maXJtd2FyZS9LY29uZmlnDQo+Pj4+IGluZGV4IGZjNzkxOGM3
ZmMuLmJiZjg4ZmJiOWEgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9maXJtd2FyZS9L
Y29uZmlnDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9maXJtd2FyZS9LY29uZmlnDQo+Pj4+IEBA
IC04LDkgKzgsMTggQEAgY29uZmlnIEFSTV9TQ0kNCj4+Pj4gICAgDQo+Pj4+ICAgIG1lbnUgIkZp
cm13YXJlIERyaXZlcnMiDQo+Pj4+ICAgIA0KPj4+PiArY2hvaWNlDQo+Pj4+ICsJcHJvbXB0ICJB
Uk0gU0NJIGRyaXZlciB0eXBlIg0KPj4+PiArCWRlZmF1bHQgU0NNSV9TTUMNCj4+Pj4gKwloZWxw
DQo+Pj4+ICsJQ2hvb3NlIHdoaWNoIEFSTSBTQ0kgZHJpdmVyIHRvIGVuYWJsZS4NCj4+Pj4gKw0K
Pj4+PiArY29uZmlnIEFSTV9TQ0lfTk9ORQ0KPj4+PiArCWJvb2wgIm5vbmUiDQo+Pj4+ICsNCj4+
Pj4gICAgY29uZmlnIFNDTUlfU01DDQo+Pj4+ICAgIAlib29sICJGb3J3YXJkIFNDTUkgb3ZlciBT
TUMgY2FsbHMgZnJvbSBod2RvbSB0byBFTDMgZmlybXdhcmUiDQo+Pj4+IC0JZGVmYXVsdCB5DQo+
Pj4+ICsJc2VsZWN0IEFSTV9TQ0kNCj4+Pj4gICAgCWhlbHANCj4+Pj4gICAgCSAgVGhpcyBvcHRp
b24gZW5hYmxlcyBiYXNpYyBhd2FyZW5lc3MgZm9yIFNDTUkgY2FsbHMgdXNpbmcgU01DIGFzDQo+
Pj4+ICAgIAkgIGRvb3JiZWxsIG1lY2hhbmlzbSBhbmQgU2hhcmVkIE1lbW9yeSBmb3IgdHJhbnNw
b3J0ICgiYXJtLHNjbWktc21jIg0KPj4+PiBAQCAtMTgsNCArMjcsNiBAQCBjb25maWcgU0NNSV9T
TUMNCj4+Pj4gICAgCSAgZmlybXdhcmUgbm9kZSBpcyB1c2VkIHRvIHRyYXAgYW5kIGZvcndhcmQg
Y29ycmVzcG9uZGluZyBTQ01JIFNNQ3MNCj4+Pj4gICAgCSAgdG8gZmlybXdhcmUgcnVubmluZyBh
dCBFTDMsIGZvciBjYWxscyBjb21pbmcgZnJvbSB0aGUgaGFyZHdhcmUgZG9tYWluLg0KPj4+PiAg
ICANCj4+Pj4gK2VuZGNob2ljZQ0KPj4+PiArDQo+Pj4+ICAgIGVuZG1lbnUNCj4+Pj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9maXJtd2FyZS9zY21pLXNtYy5jIGIveGVuL2FyY2gvYXJtL2Zp
cm13YXJlL3NjbWktc21jLmMNCj4+Pj4gaW5kZXggMzM0NzNjMDRiMS4uMTNkMTEzNzU5MiAxMDA2
NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjbWktc21jLmMNCj4+Pj4gKysr
IGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjbWktc21jLmMNCj4+Pj4gQEAgLTksNiArOSw3IEBA
DQo+Pj4+ICAgICAqIENvcHlyaWdodCAyMDI0IE5YUA0KPj4+PiAgICAgKi8NCj4+Pj4gICAgDQo+
Pj4+ICsjaW5jbHVkZSA8YXNtL2RldmljZS5oPg0KPj4+PiAgICAjaW5jbHVkZSA8eGVuL2FjcGku
aD4NCj4+Pj4gICAgI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0KPj4+PiAgICAjaW5jbHVk
ZSA8eGVuL2Vycm5vLmg+DQo+Pj4+IEBAIC0xNiwxMiArMTcsMTEgQEANCj4+Pj4gICAgI2luY2x1
ZGUgPHhlbi9zY2hlZC5oPg0KPj4+PiAgICAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+DQo+Pj4+ICAg
IA0KPj4+PiArI2luY2x1ZGUgPGFzbS9maXJtd2FyZS9zY2kuaD4NCj4+Pj4gICAgI2luY2x1ZGUg
PGFzbS9zbWNjYy5oPg0KPj4+PiAtI2luY2x1ZGUgPGFzbS9maXJtd2FyZS9zY21pLXNtYy5oPg0K
Pj4+PiAgICANCj4+Pj4gICAgI2RlZmluZSBTQ01JX1NNQ19JRF9QUk9QICAgImFybSxzbWMtaWQi
DQo+Pj4+ICAgIA0KPj4+PiAtc3RhdGljIGJvb2wgX19yb19hZnRlcl9pbml0IHNjbWlfZW5hYmxl
ZDsNCj4+Pj4gICAgc3RhdGljIHVpbnQzMl90IF9fcm9fYWZ0ZXJfaW5pdCBzY21pX3NtY19pZDsN
Cj4+Pj4gICAgDQo+Pj4+ICAgIC8qDQo+Pj4+IEBAIC00MSwxNCArNDEsMTEgQEAgc3RhdGljIGJv
b2wgc2NtaV9pc192YWxpZF9zbWNfaWQodWludDMyX3QgZmlkKQ0KPj4+PiAgICAgKg0KPj4+PiAg
ICAgKiBSZXR1cm5zIHRydWUgaWYgU01DIHdhcyBoYW5kbGVkIChyZWdhcmRsZXNzIG9mIHJlc3Bv
bnNlKSwgZmFsc2Ugb3RoZXJ3aXNlLg0KPj4+PiAgICAgKi8NCj4+Pj4gLWJvb2wgc2NtaV9oYW5k
bGVfc21jKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4+PiArc3RhdGljIGJvb2wgc2Nt
aV9oYW5kbGVfc21jKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4+PiAgICB7DQo+Pj4+
ICAgICAgICB1aW50MzJfdCBmaWQgPSAodWludDMyX3QpZ2V0X3VzZXJfcmVnKHJlZ3MsIDApOw0K
Pj4+PiAgICAgICAgc3RydWN0IGFybV9zbWNjY19yZXMgcmVzOw0KPj4+PiAgICANCj4+Pj4gLSAg
ICBpZiAoICFzY21pX2VuYWJsZWQgKQ0KPj4+PiAtICAgICAgICByZXR1cm4gZmFsc2U7DQo+Pj4+
IC0NCj4+Pj4gICAgICAgIGlmICggIXNjbWlfaXNfdmFsaWRfc21jX2lkKGZpZCkgKQ0KPj4+PiAg
ICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4+Pj4gICAgDQo+Pj4+IEBAIC03OCw0OSArNzUsNDUg
QEAgYm9vbCBzY21pX2hhbmRsZV9zbWMoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+Pj4+
ICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+Pj4gICAgfQ0KPj4+PiAgICANCj4+Pj4gLXN0YXRpYyBp
bnQgX19pbml0IHNjbWlfY2hlY2tfc21jY2NfdmVyKHZvaWQpDQo+Pj4+ICtzdGF0aWMgaW50IHNj
bWlfc21jX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmln
KQ0KPj4+PiAgICB7DQo+Pj4+IC0gICAgaWYgKCBzbWNjY192ZXIgPCBBUk1fU01DQ0NfVkVSU0lP
Tl8xXzEgKQ0KPj4+PiAtICAgIHsNCj4+Pj4gLSAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5H
DQo+Pj4+IC0gICAgICAgICAgICAgICAiU0NNSTogTm8gU01DQ0MgMS4xIHN1cHBvcnQsIFNDTUkg
Y2FsbHMgZm9yd2FyZGluZyBkaXNhYmxlZFxuIik7DQo+Pj4+IC0gICAgICAgIHJldHVybiAtRU5P
U1lTOw0KPj4+PiAtICAgIH0NCj4+Pj4gKyAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4oZCkg
KQ0KPj4+PiArICAgICAgICByZXR1cm4gMDsNCj4+PiBTaG91bGQgd2UgYWxzbyBjaGVjayBmb3Ig
Y29uZmlnLT5hcmNoLnNjaV90eXBlID09DQo+Pj4gWEVOX0RPTUNUTF9DT05GSUdfQVJNX1NDSV9T
Q01JX1NNQyA/DQo+Pj4NCj4+IEN1cnJlbnQgY2hhbmdlcyBhc3N1bWUgdGhhdCBvbmx5IFNDTUlf
U01DIGlzIHByZXNlbnQuIFRoaXMgY2hlY2sgd2FzDQo+PiBhZGRlZCBpbiB0aGUgc3Vic2VxdWVu
dCBwYXRjaCB3aGVuIG11bHRpYWdlbnQgd2FzIGludHJvZHVjZWQuDQo+IEluIHRoZW9yeSBBUk1f
U0NJX05PTkUgaXMgcG9zc2libGU/DQo+DQpJdCBpcy4gV2hlbiAic2NtaS1zbWMtcGFzc3Rocm91
Z2giIHBhcmFtZXRlciB3YXMgcHJvdmlkZWQgdGhlbiB4ZW4gd2lsbCANCnNraXAgImZpcm13YXJl
L3NjbWkiIG5vZGUgZm9yIHRoZSBkb20wLg0KDQotLQ0KT2xla3NpaQ==

