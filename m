Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B617411690
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 16:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190947.340783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSK4U-0003gX-06; Mon, 20 Sep 2021 14:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190947.340783; Mon, 20 Sep 2021 14:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSK4T-0003ek-T8; Mon, 20 Sep 2021 14:15:01 +0000
Received: by outflank-mailman (input) for mailman id 190947;
 Mon, 20 Sep 2021 14:15:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSK4S-0003ec-Py
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 14:15:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28b56783-5816-42d6-aee8-f5201fb81db9;
 Mon, 20 Sep 2021 14:14:59 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-MC_0zQUzPwCCcnLEdLJ6Lw-1; Mon, 20 Sep 2021 16:14:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 14:14:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 14:14:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0080.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Mon, 20 Sep 2021 14:14:55 +0000
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
X-Inumbo-ID: 28b56783-5816-42d6-aee8-f5201fb81db9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632147299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ioWPBDicJ37FWygQgxAY5/QbpM1cnDtK6Z5h+U06auQ=;
	b=U3MwM7r4nFbN6nV7nVc/2v/WZIgR3OatDxrr8EO+HiYLmM8PFsEJ9fSpeideuaqekNS+O1
	ulb5COk5yYAW74oQSXOO3M8eN4qrsFS7cWbC1BVPUIozOQRHdj2MCDI8RZZaLZJ2Q8Ceml
	AD214f3cXIWshvQNf9RBruzldz8kM2g=
X-MC-Unique: MC_0zQUzPwCCcnLEdLJ6Lw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+a/EVF2YFny8aXVsGpSh//2c56fFI52hSqHNRYkbvMojcm5o1Zx313gvllI4XG0O9HiRNx0trJFftCJgvO+rExnZ/7niGuvNluedEGhW/8lVjbyb9DOEPLJu8hRVkGBxIxX8w7MPVF7Me0G3aCvPzdhr2Z9u8X7CpUrqpdWLIrjgbTqQ/FMpFROoFjQYvdSSwccuo/krsvqlmLhu3/Nb6/DKyzICNmSFvGbkK85g5F4yGIrw/45pCn0MUsyBHcVA8qaZO5NNkUp5LJ/nQgMAax1T6upCszTrx4AxDNAoEUOr+p40YZWTii+pjrY3wR6g2G5gYUkMiZfX7iSK6Bq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ioWPBDicJ37FWygQgxAY5/QbpM1cnDtK6Z5h+U06auQ=;
 b=avrHeVRTIFa3IqHU5qPmuwrfaM3FQqdJ+9Z7FTPHzar1x8bX5+n6rGpGKoPKop8WNZ7rW4DGgBBagbLOPK8g6ritY8glb706mi3e8ukls7yZismuZ1u33hP/yKwt10klDFJvHGZZWBOL1NtjoYmmuK8yWz/D5p/uEliTf9hXxYoavYmfkQ3sLR8SgyTrttnuOEjLktTL552rQSiOtGVan8WWt0Y9R4aLAYybzdvSRAE8FBlaCSkBHzHgv/uxkjkMr7NRHo9ZZCfjs3keQo/WcjPBeyhsPDxA8pCe7/IhfSCGH2RF2gwjeEgfffHG+ECizkcewUoHyF6fSOavkpR0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] x86/mem_sharing: don't lock parent during fork reset
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <8fa3c3e10446f99b75e3d4aef10624cfa2fdf72c.1632145015.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <342dd9a2-88b3-34d5-d2ee-b288f8d81f5e@suse.com>
Date: Mon, 20 Sep 2021 16:14:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <8fa3c3e10446f99b75e3d4aef10624cfa2fdf72c.1632145015.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0080.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f941d8fc-c0d9-4d0c-91ca-08d97c4105d2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5599B788FD5CFF01397521A0B3A09@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xHfguBfiBHBBW+k2VVQ4daTMP7Wpap5H5dJwlcaq0BzS4laEiu+99Lw1OPEs7Oglmak1kOJXOOb3zTFWV7x9FDKqkqfq6PjjXU9Gx1/RMZ33zi2EelN1bp7FkXRFll8qS/FWsVfdyKbBTExkyfOkrZDalvmcP6BoMc65i5BD9Y0spgRnwv/UcZ0qMKT5Urq9ldzOoU85RmuhivcyNkSa92+f40wNWG19kYCqez7Ok56XLLTfYjxgvJeXZH9tnROXpI7m5BPsIxXe8omemZl5V768PVBT/RlyBFduTFtYNnrlfRMAwQRa7tPuQKADsShiJ4JTKYB2JWxpYviCYJzs4SMl+ZftqustiSrswAfCOrZBi/vgcpLHk0gQ912UAdWf807dZdOHt7/4/D4msuPp9JWGgwLTHxrk3Ugo4btSFuNwmOxw16Q5DVZPThwNWujQd87C5izvE32r9fALBhLXmMPUYfx1lCj6AzBl3OePUiTknLif8C12kLw41ZmBmLw0aGF5/t8qJ6prtnuNXR81gdTypbnO2CgZ/g1V0Hqpq4XjRQ2iZG/DvEbHZ5KybFrbsmaEYvvG2G9xlARrwKJLJPc29+IaCSHPr8tlf+pd/V+JBiGVgTCbGdVjyNG+1Gz8lbulv3wMyFZ85uqoOu8JaupZnRL7wV2n1FPCPeSt2NOok0s1+XrkchboryzfSg4Y6rFO/sjMd4i/NJT8xL168T3C+uwiAwoTcmTUemt8ti4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(54906003)(8676002)(66946007)(316002)(16576012)(83380400001)(508600001)(956004)(2616005)(6916009)(66556008)(186003)(53546011)(8936002)(38100700002)(86362001)(31686004)(31696002)(2906002)(5660300002)(26005)(6486002)(36756003)(66476007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2JCNE05UkVIWDBiUEFlMEs2djZ0YUEveE1FRXpqcW1XYU1iN0ZRbllCZDRC?=
 =?utf-8?B?dGxTOUNwZU9iemVSY1pJSTh5d1JheVBVWTJxbXhOemU4VzRub25kSG0vK2h2?=
 =?utf-8?B?NDR0Q2M3MTRSa0xFWTlaR1cvaXE2RHQrY0Z2b2JPc2x0ZlNIeGNHa0pIalNi?=
 =?utf-8?B?eVczcVl2Z0FGRVpVYmttck9KL1lXMDhNQ2V6V05iZmJGcDlzUUxodE93OHhx?=
 =?utf-8?B?ekhWc3NvQmNQK2E5T3V1elM2ajd4SUJRN2dpTEZydTZ5TTlJWVRRMThYa2VE?=
 =?utf-8?B?ZmZVUFh2WGxJa3pZZU5lSW1tTjg5SWVhVWNsd2lsL1hrWUdCTWJQQ0pCOTMv?=
 =?utf-8?B?ZGQvVHAvc01SVkVVSGlFck1UcG4rdXc1MHFuSmVBZlNCdFdiSG1mYythS0Rx?=
 =?utf-8?B?RmRFTjdRNnNpWUZITEk5S3h3QXlldGxPcHl4TmpKbGxyQlBTTkFaVVVnKzVO?=
 =?utf-8?B?dEhtNUlJR0Z4UTRGUVBvSFJ6VWpJZ3pRcVJIRVlZNnlLaE9EL3BPUm04SlNv?=
 =?utf-8?B?eGwzZTJSTERVK3VZUENMRWhISWlESTcvdkR6NVdsQ0hESFozcGk0eHc2MENh?=
 =?utf-8?B?QjQrVktMWmh3NG5IWW9xekRtUmdJcldubjRGTUlYbGdjM3MyZUU0UE9LT3hC?=
 =?utf-8?B?dFFUQXk2SGNzOVc4U0pNNVpMYk1KRmx0WkFDTHR0Q1J6TEpmYkN3cDV1RGNp?=
 =?utf-8?B?M1UzT1psNGs5K3FoQVZjYjJEdTZQTHRlV3djYmozbnR2L1lRQVlxbk5aa29s?=
 =?utf-8?B?MFVyK0pXL0M2WE9yRngyUkdxWG5PdTFiYmRnSVZXaVBicjVIaEdUTkVOcGZn?=
 =?utf-8?B?VDVHSmV1Z2EzR1lXVE4ycFZaYWJNeTVjVCs5bDhtbFRva2VYZDhhcjRZNzN2?=
 =?utf-8?B?SWpnd2paQ1ZHcW0yMUY4aXJMUmpLUDQzdFRPS2xlQ2M0R3NwMG1LYmZzdnBC?=
 =?utf-8?B?bElzaHp2c2tVSDF0YUVCb2xOcHdMN3lMY09Wa2hWSlNWQURPeFdhdDJiNk40?=
 =?utf-8?B?NlBCaEcwSTQ5cytpeUtvV1dqL1pYZjduWityQlQ5OGlxNWsvR0ZvSmpXbFha?=
 =?utf-8?B?WkxSb0Rva0ozU1NtL0w1cEFsUkhrcm5tcG1yNlpXK1ZhMlgyS1czc21mdm56?=
 =?utf-8?B?TkNmOFFBMkZ1VkRYd251STBoTHRhTHN1WkV5OWNGSHNyTUhDYzl6NjNZc3kx?=
 =?utf-8?B?L2EvYjloNnlWR21hVWxoUUZmUmhxOVNYM2Q1YXlKa1pLZndZeW0wNnZtbnBV?=
 =?utf-8?B?Tk9vbm9jRTRIaXFEV3NUY3Zqa0RKbVhNRWczV0gwSXpaM1NFMXNVazhmeVRJ?=
 =?utf-8?B?amZBbW14alFWa2lJbUlLOG5lMDJ4OEl4ajdXTUwzSFp2WUYvTkJQclN4SzZL?=
 =?utf-8?B?ckw0ejFsamVZWUF4NFlvTlJDbUVWa3ZobHNXVndnYXMyMEFFdEZ2VmpLR2or?=
 =?utf-8?B?QUhVdVRtTXpzaU9DVjVPd3dKZzFvbzlsdzd5UlAvSkFMUXI2UHZQRm9iYnVC?=
 =?utf-8?B?c3lHdkk2OXplRmNldTRxUG8rcEUvcnFpSDA2bDFNOW9RZ0FNSHY0Q3ZFS0I3?=
 =?utf-8?B?V2IyQ3lrVDd4a28xQWRiMlNIWGdIRFdKODgwL3NyZUZOWGljUmhnaDdHUVNO?=
 =?utf-8?B?a0VIWXNON2VTWVlXZHlRelppNVBGYXp1ZC8rTjZYaTBaZ3UrVXF0c2laOTBn?=
 =?utf-8?B?aXRxWjRQQ1laWTNpSTFRdVZrMldiRkxuWGNBcThtQ3lyQVp1d1FBSUZoVjAv?=
 =?utf-8?Q?xL3C7NgaZODIKUe7K8eLhzogJvoNymGGVx6XEM0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f941d8fc-c0d9-4d0c-91ca-08d97c4105d2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 14:14:56.3199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8MY84bX6i15+O6kVdT2ug0qj9aL2viaiettI90sDErK51LcIL/zotYt5Auje5abpNxeGsfq/mDOf8HlUQDf9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

On 20.09.2021 15:40, Tamas K Lengyel wrote:
> During fork reset operation the parent domain doesn't need to be gathered using
> rcu_lock_live_remote_domain_by_id, the fork already has the parent pointer.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


