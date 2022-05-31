Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C88538D1E
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 10:46:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339290.564126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxW3-0004Fe-QL; Tue, 31 May 2022 08:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339290.564126; Tue, 31 May 2022 08:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxW3-0004Cx-Mj; Tue, 31 May 2022 08:46:15 +0000
Received: by outflank-mailman (input) for mailman id 339290;
 Tue, 31 May 2022 08:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvxW1-0004Cr-NC
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 08:46:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fc62516-e0be-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 10:46:12 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-VLhYCD4QNLC9A2aGCCpjOg-2; Tue, 31 May 2022 10:46:10 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4901.eurprd04.prod.outlook.com (2603:10a6:20b:1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 08:46:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 08:46:08 +0000
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
X-Inumbo-ID: 1fc62516-e0be-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653986772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKY1dVlvPdK3bVGlGUHgCNx1jyaSyO5QBUThZQNC66A=;
	b=OFChTjT+F6xEGV1GPwYznVRQ2/Qel2Oyx9DX5VrjDpKc2fwtwDRxwhw2KQ56qO4l8NBwNN
	VUYMPZ7LGPpl6HzWlADfFJw5XjgWjpT85YDZcKCzcLMZLOnCWpFgzb7TCOD13vzWq7XCK2
	oK770yJlYJZ41nHeXxSMfuk0HeCYoag=
X-MC-Unique: VLhYCD4QNLC9A2aGCCpjOg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hORlFMMdoGURrZAV/Bmq7MtOuWP+kZMMsWrRNiuW1I3Ie/SIxOTwSp+2ORrKr8nQcNAkwrEgXSFzJUJRFe1wX0oiTt85gEu9ugHPVj8YqWrsB4hgk99ruMDwtPuV2sbxqEdK0e3glMbQcArTON8Id3F89WIJyEvWDGfRLcWTw0H9yfsOAWj3LLDbKytRER+ShZfagll27WyzZDCWGbahdIiZdXrVSi24iFY03oHgPyZPOGOVbA0fpFatq1zRay8yb0adZP0PvWYgKH3Xx7alhZ5AB3Cd/tUt7kdjefUcDANt+hZxXM4n8UswoHw2hPv4j+dI+PMPLuEZRxCQsjRTQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKY1dVlvPdK3bVGlGUHgCNx1jyaSyO5QBUThZQNC66A=;
 b=W4sZgCk5D8a0uMORXvATIQxHNNo9t8KoRpgIXNHEn0uypB+FAtQAab0nlgj3FtKhUAOyJdSwHnR+HnbFn50hDeHMQ12WxH76ToYJenK7xhknK++ce2wjLj5ApxE7FPDapmDS29y+O05822MmbSGKcM4HuFX5aY/cUQSy6VgJ8LET01Dc8+9mHgPigbX0lIGE0/TTLme2rzaBUbU9tJE/8HiRXf5ao/Jd5mBxrUipi4cZu0YBgJ9WNuahymXYMu1eQKpIShRQqK3ZGofSKeNCpJzz4ieABlnTCDvA364LT/1x66zWuV/xbuBOTKfKAZMon/adGbJ17b5tRTlVTvx+Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e1dcbbea-e035-9185-f075-dd65ec33212f@suse.com>
Date: Tue, 31 May 2022 10:46:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 7/9] xen/arm: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-8-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531031241.90374-8-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a21caa9a-dd23-400a-6a4d-08da42e201cb
X-MS-TrafficTypeDiagnostic: AM6PR04MB4901:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4901E5B018E5313A37B3FE0AB3DC9@AM6PR04MB4901.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NcHiECoUCexKyHpS929k0qMroup4Rlh4dG+UObqft8LJ08dPO4Rj8+sAC6G3B7AH3biePJgBFqlee8q6//6qaPUAAhH0WuxZzO80KBYMWD2KijuiUF2bxQeC3DIuwxDx7TQVoPArkc/aCsajvydPdv+6Y3LmF0Vs3Ku69rjz4kIkOov3tq8GW9YbBeA2pVcUQ1KGN42Gcid+LPVkIL4pgPmgfNhqrVgDdShBvnngW/dn5zOoRJSTmFUomJCOdmB3JbRNqUMDt3kXQCthWLHSuZQJsw38L9KKsTmL+9p8+V6ZaYZyKmiGVSzWffS0PXxvLVb1wEAJ6VBnd8EOwP4OmXA9mjZF95gs1JY2XdFnWnKCmtpACDUbN+CX6bKQ2oBRdLN405mW6SHHDGFvWPLXaFPCa4Zv7qgyAzo2HIVnJXtZSC7kC1ua3xccKbYeobga+H6GdpgIeJ0qmPMj8SfovbPctFgz+cdhRuZmyCRntsRidybhQkabbD0xRp8CcZmTYVPEF1lxKdWXd/2pcxnQfQO1OQrTPnuOC6y4ebIY/62Y+Jb/f8VXEio6nol0P6xaLcIJwqrHHAVmc/eDwzAZSbIsGUoz2xNH15YVM3VOs6xnQcJHS9as/Fh1s9H7AtjAwz16eKR09NFY5iZVcg0z/gBjPvhhtdhVwObFy336FoulJRCMDcIEzAjlFFLSQLFV0fEauLu5rd2V6X3+YaPVUAck2fM6sAR6XIkWquizD5kNs9WwvDkr+5RUBqVkkB7K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(186003)(2616005)(66946007)(66556008)(6916009)(36756003)(54906003)(8676002)(316002)(4326008)(66476007)(31686004)(8936002)(7416002)(6506007)(86362001)(508600001)(31696002)(53546011)(4744005)(5660300002)(6486002)(6512007)(26005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm1mWkVDbWw1L2RiSTIyOU0wb0xsMk01SnBHYXZSZXZIQWI5Y1ZJUEVNc01x?=
 =?utf-8?B?dUlsUUc2d1lsODkwbHFTaHhZWWJ0bVlSQVBjbVR5TWJrVUYxT1gzUjZYRmV1?=
 =?utf-8?B?OGtQeEhrMkRsRVBRdUhTRDVlVGh0QU5Ea1lGVVBNQ3NZem5sWFBRZmQ5RU1T?=
 =?utf-8?B?L1A3RnR1U3Q3V01Tc0lzb1RKVC9FeDZmVTVyL1NHN3o5Y3A3am1tK0cyUmt4?=
 =?utf-8?B?a1R2d0RhbEZIVkVtUnNjUnRTOTJTdGNpQWJQVW45TU43NWhubjd5UkxoWVov?=
 =?utf-8?B?L2liWVExWXFiYityWXEzYnVsUzMxNSs5OXVNVUVmT0pwcS9IUHVZZEhLVVlJ?=
 =?utf-8?B?cXVaNEprVU8wL29NMUZKK1Nla1FRR0lsdTBZLzRMSG5TdmtETC82V0E5L1Jr?=
 =?utf-8?B?bExxWmJ0dGg4eERMdTR1RE9JWXV5TFgvVk04S3ZqSVN5MmNuYjkzZVp5ajJm?=
 =?utf-8?B?aFZRQ3d2c1dYQTFGTDRSRGNpM28xbzZLT3d0cGw2Rk52V1hxMWRaeHFsV1Bh?=
 =?utf-8?B?cHBxVk82alNvUmJnek45WjZiSWxsMnBJV016RGdSbnhJN2orcDBzL2ZJbzNo?=
 =?utf-8?B?YS9pZjY3TjFROGhZUFAvMEl3UU5xaUQyS3BMSDJuMkxaZkNVOVFFWmkrSXVI?=
 =?utf-8?B?TXVRVERLeE9xZi9zc1JEL3JGdXVzNm1PdTdNb3krWW1qRTB5d0hnVUN1UHh3?=
 =?utf-8?B?azNHTllrSkR0NWVBQllsUGNOVDBDbXhadjJGR3YxQ3hlaDlCeFRRZ0lkMHBO?=
 =?utf-8?B?NFdDV3pJYkpqSE5xQndMb0tsc3VmUlFydm5FWWQ1SW14bmdGUCtLVXRRaEQ4?=
 =?utf-8?B?NmFDb3RobVVDT2poTHBNWTU5YWI5V0NyTEFaWHpqQnh2UE1TTlpzZ3kzVm5a?=
 =?utf-8?B?Mk9ZMHBkR2NnalB1VUZsa2hxTUlCY293TTJ4bURubXlJVDE4Tm4wS1V3WXZZ?=
 =?utf-8?B?b1lmUEF5TG4vNlF1WjVZclJ1ZTZNZlZ5bVN2SkVhZGdlK3puWTc5ZUVQYXFN?=
 =?utf-8?B?eGowbXRDb1hmSmVvRkJkbTdEQ1NrWFFudDlJYVp2ZDRxZW1DMkpyeVNHUlFB?=
 =?utf-8?B?MjQwWFJXNjZvQmpLOHBVV2pqcjUyb2dwcVpibEZFWWp0YjVFVmNMSlFVbzMv?=
 =?utf-8?B?b2xzUERBS3lYbnErdzBZc1liSUNTWVpmRXlPTmNXRkQzR1pJRHFXcUZ4NUFz?=
 =?utf-8?B?S2RhQ1AwNFdqajloUTY3Y2JibGN2dm9BODN1VURZS3gvVkQ5UnIyVGJCc2ZO?=
 =?utf-8?B?dHBlSHNkM1lIdUJLQ3BRY0NXc0x4dDE2MkNJNjk1VTdqcGIzQ0tOT0dVY3Ar?=
 =?utf-8?B?akI0R1NoczFBcHFwamRHRVBvYkFmZEJ6SDBwT3N1NDlOVC81UFoyTW1JcVdp?=
 =?utf-8?B?VmZnRkhXSG9Ka2E1YmpRU3l1ZXMzbm0xaDhxVGhtcGlDbGM2S3QrbTFDQm5P?=
 =?utf-8?B?NUtvbXNVNG82eG55dlhzV1BuODVaczNCNHRvSFY2MkFrVDRoOWpBY1lnVTIz?=
 =?utf-8?B?T0U0U3g1RVRyT0lLdmpjam5mdjIzSXd0REZhNStwZlBLOXlhUUpwMTNqRjVR?=
 =?utf-8?B?Tk90NDhqSFBWcFFaQi9ETExEbGg4N21DZ3FRWmFHUnVkY1pWVHQ1RW4rc0Vl?=
 =?utf-8?B?UmlxNnhyZTZDdFo4RWVsd2FHRGFaRmJ3cDRQOVdjSzhYellYTWNxV3RuNktp?=
 =?utf-8?B?RTNTYjIrejEwOE9zKzg3d25MMUNXdCttcSt2dDhCMTFvL29Rc3JwNmNUbGRp?=
 =?utf-8?B?OWRObmNSdklUTTM5c0doaDRGMTFBNjlIVnVLRldrZDlheVdkZ282Wld2cU1a?=
 =?utf-8?B?TXN6UHJBdjByZnczTmJTcVBneFdoQWEvWWEyM0FWYk1VTDJRYlBucnBnTi9Y?=
 =?utf-8?B?bXU0QXdPcEloL0RTQjZuM3VvMFl3dC9tODhVWmJ1L1Jhc01NSnRJV1p5Umtj?=
 =?utf-8?B?NldLNFRyNm1kd05SeVk3UzVJdHdVNVhMNlhoUE1XbFlzUm4yMlppU2ZwalJL?=
 =?utf-8?B?cHZ6SUlZZm1PWXFGNUVEZ0Q4d20yUE9rMUowSW1ZMkhLK21EeHBOOEtrZ1hj?=
 =?utf-8?B?a2VUL25Xd1lhYk1WMnhCbWVuWVpuTUNNUDR6eGN6cUxQc3JHSFJ1MjN4dVNU?=
 =?utf-8?B?UHlYNUhJbXE0K0IwWHlIWEhMUWFIN0R0WFZHVUhEdGhldW11T2lNajBpZHll?=
 =?utf-8?B?RzY1NFlkN1FqWE42US9ZYmNCdkZXcmM0aWVQRjg2VkdOSHJzZDVjekxaSDFi?=
 =?utf-8?B?ZjMyT1JlbXdTTDloTzlSQVBmWGZnNm1Tem5JdzdOSC9PR2FCTHAyUGVVdHF2?=
 =?utf-8?B?YU5BbzVSUzJlWHN3cHZBZ0RwczVxcFB1TWF3VDZXUUNrSUxvM0NvUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21caa9a-dd23-400a-6a4d-08da42e201cb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:46:08.7434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z56bD5xNuRO+eOoymjfvfY2AEN/ixWfn0nVIGmxQZTtuqixuDHtOxBUTeGyFooMHMmXXl+VCjFXFW3yS7bToQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4901

On 31.05.2022 05:12, Penny Zheng wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -381,6 +381,9 @@ struct domain
>      struct page_list_head page_list;  /* linked list */
>      struct page_list_head extra_page_list; /* linked list (size extra_pages) */
>      struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
> +#ifdef CONFIG_STATIC_MEMORY
> +    struct page_list_head resv_page_list; /* linked list (size resv_pages) */
> +#endif

The comment part in parentheses isn't applicable just yet. Please move
that to where that counter actually is introduced. While this may be
in this same series, there's no guarantee that all parts of this series
will be committed together. With that adjustment
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


