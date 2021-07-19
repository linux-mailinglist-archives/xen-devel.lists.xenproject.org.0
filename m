Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E00B3CCE46
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 09:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158089.291242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5NQP-0000M0-HY; Mon, 19 Jul 2021 07:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158089.291242; Mon, 19 Jul 2021 07:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5NQP-0000Jf-EW; Mon, 19 Jul 2021 07:10:49 +0000
Received: by outflank-mailman (input) for mailman id 158089;
 Mon, 19 Jul 2021 07:10:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5NQN-0000JX-MO
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 07:10:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fe16bf9-e860-11eb-8aed-12813bfff9fa;
 Mon, 19 Jul 2021 07:10:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-t1BV5ejkOcCmI1G8uWslSw-1; Mon, 19 Jul 2021 09:10:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 07:10:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 07:10:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.10 via Frontend Transport; Mon, 19 Jul 2021 07:10:42 +0000
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
X-Inumbo-ID: 6fe16bf9-e860-11eb-8aed-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626678645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SyQgzOnIUjXdhmxb6wpxYKEHumnjdeu8L4FUM7OVOd4=;
	b=J6ba6pwO6CBfnAoS4QpWwAvTaIHqmSM2hI801Y9+W4mhDwBjVCHy4aF8cofGjonpneW62z
	GHiw040FiN/0ZzhRLswy6PXpLCLY7QtpndQ3fWG4GbBjDzzCbbeLuiVr5gCWBQ+VqkRSe8
	QublXJRTETNK/vITiFcWaSXQlAllOq0=
X-MC-Unique: t1BV5ejkOcCmI1G8uWslSw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pmo/KAMkpML4PzgJAp3DtczsfbUipto+9Irksis3Bpgm+A2DOL4/LPUpwHTOP70W29O6qmxJOiE+otiz2jMqBx3Eaphn34+7/jS7EngHFRfCqKO/pgr2pO0W+B8f41nc6dnrzUZiNS5kF45rmJtC+/Dc4suOcxZ3Op5V6XutZCmilk5MjZniD5LY/9kVC2wCcXYqDIkhE+23e/8RGQ9w+Ztf5mi78i2938PNg0OpTobsjlcUwfurFkYuyaAzHU8w3N8fq5PkL5saK0Hl6JnyGtxs5ZFNxt/xeovWetC4y2ZnIgjtmJlhhnBKqox2xzgMgcJjSrpO4qzTjEhkZjtYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZA7WXWbDJuoWjc5G8umeqqz7ySAoacDJDJkAK5Gn+I=;
 b=NG86/B3AqBiP/kfUkwbZ3md1+B6VaAIMfVQt6WCl2H3RO8ey7K0QW6FJRvbeVvkPdCG8NQ1w9yPwtsiPW6KG4YOAs4FGuqPaHEWNFz3ZfqzLvL8L13W8YUcElOmZUgaDXVnXA6xIXDV30uwP97fDhuX3j9l+Kfid0vav9YSM58vg7RbllkayffA/+obKvpQh5m/953MdX0E9VWfGe+fAaVpilVDQhcqTvWlm7WTOa0iyNV+kqE4/PrHC6scZVKB/L7rNoemPSuPae8AaiLsZiscoVRqfosRUDyKf4BXwjLFPSHVhhep96LFMbDpKhgX9hmEFlXafM2duyJqtaqmg+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>
 <fc2e93b7-020d-1a47-b411-5220e8de74e9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e54d031d-dd57-3dee-1aa4-9836854c674b@suse.com>
Date: Mon, 19 Jul 2021 09:10:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <fc2e93b7-020d-1a47-b411-5220e8de74e9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: feb0777d-37be-4069-49e7-08d94a845273
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2447AA9220C9D81D965D8B46B3E19@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RfLINdQmAwMVlEc/ydLqtOEgY99W7HPKm7lfwG6dEIcdG7UKgJ3gdmr9dtLws7s/RodwH9lS2SHHLlu3ENQfVW3WZtTo9Rv1rUv+pxIdwMC7VfQmsRYsoHPrU6mBJuSwPsgOyXojrsIUfVWRKXPZcjlFJ2tEKJuPPzlPxzhWbBzQyomLLMmhUdIJTS1+7HbTjTJpEdzjTqAhW3lUf6v9uCHQ9p3Da6UFkrXiHdlgTNYlhUidVi7s+f0coKI/rO2R3lP/IZq7LuQVAYO62vPtjmsQ6Zn6LzvrJA/3/7h5ccMykmHulWGvtYfBbjJS/zEdrGezyq0JtpZVbOXaQGZ1/j1H7Uk37W1mQaYDobfmGVJqzNjMed1cMI2lGE4hUv/jy1V+rR4TlIhc9efYqkVi6o3j3eOemsaMNzBgiBPhFnYK4zw/MlCaEAloSgBeJwU7vA2i1+vRXQGGwUl81BcZNbDKoOGX6hk/SHi0KqVqGplcNiJVqkoCjyb39G5ao3xbstERkCLYAhVm5TZPWzMowRVSJ8oSVSxafwRhDd3iASpOLU6AfDNSjPqRPUKm2OoxbsZVdt0YZ83HUVyuzdh+QkpqEa/MV4HrZRscVY7T58LXJdrnZsvMQYF9nlwEZbxCLg32tjNV69q/C5sECikizP5bcq/xvm7ap/khzjBvEFMiQUek45gXvacWi7ZEFuKhQxo+mT1zbbkRrhBiFNO336hJJMmm/curepwwePpMUw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(376002)(366004)(396003)(26005)(83380400001)(4326008)(66476007)(66946007)(54906003)(6486002)(2616005)(478600001)(66556008)(6916009)(956004)(186003)(36756003)(316002)(5660300002)(53546011)(31696002)(16576012)(38100700002)(8676002)(2906002)(31686004)(8936002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AxaQHoaObLWj+13qDlPqkZ2XlPUs+WEkoyvrNj17CuE1njXe3kb3XsiF+XPk?=
 =?us-ascii?Q?B9mlaUzjShHOD5gqlanh+jD2AD4aVR2NXB7Jr1x1fT9hbUkN87U8KF7mIPW5?=
 =?us-ascii?Q?oDU/AEpxvb8v3SzkZy17nGdncKa6wRiAQ5ghQqUkND7tSqT3xy39HRe3UHee?=
 =?us-ascii?Q?k69HcFYmUcVtks81/e8yj1OyWSHcR1DAbZz5WpnmF8YEqYiKXCqWEwNJaJWz?=
 =?us-ascii?Q?L1kdTCNdBjunlM+EhrHVP0bVUVqQvSXi9EXzKYy+ouEm2+MWBAEsxApzw0cA?=
 =?us-ascii?Q?zRP7Z5tiik3q7ZCfTuaHnxj7rQl/PYdqCBB3OoWYJNGCE+z1tlJks7m5BPC/?=
 =?us-ascii?Q?DzphrDhrPcKdRhgOSioKLQlVa49iPB4tf4F5zCvgVevhhy2iAxJlsEOTB7t1?=
 =?us-ascii?Q?oz017RenoBrQksZCT6x6sVmU2LXp9HeFTIQ9GPaA7eV5c4XFKgj1vstqmhct?=
 =?us-ascii?Q?c1IqUl+wXqGkxO6lsilR6iGfdwYfruyO4nHEANbwDo0vIbwIm0uA0Kak/sAf?=
 =?us-ascii?Q?5v3+HJB7daP2xr/6VvFxucnSOuLQrjVhB1deIcy0Ie5dwNaXIs1OO0bSU6fS?=
 =?us-ascii?Q?pHsNyz/8d1O9uZu7ObdvwnU1yoEauX2rxEwbEnPnqVvdamUs8idqRy2IjvbT?=
 =?us-ascii?Q?88MdKjT2TU5Z8ON0R5khJ34XHGO7QHtcbzrOTO63Daqh8Z+CLzmCNgoFAz8x?=
 =?us-ascii?Q?f2LBUBi8a/0np8j4yeHX4L9DNMooHCkcWtxrup/s8SkniD4aLnJULCqI8JWG?=
 =?us-ascii?Q?0w1o55A223GCp3yL6gknL8LrWreKTBbSIJ82KXlyl/iu+S4vqibi9U1XdiYg?=
 =?us-ascii?Q?LCV1xFhUDXNpcDzDOZxi3Xlrx2veJlSPoCEKmvAzQULCeJ8Idc0JnuR2oPyL?=
 =?us-ascii?Q?vCOhKZwmcBH+0yKKJfcP4rdeoAsLAcPlnIBdL4VNhvvcb4m9Jc+htu3Opktk?=
 =?us-ascii?Q?CbkWm/VDG14HHjDfGLniMAGl9HrM9eH7PUvJzKD6Hs6bLPhwRZusqLySA6nz?=
 =?us-ascii?Q?8nlNA/ZbF3pyRxZ86uOGe+1uLsoAk2A21UuwOjvg8KpbYyGHP+PGEQ68MP+4?=
 =?us-ascii?Q?o9tNi7rGCJyeJBUisjWxdB3gdAqUz4D7H+8ms/9dhAGuc0zmAovIRau30c9Y?=
 =?us-ascii?Q?ShO7pVKa5bdWxjQKsJPeQ8BsfXcqIaSspJjj5POwGuZSRGWbBk2XmZpJro7e?=
 =?us-ascii?Q?olFlzBkISDVc0k1elYxHtxSWiEQX9+DBaS+wq7mr5pkH1VFQflo/SKOT98lT?=
 =?us-ascii?Q?xU/Jpye+KuTGWPEU/KQwhBAfmZ6RET5hgoitphSlkmb+LWwUkLFB7+H6kety?=
 =?us-ascii?Q?xzyaQnh/ih2YETrwvSlvuEQl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb0777d-37be-4069-49e7-08d94a845273
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 07:10:43.0700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrbgzJmXgfiKqzdq1vvXJoo6VfCdul3Q+VcobKyMXl8bQPMMbYMlEDdtbGBTGT0UprDWfjIETJyLIU2uiIHr0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 16.07.2021 18:14, Andrew Cooper wrote:
> On 16/07/2021 16:26, George Dunlap wrote:
>>
>>> On Jul 14, 2021, at 5:17 PM, Anthony PERARD <anthony.perard@citrix.com>=
 wrote:
>>>
>>> This will help prevent the CI loop from having build failures when
>>> `checkpolicy` isn't available, when doing "randconfig" jobs.
>> Hang on, just to clarify what=E2=80=99s going on here.
>>
>> =E2=80=98randconfig=E2=80=99 is setting CONFIG_XSM_FLASK_POLICY in the .=
config file; and then when the build happens, we error out because one of t=
he required components isn=E2=80=99t there.
>>
>> What this patch does is to make it so that if someone explicitly sets CO=
NFIG_XSM_FLASK_POLICY=3Dy, but doesn=E2=80=99t have checkpolicy, the build =
system will silently disable the policy behind their backs without telling =
them?
>=20
> Yes, but that's how ~everything in the Xen and Linux build works currentl=
y.
>=20
> What this new version will do is produce a config/build combo, with the
> config reporting that CONFIG_XSM_FLASK_POLICY was not active.
>=20
> This is a damnsignt better than the "old" way of doing feature checks in
> the makefiles, where there is no trace that the build system disabled a
> feature because your compiler was too old.

Disabling features at build time is of course no better than disabling
them at configure time. Instead, if a chose configuration cannot be built,
the build should fail - ideally with an error message clearly telling
people what the reason is and what they can do about it.

Jan


