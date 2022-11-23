Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CDB63575E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 10:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447473.703722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmGO-0002U5-Fz; Wed, 23 Nov 2022 09:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447473.703722; Wed, 23 Nov 2022 09:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmGO-0002RZ-Bt; Wed, 23 Nov 2022 09:41:52 +0000
Received: by outflank-mailman (input) for mailman id 447473;
 Wed, 23 Nov 2022 09:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BfOp=3X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oxmGM-0002RT-RX
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 09:41:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d698ff3-6b13-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 10:41:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9383.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 09:41:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 09:41:47 +0000
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
X-Inumbo-ID: 0d698ff3-6b13-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOavXKx0BcA0o5Ktrv1/Tebv6tr/BWObddB2RXaw1TKMkUJ3ndZM8GXSHqP5zqMUhR2lTWMMMai+4nRlXlNXon8tzsZbnoPX+Tt31SCHQLXdGIkajwvIoZPa7aK5RCNOJNVG3CTEBc3o/FVB+MEP6OFlMlsnujnECsMQ8bo2euxR6npTD1C6qZtofj/OexWnxl+kcfN6vyvbxWyraicSaKBx7iyRTyaTLLKd/LsfHhYt/9ayxEJNP6O/x2LFZ7Of9P9Q/0uUAJzOXJ3cQy6CYnV52/hFELyWXMzXsz47GNzn722SD+FRM9Ud/NwzGshahXOHWCCRiuZjyLLi3CGWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG1AHlPhDXiS6rIw87uuY4aq1P2umvYb3YE/AwvEi+g=;
 b=gfuocVR/YKwg+0cq/vygONg6W8Rsa4cpFVp6N/AV/PE9dbuAycGFTPY2K8tyMp1JjzConjV7pfadRDPD/z4K38tjW2XDkTPEenVgtolACf/rr9NXne6xHtpOUz0V2hc0t1hqWdfP8Lq89STnMX0McL2bbLwBwhY//ww9wp0cNgAlXHp4bkhahJnbCEcGhqi0mkorH3kavc9iTGc8BMIuRtakEZNuT43y43FN0DQ7xwOfjY60MHOr1L4q3+7SsXT0auP3PsDdRi8uh32PCpRsjwifyHO1qxM6WYoNRAAB9gKaRldvPo/E0ra1RBG80sWB4c9J5CN2UW13nwCAj4ukzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG1AHlPhDXiS6rIw87uuY4aq1P2umvYb3YE/AwvEi+g=;
 b=sUb0jKe3w+bkGDuzvKR8UPM6NLUCOfWVvTHd0RskzCH71btx+k0UPl/FfrFLEsdpeEfcKj8mmLIi5eRButTu/e5OqhHdxz/jnqIRnmvfZ3A3fiVZH2zRxPoFMsS6DIX5tFX7N2xJlgSEvIzKGwaqx/VXKxaaBxrmSbmndbuFHU0ixd56D3FGaoEhVOuxvlETFAx1/5LC9W/PDeQT5ffRbBaRRbwUB0ft3TBXehwr4MEHbL43fJnP6lU3I0/14BsEruW0QqeX7+2oxBgwfjL5wto/Au2zEtaXjbhi9Gl3ejx+hC/K8lOZJ4NjGcqNu+prMhs4TcP1Z/m2VN/Tuq8qTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0d0ee24-f92c-d0c8-2bfb-f6beff269a1f@suse.com>
Date: Wed, 23 Nov 2022 10:41:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/9] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: marco.solieri@unimore.it, xen-devel@lists.xenproject.org,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-3-carlo.nonato@minervasys.tech>
 <CAG+AhRU8zrHaxrNQqyu-c4niB2DWXcQRmvsit_samXtDa2LpfQ@mail.gmail.com>
 <2e6c8d81-01d1-81a1-8fd4-4385e46befe4@suse.com>
 <CAG+AhRUEoJQGSw2qJmE1JFTuCMa_0sUR2+M2Zd8pkd+dgf2wPg@mail.gmail.com>
 <6c07cdfc-888a-45bb-2077-528a809a62f4@suse.com>
 <2645971b-8094-6108-f3dd-567e93d1f1e5@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2645971b-8094-6108-f3dd-567e93d1f1e5@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9383:EE_
X-MS-Office365-Filtering-Correlation-Id: 43049f81-f4a2-4253-c13b-08dacd36f0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3rPkZHP8sTy+RiOVPJYz1YhLO4SIZmLJ+Q79EBLiNTCS+YfcbFAOVTUu9PBJaJ/ZDQbdvhZpTah48NFzeq2oO9wbrZBtCsiTFiutGAk98eOpk9rGymH4+6khOaKA1MsqHqrsvgfej8iVs+L7HoxHWb+WrF9tvJdVTi7kDr5fg5/3l59W5qK+gIICASUuWyKUpOwhyOEUaRNg2zBqbQIwea+4gjt3kTqLIDS343nakFpW5Tmn7g0muKBG272D0wrW6z0MPtsUldQS2QuPlcmTuH4X6Y8PuoA9UfkTmwJIi7rPv+gFJ/FrW3CCtv944fR78bilLawh+4q/vxEfDbEBr0A+DFFkkq0TS69QjUYR+wkLwCCm/dq1bMP59jBFOwHlRqt91MmvodMWatij6l29OVlNibn1iaOvDnKaxAVLz/7uFcIHN20kkYeWE21nAcqiMa9ZPmzmFs5FmDTXWGxA0q1wicgphy3awIIcVkkIDMx0swcSChF5xdl9bojIezvWGKkB1kvsyvAcpiD0CJTvyANNTFcDWOhM+XAhEutYAQNCXX5oRURXaMLKVUGpiaWOT35N9A+7Ck9aqMwmImj2frIldc34+bBcQVhYua3IM1wzCXJSoAX5Ug1NpWMFCPEULG2RJGQ6K1mBp3ofwLnz4AhOY8sEBxcfY7VKa1EXv23DZjRii1hoGB+R4XjnaXhelk6EXBQdTAyoggqJ3wXHE3ExkwfyXIz1+v9cN2zG16c/ffjn/LyIg71Q/G9cpXv3U+kd52DZ9Xf7jyaIKxLetQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199015)(66476007)(41300700001)(31686004)(66946007)(66556008)(7416002)(5660300002)(8936002)(2906002)(66899015)(4326008)(8676002)(316002)(6916009)(54906003)(966005)(6486002)(478600001)(31696002)(186003)(2616005)(86362001)(6512007)(6506007)(26005)(53546011)(83380400001)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEt3WGVLUGtJcFRHdWZmSVg4RDZDenIyWk9WeUU0VHNSZkplc3pyTW9TdnQ0?=
 =?utf-8?B?a0dRaVZaOEN5QnBZWVhDWlFGUnlDMmJNYnEzSVJsckkvVUhQaWJzRnl4UjJn?=
 =?utf-8?B?MjBtSStZL3JWa2pXR1c1MFQ4TGt4K25EdmMyMGtMdkFDalNxekR5VXhqVjNT?=
 =?utf-8?B?dnhScUxRbWRiM1FUMlBMQVQ5cjlYVVdyQU9Ubjc0SmFsR2E1OXk1S2RPWHlG?=
 =?utf-8?B?enlaSU55d1pad3BUMmZQcFI5c1lQQUw3bjQ1bGxXcnIxazJGUWNXSHltVURX?=
 =?utf-8?B?RXJhNGl0d3FPRVJHUWo1LysrZWVnNngzWVhEejNZcVFiTi8zU3Y5TkZZenVH?=
 =?utf-8?B?RlE5RUxHN3VXUkkzZ3hDaEJTUWJhWndoS3VHd0hnenc1NERtbUZjRnc4WW9T?=
 =?utf-8?B?SEFqcWM4WFFGcDdCQnIwYUZWNlhCWWxaNTIwZVQ0cG5oTWdSTWpnV29RTVdB?=
 =?utf-8?B?ZDJQM20yQ3Nac3ZxSDRwb3ljZnBqYUlGSU9VZU1YQXJjN1F6U3VqcjE0SUti?=
 =?utf-8?B?NE9OVHZhMmptcU1CVUV2U3pkY05ERmU4RXZ6Q1h0Q2ZDUWU3VDNyRDBMTUx2?=
 =?utf-8?B?SmtJL3NEd0xJYndrdmovNk5iNklZTWNTUHo0NE80ZjFSR2xwUERJNWppaG5T?=
 =?utf-8?B?Q3RpVDZCajNCQU5VWGRYancyN2V5NXpyVGh1dGJNMEc4VWF5MVZsa1NHMTQv?=
 =?utf-8?B?RGR5Tm5rUllnajZMWDdUOFZBVU5lUWxGOEU1SnlONE90RG81aHA3WG4vazE3?=
 =?utf-8?B?RzNJODluUVJ2Sm1UMVVsZHlMU1g5ekZISVY2QzA4Zkp2NGZEdENrVXF1ZHpR?=
 =?utf-8?B?THFseVh1WnVYY3VNWXlZWkJNajFSL0FHdFMwbGdvWFd4eHZaZUVMRVFWSU5N?=
 =?utf-8?B?NWFsdFA5NEl2YWlzNWZmLytyTFpPQU9GeW9oaXc1azBaSVp5Z200TjUvS2NB?=
 =?utf-8?B?R1pKV0ZyN2FDSk9LRnl5d1Rsa0dpdHNST21KcGtxTGRjdzZHaWRHVnpuUVRu?=
 =?utf-8?B?dEJhcFA1bkRjbEs4ZVZJMU5KZ2ZhQkwwR2p0ZWJLclVGMzhkLzlxS3pBVHdn?=
 =?utf-8?B?QUNBK0RLaERXRVZqS1FkTWQ2bFAwVjVxZFR4WjR2Qmx4YnJoOWgzQWZyb21r?=
 =?utf-8?B?VFRoZXA5dURqVDBpckx5RTBNdFN1dCs2RHlUOVJYRytWTHFmNjR3NG9hTElo?=
 =?utf-8?B?NWg3bk1wajM1ZUI3SGZxR25xcnFTOWNnejhBQ2dYeVFMRmxMRzNCVWVuV0dU?=
 =?utf-8?B?aDZsNEJhNlNpR2RnNDBRMW5FSFh2ZXBhckRVdS9FQmpDVDlzbXZjWllGVlJ4?=
 =?utf-8?B?Y2x1Y2xKWjdvZmFUYlpoaWtLMXhSQ3JkZlNIR0dBRVVnTkltYUVPdlhmNC8v?=
 =?utf-8?B?SzNRWXRuK1JLN3ZGMTZOb0VyK1hzU0sxVnBkbklsQktKZG1jL282QTFkVU5t?=
 =?utf-8?B?aXRRQkVVNVJaaXYxTDF4UGNwdHJqTFNvOFJDOUFBRzF4UlRYVUtrbWJjb2ZN?=
 =?utf-8?B?dk4xTzNrTWdiRzJUaHdrRHZ4MEVPVTduUGcwTzBVWTloelFxSkYzNExibERx?=
 =?utf-8?B?cXlSN2Z6VXRUK2IrMXZRaDVoQk1ZczFldWJPM2xUT1Fzb1BsWDFZZWVsbzZt?=
 =?utf-8?B?V2xudzRLUTlxTW1lbTVocEpWMkxhdnFCeHo1bkEvN0UzbSs0MHFXV1B4cmdt?=
 =?utf-8?B?NTB0M1FtMldkUmQrTHFuZFFSR3lTY0wyanJuSnI4TEdUazJuYTY2S2ZLVkpa?=
 =?utf-8?B?cjg2Q3ZaMHN0c1hxWHFmN0J5bHpzcWJxZVB6djc3eVNvM2RDRTdoTEFLbjFQ?=
 =?utf-8?B?MnkyUVd3VXVFTkpZdk84eVh1WTJ0YVRNL3c1MjVOWTZUaVZrUTVLWlBQU3Za?=
 =?utf-8?B?VEhrdjVGaTFKWXVKblNDTHhQejBTOEoveC9VTitWWXhxNzJUL1Y4Y3BBN08r?=
 =?utf-8?B?ei9wbDR1ZUdmKzFBZUxGK1NQZU13dUlqenI3QUhRYlBRelR6M0tZWU5lY25i?=
 =?utf-8?B?SGh0THRuY0VESFpyUHV3UktaSFQ5UXVjLzBUUXVhVGYxcndtUVFWWWhkL1dQ?=
 =?utf-8?B?SzVBbEEybGViMnFrUjI0Q2dHSVhWMDFUdEtEMnNGRnQ4YzliUkNNK21Rb0Fu?=
 =?utf-8?Q?Lf/8WvqdkQkFQzIV417KV4m1r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43049f81-f4a2-4253-c13b-08dacd36f0b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 09:41:47.8280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLbkd+EkpIgBjimzpArSfDorQl7v57pUPTQye4vkpgaV7iOVH0ftAfk34WiG0H/2jzIPHgaaea6Hebg4yVMPPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9383

On 22.11.2022 21:25, Julien Grall wrote:
> Hi Jan,
> 
> On 21/11/2022 16:40, Jan Beulich wrote:
>> On 21.11.2022 17:23, Carlo Nonato wrote:
>>> On Mon, Nov 21, 2022 at 4:14 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 21.11.2022 15:50, Carlo Nonato wrote:
>>>>> I want to ask you some questions about this patch because in the previous
>>>>> version me and Julien have discussed how cache colors should be passed in
>>>>> domain creation. You should be able to read that discussion, anyway here is
>>>>> a link to it
>>>>>
>>>>> https://marc.info/?l=xen-devel&m=166151802002263
>>>>
>>>> I've looked at the first few entries, without finding an answer to ...
>>>>
>>>>> In short, using struct xen_arch_domainconfig works fine only when domctl
>>>>> hypercall is issued. That struct contains a XEN_GUEST_HANDLE so it
>>>>> should point to guest memory and must not be used when creating a domain
>>>>> from Xen itself (i.e. dom0 or dom0less domains). The easy way to go is then
>>>>> changing the domain_create() signature to require also a color array and its
>>>>> length to be passed in for these latter cases.
>>>>> Are you ok with that? See below for more comments.
>>>>
>>>> ... my immediate question: Does supplying the colors necessarily need to
>>>> done right at domain creation? Wouldn't it suffice to be done before first
>>>> allocating memory to the new domain, i.e. via a separate domctl (and then
>>>> for Xen-created domains via a separate Xen-internal function, which the
>>>> new domctl handling would also call)? Or do colors also affect the
>>>> allocation of struct domain itself (and pointers hanging off of it)?
>>>
>>> This would be really good. The only problem I can see is the p2m allocation
>>> which is done during domain creation. With the current set of patches it
>>> results in a "Failed to allocate P2M pages" since we want to have p2m tables
>>> allocated with the same color of the domain and a null page is returned
>>> because we have no colors.
>>
>> Hmm, I see. It would seem to me that this p2m init really is happening
>> too early. Ideally domain_create would merely mean creating a largely
>> empty container, with stuff being populated subsequently as necessary.
> 
> The vGIC is not optional. So to me it sounds wrong to defer the decision 
> to after the domain is created.
> 
> It is not clear to me how you would check that mandatory components have 
> been properly initialized.

There could be final checking right before unpausing a domain for the
first time.

>> But I guess this is too much of a re-work to be done in the context
>> here, plus of course I may be overlooking something which actually
>> makes it necessary for domain creation to be structured the way it is
>> right now. (Imo the reason for the early minimal population of the p2m,
>> added only quite recently, wasn't a good one, and the vGIC init would
>> better be deferred. Yet once again I may lack details on why that's not
>> possible.)
> 
> See above for the theoritical part. For the practice part, we need to 
> know the vGIC version at domain creation because it impact the maximum 
> of vCPU we can expose.

Sure - I didn't suggest to leave that information out of domain_create.

> It is also not very clear where this could be initialized. Are you 
> suggesting to add an extra mandatory hypercall? FAOD, I don't think 
> p2m_set_allocation() would be the right place.

I agree with the latter - that would at best be a bodge. And yes, I was
thinking of having a separate domctl for that purpose.

Jan

