Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA6FB2801B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 14:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083406.1443019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umtlp-0006Bo-IS; Fri, 15 Aug 2025 12:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083406.1443019; Fri, 15 Aug 2025 12:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umtlp-0006A0-Fh; Fri, 15 Aug 2025 12:42:57 +0000
Received: by outflank-mailman (input) for mailman id 1083406;
 Fri, 15 Aug 2025 12:42:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KPM=23=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1umtlo-00068y-JA
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 12:42:56 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d9bea86-79d5-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 14:42:55 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU2PR03MB7862.eurprd03.prod.outlook.com (2603:10a6:10:2d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 12:42:53 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 12:42:53 +0000
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
X-Inumbo-ID: 5d9bea86-79d5-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udISKfU6agoHBQmQrBXwBvgJhCjdwGIM7CLticz4SpMFaNVsd7j0ziWxdh8yhW8VCW9ks9V0TKb4n0vVwCboPs6veco9iqizm4BAaFKy7NaHenarp6OaNgw1p7AFUhUKmkRxSCU32FwvJ5GRvRDa4m/K0RTtHEzdSdGxiJSxGBJ/AqiZmns6A4IrFj3iK7C1+QkQk6CBP5toEdAOoeP+O65VCOzKflqsGWcg4H4xQwPLPA7yBBhcEoa11EnREiXLn9tJ8aCN4m/Z+O4muoh3N9H8LR9ho3w3b25HlQqL+HiDVr4S3ki6dxqI8LFOPEKW1sdByVifo4K/CwSG5mqWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDX5wp7U2xAGP+dZo93+QLdtOQKpnjOTLlywuDupMiI=;
 b=WInBEecVOjGGrXihnHpMSWBpe9t1yftb3I5GTROTFCE7nPmffdp1c6DGSMsQZRo8HJOYXRZoeHxffUJBzQFhBqlezb3vBI4/gsjMEB2Ej0rdF8c5xfoisqNbcS4QlmaS4icr6hSX+SMy8n+SFajLWOmBH07KLcKYqUx8/E0dPYHUDH0+0+TrExnxfpZqxM1TQcFhO0M0ivOAQteytZV0x5GT8a5PUUScHwDScT1tNErhu9PJklmrgv1N8rE4zA+KifAogbAngHWig3g+1nUGJyIc6niIBho5PZ4hz/HNjV40/8KXTne7uglIQL/ufH9bIgnaA72kN/lKy/r+lLKfVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDX5wp7U2xAGP+dZo93+QLdtOQKpnjOTLlywuDupMiI=;
 b=ptKVOmEZthh46EWpA0G2AQ1Xhrhh3etXD0WN3LdcwzIWVe8bi6RJR1zPQhHpHRj2W5tui7nymzrsUOdkDGNe97WmGBIx9Nxlc6RagIvKl4EkvOfpO/z+vcyIzI1vyy7PZmlcOUGTATePQ6lrywdzkVmMt925MOOYZAaZQf8W+/vjRDo2iAeuQpcu0DSipvsWb9jUdgyDrEYus5CkatXXVfGjaKwaYLP7w4h3kQFPJBYAbl2+R7GsdhekmAj9Rluf2CxA5LpBdhdj/StwieiFLSitquALn7tGTlSGQcSjI5wck+228FA1meJYc5bDhRAVWLOr3yo3MMGMzbSnx5NlAA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] docs/misra: fix sphinx-build issues
Thread-Topic: [PATCH] docs/misra: fix sphinx-build issues
Thread-Index: AQHcDbJCdYlsiZdfl0mX5ViIXi0+6LRjZcaAgAAeAoCAACUOAA==
Date: Fri, 15 Aug 2025 12:42:52 +0000
Message-ID: <124fbf42-c521-4185-b9e2-a92e7b54a5a4@epam.com>
References:
 <fb809a94e8a50bd3a59aa47ee1832c61af8a9f40.1755241166.git.dmytro_prokopchuk1@epam.com>
 <99171678-71a2-4cec-a6dc-343993108a37@suse.com>
 <b8aff698-fbc8-4fc6-a616-fbe14c7538d7@epam.com>
In-Reply-To: <b8aff698-fbc8-4fc6-a616-fbe14c7538d7@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU2PR03MB7862:EE_
x-ms-office365-filtering-correlation-id: 0be513c0-410f-4fd1-ece6-08dddbf94067
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ckZjUXpldHNFUzZqemQ5WXBFSWtoMEJKMS9DaHZVdnRYbUhRcERheVBYTmFP?=
 =?utf-8?B?bHFnZitVNUxHQmluWFdQOEYwLzdPWVNnUUpidExxY3llbmZ5Ykw2eEpnMk84?=
 =?utf-8?B?cDMyQ2VUbWM5Zy9pMUJUWWYwUGJOQU1IcUdISTJSL2dTRFVIQjNDSTdpV0g2?=
 =?utf-8?B?QnJ6cXV2Tk5EQzZ0dDhHK1ZnVGdtUXBWOXhPSHQ4VmJOaVVybGJzYmx4Y3E4?=
 =?utf-8?B?OHBXWWd3YUdHWUlRdjg4N3laTlhRWE1YanV6cFZZY04vUXpBaHlhbHhLR08w?=
 =?utf-8?B?bHArVWFRWDdoeUJCdmRENDBzdUxWQzBUd0ZkR1hXTDNDL3VJT2ZKdjJBb3Iv?=
 =?utf-8?B?RWQvc1kvdHBTQnR5SlF3Z2NvRVNEQkN0TEU5cU43QjNINE14eEVQSEZxR2Jp?=
 =?utf-8?B?MWZpRy9RL0luVEdMK1IwVnYzL212QkJOcEdDeWpTbW1ER3NOazJQQk5VYW4w?=
 =?utf-8?B?cnR1ODl1aWFNZXdJa2Y4TGFRczlWZERUeDNITnpJNjNZT0U5RVJTZnk5ZjdW?=
 =?utf-8?B?dnFKSkhBYjhoVzEvaUJHOHAwQjEwazAxQ3Z2NitDNGFpLy8wOGE3dUtURHp0?=
 =?utf-8?B?dm1LNjVrc2thN3l5YytXTXhxSjFjMEU2cVlmSGRSTGNYSlNpQ0wwRzJKeVZO?=
 =?utf-8?B?YTJ0NVFFbDFuOWRpa2lVeFhEMlhUWHZFWWFiZzl5ZkNWVnJHazcwM0I2NlZl?=
 =?utf-8?B?SUlHaC95UElEaUk1TVpxVnpZNmx4ZElsUUFteFR5bXlUcjBadS9jSzFKSnpU?=
 =?utf-8?B?ZXlrL2lJZ2Y1WmNRNDA4OXkyTG1KdkR4K0hWd2lPK2xJdkRkSTRyeTFoT1Jv?=
 =?utf-8?B?RmxwSys1UmZiS0JYVnYxZDJNSHNPMzlpMGs3ak44YnVKWnYvalpjY1hEblZz?=
 =?utf-8?B?MExMTFZLdmNZL0U2M1VYMDZLWlVQTE1QZzZxWHRXTjY2NC9DTFloNGo2aGt3?=
 =?utf-8?B?OGxDaXRTbm5NWE1EdVlMbWc2UkkwSWlLUDdTaFljVW9kZmRGZDhpb3d2aWJl?=
 =?utf-8?B?cVh2a3ZnWncrWmptRnZUcVYwUHB2U3NoMmhqb1dtbXg0TDhuMG42VWVGTGNK?=
 =?utf-8?B?ZEVJd2Zhc2FhUWZYQlNhcmRLaHBsbGtVbFNCMUJyaHBWWGRBOFJVZDNjaEoy?=
 =?utf-8?B?Z3pCcjhpNms1b2ZLenhqSWhnRkx0eCtqVTBBemNrTXlxemtuUG9ra3RRbFZp?=
 =?utf-8?B?elo0aHFQVXNoSE0rVWdMaG1kcWVvNTVPSTByVUEzWFA0WHovcGR0OWwycXdM?=
 =?utf-8?B?K08rS1A2R3VpOXVzR05IWjFodFFSTXdkNGRBYy96Y3pSc1FIL2hNbjBzV09u?=
 =?utf-8?B?UmtNWTNtclRlbnhyaytWMzVpcm5aMENPUzVrU2ZBMXdDZEVrd1pvRE1NY1ZB?=
 =?utf-8?B?aEh5amZ6TndUVHN1bEZCNjMyZ3RObk93L2NTYzRPcWJGOWRuMzBNT09qNVV6?=
 =?utf-8?B?ZGU1NjVHeG1NZU9DcVF3cjRaa1VjSFBTc1RTektUcWxMSEFyTThNMFUvNktF?=
 =?utf-8?B?OEovWnQwWFdqbXgxS1ZVeEZLTEtPVWRZQmNPVFBVdFJwcGl5NEptVDJYaXYw?=
 =?utf-8?B?bkEzclJnRkF6QWV4YlBKRHNEY0NHWFdIRk1Hd1BXQWFsbzlPYmNpQkM4T2xP?=
 =?utf-8?B?SjdkS052OEJnTS9kMGxhN05LZ05BMXZteW0zN3Yvd0NSUDd4eVU1dkVTUWRu?=
 =?utf-8?B?VzZWemxtZEpBUWgzOWZxQUNYaGNsdHE0WExya2krZWFZUDU3RDZwb3d4RkRs?=
 =?utf-8?B?SlozVDNXUDRDbXJXTFZtVE1RblJuL3dKeGFGQ0M2MERuL2pzaWRhMEYxa1Q3?=
 =?utf-8?B?d3JKak51WDJQeTlhd3ZJeC9La2Y2ZHZzbXRvUkFTRlc1YjdnWGxHZjJram5K?=
 =?utf-8?B?eFNUNVpQdGlJUXNyRTFoNm44R3hBZ2toWFQzK1FJaDNMaUpybEFnQUhkdFZz?=
 =?utf-8?B?cHhCcUYyZWVraHovaEl1WDNhUFpRUGFYYXg2WmxmYXRZRDJrUkpHRUlndVYv?=
 =?utf-8?B?RzB1eWZwMUJ3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2pYSStCUVdRcXdzeW0vdisvNXZ3SmhwN3B1OEUvM1M3L3pDY1JRRFIybWR6?=
 =?utf-8?B?M1J1YThzTnZOcW9wdllVR2pYZzdnMUl2RnErL2pQZGxMUjJ4c0l1d2VyUHdn?=
 =?utf-8?B?M3lXeEFBRm5CVkxvNTZZVDE0TlBRKzAxQ1U2dHFlWnRaL2lQQVkxZi9qeFlP?=
 =?utf-8?B?V0ZJTUo1TUlJd1ZtMStTVHZHaC9FZk81MXdmb3g0NitYYVRybXBKbUpJdmNY?=
 =?utf-8?B?SlhuOXNFWlFwd1NLZms5SXRnTzdMbWQzVk81a1E2N21yUkdieHI2WUtLeGZx?=
 =?utf-8?B?bjJuWkNMWFJrdDdpYmZtZ2dkaThLanRRT0pmdjA5S25ucWtxM0N5TW1QZXk4?=
 =?utf-8?B?djlicStHNisyOHdmdzlTMVYrNVdvaDJlaXg0WFMwVnBCZHROazBuYnMva2Ex?=
 =?utf-8?B?VTUrZ1B6ZEtQUCtrdUFLd1o1U2Z1ZVF1YnhNS1RadStZMkFVclMxSVFvQkJx?=
 =?utf-8?B?ZmRLZUN2MkFJd3c5VWRKMHNWU01jRmpWNGMwMitHa1h0M3k1TGlFZ09OR283?=
 =?utf-8?B?SnM5YTVyVXJwcU9NMm5jYkFNTWdGbHZZZndFSFZGYjNXSCtFaEpxWXduamRM?=
 =?utf-8?B?OCt0ZWZaRUQzdExQMVNsMWs4TWtsdHRiVTFMSE5wREpndDZlUWNvcldOYkx5?=
 =?utf-8?B?dHBMaHpWSE15eFo1ZWlGWVMvcHV6RlFuMkNmMEpEVkw1bmduc2hYYWUvVWNX?=
 =?utf-8?B?V2VUc3pUNmxoQ2Q4aDlraWp4YTZDdzlHVitwMEI5MURQUVQzbVdpQkRTZUpX?=
 =?utf-8?B?RGxMQ0R1Ry92QWpJaTh2L3Y3Nm8wWmg2dW44RFZSNmFRZVRtMVpFSkxxMVhr?=
 =?utf-8?B?aUhmVHdJYTUxcFJwWk1RcXVZNmhYTUU4Y1ZhMUxVdkJ1WjJSVStkY1pHS2lI?=
 =?utf-8?B?akNwZHN6U3NwdTlIM0VJSGhxR0lYZDRsWTlpWkdoQzRLVk1PRzFEKzl3MWkr?=
 =?utf-8?B?KytiU2hLM1c5NFpLVjE2MjJObm43NGx4NGtJaEVsUG8wVEpiSHVMdWVETHZF?=
 =?utf-8?B?SHJjM0w4RFl4dEF5cDRYVmlLcWJxQ3c3emxzbmNlZ0dSMXIzQjc4Mlc0cG1N?=
 =?utf-8?B?WVhKbW1jMmhES1cwVWsyTXhocXRUQ2Nlak9IYjhuaHdnS1JiWllrRmpDdU03?=
 =?utf-8?B?eDh2dG95UGNwY1BOVFd5MEVRcktIVzh5ZGFQek5jWXZYOEtqTXVZN2Q3dDVp?=
 =?utf-8?B?b21UUVVOYWxOTm1PY2NTZHp1V2RaUVdiSUtFQTVZYlR6RVZReEZ4ZncvdzEr?=
 =?utf-8?B?THh2cmpuOVA1ZGNCTFZJN2pDejBRQll4MHpvQjNhMnNQTy9uYU81UDg5NTRQ?=
 =?utf-8?B?aERyN250anFQZE1BUXh1WE5UUjlaNnpCSW1jQzZoaytndlNtdmJlUzBzSDhD?=
 =?utf-8?B?TDJJK2syd21HNVR3ZGdJM3VTQ1ZGNzJaSTUyeWtSZnJpV1daR0xqNUk0STli?=
 =?utf-8?B?STJWbFpKRmkvcWRQL013OWw0blcxYlV0bkRhdmpQU21EbkNyTVExT1ovcFBv?=
 =?utf-8?B?akZlS25ZRlljcDBGVDJwTjhBRUNxS09kTFdWSFVpS1lkaUpPbnVNZ1VjVVlk?=
 =?utf-8?B?Ny81alM2MktLVFNXcmVQQ3NUbjZ4d1N1aTVlMi85Zm54RU1sL0crYzVvMEhJ?=
 =?utf-8?B?MGNEYnB3VnozT0NNYldIVC8yUGRxNVZwZ2RKMGpUQURUamZMS3RUVFUrMmRu?=
 =?utf-8?B?VDFFbXppUUNVaGMvY2pPRktkY1hoc3IreVo1SFdDUU0zSEljeWc1cHQ5U3p2?=
 =?utf-8?B?RVd6V3VIV3Nva0VOdFVxWENBTTB0R0VHa05iWWVSTmZRUUE2Q3VjbnlJNGVY?=
 =?utf-8?B?eGRRbW01UVpuaEJyekVjNWo3KzhrT1VhL3hPQmlac052L0E1U2J0QlRobzF3?=
 =?utf-8?B?RGNyL2pzYmxkSW9pbmFZMW9BQ1ZFNWJzR1JCOXNNd3oyaEhzbmRLWWJzUmhx?=
 =?utf-8?B?ZzBzamg3VEg0blBuRGtBUWtDV2NlVHpKb2x3VGVFRzd1Vkh2WEw5TW85TURX?=
 =?utf-8?B?enRhRTdOTTdzVEhNcTRBdFJiN085ZW51ZTdOV0MrYmhCcWQvVHBIMGpCN3I4?=
 =?utf-8?B?ZCt0ekNOQWtXQnRDZDk0RUREWUl2MlRWcjFqM1FLZXpPa1h5aFZodzdlR0JG?=
 =?utf-8?B?Z1lkZDNLV1BMRnIrWU1GTmJNckR6endabk8yS3N4MSsyQ2RQZDU1SGd3bHFa?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA28466571BD4748981B2F2CDE752CFE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be513c0-410f-4fd1-ece6-08dddbf94067
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 12:42:53.0216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FV7ii3+dkrfurdMYnSBTYAixEcfxX9s7jpdV78vazgRsrn/pjmhHN7LCz2aaqzU6EtdE55m6ihWCnnGdqMVHoUDeed6eJ5NJSIRA0WWx2bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7862

DQoNCk9uIDgvMTUvMjUgMTM6MzAsIERteXRybyBQcm9rb3BjaHVrIHdyb3RlOg0KPiANCj4gDQo+
IE9uIDgvMTUvMjUgMTE6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTUuMDguMjAyNSAw
OTowMCwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4+IC0tLSBhL2RvY3MvbWlzcmEvZGV2
aWF0aW9ucy5yc3QNCj4+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+Pj4gQEAg
LTk1LDcgKzk1LDggQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoN
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIHRoZSBhYnNlbmNlIG9mIHJlcG9ydHMgdGhhdCBkbyBub3Qg
aGF2ZSBhbiBpbXBhY3Qgb24gc2FmZXR5LCANCj4+PiBkZXNwaXRlDQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoCBiZWluZyB0cnVlIHBvc2l0aXZlcy4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgIFhlbiBleHBl
Y3RzIGRldmVsb3BlcnMgdG8gZW5zdXJlIGNvZGUgcmVtYWlucyBzYWZlIGFuZCANCj4+PiByZWxp
YWJsZSBpbiBidWlsZHMsDQo+Pj4gLcKgwqDCoMKgwqDCoCBldmVuIHdoZW4gZGVidWctb25seSBh
c3NlcnRpb25zIGxpa2UgYEFTU0VSVF9VTlJFQUNIQUJMRSgpIA0KPj4+IGFyZSByZW1vdmVkLg0K
Pj4+ICvCoMKgwqDCoMKgwqAgZXZlbiB3aGVuIGRlYnVnLW9ubHkgYXNzZXJ0aW9ucyBsaWtlIGBB
U1NFUlRfVU5SRUFDSEFCTEUoKWAgDQo+Pj4gYXJlIHJlbW92ZWQuDQo+Pj4gK8KgwqDCoMKgIC0g
RUNMQUlSIGhhcyBiZWVuIGNvbmZpZ3VyZWQgdG8gaWdub3JlIHRob3NlIHN0YXRlbWVudHMuDQo+
Pg0KPj4gTWluZCBtZSBhc2tpbmcgd2h5IG9uZSBmb3JtIG9mIHF1b3RpbmcgaXMgdXNlZCBoZXJl
ICh1c2luZyBiYWNrLXRpY2spLCANCj4+IHdoaWxlIC4uLg0KPj4NCj4+PiAtLS0gYS9kb2NzL21p
c3JhL3J1bGVzLnJzdA0KPj4+ICsrKyBiL2RvY3MvbWlzcmEvcnVsZXMucnN0DQo+Pj4gQEAgLTEy
NCw3ICsxMjQsNyBAQCBtYWludGFpbmVycyBpZiB5b3Ugd2FudCB0byBzdWdnZXN0IGEgY2hhbmdl
Lg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aGV5IGFyZSB1c2VkIHRvIGdlbmVyYXRl
IGRlZmluaXRpb25zIGZvciBhc20gbW9kdWxlcw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0g
RGVjbGFyYXRpb25zIHdpdGhvdXQgaW5pdGlhbGl6ZXIgYXJlIHNhZmUsIGFzIHRoZXkgYXJlIG5v
dA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBleGVjdXRlZA0KPj4+IC3CoMKgwqDCoMKg
wqDCoMKgIC0gRnVuY3Rpb25zIHRoYXQgYXJlIG5vLXJldHVybiBkdWUgdG8gY2FsbHMgdG8gdGhl
IA0KPj4+IGBBU1NFUlRfVU5SRUFDSEFCTEUoKScNCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAtIEZ1
bmN0aW9ucyB0aGF0IGFyZSBuby1yZXR1cm4gZHVlIHRvIGNhbGxzIHRvIHRoZSANCj4+PiAnQVNT
RVJUX1VOUkVBQ0hBQkxFKCknDQo+Pg0KPj4gLi4uIGFub3RoZXIgaXMgdXNlZCBoZXJlIChzaW5n
bGUgcXVvdGVzKT8NCj4+DQo+PiBKYW4NCj4gDQo+IEdvb2QgcXVlc3Rpb24uLi4NCj4gSSdsbCBh
bGlnbiBhIHN0eWxlLg0KPiANCj4gRG15dHJvLg0KDQpXZWxsLCB0aGUgZGV2aWF0aW9ucy5yc3Qg
YW5kIHJ1bGVzLnJzdCBmaWxlcyBoYXZlIGEgbWl4ZWQgc3R5bGUuDQpTb21ldGltZXMgZmlsZSBu
YW1lcyBhcmUgaW4gJycsIGFuZCBzb21ldGltZXMgaW4gYGAuDQpUaGUgc2FtZSBpbmNvbnNpc3Rl
bmN5IGFwcGxpZXMgdG8gcmVmZXJyaW5nIHRvIGNvZGUuDQoNCkFueSBzdHlsZSBzdWdnZXN0aW9u
cz8NCg0KRG15dHJvLg==

