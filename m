Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1732E456F9B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227929.394355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3xB-0004of-RW; Fri, 19 Nov 2021 13:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227929.394355; Fri, 19 Nov 2021 13:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3xB-0004lw-OH; Fri, 19 Nov 2021 13:29:21 +0000
Received: by outflank-mailman (input) for mailman id 227929;
 Fri, 19 Nov 2021 13:29:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo3xA-0004bz-20
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:29:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2ed0526-493c-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 14:29:19 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-BL_4gu3kPm6Ms0E_kUTHpQ-2; Fri, 19 Nov 2021 14:29:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Fri, 19 Nov
 2021 13:29:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:29:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:20b:310::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Fri, 19 Nov 2021 13:29:10 +0000
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
X-Inumbo-ID: b2ed0526-493c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637328558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bC0l5inkLIxZfT55shA+ipt4o/14adaSq2lUaEBVqj4=;
	b=SK0nzutQ3r+UnBM2EkKaOOXRy7mAGCMxFV6v+7ZcpcV7X3+j1Fqxdt+su5YKmquNeGuhRr
	x2U/SYfbgCGpiBSGdcgtm/HFRN6BqR5cOJ/FzzwBXPoAdX9oEWW4lu+RaGh78FW53ef1Xi
	KdAnt6aeFc6/rFwNclq0WFs7tsAjIW4=
X-MC-Unique: BL_4gu3kPm6Ms0E_kUTHpQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaJSmNPYfbtq4/+8/apOK5lyFthkiaXwdprEBJTnvmE/Kmcq3ZxjRwVobwQNYFYEQchxbhDl30aBtsPIs90Z+Vqj+YWmE9svc9y0rPFx2thK4c8QpLWS+zRYimvnX8jlqZ5Xg586nDCv30BtHG2c3xjgC2Ao2BmerTNu3/h3RbsjiAYqmeA6sJRfTNaTCvC4bwYbxzxlVwjufAtNFJ8BZxcNebO6gULrNGXiFYGK343nfiRlQoB0XuxO2gdfrWSoDDRYO/jNt2FFvDEteAUt/bCsdZh6ZqLELTu0ynAnWxfwsQPvondo3lg3om0XcYrV0LKWHq/xu4m8CVg6BQvMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bC0l5inkLIxZfT55shA+ipt4o/14adaSq2lUaEBVqj4=;
 b=dk5vBsgm9vzA13woY/WgDh9P4R7OJ8IsWn7U+9vUqMkA9FXJP45FfcUY3BDDCFq10FCBPlMj9ttt/NocRt1gRYOR7HE50NXHXMpPnueKoQa+VwEZHiQTN+rKSFtJN1L2GqCfJXqPMrEBz5wsQq4/Kx9qnh+EJzpUcbZoj2HKIIL0jDv6Zh9fh74jm4jzap18M0EYLMCn2/Kv2CS/0EXpNgY4rDomqlm9EOWb+qoY+chYDFwGkXbEBz+g7iGqT2Vg+RNSwSNAcUTyWWl8Dh5yLa+1UhLzHa1rPoxA4+ZFp1oiEeEDmd7AZL9k1YPqsgntcB8sGc2+I2lfOkuCad9/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97515b30-ea6e-e497-dfe8-a38d8a28b05d@suse.com>
Date: Fri, 19 Nov 2021 14:29:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
 <9aec23b3-2269-39fe-9fc0-fb8cf7f9de44@suse.com>
 <1a380ef9-bdc9-bbfa-35b7-ec1c901e3019@epam.com>
 <76e929f9-2df1-951f-55bf-58caba80750c@suse.com>
 <ea3e52f3-c844-d2a7-2f45-9d4e1bd04d5a@epam.com>
 <a60f0837-3a01-4d87-7816-ae4a0a6a8413@suse.com>
 <3cca175c-5b33-2c50-bf4d-34bbe844ab11@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3cca175c-5b33-2c50-bf4d-34bbe844ab11@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f948e93a-5e79-4165-572b-08d9ab609507
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB444510FDEAFBD82D3A3B3998B39C9@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VtYgt/TQfWeCfn8PQK9MPcnmNzVriipUY/eg53pUda/upmE6gewOyc6szMUh+lwJQSamehjMFJlCHcSFxujWufH0jg8Onqf0SpczN8IZ4D2+tJieqPlM2Z0mnuGSSFlTk8j/UgOAv/zWSlb7HHYxZFm8S6PejzcifPEFNanBom6R3wLjT4k3NxZMcE/1e5ukvx+6ZBRZyzZj7jPGzQqTtZfzkPLor53Etv4jVMxQGfGMtGtuovxRQ3ufpaguWoLMJFZUxDsS68bZhMQEYuBbKwxL7QGbrBOLihJQgo0xBFezwOCTVFM8EdWaIhh3k1d0YyZDWpHSwLrcECsSyCYHiSVnGKd9NkcmDbJSuc3XCOf9jChK0PjQt9ztW4GrJO8SVryimQICKG0W1OPYwN7eSErWxjQLPXtvX15L1tey+Eu58Btb8E+K/ypLPomGW2iuTsTiwf2vc5vVI/pcCbq++U+C1SgFPdD3D3x+fGcrbrodKziyHl7Or0+OB3GEBhJ1Gdc33cC/1RrpOhklNDHPOJ28T+gxmWeYpSvkrOj4ZdjuT5ujPfy/JkQ7Q6wVpKLXAXi9YVT6QTTYua+yH15iSDPI+ZhODzRXoqwCie/lW3Mov4vDZwmJSgrNTv4o7bS5+4hfLB5nmZp595g0Rj2kltNb94Vs47SQgrptVW4btIxCkWqONE76KnrMdyEERz9s7QUpvPYThZ/qtUD9+KTOAJwun7ijBiEfgOnBvJqIvjw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(2906002)(186003)(4326008)(53546011)(2616005)(316002)(956004)(7416002)(5660300002)(66476007)(66556008)(6916009)(86362001)(31696002)(6486002)(8936002)(66946007)(6666004)(16576012)(508600001)(26005)(8676002)(31686004)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEp3NFp4bTZWS3dxVFFuTkJxVEZYZmIwaitHdmZleUFBQldkU1NiNTN3eTNM?=
 =?utf-8?B?UHgvQzBTeTNpV0JjZVh4OU95aWhxTjJDWVBuUzdLZ3J1TzYzcnhockRxY2dY?=
 =?utf-8?B?VWZ5b1Z1M0swcXQyYmRMSHhyY0RFcnhtbitWTjY4UDlTa2VhTkRENTdsM2lz?=
 =?utf-8?B?d3dLd25xTEQxcjVGQVprU3llMTZGeW9ORFpPcXV4WVc3Wlg5Rm9uTUk4UDZI?=
 =?utf-8?B?dDM2eEsvZXdUSG5LQ1NBc0JSQ2oyRGdwSjV3RlZqdXhHN3pNOE5zS2NKN3lB?=
 =?utf-8?B?ckh5TVc1aW1xVFhUbG40WnprLzJGOGVNQjJsSUNEZ0MyT2xEQUtsdndyeTAy?=
 =?utf-8?B?NHlJeFdnanJzT1orSFBVNkFMNG9jcHhJYzduNDhSZWZqb1NxcWlabUpnUFFa?=
 =?utf-8?B?bW5jMHBiekxwejU3WCt3OXBabllyZUpIdUcxOGpzYXF1bUVUQ0R1YkQ2WTIw?=
 =?utf-8?B?WWw4cWUxYUhyL2l1cTlaNStlcEdEMGcwMWNxSzhsSHNSNVFlamFZN2hnQ29G?=
 =?utf-8?B?RVdzLzU5ejAvdXlvcHJ1RUZSTEVpOEJhbnFWaG12UXNvblhXNWs3dmhycU5o?=
 =?utf-8?B?VDZpeG1JSDdtdkxaSmVwWE9pZHRhUzR1S2xvdTFMOFNEU3g4aHpockg2QTdT?=
 =?utf-8?B?MCtkc1FBK014Z0tHV29hbXgrd0k3Q2VYNWxlbHEvM2w4TFlybytWaHNHaysw?=
 =?utf-8?B?OGsvZFlmdEZhalJvYlJJcUxwUTRWRUM4NmJxbkJCaEhlM0dIbWt2ZE94WFhi?=
 =?utf-8?B?cFhnNDBoUytyZkk1OERQaTdQRGZNZ1BYcHZaRWJOMVRLeDAwL01DRVdObGd1?=
 =?utf-8?B?bXpteTJQbWR2WENZd0tsYXA1VHBjbStxUFlwdlMrbUVBQlp4c3I2b1VBMUJG?=
 =?utf-8?B?REpFREhiS003UDI3MGk4aTE0ZjcyNHcveW4zVVEyK21zdnJLQ1FPOWFwUS96?=
 =?utf-8?B?Yk5qdmlUWFg1UmtUaTBKZ1d0c2ZuRG1JUk1wWDZRMmxJVy9oblZURHlHeHNj?=
 =?utf-8?B?TjdIUTlyZnJ4VWxvaFlETXRBeFRSZ0V5NXhNaVY4WWRBVllTakZoVFF0MFh4?=
 =?utf-8?B?cGNBT1FtaW9kdEs2VkZjQUl0bjlOaEpEZ1YrRnJXbml0SGNFT1FlYk9ZTGVQ?=
 =?utf-8?B?TnpoRkR5QTVBeUFqem9FYTJibVBkRFFiNVgybW12V3dFdzhIQ3hXVy9rdGFy?=
 =?utf-8?B?bTdMOTg3ZEVLcmUwSFhvSjhyVlRGWkU3R3p1WXRGVE1CTXUvK2ZCc0ttbFlv?=
 =?utf-8?B?c3JOcStKc3EwbHE2WjZ1MUs5WVJMNEdWSzQ0dlpDbis4UzZIbXlmcFJteGNR?=
 =?utf-8?B?THBXdXJ3aWIxOFRlNUhkd3FHeUtaQ3NZeHMxYk54czJMTGpIYjZPVnJUY1Q3?=
 =?utf-8?B?Y2dRS2FscXgvWmd1VzU5WFd2MjJXZVg4UGtXa0hPQWdqWW82SnVVZ0x3ZTVP?=
 =?utf-8?B?T3FhV2l1OGE3K2EzZFVsRHpzSDIwWmpNdmhaK25pL2RpenZFQjRvOFJCZmdp?=
 =?utf-8?B?Ukg2WFplSmNFUU1LVG9uamdIb1QyQU5LREszQlAxQXhKVUdhVlV3SHd0NG4w?=
 =?utf-8?B?aTA0NlBTYXJkeUw1VS9uc25FZUYwYTB0bGdnZEtNZmUyUzBreXA5cjcxazVr?=
 =?utf-8?B?dDkzUzBZWHJGTkZ4eFlQdFNpUGFjdGc2ZXZCY2NsZ0UrTEZYSWxXSGZCV1VN?=
 =?utf-8?B?Zkt3NW1GMmhTSURkUFY5RlFNZ1JHWVZUa085Sm5ZWEhxMFBBczUyWGFUdXBM?=
 =?utf-8?B?ZFlOT0Q3SzV1dEUzVGlieUdiV0V3b1RjZkhlakVKM3ZXc1Npak01TmRMYmxR?=
 =?utf-8?B?UGR4dmZsaVVxeXEwWW1JWndoSUNwNWpqdmpkZDRYZHk0QjhoWWdTOVNvUjRS?=
 =?utf-8?B?LzIrRG4rZlNrd2ovWngyNk96eHYrN2NjWE03dUlUaWorenNTdE90VjhzMXhP?=
 =?utf-8?B?MVhORnRtUVFzblp0ZG4zNFhKSm5mdWhMbDhVT2JDNWF6VHdiUEtLT3c4VThh?=
 =?utf-8?B?Q29aV01iN3RmNWJ4SEtHaXZEamtPOUN5SlAzRlQ2elV3R0cwdyswOTU5UDlP?=
 =?utf-8?B?NFIrVmJ1RG1RNy9sZERXOGxxT0g4d2NpWGdKb0cwanBaUW9iL1ErZzM4WExH?=
 =?utf-8?B?cG5Vbi9QZXJNNERSb2w4QlNQNjBOUll0b2lVYUlBcm9MNGR2R3pzQXJ1SUVE?=
 =?utf-8?Q?BnjBFwX84Xq4TB/9IdKUsp8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f948e93a-5e79-4165-572b-08d9ab609507
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 13:29:15.9639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQxPZV543XWrXkCkNeBDgl+0nGwJHZWtpfqKpFhFqjvduDCQ638SJHVR6lC9e84PWpxxdS4PCb6gsr8I4XVzEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

On 19.11.2021 14:19, Oleksandr Andrushchenko wrote:
> 
> 
> On 19.11.21 15:06, Jan Beulich wrote:
>> On 19.11.2021 13:50, Oleksandr Andrushchenko wrote:
>>> On 19.11.21 14:45, Jan Beulich wrote:
>>>> On 19.11.2021 13:13, Oleksandr Andrushchenko wrote:
>>>>> On 19.11.21 14:05, Jan Beulich wrote:
>>>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>>
>>>>>>> Instead of handling a single range set, that contains all the memory
>>>>>>> regions of all the BARs and ROM, have them per BAR.
>>>>>> Iirc Roger did indicate agreement with the spitting. May I nevertheless
>>>>>> ask that for posterity you say a word here about the overhead, to make
>>>>>> clear this was a conscious decision?
>>>>> Sure, but could you please help me with that sentence to please your
>>>>> eye? I mean that it was you seeing the overhead while I was not as
>>>>> to implement the similar functionality as range sets do I still think we'll
>>>>> duplicate range sets at the end of the day.
>>>> "Note that rangesets were chosen here despite there being only up to
>>>> <N> separate ranges in each set (typically just 1)." Albeit that's
>>>> then still lacking a justification for the choice. Ease of
>>>> implementation?
>>> I guess yes. I'll put:
>>>
>>> "Note that rangesets were chosen here despite there being only up to
>>> <N> separate ranges in each set (typically just 1). But rangeset per BAR
>>> was chosen for the ease of implementation and existing code re-usability."
>> FTAOD please don't forget to replace the <N> - I wasn't sure if it would
>> be 2 or 3.
> It seems we can't put the exact number as it depends on how many MSI/MSI-X
> holes are there and that depends on an arbitrary device properties.

There aren't any MSI holes, and there can be at most 2 MSI-X holes iirc
(MSI-X table and PBA). What I don't recall is whether there are
constraints on these two, but istr them being fully independent. This
would make the upper bound 3 (both in one BAR, other BARs then all using
just a single range).

Jan


