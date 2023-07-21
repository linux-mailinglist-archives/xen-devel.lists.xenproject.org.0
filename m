Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16D575C505
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 12:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567490.886601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMniS-0002sl-Pd; Fri, 21 Jul 2023 10:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567490.886601; Fri, 21 Jul 2023 10:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMniS-0002pR-MC; Fri, 21 Jul 2023 10:50:32 +0000
Received: by outflank-mailman (input) for mailman id 567490;
 Fri, 21 Jul 2023 10:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMniR-0002pG-0E
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 10:50:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 685b699d-27b4-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 12:50:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8950.eurprd04.prod.outlook.com (2603:10a6:10:2e1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 10:50:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 10:50:26 +0000
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
X-Inumbo-ID: 685b699d-27b4-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iX2DCCcDvmngJuaX+C9Eo0nfGRhLOxnGpzTMC/6JdC6FfdJKDwI/RA/kR9hvjFgQQgEi1GMf66qxqXAJN58BD1thCnu3rj+tWjAKhLGlZeYsIlNOm8v9285WNAhix0FNR04IzjJBPuvCuK7fOCfOs83KGNCMHFxG8P+T1XTcb+9rny8RhpU1u+NB/MNSpk/dMSkXJ1I3JmXdo1ytXJJ2/K343zlFNvQXbUhacnhLAhRmr4DZOMnA7k9YLFquE1FwzLbKV9TU1QUYe33vBRTLCsXfXHl+I0JjgtR24xYaQNqloAvxl1h2EHJjiR9M/SMhSeVXO4IRuIMJJrGpAElqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ntcxhg/KtwPYaAGDIN2bQOBKdO4oDmjQx2D7ckifUM=;
 b=nViarJxg90pbBd9JcvvgcAXe5ZkggL3NcZj6xpAcLNeU83erMepdkltgAjTu5DIVujvguXgJo5IuqSCLLs9hp/j71Dn8h8vd9s4gAGcvwKSTydg3lTNkrmBF3kJaKiKIIGStV6qcWxbddVq62hos7dpBbiMA9GKkV4apcoV03UmdNXnet6E8pXrBc7YlNBlEAo7egX1l3+PRdCRBDSeUCqJ7d05iorxp+rqu9CxxFK0RHeiWb4YwAK1BWfxqEZ/xjwXX09c+bexROqlLuVqiHKo+sRo1VHuHEOenjKPQ5kRM0iQX8/W4ccZ3JPK9fbn/e8nX3RlOyOeu9+5tLALFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ntcxhg/KtwPYaAGDIN2bQOBKdO4oDmjQx2D7ckifUM=;
 b=fcgvF6gYrWwpOK7s4Yvx5Sn3clVFHnYgPkpHvfq2xGBoBm/reA9RnXVCJtJeSlvoNx0sfSPh1Lb/jmjJpidI1ASjlSJmdkByQmuIoSZ6yBa/q1PslnHMJvgaExsWxD0XevFlUG8Da/9PPoDJgUxRAD1h6RgSsjyedEUkD8v7uKC0DZyCK+gFJ8y80MQK318VZx4huc9nGv/SojDOeC2YxRnzzs99YYxPk78diVJRRfnjYuMOUFBjjumrGv0MiaAtC9PjDZxehevJpUPaW/kycEeG8wrzHAJEkdbL7yEYPN0C5b2o/Yl8syZM5Kiu8uJymozP6kv2/SSbFDihtNgO8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec6c97dd-a333-6927-06bf-46ae44f9007d@suse.com>
Date: Fri, 21 Jul 2023 12:50:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 05/13] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-6-volodymyr_babchuk@epam.com>
 <72733AB9-1912-4C28-A6AC-88D147778E73@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <72733AB9-1912-4C28-A6AC-88D147778E73@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb4e2fe-f3d0-48c5-a6f9-08db89d84a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VVlrX3/sh1P9MRT6rDw5afGlePVr2NjfoSfm+8FcGcyg7ideBn4D93v1bWmnpoBPaulLyhf/mSf6aaYOHIn5bjP0XTyGYxCMzBsfemmi+qgh7MHdk4PD/iEl4b+D6OszGeMozEXkaXPdPmvJcWWvraqP93M9FsiuGj+NgKiA2Uc1XgPYcl8JxZMI1qsd/5kDgul+iOAOV3/Cto60SN5FX/j5XT7GE8x6H+ZWa7DSY0jA96wIL3zwXptQcm63QsCKYibjSG+xHuCqKnqa2xYpr4ogX0gEyC1c9NLD18Ubet3rqY4GoLFvRTnhrDwNjLy5TEvVxrjEpX73z/VM30vWj5niXqsx5D9n4D9TtTQeQe5o2jgaqtO9jRdwogSoGSuDcQzsDFLG6vYzO3M2HU1ounGjoVlL+YVUPLBphhVAbhpQVwAs85CAPmW2ghR7k2x7RlHw4gWdWUetvzw6UYcbEcYAGZ1s0GdiHiVjR7FqRKS3+hm5HHzI+EHlTLAmOniB/XA3q0U7Y+ckKk/SRpc8PW4GfzxFp/tv6zgCi1FSjulvvynHWOo1SV78FkoIeoRnZscw2H6CdWklPvoPl9Oks8/2vPsBEYCjqbALnK+vnSL3Aizmiq8d5zXluJsihwJ0i46vEE/oTUNu08EqIn+lpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(36756003)(31696002)(86362001)(31686004)(53546011)(6486002)(6666004)(478600001)(110136005)(54906003)(38100700002)(6506007)(186003)(6512007)(26005)(2616005)(5660300002)(8936002)(8676002)(4326008)(316002)(66556008)(4744005)(2906002)(66476007)(66946007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elNvK0ZsZUtTeFpEdUsrN0M3MjczbDkxOFdtTHRrRFZKd3dqQXZ3TVA2NjNh?=
 =?utf-8?B?TUlkQkJmOTZ0VVF6UDJRS2VDT3NDV2h2ZVV4d0VIa2s5eTN5RFY5WXpJNFZX?=
 =?utf-8?B?UGRYdnk1amkyQjY5WGxnR0JQUXpscnRYTXozSEF2U2I3cWw5dnluem1GdlhR?=
 =?utf-8?B?WS9NV1hJMWJWK3BCViswdE9zNDg2OThqNmZYSmpVeFhOZVphblhoQ0hKTU9Z?=
 =?utf-8?B?Z2NzK1laNmRuWlQxQlVsZ3ZCSStzUzRydmlra0gxa3dYc2c2MndZOC9sVUFR?=
 =?utf-8?B?UnM2WU9YZSt0VGRrdk9QQ09jQlVnUWsrU1BQY2dnME1TSFBWb0xBWEh2OUpP?=
 =?utf-8?B?VWp5T0ZXR0szMFhqaXhCSWp4bUNlVW5HVnZNRjFPV2pyaEg5ZXE5RzhreWFy?=
 =?utf-8?B?Z01teExsSWtUdDhaZy9GeTJGV1c5K2tJbnFKV0JpMnhBQU5jWFdPUmt1T3Jj?=
 =?utf-8?B?Ti9iTzh6ZGZ5OVR1b1d5RVZYenhjL09ha3Y3Vy9US0VZSDhuUFRVcnU4cEFW?=
 =?utf-8?B?TDJ1dTBsTzhHNmZhcE9uWkk2NmRhelJ3V0t0M3NIYWJHQ0haQTBjU01UdzVD?=
 =?utf-8?B?aGpCKzEyQUlMWUl5ZUw1QjVSd0JaeG0rSVYwMjRCVnQ4d0ZIZmJPMlRnZS9M?=
 =?utf-8?B?SDJjZVVwRmhVRnZSbUQxOVM4bXR2aHpxY1lSWHVHOTlUUm1KVURldU1TV2tr?=
 =?utf-8?B?ZWdxWUF0SjhzTHZiMjEraHRiRjIyeG03WGpNclNkcFdBYStIRVFuRnFyaFpy?=
 =?utf-8?B?MzdoUlRPRnlZZU1FK1d5UGY2TnVBYzFxN3FLdjE4d1FSMTVVQ0IzVmt2K0Fo?=
 =?utf-8?B?WHJadGxNWk1YRU9OamRxOFdwRGNpcnUxbFo4U3Z1ajVXSmpPZk96SWxnRlhK?=
 =?utf-8?B?a1dCelZENmhPdkRNSlduUEZRRHRyUk1mQ3FaR05IME4xU3hINzNhWnRub3ZQ?=
 =?utf-8?B?eTZkOXBJVHUvWFNGc1llaFltcE8xenJPNGhrT3dZeG1XTjRJcURmN1FRcTMz?=
 =?utf-8?B?eG1mVVFIS0liZ2lmYWtReWVyRktCWDBmMTdpM1JDdVVPeXIyc3ZjY3pacnF5?=
 =?utf-8?B?Zm5LUzR0cDBLdVRqSUpKeFRyb0l6K1AvZ3hnN3pqdjA2Rk5jWlFZM2ZuRkNq?=
 =?utf-8?B?dEJQSTBPWVhJUE9vcUx1VHo3WUVSNlhSSkp1bm95QS9IdEZtY1kvazNUcTFh?=
 =?utf-8?B?Z0cvMTV3dm0vTU9sbDM4T2ZpUEZadC9LMzdVSnRCVFNEOVZzdFlYS1NOdXhy?=
 =?utf-8?B?ZzFEcGdsZWZhYm9tYjFrZ3NaSkV1MXIyUzlPZ1VHZVNjWmxuRWxmNG1NTnVS?=
 =?utf-8?B?emhVcGJwekNYa2hSd0hhb2Y2cjJHNVZTZDBxUHdESHBGZm5obDh6V1ViZndt?=
 =?utf-8?B?Y2lyV01YdG5FYS9rRnQ3L2J1dFBpaHk2Wi83UVk3WnFFMTlmQk5NVk1TNEdR?=
 =?utf-8?B?MGFkdjdJR1hqRUZiV3JybTVsQjlvUDM3MHE3NVRZWGJZMWtNMlozbzNwOFlL?=
 =?utf-8?B?M0RydElVdm8xMDE3TXhTZWk2Z2dnQmh0eTd1bTNHUzlDOFJYa0FyNW9wSGJo?=
 =?utf-8?B?cFZOdHRRSlkxWHJwZi9qdS80V0Z4aXhMNFVRRlo2QzV5MlJYL3kreVhxMHZ5?=
 =?utf-8?B?RDV4VEFPTmNEbWNsUVNMeDlZZ003ejVtKzV0UGc5Q1VIRWFKOTRyS2o5bTdo?=
 =?utf-8?B?SWFVUENaMjMrVXdjSnVabHdRNUFDbFJHV294dTNyd3BIZUszaDMvb3Mzd0dQ?=
 =?utf-8?B?WDVkWDk0bmxFR3BmTHFDWVY5aklKNGN6cUI5RXg0K2tRb2l3TVB5ZDd3bkla?=
 =?utf-8?B?N2FINlV3U0dyS1BtM1FaYUVpTG5yOUw5a2sxNTFUcTNpSlRMZVhKNmQzWnBx?=
 =?utf-8?B?dVo5Z1Y4aTZpUkVEOTNqampxdzdjNmdGS3FlVGVnMWVRQWhXeGdzb2lxWnVX?=
 =?utf-8?B?NWR3cWpwcUFSeG9HcWI0enYvRERUQzBrTEVCTGlaMWV1RGYzM2NEejNJZ1hm?=
 =?utf-8?B?dTAvVWVGNFJhMVRVaXQ1OGVhUUlxQmdjMXNoVzNNangvcHpPYlkxZmVpa2dF?=
 =?utf-8?B?MWdyMjJVRFZsOXFQeTNBazluaHJpd3IrQ2R0dmVNUG5WSmJ3RTNMZllLbW56?=
 =?utf-8?Q?VCr0AOSZPtH+wC88pm8zjTN/o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb4e2fe-f3d0-48c5-a6f9-08db89d84a92
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 10:50:26.0979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQYxffo9nXD0gup/MjIAXliCo5r7QAP7hOHDQqRn+cI3Nsq7OMQN3Oj/3td1UqPdvo/Ymso1ut//dji4uDIe2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8950

On 21.07.2023 12:36, Rahul Singh wrote:
>> On 20 Jul 2023, at 1:32 am, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> wrote:
>> @@ -599,34 +681,50 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>         bars[i].size = size;
>>         bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
> 
> I think there is a need to set the BAR mem type and prefetchable bit to the 
> guest_reg also to avoid mismatch when Guest kernel initially read the BAR’s.

Perhaps more generally: Shouldn't r/o bits be handed through in almost
all cases?

Jan

