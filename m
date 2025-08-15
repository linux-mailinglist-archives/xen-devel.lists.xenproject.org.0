Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C867B27A0D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 09:28:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082871.1442571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umorK-0000qD-23; Fri, 15 Aug 2025 07:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082871.1442571; Fri, 15 Aug 2025 07:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umorJ-0000nE-T7; Fri, 15 Aug 2025 07:28:17 +0000
Received: by outflank-mailman (input) for mailman id 1082871;
 Fri, 15 Aug 2025 07:28:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KPM=23=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1umorH-0000n8-RG
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 07:28:16 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62f19e05-79a9-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 09:28:06 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB7332.eurprd03.prod.outlook.com (2603:10a6:20b:265::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 07:28:04 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 07:28:04 +0000
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
X-Inumbo-ID: 62f19e05-79a9-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3zg0zlH4RMm1DzdUxmAeBi+9O1A8yMKzg/H5hk+DNdIACtiBWudQe05qcbun4DdVD+vWQD2kmCmmLmbHq0dtNobC4kLzaJF8bimcsAjaidZOfhgIVPQYYDFKrJdbrQllk4wbAgLNQzT7TruGxP2r0d+XH8Uz39EXklXHQ4trWRJX40ABliXENjDco2wdFtHVliz8cJ8ZRU8zsScktLfTriEJ8eYcwuDvMMajiKaZxCcT6LFBXQaxnXLH2k1PwZm40m4eAKlX4pCvTMtiybgbyNayMJEz2m0jo+JLOGqB2vdPncqhakrsZVZmzptv44BAZZBhqrVkNF1x3Eomv4CWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DxiJhF+2MqDibtIQLtfAJPqX4b5UYHrAaicpye+2mQ=;
 b=XqVM4Iwff5NaI0wlmNyRrOIgTI3TnqAdLyB5P4dlc54dOqv2zn1jNKQKr7dGHF/i/oPNHFQtqasLUtqWNy1HnQuV7UpY9DwfBMvwKitCx/zT1IA6IrAphvDyUEz+uCylg2TVPGX7Swka2ZrPpLWQcFHabzqWSxM+nF6j9a5xk4Ku5gcGqHrlA41qSKP3upc4YF34YHkyzT4htDmekX+tlOY9+f0uJ6N30e0KJR+vJFTAGw/7yWbq1+RYxgH8URs0DR4o8BFcy6HzTgJ67gpLOQyy+UCT+KoPXGviij4nBmKrpZY87UudXop3lLPlY1qWeYJ/HzC2j56PczJ9CrHGxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DxiJhF+2MqDibtIQLtfAJPqX4b5UYHrAaicpye+2mQ=;
 b=hnQKuDzMRylDg+cY8zLGxj9p0BHzaIRmC448BjMaSB9EUfk+UsKIOw4huC9sxVSRnvh8KBJl03RmtLvV3Eqm14Bqs7p3i2LlA/IrKeL0RiyvEmz/atv7g5/2aknkR+mswTnDc/+tLiUJiKo8A9Ti6MyEveg3iSNsYHMdfwDmN4J5Mve1p8EXqPf5PS3sjVi9A1kPJKepyWzel9QvM63CQudAOe9jXfnaVFWRwu6dAOM526Kw3mNE/QhmfGDbOoZJMbbuRYNvBr3kWC0CF+mKyhzXGGDqOVd9avvnbxFuzxJ/3Inj+Yjml/5kK8JAHd79skskZzCjykiljREVY27gnw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] docs/misra: fix sphinx-build issues
Thread-Topic: [PATCH] docs/misra: fix sphinx-build issues
Thread-Index: AQHcDbJCdYlsiZdfl0mX5ViIXi0+6LRjS8aAgAAFGoA=
Date: Fri, 15 Aug 2025 07:28:04 +0000
Message-ID: <77912fca-8bf2-43f5-8049-de4cdc3ec82d@epam.com>
References:
 <fb809a94e8a50bd3a59aa47ee1832c61af8a9f40.1755241166.git.dmytro_prokopchuk1@epam.com>
 <c7d9513dfc7201c5d3c6e6cbd99db481@bugseng.com>
In-Reply-To: <c7d9513dfc7201c5d3c6e6cbd99db481@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB7332:EE_
x-ms-office365-filtering-correlation-id: a9036ee8-6291-4474-a221-08dddbcd45fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?akIzK2lLUXM4NER5c0ttbGcxY2hZd290NFdFL01GaGFUZjE2T2V5d1pzYm1a?=
 =?utf-8?B?NEV4akxlejI5ZzU0OXdRUFVsbWtTMGdpem56L0lUUnlwWml1Z3hNYWdqSm9x?=
 =?utf-8?B?aFR6cml3NXV1czRDTzFQYXROaHp6b1JlSWYxMFBlenZJMUhjQXZMSHJHbVRX?=
 =?utf-8?B?TG01YzhhSjYrVm1CbGVqbmlVTW82ZTcyMVhmem5GRnVxak1PdDExLzZLZFNz?=
 =?utf-8?B?ZjBNbk9HVkt1WHhEeTZyYXphaGJ1OGlwM1FtY3p5cXB2dFhkZmZuSWFpYjBN?=
 =?utf-8?B?MGFSM28zc2FaL0RWNnVxMGt2b2VWS0hGSlovT09RWEcwcE1WcEpHa3RUSHJI?=
 =?utf-8?B?bjBLVU5rL1RYWUEra0VMUnpQK3VQbHM2SnNMMm91Y0tjd3pPZHFpNm0zOVln?=
 =?utf-8?B?WS9YQmZkRlVBa245L2FsZFQrN2M1YU40cHdTUmd6aHg0aHVyL2hxblV4bGVB?=
 =?utf-8?B?eEgzZGxjcU5BSUhBK2FMMGR0c2hNYnN6bCttNENlRVlKMXBHeHVESlJ6amhl?=
 =?utf-8?B?dXdzSEQzUGNBMkNjMjZjY2trYlQ4K3Zrakk5Y3ZoYlp6ZGozSHlQWVVwUzlq?=
 =?utf-8?B?NitUZXNQSjdhWmhWbS9DTURlOHh0STJrVHNyaElxREFRVEllNEVpeFUyVEdJ?=
 =?utf-8?B?ZjZoVzg2UC9WK3ZKU2FLYUtPV2pBRXllck9qaitUMS9KMTBjREs5WHBwZThW?=
 =?utf-8?B?bzJLWEdyWTM4YWV6eHIwcXVqWFBrWkFKaUV1UlZETzhIblZTK3E2U3FkNTVG?=
 =?utf-8?B?Zi9PTGZ4K1JGbHpKWHBicTlmVFhNSEFlKzVBckRKbmZyNmxMeDdnbFF6bGxK?=
 =?utf-8?B?cG4zbEE1bWNhTTdYYy9PZ0kvZW9OS3RFVGNCRk8velNsZCtPUGdGR2t5TUg1?=
 =?utf-8?B?MTJ0TEkzTUFicDBNTUVsRGNhR2VZK3lVN09TVjhoSnRJUzNJWXEvclZsWVhI?=
 =?utf-8?B?TkwvSjc2RG5HUnRsNjhsYm9NRy9xa3NnZ3VmZFFPaFRrUXIrRG52QTRucHQx?=
 =?utf-8?B?dHBXY0k5aGZBNW1KazhST3lTRHh1dXFGUmg2cUNtd2luUW9QZ0Iyc2JHcCtV?=
 =?utf-8?B?WE5XbllCRWlKMkdlbXVlN0NjU0ZhaFE2UVlXcldCNEhPbW85c2h2R3BRQm1w?=
 =?utf-8?B?V21VSU9pU2h0c3JxOCtuSVZmZXYvN2FzdXV5TkpiT09Ma083RVV2dmltZ1Bm?=
 =?utf-8?B?RjFQb3k1MUlTZU9JaHVuNHp2cWdHVGliU3dlRExLTGo5cERYWXRZc09vMlky?=
 =?utf-8?B?bFFpWUxmdmtPYVZjQUZqRFNWTjRWTzBvWEIvSVBlK3BLbERWeUgyT1MvNXBk?=
 =?utf-8?B?Nk5XSlV5MlNIempqcGs0VlQwTTl3ZDArN2trLzVhbWlSd2FYREkyQnhVRDUy?=
 =?utf-8?B?OVU3WDc2ZDBsS3Z0RUxPRmVzTTlZY1VSblF6dTlGVWhnNzh2ekVvaEN4K1Bj?=
 =?utf-8?B?Ym9ndHBXNmtNVHpzVGQ2ZFdhWnB0NmNQTzdLQ0h3UEw4ZS9pVEhQUkxEdFE3?=
 =?utf-8?B?aHlGWjFrZmpib2Nid0lKcmFTOVJGVXZXQkZBV21TOW43ZTUzV1EvS3E1OW1B?=
 =?utf-8?B?VnJLLzJ1aWJzWkNYQWhJa1l3aGxuM240VGN2enUzRVU5UC9keW5ORTY4bGIr?=
 =?utf-8?B?bUZkV0hoWGhXSDhMd0Eyc2tRTWpKbGFhaGxwaXBHL3p1ZS9ad25kWHhMaWRX?=
 =?utf-8?B?Vk0xa3M5RGNkSDdNdk9wTGNPbVZFdFFNcXRmVlAxNDhOOXJ1eVIrcHdQYnB1?=
 =?utf-8?B?UVB0Z1NwdXk3L204eGJKL3RJWUwwZHY0STFUalFJZG1mazJ6RkJFdXJtTUVz?=
 =?utf-8?B?RjVGOEI1MlZJZm9hK3pTWFVGLzBFanMxY1JLUGk0UGJyODkxeEM4N3QvUE9X?=
 =?utf-8?B?YWdDL3o5Zy9OT0ZZVTBMemJlcFpQbnZkY1ZwaFpFYW9qalFTY2dEWkFnTEpQ?=
 =?utf-8?B?UnFGbEkvRDRtSFNyUFR4ZTBnMVlCQ256Mk9PMGY0bmlxYXNNdjdiaUNjT29Q?=
 =?utf-8?B?WnBhODhoV3d3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkdVb2oxY1VyZVFqdlFUSGxhNkYzVnRTL2FEQmgvSEpvd2JxNGNlOElVN1VL?=
 =?utf-8?B?eUdDa1FFejM3aEJmL1BUUC9qcWJVa0E1dzJIZzJZWjJZVGVMMjJHMHlrSTZW?=
 =?utf-8?B?L3RFWGdXK3p0U1d5Qmpld0RuM3pwMGxWOU4wZUFQaFAzV2F6YnZRVkFYaEEr?=
 =?utf-8?B?N1lZU2hqaElmNmVRRW4wSjZ2a3c0UlY5eVlKOHYrR1pUYnZiSVV6QlBic0dS?=
 =?utf-8?B?Vi9sTG5CTmJsaXRRby8xZ1ZIYW9HZGpld0NwbDh2SHljMGEwLzg0UmZIYmNS?=
 =?utf-8?B?UTJzZkxGakxZakorY0ZVK2p0ZXFuREJ1TlZkWmNCWFluNEV3YzlaQlZxOXda?=
 =?utf-8?B?bFZvUUNrUG41OVFVMnhWeVEvbXRpNXVnN1JtamlDS2t1djhIcGw3OHcvMWNM?=
 =?utf-8?B?UklLbVdQYi8vRlNSb1k0VE5PMUdzNXhBWnNra1RyVmtVTEkzOXhCUmx2MXpk?=
 =?utf-8?B?dy91cjhFVVliUkE4UVBRcHU4VHpyZ3QrdG1VL1g1aUtIN1RrUWNoY2hIa0VP?=
 =?utf-8?B?TEhnRUtsTks0d3lzQXRhck1XVDcyVEkxZkd0LzFnWGM3U3VFTWZkTnR3QzZm?=
 =?utf-8?B?OWhiOE94T3p6Q2xGaVpVOGpmU3NUZ2U3MVdMSDltNzJNTndhTVpGRkFkSnIr?=
 =?utf-8?B?MEdvOTcrakpKVkttRHpIOE9vYitlQjVpUnBKZkozVElXa2RoVDJ5OFpad0U3?=
 =?utf-8?B?MzB6YnhvcWw0TnRmZFV4OERqS2Yxa09XWjNSeCtRM3VNYWNCSEpINnRTbU83?=
 =?utf-8?B?ODBrQmxUSnJwRmNNWlQ3UWxjK0tQWlI2SVhrVlJ1am9ibmsrZVM2eFFOTTJa?=
 =?utf-8?B?TFl3QWZCSFROT2U4T2pPRFdTWGFiZFNtaVBTNzBBZ1VScGdEQ3RBbThVWjZa?=
 =?utf-8?B?Q2JKMXU2bGhtbXZuK0Q3dnZhUTFTQnJvTndVUXoyWHUyajdqTTc1dWxuVlVa?=
 =?utf-8?B?cTBjSHdETUhWZ2EzMEt4WHNiVmc3YkZRNFBNRlRmbWZCN242c3BRVllJeFlQ?=
 =?utf-8?B?L2dUa2VIRWNtanNocmY5NGRrUVBQY0l5b0pyVmprQmlOKyt2cnJlU0MrTHdK?=
 =?utf-8?B?ajY1WnVMZEVaaEd3amdZc3BoVnhBN2pKZU9kWHFWM1pKS21mZkdKQ2NHQ1E1?=
 =?utf-8?B?VnNRNkU2RXdPMGdQY0RJT0hJeTZYY3BjdkFXVjR5cE92TFdUc0ZvK2duK3lt?=
 =?utf-8?B?L3o5OUIweTlSckVQSWpDLzI0MFZ4VERjK1h4bFFpMVREQTZUMEJlYVJyUHp5?=
 =?utf-8?B?M3dNc0F0b2o4U2U5VzdhNXJMekJxeXBrUlUybGRqdWFQb1Y1bFVHSk1pdEN5?=
 =?utf-8?B?MVR2TE9sazBXdGltbDNVUkNNMm44b0NzckdHYU8zUGh0YnlQcjEzV3NWTFdM?=
 =?utf-8?B?UzJMS2FkV2xub0hZUmhxZzlrbHplUHJFL21GaGJOQ1JqTHJyZThHVFltMDV2?=
 =?utf-8?B?M1E3M1ZXbWF6MFVsYjFBWXZFVGltU0pQaHZaM3FsZGovbStqa3VLZCtCUWFw?=
 =?utf-8?B?VlBxdFdubFpMdXp5VGgrNVRyZjlSK0FMcTBENU9UdVo5Um41dEF4RUx3eWhN?=
 =?utf-8?B?QktwamhPZmUyUU1ncEF4VW40Um1jajRicFNBT0tQMXM3ZzZWZ3MvNVZjZ1N3?=
 =?utf-8?B?Wnhrd3A1d1Z2YlRKNGt2TVhmN3k3MFB5Y3JaVFZEOUM1UUo2YVM0WUdYUkhq?=
 =?utf-8?B?REpEdmpVdTRNZmVCbHBLSnFUcDEraVlHazBhWk1ZVzJGR1ViMG0wclRHYnRl?=
 =?utf-8?B?RjJFS1RkZkJhQUVKOHRRNjVBTTNSeHFJVVBNc1Z2YXZnbUJqN1kvWEs5Mm5j?=
 =?utf-8?B?QnFad3NpYVBqWjRHRVNHSGQ2QU04Z3VQeHJCZGVGaXgvb0pPNVg1SmhXckRT?=
 =?utf-8?B?VVpQUVRUd2RObTIwenU2SkRxWDIzRVJOQTN2M3gvdDdOdDJCMFVoQ0Z6SDRO?=
 =?utf-8?B?ejFkS1psTjhtZVpPRVBzVGFkQTlqMFVmOXkyR1hzZDRMTHF5TUVuVmZDbW1a?=
 =?utf-8?B?a0hvT1pSTFVLQlkzaXpKYWsyRHc2TUtMNkwrc2RMdzZER2tSMForV1UrbHg3?=
 =?utf-8?B?OGxXVGRvUUtyQ3dlNTErK0pCSDVpQnVIWnZwcjlnQTNhdTBwNzBUZHZHSjdo?=
 =?utf-8?B?N2UzdWt4TU5VTFQ4ejZITW1wVk5RVnYvOUJuTHM5TjVFQlBwWm1UYURKdmJm?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40CAB7612B3E01448F060E7165536F1C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9036ee8-6291-4474-a221-08dddbcd45fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 07:28:04.4798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4v4dsknz+Sr5dzfJZGnUJqmODyAyXsPw3no+cNQEFBMPJGGyc/h/wvlUnZvoZ/l9lU9OCw3RDaaxFuMgqh3i0DIdAhmMRXm/YPfGdyXguQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7332

DQoNCk9uIDgvMTUvMjUgMTA6MDksIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA4
LTE1IDA5OjAwLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBGaXggdGhlIGZvbGxvd2lu
ZyBpc3N1ZXM6DQo+PiAxLiB4ZW4vZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdDo5MDogV0FSTklO
RzogSW5saW5lIGludGVycHJldGVkIHRleHQgb3INCj4+IHBocmFzZSByZWZlcmVuY2Ugc3RhcnQt
c3RyaW5nIHdpdGhvdXQgZW5kLXN0cmluZy4gW2RvY3V0aWxzXQ0KPj4gMi4geGVuL2RvY3MvbWlz
cmEvZGV2aWF0aW9ucy5yc3Q6NTQ6IEVSUk9SOiBFcnJvciBwYXJzaW5nIGNvbnRlbnQgYmxvY2sN
Cj4+IGZvciB0aGUgImxpc3QtdGFibGUiIGRpcmVjdGl2ZTogdW5pZm9ybSB0d28tbGV2ZWwgYnVs
bGV0IGxpc3QgZXhwZWN0ZWQsDQo+PiBidXQgcm93IDYgZG9lcyBub3QgY29udGFpbiB0aGUgc2Ft
ZSBudW1iZXIgb2YgaXRlbXMgYXMgcm93IDEgKDIgdnMgMykuDQo+PiAqIC0gUjIuMQ0KPj4gwqAg
LSBDYWxscyB0byB0aGUgYF9fYnVpbHRpbl91bnJlYWNoYWJsZSgpYCBmdW5jdGlvbiBpbnNpZGUg
dGhlIA0KPj4gZXhwYW5zaW9uIG9mDQo+PiDCoMKgwqAgdGhlIGBBU1NFUlRfVU5SRUFDSEFCTEUo
KWAgbWFjcm8gbWF5IGNhdXNlIGEgZnVuY3Rpb24gdG8gYmUgbWFya2VkIGFzDQo+PiDCoMKgwqAg
bm9uLXJldHVybmluZy4gVGhpcyBiZWhhdmlvciBvY2N1cnMgb25seSBpbiBjb25maWd1cmF0aW9u
cyB3aGVyZQ0KPj4gwqDCoMKgIGFzc2VydGlvbnMgYXJlIGVuYWJsZWQuIFRvIGFkZHJlc3MgdGhp
cywgdGhlIGBub3JldHVybmAgcHJvcGVydHkgZm9yDQo+PiDCoMKgwqAgYF9fYnVpbHRpbl91bnJl
YWNoYWJsZSgpYCBpcyBvdmVycmlkZGVuIGluIHRoZXNlIGNvbnRleHRzLCANCj4+IHJlc3VsdGlu
ZyBpbg0KPj4gwqDCoMKgIHRoZSBhYnNlbmNlIG9mIHJlcG9ydHMgdGhhdCBkbyBub3QgaGF2ZSBh
biBpbXBhY3Qgb24gc2FmZXR5LCBkZXNwaXRlDQo+PiDCoMKgwqAgYmVpbmcgdHJ1ZSBwb3NpdGl2
ZXMuDQo+PiDCoMKgwqAgWGVuIGV4cGVjdHMgZGV2ZWxvcGVycyB0byBlbnN1cmUgY29kZSByZW1h
aW5zIHNhZmUgYW5kIHJlbGlhYmxlIGluIA0KPj4gYnVpbGRzLA0KPj4gwqDCoMKgIGV2ZW4gd2hl
biBkZWJ1Zy1vbmx5IGFzc2VydGlvbnMgbGlrZSBgQVNTRVJUX1VOUkVBQ0hBQkxFKCkgYXJlIA0K
Pj4gcmVtb3ZlZC4NCj4+IDMuIHhlbi9kb2NzL21pc3JhL3J1bGVzLnJzdDoxMjc6IFdBUk5JTkc6
IElubGluZSBpbnRlcnByZXRlZCB0ZXh0IG9yIA0KPj4gcGhyYXNlDQo+PiByZWZlcmVuY2Ugc3Rh
cnQtc3RyaW5nIHdpdGhvdXQgZW5kLXN0cmluZy4gW2RvY3V0aWxzXQ0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+
IA0KPiBSZXZpZXdlZC1ieTogTmljb2xhIFZldHJpbmkgPG5pY29sYS52ZXRyaW5pQGJ1Z3Nlbmcu
Y29tPg0KPiANCj4gSSByZWNhbGwgdGhhdCBBbmRyZXcgd2FudGVkIHRvIGFkZCBhIGRvYyBidWls
ZCB0ZXN0IHRvIGF2b2lkIGludHJvZHVjaW5nIA0KPiB3YXJuaW5ncy4gT24gdGhhdCBmcm9udCwg
d2l0aCBteSBTcGhpbnggdmVyc2lvbiBJIGFsc28gc2VlIHRoaXMgYnVpbGQgDQo+IHdhcm5pbmc6
DQo+IA0KPiBSdW5uaW5nIFNwaGlueCB2OC4xLjMNCj4gV0FSTklORzogQ2FsbGluZyBnZXRfaHRt
bF90aGVtZV9wYXRoIGlzIGRlcHJlY2F0ZWQuIElmIHlvdSBhcmUgY2FsbGluZyANCj4gaXQgdG8g
ZGVmaW5lIGh0bWxfdGhlbWVfcGF0aCwgeW91IGFyZSBzYWZlIHRvIHJlbW92ZSB0aGF0IGNvZGUu
DQo+IA0KWWVzLCBJIHNlZSB0aGUgc2FtZSB3YXJuaW5nIG9uIG15IGVuZC4NCk5lZWQgdG8gYWRk
cmVzcyB0aGF0IGluIGRvY3MvY29uZi5weSBhcyB3ZWxsLg0KDQpEbXl0cm8uDQo+PiAtLS0NCj4+
IMKgZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdCB8IDMgKystDQo+PiDCoGRvY3MvbWlzcmEvcnVs
ZXMucnN0wqDCoMKgwqDCoCB8IDIgKy0NCj4+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvZGV2
aWF0aW9ucy5yc3QgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiBpbmRleCAzYzQ2YTFl
NDdhLi4yYmU0OTA3NmUxIDEwMDY0NA0KPj4gLS0tIGEvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJz
dA0KPj4gKysrIGIvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0KPj4gQEAgLTk1LDcgKzk1LDgg
QEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoNCj4+IMKgwqDCoMKg
wqDCoMKgIHRoZSBhYnNlbmNlIG9mIHJlcG9ydHMgdGhhdCBkbyBub3QgaGF2ZSBhbiBpbXBhY3Qg
b24gc2FmZXR5LCANCj4+IGRlc3BpdGUNCj4+IMKgwqDCoMKgwqDCoMKgIGJlaW5nIHRydWUgcG9z
aXRpdmVzLg0KPj4gwqDCoMKgwqDCoMKgwqAgWGVuIGV4cGVjdHMgZGV2ZWxvcGVycyB0byBlbnN1
cmUgY29kZSByZW1haW5zIHNhZmUgYW5kIA0KPj4gcmVsaWFibGUgaW4gYnVpbGRzLA0KPj4gLcKg
wqDCoMKgwqDCoCBldmVuIHdoZW4gZGVidWctb25seSBhc3NlcnRpb25zIGxpa2UgYEFTU0VSVF9V
TlJFQUNIQUJMRSgpIGFyZSANCj4+IHJlbW92ZWQuDQo+PiArwqDCoMKgwqDCoMKgIGV2ZW4gd2hl
biBkZWJ1Zy1vbmx5IGFzc2VydGlvbnMgbGlrZSBgQVNTRVJUX1VOUkVBQ0hBQkxFKClgIA0KPj4g
YXJlIHJlbW92ZWQuDQo+PiArwqDCoMKgwqAgLSBFQ0xBSVIgaGFzIGJlZW4gY29uZmlndXJlZCB0
byBpZ25vcmUgdGhvc2Ugc3RhdGVtZW50cy4NCj4+DQo+PiDCoMKgwqAgKiAtIFIyLjINCj4+IMKg
wqDCoMKgwqAgLSBQcm92aW5nIGNvbXBsaWFuY2Ugd2l0aCByZXNwZWN0IHRvIFJ1bGUgMi4yIGlz
IGdlbmVyYWxseSANCj4+IGltcG9zc2libGU6DQo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNyYS9y
dWxlcy5yc3QgYi9kb2NzL21pc3JhL3J1bGVzLnJzdA0KPj4gaW5kZXggNjgxMmViN2U4YS4uMzgy
MzMxNDQ3ZSAxMDA2NDQNCj4+IC0tLSBhL2RvY3MvbWlzcmEvcnVsZXMucnN0DQo+PiArKysgYi9k
b2NzL21pc3JhL3J1bGVzLnJzdA0KPj4gQEAgLTEyNCw3ICsxMjQsNyBAQCBtYWludGFpbmVycyBp
ZiB5b3Ugd2FudCB0byBzdWdnZXN0IGEgY2hhbmdlLg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB0aGV5IGFyZSB1c2VkIHRvIGdlbmVyYXRlIGRlZmluaXRpb25zIGZvciBhc20gbW9kdWxlcw0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC0gRGVjbGFyYXRpb25zIHdpdGhvdXQgaW5pdGlhbGl6ZXIg
YXJlIHNhZmUsIGFzIHRoZXkgYXJlIG5vdA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBleGVj
dXRlZA0KPj4gLcKgwqDCoMKgwqDCoMKgwqAgLSBGdW5jdGlvbnMgdGhhdCBhcmUgbm8tcmV0dXJu
IGR1ZSB0byBjYWxscyB0byB0aGUgDQo+PiBgQVNTRVJUX1VOUkVBQ0hBQkxFKCknDQo+PiArwqDC
oMKgwqDCoMKgwqDCoCAtIEZ1bmN0aW9ucyB0aGF0IGFyZSBuby1yZXR1cm4gZHVlIHRvIGNhbGxz
IHRvIHRoZSANCj4+ICdBU1NFUlRfVU5SRUFDSEFCTEUoKScNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbWFjcm8gaW4gZGVidWcgYnVpbGQgY29uZmlndXJhdGlvbnMgYXJlIG5vdCBjb25zaWRl
cmVkIA0KPj4gdmlvbGF0aW9uczo6DQo+Pg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdGF0aWMgaW5saW5lIGJvb2wNCj4gDQo=

