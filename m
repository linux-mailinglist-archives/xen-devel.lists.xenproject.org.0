Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B03B765620
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571143.894284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2C3-0007xx-Fg; Thu, 27 Jul 2023 14:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571143.894284; Thu, 27 Jul 2023 14:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2C3-0007vi-D1; Thu, 27 Jul 2023 14:42:19 +0000
Received: by outflank-mailman (input) for mailman id 571143;
 Thu, 27 Jul 2023 14:42:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP2C2-0007vY-5d
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:42:18 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5ab9e72-2c8b-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 16:42:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7746.eurprd04.prod.outlook.com (2603:10a6:20b:235::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:42:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:42:10 +0000
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
X-Inumbo-ID: c5ab9e72-2c8b-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5ATGptCbJQFeoK+E+RJe48m3wwhK3LGCkXPmsLg3DqrPQt29n047ROakSyQ6fDG/dEPrLqgoBLxXoxmoNu7nSaFk7yilw/N9dbwnZJDo6N7VhKZxUWhFuwQIO05ISxzxPwQ/1wCFKopMHQXSB3DObZfylpZohnJT9Belm7+nzUSmRWxunSy69qgbq1KRCg50BQ4lWrEyeFpgBgjYyq8dMUjn7wA/IIvqG8oVkiSVEgboIuY7Yb/63jTVGzhWVzLCHN3rErwYtZ42Sz8pi1qzE1vE1YVVJe54dKZXBHzVzPhb8yepcVVdonZluIzQz2VwEBoNsjnYcw1WMtixZ1oXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPoj3KrIj/M8bNceDaw9DeN9H1cWbuIBQAI71tdvnts=;
 b=hY8xZ3YOFvvwpzkSq9mJcfSSKQzwfMc7olBrGiZZegZ+jypGpdfo7pdegZXgccwBPU7dsn17QI2gGx51J2tvfeHmhAHH/dEHTi1LUQ+75gcpCqhvMdooHUja6McJhJw710z++2u2o1d97AHcgDYy1bNAoG9SOCHnUaMul/fGsm2X4tDL6ccTRqc3xLVaSvKxx7na/hugUM4pNRvx8Igz/OioH1T/UqcrsoHiyeQYBOuRQNptztO8OYYVPt7aSEMmevQDaNDyVfbML2uGs9KEAQNpHzypoHol1NRMbT0APODJsJvvlszo/3HtES/rW/VvpzAodOq6boKM4hN63F7EUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPoj3KrIj/M8bNceDaw9DeN9H1cWbuIBQAI71tdvnts=;
 b=1l0JWtC+p6cYa8IyLEbYhhjHgyBkt/Op26nQDSHLbV4iRIX+Ia40GR56Ks4c/1v8kj7mn9MPlqzBe3Mf/wa6iZxZ7p6NPaXP4kRZwxs7KfICa2XSDklcawwUcKP6JHf4oKKHoTPDMvQQBiGBeB2O450sPXRdoQBpc21Ou8HU7RUk2aKqTrHtWaX+pEtszzJb5qEWWQaCYHChkkPwcp+d2b8f9jZx5Nk+uuzOlJZArd7q0h1LIjcImGWoVAt5550yA+FXqwbpgPibiFKBqQ5JFfZddkpZ8uWIfE6wHKtG0g7ZArXPSDoSZNx8X5W6E5jyCZu3knmuZnMuLee5wAXYrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63979074-42c3-83dd-cf0a-8f0cd0294a5d@suse.com>
Date: Thu, 27 Jul 2023 16:42:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Christopher Clark <christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-4-christopher.w.clark@gmail.com>
 <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
 <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
 <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com>
 <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com>
 <2994c9b8-c803-1fd9-20df-0d25d2b66c49@apertussolutions.com>
 <ca85fd2e-45a5-32c3-cb4b-1042be6c6915@suse.com>
 <32a22c57-1333-47b0-c61d-abff8d7df112@apertussolutions.com>
 <7ab3c4ae-3903-29de-ba32-d328b426d104@suse.com>
 <19bb355f-576c-b8d7-b6da-fa2dd8ff2228@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <19bb355f-576c-b8d7-b6da-fa2dd8ff2228@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 3687ec1d-701d-48d2-f823-08db8eafa8c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6OXDglk/wMwWzk0B08jXAXLMuJZc6yYH5KWjd5m77RyxWT4YoyZY8CLSOFM6gX+AomXqVFhMI8eIp6znt3T7eH/sa92gjQKjG1geEkWws07H9J+cdXzdFLN1XkjW5x2Nk/BlpPoHWfahDMTFv1IeekDnzgpQ7jvE3FH+RG0Cd5cb5J62aHpgYItJkFGrd6hTtlYR/0fhXcsI+xQJf/8bp2ffgfk4zgQZI00/I9nMNmbMFs9rjKjn/txAq+V1Spx8tDxhyeVOoM2Z5czDtdhIBS979GO+r5S+bbtCRWLWZio1yetIOxkbsXfXZtmHmTxxRLmosOAvKspXP1TaJWRXPIBO2l6Bkw+YZk7B73+nrkID2uV3/KtbpmX55WFHrhX+vLnppzi77FsRBm+sm4nNSjrXyTB2tawbM2RFqNw56jMqDw0Y/nUN7Z5LawxC5C4uDkOTk1K7F478y91u3pucDyDK0V/QJzzi/slJS22rT3gTTudm53XGufFyNEtZJ72C17iq251Ant+BBUG6h2ILNEwwuGYNG5OJVARQGWvv4B1kfaQBZtHf8c4n1P2m5FHa45KcSIbx01QBIOnG9+5C8XWokYeoF5tL88s5yV4rukVGu4OF1TqsYCaN1jwBjNBroO1k5/zT/2oF7sea/9gumA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(26005)(53546011)(6506007)(41300700001)(2616005)(316002)(31686004)(186003)(6512007)(6486002)(478600001)(54906003)(6666004)(38100700002)(6916009)(66946007)(66556008)(66476007)(4326008)(8936002)(8676002)(7416002)(31696002)(86362001)(5660300002)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVVEMUFHV25LcGJEZVYrQkZaQVBtbkVTbGt1RkQxNkt4MURjN1lnQk5qaHVl?=
 =?utf-8?B?MXQzUTQ5bXZCZm1lSVBETU93RDV0R2FwVGcwUlNodFNnVjAzTXcySmhyQjZW?=
 =?utf-8?B?ckhvQkpib2tUb2FON3F1VlgrL0Z5dmFZNnNJSGFSSGlsZ0YreXEzTFNNZXBU?=
 =?utf-8?B?NU1zZW5vVEtaVUhKNm0yOGdURFJyV3lhT09OU1dUTEJ2ei9uMGcydWdGVlN6?=
 =?utf-8?B?cE1MQ3V5YVp6RHg1YXFTUHZXM3pEclBqVnh4WXcxZWd4ZERZZnVPMkUzeExw?=
 =?utf-8?B?S0dIWHJDSmZqK0pBU3U4cFk1RU95TGExaVA5dy9Bd21DcFlPT3hFaWhBd0FW?=
 =?utf-8?B?cnRqMDFUNEFEcDFSbWRaK0thdzQ2Rm1nQ1hSVVd3eDU5M0c0RUtHMmJ4MmNm?=
 =?utf-8?B?cEYvdk9MMWNvVnlzQmJKUTZoS1hBNUFwYUdvWXdJWUg1bTZvcTZxRUxpWFRr?=
 =?utf-8?B?cFRDZ0pZc2hHV1hoQXdYSzNMMVpIWnBOMGZjNm4zYms4RGpraXNMMTFjM3Vt?=
 =?utf-8?B?azBzRzRnMm5wWHBRTW1zYVJQbWtRcXE1T2ZzYUlNRmduc0o1SGcyT2N4UDBv?=
 =?utf-8?B?K0orMmZabU5QVHpNNmVBRmR4Nkl1emtjbllwYUV4eWkwamgya1AwMm96dHcx?=
 =?utf-8?B?ZGpMaThKNmxxUS9mOEMzWjd1Zk5BWWhvUnI2RThxeXNaaXF5Sm1vM2Jwd09s?=
 =?utf-8?B?Z0taTjlNNDQ3RGRoRVUvR3NGeGNTeTRwSTQ0dmVFUG1rbzFJaW1VZDFhdlNG?=
 =?utf-8?B?ajZQazF6UjRNbGlQb1J2ZXB4Zi9zMFdBRkJ5aHowdG53TXRRYWJrdEh5UHgz?=
 =?utf-8?B?dkJIMURpZHlTeXc2YWZxSURVOC9obUxNL2k5dUFLUTZ6UkhSR1dNcWdyRWVJ?=
 =?utf-8?B?L3N1WmJkck5KWjcySlVvNUxLa0grdnhNdmx4UTN2OVhOejlIUmpSK1lPR3Jl?=
 =?utf-8?B?VVpFS2JVaEQ0d2pLbnV6bzFsOGkwc3ZQaHAyQmkvSkFXR1V5bjlBck1qd0Nj?=
 =?utf-8?B?VXd3Uko0U1gwVDUvMTUzZGZVMHY2VUdqZkt1a2xHTjJwcDlnNUZobUFGTGtk?=
 =?utf-8?B?eUJ5SE1wWWdSUkkvWnh5M3lmM1d0ejEzdk1OOXR0WU95Qlo5T2F0Z1hPTTVY?=
 =?utf-8?B?QmdxU1lBOXh3WjI0VTQ0d0tsN25GbTNTOENVM2xRU2hhRFUwZndMUS9WS3VH?=
 =?utf-8?B?UTgvMmU0S1B3UEJXVVBlakNETEFjdk5yZndGV2c1N21KdlFqS1U5dnNsbXFw?=
 =?utf-8?B?c2NqMk1NblVuWjM4YjdGMGFPWDMrT2NrNlhubkEvY05jbVBSNDZlblBKQkJB?=
 =?utf-8?B?R2FwRjJjamZ3cjlYdzUrVmdybFNiNHBtQnBzbWI0NUZOS0wvL005OXZEdkdy?=
 =?utf-8?B?Vk9wakkrRXhwY3NpempQSTFmeUVTQkQxWVdaWXFLOVpnbzVSOUVlaFFsT1g0?=
 =?utf-8?B?S3FYRFZCS0M3WE41MHNSbTdLRk5ub1FraUZ2Y1J1NDVKeFByRXVZcjdGQnov?=
 =?utf-8?B?cHBGSFM1UklhWFA2UjhZYm9xL3daUy9FRGVKY1E3dDBYKzlPTVBkR1RWM1p5?=
 =?utf-8?B?Zy9NQTZoUS9Jd3pmYmtSVGpncXZoMzdBQWpoeWlER2JwSmpEeUxhSmNwMmxP?=
 =?utf-8?B?anZqZzZVWnJIWkpITmtrWlNGNkxRMUFmS2xtTE5aWnJNVzdheWgrNUZ6UGR6?=
 =?utf-8?B?L3ptYjUyZ1NLczZLbHBhcjBzMzVlZTBvWGRCczJLTWFGU0dIVk1scUJ0SDdP?=
 =?utf-8?B?ZjFLYkkyRUFPTlhBTm9GRU9TMGc3bDZPK0FRclY4ZnNLM3BOT1I1dExQN1p4?=
 =?utf-8?B?WVlYVU1zZENWVnNicWRqQzV5aitjdnlzOFpiSUw3R21DckREYUVWaXZ5N3ZW?=
 =?utf-8?B?UmZDcDBwUXFybXovMGo2NUluQ2xLelRqZEZYeWsrS2RZejUwUUU5ay8xWTUx?=
 =?utf-8?B?cEdpOThaYzdOMFZiVzVudUdnU0ZTNk1LeFl4M1JWUlk0M0VmT2tNTUdQRHpI?=
 =?utf-8?B?d2lEVkN3Qy9mWk4rNjJSVld1TzMySU5kQkwxa2d2L2ViRmpXYXo5dVNwWjZD?=
 =?utf-8?B?Y2trSC9uRDRleS94akNXb1ZsREtYMW9mVG5CRW9VMmRRSlExOHgzc2lQZDZS?=
 =?utf-8?Q?ZfaPvtKczQoyLPgRhLS18aIAl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3687ec1d-701d-48d2-f823-08db8eafa8c8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:42:10.6541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BnXAniRYKnV6i374lkjk/7hHWASGi8od9UuxtDVhE9MshhNSnhgsBuuVgJ3rYOZeYEYzSHTl3koKE8IjBsNKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7746

On 27.07.2023 15:26, Daniel P. Smith wrote:
> Let's bring this back to the actual implementation instead of the 
> theoretical. Your position is that Xen's paddr_t is desired because it 
> can store larger values than that of size_t. Now if you look in Xen 
> proper (main 64bit code on x86), paddr_t is a typedef for a 64bit 
> unsigned integer. And if you look at size_t, it is also a typedef to a 
> 64bit unsigned integer, they are literally a couple of lines apart in 
> types.h. Thus they are the same size and can only represent the same 
> maximum size.

What about 32-bit Arm, or any other 32-bit architecture that we might
see Xen ported to, with wider than 32-bit physical address space?

> The only area of issue for x86 is during the short bit of 
> code that runs in 32bit mode during startup. In this series, we address 
> this by using a set of macros in the 32bit code to provide 64bit clean 
> definition of the structures. This approach is acceptable because as far 
> as I am aware, x86 is the only platform where the hypervisor has to 
> transition from one bit size to another, e.g. Arm just starts in 64bit 
> mode when on a 64bit device.
> 
> At the end of the day, size_t is the same size as paddr_t for the end 
> execution environments and I would levy a guess that should x86 suddenly 
> find itself having a 128bit mode which would likely drive paddr_t to 
> 128bits, so would follow size_t.

Likely. Yet when we still had ix86 (x86-32) support, paddr_t also
wasn't the same as size_t. Even on x86-64 it's possible we'd see
physical address width go beyond 64 bits before virtual address width
would, just like had happened for ix86 (which initially only allowed
for 32-bit physical addresses, until PSE36 arrived).

In your implementation you want to cover the general case, not a subset
of special ones.

Jan

