Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7393E568D4C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 17:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362387.592439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o976d-00063I-3V; Wed, 06 Jul 2022 15:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362387.592439; Wed, 06 Jul 2022 15:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o976d-00060H-0K; Wed, 06 Jul 2022 15:38:23 +0000
Received: by outflank-mailman (input) for mailman id 362387;
 Wed, 06 Jul 2022 15:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o976a-0005xl-TL
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 15:38:21 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20042.outbound.protection.outlook.com [40.107.2.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a90343f3-fd41-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 17:38:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7665.eurprd04.prod.outlook.com (2603:10a6:20b:283::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Wed, 6 Jul
 2022 15:38:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 15:38:17 +0000
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
X-Inumbo-ID: a90343f3-fd41-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7kdJ+a5X3NrMmJggnq6MHOGGmLrkuQg2jpxNN4y4kS//NoqoqSm1YyURKLxYUqVSE83Hk7pIT2Dhzhib/+yxift/bhPZ/u9Ybw9Qe9Stx7XTrTOF0TeCxjPCdHEh6z2rH2xrTNo3AyybdBxzK/uckLCBAyvi1+L3hKx+9f41enbSnAwiHx6FaguGNWTaoSmrkSoeMzqFqlyhjo5MEATUa5N68pI1dlUGgjEmQAQYn4bCdf/iVATc47klS1UulkPdWW6Gj/PKfiEswx4Gfu3nZ4FakQqmbGq7/EBs09zj6K1qIkn7lwG83nZ+H8BoUR5hZR45yjgcANv7dhCt1UQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3IdF4c0WU+gLVVFCtReB28pUQ+BMTUs0ANzgGR34Js=;
 b=nyAbAY514Wym3ZTCLBmno4QOoTUnGZAOtjLCTcGwZPlYRpjxZcH7C0jI8IaNzrwNaiKK1GOOShaw4U4aa+gRVzIpii3mWm7NWu5S7XuuOsEey/4PrVJl4XGny9tqSK2rvZS+gIr63BDPosHHXbxIGXU/DhBkZZQXCiz97XhqJkVKQlCVw6JbZ5WjIM3f+dC3ongTXErTxgkmxXUrxE2AJ2hlziMqVROM1ZSbu6U3jrjTn31gLp0eRwuSnutVbP9Dk/lcyzWDDByyJq3V1R2VKm/Gl8YftpNAyVcoGRoitia87C1oN2w9lEvkTVvJ/eoHd5RSC8ScdLLOryeqgwCjcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3IdF4c0WU+gLVVFCtReB28pUQ+BMTUs0ANzgGR34Js=;
 b=0sap8EqWkvqhAHpRRL7ixgQDZm3LkXT4KxyogtyDUjofL7ZangSOXTDpaaTD3btWKBT93KUaJbICUjsbJ3RWw+W9aJwdEF2dZnKhL0b4F11nRgBszmOrIzFt3oQ+X0gNLgiqwjjExASSVNn3VcD2FFeVO6ogfGOedOILt5I1MlrYcNto/OD0evjWJu63j0oU47+hCKNEIOmmvMVCINJkgV4z7byN1zmUDsMoVUz2zpj3O1euFF+uLDRpa9+QG7T2RoSEKdLqNUOHSvEDCSDkFbeNh/TfeJRJeKAq4TSoB7THlppLQZCM6Zf4iIMvlo0ROjYkRb1ZWRusHVxp8rJ6ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <775bccd8-9fb4-35b5-cf75-75f3875201d0@suse.com>
Date: Wed, 6 Jul 2022 17:38:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] EFI: strip xen.efi when putting it on the EFI partition
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <79ebbde2-4be8-d393-476d-25326a2aa327@suse.com>
 <YsWnnMZYwB7UGuv6@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YsWnnMZYwB7UGuv6@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0303.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1d16cfa-30e0-4984-7a49-08da5f658bfb
X-MS-TrafficTypeDiagnostic: AM9PR04MB7665:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P0gxk+2Wzbjg0wy9wzGs/yP+K3U6pM9BCGWFt2DwTyzOaMkdVnYZhUBYIiVRn9rLewi/nxez1pMKsBtqOp3XGYg/ubrrAIfoNynE7Ci704MJ7S/d8QtwVuHb+3mSA7FHdpwWfZYq5wBWBK39JDmOaPE8N06UyruQUt/bddJDia0YuWIm66M5/b1f2OmCG+bAXZICT80nk/5gAszYXEjtY16lGY91QKNumhM1O6TeriAkaeKCJvs7yIpC2MlNAOGmkXqQLbYsRuQvDy9f8BOwMzNYV4oZ8sf4IJweTixV2wczPj7PB9UIf5GlXd7C5HRlr4AFJG/MK0FhWQoK2VIUIqQfu4YSn+oN3xhLoD+B0IvKsu65cS+duHgKPGgbTsFzGO/9a3U2/ulrW2ONv9fKe13P5AMGGEsJ7FpkH8GY1eXH7ZV7uVXuDGm+ynFWNvVNIPXu1SxbN1OxgghfEJ7iEqAh3c1a0eBU28KeBmNa5Qn7i0d5hkXLUEDGvoWJNNKXNZmWC1YGdBL6dPmEQw5d+93qoPAOyWemzRw4BVqyYrlOFMJtjLOO1EwkgwOnYGzSO0qXwm/YB1ueMDoAUMWRZQnia3zBhfpCoQ/7AMjPGy9s15F3xTORDR+Pz1QtUZClTMWBocBTbUeroyZwC9+wdTYqpQHnXpabBIrwOLlVO6ybkeNM4XiOHc8bqwRjI2ptxkwFtLoQWuwy4v2ZabJBI3YlInZsmnDwTh9OcBFBdA5D4Xctar0TxBUdNAW6AuXLGgcnVmJk07H+2vxIKc3tdUplaA4QfdIw+4IAfyDREAVTl3kruGE/UkUcYs5hTC7nhFayQsGE1uzyNX0wL9tSm6ubxgfArpTA9cQZq8Z3MAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(39860400002)(396003)(346002)(478600001)(6512007)(6486002)(66476007)(316002)(66946007)(86362001)(8936002)(31696002)(36756003)(8676002)(26005)(6916009)(54906003)(5660300002)(66556008)(4744005)(53546011)(4326008)(6506007)(31686004)(2616005)(2906002)(186003)(38100700002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTBvZGpOazJYRDdRUTZnQ1dlQjkxWnB4c3pDcEd1clduM1JVTWlZemMyclNQ?=
 =?utf-8?B?U3RPZWQ4VDF4b05ITUw4d2o4TDYzV2N3SXgzSStSZllWTzE5V2lrd0dGQ1dE?=
 =?utf-8?B?bjhZR29KT0hqYW5oY05mTTRBSVBteUwyMmFLTmtxczNDbDV6b0lGV0wwRU1H?=
 =?utf-8?B?azZXQ3Z3RXdUV1hkUy9MY3M2bkp5ZUdpK1hqUlhxMk95aFh6OEtIMTB5Q3lE?=
 =?utf-8?B?c0tRV0toRXNySUpxZjdBMXl1ZVVTWHpSMzdIMDNMZitucUx6Zm00cTQrYkwy?=
 =?utf-8?B?eE5ESnRTSGl5YzFnY3hzcURxVFkybjRrc2dPVERrTVI4Q1F4d3UxRGp6NTVn?=
 =?utf-8?B?eHFpRXVtcnFWWjJOQmlWNXlqWWxiTVlrUWR2eG1VTnF0cSs4M3c5Y2NqSUtB?=
 =?utf-8?B?cFBsVGpubGRiMEpvVzNxcC8zZWRoTTB2bnNGdHI4VVhBSDJ0b3pXT3NlRTE5?=
 =?utf-8?B?a0MvRzZldzdsV05nTCtmenlLRHdxOTdXckt4QS9BeEMvV3BMZWhBZGZpRjE4?=
 =?utf-8?B?MXg5VlRLUWg5UGdSeEhnZ3cydTV4a3FCSnJQQkN5ajUyNXIvQXJzNGlKWnI3?=
 =?utf-8?B?RHBuazV4VCtiQ0gvakRjY1BqQU12RDVuYmRCTFI1MytOVDYvc0Rjam1NS2t3?=
 =?utf-8?B?YVlyRUFpQmxlc3ZmeDRPZklCeG5WaVY5S0pBVnFVcS92VDc0SStKVkVzbCs2?=
 =?utf-8?B?Ym44NVRUS0NkY2lGeHMrdktpUDR5V3VnMjNxdFFyNzZCTzdkRVh1eW1xSnlT?=
 =?utf-8?B?WEV6aUEzNlRXTUVWUjY0QU1LQUJmNjNXWFB2VHNlWlN3TktYUU9Kai9qdUVw?=
 =?utf-8?B?MnZ5alJKSllNVmJvbzBpQzNqd0szQkN1MlMwL3MrL1lWK1RYak5CUUJXQlZk?=
 =?utf-8?B?SExLODBKSHp5S2YvTFFwcjZMOVk2UldKQ2dkVFoxU2ZQcDVqWW1XcUFVL1o5?=
 =?utf-8?B?bjZQUzhUVTByV0JhZW9BYlFIdFRzM3lhd0ZpL05RTzY4M2QzS3E0MnZyQ0Nv?=
 =?utf-8?B?S0tkUWQwRjBEdWpPSEtXZ1BrR2N6ZUF0RHJMWEZRWVpFY1VYcFc1M1BiVzVu?=
 =?utf-8?B?WEdUMG5ZcEptZGZISnByZlkvRTMzWjZuNGdvbXd5RXBEa1JtTkJqRlpWU2hX?=
 =?utf-8?B?dklGUzBlekxFY0h1T1p1OHZCaWVkSlBaMWNHUHZXYWtZOWdCOWRZbDV4ZXRX?=
 =?utf-8?B?TWZzS2xRSWpaaTJXMDJqa2RGTnNnditLRlFpUTcwc04vVDkxeFVOblR4ajZi?=
 =?utf-8?B?U0RKVFdOUDFrYkpMT1YwNi9JNytvRmxoNmFxM3RsK05tVHNjTysvYUZ6aHgy?=
 =?utf-8?B?MlFpQi9LTnlFd3FQMmw3ZUwrNnh3WjEvbk5DK1Rhc1lJNVE4ZVA0WGkyNkJF?=
 =?utf-8?B?MUNOalRwTUJhcHVhYmRkcEdkZnFybWdxVnJyRVZGWUZ4QlZrUmJNMTRybzJM?=
 =?utf-8?B?cyt2SU1MckpwRWJjN1pWcllHWDhldXJKa3hlb25jQVhyL0xia1NyRlNrRDBQ?=
 =?utf-8?B?elNQcWFWRGxocDhocGljWTNad0l2ZGhCNFhObSt0NTVOUkdRRTl1SE1PMDA3?=
 =?utf-8?B?QVg3UlNDVDhuZy9lUFBDTDlaQnk1L1FvUGFjaElxSDYvcVU3YkVKVzA5OHNw?=
 =?utf-8?B?RnFHMFdaODlIeXRBbFlVU3dkbjZIa094RlE1NnJmWWhBL0t2RzFyQzZnbW41?=
 =?utf-8?B?aCtldStiUnM0RGI1UVhYancwL1pCWnlQT25heVJ1YjdpNWpyckU0MGFkd2Ja?=
 =?utf-8?B?T0lYYzdFb2NqMmhmZkpXSCtIMm9CalB3REFBSEMrWStRMlVTT3ZJd0MrRTEw?=
 =?utf-8?B?aTJ6N2JFZzZzK3JLMW1ZR2JwUTVpNnh3b0tZNHdKaG9kaUJaNEhzTWtOd2cy?=
 =?utf-8?B?a3YvYzg3TGRKc1k4eEtUenZybGhrVmVCUmtwTThRNytpeTJoczhlNHB5VWFH?=
 =?utf-8?B?dW84cFNyQk1JYmJXREUrcXk0K3lsaUFBa2w1b2NlZmNpNjlVa2ZWdWpoRjZ3?=
 =?utf-8?B?b2hVZE5ZU1NQQnYzWjJOQlRDdjlTWERRRTE5VjY0UjcvdEZUaThESEwrOHk1?=
 =?utf-8?B?dXNydlhXODQxdVc5NVNwdFdIM205ZlVTcFZrNzgwektqQnVGQ0ZUa0tLL3Ja?=
 =?utf-8?Q?eQAzwSGMOaoheUFfl4QzMQ7wQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d16cfa-30e0-4984-7a49-08da5f658bfb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 15:38:17.2914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vK0Aqd9yZJbttThOL6WRVw/K/CjjVso9t8D0bbIVVxsJ8VBGY9BjHl7Klq687Kvd3IC4GVrI+G3Y/33eAVBJoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7665

On 06.07.2022 17:17, Anthony PERARD wrote:
> On Thu, Jun 09, 2022 at 05:52:45PM +0200, Jan Beulich wrote:
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -465,6 +465,22 @@ endif
>>  .PHONY: _build
>>  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>>  
>> +# Strip
>> +#
>> +# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
>> +# is installed. If INSTALL_EFI_STRIP is '1', then the default option
>> +# --strip-debug will be used. Otherwise, INSTALL_EFI_STRIP value will be used
>> +# as the option(s) to the strip command.
> 
> It would be useful to also document INSTALL_EFI_STRIP in ./INSTALL or in
> ./docs/misc/efi.pandoc (efi.pandoc is where EFI_VENDOR is documented for
> example, so probably a better place for the doc of the new option).

Well, imo it's far preferable to install _something_ that works (even
if it consumes more space) than not installing anything.

I'll look into addressing the other two comments you gave.

Jan

