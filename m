Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5763694591F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 09:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770251.1181209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmxL-0007ch-O5; Fri, 02 Aug 2024 07:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770251.1181209; Fri, 02 Aug 2024 07:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmxL-0007aK-Ks; Fri, 02 Aug 2024 07:44:07 +0000
Received: by outflank-mailman (input) for mailman id 770251;
 Fri, 02 Aug 2024 07:44:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPwv=PB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sZmxK-0007Ha-BY
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 07:44:06 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:200a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd0eb4ed-50a2-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 09:44:04 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA1PR12MB6041.namprd12.prod.outlook.com (2603:10b6:208:3d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 07:44:01 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 07:44:00 +0000
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
X-Inumbo-ID: fd0eb4ed-50a2-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXsosKmaQDfo9SbN4MxzR8NSwVVFZlm/0mhhgXbmjpyIqU25R91i47QEoG+0PPbKhe6Gmqkj7Kd9X83/eIuAMmnUQ+zGIU/hm8sF72okXZLhL00xgv/4V6NZEl6tF45+KPCf7UZMDT1f0Ty4Uq/eHz7h4liq4Lb5xwVXOLpW+5OGb5ACf8XZmD8I89Z1gAL66CGEFWvxM1D5y1FkgCswrCbh6jdGw1MRkMFsfvuflgUA7AOSbVcAqAiea5JikOoFT2ux6gVmpSG5eK+4Gv6K+wklou2ReKW1i7SJCRKpa3AGn65PZtE4GPsid/RynD1n7RyeHhTSz5Xjbo8eznEa3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mz89nq9nGOP651vIzz0KZP5WlvOdOJYzzugb8MVDcRU=;
 b=PdfAzXZIAvM/h8IYBezKhUcq89UjIULq7C5pymK+utD1W1SCgik9GiKSFJC4OLNksl1YPCg+Dr6fvq92h581Q20ZUnReqDccGBFw5v7NRs5cga5sOe72RFSQpY5beQlLc07dNmiwQMVNnZfliK+MMNcCqIQNmZ+l5RBGPA7OqvKb/TC6DF9glhUcshE65sRqsSdeLG6HUemY9m5V0jKDEmzvrixeL8+zn8vjlJ49RHRaQ5iEqSdPV3ewQsUrk9EhQKD+DitzgPF3bEqngP6T+SIE2tWbVSzHjUlReIcsy8/cCAC48nCnLLXtOmPi01CUHZOxAVZqAGls9p77dNMXxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mz89nq9nGOP651vIzz0KZP5WlvOdOJYzzugb8MVDcRU=;
 b=LIGdSHgQICnT2UjC+oLYzWa2vyAPnoeiV10+6YXDhA07zloIK48gPVcFfRnKG5UVpxDQq/+EbL3rr5MqbOCBJZLbvKVxvITZObkpEN8k7Egj+wsoLtsMrkafLFWM+GtK3mtGm+kK3ED+TyY+LNNIUByc/DJXZRI+PrNCG+NdG7o=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Thread-Topic: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Thread-Index: AQHa0SvYL4tONjoIyEuzfSK6fk2TK7ISY3CAgAGQQYD//7QaAIAAmwuA
Date: Fri, 2 Aug 2024 07:44:00 +0000
Message-ID:
 <BL1PR12MB5849EFA5CDDA7FC4648FCF99E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com> <ZqtsQwZNyFzflDQt@macbook>
 <BL1PR12MB58490598FF7FEAE291DCDAABE7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <bd03a532-e404-483f-a04b-b19c3d6fa993@suse.com>
In-Reply-To: <bd03a532-e404-483f-a04b-b19c3d6fa993@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7828.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA1PR12MB6041:EE_
x-ms-office365-filtering-correlation-id: a312fc8f-c3a2-4228-2e8a-08dcb2c6dfe6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UDYzZUduS2R1UUxoenhtb1NVSEV2VG8yZDdsMUpNbE8yOFJYbnc1VTRmM0hy?=
 =?utf-8?B?bDFORG91SVFaQnd2bHI3elpTLzVuOS9Jam9YYXJ2NGtBNVJkWmh5UmtpTzhN?=
 =?utf-8?B?WFU5TjBzYWhaeGFLNDZJcDNqOHNGakp3T0JkWWtSVzVzby8xRVc4dlZUdHJM?=
 =?utf-8?B?d1ZnS1h0YmNEWjNvaVF5T2RKR1RxWUJwVXMwMUZ3Y1c4VElUd0dxcWJuNkhi?=
 =?utf-8?B?RzlRT0diaE9LMUtSZlpDWDNoOFNrKzQ4dXF3Q000bGt1eFlEbGRpcGhObWpr?=
 =?utf-8?B?OG5sMlNmUzZidmlRNFVaNkZhdDhTdFhpblRhbUZYODZRbmI3OXl1ZGFOTlh3?=
 =?utf-8?B?K2lDb2dPWTdCaVY4ZXM4N3NZMzR6eDJJZDRiZ3AxMGZJUm9XcUYxczluamFh?=
 =?utf-8?B?K2lLbURFZXdKdlNYSFZVQ0xpZmRrVjJ6S2tEQ3AwL2t0SkFadzB3b25Zenpu?=
 =?utf-8?B?S29sYisrbnU5c0pxY1U0QWZaRXczcXFuQ2E2dGtnenpjWms5OVBKUDRrQmhS?=
 =?utf-8?B?SDIzKzBzK2owcytRQmo2MnlBQ2gxbFNtblRVK2xXYUNHb3JLUDhINnpIQ0RR?=
 =?utf-8?B?MUozbzZZSFMyUDhzUmdHVC9EM1VKZlVXVHJSamNJME1NTXp0R0l3bjRxU0xI?=
 =?utf-8?B?aHdURXdYNWtHNzg3NGt4ajJvNkVJQTRYQUR1NGYrVkpoOXA0VS9zd1g3dk9k?=
 =?utf-8?B?UFJndWgyNnczTGt5cnh1UXJ3WDZ1b2RhTDhvM1g1dERoS2pEc1Q0bDBLQ2tO?=
 =?utf-8?B?eStEVEhHbzRPYkpKRGxhZHZFb3AzbDBuYXA4UFBBaU9HMVI0a1c0Y0ZXSWFT?=
 =?utf-8?B?V3RrL0o5Y2txSDRQU1RtSkg5VGhxa2tPVUVNZEFXdDNkNkJjOVFaVzd6MmhQ?=
 =?utf-8?B?Vk41SHg5cktjczFFdi9DQnhScjVkUVl2Y2xqa1MramlrcnlmWlpPT3pZTDhR?=
 =?utf-8?B?T2Zpc2ZIaGxKWUQzaEQxRVcvK3ZscWczTTg0WVF5cWlHNGMxNDZBMjh6S1pP?=
 =?utf-8?B?SzVWVS9CcGJGZHlFLzFXUzRmUTRSRi94alcyYzY1UnQ1UnoxcFYwcWdTWVpm?=
 =?utf-8?B?WFRmdjVmdGNVRzVJMC9xczZpc2c2WVVXdEJ2ODhnMGlLSUlSbGdDZ3VXVEdE?=
 =?utf-8?B?cXpqU3FqM3ZWUjVGTXZTWTl4c0tlVUdsbEtFVU0rVzZHTVA5ZjhtOGZFbzlV?=
 =?utf-8?B?d0RDOW5oL0x3UG1pR2FpcjM4ZGNpZHIxZ3dteHlPbXJ2MnBzNzJFSy9oN1hU?=
 =?utf-8?B?bng4OVNJQ1pibVRvdEozdGIrVTlHdkxTRWkvSTREV1ovS3dCNWozQ1Irc2JD?=
 =?utf-8?B?QkFGc29IeXl0U21SZEhoZFE3NHVJV1AyaXdheXg0bjdQREU3aXNGdWhHdThk?=
 =?utf-8?B?cmVmSFdiZG96cm5qV0hCUCtLYTJVMHFBZ1hsak1oZW5CTDNPSzloMy9JVkRJ?=
 =?utf-8?B?czZxOXpSWXhIS1AxV3F6UllwUUJINjNOQnFiMDFXUTcwamVBQVZGejF4eHZt?=
 =?utf-8?B?Z0JFZ0FmbW1QanhmOEh6NmpNOGxPK1VrR0Z5bUtjYy9uVW90czhnOEZqaDVy?=
 =?utf-8?B?dDg1SXJoNm5HTmxXbVh0VFFGMTd0TnFTdWJoQzRxNlJLbnpJNE5QZFUxTnps?=
 =?utf-8?B?empxUnFGelVjcndlTG8xVEdBN084SFBKUWdnb1FUc0RoYm1zbWVTUE1oc1pQ?=
 =?utf-8?B?UTk3SmtSNE1qY2g5azMwaUJjc2RjaXQ1MWlWa2VTeXRDd1ZTU2NoSWpvaDg0?=
 =?utf-8?B?Q1RWOWg1cS9lbTlSMllNNU1uenpULzdGRTRZN0dQaDB2U3N2YW1rUGtZdGVx?=
 =?utf-8?B?Syt0bWhUNjNVMzRuSWZtK3Fsck5jMnJJNDBtWlVrdUR6a2JjTlRMLzY0UlJl?=
 =?utf-8?B?ZDU2MU9zZ0g1MzF6bEZ4K3VEVGlTRXZyckZYTHhhNWlwUlE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGY4bzc0ZkdvMUtvWUZsUzVDVUIxTWc0MXp3UWZ4VnBod2xORXh2V0YrVThZ?=
 =?utf-8?B?UmtNUFZuQ2ZOMFRZR3Nhd0RYZkxMUGl4ZzdlS0sxZGxxRHdmUG45M0RhRnpp?=
 =?utf-8?B?M2VnQXlsVWN6UDhHZGwvc3UrZGtsSlplMjFONFhybHlndit4RG5pR2JWWWJi?=
 =?utf-8?B?NHp5d1VGQ0tRalZMTmdQOVVKSVI1OXlyNkRGZ0pVRmZDWmkrR29lS1c1S2hn?=
 =?utf-8?B?eWU4UWlwTU9peFprNGUyNVVhZHEzbS85QmtQOHZBWGtZdE1rbzBSbzNDa1Fs?=
 =?utf-8?B?K0tBMHJ2ZlYzU3ZZSzBTWkNlelJiWmRYdkJmaG04U0p4K0doUDZ3RXJlbXR0?=
 =?utf-8?B?RVYwbFl3d2ZGcDRnYUZyVDdNRFBuTVc5RHA0RUVraGpxeUV2Sjl3aTZRd2o1?=
 =?utf-8?B?M210VWJYSGlpaGROR0U2c3RTT1ppTzhJYUY5cG1ZcGRqbTFGMzJhV21PNHNE?=
 =?utf-8?B?TlVoTVVUc0hvQW1mem5rRStITkVQTG9rUWgxUDJoQlhGMGI1QnVrTnFZUlp2?=
 =?utf-8?B?NWZTOWdwS0pkVFVDSC9KQlA1eFpBZng5ZkN4NlY0a3FGTW9tRzJGMy9iTi84?=
 =?utf-8?B?VTY3MmZXTXpCS2NhMHZUVVRKT0RvWkxKZmxZUWIweUVrTWNTQjZiZ1JaZ1o3?=
 =?utf-8?B?SXBYRllLNU9odFNyN0xpb3pKNks3R3ozdkovTTljeGdwVHN3Ni96djE4ZnV6?=
 =?utf-8?B?ZGVBZkZUVW5zc3RPM0UyR0dETHFTMmM0WWpDUEZyV0pZV1Vsd1VoUVNvZnJW?=
 =?utf-8?B?b2t0QW96dmtlTlowM0Rmam1JQWlWNHNWdEcxMTI0aFg4TmFYK21kd3ZOT0Nw?=
 =?utf-8?B?eUtKRFpmUk82UjRwU0UrVnp2UU5sQTdUTFFYVVR1a3NkV0tmQVVQVkNZZjM1?=
 =?utf-8?B?SFdHY3QvNEt5VTIyNTVMZmovbVovY2FvQUlCcHBHR25JMkpta0xSenR1WGNr?=
 =?utf-8?B?OWoxZkRYajdXU0F1RDdzNFkrUmpJbkliZ0hlbkNWZHRJZ1FoRXN1WlMyV3ZV?=
 =?utf-8?B?eTNyMmhLTDZMQS8vd0JsVzJUWEw1dHlLdEF4Q2t2bHFwVFR1WVJMbnZZdjJ3?=
 =?utf-8?B?QjZiV2twUnlKU2NnTmlMUVN6Y1d2NG8zUTJ6cEVEaGdNRFNTWkU3UjN5STV0?=
 =?utf-8?B?RG1jWEh6MzAxb0RMaXBjT0lMMGJUY1F2N1YvNGtHbFpvaEFaVGVFQkY0Y2ls?=
 =?utf-8?B?MXZLTGx0ZTE1ZVd0U1YzUTNKSis4U25pbnc2OWVWOHo3U3M1MXlVeWVZS3JW?=
 =?utf-8?B?N3VuRTc4NDl2aWZDNGFUUTZsM3BoUXZLUTN1TzZuTTJLY3Q2RXE1V2UyT2FY?=
 =?utf-8?B?NnBRYWRDL3FrRjhDMVoxNlFGTzZkcVpodFpPSkFENlgwR3QvcHQ0SnlzYm0w?=
 =?utf-8?B?cFUvKzBRV1d0amxEM2xRbDcraDJNa2hyVE5QRlR1SGtZNkxRbVBRMjVkVDlC?=
 =?utf-8?B?eFZFbksxbEhPSXhrakh6ZGg1UGZYaDlobjhSRXUxRk5yTVQ0bkdkcEs1NTls?=
 =?utf-8?B?Tml4aWFsTk9nWXhpdUJLK2lCVnd2UnJybGJkRmxlc0ZELzNqQTRGY1lDa3pJ?=
 =?utf-8?B?RVp1SnpZVnJuWnVpejczbmVpL05CYmtNNEYxd0hzVzFFV1h4TjRiMjdtZm9k?=
 =?utf-8?B?T1FjQ1pjZnh4aHMyVEh1ZkVidXVFSC9heVNyNnA1ZDB3RTlrUnZ2ZjV5Y2Nj?=
 =?utf-8?B?WTM5VTVGSHd1YjhZS0srQnRTeUZuUG83UGs3ZVJWNjlFbnVQY29PbVZBRzl4?=
 =?utf-8?B?VjFwMjgrVHhCR2JwSDlQOHFEekpFQ3ZkTXlkWHJObnBkSDFyaUZOVEpTSTZr?=
 =?utf-8?B?cFV3a0h6Vk9QdmE5MmE1WlE3MHNLTHJFUDRSbm1SdDJxakNhRmdmTWZwUUlW?=
 =?utf-8?B?dkNydkdIeVF4QWxxTUEvdTVzdWtMbFZnRUlXMCtndE81RFU3YkVGeElQcktr?=
 =?utf-8?B?UHJnUEpQOU50OHZvOHZaclRUL2dDQXRXeGlSUlVjVjkrYW1rVU5NU056WkpV?=
 =?utf-8?B?OHVMdDFqalZPSjV2SHFVcGlaYVM0cmF4cHlkdDdodE02SlJCYmdwM2lqeW5w?=
 =?utf-8?B?UWFQdnc0NVJLVVFyV25EQitJMi9xWEg5SFFSSzBRMDF4SVBKR2NuZkQ4TUQ1?=
 =?utf-8?Q?1l1M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D5330335215E749AB8FF541BDB65416@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a312fc8f-c3a2-4228-2e8a-08dcb2c6dfe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 07:44:00.9401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DLVeaPtTIh8WoarQhY3WsdhcZFRF2X3Bs3iieHKHaR1tILd7Hcg8O8SnCIZjxsuO4QaCUbrr++P9693VaaCGWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6041

T24gMjAyNC84LzIgMTQ6MjcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4wOC4yMDI0IDA1
OjEwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzgvMSAxOTowNiwgUm9nZXIgUGF1
IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBNb24sIEp1bCAwOCwgMjAyNCBhdCAwNzo0MToyMVBNICsw
ODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2Rv
bWN0bC5oDQo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPj4+PiBAQCAt
NDY0LDYgKzQ2NCwxMyBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9pcnFfcGVybWlzc2lvbiB7DQo+Pj4+
ICAgICAgdWludDhfdCBwYWRbM107DQo+Pj4+ICB9Ow0KPj4+PiAgDQo+Pj4+ICsvKiBYRU5fRE9N
Q1RMX2dzaV9wZXJtaXNzaW9uICovDQo+Pj4+ICtzdHJ1Y3QgeGVuX2RvbWN0bF9nc2lfcGVybWlz
c2lvbiB7DQo+Pj4+ICsgICAgdWludDMyX3QgZ3NpOw0KPj4+PiArI2RlZmluZSBYRU5fRE9NQ1RM
X0dTSV9QRVJNSVNTSU9OX01BU0sgMQ0KPj4+DQo+Pj4gSU1PIHRoaXMgd291bGQgYmUgYmV0dGVy
IG5hbWVkIEdSQU5UIG9yIHNpbWlsYXIsIG1heWJlIHNvbWV0aGluZyBsaWtlOg0KPj4+DQo+Pj4g
LyogTG93IGJpdCB1c2VkIHRvIHNpZ25hbCBncmFudC9yZXZva2UgYWN0aW9uLiAqLw0KPj4+ICNk
ZWZpbmUgWEVOX0RPTUNUTF9HU0lfUkVWT0tFIDANCj4+PiAjZGVmaW5lIFhFTl9ET01DVExfR1NJ
X0dSQU5UICAxDQo+Pj4NCj4+Pj4gKyAgICB1aW50OF90IGFjY2Vzc19mbGFnOyAgICAvKiBmbGFn
IHRvIHNwZWNpZnkgZW5hYmxlL2Rpc2FibGUgb2YgeDg2IGdzaSBhY2Nlc3MgKi8NCj4+Pj4gKyAg
ICB1aW50OF90IHBhZFszXTsNCj4+Pg0KPj4+IFdlIG1pZ2h0IGFzIHdlbGwgZGVjbGFyZSB0aGUg
ZmxhZ3MgZmllbGQgYXMgdWludDMyX3QgYW5kIGF2b2lkIHRoZQ0KPj4+IHBhZGRpbmcgZmllbGQu
DQo+PiBTbywgc2hvdWxkIHRoaXMgc3RydWN0IGJlIGxpa2UgYmVsb3c/IFRoZW4gSSBqdXN0IG5l
ZWQgdG8gY2hlY2sgd2hldGhlciBldmVyeXRoaW5nIGV4Y2VwdCB0aGUgbG93ZXN0IGJpdCBpcyAw
Lg0KPj4gc3RydWN0IHhlbl9kb21jdGxfZ3NpX3Blcm1pc3Npb24gew0KPj4gICAgIHVpbnQzMl90
IGdzaTsNCj4+IC8qIExvd2VzdCBiaXQgdXNlZCB0byBzaWduYWwgZ3JhbnQvcmV2b2tlIGFjdGlv
bi4gKi8NCj4+ICNkZWZpbmUgWEVOX0RPTUNUTF9HU0lfUkVWT0tFIDANCj4+ICNkZWZpbmUgWEVO
X0RPTUNUTF9HU0lfR1JBTlQgIDENCj4+ICNkZWZpbmUgWEVOX0RPTUNUTF9HU0lfUEVSTUlTU0lP
Tl9NQVNLIDENCj4+ICAgICB1aW50MzJfdCBhY2Nlc3NfZmxhZzsgICAgLyogZmxhZyB0byBzcGVj
aWZ5IGVuYWJsZS9kaXNhYmxlIG9mIHg4NiBnc2kgYWNjZXNzICovDQo+PiB9Ow0KPiANCj4gWWV0
IHRoZW4gd2h5ICJhY2Nlc3NfZmxhZ3MiPyBZb3UgY2FuJ3QgZm9yZXNlZSB3aGF0IG1lYW5pbmcg
dGhlIG90aGVyIGJpdHMgbWF5DQo+IGdhaW4uIFRoYXQgbWVhbmluZyBtYXkgKGFuZCBsaWtlbHkg
d2lsbCkgbm90IGJlIGFjY2VzcyByZWxhdGVkIGF0IGFsbC4NCg0KT0ssIGp1c3QgInVpbnQzMl90
IGZsYWdzIi4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4u
DQo=

