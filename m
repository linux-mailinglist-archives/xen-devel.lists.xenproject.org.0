Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71845484ED2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 08:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253501.434656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n50wY-0004e7-Qv; Wed, 05 Jan 2022 07:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253501.434656; Wed, 05 Jan 2022 07:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n50wY-0004cK-Nq; Wed, 05 Jan 2022 07:42:46 +0000
Received: by outflank-mailman (input) for mailman id 253501;
 Wed, 05 Jan 2022 07:42:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n50wX-0004c8-MY
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 07:42:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10e00ca7-6dfb-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 08:42:43 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-Z-7P2VWbOQqIyOulViKLeA-1; Wed, 05 Jan 2022 08:42:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6381.eurprd04.prod.outlook.com (2603:10a6:803:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 07:42:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 07:42:40 +0000
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
X-Inumbo-ID: 10e00ca7-6dfb-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641368563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cOyjxSgnVUtjw5WN6/ig+nJi25Soou3eD/E3ggt2ncU=;
	b=gd+QsR3Q0V5owsggpX4R0MwJT+ZJdWJWIg2E05bxdAA9yFoXmvlbR+c+5veHUNMLwoga4Y
	QzifDmhZKJRvOYjv5Uu5+d1e89oS7O/2egxBQTIjuO9b4BLnAtQxowKdtWZmxNDPd4Wnjf
	o/pEti2gB2WdHEK2t20w8jw73k4LFY0=
X-MC-Unique: Z-7P2VWbOQqIyOulViKLeA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeIhgkFEr4Q/1bxIsi/nRVhAyzasZsW/OWnwFmufshv86WquAunVa+xyIuj6z9ZjxbC3hOrsJO0wPDHrVntjHJFuSMCKi3spRG8fS1MbCQWF0zGv0tQswt0m4k3zTk1YvpEPvxtDnkVkIl0loiY98PlfWR/eerTnku6WkcXjhIBltMle1AbZE+SB0OsdplzMgPWMJ8eNO9Z3Mi79i5860j9jLiNYlZnhTNWMMSGflLV+m0C4CiUn7aqTeEZXoFBpc4cIjGCLw0c6qAW8ldtixrfEntx+CnXFFCg8ndssM+wz0PX+Jyy0dzo5ISYTjTIrR4T4k7gScauXmBjifYaHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOyjxSgnVUtjw5WN6/ig+nJi25Soou3eD/E3ggt2ncU=;
 b=Is09twgxqQMGAxauchZd9aEXolxPv6CV0Wv2uGK51rZBhN16jXlMhteiLNAmXGApqN4w++GSl8FZkC40rjBcMj78vQzjJkQ0CYRMCysLF4SI7+AR9PH2E5qQbhAKgY1nunMF7nfUnaLDCXAeKEImJoBipm6/r+sp7PdVaMsmZ4tL0uxwiHw0MPlz6Q9otz+nj5ThWczf///25hjSSbzFEO1gAqjKQ628ZyyiYS9dqqCv/lhH+/OPLFLVqG9Te8XFI/hWv+jy6eNV6H/qsol/KPfo8IwB1+i3aFGkAxN32hIvxfoNBRGm8Hcup14b/K7c8k1zXRz2CT7WOpKXBqjSbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <24fe976e-080f-e6d3-8bee-d0d58119b902@suse.com>
Date: Wed, 5 Jan 2022 08:42:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Ping: [PATCH 0/9] gnttab: further work from XSA-380 / -382 context
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
In-Reply-To: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f1b3924-7347-4604-3ca7-08d9d01ef3a2
X-MS-TrafficTypeDiagnostic: VE1PR04MB6381:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB638191E24D48D0EAA5C466A4B34B9@VE1PR04MB6381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EVk3ZIxIj/Ok5RnViSNX1jhFqvkcz+N+i1LQVAJruQg5AlN7F/aS+23y3cpiZh/DWk682iRhFtzIsrpii/kvbycRSrxxONmGqn+BnVzFceAP0ZyssPNaNQttH7gQW29zk8ori6eQEHG0ixYYSndt4BpIfILk47EIvubU+YqXWdS0wUp0hBmaPRQCH8wLe2ooNmMHJHz7vkzTmTMKOfsxUSiWpuP1GVU9wlLHo3C/6/033AEjcb92Je78LCxh5tZW5f6ptbu4hyryuxbiYcKQZdzXaRgj+o/lKw9sv1AP+05OAHU0ixJ2zAnafcLi00wJdPMiYG7aUjARbznd67uZcEcHFPlECWMTWKDDOWAV80k/+2Gr1LPFMDO0cNqAkTAV3SBnoLOLlwdkd7DGGA1CzAcJju9mZVlECM2b7c9KOfTScbISUqv//1gKOhXy2ICTN2K/xYHC0h29jS5SEV3uWe3Yyeqa7gKr6awidIFaoJr6AJyE9xsdEw608u9s/+ZRiSX+D/8Nipnv0/9wFCjBoWJ1fCX0mCXtm3U+4MCVIfd+nL9zz+A9Dh1+8Lm8umYwLkVDM4HARZRt5Af9UVldPNbeai8DfJuhKJEuwiEEQA3YM/wlCSOSq0+W4uANNNTOqryf6xRcE4O3FwgBgudCpiK9aD3IqWCrCYjuLpkeNGgMhapifowLW8Z2PThYUEMZk9cyp2m+DuUeRlNO1uzwHLLqHW2fN8mHrDF0o7GsqwkukOCU4/O2V+zoq9rHRISi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(508600001)(5660300002)(26005)(316002)(31696002)(86362001)(31686004)(8936002)(186003)(110136005)(53546011)(8676002)(38100700002)(4326008)(36756003)(6506007)(2616005)(2906002)(6512007)(66556008)(66476007)(6486002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFo0UjF3NGd6V2lEcUZwQi9aTmtEa3Q2WnpkdXlSN0RkNXhaN29yaXZBQ1Vw?=
 =?utf-8?B?QmwxSXRFM0pHdTlVdE51RzNYUEhuai9sWnpoWEt6QUFReDZGRVVtZG0vU3Nx?=
 =?utf-8?B?cFFHbG91aGQ3OXR5RGFxdXBvL0o3ZUFIUUNHdHptUmEvUzBUWEhGdnZEbGI5?=
 =?utf-8?B?MEFkMWJ0alZvaGcxVHdTdlRKMFVLNUhQdnFvdGZYTllKU3hrY213eVArNlhq?=
 =?utf-8?B?VnNMaGRIOEdCZXhvaTd0d3VWbGZXRUMyM25TZ0VyT282UERxSTFJU0FvMXMx?=
 =?utf-8?B?OG90RTlmZVh6Ykg1SW5RT3RLdy83K3A5eW9uU2ZmaGU2ZkRld2hpS3NhV2tO?=
 =?utf-8?B?aTRDQ1pYb2J6TjRYS1lxTXI4MXA3dFUydjZhdC9Wb0o5L3Nkbm85eHdZeDBv?=
 =?utf-8?B?VThiQ3NsbmdzaXRGVHFDMERVK3hXVFZrdTdreWVBRmltZVdDVjBxeUR1UkhI?=
 =?utf-8?B?R3M5ZDRPVUFoMHhkemJNZFprMWJHaC96cExJeFo1M3Y4eVlwbzhxL1ZJNk5p?=
 =?utf-8?B?WERKM3pZYno3RXk1U1piZmY2MzM2dGowYmxodDBLNGZub2F4eTUrai9rbGsx?=
 =?utf-8?B?Wlp0NkgzU2xxT0psRWxWRjhBMmJvSm5UZTlUaGIvdVJpcEp2TytLMFVDcEVL?=
 =?utf-8?B?cHljUk9RU05CL2prdGduTEhManhIdEhmaXRCelh1Yy9IWHFxbU5OTzlXYzJZ?=
 =?utf-8?B?bW93SGFYREIxVko1ZXZGbXVmSDNta3JGYnFqaXNqV1E3VDl1TjhNZEtpQW42?=
 =?utf-8?B?WVF3cnZ2c08xajFUZWV3Ym5nTThubDJFM24ycHNmczBqOGxtV0hVNWpRNVlN?=
 =?utf-8?B?Z1ZtUFRrOUgyUEJCSCtWK3U4TEdsN2V0dytTZFFueWNKWVVXamk3SmZXWE9k?=
 =?utf-8?B?cUJkenJqUHhUcjJ1NFdlY2NmUHY1dUFTMG9Ka0pCZjhQQTNSVkRSVjNIUVhv?=
 =?utf-8?B?c0N1ZHNCRVl0UEZneVc3Slp0cUZTa3VsU3R1blU5eUtHR0ErMEhrQmNNbXNX?=
 =?utf-8?B?aWdyNEIraEgyZWwrbEtnUjZMQjdNYkZWQmpEZ1IxU2FBRTNpWDMvWWJxY0Q3?=
 =?utf-8?B?Y0JJY3FrSEt3UmJYRGp3VUhJbklod0VZbVRQbDhCY2NDYTZMU0VyTHVxNzRs?=
 =?utf-8?B?aUJ6UDdvVE5teWJmTGlXeTE2R1B0QXNrQUVGVWhJL3FyTmNWbFZJVWZYQkli?=
 =?utf-8?B?dFlteDhGa3RuK1dEcUxKS1ZlL0lrUldrUDErV3hWOWxEWkkreCtPTkJMQ1dX?=
 =?utf-8?B?QThQVjBmSTE5L0Z6bGFkdTJaQkhjamhmTlQ5VGs5QjBpZGhUclRzbEJJU2lG?=
 =?utf-8?B?ZjZhTW9GVWdXd1ZFSUxDK2tPaGNhTHNwankwZFcrTTY5ZVJ5ZDl5c3ljWGc4?=
 =?utf-8?B?RXFIcTBCQ1Z0K3RoTm9pclQ5QWg0OE92TC9PRjJzdmQ2YURCMkd5SHprVGZJ?=
 =?utf-8?B?TGpZUWFDODA5V01JRUVWV0FLQ2hFN05hN0xuaGFrSjRwVUlvVlkwaWdGanJr?=
 =?utf-8?B?MjNSTXZ2aEhwSm1FVndiZXdNbEtnL2VxaUxLYnVVSTdYbTJVM0Fja3NKWExN?=
 =?utf-8?B?R2V4OVlrc0ZwYWlLRTh2UUt5VnZ4Syt5THEwTG1lblFrVjdoZXJZdjc4U3hF?=
 =?utf-8?B?dGFRQkV4bmZ6aTYydTlKMW9WemtMUFpwSGsxV01CeU9IRVBqSjhLYTJrbnB3?=
 =?utf-8?B?WW8vYXBmSzJWUFAvK0VPcHJDbHZvRUlYdFE2QTRzMlJENXpOTVFmR1Z3TU1M?=
 =?utf-8?B?R3J6T3RwdmZXdUd1WW1ST0FmZ1lDTklGc25hSHh6cFdFd1ArNm5ja29wMDc1?=
 =?utf-8?B?U1FmTkQrZThWVTJxR0VMUG91cHFaVW1BQk1PNHVBMU1DR2poaE1SdURocWE2?=
 =?utf-8?B?OTViOXlNV3ZCTGFXaWRhN1J5SW90YithajJMcitMUjA4NWFiN08zdjZ4dmFV?=
 =?utf-8?B?V3ZXN2Nob05IYkdhb1FWcEQwNS9sVDRXd3JmQ29zLzNmZHhZMnBxaExLb0FI?=
 =?utf-8?B?bUtNYVNLSUMrR0RnME5CcnZ1Y2NJTVBDY2toQS9MblJTdjNCclJPRTNGZFdh?=
 =?utf-8?B?RXpUc0JJMmlNQWdDbmZPcGllYjVUUy9uKzREZVZGRkdZdTlrZFBlZUxlSVoy?=
 =?utf-8?B?eXZvcHluK2hMYklWQ0dsMEpkVk5YU1ZiK1BqL3lRYy9KMW1Gd2pwS0ZSQmNN?=
 =?utf-8?Q?TQ0F1ZTb7iIlibGm9Od/l78=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1b3924-7347-4604-3ca7-08d9d01ef3a2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 07:42:40.6476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTvFQZQM+yrk4eGtkR/W5QW2eQTVVD/PWY/8bPXxbVIrMHFIiszdGTwD6rVeglsZGzx7mzN0XFZtedQJN+GLAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6381

On 26.08.2021 12:06, Jan Beulich wrote:
> The first four patches can be attributed to the former, the last four
> patches to the latter. The middle patch had been submitted standalone
> before, has a suitable Reviewed-by tag, but also has an objection by
> Andrew pending, which unfortunately has lead to this patch now being
> stuck. Short of Andrew being willing to settle the disagreement more
> with Julien than with me (although I'm on Julien's side), I have no
> idea what to do here.
> 
> There's probably not much interrelation between the patches, so they
> can perhaps go in about any order.
> 
> 1: defer allocation of maptrack frames table
> 2: drop a redundant expression from gnttab_release_mappings()
> 3: fold recurring is_iomem_page()
> 4: drop GNTMAP_can_fail
> 5: defer allocation of status frame tracking array
> 6: check handle early in gnttab_get_status_frames()
> 7: no need to translate handle for gnttab_get_status_frames()
> 8: bail from GFN-storing loops early in case of error
> 9: don't silently truncate GFNs in compat setup-table handling

While some of the patches have gone in, and while I realize patches
1 and 5 are controversial (with no clear route towards resolution),
may I ask for acks or otherwise on patches 7, 8, and 9 please?

Thanks, Jan


