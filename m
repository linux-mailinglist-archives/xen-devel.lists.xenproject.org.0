Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ8bO4Fle2l2EQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:49:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5590FB0930
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216501.1526434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSOd-0002xY-9R; Thu, 29 Jan 2026 13:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216501.1526434; Thu, 29 Jan 2026 13:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSOd-0002w2-5A; Thu, 29 Jan 2026 13:49:19 +0000
Received: by outflank-mailman (input) for mailman id 1216501;
 Thu, 29 Jan 2026 13:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlSOa-0002vp-Qy
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 13:49:16 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4be88eb7-fd19-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 14:49:15 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA2PR03MB5916.namprd03.prod.outlook.com (2603:10b6:806:115::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 29 Jan
 2026 13:49:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 13:49:11 +0000
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
X-Inumbo-ID: 4be88eb7-fd19-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcOm18oYUpeX60g4FxydTReMOdfwUWjQrPkGxZGU6UQhtZM6CeidKICQG6mhMvCLWFic5qJqwBTNu4eh8haWi48rVJMUHSkP43b8su11Y3XQsldOWZ9sAHittp0/JBZAGO5Ffz5cOxhVsXCDbhFHWWhrSKt+nyTXop+EW+hDuirGjz4Vy5NZoFiczKLOJZVLsYJapSk/aA7Ne+a9GH9MJexlYB1R0OrnHWq6EPf1LNUyLsXOfQ0GGGs+G9ypEm8Kr1htIEciNT8uy99bvdBFZHtaj9H3m2Q3AxgzSF+KNSDxVpeRDVrQX+5xqynjRJgJCwqjUZYHgvOIvgs0/w1/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXG2L140Q6a+1NIVBeXowomtFmmyhFvIktezcSn5/wk=;
 b=avDTsJINVul4jK+POk8Z4/2GyGa/ubv8FzgvLvhq1F5EzJ7v+B6gxzwCcbdKV//oIhIJ6U6BIFfMy+XlYIC6EWugqbdIwzkBwdpz+zwdQrk9SzRpl9KaR66R2BumSup0vtXAxN9r3llnZVlR+fO1tDWX85UZPwQgARUJ+KMMU809wmGaf9OLCp60HDTeB20DyZ4eB94EGyIdpqOkyP2sb5rxlShdx4peXY2LzMjef+QJ3VUIHKzohGLCDHJ3PAgFRG/i9NN5x8wSIw8PZEuq3WLtrC9L4uB1MHPMH+i7XbwI6I2VIFRC/Ni90+2gka760TEnELerfZeJcbdsqeZ29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXG2L140Q6a+1NIVBeXowomtFmmyhFvIktezcSn5/wk=;
 b=aBt7Y3banqPnL07GUiUcg6RLWjPV4biHaKOFY/D1vmI8JZEdpc/fX9BksXmL2qr9mhJHAuL8jdiT0BafPyU5ylWdMTHZMX4Dc16iQAnqrvPbfl7cxIaRMdQmBhZcO6XD/63Xuh8HxnEuUWru3S/iriBiFx1o7n4/eqf01mZQ1vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 14:49:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 1/6] PCI: handle PCI->PCIe bridges as well in
 free_pdev()
Message-ID: <aXtlVJnezzAnWZ11@Mac.lan>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <cc91851f-02a1-4147-a3e4-f0be7f68bb6a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc91851f-02a1-4147-a3e4-f0be7f68bb6a@suse.com>
X-ClientProxiedBy: MA2P292CA0024.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::6)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA2PR03MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 589f8a78-73f9-49ba-20a5-08de5f3d2e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlZHMnNjQ3FsY3BsOHp2ZkJmMHdSVDJuSnNZNi9KOU85VUR1UTlreUVCb3ha?=
 =?utf-8?B?VThIS3lOWFc4N1FYRk9MSVhDSGN6YWw3bXNOSkxRZTh1MVQrYmVURHMvQis5?=
 =?utf-8?B?eFZEQmdtQWxvVzhLditXSkhPaXlzc3d4ZHJoMm9OWmpGOEQxOFFQNzdDNHR6?=
 =?utf-8?B?TTQrQjNzNGRNbkhVMVltWXdULzBTSVo2QklXU1o1VlZXbDJRejcxYWxhZTNt?=
 =?utf-8?B?VGxBTDFFZFBsT2hhMDJxVjZXZGpuUm9KbXdISjdaQ2xOcDNlUVp3OEtDODZq?=
 =?utf-8?B?dUJ1NytxZlg3ZXQzb3FTVENEcGlnVmRLVThLc3RreXpvaUVxaHBESDZOU2Nx?=
 =?utf-8?B?bjd2blZGZjN5ejZHSElnMldia0NPWkdhbDNhVFQ4TWlHSm5Bd2tVclFLQnJZ?=
 =?utf-8?B?R1JMalNaa08zVDl6L1JxRWJmRmhmSFBmc1UwMndlYXpVUnJ4akZtNmlxSUNh?=
 =?utf-8?B?eVh5dzNsOGNEcWJOSm5VWWNGU0FLd2s2TWtmVE9DVDhNcWRhc2lHRDR1TTJk?=
 =?utf-8?B?RHljTFhIdWlqTTM1VUdyUGd6aVFseXNMZHg3Rk5OejB3V2MvaVFQZXFMQjZ6?=
 =?utf-8?B?elloMktHekJUSEtKeU1PWUtoa3NtRDhTRnh5RU5QYzJEL1d0dDQrZFFFd3dV?=
 =?utf-8?B?eVpuSG1PSUI2eU1GL2llblRpdlgvNytXQkhoQll5K0ZCeVlwbm11eUh1S1FX?=
 =?utf-8?B?c1ZnaXI5ZmFlNjRSN3d6a1U5dUxQeFpDcWtQOHc5V3VTTlRGNTNWZmloUEVw?=
 =?utf-8?B?VTYxZzdTUU1qOHRqaWh5OVgxNHo5dE16RlBYaDNDeVlocUpPV3Y2NHl4WGhp?=
 =?utf-8?B?aG1Fckt1SVk4bTJHb1RqODNQL1ZLNUtQTVJqUzJ5T2dJdUUvQWNxZFd5U0Fv?=
 =?utf-8?B?SkxhM1YwUkRvbjVMQjFFRjhaTGZ4SlBCWHJuMHhLdGhNWVAvR05nSTBQaWhM?=
 =?utf-8?B?bThMZEprd0lCaXFUNmF3bUVmZGtUWUhBeHJmNzJPTFdab09qekYzMW1iS0xD?=
 =?utf-8?B?SFpMS1JtVFppb24ramF2TlNSNk1EQ0JuUnZkUVFJQzZGeWhFS3UxT25EZEY5?=
 =?utf-8?B?WlRNZ0F0NmloOGRUSXRZVkFlY2lhZE1uand1SWNCWnR4YzdnSmFJWTYxbHFr?=
 =?utf-8?B?ano0OHJWL1J0QVhraTRtQVorQW9EbEhTNzBMMkd2bFN4aDBaaVA2cTVsN1Iw?=
 =?utf-8?B?c3h5cnFpK2Q3a05XVXJIbG82dnNZQ1JJWU1SK2lXYkxwZlpoRzlacnlyRjZn?=
 =?utf-8?B?Uyttc2Fyajd3dEhiQytHa0RWMnBpQjBaYWpqeE9qMW14WWRJd1ZMaXJUS3ZV?=
 =?utf-8?B?WTZJRzlMOFNsM1lCSHB1aDBvbmZYVHMrSFY0ZzdoaDhWZXNoeHErL3RzakVi?=
 =?utf-8?B?eWVlZGhFZDFzS0pRZ2hORmJnSG55WTFsd2thSTlFYWxPVHpFVFd4aWh5blk0?=
 =?utf-8?B?TitmbDVhTmpTMllKRkNmT2tFSHJRcm5HM0ZYOVQzeWhwSENvTHlsSHNVMHlD?=
 =?utf-8?B?YXczem11ekhEa2RvakVNNndiWGRyNUdmS0prcTZyT3FmT1BVRGtOeDBwd3hL?=
 =?utf-8?B?TjNCdE5zcXBWa2NpeW1QZmxITlp4Tnh6bVBBb1krZ3dYalp5WDExMWw3RjlW?=
 =?utf-8?B?bUFNZWdQcjY3ZzczY2MyaFNFek5OZGRXZjlaM0VEaGxsN0JvSUtyUytIdmdH?=
 =?utf-8?B?dVJuSDJrT2IyMlQrbGNYUzFKSEwzaXFjeHo2Q1BFdkM1NlBiZ2IrL2xKR05D?=
 =?utf-8?B?ckFGUG84ZUJMdTFoQ2lBeHdWbWZ3MiswSWtlMm1iY3dwc0c2WUU3amhmRFQ1?=
 =?utf-8?B?clp3RVFWZXY4TEx2ejZoQmpYaW9DMmM5N3FzVkJWdEU1bUhaOXgraWVCT05z?=
 =?utf-8?B?enJVNzV0VnVxQkFxaXY3Q1hyZE5KUnVReUZIY3ZvV2JSK09uZVhQc2dUSFp3?=
 =?utf-8?B?WjErR1d3TVFUekU0N05HOWJSb2JFem5RdVRkQm5OK3M2M1plcjZ1YXlNQmo4?=
 =?utf-8?B?S25ib3BkbkFCNGhtTnExT3JrWVU5ZkpqakFxUzNKbWd5SnRvSFBIOFZnaURS?=
 =?utf-8?B?ZzhmTmp3cmFlck1QbVUwSk0xRWJvUUhiUUdUTng1QzlGeTk0R05BNjVlWUYv?=
 =?utf-8?Q?iMwE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Slk4RHJXNTVmUDFPclB5SXQvK0wrbVZhWkxmZHNycEpTazI3MHBjaVJDVG5n?=
 =?utf-8?B?dmxaNUpodmZhZHBHa1dmVWgxS0d1bjFkdW8yaUMweS9oWWQxUFRBMXZHaU5V?=
 =?utf-8?B?Unh1Rzl1SkFScXZtRUZzUlVpTXBZYkM4cFhhL21HZTdDWHNSaW9aOVN3N3JZ?=
 =?utf-8?B?NXRoY09EVVgzTFdVZE56N3B5S3AzajNzaUxFY0VIZXMzdHhPUGZVVXlYVjd1?=
 =?utf-8?B?UnB6U1h3cXBDN0xlYk1rdEUrYjBVaFovYVEzV3piRmJqc2tQZUg1bGRRUjFu?=
 =?utf-8?B?dEJ6RFNKeGIvaWF2dldwWHpzUDdiWmdjUWUrcjdkdGozblJOV2ozYlpHWlVT?=
 =?utf-8?B?NzBiR2lzdm1USmZ1Z0Qzc3ppWE81aWd6cjNuWlVtQVIxeFl3RHlBUnhaY3F0?=
 =?utf-8?B?bkoyRWk0MHEzSElOUXVTNVp6aC9Za29qaVUwNlJ6TUZBTERsNEh4dHUzMTZ6?=
 =?utf-8?B?MWM1OENtRzBwT092THF1T2JyWDg1S2tqbG9jYWw3ZEl4dUdPTnpzZWc0YkZX?=
 =?utf-8?B?eVk3a01yWFdOa1J5blNUSDdkNDd3d0NwaGdzcXdhbWN3aXdQZGplYnROdjdF?=
 =?utf-8?B?bE5zTFdKM0NUV2hCQ2FHWHF5U3o3anVadzAyZjFSaXdqTktvM0ErR1RpTkhM?=
 =?utf-8?B?SmxGQVR0UElIWVhuTnpxZ3pwV0hMMEp1Vmw1QlZCVlVvV3pGVEVZSS83UFg0?=
 =?utf-8?B?MG4xNm5FWXc3Wks0a1JRNkhtbGhaZ00rUWVudDkyL2lYV244NVB0U25lWmEv?=
 =?utf-8?B?YUQrQWFIOGJHeW1NZzU1aXZwd3V5VDRzL0piRlVhWkFrS2dDQ1dJSGRhUURk?=
 =?utf-8?B?OHZ2aDdkWHh0amQ0NlNFVHo4Q0pINEpmOVZuUFlRa3J2VVpIOHNzVklsaG1I?=
 =?utf-8?B?ZlQ0djF2NXQ1Z2RYNmFPMmxpbHdDMCs4M0QxYlJSZXZaakxyRFF6cm5tRXV1?=
 =?utf-8?B?c3RwS0s2R2EvK002NTlNdWgzV2xMZCtDUWdxK2hDMml5NWs4dVhEem9ndkxQ?=
 =?utf-8?B?Si92TU1sRGZjdTBySFcrQ28zWXdMdUhQbEk0Z29sWERPVXJKSkhXZFJUSExD?=
 =?utf-8?B?a09kMUFuTkp4U1d2T3hkdmhsYjdDU25hUkRDZ3JYUVJGUGt4Vzl0MitXaE5M?=
 =?utf-8?B?eml2ODFHTzV6UUkvaGhuWFpyOUZISVVvVWJwWEFlTEY0dC9vbU1lL2crQVpB?=
 =?utf-8?B?NEZNTVNTMlp3ZXpVbUNrTkozelg3U3B5dTlXb3E0UVQyLzhKVllPTjBVUmJy?=
 =?utf-8?B?a0VzOGpsekNQT1Q4M3pPZm1Tb3BXTHRkSUZhRUNtT0dPb0YydnZHVHloMmVK?=
 =?utf-8?B?dWN6cDBzWWJreU5ncmFwd3hsRnZqWmI3cDRzZlBzSXdnUXA5QVNlZzkzYnhI?=
 =?utf-8?B?R0lnRjRaNW50T0FIbjNFbTRyWVVDTENLSTJ5MmJvVDRJcjltUE1iWE1USGFx?=
 =?utf-8?B?eXZtZWJVQXkrOTZHQ3JRRFVjMXAydGc0UXovVnpTcWM4YUZXbUY4U1l4cmpT?=
 =?utf-8?B?cnhGUWZzdGwwbzMwUnpObFhua3RYTm5kY1Y0Q0sxUFVlQ0VlcUliWUpCbDhl?=
 =?utf-8?B?VkJxTXpUUmdTdnRKWTVGYmhvS284UkZuV3lZZkovL0wyMmZPOUVQbGRQQ1A5?=
 =?utf-8?B?dmhjQ0IySnBRUUZmS3M2anYxbW9Jb2hsN3JwSlVkWEYyeUFVRjcvbk56K0RJ?=
 =?utf-8?B?dUx4Z21FcWYzYTNOS3F4QjVBVlFVekVOV1M3T25uZ0M3OWpreVh6YS9oTzdF?=
 =?utf-8?B?NzQ1aEdHSk5lSTF0Z3YzTmN1OWRieWJpZ0RwRkZ3RC94Qk5pVUNzYlVjZkNK?=
 =?utf-8?B?M0ltVkZ1bUpYbUJqQS9NQnhydHdTQjJka2RxMklvYUJyY0RKSVNNa1VKVUFV?=
 =?utf-8?B?b3lxc0lZWmo4dnNvMWtKZnBtb1BUZjAvUjhNdHhRS3Frc0ZzajVaYkV1Kzkw?=
 =?utf-8?B?L1J4NkhiTStqRzlvblYzMjg0dTc0NlcvdmZycTBrdGZGK0ZWcEJBRXNQdGpD?=
 =?utf-8?B?NGFrRGdieWNMYWFTRUd2SUVMU2dPM05QRWxwUU9IYnM5NllwampDeDV0L3E1?=
 =?utf-8?B?SUxCMklCenpZemVGcW50QnFyQ2ROdWRnWG95dnZnY3VlTWZ1K1ZwVVBYWVJZ?=
 =?utf-8?B?b2twcHcwTXhnMkpMMTlxTzIyNk5DYnp2NW5iNjlWcjRzaTBiQ0Vld041ckVR?=
 =?utf-8?B?cDR3UGVkSFZUZUUyN3RTWlhObzVJcTZOS05EMXJNa3RKVG13aDhJd2JkaStP?=
 =?utf-8?B?YkgxUE83MWJkbXVkSktEbWpnaUpoMzk1Sk1ucEduT1F6ZEZGRWFYMGNJQ1VU?=
 =?utf-8?B?Nk5MVWJ5Mkgyb2FTK0JacWNqWHJOT2o3dXNJd0hFcS91dElnVnB1dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589f8a78-73f9-49ba-20a5-08de5f3d2e8f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:49:11.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3plFnqphfD57IcW1sefI8QuaquvhRuA6lGm+nwPkKNqGtEGYiIPOX7zc1HIimxhvnD6s1H2hiB2BYZylGxHqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5916
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5590FB0930
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 02:07:58PM +0100, Jan Beulich wrote:
> Don't know how I managed to overlook the freeing side when adding the case
> to alloc_pdev().
> 
> Fixes: cd2b9f0b1986 ("PCI: handle PCI->PCIe bridges as well in alloc_pdev()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

