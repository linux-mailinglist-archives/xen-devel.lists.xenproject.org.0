Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C95C90542
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 00:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174481.1499445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOl7a-0003nJ-3S; Thu, 27 Nov 2025 23:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174481.1499445; Thu, 27 Nov 2025 23:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOl7a-0003kE-0F; Thu, 27 Nov 2025 23:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1174481;
 Thu, 27 Nov 2025 23:09:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOl7Y-0003jp-I5
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 23:09:52 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c803aa3-cbe6-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 00:09:50 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5250.namprd03.prod.outlook.com (2603:10b6:a03:220::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 23:09:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 23:09:45 +0000
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
X-Inumbo-ID: 2c803aa3-cbe6-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9DP8798SACxlJt+mkN/h+KmJ61DPT/3EOvxiVWwckduguFFK+p8LmnRfjnfm36n4ohkAoLmkKaEjCukRRl6OJ5Ck6ZyeltVNaJLFZpYyfLnZQoBVhvQt53H0ARsCnGGcSUvtZWCAp3WH6UV7qEES/4VQmY5sIKeAmLZIu8CvHwEk3UNLC1il93b6nmDVASuhsoPH+pMqxrSlJR47sJ5T9QU0xn/u2p4014QcCbvWxIsi23uz4ScqIgHfBqOHka1TaDA0SAJ9sxEocbq20fqYbkmrkR2as09lU8t8mPK3FyoMRtk1gcdUd15AOpTKv0IJlLCpVME4tL9C2dyoJ6PcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToDzyoiiSL/bJ8bNP7/0dqmG8D1RErixfFFF4+vFPYc=;
 b=AmvdXGcKTvgezjajTy58dM7b3FIe397tw6noBbU0yRMnsGZe7t0HsmtADLYSmeFCbe1/+J4uTl5CvHfZ90JJbdQDl0q1jN9rH3AAPRIhGD8bxw4pGKAqvUxW7uT/a7L8LswEkHFCIEfWPlzIDi/wwEBFCbTz4/5rRq4VTfR5ka3q1k3LL5QrYAR29Nb6kuOpBnaMMEBR1/oQV7KiBF9aV2/Y0wpY3SB9eCQnS/iBAIhpMXHkx2sDsnAMR9vEI89rD8aOboyE7U98lYIvTKWnw3lWzw2JTD3Vw19W/kzC42vszyuM9QTraKHC32E3A5MshdEo5qsAyupzuJz4km5aww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToDzyoiiSL/bJ8bNP7/0dqmG8D1RErixfFFF4+vFPYc=;
 b=Z69ZJ0OMmOWf3oDqresSbMhRwzYpKb0fALKPK9Y1k/XxObLCUu1ECrXKvxozDuV/BgNS5JGE9ICwP9y0n/kzYiUZV/DVw6mSaxPkKE8uFZ9IqPeVdvWuUub1GCTe5JtFa/KlDOofejjg4S2LQbyTXgUkI3YybP8ueIVI1cV4KbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <26f448be-4a7f-4346-928f-8185ca8ba222@citrix.com>
Date: Thu, 27 Nov 2025 23:09:42 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251127221244.3747918-1-grygorii_strashko@epam.com>
 <20251127221244.3747918-4-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251127221244.3747918-4-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0426.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::30) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5250:EE_
X-MS-Office365-Filtering-Correlation-Id: 888d9524-01b8-41bb-f848-08de2e0a0e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2dhUkV0dDJNZkdjYjNZK3dnaHRwNGxaL0NuRUlpWHdza0UybVJNWUxKYUda?=
 =?utf-8?B?Z2xKakYzdDRVR2wvRUZXTGs3SXdEZlRMRERLby9POGR0WmdIaC9OYU5mQTBC?=
 =?utf-8?B?dEVFRW1RVjVSZUduT2loVjVxank1R3k4MnZoTTQyR29kV09HR3daM0pscTd1?=
 =?utf-8?B?Nm9VZWlpVG5EamlzN3YwWFBnM21iaENzQUJqeEVzNEJ3QkYyb1g4WStCMTNa?=
 =?utf-8?B?OWR0Ryt4bVlqRTVaS1J0VzhUVm0zcEZtOFpRTGhIRk42bG90aUZTb3ZNTjhB?=
 =?utf-8?B?VUJBUENEOXd6VHp2QUZra1grMnE4SzN1UVZFc2ZxTXc4YytqQmllMWZqREpX?=
 =?utf-8?B?QmowU1F4SHdVTGZ5dG5Tcmoya3FFNjBLM2RZQjdIUXFnZVRmaWVMK3MyL256?=
 =?utf-8?B?NjQwOGl2UUpyQktsSkJQYnRFWGJlU3VGandrTGpZa2E5OEcvYzI4MDdhRUg3?=
 =?utf-8?B?MXpRSFAxWk9RaXZHUEs0eFRPb3ljWXZ2Z2VXUlVrZjlEelJsQ3lKeGsxVE96?=
 =?utf-8?B?SXg5MWdyYzVLR0ZPajlqR0FOTFJQUnhMSC9HVktuNkpkMTNhNTVKb0tndmJp?=
 =?utf-8?B?NmsxdkRpb1FCZVhjR3ZwcTYwL29jVG13NXJKcFhPLzRXQ0xIV1ZKcCt3Nk03?=
 =?utf-8?B?WmZTUUVwR1g1OEFQRU1hUG1nUzIza1ZQdWlXMjg0QzJlclVzTElPeUVUaHVU?=
 =?utf-8?B?N1FtSjc1SVFaRGw0QTRRZFdEeHFCZzhBNHlBTFNqZjVyelROR3ZSbmFqWTJC?=
 =?utf-8?B?Tk5ZUnZJSWNHRXNhQS8wRUg4MnYxMGl6TWxmeXJYck56aHpGbnlqNWxwRnFD?=
 =?utf-8?B?UTFnZnlNeDdCaVpLNXkreEVneXRkYTdhRGhjVk5GQjVGa3BBMk9vQlYyTUM1?=
 =?utf-8?B?M3lHcmlOanRjMkFTR1dTYzg0UFB0NTVNMGtrZVNRYjNEK2thUFZ4YzlpUkww?=
 =?utf-8?B?WUdUZ3FFaVU0ZnFQUG5MWFdYVlBIMk4zdllxVmVWa0k0UVJkRksxV2tHcmZS?=
 =?utf-8?B?dDQ5RFp5QmdyOFhhbnJZalBXVE1WeVpvMlp1ZDRDbHZBckJ3S2QvamViRisz?=
 =?utf-8?B?TjRmRmJEVDU2SUdYby85bXk2ZUpLY3dtOUxLQkNGaVdmRHpLeFU2VjRuWE0v?=
 =?utf-8?B?WUNDZmRFSVlONjJCWEdSWGdvWUhPM1FoMHBsSlRiZUZ2ZFVKUUtINGZIajVH?=
 =?utf-8?B?RVBNNEpveGRVcHNRVWVDNkZHNU81TVpvRjhpN0RYTllmU3JUYWFQVHhzMnNB?=
 =?utf-8?B?WUVNbVhORk8xV3VrbVpWa2h6c0IvOXU4eHp2NWFiN1RKekhRcTJ4ei9temd1?=
 =?utf-8?B?cVZDaWRNQzBlZUk3QnJzbHlsYXRqWFZGU2FYZE95bGVsQ1B2Y2NKV0p0Tlgr?=
 =?utf-8?B?aWE1djJTclJoNHp1czJrckRBd01xbVBpcmhLcUNySkRNVVg3TUFNVmV2NGZo?=
 =?utf-8?B?U2xwVmNVeU4zUlcwRFk0NnlIamdEN2FKc01KY0hzZDlmQmVZeWJlakdrZXNr?=
 =?utf-8?B?YlRhc2lDWTU4bmhtanJya1U2YzR2dENUVlA1NHhheTNVaGxpdEQ5TVl3M2wy?=
 =?utf-8?B?VnpHWm0xMGlPQVBsU1k3a1hNWU12enorZEpuNTFtakJLeTVtczFOUW12cGk2?=
 =?utf-8?B?blNzVlp6c2hBbWE5dzYwUzlRYXRIS0NhUlpkL2UxTHlCbjlYWkYycDU0OVV5?=
 =?utf-8?B?VFFWOWo3Mi9sajR2aTNnUHlzbHVKcml6aUR4eFdqVnpSSWw5Q0hVZWdNUDVk?=
 =?utf-8?B?bklBS0dqNjJwTUxmc1ZDdDhWLzJCNkl2N3lxTGEyNUxrSExyaGRzanRPZ1Nx?=
 =?utf-8?B?Wm1ONVBWNFVUY0NIRVM4SWpwS0JxMEFXWW9TMEdVMnV1ZjVLemdvbE9EdGd2?=
 =?utf-8?B?Y2kzUTlhZTYzS0RCeC83OWhvVDRmYjVUbzNBbThUQzJrbzEreTROS002SUtE?=
 =?utf-8?Q?3Lj9PgA+gK07M8a17TmhmjbjC9MpZ95f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFZobDFld0NLdzd6UHZVN281QmJPaXpGdEJmZzRTc3B3NllRZGQzUjlXZzdI?=
 =?utf-8?B?RDA2YWRCeFQyc0dqNHNMdFZ2NXpjOGc5MDM0b1pqd3hDM0VKNTlxZjBCMEhJ?=
 =?utf-8?B?UnVEaUlsRVQ5OXUwMTlhM1dDejloRTVzK2lKNHZNaHJsd0VpQ3NCK0RqWERZ?=
 =?utf-8?B?TlVzZURWNTNZRjI0ZTFReU9WWUx2SVpIN3l2c25DRjQyaW9zMytkMFBnQ0Zk?=
 =?utf-8?B?Wk5YT2Fua2Z0ZnA1ckRFTVNBTHBJNXFsS2lRWDdINzNLV2V4K3lRdnB6MHpq?=
 =?utf-8?B?WFkwN0huSS9yeGhwb2FCcUhOMEJ3YXJUL0tHMk1acG92V1RwOVU1ZGZja2hp?=
 =?utf-8?B?SHJ3eGI1S1ZmeGpGRTBvUXl4SmJaT3RiRS9UNE9id25tOVNHNk1Jcjh6SzBW?=
 =?utf-8?B?NnQzVlN6dTNvWVkvRzJ0QVBjV2g2eDNMaHlzZGpHaUU0cnQ1UG9sOUdNOUwr?=
 =?utf-8?B?VlpwUzBPbGJZcDZxUm9OMFIwRWc2dkFpUUtMcUpYd2ZtM1R1Wmwyb0ZOTUQr?=
 =?utf-8?B?TWZOa2tiWm1lYnlvdU9FY2tuaXVhZXNObHBIbmlyRlpPMU9hRFNFTXJidVdN?=
 =?utf-8?B?QWxQTlR0dW80OTVWb0p4QWtJUWlTT2NaL3lGakVqZWNMeEpCOFpKNlhlZkV0?=
 =?utf-8?B?RTZTcGxoNG1uK2gzRmFQQS9xMUtENXhCQ3JKclhSTnpVWVB5UFV4bURyMmdQ?=
 =?utf-8?B?QndEbG5lRlVQbTdIb21XOXRvREpmdHp6UGdiTkI2TUhDRkNTUkFrYkJ0WHBO?=
 =?utf-8?B?MWh6OTliMTVlR1k1ZXRqNDkxaitaczJLRzdxbytISnRGdUdhdnVlQ2psckYv?=
 =?utf-8?B?YmNnWjQ3dnBQOEYwOVI4OFdnVUp2UkpSVm03ek9HNWFsTGFaSkVsNzFITjNN?=
 =?utf-8?B?ZTVvRzExWnZEaENPUSsreld5RmxlWUgwYXRrQnJjSm9qOWpMaE9nTUw5WkJ4?=
 =?utf-8?B?M05OOFg4blNVb00rZWJzcWpOSGZ5SUxTRkdDR2FKWXRMUEMwS3FtZUY3ZmZh?=
 =?utf-8?B?QWZJNFBJd214blBXVSsvQXNheFdWVll6L0xGWlZVUGJsaGNNS0FBTDlidnZO?=
 =?utf-8?B?dUpmU0YyenRJQzZTV1VPcmRmVGJ6dDJwb0JTL1RiRGFOTEg0UkRxNzl5R29B?=
 =?utf-8?B?RXVrelZnYnFMdmo2UTYxNURlMUJ3eTlDeGdGQmZMOWRCZVpxR3NhampyVUhR?=
 =?utf-8?B?ZlpLeHpnN3hEcnJjVzh5YWVEbTBNOWZLcjllRjZ2VFJnZkY5RFo0WlFLYWFu?=
 =?utf-8?B?M3dtOWNBQVkrQm9BOXdVRDVBVWZacjJmZFlmTGxrZDc3Ri9Kc2NmWWJoRUxN?=
 =?utf-8?B?cEFka08vK1JnSU9FaXkzK2pNWEVOaXcvRzNmemVHZzlqTTRFM25ENWlTbTVY?=
 =?utf-8?B?azJ5NGR4dFZ6bGQyR2hTSVFKWFBBVVNaTFQ4eGw4R0xRK3B6OVl2VHBaNkV4?=
 =?utf-8?B?ckg2UG93Z1NmbGVEMUNvaGN1aW5Xa3ptcDU0OTBJNnNOUlVnSHgzSENCT3lC?=
 =?utf-8?B?QjBqYis1SzRNdmYvUzVXYS84M00rREZ6eWJVZnU1TFBQRTlUOGZydHlhRGh4?=
 =?utf-8?B?V2YvZmhTRTlOMkFxeXlTcFhpRWFWcTBEVW1GRm9tNkd5SjdEZ3hJaEtMSXhp?=
 =?utf-8?B?L3BuUmNBOTBJWUlRQjNKU2haand1bzZnb3RBTmx4NmdpMGtEQnVqLzBXKzVj?=
 =?utf-8?B?MzFMUjl3THV4WGkxcm5GYWFDSEZWK2dKbTVZYmpJVW42bUJxRjlNbWxWS1cv?=
 =?utf-8?B?K2kwYzNkcXluanh2VEFmeUxZUi9hc2VsNERLUStKWmFBcGZSVFRKdEw2T2tj?=
 =?utf-8?B?dlVHWG01ZmpvT0g0WWxOQjlYdktTWTRXUW9GWklOUC82Rk1JV1V3VWo4V1lm?=
 =?utf-8?B?RzR4YkR5K1N0VjZseEdNQ2RhNXJrSFdHZkppRzdQbDVzY2k1MURhS2dyRDlR?=
 =?utf-8?B?aENWbVlJeUp3TWlyWHM4SWl0QmM0Vng2aHZhQzdHUGJTQVVBVjRpdVlFOGNL?=
 =?utf-8?B?cy9mbUtzMnZKYmp2TlZ5RGZpbXNOM2xRTVVpcHI0WHRwdEdqb2dZck5ZaFFP?=
 =?utf-8?B?QzdrdFlyNEtqeUhKR0gyc21scEpONVpVUmxCc2RpSVgyYUZtVE51YkZSSXVs?=
 =?utf-8?B?K0Y5QTBzRDVzc3lzQ2tYN3lWeWYvVEJaL3hGcVI3bjdDVkoyUEo4cmpPT0Vu?=
 =?utf-8?B?aEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888d9524-01b8-41bb-f848-08de2e0a0e37
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 23:09:45.8297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOSGW0JaC9FyGQX7VbpnON5MCj0AQpaJWJd2e6WHg/rU5GJ1FONWBafEyPj4rg5wbleCPjl70QzeUCLlDAmxmY9IUGSgDvv/jowIqiZAmUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5250

On 27/11/2025 10:12 pm, Grygorii Strashko wrote:
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index 17ca6666a34e..128115442ecc 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -619,9 +619,11 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
>  
>  extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>  
> -void domain_set_alloc_bitsize(struct domain *d);
> -unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits);
> +#ifdef CONFIG_PV32
> +unsigned int domain_clamp_alloc_bitsize(const struct domain *d,
> +                                        unsigned int bits);

Do not convert this, or any other domains/vcpus you see, to const.  I
realise you have been given conflicting information on this point, but
the maintainers as a whole agreed to not const pointers to complex
objects in the general case because of the churn it creates, and the
repeated examples of MISRA violations people have inserted to work
around the fact it shouldn't have been a const pointer to start with.

That aside, I think clamp wants to be a static inline here.  (Except it
can't be, so it needs to be a macro).

It's currently a concrete function call to very simple piece of logic,
where the callers have options to eliminate it entirely in the d = NULL
case if they could only see in.

#define domain_clamp_alloc_bitsize(d, bits)                             \
    (((d) && (d)->arch.pv.physaddr_bitsize)                             \
     ? min_t(uint32_t, (d)->arch.pv.physaddr_bitsize, bits) : bits)


seems to work.  The min_t() is because all callers pass in bits as a
long constant, tripping the typecheck in min().

> +#endif
>  
>  unsigned long domain_get_maximum_gpfn(struct domain *d);
>  
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 21158ce1812e..e4f95d8f2fc8 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -626,8 +626,9 @@ static int __init dom0_construct(const struct boot_domain *bd)
>          initrd_mfn = paddr_to_pfn(initrd->start);
>          mfn = initrd_mfn;
>          count = PFN_UP(initrd_len);
> -        if ( d->arch.physaddr_bitsize &&
> -             ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )

While you're editing this, blank line here please.

> +#ifdef CONFIG_PV32
> +        if ( d->arch.pv.physaddr_bitsize &&
> +             ((mfn + count - 1) >> (d->arch.pv.physaddr_bitsize - PAGE_SHIFT)) )
>          {
>              order = get_order_from_pages(count);
>              page = alloc_domheap_pages(d, order, MEMF_no_scrub);
> @@ -650,6 +651,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>              initrd->start = pfn_to_paddr(initrd_mfn);
>          }
>          else
> +#endif
>          {
>              while ( count-- )
>                  if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index 9c4785c187dd..ad40a712ac5f 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -230,6 +230,29 @@ unsigned long pv_make_cr4(const struct vcpu *v)
>  }
>  
>  #ifdef CONFIG_PV32
> +unsigned int domain_clamp_alloc_bitsize(const struct domain *d,
> +                                        unsigned int bits)
> +{
> +    if ( (d == NULL) || (d->arch.pv.physaddr_bitsize == 0) )
> +        return bits;
> +
> +    return min(d->arch.pv.physaddr_bitsize, bits);
> +}
> +
> +static void domain_set_alloc_bitsize(struct domain *d)
> +{
> +    if ( !is_pv_32bit_domain(d) ||
> +         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||
> +         d->arch.pv.physaddr_bitsize > 0 )
> +        return;
> +
> +    d->arch.pv.physaddr_bitsize =
> +        /* 2^n entries can be contained in guest's p2m mapping space */
> +        fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1
> +        /* 2^n pages -> 2^(n+PAGE_SHIFT) bits */
> +        + PAGE_SHIFT;
> +}

The single caller has just set d->arch.pv.is_32bit = true, but the
compiler can't eliminate the first condition because of the embedded
evaluate_nospec().  Nor the 3rd condition, because it can't reason about
the singleton nature of switch_compat().

Thus, it would be better inlined fully, as:

    if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page )
        d->arch.pv.physaddr_bitsize =
            /* 2^n entries can be contained in guest's p2m mapping space */
            fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1 + PAGE_SHIFT;


which is rather easier to follow.  Even the comment about PAGE_SHIFT is
more noise than help.

In an ideal world it ought to be in its own patch, and in principle I'm
happy to draft one with a fuller explanation if you'd prefer, but given
the repositioning of physaddr_bitsize into pv domain as wekk, it's
probably all better together in this single patch.

~Andrew

