Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB746B8CC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 11:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240842.417585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muXdF-0000uL-IY; Tue, 07 Dec 2021 10:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240842.417585; Tue, 07 Dec 2021 10:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muXdF-0000sU-Ev; Tue, 07 Dec 2021 10:23:33 +0000
Received: by outflank-mailman (input) for mailman id 240842;
 Tue, 07 Dec 2021 10:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muXdE-0000sO-Gk
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 10:23:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9e8160e-5747-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 11:23:31 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-uHDEd2uLOwOL_BCND-OT1A-1; Tue, 07 Dec 2021 11:23:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 10:23:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 10:23:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0602CA0012.eurprd06.prod.outlook.com (2603:10a6:203:a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Tue, 7 Dec 2021 10:23:27 +0000
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
X-Inumbo-ID: b9e8160e-5747-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638872611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmD5CAN7a+Q87nXx5QfYdUxt+z4CIBIAmgn2KW1KldU=;
	b=NMiIAEQTrjYF0g4ukdY7FUwydkp9DoeDz+RMIp8vtyJqchdBWk9LmMKvyH3Fhl5VsJZRxF
	0oiOsgtvCbMW2cQ1N7Ho7pWlN3KgVEe8p7Uy1U6MWsmT3/ifSoyM9oCiflA708YDPNExRq
	QG1IshO2psF96byjYXfDU/IYs5r09xE=
X-MC-Unique: uHDEd2uLOwOL_BCND-OT1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i44CaEwpVr29YfyIcD5iJfXlYTsGU4KMIRzVlZMECu7VIZLifNXn8fw/KCdKwtGGhphHmiFrdz0gG3neCr6BF1D3Z3/CirezpoPIwjlHDwNSZsaNzIIwzesoHayGd0cAJF8HLyanKaI1HWYSIFHc8kSA3gy3Zew6vnzuTxmwHKNTm9u3lraq7jKGGbdzUfClPv30QOL+6XQwdx/amz0/I3T1mp+kS05Wh4+xfPx9UWRjqDQPD1Fo1vrZlypngcYE+7KpHO0fcTIULwyVfKENysca3fEycFN4ZB3ERxLYxWm+HsLOuIWMvcg7BtEKHTrDnNMIgvJQvx+8zt2xFkZHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmD5CAN7a+Q87nXx5QfYdUxt+z4CIBIAmgn2KW1KldU=;
 b=f3hpwDUOpOLkyMhjxWmUJ+MGar8VcHuj6XzPqzgi7sTcELf7AM3+RCGWAd8HK8/vUsQxDIOW5XKJrWGNZcp/rC0zcMzofV7mTTc97I7kfcAaTI3JfWjyhpj5B9VA0EY+DfuKNIqRnl3IrZbFFP9whiE97N/UyluDASCSILMgnRFZ00TVH5h48xJpAmrv8S2KKwpbUywtiRCOVIYBWJ6aavaYYeAb96YRqP+Ky+YqbXBB4Dchv3lrWViOK34b8ZJ0i7rIiQHkaK/UEFXv/2+yHjrqxFnB/QiTMEWBqTRS630EO7eA07mSwmfdmtJsAvADRNwBm6rRC9XYbfpqX+8xcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b92c237-9ca9-813c-615a-74a2f3e858d3@suse.com>
Date: Tue, 7 Dec 2021 11:23:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 11/47] build: fix enforce unique symbols for recent
 clang version
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-12-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-12-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0012.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fca43cab-1337-45be-2652-08d9b96b9c4c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3936718E9650F1EF60D982D2B36E9@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	itDvDhNt33WDcR9wO5QsGdrYyjpmyzDqdyAPVVh+I4PgGvJErNn8I87cgy0GD7nCww8/u0AuwWNv6UbNAy/I2XZP8SmZGerrcnJdrExUYMghgBi9iTv7YHeqXUT23qnFPjecRdZKgAeHxi05btAJnfdqLphJztiuvUbpGzZrncXOwU0iAV6F0JxmtXrY98Xc0Ca4R4CINsvVqRXb7Us04XnviuK0xnamqxmuLhVvPJHsjn1bC9Mdib6vVxWeGJEfgaUGpVvyUH0RYYATUyWpyTBJp3r/0WlRMr0XsYv3/4nu3TRLLHNfzfgVqN1aea4LQlIP0P9W3V5RQb5c4jnq62LVDjPKBrSNppemtB2FcdlgieElYgaOPUCGBDv6zlf7d5dsni74Na24ftl85te1GNars67Q1dqDKFvtFLgYegDzAWj5K3QoemLKO7y69Okxxd4k+jbLlMHMuuW/l4XZo/DPtiSA1nboAmdmUAPA95kT4nXBv8TIX8H3Dv38bNYLjQ016th1Ai0OegLp/iFcvKBhtschNOLHs5hQufF4ZdG9hkcF8vzQsJk0/CMXeW8e6Flrw2f0EQIV1wMdhMhSY4jvRSz/+2tS/px9vBGtq6hlPTBqha1YETsLC3FD/PaBubZg4tbVcBqDe7lfIRDiG7z0LWRYmHKd0X7wibWXNlORJa2DHkSMP1O1mRIXxYby2+27q6IclC1WSq2BlQYdkMUazVsr0qhk9WL09I44ay4WHfU8lR+fPCdr2rySJqCm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(8676002)(5660300002)(31696002)(2616005)(2906002)(4744005)(54906003)(16576012)(86362001)(316002)(8936002)(956004)(31686004)(508600001)(26005)(66946007)(66476007)(66556008)(6486002)(38100700002)(6916009)(186003)(4326008)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWJoSFpCc3h6L3UwV2d1aDJhUUZHVXR6Q0hUZDJScmp5TWJGeW1DWFEvWjNU?=
 =?utf-8?B?dUNvbXhCR0duMkNkeGtIM1dHVU1SREMwbmIrZ0luKzM3cWdVbW5jMW5hY1lv?=
 =?utf-8?B?cG12WEVNV3M3cGtmRDBiTzZwUHdpUW10QmljQllmQklOWDZBL3VXM2R5WElH?=
 =?utf-8?B?RkRneVlkUERUR2ZsOGFRcmRJUndTMVhaelllN2t0UDY5dXphVlh4a0VJZmg5?=
 =?utf-8?B?ZW5WcGRxSXBpeS8zNk52WTgvL1pJaC96ZEhpQkFTbm1nbURLc05ZVzUvQWpL?=
 =?utf-8?B?b0Q2dUxZWDRSUzhWU1ZyeVJJV2Z6VE1IUVVndS9TNTR1OThsYUtqUHBiN0J4?=
 =?utf-8?B?YmdDUkZhU016Ykk0TmpRQml1dWI0YWFrcmtvaHg2bWcwbERUYzFySHo1d0V6?=
 =?utf-8?B?MVZZOEcvQmxQUzhVRFZVeUNWa05saXdXem1kak5LbXQ4M05WT1ZnZEh3QVRI?=
 =?utf-8?B?VVp5aFVXK29uYzJqMXFWREJFMTFlSTFhNmdoai9TWVFnTkZLMHlLSnZackFV?=
 =?utf-8?B?RGdNWk1tcGhEL01XZWF1aElZUVY3M1lrenJaNVhHcGVsYWVtRlp6Rm51QjFr?=
 =?utf-8?B?TDVGYkJybzZTNnNnT1JQYVdWaFZEUlo2ZFhwNVVIcmp1WXE0VklEN2J3M0Vz?=
 =?utf-8?B?Z0IrZFYzTWxhTEZQd1lHdmhLdy9mQ0hhcDRCTGZ0U3pDYVBpYlJwZXorc0Rl?=
 =?utf-8?B?OXczM1NIK0lVQkhVU2dtbnpiVGJnOVcwbWtxQkpGR2YwTkJjT1UvT3NoQ3Vv?=
 =?utf-8?B?ekdSR2tMbTYzOUZhZHFiY1JBREgwZWhIMHQxazNuU1ZZbDI2TTR2V09PekJz?=
 =?utf-8?B?SVhyN011NmxOWDVRcFZCM0hER21kcnRwQVZINlY2NUxBNkVBYS9JMWtKMkxW?=
 =?utf-8?B?TG1SaUx3U1N1VzJwa2N0ci9GUzBLR2VXWm5QZFN2RlBsVTR1U0plbTVEL1Za?=
 =?utf-8?B?eHk5QVk1endXL0ErUU9CQkl3V2xzSnc4OHBHNHhIMXIrbXJFaXFiYTIxR1lV?=
 =?utf-8?B?aENiSXVvS280VGlBTEM2OXc5b2g3UDIxQmhsSjRUVmo1L1pDckZnSFdrN0E5?=
 =?utf-8?B?QkdZTGRkOUkvRUZad2hpYzBrNVBDUExVS1hERnI0RE5yUHp4UE9lemltd1VU?=
 =?utf-8?B?VHpBSnlVSVpQQkh2SEpyYnlwR1A5SjliS2oxOG5PcEFBV2xjbGRRN2NybWgr?=
 =?utf-8?B?Ym5YT0ZFeDlpWTNNNXgzRjB1bEl0MlgyY3owdVBNaWVNZVk1Rit6QmVnM3A0?=
 =?utf-8?B?V1BzTmNWK1RaY2ZGOTJrMHlqSFplbHlEYkxIM094bVFZQUgzaktZNFNaTldY?=
 =?utf-8?B?SllhL2pKNlc2WWo1THB4K1ppRmxpcEdlanBQQVE3UXU3Q1ZvZnJoRlF4cFBy?=
 =?utf-8?B?QnVqM0NVV2Nld3RrdlBKUjArZnhzRDZETmlCcjFJNkxUZWtCRlI0aHlsUk1k?=
 =?utf-8?B?QjRJSWkvYjlxaFh3YnVITXNJanFsb21sN1ZQZGpucy8yYXB6Z3RDMTR4cG1z?=
 =?utf-8?B?eG1wQlkyWms4VXMyRGpjMnQzR1BRSEhCVFQrRURQY0tDMnZFNHNsWHlvUVZ6?=
 =?utf-8?B?WmlMSGpLU2wzM3VNT1o0TFdjakpnMkZkd1pLa0FBWVArcmxndEhsZHJEQUFT?=
 =?utf-8?B?QUNsYzJ5UjZKMFM1WEpJYnlEc3cySFJrWVdzMTNKWjh6ZmpUS1lLeXlCZjQz?=
 =?utf-8?B?VWhkajdtamJpbUVVdER2aERNVDE2a3ZBMHlkaXl0VGNqbit3MGFrS0c1MXBy?=
 =?utf-8?B?azU4T2VHc2ZCL1hsUXRLd0FtUG9ScDhYNFBWeFpKYnFLRUU2ZU9KcW5QSTdK?=
 =?utf-8?B?WmdacGpIbjNrUWE3Q1k2Z0drM0RuanpLN2JvMXVDdzVKb21vYUgxRDAyWW1w?=
 =?utf-8?B?QWZiTW1GMER4Z2pSZFlmbXJpVUo4cUJJN2drT1YzVWpKUDRXUmdpNS9IQ0Z0?=
 =?utf-8?B?azJNWERpN2xFdjVBUjVVbGJaaTR4bWVUSit0QU5pdFNpWm8vWlIyYnlNc2tx?=
 =?utf-8?B?dUpuclY2cjF4SlgybHByeTY5NmlXeWNxUXBTL0I0L1JnbVhLdERaRjBYV3lu?=
 =?utf-8?B?Rmh4ZmtGUmovTEVUU1RBMmw4UmlTVHNrblZLUGpGQzVISDBKODgyT2k1VXB0?=
 =?utf-8?B?eUNFejNqSG96TVBXRDBHL0xrWTVLZzZ4NjBBRkhNZjMyRlNOcHRRZkY5YlE4?=
 =?utf-8?Q?+c5KmeIDRkeJ3uRigzDfB20=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca43cab-1337-45be-2652-08d9b96b9c4c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 10:23:28.5910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+uJFSqHquF6WAbAyHm0yBId24qkgwDYsubZ/HXJzNdqKIBVppaQ+9Bc0++WYqNWOagmPn5D1jXvkGAqnI3mgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936

On 25.11.2021 14:39, Anthony PERARD wrote:
> clang 6.0 and newer behave like gcc in regards for the FILE symbol, so
> only the filename rather than the full path to the source file.
> 
> clang 3.8.1-24 (in our debian:stretch container) and 3.5.0-10
> (in our debian:jessie container) do store the full path to the source
> file in the FILE symbol.
> 
> This means that we also need to check clang version to figure out
> which command we need to use to redefine symbol.
> 
> I don't know which version of clang change behavior, we will guess
> 4.0.

When I did this earlier work, it was clang5 that I used. Which would seem
to mean the change in behavior was in version 6.

Jan


