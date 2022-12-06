Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A281644363
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 13:44:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454820.712373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2XJT-0000sm-IQ; Tue, 06 Dec 2022 12:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454820.712373; Tue, 06 Dec 2022 12:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2XJT-0000qt-FL; Tue, 06 Dec 2022 12:44:43 +0000
Received: by outflank-mailman (input) for mailman id 454820;
 Tue, 06 Dec 2022 12:44:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2XJS-0000qn-1a
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 12:44:42 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7c3ff16-7563-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 13:44:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 12:44:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 12:44:39 +0000
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
X-Inumbo-ID: b7c3ff16-7563-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xxl/pM8kscnw16SFRva3tAmIINE/WYViaosIm9Z4gDnzoaLavWEsICqhyHAYcudKFQZz8ShodJ2m5IiL1RH0BGa2naczij+c5aP/5BNFHOjg+o9XGdSRk1C1Sp7yqwRGVjH/38JQqGIKCBFOb/q7Ug6VwRZLC2Xc0DLmXIM+jEROX1tzEEHT6hNomCCYBuDFxAaQOh+oxVD+Gu7z56VhiOBMSa0DciDfmpAnbmc9BiLqrpq/qM1s4+lLp/xeq9n4neGHZoQ99REruNxVV9rn9Y73Fnj7GQJuPLAKqsVeHL00ngiRVxF9hnX9X6DdUNM6thl5JoiC0am2GuzwULes7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+7o+XQPnfiubpfrXDvLjxyBS5xWTsFO8ZApZbBkb2I=;
 b=KZANppFMLktpixX/S6aL61KLLj6XUeHHOW3RQy7SQkD2CdBbDwUkUguSSfhzWR31jGBUIL4iZnP/WwP4hO3/nFNMsg0IAQ98xKWuSi9W8lhmQrJkWyhBSvLhVN09Lk6cR7lpKXnW4mP8q/3LHrhn+jMrAbfGv2712TZo8J76wCtJRT3CrSGWWjj+KG6hQMFfm0qUAfrptlFaBYvP+Robd9pR5D2qBgNTlaCJ3b46IFE5wPkBfucncfL9/+kx/Imr5fpI+02fpHbFADpw8i1SZYqz6ERvUqrD9HQ7WMR6XtRy/OWbDavGtDN6PzricSjBg4TSJbx45wvbJSnZ/TBqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+7o+XQPnfiubpfrXDvLjxyBS5xWTsFO8ZApZbBkb2I=;
 b=z4BPckOMmEFoxMLTeAmKTVawyHQpNZP/s5Xy/WMgOl6SFh0OWFj2U2mepP9ALPwtQKfpnhDBudUSpif90pVkWOvwtiHnKEXgCUQ/FJslB+zrZAEy5tQzRj2bxLzjJCVQafT64wXdcQ1jVTeTcVjk4kjHDlYKT2M6VcEcIfFhR/ICxFGaY3oqrJBBHmT2HTQ2jyuvbCALIC1JHh6Jo5xpM5SzgGijG6BmpcWSL2M1KyV8kQqLV023GkdosFtsJ/wx4Iv8sw4lTPmh75i54S5hsK+wRRZPwUDG7tOKcoGoEhQOcMRld4B+eb80Tg4XcOQ40VvoJWXoQ1hHPoTlrRwtRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f175af4-a17e-930f-84ed-7750077987a7@suse.com>
Date: Tue, 6 Dec 2022 13:44:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 3/5] xen/Makefile: remove Cppcheck invocation from the
 Makefile
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221205154052.14191-1-luca.fancellu@arm.com>
 <20221205154052.14191-4-luca.fancellu@arm.com>
 <45f4cef6-99ba-a37c-3e57-27b270d16f6f@suse.com>
 <A07F7DB8-6237-47D6-A643-C96FB371C1C2@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <A07F7DB8-6237-47D6-A643-C96FB371C1C2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: ab36bbc5-80b2-4d6f-2712-08dad787a3c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+j7DQehm06eDaTq89z25Feo7lVVLyc44tFmYIu4vBUoq+8FuyJJcat0Vk+LYG+gcBEhtEFx89bAERIcs1JWNS2+WlBsiPFZAoXDEZJeYr1JYdCDmkl4o8i/U4R5kLxEXTlq4ApTDf4LhLpws1IB12UP1fTK43rF4fqJ8Hk2Dp7GcEbH+v26XpEK/mfPNH1sfjLQZdw69EBFOYTYd7Nx+c1KuD9rkWU/QEjtYjl6TcYrfReu27OPVJjblofwze7Ka6iqbANvJMBeMW5qGEvWSws6fYzPKDvzcw0Wb0NXJxeKYCvOFIujYRuWiz39znpOUwDfO2B4KuqGCzYX96EpuSz6wQfRmlY7KgOmv6Xag3cbfTnTBN9cyCd+sKDextXaZCq01t8E4V6qdxw+9k4y9HVk2u9dpCE+4K+Z4gF/nRn0vNf9OQNxlNu4MrlrVhT0bSuirNadQHw51U8rhyg23w0KpiGda7Roi3bh0guJPdtSTBwTGk6IlzOVitiZJXXg1jlYcI7YhtS3b3kBXNBDe5MdTkfgbq0NZpGU2aCTStR7KXd+NEvBNjOSPBAh/jU0vJrmFm2JCJUezaIKURgN92zIvxEl+iYdigVmW7s5F17LINQlsUdbYjqoM2l+Lcwfs4tf+JAxnr/xXKKy4NAkeD0izC9gErYYN9RE0jG236njmgfArfGp7dhAxKP0qffIimm7XOzFOcPlIyOHo2ubcSFWsCvTuJvBrc7gNhxRh0Xk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(83380400001)(86362001)(41300700001)(31696002)(5660300002)(4326008)(8936002)(2906002)(8676002)(6506007)(26005)(186003)(6512007)(53546011)(316002)(2616005)(66946007)(66476007)(54906003)(6486002)(478600001)(31686004)(66556008)(6916009)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0V6U3NYS2R2eVh6amhpOGNhOFNiQU56NUYyZ3pIamdiVHJNa3FjQjBNL0Fk?=
 =?utf-8?B?WTFWVXFFSUFOUWprTTBpYjRPVzl3aTZsQS9OcTVGblRURWphVGJzOFBsQWdD?=
 =?utf-8?B?VnNyV0FhMXpPSjRKM2JpckV5WkFkSWJvbzNPKzRMUUlPMmFsWGZURTB2Rnpv?=
 =?utf-8?B?SW92YmJQcGFOT29IV1Mzak8vVlNSUVZVUUNvbGtIWjl0UFI4VXFKVS9XQVhN?=
 =?utf-8?B?cUwxVnZ4eTJnaXV3ZUZZY3JzZzVCRHRtYnhMalhac1pXbUVRc1pRZURwMTFE?=
 =?utf-8?B?QWJTRXNRQ3duTWhuS2c4QThmTEdGOG1mU3RxcStuMVJva2tnNmJuYnBabVcz?=
 =?utf-8?B?QVk5OEdaUjNKZTFmU2NKV0hOd1JBc0lDaGdlamJ4cDBjTTdWR3gza0N1SS9I?=
 =?utf-8?B?YU9Ub1lrOFgyMFZpSHQwcE1QWkhxZDErbzlFKzRzZTdHN3l4dktSWStoNnZF?=
 =?utf-8?B?YkJlczVFNGFwN2FMREw5cXQ3N2N0S2c4b283cVMxWGRGL01CZ01pMmZwWkhZ?=
 =?utf-8?B?Y1hEeE5zOTZVcS9JR0ExOUZneURJdHhGdHU3YXBrZkxHeVBGNEV0QkRvVnlD?=
 =?utf-8?B?c1ZlR1ltU3ZJQTJDRzgzT2ZJWk5DR3NwQ0dlZE1MU0NzaWROc2w1dFpuZEVZ?=
 =?utf-8?B?dXJSNXU5eGZqTy93aEhoMzlGU3F1V0JvYm9mZWZ2bStmcnNYcFZxL29MaUM5?=
 =?utf-8?B?OFZZSWpQVEVrR21MQzRLSWI1cFM0aXRRdUxNQkgxQUZ3QTFJK0xNRHRGckt5?=
 =?utf-8?B?N1lLTVB0SmR2enFZYmE2ak9zRGdFUHVSdm4wbEJyQ2tkK2NKcFRTVWlSQUs0?=
 =?utf-8?B?bjJzWVdBQitNL3E1USt2S1hZQ3ZhTnFmMk1SbVNyUEtoenFnQ21KSEg5MzdV?=
 =?utf-8?B?NEM4bDJCMDNYRWoyVHhteEFGOWRvUTJCMXdOZVJrbitTRFpvSHpwczJWekJx?=
 =?utf-8?B?RjgvWitqSmtxV0FkY3RSc2l3N0ZtdlJEVWwrSzc4WWt1eW1wWVdZOVI0YlNq?=
 =?utf-8?B?NUF2NmZENHBMenowYlIybS9aaU85aTNrSlNSV2xDQ0xWcllIRXoyak1VMWtC?=
 =?utf-8?B?bk1ERFBjZWNvbXgwVXB2UkFKb2V0M1cvK0J6NlBmcjl4dmc0Ym5ibXBEcnBJ?=
 =?utf-8?B?RTRNMVE2TjJlTC8vMEh2RmxvK0pYYXdBdFIyZ0pWeFBHdXUzWlN5dEZrOC9l?=
 =?utf-8?B?TURFaEgxbk5UMU5WWlFiVENmUmFsV0orMk1KSDlFRVRGeGw4dzhsTjBiNk5P?=
 =?utf-8?B?dHhNK2cyc0VZVDJyWTNvYWFRYm9MUVVuSVltSWFZNGxMSEhZQWk1SXoyNmZy?=
 =?utf-8?B?azh2RWtGYkcwRER0S3Y5RUJHUm00NE9OS3U5NFFicER0TXVTY3dreWptK3NS?=
 =?utf-8?B?MmY2bkl5QzNYaFhUVDdNc1RGZ1UyZVFTaEk1em0rV2U3WEVqclh1MVk5S3d1?=
 =?utf-8?B?OFRYc1A5dDRJdW5HbFZxdkkybTVkRlE5TUh5TmNhT3M4dUxoUHhodWNXcTBs?=
 =?utf-8?B?bEhpNERleFNySldOMHlETnFsbi9KZnBPTWd1dUFqN0d3VmFVVUIzMmJhQVUx?=
 =?utf-8?B?bkNZdS9GVTZqc25tcHUzOE1CeXU0dGdqSktBYUhmaFdxR1VNaXZWK2ZTYUps?=
 =?utf-8?B?OEN4ZG9RdkpNb0c2SUpkaG9ON2JQSm1NRllsWTFvdkZ0WUpiblhmS0MzeDJF?=
 =?utf-8?B?ME1FRGw2dTU5a0RnanJBcnNlOGJ4WnhNbGNhVVZDYysrL2hIM2ppb05iQ0Vt?=
 =?utf-8?B?SDhOb1FNUHVDakFOOVRiblFNdlN4dkNtUThFMjBHcEszc1VwYy9WT1FINWho?=
 =?utf-8?B?Z0wrdVQ1cUkyOHhFcmZuNGF5clRCMWp4eVBHbmRTZTd1U2FnMS8ramxDKzhY?=
 =?utf-8?B?a2dnZkFEdWJnMVhkNGw1elVBd21BRXB1TGZzb3ZURzJ2NWZrZXlURVk5cjZP?=
 =?utf-8?B?UEp0aUExUG5rNXdjblJPc2gxK05uS0hjc1RTWUZINXRNTnBNbGpnUFgvdmQz?=
 =?utf-8?B?Ry9ncG8vUi9Ob2Vuc0VLUy96TWJsT2VmMU5SWHBqZk9ZWTlYYzZkdVI5ZlRw?=
 =?utf-8?B?bFh5aHhTQS9WOTVZSXhBbVdvR2dGOTR1Y2o2UytGdGhRK25KanFZbVlTZU5x?=
 =?utf-8?Q?C2mLzd24cqYa/8kYeJoXu3Drg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab36bbc5-80b2-4d6f-2712-08dad787a3c5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 12:44:39.5916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UapzQqQnQDbdCS/MDUh3Olxbk/zP5Ym1zBJTHDhHQPWgXiq4hklY6Oue7Y+k7rK1xU1k744uTfhVeD4mwmQt/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109

On 06.12.2022 13:36, Luca Fancellu wrote:
>> On 5 Dec 2022, at 15:58, Jan Beulich <jbeulich@suse.com> wrote:
>> On 05.12.2022 16:40, Luca Fancellu wrote:
>>> The script xen-analysis.py is going to be used for the analysis with
>>> cppcheck, so remove the rules from the Makefile
>>>
>>> The python script xen/tools/merge_cppcheck_reports.py was used by the
>>> makefile rules, but its functionality is integrated in the
>>> xen-analysis.py script now, so it can be removed.
>>>
>>> Remove some entry from the .gitignore related to Cppcheck invocation
>>> from Makefile
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>
>> Is this a proper revert of one or more earlier patches? If so, you want
>> to say so, for being potentially relevant for (at least) review purposes.
>> If not, it would also help saying so to clarify what is being kept.
> 
> It is a partial revert of commits 57caa53753212 and 43aa3f6e72d34, I’ve
> reverted only the Makefile changes, the xen/tools/merge_cppcheck_reports.py
> script and some entries in .gitignore.
> 
> Should I put this in the commit message?

Well, if it's a partial revert, then - as said - it would be helpful to
clarify what pieces are kept (and then also why).

Jan

