Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC842E931
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 08:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209791.366345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbGtv-0004Wx-Dv; Fri, 15 Oct 2021 06:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209791.366345; Fri, 15 Oct 2021 06:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbGtv-0004UA-A6; Fri, 15 Oct 2021 06:41:07 +0000
Received: by outflank-mailman (input) for mailman id 209791;
 Fri, 15 Oct 2021 06:41:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbGtt-0004U0-EB
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 06:41:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc7a16ce-2d82-11ec-8226-12813bfff9fa;
 Fri, 15 Oct 2021 06:41:01 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-dzKrSfWINja0GfQv6o4EXw-1;
 Fri, 15 Oct 2021 08:40:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 06:40:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 06:40:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0072.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Fri, 15 Oct 2021 06:40:56 +0000
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
X-Inumbo-ID: dc7a16ce-2d82-11ec-8226-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634280060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hgMMJNs0GTVRfukQOqWZQTjZup3I7othJ/wIT93TQDo=;
	b=NN81QGpve14lkzaRiWLeNtJbzLTFRgl3bIsKFP7m+Re60rjWKbLXVL3d7VQp8BaQx20GfM
	HmsyCdlNjmTr3Riq4hrkc3cb87OO4GYBWGGHLJOjp8DzbDFyqYFAa4/cz0C8zl9CoI136E
	nEMD9n699mmw/oId0WwLfCqmYw8+b0g=
X-MC-Unique: dzKrSfWINja0GfQv6o4EXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erb5Ha5yzNrxIZMV+laHi2xcWciEUS5td3AjVyd084PMds03lX8MZBR8sIHVpClhTAPYm//ZkjtbnKnMnpYpgWS+o3PaEh+iOOGm0jyNXkiGRES++pic7Uu2FBJ6tsFXE7rdmCIDUS7w8nrJBjDksRmqGzFHe1j6Vrao1vAG39/kFMo37vNXyxWN8vj+gpuwX19c3T7mQUA79G7rbF5MMsS+yvtLZ/k/ZVsy+KZZ/Fa+qqth7s8otCfJpFBIbx0nLPfH3EkBxezqPVVoMVTB+AA+6U19W/SQKWgil1zomGhZtJONxX7jiterubZXGPXjFWEyd0IpnOo0UtLFa/kzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COrLCkccvjn5+XaZKD1zCErafRGmq5lTaIPv7sxOq2Q=;
 b=gV/ph0/mwufEnsvshxHq7K7qEjuqKtJT2eNfNXQZQRdoDuJ8vP0UkBc9v42tlFaLj2Hd6tCSS4TKcwgPF8sjtKN/+zcYEEfOwbeQpPIJWT3bfaNsL0Iijg2hl1JYD7MRjkjL5ZvjElTsMFxxRWq5QD4b0d6J4ZIUBJOeLtleYY1pGkSGEgt9lCgM73sF4+m80mwod4k4t3TBIqey6HvqXyu+1+6O6XGvDQzlepY1n84CVT/8emjCJDGchx8JsAM8RgcnN2GujJaAteOwHX4jluWaCK53e9ziff86IfvqO6mJOqtDBH3SuQlB045ss3AtnHB+0/LIeTcrMmFhqgP7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
CC: xen-devel@lists.xenproject.org, iwj@xenproject.org,
 Rahul Singh <rahul.singh@arm.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2110141331310.9408@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4eeaa45-e473-9cb1-a65e-70cb0fdfc443@suse.com>
Date: Fri, 15 Oct 2021 08:40:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2110141331310.9408@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0072.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1db8cd95-8c15-403a-8ffa-08d98fa6beb4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608CC343E51ABBF501A74C2B3B99@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UFCr0WGHjQQUKsZWnjaVNSuZO7DppWhur0ltjSJx3J4gfrRkF4GfOYhEWv+P0I0g1lKi13QKmeNEbGRe4ukSUfas7fTBBy1qiuuqnT3Tm7WcZniIBjr07KHrQqEvh3Gx0/UE8dWCVOMb11+uW7krMWi1CvTEggVHQFdHj06ezV7xdLUkUkcPANGIYNOtKY69czPSLYovFGM6OS/h8A8Us/qFGzZfWp8ITv2TKwhKgIfehDHKfgiYAZgXZJ7ancHy/1GJHEiDyWbMTVEg7WBQ0dPBHbWTfnZJV8crvboW8tLqsYCCUTspQPQv6iUYmG5shEsXKMmsUkAl2kvE3ON4yaZ09qCTlWNErKsmTxteRDrW8uJlg9HbzZwYcsj4REOJ86pTU0Pp9W0Nr1jUjLR7M/Y/mKzGu8og/wmAx8o5lY5e3B8lhAHVoDT6VqbRXgEch8HTmVMBo9SP3ilp74TcZj9Jc9WD01waXxpP+bRyiX6N2kqBsDFQlaJfwpsRe+q/2ppn/vbIe/RDHTWIJVgDLAuAp6hsJh/pDCspAtd8rHC4yJ92/wd/sAJ/2canXsbTs95JS0XyzRzNnQDx8Oxbl55l2i3iorcR+bQ0egbxUepN+20HoYeJkUgcD01G99ZDVVw/umsNaL2TVQ6DFkIYUxGllckZ+hZ4AccMyKnzTSpFTxTI7qtB8Rc1XOcPvD5lpZPhY0vJ7kPVvg1WVFe8ppjpyr1nRHYGeg1hOsr3rMIRgNcxZevQb7SGkG/CZSmLk7XrU355wBPBP5LbVmgP1JvgC0Cx8v6KZvz3DfFXeZGlMZcjPbz8X2VEph91Ik0SFRGMOdI0JfTKHjmBFbd9nwC0vcSubkg1isP7NOCrwqq1XEho+cD5cIykWJQ0FX8z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(31686004)(8936002)(31696002)(6486002)(2906002)(508600001)(110136005)(316002)(966005)(16576012)(38100700002)(54906003)(186003)(4326008)(36756003)(956004)(86362001)(2616005)(66556008)(53546011)(66946007)(66476007)(7416002)(26005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?65tN12bfFzLA48F9NExsuIYvwYpt39bqDxTil+cO+IIZxXV7twnEYPXp1nbJ?=
 =?us-ascii?Q?Bi2/OjtJtnQ1YScUs6/H63ga5ffQH8qnFeui+ib0lZ46cewLx1DlQAahoye3?=
 =?us-ascii?Q?q6a702drCPfnj7+LhA0dDTpo98iY6i+AQU5VttEJU28B7wUlE6x9ABKZTQVD?=
 =?us-ascii?Q?gdRbWcQtiud0xkym/4/Rx/MFeSgd6LHJ/ofYhVslFFOuAZTYyINkVjTqaOAu?=
 =?us-ascii?Q?sgwBLcHYKLq/S1agxcud1u2doJUx7WNUg/1OOLzFLwDVtlROgsrbwJvZiPDl?=
 =?us-ascii?Q?JgLJFgocBoUjhiA6D2QxFi5HKjKw3qp9nLZXU/aWjzr1MQYjn+o9owdszinH?=
 =?us-ascii?Q?QBomLC3guj1ErIyIhL0lvK1vWRaSYFpAHoltuHoR/1I+QanmHnXqzPNS0nii?=
 =?us-ascii?Q?K592EFqi035sVOkLevc5Dq16+KOi4v7U0rg5AcHgEGWUXYkeppJhLJjLTr4Z?=
 =?us-ascii?Q?ffRANYFyrCCv5faM3b4q0WjKyoR6ij9q+lLe056cceF1g8W5ndSMhex9kC2y?=
 =?us-ascii?Q?+dXlVaKb8Xla09MM5PDz2U2pUjAZNWKvN0QXf92qndX+77gzY8D+2yEXKhM2?=
 =?us-ascii?Q?Z2C+merVV+U+/b32UzBlj02LoiYEp+PYPPHk/ezdW88UEXdK43kxmfGIGz5N?=
 =?us-ascii?Q?irIhyhILnjpZqzQ9HR8dy+KVOUnekHytoTlCbnKIbnGF0pieylRrcEtlgzI1?=
 =?us-ascii?Q?s1zRu+BnzsdMT24Q0NceETt7sILUlR4kjfdSG/+UGiRnIIL4k1ECF6lnscPV?=
 =?us-ascii?Q?0brIrIYYcQFEzlkIRcaSo9QWZXq+Ie1404F0XPMn3qNEjrFp+AoUcGEsBuXi?=
 =?us-ascii?Q?CkmiUkktsQo0aZx9pet8Zn3Sp9TPs8e8g70sjj5n5OP1Yk9j9dJ4FF5jw/HD?=
 =?us-ascii?Q?Bgt2dFR0/KC/sSln07YVJDX8NoFnI8wRgGNXjQrZ/cquJ7GCkj3UjOa8mFB0?=
 =?us-ascii?Q?bXshf7jVIltnlkA0U/LfYGeoivjcqLUMMMFdaisldhgHoY/iEm38DwFEg/8B?=
 =?us-ascii?Q?J0JDSvrzLjFq7eAK3cN9RzW9mhy+QxH0tcYee7Ie11WoxznOjG+28bIACqVQ?=
 =?us-ascii?Q?j5H1RKX5q7lVZqPWT5hG8tzuRxdHdmoP9smNnIFae9ONz8EJLC9tkARR8j/I?=
 =?us-ascii?Q?452yljRM1YHRRDICXxb0VnTn7MtwejL0S+EKg9/LyKUSuFrHK73DKGaAIIvn?=
 =?us-ascii?Q?eQC+cAqLy3E1HzwBSpCvZ98YF9vB8laVU7O3hu5aIo+RA0zfUMLJ5iE6+DBu?=
 =?us-ascii?Q?aA7C4MPZcPpt61TeOf3k3qiYu1CUjV/dlWQGSReQ5AAJGAzTeJGxe0srfMPm?=
 =?us-ascii?Q?+Tl0muITU8sviJIkWPwJDnzX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db8cd95-8c15-403a-8ffa-08d98fa6beb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:40:57.7462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMfKk/iIEcE//ZGoLvUxy+ActpcezyDkm3hPh/lXLqss4zxmNqsMDJw9NVZrgKyUenCufItkLXxmlP9H2VdoIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 15.10.2021 01:49, Stefano Stabellini wrote:
> On Thu, 14 Oct 2021, Bertrand Marquis wrote:
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -418,6 +418,13 @@ typedef uint64_t xen_callback_t;
>>  #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..=
127 */
>>  #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
>> =20
>> +/*
>> + * 256 MB is reserved for VPCI configuration space based on calculation
>> + * 256 buses =C3=97 32 devices =C3=97 8 functions =C3=97 4 KB =3D 256 M=
B
>> + */
>=20
> Somehow 3 non-ascii characters sneaked into this patch. The 'x' are not
> 'x' but are 0xc3 and cause the following errors in a few gitlab-ci
> builds:
>=20
> python3 mkheader.py arm32 arm32.h.tmp /builds/xen-project/people/sstabell=
ini/xen/tools/include/xen-foreign/../../../xen/include/public/arch-arm.h /b=
uilds/xen-project/people/sstabellini/xen/tools/include/xen-foreign/../../..=
/xen/include/public/xen.h
> Traceback (most recent call last):
>   File "mkheader.py", line 120, in <module>
>     input +=3D f.read();
>   File "/usr/lib/python3.5/encodings/ascii.py", line 26, in decode
>     return codecs.ascii_decode(input, self.errors)[0]
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 1464=
1: ordinal not in range(128)
> Makefile:28: recipe for target 'arm32.h' failed
> make[2]: *** [arm32.h] Error 1
>=20
> Full logs here:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/3885507=
8
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/16810108756
>=20
>=20
> Replacing the 3 characters with 'x' solves the problem.
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/3887212=
62

Interesting. I thought we permit UTF-8 in the sources; see e.g.
tools/tests/x86_emulator/simd-sha.c using =CE=A3. Is mkheader.py in need
of adjustment? Of course I can see that right now the easiest is to
use ASCII x, but I think it was deliberate to use =C3=97 here.

Then again, with the goal of the public headers being usable with
pretty old compilers as well (C89 being the assumed baseline),
excluding them from the permission to use UTF-8 may also be quite
reasonable.

Jan


