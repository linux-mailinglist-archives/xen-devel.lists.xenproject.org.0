Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D813BB97B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149933.277300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KAs-0003XD-0o; Mon, 05 Jul 2021 08:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149933.277300; Mon, 05 Jul 2021 08:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KAr-0003Ti-TP; Mon, 05 Jul 2021 08:41:53 +0000
Received: by outflank-mailman (input) for mailman id 149933;
 Mon, 05 Jul 2021 08:41:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0KAp-0003Tc-OJ
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:41:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d70bfc8e-dd6c-11eb-843f-12813bfff9fa;
 Mon, 05 Jul 2021 08:41:50 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-Lo65KnIfNPmdJLEGrGc3dg-1; Mon, 05 Jul 2021 10:41:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 08:41:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 08:41:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.16 via Frontend Transport; Mon, 5 Jul 2021 08:41:45 +0000
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
X-Inumbo-ID: d70bfc8e-dd6c-11eb-843f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625474509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qi0/A/ZDdzvWCMcpib3gmxbhoynEIspq/aq0JQvdtrs=;
	b=ifwnemfjErIEqyKuxkzTHRMahzT/ggxTpQKgb3HqMZdWE4BOVDn3FnZ9Kc9nOCMxqR+I1d
	r7RGGzGCyKH0Dd86Dt/+yyAGx0EaDMYXQCpD135ulz2VbMLbk9w5ODaZ3KZXbjZeBnndRh
	XbfRYZCg+RAwuxpqaqfF7ZwyCxwkRJI=
X-MC-Unique: Lo65KnIfNPmdJLEGrGc3dg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWQkJElLYjG8sFAen/WyPc6hNfr9ropa+4mNxpgK5X6nUqEnqzU3JcLARCsGwHI/ULJwETfDKEuqHolopBLvlHacM1/GbQfLs9MQlZ3qnIDwbV0Qwps9SwVS5Rm8skfisMr29OmVHdlg9pb0X/9ShMzKvublN7YBLcG9Gba6wltiubB0imhsUZ+wi/gtjj0V+IDpUVntfmt2uVGzF7vCURcBZVSVShfTnVZFg9K+gSvlI2MmjlFNMYMp8medAtTlXydfWtDK8MReJQ7rBcmkL9Y1QsqRKS6OPt55fQO8yWKlehRE/TTJcUQiQOioqh9zTOUh1XiIGB5TjVtBV4ADbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi0/A/ZDdzvWCMcpib3gmxbhoynEIspq/aq0JQvdtrs=;
 b=OJtRFTJbZlrBp8hKa+NVSNYoRK1F4bBxc9btoXMDILIcylIVn59ncm2JjHgi7PqUo6sDARf/EHlxxMuHrEA3lYsIYF9vPfsZv0JP1ozJeEYpmWYvp4f77QlxDKCN1BWJW1Tg7JvsN4JMnNOI6U3V4w1T0l6vnZgchbQO8zYWmWJ8Q4pDssH4TaJgjqt6sjH4Lbme/fsyOHcFo8Ijk0pOglSUTggwi9gB+bO4YJJ/y7yjsj9V9Gh6IbSbsGdDO+hyclNKWaUMveqbv96fCsT9BS2l7MvMpnA1TS/P8Ju9NewQ1UcVLDJoTtCvf2m20lZFA1TEa64VcE7FzVp5GxJL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 1/4] xen: XENMEM_exchange should only be used/compiled
 for arch supporting PV guest
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210703171152.15874-1-julien@xen.org>
 <20210703171152.15874-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c0100ab-dfd7-9c64-c89d-338db62cf20b@suse.com>
Date: Mon, 5 Jul 2021 10:41:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210703171152.15874-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8891937b-9e82-461b-3dc6-08d93f90b8e8
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41906BF76925DE8F230E87E9B31C9@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9zsPOcYznqGYoVNrmEC3voAUDi1gyhGySeQpNo6/yctJtjbPbhxd/uNaNYnO0O8X+Kd9rjzGNDk+jlv9AdYwac5TiobrfVszeBPsn0iZcyJn+L6tQ/S9HdTtM7b6AlTTiS1hOAZ9hGR2IihR61l86kSlC/pmChXtBFw9AvijHb9/KgJ9bG+S1OANgD+oz7+6VRs5OnL7zvJBorJXskX295jONX6Fev3iDWjk4bNW2nhN5hawjoXYDfqYTnBbqmFRbuNOWBE1K02RLvS3vX/zELHcvfzNNfjOsm0hbbVjWl6hi0IiWUBrbRqxWdpeTHJAm0SHlxDzRG2x4FqmSHgnTIa6znfa++5k/oVxwax/Uut8Y+21vd0cUYoSAmYZmEF0Iw3mqJKjjch699cQQkLlxtBoUR5IaoXye0PkB3/PkKwa0WF4R2o1A72Ipjf4Wu8dsD+VFmmiYabu3/oRs6pc18dUCCfpKuKI3UEjCys3kKg6t55x8Bi4D1Bnx5bMsiIzPuOAi3laHjre1qKJ/FPJ4JmlY4DCJARo4nE1k0iLCc3fpE1bwX0WVgLwU8txgs5fSoK0oM+G8vVjdSYBtJOEBD8RgWF9k0WDhP40YHPKdGLBQVUzLCZ7Om7MCSj64jqlA8ye+traw0Sca2m9r71dzXzzSB5w9OU8D0eqnODSxYJ9SUzORnCNGB7X7t1Bz5kvfig9xFMjgNnr0is7EDF6n22CsgLp14bpbDgJn/sHc/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(376002)(396003)(366004)(346002)(316002)(16576012)(6916009)(54906003)(53546011)(66476007)(956004)(4744005)(478600001)(66556008)(6486002)(26005)(16526019)(31696002)(86362001)(2906002)(4326008)(66946007)(5660300002)(38100700002)(186003)(36756003)(31686004)(8936002)(8676002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEF3ZzlHV1JQcEJuZW5TVE5BOHRGbW1sbXlJd1hwbnpVZHNzSUoxWDJiSXVz?=
 =?utf-8?B?aFdYNUx1UUs4cHgwNHNtalRtN0RUaG96ZHJDWG9FZ0dYMUp6U0tLeVZuQllq?=
 =?utf-8?B?WlJaR2VLaFIvR0RyTmlxOE1HWEhMeWdhdkpMbUU0MW5BWHkxUU1CbWdPVVcy?=
 =?utf-8?B?OHlHZ2xFQVpFYVhCUGxFWFRpd1BqaDROOFRIUzVNZkFxZ0pCdkxHMW9lUTJG?=
 =?utf-8?B?TXlpdEtMYS84WG4vZWttOXg3Tm1oZjFqZ084UjAzL3lHNHd5bjJTbzliQ1VR?=
 =?utf-8?B?OVdyeEZwYkhEYUVoTjV0aEpxVExYS3EvVHVYWGUrWTg5K3NUMmJMUWNrTXN3?=
 =?utf-8?B?Ym0zOUlORzNmYm9YTXc4eEFtaWhPOGdDOFhYV3RUNWoyV3lZZE1sL25XdWwy?=
 =?utf-8?B?Wjc3MGFzOWRVS3FsWGJCS3MyMHR2Yk5SNHNpOXB3amR4K0t1clplUUFyVi9O?=
 =?utf-8?B?cm1qMENxR3lRK1k4R2hBK1hFY204aDJiajlNR3ZpSnhpcHd3bnJaWmpCcVRR?=
 =?utf-8?B?V3VTZ1RjZkE4dXkyenVMVHlGMWlwb01neFpjKys2Wmt5NXZWTzBVSnZmNFBv?=
 =?utf-8?B?ZnZNdTBSNC9KVEpHWlRNOGJBN1JrSVREdUUycjBKeG1lNzlITUZ4WUQvbDlX?=
 =?utf-8?B?dkl4QXA5YXFrTDFBZVU0WnVyZ1Q1bmVLTDFIK2pndFlGbFYzazFKSzYvN0F2?=
 =?utf-8?B?Nll4dFdOL2lwQmtvdmQvUVNKOHpRWVhMQVhDczgxb2k3NHlOZnJ0WThsRWJI?=
 =?utf-8?B?ZkxvUVI0ajVoMFN0T0F0K00xbVFmdzVLMUhONm5pMVU1aFJ1emljZ3BIMWwz?=
 =?utf-8?B?RDRZM0Q1dnFSZlRld3lXUmhmNDRCbFl1a2p6Zm4wQnFRbmRhLzNUM2NVbHo1?=
 =?utf-8?B?Q1VteWZ6eHlIZXExcjZEZ0FscEh6KzRjdG9tQWhqeitMTUVkdUllTHY5Tmdm?=
 =?utf-8?B?RGQraFBBdGgxaFhMWXhoMHdFaHFBQnVVZm4vSFY4ZHZjL1g3UFg0Y3N4elcr?=
 =?utf-8?B?cm1qR2dRd0x0YmttUkdsS2dzVWdKRlUveFFvcm1IdmVINHZYd1UrK0VWT1Er?=
 =?utf-8?B?ZURzTnlXSVVqRUwxTVVhY2NWVDdack9BYzAwcDRNUERJV1VOT0t5WFg5TWZr?=
 =?utf-8?B?dlZ4aStkMGJtR3FTQjZlU0tWelRIT2V3VDNNLzduNDNCanpRK2ZJdmIrRDNH?=
 =?utf-8?B?YXJ6VTh1N1lvRFBHRWl0cjdudlVrb1VpMnVNZHBHMVM5Kzg5L3JoWXV4NTZK?=
 =?utf-8?B?SEpkN2NUY0RuUHh5Z3hCOXQ4U1FobmlJWDljdGp1QXlrMmtFVE5pVkZtaVQy?=
 =?utf-8?B?QlZ6NURIbHRaM21HV0R4U09pV21kbjdCc250MzdnZHFGME9mYnpyVy81N3ZG?=
 =?utf-8?B?YkR3WldPQVJqOXhVWGFsUkJhT3RBUlZDcVVyRzlxd2x0THRpQ0FVTGM3dnIv?=
 =?utf-8?B?RGlwbmptRDlRcjY1ajl2Z3RvNTloeFNwT0JlOHNFUis4VXF0SFZHUDQ4eDlF?=
 =?utf-8?B?UENkcXJuWFNwa1RWY2Z2TVBha1A5aDNmNXhITFd0ckoxdG00SkQ4d1J6a3Zq?=
 =?utf-8?B?cUtkUDNvZ2NXWnRoQ25yYzVmUndtNUtSNUpJZmdUc3kxMmJveDE4d09OZ0Yw?=
 =?utf-8?B?N0VhcGlqTGZIZk1Rckd2aDdsR1dWbXRadStNVGZBOVAvelJuWFoxSGZKdk5h?=
 =?utf-8?B?OTF0Y09BV01sbVJyYnc3aXIvRHVIR3NZTzJZY2NnUnJTVzJzQUhseGtyTG45?=
 =?utf-8?Q?FInAa9uvOe/bivYdzGHZ0vpW4md+ZB7yCFubjiB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8891937b-9e82-461b-3dc6-08d93f90b8e8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:41:46.0753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9jBKADDzvXF2K5amDJs3baUo5bJAKgs6EIt6apRs6mWIgRAusYnazdPgGYNE0vOKzHBzASb9ZE9Fy7mrOcEQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 03.07.2021 19:11, Julien Grall wrote:
> Changes in v5:
>     - Removed the #ifdef CONFIG_X86 as they are not necessary anymore
>     - Used paging_mode_translate() rather than is_pv_domain()

Is there a particular reason you use this in favor of steal_page()'s
paging_mode_external()?

> @@ -815,6 +812,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>      if ( __copy_field_to_guest(arg, &exch, nr_exchanged) )
>          rc = -EFAULT;

I'm afraid that for correctness of the interface you need to keep
this part even in the !PV case.

Seeing the 2nd use of steal_page() I wonder if it was too much to
ask you to do a similar transformation for gnttab_transfer(), even
if it's not directly related to the immediate purpose of this
series. If you're not going to do so, I guess I'd put it on my list
(perhaps together with moving x86'es steal_page() and dropping
Arm's stub).

Jan


