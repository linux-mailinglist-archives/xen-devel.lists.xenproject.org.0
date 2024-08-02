Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311DC945915
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 09:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770237.1181189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmuz-0006fd-UP; Fri, 02 Aug 2024 07:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770237.1181189; Fri, 02 Aug 2024 07:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmuz-0006e9-Rg; Fri, 02 Aug 2024 07:41:41 +0000
Received: by outflank-mailman (input) for mailman id 770237;
 Fri, 02 Aug 2024 07:41:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPwv=PB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sZmuy-0006e3-3Z
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 07:41:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e88::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5bcc48a-50a2-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 09:41:38 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB9398.namprd12.prod.outlook.com (2603:10b6:8:1b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 07:41:34 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 07:41:34 +0000
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
X-Inumbo-ID: a5bcc48a-50a2-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybHqIo17bqX4FGMXw1/DV2sEAtsvMS30+yP7WS+SBYHG/NgKm/8rosEkFAYZBz1lZ0B+XosvOHWp0DXed6ze87YA/hupiHIrIB4ZsUpX0Kx/QxicdxHfGq+LYr++IDWHWUn06mmLKa4zixJFrTqv4TgukiPrbfmrC0AAGLNIOnWhe8UjNnm0WcvOtdQTx/gm6fr6u3kE96P0oFrJ+zLAwQYrg4/PRSsKQXsQpSGcV7kiFR6W0BF4b213hX4a5qyVYB5wbAPcBZCZw5G7l5UCo37yqwnPEWRnlEOL36Q+/oGoEkZhqrJ0J5FqABLfZsXbVGF8x9gvMpI4pNznRaYBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fH+k3BwtF+xYtPMPC2aM8D/eHY94ssqbSslGrN+Keg=;
 b=sOUvU9J1FWRDMvSbKif1d3z6qnnLdJdIOEuM/d3eEWVHdgmzyZy2cSLVlQPcVJGLdmYif5xUljud8T+2B1Srj0OmhrZOJJiRcssbcNTOI0sgjS5rGS0d70/WaHo1LWprNAX+b9G2xUTOznL7FqissjGnMfDbFWmun/88NHA5I1Vo5fOdj+/AbS4r51wLSReryddPhYSJ1HWSo5FITS33pHFcu7CPmRBx9vUB8LpSbm2v7O7WjbHREOTg1LjtSqCdeB/V73X+pj4gTQ8eLQU9z5uyc2K399QNvb8oRM3ED0xs6FWlYGqsaW0vaLZzoClsjudWugnOdj0RY+QVyhdHtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fH+k3BwtF+xYtPMPC2aM8D/eHY94ssqbSslGrN+Keg=;
 b=JxE2LLn08QOaQQt95dpjiPKbmiJqSj1PUMiTEgMk5S1ykbPM/3p8lvYBG6Q9kReaJCYvrJdBRguji5/GEKxmPqH4KXRCj1ciMn4xzg0MpX68TLSdr2unPhDUNDkkBL4qFILAgnwsbEluKK32x8HwwBKjACPRb1ODId+JY1V0/WA=
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
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
Thread-Topic: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
Thread-Index: AQHa0SvTLcqHcyv10kCa3wxjMJYih7IRIeaAgALMIQD//7lNAIAAmdOA
Date: Fri, 2 Aug 2024 07:41:34 +0000
Message-ID:
 <BL1PR12MB5849038C59C54C9FC8FD8048E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com> <ZqpeiWhuqPXiTeRZ@macbook>
 <BL1PR12MB5849CFC87F0DB92864B54BE4E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1ca7e6a2-698d-4548-9959-fd88126c25e1@suse.com>
In-Reply-To: <1ca7e6a2-698d-4548-9959-fd88126c25e1@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB9398:EE_
x-ms-office365-filtering-correlation-id: 3760aa4b-233d-472e-f2e6-08dcb2c6887b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K1FrVERnWDhTVlQvWHRsWlBENCtTZFZnRG1JQnJHR0phQncvdU42TW9mVXlp?=
 =?utf-8?B?UWFwczRxd3dPRnFEOXVtSUhSSkk3NGtnSW1PdXIxSlVUTXI4YUk5bGxTK0Yw?=
 =?utf-8?B?TVllZHhSdDZveUIxM0Z0blJxRW5SWmtESUZpVTVLRlc5WE56cy9OamJLaGhE?=
 =?utf-8?B?SEtUUmgxTVl2RlE5SlVWeHZyd3h5bnFTVWQ5NDVLUGpNclkvMmdLNUxDbWZQ?=
 =?utf-8?B?QXpOd3JZQW9BNUdsNyt6dEh5cTZmMExjeEJJMGNCdHZsak9sQWZSL2h2QnZV?=
 =?utf-8?B?TzdYMlNiRzlKcTRxMkg4ZVhER2p4aFYyRjFaS2d6N2pEaUNmbnlPcHdLajdi?=
 =?utf-8?B?TEhWMkFlbEZ6RDVyczFaSkhrdDVKTVhYdmdKZEJBWlh1OW9MUGNIOU13R1lr?=
 =?utf-8?B?Z2VJU2l6TCtIWWNYY3czV2tOWFZhRDBLSWlPN2RYODBUOEZpMkN2b1hlbHdi?=
 =?utf-8?B?cmxXK2NnREdXQTdlSnVmcXlRZXBqY2g1K0x5Y1Mzc2FRTWRpK1VFdGkybkZH?=
 =?utf-8?B?bWlXWmdmY0k5VVo4MDhxNWZoWkw0a2F2SERzTitWbXFHSWs3eTFsWmNhR0p3?=
 =?utf-8?B?dDRpUFdvZzdQVEZ4MDB6ZDRjZlRPRWdRWm1TQWtqMVgwOU85YTExdlB1dkRu?=
 =?utf-8?B?TEQ4SzRxbkJzRFZIVWdNQkRhbWVmMnpsdkdVbHF4YmZuOGlKVjArRWhiWXRD?=
 =?utf-8?B?aXgzUG81dkNQVXMya3ZQMDFBeVNtMkVFSnY1V1JJcmQ2aDg2ZDV3a3NZOTVG?=
 =?utf-8?B?ZjRlZGxpMXJ1cEgrVWYrcVBEc05EaGJKaUJTaldJamJYNE50cVVTSlVhVVpr?=
 =?utf-8?B?cC9RQzVtVGZZYnFMWnRwRTlYTEFqZGpPV05rakZ5OXJIMGp1TlBGaklySjN2?=
 =?utf-8?B?c0RQRVVIZ2d5ckRzVkV1WExWMTJvcVRxTUVjeWhxK2lyZmo0T09wMS9BVmhv?=
 =?utf-8?B?R05kd21tM3lST2JaUFNUakp3bXdoVXg4RERZL1o1aDZXcStTMVJQcFd3VGZH?=
 =?utf-8?B?aGF4VHA4ZjBHKzgxM2JJaGpZT0hIaWxwM0dXYjdyQ0ZXbCtIbXY2dlU2OUFE?=
 =?utf-8?B?VCtPWndncHVhQzBKRXFsVFVCUTZqcnVxOEp5MlRQWVZuWmxXT0d0UTRlQXpE?=
 =?utf-8?B?TFpNRWVWcFhXbGJMdjE5R21VNTFmdUhTVGM0RHBLR2V4YnJtN1I5b3hzckM0?=
 =?utf-8?B?K1JyU2J5MFhRZzBXSGk5MkJOS1M0VkNTMTNNSkpZN3B3bDZVV2VJRTdBUnBD?=
 =?utf-8?B?REM1MXl1V1hEbVZiZ0VZTkl6KzNUNDg4eUMrYkNlVTNxcFo4VjRNMlJ4L2Ir?=
 =?utf-8?B?RFJidmV0cXlVb2NtM1MrT2ZJS0J6bHYrVFRXQU84ZGVhazRJMzhyUHcxYUo2?=
 =?utf-8?B?OGxCMzFlSHhCcnlSWEZtcjcrZi9USEpuNUo2bUt4blBjTUQ5aDNPT3pMczhz?=
 =?utf-8?B?aTVERnlwbEhaeDkyME5HSjJRYW55WFFFWEJGcVovK29ZNng2ZG1sN0ZWSjRy?=
 =?utf-8?B?amEycnJhUzhCMG0xdkhCdkRheks1K0xqZVpxdHJ3d0NOU0ZXY1RFSDdJUXBY?=
 =?utf-8?B?UWRoOElNWW12WVFIMTVNeVI3dDY4YVNzaDArNFlMN2xOQldtcENmLzNERjc4?=
 =?utf-8?B?alVqSkhuU05UVmFkcTBlV29TVzVGN3pDSjhNU2tiMHhVSWZvL0I3bGlQSWNw?=
 =?utf-8?B?cUkvUVUxcDBTaVdkSE9WZW5jWnU5ZEgxRUZVdVJGbngwQndCNlRqeHhPN1pT?=
 =?utf-8?B?RjRxMU5XYllSajNrWDd1NERDK3RSK2p1dGp0Q3pwTmN1RjNNemVqS2Vzd1h1?=
 =?utf-8?B?NjVGeWJiWGc5SFBXZ1M2QXZ2WXRHWTgyczFLOGVIaFk0am5YMVNaQk1KdEta?=
 =?utf-8?B?Qm9vc241em93MzZ2dGtydk14bng3R081MmhucStMNW1KVEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHA3REZVaGJtUzExSTI2VUt1TlFidjlzOVpza0pudzY4MzFkYlZzQ2dSTWow?=
 =?utf-8?B?MWRkSDBrQWRwVE9xT2JLN3BGZGlrNFlQcEpBTEtkek5Wd0pMY3J3WDZ3azd3?=
 =?utf-8?B?R0g5RlFjdzZkYXdaNG5ZWmRLZGRXNTYxMUVha20weHQwUE1tTTNZMk9lN1NL?=
 =?utf-8?B?bkgvRXhjN0NWOHNMMlhKU2pMQ1BINWdFeDduZjUwM3hvcWprUWdLRXhjN2Jv?=
 =?utf-8?B?OE9FSHBoSkwyUXJLK3Ztd0RpdzI2cm1FN1N5bVMwTDVqenpUeUpHS1hlNXVE?=
 =?utf-8?B?bzB5OVFNaEkrUTA5czU5UWpLdGxRNk9rOVg0dnZZS2dKRDROSFAvUlRKQ3ll?=
 =?utf-8?B?cjE3WHZSb09LY3JqK3FTVExnb0kySjcwcThiWXpLaytMd1E0RnlPNExOa2o2?=
 =?utf-8?B?Rm9BaTJ0SDE1SGNEMU9SY24wbi93R3hvWEwrL0RsZG12MCtDNkpJMGZ1dEZN?=
 =?utf-8?B?N0djNFpVekt5NDIzSW9ncVI0S0xlaUNUWTk1M083S0NxSnJVRk5HemMrTkJy?=
 =?utf-8?B?SG1zVk9jL1pEbExaL2RxYklBYkU4K1UvMi9OWUNtVmVWZk14UCt1Z1NQenU4?=
 =?utf-8?B?OW1pS0lZMmlRTFY2YU94SHRZSEpMMW56SGkrQ256bjRvWXBveVlFclBsODZi?=
 =?utf-8?B?S2FvNGJRVVAyZk5HQVNRVGFqNzRSUDMrOEIyeFphSStsRHdod1MrQjFDY2JD?=
 =?utf-8?B?NkpRenN3QUU4UEd1QjR0WGR5SGhYeTNrOHJlNDNoR1ZBVWRVdExxZFZ3Uzdt?=
 =?utf-8?B?ZVArb3ZVQ2VhSmh3SkJHMWc3OFJVczgrRjB4V0hUQTNWcEJlMHVjeHE0bURj?=
 =?utf-8?B?REVoa1d3R2Nsa1V6UVh5Vll5cUFDbFRLdVZKV1YzSTlNQXpydEJsdjIvelJD?=
 =?utf-8?B?RzhjSEhGLzBQVVNkb3JaWjVOMFBNQkpXQmEwUXl0OURaWkR1TjZIRk5BSVJY?=
 =?utf-8?B?dFFEZXJTSmQ0blNwYnNoRXF6SXp3NjhxUnU2WW5vckUvTUZCUEg2Z0FqOEZS?=
 =?utf-8?B?cG5zaFNSWm9CamRIMzJXdlRIc0pEREpHMVNEWkI3am5WRGJpVjFxSHJRKzVw?=
 =?utf-8?B?TlBSb0NNUE1PZEZQQzFSZGJhMGdWMjRVWGVDd05NNGxIV3drU01tNGNXeEo0?=
 =?utf-8?B?TXpBYlFTdHBhaFlrZEcrZHNVMGF1Vy8vNWh1cEVoZWZzMW94Vlh3U1lwdktz?=
 =?utf-8?B?Z1lwYm1kL0lGUUlBRWhtbzRZQUlZd1hNNTJtZ0NHRGVxMllsRnY0aUkxK1NQ?=
 =?utf-8?B?ajVhZHdvWVRacmg3QmdheW9JRVd3OVhMM1RrM0JCanhNaGZUYnAzNEdKaGh3?=
 =?utf-8?B?UHRjbHN6a1o4SFozNHN4elJqcmhSSVpDMmFvTERoYSttZnl1N0tGSlk1dWJC?=
 =?utf-8?B?b0FSd1g0eUNwTUUyMTk1SEp3c3drTTRhN3pyMmFSQ2dPT0FFMWdZMmQwbmJ4?=
 =?utf-8?B?TjRQenhRK3phTlcralgrVDhFaitGc1ZnUUlPYmpTc3hRTVorVC9zWnNueVhr?=
 =?utf-8?B?b1B0eWQwcnE0dWIwOG5XVUVGM0Z1L0Jud3k3aDBzcVI2bm4vMUFJcFYvNklB?=
 =?utf-8?B?YmwraGp1ZjFOT2pzeWhkWmFPNEdiR093YzhrSGx2ekNQZXhRcElTZVFDdVZp?=
 =?utf-8?B?S0RQSW5PUTdQZHU5MXpXWnJxSTVzSk5adWZpdllPb2wxS2RyZ2xRcFhKYUlq?=
 =?utf-8?B?bTVhZGR0QXdEeDlWb24yUUVJODVjZGlibm44Rm0yWFBWS2FSbmEyRWJiWnla?=
 =?utf-8?B?b28xNUlrMkJmTTVXM3Z2MS9yZE5nbTNWUEtoTWF0R0JBY2xCS2g1RXdoMkdG?=
 =?utf-8?B?ZXBCUmowQXdXN1F2MGhFZHc3VXNxN2tRaTNZQVQwYjFBaW5JNmVYZ0VNdE9D?=
 =?utf-8?B?Z3lLenpaei9QRG52VklBQXptMUFSM2gvdi9qMkxGRG43bEZGKzVZZEtMWU12?=
 =?utf-8?B?YTlOL1pKeTBqWDZPMWU1S1pCZ0J0eU1vZXI4c3daT2lKcXdCU0dkeG9zTkJS?=
 =?utf-8?B?ZE9IZkRURnJjdlZ2REpTT053SDVlZ0RYcy9ZOU5QTjJjZDh1bTFpblNMbEpk?=
 =?utf-8?B?ZlJIRjZnd1Y1czhMNlVEOUp0eXVFMFZYejAyYnk0cFFzQWlzeXdVRGNtV01C?=
 =?utf-8?Q?qwxo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB50FFE7182C144F91F753FACDAF212B@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3760aa4b-233d-472e-f2e6-08dcb2c6887b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 07:41:34.2615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3a2RqYmXAqM8tWTw3U5OZToGQ+w3Kr21AESOXU2gGfOJMn0yiLbLRjKmCUMg3G2scNlFSUzShcLm4wx2dkXcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9398

T24gMjAyNC84LzIgMTQ6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4wOC4yMDI0IDA0
OjU1LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzcvMzEgMjM6NTUsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gTW9uLCBKdWwgMDgsIDIwMjQgYXQgMDc6NDE6MThQTSAr
MDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+IFdoZW4gYSBkZXZpY2UgaGFzIGJlZW4gcmVz
ZXQgb24gZG9tMCBzaWRlLCB0aGUgWGVuIGh5cGVydmlzb3INCj4+Pj4gZG9lc24ndCBnZXQgbm90
aWZpY2F0aW9uLCBzbyB0aGUgY2FjaGVkIHN0YXRlIGluIHZwY2kgaXMgYWxsDQo+Pj4+IG91dCBv
ZiBkYXRlIGNvbXBhcmUgd2l0aCB0aGUgcmVhbCBkZXZpY2Ugc3RhdGUuDQo+Pj4+DQo+Pj4+IFRv
IHNvbHZlIHRoYXQgcHJvYmxlbSwgYWRkIGEgbmV3IGh5cGVyY2FsbCB0byBzdXBwb3J0IHRoZSBy
ZXNldA0KPj4+PiBvZiBwY2lkZXYgYW5kIGNsZWFyIHRoZSB2cGNpIHN0YXRlIG9mIGRldmljZS4g
U28gdGhhdCBvbmNlIHRoZQ0KPj4+PiBzdGF0ZSBvZiBkZXZpY2UgaXMgcmVzZXQgb24gZG9tMCBz
aWRlLCBkb20wIGNhbiBjYWxsIHRoaXMNCj4+Pj4gaHlwZXJjYWxsIHRvIG5vdGlmeSBoeXBlcnZp
c29yLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5A
YW1kLmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+
DQo+Pj4+IFJldmlld2VkLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFu
ZEBhbWQuY29tPg0KPj4+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPg0KPj4+DQo+Pj4gVGhhbmtzLCBqdXN0IGEgY291cGxlIG9mIG5pdHMu
DQo+Pj4NCj4+PiBUaGlzIGlzIG1pc3NpbmcgYSBjaGFuZ2Vsb2cgYmV0d2VlbiB2ZXJzaW9ucywg
YW5kIEkgaGF2ZW4ndCBiZWVuDQo+Pj4gZm9sbG93aW5nIGFsbCB0aGUgdmVyc2lvbnMsIHNvIHNv
bWUgb2YgbXkgcXVlc3Rpb25zIG1pZ2h0IGhhdmUgYmVlbg0KPj4+IGFuc3dlcmVkIGluIHByZXZp
b3VzIHJldmlzaW9ucy4NCj4+IFNvcnJ5LCBJIHdpbGwgYWRkIGNoYW5nZWxvZ3MgaGVyZSBpbiBu
ZXh0IHZlcnNpb24uDQo+Pg0KPj4+DQo+Pj4+IC0tLQ0KPj4+PiAgeGVuL2FyY2gveDg2L2h2bS9o
eXBlcmNhbGwuYyB8ICAxICsNCj4+Pj4gIHhlbi9kcml2ZXJzL3BjaS9waHlzZGV2LmMgICAgfCA1
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4gIHhlbi9kcml2ZXJz
L3ZwY2kvdnBjaS5jICAgICAgfCAxMCArKysrKysrDQo+Pj4+ICB4ZW4vaW5jbHVkZS9wdWJsaWMv
cGh5c2Rldi5oIHwgMTYgKysrKysrKysrKysNCj4+Pj4gIHhlbi9pbmNsdWRlL3hlbi92cGNpLmgg
ICAgICAgfCAgOCArKysrKysNCj4+Pj4gIDUgZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygr
KQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYyBi
L3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+Pj4gaW5kZXggN2ZiMzEzNmYwYzdjLi4w
ZmFiNjcwYTQ4NzEgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxs
LmMNCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4+PiBAQCAtODMs
NiArODMsNyBAQCBsb25nIGh2bV9waHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVf
UEFSQU0odm9pZCkgYXJnKQ0KPj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX3BjaV9tbWNmZ19yZXNl
cnZlZDoNCj4+Pj4gICAgICBjYXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZDoNCj4+Pj4gICAg
ICBjYXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX3JlbW92ZToNCj4+Pj4gKyAgICBjYXNlIFBIWVNE
RVZPUF9wY2lfZGV2aWNlX3N0YXRlX3Jlc2V0Og0KPj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX2Ri
Z3Bfb3A6DQo+Pj4+ICAgICAgICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZCkgKQ0K
Pj4+PiAgICAgICAgICAgICAgcmV0dXJuIC1FTk9TWVM7DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4v
ZHJpdmVycy9wY2kvcGh5c2Rldi5jIGIveGVuL2RyaXZlcnMvcGNpL3BoeXNkZXYuYw0KPj4+PiBp
bmRleCA0MmRiM2U2ZDEzM2MuLmMwZjQ3OTQ1ZDk1NSAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGNpL3BoeXNkZXYuYw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy9wY2kvcGh5c2Rldi5j
DQo+Pj4+IEBAIC0yLDYgKzIsNyBAQA0KPj4+PiAgI2luY2x1ZGUgPHhlbi9ndWVzdF9hY2Nlc3Mu
aD4NCj4+Pj4gICNpbmNsdWRlIDx4ZW4vaHlwZXJjYWxsLmg+DQo+Pj4+ICAjaW5jbHVkZSA8eGVu
L2luaXQuaD4NCj4+Pj4gKyNpbmNsdWRlIDx4ZW4vdnBjaS5oPg0KPj4+PiAgDQo+Pj4+ICAjaWZu
ZGVmIENPTVBBVA0KPj4+PiAgdHlwZWRlZiBsb25nIHJldF90Ow0KPj4+PiBAQCAtNjcsNiArNjgs
NTcgQEAgcmV0X3QgcGNpX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh2b2lkKSBhcmcpDQo+Pj4+ICAgICAgICAgIGJyZWFrOw0KPj4+PiAgICAgIH0NCj4+Pj4gIA0K
Pj4+PiArICAgIGNhc2UgUEhZU0RFVk9QX3BjaV9kZXZpY2Vfc3RhdGVfcmVzZXQ6DQo+Pj4+ICsg
ICAgew0KPj4+PiArICAgICAgICBzdHJ1Y3QgcGNpX2RldmljZV9zdGF0ZV9yZXNldCBkZXZfcmVz
ZXQ7DQo+Pj4+ICsgICAgICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KPj4+PiArICAgICAgICBw
Y2lfc2JkZl90IHNiZGY7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgcmV0ID0gLUVPUE5PVFNVUFA7
DQo+Pj4+ICsgICAgICAgIGlmICggIWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgKQ0KPj4+
PiArICAgICAgICAgICAgYnJlYWs7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgcmV0ID0gLUVGQVVM
VDsNCj4+Pj4gKyAgICAgICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJmRldl9yZXNldCwgYXJnLCAx
KSAhPSAwICkNCj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+PiArDQo+Pj4+ICsgICAgICAg
IHNiZGYgPSBQQ0lfU0JERihkZXZfcmVzZXQuZGV2LnNlZywNCj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIGRldl9yZXNldC5kZXYuYnVzLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgZGV2X3Jlc2V0LmRldi5kZXZmbik7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgcmV0ID0geHNt
X3Jlc291cmNlX3NldHVwX3BjaShYU01fUFJJViwgc2JkZi5zYmRmKTsNCj4+Pj4gKyAgICAgICAg
aWYgKCByZXQgKQ0KPj4+PiArICAgICAgICAgICAgYnJlYWs7DQo+Pj4+ICsNCj4+Pj4gKyAgICAg
ICAgcGNpZGV2c19sb2NrKCk7DQo+Pj4+ICsgICAgICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXYoTlVM
TCwgc2JkZik7DQo+Pj4+ICsgICAgICAgIGlmICggIXBkZXYgKQ0KPj4+PiArICAgICAgICB7DQo+
Pj4+ICsgICAgICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0KPj4+PiArICAgICAgICAgICAgcmV0
ID0gLUVOT0RFVjsNCj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+PiArICAgICAgICB9DQo+
Pj4+ICsNCj4+Pj4gKyAgICAgICAgd3JpdGVfbG9jaygmcGRldi0+ZG9tYWluLT5wY2lfbG9jayk7
DQo+Pj4+ICsgICAgICAgIHBjaWRldnNfdW5sb2NrKCk7DQo+Pj4+ICsgICAgICAgIHN3aXRjaCAo
IGRldl9yZXNldC5yZXNldF90eXBlICkNCj4+Pj4gKyAgICAgICAgew0KPj4+PiArICAgICAgICBj
YXNlIFBDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfQ09MRDoNCj4+Pj4gKyAgICAgICAgY2FzZSBQQ0lf
REVWSUNFX1NUQVRFX1JFU0VUX1dBUk06DQo+Pj4+ICsgICAgICAgIGNhc2UgUENJX0RFVklDRV9T
VEFURV9SRVNFVF9IT1Q6DQo+Pj4+ICsgICAgICAgIGNhc2UgUENJX0RFVklDRV9TVEFURV9SRVNF
VF9GTFI6DQo+Pj4+ICsgICAgICAgICAgICByZXQgPSB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZShw
ZGV2LCBkZXZfcmVzZXQucmVzZXRfdHlwZSk7DQo+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+
Pj4gKw0KPj4+PiArICAgICAgICBkZWZhdWx0Og0KPj4+PiArICAgICAgICAgICAgcmV0ID0gLUVP
UE5PVFNVUFA7DQo+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+Pj4gKyAgICAgICAgfQ0KPj4+
PiArICAgICAgICB3cml0ZV91bmxvY2soJnBkZXYtPmRvbWFpbi0+cGNpX2xvY2spOw0KPj4+PiAr
DQo+Pj4+ICsgICAgICAgIGJyZWFrOw0KPj4+PiArICAgIH0NCj4+Pj4gKw0KPj4+PiAgICAgIGRl
ZmF1bHQ6DQo+Pj4+ICAgICAgICAgIHJldCA9IC1FTk9TWVM7DQo+Pj4+ICAgICAgICAgIGJyZWFr
Ow0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgYi94ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYw0KPj4+PiBpbmRleCAxZTZhYTVkNzk5YjkuLjdlOTE0ZDFlZmY5ZiAxMDA2
NDQNCj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4gKysrIGIveGVuL2Ry
aXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4gQEAgLTE3Miw2ICsxNzIsMTYgQEAgaW50IHZwY2lfYXNz
aWduX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gIA0KPj4+PiAgICAgIHJldHVy
biByYzsNCj4+Pj4gIH0NCj4+Pj4gKw0KPj4+PiAraW50IHZwY2lfcmVzZXRfZGV2aWNlX3N0YXRl
KHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVpbnQzMl90IHJlc2V0X3R5cGUpDQo+Pj4NCj4+PiBUaGVyZSdzIHByb2JhYmx5IG5vIHVzZSBp
biBwYXNzaW5nIHJlc2V0X3R5cGUgdG8NCj4+PiB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZSgpIGlm
IGl0J3MgaWdub3JlZD8NCj4+Pg0KPj4+PiArew0KPj4+PiArICAgIEFTU0VSVChyd19pc193cml0
ZV9sb2NrZWQoJnBkZXYtPmRvbWFpbi0+cGNpX2xvY2spKTsNCj4+Pj4gKw0KPj4+PiArICAgIHZw
Y2lfZGVhc3NpZ25fZGV2aWNlKHBkZXYpOw0KPj4+PiArICAgIHJldHVybiB2cGNpX2Fzc2lnbl9k
ZXZpY2UocGRldik7DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gICNlbmRpZiAvKiBfX1hFTl9fICov
DQo+Pj4+ICANCj4+Pj4gIHN0YXRpYyBpbnQgdnBjaV9yZWdpc3Rlcl9jbXAoY29uc3Qgc3RydWN0
IHZwY2lfcmVnaXN0ZXIgKnIxLA0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGlj
L3BoeXNkZXYuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9waHlzZGV2LmgNCj4+Pj4gaW5kZXggZjBj
MGQ0NzI3YzBiLi4zY2ZkZTNmZDIzODkgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1
YmxpYy9waHlzZGV2LmgNCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3BoeXNkZXYuaA0K
Pj4+PiBAQCAtMjk2LDYgKzI5NiwxMyBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRShwaHlzZGV2
X3BjaV9kZXZpY2VfYWRkX3QpOw0KPj4+PiAgICovDQo+Pj4+ICAjZGVmaW5lIFBIWVNERVZPUF9w
cmVwYXJlX21zaXggICAgICAgICAgMzANCj4+Pj4gICNkZWZpbmUgUEhZU0RFVk9QX3JlbGVhc2Vf
bXNpeCAgICAgICAgICAzMQ0KPj4+PiArLyoNCj4+Pj4gKyAqIE5vdGlmeSB0aGUgaHlwZXJ2aXNv
ciB0aGF0IGEgUENJIGRldmljZSBoYXMgYmVlbiByZXNldCwgc28gdGhhdCBhbnkNCj4+Pj4gKyAq
IGludGVybmFsbHkgY2FjaGVkIHN0YXRlIGlzIHJlZ2VuZXJhdGVkLiAgU2hvdWxkIGJlIGNhbGxl
ZCBhZnRlciBhbnkNCj4+Pj4gKyAqIGRldmljZSByZXNldCBwZXJmb3JtZWQgYnkgdGhlIGhhcmR3
YXJlIGRvbWFpbi4NCj4+Pj4gKyAqLw0KPj4+PiArI2RlZmluZSBQSFlTREVWT1BfcGNpX2Rldmlj
ZV9zdGF0ZV9yZXNldCAzMg0KPj4+PiArDQo+Pj4+ICBzdHJ1Y3QgcGh5c2Rldl9wY2lfZGV2aWNl
IHsNCj4+Pj4gICAgICAvKiBJTiAqLw0KPj4+PiAgICAgIHVpbnQxNl90IHNlZzsNCj4+Pj4gQEAg
LTMwNSw2ICszMTIsMTUgQEAgc3RydWN0IHBoeXNkZXZfcGNpX2RldmljZSB7DQo+Pj4+ICB0eXBl
ZGVmIHN0cnVjdCBwaHlzZGV2X3BjaV9kZXZpY2UgcGh5c2Rldl9wY2lfZGV2aWNlX3Q7DQo+Pj4+
ICBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRShwaHlzZGV2X3BjaV9kZXZpY2VfdCk7DQo+Pj4+ICAN
Cj4+Pj4gK3N0cnVjdCBwY2lfZGV2aWNlX3N0YXRlX3Jlc2V0IHsNCj4+Pj4gKyAgICBwaHlzZGV2
X3BjaV9kZXZpY2VfdCBkZXY7DQo+Pj4+ICsjZGVmaW5lIFBDSV9ERVZJQ0VfU1RBVEVfUkVTRVRf
Q09MRCAwDQo+Pj4+ICsjZGVmaW5lIFBDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfV0FSTSAxDQo+Pj4+
ICsjZGVmaW5lIFBDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfSE9UICAyDQo+Pj4+ICsjZGVmaW5lIFBD
SV9ERVZJQ0VfU1RBVEVfUkVTRVRfRkxSICAzDQo+Pj4+ICsgICAgdWludDMyX3QgcmVzZXRfdHlw
ZTsNCj4+Pg0KPj4+IFRoaXMgbWlnaHQgd2FudCB0byBiZSBhIGZsYWdzIGZpZWxkLCB3aXRoIHRo
ZSBsb3cgMiBiaXRzIChvciBtYXliZSAzDQo+Pj4gYml0cyB0byBjb3BlIGlmIG1vcmUgcmVzdCBt
b2RlcyBhcmUgYWRkZWQgaW4gdGhlIGZ1dHVyZSkgYmVpbmcgdXNlZCB0bw0KPj4+IHNpZ25hbCB0
aGUgcmVzZXQgdHlwZS4gIFdlIGNhbiBhbHdheXMgZG8gdGhhdCBsYXRlciBpZiBmbGFncyBuZWVk
IHRvDQo+Pj4gYmUgYWRkZWQuDQo+PiBEbyB5b3UgbWVhbiB0aGlzPw0KPj4gK3N0cnVjdCBwY2lf
ZGV2aWNlX3N0YXRlX3Jlc2V0IHsNCj4+ICsgICAgcGh5c2Rldl9wY2lfZGV2aWNlX3QgZGV2Ow0K
Pj4gKyNkZWZpbmUgX1BDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfQ09MRCAwDQo+PiArI2RlZmluZSBQ
Q0lfREVWSUNFX1NUQVRFX1JFU0VUX0NPTEQgICgxVTw8X1BDSV9ERVZJQ0VfU1RBVEVfUkVTRVRf
Q09MRCkNCj4+ICsjZGVmaW5lIF9QQ0lfREVWSUNFX1NUQVRFX1JFU0VUX1dBUk0gMQ0KPj4gKyNk
ZWZpbmUgUENJX0RFVklDRV9TVEFURV9SRVNFVF9XQVJNICAoMVU8PF9QQ0lfREVWSUNFX1NUQVRF
X1JFU0VUX1dBUk0pDQo+PiArI2RlZmluZSBfUENJX0RFVklDRV9TVEFURV9SRVNFVF9IT1QgIDIN
Cj4+ICsjZGVmaW5lIFBDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfSE9UICAgKDFVPDxfUENJX0RFVklD
RV9TVEFURV9SRVNFVF9IT1QpDQo+PiArI2RlZmluZSBfUENJX0RFVklDRV9TVEFURV9SRVNFVF9G
TFIgIDMNCj4+ICsjZGVmaW5lIFBDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfRkxSICAgKDFVPDxfUENJ
X0RFVklDRV9TVEFURV9SRVNFVF9GTFIpDQo+PiArICAgIHVpbnQzMl90IHJlc2V0X3R5cGU7DQo+
PiArfTsNCj4gDQo+IFRoYXQncyBmb3VyIGJpdHMsIG5vdCB0d28uIEknbSBwcmV0dHkgc3VyZSBS
b2dlciBtZWFudCB0byBrZWVwIHRoZSBlbnVtLQ0KPiBsaWtlICNkZWZpbmUtcywgYnV0IGFkZGl0
aW9uYWxseSBkZWZpbmUgYSAyLWJpdCBtYXNrIGNvbnN0YW50ICgweDMpLiBJDQo+IGRvbid0IHRo
aW5rIGl0IG5lZWRzIHRvIGJlIHRocmVlIGJpdHMgcmlnaHQgYXdheSAtIHdlIGNhbiBkZWNpZGUg
d2hhdCB0bw0KPiBkbyB0aGVyZSB3aGVuIGFueSBvZiB0aGUgaGlnaGVyIGJpdHMgYXJlIHRvIGJl
IGFzc2lnbmVkIGEgbWVhbmluZy4NCkxpa2UgdGhpcz8NCnN0cnVjdCBwY2lfZGV2aWNlX3N0YXRl
X3Jlc2V0IHsNCiAgICBwaHlzZGV2X3BjaV9kZXZpY2VfdCBkZXY7DQojZGVmaW5lIFBDSV9ERVZJ
Q0VfU1RBVEVfUkVTRVRfQ09MRCAweDANCiNkZWZpbmUgUENJX0RFVklDRV9TVEFURV9SRVNFVF9X
QVJNIDB4MQ0KI2RlZmluZSBQQ0lfREVWSUNFX1NUQVRFX1JFU0VUX0hPVCAgMHgyDQojZGVmaW5l
IFBDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfRkxSICAweDMNCiNkZWZpbmUgUENJX0RFVklDRV9TVEFU
RV9SRVNFVF9NQVNLICAweDMNCiAgICB1aW50MzJfdCBmbGFnczsNCn07DQoNCj4gDQo+IEphbg0K
DQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

