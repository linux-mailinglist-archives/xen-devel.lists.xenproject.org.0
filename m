Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B48213CCE1B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 08:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158069.291204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5N1B-0003zS-PF; Mon, 19 Jul 2021 06:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158069.291204; Mon, 19 Jul 2021 06:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5N1B-0003xN-Lz; Mon, 19 Jul 2021 06:44:45 +0000
Received: by outflank-mailman (input) for mailman id 158069;
 Mon, 19 Jul 2021 06:44:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5N19-0003xH-Tn
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 06:44:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36b35110-3fc0-4f9c-a803-59d83bfe1dd1;
 Mon, 19 Jul 2021 06:44:41 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-T2JOQ0ioP4WHLt_SUKXvbw-1; Mon, 19 Jul 2021 08:44:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 06:44:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:44:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0008.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Mon, 19 Jul 2021 06:44:36 +0000
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
X-Inumbo-ID: 36b35110-3fc0-4f9c-a803-59d83bfe1dd1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626677080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKQ7LFynAitHLMqldOmFq2bwmJP/pDKzRdeQ2CVHO9U=;
	b=iKA2f0LkWjthF6zAnC9sFCDOlIIJAfENhdCa5UMZrhgvownihxWRC55BzL8d86f9fCf5zY
	BqIWC16Geaz8JUIg2yNibffROjkM4MXYsU7jDUFdMPniIlqEN6FFWkA5WXOJvg//uQgsL1
	uWWuiV+8CLC214fInctEPfrInOYe2+g=
X-MC-Unique: T2JOQ0ioP4WHLt_SUKXvbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTynxhsd4PFmSjsVQQ+1RlQJOqWRUD2MsBkiyCgqwkYW7ReNVWPEX1ks43Exe2V2bXbtS3wHg7snyT2yI46ULKU80vkpZagaHNiJo4FC/WDfL9vPkMzYyOEtkvh77Zsiy4t28iR0IoE8kax30bORkUi/9ZldDd3M1PpLkyW5e4UIE/h5O7gsvsaAWtPuyUr7kv1+5RpOqg72HKMBw51OwkVlf5FWasqstx1/ypGA5wxcrFc9lZO56O7pmmXnyXk0H/WSk6OlfRLcEj2GBYC3FXlDY4egyJFNJrZFHnFqUwc27SpYwFxU4vVjWRcRkwpwIPMbcJs0MaWh9PATbb4thQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKQ7LFynAitHLMqldOmFq2bwmJP/pDKzRdeQ2CVHO9U=;
 b=kS8R+Jlaf7PbGiqxNtR6DJaxZI83Wg/Er1HOWzq/br7eSG/Ut8I4ArU3qmS/cBfl8aZukITMzY26hiKekrFCueee+X65ePzYZzJ01D7/+6iTodnLlphuGRCvMQmoaCpPokZhSnVl+f3T31cot1muL9FiyLiP4N1kZEYYoPbe79iU4T1r1XJn0jV6VXkR7rAlbMVHZZq3WKDvmh+6kXmg9+6iVtdLgsowGbhl3VsXslPBK1Tz/FHF9raBAdayabfsL6p6AwNknafUsScHDsrsqy4WTzcOxsdvYb5x7h/1tdTzDElDHPHFCNquctHn3o9Icq0FRI2U8XTydrExawvi8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Suggested changes to the admission policy of the vulnerability
 pre-disclosure list
To: "Charles-H. Schulz" <charles.schulz@vates.fr>
References: <87r1fzclw0.fsf@vates.fr>
 <6da30009-d817-f48e-11b4-ba9c92cde93d@suse.com> <87k0lqmmf8.fsf@vates.fr>
 <ea129173-c1fa-76f3-4964-8491b6728ca0@suse.com> <87wnpqm380.fsf@vates.fr>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <14d1b95e-9d3a-8464-010b-d7796a26a8c4@suse.com>
Date: Mon, 19 Jul 2021 08:44:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <87wnpqm380.fsf@vates.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0008.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4237c22-a70b-4d1d-aa09-08d94a80aced
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150AF343A99B1E17AFD15C3B3E19@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5vxcXjyq4PdDLzqsGYvJa9orI3ctqntKmJbi5kkvIqxq9FQ//0VB2owBn+WbSytxSlugFfb1ukSs0CeEZKW5yvZ808jm9KPLuiNx31rACMiFZn16ImKofMwFw/hBbKVsXLIwkS0cLP6P759jyuYHwg06B8kbZajsZowJzTyAfw3PqOoDK8glQYtX8UOrouXAKhGyw9qh4rQHiNPkK24m5roElwddXA19oykew1fcGcB/h4QOQKgvG0ZVfwZaWLTNyjVyAWTZD3x+kQQAqrQqRAQQSDjGWFO3e6C4BTQljMHUbTZJTD1rCWOhAnsf99G1s30Ou+3IzDZhRwVLxhoq2iOt/Vv2QePHTV9wtpV/nvc63ZIjq29nJy25Ui+wWNFygsFDX5Imt6mKWg3HdIefxzC/sgCEiQg5xH6Th+Y2j4eYFA2uH2DychJF64i7hhsINcqM8rwfGiZHNSN5nv87rGXZaoKCAFZmX043PR/MMmvU8Up1m7VVdmp/P6Ftrwg+YLCfrZr88el7NhMcfF3vSwEN26KwrB4gwptCnCjtIxuNnDvkAnaYPikQmi3eHLGoE1Dx33n7sFBR1UQ+GDITOTDbIgcMj1pg7Get5ZQrCOQ/G+EBtg6cWEcfHU4enusCMWHJbw99WAzZh2Ec95HkY2Zt74bPR0iP42/mTWYF//SFa+regMnLbktaJ2eqaHjKxIKbwlWcZhSPdNImB/z5KMDJrHON1KEO12o7lbI/eOSYn36D4Gk8GhnPgrX5s7tEQAalpvsBsFtT7N/HzUxL6uMG0HUwFZ7eBhBfn9vT2OhGYoN5whBBbtVXlL6glJ00
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(396003)(136003)(366004)(86362001)(66556008)(8936002)(26005)(316002)(36756003)(31696002)(6916009)(2906002)(5660300002)(966005)(16576012)(66476007)(66946007)(38100700002)(478600001)(4326008)(83380400001)(53546011)(31686004)(2616005)(956004)(8676002)(186003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmJJR1FEeHc2dUlUVW93NUFIZHdrNW5DWDBVcVBuSEtLUkk0dUtYN01CdUVE?=
 =?utf-8?B?OTMrSzlwVVo1cFRCaitrTE54NlJUcm5iNTJOS2E0SitTazA0SzZQNW5VNDJX?=
 =?utf-8?B?dklxZk9VelovZ0Ywc3BSYTR5K1AwOTVmbE4zRmVCN3NTcVR6QnBHM3JyMitH?=
 =?utf-8?B?VEp5QVZVTnlLK2hsbjFvNUxCc1dUVVhOT1JxSUdJZ2xVT3BQajJuRDY3ZVpo?=
 =?utf-8?B?ekZVRnkxOHdJaGx5WExoNjgxTGF4TkpKdkhCeHp4UWxPOFdWVjljbmNaWjdF?=
 =?utf-8?B?Y3A4dkRncVQwSk9QQjJQVDFlSDM1bXY5Q1Juc0VPeTZQM2NjWjRHRG9rSmdF?=
 =?utf-8?B?bjFHY1J5emhiZHNYd2dTLzkwRGZENWVBcTg1bEFEcTRYdU1ocVlSMkhGeXZ3?=
 =?utf-8?B?c1NSbHBadVZsZmtlYWVhM2Jjb1VhbXppczQwU0ljMjVQTTltS2Q1dzErZElP?=
 =?utf-8?B?RytXMXVTRytWZnoyL3VvcS8wN1FXMzBJNU1ZVWM3RDV4dHkvd3k3UUxsSTVE?=
 =?utf-8?B?THJYNUkxeEtWT3F0aVp6eTRiRklBRkRGdXcxNFh1WDJNMHNlaVEyOHBxYTVj?=
 =?utf-8?B?VG1DZnBJMWdKR0Y4YlRmd3RQWDVPK09MY1hwbHBCb2pOalRvTWZjOFMrQUJ5?=
 =?utf-8?B?OVhRT0Z1Y093NU5QQS8xT2NlT01CMnoxM2lkRkUrT1g2aWdOQzFxM3BZbTk5?=
 =?utf-8?B?SFZObUR2N2p4VmE0aVQzVzBzZFlyUTJkdkRKZklPQVl4d0h2QkRaSDNJYUh2?=
 =?utf-8?B?SndJSkxVem9EZzZDOEZTRnZ4N0RBaVFvY0c5NTRHemlzaCs4ZFEwTUE3RTF4?=
 =?utf-8?B?UUlpNEpxaTJqVzRUd0FrcnFwdHFXYlB6bjM2Wm5adWtXQTZCeWNvUVNLMllX?=
 =?utf-8?B?dkt3blVnTmpGMGZTcmxMNWxTWmlpWEdvd2g2MVo4YUQ0VTV0VW9uaDMxdzJM?=
 =?utf-8?B?S0FRRnVOZ2JFRUtPZmdEcDJkdk9BL050SnM4OEd3VXZlWjd1dTRTOU16SEJt?=
 =?utf-8?B?SUJHa2lIMGtsQ0QzRlMyQWdwZnpYd01wRDh0eWJnbnRMSVJ0NkpvWXdXTVlO?=
 =?utf-8?B?NEorU2hJY3hjU3hzVVlBaUxjcjhscUxhc1ZURVprMCtpQlNHQ0oxajJZRGQ4?=
 =?utf-8?B?QXRsVlIxalltUjg3akhzOGQwdklvTkNqaUZrL09mVForSHZYK0JVTGpGMmwy?=
 =?utf-8?B?S3BRQ0tySU5RRG1QM1JyQWtzb1hlMzNISldvYngwVUtEUWhhWElpSFAwTFRO?=
 =?utf-8?B?a0o5NURxS0RaUmdlaTFiR29UTXF4Rlo1Ujdjcm01eHMwVVFDTklpT2NRUjdj?=
 =?utf-8?B?RG10Zk9IYlNwTXRRUk1YVDVXWFAySzFpWHZCWDRmREdIRCtIMGR5QTJiczJy?=
 =?utf-8?B?K0ZheCtQZzBXUW5Vd1hpUXJhWFAzUVphRFByeGc4K1A2emUvWWMrbVA4ZnBa?=
 =?utf-8?B?bEFNU2srT0crcGsxaXpXa1IrVmVkbTROR1Q3UDZyZWNhN2swdUQ1bTluSERi?=
 =?utf-8?B?S2FvL1BTeWJDRUFlLzJtTS9yTXRMMElJckxFNUw3dzBDUmN0TUZhV1oray93?=
 =?utf-8?B?QmpTY3VuemFwR3V0ZUhsS25wT1V2RWNidmpVclZxMi9QZW5acFpQNS9uYndm?=
 =?utf-8?B?N0ZjY3I0OE9aamprNEo2MHp1aVYwMXZLUHM3NlozSXhnRGE3Y2NMRTBpVU82?=
 =?utf-8?B?VzBCUmxtR242UDFGbWJzaTFzS0RSMkRVUUY3VkhBUFgyNkVTY0hFOUkzRE5M?=
 =?utf-8?Q?AtMqDcIpfeL5zvXstB5YGg55zl6eHWdWpDLuS/A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4237c22-a70b-4d1d-aa09-08d94a80aced
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:44:36.8381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrznCIXV2A/ZqIzXZ6dG+79I2RLKrEL1i8Daz9p0m08xXtPbR6atW3ilYsnXmmomtoSLFT822m74DrNk32EJ4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 16.07.2021 22:08, Charles-H. Schulz wrote:
> Jan Beulich @ 2021-07-16 17:21 CEST:
>> On 16.07.2021 15:13, Charles-H. Schulz wrote:
>>> Jan Beulich @ 2021-07-16 09:52 CEST:
>>>> On 15.07.2021 23:23, Charles-H. Schulz wrote:
>>>>> Hello,
>>>>>
>>>>> I /we /Vates would like to suggest some changes to the policy regarding the
>>>>> enrollment to the pre-disclosure mailing list of the Xen Security Team.
>>>>>
>>>>> We have had some talks with the French national CERT who has a need to be the
>>>>> recipient of such a list. This national CERT -and in my experience other
>>>>> national CERTs such as the NIST for instance- is in constant contact with a
>>>>> large Xen userbase that is mostly made up of large parts of the public sector
>>>>> as well as critical infrastructure operators belonging to the private
>>>>> sector. For confidentiality reasons they cannot disclose who uses Xen and
>>>>> where it is used nor who may be using it internally or within the related
>>>>> national cybersecurity authority.
>>>>>
>>>>> Because of that, their request may not be clear or matching the existing
>>>>> criteria for inclusion in the mailing list. National CERTs are trusted
>>>>> actors and have historically been among the very first entities to define,
>>>>> advocate for and put in practice the very notion of responsible
>>>>> disclosure. Much of the current practice of Open Source projects in that
>>>>> regard actually stems from CERTs. As part of their policies and processes
>>>>> regarding vulnerability disclosure, the notion of confidentiality and
>>>>> documented, waterfall-like processes of disclosure is play an integral
>>>>> part of
>>>>> how they handle informaton and publicity around vulnerability. As a result,
>>>>> national CERTs (and the French National CERT) do not spread undisclosed
>>>>> vulnerability without following established and agreed-upon processes. Such
>>>>> processes include, in our instance, the ones defined and followed by the Xen
>>>>> Security Team. Compliance with these are the first criteria to earn trust and
>>>>> respect from the ecosystem and the downstream users. You can see an example
>>>>> of their work here: https://www.cert.ssi.gouv.fr/
>>>>>
>>>>> Part of the mission of the French National CERT is to work with
>>>>> critical infrastructure providers in securing their IT.
>>>>> This kind of expertise entails the securing of these information
>>>>> systems before any unforeseen incident as well as after the incident
>>>>> (incident remediation).
>>>>> None of the tasks involved imply the communication of zero-day types
>>>>> of vulnerabilities or vulnerabilities that are unpublished to the
>>>>> downstream users.
>>>>
>>>> Would you mind shedding some light on the benefits of a national CERT
>>>> being in the know of unpublished vulnerabilities when they can't share
>>>> that knowledge with their downstreams, and hence their downstreams -
>>>> as long as they aren't themselves members of our predisclosure list -
>>>> would still be zero-dayed at the time of publication of such
>>>> vulnerabilities? Shouldn't their advice to their downstreams rather be
>>>> to direct them towards applying for pre-disclosure list membership?
>>>
>>> In practice, most of the downstream users that the CERTs work with are not
>>> going to subscribe to the Xen pre-disclosure list, nor to any pre-disclosure
>>> lists of vendors or Open Source Software projects. The downstream users will
>>> work with CERTs and various cybersecurity service providers (Security
>>> Operations Centers -SOCs- being a typical example) in order for vulnerability
>>> discovery, disclosure, patching and later integration of fixes or remediatory
>>> measures be managed and applied.
>>
>> It feels to me as if you didn't really answer my question. You restate
>> what I understood is the current state of things, from your initial mail.
>> The important aspect "when they can't share that knowledge with their
>> downstreams" doesn't get discussed at all. All their downstreams would
>> have to wait not only until public disclosure (instead of patching their
>> systems - as far as permitted in every individual case - already during
>> the embargo period), but there'll be an unavoidable further delay,
>> however small or large. I'm having difficulty seeing how this can be in
>> everybody's best interest, and hence I can't help suspecting that
>> information might flow irrespective of this being prohibited except
>> _among_ members of the predisclosure list.
> 
> You seem to suspect dishonest or malevolent intent from CERTs.
> It's not a proper base for discussion. Therefore I'm not going to hypothesize
> on some sharing of information with downstream users which will actually not
> happen, because the behaviour you suspect is not an accepted behaviour,
> neither from the CERTs themselves nor by professional actors in charge of responsible
> disclosure and software security. 
> 
> Having said that, you are right indeed that the downstream users will not
> patch their systems before some time, usually because CERTs, service
> providers or software vendors will notify them or do the work for them. But
> that is how things tend to work unfortunately. CERTs act as their source of
> information and prompt them to act. One can find it a bit idiotic, and I also
> do think that both public and private sector entities should be much more
> proactive when it comes to their security. But that's another discussion. 

Well, if it's really (and intentionally) like this, then my suspicion
above would indeed be wrong.

>> What I could see is them acting as a proxy for their downstreams, but
>> this isn't what you've been asking for, and this would also mean much
>> more of a change to the policy.
> 
> They act as a resource center for their downstreams, but the information goes
> top down, i.e from the software developer to the downstream, not the
> opposite. Also how it entails an even bigger change to the list policy is
> unclear to me. 

For things to make sense (as you seem to agree with as per further up),
if their downstreams aren't to subscribe to our (and perhaps other)
pre-disclosure list themselves, the CERTs would need to act as a proxy,
in that they'd be permitted to relay the information before the embargo
ends. I didn't think there would be much of a difficulty seeing that
this would be more of a change to the policy.

>>>> As to the actual policy - how would you propose to categorize such
>>>> organizations, i.e. how would a new bullet point in the present
>>>>
>>>> "
>>>> This includes:
>>>>
>>>>     Public hosting providers;
>>>>     Large-scale organisational users of Xen;
>>>>     Vendors of Xen-based systems;
>>>>     Distributors of operating systems with Xen support.
>>>> "
>>>>
>>>> look like in your opinion? This is pretty important imo, as it will
>>>> need to be understood who else might then become eligible.
>>>
>>> I think it's either a very difficult or a very simple question. If I were to
>>> suggest to simply add a line with "national CERTs" meaning: CERTs that
>>> operate on behalf of governments for the protection and cybersecurity watch
>>> of national administration and critical infrastructures" would that be
>>> accepted? I'm happy with that one. It's really two criteria I'm adding: being
>>> a CERTs acting wth a clear mandate from a national authority to serve as the
>>> national computing emergency response team. Not sure how satisfactory that
>>> is.
>>
>> So what if some entity acted largely like a "national CERT", but wasn't
>> called that way?
> 
> The what if question is not a valid one, as you are either recognized as a
> national CERT (there may sometimes be more than one) or you're not, by
> regulatory approval of some sort.  Nobody else can claim they're a national
> CERT.
> You can be a private CERT, but that's out of the scope of my request. 
> 
>> The present items on the list try to use pretty generic
>> terms, while your suggestion is pretty specific.
> 
> So how is that a problem in our this specific instance?

Why would we exclude private CERTs? I could easily see there being
countries which have no "national CERT" (for a variety of reasons),
with some private / non-government organization jumping in.

>> I'm further afraid that
>> "a clear mandate from a national authority" may not provide any
>> justification at all, depending on (often political) view points.
>>
> 
> That is factually and legally false. A national CERT, just like a national
> cybersecurity authority, is appointed by law or decree in a country and it
> does not call for any justification not anything political. It is part of the
> administration of the country. In France, CERT-FR is part of ANSSI, itself
> part of the National Security and Defense Directorate (SGDSN), acting under
> the authority of the Prime Minister. In Germany, CERT-DE belongs to the BMI
> (Interior Ministry). I believe in the US CERT-US operates within the NIST or
> the DHS, etc. 

There is very much a political aspect in here, imo: "Appointed by
law or decree in a country" can be against law in another country.
Knowledge of vulnerabilities can be used not only to improve
cybersecurity.

Jan


