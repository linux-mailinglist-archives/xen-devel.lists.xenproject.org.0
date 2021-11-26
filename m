Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D37D45EFCA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 15:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233136.404376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqc6A-00081H-4X; Fri, 26 Nov 2021 14:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233136.404376; Fri, 26 Nov 2021 14:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqc6A-0007zI-1N; Fri, 26 Nov 2021 14:21:10 +0000
Received: by outflank-mailman (input) for mailman id 233136;
 Fri, 26 Nov 2021 14:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqc68-0007z7-Il
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 14:21:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18757104-4ec4-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 15:21:07 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-ZFvZYxFvPFeBAagrttKkkw-1; Fri, 26 Nov 2021 15:21:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 26 Nov
 2021 14:21:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 14:21:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0085.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 14:21:02 +0000
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
X-Inumbo-ID: 18757104-4ec4-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637936467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77pjzMdYczc+UegnQUEuKJ0tHiIXCOp1OAhlvkjLKoY=;
	b=euZyqFtNPgVatNxMJVjLOO23+HSsrvSPq0i/FZKxWcC9PM4MyYqZHaKGqBYQGgUtHWoXw2
	6LeytyXLp3bNKxpG4XpXlGznHM7bVg6NTRljpJ4TlMQ3LTC3zVYMxrqQvDLKpTngoi3UYh
	JYL4h0fI8aGE2WfxToBY8BCxci1+h2M=
X-MC-Unique: ZFvZYxFvPFeBAagrttKkkw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kk4JEcljHGBKJu2An6Xk76TLdsb1B4cHjE9GlcTkUk16lpWrU0bLgGzXMlxWLT7VsSApBrbNza4bQiPsZxpULW+LeZrdSSAaP/JcUNhGQdi0OCtTOXTA5d8Kibtxcj3suF+5o4Zo/2ROcHcCNjX7MqypKC8KB5C63Hl67SIxJnN24ycV31PWdazgY8y5sVjuCuyF+Zm8m9adigbpp/Z2iN5ROskQu3QgJ+ZFR+zshsuGb/03ZhnYet2QNAmnzOlAdbOpdW3s0nzKXCA+McBfMfcG5+lwaKCxU/gGO6pvHKvfPFIRNUOY6bneHAmLaHGBR2ce8qgCnDF757uaGX4DSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77pjzMdYczc+UegnQUEuKJ0tHiIXCOp1OAhlvkjLKoY=;
 b=JYJG4cHmK3FCfqx4wgsIg9PisLvxhZC93cj+keqcgXcwruaGjlIbhoA2h2x5ALcwpHivc3v8p/OFlrhn++LO9DrQWMU7uz9g6o7mQqdDhex05y2jj/wgw5ZOzecMTWAWQeIIKzMapH8IVow7wUgprqAYicFIcgIHAuG824dFbW5/Qy95B7ZppUO44WVvZwzFUnQgwPFEcCKs8ntmzD63mPP+W+DCAy8UwY/GQypWNk3CcZ120jydlxhZ1z0pmOmjV+vbcaOZPlLSuCqrjcTU85BrIIzi+CaIwsGVnYJoioQUd9Js1tiUZPElF9UX0o7eQ5CjS4Msb6txzmBSt2T28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <374c6213-4319-91ba-6b69-c695d4b2cd87@suse.com>
Date: Fri, 26 Nov 2021 15:21:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 04/65] x86/hypercall: Annotate fnptr targets
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0085.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92d8f163-3eaa-4a2c-bf1f-08d9b0e7fa60
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43831B57941EE215CF96DAF9B3639@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KmVaSc3pLEzn5ubzc2Sck2766G+HWNOG9UOBA/oJTthH98O3H4hGld+YeKwIzwoyzFEMrNs6sAbo2Ypm+KhTAoD/DQsbaqO8oqi0o3lQKWjsTa6xNlz7oHAA/rmpyWRFcsQWmXDDf0GrzKLsjSJULEZOpzOGCgrRx5f4OJKpUoEWOxr8IAUdPtf+HqyiKhIQEjKvdnI2+WWvvl6yXeqC5+7BW7kYxO/cBoFs4bc4UO4ibjTMMbaKTnjiCkNfdf6Gfdv+0pp6eGBeKDRH4jquBrWJkY/cjoT2TdIybaGQsuLbuCm1XxujSijtyM4EZD3pNePHHI3h0SrhjHOOyVycH5EGTQsgFKeX3VG8jiTAq+AWZJhb5DDBO67new6HtjUlbzZWi77KXLFoxVUmDjkrn4UOjqhw5PXVE4YE5aDYYg7pAsBZ5H293s/Hrcvmeekq7mhI2HFufotbFtli8q1V2m0OniEHUobodV9CKwsfmePpY8nD7rE8szBcFBP5SHqIMlwT16UB23NZjvliB5XgzRhBoTt4w2dgWKfEf4mssDKwlGpUOanKWk5U7sTSeOgX+glmBION2e9s9gvrxSUTmVDdt4lX5VXNQRPDwwviUjYVR/ssEb3Hvry9jsC6jWlkRnD3sigFG/blTsx6feitPXrB3w+zJTKi9E7KmogY5kCW28AuRTd7qcT+k0gkOInAAnD1QmiVG5K3naSYu339uiX7KFSq+WKBf0HY+rAbYox7bRpLlApmPPvLPyBtJBkO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(66556008)(8676002)(4326008)(66476007)(508600001)(16576012)(6916009)(86362001)(2906002)(4744005)(66946007)(26005)(38100700002)(956004)(186003)(2616005)(6486002)(8936002)(53546011)(36756003)(5660300002)(31696002)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXhWUDEvNG0zRWNIMWxNQnpRclpWWmdzbnVYak82bHdqOGV2R2lKbFUxeWl6?=
 =?utf-8?B?R1puSmpYQlp3bDFROHJzbzcrcCtUUU9obHEzeEE4K0k4MDQvWHJSbEJjYWh0?=
 =?utf-8?B?ZU4zMCtqaEQ1eXJXTkJUY2ptaGo4bGFmcXQ0WHU2bUZZUWhMTXgrTHRiZThI?=
 =?utf-8?B?SmNpaFRNbnBRU01aTG16Y2Jtd050Q1dmbWlsVk45UVc0R0diYlZaazN2RXRB?=
 =?utf-8?B?ZWl4OGVnbEZlQlp6MEJ2LzJiMDZpUXFRbVQrTG5OOXd2Y2xUZjJEUzQvZHBY?=
 =?utf-8?B?dWxvRzVBenp3TGZQcEVNdmxCWW5PWnVKK0FKWitEenFPV0tKU1RTZDJyRndi?=
 =?utf-8?B?L09Dd0RJUFZxV0pxUzNLOGxKUnpXR2doTk9vRTRJVlNHeXRtMG04NUdzMUtq?=
 =?utf-8?B?SVJiQWoyaDdVWWorekRKS0wvYXpmUmdCYU9vWkorNUlDZmhDQkpPY2pKTUtl?=
 =?utf-8?B?M3NneHRidzhWSlhFWjQ0bGM0dlZpM2Fncy82b21Ua2EvZy9yNGpyandPSHAw?=
 =?utf-8?B?ODdVV1ovNGJZYXVPcENUWmpTNGkxYlRRdTdycnR0WkV1QkhqbkNJb2svSW9T?=
 =?utf-8?B?R3QzV3Z1Y3MzYmd6OEtVampqT3pZTEpSMzhtQzd0L3oxT2tQdXpoK29oU1Jp?=
 =?utf-8?B?TnB3Q0x4ZWNHODdMYXpwV2NxSU5seE9sN3VCYkczL0ZvR1VqdnZ4aUpEZ0Qw?=
 =?utf-8?B?RjBsTld4MEI0VzduUEI3eEl6ZGFpdlpUakxmOXdqRUk0cUg0Rm1PbytTL3FV?=
 =?utf-8?B?cXlxMHJmK3NiN0hrYysrN1ZxazRsMHpYTVlvYUo4YlhNK3F4bXNVUEk4NG1q?=
 =?utf-8?B?TjNPcDBYSW9WbHBXNnVKbEZHUkltRnVXaGRCMlFwQjNib01sL0Z4alJEQll2?=
 =?utf-8?B?M3VNaWlsWm5YVkVxWTdmU1pvUDE4SjRYS0ZGME5TL29QVWZLWThqa1FSUzBj?=
 =?utf-8?B?MVFFNmhWZHZUYVVBMWRJSEhhU3U1UW1venhUUjNVd3JnWU5HUUpwbDZHaHJE?=
 =?utf-8?B?N3lGMXZZUWxFUWY2aTlSNEtLckM0eCtrem5LcGFYNURkSXU4N1g1WnU4a25C?=
 =?utf-8?B?azg3Uk9wRkRJcDY0QXQ3alNvTE9IRHNacDdsWkpIR2lIazdVT1R5NHU2NFZw?=
 =?utf-8?B?bUtBY0tsQnFGZmZmbE5xOWxzWjFWWHlDbjI2MDR1cDNiYTM1YWxVMzJoUUVi?=
 =?utf-8?B?cWtHVTJzemxwbytET05PZFhTSjdZTWdSZlp4b3MxcTQzZ0VlTUUyRzAzQWRu?=
 =?utf-8?B?dVJsZUkxWDgwNTlCYlRoOVBkbDdNc0ZnWXYrZFZXSjFrZm56enUxWlVmQU56?=
 =?utf-8?B?VzFObVB5dlVrdm1jeGJydDU0eWsycXBVaVhGcGhjV25sWmltalBaYUt0NVZC?=
 =?utf-8?B?cy94cVVaSk5ZejRDV05QWmtybVR5U1lVS2Zka29DVmNiWWRXZjh6QkFlenBs?=
 =?utf-8?B?L1FFMGxJWFBFSFUvVnM4TFIzNWd2MkNBNFFPQ3M1ZnE1dTFqNzBIamNCS2hU?=
 =?utf-8?B?cTJOQTNkVzMwMFNiaWRkYXBZaElyRTh4TURPNDlnSnNhR3B0OHBLNWRIakNo?=
 =?utf-8?B?cjZnZEptd1M5R2thQUMyY3M4THAvNGZqWDBxTVp6L1dabUE4QWlJQTNtV25H?=
 =?utf-8?B?eVZVRlBLR0x1elhobjZDSXMrai9waDBsdTJTcGI1RGtpa0YxTUZTc3RtZGlK?=
 =?utf-8?B?SUZ2RUZrYkVBS1RSbm0wMWlZdlNsRnNEbVUvTkJoaENFYUNJNVN3TnRZVExV?=
 =?utf-8?B?d0hETmtNYno1Y2wyd241aFREcFN3aFU4eTBEU2l5VEZDNmVKd1l5dDQzcC9O?=
 =?utf-8?B?WS9kU0FHNFRqUVR4M3VUQWpCR2w5ZlloeDhQQXdNSXZWeGlrSmlLdlVZNUR4?=
 =?utf-8?B?WVUrVWJEd3hkejV1bmdIUXA4RkphNVdQVEpjbjdvN1BpSnlSeWxxdGFZRnBZ?=
 =?utf-8?B?Z04vN01DbmgxaVlrWkE3TmtZUHY1TGgrSWxrT2x6UGhzbXpTeEljUHp1R3M5?=
 =?utf-8?B?Vmw2UWxHbldZckJqMEVkOTU2cUs0L2VBTFczMk0wRkcyRm5iMFM3L0xnV0Jp?=
 =?utf-8?B?K0xtRzFsVjNrWDFhaVZtVlpFNjdBVENFbzEzTG04S2F3L2lZMklsTzdkU29h?=
 =?utf-8?B?aVl3TjVZTlBqRFJUdnRZVlpaNVBZN3ozeERJV2F6MlRJNmFtcHhEMHY0RHJh?=
 =?utf-8?Q?0xp098iAFp63MDPrztrLFAo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d8f163-3eaa-4a2c-bf1f-08d9b0e7fa60
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 14:21:03.5633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3S1wX85J8MIeeV+oQprmD0L/sQrVHkrphLDWx+xa6u+Od9XTqXeteKDEP5DMJ5jLv4cFkCbon435uKag3Xb1Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

On 26.11.2021 13:33, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I understand there's not much to say here, but the title saying just
"annotate" without any context as to the purpose of the annotation
is too little information imo. I guess this then goes for many more
titles in this series.

> --- a/xen/include/xen/hypercall.h
> +++ b/xen/include/xen/hypercall.h
> @@ -18,12 +18,12 @@
>  #include <asm/hypercall.h>
>  #include <xsm/xsm.h>
>  
> -extern long
> +extern long cf_check
>  do_sched_op(
>      int cmd,
>      XEN_GUEST_HANDLE_PARAM(void) arg);

What purpose does the attribute serve on a declaration? On the surface
I would consider it meaningful only on definitions, like e.g. __init.

Jan


