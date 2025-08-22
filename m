Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CDBB318FD
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 15:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090139.1447512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upRbI-0003H3-Ix; Fri, 22 Aug 2025 13:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090139.1447512; Fri, 22 Aug 2025 13:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upRbI-0003Em-Fk; Fri, 22 Aug 2025 13:14:36 +0000
Received: by outflank-mailman (input) for mailman id 1090139;
 Fri, 22 Aug 2025 13:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kk10=3C=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1upRbG-0003Ef-IE
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 13:14:34 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee672d05-7f59-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 15:14:28 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB7477.eurprd03.prod.outlook.com (2603:10a6:20b:2b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Fri, 22 Aug
 2025 13:14:25 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 13:14:24 +0000
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
X-Inumbo-ID: ee672d05-7f59-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BI0LFQuX/1WrpIf1NP8y9I/hSbDE7QKk6oucDS9Z7Tx9E4LZtx+pKng9HIZna57oY46yXDOX73KIyPn0D48juXJ4zcV08QoO6L7Lg2Am3hL867yO7PRmEyi97HaD2URZfK6vYkfoEy8OeeMg9M0YdvYJKMs9k4bQ98Fib/YgTmKgz5ZRIi31zpfZsOkfqQ3ThfrhJ+qUJrdN8i4cP0TXL0lGewPecgo2/p/nhqiXu0UuPuCTwMDCudTx0IO5K2g9RsB2dXBkU2Z7Ritn8M40qHHobTLr+LTIjTuA7cjyS9CR6yn8mEzDA1DAuoWxlPtzBBNUAa9r4Ov+ukkSCxyhgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/KZF6fd8DRc90/vc1J4ox92l7UdFjA3RVd/50nTEe4=;
 b=vrR7bbsBkQpSwPhpuHUTwVq3xaRVyoBifSvCEI++tBSHlRDUXRGiF/T6H7BU9G6olXd5Bzx7VxKKB1IEyYDyun0N0istUZD+zcHRJo7NNgBpQnoTGwQY0ALalPcCDzIckm9r/GZgsPy3ZlayAgv2FEarqIUYqE0A5CLXc8IE+5RGNgbUWQ4zFya9aAvnsynLcaBdgSqB/PL4+ZUNDmgmvR3Oq2WlYqQuaO+Q1soP8FBAVVFhPRUgL9xqkHHRjrKeNNSy2GGi2w0D3SF5LDxqIy3e4hd8/BFrLdnP66ZDcdf2ZMGA2J0o7jBL3uNpf0YAaa2W8jGFuum1gQHmIkTXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/KZF6fd8DRc90/vc1J4ox92l7UdFjA3RVd/50nTEe4=;
 b=TIp3eeNFQSmcdVyvjYNj3pOIMNucTbSmghPqhw6vQwXtUa4bIdVxKq6N7Zh0nvWPvwIk5OkW1ZXz4lavNSWGe57X0O0gGMPJX7vIsh+m0tZoF9U43NWK8WjAHmKfIwep6nASZLTHxhB5nUriKbvj5BZV/OrSFDuNs/ZMBJSwfIgr2mlsFTcVQYC7A36l7uUdDtDg7wlOJSRDN6rgPyKJ3nqz0Eizh8bQ5cp7FGgH/4TPArCb53nvJLYcdZEoWrSiEDbFRczc7fkgHdOsk3apLa/kS5Yx1SjngmylU/qJOJKY/7EDVVAh8kyki6T1YO7eFhz+uXYND4fszM69xtTawg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3] common/efi: fix Rule 2.1 violation in read_file()
Thread-Topic: [PATCH v3] common/efi: fix Rule 2.1 violation in read_file()
Thread-Index: AQHcEqNkBxL+JigLCU+o9uoHNz/rIbRtKXaAgAAAfQCAAX4ggA==
Date: Fri, 22 Aug 2025 13:14:24 +0000
Message-ID: <47a787e0-a4fe-42f5-b7ec-7751383fe2b8@epam.com>
References:
 <4a1a4a3406d227348afa1ad2ce90dc5264fdb44a.1755783750.git.dmytro_prokopchuk1@epam.com>
 <aKcsObV9UssO8ckZ@mail-itl> <cf9f121b-347b-4406-9b93-63375c3bdab7@suse.com>
In-Reply-To: <cf9f121b-347b-4406-9b93-63375c3bdab7@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB7477:EE_
x-ms-office365-filtering-correlation-id: 7aa8fb79-8e74-4a7e-c5f9-08dde17dd0db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1NEZFdqZFpwcUhPeEMzd21iZGRoR3JRdXU1U3ZWUW4xOHpGSmJXZ1ZWd3lY?=
 =?utf-8?B?Vk83ak1lc3FvbHFqNWRUUUFKTS91bktJdjRWTGVPVC9XdnBTeG8xTitGTEJ5?=
 =?utf-8?B?TVI1WlQ0emxXaVVwanVDYWQ5NGdGT08wL3lqelE1VWwyV09FZnkrYkFNV21G?=
 =?utf-8?B?d0dreHlKMFIxUWdncHZZYlRsS2NWRTJJbk1qSHBnc2tkSnBCdzJxQVZBaDEw?=
 =?utf-8?B?TjJZUExlK0Nma1VocnlsTUYyZHVBSXVhSWpPSGlvTnF1R0dVK2lxbzI0bDkw?=
 =?utf-8?B?REE2R1A1YjNFaDA5OGhQTDlDbWZ3N3lHN0NhazJ4TlZkVkJDbERvSlZQWm9x?=
 =?utf-8?B?OWtrb3dYRkV5ZFR5Y2RoU3pnZEdnLzN0ckJpVHY5bkI5ZUVDN0hSTkZVSlJY?=
 =?utf-8?B?MFNhNElLbEliVmN6OEFMeFhwOE5QMkdJVTZBMEJTUzRQTmpLbUFYZGFPQTlW?=
 =?utf-8?B?QXFqU255RWZsQTlDelhwSGhpYjBZUzgrZWJpK3BaVE95UGsyWmZCTDAxdWE4?=
 =?utf-8?B?QW9LL2xYTEhmS1U2WEFRK2JnS1ZtWWhtOHpBQW9uUE9wVDQwOHJmejFwNDRq?=
 =?utf-8?B?RWN5bWhrTytYaEt1bHVYaWZhV1JOZXhuc2oyUmFLeTQ1M2Z0U0tBVTVGNFcz?=
 =?utf-8?B?UzVuenN3Y1pqMVk3UTJFcWVob2YwaDdjQUNrT0gxSVBZTlFtVEorNlJhOW5v?=
 =?utf-8?B?U09OeWFuczlCbVJHRDlKT1pneGZSdFArOHYvRmRGa3R0UTFyM1RDdGFwSDF3?=
 =?utf-8?B?V3NwWm9OaVN6eFk4ckVkY1Q4blBTdWp0anpweS80NEN4UkNpbXd1M2orc0Zz?=
 =?utf-8?B?c2ZXZjFaeW5ZVkRlTytzMTVGSWZNQXRYRWxKcS9FT3lFczNJVUNZNTRRMVZz?=
 =?utf-8?B?TU40TkxxaS9wTEsrcFNWZDRtNVRLSlBzZTcyTHhKOXdqRTd5Mm9zOWNidG8v?=
 =?utf-8?B?UE9qdmV2V2Q2d3ZKTitybHVUUm1aRmVTZ3V0blhSWEpJOFF2S3pIV1FvUnhM?=
 =?utf-8?B?algwTGsvOE0rZ0twNHhVNDE0dDRhcjBVdFYraW1vZXdnTndVU0dOUmM2SkZl?=
 =?utf-8?B?MnFzRWNrdUFrN283RkFTRXI5K2tHWWNKMkliUFBUNlFZVk4zTDVhR1ROaXhk?=
 =?utf-8?B?UHR3elliV3VrODJPSzFBSitBaWJIdFFCWldXOERESW9xS215V012SUU3aThs?=
 =?utf-8?B?VHNHYWF3MnlOdHd6dkpUT0FCS1FBbk9icDhTRDhNSTBibVM3N1V0bFhIUHpj?=
 =?utf-8?B?b1A1WEdkaWczKzA3STJFVkh1L0xkK29wcHlJSlZIYkZCbm03MUZuOS90UUhv?=
 =?utf-8?B?UjFWUUN5NGlCN1FMQjF0R01zR24wNFJtMTE2QktBSWhnZlBUOUVpMzE0M2VG?=
 =?utf-8?B?V09Ub3VBaDZvT2RVUVFHTGNjcUcxeVAyVE5pK0dwTXBOaTluLytQNkd6anl0?=
 =?utf-8?B?ZmlsaTJUTmRRdHJoejZMc0czcEhCamRiMGhzSkJlRFVBNE55OG9hSUVZQTA2?=
 =?utf-8?B?dU96b3VKMnJncjR5bjk5S0VCQVVnVmNZdENTd2tyd2YvRExBcGhuT1JFRlJm?=
 =?utf-8?B?dUVNSDZXY3VBZmFqSE9vcythSk1vTTJRMFhORS9ENzFYdnRIMVBQUG4vUXQ1?=
 =?utf-8?B?a2E2TXRQK1I1R2hsVjhBYnk1eXVJOERNSmZmK29OSHJndTJXcW4vWkhXTFFp?=
 =?utf-8?B?dnBsSmxKSG9RRVVqYXk4ZWkvUDR0V08yQ1VnYnNvSEdHYW5lRGdPcEdZVkZH?=
 =?utf-8?B?OVYyRVJUcEVZNCtBYzI0M01jMVd6cCtNUmZTNzhCNGdFQ1dsaGl4VXVkWVNG?=
 =?utf-8?B?OXFLSkdEcnN3TklBNFZ1bElwcENQRmZqYTV6Q0RZeUpWd21UTHBjcGpvOTcw?=
 =?utf-8?B?Q1pSN3g4ZXBYcXM2akRpaXI4Z09yVlBuN3hGV3BKbmc1RnZjNGNCeFV6Z3Uv?=
 =?utf-8?Q?RVt0Fwn377s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0xpSVhSNmUyN0hwdHlZYkRmTzBwQjR6RERXSjhKR1lLanNWR211MW1uSHNH?=
 =?utf-8?B?UE1hNllZRFF3NHM5VUdzSDNqeXZINm1NS2lNeVVBQmR6RDNyaW15cEF1YkYz?=
 =?utf-8?B?YUFJekFrRExPRGNIQkxzNFRYV0FMTTRDcDBvQlZNL0hMWkR5eUhPZithNlI1?=
 =?utf-8?B?VnBvNG9KdjFtRjhZNFBaNFI2Y1ZqcVdpNDNydkZIM1ZpbWFHTU40WnQxcjJu?=
 =?utf-8?B?UjZ4cG81S2w0SDBrb2NrK2NxUFlyTTdOeWFBZ2VubElSVnF2Nk95OW5YbjM2?=
 =?utf-8?B?T0lxT21CdWNQempQMkJUMGQ5ZU5FaVplR21vcFYxWSs5ZzNCVmVsc09NWUxy?=
 =?utf-8?B?MHF4U0pLbkZPdmZ2SXJaQUFXN0NLZFpxcjVKUTUwbnRSNDBIVHdMVE5NUDBN?=
 =?utf-8?B?NnJranptVXN2S21ELzJ4cjJxV3lBNUd3ZlBQWHNxRk5YaEdadGswNHZhSlNF?=
 =?utf-8?B?cXVBeGZBU2svNm5LOFNpTHJJV2Y4T3JyTFFEcExpUFN4WnpNTWU4NzVMYWJh?=
 =?utf-8?B?bHVTa0ZieXlkSCt2MjRib0pLbjR1U1JmbmxGbjFOUXVxeEV4QzRqbFZleFRS?=
 =?utf-8?B?UVBMMVExdTJPMndDRGZmcmFZRlowNXhqOVZOdXVYU0pEcUMwdkNuMEMvVTZR?=
 =?utf-8?B?S2wwQm5heXl5cmg2Q1Y0RkkxWUxPaDRWTnpjcXFhWTR5VUhPUTQ0Q094OHN3?=
 =?utf-8?B?YmQ2L1lGQnIySlFiWE5LUFhhNlE4Z1hkWGFSbzNKWVBncnJQRldVNGdxTlph?=
 =?utf-8?B?L3BMWk9FYkszc3d3Uzc1dGsvYmtxNlU4YlN2b1Z3Sk9hU1NFeTJmcS8veXRN?=
 =?utf-8?B?VkE4dnZ1SGhUOWU3anA5aUg0bmJWUU90Z1ZFNGdSdTNUK0J3cWRnTkNnbENB?=
 =?utf-8?B?dkI3RktkbG9HYXBVYmtpRWEzTVVGUlhMZC84bHpaMU1CSmlMUjBBNE9GSE05?=
 =?utf-8?B?QXNWWitaaUpvNVUvaDU4Zm1rWG5CL2FUc1ZRdjRiWDV4YjBmUy9lNlJUdExW?=
 =?utf-8?B?VlRibGxRMTVsUGFtK3BZTmNwR3Jna0tXL0M3U3JwM2d2QzBPUzB3NFlySFd1?=
 =?utf-8?B?UXJQUi91RkloK1N2cGJMNndHa1FuUXZZL1JvSGxoMFFkWEdrbldJdXo5RXMx?=
 =?utf-8?B?RGRLV1UrZ2FLb01ZUHl1KzczV013RmlyRytQUHVsZjIrb0YzVk1rUUZOTU81?=
 =?utf-8?B?bGI5SEM5eUEzdzRGR3NJaTRQcGFmZ3FvTWRkcW5tbGVVMGo0dnFERWdCbmRV?=
 =?utf-8?B?QjRrTVJEMnA2eERqKytwdTVIeUpra3U0NCtrWlRoaUZSbE1aMUVpV21JUkZP?=
 =?utf-8?B?b0cwVkxMSmYzNW5LdDNsbEZQSjM3aHNuQkZucHJwSXAxQllYYnhUcDQvWEhn?=
 =?utf-8?B?YnZ1bHNSSVhZUUVEOVp1MTIwOTdqaXVjc3c3Y0RwY09xNEpXY2czU2RIV2ti?=
 =?utf-8?B?VnFqMmh2bHd5U3JDWlJONlVBTkVaUWN1SzQzZEJvQjlHUkJJM0U2eDlZWWhj?=
 =?utf-8?B?QjdnUmRFSmhVYlJTb0l3azJyOTA3T09ZZW4wMmpnRW1FK0J6VG8ybzYzUFpP?=
 =?utf-8?B?R1QwTUNkL3hLMzBNeU1zNlVYRHFjcWhBK0VhUlMwd1dNZWU1aTJsTEFsK0s1?=
 =?utf-8?B?ZTNNRkpSKzFqODNOaG1EZ2tCQzRxMnh1cUUwVUxISXRxZC9VWnA1VXROS2Yz?=
 =?utf-8?B?c3l6L0w2Mzh4TFN6TDRWV0VhdnUyMm1uWk5RTmFzVEMwUWVLNks1Y1ZFNWlG?=
 =?utf-8?B?NnlVV0RhcG9kVHVKZy9lU29pZzFjbllhaHcvMGNYblJaTUIxVUQ0akJqZWda?=
 =?utf-8?B?UnpDZ1BFaFhyVTkzOGJBUStSZVJReDFkV1U5dkc2QlBQZEZWaWUrUC9wK0du?=
 =?utf-8?B?ZXdRaXhCVHJkbFNJQmc1UlhoTVJmWjU5RkRnMG1XTyt1dS9PSncrUXV4a1Z4?=
 =?utf-8?B?TjVybFBVb3dzd29nTitqWURBM01qL0M4TFBmK3gzU2hLQVpxOG5JOGtYaDJh?=
 =?utf-8?B?ZzY3TGx2a2hhUlhwYTNXckI3Qyt3aUtWUFFOTkVpUjU5eDdmcUhrNlFScjdo?=
 =?utf-8?B?UVhMWFdLWWNXTXV2RlNUUURZcWFJNFFKUnNDVC9iclpUL2Z6VFJQTXlCZHZ3?=
 =?utf-8?B?djY5NXZIVWcyRXdFZUV0S0JBY2RKR0hYZTYwK3RnTXdRQzVNdEJxbmU5Rk9t?=
 =?utf-8?B?Vmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FF3D43E34280546B1DE5CDFB46DD55C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa8fb79-8e74-4a7e-c5f9-08dde17dd0db
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 13:14:24.7615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +IVESJniQkHgSJbWuxgvv9Mx+vPo+rMUXPLL0kjn7hbH+FIzV2/6vYpAokeAuLLhYdW/QHGwnPSXc9Jwu7zQayfbxhiAb6T2lbS3l07QCwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7477

DQoNCk9uIDgvMjEvMjUgMTc6MjYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wOC4yMDI1
IDE2OjI0LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6DQo+PiBPbiBUaHUsIEF1
ZyAyMSwgMjAyNSBhdCAwMTo1NjoyOFBNICswMDAwLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6
DQo+Pj4gTUlTUkEgQyBSdWxlIDIuMSBzdGF0ZXM6ICJBIHByb2plY3Qgc2hhbGwgbm90IGNvbnRh
aW4gdW5yZWFjaGFibGUgY29kZS4iDQo+Pj4NCj4+PiBUaGUgcmV0dXJuIHN0YXRlbWVudHMgaW4g
dGhlICdyZWFkX2ZpbGUoKScgZnVuY3Rpb24gaXMgdW5yZWFjaGFibGUgZHVlDQo+Pj4gdG8gZnVu
Y3Rpb24gJ1ByaW50RXJyTWVzZygpJyB3aGljaCBoYXMgJ25vcmV0dXJuJyBhdHRyaWJ1dGU6DQo+
Pj4gICAgICAgICAgUHJpbnRFcnJNZXNnKG5hbWUsIHJldCk7DQo+Pj4gICAgICAgICAgLyogbm90
IHJlYWNoZWQgKi8NCj4+PiAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+Pj4gICAgICB9DQo+Pj4N
Cj4+PiBObyBleHBsaWNpdCByZXR1cm4gc3RhdGVtZW50IGlzIG5lZWRlZCBoZXJlLiBSZW1vdmUg
dGhlIHN0YXRlbWVudCBhbmQNCj4+PiB3cml0ZSBhIGp1c3RpZmljYXRpb24gY29tbWVudCBpbnN0
ZWFkLiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0
cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPj4+IC0tLQ0KPj4+
IExpbmsgdG8gdjI6DQo+Pj4gaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vYzIwYTU4ZjI0ODc1ODA2
YWRmYWY0OTFmOWM2ZWVmMmNhODY4MmQxOC4xNzU1NzExNTk0LmdpdC5kbXl0cm8uXzVGcHJva29w
Y2h1azFAZXBhbS5jb20vDQo+Pj4NCj4+PiBDaGFuZ2VzIGluIHYzOg0KPj4+IC0gcmVtb3ZlZCB1
bnJlYWNoYWJsZSBjb2RlIGluc3RlYWQgb2YgZGV2aWF0aW9uDQo+Pj4gLSB1cGRhdGVkIGNvbW1p
dCBzdWJqZWN0IGFuZCBtZXNzYWdlDQo+Pj4NCj4+PiBUZXN0IENJIHBpcGVsaW5lOg0KPj4+IGh0
dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZGltYXBya3A0ay94ZW4vLS9waXBl
bGluZXMvMTk5NjQzOTQ0NA0KPj4+IC0tLQ0KPj4+ICAgeGVuL2NvbW1vbi9lZmkvYm9vdC5jIHwg
MTAgKysrKysrKy0tLQ0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2VmaS9ib290LmMg
Yi94ZW4vY29tbW9uL2VmaS9ib290LmMNCj4+PiBpbmRleCA1MGZmMWQxYmQyLi4zMjVkZTA1YjE4
IDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYw0KPj4+ICsrKyBiL3hlbi9j
b21tb24vZWZpL2Jvb3QuYw0KPj4+IEBAIC04NTEsOSArODUxLDEzIEBAIHN0YXRpYyBib29sIF9f
aW5pdCByZWFkX2ZpbGUoRUZJX0ZJTEVfSEFORExFIGRpcl9oYW5kbGUsIENIQVIxNiAqbmFtZSwN
Cj4+PiAgICAgICBQcmludEVycih3aGF0KTsNCj4+PiAgICAgICBQcmludEVycihMIiBmYWlsZWQg
Zm9yICIpOw0KPj4+ICAgICAgIFByaW50RXJyTWVzZyhuYW1lLCByZXQpOw0KPj4+IC0NCj4+PiAt
ICAgIC8qIG5vdCByZWFjaGVkICovDQo+Pj4gLSAgICByZXR1cm4gZmFsc2U7DQo+Pj4gKyAgICAv
Kg0KPj4+ICsgICAgICogTm8gZXhwbGljaXQgcmV0dXJuIHN0YXRlbWVudCBpcyBuZWVkZWQgaGVy
ZSBiZWNhdXNlICdQcmludEVyck1lc2coKScgaXMNCj4+PiArICAgICAqIG1hcmtlZCBhcyAnbm9y
ZXR1cm4nLCB3aGljaCBndWFyYW50ZWVzIHRoYXQgaXQgbmV2ZXIgcmV0dXJucyBjb250cm9sIHRv
DQo+Pj4gKyAgICAgKiB0aGUgY2FsbGVyLiBJZiB0aGUgJ25vcmV0dXJuJyBhdHRyaWJ1dGUgb2Yg
J1ByaW50RXJyTWVzZygpJyBpcyByZW1vdmVkDQo+Pj4gKyAgICAgKiBpbiB0aGUgZnV0dXJlLCBj
b21waWxlciB3aWxsIGVtaXQgYW4gZXJyb3IgYWJvdXQgdGhlIG1pc3NpbmcgcmV0dXJuDQo+Pj4g
KyAgICAgKiBzdGF0ZW1lbnQgKGJ1aWxkLXRpbWUgc2FmZWd1YXJkKS4NCj4+PiArICAgICAqLw0K
Pj4NCj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyB2ZXJib3NlIGNvZGUgY29tbWVudCBpcyBuZWVkZWQg
aGVyZS4gT3RoZXIgc2ltaWxhciBwbGFjZXMNCj4+IHVzZSBzaW1wbHkgIkRvZXNuJ3QgcmV0dXJu
LiIgbmV4dCB0byB0aGUgZnVuY3Rpb24gY2FsbCwgb3Igbm90aGluZyBhdA0KPj4gYWxsIGlmIHRo
ZSBmdW5jdGlvbiBuYW1lIGFscmVhZHkgc3VnZ2VzdHMgaXQgKHdoaWNoIElNTyBpcyBub3QgdGhl
IGNhc2UNCj4+IGhlcmUpLg0KPg0KPiBPciBzaW1wbHkga2VlcCB0aGUgY29tbWVudCB0aGF0IHdh
cyBhbHJlYWR5IHRoZXJlPw0KPg0KPiBKYW4NCg0KQW55d2F5LCBjb21tZW50cyAiRG9lc24ndCBy
ZXR1cm4uIiBhbmQgIm5vdCByZWFjaGVkIiBhcmUgYWxtb3N0IHRoZSBzYW1lLg0KVG8gc2ltcGxp
ZnkgcGF0Y2gsIEknbSBnb2luZyB0byBsZWF2ZSBvbGQgY29tbWVudCAibm90IHJlYWNoZWQiIGFu
ZCBtb3ZlDQpkZXNjcmlwdGlvbiBpbnRvIGNvbW1pdCBtZXNzYWdlLg0KDQpEbXl0cm8uDQoNCj4N
Cj4+IFRoZSBsb25nZXIgZXhwbGFuYXRpb24gbWF5IGJlIHB1dCBpbiB0aGUgY29tbWl0IG1lc3Nh
Z2UuDQo+Pg0KPj4gV2l0aCB0aGF0IGFkZHJlc3NlZDoNCj4+DQo+PiBSZXZpZXdlZC1ieTogTWFy
ZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29t
Pg0KPj4NCj4NCg==

