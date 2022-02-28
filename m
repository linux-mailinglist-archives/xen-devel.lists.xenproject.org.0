Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C454C66E8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:10:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280328.478237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOczG-00061w-GV; Mon, 28 Feb 2022 10:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280328.478237; Mon, 28 Feb 2022 10:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOczG-0005yy-Ca; Mon, 28 Feb 2022 10:10:38 +0000
Received: by outflank-mailman (input) for mailman id 280328;
 Mon, 28 Feb 2022 10:10:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOczE-0005pG-Bh
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:10:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaa0e768-987e-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 11:10:34 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-A8-oh1zoOWOblb4EvY-FVA-1; Mon, 28 Feb 2022 11:10:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB8236.eurprd04.prod.outlook.com (2603:10a6:10:245::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 10:10:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 10:10:31 +0000
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
X-Inumbo-ID: aaa0e768-987e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646043035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhV0rwXLk/9UoG+nLDskczyhy8V7ZE8R4qS2txZL3Ic=;
	b=FzS9yYSejVwZHSpWr+zHuFVTC/l8qFdjqT192nWhMwe2IxbUj2qd/DQZTTI4Fjwyo/jSau
	1fklRCbBGscu9tMujqAiObrexZgcMxI+E6JjQNUhW3aKoqkil0dXLY0kYRqUhZ1Uusmw0M
	pp5ocbPZhHprhA39JBbFbfJsTWxOPdc=
X-MC-Unique: A8-oh1zoOWOblb4EvY-FVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geoqYE68m9FwhIL/dRcriJA79w4P6rQVlCGap9M/fUYM4T88VilbsoKIngjWFk4fpmNpX2ubxGvk6GBUcgLTvAamMlQwbFxLMIVdEIP7GzMTuZZqaVq4aLkCd6239PFxOCLCCgh3+olM3sRF3en4nMW+eQEmh/vOTWSNcQOi49eKZaUxdwon3UBDdj7PaDem2q5IeDKtqAlcDniNs5Yp6GiF620pdzLa54i0VbndHM4qflT5PSsjPJxj2e7y8C0RHATNYdwr4u07YgTOCwz7FPq/R+Fm3MWUx3cmyTJ5HrGcEnzW5EJ9U86YwnglcaG+l+arapiNQGsvdoXB7ZYI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhV0rwXLk/9UoG+nLDskczyhy8V7ZE8R4qS2txZL3Ic=;
 b=bnBtOYTO9sL/TPfHL+YQYe316KMFkMqV+4hBsjF9dQ5kR/9srRpBn0N0N7M9SzXKPAFtFRSCJkVJLo951aOmUjXIBRM7d7ogdK+VhU/BmCmsyCKDZb8zVNd9QJnhMkeIv+X/YKDLLiR+C1YQsdU6NTwVKPEmbDvKgAGveq1uy/djtAHYI/Q+3X0uMNAmgSR7g6dj5T02EEKnGTAEYLHR6DUvzVV4UT07OMIxGkZwdd7UjORi6O4mkXmXFcfwiQCkdDPclL2ereCsU/DHCPsiwALOUDwpSSMf8RR44QxBwnT15GgB4MyAN1KPA/vFMyayGCISRSX0RJMjQ5tQfR8eOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d218b78-876f-71c2-ec73-9958c7e472ea@suse.com>
Date: Mon, 28 Feb 2022 11:10:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 14/19] xen/arm: add Persistent Map (PMAP)
 infrastructure
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-15-julien@xen.org>
 <fea3b34c-d605-be27-f75e-722b39cc48e3@suse.com>
 <ecb68523-1881-214a-b1e4-b239fed6ddce@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ecb68523-1881-214a-b1e4-b239fed6ddce@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0005.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df8719f8-54aa-47cb-4f69-08d9faa28d68
X-MS-TrafficTypeDiagnostic: DB9PR04MB8236:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8236978D4CD75CE0D8A51117B3019@DB9PR04MB8236.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pDrONxzPZwdTrLBm5nm1Uak0Gqt713swSX6t26rzlLKNcTxoymebMJtAKl+HlYoQj0jIyPNJo3GBK29QF6U7UgDJ71VyKvJJc1v7OcL1rP1pKWrkt55KQcnHBchr8NaXP16sh5sckqcimPUBunSNmPFmnTWRPWJarSsiJyL9QJ6F//fJ5rjAeL2t5dCnQggFBkoWMWtTYeU4Us/kp394cSard8VBGcNP6/MtzLmfQPQgo2MgAAqy3TtkrGOeNAGiHQinkMr6mALwajWAs4pxhTUk33bpdO4Fj3VvyaCWem5tzVhMsZAK8907gqijXzmGVnsk0QG6xVt8ddE+502AmaUUE14SbRSh5hqXup9kO4grX1G8TnK4QA4BGUDlw7qYsJWGu1renMeSMsigXLI3gN7ni/reFblilzdHpqDDAACI2ILIf2MBx3fbU6k/kOeUsQ4j/fwoENB1nm9+gB6wcUlFIz0MKPTo09iac6n56ykPUr78Ggvaz6EAmIQCQdGOZ1xWpvPPvJIzZRDF07pSrrJgDQcJI4njGEWuVf4a3pPTcHhLkLtsKwG8cTlxr4mg5jpJJjsDpIyHDgk1zh/L4aSkiUIYj3V1Ni5mSeEFajWMuyEShxwIk1iPVivuJ+GC+3srdwsPs3kwsXLDX+lxuzLeJfvxLFdx88LHi9M7mHQMd2cZwwy+k8E9NEcVjoFBAEw1/X2uxTCPqVhOWtjl5xWN5wOw9w9TqpLTYaEtHwU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(6506007)(6512007)(53546011)(2616005)(508600001)(6486002)(54906003)(6916009)(31696002)(8676002)(66946007)(66556008)(66476007)(8936002)(7416002)(5660300002)(4326008)(2906002)(316002)(36756003)(86362001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTlzaXNrdGx6aWFNamdmYmhEM0JLOG1MbnlvUW5ZTWR5QUVkL2dWb2NFc3Nk?=
 =?utf-8?B?M2UwQ3lETGNCbE5JSy92aGZ3dlhvd3hnWm41YldhV2VTTEVLZkNGcElkU3pt?=
 =?utf-8?B?dVFuSDBXSmtnWXhDb2Q3N3lEc2FyMEpzaUdpY0VQSVdCQzFBOXRxMzhqblRI?=
 =?utf-8?B?K0lJMFBLSXdNNWF4UHBieURqZGdoclpaU3puL080d2UzeEFmU1NoN2NLWUcz?=
 =?utf-8?B?ZnduTXdWWG12eHE4dnU5bFM0MmZRZG83ZDc4RjQwaXkyOEVLN3BydXc5dVc3?=
 =?utf-8?B?UjFCNm5hdjBRYVlVRkdwbWZoTzRUSzE3U29BcXRYOVdnb0NldDl4M2NlbWFw?=
 =?utf-8?B?dmQ3LzdwOHhPZlkzcnc0YTc2MzcvZDhhOTNpcnl6aitrUGFLVlhCZ29ydFFI?=
 =?utf-8?B?ZDd5am5Sa1kwSHR5QWpjdytacFlZY0hZalhGQUlyUkI4aXUzdGtoM0tlTVdy?=
 =?utf-8?B?Z0hKd2gvQ3BGaTNxR2FxdWc0NHdYWE1PcGlMa0hBN2Z6b3BOU1RQeVFHbVVk?=
 =?utf-8?B?c0kyVmFWaGtYZ3daSUY2dGdSSGU3NE5LOWVjSjl6NFdpTFpUNEQwa0lvNFdm?=
 =?utf-8?B?ZVM4anlkQktDcjgwNlNYMzBzWmZBamFvMWlNZ1RIRm1HL0hTcmxaa0ZTTzNY?=
 =?utf-8?B?WmgzekNZaUtaR0R3a2Z2UzhjNkdxd1pGL1gzdHgyUHo1K0xuUVZSVmh6L05r?=
 =?utf-8?B?TXFRWktvdmlxczdVVElBbnE0U2FZM3BUS2pLRlpqMHROZ2k2dVVQdWM5cmli?=
 =?utf-8?B?ekZYWHEwZzVkNXNnYWlOSk1RRzRKU0hmTW1VVm9SYzlVNElEZ25iR0J5WFYy?=
 =?utf-8?B?NnVocytxSzk5eGVVWVVubUR1SFhiaXZrSGc0cXRjWXdvQkdPRmVvSUpyUUE3?=
 =?utf-8?B?MjRINFMvVG5LL0tqM3hDY21QNnBMZ3pGSXdDcnlaa1FmSXJHK0ZjYk1wdVFm?=
 =?utf-8?B?eXdZYUJOZ0daYStuZzNLS0RybGtLSDlKbGpQTDNhQ2NrWXFvdWV1MkdzOTlI?=
 =?utf-8?B?UVNMVU1aaGNucTdwbnorTEhqeGxpOWk0S2x0WnRjS3YwK0UwSENCelc1cXVU?=
 =?utf-8?B?RzY2a1VMUGFna3FWSkZaNWJSSnQ2UHhGSHZ2YnNxaVRncmdTTkdReVpEcUJq?=
 =?utf-8?B?VXVYRDlmeWMxelMwUmwwVUVNNk5CVHpGZm54dlIwYnlvWllzOUtsRDdmOGIy?=
 =?utf-8?B?T0ZpK3JydDl1UC9KeDFLWWhmTFhFTnM4S1F4SndVWlpHbU5UNEY1U0kzYlF2?=
 =?utf-8?B?M1pEMDdJZW1QdUpiWkVMdlpNVk5YMS8xQ1R0c0g1cnVsU1JWUENlS2NRV05n?=
 =?utf-8?B?SmJSL2lLVVVIQnJOaSsyS3dITVo5bDBIVDJjRjlXMXh0MGduSytBUlVKVlBv?=
 =?utf-8?B?MVJUb0FVSXptaXhXZTUzQnJRYnpQR05FUkluYyt6MitjaDlqSmxCWnRXb1VF?=
 =?utf-8?B?SjJDWVorN3grZ3pUUGtIQU5Bc241UHUvWEdvUHpTRFREVk1XQlhkSWRlYkRP?=
 =?utf-8?B?S2NyaWFTbHZOUzRUS2ZPMXZnZ29zUjZsc2NjNU04a1kyWnBXTmwrUkZMSHJz?=
 =?utf-8?B?eExuNytYZVhROEJmK0pxaEJqTk5hUE9VVTNZMzRVekQ0TXFaQ3dUdC9VQTQv?=
 =?utf-8?B?YVNSQjg2WVRvazFwYXZYdHFKWkRIQ3pvcC9uV3lxWUgyeEthUDk1dWRZRUg5?=
 =?utf-8?B?SzRtdTNPRjFneXBZWVJFSklkOVVKZnJzSjBIOGRtdEs3RHhORTgyekxQYUpK?=
 =?utf-8?B?OHBGS1dGZlpkWFpaRHR0YlhCQU9KMXNzS1hNK2FPbXRkZXZqdVVVZXFhU3VO?=
 =?utf-8?B?Rnp0VGFxZXM2MHRyT0I5WW90ODk0a0dRa0lvekRDRkN1bnJFUDFNZW44MFNF?=
 =?utf-8?B?UjAwMXFEaWdJY0xDdThuNkhMYW5tTXJhK3hpMXltWVJ5TXNMYmNEQnRMVkhW?=
 =?utf-8?B?L1JsY0QvRkRWVll0cllhQlJoZExXZ3gzUnpDNUZmOVNOK2dpQTh3cVFubm1k?=
 =?utf-8?B?RHU5VU9YNDZZN2FtMmtSeEhRWnJUMWVybXdFN0FVMzZXMHl4cy9KZDZYRWpB?=
 =?utf-8?B?Qm56WGVjTXlzNC9pQUpibnFPNTRKcUlIeGc1d3cwd3lBUzYwU0ZqZlR5ZnJT?=
 =?utf-8?B?LzliQm1ERlN4a09yQmN2T2JFb1ZZS3p2dTRGT0xER2pSVW8yRlJvMVFiZlJR?=
 =?utf-8?Q?L5zJCVLC/ccaKiXjA5dOxT0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df8719f8-54aa-47cb-4f69-08d9faa28d68
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 10:10:31.6205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQzTvWPF0u/SjYyQ4/vVfzCzAqzGd8iXURBaZdpmKgBzu7myJcby4WpbaZhgvqQACPxqPIx4xbjeG+t0u6r5lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8236

On 28.02.2022 10:55, Julien Grall wrote:
> On 22/02/2022 15:22, Jan Beulich wrote:
>> On 21.02.2022 11:22, Julien Grall wrote:
>>> +    /*
>>> +     * We cannot use set_fixmap() here. We use PMAP when there is no direct map,
>>> +     * so map_pages_to_xen() called by set_fixmap() needs to map pages on
>>> +     * demand, which then calls pmap() again, resulting in a loop. Modify the
>>> +     * PTEs directly instead. The same is true for pmap_unmap().
>>> +     */
>>> +    arch_pmap_map(slot, mfn);
>>
>> I'm less certain here, but like above I'm under the impression
>> that this comment may no longer be accurate.
> 
> This comment is still accurate for Arm. I also expect it to be accurate 
> for all architectures because set_fixmap() is likely going to be 
> implemented with generic PT helpers.
> 
> So I think it makes sense to keep it in common code. This explains why 
> we are calling arch_pmap_map() rather than set_fixmap() directly.

I guess I was rather after "when there is no direct map" alluding to the
planned removal of it on x86.

Jan


