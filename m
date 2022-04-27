Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD15110B1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 07:55:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314357.532384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njadG-00041o-Q7; Wed, 27 Apr 2022 05:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314357.532384; Wed, 27 Apr 2022 05:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njadG-0003zz-Lh; Wed, 27 Apr 2022 05:54:34 +0000
Received: by outflank-mailman (input) for mailman id 314357;
 Wed, 27 Apr 2022 05:54:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njadE-0003zt-Uy
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 05:54:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81913fce-c5ee-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 07:54:31 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-vkMsQOt7OGikxPbhx1BjoA-1; Wed, 27 Apr 2022 07:54:29 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4341.eurprd04.prod.outlook.com (2603:10a6:209:50::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 05:54:24 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 05:54:24 +0000
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
X-Inumbo-ID: 81913fce-c5ee-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651038870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hQVZO4XlnPaC8aVKdysPy1Olg+8wdfP09s68bP3b2w=;
	b=Y/m/MdeC/d8RetDnnnhl/wuu0f+t8OXiEpFzc9/d/dWCWVnG2gW2k9qwSxEcRZDvSvu483
	AzXbHiV2Fp5NViVwGECiJu0+31YPfN1MFqZJpLMM411b4SFCE+knsI+uXOJUm+9u7JQOZf
	u8/Nkack7UcJ4tQU8YWU6K24gM8YqGs=
X-MC-Unique: vkMsQOt7OGikxPbhx1BjoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gW0878Y49zZic1f5cn/UbsuEjT9s8Sx0c+BLrlKfpB7RrWSF8F8QoWGDpcTFG3sVzZGBBRDhJ/OBzDWuJ86URv9x89E6C3dqJKcuYUAi8uy/+o+zKpLnqw7WBdO0b1pIiuvRFpux5x5lqt2kqVJ6aiNyVYrzW79C4XgiAhzIgowv4MCui/L0/ZdEViKyLV5pdwBrpi22UEXjVbdPj73MSVjb+cHG/3I9jSo4UGSPy3EkBX250IASZFvej6R74qA2Z+9fBbAMk+X/wp3Ppg11eRVeuIbTi93vuYJBWu7YQKJ3DR0glmO0btdWKhkZD1U6JPA8BKLooxQnQYzAaH7RXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dg+cNINhUkLElAC1/aUcHqA2yaSIByX9fe4l8QBYAHs=;
 b=JvKrE2C8bVc61ejQeDP5Dm97ueO5OFOwU6bTDfsQguQNvnGCYUXtCM1LxT8hh4IdrwxonX4YhC9e1X04k4ixqt9XUyZqg9PhJPHTeJNZ0zVgs+ty/a8k8vxQzuuTvFo/KQlF/F+IyM3Wh1+CfkPKfO9bC0gK41BGOKkDX0Ly/jzY3+zVBJewO5dwHLoEe2YmFVy5cc8GXD+PYYTkCrCUIEfG5N7TVdjkjeqBc0Qo7g7umRs2k5LVnSfuAKZkv9aWU2cwWhByyxGmBnSiSD0yph3lAZY3Yh2jt9M1niz/r6floGxnT6jgCp1AsJemq4cnmiBl9XGYPbSibhjQc1mzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bcb8a2e1-7670-8a53-4d81-114a30963a66@suse.com>
Date: Wed, 27 Apr 2022 07:54:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 02/10] xen/x86: move reusable EFI stub functions from
 x86 to common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-3-wei.chen@arm.com>
 <3e5b9708-7732-a56c-f2e8-d5d39fd2093e@suse.com>
 <ed949bf4-ba9e-9ad7-b2fe-c63526ca42e5@arm.com>
 <413651ff-55a4-61cf-efed-7ac82f7c6723@suse.com>
 <PAXPR08MB74202E608E9A967458664E7A9EFA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74202E608E9A967458664E7A9EFA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 396be4fc-209b-497e-345d-08da281261f2
X-MS-TrafficTypeDiagnostic: AM6PR04MB4341:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB43411B47204FA37CF08F7CD3B3FA9@AM6PR04MB4341.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fuqmw5TZTqM5+/RYI0xv+12l8vtuk/9+acKZpavUe2jWOYvorNuMGvpMaRY97un2bT0nvO6asBPckq2EY6cVI7/ax0Rp8xsPJ19Dn2NozV+1eBODwDoU/Mv2lWlZfwDQi5bFbyeW7Rro1e5fw5fHCr7+GkRnbm663ezM/zTC2uo4u8nQYqWjtmOGkqKMOLVZlMVsJOy9T/9dydF8l4hA/gbd6T1VdoI+hdHyRW49ZdB3p6HQ33xa8H7V/Qim5r7qXRc07HwyJf9NqhdxSm8nPFG0KBON4078MujtWeGJ9rlCw1L2bvVYdu7XS9YmyQ9JxDRQadvRWrpJjN6UfZ+UR9R3JQlKU1EcU6y9ChmajJd+mGJ3tkVfqMC09Qmu0g2Kn3kylpB/E6AsFobAw9ijWP9bXZV/6QYV7mkh9H7OELQmqUHbCH8aS6qHFQpoq1gtFLm1KjfZltWsgECTbxlCZ91AoOJ1EANShOhVdopY2Z67bWy2Cq1T43WbmVXjB3K5Mf8NAXKob95eYXjNFoDxB7/TE5BpDUpIUks5fSlXyIy+jEz4c6CM+o5K7zAwMZ8X3LiJs7qqILbz8BxfGfUvudlgHxB69Ay4l5ANWuwF0GQlms461k8sc5yCVZLDphn3woZdpIej1dYLnogVKL3RigHrGg6fessJnrHGx/VPErkitQrJJdhRI1Gx60rQr74g+0a81RPe41xKn5H0h/6t0EyyhmCcOco3V0o8UUTJ6ElD+UGPsLRG2B4Nh9w6+Lz9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(31696002)(54906003)(66556008)(8676002)(6512007)(66946007)(26005)(66476007)(4326008)(2616005)(316002)(6486002)(6506007)(186003)(86362001)(53546011)(508600001)(38100700002)(83380400001)(2906002)(8936002)(5660300002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aKzmZFhdeCGHhVYaqz2fdHtl2UwMNgKd6XNTUgijakBvoOEWnVkF/94Je5G5?=
 =?us-ascii?Q?8jXVN6SJ0emLEdQqUwkk5CW13AkRIssjhENcp5WdHxXmkgh3i3sQQ8aWBrkZ?=
 =?us-ascii?Q?hqqirCIlQWoXKs1HyxEba2SmzrjMdW9uQjzj+lfhenJsFgWMc93GBe1h01yx?=
 =?us-ascii?Q?E7jz/hDFxfjJohySMmAD0zewh88lAG6ha4f2Z3KZnUO+6KahayV1znvS8dh5?=
 =?us-ascii?Q?NFVe3IfWZrwgj1h/OcGBmZXxBIlXRmf7cVnSe+2imDjuYa528hpOr3r44q2e?=
 =?us-ascii?Q?zYmqMQfjK+ly4pMP4zzbnKLL5VWDybSyO1Kr135205MntZRrgOSNLz1+gINE?=
 =?us-ascii?Q?BwVU35RLTmHPUu32XWTqOH8Zl+QWgTdSyvnl3QiAw+JWlBaLYcbRFvlUIL7t?=
 =?us-ascii?Q?H3rmW4uUw2olx1CJ7oyWTvWwOwP+GLxOPCXUPH0ArM+s4OI+wF11vbmq8soR?=
 =?us-ascii?Q?1bP6CNZfcSaxhvIUxmtJ5ZCyf88VFgFt+uRA5PHb+8I40GIOLu1aj64xok78?=
 =?us-ascii?Q?31RSCaQwnija0dV0HeLFXt4Azn5BTYQK6zfrDk+mevScFZV8x2pcXbmoUt30?=
 =?us-ascii?Q?AoBxlRe5Jy7R1YjRkIsNIDG9/6LnNRDYckMbS7RcqDTI1ExtDj8pxBb4tz7g?=
 =?us-ascii?Q?ei3Hwk7J8W2g19usdMvUFHaUEPwMV/OdwUhiWkTXVbXiZ9hNLbSkc/3J/D75?=
 =?us-ascii?Q?rx3hxRm6vSzjD1t1SKmgBD8Pvjia1ryDrlH62/vDs91zs5zJV63cwBeaY3z8?=
 =?us-ascii?Q?iy/l8nahyB9mSUBFiVaMCKvDCXLhR9aLApvcwMzo8G9RfSpx3dXaM2W9o6jk?=
 =?us-ascii?Q?ISFUolqYQvxf1EX3/tfpKOkWu1NhamjqjyA78cS6REUIlpF+3WnXtYcuSkYd?=
 =?us-ascii?Q?BbP+cKT/rFAM/SixTgkKJ3JebTeYT0W12OiA1URmcMzevlhQgyNfj8PRQlVv?=
 =?us-ascii?Q?VCd99nZKXol61/HnYqiTVOf/2SATg0IwAOqO7TNXSDn3NK1g2NxE/8Z3+0ol?=
 =?us-ascii?Q?X0ASopWeOw5ErFw8nWDFB3Mx8nkazKeKME9igOe44VK2PbaIAxhUIOBagiNU?=
 =?us-ascii?Q?oZFYMcB7qiazES4p1m8C7B8tTCQ9ndKMvMa4P5SK5+1JtAmfszPDU1XdkFk6?=
 =?us-ascii?Q?HxWdE+Jlf+5d1r6kJdkZaxjT0uLZlMyM/OTt7sjSg/DHcKOw+YLPChGZF22j?=
 =?us-ascii?Q?f/7ayWgIWd0rK4dy6Q84FRN+UDT0y0LvLDI0ipGKxgtWLq7qpjTyUGGH6Mvs?=
 =?us-ascii?Q?msx/3t2dDvCKgP12VGBeS7Y/w6CHfIIyQIOGFKb8frp34PpsHdWCqmVYMwx4?=
 =?us-ascii?Q?AjMQbOpzXZOHA7+rzJddfDcfwzIQElvPZugfpZceOYmKXyCzchV9hKPpxdli?=
 =?us-ascii?Q?OUcHI6JKJSsCVJXkTRrbGBnIDqY0m1EwDAKbrGa2ASVtTz0hfMueKaa1SivP?=
 =?us-ascii?Q?jmyxjOibwxclxpUHPKamcgszRd+uaSH/vkqabNEB0Jk4vUVvTGSvv6Nqxka9?=
 =?us-ascii?Q?ZWYQXrfP9pYxJKyyr8mxFNrxGCvhhXoFsPXO8pP62HVaJq0BbS6nIB+JohNf?=
 =?us-ascii?Q?jwURz25J6VvuEZcCxRG2GiWYVh8NdTStdPWfgQ7/ZzLNjQWhM4phHW9Wj9sL?=
 =?us-ascii?Q?AqaEjy/diMWjLWu5aZqYd/tT6qVmhgRNingSwxKV6hq0Xtx6XQUUdRsx55FA?=
 =?us-ascii?Q?xGNDcieY7PoEdf6ertOuP5/c0MidhHHZfa+a2baVTus7O7Fy8GpTdypys++N?=
 =?us-ascii?Q?Ss4QOmNoyQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396be4fc-209b-497e-345d-08da281261f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 05:54:24.5081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOFLyiDjZSYG3pQ46KRwyqSrvwJfVG+KBd+zFHHJHFeNaH8Y7PssmS6fEOruVITAKYnog3Pr3Wir1gCAXsiqfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4341

On 27.04.2022 04:56, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B44=E6=9C=8826=E6=97=A5 22:31
>>
>> On 26.04.2022 12:37, Wei Chen wrote:
>>> On 2022/4/26 16:53, Jan Beulich wrote:
>>>> On 18.04.2022 11:07, Wei Chen wrote:
>>>>> diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub-x86.c
>>>>> similarity index 71%
>>>>> rename from xen/arch/x86/efi/stub.c
>>>>> rename to xen/arch/x86/efi/stub-x86.c
>>>>> index 9984932626..2cd5c8d4dc 100644
>>>>> --- a/xen/arch/x86/efi/stub.c
>>>>> +++ b/xen/arch/x86/efi/stub-x86.c
>>>>
>>>> I'm not happy to see a file named *x86*.[ch] under x86/. I think the
>>>> x86 file wants to simply include the common one (and the symlinking
>>>> be suppressed when a real file already exists). Naming the common
>>>> file stub-common.c wouldn't help, as a similar anomaly would result.
>>>>
>>>
>>> How about using stub-arch.c to indicate this stub file only contains
>>> the arch specific contents? However, we cannot predict what link files
>>> will be created in this directory in the future. If someone needs to
>>> create a stub-arch.c link file in the future, can we solve it at that
>>> time?  Or do you have any suggestions?
>>
>> I did provide my suggestion. I do not like stub-arch.c any better than
>> stub-x86.c or stub-common.c.
>>
>=20
> With my limited English level, I can only see that you don't like this, b=
ut
> I can't get what you want clearly from your comments. I can only guess:
> For "x86 file wants to simply include the common one":
> 1. Did you mean, x86 still keeps it stub.c and includes all its original
>    contents. The common/efi/stub.c link behavior will be ignored, because
>    of x86 has a real stub.c? And common/efi/stub.c still can works for
>    other architectures like Arm whom doesn't have a real stub.c?
>    But in previous version's discussion, I had said I created a stub.c in
>    Arm/efi, and copied Arm required functions from x86/efi/stub.c. But
>    people didn't like it. If my guess is correct, I don't know what is
>    the essential difference between the two approaches.
> 2. Keeps stub.c in x86/efi, and use it to include common/stub.c.
>    I think this may not be the right understanding, but I can't think
>    of any other understanding.

2 is what I've been suggesting.

Jan


