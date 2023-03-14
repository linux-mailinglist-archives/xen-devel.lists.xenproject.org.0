Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB216B9873
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 16:00:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509702.785981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc67c-0005oT-M4; Tue, 14 Mar 2023 14:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509702.785981; Tue, 14 Mar 2023 14:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc67c-0005lt-IL; Tue, 14 Mar 2023 14:59:28 +0000
Received: by outflank-mailman (input) for mailman id 509702;
 Tue, 14 Mar 2023 14:59:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc67b-0005lT-GV
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:59:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d03dee37-c278-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 15:59:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9623.eurprd04.prod.outlook.com (2603:10a6:20b:4cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 14:59:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 14:59:24 +0000
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
X-Inumbo-ID: d03dee37-c278-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFB8V6Rlue7+1m5qLQIihZyC2PqtdLcwSzg/A17OAC0cYFoR8r8wBOc4uek7r80pzfxzjyRQIYrTcvxGtUEcd4cDh7uRKEdbItLswJjQixZ+wX0tLsII2c5F5gNjl88qXTHTDAJ8UUzy4F4MhuHABF96LWqvNZ9R+CrjYyNZHsRQWm5/wZh3SU9HDZAHg4G2LHiMvuYfChE12BCk8hMzoeFa0TObrX6gKBxLW+CBb1XEQvXli+Q+6/l3+SDI+8lhJvNIxZgx8vK2+mbkhTaouFT89LBkYSb2m9y0tO7u7nw+xh1sV5ZwBdEhHdhNaL/QCju8CwtOvIt/tVUjtYv30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1MtJRyDUdSf6zjlzWwh3YZ7KuDxKuh0rHp7KZqKNoE=;
 b=F/4WQVoj9duJXWagqd5O257zprw5auk8Mb+tF/CeWmZOydn/c7Dgthp3cRN+Xru5GzDGzFz8xTFTkjodr4s8ub1IO8CQSgnoj6CG5ngR7lpTR2lgPMZKR0mCYHP5gQ0Os/SN1AhRjNPTpPpRZU2Fr8+hc8/hEcwR1ioVvMYMNvmKZtIxeOjOtCBcD0GbsM7xjd4G7AO0civfRmebOlGg9jkHv2u0p2V+93m1AcKsFd2HsB7q9aacZL4lqccBsIgApzxLhr45sBQ0vzzT1ImnpNKRsNkSETH8sDW1ZN4mGo3SHcqlfO4r/Ld/SHhdZIotCTdV7jTt0oFBig6nTYBUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1MtJRyDUdSf6zjlzWwh3YZ7KuDxKuh0rHp7KZqKNoE=;
 b=wkfC7nU0qNWwcToRW6Q71nHWBWUBXs8jAOgNSossnvDjJkK4SVS8JPDjaFtQA+DYEw52vsnCoQ18Ow4pD3vCm9Ui2Q6jS2LRlDxll9VQ7Go4Scrch7BTBqwzvNy5MLqb0qqTHnHnwEghHxQ2XNVre8Vcmx7ohRabgS2d+0DIZESadpTcvlVY33RJIEXjZJSxMcwgYQCfIu+tX9VPfwHEIyPkrT4oPYrmyj4i0R4ZiIoZnSYKscr2kRnL56OE8NsfrISmzWwr/iccbs6R/eOxrEEwexvFN1/hcWyeNkusd/TfYw/omuodNnC3bSJIaNF96WIPNQ5f7sK7ZsoWMpCXFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7db90f7f-3344-75bf-120e-2113908adfb4@suse.com>
Date: Tue, 14 Mar 2023 15:59:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] xen/grants: repurpose command line max options
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230314144553.8248-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230314144553.8248-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 469211a2-a93d-4b7b-fe2f-08db249cb330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q7CXtyY3brN4v2cBKFdDyhc6iIcHFMUnFWBbLhp1gL2A0mHdqDtLePtO9D7rnU0f/wQYq9m9t8JTao//PJBFz+66oEy91p0OnZpbfGv0zr1ArpVJMsYg3J2KNG3eaNu01ROqnwjrTnuyLkLrNVzBubrddfnCtA7PtFphKlb137hvYY0hHEoBbZ2aldaWjxmN1LPfQPv2SAGmtcTmv9R33IBYt91xNumgbw8WpocqvL0ZYMmIwWIyab/9JEYTNZnrUpZqUJvt4ybHFegVPjSCIHhAPHGHnFakQGwt8LaPRW4DUQ46Y7NzV+uqwrNrNn352W3tU8wzBvzyLpVg/Gyk/VxN8GmAxFw1RLyBh1qsT6g3PTsWtlCvjsnTLORVueH8BILGCIRWZ7aTfzpuXllt1N9Hbz/c5d/LXiUB/eaIz90sKELX0wmZL6R13yF2UX8WUAfftXJU+gcZfgAoAbkU9inqLBjhDI0aQtyKDY4FInVtKq+ANylRNHBCMGyQpnEwAK8VwppjzRopvKfCxVHGRt4h52fQvI7V+CegultCeHfEkExrPSNVPn89YVReTvH0inWh4rycSSczY1ajOoaxCs8c+6XAdPRbNlKYFOniRhzHhkxNm7vvyQ4x5BABzbF3cSqmtxm8hMC3ubeGwTle1JXRLBEw/4mzc3BXzVoSzlayhw1RfrQ7s/aHy7Elk0KXv5ceBmBLHt+umQ43LKb90Gozbm4v7wYlI5mIcvHn1FI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199018)(86362001)(186003)(31696002)(31686004)(53546011)(6512007)(6506007)(26005)(2616005)(6486002)(38100700002)(36756003)(2906002)(5660300002)(8676002)(41300700001)(478600001)(83380400001)(316002)(8936002)(4326008)(6916009)(66476007)(54906003)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmdXZTRKMXpOcGJmd3krN0pueiszWEkzb21xdkxyVUIrV0J2eEFjNkdRSllz?=
 =?utf-8?B?Uk9yU0pORUNiWEZacjNQSFlSQUVZNWxRNW1xTkZaak9vU2JDODFLYkZacy9j?=
 =?utf-8?B?L3JubFhVTHdVaFZqNitvRmVZRUVXeCtISjdoT3BKV1Zta0l3OXBTNVVWT2NF?=
 =?utf-8?B?enJHM0RiR2xJdzdTWFlvVVZ6YkwvbUlNcW13RFF3ckcxSzVPYm94c0FFdlhI?=
 =?utf-8?B?ZjkzSWQxbHdPeUs0Y2pMUlBjMkI0c0x6ZlZxUVBpeGN6TGY2WmtGSmlzR3NW?=
 =?utf-8?B?d0pVQjRjZkkzUFl0dkRDbEFDN3pyalEza2lyVmxqU3hlNmZVU21ROUd5WDhO?=
 =?utf-8?B?TVZIcDFWYnpKblBoQVNMU2tIWU9jbk1jZUsvYTJiMWtQZFBpeFYvK2Y1Y3Zr?=
 =?utf-8?B?SERvRkJCamhMN0F1RGk4M1ZLenpXUWRIUmJiVGtZbFE0MDlvV1YzblVabFp1?=
 =?utf-8?B?ekFFVkovOThOUGQwLzJPMW1tTU5vcU5zMFY3ZG1uQWtxNmxmcnBMenJ0WW5m?=
 =?utf-8?B?c3RxU3ZKYm04Zk5TNWVSeHQxUFZ5ZjFwck4yeTVySDFoNno2Zm9Db0JkKys4?=
 =?utf-8?B?Q3Izb1E4M2ZGZVFrQm44RHJkWVp4ejNoL1B4SVRGN09HK3RLamJkY1h2Vzhk?=
 =?utf-8?B?SGRhK2VOaWh3cXdkajNlQWZkWllQaWdNRkJXaDNRajRwQmorTXpKakM5dDFD?=
 =?utf-8?B?R1B4d0Jhb2JaSjY2K01EOVdrSC9zbEV2UVZtUXBWU05aR00rNmcvOGJvZUlP?=
 =?utf-8?B?bVBIQUUwam9Bd2ZjME1lV2U3dkh0YTZPTjN2bDZRVThuR0lNazg1bDlJWDJI?=
 =?utf-8?B?WFNXeTJUK2VhWUduTHdmeVdGSnplalR4T1hJNGtOc2hTTHg3eUFRbGsxT2kr?=
 =?utf-8?B?MU9PY25ESkNqYS9kalkxTjhUYzFsYVkxVXpvOEkzSEYzZTRudkQwVmJ0ZWJ0?=
 =?utf-8?B?ekNwTmpOUjFoYyt3V0VSTm5yZVlyQ2dQYkVhbldBTnJDNUJ3UjFTdFVKNFdn?=
 =?utf-8?B?akY3M0dwS0s1dnRRcjVBbDhzUndGaENENXRaVHF2NkpJUldndm14NThIRjZh?=
 =?utf-8?B?WitlalhIRm15UEZuRmdLS2VJdjRkWWZFdGdiZkd6V0hjQTkxM05NcVRuOE9Q?=
 =?utf-8?B?Q2hCaDRsQ2JkSkNwZDk5ZXdpMkNCa25oQjd1akt0UG85UU94S3A1MnpuQmVs?=
 =?utf-8?B?aE9iZzZzQTBCZGNYUVUrSk50T1hScUU3REx4TDJYMEsrSkZBMVJSUkErbDIr?=
 =?utf-8?B?ODdITGRHUGRRcUg5RDZRM1R4UGNSbnZPWnRVV0dKbHBraXptdjYzQmZCQ1JZ?=
 =?utf-8?B?UURaNU5yVnI3eFl6Y1lYUnU2T2ZOeEk2cDhNNngzSWFDS3NTT0FYaFpGWVVP?=
 =?utf-8?B?cW9ZY1JqeVVML2psb2JhWkt5ME1PS3F1NUZ2dHhZUjNWMjJkWG1sYWpGWktw?=
 =?utf-8?B?V3NGR3N4Zlc2VjVQSVhMTFVyTXBnUFQ3WFkzZHRaK1QyMzd2UytRekZBcytU?=
 =?utf-8?B?c1lQczlINjltTkM3dm5HaEw5ek9CKzJPRHFTS3V2Z0pQNlRIUnVNSUFHZ2gz?=
 =?utf-8?B?eFdJMzljVnE2QWNRdDgvVTM5cWdOWS9xdnlFVDZ0dUVTTzVSRW9tbzNzWmFy?=
 =?utf-8?B?RnpiRnlWUlBSN0MrRHdBMXRHTDdvYlhiSEVKeEMydkl2R3hUUk93bkMrdWpL?=
 =?utf-8?B?dFd2YXlVbW1pOEI5eGljaUhlL0VKNWd5dTJMSGxndXBiRno0ZUxocWlLb0c5?=
 =?utf-8?B?N2grY1kyS2JzSHFvY2dKRVZ4R0dsMm9GZDZGcU1QVzhpNDQvSzhBYXN1Z1cz?=
 =?utf-8?B?OGV0V3ZON096WHkzK1hOdXloOUMrcks5L0FZOVgzQzA1SEZDQXA2SzV1U3RU?=
 =?utf-8?B?VjBjVWozR3JGSjQ2NllYZndBcCtFVUdBVHAvZnYrZE1CdEZ5LzNWSnVFOXd0?=
 =?utf-8?B?cGpXT2RHSnczZGs5UDJIbTArcEkyaGlaa3FpbUZwOEt5cXY2U09nQnU0Q2Qr?=
 =?utf-8?B?bFhxb0pXM0RBRk9COVRDYkNXQkxlUkEwRDM4QWlYai92c2xpcGFQS29iNnZh?=
 =?utf-8?B?RVp0ckdoOHFwc1B5dUpXMElTSjM1YWVMTjl6UWdYNkZySHdteSt3LzhodkhY?=
 =?utf-8?Q?bx66CRdJZRCHGQrbE4VQx3svT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469211a2-a93d-4b7b-fe2f-08db249cb330
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 14:59:24.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7l64J0ctBjUZiqmOiT8VKyePr3Ai8l8oJygEd0IoKFbGGWJomQJh/fF2Mr4fDsqs5QCh1lHZyEf3ppSfgsxtmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9623

On 14.03.2023 15:45, Roger Pau Monne wrote:
> Slightly change the meaning of the command line
> gnttab_max_{maptrack_,}frames: do not use them as upper bounds for the
> passed values at domain creation, instead just use them as defaults
> in the absence of any provided value.
> 
> It's not very useful for the options to be used both as defaults and
> as capping values for domain creation inputs.  The defaults passed on
> the command line are used by dom0 which has a very different grant
> requirements than a regular domU.  dom0 usually needs a bigger
> maptrack array, while domU usually require a bigger number of grant
> frames.
> 
> The relaxation in the logic for the maximum size of the grant and
> maptrack table sizes doesn't change the fact that domain creation
> hypercall can cause resource exhausting, so disaggregated setups
> should take it into account.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit perhaps with yet one more wording change (which I'd be happy to
make while committing, provided you agree):

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1232,11 +1232,11 @@ The usage of gnttab v2 is not security supported on ARM platforms.
>  
>  > Can be modified at runtime
>  
> -Specify the maximum number of frames which any domain may use as part
> -of its grant table. This value is an upper boundary of the per-domain
> -value settable via Xen tools.
> +Specify the default upper bound on the number of frames which any domain may
> +use as part of its grant table unless a different value is specified at domain
> +creation.
>  
> -Dom0 is using this value for sizing its grant table.
> +Note this value is the effective upper bound for dom0.

DomU-s created during Xen boot are equally taking this as their effective
value, aiui. So I'd be inclined to amend this: "... for dom0, and for
any domU created in the course of Xen booting".

> @@ -1245,9 +1245,11 @@ Dom0 is using this value for sizing its grant table.
>  
>  > Can be modified at runtime
>  
> -Specify the maximum number of frames to use as part of a domains
> -maptrack array. This value is an upper boundary of the per-domain
> -value settable via Xen tools.
> +Specify the default upper bound on the number of frames which any domain may
> +use as part of its maptrack array unless a different value is specified at
> +domain creation.
> +
> +Note this value is the effective upper bound for dom0.

Same here then of course (which actually is bad, because those DomU-s
shouldn't need this big a maptrack table, but that's a separate topic).

Jan

