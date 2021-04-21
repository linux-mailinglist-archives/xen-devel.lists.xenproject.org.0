Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2266D366804
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114197.217524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9CZ-0000ip-35; Wed, 21 Apr 2021 09:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114197.217524; Wed, 21 Apr 2021 09:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9CY-0000iP-W6; Wed, 21 Apr 2021 09:31:18 +0000
Received: by outflank-mailman (input) for mailman id 114197;
 Wed, 21 Apr 2021 09:31:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48UE=JS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZ9CX-0000iI-5X
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:31:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d418b3a9-16f8-465d-91b7-0a98fe979f14;
 Wed, 21 Apr 2021 09:31:15 +0000 (UTC)
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
X-Inumbo-ID: d418b3a9-16f8-465d-91b7-0a98fe979f14
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618997476;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hlenLFad7zbduuqC3F+yEmKP04jIPZvGH9Z09FZic8Y=;
  b=KfdvGCsXvbiLwaR55UkuaH+O4mGYudXOk/w/Sh33DUdiGPzWy/2AYwF+
   7hHdrMLlHQ9tKDkuASRrNE77CgyyyYPz0I+KBUR87J6fd3A8aF6YRYDgE
   oi+U3SP5WEXJTLqiHz2bpNCr/0wqcO+p0ygIKBcVnfH13lcfG2fcLYnel
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LwsSziyUkoU1/CNyX2g8Y5PPZjwNKvNJbmci1I+DVAMTjXQs/clfWTNuYxZ6yxGO8cQMuiq8CK
 enq/4zvzmfL7+oHoKWvKnr4E5U8p9SEk69tp2vrP3cT2/yG4xUWmTkkRXODWUmPkZJo4m0i3WO
 ytDswbeeB/h/rNUbMgfBnP+wV5mdOZnpvOhoAxqOHliuATvIUpdjbDWc+lugUNNVjwJ5tGkTxF
 /N1ujhrdYnBH41Eu0ohYxWA+rs1FO1Ovhm1tmMA9gsMWRFRpSSb6V4hcaMP5eRJbBctqHRYnwQ
 isc=
X-SBRS: 5.2
X-MesageID: 43549775
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:L2VD360ZUwPi7DGlkMlAowqjBeF2eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/BIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmdJ1/Z
 xLN5JzANiYNzRHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcFdxi1SYzzrdXFebg9AGJY/Cd
 647s1IuzKvdR0sH7qGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnm4j41VTRTzbA+tV
 XUigCR3NTej9iX6D/5k1XS4ZNfhcf7xrJ4ZfCkp8AJJlzX+32VTat7XbnqhkFNnMiO7xIQnM
 DIs1McOa1Img7sV0WUhTeo5AX6yjYp7BbZuC2lqF/uu9bwSj5/K+cpv/MgTjLj50AtvM5x3c
 twtgrz3fcnbmKj7VDAzuPFWB1wmk2/rWBKq590s1VlXZYDc7gUlIQD/SpuYeQ9NRjn44MqGv
 QGNrC42N9qdzqhHhTkl1V0zMfpdno+GQrueDl5huWllxJSnHx/0nICwt0eknoq5PsGOul5zt
 WBHaJymL5USMgKKYp7GecaWMOyTlfAWBTWLQupUBXaPZBCHl+IkoXw6rku/u2mEaZ4hKcaqd
 Dkahd1pGQyc0XhBYmn24BKyAnERCGYUS72ws9TypBlstTHNfrWGBzGbGprv9qrov0ZDMGece
 20IohqD/jqKnarMZpV3iXlMqMibEU2YYkwgJIWSliOqsXEJsnBrerAasveI7LrDHINRn7/OH
 0eRzL+Tf8wrHyDazvdulz8Snntckvw8dZbC67B5dUez4ALK8liqQ4QpVOl5tyaCDFLv6AsFX
 EOZ4/Po+eeny2b7GzI52JmNl52FUBO+ojtVHtMuEsrPirPAPA+kuTaXVoX8GqMJxd5Qc+TOh
 VYvU5L9aW+KIHV4SgjDtmgI1+Llnd7ngPSc74s3om4oev1cJIxCZgrHIZrEx/QKhBzkQF27E
 BOdREDXU2aMj/1k62qgNg1CYjkBppBqTbuBfQRhWPUtE2aq81qbGAcRSSSXcmehhtrYSFViF
 13+6o2m6GBhj6rFGs6jI0DQRlxQVXSJIgDIBWOZY1SlLyuUhp3V322iTuTjAx2RnDn7HwIhm
 vqLTSdfNbCBlY1gAEB7o/atHdPMkmNdUN5bX539alwD37PtHpI3eiXXaaryGeKZlwewuYSDS
 HdbVIpU3ZT7uHy8CTQtCeJFH0gyJlrBODbAbg5W5z423+mKuSz5O07Ns4R2KwgGMHls+cNX+
 7aRhScKyngDfg1nyaPoGw+BSVyoH44sP/h1RH/9lKk1HonDfe6GiU8e5grZ/Wnq0T0TfeB15
 t0ye8vteyrK2Prd5qoz7rUYzMrEGKZnUeGC8UT7bZasqI5uOEtQ931UT7U2GpG2xt7BsHuj0
 8aSLl65reEGoIHRb1lRwtpun4S0PKIJw8XlyazJMkUV1QklWXaMNOE+KCgk8tjPmSx4C/LfW
 CC+Chc9crfVySN1bQmG7s9SF4mH3QU2TBHxqe+bIXeBwWhSvFb8He7OnG7dqVBSKLtI8RYkj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9w+cMIyPKTPJPe5D6NqhP1uQxoOs/c6olT/yDR+2cV4Ri4
 EAVUseaK14+3cfpbxy9ii5UarspE0513NY/DF8j1bonrGc312zJzANDSTpxrNMXTdSNXCUjc
 PKtcigvU6NkQRt6N3kD0dfftZHBt4KaJP4Rh0ec/QtgA==
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="43549775"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKybdlz3vsycOZWcH2A4G06fpCkM88f8pcKWTHjheUHivt72NANCNQozg0ct489lXP6JzdCWYDkUGNyvA+tj/KhqOXvkO9DNmPk8PxOjBNd20wErxtsqsHOzRngaumBrGZaPxM1nWrWBo9MzCSDTw0gsMQbAkrD4htbDvKTV/18ErDKKzgfN1Zsj7CnpmCiGMiidqOYQRz+kGfPI1VwT/VEsa3Gb3qhxBWZgKGxSFlgSjq1tDY0hLQ+o//Qfv8C9KLakqM3kA+nCnanSR8IOp2mKDPDOj8cZ62QQDtMsuAzftkKUK8fIMCKkfIcIHRKM4y7Ks4zp9rd0jBuNGAwf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RipYjB2SRUyM7viTfq3X00zVF6ZE3ScMiferjJaZl0o=;
 b=TzW2IdtMnCIxUpX7THAnSWkidAEIFx15pMsWgt5tzqaZ25+rwd09i+ENvHj6zyNKkLtKwGA3OcsqIRgEnV1au27iJ+ftpOoYcjgti6Fv1M7mBAnEZowACOlBPCD6MBnedxvOBQH773XvlDN/wgNEMx/e6/mXw1SffQpQVJQzw0SXphSHp1Azq6Xwzf9RvMb5y5saVmL5JRt0hIKsERbeH+M8aa8vpXWUxmWEJzesawFbMqoUeUVAfQw3fI9ciBt28WvE4gON93X0Nrix/QSGFI6Z9TGg2w3EunX6j4YLBcfoUJIeFRByI+W6OBRubr1fCNxoc7R00LYeoz3qL5k//Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RipYjB2SRUyM7viTfq3X00zVF6ZE3ScMiferjJaZl0o=;
 b=VsTrMgNaTKRKxM6r4M0NTTaouCef/V60gSrnfX1WxUY/4vbiLoYLUkKVEJeObNvJwFD9mYZCp1EI2KTzlxbjsXmHdyBirCmZTHB/4ue63yXbky1NJpqP+yIx+UmhRSYwzqPZZBHbQ8sp+5uwWarDN9XyN7eG7QSTQUpsdVg8REk=
Subject: Re: [PATCH 0/7] xen: Switch to using -Og for debug builds
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Juergen
 Gross" <jgross@suse.com>, Tim Deegan <tim@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
 <9e8e116a-f4c3-e6bf-edee-d48e76a3d005@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b6b313d5-fd24-b1b8-afe9-0801825565f2@citrix.com>
Date: Wed, 21 Apr 2021 10:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <9e8e116a-f4c3-e6bf-edee-d48e76a3d005@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0429.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b70abd52-aa7f-4edd-bd5c-08d904a8341e
X-MS-TrafficTypeDiagnostic: BYAPR03MB3990:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB39903EF42A35BBD6571361E8BA479@BYAPR03MB3990.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1TxS0mvSheFXZsnzCcwgyMgn5JZNBJf3B9uIXYq/zPsDL4LGKp88fveCPLx42KicvoX6lKsjCrT9MvWGn2/Oeg1VEpdKnQtK3EYMtFAR40piFUqZk1WOHMUYz1lZ5M/fcxpJqTGmc2RChelGE2dMy2eEw8mZjCo5n7QFJU4hiJbC/rcug47xZo6pjAK9TPNK9U3K25WMdRI4bcXx4ml/0iWAGPrI6geGgwFaZ5uzDkMNXghi6qsMIrBBKOu0b+KdBB4lv7OfP3kJEHJUvGpLDMy8gprVd7cn3NA9Sja9jChezYeS1av/rZfmtq0dWPT2zVatetKEuvVinuZpRO1QYd8095e/FA3xHV0PWCMySZopbnZz+WkLUqTJf7svkf3hBIMhDBQ5jcTscUItBl4UDa4+AYOMdoSUnoBgazX9fLAKhCm9kdMUS7c41GUqxfg4wgCLL34T6g1mEwYmmlEm0+GXT+z/m2RKtEMYLHVI/FCrEywmdbXN2Ef6XFT4wsDPR37PgllNVZep9IbBUtk2rb27Sml8zwrDQmQ02FW3dCJ3Djiy16Rd1+N4bkrhb4nwG3hJwGiqb99UyxLic3syrc9shvedWsaMl/rJmg8wwkZ51TDrY0uB9R0L0o6b01040PremU94wSw6Hqij3LNzT2eJVY52rr72p/SqCPqDSnlcRW3cQnMplhBGo+I6TQt6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(38100700002)(31686004)(83380400001)(86362001)(8936002)(66476007)(66946007)(66556008)(16576012)(36756003)(6666004)(2616005)(956004)(6916009)(316002)(8676002)(53546011)(5660300002)(4326008)(54906003)(26005)(478600001)(6486002)(31696002)(186003)(16526019)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEhxSlM1S1k3SjNzcUNhK0FabWRQNDhxL29xa1NibXZHeUxCS3B4RHZFOUR1?=
 =?utf-8?B?WlIxTzJZai8yaHM3c084UFB5S1lzQ3YyOTg3UVlUVDMwczVRSUlCa3E1UzVi?=
 =?utf-8?B?M3NOSHVyYy9jNTEwbFpOekUwVHIxVFFjUkFNTGplMTZNM04wM2NyTVhNRXc1?=
 =?utf-8?B?eWVJZ1l5ZW1pTFlMZ0lBeHJQU010ZUJZekRqTTh1MmIyVVhRNkw0Y2doK0tw?=
 =?utf-8?B?OTR1T0ZCUkdKeVJWUllsUWlRTVgzWERyLzB1a2ZMeGVmY2hsWmlUNzhaQ3Aw?=
 =?utf-8?B?V29UMThkRmNEclU0OW5teW1SbkpJVm50Qjl4cWJoeFo2UmRuMlJlWHVLSk5V?=
 =?utf-8?B?b3ZCTUdiaTVMaGJsSGRWZFpJc2dMOXZVNGtyaTVHNE54ZW0ydVh1TXQ5dTlQ?=
 =?utf-8?B?a2dWUmxSSXFZSTdRVUpxMHVLUURvckxvbzc2VFdITjZ3eXozdExiRWlXYjU3?=
 =?utf-8?B?SHBRZzZFMFNyLzVOQ2wwaS91SHI2TUZMWnFDRnV1bHlUUkZNNVlOTG5rSVJQ?=
 =?utf-8?B?R2tuekgxTUVGUjN4NG1MR2FHZWVpVm5HREhnVm1uUDlOVTVTVm5yVEtXZS93?=
 =?utf-8?B?ZExZM0Z2VzdDWS9iUWlaTmRGQlVDVXhBbjRhQk41VXp2N3JSaDFxU3FLQlYy?=
 =?utf-8?B?NFF1ekdWOHRFdFZTZ0hzL3VocisrMDdxdnl6V2dtWVR2cWxkQXR1REF0VlQ2?=
 =?utf-8?B?TDk1M3ZMNVM0V3JJNVRuNjNEZU1idFlLM202WGxqOGV1NG9VUGlyQ2VkQXdp?=
 =?utf-8?B?dThkWVJzM2l5T2luYmFwZWV1R1hMNHU5TDRsdGZHV2FkVGkwV0hzTTUxbm5E?=
 =?utf-8?B?ckNWdDJJZWc2Um1qOGpHUXYzWVFvUSsyVEZGY0xXdkZRTHU3Sm1sb01XbGMw?=
 =?utf-8?B?b0FybHgvcmk1U3U4dGFMTDAxZ00rYWVObW95UkY3U08vZWxyTnJxSUZmdlhn?=
 =?utf-8?B?aGx3UHNub01kL3BzU2luTjcyd0wyc2d1U0JsTEhBdTlYS1FyUXh6MzNrWlB5?=
 =?utf-8?B?NUdldHRRRGk0U01FMC9ZdDdjT3hHZkR5blgyaG82S1ZoUVBEeFdDMkFDOHZU?=
 =?utf-8?B?UGYzQmxZQU4zR0RJN2ZDc0xlbGc0Zit2dXNLZE9ORUxWTUtpSkpPbDRZMG1B?=
 =?utf-8?B?Q2VxTE9UZWVNaXV3cDI5eG41SC9LVGVFNDE5cXlNQU05ZHFSWXhOWXNYWktl?=
 =?utf-8?B?TGFKVHNMbGs1YWRmMGNUSG5JTldraDlHaEY3ZjRPYkdmNlorYzlCL3dQWndv?=
 =?utf-8?B?cjlnMlRiSTJ1WE1aNXV5MXFhN3Z0U2NzNFVnTFVjRmRUWUlFcnhRVng4YU5K?=
 =?utf-8?B?UWdDanpTMDVNbnM4OC9SdE8vblNZQUFBbDRFSnM4alJEZEIrY3pubGpqeC80?=
 =?utf-8?B?KzBNMVVoMmhFK2dsTm1VSUZYYVY1OHlvMjJOSThaTFFacHUxcEIwNXZnUC9o?=
 =?utf-8?B?cDE4NzF1b2c5RFYvVW1oV0xaR1ZjMkZ0UEFoS2ViYkdjVEhHRlRNTTBSL1FF?=
 =?utf-8?B?aE5qQzVrSkJWSUQ4WHBFNUo1UC8zUmhPWnBBc1V6eXZDVWRjSzVYSnhzd05l?=
 =?utf-8?B?MHJwMm5jUlhHWjZvRWUxT29yLzZad05uaGN5N2M5STc0eXBjSy9mVTF0QzIv?=
 =?utf-8?B?OGZlTEtMUG5yRXJEc01ORFJML2hLUnNKdHE2SG9Xc2NuaERyOERWVUgwSUph?=
 =?utf-8?B?Zk5Jako1VHNMMllvWFlncWtpSUNtTS9CRzh5S2YyOEFvc21YcFJnNjU5VWxk?=
 =?utf-8?Q?f0LbUSCNpp1kpt1X55Z/RnE5Q3nusjwxpSWFyWc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b70abd52-aa7f-4edd-bd5c-08d904a8341e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 09:31:12.6751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rG6zb8dRvz62juH1qxaXv0wPLcpyFcnfnIk+FUGIVrisf11uwyQxXnCxRT8ZyUuvaApqsEm1d4r8RFBEQTLFC8fBtO9efkYNEm6JicGkAig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3990
X-OriginatorOrg: citrix.com

On 19/04/2021 16:45, Jan Beulich wrote:
> On 19.04.2021 16:01, Andrew Cooper wrote:
>> As with the toolstack side, we ought to use -Og for debug builds.
>>
>> All fixes are trivial.  The first 3 are understandable, given reduced
>> optimisations.  The next 3 are, AFAICT, bogus diagnostics.
>>
>> Andrew Cooper (7):
>>   xen/arm: Make make_cpus_node() compile at -Og
>>   x86/shim: Fix compilation at -Og
>>   x86/sysctl: Make arch_do_sysctl() compile at -Og
>>   x86/irq: Make create_irq() compile at -Og
>>   xen/efi: Make efi_start() compile at -Og
>>   x86/shadow: Make _shadow_prealloc() compile at -Og
>>   xen: Use -Og for debug builds when available
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> I'd like to ask though that at least for the bogus warnings you
> amend the commit messages with the gcc version these were observed
> with. Perhaps even those seemingly bogus initializers would
> benefit from a very brief comment (or else there's a fair chance
> of them getting removed again at some point).

I'm afraid I don't have that information easily to hand, but all issues
were found by distro-provided compilers included in our Gitlab
infrastructure.

~Andrew

