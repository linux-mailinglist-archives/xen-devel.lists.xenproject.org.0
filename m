Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DVDOfR4gGne8gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 11:14:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30318CAA99
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 11:14:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218496.1527242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqwH-00068j-Uk; Mon, 02 Feb 2026 10:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218496.1527242; Mon, 02 Feb 2026 10:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqwH-00066f-S9; Mon, 02 Feb 2026 10:13:49 +0000
Received: by outflank-mailman (input) for mailman id 1218496;
 Mon, 02 Feb 2026 10:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vmqwG-00065n-Az
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 10:13:48 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d95f3053-001f-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 11:13:42 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV9PR03MB8365.namprd03.prod.outlook.com (2603:10b6:408:368::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Mon, 2 Feb
 2026 10:13:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:13:39 +0000
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
X-Inumbo-ID: d95f3053-001f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbexHpWNzUw0SJS89k57XvEz5ZA8fcJgMrFAQ9C62W7EYPqvBJ/J6ED1Zgdr741JcbvkvIQxysRNJ+NPfii2s7L4XNGf7v7R75doXB+xlZz4abuj6yq6qRvvsMs2b5YZy4FjY7nbPLwdSg+OGC5JICN4smF18ALiX09V4Q/NYSpUvo4yPFeYppyXji0aCREc+/+T5asW8wStvNPj3W7DNzmqAwv5WZZR0KmgWYjG6wh8W8yNh0BnWjPbxHlmDtvT35XRJZcvW/p7FCq8dMGhzrJfEWG1eLWldr3oW5NkFZYCnCU9bCh4jDx9CzJqNH6yA3WiXazJHSuRT3bJgs9HDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nt5TLNNS0NhK2LvGZv5MqbgM6uN28wkBGBeR3kvXkJ4=;
 b=Fv3QZ6O6q+SdGp68HiNdql/ms+C5T+3Dj5kjoozUiccrQfyLMhwK4MFsbPX/ny5opbONQSPc5+cSK4bCuWs1xW4OBiiEgja16ZAo6Hgjeh/D9pmJnf+y+UTEnHJeY/cBi/heFIF3eWe5/RxpRj62zAct00z0wc+qVU+WwneTbiBf5eKibNV5sPQXBjrb2zmWIF4Ht4XL9AKCRNYuCxbLxJGmdpE8L7WvnAblWoaTZyA0tShxV0NxRycGYaU5eFTCjDjv1JZuF+UiZQsA8lD/WmceHlmXxGjYKR4CUxNcZ6oV0xQTo2Qh8RDPTn91gJAYLbpcVZP5q1/I2U4No/wGCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt5TLNNS0NhK2LvGZv5MqbgM6uN28wkBGBeR3kvXkJ4=;
 b=MFoLPNSGDqgDdcPVGqb463qpIwz8wkf/CvO2GhzPSUtIMhTgnruiqNwTmUsvN2cWdcMewh7hQlVnVKpJdSzKVLX1zTkBt+vw37++iwkKMaWp17+3t4RgOXRF3rzOq7zsm2SyNT3TDWT0J1vEuyTVqiVPbq6aFgfZ3aiyMe3d/1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Feb 2026 11:13:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/6] x86/PCI: avoid re-evaluation of extended config
 space accessibility
Message-ID: <aYB4z8CSA590Ytpo@Mac.lan>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <a0b10d39-daae-4fc0-af42-a3794a96f9f5@suse.com>
 <b63b0f9e-93cd-4b55-a7c0-f8eab9df1947@suse.com>
 <aYBq2EoeP_TGv_sK@Mac.lan>
 <1bcdd2dd-9b2b-4eb2-a569-e28b03c1e1fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bcdd2dd-9b2b-4eb2-a569-e28b03c1e1fb@suse.com>
X-ClientProxiedBy: MR1P264CA0192.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV9PR03MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: f37f9241-3dc7-431e-bc76-08de6243bbef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUMvdnpadE9zREI4YTBDY2Z6YlVOdENuWHZNUnBQTVFaSTN3cEVBSm5HSjlo?=
 =?utf-8?B?ZXdVd2YvUVdKUVlQQnMxeUloaUdNT3ZQRTNGdjZ2Nlo5Yk1mK04yRVBSeHRU?=
 =?utf-8?B?UWc2Q3dEUmhCZVpQMzA5aHZwREJCQWMrZkk5YmRUKysyTngzUW1WQWg0MWJ4?=
 =?utf-8?B?M0d1bWZkejdPVmdodm5DTW9tR2lDcStUbGdZY1RaZXBIeGxtYWY5UkRIOXR6?=
 =?utf-8?B?MnZuVURsNkVLVEJtekRTMW1kRTZodGpMVWp3bmFXYjVEd1czczVUMDlBZkgx?=
 =?utf-8?B?MmlLTnVSSkY3cUlFcklJWkFkSWxEKy8zeVdmMkszNFJyOHhLL0l4MGNodHdC?=
 =?utf-8?B?VGIzL0QwdDVRbnJFUEZlZVNOZHQxZytUc3ZPQi9CZkVXNmlSS1dpVFpTOURH?=
 =?utf-8?B?enhSMlF3anlCZTZjWjRWYXNGL0JmOFE4S1BGYXVybUtBUnB4V1hIaEtrdytL?=
 =?utf-8?B?Rk9kVFJnZWdva3BaNDJWN0VSVDRaOXJ6ZlQvQzZuejNYcXlUVWk1eU9zR0tT?=
 =?utf-8?B?UWhReFR6RFQvOWdQeXhvOEE5U2ZhZWM2ZHpwZjR2R2xCMGg2YTZNNUkyYWMw?=
 =?utf-8?B?TXhMTmZ3VUp2QU9tQVZTaktkVnJQaENjKzNWWFdCd1FUYUlIWC96TEFpNlJO?=
 =?utf-8?B?SzdqMmVzblhBSGpoc05QbTFodm9KRTBkVjNsRnlpZ2JhY25LZ3o4SmJ1NkxM?=
 =?utf-8?B?Y2JKUnM1Zlh2aTBCcHMyZ1NScDRFZE82TFdsQTNGL05WcFJwNHJkc3RuQjI0?=
 =?utf-8?B?OGNLVTRkNzB5czRlazhNUnB4OGRncFVoYSswdVF1b0Y1dU8xdGhDcG9rSWU5?=
 =?utf-8?B?VDgyMXEvQXJjZmNHYWhxbDJnS2c1YjRYblpnQjBqbWJQdld0NE54OE1aV083?=
 =?utf-8?B?b0JqQ2FWVFpqL2xJc0h0eTBmSGRMVGk1Znk1em1ZR3p0U3I0QnhRZm9Editk?=
 =?utf-8?B?L1BlYTcwRjNtMnBlTFpkeENNaXdmZW44ZWk1eWNKcjhyc2cyZVJXYTRUVE8z?=
 =?utf-8?B?dGp3RXpQeUZUZnJuZGszYnpLcy92T0tOVlo2U2IvSkdGQXFyWGdUTERENFhK?=
 =?utf-8?B?SjhXTENmVThPbklqTTQwSGxGQjI2RUh0Yy9MV0FRMEZHNGg5ejBCYkNtQzk5?=
 =?utf-8?B?WkNmYjdBekY5bkppemU2R1ZTUWwwcCtsc05nQW9LWk02enRFRkdUVlA1Zmdn?=
 =?utf-8?B?VkI4djNHL1Z0YnVoQWw4NHNUdlJYajViZWFlM2JqbG5pOFFQQnhpbHh0cVcy?=
 =?utf-8?B?ZWlIYWlVTXVuek9ZM1oxa2Q2WVR1dFgxVWRPNXVIQlMxdmlNalB4VDFJcW1T?=
 =?utf-8?B?d2xuWXZYYWdGcWQ2dStaVHNYTmt3aWlsb0pYd1ZoSDg2TXB4aEc2T2hSczhl?=
 =?utf-8?B?Yk9IcVZxUDhqNjM4anc1VVF1Q0drTFptWW1mNUJzUVdIdE90SGJQdldBSWo1?=
 =?utf-8?B?V2RBY2dUckJ6eFNvUE1vOExTdzZSbkZ5d3RCbUFqeW5VTnhZK2pDWEJ4VThU?=
 =?utf-8?B?aDF3eWdHbUN6bDhwRlljRVo2bXJhckRmZGNwbDh2cmQ5QmhBRDhlUXBzR3RJ?=
 =?utf-8?B?Tm9KVUF4UGVvWkFXQjdZdGxOMG93bTEzOU1rYVV4Ny9tcER6NE1yMFdkUDBN?=
 =?utf-8?B?TktXWVYvMW9ZMWhxcHRVWjluNk40b3U2UkFRdkNCQzB4UkpvNyt0YXpMelBp?=
 =?utf-8?B?WmljQ1JiYUlYcG1qL3FMRTk5TzVvZ3pyYlBodFBmcHQ4M0U5UmppenIwVFZO?=
 =?utf-8?B?czZOQVpSMi9ZU0xtcklMZHZDTm9uL1VPdHRrWlJrQlE1UEZWb0FkKzlNcGVr?=
 =?utf-8?B?MXNnUW1iZlM1WFlQbkN0THV6WGZ2Q1BLZmFTN1R4YnNkWjA5c3FmZEErQzVO?=
 =?utf-8?B?ZURDUWNUeS9YV2JRcjNwem4vQVhWTGZkSXpKai9rajRmMXJNZm0yVG56NGxK?=
 =?utf-8?B?Rk9CMGU0UmxtRi9jdXJ6aWNFWWwwY1V1RGlUaHhXUU4rYmhlVVNmTzc3TUsy?=
 =?utf-8?B?U05zVmdNV1JGM3VHUTl6SlI1dFNDWE5TUjdRTUMrU2M5RVBOQkJUTmR5bXMz?=
 =?utf-8?B?Z3dqeTNITDJ2aitCcXBjSERPWkI2bnFya1NCbnlVWWlKYnYzT20yZTBaQTJG?=
 =?utf-8?Q?naVQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TllWbmJWUDdYdFlsMkhDZ2V3VjVDMWZUUHVMc0FSekw4SkVwUXlsRTlRZlVT?=
 =?utf-8?B?OWJaeEF6Z0FGL1dYRjBiN3NMQituY0pZVnhsTkpDUXdqME9OZXhMU0h5eURr?=
 =?utf-8?B?TXFEVmVVaTFScHcxZkkzTzl3S3VGU2tYZ2ZwdkkvV3pBL3RvNlBIdHhhblN4?=
 =?utf-8?B?OFh6d1d6cjVVTzNEWGpDWmJVeDkyQVk5ZTlSbUh3OEp6TGVSNURHdW9udXZS?=
 =?utf-8?B?R1FicENFaTdqcGRyRzMxNGx6dmhVWUdhampjYlNDWExKYmQxSFVONGMreWh1?=
 =?utf-8?B?NENVRFBYOGdhNnA4QVQwVndlZm9CUGdkdkcvb1N1aGdsd0o1ZUg1enA2dVJP?=
 =?utf-8?B?RlE5SFQweTMyRFoxMUJMNG1lQld1WmhCTnIwNkQ4L1UvWExrNmQxYnNRM0c4?=
 =?utf-8?B?RGdvKytJNE90K1hQUHY5clV6RzFJTTRsTFZla2hzZEczSG5iRDN1b0taWENE?=
 =?utf-8?B?RWFpak1LemVWNkFsYkI2K2J6MlpHNWNJejVZM0pDeHJiNFNnTEpnUHhlNnpV?=
 =?utf-8?B?eFpYditPQS9wRG1DcW9Tb1AzR0FrTXFaaW0vTk9iTEgwUnpyeWNvRXlMTC82?=
 =?utf-8?B?U2I5VzM0Q2ROenZCVkN4UzZuWGNVTEdiMDEycEFaWFZXN1lSQ3NwYXE2Qkgr?=
 =?utf-8?B?eWR4eVZZWEgyT1g0eWpzT0EwTlFnNC9HR0FDZ28vOUdrMERlU0VNbXJPdHRV?=
 =?utf-8?B?cG9vQktGMm50eGxKWUUyQ2dVc0VzQWVwSHpteU4zaVZFRVBoSm8vUWdYWlVk?=
 =?utf-8?B?UFUvem5qWnQ1Wm5aeVZ6LzMwRHR0em5NRnhDd29nVGFWS1hPbGFRZWZjNTdn?=
 =?utf-8?B?ejhLV210WFYyNVBWTU5PVCtOZjNvS3Ftalo5L0NsWmNKeWRkZEQ3VTNKVklC?=
 =?utf-8?B?YlRWNm9ldURHeHgrY1hKMFp0SEo5Zk1JclFndEszY3V0cll0a1Z3TFZtVjRJ?=
 =?utf-8?B?SDZhN0MyYnovaDR6bk1wcTZ1T3ptNVJSOEZDdmhSRFlrNEQ4VEw1ZHQ3TCtH?=
 =?utf-8?B?SWQ1Q08vQXp2RFZyOXgxVGI0NUNza0daUlBXQUVUci9TR2hnSVRmWFdtd3c3?=
 =?utf-8?B?b3JnQWdGNEV3R2NJei8rSkZpU0NMMnplUDZ4NUd4U1Q0MUlWd2hrSWVra1Zw?=
 =?utf-8?B?OW1GeDl6b1V5MUVKUGRLSU9oT3g1Z2JSdkZuTjRaNGczSUdiT2lGS2x0bExN?=
 =?utf-8?B?bnJKSHpkR1hZUExjaXZVMkljWGVQbEFSOC9ML1lva1ZFZjBha3N0d0syc2s4?=
 =?utf-8?B?UEt2a01ycGd1U29vUnN6MTRJdGkwZng4S3p2Z1R2dUhldTFBZHdXbmZUZ1Rq?=
 =?utf-8?B?WFNFcFEvNEJ2SHE1Vjhhd1RudE1jNWprMWZtZGZtTlNwdlFtcFVhQ1JpR2xW?=
 =?utf-8?B?cnRyb09GUHdCbFpwak4yeTFnS1hKVk5xb0FOS2RIMU1QeWtzQ1hlMlA3WDR2?=
 =?utf-8?B?S1dXdldZcjIvczN2dHc4WGhpSGZsL1ZNMmF6NlQ1T3E1dkpXbmo3MVBiSDhZ?=
 =?utf-8?B?UlljaitjKzdtZ0diYmpGZXJSb1ZuWDQzQVlCK25JOXRZMXcxOENiTVUrZkxn?=
 =?utf-8?B?cklBNTN0UCtDa2YveXJFUXpsK3pSYUk1Y29uNlVYbFFoaHBBcUNBUGlkMTlw?=
 =?utf-8?B?R3FuRHFSbVZmU0F5VE9zUEJtQlVEQnY5TmJQbVZpQWdSN3FsR0w3c2ZaT3A0?=
 =?utf-8?B?MlRoaEFNd0liaW1uZmJTYVh4TjF3TXZjbHk4YWQyVXJoSlJTMmRZYUZUaUJp?=
 =?utf-8?B?YnJUaHB5NTRPdmVEU3FRZ09aYzlCbWtxV0pQQUF3VmU1QTZQUUo0am1iaVdn?=
 =?utf-8?B?THJMY1BCWUdPblZuS2hOdlppMXNFSGU2Y01WNXdHcWU3TGRNWUJUNGtxZHRN?=
 =?utf-8?B?NmVzNjJSTk83LzQ2UnJsVm1KbmRCVTdTSFBoQ0JLTjliaVdkNnpDT1VxekFB?=
 =?utf-8?B?VjVOZ3BqWE9mbVdSbThzb3k1MjhycC9vZk1SN1lUejlBd2UveVJyWFZncFhn?=
 =?utf-8?B?YzR3UTd4djNxNXZFcEJIWlpCazkzLzZpbU5pTXBtRzY3VnNzUXlnSjdwQXRw?=
 =?utf-8?B?Zm5DaUJ3M3hmNUx1TnFqd3A4NjZjL29LSGlaWHJ3T3IrN3pIVEZWclhtZTdi?=
 =?utf-8?B?Mzc5TjBZaXJxMlhjSE9qSTV1ays3VW9Zc205Wk14QS91dTlTQm9CYnk5UTA3?=
 =?utf-8?B?bTVpbGVvOVQrMXEvVHpLZmZmbG05MTR1Sm1HL3JyR2twVFY5NjlISW9hYTdC?=
 =?utf-8?B?TnN5blR3d09aQWRab2c0OFUwSWhzM3NhckdrVVhlNnd2czE5MHhFT3pXY2RX?=
 =?utf-8?B?Tld3aUFNU25XdGJIUWYxaWlHU0krUTRUU1JucU91emFhZVJVUkM1UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37f9241-3dc7-431e-bc76-08de6243bbef
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:13:39.1284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikPk/jNYSoHqpPL40kaXs2ok1YHh9S9f5sD3Sfy65XNpg8J1JqQ599NueVFuBxa6zrxqMlABxNnC2pQha+IWPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8365
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 30318CAA99
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 10:30:29AM +0100, Jan Beulich wrote:
> On 02.02.2026 10:14, Roger Pau Monné wrote:
> > On Mon, Feb 02, 2026 at 09:51:18AM +0100, Jan Beulich wrote:
> >> On 29.01.2026 14:10, Jan Beulich wrote:
> >>> @@ -160,10 +161,13 @@ int pci_mmcfg_arch_enable(unsigned int i
> >>>      return 0;
> >>>  }
> >>>  
> >>> -void pci_mmcfg_arch_disable(unsigned int idx)
> >>> +int pci_mmcfg_arch_disable(unsigned int idx)
> >>>  {
> >>>      const typeof(pci_mmcfg_config[0]) *cfg = pci_mmcfg_virt[idx].cfg;
> >>>  
> >>> +    if ( !pci_mmcfg_virt[idx].virt )
> >>> +        return 1;
> >>
> >> Afaict this is what causes CI (adl-*) to say no here:
> >>
> >> (XEN) [    4.132689] PCI: Using MCFG for segment 0000 bus 00-ff
> >> (XEN) [    4.132697] ----[ Xen-4.22-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
> >> (XEN) [    4.132700] CPU:    12
> >> (XEN) [    4.132702] RIP:    e008:[<ffff82d0405779bd>] pci_mmcfg_read+0x19e/0x1c7
> >> (XEN) [    4.132708] RFLAGS: 0000000000010286   CONTEXT: hypervisor (d0v0)
> >> (XEN) [    4.132711] rax: 0000000000300000   rbx: ffff808000300100   rcx: 0000000000000000
> >> (XEN) [    4.132714] rdx: ffff808000300100   rsi: 0000000000000000   rdi: ffff8304959ffcec
> >> (XEN) [    4.132716] rbp: ffff8304959ffd18   rsp: ffff8304959ffce8   r8:  0000000000000004
> >> (XEN) [    4.132718] r9:  ffff8304959ffd2c   r10: 0000000000000000   r11: 0000000000000000
> >> (XEN) [    4.132720] r12: 0000000000000100   r13: 0000000000000004   r14: ffff8304959ffd2c
> >> (XEN) [    4.132723] r15: ffff808000000000   cr0: 0000000080050033   cr4: 0000000000b526e0
> >> (XEN) [    4.132725] cr3: 0000000492a30000   cr2: ffff808000300100
> >> (XEN) [    4.132727] fsb: 0000000000000000   gsb: ffff8881b9a00000   gss: 0000000000000000
> >> (XEN) [    4.132729] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> >> (XEN) [    4.132733] Xen code around <ffff82d0405779bd> (pci_mmcfg_read+0x19e/0x1c7):
> >> (XEN) [    4.132734]  48 39 d3 72 ea 4c 01 e3 <8b> 03 89 c3 4d 85 f6 74 0d 41 89 1e b8 00 00 00
> >> (XEN) [    4.132744] Xen stack trace from rsp=ffff8304959ffce8:
> >> (XEN) [    4.132745]    0000000300000286 ffff830495bd8010 0000000000000003 ffff830495bd8010
> >> (XEN) [    4.132749]    ffff8304959ffdd0 ffff82d0405fa7ef ffff8304959ffd30 ffff82d040576877
> >> (XEN) [    4.132753]    000000000000000c ffff8304959ffd58 ffff82d04039b81d ffff8304959ffe28
> >> (XEN) [    4.132756]    0000000000000003 ffff830495bd8010 ffff8304959ffd80 ffff82d0405fa90b
> >> (XEN) [    4.132760]    ffff8304959ffdc8 ffff830495bd8010 ffff830498019650 ffff8304959ffdb8
> >> (XEN) [    4.132764]    ffff82d0403983e0 ffff830498019650 ffff8304959ffe28 ffff82d0405fa7ef
> >> (XEN) [    4.132767]    0000000000000018 ffffc9004002b900 ffff8304959ffdf8 ffff82d04039feba
> >> (XEN) [    4.132771]    ffff82d0405fa7ef ffff8304959ffe28 0000000000000000 ffffc9004002b900
> >> (XEN) [    4.132774]    0000000000000000 ffff8304959bb000 ffff8304959ffe78 ffff82d0405ff666
> >> (XEN) [    4.132778]    ffff82d0405713b8 00000000ffffffff 00a0fb0081f456e0 ffff8304959b3010
> >> (XEN) [    4.132782]    00000000c0000000 00000001ff000000 ffff8304959fff08 0000000000000040
> >> (XEN) [    4.132785]    000000ec00000001 ffff8304959fff08 ffff8304959a4000 0000000000000021
> >> (XEN) [    4.132789]    0000000000000000 ffffc9004002b900 ffff8304959ffef8 ffff82d0405711b2
> >> (XEN) [    4.132792]    0000000000000000 ffff888100456938 ffff8881001470b8 0000000000000018
> >> (XEN) [    4.132795]    0000000000000000 ffff8304959ffef8 ffff82d0406213f9 ffff8304959a4000
> >> (XEN) [    4.132799]    0000000000000000 ffff8304959a4000 0000000000000000 0000000000000000
> >> (XEN) [    4.132802]    ffff8304959fffff 0000000000000000 00007cfb6a6000d7 ffff82d0402012d3
> >> (XEN) [    4.132806]    0000000000000000 00000000ffffffff ffff8881001470b8 ffff888100b88900
> >> (XEN) [    4.132809]    ffffc9004002b900 ffff8881001470b8 0000000000000283 ffff888100456938
> >> (XEN) [    4.132813]    ffff888100065410 0000000000000000 0000000000000021 ffffffff81f7842a
> >> (XEN) [    4.132816] Xen call trace:
> >> (XEN) [    4.132819]    [<ffff82d0405779bd>] R pci_mmcfg_read+0x19e/0x1c7
> >> (XEN) [    4.132822]    [<ffff82d040576877>] F pci_conf_read32+0x55/0x5e
> >> (XEN) [    4.132826]    [<ffff82d04039b81d>] F pci_check_extcfg+0xb1/0x13b
> >> (XEN) [    4.132831]    [<ffff82d0405fa90b>] F physdev_check_pci_extcfg+0x11c/0x121
> >> (XEN) [    4.132833]    [<ffff82d0403983e0>] F drivers/passthrough/pci.c#iterate_all+0xa2/0xe2
> >> (XEN) [    4.132836]    [<ffff82d04039feba>] F pci_segment_iterate+0x4e/0x74
> >> (XEN) [    4.132839]    [<ffff82d0405ff666>] F do_physdev_op+0x362a/0x4161
> >> (XEN) [    4.132842]    [<ffff82d0405711b2>] F pv_hypercall+0x6be/0x838
> >> (XEN) [    4.132845]    [<ffff82d0402012d3>] F lstar_enter+0x143/0x148
> >> (XEN) [    4.132847] 
> >> (XEN) [    4.132848] Pagetable walk from ffff808000300100:
> >> (XEN) [    4.132851]  L4[0x101] = 0000000000000000 ffffffffffffffff
> >>
> >> There is an important comment in pci_mmcfg_arch_disable():
> >>
> >>     /*
> >>      * Don't use destroy_xen_mappings() here, or make sure that at least
> >>      * the necessary L4 entries get populated (so that they get properly
> >>      * propagated to guest domains' page tables).
> >>      */
> >>
> >> Hence it is wrong to bypass
> >>
> >>     mcfg_ioremap(cfg, idx, 0);
> > 
> > Hm, I see.  The L4 slot must be unconditionally populated before we
> > clone the idle page-table, otherwise the mappings won't propagate.
> > 
> > What about unconditionally populating the L4 slot in
> > subarch_init_memory()?  That seems less fragile than doing it in
> > pci_mmcfg_arch_disable().
> 
> Less fragile - perhaps. Yet I don't see why we should populate the field if
> we wouldn't ever need it. Of course with violating layering some, we could
> know in subarch_init_memory(), as pci_setup() runs earlier.

How can Xen be sure at setup time that the slot will never be used?
The MMCFG could be empty initially when parsed by Xen, but MMCFG
regions might appear as a result of AML method execution (_CBA and
_CRS methods in hotplug host bridges).

Thanks, Roger.

