Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CD745D824
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 11:20:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230826.399026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBqz-0001FK-SD; Thu, 25 Nov 2021 10:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230826.399026; Thu, 25 Nov 2021 10:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBqz-0001Cm-Or; Thu, 25 Nov 2021 10:19:45 +0000
Received: by outflank-mailman (input) for mailman id 230826;
 Thu, 25 Nov 2021 10:19:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqBqy-0001Cg-8j
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 10:19:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3445cd1a-4dd9-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 11:19:42 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-jg5YiZJIMI6wved2mEJb9A-2; Thu, 25 Nov 2021 11:19:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Thu, 25 Nov
 2021 10:19:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 10:19:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0094.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Thu, 25 Nov 2021 10:19:35 +0000
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
X-Inumbo-ID: 3445cd1a-4dd9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637835582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jqsdztQilpudKGCZ0lO1rIe0NgvFa9EMCcZ/0W1o0wc=;
	b=XcpdzwyncyEVRsRPl8PH7qmzjn3bFai6fmcYm+YH3g5IIeuucl+l/uhAXrve1XBQ1T599X
	bVHb7tX/bQEylRNeYfnyO7+AznfwPrxVL6ybk+Ve1pQaoLNK3SrXsPuseMOPtIKEnOYMA5
	r6fDiCwKlR9umfgOz5xnGSZszZ7e9ZA=
X-MC-Unique: jg5YiZJIMI6wved2mEJb9A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5gv0WWGL6JmW00dmn0JYgLcH9T6xG2p69DUsCxMAeyFRM3FhemJ3GrQ55zdLmXpmmOM4f66nlgg9b0nakchBG5cel8GUSNsoH6U9nXWVG58MYoijXTOp20ozQuXaUljfRtWFWyLSVj2sFy6VdAPLuYu2LEDOfr2YTFR/eus1b1nFukuGeSjBaPZtNKTlHxCLihgc0pwJup7+CGhB6Loc5K5Kobg4uEQFSYkKjGk0hXBb0rscwpKX9Q509KiMJbfZ3oJH+Kk+4w8M3Vc/L534mY9dATo3TTFMb9uXtWg8pg1EC70ZIek7/BYpIfk8VtaIysltKj30Hyk+i8hxxk9IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqsdztQilpudKGCZ0lO1rIe0NgvFa9EMCcZ/0W1o0wc=;
 b=mPYYNgFUhglOtoAj5NkiE1IGWXigzR7uvLVFm4zOphuPzaMu+IHvrXmwFFh4nH39By6fJXQsvfj7ZZ9fa+/THJoUd/gWOALJGSceD3TP9jO0zq9vr+6DOZVRT+Lu/a/ElXVLrhEGFVOFAxgUUq4rrWDRmsSF4rYh2z3Y2dAGTClmgeIjYG0ktnUmTFubk4meObf+So6f0pH/xrnntmGMwCnVTPzapg2T6E2vp4vaLQP/3CtZ/MhTxr//u604LZKoO3xD7RPnu/+DOh2SHLfau8/idOvRAd9VyEnbgNUTDCcvrsOpvXjGdTZAGy8xLUlOBtp2Jz6e+hSjPsjYp7x0oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8512f6a7-0b79-8fff-49fb-80c3d8a7a436@suse.com>
Date: Thu, 25 Nov 2021 11:19:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH RFC 3/4] xen: add new stable control hypercall
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-4-jgross@suse.com>
 <b1599a82-052f-9369-3774-69c5c570370c@suse.com>
 <5ea7400b-448b-039b-6d95-2552c9ae7cd4@suse.com>
 <e64c22c7-992b-9fdf-a276-263e9173a313@suse.com>
 <fffb492e-f570-069b-7355-c00f48215dad@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fffb492e-f570-069b-7355-c00f48215dad@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0094.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15dba0ec-bfd0-42e6-7368-08d9affd14e3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39337BF1548A740CF2FE816DB3629@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M5rY91JGRMjqRcZNGibsHpPFnFR6NuyuL0z8fQ81iHpkyS8qwa2/ZbFKEy9ZPywMJ5SHYDkvp+Rh8fRA4Xi6RqtaaSLzDG2NypvnNfzk6wmZ5us8/BvoVwk9auThTWvbauTkgmA0MQZ6kHOp1pUune6qLe8bNSOGolwwRUrFzUucFWNtNuECCTxvTIil1hS5hScRAAMLtA4NitU6UeS9t1fk5BiQaRXoK8nj+xO88Cyey9g0ehtXLJQqNp14w+/IxNRIXPmGdP03ksmKZEOddRYManwhYxo31mKoc6WXDiTBILbNScVrpBLPv33QXBgXKFDkSSB0P1gtu9T8OxrU+UGXuBJxwXaYXuu+aoQrnl9A3gVy+wslkM/IaJQkF5UZtqjXpW/u+y+zmulUa6qBYVwLuXoviQfR7xZREgj7CiKcZKhyrs12Er4ZIrettc7GuwSgvVSZYBAERUopFDzQIAyFlYh7QW6YLkFRdV1rWpgInrSJ4/4Zqy8+a6wgs4jHczPMhTHiVX07w7twx3avnjPnsmSVZpuE1Jg63+eblla7JNuiSqilkJAZIX1NJigHzpAI2R4QN1nxknrOLBdd19G1Ltwrb6bEBt+CEuYeQhWBLAd2Aqoh5FADrqBxXcIiWnEfUQMoJg/bR01hv3cMfc6ckf/jKz1nAN0ROuLejyve/+K5J4NO5IbdWgZJOjJJpWlGZmWAcMizJQRBvVNIu2OzDspJxgrEULrqx4Id1lk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(956004)(2616005)(26005)(316002)(36756003)(38100700002)(86362001)(31696002)(16576012)(186003)(83380400001)(53546011)(6636002)(37006003)(54906003)(4326008)(31686004)(66946007)(8676002)(6862004)(66476007)(8936002)(66556008)(7416002)(5660300002)(6486002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWs4aGNIYUdlaU9HVkdiMlFWbFNTV05iMURKZkxqdDE4WFVqbkp5WlY2RVZy?=
 =?utf-8?B?emVqajRHVDFwSXRZK1d1clVvaWhRcmpNKythdWU3MGJ3bVZKYUw5UmlUV1pi?=
 =?utf-8?B?QnVtQWYzQ0xBVE9iTFFjY1BMTmNsTkl0TDRiV0NMSjVwZjRyZDNiZzhuM00v?=
 =?utf-8?B?djZ3YzBZZDF1QzhMdW5ocEt3VFZMRDVGcVN0WS9QVWFocElXcVpFeDh0YnZX?=
 =?utf-8?B?a2pyRU4xS1hEdnZicDlmaDIyU2ZzZjVCUnJQamdXSnViVHYxWE5zNkVzUE5I?=
 =?utf-8?B?RUJLcFBxTWJXT1gyWnVqKzZKZGFZUDRkRGtxU0gzQk1MMlpXVERjeHRlM3Jz?=
 =?utf-8?B?Mm5kNzRSOXdWcHBPdkNoTmsvOVdhdE1RWDJmRjZBMlB1emsyQ05Yc2RBa245?=
 =?utf-8?B?WGZjWW1raE5LeUUweHVjWkJySXB4V21KRVdlZUtDOStlWlhXNytQTWJudGtV?=
 =?utf-8?B?QU1Nc0xoWUR4VS9LVmpSM0JoVUVmT09rRzk2T2NsZFVJYWV5TXZVUUtSRXBr?=
 =?utf-8?B?cWlVME5MMWtwTUZnTTZFOUxGSGdUOW5KQmEvQ3JUaENZYUVjTjdScWQ1elIv?=
 =?utf-8?B?ZXJjU2pWY1U0WlFkUVVmV05MdWRyU3dKbWhFc0tYT2FUT1R1SzFpR3dMN1JY?=
 =?utf-8?B?NE1JUktGS2doNmhuSTFCWnJqV0NmTHdtZFRGOUlacC93RllwcEV3RnI4UG8v?=
 =?utf-8?B?TC8vc3B0d25WVU8rZ21CM1J4K1ZoVHY2Uy9PdlZwYlh0bjA4RW5pbkZsVEFN?=
 =?utf-8?B?OGEraC9mQzlIc2tuNUQ1ZWwvYzBHVEV2VkxsTkNMMnVOM2xjL2pNa09rSVFM?=
 =?utf-8?B?VmZ2YTVWYXBWb3BlcGkxQzJQdFRnZkZLOWs5ODhhK1gxdDVxRS82VFl6V28y?=
 =?utf-8?B?ODRLZkcrZTdOS3NPTnI2NGFxNHAvYndWS2V0b3RYa3dpQnlaeDNycndjUVBl?=
 =?utf-8?B?U0R6Ti9GRTVRb2JhUWR2K09ZME1Ec094WkhxNDNrVUh4UVkxY3A0QzFQV3dv?=
 =?utf-8?B?VWxvZkQ5OGJ4c0FBKzJ4cVdNTnNXTHBrYVliQjAwU3Y5b3BwZVFGYzNmMWRT?=
 =?utf-8?B?WFJQZXZPL0lqcG8rYy9LTktGazZWemFqSGFiUCt6a1ZSbCtSbUpCYjlHUnJK?=
 =?utf-8?B?S2o3N0dGSnAyVWNHclNLQ29ubERmcHlPVVQ2Ni9FY0xzU3BTTDR4aTZGaEVz?=
 =?utf-8?B?TEtYazVSR1BBSXlJc2V3cmhsVTNDemJTa0l3L1U1OE83dnpobXhzUXE2dFBB?=
 =?utf-8?B?aGVpVzI4aG1abld1RWNSbEdWdjZ1eFVxSll0SWFEK2Q5SVpNdkNKekhzdCts?=
 =?utf-8?B?WkFQTlByMTJpWmFOOCt3aS9FRGprcENGTDk1QjZ2V2VVOElPNjdZV0V6S28x?=
 =?utf-8?B?dUhXQ1g4Zm11Qzl1dVk5Tjk5Mk15K1c0N2VKUjFqWmViZExweWg4Y2oxUjJq?=
 =?utf-8?B?UjgweEpnMjNwOWZpK1hnb1FFdklyeG9uNVRsdlRzOUVseTZnS1BSc2tvb2Vo?=
 =?utf-8?B?NGlFQk5nS3M5NlM5M25ER3NleFlkQmFVdmFEM1FUT1IxZHZobmljN2ZXMjc1?=
 =?utf-8?B?WjZ4a0tKbytWWkJjaUZOYTlFT0k1Q1MydzR1ZXVVeDViVGFlaVcxMEJ4bFJQ?=
 =?utf-8?B?Z3pRWjhTZEVzOUJPSUc4N3FNQUhES3prN3VRNTFCckhlRTdBL21yMzEzWm80?=
 =?utf-8?B?M3ZhS1BJSXUxcTRLQVozeUVFb2Iwa1VUa3huZlBOZXMzTmppVVBJZU9nc2Vh?=
 =?utf-8?B?Y1Y1QjdaU0hRRFNtV2E2bWZBNUZDQXp4SnhzQ3lmSVhOYk9pbVJRWEUrSHVQ?=
 =?utf-8?B?MEwzQ2R4T2NMTmV3ZDIvZWYrRVhpc0pQdnNtQVNNMmRiUlVXbndRUlZqMGRr?=
 =?utf-8?B?NmNPbDJPVDZ0ZVZCQkxhdTNFYXFlYzc2cEVjMTJGTTZaR1dGTjBmdVVqUTgy?=
 =?utf-8?B?c2hnUVQraVErNjk5N1VZcnlJVU04UUJHYWovK0k4ZWgwbXVVVEZ6RGdDcUh6?=
 =?utf-8?B?cjdqTTJUVDhVZDFOblpldit5RFRhVkRHUWNvcmd3WEFLbldXQnp5YTJ0eXVj?=
 =?utf-8?B?YkJFMEVNNjVsM2FUT1FsTDlzTU9qdlhFbURVdTlOWGFIblY4bmFXL01HeEZB?=
 =?utf-8?B?K1JUTGdpenlnc0VLbGVPK3VocmlLMkl1T010c09aUWxsejgvMFJCNGpmWVJu?=
 =?utf-8?Q?7wAHh4cLhoZ/VRMVn31ian0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dba0ec-bfd0-42e6-7368-08d9affd14e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 10:19:36.3152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NVTcrFjlVYC/c0KyUtudFAXKZQO2atypVHEfozF7o7X/ekiJn2C/fddUGedZKV0q20i+WX/okJAnjXd0Pc8IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

On 25.11.2021 11:12, Juergen Gross wrote:
> On 25.11.21 10:38, Jan Beulich wrote:
>> On 25.11.2021 07:55, Juergen Gross wrote:
>>> On 22.11.21 16:39, Jan Beulich wrote:
>>>> On 14.09.2021 14:35, Juergen Gross wrote:
>>>>> @@ -103,6 +104,43 @@ void domain_reset_states(void)
>>>>>        rcu_read_unlock(&domlist_read_lock);
>>>>>    }
>>>>>    
>>>>> +int domain_get_dom_state_changed(struct xen_control_changed_domain *info)
>>>>> +{
>>>>> +    unsigned int dom;
>>>>> +    struct domain *d;
>>>>> +
>>>>> +    while ( (dom = find_first_bit(dom_state_changed, DOMID_MASK + 1)) <
>>>>> +            DOMID_FIRST_RESERVED )
>>>>
>>>> As per my comment on the earlier patch - the use of DOMID_MASK + 1 vs
>>>> is quite puzzling here.
>>>
>>> Okay, will change that.
>>>
>>>>
>>>>> +    {
>>>>> +        d = rcu_lock_domain_by_id(dom);
>>>>> +
>>>>> +        if ( test_and_clear_bit(dom, dom_state_changed) )
>>>>> +        {
>>>>> +            info->domid = dom;
>>>>> +            if ( d )
>>>>> +            {
>>>>> +                info->state = XEN_CONTROL_CHANGEDDOM_STATE_EXIST;
>>>>> +                if ( d->is_shut_down )
>>>>> +                    info->state |= XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN;
>>>>> +                if ( d->is_dying == DOMDYING_dead )
>>>>> +                    info->state |= XEN_CONTROL_CHANGEDDOM_STATE_DYING;
>>>>> +                info->unique_id = d->unique_id;
>>>>> +
>>>>> +                rcu_unlock_domain(d);
>>>>> +            }
>>>>> +
>>>>> +            return 0;
>>>>
>>>> With rapid creation of short lived domains, will the caller ever get to
>>>> see information on higher numbered domains (if, say, it gets "suitably"
>>>> preempted within its own environment)? IOW shouldn't there be a way for
>>>> the caller to specify a domid to start from?
>>>
>>> I'd rather have a local variable for the last reported domid and start
>>> from that.
>>
>> Well, it probably doesn't matter much to have yet one more aspect making
>> this a single-consumer-only interface.
> 
> For making it an interface consumable by multiple users you'd need to
> have a per-consumer data set, which would include the bitmap of changed
> domains and could include the domid last tested.
> 
> As one consumer is Xenstore, and Xenstore can run either in a dedicated
> domain or in dom0, I believe a multiple user capable interface would
> even need to support multiple users in the same domain, which would be
> even more complicated. So I continue to be rather hesitant to add this
> additional complexity with only some vague idea of "might come handy in
> the future".
> 
>>
>>>>> +/*
>>>>> + * XEN_CONTROL_OP_get_state_changed_domain
>>>>> + *
>>>>> + * Get information about a domain having changed state and reset the state
>>>>> + * change indicator for that domain. This function is usable only by a domain
>>>>> + * having registered the VIRQ_DOM_EXC event (normally Xenstore).
>>>>> + *
>>>>> + * arg: XEN_GUEST_HANDLE(struct xen_control_changed_domain)
>>>>> + *
>>>>> + * Possible return values:
>>>>> + * 0: success
>>>>> + * <0 : negative Xen errno value
>>>>> + */
>>>>> +#define XEN_CONTROL_OP_get_state_changed_domain     1
>>>>> +struct xen_control_changed_domain {
>>>>> +    domid_t domid;
>>>>> +    uint16_t state;
>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_EXIST     0x0001  /* Domain is existing. */
>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
>>>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_DYING     0x0004  /* Domain dying. */
>>>>> +    uint32_t pad1;           /* Returned as 0. */
>>>>> +    uint64_t unique_id;      /* Unique domain identifier. */
>>>>> +    uint64_t pad2[6];        /* Returned as 0. */
>>>>
>>>> I think the padding fields have to be zero on input, not just on return.
>>>
>>> I don't see why this would be needed, as this structure is only ever
>>> copied to the caller, so "on input" just doesn't apply here.
>>>
>>>> Unless you mean to mandate them to be OUT only now and forever. I also
>>>
>>> The whole struct is OUT only.
>>
>> Right now, yes. I wouldn't exclude "pad1" to become a flags field,
>> controlling some future behavioral aspect of the operation.
> 
> Right now I don't see the need for that, see my reasoning above.

If your reference is to the single consumer aspect, then I don't see
why that would matter here. Future xenstore may want/need to make
use of such a future flag, yet older xenstore still wouldn't know
about it.

>>>> wonder how the trailing padding plays up with the version sub-op: Do we
>>>> really need such double precaution?
>>>
>>> I can remove it.
>>>
>>>> Also - should we use uint64_aligned_t here?
>>>
>>> Yes.
>>
>> But you realize this isn't straightforward, for the type not being
>> available in plain C89 (nor C99)? That's why it's presently used in
>> tools-only interfaces only, and the respective header are excluded
>> from the "is ANSI compatible" checking (memory.h and hvm/dm_op.h
>> have special but imo crude "precautions").
> 
> No, I didn't realize that. I just looked how it is used today and
> agreed I should follow current usage.
> 
> But even with using a stable interface I'm not sure we need to make it
> strictly ANSI compatible, as usage of this interface will still be
> restricted to tools.

True. Problem is that our present __XEN_TOOLS__ guards have effectively
dual meaning - "tools only" and "unstable". We merely need to be sure
everyone understands that this is changing. Perhaps when you add such a
guard here, it may want accompanying by a respective comment.

Jan


