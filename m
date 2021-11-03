Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3BF443E4F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 09:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220572.381883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miBW7-0005GS-Dp; Wed, 03 Nov 2021 08:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220572.381883; Wed, 03 Nov 2021 08:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miBW7-0005D2-AB; Wed, 03 Nov 2021 08:21:07 +0000
Received: by outflank-mailman (input) for mailman id 220572;
 Wed, 03 Nov 2021 08:21:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1miBW5-0005Cw-Sw
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 08:21:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbd621c2-3c7e-11ec-8563-12813bfff9fa;
 Wed, 03 Nov 2021 08:21:04 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-vDNDBs0sN8GD3iIoY8E26Q-1; Wed, 03 Nov 2021 09:21:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 08:20:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 08:20:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0060.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Wed, 3 Nov 2021 08:20:57 +0000
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
X-Inumbo-ID: fbd621c2-3c7e-11ec-8563-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635927662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aArAqb6ejqLFYdyC6R+7fNCPuBNUV6EAlayeKecleoY=;
	b=m42LZwJSGVYxvHM04UgI8VBhJHslldpDotIJagNq7P4IKr8NzYIXhlyC7Q1X46JqI72EWy
	yfhGciYIgmFGepMortzCrkGll9CJZMFf7jPGwQ7T+kAXN9C7gDBQ+zSQ/fIbVAPU0vSwmX
	Iim3yf2iyok5juhvoTSNzu+h4FaP8ts=
X-MC-Unique: vDNDBs0sN8GD3iIoY8E26Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtWTmUBAyyywEm10nOsgFMLRggIef//J6o/Z1IQfSj1UUAWMLiUv2H1zEsMetLWtTxYCmt8EWa578XJBFGEwpvLJp4+Q4jL4Jd5osWzzI+eFSVSvD96oFGWKmqGJH8ZDU6/EA0fCGUkVtpPgwfWhoZQu/6Xy+4Z37Ae9w6zWTl5UdhxS8s2zGoUMXyEnDpbTLLVNsXngO2rwbplP6u/mDjhj4GAgEM1KAfp9bzVCYOUtqgcdyRX7y0oceIQp13/vWef2FkwvlfSXPpwR3TwVhSBgSKld8l0LTNrI7BMnr4v0Y9lTsCcuSKKi5RXxhZcEG++q7eCsNuJVq5N3z3EylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bgu9c7zjCUhR9ptv/DYh07QJNRGARaSyksN0B1FpRyg=;
 b=hlSx8T2Y96dWYmP3uQSEZE4Jm7V4nmM0n0Ta5z66WRtc2cvUxAymP+ERi6ZnYmu0jM97yZyVj99hL1zwRpTtj9dAL1FNol4zOKe5a6n3s3FAp5wRGAUsPo69Y2CIz0zhSKwDRiLsN25my6dEeeI5s4GXDNo5Hvi/dHAHhzM3ELh5kRd9rK4+tWfOhiZtG7UpOHRXqyfa+2tBwIW2CSTvSzjiVll6FaTELquE3ql2vZ1j4ib8MTE2qayuNQ1/NO40rWb4mKpwkTvFg56FdEwJCnP4NBe6XwOp5alJpnJrQnl/xY5m5sDWnXHEbkWfPWJS5FJzueeqifV+LFSQFxJXuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a8ecb5b-7ea4-7dd8-4acf-587b51862aed@suse.com>
Date: Wed, 3 Nov 2021 09:20:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
References: <20211102140511.5542-1-luca.fancellu@arm.com>
 <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
 <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0060.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84d94b87-4591-4d2b-2332-08d99ea2dd2f
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32950304FD68C60A7712CCFFB38C9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yYfL3cZcfQqfsAVeA6XLTzRTqRLZyi1kUy32RUOt6XYlPQ2E4dq2dbEXiLeDfG/NLMHT6SpX/QG20MO0h/4RPMF+pHWSoeJ2TpIOxEyz+zag/CG5hgld0AagXHV3C5x8zgUqsTzK1/KA9YGjfpN++mVwDDJhO6mHulX5zCrIt1RQAGl5ab1/8mQo3fUtesoicqGx4bhlBbgHu9zsRIP3Q1a5eBQvCCPpIPDiugRkmGQB+0ZKOMvVv4cuRiQKuKgDas6cXWfIETqFIAT+nR6MSezgwk1GdcmbAs4so/r9gxSjsQyKIXQ7v9ayuWC2NeXcj60262azqGH01XZESjPGNm699EkDe1Utk0krQlnsaZZe66HBMuzftHBn9I8DWsjvRCGYAkPxu5RYg5EuidWw4vhI9bYSUZoTaL9+f8fw5ozUgmYYOzVxSQqwkn8bdzEYpQ73Re2KdJVw2qd8dKEsxLuBxW1cwHHD776PbRqpMCJlaNhMAHJEphxhZ9ZJFnzq5EYiEXfsya4lHzLnxRjpQjWr2JV358OxNUdGvX5je3bh2NTjTATTMF6PseLfM2Wl4o3a1vvGrdibvj7rS4VKRz/I4XlgHdf44WmKB5z/LmS49VMlZSItN+V9+GIGstnRlnz/Nu9QoFLN0wSh5+P1CmMVjLrsSMOxqUT9es0mCsFishaqXJxIUT0IYzEHy9zUdnn1ytFEywroTOHazkS5dCONHVMuN5N8qINYv7S2DQhGu8nguZA+pQA/Wrmq1iIf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(6916009)(956004)(31696002)(2616005)(6486002)(83380400001)(36756003)(66946007)(316002)(8936002)(54906003)(86362001)(66556008)(508600001)(53546011)(5660300002)(26005)(2906002)(66476007)(4326008)(186003)(16576012)(31686004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zYC1HoS9UTzet2Eyyeun2/cBGeb4d9A5W6XZtVbs3NzTjJ6fONHO9QhSRjSf?=
 =?us-ascii?Q?Cjvip4mAWvZUn8WPeMnzyy39t53e90/tdjzDDSA7X+rxOuA/772o+tND8sT+?=
 =?us-ascii?Q?RoZb19T+iqY1rFsNQRl9pUOGtPF5OQodv51rHLgAoZ5NQPvo/60VOyxP4CxO?=
 =?us-ascii?Q?5G+lu8jz2/kvu1AwodixdQdZkVIKJy0bqTGIr/rosaNU4D4ad9z2buWriZkF?=
 =?us-ascii?Q?fqENa73DCT72QfCe3HslWEpAk/OWnQQFj0dye/l1rrWs18B957q3l+a3tlaU?=
 =?us-ascii?Q?kLJkiHtMo6L2eqIzYXopLy1s7xDmfcNIdDKyjf30ZARsQ6aEaq5XCZ3GSEAO?=
 =?us-ascii?Q?JUU93HJsqnPs0k2O6vrnr2ssQGYtSGCPuO8d7NLCrGT281XSnrvY9jXodAf0?=
 =?us-ascii?Q?iJy1eiVHhJ1zXe583pDdSASu1YUHYbRy7AfRnTu9cE2hWjUJ45q3bb8DrzWy?=
 =?us-ascii?Q?bmqp7MkYlSTuRiMn0S/9V1AmPDUUNwa6gC2EVtRfINNhm0G1CJYaWQOha6d2?=
 =?us-ascii?Q?8NNkw/PSWl/+kfdvPSFFRHZ7m1VYhWWJmtY3khxw/GJSj+L3hJIUzqO6YMsY?=
 =?us-ascii?Q?DbhgNh4NaHTaSO0s2pJxomqEuGdW6gA8g5nq3okF0EiyhO7KsATkfiGAWWbV?=
 =?us-ascii?Q?tMyiV4jz6qBLAReh+8rDHdeZ0co5mRyMl9u3pa2UPsmb4w+aSZjJLuHu0iQK?=
 =?us-ascii?Q?eedgaBEvnQStWp8/OrL3hVCB1FoQ9h2dbAs4C7YI0gFPvKQF7CJvRNaGRj/k?=
 =?us-ascii?Q?JPScsoE5gShsbyVmCfDOjc331V+uBi4NIn2JO/obHqSUvFmdSfFSMwruBrK/?=
 =?us-ascii?Q?d8UA/bkX/uVIz02BY95ZyExevzNw4fHLFeKK8IqNJ0BUsYQMNf4bOFmQwU/5?=
 =?us-ascii?Q?+hhCIE/Kx2Yv8GSMCJ6CDlgUHtbj9rj277cwTWNRABDidOq2woHuQq34DAXv?=
 =?us-ascii?Q?gJ5mxvGeDz6QkBX6feaTm6w24vfe+JDOxmP55EUHeFGnEGnlfTnAWQibFHIj?=
 =?us-ascii?Q?9ZXV5TVOJuOMjcUHvPu8hZWqglbZC1B9enyGt3RcEMV9DvIcbf0SFhRy7NEM?=
 =?us-ascii?Q?JJEzNxwJdXfBuB4bz64n4+kzxtKc+u+BI+D9amVLRX4+II7zAxnW9AAb3vjG?=
 =?us-ascii?Q?g4vqNYT5+ddUOY2xDsOSd7TXAPcL9zpNjQ/3Vq6GYIZNl1ZLMDfNjyTJrPyx?=
 =?us-ascii?Q?O4Hhl0auopAiAa9zAQbA5COtAQieqfEu7oYU3SmUW79w7eln4V18NUYpN7OZ?=
 =?us-ascii?Q?iBpfpCQ6Qo9xBCgN8Gg/Mz9PCrjBezm2xK8LRbFQowX3oy+IUa+A9B1sy97u?=
 =?us-ascii?Q?PE2WFAgJ/zjln8yxdAKkQW1iz54cKY1PMFqFU1cR3c4VWSJEMXI0hg9N+jos?=
 =?us-ascii?Q?+sjMNNlFv6Th3ZCM5P19j8GoETkgcr+XDwCesfzqefmetKs474NhXEopfsXj?=
 =?us-ascii?Q?eo94vvHAD0OlOx795K5Un3/2ix5jYrL2p9i8tD6AMhzd9PJnNVdzIgHDs7nx?=
 =?us-ascii?Q?WRjffUTq1PKAA4UNrOnWvRyOFsybFY1bweSyLpMbLd2+Ujg1HdHt4XDs6o8/?=
 =?us-ascii?Q?Ipfn1zszmqe1g3OCa0vvylkU5V+Hwt5CIQqKTp4MxbR6fixsmfqh6Bt20S8k?=
 =?us-ascii?Q?Q46jXLNEPRB/OHkJIdOxWr4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d94b87-4591-4d2b-2332-08d99ea2dd2f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 08:20:58.3619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMVIRZVlhvKqH83zf8xV9Cy74+wmKUuBQ1SxKnuy8LuGpVckhhze3/yGO4QTLuRWpsSZJRsK9Gyg++5wliy2vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 02.11.2021 18:12, Luca Fancellu wrote:
>> On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
>> On 02.11.2021 15:05, Luca Fancellu wrote:
>>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b882
>>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>>> introducing a problem to boot Xen using Grub2 on ARM machine using EDK2=
.
>>>
>>> The problem comes from the function get_parent_handle(...) that inside
>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>>> is NULL, making Xen stop the UEFI boot.
>>
>> According to my reading the UEFI spec doesn't (explicitly) allow for
>> this to be NULL. Could you clarify why this is the case? What other
>> information may end up being invalid / absent? Is e.g. read_section()
>> safe to use?
>=20
> My test on an arm machine running Grub2 on top of EDK2 showed that
> when Xen is started, the get_parent_handle(=E2=80=A6) call was failing an=
d stopping
> the boot because the efi_bs->HandleProtocol(=E2=80=A6) was called with th=
e
> loaded_image->DeviceHandle argument NULL and the call was returning
> a EFI_INVALID_PARAMETER.
> So the parent handle can=E2=80=99t be requested and the filesystem can=E2=
=80=99t be used,
> but any other code that doesn=E2=80=99t use the handle provided by get_pa=
rent_handle(=E2=80=A6)
> can be used without problem like read_section(...).

I understand this. My question was for the reason of ->DeviceHandle
being NULL. IOW I'm wondering whether we're actually talking about a
firmware or GrUB bug, in which case your change is a workaround for
that rather than (primarily) a fix for the earlier Xen change.

>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -449,6 +449,13 @@ static EFI_FILE_HANDLE __init get_parent_handle(EF=
I_LOADED_IMAGE *loaded_image,
>>>     CHAR16 *pathend, *ptr;
>>>     EFI_STATUS ret;
>>>
>>> +    /*
>>> +     * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_PR=
OTOCOL
>>> +     * to have access to the filesystem.
>>> +     */
>>> +    if ( !loaded_image->DeviceHandle )
>>> +        return NULL;
>>
>> I couldn't find anything in the spec saying that NULL (a pointer with
>> the numeric value zero) could actually not be a valid handle. Could
>> you point me to text saying so?
>=20
> I am reading UEFI spec 2.8 A, section 7.3 Protocol Handler Services, when=
 it talks about
> EFI_BOOT_SERVICES.HandleProtocol() there is a table of =E2=80=9CStatus Co=
de Returned=E2=80=9D listing
> the EFI_INVALID_PARAMETER when the Handle is NULL.

Oh, okay. I guess I didn't search very well.

>>> @@ -1333,6 +1342,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>>>             EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image,
>>>                                                        &file_name);
>>>
>>> +            if ( !handle )
>>> +                blexit(L"Error retrieving image name: no filesystem ac=
cess");
>>
>> I don't think this should be fatal - see the comment ahead of the
>> enclosing if().
>=20
> I=E2=80=99m not sure I get it, I put the fatal condition in part because =
the handle was dereferenced by
> handle->Close(handle), but also because file_name would have not being mo=
dified by the call
> and we have then *argv =3D file_name.

Instead of you making boot fail I was trying to suggest that you insert
a made-up name ("xen" or "xen.efi"?) alongside issuing just a warning
message.

Jan


