Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0620F5672E3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 17:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361446.590977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8khF-0006SP-97; Tue, 05 Jul 2022 15:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361446.590977; Tue, 05 Jul 2022 15:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8khF-0006Pk-5i; Tue, 05 Jul 2022 15:42:41 +0000
Received: by outflank-mailman (input) for mailman id 361446;
 Tue, 05 Jul 2022 15:42:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8khD-0006Pe-BF
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 15:42:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60068.outbound.protection.outlook.com [40.107.6.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18dfe85b-fc79-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 17:42:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3015.eurprd04.prod.outlook.com (2603:10a6:6:11::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 15:42:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 15:42:35 +0000
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
X-Inumbo-ID: 18dfe85b-fc79-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkMkvTyxZ7iPYSI9fCxinYW99A5yBi2zBEwzcXMOadcGHL5aWHtjaRfHxQ57ms521Xb2yfosDohTJ0qsPdCArSDapy8tTvoMLs0bPRD+y/kRwrW4Dc5z+WgdSMRto6AgU3eZBD7JCq3nfk1fBZv0IN+jeI6MHSLd6Ms1s0/4Sb+0KQk1d4kLBZbozdcUVHwsAp6CZbNWsyX1iAqWXY5J6wcRSuwL4PnsgpQONpVUSMCtCrhqOMAqdEZ7kNwxkb3jCcjDROfinXvhq41fiGOHCHopWSqtVu1EZICOKLnCnaSCyiuKQTyOGMfVGFIvP9qc+VhL9IimEWlALDzTWbwJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5Dthn4IsHHsOh7wOId1n8WrGPsprAUglgudlnB1N6U=;
 b=AoVQGGb1GoAfDtkvQ0rYA2zEj1udLrVqWDP5I56e2nkcT5b0UqiiPvYj/sUETDmL3bcnYeG6Ke/tbbTFQZZeOJga/z4U47GZiv1TRcl3nwAxS0PX9aYPcocoOrqw71z7o9Ojf80fYK43ckiY2nZ17as7K+kLUfRhTzQjvnQU2hpRfFmrbWWCWBT8w3lfnnZQLSbXf9FfCoWklyBc5Kdx3Zlq4YffVR5gWyxj3VOx7GBFH1NthemcubYQnrz5SfUObmfmGaVAkHr/13qgHAToJaOW0Uya/t0yGeFlswRksNSfvQ+xSBG8GgbYAgAjE9tYyBC7X/Wil5fbWAeE3KaBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5Dthn4IsHHsOh7wOId1n8WrGPsprAUglgudlnB1N6U=;
 b=y42+oXNYCrnVtfHcly6iYl3QlVf7Vi3AStNYwswVDPSeSmlKfp3fKbBzlS1qFzN69LSaHhay0RBon4AmdUfV+Ahjd03boyP1Wu2RlGMsAa1KDD1AwQlWz4Pt15WNzpgwzwTTF+j+L/P+R6JNco2k+sgthQKLM1RA9fn7sF9cOFfwho4zMT8sSQOncIcVHWM/z/Ejs6lAypdLtF7ZRnNRba5st/4470yXWNSI6l0LSa6UkfHsG+VoN1NKK1bBhLyGtc4uqDI57q0WeuYcHP0vLDyzq11nTu9sXDd92Xwmzw/NucojDBnakThKEG/23G1Aa+KdneFv2mHtaS7nLVjA4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe30cb36-22fd-3f13-daf8-dce0e6a820fd@suse.com>
Date: Tue, 5 Jul 2022 17:42:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/8] xen/evtchn: modify evtchn_bind_interdomain to
 allocate specified port
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1655903088.git.rahul.singh@arm.com>
 <08fab20e71d280396d7b65397339ad9d9ab96d5c.1655903088.git.rahul.singh@arm.com>
 <9822e10e-ea7e-a39e-1270-14f0e2741325@suse.com>
 <473505a8-7df8-49a7-c33a-02b383efc22f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <473505a8-7df8-49a7-c33a-02b383efc22f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0538.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 086fe9ce-2390-452a-b722-08da5e9cfb2b
X-MS-TrafficTypeDiagnostic: DB6PR04MB3015:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h5BkC6UJqtgCPPnMnoKumvvM2g1Q8oYJeZIB1visK8hKQE9sfHFf8nnRe3CJ5i6X8SctJpiyBXNRhibZtkaXWsBvw5r6WyX+V6DyScvglVJJnTSTggoFm4hZRRN2cRlVDgkVKgZSLP5JFn0tv+QUFddits1F3hX79Kusju1Vxala4DiIAMl2sTyDl2GYlPb8XwNxG6t0VMpIC8e9bzHAdCiK0nAjvls5L/3+q1ZbGkn+RO5BMgjhLeK+SffSyZxKhr2RHjPut1X7qUow6w1lEvyHjvwIa+lvNA6CQJSdFd939fZNbYJrzBry53kCz6QeNA0AFZEmrX/zpNjYGDnpWRt4NaV42UOEaYLPzTuOsIrLQupIbcjgM+GwWZ5rcdEcumx2C2GiWKjcPZCDCH7gDDt30/W/Jfk06ng0UfgllilCNzF49+sASCDZczu6bQPB8ZggEjLmIKfDqIQ/vuIxa08Yo4K5B8aVXV5/UGDtWEeNngHYYtk/XDmFtGhe7jv5DKjGlPtpK1uNYVosy8oXqhRDv0UhsE36HeVhmEQ8MEeqnf6hb7b9MRFjoc11Vb5M1JWUCsqAKCO6hvG5zTHZztD9LcHED6V8DhikqM1elLgFZp4wv03yt7mua77XYwSxJOf1de+pj1tOTJdkk75vaq4vXxz91DRwemdtavUvpD6DsrSTPJ/Zym5oBaIRm44B8Kx7D+RD1X1KbP+w/ACXUh0+kKLzztsTXH1mNdhmx46VxxX/BTRurlUvpxg+PL0Dm36E+SpxCTy3MDuj7QBHCvXLvfJmwJhySddfZ0YivtGkTATqD5SOKGeizvS3IukURZaUgMj09vv1VNLH3XljvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(366004)(376002)(346002)(136003)(8676002)(4326008)(66946007)(66556008)(478600001)(66476007)(6486002)(186003)(6666004)(53546011)(6506007)(41300700001)(2616005)(54906003)(110136005)(83380400001)(316002)(26005)(31696002)(86362001)(6512007)(2906002)(38100700002)(31686004)(36756003)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWh4dzFSZitvdVlDOVBwMUlodElmYVpJejVaT0FHbDZLKytoTGowaEJNQVVO?=
 =?utf-8?B?QjBWSTZPMmJsQkQzVHY2aGJCZ0UyWE85RWkxYUJpRUtkR3BGUkZ2dmJsUTFC?=
 =?utf-8?B?N21hQjBQS1NDVTB5dkNSdjYxRCt4UHQ5cElQRWpmd2ovQ21XYmplVC9RN1F4?=
 =?utf-8?B?UXdhMlRYaWhUQVB1L1ppMHBVeXVCWExPaDFxL25XdVFibVVXZTNpQmhwdmRy?=
 =?utf-8?B?ckdZZkM4SnJYM3piRHp0aTZnODVLM3RlbG9LaFpQOHlvM0o3QUtDM08zcHds?=
 =?utf-8?B?UCtTTDE1WWZySmc0cDdFZU5vYUNJSVNvTlVYZExTU1VtYXJhdlpzenFDNUR6?=
 =?utf-8?B?UnIxVnZnYTRTdTVZNzZaVlliTEJ1MDR2dmoyR3J6aWFqV05TZkMvOC90eFRO?=
 =?utf-8?B?VkhTRVZ0Nys2bVB0Vnd1aDNXbDc1UWVJcVkyYjd6Y2lSN1BhR1QxRmkrNWJG?=
 =?utf-8?B?OWZZVlo5NzBtazBhQ1ZqcHpZR2M2YXFPUG45bmVtckJ0SjlkUXVSMWdOL2ps?=
 =?utf-8?B?bzdBenBYTVFpWElGVWhpOG43bnVwRUtjWGUwVmwwajZwK1UxTDM1V0Q1cWFM?=
 =?utf-8?B?V0o2c2N6M25JVlFjY1A0OE1nYkc3UmNDTTJGYkh5R05CYTJLUHdwYy9aTFk1?=
 =?utf-8?B?QVpmeSs3NHZtdnQ2SW0vQWdRN2YyUzRSWW91MXBIUHNXbzNZSDZ5eHBFNlJa?=
 =?utf-8?B?ZTNPbDZhRm55b1VqMERWMWlyVnh2dWV0ZjYxNEY4Z3RlR1dwTWxWYmt6NjZZ?=
 =?utf-8?B?STdMMjc0eG5GMm90WFBPdXJxUkliTDd4RVVYOHo3OCs4dlo0elJrZjRFNFFI?=
 =?utf-8?B?RHRCcDNaV3BsRC9nZjlDTjVCMHlhZTIvbTM1SDdYdVhrMjM3ZmRsUEN6aVps?=
 =?utf-8?B?ZjIyT01SVzd6L3Bqc05DR3dOV2hJTk53aE92M2JDOVZ1V1RENmtoZ09vRnoz?=
 =?utf-8?B?V0hHRFAyaHdFREo4ZjhWOXkwRm5mcHhLM0xVVDNJZEY5T1Vxc3NMQkhmWHpx?=
 =?utf-8?B?ZVFuNDBUS0RiYU5nTnZnc0VySzFkWnltcS9zbENRc0RZL0htY05ic2NxMkhU?=
 =?utf-8?B?T2d4L1dQbTNVWVVlanB1N2hjdmIyQkJGSmVIdERxRm1WNGNGRUplWWN0WXJF?=
 =?utf-8?B?SDltRVdCNXowczNORXZwclNTVk9vL3lPK0RSbjhRVjZvY0lzd2xBQU9vVTVs?=
 =?utf-8?B?TklUMkNUbUpCcVBFSVN0bDQ5MEFSVy9saDUvdSsrMktPS1QrSFR1TjBqNVpL?=
 =?utf-8?B?RFFkVGRPMTJCaGc4THVod0FGQWJJSUxzSkpneDVjb01EY1BYYmRpMU1zOE96?=
 =?utf-8?B?QWcvUXNBNlc4Y0pIdmZKOEVGaHNUT1Bka1kwQ21QSE5oTUFEN2k4enZNSXdy?=
 =?utf-8?B?bzFRNGduRUJtMW5qcUpoMXFSMzloVno3aE15djF2emlmdTR6TzNnWVFtbWtL?=
 =?utf-8?B?am8xS2R5TnltdVJwRHdDZHJYcmlBZE52aWFDOVZIYndMZ1FrM0dCVlgySkNZ?=
 =?utf-8?B?c0pDOFhMMFhMaWhacS9aZGRSL3JFS3ZpZnQyY2tuL3VjQTJmU2o1aXFWek1G?=
 =?utf-8?B?aENrcjlKdTZNOEl3c1AxOGd0VDdQWFBLaWV0ZEE0aEVNdC9OenJMaWx4MFVS?=
 =?utf-8?B?VDdBblgxUnJsWVNMQkQ1WkZKTG44ZlNSS1JvWi9BVEVERXZ3TDh1UGtPVW9z?=
 =?utf-8?B?aHQ0akRRYnN6VjRtUGo4YmwvcGNaeW1GZTVyTmxOb01KQ3hMd2N4MURnNndl?=
 =?utf-8?B?dlRuTmRBRXNUeTFlRFBPbmNTUzdCQkpyZkQrVTRrV2NRdDN1bHByVE1TbnJv?=
 =?utf-8?B?TUtUQm9MZGxjNXEvWklRN2dHOFEwcTNXaFF1OVNSdk92dEU1MUUxSzBTWEFk?=
 =?utf-8?B?b1FPTXoyWHVLVGs1cnZEZi9JWjdDTnhpeS9pMWZjV3plaHRnVGZkeG9XbHdT?=
 =?utf-8?B?RkNnc0w5WkFneC9qMHBwZlV4WTZicjFDNWNaK2EvSS9pVU5GVW4vbG13eHQw?=
 =?utf-8?B?aHRwZEl2ZndENVZMMmVaUFpEakw0VmlpL09YamplWHFZeDJYQ1ZMWHZpMERU?=
 =?utf-8?B?U1hlcW5XYzF2ZzRlc0JMQjNGMW1IL2RZYi9mTHlUYlRlbk1rVFBIdFZ2R01y?=
 =?utf-8?Q?kV9zxPBNx0NgIYH8D5W4CeICc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086fe9ce-2390-452a-b722-08da5e9cfb2b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 15:42:34.9764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJ3Eg4VI6p84FTWsWessyPg1rcULtIxOSF1hGs3qC1/W3z+ZESegQXfTiiNESseuvgRz+JxNGkFpALKxTa8SWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3015

On 05.07.2022 17:22, Julien Grall wrote:
> Hi Jan,
> 
> On 05/07/2022 16:11, Jan Beulich wrote:
>> On 22.06.2022 16:38, Rahul Singh wrote:
>>> @@ -387,8 +392,19 @@ int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
>>>           spin_lock(&ld->event_lock);
>>>       }
>>>   
>>> -    if ( (lport = get_free_port(ld)) < 0 )
>>> -        ERROR_EXIT(lport);
>>> +    if ( lport != 0 )
>>> +    {
>>> +        if ( (rc = evtchn_allocate_port(ld, lport)) != 0 )
>>> +            ERROR_EXIT_DOM(rc, ld);
>>> +    }
>>> +    else
>>> +    {
>>> +        int alloc_port = get_free_port(ld);
>>> +
>>> +        if ( alloc_port < 0 )
>>> +            ERROR_EXIT_DOM(alloc_port, ld);
>>> +        lport = alloc_port;
>>> +    }
>>
>> This is then the 3rd instance of this pattern. I think the logic
>> wants moving into get_free_port() (perhaps with a name change).
> 
> I think the code below would be suitable. I can send it or Rahul can 
> re-use the commit [1]:

Ah yes; probably makes sense (right now) only in the context of his
series.

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -292,6 +292,18 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>       xsm_evtchn_close_post(chn);
>   }
> 
> +static int evtchn_get_port(struct domain *d, uint32_t port)

Preferably evtchn_port_t.

> +{
> +    int rc;
> +
> +    if ( port != 0 )
> +        rc = evtchn_allocate_port(d, port);
> +    else
> +        rc = get_free_port(d);
> +
> +    return rc != 0 ? rc : port;

We commonly use "rc ?: port" in such cases. At which point I'd be
inclined to make it just

static int evtchn_get_port(struct domain *d, evtchn_port_t port)
{
    return (port ? evtchn_allocate_port(d, port)
                 : get_free_port(d)) ?: port;
}

But I can see you or others having reservations against such ...

Jan

