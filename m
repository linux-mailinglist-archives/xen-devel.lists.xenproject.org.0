Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA47CAD2EA3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 09:28:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010538.1388658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtP4-0005ls-I2; Tue, 10 Jun 2025 07:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010538.1388658; Tue, 10 Jun 2025 07:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtP4-0005jY-EY; Tue, 10 Jun 2025 07:28:14 +0000
Received: by outflank-mailman (input) for mailman id 1010538;
 Tue, 10 Jun 2025 07:28:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OYHl=YZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uOtP2-0005jS-P6
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 07:28:12 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 701e8ded-45cc-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 09:28:00 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 07:28:03 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 07:28:02 +0000
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
X-Inumbo-ID: 701e8ded-45cc-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ij/IJF7TkwFiNyKs0HuMR7sXl24bZwF0VCp/MZUK6KRA7iGSnLjSF/JEwSr3i1vW6JWvONTdfYWP3DnWPA+YatHo4YxoYrwWQ+l2mZDTnUoEUmcV7fupE7/bZ6xLXcuQfjQ9SzOj1nhZvQ6FAnB1fzQLSLqqMJIpyMzaYVF6LNcwc8T9+RgTgkD+k+ZZdaox+TjL4bHuo88eTsNhP2emMMDxoBpuog15rWKBfA5RGerm6/9dP2v/C6GKD1B1qNx6vHRERWhi+MxPnn8fRjCOhLBm7i4E0wZB4rHzQ7Qy9BwSKUs376GXbWPhpjyjUv+PUs02V6f0VZFlRWUFirf3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiAcE5GUvJDbX7VFRd5mc1mfxZgRcsDqd416ZPMpgJQ=;
 b=eMo+T9ZUtFFZvUHgcQxjd3mTAQS3csGSaeiz7+8d9jGGFyqhqu1DM1RKB9i97yX89Tenm6qCQ5h8GJQz0YW30ehce3F81CVSC7XRIMVc0vh4R1zeYl4JtmY5JFNYGEir4S/bx7NNTtnSgwnciQOX4J2y59EiKsLpTPnq1tUavg0zl02fJa/JtnvlV+1Vqsv/iDqbDwHULqPZCwBOj1+mO8rLtd0I8EC+vQoSp0Wn07Q17srNQIti8F/VsLJnj76vipugWTgO/nvyMBc/8YAHWeD/33zkpBXlfwb23ax+yc249H5J+Si+7GyEAWQ0C2ZJuOa2Csxqw3I31f9+lY0etA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiAcE5GUvJDbX7VFRd5mc1mfxZgRcsDqd416ZPMpgJQ=;
 b=LXNMZmsp9rNIYoT/UMyiG/n+KP08txUJ+XbIM8oJyF9glEZUokvEF9DG4G2QaGUUjuDWXol41yGtuAkNtzhPp5WeKXVpdGZRZHYjpOcOdzrkS1Qo5KXpa4HEmro3vccV5YS811TniT4sUUGMAqKqBSj6YtIKgJY1Ua9Gv/odrHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6a52ad54-cac8-43fc-b396-87b0ac01d1dc@amd.com>
Date: Tue, 10 Jun 2025 09:27:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/arm: exclude xen,reg from direct-map domU
 extended regions
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250609183438.178214-1-stewart.hildebrand@amd.com>
 <20250609183438.178214-2-stewart.hildebrand@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250609183438.178214-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA1PR12MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: d80cefae-5bc8-43cf-0892-08dda7f05586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnpyQzdOeXdmSDVVQ3o4WEdLY09hNEs4MjdjZGppOHZWUGRNc3lIMUZ1NHFo?=
 =?utf-8?B?bndOTjNuTFFsVU9aTEtMUlVTaExTM21UUmhLbmxkZGphdlpGb2ovaWhMMlE5?=
 =?utf-8?B?RnhRaG9WaSs1TVdLQ3IxWUpwV25QbHlMdHpPUTF0ZGQ1ZzU3bXR3ZXhPYWQx?=
 =?utf-8?B?UzJiMnpBUzhFUWg0UHdOVmRXNGE1ZFRHbi9lSVk0WUdMNkZBMHNtQkFNRUZo?=
 =?utf-8?B?eDdXQTJCSzFHNTk0Tk1BR2dza3Yxem1USXJreEJrRzFqQWlGSFM3QkhkY2lD?=
 =?utf-8?B?dlMwZ0xuMk1uZlFRZk9YUGxKd2ZjMGtqN2UxMlQ5M3NwUVdnaWRpOERmNExJ?=
 =?utf-8?B?U1RuUkVtSVlVZC9uNm9xOWdCKzNCaTB4UFZYY3drMXRraVJLRkVZQjc2bGJB?=
 =?utf-8?B?Y0RzK3RqcG56YjhyYmF5aW9kNGNVeGdOMDhnS3dKTXQ1bWhIb0lIbnBrQnI3?=
 =?utf-8?B?MjF3YTB6N2JnOGkydkxRQ21lWFlDWXlhSkhrbXEvU0xLeDc4a3Vyd2ZIZ1Jq?=
 =?utf-8?B?bjB2Sm5JbDFVT1RNbURTOXFLRG85cHpjU0pERk5tS1FFeU1IZEJNd1puZi9r?=
 =?utf-8?B?bUlnTUI5bE1vNE5KQllGVzlpS0Q1L1l6bTdZdzhNaDE5cWM0bEtqanVSQncw?=
 =?utf-8?B?MkpYOHEzRXA5UlNSdjErVUgvUnA4SEJxSUp0cUM1eFdNejY4bEFJci8rbUIv?=
 =?utf-8?B?Mjl3K1lycHEzY3Jmcnk1eFJZYUh4Q0F6QmpBekt5Wm1YL3ROOWhZZU92ZmlF?=
 =?utf-8?B?L3hRdVRSNlZKYVEvcDJ0MUd0TkRNck5pQ0x1azcwNjVjUWJqcXhCaWpIcGNS?=
 =?utf-8?B?cjJYRWhuQkFFR3Aya2xCYnhUWStTN3NpYmZhRmZWNVlGS3VQNy9PVXFnbGlX?=
 =?utf-8?B?ZUZGS1hPalJlSkdxWmxac2xVVUx2UEhoTmFmaWpEYUdpR1ZXUTcyZWdmZkJu?=
 =?utf-8?B?cDUybjBxaTRoZmx3VXRqRm9VaUVOSWZZTUNuWWIwd2RpcmNXYXVKWEdKMWRn?=
 =?utf-8?B?VWdVSUJwWTk0R09zbEtjZ2FrdDJpNXFOMzIzZndCVUVVdVlJeFJrSm1kaEo5?=
 =?utf-8?B?TTU2YjNzV3d4Q3pJYXRvUWlNeG83WHRyaGVJVkcvb2REaHpOalhES2lhZVZY?=
 =?utf-8?B?QURQL0pLRk9mVjlMeDVYTzNJbHYrckxpTlBER3A0QTZTOVJ3Yms4TkpIT2k2?=
 =?utf-8?B?TWRTNXRnVFRXbEFYS2NJUGVDVWpyR1l5bVp6SStEMURmRTFmMjJkVXVMTTFF?=
 =?utf-8?B?TFoxalJaR2dIYm9jWUZUZEhxZVpWVVV0aGxnUGRJOUkxYUs3UTNvMnVXYURP?=
 =?utf-8?B?YzZsUXVHcFJ3WVJyK3AzZVZ6Y2w0b1NRSjR5azZYc1VwbjNqVEpiaUNkWHg1?=
 =?utf-8?B?ZW0zY1pER09OZlBMUWFhSk00SFJGTjkyakRBVUFVTjBGa2NHdTJjb2QyR1By?=
 =?utf-8?B?R3BCdFlhdkFFQVh3NjdMUllDWVF2WUxLZGNLSHQ3Ri9Obmw0KzcyaXk2eTl4?=
 =?utf-8?B?OVE1Z0xMT3NONkkzZVJ2K1QrVGkrWkRaQkVLNmhsZlAvY215Yzc4UG12V3Nj?=
 =?utf-8?B?cEl0SFV2emNGcFNsUEVyQlhxbHRRUmtyZnpaQ0dnWDhoZFlIZE5Ec21vZmEw?=
 =?utf-8?B?T1lIc0pDZWJ6VjROcTZ2TjJLNDZQQWN1NU1MNHhPQnpaQkhHV01NWDErVXdL?=
 =?utf-8?B?Tkh5cUZ5Vy9aWGZveUV1S0RUVmxVd2hUclBqYS9VWXJXR1VDZzB1Y3lWL2tV?=
 =?utf-8?B?dUk0Z28xb3hYbmgyR3RoQitzZFd0QWx2b1lOZEpsaHZDOEJnMVVUMTV2VHAv?=
 =?utf-8?B?eE95RmsyZ0JTSHdOSjkxVjNPUXZQRlBzODRaVHo5RG4vZUNDU2g1UldaWktI?=
 =?utf-8?B?WS91cENJZ0E5d3lHMFJBTEdxM3Y1OVhBMGU5eis5cjcyVjQrS0pyM0E5WTNs?=
 =?utf-8?Q?G2FhNSwbsXo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3E2bTlWSmJzU0hvYXNrMUtFNmpDM08vM05WNEt1bGw1bHBuTE9jakZIZHp6?=
 =?utf-8?B?Z3h6Z09nMnYzUWpnbDFWeGpzN1p4cmEzSFB4UGd6NEtZeFh2KzRTSzVvOGdY?=
 =?utf-8?B?QmE0Q2pXZ3g3ZStlRUQxYXZ2MmN4RGpVRlptdHdtb3dnSWQ0VjB3UlFsNzhK?=
 =?utf-8?B?bHBLZ3J1Vk9mL21kZXBlSE9vT2JXd3NrV1V3ZVRsZ2JFc2dZRWIwZVhCYkph?=
 =?utf-8?B?dytYcFZnZEg3Z2RzQWFROERvQlAycVRJV09RRnUwQmxYTnk4bE1MTjgxaEJB?=
 =?utf-8?B?ck4zRU15Tm1jeTZ4ckdIMFpQKzREMnFjdnNjVHFhZGxoTjYrbEdoeEJVSTNC?=
 =?utf-8?B?UnM1NTMxVU51YjY1c3lHam5pTnR0RVFGNlBGS2w1YUJWOUJIb1RoSjFNaUtu?=
 =?utf-8?B?M2VUMjZUWFg3aW5WZENtdmxldVlIMGlyRzRKWVFSQU9CUlBES25DdEt3ZlRC?=
 =?utf-8?B?OHl0QW5EcTY3eDA2eEsrR1oyYUtBQmxLUjEwQy93YkN4a0xlS2FNOEZtZ29n?=
 =?utf-8?B?eFozeGxBRUNVQTgzSndZdGRQM3pKczVBdHpLZmRIV1ZXSlFTTG9lVnl2eWxL?=
 =?utf-8?B?dUZ6NG04cUFaZEFLNTRTTUZaR3dMang1dDQ4MGlxaWFiWmZpNjNBeU5MbWp2?=
 =?utf-8?B?WW5TQ3FWbkFidWdDM0ExTmE2TnhPbUEyUWNiZytoU3ptN1pyOUwwMW1sVTNh?=
 =?utf-8?B?RXVzc1V0VHdyK3N3RlhIUjR0NmU0TTZCR1ducHNGbnlNQWJrRE9DR01MU0Jt?=
 =?utf-8?B?QkJNdXpLdG5aOUwvcDAwQXZpdUM1S2xjVlRWVHRuRjA3ZVQvcnFNajJrbkVx?=
 =?utf-8?B?em1UUVlEay9SY0dESHQzaW8yMHVXMlNEbTl2S0pGc3drdUdWSUhEWi84MHlq?=
 =?utf-8?B?NnZuNTVNdHJKZDVlamk3Rk5DeDlDU29GWkk5T1JaQjl4LzBnZE9ub0hjMzRB?=
 =?utf-8?B?UDdQR09XUjVWbjFSb3dCeHBYZ2Vvb25SRHdXdGNTZDVwY3A4Qzl0QXBTNUt4?=
 =?utf-8?B?YkFyNjAzZml5UllseFVTOCtnT1ZNWlpVZWFzWlVNM3JhM2JxeTBKczZ6akpH?=
 =?utf-8?B?VEVSOHB3c21KUXZZdFFhYjUvcTlUdGNZd0VqUUxFYVZIZFloNERsTkthR2JQ?=
 =?utf-8?B?RnRLemNNSzZaOUtHYXdQcVpyc2pUOGlzdDZUU2ZKdks1aUJUUGd6TDA5MjVh?=
 =?utf-8?B?RUdjRnNITzY0Zy9Wb2tWdnNKL2VkanUzRHBsZXpBblpzbzhRRi9ndG1WRXhT?=
 =?utf-8?B?ekZ4QkQ2bldQNlFyU1J6VW9HSlcxQ0V3MDdMN0wyUkgrb1J0WkNkSS9PY20y?=
 =?utf-8?B?ak10QnAvSmRYeEl4U052K3Z6b0pOemJlc2xyd0cxLzJldVAzZXBBK2U1dFk5?=
 =?utf-8?B?VUtUZk5oanNJZ3Zna282OFplZ2FGblA4ZFcvRmIybUVQZVFtQ2hTb2FhWXhi?=
 =?utf-8?B?bVJSanFJTjU1eGQvbjJyby9ETXFkZmJ4TXFNbk9DVlV1cnBVckNyVkZFRDg5?=
 =?utf-8?B?M1NmWWwxR1dzeGNabFRQdHdGbUxKZTNIT3BTbi9UWVA3aHc1SHM5YlhZNmFi?=
 =?utf-8?B?Uk1VLzBzcC8rMm5jQnZqMi9pcFVJQWhnbmw5YXhOWlB3WnNJUlRMdHAzVGNx?=
 =?utf-8?B?a3E1MlpId2pTeWJqclUrODVKcGpxSUNQRHlmN2J3azFSRURpZi94RnNVcVYy?=
 =?utf-8?B?QjNlYnUvR3NrbTYvbHNyVjdIVlROYVNLbWRib0FkMUFWTXU4bVV4VXdIMHBJ?=
 =?utf-8?B?NlpJVXlKRE1LTDRDRE5MZ2M0OUM5Wk1kelBjQ1ZORkZreFVFRFFaMmEvUlhK?=
 =?utf-8?B?bENwM3FwczArbEtoazU1V1VIRlNKTUVxWUlPTW52cTExTFRBQUVaSG1FN25K?=
 =?utf-8?B?TEJVNmN4L1o4K1ZlTGdXTXhCVHdBdENCcHlSZDFoVTRVa1MvaEs3Z1Z1TFdZ?=
 =?utf-8?B?czFaWmhvbGtTcERpbnZrbVR5Uy9veWVNSUV0ODMxTHRITkl5ZGppaVR3NGtO?=
 =?utf-8?B?dStxTzg0T3pwdVFVQlNHaTZVS0ZOcEdNNlU3NHVtRk1oY0tySlVHc0xxVkZM?=
 =?utf-8?B?TGFxK3ZkQVBZcDhtNjdUYytKdklIYWF1eXJNQnNGckp5VVFZMmIzR2tCQllE?=
 =?utf-8?Q?uqrY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d80cefae-5bc8-43cf-0892-08dda7f05586
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 07:28:02.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvQSryrq3TgMSfd9kxOFtAdq8o4a75+BDBa80Bl6IfZxePfrqMA56zRUQkb9fDqp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6701



On 09/06/2025 20:34, Stewart Hildebrand wrote:
> Similarly to fba1b0974dd8, when a device is passed through to a
> direct-map dom0less domU, the xen,reg ranges may overlap with the
> extended regions. Remove xen,reg from direct-map domU extended regions.
> 
> Take the opportunity to update the comment ahead of find_memory_holes().
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v3->v4:
> * conditionally allocate xen_reg
> * use rangeset_report_ranges()
> * make find_unallocated_memory() cope with NULL entry
> 
> v2->v3:
> * new patch
> ---
>  xen/arch/arm/domain_build.c           | 77 +++++++++++++++++++++++++--
>  xen/common/device-tree/domain-build.c |  5 ++
>  2 files changed, 77 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 590f38e52053..6632191cf602 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -792,15 +792,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>  }
>  
>  /*
> - * Find the holes in the Host DT which can be exposed to Dom0 as extended
> - * regions for the special memory mappings. In order to calculate regions
> - * we exclude every addressable memory region described by "reg" and "ranges"
> - * properties from the maximum possible addressable physical memory range:
> + * Find the holes in the Host DT which can be exposed to Dom0 or a direct-map
> + * domU as extended regions for the special memory mappings. In order to
> + * calculate regions we exclude every addressable memory region described by
> + * "reg" and "ranges" properties from the maximum possible addressable physical
> + * memory range:
>   * - MMIO
>   * - Host RAM
>   * - PCI aperture
>   * - Static shared memory regions, which are described by special property
>   *   "xen,shared-mem"
> + * - xen,reg mappings
>   */
>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>                                      struct membanks *ext_regions)
> @@ -882,6 +884,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>          }
>      }
>  
> +    if ( kinfo->xen_reg_assigned )
> +    {
> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
> +        if ( res )
> +            goto out;
> +    }
> +
>      start = 0;
>      end = (1ULL << p2m_ipa_bits) - 1;
>      res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
> @@ -962,11 +971,48 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>      return res;
>  }
>  
> +static int __init count(unsigned long s, unsigned long e, void *data)
> +{
> +    unsigned int *cnt = data;
> +
> +    (*cnt)++;
> +
> +    return 0;
> +}
> +
> +static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
> +                                      void *data)
> +{
> +    struct membanks *membank = data;
> +    paddr_t s = pfn_to_paddr(s_gfn);
> +    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
Why do you subtract 1 here if ...

> +
> +    if ( membank->nr_banks >= membank->max_banks )
> +        return 0;
> +
> +    membank->bank[membank->nr_banks].start = s;
> +    membank->bank[membank->nr_banks].size = e - s + 1;
you add it again here.

> +    membank->nr_banks++;
> +
> +    return 0;
> +}
> +
>  static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>                                               struct membanks *ext_regions)
>  {
>      int res;
>      struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
> +    struct membanks *xen_reg =
> +        kinfo->xen_reg_assigned
> +        ? ({
> +            unsigned int xen_reg_cnt = 0;
> +
> +            rangeset_report_ranges(kinfo->xen_reg_assigned, 0,
> +                                   PFN_DOWN((1ULL << p2m_ipa_bits) - 1), count,
> +                                   &xen_reg_cnt);
This does not look really nice with ({. Why can't we create a helper function to
report the count for xen_reg_assigned and call it here? You could then also open
code your 'count' function that is not used by anything else and is quite ambiguous.

~Michal

> +            membanks_xzalloc(xen_reg_cnt, MEMORY);
> +          })
> +        : NULL;
>  
>      /*
>       * Exclude the following regions:
> @@ -974,6 +1020,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>       * 2) Remove reserved memory
>       * 3) Grant table assigned to domain
>       * 4) Remove static shared memory (when the feature is enabled)
> +     * 5) Remove xen,reg
>       */
>      const struct membanks *mem_banks[] = {
>          kernel_info_get_mem_const(kinfo),
> @@ -982,12 +1029,29 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>  #ifdef CONFIG_STATIC_SHM
>          bootinfo_get_shmem(),
>  #endif
> +        xen_reg,
>      };
>  
>      dt_dprintk("Find unallocated memory for extended regions\n");
>  
>      if ( !gnttab )
> -        return -ENOMEM;
> +    {
> +        res = -ENOMEM;
> +        goto out;
> +    }
> +
> +    if ( kinfo->xen_reg_assigned )
> +    {
> +        if ( !xen_reg )
> +        {
> +            res = -ENOMEM;
> +            goto out;
> +        }
> +
> +        rangeset_report_ranges(kinfo->xen_reg_assigned, 0,
> +                               PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
> +                               rangeset_to_membank, xen_reg);
> +    }
>  
>      gnttab->nr_banks = 1;
>      gnttab->bank[0].start = kinfo->gnttab_start;
> @@ -995,6 +1059,9 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>  
>      res = find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
>                                    ext_regions, add_ext_regions);
> +
> + out:
> +    xfree(xen_reg);
>      xfree(gnttab);
>  
>      return res;
> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> index 6b8b8d7cacb6..99ea81198a76 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -193,6 +193,10 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
>  
>      /* Remove all regions listed in mem_banks */
>      for ( i = 0; i < nr_mem_banks; i++ )
> +    {
> +        if ( !mem_banks[i] )
> +            continue;
> +
>          for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
>          {
>              start = mem_banks[i]->bank[j].start;
> @@ -212,6 +216,7 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
>                  goto out;
>              }
>          }
> +    }
>  
>      start = 0;
>      end = (1ULL << p2m_ipa_bits) - 1;


