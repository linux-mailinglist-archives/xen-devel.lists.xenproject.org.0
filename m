Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D3926DAD
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753392.1161623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPCeR-0004ND-PR; Thu, 04 Jul 2024 02:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753392.1161623; Thu, 04 Jul 2024 02:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPCeR-0004KH-Kz; Thu, 04 Jul 2024 02:56:51 +0000
Received: by outflank-mailman (input) for mailman id 753392;
 Thu, 04 Jul 2024 02:56:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IA8J=OE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sPCeQ-0004KB-4d
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 02:56:50 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bc9fca8-39b1-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 04:56:47 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB9075.namprd12.prod.outlook.com (2603:10b6:510:2f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:56:40 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:56:40 +0000
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
X-Inumbo-ID: 0bc9fca8-39b1-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7lsSfhtICO37qih6cjdqKFH4kJMcD39HdfCs1JWpNmky6iJV3TFgcptiLbGnnecENW4s4DaH6hcHnl2xNjNWztcGBHtinUrIkDoI6kpwSxJr2B9gQhWzYborHwsyqUyHKItZbj5F5WzoNUiyDo0GUXmtAv82UFjVdQSgrpqMJhQRPLcRpP7hm7G3IOl0qCxsUojtLBaOn2024WkPuY9MujP63tZF0cFovA50B22Lu9Uv2qBlcsBuU386+U4fc4pUBs4DYN4iZWFIrtFMbSySPExq9kL6SkmhsC8EsWpjpKSCpmbupYgFmLN8DWVcKgkh+3ukOo9yBjit2zmFwHEig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgItmVizOQUNebkE99hyaAXfDoqWtU6pkcyCZhfI7TI=;
 b=DyST0RL69DRDGHvemH8MFo50aE1+1I59YR9BgIETZaxjpWzf+lj4xMR/Xa0LI+LnyyF4uKvZDvwCHv/ZW+3Dr6be+e1Vg+GsB49YAKdQlWdrJLOclLr4PhnSBlrc7AKUMSZ7vFDVaZgh+D1PpK1eT1zA0Ne6btfEghTXPRz+hSfROsWG0eAbJvmPjkRdyANWhzHfTSeqwTvisxcLe1asf6IDL05+61WpSoRNBXakcrOMF90OeuM1P0Acy0c4ddonVImXSkGIbfJniMuDsk/Z7PyZlLXk+SrYPZDJhjCKvmu0WggNoPu2BYkqjRJ8DaWJOpo9opxSKcSqJXgjqXPxuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgItmVizOQUNebkE99hyaAXfDoqWtU6pkcyCZhfI7TI=;
 b=J3zcm1dS6E89+GagV1CA05LmpaJWVALqMl4uRkopZafIxL4SxgNm39PAS6vReKD2e1y/XRKSG2/OsuqWPqInHA335V35TFPgRRTpAxY28BfBRMdgffj9ZidaJ4j5hzNRKjed3nX1WMiNJ/X1shuhKrmGL8UibFmVgfbrwq0fwps=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v11 2/8] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v11 2/8] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHayunRhQS+lhfPgk6PWMYxsBafhLHhf0AAgAHJ+4D//9kSgIADSGaA
Date: Thu, 4 Jul 2024 02:56:40 +0000
Message-ID:
 <BL1PR12MB5849C0E9310A505E95937BDEE7DE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-3-Jiqian.Chen@amd.com>
 <9a311ee0-dcf2-4609-aced-7f57b322da5f@suse.com>
 <BL1PR12MB5849C3882D31620ADAC55ADAE7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <d1b22fa7-870e-4968-ba5d-c5d6fccb0af7@suse.com>
In-Reply-To: <d1b22fa7-870e-4968-ba5d-c5d6fccb0af7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7719.007)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB9075:EE_
x-ms-office365-filtering-correlation-id: d985f108-783f-4bd2-8bbc-08dc9bd4edba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cDVuM3lUTVJZbTdXaGtia2R6UGhqNUcrTnJPZ0tURTlPSlZFN1pLMkdwMmtX?=
 =?utf-8?B?TjZJa3ZWbStQVlVBWDFsMGg5enU2cWhtdzZ3cS9tUW5sKzFUMzh0K3UrZW1j?=
 =?utf-8?B?WThEUlA0eW9Pd2VSOUJXZzN6dWsvcStVOGNQcDJNU3VUS2Z0ZFVKTVFNbzk0?=
 =?utf-8?B?YlM0K1ppb2NkZG9meW4zbzhNb2RiZ1pDK1o2aVpSYkdINy82dHpiZUpicnF5?=
 =?utf-8?B?ZlhRbG55MC8zWGN1TE1YdmIvRXhYVTZSWVlQL1JIbWpnbjJHY0hnVHRZS3cr?=
 =?utf-8?B?SHFhcktncmppNHo4Z2lkdW5WYTZOcHlYY0hSWmtETWdsWFI4cnk5aUdwNkM3?=
 =?utf-8?B?NG9lWlJIZ1dqQ1FPeDF5YzlMMG9SK3pIM2RWSEYxbVI0Mm5vVzRST0hMRHZT?=
 =?utf-8?B?NGRqQWU0ZExKa21lK2R5K3NTZHB6RFpsdkhWd2MzaUpGQU1SUFJmQ3hVdDZP?=
 =?utf-8?B?MFdyNFFERDFBYWpkWUVLckxmZ2RWV25YeE5QRnhUbnA2aTQxb3VGanhVc2Jm?=
 =?utf-8?B?WllKL2t1clRFZDRoZW9aNUxEVjJTTE9wd2VWbWtDbVZLUE1SQ253NTJqUlgw?=
 =?utf-8?B?MTNhbVdKeG9udmlXdFNvdSttRGhabk1nam1UNThyTEtQUDUrMHVOYzg2WXdy?=
 =?utf-8?B?SDN1eTlrT0NSOEFzUFBjb1l1azUzWDIvYURmTll1OStzUnhLMDFtWHBjaXFJ?=
 =?utf-8?B?UlN2ODZmL3BrSUN6dlJVTVd6SnlZRFhBQTVNbU4wbWZSTVlQb3VuRjZuWWZR?=
 =?utf-8?B?TnBrTEM0bmdwdEd0TnJoOTYrQnd3UlBSUi9QVHIwREdtQ0FTU0cyclNLNmwx?=
 =?utf-8?B?RWI5V2VGbGZOR0RJNEgwaFp3Mmt2bVJQdEVqekVqdFBBTlVZdStSRVpLUmJZ?=
 =?utf-8?B?NC9MM1d5eGp3RldnQ09DSEsvYkQwbWlZbGFydTBrL2Rsc3JNTUN1Rkl5dExT?=
 =?utf-8?B?dnk4UThHdVY5RGoySEtjU214ZTJ5ZkU3YmFpcDBWbWRIL2t5OGY0dFV0dllY?=
 =?utf-8?B?Q1YxV3BVbkhTMWRlUXgvN0dBTTJTNmpISkdWVk5FSzZTOVVFVUJ2MlBjMmhD?=
 =?utf-8?B?Z2U5V1lsbnR1aE1DalVpVVVON1pjbUVPeGJzVWlRY2dHd0o4L3NUM2IwV0JW?=
 =?utf-8?B?TnF4Y1k2OVRrZGhhMklIRUg5T1RDKzVHVzdEcVJvUnJySXo2cktWRWYrZWZY?=
 =?utf-8?B?WUo1Nit0czVrck5teUt6Rm53ZHR4akwycVNHZUx2a3c2R3lmZnd4cmtiYncy?=
 =?utf-8?B?QlplczdKS3g0SWRhT1JGVjNFUzVwdnl3dUhZUjZoMFZHQ3pRZmliWGR6N1ZY?=
 =?utf-8?B?ZjdZRDBmSXl3Z2U5a0svd2Z0VHhDbXlCS3d3TzVpSVZzTDhWZmo5SnI4MmQz?=
 =?utf-8?B?b2pyUWJ6eW9ubjBvcFJBYk9lSHhpV1hoWFg0REN5Mi9UbkswdFNacVZYYTNF?=
 =?utf-8?B?cy9tYjBLbGhIenh4cU1HeVhORGVYY0Z5SDY3UThVcHR6cE9DSXZPQm5CKzBm?=
 =?utf-8?B?NjZDVW53aWR4QWZsUVlWcmRrNXA0cmR3YTdqdU5maEEvUjAyMXIrY3QwdHF2?=
 =?utf-8?B?c3hPTUNnUmVFMWEwQTZhUjdXazBjVExrZWZLemQ5VGhneEJnN25abExhVDNU?=
 =?utf-8?B?VGJmU0o3UzZGaEJlbU5JNkdLVC8rcTZhWUw0b3JrWi92SjhlT29NUGxvYUh4?=
 =?utf-8?B?dlpobmxlQTVqckF5UWd4b2FQUDU1b0FxL2diZ3BVejN6Tmd0NmFUZjZvdTNC?=
 =?utf-8?B?OGdBTi8yVVFMdS9hcHA2U0JuUTN5L3RsdC9sbk9OSjBseTVvUk5aN2FTb2tp?=
 =?utf-8?B?TUtVbEZ5RStVSDEzWWlDVmsrK2VIUW5EbXEvaW5JUkx0eWhUQmxTWFN5M1Ru?=
 =?utf-8?B?Mkl3WkJLMGt1ZHpkd0ZMT05kZ1RVWnl2WW1OM2d1L0U4ckE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjRLNldEUDlUMXIwMVA0SlgwZHlhNS9VMSswd1dINkFtZFIxUlY0cnhzcXZy?=
 =?utf-8?B?ak5VeEFWL0dmNm0rUHV4YVpUMjI2Nm9vNGxub3RyS29yMDVPYkhkNGs3RjRB?=
 =?utf-8?B?ODlyaVl1N3UwazFMR3lRQ3pYVFlqSUlhR2VORndNQVB5RWdkRkJjeFE4TXBv?=
 =?utf-8?B?SGN5RlFmZkttb3BOQzFzVi8rREx0ZENkQUI2bTB4QlZqbko4aFVDRWQ0eE5I?=
 =?utf-8?B?cEtZSXN4T0ZTaWhYVGJHVE1YYWtrWGF1M0liZUpHalhRVXJUY2lvY1N4Vmdo?=
 =?utf-8?B?NlFremRnbjRPRUw2R3FSWVdsUGhlbmdWaWI2dHBxclpmRnVyZWg0SlZCZDFW?=
 =?utf-8?B?T0luREFSd202YmlPL1ozTjBNL0lUdktMb0FRSmxPdUpyQTh2YUtHaG9WKzBP?=
 =?utf-8?B?bTNJOWx5ZExWeG9GWDBaOEVyYWl2Q20zT1JMclc4LzROUDZWalorYlEwK2Ry?=
 =?utf-8?B?OVE3TG11RVdOeUtaMkFORVNTS3gybmFsb1hOWngvbGdMVWFwUGRUMmpMemVi?=
 =?utf-8?B?N25TbVAzSUVsY1hkRUd5b0xaTWRXT3NvTDMxT1RNYkdnVnNyTTZTMURQeldS?=
 =?utf-8?B?bThPcWs3VDM2Ry9uRXdvVE1vdGVienRLc2kwN21xTUtoVHNYZERoQXd4R0tC?=
 =?utf-8?B?anMzQld5V2xHQVhmdy9uR1hUMC96dktjUGkxcmQxQW1rUFRlWEgyT3Y5ajZr?=
 =?utf-8?B?Q1BFZ0tkTjFzUUppMm5SSnFsdjVDRGV1clhjamxFUTVFQjNMYmNtL2poNndM?=
 =?utf-8?B?RXU0c1BoTDd4QytRbXFqaWRGaWZJYjFsRFVLbG9iRjdIa1JsSUEraVNhSDhp?=
 =?utf-8?B?Z2VIaWx2M2NtQ2pPZmt1MUdQZ3hkcHBQL0NQTmVzcE9hSkRWRFZWZXJYSVhr?=
 =?utf-8?B?RTNDcWdkeGZWVnp0TG1tekpoY2NnOW5CczlhT3d0Wms3V3hOUkNXUzFFUnMv?=
 =?utf-8?B?ZmFWUk1STCtSdVdjS3JGQ2RQVlFQN3NSemZWRzdrTjY1cXlyeWlCZ2d0LzNr?=
 =?utf-8?B?OU9sMU8rcVdPMWFKaEYyTFIrdEpld1BlUWpPSmVqd3lWMmVuV2tOUTVQUmRN?=
 =?utf-8?B?ZjYrblJheEtheE5WckM4TjFjNDhQNnRDZkdJL3pGZitOM0RoNzVoai91MWpa?=
 =?utf-8?B?QTdUNnRsbHE4VjhCQ3VjWnZjaVZWMVdpTENDN3FKTm9sMXFkSnp4VUxGUUU3?=
 =?utf-8?B?ODN1SStTblB6a1dtdUtVYklaVHZFV2ZYQi9TbVFxOExQN2N1UDVHVDd6aEdC?=
 =?utf-8?B?amcwdm91bmZpN3JYbWMzU0d0OUpxY3oxMWJDV2c1TFNPMFU2SDR3T1FVbEg2?=
 =?utf-8?B?Z2NQcWd5WVFGdllNa1JHYitCb3p2eDlPcy9DRkZwMjlJb3pvMGc1c1RZOFFI?=
 =?utf-8?B?eFJzRUc2OFpWaHRMYi9vanNpMm9McEwxbUxtb2J4S2V2UG43TmUzRnEvYzRQ?=
 =?utf-8?B?dWdMSS9YM2xzOWRjZE9UU1JiRUFwVVB6TEt4bW5DUVdRUWdCUGQ5ay9GTlpG?=
 =?utf-8?B?OHdEKzBCaHl3SkdnR3gxZTZEZHRHc2hFQWxSbDVaYVc2cXNrdjllKzY3VzVp?=
 =?utf-8?B?aWRoaTFpeW8xejdVRnExTjU5b09mc2JkZjFtL0E0bW1pT2FhZTlMN1BicXdG?=
 =?utf-8?B?b3V2TXNDcTEyOXJnbkZZbUZ5bmR6dUZBNmJWTnBrZyszOGpBQjdxWUttT1Nw?=
 =?utf-8?B?RVdIWVI4T1JrTFlpRVZGMDIzSnZhVjlCNFI0SmJyWkFuai84amQxSWlHa0Zv?=
 =?utf-8?B?UXJvdVBpd0pQQWhjeWt0VkhqQ1l1WGR0djJZZkM2WEJsYUMwU25paVBQZGVP?=
 =?utf-8?B?SlZ2YjAxcXc1ZitpYUFMV3lMUk5YZjIzMHBHQ3BCWWNDNGVUMk9VYXFiSzNo?=
 =?utf-8?B?TXRnWjNqcDRzMytwVTE5VnZTbURDakZnWHZ1MU5qNTNBVGltU3RyYjcxMXF6?=
 =?utf-8?B?QU0rQStab2lybVhBQmttZVQ4WHI4aVdMd0VBMHFoYzVaVkIxclpWZU9hbWxY?=
 =?utf-8?B?MThnZDE4Vm1TYkNoZldHSWFNWFlkK3ZqSkp3WGhXQmw4Y2JQSVM3QXovOFdG?=
 =?utf-8?B?aVhUM0UzMitSM0xZbWF3azNGaWo2ZHRBL0JDSk5LcklGRWdoVTB0SlNYTXZU?=
 =?utf-8?Q?XLlg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10B2F35870B49A4CA8DE48CCC0C734C6@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d985f108-783f-4bd2-8bbc-08dc9bd4edba
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 02:56:40.3512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTPcop6ucfkwu9ugUZ9uzl0TOEdCLeCMfXsga49M7guQGNq5WAZcpwsbgkeoAxJeLIJslBCXFxEdCaUvrhva6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9075

T24gMjAyNC83LzIgMTY6NDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4wNy4yMDI0IDA1
OjE1LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzcvMSAxNTo0NCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4gT24gMzAuMDYuMjAyNCAxNDozMywgSmlxaWFuIENoZW4gd3JvdGU6DQo+
Pj4+IElmIHJ1biBYZW4gd2l0aCBQVkggZG9tMCBhbmQgaHZtIGRvbVUsIGh2bSB3aWxsIG1hcCBh
IHBpcnEgZm9yDQo+Pj4+IGEgcGFzc3Rocm91Z2ggZGV2aWNlIGJ5IHVzaW5nIGdzaSwgc2VlIHFl
bXUgY29kZQ0KPj4+PiB4ZW5fcHRfcmVhbGl6ZS0+eGNfcGh5c2Rldl9tYXBfcGlycSBhbmQgbGli
eGwgY29kZQ0KPj4+PiBwY2lfYWRkX2RtX2RvbmUtPnhjX3BoeXNkZXZfbWFwX3BpcnEuIFRoZW4g
eGNfcGh5c2Rldl9tYXBfcGlycQ0KPj4+PiB3aWxsIGNhbGwgaW50byBYZW4sIGJ1dCBpbiBodm1f
cGh5c2Rldl9vcCwgUEhZU0RFVk9QX21hcF9waXJxDQo+Pj4+IGlzIG5vdCBhbGxvd2VkIGJlY2F1
c2UgY3VycmQgaXMgUFZIIGRvbTAgYW5kIFBWSCBoYXMgbm8NCj4+Pj4gWDg2X0VNVV9VU0VfUElS
USBmbGFnLCBpdCB3aWxsIGZhaWwgYXQgaGFzX3BpcnEgY2hlY2suDQo+Pj4+DQo+Pj4+IFNvLCBh
bGxvdyBQSFlTREVWT1BfbWFwX3BpcnEgd2hlbiBkb20wIGlzIFBWSCBhbmQgYWxzbyBhbGxvdw0K
Pj4+PiBQSFlTREVWT1BfdW5tYXBfcGlycSBmb3IgdGhlIHJlbW92YWwgZGV2aWNlIHBhdGggdG8g
dW5tYXAgcGlycS4NCj4+Pj4gQW5kIGFkZCBhIG5ldyBjaGVjayB0byBwcmV2ZW50ICh1biltYXAg
d2hlbiB0aGUgc3ViamVjdCBkb21haW4NCj4+Pj4gaGFzIG5vIFg4Nl9FTVVfVVNFX1BJUlEgZmxh
Zy4NCj4+Pj4NCj4+Pj4gU28gdGhhdCB0aGUgaW50ZXJydXB0IG9mIGEgcGFzc3Rocm91Z2ggZGV2
aWNlIGNhbiBiZQ0KPj4+PiBzdWNjZXNzZnVsbHkgbWFwcGVkIHRvIHBpcnEgZm9yIGRvbVUgd2l0
aCBYODZfRU1VX1VTRV9QSVJRIGZsYWcNCj4+Pj4gd2hlbiBkb20wIGlzIFBWSA0KPj4+Pg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+Pj4g
U2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+Pj4gU2lnbmVk
LW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4+IFJldmlld2Vk
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4NCj4+
PiBZb3Uga2VlcCBjYXJyeWluZyB0aGlzIFItYiwgZGVzcGl0ZSBtYWtpbmcgZnVuY3Rpb25hbCBj
aGFuZ2VzLiBUaGlzIGNhbid0IGJlDQo+Pj4gcXVpdGUgcmlnaHQuDQo+PiBXaWxsIHJlbW92ZSBp
biBuZXh0IHZlcnNpb24uDQo+Pg0KPj4+DQo+Pj4gV2hpbGUgZnVuY3Rpb25hbGx5IEknbSBub3cg
b2theSB3aXRoIHRoZSBjaGFuZ2UsIEkgc3RpbGwgaGF2ZSBhIGNvZGUgc3RydWN0dXJlDQo+Pj4g
Y29uY2VybjoNCj4+Pg0KPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvcGh5c2Rldi5jDQo+Pj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMNCj4+Pj4gQEAgLTMyMyw2ICszMjMsMTMgQEAgcmV0
X3QgZG9fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFy
ZykNCj4+Pj4gICAgICAgICAgaWYgKCAhZCApDQo+Pj4+ICAgICAgICAgICAgICBicmVhazsNCj4+
Pj4gIA0KPj4+PiArICAgICAgICAvKiBQcmV2ZW50IG1hcHBpbmcgd2hlbiB0aGUgc3ViamVjdCBk
b21haW4gaGFzIG5vIFg4Nl9FTVVfVVNFX1BJUlEgKi8NCj4+Pj4gKyAgICAgICAgaWYgKCBpc19o
dm1fZG9tYWluKGQpICYmICFoYXNfcGlycShkKSApDQo+Pj4+ICsgICAgICAgIHsNCj4+Pj4gKyAg
ICAgICAgICAgIHJjdV91bmxvY2tfZG9tYWluKGQpOw0KPj4+PiArICAgICAgICAgICAgcmV0dXJu
IC1FT1BOT1RTVVBQOw0KPj4+PiArICAgICAgICB9DQo+Pj4+ICsNCj4+Pj4gICAgICAgICAgcmV0
ID0gcGh5c2Rldl9tYXBfcGlycShkLCBtYXAudHlwZSwgJm1hcC5pbmRleCwgJm1hcC5waXJxLCAm
bXNpKTsNCj4+Pj4gIA0KPj4+PiAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihkKTsNCj4+Pj4g
QEAgLTM0Niw2ICszNTMsMTMgQEAgcmV0X3QgZG9fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+Pj4gICAgICAgICAgaWYgKCAhZCApDQo+Pj4+
ICAgICAgICAgICAgICBicmVhazsNCj4+Pj4gIA0KPj4+PiArICAgICAgICAvKiBQcmV2ZW50IHVu
bWFwcGluZyB3aGVuIHRoZSBzdWJqZWN0IGRvbWFpbiBoYXMgbm8gWDg2X0VNVV9VU0VfUElSUSAq
Lw0KPj4+PiArICAgICAgICBpZiAoIGlzX2h2bV9kb21haW4oZCkgJiYgIWhhc19waXJxKGQpICkN
Cj4+Pj4gKyAgICAgICAgew0KPj4+PiArICAgICAgICAgICAgcmN1X3VubG9ja19kb21haW4oZCk7
DQo+Pj4+ICsgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+Pj4+ICsgICAgICAgIH0N
Cj4+Pj4gKw0KPj4+PiAgICAgICAgICByZXQgPSBwaHlzZGV2X3VubWFwX3BpcnEoZCwgdW5tYXAu
cGlycSk7DQo+Pj4+ICANCj4+Pj4gICAgICAgICAgcmN1X3VubG9ja19kb21haW4oZCk7DQo+Pj4N
Cj4+PiBJZiB5b3UgZGlkIGdvIGxvb2ssIHlvdSB3aWxsIGhhdmUgbm90aWNlZCB0aGF0IHdlIHVz
ZSAicmV0dXJuIiBpbiB0aGUgbWlkZGxlDQo+Pj4gb2YgdGhpcyBmdW5jdGlvbiBvbmx5IHZlcnkg
c3BhcmluZ2x5ICh3aGVuIGFsdGVybmF0aXZlcyB3b3VsZCByZXN1bHQgaW4gbW9yZQ0KPj4+IGNv
bXBsaWNhdGVkIGNvZGUgZWxzZXdoZXJlKS4gSSB0aGluayB5b3Ugd2FudCB0byBhdm9pZCAicmV0
dXJuIiBoZXJlLCB0b28sDQo+Pj4gYW5kIHByb2JhYmx5IGdvIGV2ZW4gZnVydGhlciBhbmQgYXZv
aWQgdGhlIGV4dHJhIHJjdV91bmxvY2tfZG9tYWluKCkgYXMgd2VsbC4NCj4+PiBUaGF0J3MgZWFz
aWx5IHBvc3NpYmxlIHRvIGFycmFuZ2UgZm9yICh0YWtpbmcgdGhlIGxhdHRlciBjYXNlIGFzIGV4
YW1wbGUpOg0KPj4+DQo+Pj4gICAgICAgICAvKiBQcmV2ZW50IHVubWFwcGluZyB3aGVuIHRoZSBz
dWJqZWN0IGRvbWFpbiBoYXMgbm8gWDg2X0VNVV9VU0VfUElSUSAqLw0KPj4+ICAgICAgICAgaWYg
KCAhaXNfaHZtX2RvbWFpbihkKSB8fCBoYXNfcGlycShkKSApDQo+Pj4gICAgICAgICAgICAgcmV0
ID0gcGh5c2Rldl91bm1hcF9waXJxKGQsIHVubWFwLnBpcnEpOw0KPj4+ICAgICAgICAgZWxzZQ0K
Pj4+ICAgICAgICAgICAgIHJldCA9IC1FT1BOT1RTVVBQOw0KPj4+DQo+Pj4gICAgICAgICByY3Vf
dW5sb2NrX2RvbWFpbihkKTsNCj4+Pg0KPj4+IFBlcnNvbmFsbHkgSSB3b3VsZCBldmVuIHVzZSBh
IGNvbmRpdGlvbmFsIG9wZXJhdG9yIGhlcmUsIGJ1dCBJIGJlbGlldmUNCj4+PiBvdGhlcnMgbWln
aHQgZGlzbGlrZSBpdHMgdXNlIGluIHNpdHVhdGlvbnMgbGlrZSB0aGlzIG9uZS4NCj4+Pg0KPj4+
IFRoZSByZS1hcnJhbmdlbWVudCBtYWtlIGEgbGl0dGxlIG1vcmUgbm90aWNlYWJsZSB0aG91Z2gg
dGhhdCB0aGUgY29tbWVudA0KPj4+IGlzbid0IHF1aXRlIHJpZ2h0IGVpdGhlcjogUFYgZG9tYWlu
cyBuZWNlc3NhcmlseSBoYXZlIG5vDQo+Pj4gWDg2X0VNVV9VU0VfUElSUS4gTWF5YmUgIi4uLiBo
YXMgbm8gbm90aW9uIG9mIHBJUlEiPw0KPj4NCj4+IE9yIGp1c3QgbGlrZSBiZWxvdz8NCj4+DQo+
PiAgICAgICAgIC8qDQo+PiAgICAgICAgICAqIFByZXZlbnQgdW5tYXBwaW5nIHdoZW4gdGhlIHN1
YmplY3QgaHZtIGRvbWFpbiBoYXMgbm8NCj4+ICAgICAgICAgICogWDg2X0VNVV9VU0VfUElSUQ0K
Pj4gICAgICAgICAgKi8NCj4+ICAgICAgICAgaWYgKCBpc19odm1fZG9tYWluKGQpICYmICFoYXNf
cGlycShkKSApDQo+PiAgICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsNCj4+ICAgICAgICAg
ZWxzZQ0KPj4gICAgICAgICAgICAgcmV0ID0gcGh5c2Rldl91bm1hcF9waXJxKGQsIHVubWFwLnBp
cnEpOw0KPiANCj4gTm8gb2JqZWN0aW9uIHRvIHRoZSBzbGlnaHRseSBjaGFuZ2VkIGNvbW1lbnQu
IFRoZSBjb2RlIGFsdGVybmF0aXZlIHlvdQ0KPiBwcmVzZW50IGlzIG9mIGNvdXJzZSBmdW5jdGlv
bmFsbHkgaWRlbnRpY2FsLCB5ZXQgcGVyc29uYWxseSBJIHByZWZlciB0bw0KPiBoYXZlIHRoZSAi
Z29vZCIgY2FzZSBvbiB0aGUgImlmIiBicmFuY2ggYW5kIHRoZSAiYmFkIiBvbmUgZm9sbG93aW5n
DQo+ICJlbHNlIi4gSSB3b3VsZG4ndCBpbnNpc3QsIHRob3VnaC4NCk9LLCB3aWxsIGNoYW5nZSAi
Z29vZCIgY2FzZSBvbiB0aGUgImlmIiBicmFuY2guDQpEbyBJIG5lZWQgdG8gY2hhbmdlICIhaXNf
aHZtX2RvbWFpbihkKSIgdG8gImlzX3B2X2RvbWFpbihkKSIgPw0KQW5kIHRoZW4gaGF2ZToNCg0K
ICAgICAgICAvKiBPbmx5IHVubWFwcGluZyB3aGVuIHRoZSBzdWJqZWN0IGRvbWFpbiBoYXMgYSBu
b3Rpb24gb2YgUElSUSAqLw0KICAgICAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSB8fCBoYXNfcGly
cShkKSApDQogICAgICAgICAgICByZXQgPSBwaHlzZGV2X3VubWFwX3BpcnEoZCwgdW5tYXAucGly
cSk7DQogICAgICAgIGVsc2UNCiAgICAgICAgICAgIHJldCA9IC1FT1BOT1RTVVBQOw0KDQo+IA0K
PiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

