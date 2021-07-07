Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ECA3BEAAB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152383.281528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19TU-0007vk-JO; Wed, 07 Jul 2021 15:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152383.281528; Wed, 07 Jul 2021 15:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19TU-0007tv-GA; Wed, 07 Jul 2021 15:28:32 +0000
Received: by outflank-mailman (input) for mailman id 152383;
 Wed, 07 Jul 2021 15:28:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m19TS-0007to-9I
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:28:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 700cab37-2683-4cb5-96c9-dcc08e252f1f;
 Wed, 07 Jul 2021 15:28:29 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-pWtREk8_OIq-02k2w0jEZg-1; Wed, 07 Jul 2021 17:28:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 15:28:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 15:28:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0119.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 15:28:24 +0000
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
X-Inumbo-ID: 700cab37-2683-4cb5-96c9-dcc08e252f1f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625671708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLbfsikYz/i0AKxfArOWpD8QrDhgJPQrDqUXAm9NvKA=;
	b=Qi3Wt7eGFW4JeFUBdaIyrLR5Bg9943+pss8W6IhSs4Z32JNSmfudWYnIQx9odLhnqyFF00
	Fc08npyqxBRlNZxeu85fsqPZqWWfF3wEnD2JFJY+edEVyrMJEKbulnu8376azaehMIjIIf
	9tK954munh+NCtD19oiUgUBs04ygB+M=
X-MC-Unique: pWtREk8_OIq-02k2w0jEZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1Y0CvhFv8+bwQkrGCPQxcEtrcwLl9jPE7SQGf2XcWRful0LrS/KPFX7HlF7N98n3eSCo5kjZ6PkLlcMQGNyXjQfimOJehweMjxk9o95ZBo5ldUw4bJ5UPAmpf0pppJpWstVMPbWnUR7nik7V5Fa5Fz2zWgFso305NwkZ6n1VHrtGugf+QSbTC3uJCOJ5po+MAOnlcNPwMRVqh/DAsNvUAbni3KhiSm5h0lFh+knFXCOmYsh/m0UGjCGlp7RvFj1PSdCzr0ZEI996xCeCH27n9OEF7AnTIp0noiTtoupPd9uNuCen2e8K0I8rT5A648lDsk2T7QlhEvQw2OWSB5RuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLbfsikYz/i0AKxfArOWpD8QrDhgJPQrDqUXAm9NvKA=;
 b=ZUUSD90RdkG0j7cE1lbQym+suPUs0FPJxyMjCHpjGZZ7afT5Fdp4Px/tpzmf88TdArNPYoGutszaFSAonMCCh9o8348k5hM9WZSj2oO2b9YbIBIKWuLh6ImmYXGKqHi9Jkld2j4zgSQ8rpeWsQjXSqRzyiCYqSms/E89N7ttOrSkDfUrgsKH7QzS1wsbEZHKsV6XMwUES2T3WT8jsqgDK3uMfcN3X003cWOzGQf8YwRa3XXd97kYupUh+Y4xrJjH8PYVK+9C0W4MUC3+qubP15D1N1NHTIqBrNYOdX9kc/KzWdc0FTpT7V3vecCebeeRo8kPARXOnjsCNw3DhjvimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 13/31] build,tools: have default rules depends on
 symbols
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-14-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b82e204c-d737-19b0-67b5-2cc5871c8d47@suse.com>
Date: Wed, 7 Jul 2021 17:28:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-14-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6dee144-af3d-407f-4772-08d9415bdce4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33895403255FC71630CC14BEB31A9@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QGMe/3h/7BwTGp8GVb4mnfJKib0aHDXrSW/CJF+6nf1rhEG64iR1q1SY7DC67hjc7sjhtIE4nTuyiXOhZnnSWP1Db00yxshLarIce/9ntDPE7mnObGjlMcN0875y5cc4/lIB2OyFz68sTf3hs3LM9JGHWclVPTIj4MHiZTYqsCt8ZqI6LrRFrnou+X1RqXgU6c7Eweg2ROXGGFvmsItpDHQ7S6GPXiRPXcKQ6QZ7LGhd8KzH+5dJtNyk8e2HDCr3IzN8BiuxfUI95BbskhzMydqfeO5p72BplUpgu5a2mS7wWE5RVbQY7nAVr6YrOSADVZqhh/ZizkUnbk9WgSp2OM8AUjhnmN1rrgpkiz7d0BCfwbd/wamlzEz27MA0ne/F0bsNcvZfEKCxO3MjwAJnDiF7/IRqJbbgqdtDFO+6S8OvlxDfeayNDmr3aGQxnVgLVeMABGdtFhF8Chj468hEsw2q9yloCJm/CZql3jKIZDqMx0CNY0UZitwDCreHlJTgBEZ4rKjE9lEgVYZPdA9ufpHgaw0aHaqvSIFn0L4mFBdI1zG8WywV+0oyZlUYjL8csWddmXEIXnpC0+4gpSDrHtn/aX5xwugNhZh46dcGs5bmMlMVfSQTKWfykNMZ6b05DcSJBNWF4os+q8f3+G8qWa109m1XtUOMNPTVxLD1Lq01/aqv+zC4znn94+yK567ThluI5SUZTowdFOsxPLzE8UEpV4p+9RtmmJ6SfSnkKUM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(16576012)(66946007)(2906002)(498600001)(558084003)(66476007)(38100700002)(31686004)(36756003)(186003)(8676002)(6486002)(8936002)(26005)(54906003)(5660300002)(31696002)(6916009)(53546011)(956004)(4326008)(2616005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzBLWTJnZFhKUnNzTU02ckgvUy9qWmRzTTZhcWVFU2VjNTh4YS9CdEY1dVht?=
 =?utf-8?B?UFFWR0lFeTVvWTlLLzQ5RVlmNzZvd3Q5UkdzY1NuV2xROVNDNnFDVUt2cEor?=
 =?utf-8?B?R0I0Z01kZmlVUStpenFnYWxhelAxNlIrMHprTzZSYUp4K3ZGQVBqNWRzTTBB?=
 =?utf-8?B?V2tRTGVHMjZrUDM1ZXg4NWdaKzFRcDRFU3dYdzhOVUx0ZHBFWml0WWphNHFq?=
 =?utf-8?B?ampPbVV2eXQyWmJzckcvajQvQkZMdmUraXdTOWJ0UFNBRlM4TTh5M05jdE5u?=
 =?utf-8?B?NWVVaWRoc1d3OXZwdm4xaTVtRTFwSVJSNmUxTUdXbHRYTHFVTEpyKzMyT3Zo?=
 =?utf-8?B?dlJkZHNLVDNKZVRyamhtMDJ4THZDZUJ0UUNsVW4zN3pJa2JuS3ZOeVdUd0pk?=
 =?utf-8?B?bFlVaTZlWTJPejhNdldFcTdhajdiNEtrY1lmSEVlODlZZTduWmVJd3Q0V0dX?=
 =?utf-8?B?K080RXBSdWhrSjd1UnRpdHplWXpoTXAxK0NmZEFIY25oYWp3dTVCNHBjdHRH?=
 =?utf-8?B?WjBadXAySGkzZDB4TjNjcWQ3UkdIbFBERlRFR0NzaEEyaXNLNWdNZ0dQSnBT?=
 =?utf-8?B?UWtKWXRRZjY0WUV2K3Q2QXpxRHFsQUQ0eDR6YXkxVm56UlprK2dTT0EwQ3pk?=
 =?utf-8?B?czJBT2VSTitaTDVNdUxuK3NtOVZKNnpPT1lzWWdWVDZyMTd1aXR2VmNaSVJ5?=
 =?utf-8?B?Q1JFRUhJM1orZjYrVlpWQ0FOSzJhVG5Kdk5lb21oRTYyc2xJNFAwdCt0aUxB?=
 =?utf-8?B?ckFHZnZiRWhkbUt5Z1ZsdVdJUzBVSHcySXMvUVcyNGFFWUYxYzVNMzFzUGNP?=
 =?utf-8?B?S0FPRXFQSTJoYkp4TW9lZWtaVWU0bkVCUXN0aURnNVRlNXA3Tk5ubk95RlJ0?=
 =?utf-8?B?cVlaQk0yM2ZtOGcrZnE3N1BPQmZFY0ZDNFpTZVFTcFM4dWNkc0ZZVFVZQ1dO?=
 =?utf-8?B?b3dRazBTSllrcmhwTTVDZU5xeVFEYXF5ZmIvemhaQjdKalBCWlozMGpOMDE0?=
 =?utf-8?B?Y1ozRnhCbGZIL3oxeHJMYkt2UDcyeituVTY3Z2JJVUhQb3M5RGNMOWVPSTZQ?=
 =?utf-8?B?SGtnT0U0aDF4dGRhZnlyNEdBR3lPK1QzeGo3L0lvZ0Q2WlE1ZFRFblNUUlI0?=
 =?utf-8?B?T2lKL2ZNRVdOcDdsZStoeHNtejAvb01qb3pMWW50ZC93WDFBTnUrUU1OenVa?=
 =?utf-8?B?azdlS2oxNE1tdzdIUnFmV3hoRUxFY0FxNkFGRkloWUNoRjhoaEJhZUpRbTNk?=
 =?utf-8?B?U3pnQ0Y0eXNRNUxQVWRVV1lqMExhMWdwUXd0MnhhMEJHZ3hDYlI0TjMvTTZG?=
 =?utf-8?B?V2Y4WUxRS0laY3NTNk9ZbkxLN3JJR0lZQUFCTDljL0pFWllWMjhGUWM4RnR1?=
 =?utf-8?B?elN0RVFPLzl6L2U4QVg2YnFXUkFyUmI5VTU1eDI2MXkwcVZtd0FpTjE0UnB0?=
 =?utf-8?B?MnJtbVFFc2t5ZTJwOG5wWTloTmpMTUd5bTRpSG1ZeE0wYVJHUldQdEJ0T2pJ?=
 =?utf-8?B?Q2ZpZmordC9lSEpiNHVvcWM5czdSVUVHUW80TVdmSUpGRnkwWTVMQjVOTTN0?=
 =?utf-8?B?QVY1U1M1Wk1MOVpZdzJuRFJlQWhKYW1DZlV5VFpLSThGNlBvd3g2QS9tUEhw?=
 =?utf-8?B?ZDRRc0l4OXgxYnkzYzBZN1cxYjBVRGp5M0JCbDdyUEQ5QmxkU25kK0QvZncv?=
 =?utf-8?B?YXNrVFlLVHhodHBHY0tpek9ZUFBHWUVFL1BJd1gzd2tDNUhlRi9zNFBJMG41?=
 =?utf-8?Q?TjByy3kYznNwPd2dfEr1lvYKhuwtd4l7EXOhWb/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6dee144-af3d-407f-4772-08d9415bdce4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 15:28:25.4232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34KUTdqDt6AWtWSZkX3DRRoKYW3QguhCj91js/WR+T9b/8R5FqxdsgamHGqNHy747tqSaJO6ox1paLi9F/piVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 01.07.2021 16:09, Anthony PERARD wrote:
> No need to call $(MAKE) again.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


