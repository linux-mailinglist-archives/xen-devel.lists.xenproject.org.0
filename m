Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1184753E2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 08:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247217.426254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxP36-0006Jl-3p; Wed, 15 Dec 2021 07:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247217.426254; Wed, 15 Dec 2021 07:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxP36-0006Fs-0R; Wed, 15 Dec 2021 07:50:04 +0000
Received: by outflank-mailman (input) for mailman id 247217;
 Wed, 15 Dec 2021 07:50:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxP34-0005zZ-60
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 07:50:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aefe46b-5d7b-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 08:50:00 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-lJQ-T_2TN7iyBUeepkw3Jw-1; Wed, 15 Dec 2021 08:49:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 07:49:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 07:49:57 +0000
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
X-Inumbo-ID: 9aefe46b-5d7b-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639554600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hjPK7PHXBANagm/R9dQprIb3qUp/MtlmAJs19zyROc=;
	b=Yz/Ly5qV6nWF7z11RvAzcLrlWz5xaUABdqGnnOp8gZ319NJfBuRCPp2hE2wij6sT1j0YBm
	bToc/T5AY8RUFBO2aR19wBJ/vAtewCkQrDu/HeIyKTnljluzZQcXssiBt/Fj2Kl0+nymrK
	l0UVibQ+iX7IqErz8WxpRM9WWGPYB0U=
X-MC-Unique: lJQ-T_2TN7iyBUeepkw3Jw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIV+psMwmzz/RMeG4PvXL8z8zzdIBp7Qzy4JEZBiog6sHp/EswkppcmAMCU5qKZfDr5aHd+n3pm6bvrVGmO3sf1WwoOKo7DUA8vS/zWwuangscXEAYZYNBJKdoLxTCvlHTsoXwJbzyHDN5dsNMkNHCnYjV+PBUUlSDMbB7jB2vHQzMHRVU+ZKqfa7snf+mad9OFOgMU8xUYqsWETuQY7Xk96Uu5E9KiDBMvDFx+Phmk77C1Ltqx3KFbvK7QqT0r5Snk+ngJy+IK6zBKg02fojNwlXO/myoQDxdwSndv2iSX7nrZN0RsspM/Wf6X+iv05SkoKv9qQ/I+Sabz2Syk6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hjPK7PHXBANagm/R9dQprIb3qUp/MtlmAJs19zyROc=;
 b=UjhSIgq2TiWu9ypt07AkdVx4X1Zol8b+k4PEkyPRc12zntC8wGZwwl0ragEV5NKMbUE+iLT5+/wlrbmqEofGJX2+RCWW+kfP2Ap8UwTlo4BBDeLHUIyV2rhNZn4XwXfMJZWz3K1+tfj0Eum6+rlLkuWB0HodzbQrT9sgsZy239yjQrK+tMkgML71vvurOdKNXEB1pF5yGvD83WGpTmgT4dAIj+AXW2wRk1uqIima4APTxcVte2q5ttjCU8gco5Qm8HImElnEKWltZxV2DUzgtrLbww4OoAO9oXNQWRFP6ZyGn6PjJEcndRj6XUuwrtQUQZKm+RSVx09FG/GEjfpRSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd636560-dcc3-1035-43cd-2813f5978333@suse.com>
Date: Wed, 15 Dec 2021 08:49:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 14/47] build: rename __LINKER__ to LINKER_SCRIPT
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-15-anthony.perard@citrix.com>
 <bcca6950-666f-63ea-9ea2-49f70d8a252a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bcca6950-666f-63ea-9ea2-49f70d8a252a@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0018.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eff27ef2-0e48-4e88-31ee-08d9bf9f7d11
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393493B00D745D1BA505FB58B3769@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VwCw2Kl20vgdPIXpe9psEeQ1pt80qvc126OOyui7PAtssfEimv50mmCFAK3RlNEBAdLzz7MAfMiGf/vDsReECATPBOKekHEmh4v15qavVxzNfBzxezhi+JKNKRrcGAji+toRwQIB7fpav/WeuqzoOlt+JXfjpT8KdHcrO93jGiJXoJE8yQ+jxkXT4yW4R0RW3Dw0EZfc2nEvDWIJYoiZnd7peSCkl0XwLijR2vBbxShGWXusQHhyDnlYnzLOc+R+GQAgexXIpujVkLLlbeHzsUYtvUCsaKgeYG1fndVar30C6qzsKXl3nV/S695Llr1otyfiYQbK7CG51VQK9TO48wHXWmwGQJz6n5Hxi78juanOh5RuzA1BKYA56RxRNv99luZtw5mxZKPBnYnMyDS/MUCXrV8Q0/YY51ectiIkd9KvQlawxhFCetgayzQDM/tGSEtYU0bSMQG+mPOriNIDb4RnQKDXQGqvJFvFxcd25PMl68yxQQ+VGwfz8jdd90+Wb+11gie3IJMvhavK/ivbxmhEan3lxhrF3ZRUv+OeeCV0sTKztgVDcc6biiaJt4HFtbDP6TD5oFSmKxtnIe1q4XAMURUOmo/P+V39/blSMGPUZZpfysI3iLSF90COwuD6Md6Pr/YF2a3/y9kl6SV6k5/5jBHFh46nUoz1PoWlZl2kaZKNKD4uPTss1HdK0QQmg/b9XHT4ED99492Ko4oFjsga++UT+kiLgW8lItESLp0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(6666004)(66946007)(4744005)(36756003)(66556008)(66476007)(31696002)(6916009)(8676002)(5660300002)(86362001)(6486002)(8936002)(4326008)(2616005)(7416002)(508600001)(186003)(38100700002)(31686004)(2906002)(316002)(26005)(53546011)(6506007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU1GN0JzeUxMYnFLd0FLVzRldEdRNVdydDVwOG11bm9qSHZJaFdzNWhCWkRQ?=
 =?utf-8?B?NTk1ZElJdWQyTTBHUmtZcjVaQy91MWJkSWs5ZVlOTml0aHRaSWhvMXd5RXhI?=
 =?utf-8?B?VDlldXdjWlhDeDQ3VHBVZE8xRjI4cWJFQzI2eGFTTloyZTdvY0d4aThrK2tO?=
 =?utf-8?B?UnE2VS9zZUFxRTliK0ZIanYvcUkwVzdpbmVOd3VlR3B2WE8rdjR4VERTSU4z?=
 =?utf-8?B?ZTlOc0d4UEg4RTVMZEE2ZE1PWjV4S0Z6aDdhOEVkSmdpNEZvUk1DekxCRnZI?=
 =?utf-8?B?aEhTZmdmOE5QVWd2V0ZYUWFTKzZVc0x4RXVuanEyZUc3c21laFhMd1JMdEVI?=
 =?utf-8?B?eitaWTVvbEp2aW01TDBLbU53eWNKMWpuTCtUTktYQjM4dmFrQU1nVXRmZXlD?=
 =?utf-8?B?NDFIZWZ6VURiVDJsTVU1TVZZRmdBVnhMWVVCWGlZd3plc3FoWXhVTHlselFX?=
 =?utf-8?B?bDdLU3JOTFVlVnVMekVYZVVPSzVZYzN1U3FDZTI3RjlSM1ovbVBqNXd4cmta?=
 =?utf-8?B?Zk9iRWVFVHU2cEFyNkJTSVl1TjJIRXllUHJQRENzVEJxcnZmLzhCTmNiaWR3?=
 =?utf-8?B?TElhR3RhMmVGUDBPdDhaYWdxUW00TWJGRzFLcXg3YkR0RHd0RFViSTFtWHB0?=
 =?utf-8?B?UjdnUnhmdlNkM3dEeUxGTC9WMCtpQUJsT3lZV0lkSzdmSmZmNWJ5SVZOMUkw?=
 =?utf-8?B?SnBGL00zSTVlL1o2Wm0vdGZLdHhhL2IxRnNzamdJcFIreUp5NnhFdDdyVzdK?=
 =?utf-8?B?Z1pyaGNzeEJqVnV6cmJnVVRQcTNoeUhkVWNMaHh2UVRBbCtHSUZNUHFmajA2?=
 =?utf-8?B?V09sNE0waEpJRlNQVDZaYVNkem1jSUYvWFVQTit4R1Z6S1Z5VlNHNWhiK1FM?=
 =?utf-8?B?VG5uV3dtM3FzUU1HeG5pSXR5dkJneGVNOGVjMzI0TFI2UW1tSlc1YjRaNTR2?=
 =?utf-8?B?TDUxL1lQZzUxMjdDV2JUS2c5SVdvMFVIQW0wOU9GT3lUL2hyQ0FTYy9UbVMr?=
 =?utf-8?B?R2JoOEdEUm4vdjJ6MHd2MTcxZWg4K1dsZUVrSHhXSURZeGQxWkxabFBkUElJ?=
 =?utf-8?B?WmFVeTVzT2llY1VIWER6UG9lTi9hditOY3lIbjM2YmNNZ3pDVit1MVYweGNJ?=
 =?utf-8?B?bkZEV2dkZ1VjVGNMelNvRWxBdmtDNU4vbm5XbzlrSElBakx3emFUM056Wkoy?=
 =?utf-8?B?VGdXUkordlcyK2xydXM4WEllTXk2eit2Vnh3ejlYUlVaejFXZ0U3SFpMcElI?=
 =?utf-8?B?UzJlcHJYbm1EVms4dUxyR0c2ZG5Qbk9iSno5d1BBTU9kZmxmUzh1UmtJSTRt?=
 =?utf-8?B?VGNqeWRpeWlZeWFwWSswUW5kcEY2SFN6bTlIbEovVjU3NHhrSmtweUx4Y216?=
 =?utf-8?B?R2lqQWJZMGcva1RGZ2plTE1TTys1Ump4anN4a1pxYndLeUorUCtZeUNOelc5?=
 =?utf-8?B?TER0UjQ5bzlhd0VmTDZuMnVBVDQ0allMUGpoYk1oR2RIYXVWbkRwZDBMNUJk?=
 =?utf-8?B?UWZzSzduRWk2b004aVk1VFJHcStJNEdPakdrV3BBaFl0cDV1RDdGVFNBdlhT?=
 =?utf-8?B?eUJDRGlTcTBaTko5Wk5zTTJTT1NMMWI4ekRnOEpvU0d2b0VJQmhQS1QwR2Fq?=
 =?utf-8?B?SXdzMVJBRi8zVGp4cnRQNnlkQ29jdm1CZVovNVg3c3pKRXQ2UU5tdXp1b1pI?=
 =?utf-8?B?UkhxenUxY1lNdUxXTFVLQkI5ZjJRZEVxZE5wdjEzOHBBcnN3SXBFRFFSeC83?=
 =?utf-8?B?ZTQ1R0IwWEtjQ1U0ZStwalBWNjFscjhUc1M3RlNFdys4RVUwMVVuOVdHaXAw?=
 =?utf-8?B?ZDgvMXN0c2dETktFN0t3ZVJuSVk1czc5K2RoNjRxQ1I3YlVIc2FiMGNQaWlk?=
 =?utf-8?B?OVU4aEJqUTlPM3JSYjYrWnI4YWZ3N1JkaGJwWDBTcVZIOCtXQ3ZmbkNqalpk?=
 =?utf-8?B?aVdJUWx4K2szUHgxV2NRWFd3RWVqQkUvZWlRNmVPWk1ldFFka01JTWZYSndJ?=
 =?utf-8?B?Y2FxT05PR0RwSlNCWXJNeCtVNWNiL2Z6SUJrNk9tSm9IbVYyUU13djRhRCtv?=
 =?utf-8?B?S2R2VXF3bEhTWk05OGlrdHlxU2NzNE1nUVpwdzlydjdPc0xVVVkzOFBJaENH?=
 =?utf-8?B?V29ZN3orWjcwNHBleFB2ZkR0UUEwbElQVityMEtOZWh0YVMyOHpjcHFkZmtj?=
 =?utf-8?Q?iv2cVTAJ3xYMuq691ikd9N4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff27ef2-0e48-4e88-31ee-08d9bf9f7d11
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 07:49:57.0259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDxYqIVoFLrqlmEkjRNKzzGpUdl1jmHX87i08hq9u/QKGVWDk4OjSxbYmPBCGTGfLEvzy3zq7P9Pc6R6bIe2PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 14.12.2021 18:05, Julien Grall wrote:
> On 25/11/2021 13:39, Anthony PERARD wrote:
>> For two reasons: this macro is used to generate a "linker script" and
>> is not by the linker, and name starting with an underscore '_' are
>> supposed to be reserved, so better avoid them when not needed.
> 
> If that's the case, then shouldn't we also rename __ASSEMBLY__?

I'd rather not - unlike __LINKER__ (afaict at least) __ASSEMBLY__
is a commonly used identifier (which we've actually inherited from
Linux).

Jan


