Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D8D50675D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 11:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307889.523249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjky-0007N2-1y; Tue, 19 Apr 2022 09:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307889.523249; Tue, 19 Apr 2022 09:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjkx-0007L2-Uo; Tue, 19 Apr 2022 09:02:43 +0000
Received: by outflank-mailman (input) for mailman id 307889;
 Tue, 19 Apr 2022 09:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngjkx-0007Km-1V
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 09:02:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 785b93ce-bfbf-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 11:02:42 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-NEtZZWjNMOexFFhwAEJvmQ-1; Tue, 19 Apr 2022 11:02:37 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR0402MB2930.eurprd04.prod.outlook.com (2603:10a6:203:9a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:02:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 09:02:36 +0000
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
X-Inumbo-ID: 785b93ce-bfbf-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650358962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jt0RknuV99Mj9cCd8QTaNFDAERTxKaglg8gBpbdXbLg=;
	b=Wsqk0vAaVJhJLNQENwU/UC4IKgnUP+gAWdHg7ssG8aXru07rX34W4B9HDiv9QtnXITkoDB
	Nt2pYPNtolCg1ULs6Sbi6Ng/2tTkDrzxhjDG81z7le1EDD6f/GaYgZARDFrgWQJU2fNldG
	Ps9qDUX7xZkR1BHcHHz6qflY6GSFGCU=
X-MC-Unique: NEtZZWjNMOexFFhwAEJvmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFPKad2H9bmWgsH8IjxEhrStB47Ag8U4ouOL5ByWwBdcqyVxhI0/fwMC1f5QeY+KE8O70P6UqhZ1cRtVukjve+cl2Rnbz57g6xbzUDzSA3aJluE06VS+kRMMkWrl5CVnjkABQLp6blRcIpCTT1S9lTJFO/px7McO2XYipYQa+qick0ZJI/TxkFNs+1BfpYMXW8K1ziY3NJWR4QoQUo5+mbAnwnh29LKbS5zq3Gg5x0ARngoosFMIBRt4Bw2nrHnZ36UudZk7YNRptZyiUpdu8vqAmKJIV9hzWnUX0I9SKhu7tvQD3yf6qpDZfaBzZTIo0d9BjmDZ3JMM/qXnPISFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jt0RknuV99Mj9cCd8QTaNFDAERTxKaglg8gBpbdXbLg=;
 b=nI2rHQF7Y8qCJPmbTJpTx2Y20M6saKwabmT3+Vf6LyiW3ld1wwKpBW9WGG7bQruw70J7fY53kkhHgEKW+NBMlY/GIuFWOa+1sVRxIYXO1IVqUOYNtllPh95jjNSLBedI3iNtAxtkilHRdIHsX5TRb16WgJgDfm0o4wq8fqjRMB0k/3Ii8/oUJ5Y7Sidh90ppMk7WA9HduE0nL9psNOBTRa5B+TCRijBS0YgfbHElMwTuqEL+ywY8kKYlOopGNJEuCWNZVgrtTd5Khj+/2G1YQzqa+a2Wn1nrnCspP5YSqngtK2W/w0r2FUqmVfTLG1LFvHzFneTUGsuQsMU0a1AHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc74f91a-ce7b-205e-d3d7-35bbcb5c9504@suse.com>
Date: Tue, 19 Apr 2022 11:02:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/6] xen: add field "flags" to cover all internal
 CDF_XXX
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
 <20220418122251.3583049-4-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220418122251.3583049-4-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0273.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8610cac2-b5e5-4b5c-5dce-08da21e358c3
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2930:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0402MB29304A40C010863B13EBDF57B3F29@AM5PR0402MB2930.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ij+bscQOza60biQuWMMcyqXVS3oiND61avM40BZo4Hu1b8aN/0DKUNc7VjoB8cL4MaJnaK7KE34AK1yIAXwQ1MIe8bmTTp9BAS/O8dYUflTBiFhkncajSr8dX6j1Msq480NRwI5oQryITBsPNmPc1IgNSLRiHoobu5LYoHmLjsC3+TJuT7gwAOQrJxHdTuqwLXUf5uTZ9FkcX5TYFtEf2xHsI+OjohGl9MMEbjk3oWg8EpuAWq7bymibbuzpnRS3OiDTJEJRahlR5YtyKG4AVlGzcJJBW5v6w9dro7+I3dYSPE/z+hfUk0ALy/yvXS1Gh55NgcG190ou7fHVR/AZMLe86hhgk6GhxAkl9CK2Kg88Px4usVKHvtaIGKlGtOWyyhq0mS53Ce2FawRZRtS0gYijeiQhny+wMKhAhOjRVygrteBlnNofce+2XZ/QhhDEuqTdGmBQpi8C8N3A1yOCgy4xrglWGZHort1kOqecCIc0rR6l20Ew1fRnmGxfQwIMgl09+3lNRREh3Emo3XXsbJV+tbhn2rG6MkS0zWrefRaGq545yYv1dJsqQ1japPa0BsAKL5gTw3V7xJ6tYQPQ9ga822NHAVE6/+wci07JFm33rL0dDiGNKoZblkAXCercLOTdYcNMeG114i7+13lPbDka9v/5Rqu4je/CrmruN0ElSbSCFssXvHpIvUAs1Sa8jt+NjKN4+E7pjHEsn++UWoI6TDoS6XfV5oVOg5XkOJxqzfb5V5+Qj/zMUOiYtifw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(7416002)(26005)(186003)(4744005)(66476007)(6916009)(31686004)(4326008)(66556008)(54906003)(86362001)(316002)(66946007)(8676002)(36756003)(2616005)(6512007)(5660300002)(38100700002)(508600001)(6486002)(8936002)(53546011)(2906002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmJTNmZQMWdXcFlUSjlvSW5oTktjTUtIYmNzdDRIZ29rVksyekUxQ21zZ0xm?=
 =?utf-8?B?Q3NCWWt4S2ZONUw1Yk91MmdCS3dYYUd2VXJLWXBvWHVkdHhyeVUxbi93bVJl?=
 =?utf-8?B?QUh0SWJraXRTcmI4S09aZ0ZBVVFmNkxXVE55NE5jeTlMOFJ1ZmlIMXB0NVF2?=
 =?utf-8?B?ZE1kSGU1bWVhZitzSkxJa0h6dC84aUI5cktSZU1sZWpJVHNlRFFoZkllaEZY?=
 =?utf-8?B?eTlxMUw4RjVzWWNVUHFGOTJ3aUhLQ1pLSWxXTjhUaWhaMVV1czBmWmF5YlFi?=
 =?utf-8?B?bERkc0dyVE85M0g2V1pIZm5HVGpKVnBoa0JiY3gzZE5jRWFUSkR6aC8xT0o1?=
 =?utf-8?B?WTNhSXZBSlZYRDdNa2d5L1lsbGRucHZ4dWlxTUJkWEdkU2gyMUV4QkxNRUYv?=
 =?utf-8?B?c1Vxb2dKdnU1SzRMQlBlcDU0SXl0TFFVeTA2QWRWMmdvYXQ5WHlQNU85MjA3?=
 =?utf-8?B?eXFsVHE5dGhuV0tzWnNlN3dDZURpWmhtU09xQkIzOGt1azg5S0dKUkxSYTJm?=
 =?utf-8?B?S2N3b3ZOUjlWUWFiUVQ0ZWRQOG5yZmZ6YkQwMENqTXppcndhWGZwbHB4Y3Aw?=
 =?utf-8?B?d1ZNZHBuMmxONXE5Q25ubExyWVRPSW1abVdOZmhHQnk2ampBZWc4UjFqSkRG?=
 =?utf-8?B?ZWhnUXJUNG1MNTZnK3dPNmQyNkVlTDBpOWM4UHhRNG1NSnN5aHZUVE5SMFNM?=
 =?utf-8?B?dkhlNHNOL2VsMTdxeWEvOTNqT3Q1aVBQcmpQOGg5bDRBWWtRcTVkdytaaUh3?=
 =?utf-8?B?czdiUXdRNG5NNWVIM1Zlc1BSdVdDV1c3eUUrMHhPQytpbmp2bnFZeFM0am8v?=
 =?utf-8?B?SGtlYXZhWThmeWNGbXZ6Rkt6TzdHWHRzL0ZDTXg1UVFYSUQyNkIzdEF6d3o0?=
 =?utf-8?B?endTMGdDMm9WNlpWbzNDdnZLNEJpRi8rKzRDWUVaUzN6RDNqaGhmdVFUd1Uv?=
 =?utf-8?B?eUVVNmcwZDFDY01YbVNrWXZ4SFZhOGZxTU8rVlM1bE12dWtMRlpxQ2M1S3lG?=
 =?utf-8?B?LzdKMmt3bXQvVm00WmdtL0RJZEpHS08xTHVzNmwxNHB4RVM5dUxmMXEwaWJ4?=
 =?utf-8?B?OHFaQkhNakFYK2luQ215RndWMHN5L3J3WXVrd0gvN0toZnFZV1IraTZjS1ox?=
 =?utf-8?B?dkI5YnlGb0ZFY3gxc0NtMmRzUDZvdlJteXlNK0tvY3I0N2l0amI3TDBabmpM?=
 =?utf-8?B?QWovcFBtanQzaXR1YWJBSUU5Y2djaGViTG53NXl4SkxOMzdsaW9pcE5OdXN3?=
 =?utf-8?B?WlVjSDNuRXNrenZESml6c25xSVdvWENPUkNGanBtTzBzMWNqd2ZCLzhVNldv?=
 =?utf-8?B?YmY4ekxTSE95MTQvenFRQ01OKzRpdlZud0o3TVUvNGRRbCtab1FwM2xhUlBZ?=
 =?utf-8?B?bHZ1M2w1S0JqRGlJVzZudkI3bnExSEN0MnNVL21qMTcvYkVvOVBVRnhtWVBs?=
 =?utf-8?B?V2tPRXp0aGE2b0ZUNXU3QlF3NFI4czdhQ0hIN2RWeWY3KzRPbm9GejAxejN2?=
 =?utf-8?B?eG81b3hyUWV4WEF1SzRxS2Rna1lNbUVNajFxVjFleE8rSDE3YWI4R2s2ZHZP?=
 =?utf-8?B?OGhvQTlaUXRwTGRuN3R3ZFJhVTNKMHpiZDVPRy95M3FOWHR2ckdPOE8rdHlU?=
 =?utf-8?B?RU5vSGI5M2NhR1R0VnBtazkrRk01NDN5VFpJVlFWNVpCMU10VkY4bmV4Y09j?=
 =?utf-8?B?TGp3M1NqWkx5Qzg1ait2ck0weCsxbE1LdjNlcDFFUnJzMU1zOWRuSkhZa01s?=
 =?utf-8?B?UGlOVkZUTHB1UVVjRk9hdTRtZWQyRXdRamU1S1VoaGxpdXRicjVqcXdXbFBY?=
 =?utf-8?B?TTdMRHI5WVB6SngwVENGaEJBVmlOTzI3aEJmZiszZnJ2SHpKUW05QUFKMGNB?=
 =?utf-8?B?a1ZSZzNIbm5nRXJRS0FqWldpTitXRnpNcUdTRTlSaUJHVjV4a2V6MlFlRGdM?=
 =?utf-8?B?RXBHcFk0eUYxNWFWclNYZDNYdmg4WlN4Z0RjcHloZVB3NGdXWm0zS3BEUDhp?=
 =?utf-8?B?MmN4SjhFR3E1NmJaeC93U0V3MXhvNnVyNXVrNmhmTHVCSHdIS0Vva0k5bk12?=
 =?utf-8?B?a0dkWlBrR0JJYVBiMW1tVmwxQ1hjeVl5ZTlNRWdxbDE5dFhhVi9VRm1wT1BR?=
 =?utf-8?B?aDEwdGg1TTdtUi9nS2pHZUkyeDlvRUc3ZS92WUhYUUZhb2EvNjd6SWxoTU1r?=
 =?utf-8?B?ZUQraUdocFlVaTA4U1FsbnhmZ2x6WVpteSt6Vmg2MmpBV1doYXZzSU9MaDg3?=
 =?utf-8?B?QjlzeVNGM2dTNFlTbzlyNEo2MHRQNmVHV2htUHVKc2VGUzZjcUoyNy85b0tM?=
 =?utf-8?B?S2UvVmJOWWs2TjRCVUR4NWRlNEtRdkpZVmJnWU1icnIwNk0xZ05NQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8610cac2-b5e5-4b5c-5dce-08da21e358c3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 09:02:35.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXPnrnjynu93LbLFJFLEpLqeN+/tdcPRJroURoW1aX4TaInUCdxnwCihnvZSMuiy5HkPREmiRS15nv58SDa0sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2930

On 18.04.2022 14:22, Penny Zheng wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -591,6 +591,9 @@ struct domain
>          struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
>      } ioreq_server;
>  #endif
> +
> +    /* Holding CDF_* constant. Internal flags for domain creation. */
> +    uint32_t flags;

There's no need to use a fixed width type here; unsigned int will do.
See ./CODING_STYLE.

I'd also like to ask for the field to be given a more descriptive name.
Just "flags" can mean about anything. Maybe simply "cdf"?

Jan


