Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD65AD3B1D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 16:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011016.1389302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzyS-000593-F4; Tue, 10 Jun 2025 14:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011016.1389302; Tue, 10 Jun 2025 14:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzyS-00056X-BH; Tue, 10 Jun 2025 14:29:12 +0000
Received: by outflank-mailman (input) for mailman id 1011016;
 Tue, 10 Jun 2025 14:29:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OYHl=YZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uOzyR-00056R-5j
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 14:29:11 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2413::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 450f9ab9-4607-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 16:29:08 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM3PR12MB9390.namprd12.prod.outlook.com (2603:10b6:0:42::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Tue, 10 Jun
 2025 14:29:05 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 14:29:05 +0000
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
X-Inumbo-ID: 450f9ab9-4607-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHTvGQEgXLChwax2kEvPACD0IgZwgitBuNM/SekLEpHSWsDz76dSgXJSj4kBQUc3rm8e+QV32woWtkSJWm0hVye5R8AJNl80HSv1O7eUcp+ASJojfZg2RfBkU69+nvqcFuAPODQGrRtXl868mFuor4zwNm0XzLJLaRrgv/H7UiHbeEWq1wVaGPJZ8FUOd50Sws3DFn9r76vm+/FVfmSZkURoINAeMmHViDwgwb43ZIT3HOqAV0cac1Z2nXymtx6Ff+y4TehjcWkJ/EigEgk9Rah0BXTBn7OfxBfQigLY07p4DPao2Lt6eiO7QJJ4Dgm9eYOFkKvkus/lZBak+MEBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MpQqWueoqx+vif+WSO7hSWpdvQfqgL+pblYKOdJV8I=;
 b=xxl9tXs5tXZSP6aIPNHtomeNZV/EQ+etgGL+hOBzJMQZo/OHmVC24SWxKOLWtvcux8LgopI163awyeGt/cR97BN4FcAymKr62/LR//8foDe4RPCbrYvYoHV8l35o43oBqnkqH9no6RD5LlYWwR4x6B3jrgOrMyguYF+oAcPwHM5s5O/JyGgDYNJNsVZqolg91VK4h17GqmDCkZLjnltK9Ouadhinq4QWqPkSyRUovliKaVPa52v7qTlfqdC6x2ABdfzU+LZqOHgZxnpHUQ6ZVi60Y72KqWLd2XaceFnFmzrCu7bYVob1Ek33m4AyaOvzn5rLqKWVaK2pqjKk+5pkrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MpQqWueoqx+vif+WSO7hSWpdvQfqgL+pblYKOdJV8I=;
 b=PkkeDEjQhFLdMjFshWa/+Kiyz4xVLpjG/XeBemvwMUj6C/0Nxts7XdE1ODaIiPeqeFTqvcTnurcV7jnQESFhQjf26c7Or8ULQIZlc9gfaCjz87Edyil+FKPx7xp6f9kRo59PFqK88mYLQt7hebvv8r+Vy4AoayY35yBXb+aWN+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <905c1306-4713-4650-aad2-95a580c656f3@amd.com>
Date: Tue, 10 Jun 2025 16:29:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: fix build with HAS_PCI
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250610142300.197599-1-stewart.hildebrand@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250610142300.197599-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::14) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM3PR12MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e07088-93ba-48cd-83b8-08dda82b2726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmN5TnMrbDR4M3lRdURuTy9oYkFXSTBSSVFVQlhOVVl5dm5wWW41RUEzKzVU?=
 =?utf-8?B?UXYva0tRT3BtOHhaUXBnVVFyMFR4NlI5RjB6ajhPY3hxdmZCL0JCakE2REMw?=
 =?utf-8?B?cktGVHY1clZtS2FBZnZycWJONlQxajVtL2F0bEQ3TGpNaTNzNmlZNnlLUmdu?=
 =?utf-8?B?QlJSTzlFeE5PcmJTbm9lZkt0cWtYcGUrM2todEowTjUzVFdzM09SS01BZzI0?=
 =?utf-8?B?SXM5cDE4MDFHZ0owUkF5L01pWnMvMUdxOVBVVDlyMEI5L0x1engrMEVoN2xu?=
 =?utf-8?B?NC9jd1NLZmVCZ3NOdTJDWEU3TzdBZXRrRzJJUTU3N3RDSWpUdWNTb3FHYkli?=
 =?utf-8?B?OCtvZ2JWZzBQUnRsSFdOak5MUE93YloyVStFbFJud1RGcFJNZmJkRDQ4RElP?=
 =?utf-8?B?OUswejJoSXJCdFlOSWh2ZzR0QjFpUHZwZjFCSnJHMENBV0dzaVgwSVN4Yk84?=
 =?utf-8?B?UTExeG9nbmVNZWZuOU9lOE1FU2lHYW9QbWFYalB2bHRnRjJzTzJzWk9QS2NC?=
 =?utf-8?B?QVo1aU1ndmJVMGdCL05VdTVPWGtnZEQ2YWdLU2JPd2pUMTBVUFV1MWkwTTJX?=
 =?utf-8?B?VVd3d1hweExuSUJxT1RqZklYYnZKYjluRUtDSnlMOTg2aWMzclBpa1B0UEV2?=
 =?utf-8?B?dEhsRXlHUC9NMlFDVDlhbmpnVWVLaENRcVljVkErN0pVSURxU2FEOElGMzNX?=
 =?utf-8?B?bXdvVHhnbVhHd09ORjN6U0JobWEzRjdCZVpjQzA3YXU5VTJ1RG5vUmNNTURU?=
 =?utf-8?B?OU9YWjl1WVlYZnVqckd0REExUGdpMmVkMUhMV3FGMDl0UjdldGs2Q2FkeDVq?=
 =?utf-8?B?WHpKcEtWR3lFNitBQnptOXpTQXduVVRjMGJwWm5BQmZNZC9ZeU1SbzQyTHZV?=
 =?utf-8?B?WXZHdUhjZmd4NWhlZERxQ1ZReHZVL1ZBZis3bU85OUFoVmhseVdrMGE5VE5J?=
 =?utf-8?B?dDBiUktYWUE3OU41cnJtWHlnOW0yRVpldDZaWWtvVXVON1dnaGNjbGUrZEN4?=
 =?utf-8?B?aGV0amtaWlVrbzlmclliUm9CWjJOQlp3ZzF0aEtqS2l0ejZYQWtBSVNRMTJq?=
 =?utf-8?B?dU9LcmpQRm1peTBrREUyREo2cTU5ZWRNT2pPSlVtbUFIMnlxNEJ3bG5jT0pr?=
 =?utf-8?B?akltc1BoWjdTQmF6TE5BZlBVOFVrWW9DSVVkQUFFcm5IUDhvZ2JDVEtmelly?=
 =?utf-8?B?eWdYQ0p6WVBLQ2RkdUVPa3lVQ01DeVlmeHVGUGJsOCtoc2M1ZjYvKzhOOWdP?=
 =?utf-8?B?YWd2OGxVeWs4Q0V5YkdDL0VWTVZXMXVnMm5Tb01qdXBhQnBkS3lML2NYVkhw?=
 =?utf-8?B?ZkZFemJiNEo4YVlCajlUQmZkY2JQZStlczhhaXdJS3UvcjVYZ0pqdVlSengy?=
 =?utf-8?B?TmtSbmxqM0tKWGpjZ2M2TEdnQ0pZWmdmbTV1d2NSK2FOM0drZjkrenNLYWNh?=
 =?utf-8?B?bFR1QVdRNUg4a2hWTUk2ZlBKaXhEWm5OaDdBemRmallnUTc3WW5LY0VyR3FI?=
 =?utf-8?B?Vitnd0ZKdC9FZkNCYWVEVlVPN3VXV3d4R0R3ZUZtdmV3SEduYUlCZGVkWmRU?=
 =?utf-8?B?VnB6dEFXQnpqN2I2Ym10V2N0ODlCbG03ZnRwVmU4RlJPNkpISDd1NGNBdHdN?=
 =?utf-8?B?U2tKWkZYeWdHTm0wODkwL3NXSjByYlFuS2wrdklGaUk5aTczcm1JNE1UNUVX?=
 =?utf-8?B?OTl6eXhpUm5PWUp5cUFNOFk3OWF5emNnRStEM1ZPOFMyZUVHNml2ZFNPVWJz?=
 =?utf-8?B?eGJKRHlEZGN1OEtOaEZxSVJITTJuU0FxbVNEZGRFMFh4MUJDZEdaMzltTXVX?=
 =?utf-8?B?ZG1MK1JaWGJpejdtb2c3MEdjR3dIMGhoMUVpaFNDK0hMa2xGRUhuVWMzZ21h?=
 =?utf-8?B?V2lJcnA4V1hiNXlvR2RRV1RUQ2ovKzBod2lpcGFHY0pwbWFjazZ6b0tuQnZD?=
 =?utf-8?Q?hk9T0Y15rTw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1h0Rm9rb0tHTmdHWHZzVlV1UlhuRmY1T2JqYXkzRmkwNVk2MS9MejBiMkFN?=
 =?utf-8?B?UytJd29KTmZjSmYyT1RWL1RrTnVsUWxSTzk4aVJDdnZQZ1lhd1NJT2k5Q3A2?=
 =?utf-8?B?dC9ZQ05DQkljeE9IMzRQaXM5ZWEyeHJERS9BOWFOczFUUldTeWllZ3hiMVVk?=
 =?utf-8?B?TmF2c3V6VUVlQ2lFZS9SM0poQlh1d3YyOW9XUDRnQVQxRHIyT0pDQWRuWnUy?=
 =?utf-8?B?aWxxUmJBVkJjZlB4TzZ2UDg1T2hZSjZ1VHRLUEdQOFBKMENBNTQvcE83QUdi?=
 =?utf-8?B?RGR4bmR3YlJ3bS9uckYwaG9kRGx2d2V3MEpnV1dybUZiKy9Fc0tQaGVGaTlx?=
 =?utf-8?B?ZE04eDBvYmowYjRWWXZSb1AvNk5mY0Z3dGU4dklJZkt5bWFuMDNkYWdWd0lG?=
 =?utf-8?B?Y2JKLzZjbDhvMTBicUsrbkxwK3ZIQTZxZ1dWWE54QXVjT3RMQUZJYnF4RkZl?=
 =?utf-8?B?VWhPZVJSaHB4aEJPR2IxbkhIMTdKenk4aFZ3M3ZwQmxwY20xajNqSEg2ejZJ?=
 =?utf-8?B?YTF6VUFUcURuclRwSHNEMThkUUcwZFJEVHpoLzd3S2xnY1BSVDdKMGNrbmFl?=
 =?utf-8?B?SlZkWUNEV2orUlZleHY1VGRNc2ZBNWJiMExxc1QrandpdmhYVS9XYWlkK0pK?=
 =?utf-8?B?NmJqVnVtUndMaGxzT3ZXaDYxa1NKZlhMN3EvNHJ6ZU5PMDU4QmM1Q0FOeVZz?=
 =?utf-8?B?dnFlWEtjWjZ3a1czcmdOS0ZhYTYvRUxMYWd3NCtRbjlvbXM3RnBwcEorTjBF?=
 =?utf-8?B?MlE2cERnVUJQWGUzcC9jekthZkMyMFc0dVBpbHUwRmZ0MU9oWVBhaCsvK0pX?=
 =?utf-8?B?cjI2TFpTcG9tekl3UUNMV2k0ZmhscnFFSTQ0Zm9qcitsaVdvb0tDOTYxZEF5?=
 =?utf-8?B?cXU1ZitKZzBmVkpzeDJtUFBIMHZUcEp2SllvdW0zenhXSVJ5cklnaGxrYTd6?=
 =?utf-8?B?RG5UV1lkeVpGcjM1dUl3dmxoNFNSU25Yd294cnZQZzc5ZVg1OGwvQWlOSGpH?=
 =?utf-8?B?M0tJTU9SS1VBQ2tQbVhXTlJ6dEJ2dUxOcmFIMXJaRnRmYnBiOUNkK3FQVW1t?=
 =?utf-8?B?bTQ1c0ZPVmp4QSswRHZnbXlWQUV2YXE5R0lSbk43VkVDRjQrOGNDaTZWMWty?=
 =?utf-8?B?cEEyZVU3bVY1UnJGYjFkMjlhejhjU1YxTXRJMFBhbXpzeG41YzcwbExWNEFs?=
 =?utf-8?B?V0Vsa3grbkFaeVF4ZWQ5ejdKUVpCVHJLR0oyZG5qVVAxVy9EczVGV05xVVNX?=
 =?utf-8?B?WmlOLy9SbTVmQzRSOXh0ZUhnUUtBN21RYS9BYmdoTXM3Ky9IRjFpKzlTQTc1?=
 =?utf-8?B?dEJmNVBCQkpTQnZJUVdXMStHeXlSdm54R05yUW1PclBidE43WHN0SlhnaitB?=
 =?utf-8?B?K3N1SVlkd2JpcXJjTkJ2TnB1ZUljU0VXTlQvaVVyaTRiVHJSa1R6dmFwWUtn?=
 =?utf-8?B?M3RGaFp0eFBrdHhISmdsR1k4eXVXckJEZ0U0L1E4RHBTTldiMG4rK3d0MVlF?=
 =?utf-8?B?c3V3ZThVSWR2b2QzYXhiZjludm4vcjRSWElKWFViellFeEV3ZzR2bTE2M0ZZ?=
 =?utf-8?B?LzhDVFpkUXZOMGczMGwxYVRZWGtLSjVpbGZUaHZwRENhc2lUWlI4NXUzZ0pC?=
 =?utf-8?B?aHUvTzRFaXRkY0d4eWp6VmcrMm14OVlGOE15UWNDQWM3cDFSbDJicVk2K3RU?=
 =?utf-8?B?TWVGZVQ3VnkzRi9uT1d2ZVpzS0ZsbDZTZ3EvakxCTWNzR3JiNGRUdVcvWnk3?=
 =?utf-8?B?VWlWR0Y2RUhqazJ0OEt4MHVhcTI4LzQvanNBSmNESDllS0JqWGNzR2NNMkhm?=
 =?utf-8?B?VWU5N0hDelhaWExBbXhFUXAwTVl4dS9MUDcvVjRJZGV2R0tnRGtPeG51YUl6?=
 =?utf-8?B?QXFoQVpaaThkK0JaL3M1UzFIbkltRng0cHkvOHAzcVRibEdFZDJTQksvaW53?=
 =?utf-8?B?ZlVzaDBuR2hhUjFGdmNRaGQ3SThXWVh3L2F5OHFxMHhzWUFveHY2dUNUM3FV?=
 =?utf-8?B?d1NIRGxwR3E1ZjJ2eENFZ202WC84Nml1MW04WmJraUVuUU1abmlOZXRwc09t?=
 =?utf-8?B?ckRMWGFhOHd5ZU1La2lSNjNPaFhuZnMrdm9QcWlGMGg4ZlNGS1BXeXhzbzh4?=
 =?utf-8?Q?irVc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e07088-93ba-48cd-83b8-08dda82b2726
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:29:05.2882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEdRe2DCmeIJjehFLMLhZ+488wAalZHQzUU/dcWlsn074jV5X10FbOYEzGJfnHTg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9390



On 10/06/2025 16:22, Stewart Hildebrand wrote:
> In file included from ./include/xen/pci.h:72,
>                  from drivers/pci/pci.c:8:
> ./arch/arm/include/asm/pci.h:131:50: error: ‘struct rangeset’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>   131 | static inline int pci_sanitize_bar_memory(struct rangeset *r)
>       |                                                  ^~~~~~~~
> cc1: all warnings being treated as errors
> 
> Fixes: 4acab25a9300 ("x86/vpci: fix handling of BAR overlaps with non-hole regions")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


