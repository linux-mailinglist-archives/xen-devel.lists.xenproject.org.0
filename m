Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208643CFDC5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jul 2021 17:41:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158840.292209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5rrQ-0001oY-0e; Tue, 20 Jul 2021 15:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158840.292209; Tue, 20 Jul 2021 15:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5rrP-0001lm-Rg; Tue, 20 Jul 2021 15:40:43 +0000
Received: by outflank-mailman (input) for mailman id 158840;
 Tue, 20 Jul 2021 15:40:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8y=MM=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m5rrN-0001lc-Ri
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 15:40:42 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7a281b0-42d8-42c8-947d-ccc34569c951;
 Tue, 20 Jul 2021 15:40:40 +0000 (UTC)
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
X-Inumbo-ID: e7a281b0-42d8-42c8-947d-ccc34569c951
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626795640;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FsBBTa/IoMoNu5HUqhkzXajnOn/O154oRmc4pUPlDRo=;
  b=E7oVRmW77dhjZcoLwfIC9p8EXzGfyyFgY5QHjd1HCZtN1DUihbT5bCNF
   vH6TBjLGyQ+JCrAnJp3PW4Qg/yhk59xtBNAlkGYjt5MYnektxOE39dquR
   0s/1aowlBbIgN5x1WzNUmqGIVwIx9OO0uKtCIM7uPO5ivkymULg26TK3z
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wSoA3MQC3szFOW3qOcyQnSxBUJ1mP206hzm5xxMwEhb6Tv9I8ihqvI93ukiBsCkkA5qZIel+Yr
 p5pBQeqdC4Pvx3GHfEP9y/iGlku//b2IArCfm3xyN+XPkRyQnDeGWvOekK5Jdrp7awQH810mm2
 3H9yfPGuBBvnPTOqRQ6lLl1XT7+oxxx01NAMuOxgJXNVRHbxOjO2l1zwWgjs1Ipbi8AaOnMsLy
 Uu6WNQhvShiTf53BmbvaiTVkWdaHTjii1dOQ1BO3a6CntE6s2um5NCkTMHgRj1wjVLiOO9lJxy
 t+oiDmspxeojzf4YWvQduNaW
X-SBRS: 5.1
X-MesageID: 48671119
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ox4+161Kv7RSpddLBDSYNAqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.84,255,1620705600"; 
   d="scan'208";a="48671119"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRwmQC1k4NYC4vn/24hZVMV9sqCMwH0/HjvHXGE4JFVgEfCFkUaL+bAwSoxkdxiqgWEU/39XQ7lSLjO9mhDrpmDsveEU5j/eCKyF0lM8PKTChlkhO8bzpMh6IvXCkYyVWUQ1EAHoXh3S2rWUb/IFD1Q1JcU3wfNVXKRyNVIca+3C4m19d8bJEdaba8vAj+Q93PVwfwYU2NAL5dUQOs0GvBa7hwFQxlRE17zib1LMYXqELNcOKLqjaXKzGd8EBMHUnxRLEHtcdbPZjEwJXHTXK4SUxfaA24dueXdJo5WxuTCUyTUbO7Sh5ZWeSHqJutwfWY04zaQZC6zrgHRyH701XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPRUOrGC73CTyyVSxkw3nqp+mvPSi+T5s+Jws99J4/s=;
 b=FQ9My3D1qZ12efKw+nAl7L2Tl6KbV2GTR3kGpnrN44c2whVaJXwqG5a7uxv/AfyjnKdiDzhRk8RG4Dkw8XgB6ZngkZ2d4AqSSlyHjlf9/Rxy7CiztcAlkrVwSxkQFXfaWkAqdlDUKWqirnZ44nYl2oPALrJ2S0azRfxRRLDFTXxOyyHZiAITweawMu7II1OfbQHFj1XakzHqEmjv/ciLQkTDa+AmcEeQwkO68M4tmS/4r4QBC1CT2J59NE3rXSnrMf5FiueKRxUK3UGhM4ibwrQ1e1pNI1pZf5sJBkgVftW8AuR0ovEXSh23HjagXDPqMTUsgxPKSoJa+urEuNH36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPRUOrGC73CTyyVSxkw3nqp+mvPSi+T5s+Jws99J4/s=;
 b=uR+cVNkOWavX0CMEGYZPxIA9UWRUolUWeBN3TM2Njz0htH8W8Ma9kXlf99fRLoXPDUvkV7vDTnSUKmyHntMT4ijHlT44kPD+clu0LMF/gUPcwm1aBiS2619LrRCYf0g2mARuUt6YbSHTFH6ODadbPHdfTKfwOPMag0cYgDR+478=
To: Ian Jackson <iwj@xenproject.org>, Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <jgross@suse.com>, Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>
References: <20210718135633.28675-1-jandryuk@gmail.com>
 <24822.56879.260780.652184@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tests/xs: Check asprintf result
Message-ID: <048868ab-3291-70d9-791d-325fc79caccd@citrix.com>
Date: Tue, 20 Jul 2021 16:40:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <24822.56879.260780.652184@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9cea517-5773-4264-2df3-08d94b94b272
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5440:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5440BC2E0A253A3804BE1497BAE29@SJ0PR03MB5440.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qlVkRXl4RV2a82LVWAMfZNwAQUqgjYWZdfThcGC9yGAdDEE8fXto3TymP3K+5Y44CpccysD5ItVbsP38IrHtzUWoVBlj0D2kRWVn6hZuaGjI+N8wCcB8GuzWVHyuxXmLTAYdcau2J5DcyeMdqWY6i1ACLI4r/4UJufNM112IOUY1P3z0gOG6nMuQhnSwj3mVDAjzmqSxhBkU+KlzmSHv1zIzjPLpvla2ZJMH8zBmUS9cYeYrE7THc0jr89odVjiOS2X262vi4W8jp9M+tfhGwdzPCugK7eMRsdi14jDrhSZKqFgOCj7izO8cibafTry/k/9Zhr1bHvMwn2tKVXAorPd6Z/nLn/B3QaUe3vfUZn+Cdw4OCLGDzoXuKDDdSpy0aDJMajAz4KZKzQdlKW8bbujeZ6azElTzwwiskScNjaUdRqlu92qtZOFzKdwOi2eIb5A5EdrOZqhyUOvERMGpg17feasUN8owMqQ/LFLYrrIo3v+ga4a31eK8EoMFza9iw+kJodK7jY91gG4FtGxAQ1TBX6hEXtAPUuBcj5PL8nECSTwRL5gqHxxEobIWdnV1ZG6vloQ/PW5Pb5xEYuOE5rf09+9xaENqVhMkrJUFYUKPCmOPZhJRhfuxYiOMKQU1OigZZRWeOVRGGQym/Wf6jRY3FVSOkbiJVVeWPMZ0iM/aeeUmfWFL5dVYaziywcuzyuB0YONniTEPqw+FOQxh7VjKvX5oiaOXH/kFnh7zx48=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(86362001)(16576012)(478600001)(186003)(8676002)(316002)(38100700002)(83380400001)(26005)(53546011)(956004)(2906002)(8936002)(6666004)(66946007)(110136005)(5660300002)(6486002)(4744005)(2616005)(31696002)(66476007)(66556008)(54906003)(31686004)(36756003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmd1L0JzMUljaU9BbnZLRGFoTlp6d3dOcFJmM3hLNEhFYmJSOEhxUEVLU0lN?=
 =?utf-8?B?WU04cXd3K2NWR3lPT3FOb0tVazExRUMxNVRRZlcrb1Jzc01OK3VqNVgwTWpN?=
 =?utf-8?B?eDlObmY1ZGVSa1dzWTNXcGxYd20xSW1IdUZLWEFKaWZmZFBLUEtiR0Z2VGky?=
 =?utf-8?B?VXU4dCtuQkhhWmozYnBqSnFXRzZ1OHA5bnJWa2xQOG8yeWVBejBBUnlhUkJ6?=
 =?utf-8?B?WFlyZXlQRklxd01Dc0dHMmVFZUVIWk1paHhPME5Nc3VLbUNyeVcvZ0dWUWp6?=
 =?utf-8?B?cGp5bWxjK2tNZjllUXZyTkVGSE1pcUVqalhuK1hUTVVwZTlRRjk5Q2dSVmhq?=
 =?utf-8?B?VWtVc1RxazUyNFFwbWFmWkM3ajdzcmFkaUNNYk16aW42OUswSlMrTS81Rk40?=
 =?utf-8?B?QzVEQklOMHBtRlZCVXZVVkU0NFRDeUlwTTVHR0YvWGpwR1hKTVBjNk1jK2xE?=
 =?utf-8?B?RU9Eb0NTQ0VqVXNZL0thaVFCcVF6NUFWNDJuOE85andkanFHU2lLa1k2eWZH?=
 =?utf-8?B?ZjlhSFcvdCt2VU1ZaFhCa2NTQ3h3OGE1WjgxWjhaV3R6VE9DTW80TFIxUGMw?=
 =?utf-8?B?OUJPdDBYZ08vbWFvcTJ4bnE0b2s2WlN0SjFOTk1ERkR5NjFOcG00WWJOL2h1?=
 =?utf-8?B?M0lNelM4Z05sSXFMVkZPRnVZdjM1Y0RoOE9wSEVDaXA0WmZ0RmNrSjhxQUZz?=
 =?utf-8?B?Q21keW5qWTNIZ0hTVlVHdnBYdndpU0lqdWJrTmRGSUFMdi9RNXljMkRPU05O?=
 =?utf-8?B?NFBsYjMvWWdNYnMxZWNTTkIyRDJkanVOcGJYVEdJQUl4K2Y5R1ZLcGFxYWFj?=
 =?utf-8?B?bUZRbk5ZbTZEZWdVZThLTUx4Q3VWR1RmUmIxUW9rbVZKWDFFeWoyVkxtdXpu?=
 =?utf-8?B?VHRMQXZRdXNpUEpzS2ZnUUN5TS9sNkhIbVBZNVViNDMwNVhNckNWblBneDQ0?=
 =?utf-8?B?c1R3UU9adloza3Q2Z2dJREdiK04xdjF5aVRvTERwVURxSXo0WlFRTWR2WXlC?=
 =?utf-8?B?Uk9XT0Z1VzlocTRjTUZlcDhRQmRaYlExNFhZZjc2SXl2elA1dXU2Vm9Qc0p0?=
 =?utf-8?B?dDVjcDJXWTFoeTJDMjJiZUIrZldIRWkvT2RyT3pIUnpKNlk0b2lFQ2RHOE9t?=
 =?utf-8?B?Vit5ZE9FNDFmZVU3TVlOdmhycXpUb3JYdVVZdisza2FjcmF0T2hpaDNVbDly?=
 =?utf-8?B?dkt3MTlUeDliMUQ3YktLajBUZmFNMmpDV2Zac3M0R1lRbEZQTVZlUnlrMERY?=
 =?utf-8?B?TUZkeCswWkRqZ3NER0lkS0lZM3lDSURvdk9wSEQrUTc3bWhNem9reEwweVFD?=
 =?utf-8?B?NFhMUGJGOGQ3aE95VUZDUnRiSXlNeWx4UUkxVDY4b3p3TWhZb3hZTnVwbkp0?=
 =?utf-8?B?bWgzTzI0UXYzQjJoaEtUbVg2cjBjNFp6dWJBMk1uZFIvMEk2VldPeHI3cXJl?=
 =?utf-8?B?MlFsVVFGTktBbWNZYXZpZ0RvQ21SK0trQVUydmZVellDL0cwUTNGS1IxL0Vu?=
 =?utf-8?B?azhodzZIUXA5d1pCTm9Ta2M1K0NheUN2NFovNGZJVFMyYlVyYVpLbGswOU5v?=
 =?utf-8?B?MElDVDE4ancweXN2QVEyMHlGbnlsWkQzblIxV3RLdHFkUnViTlZmUVR6cVhR?=
 =?utf-8?B?UW1mcytWSVlyRExib3F4SEQxRGo3RWpsa2srSldwQm8xeXJZT3RQRXJwbFRv?=
 =?utf-8?B?NE1kNUZVZGovRkVST3hSZ05JbGN2R1lpTVU3VGU4NjNPcDlaM1RCNHQ1ZHZJ?=
 =?utf-8?Q?vpq8KUBRkoOGRdQSF3NjZ8ViGm8vkuqD0HqIVfb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cea517-5773-4264-2df3-08d94b94b272
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 15:40:27.2105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CirhdKUApNv03JY6fz9G0QCbTK9r0jWG6J6m0ogsaOnAowJw9svf9nboLnUydiwlSquuGRXXnCx0aVDUS3JoKXpTC6ltY+8ABh0QK9bOqBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5440
X-OriginatorOrg: citrix.com

On 20/07/2021 15:31, Ian Jackson wrote:
> Jason Andryuk writes ("[PATCH] tests/xs: Check asprintf result"):
>> Compiling xs-test.c on Ubuntu 21.04 fails with:
> Thanks.  However, your patch doesn't apply to staging; the files have
> been reorganised AFAICT.  Also, I think
>
>   93c9edbef51b31056f93a37a778326c90a83158c
>   tests/xenstore: Rework Makefile
>
> fixed this (with slightly different style, and despite not mentioning
> this change in the commit message)

?=C2=A0 Literally half of the commit message pertains to this failure.

~Andrew


