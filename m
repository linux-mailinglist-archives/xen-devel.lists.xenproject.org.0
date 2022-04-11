Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7130E4FB96A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:23:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302889.516738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrCr-0007lq-BW; Mon, 11 Apr 2022 10:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302889.516738; Mon, 11 Apr 2022 10:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrCr-0007j3-8L; Mon, 11 Apr 2022 10:23:37 +0000
Received: by outflank-mailman (input) for mailman id 302889;
 Mon, 11 Apr 2022 10:23:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndrCp-0007ir-Ho
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:23:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bc17148-b981-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 12:23:25 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-ebh3nIGuPvO9ZW-iGzLKmw-2; Mon, 11 Apr 2022 12:23:31 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4851.eurprd04.prod.outlook.com (2603:10a6:208:c2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 10:23:28 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 10:23:28 +0000
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
X-Inumbo-ID: 6bc17148-b981-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649672614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zpXqXZUbFL8JOfNoy5WxYpsQYl1Fv+JfKonl7GsOyes=;
	b=hp9aAFwKpJ8VCrWRZG8q6wIG1yOuByrscpcxjiRJpghi6PoIzyC3EHiLPrZiskmntMgxcS
	gVO4OfQDJJI/wimK56BSMh2FyJbbQU/Kq4ByOkIePNEiPxJWfQ/s3YVUdp7CWyCvtHw4Lz
	Nm+jJngKKEoYQ81a4flmSnR7z7if+Rw=
X-MC-Unique: ebh3nIGuPvO9ZW-iGzLKmw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcwCxT01+BKyvaZnVso2ePyh9BrosT3RFRmSoyJp4Jl2Y7waCAVzhXLACEQ3Mjc4ZRQ9h6ahRg2iv86JCHcFm7k8R8Bff6BnyKuX1tbkY2zxTp+w4ljY5gsBZdoLl7KmmErt6cna/Z13q6BnmgFyaPRk21ORrhbjJoIPjKDaiQy+S2cul5mGGpiw4maDrg42d8y5XZ3zt/nXGk7lk8kkli1uxaDKxCF4QzzD/i+CjWpxl/hbwA4GNs+qWJOvXJczkJZ5DeSm5sLWM0HHDe8awljqR9sD0THIpHZNh+41Wpa4HHra0ZVuu7CVBLN/eLwd0ts5PqPbPq561Wfn/55joA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRcR77ZdeaZbb43bpHs36xIw0hS9pFgZRJLZeUUUBXw=;
 b=ZdpQEaYxZXRgD4rRHwr+8xdtohAU6124bbCS1fA4/1rpU/0jJk2YwO0xT0krc9rUBn+87TSNwYxHwwnNdx02G+gTLWH6esm1qAyFOmkuQPZWZ0mh7Ar/4yZdq87V0pGd3Ri82ytxAGDHhwktseBijlI5eZR6Xzhy1DmLi3dprmtoo30KiMieBcFLYUzUTOafr3OlpJeTh1fxY9XVGlK+N0Om5Z+n3huZwRpoCst7xCwe90x2PP4gjjx5MNI+6Lr68pacR9oqoS7x3sfsstwNGzJSKTnlSL0Ka2gls2teMIgdgntWo9W7nKq+jkX/2YaAw6GoAqZp3fXMXPaM7K5OxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5255b107-24d7-eb88-24b6-d8ea86b20e87@suse.com>
Date: Mon, 11 Apr 2022 12:23:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Juergen Gross <jgross@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-6-luca.fancellu@arm.com>
 <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
 <16C482BB-BC45-4BD3-8357-87AA942F4D14@arm.com>
 <cacbaa1c-8ae8-9314-9364-97e5a53d876b@suse.com>
 <61DEEA58-E570-4FEF-9B71-27316C7F8D7C@arm.com>
 <0a85f239-dbf8-2e06-0158-75a1c1c40a4c@suse.com>
 <DC3522A8-ADA1-4F6A-A3CF-C8095C2F639D@arm.com>
 <e6450fd4-662a-abaa-4b9e-1d8a4ff41962@suse.com>
 <74450613-4B05-4FB7-84F7-A26EAC3CEA20@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <74450613-4B05-4FB7-84F7-A26EAC3CEA20@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0087.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::28) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b20e1bd6-6c43-426f-90cd-08da1ba55218
X-MS-TrafficTypeDiagnostic: AM0PR04MB4851:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB48516AA3DB295B0DE07976FCB3EA9@AM0PR04MB4851.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kXWCfjf/Wx8Buo3j2XG8oY+2qe5aW1BsrcwN4i/DqH4rJfFlwP7R5f5Du+tRXqkJy0rw6b3nWKFDlA4vXZYPcCpK1ZLFUPYzKHuxEbQYSemUB4fFekJANhBtUNfMRJDluAI5VGcZ7rBlJsGMYlflczaoifH0tYimtwAfACjnyAXW/nw+R/+LY7ekLfNaEQ/T+T8YK14y0OzfoqlRcnSryP5TBPBKUkz4xOBgQVnhRJNUSO/fH8+iMGy+tTkRwPXE6QzFmiOxKJ3npUyFMaTsgbbFUcrLI/13qVz4YwEoLmGJwMwSo74Qx9SxuXJcEot6GFvlsqhR2ILs5rask36hCWWNjcrzQBzcRkl57drVZaPkkFzGOK5WHsq8KudqUcPbsg8uL4Vtvrlm+3B567h49BOXfDw1XXusl2MRrgMtipun20DRXt3GHOdBKdX24QOSZ+s2FNMP44rhHgedQFpN0m7MqcEvqM9WDJh9t9HgoQxmcOpAj85xnq7OVZWa4vUm9MLBJUsXivAjvcV0QXB4+l3DIFTfsPGMZ4g+PJoZaewYFyPkYkMoAhDnO/MuVn3O0AQnzc+egAUn7M7L3iRGPFXhZAiSfN6vPVt/8BEcqP2kgIvRJu6cGMWfS093IxyQhCxb1XXRRwdPw9RDxYZ5xVvwMN9rnNcn9zDsHGAU48MOnkjAOLZ99fCTa0gB5zVe53s9MfJeKfaMzWNTLu0MjxXFy/y6koSmrpZKTJGrDAWUVJ2gmI57GusH03Ov+/HYlvvXa2Hbz4xQtRFqDmAAAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(8936002)(6486002)(26005)(7416002)(66574015)(5660300002)(186003)(2906002)(36756003)(31686004)(316002)(508600001)(2616005)(4326008)(66946007)(6916009)(86362001)(8676002)(31696002)(66476007)(66556008)(54906003)(53546011)(6512007)(6506007)(38100700002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nHCi+SFjkcM3PySApRWsgckPOF10a6uF9aU3APwUKXKseWTHTMWjf6nUz48m?=
 =?us-ascii?Q?Kd/xZpON904lu/LprIHPt10qkZ4/Bai6mPY4EmATSV+91De7JkARRrK8D5Tk?=
 =?us-ascii?Q?iJH8DUhylAUhYyhax6Ye/0QAnNktgLSwXIna4sp9IjdWgVpCRSr9p5kuvy0R?=
 =?us-ascii?Q?K4Sb4coVHMXQcxM9cymPffKDtKfVyKsB6x0jqkB//FrLTjXo9HJLZ97s6vDj?=
 =?us-ascii?Q?dOqw+rSlJ64JGJ8J7tJC0zOou0G3k5eZ+eZY593EU1aGB2C0nsSy3S8SEgXz?=
 =?us-ascii?Q?vY2jrp41MQFrFqulEhvSMW0Pe6w2tPWbWQ6/C/2/XopOfdOceKV4n7Ujgl6O?=
 =?us-ascii?Q?uExvhrWo2gm2EIcJ6E1guxLlGMLCOka/Wl++/YQW65bu0yWOQLFiQFWZcJUV?=
 =?us-ascii?Q?Yh7fMJPttkZvAJBSkwprtL5Dli2TNGBpxGcArzFEFUvHo94I76IBv8C3IVKC?=
 =?us-ascii?Q?upMLDu36c4nkCaBE67DIzgEp8fDOS1Nfd6t6gYcBMF6bBnwFF8mBbc9l2QVP?=
 =?us-ascii?Q?jolc/qvUR+M+9qhAJrMkXNfTxYML+ttvNeRHa5IYLLdomOl8hRIFey4yOm0E?=
 =?us-ascii?Q?CCo2Qj7p9QguOvgO1d0B5YBrTxQDVk6mUidw/ea0VAL7X4RTuiR+kuuKmH43?=
 =?us-ascii?Q?uI6AbY3z0IEyt8WAUVgv76MMDF+ZOQ92A2v3Jof1USYoNEFtYW3NR1MeK6rk?=
 =?us-ascii?Q?BU0ij9IioW4DtpRxCIOtmB5T1wOzZqFvH1D3iDEGi68Lu8w7AdeMuhPLgder?=
 =?us-ascii?Q?qGNRlEHnqkC0Cj45TCeY7aEUNqbpm+/yu50mPyt/wi/llDP1ADN7ePta1keY?=
 =?us-ascii?Q?i9Y6RgSS95r3qYsVq/c/kzV46iMK0YGUGhhzEp+ooVBdkwV+ryF+6dfKE+zD?=
 =?us-ascii?Q?Q6lhJCE5Iw1QcMA7M5u8LJcatrB430Vhaz/7ItjpHgtR3oNCVkgz5nvYFy4w?=
 =?us-ascii?Q?TNMPelYpGMVLYXWy3ThLBw86H38qyQLZlcuLl4gClJ2m2ljVn4TvWfL/+aRl?=
 =?us-ascii?Q?0JSKf/0h27YWolCv4BZs7Rdhncm96diiimCIwg8f/VuSJUjgbHq+dBD4uSR9?=
 =?us-ascii?Q?rj4u4pp/DHJcIsjicDH5IRTvRKKyUEACTbG1LNUcdB7JBWhWksmY6X9xOkWQ?=
 =?us-ascii?Q?luunwA9KC66ranCo9RsMuLQw+UfTL/F9LH3lRpAsaKBqW01zDDQsUnXriIae?=
 =?us-ascii?Q?sdsz1AOildTN4GaRz5upMFMwNRvrS6o/dh/mVnL/HtLh54bQxUJkcDAZ8rKC?=
 =?us-ascii?Q?34KiZl5DaPDlUlp01xCYaXOhF8Zo+0ZDu7jG1JiyMpmrgqV9Ilh9DklvlbK4?=
 =?us-ascii?Q?KwHL8k279hk4y4gn4xydo98YM5sZUWN1Q3pdZVYCB/0FjWUdt1EX7xovHVsl?=
 =?us-ascii?Q?LtKp0O9z3CbCVMC2I4wjj8HJFHpQl1CYFhtlcWhe9nkBlIeH+M179peM5uaU?=
 =?us-ascii?Q?AKOxH1TcaqwIhMppHsNUYWqc99VKk1IF6IwRFfpAKQqrf35TCStCmNk0jeh6?=
 =?us-ascii?Q?TYSyvljCR75tTMRSnQc3dpLn1cWnNoo7nTJANISC+JiOI9bu9sKQHfyX9FWX?=
 =?us-ascii?Q?uiuUQKclFgCoZ4sWkfkbQ7qL08D9j1IKhOnIieAIfvgUKrLEW6u24msBQV9K?=
 =?us-ascii?Q?hl/FIXN1afluxwFfHkWkrRR9/3B6hhDB7akvt/j6zkulp4IKo/0+bz0qt1tf?=
 =?us-ascii?Q?lca2WhvuOKSWLVk941gubVWfrc6OXFwJGovsSocsynRCh8iWCo26GK7HgMiW?=
 =?us-ascii?Q?RWKxlTe5hA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20e1bd6-6c43-426f-90cd-08da1ba55218
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 10:23:28.8023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6p4LxrH//9xDkItoaPBpIJ3zcHDCkVIhYV0GpORLDMjBUUEn4DPOCAHPTd8Rk4sbpuEQkeq7it8BPwrP59zbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4851

On 11.04.2022 12:20, Luca Fancellu wrote:
>=20
>=20
>> On 11 Apr 2022, at 10:08, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 11.04.2022 10:54, Luca Fancellu wrote:
>>>> On 8 Apr 2022, at 13:10, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 08.04.2022 13:15, Luca Fancellu wrote:
>>>>>> On 8 Apr 2022, at 11:24, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 08.04.2022 11:39, Luca Fancellu wrote:
>>>>>>>> On 8 Apr 2022, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>> On 08.04.2022 10:45, Luca Fancellu wrote:
>>>>>>>>> @@ -106,6 +106,8 @@ struct xen_domctl_createdomain {
>>>>>>>>> /* Per-vCPU buffer size in bytes. 0 to disable. */
>>>>>>>>> uint32_t vmtrace_size;
>>>>>>>>>
>>>>>>>>> + uint32_t cpupool_id;
>>>>>>>>
>>>>>>>> This could do with a comment explaining default behavior. In parti=
cular
>>>>>>>> I wonder what 0 means: Looking at cpupool_destroy() I can't see th=
at it
>>>>>>>> would be impossible to delete pool 0 (but there may of course be
>>>>>>>> reasons elsewhere, e.g. preventing pool 0 to ever go empty) - J=C3=
=BCrgen?
>>>>>>>> Yet if pool 0 can be removed, zero being passed in here should imo=
 not
>>>>>>>> lead to failure of VM creation. Otoh I understand that this would
>>>>>>>> already happen ahead of your change, preventing of which would
>>>>>>>> apparently possible only via passing CPUPOOLID_NONE here.
>>>>>>>
>>>>>>> Pool-0 can=E2=80=99t be emptied because Dom0 is sitting there (the =
patch is modifying
>>>>>>> cpupool_id only for DomUs).
>>>>>>
>>>>>> But we're talking about dom0less as per the subject of the patch her=
e.
>>>>>
>>>>> Domains started using dom0less feature are not privileged and can=E2=
=80=99t do any operation
>>>>> on cpu pools, that=E2=80=99s why I thought about Dom0.
>>>>
>>>> It's all a matter of XSM policy what a domain may or may not be able
>>>> to carry out.
>>>
>>> Yes you are right, however I didn=E2=80=99t see so far this use case wi=
th a domU and the tool stack,
>>> probably because it would need also xenstore etc=E2=80=A6 I=E2=80=99m a=
ware that there is some work going
>>> on to enable it also for dom0less domUs, so my question is:
>>>
>>> Do you see this as a blocker for this patch? Are you ok if I send this =
patch with just the comment
>>> below or in your opinion this patch requires some other work?
>>
>> Agreement looks to be that there should be precautionary code added
>> to prevent the deleting of pool 0. This imo wants to be a prereq
>> change to the one here.
>=20
> Since we have the requirement of having cpu0 in pool-0, I=E2=80=99m think=
ing about a check to don=E2=80=99t allow
> Cpu0 to be removed from pool-0, that will cover also the destroy case bec=
ause we can=E2=80=99t destroy
> a cpupool that is not empty.
>=20
> In your opinion is it ok to proceed with a separate patch as prereq work =
having this change?

Well, I did already say so (see context above).

Jan


