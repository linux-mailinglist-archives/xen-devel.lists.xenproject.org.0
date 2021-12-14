Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD572473EDB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 09:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246442.425012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx3cs-0007e4-8r; Tue, 14 Dec 2021 08:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246442.425012; Tue, 14 Dec 2021 08:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx3cs-0007bP-54; Tue, 14 Dec 2021 08:57:34 +0000
Received: by outflank-mailman (input) for mailman id 246442;
 Tue, 14 Dec 2021 08:57:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx3cq-0007bF-BO
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 08:57:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e8ab7d9-5cbb-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 09:55:08 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-TPsdisXfMJqnaXt14Gr72A-1; Tue, 14 Dec 2021 09:56:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Tue, 14 Dec
 2021 08:56:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 08:56:46 +0000
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
X-Inumbo-ID: 7e8ab7d9-5cbb-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639472209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f/CK4Xg4r9JkrPu6oWc8+6LnGDSchffmw1nI7kyKrVI=;
	b=cCY2kKSZdzpfqmtZluk0kKtSMEWPlrbTiLl1yxfrCueLZrGsUSJw2vtbV4KdhOuvvt1oAB
	TzabybbgfWIfYIwlxgc2s3u9Y0fS5BnBpVbeCVV/qDBvacBAnvbhBSS/KsjRptN/frtk/C
	A9PrXbTzUKe2QfKWtsaGSPaoAtyMIO0=
X-MC-Unique: TPsdisXfMJqnaXt14Gr72A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N10ZBwrHWFR6boOWgsJ6AQIhAUnzw3in2DqCwwGwXHRZhClOicWLY/HmVRRRnGpPHuhv6EBXO2r/9890iORnswRSDaAj84pCfqVtG4jaE2wLmcDuRGY96tdI9HU1zbcabuSj7gTPssjORMaWdkdVGe/GNWdtWwt8kdPi38NxrjrSlHiTA2KFZQj5gp28e+Gy/KVJErNpvXlCOuKUEr4hFqeFBThvW9sz3ehwpry/JVjyx+/nRA+EylWeDAkUks3lV+AwHhIclyGNzB6/F+lBrDYkNOiXcMax7H15yR9vzzl+nCJQB68pfIbjMY/snuyLOw3pPNIBBDb8x2FV9d+MYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/CK4Xg4r9JkrPu6oWc8+6LnGDSchffmw1nI7kyKrVI=;
 b=AjtkSy63HjhZnc3D3eLmTpan+L+btVoqRoacDVW67Zh2bvOu/Qkbl5LCg4HZ9Nm9cKD8GxRRkHL2GdFTgsreQHl1GoLMdxtN9hRH4n6xwkdPKt4Iqo3xHUD5Dk0hfS41H8qT59wB9psTY7Ob9eanA61qsvhaJevPaDMAE8nhylcajebRuAq3miHUdo1HE1fyL6KnIguHkqFRqfna1TdO1pw846o6EORY4ul52Rei/gjhVIP3Z/394rJtiok6K3K3RNsgs3n2eG377kpndIc8DHmcyknE5i9EkKNZh4R1GzL+NeSyFMaD8Gg9kMg5tOg5jvIKmjxJY0DvIDxfL51qCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ad64836-c1a8-cfc7-388c-6b6510aa7bb4@suse.com>
Date: Tue, 14 Dec 2021 09:56:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 05/13] xen: generate hypercall interface related code
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211208155606.20029-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0081.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc3fdf42-1191-4047-84ed-08d9bedfa89c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190AC5F518C0169BC607CE0B3759@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OQ4F/+y2gEwfgeebsQlpepLxAooyz8P3C6S1Qbpmx/fDUQgWbox1hYokRQiV3SqCnQemz5ES1Mo72q4NMflI4+iOSFCno141I12DB9XUrNicqEd2p/oFJItFLt5ftxQPbKXOg2u3JP8oYy8H4BJIsoTEyBc1iKb1CcTIV2q+1ynVFFE3tMjuNHPQ4CikNG8LoMuiHDNGXId3GHd4HTb6ub/adK4HBFRCqopKyMBMy7tkQ7Lh1KYoNSGpE0uAE5I7YI1utylS+uWFu+oJSWE9825xzavkcfkfhdiIP3AKMsM+qrhuOyPjl4NbnMzVhLLLJOhXqqGy9cmHwECl2Ng6xprrckSeDvWY9jMQjCX0IGSiGWEDlqlYGRGTjGA7+D1t97KNTuYarO7RKuzhxkYIGAWvFgml/Mccnzm8hFDZeodk979xeRxDsW02z+GEVRq24ZNZnKPoiXGChqZf14bWkTqbe11lyzawEW7FxV4+yWhvjn1h/IpGpAPlSecM3fBMRerVCHHdVj7oQX760UdpUh0kzOX+O7zCkTayjHxUXfT/X0rRelNjksHb29ZcilCmj+td15GH8LoQbT8R7scqDmN0YPNjMFGOTQ7JKHDtujdcl8hDxNP/SOU/n8Dr/fYLr3EyafWr/kr7VNDYrxGoMSTDynkDkqLKK5rt99JWTqG9m8hh4iBskAoSw9S8nZR/1nYA52ose1Hn8RWbqc4wQaxS2aohLOlZMo35NOSPIuc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(6512007)(5660300002)(6666004)(66556008)(2616005)(26005)(66946007)(186003)(6636002)(6486002)(36756003)(8676002)(8936002)(83380400001)(508600001)(6506007)(4326008)(31696002)(53546011)(6862004)(316002)(2906002)(37006003)(54906003)(86362001)(40140700001)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXIyUDl1aXhpckx3Sm9ncGtjRHprQ01VVWdxa240cG96UjBUdmxIQlJUNXhT?=
 =?utf-8?B?SDE0VXlkWEt6aHZxVUlUK05WSDFhb29aNDdwU2FoZjFLWEVFdjdkbnNwL0s3?=
 =?utf-8?B?YkNTQ09Ha0FaRzZtMlBzSXBvV3dJZjFGNnRWdGl2MHNTRzRQYmNkYzk5RzJX?=
 =?utf-8?B?NnJXTGRyYndvSElLR2RldS9wdzVBM2ZxalYzaE5pdTI3QWhGZWZoRFBRNWtX?=
 =?utf-8?B?cEhGUXhXNXBxVkthU1pUSTQ3WExta1pVR0pMYjZTUFFjVzl3b0dkcUY0YmV5?=
 =?utf-8?B?bUJzbnlIVDVuVVZGVW9TVmh6eG9NQnlVYm4zU0gvUG1JbWNFS2M0dzkzUWx4?=
 =?utf-8?B?Y3o5RnMwYnozV1JJVXdFUTRyVzBhU2MrUTVCY0VMVUpnZ2N2Ymplc0IrbE1z?=
 =?utf-8?B?L1pUeUJBdVNCWnFic3lXWGU1UjVSekNNRElsM1FHUG4yaEw5OXNBb2xXR2pB?=
 =?utf-8?B?MTlDRXBrS0NVMlYyeTRwK3JlUkFSM01yRW55UXdtWmpUMkQ4U0Z3blRwaUlE?=
 =?utf-8?B?aDFEandkS2t5WDhjd2IzV1BaVjd5OWo5eXkrMWE5MXNwNlJqK1pZUm1aYjR3?=
 =?utf-8?B?VENWSXZqa3o2eXpjVlNaWHczdTNiVTZKaXYxcFF4S1JoUW0rd3pnS2VkWEh1?=
 =?utf-8?B?VUg0REd6aC9UYllmSE9CYW5uODhENEtLWW1Qc3d4UXB6UWMrWDZQTTJsd2JZ?=
 =?utf-8?B?Q2dFZEsvV244U0cwREQwQ1BqQTJSNHlPU1Y0eURlSUZnOFpxQXp2aEo2TTl6?=
 =?utf-8?B?ZmZtNDVRV01CRU40R0dPNlRObTM1dy9UUk5wL0FaNFJmb0NOMkN6N1JwV1gw?=
 =?utf-8?B?RUpCbmdhMjhOc2xjOVpQS3JjRytzcnUzbzB1SVAvcXdhK1JZT0luS1pDNGxU?=
 =?utf-8?B?QnE3b2hwMHBZOU9MYXR1YkpON01zQWthZFVNQ0k5V3BZNmpHYWZXdnZVK0pm?=
 =?utf-8?B?NVNDa1BZekxmY0pNNDkvQlhTaG1zT0U4dXIzLzZmUDgxNU95MXZTWFdudmVZ?=
 =?utf-8?B?Y0pZc0hWYmVzazZnVkVxMmZHa0hTMmU3U0c4Z2xmRjlONHMvdGhlSG5DZ0Fq?=
 =?utf-8?B?Rk85RDBWNjFSRzBVOVg0N2R1amc4NktlTkxLY2ZJVlYxVmpJVnFUWWQzQ2p2?=
 =?utf-8?B?cFNnTGU1aVhncndlN1dNbkZZNmp4TFI1Ym5ETGVVbi9pLzdxMlFhSVVQcG85?=
 =?utf-8?B?UkFtOVVTZ2VIT0RxSkE2Uk9tUlJaVDZJME9KY0luY2NsTnBBeVExMTNQWWNI?=
 =?utf-8?B?YUZJbG9qSVVwamUxeHBtODdxMjJYSUhxY0xpaEd0UXgyblAzM0pwVWpoWEdX?=
 =?utf-8?B?R3ZjZUhHMW1HeTg4MFEwbERuaGZ0SGpzNVdxVWhnUVhrbDVCU2JzZjJ6cUt5?=
 =?utf-8?B?N29RNTVjRSt6aVcwc1MyOFZVQjNNVFlvaU1CMk9tUjd4ZGluLzQ5Y0Vudnhq?=
 =?utf-8?B?UHNsTk9nZ2dScFFPZERWcXJURCtrYkdnS2JUOWxCbkRyQXhJRFl4ejZjdnY2?=
 =?utf-8?B?dTZXbm9JcVJqZXJkTitrNDl0OFZtdG1EM2FoOHB6YUV6NFpnV0JLWHd5RFlr?=
 =?utf-8?B?a2w2UVFNUGs2elNrajJCUDU0WXl0cjRYbUk4REozNUdjNHQ5L0tzeXJ5WVpU?=
 =?utf-8?B?YWMvaHZYVTFvYWhoMWZ2MzlVdXQ3Y3JpczV2MndaSFBVcGM5WFlkeklQNmky?=
 =?utf-8?B?UXdHaFJnVWlON0VnL1YzSFA5cDBTeUszdjN2RktEOUlyek1ZL3JIVyt6RFNT?=
 =?utf-8?B?UUZyaWh4MThRbG4zYnlaUHlKM3VJelU4YlNjWEt6bDBMNmp4LzZkNkFmNTIy?=
 =?utf-8?B?UWtRb3lHa0lxQ0FmaE5FaDdPWE5qNUJHbGE1SVpZU0hmcDlzS08xWEhCZG9L?=
 =?utf-8?B?MUlXa1FFZFAzQjEvSi8yelRjZ2FMUzJkZlZ1OVo0SjJ6eEJmUFVTaGFmb3BL?=
 =?utf-8?B?Tk9nUXBhUVdrRHFoWGJWdkNaaEI5MDJDNk5ZdWJoYU5lWXFVRm9rM20yZlBs?=
 =?utf-8?B?UURwS3hEWlBaRzVLUW9FcjdVbDdMUmxFUFZmVlJZVCtKMTJGeDBicENpM3l0?=
 =?utf-8?B?YnorOWo0cUYxbk9nTEo1cytTR2liTEdIOVRrRUZpRTFEM2JoWU9JUTZneENQ?=
 =?utf-8?B?UVZ4anczZFZSUkVMdVZQQXF6ZEl5WkFPMzIweHAxNHRQMjRFNHhCaXpYUk9P?=
 =?utf-8?Q?ZyejfxKPuKNhfL744z0UHjE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3fdf42-1191-4047-84ed-08d9bedfa89c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 08:56:46.7798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilRxaxfsHqIJ6+NbEpydxe/LpEauA7Pt3RHC4I6PCJWA3at457oT4/ooR80PyVHO4N+gbF3nvSgYafwNcmfl7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 08.12.2021 16:55, Juergen Gross wrote:
> Instead of repeating similar data multiple times use a single source
> file and a generator script for producing prototypes and call sequences
> of the hypercalls.
> 
> As the script already knows the number of parameters used add generating
> a macro for populating an array with the number of parameters per
> hypercall.
> 
> The priorities for the specific hypercalls are based on two benchamrks
> performed in guests (PV and PVH):
> 
> - make -j 4 of the Xen hypervisor (resulting in cpu load with lots of
>   processes created)
> - scp of a large file to the guest (network load)
> 
> With a small additional debug patch applied the number of the
> different hypercalls in the guest and in dom0 (for looking at backend
> activity related hypercalls) were counted while the benchmark in domU
> was running:
> 
> PV-hypercall    PV-guest build   PV-guest scp    dom0 build     dom0 scp
> mmu_update           186175729           2865         20936        33725
> stack_switch           1273311          62381        108589       270764
> multicall              2182803             50           302          524
> update_va_mapping       571868             10            60           80
> xen_version              73061            850           859         5432
> grant_table_op               0              0         35557       139110
> iret                  75673006         484132        268157       757958
> vcpu_op                 453037          71199        138224       334988
> set_segment_base       1650249          62387        108645       270823
> mmuext_op             11225681            188          7239         3426
> sched_op                280153         134645         70729       137943
> event_channel_op        192327          66204         71409       214191
> physdev_op                   0              0          7721         4315
> (the dom0 values are for the guest running the build or scp test, so
> dom0 acting as backend)
> 
> HVM-hypercall   PVH-guest build    PVH-guest scp
> vcpu_op                  277684             2324
> event_channel_op         350233            57383
> (the related dom0 counter values are in the same range as with the test
> running in the PV guest)
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


