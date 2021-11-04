Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C0445134
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 10:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221376.383073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZ6v-00087d-SS; Thu, 04 Nov 2021 09:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221376.383073; Thu, 04 Nov 2021 09:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZ6v-00084F-N2; Thu, 04 Nov 2021 09:32:41 +0000
Received: by outflank-mailman (input) for mailman id 221376;
 Thu, 04 Nov 2021 09:32:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miZ6u-0007ee-30
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 09:32:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26f500be-3d52-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 10:32:39 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-c_3bFHckNieOdFYdW1VE_g-1;
 Thu, 04 Nov 2021 10:32:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 4 Nov
 2021 09:32:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 09:32:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.4 via Frontend Transport; Thu, 4 Nov 2021 09:32:36 +0000
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
X-Inumbo-ID: 26f500be-3d52-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636018359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrtL42eKsnPKcYIQNUb89Fi/gCwdhcmtVO0Rm0bwB6Q=;
	b=ds1olHEEQduKu/LQjJpcspJHY7gylzReKaQRuAy6488vhLt2Vk6JpNCEYZcm6LOLI3+Ozs
	LKotriyVkh5LMcfNFhmn0ZPqOKUwAxtOrTf3SHwCp+R6nE6RuoJ8Z+q+IVd7eV4dOS+Mu9
	SqW4uhQQBwoLLz89YF5bVivJl5/wmCo=
X-MC-Unique: c_3bFHckNieOdFYdW1VE_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sn/lDgqvhZNZxW1HuAbiwHl6KY1GFc0TSVX0LtF7TTuYLe4+SV+mYy9P3sFW+KiQb52ozLZT/tAHLUXfgCklYuoBKXxXHsz03yLJ7P1s3FSx+sloyKFU+pNmWLE7kCRxuB/9G1/Ms0wNmsphiGwBqZVjMoMaLwANCHONkJxIqYDaKDG375XFFumJhAO4FAwkCkjzLWh3wWhHCEZqJHEuhgtkbHa/kAw7y4lGWgmOh/XmAAwixjN6CVJBkXy5eE1I8hN7bW9WfMJ0V0JqU5XazFRKRLqElPoKNLCScKsbb3cPE4UhVmMPB20ddHc6SD7tSzHoIOKOEyhiLgOxz1psbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrtL42eKsnPKcYIQNUb89Fi/gCwdhcmtVO0Rm0bwB6Q=;
 b=Kmjmo/HwHE+FUDGKxryBPaxpjqyowC6tRU3a7B0ACyMnswvQBiozV7KpO9g3j6irY9vrPJPpY3kNEMr0asVgyJ+jbYLssTqm3CWq/IkVQzNuU8k4izZvAjoSzAbBdiZ43ECsnrskDDludutnSNL7SiMWipgPAlZV8e5zXKyyXIhL4koLVEGwKIfSRz/uoToo8lTXQbr0b7BA5OobVmhyd/85HlMFeGw537TFTs41XnLxchjYdqfGwJe7+Flv8MsuUtqtFIhmjxwQ5ELV/0ubfzoPrw2JowX1qOAFAwMWCX5rg7DhG94ro+USYLcBk7xLX5264doAG6xfE09Tgpp2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9267539c-5242-ae89-6b0b-26a27a3f459f@suse.com>
Date: Thu, 4 Nov 2021 10:32:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 14/15] xen: drop calls_to_multicall performance counter
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-15-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211101152015.28488-15-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40f2af0f-97f1-4bcc-86f3-08d99f760986
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2702355061F64803AAEE2E9BB38D9@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sURjWJ2ehdmLAnPmpFtugbiaBSf4NfZNbUJ/2ZBmAENeasb+Gd4i1h3Vu6M4nGNd1JNFY5JWvAL93fiRjs2fy2UkdOzy4DWCLcizqeHQLQOD5Gq6TupkNLHl5Mt7jAKHfDVUdnvaHf5xM5ZhixBHmwejR0+gupy3R4EyhXHHnBDRHskcN0XzLLAjOs8+Rm4G1cV0RWc4mFQXG4gU4wn2UsGRKE0khilMtZq1cYd8HH8kyfx4GsiNGJa+9JsTWyicYup9bcDnsNRdrgepzZ8YaX8eu1ZBry/gKQAGpjD87dNW0KvNqv83MfbtnR5tt2TccE8ozbWO1OkgPWNkg8ut/DdEEx2M0q8oISpoWTVWNvLifa7ZrM+juwj1YUoAHKpdz6wy1ECHx6NtM+8u2jUrmQIE+UblHSO8D0HfzhcOB4iESWpzgcm9DEk5/qPt9fRfU/3uy48pxs2iVtxY5RAOZQfqdl2F34KGBLrPBtk9FcD1LGdOhT/H+Rp3k+r6iXm1ky5OS8iC4CU4LgfJkDi90hch3rl7pRWFtEm6lIDXJjveJsiwbnGw3vqk7pheuyuw/Fho7HFEXkSACpLhL0lBy8RrZzqw3jy2a+KCweXtAgByg5sobJAD8LROyjeSkruSk2zRPw3Db2FAELj0NU2hHkBQ+9Wb/WMb5E2VZwDKF1zUF8nHOf0/R7hiNjc9Wc+PoJRBVHpK5GGz5D6bqmL26jtz0T0XdpfzgbNonPdnPZf46CWlD9DETSe7gDkGkYAC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(2616005)(508600001)(31686004)(186003)(26005)(6862004)(38100700002)(31696002)(956004)(36756003)(5660300002)(4326008)(4744005)(16576012)(6636002)(8676002)(53546011)(8936002)(6486002)(2906002)(54906003)(316002)(37006003)(66556008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjdNS3JDb2VQUGlqUWtOeVg3MGxxcWZnRkhNa3pPZnRXQTNHenhBaE9RZFdu?=
 =?utf-8?B?eHZyV3hGSkt6cStDQ2J2QUx3SU1aZDJqVHNBa0FZRzM0SzhYUzBoVXNxN25z?=
 =?utf-8?B?NzB3ejY5RzJIenVKTndmTEdNMVFNYVdHejVNc2lxbVRBMDIzamwwQ2xDckIr?=
 =?utf-8?B?WXJUR0RreFFEQ1lWMEJ3UFRpQmV6Uy9zdEpsTFQxUlpvZTJEVTRHVExnbHZw?=
 =?utf-8?B?SlpndnRXa01VTmVCTXhTdWE0SFJwQWd6aTN0Y2hLRnV1d3I0WE82cjQzRmdB?=
 =?utf-8?B?aHhZNGZuZDRrclF0QVdrbVBmYXlUVy9wTkYxb1QzbURrVHFNT2FQbXVDYjdJ?=
 =?utf-8?B?Q0FRS3puU0ZiRUFoZ21iTzJCcVpKRkx6QjRpTEdLc3NUdHZZMzg3aE11ZXNV?=
 =?utf-8?B?S2orZGZMdFNCbFB4NytySSthM3JCUWVPVFlsNFlnZU5tSzVoVU1kbmNIeVl6?=
 =?utf-8?B?SXZzSVNHTWRWamdSaW02ejZ5eDFqTHhRSkpMdWdycE9MV0d5YzJqck5yZXNJ?=
 =?utf-8?B?cUd5bFh2blFXM0ZJUFhWckx2citlWkZLOWRwTGdMWHZtS1FkVU1YOWErbHVV?=
 =?utf-8?B?aTh2NTh4MlhkTy9iVi9ocStTeENBWjBCdVNJK0YxVC9pTThVSUl1SlZvdTA4?=
 =?utf-8?B?dy9VY052a29QMVZzZWFyOXVFazc2RFhFNEVoZW02UFV5bXVySXRQVEpmZ2M0?=
 =?utf-8?B?aW8rZHVZcVo0c0MvUTFhelcwUTl0QytWVWRQWFc0cnpPdjc1cTFQVHBPbjZQ?=
 =?utf-8?B?dVo4QkYvbDQrRE5mVytBRWdTTlg0cVAzeCthSWs1OVVNWktCTFJSeUV4Nzh0?=
 =?utf-8?B?QXltTHhORmx4KzJSN3N0a1lKTm51RE0zSzFCWDBsZkl3UXVGZ25hU05adXlh?=
 =?utf-8?B?NklTd3NFVHRJaWFUdDBxY2hITlU5WTBmSm8yckJJM2s2NUY0Z21kK3BpUUhx?=
 =?utf-8?B?VmZwN2h2WUtiRWRRRDhHWW1ub0hXSFd6MWxxWmdlWk5ldFZLc2ZySTRySkdZ?=
 =?utf-8?B?VHdYTTRFeGY5MlFScHZJeTA1d1FMczhqVVpRVlZEcXpPcSt1dWtoRitmR3dW?=
 =?utf-8?B?Z1Y1cWUwMS95bDEzRm5obUNSQWpralArZ1RONFA4dXFjUitzZmUvRVJVaUVq?=
 =?utf-8?B?OXdXa0R6aXNLY1BkNFkvejhKcm45bXp4aVhzODRkK01xZkZUVnd2Mk1LTTZC?=
 =?utf-8?B?WmNHM1ptN0FmbHNnSjhhZkNKT3l3TWlrYkhyOExLWWh0MExNa2IwUXdHcUU3?=
 =?utf-8?B?Sm5CMU5VMTVGaEJFUVU5WmhsS241UG5nTGd5cEF6cHVYcU1maHFVanBpeGpL?=
 =?utf-8?B?NjBxSXlFMXlqZC9xTkNQLzN6NzVOU2sxWDBSU2dCSlFSNlFoWkNTNmhCVHpR?=
 =?utf-8?B?UjUxTkJwRVplOW5oaWFieGtpSXc4WmpaczZIUlF0OWt1RE5tb3Ftc1FITll6?=
 =?utf-8?B?SGQxY2oyRURpdUZLZ1FNUjB1V1VoQTMyV1BsVjM2bGlLcVBnOEhnV1JMQngy?=
 =?utf-8?B?SGN6YzZONUI1cEdYQXE4WmRkUFN3ckpGT2d3d0Y2cVhDbE15UnVZOVZ3NTE4?=
 =?utf-8?B?MlRjTVJ1NU16L08rTGQ0MTZSK3FiazdlUjdhbUNYaW01UUZ1K2llOE8rNmRO?=
 =?utf-8?B?WHM5WCtHUWN0dnhtaGJZREQzQUo0czlnVVFYZXduR1VyM0owRWg5ZVRMY1dl?=
 =?utf-8?B?OTYyaHh0ejdXbzErUGlTcDhZd2tLaEJJZjFsY0xlck83V2xDRG5FY0s2Yy81?=
 =?utf-8?B?N3crUmovbElsNEtkWmdGSkdpcXg1M0ZjU2dHWE93UGRIOWpuUUhtZCtxU0lx?=
 =?utf-8?B?Rk9jOWtRa2FhaE85QWZZREZlWGFzdU9kNExqZ0puQW84YnVTWTMzcGp4SnYz?=
 =?utf-8?B?Q3paaXJ2NC9HVDBtQzltc1orOEd2U1hDYm5ZdjN6VklwNXRwN0x1Wi9JSGJr?=
 =?utf-8?B?ZmcrSURuWGNiQWJ6aW1ySkhhQ2JpOHVmWTNmWkoyazM2S09Xa3VKYnFVSHV1?=
 =?utf-8?B?N1F3dlp4K2JOUkE4T2Q0bXJYY1VldWhDZENERjI1VUVvMlhnVnlsaFdjdStV?=
 =?utf-8?B?akgyOHMzbmNJT0l4MzdxRlBBR2NxclMwWlBYYlJvSEZSaSs4aTh0MjRsL1ZN?=
 =?utf-8?B?THV0anlNdHNCc2pCam5OU3FlcjVJOG1KS0ZYZHZackFnbWJBZkt4Ui9XdTgw?=
 =?utf-8?Q?Vo/GjGeMNEFUKlxrLBt0BbE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f2af0f-97f1-4bcc-86f3-08d99f760986
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 09:32:36.6053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dz2PvNyL0gsWOyMEeJk6umqeI28D8QaGTKldwD3tMUsZ/K63a4A+vsCglQX8oMLbdiLv9YPFwKeWLG1LPlonyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 01.11.2021 16:20, Juergen Gross wrote:
> The calls_to_multicall performance counter is basically redundant to
> the multicall hypercall counter. The only difference is the counting
> of continuation calls, which isn't really that interesting.
> 
> Drop the calls_to_multicall performance counter.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


