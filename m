Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8FB49DC5B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261292.452237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzwp-0005dn-Fz; Thu, 27 Jan 2022 08:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261292.452237; Thu, 27 Jan 2022 08:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzwp-0005bB-D4; Thu, 27 Jan 2022 08:16:03 +0000
Received: by outflank-mailman (input) for mailman id 261292;
 Thu, 27 Jan 2022 08:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCzwo-0005b1-0x
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:16:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59c210a1-7f49-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 09:15:55 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-hQgmTGSfPweb9hXvzNuNrQ-1; Thu, 27 Jan 2022 09:15:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB7588.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:15:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 08:15:57 +0000
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
X-Inumbo-ID: 59c210a1-7f49-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643271359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lk4t9bJ6B9lspMmE404zJ6wngCG49istLQYM/3AUBmg=;
	b=bgCZOeR7SJHVvfZ1CHLdlKZTZ+n3tQcweLNFjOha6+Z8wkmCr5Jk1C2CiHjzwMjWBljnq3
	uUs8mdJaOKTTNPqOdTH5uuXxnMO4phR3Xm2wFV4TxXpav7JV2F7Nr+77DF2nsMKdcyf249
	yzsKMmGiSkZEm8WWgMKOKBScMSlPLck=
X-MC-Unique: hQgmTGSfPweb9hXvzNuNrQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtALkATXAKH1EGmbnxJz8d533SCUnbrW5T/M6AbSgo9P2234ip7NA2LonoIz267Q64gp/ye84HfkLPdCG7wwzjXPZ5CVtkOSYC2JqCPYLGVdrwVYc/pJT2sW9qzOTZtArMHZQZSmqS0vGstgfpVmdQtRoENEfAe8UGiDquPI6O66gAtz9F7Vl104QdEu/TsyqlzKcOx2QQYsqxm6yUor9NJpR3fEMl8zzSuIMW2uxc+STI3YwFj44TSx3gOFhyx8L3lU1k/vBQbYXYS0oEHV0TjMYbq3rSJj+1E8S7xYXkLaebRsZRG5f/jgunziBM3twiReyP1ZozAPxoKOYAjXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk4t9bJ6B9lspMmE404zJ6wngCG49istLQYM/3AUBmg=;
 b=cJ4FhFEhJLxn95XZMbZr3Ydy7R+eDqQirOL1yNea+8WVP7X181F0BUGzrX2HcE9Tufk9G/M2sqTVHvkqrYakHaDZFd0xy5ge/HGl/9vARUHEaN9feHcUKegr/zsuU7+jzLxqQ6pd2ZwNFFdYPOdXWBNqHkzsVKWoZ0pfvUpV8HiZvLjHhLYHUDb/JDcYcU86y77YQeFTAxNbhlS5ZfAhQsMnIryxEUmiYqmeteBRW7nRNbmAR1q3aM7sHXc4ZZJOmd2lZR4SnScv2q80xS6BNJX6zH9LC2WSamkl1nFivGm/bak1YRkkuKT7ykPlowqeQYEr0jsLcZj/GFQ3/VIYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03ec0af6-326e-35dd-3e0f-8cac8359b725@suse.com>
Date: Thu, 27 Jan 2022 09:15:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] x86/Intel: use CPUID bit to determine PPIN
 availability
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
 <2d13a663-f03e-b1e2-0c38-5dc3282dab10@suse.com>
 <31121cc4-5980-3e06-89ea-c2268e2ec53f@citrix.com>
 <6b07b22a-8599-320e-5746-fe1fe279c62b@suse.com>
In-Reply-To: <6b07b22a-8599-320e-5746-fe1fe279c62b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23f289e1-3d56-4893-6e3e-08d9e16d3f01
X-MS-TrafficTypeDiagnostic: AM9PR04MB7588:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB7588B8FDF00BD0570715B565B3219@AM9PR04MB7588.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ypqm4nJrrEO0N1Dkc1n7jwDnXfrzXyds6jpZILXm6q36wPvd7ZzDqv/ov93DnDVVpv38mfeHBmd6pygIelfzDN91HEbCxVzfxdTJaZWtS7KiskkDX/tyt5eSOwpX8Fl4PTaUBEtzpjooQBXzI7f7G126IlbuEr/bWbn0je9ORLb3c4Xts4+BGpBURQDJiAE8HRh+9/A60XH4xOoscH3R+Nl9RlQe2d3TbLBQ3pkJ2pIDANb3pDK2JW5Wbgj1/fym8ot0dtgjm/tCrHHdTYpTxNo+dtmkmR9y+lpJ3gSTdD3kKAqmJPC/PSOtAYsnnoP8vWpIANHFY/Gmqmxpgoxmve7fR2WOwLzjm3Ngs1i3n+UiRWSZYGcPwiFhutCY8HY+ULNqdxFl7ZZxHygKOfSJ8tEizAd+ZdGIe845uGiLq/53du37gMKTxMhfrBoEqg7kizUVo9hknOFG3vR5d9Gyu9gwWjM7ncuPl/GWO1+6cposVUYlJZtmzLWiTK6nOv8G6EpBb3S7utZQJRTcXAbxx+WuupQNRzEqU+BuOC66kLU5JVzyPOsWlsallFItyaqSk8ofs0mHASer0EuCaFs8IVDJnX8YzbUL0mlTOPCWYRN7Z6ilWXSHBDcV+hSWpdRESGH/nFZoLhbGXMZ0RvruJX1g1zVYXHM8xHjI8naT1oaSc6VpOooY9SgL6Fbv5V9P8SRFmvEVdifwuaAPzkCzvInGVrssfrcFnUoAq2VBnGjmRnUcMmvz5xU52ngqpw0p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(5660300002)(6512007)(2616005)(6916009)(6486002)(2906002)(54906003)(31686004)(36756003)(508600001)(31696002)(86362001)(186003)(26005)(316002)(66476007)(66556008)(66946007)(53546011)(38100700002)(4326008)(6506007)(8936002)(8676002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlI4WFlJNTlwVWRpcnRtVjdZU1QxdWFlcEVyYmVlRnNBdVQ1M3R1aytHNzlz?=
 =?utf-8?B?SzBJWU1oMzAzRVpXcW1ycmlxOGY2V3FQOGp3a2NlM3RKNW9udjNwRFVZaEZ1?=
 =?utf-8?B?RURZQkdGQ1M0OEltOE5OTVpwNENGN3g1MncrSnprRmRsYjZQaEh4MXhEcFVo?=
 =?utf-8?B?Q1hzY0ptbkg1WEZVQ3hPQ204aldwWDVYYU8xN1RZTVRaZjF1bUpCczY3OU1N?=
 =?utf-8?B?dStYcWlnMWxDMitkSjQ5L3NLMkgwWWFJTExCa3dya3RoelBHVndWdnBjOTNM?=
 =?utf-8?B?Y2REckJ0aFRKangxK052SzNaM1FpVUJrN2ladit1b2p6N01hU202VENlTGJK?=
 =?utf-8?B?Q3BaUkJrZUZYWWM1SDdqcnRpSDhRVnFDZ0FNNjllZy9NbVJ1c0lNMVNWWENQ?=
 =?utf-8?B?alV6QWwrZHFDZmprRHlsTkJKdzN2QjVrR0x1UjIraVR2STF6MnB3cUxFUWcw?=
 =?utf-8?B?dUEyZVZvdTNXb2lTa3BIV0JPREFad29FY1hodHlFK2ZZU2l3MkVValczOTFu?=
 =?utf-8?B?WGkxSnZKWXBHYlpLVzNPcGI5NExRRmh4K09Zdlp2MlB2SERPZTM4ZVZmYjdM?=
 =?utf-8?B?dmpkWUE1dVZVWk1oR0JxeFRoZ3ErMmhTaXp1Vlpici9DcE01WGxoWVJwUGtN?=
 =?utf-8?B?cE5sY2xJU1BtSHFLVWpkRkYrZ0FmSm9CUXZ3dGpjMmxsVG9Cd3A2cWZoZ3Yv?=
 =?utf-8?B?V3p2Y0g0cy9WbnBGMHpQUC81UUMxZmJCR1owWFFRc3UrZ2U2KzR4ckJ3WlhU?=
 =?utf-8?B?THhOVXFyQkMvaUtvc3ZEZC9JaTlZNWR4a2V3VnNlRSttQ1E0ZVBoV1BZL3JW?=
 =?utf-8?B?QTZaa0NWMWNsYUIrR3RKTHRQUEdHWS91SmtwbDZQL3BkZytLdXp1dk1sRFZD?=
 =?utf-8?B?L0F5ZGxXU1JjUVBzUWpNZDFhK1h5MUR5V2Zuc251QUkxa2RsK3lveGVVUWgw?=
 =?utf-8?B?OTBkMW04TGJDL2M3MHN0TW9FY0NyN1hoTDYzczN1Mllsc2RzTGdSOEpOWFFm?=
 =?utf-8?B?RmNibmtETERyejdBTXU5TEFQOVFuZmswckdrWmNOMEg3cXpsaUY0QTlwMTIx?=
 =?utf-8?B?NEdBbmpLdTNDUmVPcG5uKzJ6U0YrcjJxY2JiOWU0Q3VYd3Q0ZnpBMGh3dnRC?=
 =?utf-8?B?NkZuVExHQjAxTzlUdTVqR2o4dzBnS3dhQW5BdlIvREF2QlR4Y0kxQ0NmWUFq?=
 =?utf-8?B?RU9JZE9aZE5YdWNkdGMzWWdVNDh0aDV6aDRzMmJFN2ExQTJCWmxhUlNKZFdj?=
 =?utf-8?B?WkpDRnAzd3hONjQrMzNhbUgwbUZLWG4wdWY4SVI3d01iSnFpcUVHQlJ0TVRX?=
 =?utf-8?B?ZDdKeTdCV0dnV2xvc0tRQ0xmRjdNUWpqdVBGYlhnQmtFa2pJSlY5UDI0eHBP?=
 =?utf-8?B?bFVjYmVEc1JkOWhiWmJZNzRBNU5VTE1GVjNOOHFnejR0VkRZcnErSU9LMmJE?=
 =?utf-8?B?ZUhvaEZXMjlsSEQrRnZJbW43T1p2SUQyYUkwVWN2SjZIWjB1SkRlQk5vcXQw?=
 =?utf-8?B?NStQMjY1Z2lkd25PYk56bUpxYkdMb2I0Tk52N3NkV1Q0bHYxZGQ2bUhyR2Zv?=
 =?utf-8?B?T2RjalNHNURmVDkya1N5V1l2bFFTNUxFK3VVTGMxaEg5T296WWFqY0FlNXJ0?=
 =?utf-8?B?bW9oRys4UWpOaGsrajJTait6ek9QR2tmZXg1LzZwNkQ5Z2FHdXhIaVhxaExN?=
 =?utf-8?B?dFEyQkNwSmdyRzgrWXB5L25LRklJcE41YUpsNEl6MGVIL1lWSHlvNGtlSVBO?=
 =?utf-8?B?Z3M0WHZQWWgycVpTU0pWdGhWVFhsbU1kNW1YYmg3OWgvaVY3TmVhQzZRbXRn?=
 =?utf-8?B?Ykx0eTU4VTlNV3BWTThDSzA1aVhKS28vK3FJOXp1a251S05mWDRFUjRmUWR4?=
 =?utf-8?B?TkM3MnVKNVpLTkRKMG9OSmdnS29sekRHYTZsMjJXZks5L01XUXFOa0lOYTVC?=
 =?utf-8?B?T28zN3J2ZzV6S0ttU1JOSmptZ3p6Z011ZWwwbWNGckV6dFZXOXpwSjhsNkE0?=
 =?utf-8?B?S3RHR1crMGE5UThpN1B2cjF0NjMwVHcrWjdRWVQ2d3kzZlBRT3FZZVhQWUdC?=
 =?utf-8?B?eDMvZXRWSHhyZU5GNjZNUkJ5K2RXdkVUQUZTczVhSlZEVGhtNHBLL3hRVTla?=
 =?utf-8?B?VW94WEFjVWdDNkwwNDRvS0JWcnJuQURXNWFIb2FvR2hnS2dFS2FFblVPd0dT?=
 =?utf-8?Q?9SB00lGa4Tv7mM7Wl91i1LE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f289e1-3d56-4893-6e3e-08d9e16d3f01
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:15:57.5472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CoDDaLJIKUAGBXD/T2+JWuBF3rTpgiT48m402zUasf2KFXUFGw1BieSn4kIpisVmCn9F0fFK4JfcD8YT0DPrkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7588

On 27.01.2022 08:56, Jan Beulich wrote:
> On 27.01.2022 00:30, Andrew Cooper wrote:
>> On 20/01/2022 14:17, Jan Beulich wrote:
>>> @@ -188,6 +189,10 @@ struct cpuid_policy
>>>                  uint32_t _7a1;
>>>                  struct { DECL_BITFIELD(7a1); };
>>>              };
>>> +            union {
>>> +                uint32_t _7b1;
>>> +                struct { DECL_BITFIELD(7b1); };
>>> +            };
>>>          };
>>>      } feat;
>>>  
>>>
>>
>> Looking at a related patch I've got, at a minimum, you also need:
>> * collect the leaf in generic_identify()
> 
> I'll need to make a patch first to collect 7a1, as it seems. It was
> actually 7a1 that I used as a reference, iirc.

Actually that's there, just that I didn't spot it when looking for
the "(7, " pattern in cpu/common.c. This form is used only in
early_cpu_init(), while generic_identify() uses
cpuid_count(0x00000007, ...). All quite inconsistent ...

Jan


