Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BABA50DAA5
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 09:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312426.529663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nita9-0004sE-Ok; Mon, 25 Apr 2022 07:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312426.529663; Mon, 25 Apr 2022 07:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nita9-0004pQ-Lh; Mon, 25 Apr 2022 07:56:29 +0000
Received: by outflank-mailman (input) for mailman id 312426;
 Mon, 25 Apr 2022 07:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nita8-0004pK-5P
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 07:56:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 358a12c2-c46d-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 09:56:27 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-e4RWyqFqODW1oZFw3oMWsQ-1; Mon, 25 Apr 2022 09:56:23 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB6906.eurprd04.prod.outlook.com (2603:10a6:10:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 07:56:21 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 07:56:21 +0000
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
X-Inumbo-ID: 358a12c2-c46d-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650873386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iK6dgsjGKDgplw9d1zD27UYyxD/H5pBjgMUJG558ock=;
	b=XaZ+gqiLkeeIVnNwiFRlzR+/NehkUJuj2o45qCK1Gqpzvhyj/Dzc+zw/KY98v9ENPor1Qa
	VN03xQz8FkveF046iY8Cl2l2IYi/0uNLIlWFWT5+TwBTFqwIonADe7oJjaVsY3fcpfNZLW
	0mvpgunxUjrdzZi4UkyafO3++Kc83M4=
X-MC-Unique: e4RWyqFqODW1oZFw3oMWsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlPrF/bMRMzE0OkyxKnVWe7kLjtV5U9AisVUEzD6bq5MGrcmlkws0OQsNHNGOolIU0FZ9vK51GCwjEfjs0XQDeR+5kkJTZCmRoP6NjgBveDbbiLzs/pyc6quuphLy/MUMgYleZZWpmKQif4FCDUXi+HSBhviW3AIzc4rbgOIrwy/GwP0mCilLWwJHNKR0YWNzCm0NClEGkke605dRdbFbsd+ZX20xiZDOT+hYUYCBeZKxxSTUKjKTrCwj+Uz0Bq2cKrfFenlWmiTvRK24YMugVZSS23p+X1RPcBQ++PEll8CXkjsj3+WHbFlHMoYDO0jBN+cWqEkgJlz6R9TQR+C5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK6dgsjGKDgplw9d1zD27UYyxD/H5pBjgMUJG558ock=;
 b=TbBpT9W6bsqqo8EGecGwJyaTwwzj7GqYgD5mmzx5QvBiv9ltUI20XW0P6vSyn7Kw4J8SR6DfjwKs2mC/y1dZOY0pd3WqRLt9WRDLGXbPzfvynn6dNNraoOjwp+V/dauicvHRlhp/NPvYylzpGSYwzYh41GMVXc2DktHB6fyzBO2jjHiv4wZW4T59J8VKqcTtmFHVMLTJMW5OchpDa4J9xHR/FoHxKTwOaA+65qnUwtDQEXwzML2ghtrY24TUOiLhOIGlCHabf0xahCwRogJyxX/Bbg/y5qN6/YvvAY1zeP13GT0/jGtemhbMWDW4mbORsydOZGb4NYwKOk7KbkCFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <325103a8-8c5d-06cf-0fab-a977398c642b@suse.com>
Date: Mon, 25 Apr 2022 09:56:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] page_alloc: assert IRQs are enabled in heap alloc/free
Content-Language: en-US
To: Julien Grall <julien@xen.org>, David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220422153601.967318-1-dvrabel@cantab.net>
 <c15c5faa-ba5d-4407-e9e8-341f41200d77@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c15c5faa-ba5d-4407-e9e8-341f41200d77@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0766.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3d0808d-a24e-49e0-a609-08da26911632
X-MS-TrafficTypeDiagnostic: DB8PR04MB6906:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6906E954E49ACD2FD09A602CB3F89@DB8PR04MB6906.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mohM7Sxzb7BeKXX8EcZiDkHp6Mps2acM9nZXErluBPuTx1b3R586Y3zHkwGW/nthTsEBe6wuiGhW0vnCSFsB0xWLETK054skOVK+ioU9mod+52mJW2PcOss+mWEPxXvoqCT3TMA+e37P0qNkUZrmaEFc3IOtgGCDNfTbeUBdsQQliR7YANLsMSUQYFHDED6hL48rI3Y/cEaMqNwnMrvG5Gcmxta2LTYRWNq9uFUQL7qShtz8O1H+etLeU6AGOBGr+XuxjHzSk8eemdREDvOnvvZvYQlrVxkfD/wdNtzqND6phvhvnInWlObv87VQK4N6wLJGXP/q4hmFUoQMT8tJ2IJrl5DhPbD0BIEeC3d6S8ItyWtZUQKsOZzdeC3+xA7zL2Dj4vQxbTndfeDrE2rBE540ihsRZ/bmv2+prWeSZg1EyvUnHRWB+ELQ++FJbf0UAktKvi+syER92d11eDWfhfuGhpU/LhHruvyPA3TdqQD3aW5R98k003orQSefmknZIdES4nNZ/Au6HZJWmZjZlvMf5Dd1tF/9brSQOiryCgt9CgEW1zqzWqdkuMXvSqukp0eWiIoFKSTqQNLIRXEfk2id1NtJ7XxRrYOPD3uHtQgPtqwhc+wLoeEaUTSp1fJx0H11rkZ0Sj0fs3/9yjddbN3oRrZWze09irF+3hSfdavAaQpA3/fGwiiUM6eoBCYUdZcWoTIaiN3DI/mREd4BmFPj1Wj4hDbXcaukQoUyZnSmSJMvB/eMMMhlodopnN4g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(31696002)(6486002)(86362001)(2906002)(508600001)(66556008)(66946007)(8676002)(4326008)(66476007)(316002)(5660300002)(54906003)(110136005)(8936002)(83380400001)(26005)(6512007)(31686004)(2616005)(36756003)(53546011)(6506007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnVBbmg0bnF1c3ZPNHFsWFY4dXBWZmhEUVNRNG5JNzVpRDRTQVZtMnZTNU9O?=
 =?utf-8?B?T1pBUHFjTnpDVm9nTXJmZThWSk4vL25BTTRrQURCd1A4VkU2SXcwOWZuNThh?=
 =?utf-8?B?TTRyK1NCN1B0TXVuZWFsblRYZzg0a01xS3NYZHZRdnZKcEMxaG5wQmdvWjcw?=
 =?utf-8?B?cmpGWDFHNnNWNERGQmNXa1lNeENOSjBoaXZYL3V3a1dCSEtGb0szT0lQNlFn?=
 =?utf-8?B?VnlBV01tY2ZWNWZKNUtDeTdmWElqRGJhMWp1OHl2T3FHNGdtSXBkNjNwU3dI?=
 =?utf-8?B?RmQwNzNzcWl1ZjRJajBqeEYxVlJyOE1RQ2pwVDlHcDgyaGswVHdDYU8rMkVy?=
 =?utf-8?B?NGhSb1IyKzRCZ1ZQOGNWOTVXS0VSZUZSeFY4NkUzaUhjTm53bGlIRGZ2WHVX?=
 =?utf-8?B?MnNpZ0ZtME96b3ltZ3g3SlZkNE1hVS84SWthSkp2c3QrdHI0NUI4UnhRWWc3?=
 =?utf-8?B?c1hWMjEvVnRVL2JoSXBLakJPY1NJZVlTMWc3WERzbWd0cDlmeWxaTGM3SG0z?=
 =?utf-8?B?cldXWVhYcys4R0tjTEppKytuVGVkZnRQRWZteC9sRjRQN2Zta1FhRjRrZGNM?=
 =?utf-8?B?NnNlL2xuOGJmNWFDWmxER1BJd0pBeGhPN05IZjZNMW55UVdaK1pHKy8wdjBN?=
 =?utf-8?B?MkovRGd1MTNiMmNsT1VOMHBLYy9nZk1pbWFvSUdkcC92V2Jxc0E2UVBwcnNy?=
 =?utf-8?B?U2wvNndkb2xnT1k2bncxcDBFRlJOS1NEb1ZOblBjbGQzcG9ueS84NU5xSG1W?=
 =?utf-8?B?Ri93MGtDK2wwREp3SjdZcmd5ektKcjF0WSsxRlBpeS9WZVFmWlpMWnZkaXNy?=
 =?utf-8?B?MEhreWlpRXVuRmdnZ2RPVjY4aTQ0eHp3M1VuVWJOVkloeTNhZ1lneHNtZVVW?=
 =?utf-8?B?ajA0aGZScUgyZmNINUNjVFpCOE0xbFNuTkc5dlc2Z3U5TXp0dHhtbzlXeC95?=
 =?utf-8?B?cnMzbDM2Y2FKcmFURktCeHpoZmh2dUtwNzdOT01BWUg1aytmMzEzeUs0ZFhJ?=
 =?utf-8?B?UUIvQXE3aHV5SXAxTGtiY2VYTytiMkpFeFlNMFdSVGo5WXhOMEJpcitzZndn?=
 =?utf-8?B?MGViNVI3TmJIYVljYmFBL1V2d3o1cXN1TVUzRGptZ2FWODFtRE5SQ2Jub0Zm?=
 =?utf-8?B?dDdOSitNbkU4Wmh6cjRUVzh0QzNGNkZ0S0EySFhlZlNFa28vbXBZcTIwbXlv?=
 =?utf-8?B?b1VzQWxuVHdLMVVUdllBcWJUZ1VZRktTRnJ2amo1VDBsNXJrdHUrMlNLZWdO?=
 =?utf-8?B?SnFrV3NXQWVnTTZCU0pNOEs5WkdsdW9XV3ZZNHBId0I5UytQTmpjWVM3bnJH?=
 =?utf-8?B?NHYzNTVVbXYwMkI4MVVuMWx6eFdMRDdGZzgyanFlSU95SVlGRHNEaGV5cFg2?=
 =?utf-8?B?V2p6T3paMWcvbHlLeVliSDl3OXkrRTBKdEhSM2xwWkg1Qkc3eHdxa3pQMlVt?=
 =?utf-8?B?WFZESnhiZ2lFMjBwVlhWTkhzNVQzWmRWMHZYOWNqWjJpL3IxR2VpU0pVemVY?=
 =?utf-8?B?TnE2NytjRkVLZ1hhN0RKbDdZdlE2OVRFbFJhbW1Uajd2bkF4dzdGeDF4WFVQ?=
 =?utf-8?B?aTlwWkpDWUVTeFdqQ2xPT2hPdjhIVFpuTjlHcE9Ic015b2pVdHdyUjBnYWFx?=
 =?utf-8?B?TDBGb1YvaTI5UUFpcXlJWWI4QkVHU09GdFJYbzh1aTg2aEphZzl2ak5hSHds?=
 =?utf-8?B?NjF1YmdxTGxHRlJZYnN1R1NGQTh0WWNZVzFlcFhKQ3ZhS3VPdmR0SU4xOStU?=
 =?utf-8?B?YmtFYmhPdEdhZWhVTHdpeVhsbUFmWjU4UG9sYk9IWGxJRmNhMWhqUHNrUmpJ?=
 =?utf-8?B?amFEY1R4emJud3dkcmlhSDNrck9ZMk1mQThJTGlCaENUZVJEbytoV3NMb3E1?=
 =?utf-8?B?ZjlzMEpRVFovMm8zaGtCK25WcWFvVTQrdmJWc0VZb3ZnZUFpMEZ4L3lObll5?=
 =?utf-8?B?dE10RG41OEorT1pjT2kvQnFYbTliU3VQZk9lS2ZaRlRSWXZaNXVwcjdmOVgy?=
 =?utf-8?B?anhQd2tnTytPQmZtOUNmREpiS0VYK1VDV3NmTVZ5bTRNUlJ2ZUpIcTkwRXJM?=
 =?utf-8?B?MEMya3c5NUE0TFg5VUVvNThyN3gxNjFUbmlva2RTQk5yQjlyaG9wQVlOZE1L?=
 =?utf-8?B?Z1UwTlJteHBGNk42YmxHOURTRXB2b0UrRStCVHlrVENDbS9UR3RqTFRDR3ZP?=
 =?utf-8?B?WXk2Q3pXaTQ2S3dBR2hFNTIveE1BNHRCT0FUK3M1R0drRHMyOGVwT3NtQ2Fn?=
 =?utf-8?B?SFpzdTZ4dzVEclhBcWluYmdMbEZXQXM3K3FCWVp5SWlBZWRoMS9IM3V1N0pV?=
 =?utf-8?B?RDZGODl6a0RmKzA1S05ERlVIZ0l0d3c4bzJObk53TUtSaWF0ODFHUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d0808d-a24e-49e0-a609-08da26911632
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 07:56:21.2127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqkuo7lM9XFm9xoF9JUsfrWtRukisZ+06/tvOif8orrJ/6gFcA0xuT/mee0d6Etm9Q0crSArrPogc2Bxde6A+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6906

On 24.04.2022 17:52, Julien Grall wrote:
>> Changes in v3:
>> - Use num_online_cpus() in assert.

With this ...

>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -162,6 +162,13 @@
>>   static char __initdata opt_badpage[100] = "";
>>   string_param("badpage", opt_badpage);
>>   
>> +/*
>> + * Heap allocations may need TLB flushes which require IRQs to be
>> + * enabled (except during early boot when only 1 PCPU is online).
> 
> Same remark as above. Also, I think there are other cases where 
> num_online_cpus() == 1:
>    - Xen is only using one core (it will not be a useful system but 
> technically supported)
>    - During suspend/resume
> 
> So I think we should either relax the comment or restrict the assert 
> below. I don't have any preference.

... I think it is the comment which wants bringing back in sync.

> + */ > +#define ASSERT_ALLOC_CONTEXT() \
> +    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() == 1))

While by the time calls here can legitimately occur the online map
should be initialized, I wonder whether it wouldn't be better to use
"<= 1" here nevertheless.

Jan


