Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F07D3B0B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 17:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621566.968151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qux1y-0004Mw-91; Mon, 23 Oct 2023 15:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621566.968151; Mon, 23 Oct 2023 15:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qux1y-0004Jc-5d; Mon, 23 Oct 2023 15:39:50 +0000
Received: by outflank-mailman (input) for mailman id 621566;
 Mon, 23 Oct 2023 15:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qux1w-0004JW-5E
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 15:39:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 651cf1aa-71ba-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 17:39:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7993.eurprd04.prod.outlook.com (2603:10a6:10:1eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 15:39:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 15:39:45 +0000
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
X-Inumbo-ID: 651cf1aa-71ba-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRLUgmAOUgLAaFvRcWQnRTrxz1LiyRobPq7UYfBs5zJDZ7SFfeaUqWpIvmnaWgF/+sbJOtdAPW6SAl4aHsbMKNojIYfV35PR7CMLHYf1Juij/trhV4BUWBlos0jUByTX8KWV81GsSBuw3/PRbP1TKF/NU3d9BVcJXZsyDjSE/CqVG03N6DZE/38ua30y/XbJcBkz8Z6Pq/DTvzsUrpzv81Uq2eqYqDUtcMpJ7jlS0sYXO7RqKHtCSrP9WpA7dtkWvTEHf+9Qn/VIFU/nDEOhakr879X0A94o0//ya+S7npBMQXzO1Oe86zk6hjBJ++6M3RKUimEutmt0cJ4ThSEb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FosA09L9UM+5g8MR0p36ZAicTilrh6jSWEM4PcFOHsc=;
 b=DirLZ31s2uneh4NXJm50WunUQnlnRTtoeWzk/Is7fc9qmfXWJrNqczdAOxjPi8jc7nf5nyHjhVrvHiLEuTiei/7fnvTIPpOqiiugEFYmh1mthR/3aXmp5eTrsqEUgyEt/XmWLHi3yogrFSW8JY0U/gaAPp76LVKw1IowjiAu+WL5xXVKiTXr9ZxVnoU2i5lOmdSK/Uzq2KrZPkw1xHDBJbHyocRqaopd2YzE8nGJVD6ofAdnokENsnZfRr0/gpeU07wwXSCBO9qnZQv0m44w5OVqfyIu+H60rhRpESZ219iBBm2QcibqzX7nT4yCCQsVEmo2JqbHNcWMvUF1FlHbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FosA09L9UM+5g8MR0p36ZAicTilrh6jSWEM4PcFOHsc=;
 b=ayg/GaduxVewa1DxddllILd6v4cfPMsVBuLD8bm7IFvoh2DlQWh0AjGfm4R/3A03qNNCyN4K+raMGmPJFCnzDnIy+fWc2L64sOv8lERt25kkN6j6SqW7jD9Ox0My32ZpBgORc3f6ZXk3Ort2hW/FAmOl0ZP+FhPvbA6Q40BXmv/bn3KPTr0OGgcsjwQ4QYMMA6wS8aLS6w0kz2zTEtrWzmqNpOSv0I4wtCaM6bkn7J9xX89gr37RScBu2xT/Erxo1V1XiI5haCzNAe86amm5y1mc2jEobKvZht7lKIpKwWG5c87nAUj8k/DRiFxsJrxqL1pzrCZiVt4xQE7EoBbLzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3045d321-c72a-36dd-baae-bc0f685a9c46@suse.com>
Date: Mon, 23 Oct 2023 17:39:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3 5/8] x86/io_apic: address violation of
 MISRA C:2012 Rule 10.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
 <4db1f326a6dec164e2d3536caaedd9038407a6e7.1697815135.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4db1f326a6dec164e2d3536caaedd9038407a6e7.1697815135.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b4aec0-d82d-4c52-fe94-08dbd3de4823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QZGBFuqsWoI9J3D2xtUTGP0E+dGqFwh+V37eVapWkQjN9dPHR9UvhsDZYFJWmtvMy6WC6+X5rYV8H41pEcVGUeWhwA3MvtkOAeDM3h+fN60Xc0fIt3LDg+Exf1qx9BmfAVCwKwUW2smDYCdO2/zi5yzxT8VFq/dZoL3/gMqehkgeWuY7wiWT1t9M9QnOF8WqKfzJ52lnI3dz7wDWFcGb7hKMG1W+jRO6fXVOXRzNPIqhCZdwTrcVteLfPD59mXeWFm+lsB+A8vwfrDycAr7HaAxfhpv8oJ7R5B9XSO6FasU/FuZ/nV9jWaTeSmQ2RWiBi3a0/jKWyryivmtwscDucg3DgGzMD/dz9IuTD7Phxc33E7dWYS/SO/gpvzdrfFTXmHZW2EVHqdWnMpf7hQIUg0jfsiF6Ir4ZtzQ+5YZiQ71RvsMbdwtL4IhltZXHirp+MJj82Bpodb51vulR9JBn4IMJ+0jKavqsUT6Nkdtk81xKW5a6AEOEsP3I6KAW3Nlufzmi48CcGL2TVnL6nLpLqC0GJGiVV/Ub4E65ieJIYsjNcYiz7yfH8SDdApFGr6l6tdYK9a0dDJZtnrQgD2ZKiHa0T07l4rXr4pHbmEXPsP4zUsXIydgieB1INzgvC+NHJtdLkKp7qPMVBrQMehAbWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(86362001)(66946007)(66476007)(66556008)(41300700001)(5660300002)(6916009)(6506007)(31696002)(316002)(6512007)(6666004)(6486002)(478600001)(36756003)(8936002)(4326008)(8676002)(7416002)(4744005)(2906002)(38100700002)(2616005)(26005)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1hkNlFBZExXcTdGL0pLeVdvRVBSVlZBMklHTGNYQ2pGTXZaemx4eHlkdnJO?=
 =?utf-8?B?ZDh2T3NaRzdvRmpJaGZDVVk4Vk1Ga2RjczFiRTM5RnBtaCtlb0Q5TDFzMVhL?=
 =?utf-8?B?S2ZaSWpqdGtCNThVRjFDTDBUVEcvSmVaQTZsMjhsWTlZOXRVSVovY2pXL0hq?=
 =?utf-8?B?aEZpN0RrSDBiOEwyc09iVXZlaWxvVWpBakNrQmNBamhoL3BhdmVxZ08xTlo5?=
 =?utf-8?B?bTRFSC9RRzk5WXBVVThpV1VnQVRsQ3h3bENxekNXaFZlditVczY4djlBNVYw?=
 =?utf-8?B?RGx3dU04cUVoaDQ3L0VEQkdLVzc0aXF1SG0vTEVFdjNySzE5SmxSN3U2TEZl?=
 =?utf-8?B?WGdRS0w0ekd0S2NsNWNGS29DVGxhTGFPdXowUlF2REFLbTVlNWpqTUxubjdT?=
 =?utf-8?B?ZkJtNElrR0RPMEN2ejNiaDRZQkRvQm5kdEFDdTNhZ1dnZVZQMjVMemEvMXNM?=
 =?utf-8?B?WjN2Y01ZaWJiWXNaelhTNzJIa2x3alR4YzN3dTVqTVZkdWNEUFMrR2liSm9x?=
 =?utf-8?B?empwVlFtR1NONU5ybEN3dWhDdmZ6eXZBaUtQd0JSUmQ0bkgvZ0lTWGdXbGVU?=
 =?utf-8?B?SkJEVUVHcGtDL3ZLUXNHSVFhdEp5OUFCTHQvd0dXTXl1QWdBSHVldmJHSUtU?=
 =?utf-8?B?dE9nVVVzUkVUalNIdnh6YUE4NXlKdzBaT3FkU1FYbXoxQmtmbTMrUFIzRStW?=
 =?utf-8?B?dStoL2NqbTJHOU9saTJ3NHl5cW52MWJ3V1VHYTRoZkFHY3NxUFEvZmE2OE5T?=
 =?utf-8?B?d2loZVhaMEV3cUc1RVJRdmpZQnFaR1ZwVzVKQkplbjZoSzUvUVBkanQ5TGNy?=
 =?utf-8?B?RTh0aitrd1FRTFVrYTJHcGsyOWJHYk54TVQ1bng3Z2ZDSmxteURKZjFqSk4x?=
 =?utf-8?B?ai9MTkNIWTMvdG1TcXBqU3N3Q3hUMXllK2hncWpuaGdpRHJOTGN0OXpOVjBS?=
 =?utf-8?B?UFpNTUtJU0JGL2I3Qnh2MDFVUWRqdkhyVTQyeDRvSmp2Vnc0U3laSkZ3SGJl?=
 =?utf-8?B?YzlHcUNLZ084Sk1zeUdtbVFqMndNQ29sNDRQWm9nQ2o4allKMmRjc3I3V3Qz?=
 =?utf-8?B?b0ZrM2FDeWR1YTd1UDc3RGlYVmpJTDFmMlk1OXN6UjRSbGxyc0pWUTR3YlFK?=
 =?utf-8?B?QldCcTFBYkZQUzlOZE9RYzlCQWJjYmd6TVJwb010R0hxdkRJN2ZqUHN6WG4r?=
 =?utf-8?B?bi9lVWFNdkkvUTkyZGJDYTVZaEltQ1RnVnZ6NDJUbFNFUndGaHA1c3h1NW9n?=
 =?utf-8?B?VE9seW0vNkhYUlVRc1owSzQ5czNFL2dsd2pTYWMzdEw5S1k2S2Nkb1lVbytx?=
 =?utf-8?B?Qzdkdzh0ZFN2enNXZ3Q2SXQ4SGNTbjlHTURRTFhVQ01GVlhXQXh6SzNWdXhr?=
 =?utf-8?B?MzhUdDhwY211S0NOVW81MUJXNk8rSnNyMWZmczlSOXRtbCt5TFpqVzVmL0lW?=
 =?utf-8?B?NkF4cyt1QTNPclpJYVBIeEY3MmlaRk5VV000T0tWaDhqZXF0eGNzeHBsb1Rq?=
 =?utf-8?B?cFBoQnU1T2xaT2Rkb01YclZ4ZDh4S1dZeEVBMzdPU3ZKUFNiWUJzeFhNYWUr?=
 =?utf-8?B?d1VNUk51ZTVCQndYTVB4R0Y3THVXM0RNQ3I1OVluUXRBdVkzZGNoVkF0TWR4?=
 =?utf-8?B?YjhJMlRNa1UvczR4SVZYS1oyMkFmb3AxK2JDVmVycmdEZHBIUWFwd0FRRDd5?=
 =?utf-8?B?c0NtOGM2K3ZodkEvQ3I5OVJyTGQ0WUtHWkNla0xNMU00SDNKZHhUdG9xVThu?=
 =?utf-8?B?dWRMNmJidktySzVCY3RvVkQ0VmdrUEhzQXNLSVBjcXhsQVVLUzNyckN2dDRG?=
 =?utf-8?B?MXNITEcxSlo2YjViQytzUnkrK2ZNZ3VUN0p2R1BpMGZlejBDZVpaZThXT0FE?=
 =?utf-8?B?dkVRSThZY1l3bVh5VDVSRnh5ZC80WGpHbTFuV2I1Y1lQeHR0YTd1elpYWVFO?=
 =?utf-8?B?Y1JlUEZ1ZGkwc3krZmhxZTdNNkd2ZGNpazZZZnpObVNJdmgrT0g0STJleFRy?=
 =?utf-8?B?UG5pMlI4Rnk4Ylp0RUJZYk9leW01TE1sS1ZNdXF4WHBJYnYrM3JpUXdsTjhH?=
 =?utf-8?B?c09MandRMmZUN3ZKQ0J1NjlMeXpHYjFuazF2WUxRY2RWcWxTclEvZnEvVGV2?=
 =?utf-8?Q?NNJydBA4midY/Hvc15bUE9XU/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b4aec0-d82d-4c52-fe94-08dbd3de4823
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 15:39:45.1254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54nGHGcEYPco6jXFoHolEt+fCl7XUeV++98q4aSer/WqzA4YY3gVjKTzr2LZggX0XH24mV0L6z31t54r9NGuHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7993

On 20.10.2023 17:28, Nicola Vetrini wrote:
> The definition of IO_APIC_BASE contains a sum of an essentially enum
> value (FIX_IO_APIC_BASE_0) that is positive with an index that, in all
> instances, is unsigned, therefore the former is cast to unsigned, so that
> the operands are of the same essential type.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



