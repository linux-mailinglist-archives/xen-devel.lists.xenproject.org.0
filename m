Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E91864CD33B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 12:19:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284183.483376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ5x0-0005ER-95; Fri, 04 Mar 2022 11:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284183.483376; Fri, 04 Mar 2022 11:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ5x0-0005CX-5E; Fri, 04 Mar 2022 11:18:22 +0000
Received: by outflank-mailman (input) for mailman id 284183;
 Fri, 04 Mar 2022 11:18:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mKET=TP=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nQ5wy-0005CR-Qv
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 11:18:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7d00::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cacad29c-9bac-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 12:18:18 +0100 (CET)
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com (2603:10a6:10:74::22)
 by DB9PR03MB7178.eurprd03.prod.outlook.com (2603:10a6:10:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 11:18:16 +0000
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90]) by DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90%7]) with mapi id 15.20.5038.015; Fri, 4 Mar 2022
 11:18:16 +0000
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
X-Inumbo-ID: cacad29c-9bac-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtDBK/yXMyY40hETLLscQhZInGx9OCHhSNlKgESEg1n6L/TaUoSipsWlB+J/yDWPasgh6VlbPJ6P9SDCLVlsB1K9b7iIYwzVUTIPMSBt9cOfOofWDJwedOs2eUQFLYt1HePaQD0+Td5wPE4494CLf1J0R5GoN7ojxEzxxVX6PK281zW2SWkyujVHpWkauZHofEjzyHrRXvg+CjeQIQNcPtrJ9AAiLB6E/ba98hW6Jzavajd3QJjo+/8kgnN4T5rj4TH47YxXtwrqX8blanz7TMld3K4gMjPhk6HkKaFPUZ2yG2N5hxyJHCmow5Ofvg9pGcJ8izklbrquPm+LDjLtaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1UehCpKL0sUjppEIROksc1zAgP0aPVzngp56HWLTik=;
 b=WPLdJvUb5a+EJXr3d48JLwxs/iTm6BVNcyV/MSGRsybkyVwUQFIJY6h7SqjdJsBMsisRehtH9GygJHw8H9dEq/cv5Xtm7dvZM5x7bJPtkhI49J2eWDX3Z+Tn6Xaw++4FZ/pe7v4huHLObBDvYdP1WIQ7YhzayimB981u7qdSgGJ/JVjcigM6k7zJ17wLobspP8L5xPpGGdIX74nRsCvLl6KTO4VWvwjG8YVG7Y83RCRc9L1Qz4BUIF/aPUAOnlemByHhc/7T0fR2pUYjfAU9KlI1IDtUDVbj3to8m3NO+k0Z/NXIQ+WvUIhcv+swDdGiOUu3nKN4ou4pE6mag6eCCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1UehCpKL0sUjppEIROksc1zAgP0aPVzngp56HWLTik=;
 b=zc9h0Y4pRbJhIerXj/FuxdCOUt4R6mJkKHHguNyS8NDVz7E5F8WL6zWUGRLHOspui7p7LlyrqN/hFXHwS/z9wPpYO9K27ueQWHZmTa4ImxV2+Ms6jfiSZm2dktcwB5ZPuaApS1gpyjfvyO3rfXwC+LOjtpbgluduRChzDeSJv5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <3bf4cfba-4d9a-1a6c-fc93-7a5dbeac311b@santannapisa.it>
Date: Fri, 4 Mar 2022 12:18:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
In-Reply-To: <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::32) To DB7PR03MB5002.eurprd03.prod.outlook.com
 (2603:10a6:10:74::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f135452d-74a8-4a33-70c0-08d9fdd0ad85
X-MS-TrafficTypeDiagnostic: DB9PR03MB7178:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR03MB7178D1E20C896501D326F65498059@DB9PR03MB7178.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d4+6o4EP1+DQrIP3ZsCkt6jX1ympCzWAisW5kCy1cDwE2kIy08MjkdKStG5cvRtKd6eLvxfNxUj9ZEQFXZj2bJwotFCre10TaeTFVWrEQNZr1y2t3mVXeKv56mUxs9nHSmDJk+xNyr1oCOlU1Xg/dztFa95gZJIAwtQ7nemLEuGJ+ZJznjKoRNSxzdIQHHQkJc5nJRVZlyrZQVoFVgxqaYbIwt/e8BGPkv1wlfUmYW3o9R15jLBwfCMPc2Wr93gvifCUb6dgcLImOlZADACy6hbqFcpqqx2AA1PnGU35f7huo9v9pUxnh4aYgVyjElylXpIAeXkcHSEm9Pc5WvNI5S3/89PlW1hBw+3GrDBs+J7ByQUIyP0RzqWGYF0KgI74QDvEEzJi9HTKnxA080w+0pH4WXf7AZ4y5iNeRzQQBrbW3+0cAnbCOSWHb+X+d+/QrU0Sp+r9Cw7g9KCiiCwbptQpi98EfcKV2EC3pbs9VC3OgDXJtXNb6NM3T+vhwIO4ijlXva5FrX+k3c0wqRogf+ddNLGm9aI2BuQOyFgLFsMEjG9NrtWn2I29qcx7MZCTiNgWthkkSF0XAqHtg44BYLg4gKREJ1PiEq3e5iCW9nzCW5fmgZyIl/WFlROXscm3jDOcThVq6FW0h+IXX7zXUkm9Qj/1XoKlEk+Dh250GnL6kTgSoa3Xm0iaZ/zY9JliAFIK7rpPNzcFxBEqR+M6fLvCkqYSpZJ3TqmYzwa570+qt9ieD7Ml4ymES/mLlGk7w4tND9mqNxpUq8QqGXCoFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB5002.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(3480700007)(31686004)(44832011)(8936002)(83380400001)(36756003)(2906002)(2616005)(186003)(26005)(38350700002)(38100700002)(316002)(786003)(6486002)(110136005)(54906003)(52116002)(8676002)(4326008)(53546011)(31696002)(86362001)(508600001)(5660300002)(66556008)(66476007)(6512007)(66946007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG1TTS80QXl4V1plZm95Ty9yVEphb1F6NWZMODZic3d0ZW1ZR3BqMXZDeFFK?=
 =?utf-8?B?NFZrWVNsQy9Hbk5LNThFZFNzcmtKSHhGcXpsZGFpRXpBYzEwY082QlVuRVI5?=
 =?utf-8?B?TXcwVURxaXBEenpkQVJ1MEYwdUpHdzlhUTlWTnJkNHlHZVk1V0krUFhBOGZy?=
 =?utf-8?B?M0JnYVRLYkloSUVPbmYyTzEySUxmTnVlN1E2TkEzdUNKMzJERXp6cTVEVFly?=
 =?utf-8?B?OGF1bHZaK01ldkJGWmg3ZzVOL2djRC9VRTR2Sy8zNEdpL0VYMnhGOVhmNjl3?=
 =?utf-8?B?WVpkZEVaNWNsNkxTUDlObE0zdCtvaDYweXhyakIvQWRBekJjanRXMitOdlVN?=
 =?utf-8?B?cDFucWN3cEhSN3NhSzBsNXRTdFJBV1ZBYWVnSWJ0ai9rUzZFR1hLUENiUlZm?=
 =?utf-8?B?MzEwQzFlZWNFciszSlVqc1g1ZWRHdmNudHk4elhIQ3BQOWE5V3dJZzd0REUz?=
 =?utf-8?B?Qld0K1kxakNtRldkaUpjTWZ2aXprdUxkY2dQZnhxSzVQellOWE1kVTN5dWFn?=
 =?utf-8?B?Tng1T2p2ZXZweUljcE1XcWV0TnVXWEpPak4rQ1FrVFc4ZVV1TFhNaEhOSFEx?=
 =?utf-8?B?UnhjR1pmR0dNcmRqWVdpYWx4MXJtMDgxWmtnNmxtTW5xV1UrY0hCSE8wTmlT?=
 =?utf-8?B?a3pmYTdJZUwvSVZ4L1VnZkxHSWFDUkJOSzFDTTZHOU9FSDFXdGwyUVhwdGlp?=
 =?utf-8?B?UzZoYmY4M2JSaFoyL0lFMUJVWGl6UjVBNENkdUpPL1h1VFBTeFhSSFVDdXlp?=
 =?utf-8?B?dnFzMmlTbTJRR0xxZ3ViTVhXQzVUNGlrUTJKRTNRTTcvUElrRmQ5RGlDWklM?=
 =?utf-8?B?QXpvUktncnlDMEl4SHN4b1hLOVgvTmY4UUhxOU14RUFWeCt6RER6Z2JiaVVN?=
 =?utf-8?B?eUVCVVRSejBzM3BEL0J1d1dabHloRE5TY3NrMjE3bkdtcXA4S016alVLOTJ5?=
 =?utf-8?B?bTdnUVdrNnRtQXpTL293cjFLVTNzaVdqRWpaOTlLVi9xYnNCVEVZTWZ4aFBY?=
 =?utf-8?B?cHFQY3hMazRJZ1BOL3Z5V1VMcmVsOXArbkVyTVVpbzF0SC9LSDlITW9MQ2g2?=
 =?utf-8?B?NXdSaW1meXUwcXRRNDA4dlVSaW1jMUFZMUxjcmxlMHp0QnVFSDM4d1Y4b3Fl?=
 =?utf-8?B?OUh0SXlkaWhNT1A3aUZSMFVCZnpoR25kWmVEWlZsWStLcmVVTnNsampqNkdY?=
 =?utf-8?B?cExOVElzczljL3NWNkhJOFg4V0djTXl1ejNtQmdrN3pxd0ZxazkwUHg1M1V5?=
 =?utf-8?B?Y3Y1ODc1UDNzRTRlQTkydXNBSU5DSXlDNkVONUVtNkJtRktDUHVWYlYwZENY?=
 =?utf-8?B?d2ZmVkpQY1NyZ0ptMDhYS3VWVUhscmExTmV3aXA1ckYvWWY4bnV6a3lwNG5K?=
 =?utf-8?B?eWtVWW9KSWhTWTIxcmZoZHR5N0ViRFB2Z3N1YUplV1lHV0JRUTNaR283dG5n?=
 =?utf-8?B?MXlHQTVnN0xadlpMRytSQjM2bWFQRmQwNDEwd0ZFc1VzU1FYVU9IZDJwS1JS?=
 =?utf-8?B?VmFodVEwMTNwRzJnRTdUUE1xWUxyeHhpQ2c3L1JINVNidE10T1p2STY3UkRU?=
 =?utf-8?B?L1Z6QjByWGJLRjFCNmwwaE55R3Y2aXZQelkwRmYzUEpvc3ZjTkI0U3VSWjhS?=
 =?utf-8?B?VXE2aUpUR2FYWWNrdTRBcTdRcTFxaDNORExuNjBMM2djV3RSWm1mNmx4Z2M5?=
 =?utf-8?B?R0JIODB2cW92Y0k5T1JDSTEzS3U0R3czWVVjUGlyTjVtbk15bWNSSm0xRUZv?=
 =?utf-8?B?VSsyRHllcmFEdVdxTDBDeHdiVUdHK1JHWlZJMlZaNkVhUkNXOGhqdkovd2lr?=
 =?utf-8?B?QWJpckN4M0R0aFZqOVhqTFRTaDdQNjZkTlRPMVppWGd6R0VUTU9OZjhYZGc3?=
 =?utf-8?B?a2xNTjEvQWhMdnpCNzAzSTRONzNJdjkyMzFDMUNCNFUyN2lIa1dwQ0dEZytV?=
 =?utf-8?B?UWRSOVB2a05PWmlpQkdWTXB3emFtZjJjQWNNYXI3c2xxUTNyamp0ZnBWQ1ZK?=
 =?utf-8?B?bDA0UTdRUlFENnVHYkp6a0xvZnRuTi9PVWxkSU9nVWh4NFhDY284WEVtekxa?=
 =?utf-8?B?Y3NiSmNwc0lXNG12SHN5S1BXTHNoMmVHa20yYlB4aENac1pVdHNXK2o4UUdX?=
 =?utf-8?B?NTBxNE1tVURwR3o3Zm95NjBXNWZXY0ptMms2MGg2bXZaMGd2ZWh2ZTFESlFZ?=
 =?utf-8?B?RDZVN1drOXMvTktEWlBOWUcvMnhaMzBJWjE3c1BrZEpGbWpDcFZGY1p1bVIy?=
 =?utf-8?B?VDBBN3hieTRsZ1IvU0syRmVndmtFRTF5YzlTbVRKWlZ1dXZhME9KL1dzdkh2?=
 =?utf-8?B?VTVXU0xpcGgwNU1sc0J6aFdkZG16S2tVQVZDaEFvYThCL2NhTkxFUT09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: f135452d-74a8-4a33-70c0-08d9fdd0ad85
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB5002.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 11:18:16.0863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ij23qLbb/2+zk1uKPTu0LWLHi5hEtTogMTzAGrHN3520qpdMzBgYyIc0r1G8u1Rpjm7yTF6oA2qnO17TxM/00O8GMYBjPxAYA9IrCJHIhfulTbX5Mv4gpWaxXPJvdikZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7178

On 03/03/2022 19:08, Jason Andryuk wrote:
> On Thu, Mar 3, 2022 at 11:34 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>
>> On Thu, Mar 03, 2022 at 05:01:23PM +0100, Andrea Stevanato wrote:
>>> On 03/03/2022 15:54, Andrea Stevanato wrote:
>>>> Hi all,
>>>>
>>>> according to the conversation that I had with royger, aa67b97ed34  broke the driver domain support.
>>>>
>>>> What I'm trying to do is to setup networking between guests using driver domain. Therefore, the guest (driver) has been started with the following cfg.
>>>>
>>>> name    = "guest0"
>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>> memory  = 1024 vcpus   = 2
>>>> driver_domain = 1
>>>>
>>>> On guest0 I created the bridge, assigned a static IP and started the udhcpd on xenbr0 interface.
>>>> While the second guest has been started with the following cfg:
>>>>
>>>> name    = "guest1"
>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>> memory  = 1024 vcpus   = 2
>>>> vcpus   = 2
>>>> vif = [ 'bridge=xenbr0, backend=guest0' ]
>>>>
>>>> Follows the result of strace xl devd:
>>>>
>>>> # strace xl devd
>>>> execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) = 0
> 
>>>> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
>>>> write(2, "libxl: ", 7libxl: )                  = 7
>>>> write(2, "error: ", 7error: )                  = 7
>>>> write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
>>>> write(2, "\n", 1
>>>> )                       = 1
>>>> clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xffff9ee7a0e0) = 814
>>>> wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 814
>>>> --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=814, si_uid=0, si_status=0, si_utime=2, si_stime=2} ---
> 
> xl devd is daemonizing, but strace is only following the first
> process.  Use `strace xl devd -F` to prevent the daemonizing (or
> `strace -f xl devd` to follow children).
> 
>>>> close(6)                                = 0
>>>> close(5)                                = 0
>>>> munmap(0xffff9f45f000, 4096)            = 0
>>>> close(7)                                = 0
>>>> close(10)                               = 0
>>>> close(9)                                = 0
>>>> close(8)                                = 0
>>>> close(11)                               = 0
>>>> close(3)                                = 0
>>>> close(4)                                = 0
>>>> exit_group(0)                           = ?
>>>> +++ exited with 0 +++
>>>>
>>>> royger told me that it is a BUG and not an issue with my setup. Therefore here I am.
>>
>> Just a bit more context: AFAICT the calls to libxl_cpu_bitmap_alloc in
>> parse_global_config will prevent xl from being usable on anything
>> different than the control domain (due to sysctl only available to
>> privileged domains). This is an issue for 'xl devd', as it won't
>> start anymore.
> 
> These look non-fatal at first glance?
> 
> Regards,
> Jason

Well, actually, this prevents me to be able to create network driver 
domains for inter-guests networking (no passthrough is required since 
they do not need to reach outside).

Cheers,
Andrea

