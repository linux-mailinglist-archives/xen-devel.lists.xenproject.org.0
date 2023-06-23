Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6C773B22D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 09:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554296.865418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbh1-0003He-9K; Fri, 23 Jun 2023 07:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554296.865418; Fri, 23 Jun 2023 07:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbh1-0003F4-6I; Fri, 23 Jun 2023 07:58:55 +0000
Received: by outflank-mailman (input) for mailman id 554296;
 Fri, 23 Jun 2023 07:58:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCbh0-0003Ev-M2
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 07:58:54 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbea4c87-119b-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 09:58:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9705.eurprd04.prod.outlook.com (2603:10a6:102:24b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 07:58:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 07:58:51 +0000
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
X-Inumbo-ID: cbea4c87-119b-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kb9NWU3bj1DtnBPEX0eMdC9II9Y4PvKqeaW4t5nV+GoY2DB//qEmjCb5mWtwEBdTwDCQnVyFhJUDcrQxrYJgxzurMFYh/ryF2sYOyBeOI9JCWqpEDkHEnKiVMMJ2BhAY5CFz1n02gyPUvjVo3osbNcg1ki0crp1hKRodFJAoPGvRAfbdTn5sWa0uLec2tv2S3nst5JtvWkclXxfhuPB9kDbaFzprldW1vgT6yY5HKtz6eSutrJLOfLaJziet4JpEZtlLQfPEtLPvlM0W0WyQThfW4sKpYrjUDKp5XYyCr+n/k9yHEvV80Lzsr5Nw+nql7/WeAEMBAr8H6zysy/dd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps+1Lk27fBMBUe07ohsI7ehCl3BqJQ1pixmvGM3a+x0=;
 b=cZkwl/deXWEpys+M3Nl3CELNhhcIac3udzr5/Rch1yHB+dY9f0r/6yuP/5hHdN48MFuB7gHFLKsFno5PbXmp+01qbpMckC6a4iOnR8sQA9adGZbQy1gF4l5yJDQKOAh1+MEdaLg5kvV+UODL9SWeFAzvgVuNViDGMPS+ARQTh2rHnrb9iI87E+AelgKv6uC4JMb1VH1rI3MgiEeWjPrNG+HI0DbhuQBF+h+ZKZ3gekYmSTf+PeBXWZoDn4AMBUhQ0kAUkDx/UveiVMUwGHOH1XJslG+Um8gQGZsp2pQBuUu/PHmXL1weaynnw7Bg4w1CYULZr6BrRgaSIdDyB41LOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps+1Lk27fBMBUe07ohsI7ehCl3BqJQ1pixmvGM3a+x0=;
 b=No+z3BNI7Vds0w4TCTAaI+tHuUN9GMqkdwfUhRKaA2iRGosqH1QVo4WSAIVqaXaFtU0o+dKgcUxxSyWlkQ9mggWBAipr+LbRWMNwRt4x2y+waKJEKRHIP5uoDGBdcMhR5VI28nYOvDmOPgzW+toD3Qs1G3zJxH1hDa+DfSm30zMUU7aa2Tj1TMWJVpcOkLO95b7VhEwnkXxcvzAxa5+acBYaBEx2VTnEr7df3DEbXmAB4obx6G3qHRtk4Afzr/vVkgCo4RrAMEsTWzPOt9DfSuECW6kg6Ly3bp65SxTf3XHA50Aa+WOT6X6jbuFcGZHMsw7I2cmVicpEpLWDggPc1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81763252-8cf2-736d-083d-8526b462e8dc@suse.com>
Date: Fri, 23 Jun 2023 09:58:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 3/5] build: remove TARGET_ARCH, a duplicates of
 SRCARCH
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <20230622153005.31604-1-anthony.perard@citrix.com>
 <20230622153005.31604-4-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230622153005.31604-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0108.eurprd02.prod.outlook.com
 (2603:10a6:208:154::49) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: b95cb48a-db17-469a-5cd3-08db73bfae97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QWSXF4byB68nJOtiY42JFB+o82Ay+M02Fc6CI+x7aK46MmuBKeZQ8WzC4X5yCvqTyWTls30oWJHGC8He7+7QBgt920Oxw4szLrrdiW77coeHkX2JOJxz0IjEBqNPb9YmC/mG1iC0e9kmAK52W9aWtvSS+Xgi3zFjMFdUxQ7N6NEfx4hX9HDBZv8WX7mT24beWxZfOV6NOiKPhnP3drS8uT7NChMSq6ctLc4qdowGU5IVv4w59p1bAnBkCs3MNIUD/N0LvVKsWCRf7t4Olt1bBxmGzs9O3omP+qRDyGEDyDYaUn+ek7hMcK6WTQC6cWc4h+EWiPilCAe2uHV+WT8axd+X0Rw6XeGQxzfrpfoLhLtfYckDk4MUGmoKiHeseavLpGTBYabNx+Tcvc7zjUbgkyh5CMTqjed6pv5/DbqPwAiIZ6/YYyaIcCsGvMewx65Uy029rzyN0r/YF7NzyBz00vUI9+icYFtk2P33p6+QkPF06Z1Vn+vdWGIpaILgLTRoFATCe3zp/tRdjAr3PlBQF5WZvt3dGUTdENCuOVct+l5Hwr6Fjmbi22dVfD00rfXIictsF8T364gSnaVrGzhqaw05T9l3Xq/GjdElY2YZSAu6aAisicgW3QDClth9BCajUecFEu138JGI+8D9Dp4kQiQno1yBVToYdU95ku0gsQXgjzUWQD1boqd6WTOAZCOu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(53546011)(26005)(6506007)(6512007)(186003)(2616005)(7416002)(2906002)(558084003)(8676002)(41300700001)(8936002)(5660300002)(6486002)(478600001)(4326008)(36756003)(66556008)(66946007)(66476007)(6916009)(316002)(86362001)(54906003)(31696002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1pwZ0F3SnVXTlpvMkV2LzczRWthaTVQbVlML1lwNXd0eWVTNElnMTd2TWZi?=
 =?utf-8?B?RXZtVEkxWm1zN2N3aU5abWNvMEd6SjlXd012aERNcnlueDVUQXA4TGFRcnQ3?=
 =?utf-8?B?TVBOakdaSWNERk83WWozbi9wSXBXNU1yUU1TYm8yQjZvTko2emFwVnYweXdP?=
 =?utf-8?B?S3VGTUdBdTlNMjZrdTd3YjU5cGVpVm4yZFljNGNZWU1EWjJ2a3NOTldNTitD?=
 =?utf-8?B?Z1R4Y210eUtabGR0RVdjSUJrZng2WjdxODVUdGliRjRydklIOU11SjJ1bzBK?=
 =?utf-8?B?OFRwRnc5MG1mM0w0UkwrOHhRYkdHdlZqM1dFSzdaQWVna2NVWkZDcFdvci9N?=
 =?utf-8?B?STNPNTVmNzY4UldDQ0NOQVZTb2VTOXhNU2xhMElYbzFmSlZPR3ExZzN2aVlC?=
 =?utf-8?B?Q2Z0TzVxSDc2RVRHSmVnWHJuNDh5NmFqNm1KaTJBdGRJQUxrZVJxZG9keDlP?=
 =?utf-8?B?bDBuZTFQcXM1T2ZTRkErdlV6U1FFbnlGNG0wRWU1QXpYZTNUb1B0a1pMbnVV?=
 =?utf-8?B?cllaUGs4em5peWFHNWhYNGxYek1taTI0aWg5RHJZZW40K2Z6YTNCV01BK1ll?=
 =?utf-8?B?TGVUU2hlZGtnS0t4Tjc1VzNESFczL0crVnpmZVk3alVWSGxkalhWQm1DbkRD?=
 =?utf-8?B?ZWFYVHV5bWo0SXRmM2s3QnBVaTZBUjQ2akhRa0VveGZNbGk0L2VuSFhoa25Q?=
 =?utf-8?B?MXZDM1hOOVJ4OG40MTZKRExLclIxdVR3TTRma0F3Q3pFbEdXYmV1WkltdVp4?=
 =?utf-8?B?Y3hYQnpWREVVM0JzbFVWOFFYYUxZQnBiZWNpakZoYTlKbTBkWEd0Ukx4SlBl?=
 =?utf-8?B?RUJIU2hOcGFxN0dEUEFwb1EvNU05THJiakpzdStTQjVJaVBRaFFhd05JN3Qx?=
 =?utf-8?B?OXJCdFJSNmpTbTAxb1hrdU1Rcm1LVTdqNGpKcWVSaTI5c2xaQmFmQktzUWVz?=
 =?utf-8?B?UXJqNUxKc21oNktkS0g2am14cmZOR0tVeWs0UUIzWFNGMHJLUjBJcTdxK2F3?=
 =?utf-8?B?QUdzYmJ1M0pHZVp5dmptekIzNER3bE1ZS2Z1MkFzQWV0SDVYZDJuYzQ5ak8z?=
 =?utf-8?B?WHlQSi9qQXZmb0RRekx4VUNIWDlpYXVxK2x6aTBLM2wrc1MxLzM1MC94NkdZ?=
 =?utf-8?B?ZzdIaUw1cE9lQmRiMVhYNTIzRmcydUlRVktzM1daNHY5b0FwU2x1b0QydWVy?=
 =?utf-8?B?bk5FSGRZaGd4aHo0aXhmSnNjak1DbXQwMFVLZVBOaFllbmVEZGFRaXJkREsy?=
 =?utf-8?B?R09nempPYmpnRVZzRXhlcW1mLzZJZUJ2N1VMVGtiVjA5ajY0QS93c1lzcUZ6?=
 =?utf-8?B?bWMxTW90bllrOEZRVXZtQkd6SzVCRUttQXprQmtMM2NqYXhUa2owcFpwRFR2?=
 =?utf-8?B?WmtXT0xJc2dMcExMc2JEWWRLelNhZDA1OTVvaEVZbTYycUcrd2VBeFp3YTc3?=
 =?utf-8?B?Q2ZiYjlhaloweTlDZ05NaFkxVDVGcTlRNUlVRGkxQWxtenhJenFkT051SnNK?=
 =?utf-8?B?MlZTZFlCS200Y0gxWUdlT3JmUHVzcWJ0SDNIZGZMQ2M4WS95MktNSGxzVmgv?=
 =?utf-8?B?QzdBN1c0WVR6aGxNcnlHUm9Xa3NOZkhueFJITzhWN3FvNThaMGY2NG1ZY0NE?=
 =?utf-8?B?MmZ0WE90OHdUazBRN1ppckNNRTZYOXNvR0JRbTRtWU4xRi9SUmxYOUpJTG05?=
 =?utf-8?B?aHZRcEhjb3A5ekNnUmNucVBzZ0t6NjBnbDNWZ2g4bDJGcW1GZk5WajM4V2FK?=
 =?utf-8?B?KzA2OEhQTyt4QXhUTXJTVjhoc0lqSFRZNGc4Z3RSUDR4REU1eVZyYmpoeVhz?=
 =?utf-8?B?MTRGVENhRDQ5eUVzQTJTcGdEcHU5Z1FNMnZqc2J2dndaUU05ZHFnaVprc3JB?=
 =?utf-8?B?SUZuaVpjZW1NcEZjMk1XeW5MTy9ydEpDTUx3NEpRVnhvWGVqd244L1JuZDly?=
 =?utf-8?B?UldkSDh6eTlYZ1RMWjdselJYelNGSWc2b2NXOTZlMGI3dm5yM1IyNHZFbXJz?=
 =?utf-8?B?ZnhBa2w3eTI4UTJLdlRmalErajV6bXhiTXlHcmloRVZEVEcwek1BQ1BqdHZw?=
 =?utf-8?B?UUduMXlFWStkWlVIODVEcmZPaGpVWUVsaDRiQjh1ZCsrU3FyUjFTUjBHWkVB?=
 =?utf-8?Q?WrsAbN9jm50P+pfkZoLRcveda?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95cb48a-db17-469a-5cd3-08db73bfae97
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 07:58:50.9895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47/lIe7J1AAAWjZ5oatDtcD0qe+5WjWU3ZpOoPLqKLURT5yfD6Lh3OF72wVra/+zIikWYMQDMGiTp6XY7B7JcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9705

On 22.06.2023 17:30, Anthony PERARD wrote:
> The same command is used to generate the value of both $(TARGET_ARCH)
> and $(SRCARCH), as $(ARCH) is an alias for $(XEN_TARGET_ARCH).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



