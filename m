Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2971D46BF2F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 16:21:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241259.418159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mucH3-0002iA-8h; Tue, 07 Dec 2021 15:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241259.418159; Tue, 07 Dec 2021 15:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mucH3-0002fL-5Q; Tue, 07 Dec 2021 15:20:57 +0000
Received: by outflank-mailman (input) for mailman id 241259;
 Tue, 07 Dec 2021 15:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mucH1-0002fF-80
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 15:20:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4475a7c0-5771-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 16:20:53 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-G8BKt6zxMA24POGB6MUi2Q-1; Tue, 07 Dec 2021 16:20:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 15:20:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 15:20:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0063.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Tue, 7 Dec 2021 15:20:50 +0000
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
X-Inumbo-ID: 4475a7c0-5771-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638890453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XupTZiECmFqLLilaRn6AeO2eE4vjC0wb540O8XZyy90=;
	b=MwuQdG9q57kQLMVNiBDZkwqmF+HCxtlGHMfYw8I8/0IWjlyqrnshv+leXWwvujsbhcs02P
	zD2UWYv07vLYtN51Uh+TNYN/LckBHD2+FnhTOTOmr561j6HCnGuDlSMIQ0+Kv99xdDAVhy
	SAAKis4gy7Bd4Xc9kCOat9I1spjKlAQ=
X-MC-Unique: G8BKt6zxMA24POGB6MUi2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfR/GBb5m1uci8eu3wVt1RLG6hDnqVY71HWjouppD7/uKcrs6CPz7BJ78L3ZeMvzXAo+Sw7kkFSIlgHAUip7wLoOfbIKGB29Q6qPNv8ixHjiX6VA5JTBkTxkI025C+2UzhVWLUL4AMNWoVu+zoFtHqjaNCxhiPUmcwwNzRyiLFqyiNKRdB1J20s/7TCSQTRGDuRxvj4m24TIaCBKEdLUgLzhAZcSQtLQBgi5NgNB/pCy47mDk0Ax+cQZkl1T6Iiim5ct8Ag7ai39mFSQGAT6UfCVWSZa29ALWWTL3xTbPLcsOmz1nAn5HTumd/5ymo5bWJNDFjhAgT3ow1gpz6SheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+LzXGuMUIsINIBTh9QaoXw2NcVFk1toHUM38W2fzTE=;
 b=j+nHSiSoyNYQgIplLYnj18VE/Gt40ut5/11Fukw7ewo6MSYwBnu/kmvCZaHkTOykdVKVTXYBoblIFPI04FczVh5WwVseJeZlmugiZx1E7IC6vX42mpe0wT2y7XACZR4zeRPe08zDwsdMDZBs3t3cAXbSaSL3YlwO+YOIc9o1nv1dEXzTM+4ZFveL/WwL/1YuERQzd2oh95O24vCd5WGD1cSIJ4Qi2o14mg4OhWMi4cN9bttQV4v1XGbXIpjKIPhK+xtYyNRDKsAI5CDACB88orbt2Cep/Nc/bgPjuZzkdFCNGb1Wqu/WnWm0uMJ06zbd3+UCOLbstGJK0QTLuizI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8426f7a7-24b3-d295-bc06-30e1c2c018dd@suse.com>
Date: Tue, 7 Dec 2021 16:20:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: xen: linker symbol mess, and freeing errors
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
References: <115c178b-f0a7-cf6e-3e33-e6aa49b17baf@srcf.net>
CC: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <115c178b-f0a7-cf6e-3e33-e6aa49b17baf@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0063.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 074684ac-65f9-4682-a292-08d9b9952734
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703973DB918A5E31D2DE0348B36E9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YOFVvSrmpqdDMe+wSvdiIXxmdQSe+qFhKoNBDlAzBwKgNioo9to4Klf5BLHw9vLaRvhn6orK7SR+3hG19B13075xywWVLkNEy19JpkwL8sPKHcHGo56BUE5q7wkcthqjJkbd0CcAisoxB1Ws7T4MxksV8xDhFz3TUTjO3KaK6dx9ZT1slOsYK7+yCt5JCytWryoz0FsLjpcXA/ShU8+AYzhbwJuVodrrVhnKH7O/Os8Bmx3XT0tgcW79eDGVDJyOWh+8brt89L5OrotvunNvst1ZCtGlvh+9170Vb7pgTlx4SnZMTkb6rGxfWOKe5cWPsm7zehlAKm2nCzdX5ZJ8kMBDwFRwBQ+hH7ffuUbJFLp7JTC0xninu+o48k9uDONVbMEVVrXKSlup8mGFqty/7Z+aGp2qQmX1Mlqs7WkI51JX19y8AoZmPNaEZt1YOWDOm6uJVGltxqkjOrccHVbiBrvRcJCUZD7/r+WcOlfUzDie0tJP9SRysxT07qbL9nZLZ1kJKM6ZCkiEAPsP95D6iBNZ5JZlm8GyOfxykweve0hIa5LOl2sOXNs0G/cfp9nzZCDk+Bn2CDl/5wonTyQ28i8ncstUxNEjZhAH5ERDit1yHCVTq3LBGQLAoxK5RUcMZWuOwXPUnRnYuc9UGMfgZyjrupQ1/31SZJIRkKI1J0Y4cJ7TIqXnxU6yH0oEbnT/9vSa/vmZdKue2f4VpwsaiS6DSCbJrKp5YYRwuWiWhRE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(31686004)(8676002)(16576012)(66946007)(6916009)(316002)(508600001)(83380400001)(36756003)(8936002)(53546011)(66476007)(66556008)(38100700002)(2906002)(6486002)(54906003)(86362001)(2616005)(4326008)(186003)(26005)(31696002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DI29yRKpE2gNl9eEZ6gz9nHVtOnvJAJ5C4FdGLMqmwaE7WmipsHPyxjpEcjD?=
 =?us-ascii?Q?/rxz+JwoZE3d7d5M671Yg/WoHUsxNQdt3ZPU5d2muF18Pe3bc0tlegK6SyXH?=
 =?us-ascii?Q?vfKsixFFPTfFWLYXwOP4YW1p560g/uPLypP5mDzwSxaOXGJctPIO7U0k/LHc?=
 =?us-ascii?Q?RDciSYOrH0OY3xUgKgvpe7uk9raMJlZvskCVDJA3v2P2YdrEE4PrN6oO+O4T?=
 =?us-ascii?Q?NT4qGd1XCqNVlqSy2UBuQx7Yz3khp4aeTmwbXwRoLZYFkbmviS/Lf7UbAGnS?=
 =?us-ascii?Q?Vq9HgoV5SpnnX2g3jWijFE0fZbP55s7L6wXWlHmoj2FT8NwE+2SN0gaHtrkE?=
 =?us-ascii?Q?JWNYbo0OTHn+9BmekZgKP+CSruOLAIMyn3H1Jhd6yLBbSgLdEBqWT3tLfISg?=
 =?us-ascii?Q?OOr0sM6tF2QQOSNohG2G5SHZIy8VyKYqLz+JR1HbOa1uI8JH+7jLSh2e4rve?=
 =?us-ascii?Q?LYzaJ3ccJY5YgyT0QT/C+6YR9Mj2rHxjBgeayDLQ/OIZG6lHk7TCupRU67Rl?=
 =?us-ascii?Q?KdylYEjynwVG/wxnUpqEZTzE8rEadQo8XDNfaVu05OSyQR7uxvOiKQeE4Uo5?=
 =?us-ascii?Q?cMtHvjAzziokv5xGJ6MFELCkM5KE1IxLr0lh9rMAyglsluWTLvsjDgrkfTKK?=
 =?us-ascii?Q?ZGwp84MYcbfqitbolgAwtc5GOGlZ3wRCj8DWTfgosaH+dkl/9ns6pP2qkQPQ?=
 =?us-ascii?Q?0aP2af9tRhBiGB9y6hbzVqPvVVRjRApGIcbDfASUUYwgoBNs4faPXE5L0FeG?=
 =?us-ascii?Q?W1ul1CLvaGyGrvHfcXPf82z1jFjrYPUzMBaPyf86eu2Y/K6fRVTiCHax3Js0?=
 =?us-ascii?Q?PZcgr2dQ5jXDLdZTU58hVqenqZYlRAwa2BlNcQu/F79WxPD0xkBdMm21anly?=
 =?us-ascii?Q?FRqdoggA6D1etnoPwS1UY+IsQF6aq6DgH6+1LYOwbEs5vivlTdQaJ0A/z7IC?=
 =?us-ascii?Q?ChGv67KgcCTgabSXExP5ABOLD1eYlHLB17QV8wLET4KXEogOk6E4Smsf28TZ?=
 =?us-ascii?Q?Ht9T2fmWLPFUQ9fjGUcrRz36fuYwXMpuVapwCudzTxg5DCRwTP3lBRkmm7Ps?=
 =?us-ascii?Q?/OApqaagd37Y6wDvcWjK8gEqWLmlLm/dUcWcelf+8LWxf547nD63NjQVVijv?=
 =?us-ascii?Q?mL8c3sUo8f0rzw0GPQDX/KHiA9YLxReeBxJJuz3HlZSeUL1Rw6mpPOBhudd9?=
 =?us-ascii?Q?GqZzAB6GSgUWbSlhwSXgUKAQzQOxENlhH5cyD1Q0LMSPVDfuBVCjCTd1wsZ6?=
 =?us-ascii?Q?g/WKxfXM0QMTfrJz6jCIK6gFCKvZwiVQ2M8EWGzaiDDu3ZzgebFpuwUDjY8V?=
 =?us-ascii?Q?5Unj4C4qG+EP88XrksRhrdB/la2ToAaOxb5uPfTCNu2fK17/oGo+Zjx6WF9V?=
 =?us-ascii?Q?MPHxZKD8GpNCEVSATJS7r/8grSydZLN98VGIQVJqCPwGW0tTn1TAMg+2nY8B?=
 =?us-ascii?Q?+0pRinYSfHpfnOA2saCKmGIF3qoDE+ZV8453Uy8mzWfGZIg+/1ky7Hi69j7y?=
 =?us-ascii?Q?aGTSHsKAL0Uz3mTWwgHUO1pWcHqUtdOji5fvPocNcTpE2qqmJhYj+WMl67/z?=
 =?us-ascii?Q?TNZCblDIOhEmHvJCaIU+lL0yL/uJwb5tbIUeHsgTNcm97SYqT0ViEEOFjvNz?=
 =?us-ascii?Q?bBDarresTwIPXbCUtlq9GKw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074684ac-65f9-4682-a292-08d9b9952734
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 15:20:51.0231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SwEoTRC5tJMUwCG/zcCl1YEwujIaZvEHwcqbZcIMDSxhDiSaMRX4vDH26fi4Faovmy07haa2pOIBQidzo+veQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 03.12.2021 14:34, Andrew Cooper wrote:
> Hello,
>=20
> Following the __ro_after_init work, I tried to complete a few pieces of
> cleanup that I'd accrued, and everything has unravelled.
>=20
> On x86, the __2M_* symbols haven't really been 2M aligned since their
> introduction, and the utter mess that was _stext starting at 1M has long
> since been cleared up.=C2=A0 Dropping the 2M prefix reveals that we have =
both
> __init_{start,begin} and identifying that lead to discovering that
>=20
> =C2=A0=C2=A0=C2=A0 /* Destroy Xen's mappings, and reuse the pages. */
> =C2=A0=C2=A0=C2=A0 if ( using_2M_mapping() )
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start =3D (unsigned long)&__2M=
_init_start,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end=C2=A0=C2=A0 =3D (unsigned =
long)&__2M_init_end;
> =C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 else
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start =3D (unsigned long)&__in=
it_begin;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end=C2=A0=C2=A0 =3D (unsigned =
long)&__init_end;
> =C2=A0=C2=A0=C2=A0 }
>=20
> is a tautology that nothing is capable of optimising.

Interesting. I would assume it wasn't always that way, but clearly it
is now.

> So I set about trying to simply both x86 and ARM down to a single sets
> of bounding variables, with a requirement that these would be expected
> to be common across all architectures.
>=20
> I'm intending to use __$FOO_{start,end} because we're semi-consistent on
> this already, and get rid of the ones such as _{s,e}$FOO because they're
> unnecessarily obscure, and complicated to read for a compound foo.
>=20
> At this point (as I haven't really started yet), I could be persuaded on
> a different naming scheme if anyone has any strong views.

Imo that scheme is fine. _{s,e}$FOO have always seemed risky in terms
of name clashes / confusion to me, but I've assumed we use them for
being pretty standard and hence recognized by certain tools.

> But that's only the start of the fun.=C2=A0 The is_kernel() predicate is
> broken (or at least problematic) because it covers the init section.=C2=
=A0

I'd say problematic. We may want to have is_active_kernel()
paralleling other is_active_...(); whether a need for is_kernel()
would then remain is to be seen.

Jan


