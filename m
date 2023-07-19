Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA827597DF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 16:14:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565901.884510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7w4-0007Bq-Ih; Wed, 19 Jul 2023 14:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565901.884510; Wed, 19 Jul 2023 14:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7w4-00078V-Fh; Wed, 19 Jul 2023 14:13:48 +0000
Received: by outflank-mailman (input) for mailman id 565901;
 Wed, 19 Jul 2023 14:13:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM7w2-00078P-Fd
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 14:13:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78bf063e-263e-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 16:13:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7831.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 14:13:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 14:13:42 +0000
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
X-Inumbo-ID: 78bf063e-263e-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjXdc2ltqmJqB+CpLPC1NnoLtiGCOYHOTnf4e1l31+NuoRT6LPtw3YB0+sUiX0JewJeEo7aU1TyTMKpi6IPclqGwvJCFjdXQHg41bc4HqseRex/2UOBIG5MZDMAsI4i+prGtZ0DBmBftjo6HA4TvciE7sKGx0YKbaiDNCYaIuGWijIjtJLVAuhPt6hqAFtrLVrt51HXVW1Gq3lZ7itVFkFIUqoFjYymS7qYFBhlEgxYtH3RwWMURWEslYvIebiHkCalACAPLTb4JCcv14dDkTZgLE0f/Cx8ixisnMvM2hqV0cy8mscoe8QMZh+xafENgFDDmW6vhgTTe2EfYzT8kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1sYICqKnpdu0fmsyevRhCyDcZaOPyWwxqQvjY5Jm84=;
 b=j41qLFYOFR7Sr+WwOWVIIYfN8Nj5S51EryF3J8PE5EAG/ue+rh6W28gY+BZerBjWN+/AGJ82NET4B6WaJmw4al1lZQE89/CEzUwtj7QNCxrD3W5Fj5S8RlqcD+EtPXavoJqSNWPHgjBAzZRtmFuoqdJh5pCh17W67GRCct6OUoBZ2OV4+tnWQArxPVHAQlX5NCzxQjs/p1ftn259ivDW1Ao4m6doItfE1i6Us9tHEJz9Ob+tdLOtLjMtZza/yeEqFBRlw2uae4bJScUsD8eharr58hXGQOi4W9xxT/hyvlb+X6lyuQA/CcCRR51z+uzmrNK8Za9FjnAP54tMNpzvvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1sYICqKnpdu0fmsyevRhCyDcZaOPyWwxqQvjY5Jm84=;
 b=xR6uppPLoBMyVTcc0BytkedoA0btf8v5AfZQbnTp6OcrHZECPcVO1yLaRIRivrCI/GzyCcm8X7fxiv/I/9GtQrxYV+c35TEgnGNtTLh2qW6IrKphLCSNeVy+z2sXvFgdrAMDto3rM3ehrKMXG9Hc27+pPAOhshDD5NpPjxDH5YbH+UsiUcAzsapjNuwDLxfunxIwJttrskCZ4ApoPC83J3wSy2/gRWmFB7pYQG8J8eDf0OqhRiF3EAmiTvuBl9S9RHo+vQ1q8W2NI430mmdR4ykBvksCEplaTL6mcF71+Cx2HyMqO7xeluf7nIQmo3DidPtqUNXBl4uYdGVY8TCzqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2dd3b3e-6270-602e-67ad-b7ddb4b1d96e@suse.com>
Date: Wed, 19 Jul 2023 16:13:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC] x86/boot: Update construct_dom0() to take a const
 char *cmdline
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher@nexfir.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230719131802.4078609-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230719131802.4078609-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 5951e3fd-6bad-418b-4a03-08db88625b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p5cc/tUPRdkCRZerat4A53dAaUSWZg8jyln0FLhGG21KtVprrW7dsbPF1flJqDWGMDsl9rJozgqgUI023gzqLSOP5MTDjBKq/ZDbCEMEB2X2sAjDgd7evHeCa6fxZgc5V5y2qETJIp6vo+iIJYOZ5qXD6RmEel8DFV6JUC2veuWJNoPfed6lSMo454ompGb0hJ6U5A8monfXcSKvmO7mX8N0lkt5RIXOt8rR9LM6jTjV2K3ndia/CMtGstSftNp2G+GhsIJqo+OB8OgsD1IIMFSueuldbB7BPccGOROfdSGGFQ/BbmVuhDzrntjWdTrf8Ir2v+jjtHrwaThf8R0xVmr9W7RDwX0HURwtbSo1E/UXa3qHGxvWAvtjkBuduROQ9nO9Mw23j373JHeoU9hjjEN3PHmQiA0aTBIYp6lTd31WITRZl+0P+fpace7ZCOcVxIv+QyvDKDjTNF/tMX1jAtP6GvrhaD9d7EJ1WMFwuuzBT9Z9OjUBGYWAEN7LNvAp/Q2NH551U6XG08ZivUXMauAyhKtk4+lYb0HxVwwKzvkVo94xpZ+Hc9ecCH1YFYOBKDSZbwOk6zSeQuil2ETx86Vcm1wHP9zNCVC0iq9ouAnSlaRPRw/fIXvxnEg3qDrqpGcXcZWgvVwETkvJL0Tklw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(31686004)(38100700002)(6506007)(53546011)(26005)(478600001)(6916009)(54906003)(15650500001)(5660300002)(8936002)(8676002)(4326008)(66476007)(66946007)(66556008)(6512007)(86362001)(41300700001)(6486002)(316002)(31696002)(2616005)(186003)(36756003)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXRXNE14RnlubHVOTVVXTkgvVzJvYy9rYjZoZ2hSWWFUN0JQckF5L1hKdlRT?=
 =?utf-8?B?U1NaRFZWQldnTUxuMHNUanhaYUNoYnIyOXdIMVR3NWgzK1Q3WGtNcXV2N2Fo?=
 =?utf-8?B?NjZVZzVMS2x2Nkltd0lSTWVOZTBTaFBqcVp3eHJZYW9NSGlpdlprWXJDNnBT?=
 =?utf-8?B?SWw2dTZhekdGSEx2blk0RkQ0b2t6WHJWUDllZkEvOUF6WisvRlRPY1RnYytQ?=
 =?utf-8?B?ODF6S0hEaE1vNmZ0aUc4Y0p3SGJ3T0tyS0hoSmxSVG1YMUJQYk1majhLS1Zv?=
 =?utf-8?B?bHhNWXJOdytRcE55Z1oycS9SdWdrQzBzZUxxNlpyVzYycTNuNkZzMTdYQTBP?=
 =?utf-8?B?WmpZVEppTFJQZlBoZWxFRS8rbmJ3bFo5bWVQQUlNOXVKSS9udnJtY0txU3BF?=
 =?utf-8?B?MnRlajJ3Z09EOEVNVFBiOWJLbDZ2LzlxNTE4NXNzQjRqWkd3eHJoU0Z0MjBW?=
 =?utf-8?B?NFJWQm91aHNBSnlGVFVpMXNGaE9vbGZHcmF6WjNFRnJ1WmxOajc2TzhGaG5x?=
 =?utf-8?B?UE1hWnhqQjlOY25Vc0c1bUFuYlFCdkd0QlJTKzRmQ0pWT1lROU1Ia0lQS2Uy?=
 =?utf-8?B?VGx4MEFORWZPbG5ZN1FMcFhRU0h1ZGpuYmNETEZrS1Arc3cyU2dXeUpGK2c0?=
 =?utf-8?B?MHp1KzVaZ0hqbHV6NnNVam5YeU40UG51VmJDTi96aGhqclVaTDh6Ym53RnNt?=
 =?utf-8?B?QzdmTHE0VEc1dFJ4OGgzZUoxdVgydkc4dHpjTitSN0Vtb1BHVVBQUUREdldL?=
 =?utf-8?B?SnZSSmprSTBIS2hRSmE2VndQZjJUK2N4bm1ySVNZWTFWY1lTbDdlWi8vQW1K?=
 =?utf-8?B?azNNOW9Wa3dZUE8ySWp0dzd6VGFPdFY4SEt3WWxxTXZGSEVjOExiMHVOUEhw?=
 =?utf-8?B?Zzk2NHhoSzR0OHhYMHE2ZnNhT3NUMldtS25jb0ZCS2lBb1dnTmFQZTduVS9u?=
 =?utf-8?B?cHBTWVZXTDFMU3UwU1dOU1BlZjlaam5ET1MvdmNnYnpTOXZjV0NnNjAyajdW?=
 =?utf-8?B?VXF0U2JRSWNxQ0V0VzdwZEUrR2Z5aDRrd3BlVUEwRDhkcmMrRUVmQzNOZVpN?=
 =?utf-8?B?VnFUZUVhc1d2dlhHS2ltRENzY0RhMmFVM3JrMm5SblJ1c3BZYmk4TzNNTjdP?=
 =?utf-8?B?ZjZBdHI4ZHIxeWJVbUZ6bUVpOXNubUc3ZEs4K25QbXM5bndocGxBSy8yTkxu?=
 =?utf-8?B?dkRKNnBsKzFsblFSOVZSSlQrWElaZUI2L2wyWjJnclRIaThaWThlTnVwcDMw?=
 =?utf-8?B?ZjZoRHc3MTFHWUR1NmVzdVZPREcvQkYyK2x0T2ViZHMrN2h1ei80TFB3aGt5?=
 =?utf-8?B?QkFnK2hDSFZsU0dTTzkwaS9majUxWkFZY1NtWnRUbC8rL3RpRWtYejBXOGFO?=
 =?utf-8?B?empqVkViTzdnbTk2TmxFaWhWU1pYdVZBTC8vcStJcmVCSWlIbElSZkdSaURx?=
 =?utf-8?B?UTVDK2ZTR1dKc0VORW5POHdVS2tjempET2MxaXB4c3V1dHRIVjMxZ0NuSVQ0?=
 =?utf-8?B?STdkTWdNYjlBUm9oK2tiZ2lwTTJDcEhlcnRRRzBXRmNNcnZKNjVUaU1FWjdJ?=
 =?utf-8?B?Uy9RY1dXd0R3VGlOV2h5WG1QdHA3V0J6T0Z3RG9FUUhwb3p1MmNuaGVheFZp?=
 =?utf-8?B?alQ5amxEVk9HTXkwS3YzdThha25jQ1JjREpqUGlKWEZxTGxVU2FvNVlJSjFo?=
 =?utf-8?B?cithMlpDbVZtb3cwc0FFVFVEYmxGdmE3Nm5TdFUvZENISXNEOUFWVHZTdzFk?=
 =?utf-8?B?T2NUZVg0amtXR2V0cTZQM2hKc0ZxTDBEYTZkZXBvNVVvK25YRGhhKzhFMTNa?=
 =?utf-8?B?MzUzNHd3c2xkSjErMmJJWWlOWTU1SVF4K1ltUnBIbDZ2Y01CaFBrOXJYdUV6?=
 =?utf-8?B?RzB0STZienhObDlxbEJPNGRTeXB3ZG1YbXB0ZVNYcVEzeTRSVjQyVTdFbUJS?=
 =?utf-8?B?OW1wUi9rUm0yM2dCc3loWXVpNXhsWGgvOE80N3Rmam1qMVZjNVplY1FyNWla?=
 =?utf-8?B?ajhTb3lzZ2hnSExjb3FoZDZRTnQ4enNkNVcxQ1dtNllobjB6TC83Nk5CVFhx?=
 =?utf-8?B?MlAyMUNsTThzKytpaWJZdlB3RmV4YlR2Y2dyZTZLbnNwc29JR29hU2lYSi84?=
 =?utf-8?Q?qJSypXqy9nMxid53zZG4kdIGk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5951e3fd-6bad-418b-4a03-08db88625b8a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 14:13:42.8356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCNknHQvgBHXlyh4uXmNRAVHDk2CiekSyE5XgJ07MbaQzLkwTm8a11YwNyPgY+4M2CjT0ybIIZt/TKAuRqr5kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7831

On 19.07.2023 15:18, Andrew Cooper wrote:
> With hvm_copy_to_guest_*() able to use const sources, update construct_dom0()
> and friends to pass a const cmdline pointer.  Nothing in these paths have a
> reason to be modifying the command line passed in.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: Christopher Clark <christopher@nexfir.com>
> 
> Slightly RFC.
> 
> I'm confused as to why image is const, but the initrd isn't.

dom0_construct_pv() has

            initrd->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));

Looks like dom0_construct_pvh() and pvh_load_kernel() could have
it const-ified.

> This is necessary to make the -Wwrite-strings bodge compile, but I'm hoping
> that a less-bad solution to the cmdline literals problem would avoid the need
> to propagate const through this callpath.

But propagating const through this, like any other, path is a good
thing, isn't it?

If you want to keep it (you appear to be uncertain)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

