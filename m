Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126F57CE1FE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 18:00:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618707.962722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8y4-000808-Ka; Wed, 18 Oct 2023 16:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618707.962722; Wed, 18 Oct 2023 16:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8y4-0007wq-He; Wed, 18 Oct 2023 16:00:20 +0000
Received: by outflank-mailman (input) for mailman id 618707;
 Wed, 18 Oct 2023 16:00:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt8y3-0007wS-9U
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 16:00:19 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe13::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ec5486f-6dcf-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 18:00:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9098.eurprd04.prod.outlook.com (2603:10a6:10:2f1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 16:00:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 16:00:14 +0000
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
X-Inumbo-ID: 6ec5486f-6dcf-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z80b3eLRc0v1MUCz5Fx0b1Rpjz9mtG/VIzXzT8SwVDmrzBlvXHGNbg5VFucR4EVmfTna0AuLyFgFejlA+nvFNu8P5QBxESFjfyJuCZNsUwiYkeLTbaxLBOFHvrhAEEhcQztpZMSxrCLixn1fh1gdMP+44J0QlYJfZph7qE3V7m2DHN7xRKz9kggU2dwRsZ0BMDw5hqdsyaM2oglLNhmo4p1QhTHwUni4B1XSRxsAW7/Ba6/hUxmU7nJt6b/j/6qe11wXXYRysDxr54thXpFsEntqEY2OeVm72pHsf/M8UgfbA/sLLhT1uUXDRQd8+2vc4/+UQXzM6ZuXX5AzD+rQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmI15CyJL8eFofYdk7/Jj9rLkDwGUR1a2m7urJ6glz8=;
 b=f9XGCrgn0bos4nWk5uw8e2NHBTlufBpCt5TnjGz2EBFERWUC9Em/WhdTig6+95nb8e9Xfh4rSZp/iEOQ3v/6D/JQvBXkhfR5cGm18qLeCWprG+13vzWf0eKWIX37e7lYX2WRP/S7H8vacKUlVxwiL+0CEZTWt+uxMFfoFOcJDLqpW2jW+f38QTs88frXEU9R/udLvIlRYMw1haOerB0f2E/RaFRtc/uzJJnFeu6LksTrzVM4hMvOte4LlXGDu7AIUuDkmfzuEt0rMewLnDEcEL2ERNkZVYTF6fn9dKD1Qpm8uJvZOSCg+N0RgVRe2sMSXGiDCFiiCZq+ybUJ/BVnXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmI15CyJL8eFofYdk7/Jj9rLkDwGUR1a2m7urJ6glz8=;
 b=irb6ZRSN5UrA0gpvP67z1iET4Gqkz09pdGvszk46g42n8A4eaaxbdv9qpPudshxQiM/OTSxE7VICmDMzikLW7iEH0QrtARSTniVHJeKGtnWqBBjYICLyLAwq3NVTQ4s+1WPdqwOnUbojADFa/3Ocyw8KJeGYHvsaBOlGdEMT+wnVeHUwHZqhO/f19KTr7cS4mqO4h941Tz+lVY2SMoRRAhV0V/ZDCoxAGJkkxIs3nzOVHfsQievnBjvUwbDMZ0ubmCcOFfD6yh71EdjwgQhEMiNYBpRbL/jW0myiQMGZfpZD4tBv6VseSGm718igQq5KtTCRz3N1KSh3h05rfoP3rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd47214f-4286-c2af-d7ad-c5aba11158a5@suse.com>
Date: Wed, 18 Oct 2023 18:00:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 03/13] xen/spinlock: make spinlock initializers more
 readable
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: javi.merino@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231013094224.7060-1-jgross@suse.com>
 <20231013094224.7060-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231013094224.7060-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: a3634cd7-922e-430b-e86f-08dbcff35096
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EdaJEaQR/omlGofXROe2X307W6KoY2QHW7p+cnvkPpttmf7Q2Fn8+IJsPlpNYrs6Uye52TPErikgpFllsM3PeC74HkXK+vIJU8PFpAyv3qyLEWgKOK05HaSjCpX7cFylU2Az2QjWGwjU6mVyQIdDuCeJg29LPuSVKVp0iZZl7vaMQyMZWDFJgV4CGcaHETNex/0cls9yIMOgdx1uavMk4aBRQTw15HtzsBypkJEtrAMmH4FDwxNQcn6c1wGyKvt7neM67BJuAY2hvqn7sqR9wfdM3qGM8osIgrCMWNMWszrHrIIJyvZ17H5OKm+Awf7KBKJzlsdidnGyskcDqiESCDt+67L61EtwalcM1Mz0Qvk62PvDxYWptbDVAfVK2cCNu2Uazz5MV32Gl5PTotQG4F+z0PgBn8tK9pq69xw3L3A4iW/vjnmzjO7pdILS/8I29EJPN9el8oOPeP1HGMDtJabzW3wBalDinaXJSQoEdkIfpi7vLN++xh0Gj1nhKrlTPmNi+ndfbRdOhHMyYb9w+OHQiHtkXV4fop4CsSoPMlJxvC+QvjR5kRGUKlowaAuOF68vgk2tQYfSP+Q5BJVs8CPe+WEo9U+pSKTv+BVgTdzYSx7HdRFKrk1+5o+uSdwWCz5AWywuxXZp6cX435MZjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(39860400002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(31686004)(26005)(38100700002)(41300700001)(66556008)(66476007)(54906003)(8676002)(37006003)(6862004)(4326008)(5660300002)(66946007)(8936002)(316002)(86362001)(6636002)(2906002)(31696002)(558084003)(6486002)(6506007)(53546011)(478600001)(6666004)(6512007)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVZ0NXVyL3BSd0xaOC9RSWNqOW8vb0tjdFZaVUt6eDF5RUNrWStGRVVURnpS?=
 =?utf-8?B?MTdoT01JUzJqbWJZNkpuUDluQ2pITWU3UFB5VlI1NEdhckw0S3pCMGZVdVZx?=
 =?utf-8?B?OTcwU3p0ZnM4ejh3c1UyUTltdnRjVnhXTjErOCs4MGljOEhXTkF5dnBTSGRT?=
 =?utf-8?B?cFAyejZ5MUVVdTgxcWhOMXkwREk0ZVB0M3pXLzlGdjd5QVpRN2VxNm1TOUJP?=
 =?utf-8?B?RmgyZGdjbjFxT2xJMlNaR1NWQlZZSHdUTWxQWmtDUUJsT3ZqSFRucDNHbEtN?=
 =?utf-8?B?aENMQ2J0SGhRVE00UXk5NDcyQXo4aTA1UWtvbUplQXRXdU5kWlB6ZzUvMCtJ?=
 =?utf-8?B?UDhqY3oyTFcyUERkWnJPd0FsWlpXYkxjUFJzTzlwNGhHamIwV2lTTHFJeE1M?=
 =?utf-8?B?ZEY1T2hpV0pGWXVtdUhnRXlCODN5T3pjQVVwdWJJWStGdnkrbXJmVXRwSVFy?=
 =?utf-8?B?a3d6dmVDL0grdWFBOEh4b3ljdFBkQjFOT0V0Rlp0WjFJdmxSQ3JtSDFuekNX?=
 =?utf-8?B?Z1JqV2RuampRVWZrREJObHZrWldlaTZOSUp2eUJWMzhlaDRmcHdZc2RUUUNP?=
 =?utf-8?B?OEZERU9kWGN3WDlxc09wTE9LOUhjOWY2dWJoY3V4Nm5TZ2IzWklxV1JVS3hk?=
 =?utf-8?B?NnNINUVBZEo2U1dGejE3VXhHRGJZekZkQTRCOG5OTW5hZGhVTXphWHoweW9D?=
 =?utf-8?B?bWI3SitQNVVaWS9LUUlaQmFnMXFReXA0RHBiRDJ4bkFPSFk5Sks1MTVkY1dp?=
 =?utf-8?B?YzF1RVZSbEVzVlF1a0RXaVUrN1RVdnZSY1lxWkkwek5wNkhDaXFrTmliZktQ?=
 =?utf-8?B?aHVFSzlDSW8wNzJUclFHMHlOSnZMUjQyaE5tRGk2OHYrQkxXcXhBM2w1a01y?=
 =?utf-8?B?QXNqdEZwNzlkNGN0cFc2cmVDYmtjeGZBejRlQm9ZQ2MzNjcwTGRoeUMrR2Uz?=
 =?utf-8?B?TGZEZkNmM2VGekUvUXVGWW0xeDBTWmY2QS9GMHEwWHk0Umthd0VSQWZnb0Vn?=
 =?utf-8?B?UGcrVHV3cUlBaENNWU5QS3FwQVcvVlBxT2Q5V0lhdXl1RnlZeWJiYjVmMi9I?=
 =?utf-8?B?VnFjMDBIdWl3eVNFa09uK2R3MXpQQnFWNVcwR1BCTnN3MHhSVzlQZmpLUTJT?=
 =?utf-8?B?VE5OZUhCZjlGd0FpeTlGdWRIbXNKejFORjRIZk50aXJmM1FwbVFDOEVDcERT?=
 =?utf-8?B?Q2VpM2VvbUxsd3ZNMk1NaHFGQ2wrZExQYlBkVG9mTEhpcFc1NmlaVTFZUmZB?=
 =?utf-8?B?cFJDeGc3Umd0NWovUERnQ3ZtQ3A5YllPZHhXdHEvUjNuZUlwc3J2RnkvUXJm?=
 =?utf-8?B?Ym9CdDZmUzRkUUllNDhCMFlJQjRnV0ZnT3F4SW9wb0VUNExtOVc3NkNZcmVM?=
 =?utf-8?B?OXhJOTZiUjY2WmgzRElQaVRRd1FORWhMV0FqZXlOMVFTNmxJU2FCZ252WENs?=
 =?utf-8?B?RWNzYnIwNFZSUzg1cjRqeXpidVFWOWRFWE1oeWZhc2RxU29Mc1laSHZoNmE5?=
 =?utf-8?B?dG1nVGZGKzYxQzZLREVMQTd2WTZwTUVXU2JLY2tBTjZPbHp6dFYyZ0lvY29D?=
 =?utf-8?B?cjAyQVduSDhCc0JVZWpwTnU5TGdPckZyckV5aDluTVdsb3ZPTGpoVWtrcVZx?=
 =?utf-8?B?L2hEbjNzVFhEWElMcW1oZGtMY0Zwek5WTm5PcjlBOTdSaXlhRVRjQ2VDeGs0?=
 =?utf-8?B?T05jRE1ubVFxek82TnpBZ2VNS212MTVyc004QVpNZytIOWdONCt6WWtEdm5m?=
 =?utf-8?B?QU1uK1VRT2w2SEtaa3hCOXQ2U2VkeTM2NTRWWC8zS0s4dDM4RjU1QklvRVVE?=
 =?utf-8?B?a1pycjdTYyt0MjZkWFJCRnptMG8vdVYvWEQ1cGtwS1dnR1hUOUFHZ0ZrR1lV?=
 =?utf-8?B?UlpjVkhTUWxUYW9mcE5qREIvQ2JOQ3NFM3FUVHB6NTlHcGU3S3o1OGRmWFV5?=
 =?utf-8?B?NktEUjhJdkFvMWp3ZU9pQlc3NTRnQXJCMkpHR0E2MlpDRE90b2ZVc2lNbWpI?=
 =?utf-8?B?NmtmTDRGQWpqRHZVTy9LSXducS9laWlrL2p2VUZrRUJJcnZtL2dNeDVJbVV2?=
 =?utf-8?B?Q1IrUy8zd0M3K1FiN2lnNFJEU0lFR01sR1EyaU9Jdmdwai9XaWVRMzVRNjdD?=
 =?utf-8?Q?VeXdzH5HvVKT0BeLsWLP0u5PE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3634cd7-922e-430b-e86f-08dbcff35096
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 16:00:14.3171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvYBWAkDEzWCpwEuAvYyUl/WwZzSu4qTE15R7gUoNFc9CFDLRfk2wTVgJmYY7YW6uTJAH80UJ1/+DkHArh4E6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9098

On 13.10.2023 11:42, Juergen Gross wrote:
> Use named member initializers instead of positional ones for the macros
> used to initialize structures.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



