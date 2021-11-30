Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5100046310A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 11:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235010.407783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms0Rp-0007oy-9E; Tue, 30 Nov 2021 10:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235010.407783; Tue, 30 Nov 2021 10:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms0Rp-0007n9-3i; Tue, 30 Nov 2021 10:33:17 +0000
Received: by outflank-mailman (input) for mailman id 235010;
 Tue, 30 Nov 2021 10:33:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms0Ro-0007n1-4I
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 10:33:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecd491bc-51c8-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 11:33:15 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-YzQ396mROm6erRuRJKf4mQ-1; Tue, 30 Nov 2021 11:33:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 10:33:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 10:33:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0134.eurprd04.prod.outlook.com (2603:10a6:20b:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Tue, 30 Nov 2021 10:33:11 +0000
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
X-Inumbo-ID: ecd491bc-51c8-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638268394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFdkeNfBCQpXbuEIhOTiGCHSN5GB8sLsxSauXc2YVlA=;
	b=QpYGtKsOc5g4K32UJravkIzu/1tsIHNYL3ELk2zPE/fx4RrpuGIpn/frR086cC5IOn6j9B
	iC9SSB4b8A6WmZhxkVFli20jcl9aXZicx1RDDuQYZRhRmkDsa6bXunKpMME/6h76rweXbt
	J6mTmsw37l+1b4a5gbwWTAGNDSvryzI=
X-MC-Unique: YzQ396mROm6erRuRJKf4mQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKOR66AoWClNtJl4ymFZmS0uZUKFGgCW31qyiW4B5p4ae7wJ6GyvO9R1AXDS9DSuo71taPM7YfTed0PIGZEkIyptBSp/we9zbt6+F0f10KICGQoC3xlote9g/rgZv1zKcOAcWfINIhGAqLAAI4qo96WQ/w4cuLEzAHoAgLJPblcDQKePzj7Fx90s+YPj2Jg7MnLko/aCghwsRp7PVM7+P4ZFo9KdzjnWK0IKtbpg50zCDeUJWgvgqie94Xqxst05rlATPSQlZhZ3diKMP8Brmb0Iw7tZ88n19fLG+TOyon1+W9qwGCFPCWQ0bkoU4N40B75IYtaVi32fu6+cvHNQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFdkeNfBCQpXbuEIhOTiGCHSN5GB8sLsxSauXc2YVlA=;
 b=kw6oyIs7NVtzh76Vel/H+vhHmf2pzJz/5cwJLQuCUSqrOF3FMz49KwJJzp56IKQmxA433WlNJs46tMI/PrwotUf+SoBHZQDYeaifs7sQQZ7oHrIuOqy+QIl/zlXbFG8FUGPz67Sfo02t/ErbswtkkrgQBca8zgKjQoHcjC4w6lAjMsTa5l7x5VPo66kJoyarDDjI7zuLcN9N9VIh3VtgUiICfUW0++Hw1v+2wlzUT/c6bJZmHSOgjmJvT3DFs5hn0JfCOL+gdmYhQnkHGmZo91W0r7EoOvzyIhoDHidFcCzh8JAO0lMAp/MI3iQjf0RxUtU3GQsyRwZp+/kEjKvlgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b4dcbae-4100-ad3c-cbc4-51f2b2bbedaa@suse.com>
Date: Tue, 30 Nov 2021 11:33:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/8] x86/boot: Drop incorrect mapping at l2_xenmap[0]
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130100445.31156-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0134.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6f28b02-1974-4433-ac41-08d9b3ecceea
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5168A8983260D42BF4C70D72B3679@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UJP5tIe4dxIeqqL+Gpua8VD3YJD/HJPxX+sbJKvzACGjgdA3OOjINyc0uyAQeyLFCTeeafX0k41imaZ+Qq+qe6TfEVqefBTA7OUyaDDBkJM0DdAJy5hsMatoqC62l2kbzcIPZ2Ri6zWNlWbZ5qS/WfVhR8/AHR9BCGMvCub0D7ZivJGtrviL7+Wd+rdW0dl3vo7Ic3FnAOEnHlg0D4OxnJBOVMPv0fi0OdsiI0ctSa8Wwx9rNMZEXTvXSoRtNZQOsJgdAPGHzHi6v53RDZF+n3IgvefTdKGs3G1PTFlh1HTObe8REDk/gNUm0CoQNBOuPW7GsuENw+pj8wpff1kyj3mVNu/odJpkHNjXtNdRX5GMFtSimUDlTOo0j6vDWgHcO4kzJJQURVOHTBna/iRY6h3fNztzXYEuFp3ZZOgEdcbXcRHQNt9YWWPkvgacOieOVBnwIPY9abER5UVlXoCexY12OwRuDQRNx27lEZhHb2b6FEAfQ8HiEfAzIWJ8GOl9s9k9vJZSdIxM4Z/L+Y4kaqaxC4WkNv+EGW1aI5Zohb/iUpEwfXgMzimJV+R5/To4TaiWe4Jmf2QE3ZFItFARgK5rLtmNpG/xQKE7G5txCvZcVjjkWaUmKZ5C8zPIpuP145zRX9MgnKCQFoVIJHP/TxcjhM8uYzj6OzISZFGNGicVQOmWjrIxFp9QPbd9b1KZbNPJ+/XUD5pSSt7z7VIxzcrobNzzNfrRx2jjv+Pm4DgM7YGAK09aMAkKyzQmmqss
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(36756003)(5660300002)(508600001)(26005)(6486002)(31696002)(6916009)(86362001)(53546011)(66476007)(4744005)(316002)(38100700002)(16576012)(54906003)(66556008)(66946007)(4326008)(8676002)(2616005)(186003)(956004)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjdGK0RlZmlQUGpYbXZJVktKdVFXWGxmdk9INGtwUllkNWU1WTJNOWlVcnRr?=
 =?utf-8?B?NVcrc3RpZXc4UjRvQjMyL2xtcVNVKzRQNS9DU204V1BUUGorbGE2R1NiQ0pI?=
 =?utf-8?B?Mk92RE9vTHRTRzF1VDIxNlNaaU5BcmtSOG1OV3pOZUFrYlJrOEMzOEJobkNE?=
 =?utf-8?B?aG03MlgxOXpYNC85d3licU1rb1pHeEs2dEdCNkpFQVdFdTVab1pFZStJKzVv?=
 =?utf-8?B?QzVva0Z5d0VyNFNWK29TWUs5OUoxRWVBeXcwQ3dMYjN6ZW9rZlBFTDJ2TXcx?=
 =?utf-8?B?NFNMbGEzT21yWG9Ua2htMXJ2QmVFRVY1Vnk4UFpvUExGQkRLNTNnaUg2UkdV?=
 =?utf-8?B?ZGg1c1lwb01ZTFRIanNuOG1vMHZQZlh2V1RxNitZSXdvMGlES1lYbGt1Y2lQ?=
 =?utf-8?B?TEJIeTBOb0pZNGVzVmVwSnlpbVNQaUlQSlYvV2pKZ2lPV0s3WCtnRGR2UkVw?=
 =?utf-8?B?cmdQSkFQTmluNTdYT1ZZN1p0RzhOOGdnVkU4cUlOZHlaMk5ydUZBMk5DUEVQ?=
 =?utf-8?B?aU1uNVJtRGhKMmpneHEzTjNZM2s3MVpJRml6bGVXS0pkUFR3Nld6ZXQwK2dx?=
 =?utf-8?B?QjdEQ1FMR0IxSjJTeSs5RTFZendUU1R5cDlBdHliVlJhbEZFeHlLQWtnL3pM?=
 =?utf-8?B?RXRTbEY3NDMzV1FqZWtpdFBTVDNoTEttU01kMElocTRoeFpUS1Vwa1lyYmgr?=
 =?utf-8?B?SU9TU3dwRE1uTDdlSTE3R0NES2U1c0F3WUcxdlpMRHZ4aXd3Q3IxTkZVZTQw?=
 =?utf-8?B?REpXbDc4aHh2TzkvT2JpRHl3c2d5L2p0VlhkQWYxd2QzV1pnMFNGUXpqTjg2?=
 =?utf-8?B?ODVnSUltUE1YaHZmcm01YWt1MzdSSVFRR1orOXRwZWNZY3AyaldBMmJTWGlz?=
 =?utf-8?B?TUZBQVRxbVFVd0d2L29SVXhiVVRnZ2VpeFBCcXZEMWhHejJ0cXFwV2x2UlpQ?=
 =?utf-8?B?VnQrdXNNUTlFNzZsc1ZvbTZQTGpIR1RmT0lyTXY0NUkzUVRtUFQ5dlhVWnNE?=
 =?utf-8?B?NkNNcGpQUW4vS2pIU3ArZGNiem5ldmRoUiswVEhvVDBOVGkwOFk4d3U5RU9K?=
 =?utf-8?B?aUpaVG5vYXgxSnJsa1FQOSs2WkNtQmM1YUg5dTZ6Q0FPMHVLbnhiQVZxYUY0?=
 =?utf-8?B?SUcvbUh4dG52U1p3VkcxczZZU3VxVjZxOHNuRGhJdCt5aWhkMmFMam00aDZ2?=
 =?utf-8?B?bVhKcnhGdVlmRVJha2RJUlpIYzNNVzEyeUtPODdTa0hpZWc2aFd4MFJSbStC?=
 =?utf-8?B?Z1hscnhUVVh2Zkcwczc4cUxET3NlRDVIRUNydWxiNzFnc2krRlJtSW1QVGtP?=
 =?utf-8?B?TUcrWTZvTFZZRXNjc0w0bktYUWtlcU91WEpJZEhrRENLTHI1bC84cXBoM3ZC?=
 =?utf-8?B?ZGI4TC9xajltbWd0ZXBZUEFQcG9jVjMyVGFCOFBUQ1dYNDlteEI3YXBQL1dY?=
 =?utf-8?B?QU0xTXBPc1JiN0ZQc2FrWG5HRXdidDBVQUxNS0U3ZHBaUnJyN1BjTFJzRkF5?=
 =?utf-8?B?N2prUUw2eHE4dTI3OStKekE4Z0tBUTYvRzJ2QTlRb2E4dEk5MEc3NFBxWW5T?=
 =?utf-8?B?OCtPdlNvTHczKzY5SFdwYUxnRnBZalV2eDVXSmlIN0ZoNS9UZTF6ZmJ5akdv?=
 =?utf-8?B?WGk2bDRqK1J0dVpubWdTcHp2Vlh5dlhpMm51S20xVmsxTUxEdkx1c01PU3R6?=
 =?utf-8?B?ZHhMd2hoTnlscGpUZG5XYW5GMnBsemd4WWZPYy8zRjkvMWE3Tm5aajIwdFEw?=
 =?utf-8?B?UHV3RUJIWGh5UC93VUZyblczdmhiZUNxQ056NW9NUnFIQlAvcjNnSUVKN0lC?=
 =?utf-8?B?ZWhxUm1rRUdUNXdkUGZ1T1I5Vkx4YytqdEFBUysyRWlQMXdUUWJsa1dIM3Ry?=
 =?utf-8?B?WjZZdVpPOU5wQnJxQlRsUmtmRDJETXdhbHE2Y3AwT3FDMFY2WSs2elZUcWtE?=
 =?utf-8?B?SU5qc2p3UFRLMzhRL2tGQVFpV0g1R2hsdHJiSWRhNUx0ck1qMWdzUkRCWFZ2?=
 =?utf-8?B?eCtCMmdzT3k0QmV1Qmp0UmJ1aWhnVzdabThVNlFXMDd4RVZWZENFU2ZvZ2VN?=
 =?utf-8?B?bEVObzYzK3Z5K09RWkF6RlQ5UFB1QTZuUk9qam9RY1M3NEtreWFCdWhnTnkr?=
 =?utf-8?B?RFZuVTdubktIaEtkc3l5bzYzbVVsZVdXS2M4bytPMTA1c0Uza0xSbHlHUnA4?=
 =?utf-8?Q?zMWV28fj6Q7LXbXa6shek5U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f28b02-1974-4433-ac41-08d9b3ecceea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 10:33:11.6764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvAYblCzb6CQoCEHdxwc7Tj5uoRXX/V00PBO9qa60ih1z3nqPzFLxFKtua0UBLXofi9x0JmB1ClH7P21VS5/UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

On 30.11.2021 11:04, Andrew Cooper wrote:
> It has been 4 years since the default load address changed from 1M to 2M, and
> _stext ceased residing in l2_xenmap[0].  We should not be inserting an unused
> mapping.
> 
> To ensure we don't create mappings accidentally, loop from 0 and obey
> _PAGE_PRESENT on all entries.
> 
> Fixes: 7ed93f3a0dff ("x86: change default load address from 1 MiB to 2 MiB")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I guess this may be worth backporting despite not having any immediate
adverse effect.

Jan


