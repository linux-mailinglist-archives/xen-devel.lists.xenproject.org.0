Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED179A76D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 12:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599275.934613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeT4-0003ee-H7; Mon, 11 Sep 2023 10:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599275.934613; Mon, 11 Sep 2023 10:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeT4-0003c5-E9; Mon, 11 Sep 2023 10:48:34 +0000
Received: by outflank-mailman (input) for mailman id 599275;
 Mon, 11 Sep 2023 10:48:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfeT2-0003bx-Qy
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 10:48:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf76d921-5090-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 12:48:31 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by VI1PR04MB9905.eurprd04.prod.outlook.com (2603:10a6:800:1df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 10:48:27 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 10:48:27 +0000
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
X-Inumbo-ID: bf76d921-5090-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOhOWype7y3F1105NJS19bNhL7esp+ljOpo81WKx6yzaPan9MDsIpZ8d8ImSzG0Us+Qu2E0DcvxQagtmYqkhibzlxVXm1A+afTR2CByQtmVGZGeL+FR4+46dTu4D6QEGgy8zcSF30iMpkaKiBKNhHsiMftdvxtIt/JJZtezCLEy9Kxwj9udvikWt8IDtk62B128L4Vxvi3MsAjiVc7YKUezXI/Z2yE0lkcoHMfcBHTed6LjjmoRrjMk4Sx6+SzNUsNRoYKs/pIm3ZYqdH+yL66m9Gb/IWcK5ABQn3xgkwFEy4Tzbtn4JJJywuehYjgpWVAPpTbmrC1vhQ8no0poTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/w+leVuEfX5h8jMcwELkPfIDAzTIARjralDssZEDIY=;
 b=H/p9eZUHgLbXzYfDB8XmqDhZpN/wWTPKcMXre6WQW11sxkBwhLVbNPXBoBFfqbaBu5cd0DOHCd4Nx67nF84pBwNoaOL1xL3rhzuCoOhUyOz0FiipCsa578tT6JuG3W1/sU7d9mQ23N9TIkEVRtSm2l939C31j/5gKKRAecZgPR/1H313CUXekwi2vxI1kuJjqUCT0BIWSce2+zK/hZ16lDMVwadEhGVU5t5oxoWfVDql7tXtYbLIHvrukAp9mrfr6zmYGNZMZ8gP2ED2vCAPtD+VFTWVNh7lZEauHe8L0UUuGXuBRxFSZCmOnKfmtcSZXuKbHOqObD7NIeCnl671gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/w+leVuEfX5h8jMcwELkPfIDAzTIARjralDssZEDIY=;
 b=wzs9oEQEc4W8FuL0OQa25pFpOuhxfTAU8mQQdTQPAjkwtKK6jDN4HGOoa2lQ9OrqyIHdz7rB6Cf0jAmoflVFrMGpxIR4We484M3MGRUgUI+9IFP/lW6tBMu/MtVdtCCpElZOUhLE9ytNwSnkOvSc2CaJXFge9UXlZBvzGa2oEcNlKExRu2V6YK636+erMZqPDp0YaI/q01X8V/we08B+kGbXNUFcllajox/ZwBMsZ/u2fNfwFC0KL/tZZkzAz3LUeM3w26xsWR8UbiTEd1P86SYaMiqoh4wc4w4Bzl86yoYKkSwfMYwVucAdZXoh7KEw4b1QJ26SbbiOcMYptpIhjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a19aef4-8bd6-ef8e-de4b-b85135dc7ea4@suse.com>
Date: Mon, 11 Sep 2023 12:48:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries marked as unusable when
 parsing MADT
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20230911101238.18005-1-simon@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230911101238.18005-1-simon@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::12) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|VI1PR04MB9905:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bff5d1d-eb4c-4cbb-3fb3-08dbb2b4a131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b5ATL+/FLi6femkyBzz46eBZZato05RQIBfibSWl/WV97g01pKf34n8XoDSBsoGhbwV7a+6cHRmZ7X9Pwsn7Wz3F+gKbfn9jt8xgxVgU6BLP65DRccQp4afirFJHDBFt6paASrkOlYH2VCTtLiE5bErEuzPTVGRr933+F/dmiIZU65YAykJOFcyJ3VCLa2XWoTtuXVQpVsWtCmvdHyIi6MFerfhRq2QcmOAQbu+OQtd0rhVxV+wmAlMMvuR+XHmjhJAkB6e1iwjK9HH6U9tqkNWB50rbXYglpi89qRQuYr/jZqULAqWsxKKzcThJj1p8iUARTQm/zOaWEv3Q6rzzAkeU/L9aFprLl6imyffkaF78xcoLzftK2pkAiosvytFY4Eyof3bxKEzZjKWm7j6JhMItBvWgAkfe8Clyo4VaLhICtXmXAcjp16OzqwUpieuqppzmn/S0aPpWIlz6G8rmHIJWXf5j0L0LFCW9p1rDFRno1S7/dnciNkhcTZY02Di8UjMKPGOscpwF67eGzrgE/6g/0W5j/jqLEB+EUZ9Ozlz/njw6iAz3MN8NyCC5+XtNLSxEFtwF9GJq139C/BRVjZMjKIHC9TWSU536TGFqAOMudhMACN05p9qHB4UXQFGRQGFoP6iSYZ2kftx98xyI7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(39850400004)(136003)(366004)(451199024)(186009)(1800799009)(2616005)(6512007)(6486002)(53546011)(6506007)(26005)(86362001)(38100700002)(31696002)(4326008)(41300700001)(8676002)(8936002)(2906002)(36756003)(66946007)(66476007)(316002)(5660300002)(54906003)(6916009)(66556008)(478600001)(966005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFJYcEZ0YWpqRjBrRVI0b1plKzBNRTNSV3FYOHNwWW1MK0YrWEJiLytvZk9a?=
 =?utf-8?B?Yi9QWmJzTTRVQVl5OGpJdDJSb282ZkoxNktxN2V0MEhENVFPUENCM3pwWUtH?=
 =?utf-8?B?emFKTGpBbEo4L0lsUW9Zd1hhcW5kbGJPVjNrRFRkTmFtWDJDcjF4Njh5LzFP?=
 =?utf-8?B?WFJHR1kvY3p0N0ROSWVPenFsQTRlZTFpd3ZnZ3VvYVIzQVhjWmtYM2F3Rjln?=
 =?utf-8?B?M0RIby9ScWNzWm9KaTl6djljYmZ5azV2T3ptZmNZaFNiZHFreUZNVStFUHkr?=
 =?utf-8?B?MlVMdzRCWXR3ZE5OQitUT3NVOVJ5MGNjUjIwOXlkaDVzQXB5VWtQYlJpMXhC?=
 =?utf-8?B?UElQMWRPQkhjbE9BMUQ0Um8zSHl3U1E3QituOHZBNlYwMlc4Q0dqMEIweDky?=
 =?utf-8?B?N1d6L3lwMFJmdGJJelIyRXNldHVBTnZHVWJodHI1TCtsalBjT1ZkcjFGVHBM?=
 =?utf-8?B?SGxwTGM0L0xPeGdlWjV1cjBrTTZIMUlXcmxwNWovN1o5WGYrV0VTZjNjQWl4?=
 =?utf-8?B?djJ4L3liMnprWE5tdEhhcGkwbjh3cUt2aGorbERFOGE4TGxObk1NMThDOGNt?=
 =?utf-8?B?TXErVHI0aDRVYXdMMnovRHMvcWtDQ1JRSGdtbGs5N1VUMUV2WXhjd1RPeVFu?=
 =?utf-8?B?dDZJMk5oVXlHTUszWU8zMktIQm9TakJ0U0o5cFFnRlNHMGd5V3E4cGVPYjhl?=
 =?utf-8?B?ZlpoZ3RjMDlpR09HM1FUM05zRzJqK2JDdEJvYzdhRXI4RHpiYzFINFRKTENl?=
 =?utf-8?B?dmxWaGlEQlJON01RRk52Mm0rMjkzS3dpUVB3U1RGVGVxMFcwQVQ1WUtGb0dG?=
 =?utf-8?B?V3l1SGQ0NVV5T1JQOUpYQ0laZ2QxTmZ3RGlySU9YT1ZBdlJBZmZxVklnQTdx?=
 =?utf-8?B?MGlVNXFJdEdyMllLODQzYXlDa3ljL1IwL1o3a25kbDUwQzVSRWpPeVlDN1pH?=
 =?utf-8?B?em5yY21YcG1FMzY2VEROWXNHM1ZPL3hwc0UrM29yTktsbEE1cUtoVG9FOHhK?=
 =?utf-8?B?dHgvU2gvK3FPa0FYQktETS9GNTA3aytZdWJ1ay8xbWpscTdGQkh2c2RMUVQw?=
 =?utf-8?B?KzNnSmxzRmlUYnZhMkJOdUc5YlZSOUV3dUY1VVhUYnZOZ3NqL2lucDY2am1B?=
 =?utf-8?B?bkNwVGZZTmNTalVMT1ZmTHF4ckoxRTVZY2dPbXRpYUxnM0NVazhLZUFrTkI5?=
 =?utf-8?B?NGxCbzl2a0diMHpsVzRVSk56a3JaajlRRXFxNlY1MjlMOWsxbUJNa295RUR6?=
 =?utf-8?B?aGxscExCamcyVHFMMStpb3J1K1hFM1AxNWhlUEswUUtNYkp4TmhtWnBjVEE1?=
 =?utf-8?B?dDU1UGhoN05EaUNyejNNM1J1Uk1FMTlWSm9KanFQVDFtZVVsOTRmRlJja0wz?=
 =?utf-8?B?NyttQjRkbUhCMU9HcVQyRXdJdXhmeEVPV1JvNzVFVHNsaEY5QmhSMFNwczE5?=
 =?utf-8?B?VUduOWlDekQydkllRmdNbjducW9QNXh4WU96Q3dJSlFNYUZ6L01JbzBUdGF6?=
 =?utf-8?B?dE1hbGRNalZHcXFoSlR4ZlRtZTJ2blJzeXZVMDQzRzZlTENwdGJGQU5DMTFS?=
 =?utf-8?B?MVBGb1Q2aW1sL2JueklFa245bDFRbEx4Z2NubTRTU3VJRzZjNEJ5V1ZBZVlK?=
 =?utf-8?B?UmVORzNVeTU5QWdKQjBVYXFnS3d5T2pvVXhHd2dPcERVQ2NSOW1WaDRHZTFX?=
 =?utf-8?B?WDlrZmpja2dwK3NzV1dSRnZuem9ZbTBSczJ6RFRTNS9PeVpHTmtja1NHeVla?=
 =?utf-8?B?ZzVGdzA0S2xEMzgzaHVLd1U2bzIrUC9CMWdEcjcwYXVFaG1CMlhpZmdDd0pl?=
 =?utf-8?B?WWJ6dUYyNUZMT3lnU3hWSXh3SW5kcTVJMHBJUGNiVmEyelRFWkF3SHBmUVdw?=
 =?utf-8?B?MU91Z2RJQmd2ak8wYmZPSTh5Wndza0t2SnhZZ05zZlVJanlQQWxKcWR1a2NG?=
 =?utf-8?B?OUUxbTdjM0g5UlBISjNwN1R0TjFWWk91dXF3Wk9FOGkyS0ZLYXlrK0k4Ry8w?=
 =?utf-8?B?QkM5QWVUY2VqbEMwTmVpdnZSN2ZLNTdnbCtYOWxib3cwcGt0Nm1WVStZdE01?=
 =?utf-8?B?SlJiME92RkUwbmplUy9qTkU3QzhyaWJRUVRJcm9xSmF4S2ovb0dTelc2V25q?=
 =?utf-8?Q?4mHfDVYen8OH0vW1l8JtTWyeP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bff5d1d-eb4c-4cbb-3fb3-08dbb2b4a131
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 10:48:27.2803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpQak93jaqNFPOh+KXFNGvXeXFFYKtohogXnzoBRYLwrfW3gFIJPlXx8IzsrYhZ+DrcOG5o4Cee1CNlqrQA0hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9905

On 11.09.2023 12:12, Simon Gaiser wrote:
> Up to version 6.2 Errata B [2] the ACPI spec only defines
> ACPI_MADT_ENABLE as:
> 
>     If zero, this processor is unusable, and the operating system
>     support will not attempt to use it.
> 
> The bit that later will be ACPI_MADT_ONLINE_CAPABLE is reserved with
> "Must be zero".
> 
> Version 6.3 [3] then adds ACPI_MADT_ONLINE_CAPABLE and changes the
> meaning of ACPI_MADT_ENABLE:
> 
>     Enabled
>         If this bit is set the processor is ready for use. If this bit
>         is clear and the Online Capable bit is set, system hardware
>         supports enabling this processor during OS runtime. If this bit
>         is clear and the Online Capable bit is also clear, this
>         processor is unusable, and OSPM shall ignore the contents of the
>         Processor Local APIC Structure.
> 
>     Online Capbable
>         The information conveyed by this bit depends on the value of the
>         Enabled bit. If the Enabled bit is set, this bit is reserved and
>         must be zero. Otherwise, if this this bit is set, system
>         hardware supports enabling this processor during OS runtime.
> 
> So with conforming firmwares it should be safe to simply ignore the
> entry if !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE
> 
> As a precaution against buggy firmwares this change, like Linux [4],
> ignores ACPI_MADT_ONLINE_CAPABLE completely if MADT revision < 5. Note
> that the MADT revision was already increased to 5 with spec version 6.2
> Errata A [1], so before introducing the online capable flag. But it
> wasn't changed for the new flag, so this is the best we can do here.
> 
> For previous discussion see thread [5].
> 
> Link: http://www.uefi.org/sites/default/files/resources/ACPI%206_2_A_Sept29.pdf # [1]
> Link: https://uefi.org/sites/default/files/resources/ACPI_6_2_B_final_Jan30.pdf # [2]
> Link: https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf # [3]
> Link: https://git.kernel.org/torvalds/c/e2869bd7af608c343988429ceb1c2fe99644a01f # [4]
> Link: https://lore.kernel.org/xen-devel/80bae614-052e-0f90-cf13-0e5e4ed1a5cd@invisiblethingslab.com/ # [5]
> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>

Just to avoid misunderstandings: This change addresses a comment from
Andrew. I does not attempt to address my feedback on the earlier change,
which - as indicated - I intend to revert (timeline extended until mid
of the week), unless by then my earlier comments are addressed or the
suggested possible alternative is carried out.

I think it goes without saying that this patch can't sensibly go in
until the earlier one was properly settled upon. In particular, in case
of reverting aiui this patch won't even apply anymore.

Jan

