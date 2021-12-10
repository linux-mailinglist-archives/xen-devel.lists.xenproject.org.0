Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797AF470602
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 17:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244045.422191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvixO-0008Oj-He; Fri, 10 Dec 2021 16:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244045.422191; Fri, 10 Dec 2021 16:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvixO-0008M3-EW; Fri, 10 Dec 2021 16:41:14 +0000
Received: by outflank-mailman (input) for mailman id 244045;
 Fri, 10 Dec 2021 16:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvixN-0008Lx-0D
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 16:41:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa3acf31-59d7-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 17:41:09 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-ouxzjud-P_OIcDVtQciSpQ-1; Fri, 10 Dec 2021 17:41:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Fri, 10 Dec
 2021 16:41:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 16:41:06 +0000
Received: from [IPV6:2003:ca:b712:cc7b:8ccd:cae1:f50d:112d]
 (2003:ca:b712:cc7b:8ccd:cae1:f50d:112d) by
 AM0PR01CA0113.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::18) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 16:41:05 +0000
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
X-Inumbo-ID: fa3acf31-59d7-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639154469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upBtHwekA+CAUjlFIudIbYncLXTb8CCf5PtlFQsDmlE=;
	b=QCx2CKNj9FxqrNgvgj0JDbgrg+GrdvQTeeQmUtfo5K+/79vv31XlcAtDbjt5TEt+hhtDPE
	CxHBsus/x/ZZHH0TVW7+AppP3vEPL84dfxj14idtJeFlzcGgVDgAHC4opQ4//31uZWkPD1
	dagnBm5eJW/OV5KCeyf4bTZB1U9/CfM=
X-MC-Unique: ouxzjud-P_OIcDVtQciSpQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BI1XsfZ/iRKoMqhWcM5ZYPWIjpzyKcCFsi0FU+lG7dnHVZ/ml84y43nNplUj4TZtTw4/tdihRxkdAtvORZ+9KJPKYS6OPY8/9iimJmblhP3VIL4RW7Q+r6iM26Bj8yGLBd2FD/OpbS0beXsB4s+Enl85/N+rAJaDfvq0nAqXeFGDE8MXkaBw1woIkrApzHu3Eq/YOsfjtOsrp876e/s32/vmawK44H3tlpEGej0T0c+b4AQY+CkwvUDcn3tfrloMtVEpMhT1Uo++zS9AWCfVpq8t6CihnCE1Yvv1NpisJhDdShC95PGq7rXI3lLV+txU+qG9pUC0/UFpSp+SaClZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upBtHwekA+CAUjlFIudIbYncLXTb8CCf5PtlFQsDmlE=;
 b=AoZbuopvR38qpEulsLjwrkpjnCadfP+rFnIdeXSGNeO43TjIMfcnu/bqQqw2/YSLsrY9V6DUtL0iMRET5Fim/s2BgAzpmNT5qJA42TqrwuNtjMMwcK8eS2UlvjWo+UrLWVhmeCwmTEOIvqX9Ve6hp8OCLcY0pB+BhV/qibVxXYzhlxR0wbQ7/2kAgBVYrgU9mW/Zf52TPo/CKslP7TA18M/CDUwFHc5Orq4VPInmv9Eqvl6h/t9UoWl4LlzqdalHU3U3/RhAdVN7ysBFDUeHXp5FJ/XfAZJ3Jpjw6msCOIC10WJkyUX2KTKqfI8HzReC9f0BapQM9vJU7CExLIMiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c042f769-13bf-dbaf-a5a3-fbfd92b24156@suse.com>
Date: Fri, 10 Dec 2021 17:41:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] libxc: avoid clobbering errno in
 xc_domain_pod_target()
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <ac9ffddc-b102-9876-7a46-345078c3423c@suse.com>
 <52F30125-172C-4AC8-B3A6-104D7914CDB0@arm.com>
 <d23a7603-47c2-43b5-5365-02f437fd46b1@suse.com>
 <943FCC51-08E5-49BD-8B24-AB516AE6C76A@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <943FCC51-08E5-49BD-8B24-AB516AE6C76A@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0113.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0743ea33-4d19-41fa-4521-08d9bbfbdc8a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393451948952993DE0CEEE92B3719@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ankDhtS7vqqX71VRr0xXLpX9CRnfdjMGnWGSVLyV+rXJn5I49AqXRARwKqrVj8v2qKHV+CrzGNKFhPeVQFQA6I320iIvp4pSxd8RDbskn1dZOokcvkrgRbV9el0U28zkvw+cdhSU0U4v60kIFQYdUQ51X8tSW6OHppVYN8xn4oQr0Hsconn5rJ3MVqc+Sskk1718pdR2VcFYeEh/QYs3PXxfdR+QCrTGhHVjCdv5VxTfzvmRCglUrGC9ZgKEk5t3LpOeoG8oQlp55ntxZGJOo4qRv/+JCW+bbvFP7rJo2m9G3cJ2BqO6L+AwTv3ZraSMd2w6IvbuSDSeHot/sMGDOgeE4rlcIT3cmMBnLPNEqz4hiyk2Z06uOCeeZadWHAOo48cg+qlWfPYmQegfWia+qVIZsp7ZI1DuVlrCFXqLwiRqtModYyc/wPxRz7NZGmtoL5H9Lggd9GySjBioFYpwidzTC8q2fUkmBwk7uI16nzc7q3dOw3zf90H64DU8WUpX0+YPBJyaHAVMjarRrkTti5EdrDhcT5MbajWZJsNC4E5Mucigq2BNLxhYkBnCcX4SpDlFytatY2xK8FVn36A++OGMhYIBnz2BPh8A9w7hhGgYOapK6QaKvD0z/7/gEza5c+y4iIW9inAJqW0eiFTmw/pwTi3p1uPoVRroe+71S9nHsqJ3l9399iCMIDhYYfxd1WYHij34/nmst0egCHCBnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(83380400001)(186003)(53546011)(54906003)(86362001)(36756003)(5660300002)(8936002)(508600001)(2616005)(31686004)(31696002)(107886003)(2906002)(6666004)(8676002)(66946007)(316002)(6916009)(38100700002)(66476007)(66556008)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wml3N0d5YzhkZndwMDV0SVoxM3l1enNHYk94SlExOUFkdnZiZFdaSURUbW54?=
 =?utf-8?B?eVdOOU1uSE5DQWJvVUhqSFhsNDAxN3U0NVFuZHVHL0U1M3N3OXNiRWZqWHRx?=
 =?utf-8?B?bHoxcFpvZXZzSFZnbmVyRG9jVEpubGQ5SXhEQ2ltVkJHVlV6K25zSHZOUkFU?=
 =?utf-8?B?SHZXWkZIbjFsREV4UGUweC9MaTBFSXFxd2RSTW50Y21IVVlBOWgxNEx6eUhI?=
 =?utf-8?B?NkphRkhkMkFSeStoblBYbEliQkZBY3B6dGR0ZVJmcFNXZWdhYVB6enRKaGJI?=
 =?utf-8?B?UWhuOHU0Qjl2Y1dxRG9xOUptclYzUk1lNW1kMVdFOXdTbUNrajVQMXlaWktl?=
 =?utf-8?B?Vm5BazRFa0NBZ05IUkF4dzVvNnluS29OZklOS1FJa2RwZDlreEFMaXJPRVZx?=
 =?utf-8?B?RFVtclNxdUJnUFQxRndMTDZPdFVWWDlSaDA0cHF1d1FlMm5XcVhDRXpVbnha?=
 =?utf-8?B?eitOM0JQYUgzS2poTUV1YkRraG9ocWtNcGo4Q0F0bndwaWlsZmE4TjhncHRx?=
 =?utf-8?B?YTRYd1d2L2dYWEZvMGtnVjYySjJmSnYyOGkrQ1F6N09tcUloUWRyb3M1OUxZ?=
 =?utf-8?B?OEpHQ3N4cVNHNzBZZGZMYW54cmFrRjdUeXJOcER0R1kydGxSeTlNYmlKYTdP?=
 =?utf-8?B?TDAxdjNtaHRmVlR4djg2QzJ4MHJMUmFocWpyWUhWbDMrSmpyOFhpL2Vmb21i?=
 =?utf-8?B?Rjk1ZDM2Z2E0ZkF4Ri8xZVltUU9IYjNiMkl4bCsyOW1PTXZBY2tsSmYxVG00?=
 =?utf-8?B?K2VWSXFOMlZ1WFlOL1NFYk8xTUIxSUVDU0dlT0RLMFo3cXVQaDl3T0FOV3VN?=
 =?utf-8?B?VFh2QWFhMFJJUUtaNmZqTUFRREg3MVppL1JIRm9JQWlhc2Z2QlpQcDgreGZ5?=
 =?utf-8?B?VmY5eWl1dFRHOFlnYVMxU3MwdGFZaVpvVlJMdWIwYmI0TFB5Q1gvZlYxTUhu?=
 =?utf-8?B?dTZHbXRVSTh3cHVsUWdnbzVydE96UklMakxMamxNNnZjVEdsd3ZKUmRMOXE3?=
 =?utf-8?B?U0JUUmg4c3g1blcraTZ3L0RXVkh5MHJLaFAzR2I2T3hvemhwNDBDMTMzVHd6?=
 =?utf-8?B?VUtQUVFCNkF5SkdOcEFvYjgvNUFtdnJiMk1pWmlsRDFpczFyV0VQczduUEhy?=
 =?utf-8?B?SWFPRWpjWVNIUTgwZ1I1eC9LVW95MU84Slh6VmlhQjJtUERsbzdqb1JpMlFF?=
 =?utf-8?B?TWc4eDFxbWNQMnNDVUw5eTJEOG5VUXAzUkcxelRrN2xId1JBNTBXVkdtN2d6?=
 =?utf-8?B?OEFyZDBFUjNhN3VJb2J2OVVsU05LYWE4K2kxZGh3K0RHbmhyY1R0eXF6OGor?=
 =?utf-8?B?N1dBZHFSYXhNemNMUmZ5SlNpTlRsWjdPK3ZreFlIMlVzUWZMSXk2RDVYR29n?=
 =?utf-8?B?Yk5zV0poUkdkbHhicnVwOEl1dkE3MklibDdtVDgrSFo3b1g0NmJaL1luanIr?=
 =?utf-8?B?d1B3UjN1cGtLQnJabHBDbldHb2NGTnFVN0ZjcVpxeThwNFR1aFdpYjBWNzNi?=
 =?utf-8?B?SGlXekRKSnh3c0k0V0xFc0RqL1VENHY4SW9XaHJ2cS9TN0d3L1BZYi9qNm5D?=
 =?utf-8?B?OWhCK0ZYT0xsNVhwWEpPOTIyNENwUkhJeHZTTzViekJPQnVVbmZ0QzNNakwz?=
 =?utf-8?B?c1dPM1BvTUk3MGhIZmRXY2szeUZXckdPMEs2L0EwU3prWEx3VTFtbThEbWdJ?=
 =?utf-8?B?UlhybFBkMWo4YjRicXFMQk5qRHNldHMzRTA3Y3FlYjRva1gzV2JvK0NHL3Va?=
 =?utf-8?B?Q2Zob1dmZ3BPNWVCQjloejVXVmllYzNCWUowVCtYOCtJZXpWVmpmejBSa3hV?=
 =?utf-8?B?bXRmY1IvRkxTeERFcUZ0SUJ0Z09aeHNxWHowMlBVK1RNcjR3NitQK0V4OWdW?=
 =?utf-8?B?THczL1YrYnlzYkFvaUl6N0NLWFNoRk5vemVvUVJDZWUrRXBDRVlQOTh4cDhG?=
 =?utf-8?B?cXVYY0pTSWx6TzIva094M2hJakRCTXFEd1huNjRsak05bVpNVU5jby9mMlRW?=
 =?utf-8?B?MWFIMHBlWWJBdURSRVNha1ZVcmxsZnRBdDZRbGxxRE1MVEFHaDJ6NXo3Y2Qz?=
 =?utf-8?B?bWN1c3dPZDgyQVNPaUVZYzZWdTVCcDdxeUNGZlNBdTVYbHVVLzl0T2pFV1NK?=
 =?utf-8?B?a2ZaQTNSTmNWTC82Z2RIakR5T1VrTlNSYURlMTZoc09YSVduUytacnM2VHRz?=
 =?utf-8?B?SnROcEZ1cDAyZGxzU3A2QkRkRXhBbWJqNEpaSS8xb1VXS0NCQ1FUUGlESTRE?=
 =?utf-8?Q?0D6sMeJIRfDTGXgLYhD48IL550wC1tjO47qT5jOaOw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0743ea33-4d19-41fa-4521-08d9bbfbdc8a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 16:41:06.3828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fatjwexOq3Wg/5K79ebURMNggs5sCqJQ47iSwBTicDakM5YcjiekYqyR0c7uYYPGKAlt/gY+CXUhf0HsHSelcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 10.12.2021 15:00, Bertrand Marquis wrote:
>> On 10 Dec 2021, at 13:54, Jan Beulich <jbeulich@suse.com> wrote:
>> On 10.12.2021 14:50, Bertrand Marquis wrote:
>>>> On 10 Dec 2021, at 13:11, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> do_memory_op() supplies return value and has "errno" set the usual way.
>>>> Don't overwrite "errno" with 1 (aka EPERM on at least Linux). There's
>>>> also no reason to overwrite "err".
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Thanks.
>>
>>> But if err can really only be 0 or -1, I do wonder if the else forcing err to 0 could
>>> be removed but I must say I have no idea if do_memory_op could return a value >0.
>>
>> Indeed - see ...
>>
>>>> ---
>>>> While the hypervisor side of the hypercall gives the impression of being
>>>> able to return positive values as of 637a283f17eb ("PoD: Allow
>>>> pod_set_cache_target hypercall to be preempted"), due to the use of
>>>> "rc >= 0" there, afaict that's not actually the case. IOW "err" can
>>>> really only be 0 or -1 here, and hence its setting to zero may also be
>>>> worthwhile to drop.
>>>> ---
>>
>> ... this.
> 
> So the else should be dropped then, why not doing it and just mentioning it there ?

Well, I'd like confirmation by a maintainer. There are a few aspects to how
things are done in the tool stack which I'm not always aware of. IOW there
might be reasons to keep things as they are after this variant of the patch.

Jan


