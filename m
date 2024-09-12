Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946529765D0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797156.1206993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogGo-00024x-24; Thu, 12 Sep 2024 09:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797156.1206993; Thu, 12 Sep 2024 09:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogGn-00021o-VD; Thu, 12 Sep 2024 09:37:45 +0000
Received: by outflank-mailman (input) for mailman id 797156;
 Thu, 12 Sep 2024 09:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oCU=QK=epam.com=prvs=598511cdff=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sogGm-00021i-C8
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:37:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a73abc84-70ea-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 11:37:41 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C9MPa6004531;
 Thu, 12 Sep 2024 09:37:31 GMT
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazlp17010007.outbound.protection.outlook.com [40.93.65.7])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 41k7uay656-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 09:37:31 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB7512.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Thu, 12 Sep
 2024 09:37:27 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 09:37:25 +0000
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
X-Inumbo-ID: a73abc84-70ea-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7ZliciYKv7Cae9WaqKMCPXboyCcAndHiEn3xnCL2AQ8uxfWDMW+ouqrFe0qL04n27TctjuNVMgsHyILZRhkHjSCaoHPjY5Wemka+59Iu7R+fsJ6b8bLmqVPfdNlANHVNl9Ogc5YEc2uV12BwRvMZgfNydp11mIR31sUV0lZ56S+tk+lEAvNTrHpJNuaSjSz0zB2pWEcT1/p73G6Zx+nLJZ8Z+uPzwtDA4Ioxxs1Eh76M272JK3x9W8SvJw/s0Mkj0KJnplWemHiAPXzHoPZumPLGaKjk25LxyEfpyUigacEFUxY1/xgm9EggRR2aZoRC9jc7ox1aNza8VCpR0FElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLSJSBbk3LHc5LzO3HLIMGsfI5HpRnxDIDqvhIFRJ90=;
 b=R5mvYXmnII8kqKcKUwwg5L3neMYP87+3obSYe81Vo9zfFmsfLoSchm5GC6G8tE0J56zGoO4LtSZitS8NALfGxMOk3jBBIrj0FtGIX3qqivGUdW+0Fw8ZKm0CdiTreAPW1xx7IweexLWnLB4oS/EItJnemp4Jw6y65hwgAU3VN3hf/yHdnlenPEqTPTEV2pmaEPR0Mt4N0joA/XI98miaVktM/aPuxL6dKT94ozS6Z8oYpzmPqXPA9F/rEllzIs9Xkovl1SUDXDl3mdR+Ua0cnnwY2b6TcnP2m6Hyd6+2sHGH0TM52U0k3GiaH2Aa+dMm4AdPzLe7hKvHOirBBizheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLSJSBbk3LHc5LzO3HLIMGsfI5HpRnxDIDqvhIFRJ90=;
 b=M+IwGQhAK98DpbRTRz0Fpgd9CZDI3zldbRKe7Twi+auIRlck4SvqE/2G6wYUuzCTMyRyjHYsPS15o1xBgikk98K6Y0MJNIeRg/tVeG1MpvLJp2ZCwqDyyJAOveg+B0QC0FSgNCcB4Trigx+jrHpwJJwB53Am7CL39XDn7dbiQ0h4Pw57PiSuMrEQVjXEugcj32ZJRwJuZwz09Yzn+UNevE0/E5NLV7Phjoj0rvYxGDkW42apn1xUK2ZfdlbPC8TSVUpVyDqSUXLOwen5c4ln845iXYzHOXrYrt9iefhkgWWxHMXHfBTViXgUKicIiGH06QB7R3ZR6naOPpXtBh8+Rw==
Message-ID: <dfdf69fa-a6ce-4366-bc98-f6ef50287c79@epam.com>
Date: Thu, 12 Sep 2024 12:37:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4] x86/intel: optional build of PSR support
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <20240903072614.291048-1-Sergiy_Kibrik@epam.com>
 <2808764b-e1e4-4557-96d7-dc771be8a837@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <2808764b-e1e4-4557-96d7-dc771be8a837@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS8PR03MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2e2c47-4a39-40de-73e0-08dcd30e8245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVJONU45amNjSHNGUU94Mm9MUzJlTjNFbkx5Rk8vYS9ITVlNaW9nbXkxS3pt?=
 =?utf-8?B?ZTEwdFdzbjlGanRPNVFlNTgrc1l4Tlo2MHI4aEJqZ21JcEoybFY3OEptRGty?=
 =?utf-8?B?K3BtUDd6YldHNTA1a2ExTmZiekRuWXpnZEVTM0xNdE56NEVzTW1VZE55emdu?=
 =?utf-8?B?NThFSEpOTlVVcXpxWE5RbThTOWUzZXFqVkFNWVMwejdYbitrczlnTzNoS1pH?=
 =?utf-8?B?UDEvUnJqSzY2WFZKZ1ArSTk0MkRYTEUyeVhTQnJYOEZIM3RKRTBnTkRkNVd3?=
 =?utf-8?B?Q1cyZEgzaGgxMSs4MVZMemg0cUV3TFYxeHR6dUd4aTlQdEJyanhsU1RFRjBX?=
 =?utf-8?B?RUpGaThDaVlYN2Y1UkJvaFlQYlpkTlFzSVcydUg5aDJsUDAxMkJvejRhREZi?=
 =?utf-8?B?akZyTnVUYkdnWDZldXNoV1duSEhKNEFTcFNFRUp1SjUrYmNjRnRtTzhibmJt?=
 =?utf-8?B?S1c2MjZsUlhwbVdzbU1yWTZKcHE4WUlWWjJST3hrTlBVRFpJb0pPai96NjQ0?=
 =?utf-8?B?cXRSK2lUVWVkZlFiUngvU0VneWhRUVB3KzczM1RrVWV5QlFVRnB5cTh5UkdO?=
 =?utf-8?B?MHJjQS9YQ2huSVFtb0RVYzhaL3VOcTlreWMwampHZGN3bkFWVFBQdkIwc1lm?=
 =?utf-8?B?TFpuR0RoNFVDZ0RSakVzdHlNakkyY0FsNjdmbEhzb21qTGRWR1d0OFM2bmJN?=
 =?utf-8?B?TXVaQnFyUFprcm4rVmZoZE9lNTNDZzlxZllEbVV4ODh2dmhtTm5QdlpxSVY4?=
 =?utf-8?B?cXhrVncvY1BOanMyelQzTzhuMlJhbTkyUWdkeEJWTjJnUzgyMWhXU2lBd3Bw?=
 =?utf-8?B?dEV5WkxtTyswbXczbEgxT0pidmNad2h2NGQyY3ZxWThXTU15ZklCWUhaMm9H?=
 =?utf-8?B?T0NyMXNkQlUyR1BQcUpaazBCMmc5dUJCakdhZE4vL2FQcnZkNnJiR01wMmRs?=
 =?utf-8?B?bDJMQkx5ZkRqK0N2cTJobzdyVmtoaHRXNlhSSCtRQngwK3ozQ0tqZHpCbGNi?=
 =?utf-8?B?Q1hDSWNNU2N3WUY5S3oyZXJ2aFpXL1BjaVpacis2MFZURnZFQWxRSStMN242?=
 =?utf-8?B?d2JFRUg4ME50dDNVSVVMTTQxQUxBMWpIcldJM1NFRlRiQnMrVzYrLzR2Ti9l?=
 =?utf-8?B?TnpjQzB3RDBVeDFIcDc2M0l6azhrcDlsdWEzWVZ6K3ZocG1KSjBQU2s4Q29m?=
 =?utf-8?B?KzQxOG03UFJwRmpxVzZRV3JBb0h0dkFXWE5FTWdGOGxaZ1BJSWkvbjl0K1BE?=
 =?utf-8?B?a2dXa2Vreit4OTFEREw4cy9FU1NDZ002S292dkl3NGZYeHo1YjYxR0xUZDVM?=
 =?utf-8?B?OVoreFU0Zkh5UWFvL01nTzg5KzBpUlVHdmlZdnhGWmVVNjJHYWtVZTIzNkNR?=
 =?utf-8?B?SHAwM1JMaFFGeU5USDZ4VGQ3U3IwWG9OSjF0ejcxdzlQQUVCMmZFeUtTcG8x?=
 =?utf-8?B?czVNUSt3alRDZFhOa2lqNlV5RGppL21QYkZnYlk4Wnh0MW96MGZDdDNLMStt?=
 =?utf-8?B?OXpqR0RQRWNVdVpEVC9PRFNtUXBqMGFDSU1LaU1xYWpSNzZscUVteHp3TVF5?=
 =?utf-8?B?QTNyam5QR0FReGNnRXh2c2xmWmZqWXZ2MFQ4SXo0c0FuSjB1cjNvQ0dFUENJ?=
 =?utf-8?B?M3NUVy9HMEplcFE5aXlrUWdwV3dSNG9iVGxnNVN2Q21Pdk1rWFVPRlBOS09x?=
 =?utf-8?B?VWpKRENuOFhKNkNkNzh1bDFaUEdDRG5IMjVpb2pvb3Q5R3UrSENSMnFrTnFF?=
 =?utf-8?B?d0VSNUlCYUM3ZFYzcDJXQXRUa1czVDlHb2xWSFJ5Uy9nam1VakZJaWNlQUtE?=
 =?utf-8?B?K1VEY2NIdmZmSkJPSVU4UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEZ1R2xacWN5bDZ0NzVwUFRFbHhDNytPdkpYRlZtUkwrVGl0ajhvUXc0Nkp2?=
 =?utf-8?B?dmxMaEJqZ3NFcmpLN3djbE5GdXJuWUNGandzZmJwbW1tNmJiOXlCd280Zjgr?=
 =?utf-8?B?UklpR1lDZ3pDQyt2NzhSa3FKazVrdHVzYlFhWFlQL2xWN2tKTUpYcnk3d1F4?=
 =?utf-8?B?R014ZHJvc3hhbzVKK05LUm5zaHlWWTdZdUlWSGhpNEVWQit0cjhhWVgwRFJk?=
 =?utf-8?B?VG9EMFp3dmVxc3JLTmF3QkRzR28wRGVUeWVZem5mSTM1N3B1aFhxREw4anA4?=
 =?utf-8?B?V1RZNkJDVDhsc01RdW9rdWhQNjYwSDJJUTltZ3FVSFpxS1NadW9DZkh3NHIy?=
 =?utf-8?B?Y3pBTW1GTzY4aS9QWGxFTHV4eTZaLzNwWWYwNXgrdWRQdWxPMGozelFhMmFq?=
 =?utf-8?B?QnJiNXgwSXNRb1BkWnoraHVLMWNxbXpyUFViaHovSzhNK0tvcGR5cFgvQzE2?=
 =?utf-8?B?VXpNT0hRdHRJditqWkxOTEltWEpuazBnUDNlMmV5NDd0eDJJZWVUSnkreWtT?=
 =?utf-8?B?L2ludTk4MW42cVNPTzhmVFUvclQ3RkU0RXFra3JMV0VVL1BxcHFiREtmNlcz?=
 =?utf-8?B?dDRmK2xwOGZyMjRtL21qbzYzalFiQ0xFdDZjVE1oUWVPSVl0RjFRNERpWGJx?=
 =?utf-8?B?SmlKcFYvTExjdU9VWldWNUM2RUI5TDFmbzk0cmFWWEtRR1QxTjFIRkRhTzNK?=
 =?utf-8?B?ejQwU1ZYYWVyMUdoaTF3Y3kya2c5UXc0SWFJcllTWEFUSWlVMzZZRXprUkU3?=
 =?utf-8?B?ak5vbURob0FWcG8xVDFkc2J5Y2ZvT0F4amlFWGV2eURGRndGTlVHUHJYaVV3?=
 =?utf-8?B?V2xVN256TFRkMnFkZ2xPYlR4N3Rpd1pOcWp5eFZJMG84SEpxZVNiYnJLVytY?=
 =?utf-8?B?b0hMZlpBcEdoTmFnYXBOWXorUGlDSnY2R3NKOGlLV3l4ZStHbTI3K0E2aHYr?=
 =?utf-8?B?dWJlMVB2enYwOFJFb0E0ejdQMThsVHA0UlRBY21KcFdTT2YwcmZpbFZtSm9Q?=
 =?utf-8?B?MmhHMUNGOWY2VmtyUUFldURSeThhVHZGS2pOS1E3Mk9Vc3grUVphTUFPMFZi?=
 =?utf-8?B?TGRhc1liczJOZFJUS1MrQ2tBaE9McW5hNVA4R0p4WTNYeURLZjNRdFVyMW04?=
 =?utf-8?B?ZWYrdUFSOW43Y1lBQ3B6MFN6ZnlLQWFUSEJoOWxXUEdTRkhFdTd1ZnM3YWY5?=
 =?utf-8?B?SDQwdEhyOTFkNVdCZ2JDWWtLYWIzc0t3RGg5TlNUL1p2NDUyeEZ5NHlvcmhP?=
 =?utf-8?B?Q1dKSy9UeHphRExGTmE1NW1pNjBOQzBBc0VjdE5GS25sUW5xVmZVM1pESlkw?=
 =?utf-8?B?bVpvc3hBRTZFbWpVd29TSGVoSy9Lbi96dWl4cnlLMzg0SmQ4bzMvWm5KeFFz?=
 =?utf-8?B?WERoazU5V2F1WVRYQVdkMGxOS0xFOFJEWjJJN1luODcwS29RRkdZdVJ2R1Er?=
 =?utf-8?B?dGlvdlhvOFpONzR0Zit1cmt6dnVMM2R1QnRFUzZOZXY1a3BKd1BoRXZLTDFl?=
 =?utf-8?B?ZllCR3NWT0dMcW5mKzZMbHo0YzVhblJDdXJTYitRbzJkUFN3RThDMmMvaVZs?=
 =?utf-8?B?YVJHb2xBdDRuSEUrNWhOTUhJUFhmRGdBNXFuNURNNkFhTUFCalk2TEUxc09y?=
 =?utf-8?B?YkNmbGpHOVVySWJhaGs0TGx1dnliU3RSdmJncjlhcjBQMTJPaVlWdlJWM2gz?=
 =?utf-8?B?Smh4cW4ybjRoc3FpamRqdFhReXV3cVZtUm0yeExnZ0lrcUNTaUFJR1Vac0Jr?=
 =?utf-8?B?NG1KQXg5NjJQQkxrcEdxSDgvS0U0WklwK0NmL2NjTnMydzRVYk9XK09hUUtx?=
 =?utf-8?B?NXZjekI5Mml1a3ZlOFNDZXhLYlp2cjBaRkVySG9JR2FaYmFjV1FIRjdkTnli?=
 =?utf-8?B?OGlRZzF3c3JuZ09RbHU3SE90R3VGQlVDd1c0T1B4UVMxVkVjYURldG1zOGhQ?=
 =?utf-8?B?Zi9aZ0NhRUNNUFNpdEdxMVBMeFZsZENOcXBOakJKYWYxZEI1Tk9uTEVsejh4?=
 =?utf-8?B?VjN4YUx6LzZlUUZ3TzNVazdkTmJISlY4OFR3VXFRTVZ1THJyY3B3dWIrZUNC?=
 =?utf-8?B?RU9zanloRmR4QTl2dWhkaEt3czUxVGhGSnMzaEJDdWNsTWJORkFYNDRmaHUx?=
 =?utf-8?B?TVNVcnJjTXZFUGpxenZmcGtGMjIxZFNUdjlwNGxMWjBCWjROTzJZeHl3VGpk?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2e2c47-4a39-40de-73e0-08dcd30e8245
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 09:37:24.9917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iABK432rojB8FyYqrnEPfkd4P/V3q56jyR8xeyi4fwPZXM8Q3uEOLOpB/IDRYq/nk+SzY8GjVZOYqDlsJTNlRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7512
X-Proofpoint-GUID: Bq9nJdMSw8GaGx-MhfagFFKkYAdUOaIN
X-Proofpoint-ORIG-GUID: Bq9nJdMSw8GaGx-MhfagFFKkYAdUOaIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120068

09.09.24 17:24, Jan Beulich:
> On 03.09.2024 09:26, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -284,6 +284,9 @@ endchoice
>>   config GUEST
>>   	bool
>>   
>> +config PSR
>> +	bool
>> +
>>   config XEN_GUEST
>>   	bool "Xen Guest"
>>   	select GUEST
> 
> Inserting in the middle of guest related setting is a little odd.
> 

you're right, I'll try to find a nicer place

>> --- a/xen/arch/x86/Kconfig.cpu
>> +++ b/xen/arch/x86/Kconfig.cpu
>> @@ -13,6 +13,7 @@ config AMD
>>   config INTEL
>>   	bool "Support Intel CPUs"
>>   	default y
>> +	select PSR
> 
> I realize Andrew suggested it like this, so the question goes to him as
> much as to you: If already we can isolate this code, is there a reason
> not to make this a user visible option (with a "depends on" rather than a
> "select") right away?
> 

The reason is I didn't want to complicate configuration without a 
usecase -- would someone want to disable PSR while keeping the rest of 
Intel support enabled ?

>> --- a/xen/arch/x86/include/asm/psr.h
>> +++ b/xen/arch/x86/include/asm/psr.h
>> @@ -69,12 +69,11 @@ extern struct psr_cmt *psr_cmt;
>>   
>>   static inline bool psr_cmt_enabled(void)
>>   {
>> -    return !!psr_cmt;
>> +    return IS_ENABLED(CONFIG_PSR) ? !!psr_cmt : false;
> 
> Perhaps just
> 
>      return IS_ENABLED(CONFIG_PSR) && psr_cmt;
> 
> ?

sure, why not

   -Sergiy

