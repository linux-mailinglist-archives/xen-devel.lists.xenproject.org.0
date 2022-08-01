Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24579586674
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 10:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378571.611811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQuW-0007Oi-Vf; Mon, 01 Aug 2022 08:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378571.611811; Mon, 01 Aug 2022 08:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQuW-0007MF-Sr; Mon, 01 Aug 2022 08:36:24 +0000
Received: by outflank-mailman (input) for mailman id 378571;
 Mon, 01 Aug 2022 08:36:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oIQuU-0007M7-Vy
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 08:36:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60051.outbound.protection.outlook.com [40.107.6.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04a26dc0-1175-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 10:36:20 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by HE1PR0402MB2746.eurprd04.prod.outlook.com (2603:10a6:3:e0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Mon, 1 Aug
 2022 08:36:18 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a%4]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 08:36:18 +0000
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
X-Inumbo-ID: 04a26dc0-1175-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6BsZ3jMGEPzA7/+w7HZoxG1ivmwdG1ZbwsEPsN/t+7qjXyuIEK0nSFzDmRKllUgM1VIwKS3QaRNs5Ja+MAFjxDylKS0v/rlu2T8maXdkHKirQz3+jC6B7PuLBpivO/bF3u5JkBgJcFh9jX2g2MlkbRrdLq6FymjfKsVR6odY8BvDRuXnf/IlmVYLnUZCk39opPLaHIoI0j2n0EaznyEvPE76tqXyQFCy7P9tzGfcqZYfzUwSPDKzGW7NgNGoAfSgNGwlmGA/zx/+Ex+ND21eUzp9OsxcFSeD7YCyfwX4bjDWTrJIK+GSqHYT9OH/psCUdSQI2j3wtaaYHLm2MSoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nwh0RJftgr9Jp9erwxz99WTrz5bNdOSKjSwZKoznrqU=;
 b=AHTlVTHTIG2NldhFg//dWz7dALMP6rfGdiE4UbO2wR/8wh3Qd+LDTkt+kViHDNA48Ji1RAM8aaNsZRy+49UGvx7Q/4c9qfwaBMUphreaQrr9jmNyzv4IwyN2yHg/1BjY+EonSHDX7NmGNfUxrhwM4mGJOYj5LWDDPbSrhLqPK/cnFHOV9q9WMRr6Oe4iva3J7n+2oy7HDzPpjJ0AZjozO5IKOBgdLeGJRqrbgx6fPOuBDmLla6gDffK/UaSe91TI6v8ezb4pzoLKpGXnpAO93ITxqyU/YZG7tkTnojM/j9EJiUhAYd8n4P21bNc3rQOjDyQmsg2p4JdwrbSy3JqUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nwh0RJftgr9Jp9erwxz99WTrz5bNdOSKjSwZKoznrqU=;
 b=FlUlF26BgRf+tpcPxuKJtE/1w8kXPU255wgfObWuQEMraduWwRYu3SRQ3HNmYaFqWLwKNnfaZOcMBssFbWUsGBuDb9eJ8oGRH7RGtaHibvFmeXkJWLgGgaZ98BhdzjpWZEUUHiYFdC2s+UFYO0RmVxEO4llcIldsvvXS3MmYB9DHTUiM53KU1SN7OJBRPhBjrMvdB3MWLXrHSPrHyQvmmBonAlgVczDtThBDTfXnjbAHRnIaYXx8F4Vovb/hKg61z2VBo74G10u+hdpbFqKprDfRqLbZsVn7xWvGBzkUxx2/YmF/mS2YGyb8OppZFWqSzUy4fl7oFFx/3iQ6/PoMwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7bcf8fac-df56-2032-0057-2b7c671e59be@suse.com>
Date: Mon, 1 Aug 2022 10:36:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
 <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
 <db39670c-7e36-2cf5-a87b-92d10d3aac18@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <db39670c-7e36-2cf5-a87b-92d10d3aac18@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65ce64f5-4dcb-4848-4b4c-08da7398e72f
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2746:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OqP7RihlOCPDNM62Xaod1KOwfao/NCuJyQn8MWqaEIImGtdpOBa9i19O4fwy+PFYZJ8anYTZsoZROe6ba6RpjF4c7cWL/xFmvhJvvF7oFUH4PURfBcdvDW3GPTL31wOe3O6HXwXcCjhkzCyuh4gRl4BLwJa4pLyn2vEh7pDqVO3hYX5OUbl5fmIsAs+oI6q+JlGWwhNF82gxctl86QUi4KYqTo9iM+g7f4SJ1aKobyGygEWyDYhGE/CmuMJtSz008W2ozMgChPF+sdojMgoQQOBenDu680cKCD7XWw4L11inJ/ccW1tisynOuokgxL/jRcDdZgVI0NrPWrJ/XVQkD2HdKO1+FqXEu+jakNPfiwcqPuKLGVB4sw9+YRX6pYmZY91GFqbfYb0OO3EhmwbGF9LguWkKHSq2u7axHPrh4/K6XHZfNB0ltCTYn3+SiZGlHn4bdpLIIc+JQoHlXZo1BczjfAWx6Twr8Bd4aMJdu0sUchkrB2J+ymtC4bCtbv/eOI5WgAhuWCNQEhQRFKm84bSEO4mgUqqlPJMdsUaqxKvIYg/nN2U2wbITpzX5NfJFwkIl8cnIk9ZnqELWf9xuPZz6Cw0FktQ6wh1jJhwmeetUT/sESvKLNxmaZb4pK1qlL29nIVhEgTdKQgZcIOq98C/L1lSf3gCrcCU/cHEtsygCSS1oggokK6r9tQ4XE8CCm18bucbu2mLljH2een+S3BO57HSmgoYYBDeoFn3sr1g0T2zACxnQjjmaEngednBvN7AMfI1LpeCMFfeMcyLn0pLSfxTr3KFgXCHi/73qYylvE7LjqW7JJkOoISpQ3FuFtAnXN+TBxUCzF/d4GHozIHg6smdGv16+yi0on3n2+CvciO7CH6po1i9c48EmeMf2vY28SJMeRdLjcjqmiVupqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(376002)(346002)(136003)(966005)(6486002)(478600001)(2906002)(8936002)(86362001)(31696002)(5660300002)(31686004)(8676002)(4326008)(66476007)(66556008)(66946007)(36756003)(38100700002)(6916009)(316002)(54906003)(186003)(6512007)(83380400001)(26005)(53546011)(2616005)(6506007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnVwdytTeHdDN0FNa1h3SzNJZGFWb2JkaHgxRHplSktFbVFmU2FicXc2NTJV?=
 =?utf-8?B?czRLOG11aEFVNk9aR1VkY2N2ZHE4dmFBYUJOMUpySjBnVFpHYW9IeVd4SElj?=
 =?utf-8?B?Yy9XclRpUmc2eDJKd3BJYzZXUjBCZHhzMU1DSUlaQThYcHhzbC8wVVQ1L3VO?=
 =?utf-8?B?aXV5NmZtK20vTEhIdnVUMDJqZnlaOFg0NDJYNG1UWTVTQXV4eDdXZGtacndZ?=
 =?utf-8?B?cW1yZDgzZWdLRVVyNkNWNzMzYXE1YkpVUU5qL2hSM1VTaUhhZXloMUU0Y2h2?=
 =?utf-8?B?Tk1WTWRRQVNQd3VrL2ZraC9wSEhMclJnR3VrZ1pTMCthVFJkSjQ2ZmE5ZExM?=
 =?utf-8?B?MnRoMnliNWw3eDZnbTBtcTVJT1hPc3RxK3MrQm8xdlZQOURrcVpTV2lTVEhO?=
 =?utf-8?B?Qm5ZaDJ3MS8wMjRaVkRrVWE2VDlxYW1keEpCWlN0ZW9PTDA2OS9oNC80QXVV?=
 =?utf-8?B?S2s5WWkrc3pDY0ZFUUF4dVA2OURheElpdDJ3ZjVLYlBiV3pWV3JUeENFTTll?=
 =?utf-8?B?dmEyQndjaXpGUEJ6L3ErbWFnWm5kMXZ6a3UvTEpEbzg1UWlYMkoyU0RJUW9F?=
 =?utf-8?B?M25icWcvQVRJNnRYZzdoNjN0WkJOK1hGM0FPd3JJUmZyUHFLVTBSbnB0cDZq?=
 =?utf-8?B?WTByRWlnOVI2Qm9jTUdhbTJmT2lHMzVSSEYxZDh6eWMycm0zNGk2bjY4S3V1?=
 =?utf-8?B?YUJGZXZFd2c4SjRseXdjRWhoMGpMWFMxVnNFMnA2WG1FMWxORXhJN0QzZnFr?=
 =?utf-8?B?WjgxdTRDelRiZFZ5NCtXRW11cVQzNmE4WDN5dWdIak4xaGc1TWc4MXFPZjRU?=
 =?utf-8?B?TURLTUovTUFmYlU1QXNTaFVHd085d1h3V3VQVVN0V0grWnV1cmhPeDJIZU9W?=
 =?utf-8?B?dUdpM1pTa0ZxUU8zMzMwRVMra3FKTXpsbk1tMkh4UExHNktNRitiNUdmR2ZY?=
 =?utf-8?B?a0dJWVgvU09JbTIvb1VIMkVpS01qSVFEZ1JVTGxYQ2owTHh5MjdzRk9XNStJ?=
 =?utf-8?B?YUVvcXB4NXlWQjRFdGNBSFlvcFNtOUVVb3JJQnZwbklvcUNUR3FwNHhnVk1j?=
 =?utf-8?B?eFNTejN0djZzL1pZazdpRFpYdC9abE10OGNDZ1l3dlFsLzRGY0kwaXUycDFY?=
 =?utf-8?B?UG9OekFBT2ZWZWRBQ0pDNVl4bVpnUkY2VWg3bmxXRGUyUW15TUxvYzNNN3RX?=
 =?utf-8?B?UVlJWEU5dTYyc2Q1TDlTTkc5WGVpQWNuRmMwTzFqTG9tbzg1QktPV0g4WEZT?=
 =?utf-8?B?cXdaWWdHUnl4THBIUVlpL21lVTU0cmZSRElvQjc5WkRCZmZ1Zyt1ZUhrYUxB?=
 =?utf-8?B?L2gyZHgrTkxSOHRSV2tpMXl5Mkc5eFpFN0tVRmFVYVB3N3psYW9aZFN1SUJG?=
 =?utf-8?B?blFWNUVFL3FzTHg3YUpabnBxbCtTNWkxcjJUR1pGMWVjcnJ0OUo0NTJ2SWpv?=
 =?utf-8?B?YlpSc1ozaW9Yak1qby9kUkNGdHRoZG03QzVmRENkWFlEclBLblZzelZvL3F0?=
 =?utf-8?B?c3kwbFgwZDlkcVY4VGlrMG9tWi9WdnVlRDJVVGI3LzlraEZWSW5VR3gvMDJB?=
 =?utf-8?B?ZFU4Ynh5M0JicFkrY0VvOSswRUlMN0xwODcwc2lrR3JUZTdmUFcvc3p4c3ZL?=
 =?utf-8?B?eW5DcnYzclNobnNPYkxXUExtM1FuNE5UeE42cDl5VlBlQTE3cTZJYVY2TEE3?=
 =?utf-8?B?NGVzM0tCbFVld0Q5MFgvT2tKeGFvaTRpQVZtaEtGNUx3dkk1V1Z4RitFQVgv?=
 =?utf-8?B?T044WUZTekhoRklGcTh1WmRScVk4c3JiOHVaMDNnMjgwVmNFQ3JKQUJjTGRE?=
 =?utf-8?B?Qk1va3M0aURNOFd3azk0NDFzK2JYcWd3MFd1b1JNK29PdTZDcmJFNmY3UzBM?=
 =?utf-8?B?R1lvMTB5ZWZKMUpOaW85N053eExVbWVtcTcxb0Z0OG1ReWthUVJMNkpMRUtF?=
 =?utf-8?B?MHBJdHdCakhKRVpEVC9MbmllendaZGhLUnpNNTd4eFNaYVNqM05odWhrcmNM?=
 =?utf-8?B?VFNKTTluUkVRM2p0L0xlNElveGxCNWNxa1JLTXFCeXV5eFFET29nNnR2V0Jt?=
 =?utf-8?B?dlJOcEZpaXFUekR6RXZCZ1ZDQmhMUzNOTzNEV2xyYXIxRVhoT3lrL25QUzVE?=
 =?utf-8?Q?ZDDmEIu+Hxv7QRFgEYpD9b1lB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ce64f5-4dcb-4848-4b4c-08da7398e72f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 08:36:17.9862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iR8e5Hw2fdxOp+Taa8Fl13LExxlaR8puIZtwuY2bC7BRNj8X/4XpNrcrZ0xeXAxCeLDyo7GxNRsMMoQM9sgwug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2746

On 29.07.2022 19:36, Julien Grall wrote:
> Hi Jan,
> 
> On 29/07/2022 07:22, Jan Beulich wrote:
>> On 29.07.2022 03:04, osstest service owner wrote:
>>> branch xen-unstable-smoke
>>> xenbranch xen-unstable-smoke
>>> job build-amd64-libvirt
>>> testid libvirt-build
>>>
>>> Tree: libvirt git://xenbits.xen.org/libvirt.git
>>> Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
>>> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
>>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>>> Tree: xen git://xenbits.xen.org/xen.git
>>>
>>> *** Found and reproduced problem changeset ***
>>>
>>>    Bug is in tree:  xen git://xenbits.xen.org/xen.git
>>>    Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>    Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
>>>    Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171909/
>>>
>>>
>>>    commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>    Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>    Date:   Fri Jul 15 22:20:24 2022 +0300
>>>    
>>>        libxl: Add support for Virtio disk configuration
>>
>> Just in case you didn't notice it: Something's wrong here. I didn't look
>> at the details at all. Please advise whether a fix will soon arrive or
>> whether we should revert for the time being.
> 
> We had discussion on IRC about this today. This is an issue in libvirt 
> rather than Xen. So I think a revert is not warrant here.
> 
> Instead, it was suggested to force push because it is going to take some 
> times to fix libvirt (see more below).
> 
> Oleksandr already sent a patch to fix libvirt [1]. The problem is even 
> if this is accepted, our testing branch for libvirt is 2 years behind 
> because they switched to Meson and Osstest has not been adapted to the 
> new build system.
> 
> Anthony kindly offered to update Osstest.
> 
> Regarding force pushing, I am waiting for the Osstest result to confirm 
> that only the libvirt tests are failing in staging (we already have the 
> results for smoke). So my plan is to force push on Monday.
> 
> Please let me know on Monday morning if you have some concerns with this 
> approach.

Actually I do - if we force push, the libvirt failure will stick, and
hence potential further regressions introduced there would not be noticed.

Jan

