Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71FB49E1FD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 13:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261425.452631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3Yt-0003w9-LX; Thu, 27 Jan 2022 12:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261425.452631; Thu, 27 Jan 2022 12:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3Yt-0003tX-IB; Thu, 27 Jan 2022 12:07:35 +0000
Received: by outflank-mailman (input) for mailman id 261425;
 Thu, 27 Jan 2022 12:07:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD3Ys-0003tR-HF
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 12:07:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4971746-7f69-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 13:07:32 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-YJuAr0bGN_2eIYdYNty1FA-1; Thu, 27 Jan 2022 13:07:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7994.eurprd04.prod.outlook.com (2603:10a6:10:1ea::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 12:07:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 12:07:29 +0000
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
X-Inumbo-ID: b4971746-7f69-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643285252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6zYVxrnV4iqT4Z0mURDK/A+PhocD2Ui6NiNclR8aO8=;
	b=kZYoLvDT0xa2801hzPLd9/5BwRr7TeMvLBpz+kTNd8Dej99OGAKuBx0casdjWKPgz1N21Y
	4l14IJmCunPkIfCB13Ldm231u/7XXc6hQOZAtl8PMTsSRxpjMJWy4kYplwmPphHd8FTkF4
	wkkEMxOuryDnCfHPNdW4JgHlPYWYjXQ=
X-MC-Unique: YJuAr0bGN_2eIYdYNty1FA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G29pQTsd+5VMmTa8p7QpZdngjpIhlyUB1Y7ETbj0EcBRaKZou44FthoY8Mxk6ELZlQ3EzZLe63SjhC0NjCWc6/MBOiywvk8yX1CWOc3CnusoXMu4d1gk09fhkqwr/RhqjKzhOSifzZMlzTW3tsYdePaZipfW+zsByTRm1F+VXsoDrzY0YOV/xOzzjPQOMQHVRUNfILDkCL3ZVd45v2QDM0tAM3IQolpQyut/5XBepUWoCEPHjtxTRBg/yXuA7skvU0YZDtx53q9mlZuVtwizljrihCapSR68n58yjdnYPjve5xo2/Y/oCaaxZ8noZedTvZ6sebivkfydIGOqp1E0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6zYVxrnV4iqT4Z0mURDK/A+PhocD2Ui6NiNclR8aO8=;
 b=c5pU7IQOo+nt6JebVD4suXy2Xwk+Zv6kuTWQQyQsYPYlRbWuhhEMrcy+canQ1DK/Duoo8/6eq4ZjXEMJOd4rTeEAvaN7Jc04odJhbZ0M9duxdM5tPu5aSOjXD2rqdhlxzUqGh/A9YMcTknEn1RV34pSwJYgqLEESvLNLS7Hm6zjKkUeYADCPoiha8hudDur45l+GzJRNqQI7FPQhMFpkK81A7TZHtrMcp8BaEWybleqVlbwwz3sYoiLg1ZjNQmuTGEMWZ8RwAHtRroYSVM3xeBVKwieJVGdE3H6EbPY3MHXJgmt9jCv5zt3StnQXsrC9A3Wm2tHysdLsG1WhSGRUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2edac13-f019-f615-0655-8510bfffedbe@suse.com>
Date: Thu, 27 Jan 2022 13:07:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
 <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
 <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
 <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com>
 <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop>
 <a992cf74-a75a-43d0-f83a-cd9549f586a8@xen.org>
 <alpine.DEB.2.22.394.2201251530400.27308@ubuntu-linux-20-04-desktop>
 <aa7aee5b-71cf-78c3-f8a2-f8d166f22ecb@suse.com>
 <966ac15d-e91f-e812-1021-296ef60a9a06@xen.org>
 <alpine.DEB.2.22.394.2201261727550.27308@ubuntu-linux-20-04-desktop>
 <33d1c1eb-7d6d-21c6-8ed4-3daef5be90d3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <33d1c1eb-7d6d-21c6-8ed4-3daef5be90d3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65b72a62-e90e-4872-f056-08d9e18d973b
X-MS-TrafficTypeDiagnostic: DBBPR04MB7994:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB79944F3626AE06B6F52F8093B3219@DBBPR04MB7994.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RUKw/p5scu5Hk/MWROiQ84Sj05pql+SB1y9mUbiDKCm6VZrlAdP9EnGMI0Fh1fTLU+HyeDJBW4t7CyJm21yMFu08F0fc2FaqG1hLs9WpQw0MWNqGfR6f3bRQhnseNv2SIsDFBxLMqYrHE4PUb0MnW8dnLa85hUw8XmDckLPifkcpm0n72wxLvzk3WRuZGdpNwkdupO6PE0uXfrlLEQp6G2uZ4fmfN5a3rGPkmccxxsmNRhWTfdP4IfPB6lgtQ0txvI+h7cdgixroV0j46qooAxXn1NntmztfkN1xpGvwg+Uj/HHMQozzmxQVjuTsSzyqUYulBhyHisCPx7ZxIlnoQFEO1ZZtvv/kN89HXACdZOTJGostWbfFM4xTiEJrSbWdHtBQz/4Z8dkBWggCkc97HggIokVQpPx1hEicyStcLrV37mp265z6CE4WX/Vn4oUybJFbS0cez7ygq4jQs/+ArcrMUTCIVL886aWZ8Zilgo5JfAM7h20VJkcjP/gv8ILy6FeM1cVNhHVChsPwVdqDadHPaN9ypztJAnQFRrlB+rEkELP5r6r7JsiRx+cS760/ccgrlQMZE6S37920TQ9vlcBEGND0cQg8BA7GaigNx71QErCcue3yuZxTqP2PrkZopgXsUCNrX3d8JLgsufk9nmLV/MVuuk0o5uxOeQ36YOHhzhr4ioKK8zvm3iERZfMHrlf9Sd9lbQJ9G5d32NjqdWbzZrqL9TO3hRQ4yjJrS9s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(31686004)(36756003)(508600001)(66476007)(66556008)(4326008)(5660300002)(8936002)(8676002)(66946007)(53546011)(6506007)(6512007)(86362001)(316002)(31696002)(54906003)(6916009)(2616005)(2906002)(38100700002)(186003)(26005)(83380400001)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXVjaG9icHl2ZmwyVUhuTVpPcC9xQVAxQ1V0cU9uemVQWk1pcjM1ZXlUNGRL?=
 =?utf-8?B?dDdjTXN1WWI3RjBzalgweTVNTFNmVCtDTGNIMUJHMEVUbDNnMFh2ZnR2cDZH?=
 =?utf-8?B?NVF1RUhGd2pGY0plZU5Galc5empJOUp6MUY4WU5aWWlzYjBCM01Cd3FJTlQz?=
 =?utf-8?B?YlZmMk1UbEhuK0JRNjRZbUM4YmtwQW5OWmJOQjFNbzZMOHF2T3l0ZWhjOTcx?=
 =?utf-8?B?Rmg4YTczUHI5VkFmSThPYkZRSWpFSzZza2xjSWo5ZThLTTdFN0pEOU8zL2VH?=
 =?utf-8?B?WWN5dDFHbXg5WVJhVlptQ2tqOUtMZ1VwRUlOSVpkMWgyWENoU3l1VHRmSGEw?=
 =?utf-8?B?RC83OUpnQnBGaW5KN2owYzV5UjdIL09tWTZMdDFVQ0FKbmVGMXN3bHJmTmZj?=
 =?utf-8?B?dkpyL1pIQXpxdGVOYmpoTnpMVHZzNmRhWXJQcGFybk5QaGlaaHpGYjIzOTNq?=
 =?utf-8?B?cFEyRklxY0ltN3pnT2QrOExPVGhrSzFram81SmhEWkIvbkw5aGg4MzVvRlNG?=
 =?utf-8?B?VHhWSElRU1N2ZDJsZ0g1Q0FsT1ArTy8vOGJsMmF3dEgzc1d0ZlhqdFZqT1NJ?=
 =?utf-8?B?UjlhRTIrK2YwOTBmdEpKUFJyWHRYK2RtaWozejVxajVHVVluSjkrd1dINFZt?=
 =?utf-8?B?bEhhYUU2V3JMN25CWE5SdnB5a1czbjIwOFVvbjVESzlLbHA1cDZ3YlNPMkxm?=
 =?utf-8?B?SklGSWtFZTRDWXN1TDBKbHhETDkxcEtIRUNoeldBeTZ2T3JzZkhHZWVCQU9N?=
 =?utf-8?B?YTlCK3dOQXBCMFFYN0NwRENoRGlEZTUzcWhEKzhLTUlPalBBVEVpVDc0dis2?=
 =?utf-8?B?RVZZVnp1VW40d1FIaEtQWkxRQ2JvSWNNZEVHWXV3OUhHMlhWT1BibjlOclZk?=
 =?utf-8?B?RklIdkh3T0ZaZUpzQWJiUmZ5NUQydkJqZmsyVzdTQnRCZ0g5Wm0ySFl3QThn?=
 =?utf-8?B?UU1KcVFMd1ZDRWNNRFdvUUFQWWR5NVU5ekV6ZktjeWs2dDY5MW1qNnhKVjU5?=
 =?utf-8?B?Y1F5VmJ2L1ljLy93OFVSQUpqYjZnOVFSaytySWZIL1FWMDByeS9vUHc0NnZ5?=
 =?utf-8?B?VzVDUkpBM3RJY0I2NHFrRk1YTzY0ejBIdWwvUERHOUVYeWRVSmhWVnpLOEN1?=
 =?utf-8?B?SE5Cb1c0YTFSaGplRUFpTXg3WjFYei90K2VpaXNaRzJINWlOTzFBdUJhSDcv?=
 =?utf-8?B?WnlyajQyRVlhYjJYNVNXYVNadGJjU3ZKYU1XSlRFZWN1bkNqeFhPb3pyeC90?=
 =?utf-8?B?VDZFemNrRFp6eFRtUjFONUZnZHRKUlJVeHRCVWhoalhqMDhZdTJVSHpOc1o5?=
 =?utf-8?B?ZGJDeTZMMFZYRFdENjY2cHFhcDBGVUtrN3d3R2Zjd1dPSGJUbUJoNGQ2Qklj?=
 =?utf-8?B?QmZtQ3YycnJKZmVmNjBwVjlOTFl0Y0E4elZYVnJXZHgya005YnlFUnpDMzdp?=
 =?utf-8?B?WGFQdlo3UlM0amxvU05MdU05RkE4YnFPWXpVMlNuNG9NVjFLaklhZ3JJcldv?=
 =?utf-8?B?Nk5JN2VMRWQyaHBGZENJaTFGV3FFUk82ZkVvQTVpZERFOFpETmdoLzMwbVAy?=
 =?utf-8?B?dHlMTTZBZVIyMmROeEh3ZEtsd1NiR0liUDNkbGthTTVLTjZydFNSZUdmMW83?=
 =?utf-8?B?VlVWTWtzOGlaazNXbnpwbnVPNkY4WUVqUTJQVUZkbEY3RHBmV1hOY1o1MnJl?=
 =?utf-8?B?aDJ4YnI2ZDNnOWsyQkZnTEQwMkgvd05VYkpEdzZtNXN6WlU1MmRSSlplTlhp?=
 =?utf-8?B?djhQOWphblAvK2U5amE1blkrQXI3SGRwaXpXd2U4UlFEZWZjL1BLTUhVbXps?=
 =?utf-8?B?WkJtQVJWWHdvRnJLS3dwY0pBRE1CNUkrM0tTNFA3Qm5uaEJBbXlSWjRjaThN?=
 =?utf-8?B?NVIxc0tkZlJKK0ZuQnY1d28yM1FKclNncnpXSllCOU9DemQzWC91aCtOYnpW?=
 =?utf-8?B?enllLy9LQVRxZXdsL2dKRDJMK212dlVXeXJkSGFZQnpSSkJ2ZFlXd0I2VTN2?=
 =?utf-8?B?czVhQ2pCUnBPckRCb1dJWjBPamlYVlYyTVAvdEFod0hMSDZ0SVdqblRXMFhQ?=
 =?utf-8?B?UmlKSW9mVEU4MnRvYjQ2Y0xLSzZRblFUVFFhOVJKbkN1VkUxNW8xSlcyYy80?=
 =?utf-8?B?MzZObzIxWmFaRU50aEZ3NTBFYnZHdU1xVHF5ZlVYQjBaYXBEbUVRWE9ERlVM?=
 =?utf-8?Q?ebToS/bKdVmqYUrzBEKHOdY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b72a62-e90e-4872-f056-08d9e18d973b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 12:07:29.4968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgBaIatCmbED4cNjdEE4KwW7U0HiZ7wOQ+6aDzGPdiMjT81+MDJd18fF5W0OWXMJBxHeqAtniZOOKewIF29GLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7994

On 27.01.2022 10:51, Julien Grall wrote:
> On 27/01/2022 01:50, Stefano Stabellini wrote:
>> On Wed, 26 Jan 2022, Julien Grall wrote:
>>> On 26/01/2022 07:30, Jan Beulich wrote:
>>>> On 26.01.2022 02:03, Stefano Stabellini wrote:
>>>>> Are you guys OK with something like this?
>>>>
>>>> With proper proof that this isn't going to regress anything else, maybe.
>>>
>>> That's why I sugested to also gate with system_state < SYS_STATE_boot so we
>>> reduce the potential regression (the use of hypercall should be limited at
>>> boot).
>>>
>>> FWIW, there was a thread [1] to discuss the same issue as Stefano is facing
>>> (but in the context of Live-Update).
>>>
>>>> But ...
>>>>
>>>>> --- a/xen/include/xsm/dummy.h
>>>>> +++ b/xen/include/xsm/dummy.h
>>>>> @@ -92,7 +92,9 @@ static always_inline int xsm_default_action(
>>>>>                return 0;
>>>>>            /* fall through */
>>>>>        case XSM_PRIV:
>>>>> -        if ( is_control_domain(src) )
>>>>> +        if ( is_control_domain(src) ||
>>>>> +             src->domain_id == DOMID_IDLE ||
>>>>> +             src->domain_id == DOMID_XEN )
>>>>>                return 0;
>>>>
>>>> ... my first question would be under what circumstances you might observe
>>>> DOMID_XEN here and hence why this check is there.
>>
>> For simplicity I'll answer all the points here.
>>
>> I added both DOMID_IDLE and DOMID_XEN because I thought it "made sense",
>> but there is no need for DOMID_XEN. We only need DOMID_IDLE. Also adding
>> a system_state <= SYS_STATE_boot is fine (but it needs to be <= instead
>> of <). The patch appended below works without issues.
>>
>> Alternatively, I am also quite happy with Jan's suggestion of passing an
>> extra parameter to evtchn_alloc_unbound, it could be:
>>
>> int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool disable_xsm);
>>
>> So that XSM is enabled by default.
>>
>> Adding the bool parameter to evtchn_alloc_unbound has the advantage of
>> having only a very minor impact.
> 
> We will likely need similar approach for other hypercalls in the future 
> if we need to call them from Xen context (e.g. when restoring domain 
> state during Live-Update).
> 
> So my preference would be to directly go with modifying the 
> xsm_default_action().

How would this help when a real XSM policy is in use? Already in SILO
mode I think you wouldn't get past the check, as the idle domain
doesn't satisfy silo_mode_dom_check()'s use of is_control_domain().
Actually I'm not even sure you'd get that far - I was under the
impression that the domain at other side of the channel may not even
be around at that time, in which case silo_evtchn_unbound() would
return -ESRCH.

Additionally relaxing things at a central place like this one comes
with the risk of relaxing too much. As said in reply to Stefano - if
this is to be done, proof will need to be provided that this doesn't
and won't permit operations which aren't supposed to be permitted. I
for one would much prefer relaxation on a case-by-case basis. That
said I'm afraid it hasn't become clear to me why the XSM check needs
bypassing here in the first place, and why this is acceptable from a
security standpoint.

>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -94,6 +94,8 @@ static always_inline int xsm_default_action(
>>       case XSM_PRIV:
>>           if ( is_control_domain(src) )
>>               return 0;
>> +        if ( system_state <= SYS_STATE_boot && src->domain_id == DOMID_IDLE )
> 
> I would surround this with unlikely and possibly prevent speculation (Jan?).

Unlikely - perhaps yes. Preventing speculation in principle also
yes, but not at the expense of adding a 2nd LFENCE (besides the one
in is_control_domain()). Yet open-coding is_control_domain() wouldn't
be very nice either. But as per above I hope anyway we're not going
to need to find a good solution here.

Jan


