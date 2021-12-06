Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA646A0D9
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 17:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239332.414823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGbU-0001jV-6g; Mon, 06 Dec 2021 16:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239332.414823; Mon, 06 Dec 2021 16:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGbU-0001hc-2N; Mon, 06 Dec 2021 16:12:36 +0000
Received: by outflank-mailman (input) for mailman id 239332;
 Mon, 06 Dec 2021 16:12:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muGbS-0001hW-Ic
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:12:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50f4e4b5-56af-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 17:12:32 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-OerlG2WINJmbGQcW0YRKEg-1; Mon, 06 Dec 2021 17:12:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 16:12:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 16:12:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0073.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Mon, 6 Dec 2021 16:12:29 +0000
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
X-Inumbo-ID: 50f4e4b5-56af-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638807151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2EeyQvF3gtY2MjpZQJDxVwGagS3cXTUVFohohBdYWiI=;
	b=Oq/OOPAbwRabn5nF/h0pYG2C19KGFtUCXmmA+Cb2CVKvQFqwqZTI8xwsojYPOl/rBs0CPI
	2dDwbasGBD2TaZuaHWp29vEBmJtbhgOHg7I0kg3bGlb2ijGWE/Nf2r6XOQ5C8k3FeJ3pru
	ToClg2BBo1DvAkpmtUPcXeXdy67ic8g=
X-MC-Unique: OerlG2WINJmbGQcW0YRKEg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwuohtX+TtOncdOXbWaV4UQOBd9dfx1yYqqiXBcKSl9J9dCZIx82GvxXjuV1sNgZtZiJZ6p6sbAThf/x4UDSsZPgXpFklYaQWzBdCj7vbLC9GPYTO5vtaNSj3++5d3WfhgMD+NurItKjz9DOVWqg3dseZxYlIV5iBoPMiB66UvhDVWrt4fLdFoFbzaReZffPeaYhrSVRwDniDDXkp8CUZpZXlFVxndiMU6aZcvKyEPe4KjHjzkE2HTIcjicNtEsgILxzncYNBQjXEAbrh0MJWdI7trXFZ9W6yk++POov/68uG0JO4h4MktBLc4iLdxaAhW0Jonh4xyKHW/rCmLblvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EeyQvF3gtY2MjpZQJDxVwGagS3cXTUVFohohBdYWiI=;
 b=eVsajxqD+U9cVO7UsPz/gRK12QwG90BknFY7OV0K1M/Vp1ETFMr0kwdSnvJOpxC1mDhE4Ys5IVZnn4JiUp9UaKNtiVLXAVGpKwoIewwXbGAPCoDZx9LhoimjaKX8IfYxtVuUfTxy7JL5GExWSzlj/pYnNO2GaFkcqSaOJUEZMUrBbjkV+c7GSSP1hzuwAfuwurJohj1E6Tqhdnz4cdX311iS2f5spRr6m59OG9FOcDGbltGZOBpLS9rol6CFl5tnKX/QWTKLRXw9ux9EBlGuLaJU1PBFMIp6ba19bhLi0/ZgwQGOMYmDq1QRRmKISYTPjisKVH31QbvipU5MB7XPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a6ffa5a-6884-57b5-c296-904e9b0b4c78@suse.com>
Date: Mon, 6 Dec 2021 17:12:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
 <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
 <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
 <24992.55453.893877.246946@mariner.uk.xensource.com>
 <2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
 <c3e698ab-afd7-9638-3f7c-c7599908e173@xen.org>
 <e684eeca-a798-9cf1-c8c2-1db2e02bb65c@suse.com>
 <53cd2f84-f011-9c97-a108-fd946535920b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <53cd2f84-f011-9c97-a108-fd946535920b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0073.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85ff5f29-da3e-4cd0-6f62-08d9b8d333d9
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7152F209E3292AF5A11CFBADB36D9@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EkXFNk4jUpY1ZGZ+5OTw1ntSoBxUugX98ApjKBSWv54DTzLZnVRfLVnNFXu35Mu6OQ3n3odZuH0+i5ob8EsyV8XHPbtCwd6UBQpQISDUafbzF2DMZJs36ncZ7Wqk9C4CTY027BoXimOk0m2bXE/goo0VBCFkv6o3DPIbQiheTi3TWrv6mLi4nbaocgrRMC9G+fUOIKd5lwg1yazUMkMRdO6xvHgHPeqrGdYlyQFlROFLLWL71eS6T6IeoAvxeyNzGy8AwcX6W9MJTGdSyaKvpTPApexLWrbEZlRtadZd2dnvkJ+hOFFUIjBGuFDuUvB8NoqcVfo1/Bdp0lVRCkaS+RB/jPlKGSurHHhHjaC7KV2xr3B7m/xn5jB7y7x/l0BpQvRzQldJ6bA3LT8Mhqvl/UHI39eV9ImMtXv2Wv8Rbx2rUkpcQsG8wqHRgUKFnvXUytwDCtnfzbtO3NJy9cFv/e6X7ntUk6yFYPagACw5wIdMnDQ7wOP1WN1SBW33O/WahnanKpNMeCQ1bLMQWTWGxShmKZ+XiUdTAQ13hNHOKfPVJftkwkn4RY8Pb2GzLsJT0Pf0il8Wn8C1WG7+A9PwORoDg9JXc71R1TIaR4hZ94DONrarN0lgIZj9QbtvFx2hEonzc3uSVsY9TPi/Bnplb2PuD5z2dvelEkaJz/Fk89/g51GBp5xgsBO4MEQf0MH6WXGY6T4dhmr/i6YgiWG/+UuOgtachhecV+yECNhGP8SgJUN7Nn2nh28PABOnYbk0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(36756003)(956004)(31686004)(53546011)(4326008)(6916009)(86362001)(38100700002)(31696002)(6486002)(26005)(66946007)(54906003)(8936002)(66476007)(2906002)(508600001)(16576012)(66556008)(4744005)(8676002)(5660300002)(2616005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGFia1hyeWM2MnpBVGtNZlh6c0ZrTzhlTGM1Z216aWJUOENnS2crWDRQSFZZ?=
 =?utf-8?B?VlZVU2lMY3BUOCtFVzZDL2R5NzdjQkRSNHZNOGQwS1R4Qk1DYmdnQzg0N0sw?=
 =?utf-8?B?enFMejczR1Q1QnM5eGRtdytOY3hyZGh1UnB6NVUxZXdHQ25TY1krNnNZbFln?=
 =?utf-8?B?MDZsNGx5b0tOYmVmQVFjOVZoakw1QmEvdVRONzR1MUQ3OXJJelRFaWxUdzFh?=
 =?utf-8?B?MHFxWkNpdS9sQkZXbXlYQVN5dlZtaUJrb05ZcGJpUHloWW84T01lbW93ZVF6?=
 =?utf-8?B?dnByeWJzYzdqM3RLQTY4MjNiR3JvSHJDZDZ4dEtNcEt1WDU0b3ZUYkdMQ0FL?=
 =?utf-8?B?aG1xbVBnT0l1MUFCUzNjeTNBQTc3T0tCUU9SaWxJRm0vNlVTd2M4N3RpYVpL?=
 =?utf-8?B?MEphY0w4U2N0SVdEeldOejNqWUpMTmdFZjRKTE44WWw2aTdBQnBEVXJZVzVz?=
 =?utf-8?B?dUhGbmZDVmlVU2NCY2pLSmN3K1NYdEtoMFduZ2pnSFJxYnhqQk9VUlA1YmUv?=
 =?utf-8?B?d0lZcTl6MWdBci9veTVwVDlDV3BjU3hoV0lPRm13ZUM2V1VvRzdPNGZNRzM1?=
 =?utf-8?B?cG41WkIva1lDSittWjZUVEpHY1R6RHVMZnBxbDZPbE9VUk44clRqRnZ4WS8x?=
 =?utf-8?B?QVNPR1VXQ2lZRGVhYnN1TG9UZTVDZGlEQWErOXBhNkhOSGd0SVQ2N2ZseGcz?=
 =?utf-8?B?QXRDZTFUT0RGeWFLUjFOcklOcWptbkdNdUZtWUZmQkhadk9PKzViRTk4bjkw?=
 =?utf-8?B?b3hVOHVCUHluR3BqNGs3UGw5UmpFbjlQUXdtQjFEWEtoajNsVC9JOXQvQ2Ey?=
 =?utf-8?B?Q2ZuM3EwWVpkS05UZnNNT2w5V0hMR2RvNkFoMkN5TXk1MS9iK2d4RzdjYVRw?=
 =?utf-8?B?SnNmNVhJLzF6eStiOURuNWhMTUZmRzlUQVU3SnVCejVZTW1JaUszV2hQaGNs?=
 =?utf-8?B?NW5sUWdZMlJWQTA4V2RtTk15R3d1UkMwb2VneVh2dDUyc1dZVDZKWXRxZU5G?=
 =?utf-8?B?eWJUd25STm5lSkdSQkVET2JzalNkQVB4RlcwYk45NjhtdTMzUVgwTGpIdEFq?=
 =?utf-8?B?YzNBdE5DTnlMclJadUxneDBDNGdGNzZIQWtxT21BSURPRDl0SUNWOUQrZ1ZN?=
 =?utf-8?B?K0k0RWdWNVp4UXRQUHk2VHVtVXljS2xoZTlQTTZuZnQzcTJmc3lnUWtnaURp?=
 =?utf-8?B?L2FPSW4rUnlOaWlOcHNrVzBpN1hiaXlITG1ES2tCVllGVUdyNDlpeVpGa0lC?=
 =?utf-8?B?MktoWUFTeTBMKzNkRndrWi9rdGR1RnNhV2hCU2s4dU1TbFBzZTB4eW1wSmQv?=
 =?utf-8?B?TlZOMDIrL2hkVE9PSVNGMUJjUUtad2lpQkQwMFpSKzlCTWxJVEJJN05ZMVFa?=
 =?utf-8?B?TlhGcmtFQmh4TUQ5UHUvRFZDbVJtQkhEeCtCY1RXTXdFb3pGaTdwN2kyK042?=
 =?utf-8?B?NlJobE9zZFRVMVVlcS9NL1ErUnE1OUo0ZjVtRjl5cmFsUGJjRkZHYVY2dFdP?=
 =?utf-8?B?b2hZL1JjQ3ZXZndQcXJxZHNjQlEzNzBoMU8wWnRkZW5GaElNSkxLQk5TMDVU?=
 =?utf-8?B?czgvNGdidkxoT09mVUR4L3Nvbkw0dHgrcEtWbk5uc2ZidENETVhCTjlFeWNG?=
 =?utf-8?B?SmFDQUlkOGYzejBPRTJHa1hJZFovdmR0NUZMZHJpNzh4dDRFdG1uMHQ0RTFM?=
 =?utf-8?B?aldkZEZldURxUUF2UFAwU0tEWGpUSllnRjlaRFMrTVN6TG4wbFByTCtHZmlu?=
 =?utf-8?B?V3hjVlRlaXZVcGEwbjFieWVDSFB1RjJCd1FVVHJPNGhVdWhYeWdYWjdKZ0g3?=
 =?utf-8?B?N1VEdm9DOFp6aEpER2xMc3VFd1Fhb0lLbVZ2cEYwODZpMmxCcWdSNm1saUNr?=
 =?utf-8?B?L2xWTU1LcTMvTHlEV3FnUW1qOXNJTlUyL0JRWSsrYk9WMEQxYXNOWWljS2h3?=
 =?utf-8?B?NkVNUFY2Ri8wTEVwMW5HME90dnE4WXZBanVDY09LSzBrV1prNm1nRmcra3Rh?=
 =?utf-8?B?Tzl5eG1GWVg1QVQxdXc4eDNxV2oyenV1VkhlcGdQL0NjaVE3YzRNcXhIcFNw?=
 =?utf-8?B?VVZGTGgzK3pjcm9KZ3lTejVqTFhGQ0dTMTZQcG5GemRobXhBWkQ1eDJ6cHlo?=
 =?utf-8?B?ZlkwQ3MydXYyRnJGNmljb0VhRkhhaGs2OTlhN3FxVk0xdXd2SWZna2RLU2dz?=
 =?utf-8?Q?CptHWlQ2P2pBAd5N/g9E8Xw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ff5f29-da3e-4cd0-6f62-08d9b8d333d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:12:29.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcAq9v80bVJLO37wZJZksZe0ure3Gm1b8txwa9FFbPFioRce/kz0jnWQ44Ot57tPPUEcbFj4pTYYdZHns0ADLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 06.12.2021 17:06, Julien Grall wrote:
> On 06/12/2021 15:06, Jan Beulich wrote:
>> On 06.12.2021 15:28, Julien Grall wrote:
>>> I am not going to ack it but I am also not going to Nack it if another
>>> maintainer agrees with your approach.
>>
>> FTAOD I'll be giving it a week or so, but unless I get an outright NAK,
>> I'm now in a position to put this in with Luca's R-b.
> 
>  From the check-in policy section in MAINTAINERS:
> 
> 4. There must be no "open" objections.
> 
> So I think this cannot be check-in given two maintainers disagree on the 
> approach. That said, as I wrote earlier my condition for not Nacking is 
> another maintainer agree with your approach.

Hmm, I did address both your and Ian's concerns in v2, admittedly by only
going as far as minimally necessary. I therefore wouldn't call this an
"open objection".

Jan


