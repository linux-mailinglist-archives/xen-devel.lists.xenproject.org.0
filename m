Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAF47496C6
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 09:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559695.874938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJk0-0000qc-VE; Thu, 06 Jul 2023 07:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559695.874938; Thu, 06 Jul 2023 07:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJk0-0000oL-SE; Thu, 06 Jul 2023 07:49:28 +0000
Received: by outflank-mailman (input) for mailman id 559695;
 Thu, 06 Jul 2023 07:49:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHJjz-0000oF-TE
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 07:49:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0d4e343-1bd1-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 09:49:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7761.eurprd04.prod.outlook.com (2603:10a6:20b:248::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:48:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 07:48:56 +0000
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
X-Inumbo-ID: a0d4e343-1bd1-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kb1VehfciubqLxxr5UXSKQiDCDKd1N6+vS2KBo9EdRrKFkLM/yb9TuOJ/EgaGjRUoa1HyNWEymKc/ItnNkfQlOCAX/Vmkura7x080btmSb7QCPA3KX8VvT6tUEIs7YyHsuC0gQEcd/WIu5Ahl/0NXrvAkWwbuNCWdzavOYZka+zJsASrSeIfqVci3RGaGFMSCvBbBe7odsglOeg+DJIL5aGzkT7lZXna79doxSdxby5Dk7i9EY3aqL1Z4qFhuV8kYqccKCcn9Tr4+YaALF2R9shsnzAdpvoR64v6P6Qks9i9oHBCj3OFDWMM+n4pSCLuWiuGsHgynF2zw5y5D0Y/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5G9+VngUfCmzdWJ5fpaE2QOiiNZvSwpvjPVIrTbYIw=;
 b=WEYgepiMU+e9FVF8cIuSYnuag/kJvIRBn5fqRX034aacyv+H2VmZ4Rdf33t9VHlspF1M6/TDlpIVm+0bPsGO9LlnU7K6k5AEcOPL/jJmBtT9Ba0rsCmRxMbXxPWq7x8CSvA3jDgesfNEbmsArhh9kOQpLaitXbzptMuLF/ElIpvCR63vyNLNTYl9eMXI5csb/Qp/pyIYi/Tcg1MNMehlZXoBvibcOOaAKv62WTHBtjjLA8c5NkgM6wy4eCj/5u2XI6l3dj2dOisHaob8UrVyuoHPxA8MJYiOyoi0fJTWjBOLtNuqm9FHaTxDx3TOtPHyjR7MFRev2XyAd1/wZmmx/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5G9+VngUfCmzdWJ5fpaE2QOiiNZvSwpvjPVIrTbYIw=;
 b=a3vWlo6t2+tegGbMd6wc/T++c3OFfwmkqvLjbtv1Nn355DEN06wVs/9abwZ9NiXWAyxaA1T7egte2a0rTeHoZC8YfMUzoiRwuYXqE2g4++DIx4UMgFm0eCfVbVcWo5G2oLXQiI9oNjlYOpXUPZELtsP+WN5jZzRZAHwP75XYl6nu5lveI9K9rF5UG8dzyJYFN+K+Ov/HXjeqMCzIkn+takJP9ASGB/ZM5s5iwxZSIvuz1X/Fw3ZhZtwGJJ2DiCUa4MwreClMIJFPilKb5jNfIal3tz0ZmCEybpVDWfbEvWunWVndlW/wv7NIMhN4bDKLYFFnm6a84M7/IzaZtvf7Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2cb36ff-8908-662d-1bc5-6ee0659c7904@suse.com>
Date: Thu, 6 Jul 2023 09:48:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 02/13] AMD/IOMMU: fix violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <89ec1b24e6da5738c00155f6f142cb99385fb838.1688559115.git.gianluca.luparini@bugseng.com>
 <alpine.DEB.2.22.394.2307051630480.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307051630480.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 002533f0-8144-409c-4ca8-08db7df5739a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r4ZuU2YjbSAiNsxA8V4oNhnHdssjqa0ShMkJNiyWtTi7ZoU8cWJcBUVanKKkPmcv1kVFAJ9a0LlludEgZuZFIKv0MyP2IMk8caffSZ5MZgmNB0qsQ355QIqXPFbB9bJtaUOz05Tw5Z343rV3gJuAr1dplmj1BdnMHoeZwgbz/Yj5/nUEqd0pioiOthzCdruqTTbKmEWhFSVHWICVVEWrV3+5zkyKVmwRm8LoGWgX/gNnPnhvyrtU4FKjDp2+zJf72CdZIdw0AtdPAovFkN/NecBbTB43QIl3bP+MDSxeiqwut1s8oRaqwPOElZ8cjR29wIFSdnlHpNLcxbaiAiB0q48+RWH3F71ltm4vmnMxGFTLXVrOMjFOqz19rznsfjmOUHcs92/xR6QjVVWbo4VNO8n4Tzy9x/UOTQQ1BQ94BrpBU2pRJ1ImjxPiDqpjxlfk4da8cUxoRDH7yC+WEg0e25joNxoIG01ONobt/juKE8B4H91dGu5DL26XfxnLewxxRiZGgr+oo3j+X8Cr8OohhE1Vlj6WLD2KNj/p00A6/+gXk5X8igztIBSFnSod+hTt/wYyrGbfyqInbOwxbbDENZ90rjdNgjAuePzCoUEwiMSioDYRl1+c+ARqkfoqkVMLwOxEkCzTpKdCXF1IjkfqMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199021)(31686004)(54906003)(41300700001)(6486002)(8676002)(8936002)(2906002)(316002)(5660300002)(66476007)(66946007)(6916009)(4326008)(66556008)(36756003)(6512007)(86362001)(38100700002)(31696002)(186003)(478600001)(2616005)(26005)(83380400001)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUIxVEhpNS84eGxsRzJEUWZxQUJCYitZbFlZdFZKdEpva3hiampPVjI2RWZW?=
 =?utf-8?B?czk2enNhS0lvdWhta2YwY3BpZlVYdlkyYjloajRxeWRoNitpa0pjeVN1S2Z4?=
 =?utf-8?B?elYzcExMM2dOb2tFLzhvWW5GZWJTbllzSUtkSmtUU2JkeDY2TjdNa09FbkZP?=
 =?utf-8?B?MVg4VklXMXdqSTdjb3dxZjhsQVBsS1NGZ09PejVaSjN6aVQzVUVocndpVHli?=
 =?utf-8?B?VEs2Q0V1ck1LL040L2hLN3dHRGdxendUcjNNdjRhSVduK3FqNnp2UThBTmhZ?=
 =?utf-8?B?dXM0dHljejRaeVJrOUdQeVhtbHV3MVRTUk55VXFyWE03QmFuNDFwMjNRVzlQ?=
 =?utf-8?B?VWFLaVlTTnJoeSt2N0U0Y3QvZGJoL0lnS2hhd1E2UERXL3phV2VUc3dMV1Y4?=
 =?utf-8?B?ZVpNYXpHYU9zZjA5ZDFHRkkxRVkxT2RMaFMybG5pZGtpcWUvb2JYTTZiUDZr?=
 =?utf-8?B?WGxFVWc3MGZDeEVPNkd2cDJsL2ViODF3UWYybzFocXlnUTIvZDNHQlBDVWY4?=
 =?utf-8?B?VE5KMFduNlRXUEVTR3VSZEZxaTgwQTF3dC9TdE9KdWZISkxTd0pHUkNWSnRQ?=
 =?utf-8?B?dFk0OExGVmFsT1lwaTNEWjRYTmsrRjlKNGIzUWx6Y25lTjhOQnNQVlVtTnNN?=
 =?utf-8?B?SXdSUnh0MDNVTWt5dnBjU29TWXJOSXNsYmtLUXFFQUlwWnhmZkZrMVIvdkt5?=
 =?utf-8?B?YWlTM0tLOUJBdU5XZHc5VW11MFpiNk5PMWFXbkRmUnpuMDFsd0JzNjRtOEhz?=
 =?utf-8?B?ZGV3OUJ5dDdzVjB0VmlhMXFvRHozOTd0TmVtMHZhNGVENzZPMFY5U0c2NlVv?=
 =?utf-8?B?c3psTnhmaDFXak5nZ0NiUUU5T0lhU3hSZlp4cFN1UW1hM0hKY2VRV2F3WGVC?=
 =?utf-8?B?MzljY3JrMVhyNGVkSlYrejlkdWFrOVJONDJFbnFXV2Zwd1RzN29LeU5FeEQw?=
 =?utf-8?B?cTFab2ZFMnJUVEoxRVcxdEI5UnRpdGg3eCsrRWlTRURiWnNsaXZXTUNMOUJK?=
 =?utf-8?B?anFYWkp4S3MxZklFUjRNSUZ6RVBUdkZrOUJFTFRmd0d5ZXJ3TEJ4bldEODhQ?=
 =?utf-8?B?TE1JVkliZytRMnM3aytYWS9jMVl0UjgyMnQ5NHlISVM4bkYxaWhPTXprdkJm?=
 =?utf-8?B?OW1TV1hmN2N0VDNHK2NlZGlmMTZIdTdGSER1YmlIL1NJcGd1TWliaEF4NWZi?=
 =?utf-8?B?UjJGaFNoVjdOZGxoLzc5c0s2b2VDeGEzbTRHTVJLUlZreTI2aDVFZkZjVmJJ?=
 =?utf-8?B?aGptVnFwZFZXNGNRdnBGY1NxMmpaUjIvUWRYdlg3bnI3cytMY1ZjL0VVb3Ez?=
 =?utf-8?B?MERITy93eHo0eE9HTjZtUHptRkhDZU1rNHJSUkYyS05SOE1kdEdTRTFwYzZI?=
 =?utf-8?B?WUNheiswTmIxbzZOVzJjcjJ2b0QyajVjY1YrZkZiQWZHckNhdjVBL3ErWXFZ?=
 =?utf-8?B?Q296RkIwNnZBcFZhNCt3YjZVbVk3UXl0TTg3QWxQZGFLS0pLNFNhdGZYTGdW?=
 =?utf-8?B?ZXdVZkVDZTU2VzQ5MmdXV0kyYXpxY01WOHBPTzJhQlRTNDJyU3BzczEvSXhX?=
 =?utf-8?B?VjZxY2NQZTZWZlFsb3QyektDUUZWL0kzWm9MMzlPYUxRNUxaa0tPMHJaRWIz?=
 =?utf-8?B?OFJ6OHhQNFcycHNnUDR4RTRvMDhqZFlUWnRNdzFCRDVFNzNWRnFibUl4eERr?=
 =?utf-8?B?MXlmK3J2emVGWEFIaDRGOVF1NjBhSUMxYmErVm85clBLaWQ0bUMyNDE1bTRQ?=
 =?utf-8?B?eGl3Y0hlT3E3Mmg5ckIyd1Fxa21IbkxMbkdUS3hUQzY1QjJ5QW9RYTh5Ylpa?=
 =?utf-8?B?d0RiS0U4aEt4UDNZaVVhbnFQY3FmdE12QTJucE1teWlNbTdsck1EUWtHQkQ0?=
 =?utf-8?B?WVM1amRKYWdvMHJrZEtFTXRZaFphbVRFTEg2cmZDVHZwSmVkQVRINjV6cmZW?=
 =?utf-8?B?WWpYYk5UZGkzeVJ3VkVjRm40VzRLa0NVS1RhMFpPZzlLdW9USXlyVGNsMHB2?=
 =?utf-8?B?bVFxREpmV292UWwrUmRJQ2x2VjFoa296OVZ2YjY1OHdXQ3pGajFKa1hxY0Vq?=
 =?utf-8?B?SFFMZjlEcENsbGZqelZtczlITHFaU1ZxOUhIaExMVEd5UmVQZkRYRzI3eHNF?=
 =?utf-8?Q?WQ6XLnQeoJyvtI3UIlfyPkSXp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002533f0-8144-409c-4ca8-08db7df5739a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:48:56.3987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bH6ZYuYCuJleRtxx+ugjsP5j+9CSr8Rdd7j1wulFIh6T28PU4dzhiGuegC9s0F+AEuJU/Inw8ZJ+4ZtjWZFEEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7761

On 06.07.2023 01:31, Stefano Stabellini wrote:
> On Wed, 5 Jul 2023, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
>> headline states:
>> "A 'u' or 'U' suffix shall be applied to all integer constants
>> that are represented in an unsigned type".
>>
>> Add the 'U' suffix to integers literals with unsigned type and also to other
>> literals used in the same contexts or near violations, when their positive
>> nature is immediately clear. The latter changes are done for the sake of
>> uniformity.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I reviewed this again and I also the tag should be Reviewed-by (sorry it
> was my mistake last time):
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



