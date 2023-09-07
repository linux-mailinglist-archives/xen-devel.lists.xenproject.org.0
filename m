Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFBC797063
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 08:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597132.931323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe8wm-0007PM-DH; Thu, 07 Sep 2023 06:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597132.931323; Thu, 07 Sep 2023 06:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe8wm-0007Mj-AB; Thu, 07 Sep 2023 06:57:00 +0000
Received: by outflank-mailman (input) for mailman id 597132;
 Thu, 07 Sep 2023 06:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qe8wl-0007Md-EB
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 06:56:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbeea73a-4d4b-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 08:56:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8342.eurprd04.prod.outlook.com (2603:10a6:20b:3fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 06:56:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 06:56:54 +0000
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
X-Inumbo-ID: bbeea73a-4d4b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOEPWhjQM1eNtT04SnnngasHPYjrS4uc4+T2Y+USZaTmWcqAXZUeMXC6tYoJ5aKxheyuoZzM99gIPAS5dc3LoI4+1J7ZqDG2Ir+3zAn1gnVIEwiyYqRb6SzddnnX3JByui7P/OELZIzH5exIUTRORUCB2vM4FnNwhec8TXn59DtSDW9Q9ENkp/VDKLPnxWzRDPBh8+10vVJwuLBHDNbUWnYNfOFHQ0EQfefTfCtcb3MZi1eEClCQL3tvXB/rT7YHzLOJNrEcFRqV3/r8kIifXugNs040BDDPyczDSw6bK5Ft2Hten4/x9OxcqNmbBA9zJQrHN+7BWiDTRZ3P9ntedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qv6cSUSPZ9StgdZUCKrluD/eWwHhFeXh/iN8Dpq7HLk=;
 b=J/xMn5MqLm9/JwKU8Z++IXYZCNntTd5vThdDnWhxdgMPfUbBQsD9wAAnP2B2LD2IF2AcNhmGvWLPgsTQUQE7Xb4vU9mYNGFrn6XrhliV82LSBEwZPQsSG6o7dAWYo+uyak5BZCoKRHwI4XVTYHiGmJqwL/7otDY6gSbVmIol1EgHTHqak3iChvoHgJ8ihibZfiG4hNV9f2Afjq5cC9mJMIS+ssT5GgMShLHijAtmbqcs9D2jUNQrG9vGqbG5+Hx7MszaYxWFuB4gIGEVKQm+982DNO70sQWTaxW0x2qU3mDlgInQMBvl+vOpOc+ieXnf+9C+54aDs1t1L+qx0l+HgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qv6cSUSPZ9StgdZUCKrluD/eWwHhFeXh/iN8Dpq7HLk=;
 b=QL55b/siInmmY2y058Xf5abjE/iw8xSjmeaDe4mtGJLLroOutw+nlElIVFuvVoi9vC+/a4JDVDZ5atK6spaXLlgVxQscre+zMY9w63AVI+iZb3HFkMEtWHtsrTeTSCvwQApJ+Rt3+QZKIXo0qJBpcurz9ayOv4xD0EvQrPfTuMZ3D5xSl6fBbZY1FoH1bHS7Q4lethDEaVZDi494N+t1MaSwmH0ple9IK2HtsopMtKIsGkTaTY22mSkKfI/+/Ls+qGtoFvZZcITTL5dl5UPYQF70+fc+6lily0DWzVAfsdJXlNDhI5X4aZgjfy8cdKJ7KkXmUIQTEK37xEA36PUSqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d5c9ae9c-af78-05a7-52ca-7ae487c0d2bd@suse.com>
Date: Thu, 7 Sep 2023 08:56:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: Xens handling of MCE
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>, Development <D@dlsemc.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <521ab5aef01a4c64bef65435e7c284bd@dlsemc.com>
 <ZPjxOTRipQ6sEqF5@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZPjxOTRipQ6sEqF5@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: eb88f725-0d13-4927-5b27-08dbaf6f9ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8fYKVZQQTbY4jaBq9W81nyQ8hqfisJRBOQ4Ip+TfHzSlKibS5OU/7Bb5ETdluE7xucA4vx2N9Zmz3LgKCv4yBL/RXcBJnHsN3tNm84K0IM9S64oErlgimsJkvEKIDwQZrRm4yuPcQ0xgL4E9pZ6sZiRQnAnYk1/d7T3QlswusmJsNQaDV1k1ZV/R8FtQ+nciW04+UgMMxUcB6Q7SYFDePl1ghfaSHBm025uK9+NkutxWJTA7EuC0PA18QQJmiBd7odVPZHn7088rly0TErjEpMFM3+4CO1QM3sKu6y+n1VQ5iFpFKkC8PlYnamoKayTka0xqnRpn++xPvKN8vkNjtGm7S+R0JQJu5ZbACpuAOnZJwdzOrf10gdopZOXGcgpO3yrRyNrmPylWWucymsdquc6A1YcycVNKWfuLVZPNHxbK1xJlGqW0EKex7VrP3kvDq2KHkWQUonnFpGDqIIHtXcC0HMfHbsvR+f+Eei3J2vb4aA1cm+TGr3sluLCjPsuJBlx7ePZd+pFJoiYV/qgwWbVGSBNWZBnKvD449PC1xmNFdxQps2+SXT0Nu+6W7ykIKRV1zy8MecHV9anR9XM8QRbVfRwX6IzgkAWXhnHiETY/0BxNJcy3g1oQ4KgT3JpLrxZ3vikIBOgXwXwmbRO+Z8V/s0SdrTe0BGKtQM88heM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(396003)(346002)(1800799009)(186009)(451199024)(2906002)(66899024)(83380400001)(3480700007)(6506007)(6486002)(110136005)(316002)(66556008)(66946007)(53546011)(5660300002)(966005)(66476007)(26005)(478600001)(4326008)(6512007)(8676002)(6666004)(8936002)(41300700001)(2616005)(36756003)(31696002)(38100700002)(86362001)(31686004)(781001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlRVVVQ2VVByUVI5cHBCalpMaTRRTHFjZjVZK09rQXZvVTFUSEM3L0V5VDJq?=
 =?utf-8?B?SkFRQWRHZmRtbURUT0Q2M2FzUnFpYmJXUk1KakZXYURLV0JoUlNFWjBHWTJ2?=
 =?utf-8?B?dHZiSG9JRHZBMXpzQXdpQVVNbXZyakRGZGhkd2dLT1U2dlBWMWQxdHVvVU9p?=
 =?utf-8?B?ZDdoUUtZTXo2OXdNSk1FaTlVK1o1K0NTbHZ0QXpRWUpobXZsaFVNUFBIQUhr?=
 =?utf-8?B?VWRqbXJyMUJ4d3g4eCszL1pMWVBGYzM2czdCMzRZMDJ4dUhIYW1WMmRwb0Jz?=
 =?utf-8?B?U2NhRmNGakxaNnMzRVhkWXFiMm5OZTJCTHpaSjQwcUx3amQ4c0JTYk9aL0Ez?=
 =?utf-8?B?U055R0wrRTArM3cyZHJGdUxuREJBN2ZBQTBMRGMxQkh5K3ZWaXQvL1pic3Ri?=
 =?utf-8?B?VksyUWFjcldydzJ3M0ZnRDVXOXhEWm00V3BGOTgrVno5RzJYL203d0Ixak14?=
 =?utf-8?B?NVdPbFBnNjdXbk80c2pwaTBaLzBydnZlWmViSU1wK0NPUXRGY01malVWTlY0?=
 =?utf-8?B?VUFTSlk2akFGVFA2TTNGRWFoZ1lhODk3dE5UWG1XSkRaZXp3WmZ1QUNhQ3ha?=
 =?utf-8?B?b3h6cURSeHc0U2ZIdmpkVmFOR2RXQmhrY0dRWlNoa01KZThRZmxuZUs1ZXpo?=
 =?utf-8?B?VkwvcG9qTFVBWjlXOTNyeG5sOXhpRURlSmhqNFpHN0JiY3I1WkZUMWswWmdo?=
 =?utf-8?B?ZzdUUDdIdmFOOWxFUWFBbURFaXFoZHM0anR2NFduekZsRnhER0UxcUNiT0VD?=
 =?utf-8?B?MFg1YkozK3lwTVlpb2RvMVB6dzR1cHNBNG1YdGNtLy9BY2tQSzdTd1ZBbmxa?=
 =?utf-8?B?ejlOSFlHVkdacXJkTjZqRGEzcFd6cS9BVjdhZzNrVFdaNHFGQUFDTFZIUWFY?=
 =?utf-8?B?UWZ5NGRpdEdBRWVvbWhpUWUwRCtMbU1zZ2Nudk5teGVCZzZoMkxjQ1B3cUpS?=
 =?utf-8?B?aHE1dWVuSnJJcUt5V00zK0NNcHBWN1lKMU9icURwd1FHbHp1TkdiRCttbDlQ?=
 =?utf-8?B?U08yVlRXaWljVUppOVRkUU95S2ZuZHlZaGUwaFl4VDhjRzRKLzlTOUNmMHZJ?=
 =?utf-8?B?SjU2bnRzWWNLVmU4NGJyQlRmZXdBQ1BFRk5sU3VybEI4ZGY2OWlTOWIwTEFw?=
 =?utf-8?B?WG03ZHZsY1dBdEtqWEQ1L2gzeGNrQ2puL0xjMzQ3cW50Zmo2SGtaeUdOQmNv?=
 =?utf-8?B?N3gwenFzK1FwNzY5bUg3bmJDT0doWFY3Y0RvcXJzay8vbCt6d2E4QURxRTIy?=
 =?utf-8?B?ZVgrcStWaytRclgvZjdqdXRpZEVjcmF4K1RMRkdLVXh1SkJvWlRIaGJxdG04?=
 =?utf-8?B?eEhqSmtzS0o0d3dBRjdYN25xaGY2dEVNUElSdTFIdmhkTERPY2lpUVA2V1pD?=
 =?utf-8?B?RDI4TE9YR1lvNnZremtKVzQ4MFNvU2NNUWFoZExjMGtpbml1bys4cjhHVEw2?=
 =?utf-8?B?c0ZiTEd5N09Vb01pNkUxWjM3NmpveVJGT1lMeG9UK0duUHlWQmMvZndmMzFn?=
 =?utf-8?B?TlN2Qks2ejU3MjU1Mi9rc2IwVW1hMm12eDd5enRZY2d2MlIvN0dNTyswcTBs?=
 =?utf-8?B?U09DSEZCZThnVTlPMFhSakNWM09XZU1OdmcxWU1Ebzg4SVhYK0FqQUt2WUMy?=
 =?utf-8?B?czNPamVFTlZucVBxVm8rM0Mra244QjYzZEJUdVVJMm9EcWlFUDBMWEhKdEdQ?=
 =?utf-8?B?OGZmK3VBVTFJRXlsM2JsT3E2R1BtbEpEV3ExM2FGVkpXME16STV3T1lqYkZ3?=
 =?utf-8?B?eWpLajA1TTV4Vjcvd3loMDZkdDkreElCamY1UXhyUTlNT2tocE5HeUpybERi?=
 =?utf-8?B?THJraXo5YVpaVGhpMVZlTDZwTUZGcXU3eEtJRFNhdXdnaHJNSURyZTM2VStN?=
 =?utf-8?B?bEJyNnFMK0NUSUo0bUprSk4rWDIzTm9IV3QzS0lGK0YzK2JtWi9uaUhPQTA3?=
 =?utf-8?B?UWRrWWt1SG1PaTBjN1E1bXRXQmhMSmdHY3N4cUJna2lQazN2dGRZeTJGQml2?=
 =?utf-8?B?dTBkbTAvQmFkN3NOU1dteGFlT0ltK3FMVmpvekNuYVJzRS9KMnFvR0JVNUZK?=
 =?utf-8?B?UUE0ckNnNzRGYXQ0MEsvQTJReVlCbzltUjdsYi9KUC9CNWc1dzh3R1c3dUFh?=
 =?utf-8?Q?qjJcwF1HwhlUgHJ4YUUpCMYQu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb88f725-0d13-4927-5b27-08dbaf6f9ecc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 06:56:54.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T44FKi/0i3b2LdsI58cP0q9Zwax7zGJVyQHNmPxqORXugTnPV8gAULLRSsNJob1I29Kq3N4mrtSEITPcDPZ8vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8342

On 06.09.2023 23:38, Elliott Mitchell wrote:
> On Thu, Aug 31, 2023 at 07:52:05PM +0000, Development wrote:
>>
>>     However, in 2009-02, "cegger" wrote MCA/MCE_in_Xen, a proposal for having xen start checking the information
>>     Xen started accessing the EDAC information (now called "MCE") at some point after that, which blocks the linux kernel in dom0 from accessing it.
>>     (I also found what appears to be related sides from a presentation from 2012 at: https://lkml.iu.edu/hypermail/linux/kernel/1206.3/01304/xen_vMCE_design_%28v0_2%29.pdf )
>>
> 
> I hadn't seen that before.  Clearly shows someone who had no idea what
> they were doing designed it.  The author was thinking "virtualize 
> everything!", whereas MCE is a perfect situation for paravirtualization.
> Let Dom0 process MCE events (which allows use of Linux's more up to date
> MCE drivers), then let Dom0 notify Xen if action is needed (a page was
> corrupted, tell the effected domain).
> 
> There was a recent proposal to simply import Linux's rather more recent
> MCE/EDAC source.  This hasn't happened yet.  For people using Xen this
> has been a very concerning issue for some time.

I'm unaware of such a proposal; do you have a reference? EDAC drivers
typically are vendor- or even chipset-specific aiui. At least the latter
wouldn't make them a good fit to import into Xen. Along of what you say
earlier, they instead want to become Xen-aware (to deal with address
translation as necessary). That'll also have better chances of things
staying up-to-date.

Jan

