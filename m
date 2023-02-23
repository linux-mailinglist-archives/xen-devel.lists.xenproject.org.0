Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB96A0752
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 12:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500263.771565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9im-0003Eq-43; Thu, 23 Feb 2023 11:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500263.771565; Thu, 23 Feb 2023 11:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9im-0003Ck-14; Thu, 23 Feb 2023 11:25:08 +0000
Received: by outflank-mailman (input) for mailman id 500263;
 Thu, 23 Feb 2023 11:25:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pV9ik-0002az-BX
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 11:25:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b86e638d-b36c-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 12:25:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8492.eurprd04.prod.outlook.com (2603:10a6:102:201::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 11:25:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 11:25:03 +0000
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
X-Inumbo-ID: b86e638d-b36c-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Exg0LGZCs/rLy0Owm9s7gmyb81ps6fT0pQPiNVHd26foGC72yfc0hmMd7D76E87bbQCOjgmfP9o2cBQZe3qptCIG9QGuH9T10HIOWb0JWLLTumFIxYogL2uhkXNtoju/84M8bpzVoZzDrOIK3QF6lImLrXdyIUH7MCb+vch4HPRVuDeAG2TKAWYtLjPdkOZoLij7xdiYtns0GTQvwuFipUkX1HUKE82V2uuhzUFU42Npysu61kXdDB0Ee568G5nn6ORNvynIK1n/J2xu4pjT1BdpG42KHoJu/4vLwPm2GbuLn8afWLUpwBx6UHjlPJya+CDrO2RVn+LY+t9V8SXEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFbEDBNuceqVR8BcrfBX8HNACPcYk7t27K+zfkn9BXo=;
 b=FNCwr3+LNUy+eVczjPjiV0GDhNt8lx5Va6Lgjebxo7sWOt+V7d6qEFRw4A9YVxhXT6Bgv2FqJDqEaFu8FHN7ExRNnfWVdXFDuKH0GRYE2X4p6FtPskWxlxrg5BHJt4jCIIRpjMI6uG967zM4yATqGYhXu3tOxvNkd04c/KbtGQtoN3tFGYneJGPP85J8Gx0chMiePWVvkIArzbxRALceznBnzatQWBfmG8RagG3wlHus10fw5dDh51Z3bdYE0B7jjpo8Yz71R/Igm4k/qfe+jwBxNEoufX3eDoxmGMw2cNgI33MSjOtkIbxqoBEcfdfu5cw4RJiAc83GCjFWjue6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFbEDBNuceqVR8BcrfBX8HNACPcYk7t27K+zfkn9BXo=;
 b=OjYMSmdPm9vlQ88qSknMVfAQgqUsfT0M8Db/PPm2v8kDiElxYxrd0bfe0yjucm7OIvTux6LcYhqlsoBc5wAS97ysdlNJv2qxQwD7ifWwSNNUj3IDEiQpeoYh2C1U9irtlK59n1wKvG7If0hkhlGLS6jopB7lgC7C51Txs2PXpxu8beFuLHGP0PT0v4jhjFK3bo1nAOIwuBrWzcTDBZDvgNi/Br6fJDkEum/GnOc3EumDHDZ9uv0CEy2MibaZhIgByUTeD6Jv1fcP2GxpjJf/aeilni1OGRKw6iCcZMh7FnQjzsy3MmTPRT14lW1ZGpkd1nYdjah3Hpe+4h0ZntViMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48c7a05f-61f8-ab15-6def-0ae3fd26a2ea@suse.com>
Date: Thu, 23 Feb 2023 12:25:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [linux-linus test] 178148: regressions - trouble:
 blocked/fail/pass/starved
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <osstest-178148-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-178148-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 635ea107-05c4-4117-4710-08db15909b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BYB+CgJNXWrMIXlmxfyPcm6ecdyQT4Rdd+8SGfZZSqGGk+zD0+yMozfiZ2SQNRIFhXkcMkabKZGME/oEys67DjJrrfi7LhXSQso8N7pb2grVa6q39hMH/M9iyszqz0upSS2xMIJxmlAxymMwd+tdiCWA4WLBSTtk7r+7uRPKjsRHow6TQLUTqM5tllShTlGjdcStB7OZma2ORqw7DyZq+WxflWq9/bEPqQ1Zr4sgocW24s+1x0eX/B0hsiWmLzx6sxeZeppF0N3J6vVEA1GOurrCYY1tLxfEH2QEx05n5kkAxhmEk5F6aTGXDN5Dt9Af0qJHICONRHubCGpn957E89YOIhs2mZRwz+e/xGgHJk9CjTKSrv3PRqclKI/B3AFd8mhmcZmzsKUfUv2LDYRM3lvCTIv4Hm6V/29ngtiBsbIzYzkuhSM9yGq7h1y1JQPpePA6a2Ijmx4dezvKb8AflLoMtvTJrq+Mzt27OxC6/oyQcdORsm0Ngmh8HXJN9n3CH44Wj0qHInQa+ru+pdyqZcyTjInHnUYZkIoV9U3YKLMlgpY3mONO424g5fvNHDUFYJnZat4zFhZQnFXb9pxDcptsQ7pyHIZm4zImUOp38o9Fz8MpDuRSD0h3LXKxD+KMeE1fuouH12VK8Wk/NB4bZf6B+ZJAVYeN+nawT9BSRScyUxc2x77DUN35CckZGkeQUWfbWCV9+KRXtstiQMtsTbtuBPU0fdfW8NpsZROF5Pc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199018)(66556008)(66476007)(83380400001)(66946007)(316002)(8676002)(8936002)(5660300002)(4326008)(6916009)(41300700001)(6506007)(6512007)(2616005)(53546011)(186003)(26005)(478600001)(966005)(6486002)(36756003)(86362001)(31696002)(15650500001)(2906002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q05LUlB5SnJRdG16Rm5xWjBGMm85Q3lOVVl1VEZld0lOS081cUZxaGlWWkhI?=
 =?utf-8?B?MzFuZjFXYlBONEcyVXJkQ0ZPUjFxWEZwb3VHSWxPZ2hEd1NSWkVmcGc0OEdh?=
 =?utf-8?B?aHd2LzZvMWMxMkMrTTBPZDExdkdpcUV6dnM1U3l6dSs1Zjl3SllvVmtHakdG?=
 =?utf-8?B?RExxR042VnUvaWZHZk9JN1orb1c2NE5EaTRlYm9YZjNRa1NGZVNiYnRhNFp2?=
 =?utf-8?B?M3JXajZZVFdUbGFzSUhRbTVXbWlJM0tib0ZIQnZSMUdOM3lXM1E3R01TbFMz?=
 =?utf-8?B?YS9QRVAwNUo0QU5vWXEvWTYzS29hMWhpNEVwL1IyVWxWN0RPZGZjS212MFFJ?=
 =?utf-8?B?UjZHUTNrUEd2VXlvOGxpR3VTeXFzZ2ZuOGpVRmtXb0R1QVBLWi9melBRU0Zy?=
 =?utf-8?B?Mm8wVTd4bGlqdmxqdXo5NnRPQW4rUkxyd2hlK3pvSjRHMlEvUjRmTThlOEdu?=
 =?utf-8?B?S3NJc0dGdk5zMzkrSC8wRXJwU3hhbksyYTlQQ0k2M1NRa3JMSzYyTE1JM3pk?=
 =?utf-8?B?Q0k3UFZLbWVjVk8wTWpJTERjOUE3Mk01U0s4VXFaazlGTTU0RFVYZUhwL0xT?=
 =?utf-8?B?MTg4VjJ2d0NJeUNOYzkxZS94cGtqZEd6c0RGMXNDcWNtTlBuZVppSnpNUGtT?=
 =?utf-8?B?YXZyeHUzbnI5QmFYRHZZcE5lT3lQVFNpRG9KQXdDN0RhWHdrQ1htVlExcEli?=
 =?utf-8?B?cU9DYVB0MmlZZHV1WCtZVFdzTS9HZE45blZEVmNPZk1PQlV2OW9ZbEt3Z1ZL?=
 =?utf-8?B?ZzIxUFpGMXB2SWdTd2pSRG9yNXRlRCtJNTBVdEFsZGdxYmEwWmpTa3JETi9j?=
 =?utf-8?B?NEJIU1lLdUc4YlE2L0V2MG1jT3RQS0hZSXk0bW1UazFvZWc5Mk9LZzVNQ1g1?=
 =?utf-8?B?TXF5WFNuWEEweTZjQ24zVzFzNHFoOUR1R3BBeUsyQmdiem0yMWgxNE45STl3?=
 =?utf-8?B?d3pIaUxLc2M1NTZyRkJHRE56UWxRS2dkYTFES3Y0QjY0WS90dkxIb3lBMEVn?=
 =?utf-8?B?OEMvRmQxZU9oYXdCZTd3U1N0ZWNVdHhqcU03N0tJV3BoaGlPeXN1NUU4V09C?=
 =?utf-8?B?allCNnRocFQrUmdJY0U5MkdDaGR0N3Boa1M5Y3dBaTNkNzhiSFJvWFp5M2lp?=
 =?utf-8?B?QmNKRjBMN1p0cjRnRjZ6a2tmaThIUk9JMEhRNTFWTjdSaUY2OGRCTlA3d21q?=
 =?utf-8?B?RTJmMzgrYWJkQUVScUxQdFByVEhTNGtvSnZhTkZ6ZDBQTCtiYjdTOUozaWpt?=
 =?utf-8?B?Qk1xV2tWVitUOUF5dGQrRE92dHlsR2hKdkhma0J0d0QyYVRZSU16V2N2TlJh?=
 =?utf-8?B?RzduNyszSFJ2b2phMUUwbzl3eFlMRm1xRUpQbm85U2dFbVZBTnlDTzFLbE9T?=
 =?utf-8?B?S3lPQm5VMVUrSnVVQUhkaUdxM0UxL25FOG9ZTkVFSHhzc3NCSmxBYmRxZHNI?=
 =?utf-8?B?eHlhTDNoT0FBSmVzRko3SThlQVA5UVlrK1NURWR0enFtUHdQVEpCUDNNVzJT?=
 =?utf-8?B?V28wbFJVNWJCbjUrbGsyam9sRjltUEdnZnZaS0ZUVGRRVng0WHhDaDEva3Bj?=
 =?utf-8?B?RHBCMEIwTkRKTDB2dGNySHJaVjBqNlpsUWtmTEM4cCtmZ1dlWmRsclhmUG9Z?=
 =?utf-8?B?bnEwK0Uzd2xtT2MwYVZxNTc4a0grR25pVGhzYUlhQmJWMjl6aHk2QXN1cVpL?=
 =?utf-8?B?YTkzSHl0VDVON3B1b2hmNENSUDhKSTc2Z2hhaWUxWFZ1SzFSRFVqanNQYk52?=
 =?utf-8?B?YTh1S2RZMmxEbm5iZ0JxNHUzSlBQWmU5NWRKa0lMbjZhYlVBNWppTXhsYTRU?=
 =?utf-8?B?MUJPSngzWkJsRlpqTTRucTRPODU3VnEwVmtKUzlZbXgzRXI1SVVmYkVaK0xO?=
 =?utf-8?B?UHh4MUhvSEhmcGxKV1Q2V0JQcTdCUWwvdXcxWktxU0lSTXB1ZkZqbzJ3cXZl?=
 =?utf-8?B?Q1RnQXJaT1B3eUxGN0l2aSt0ZHpxUTRSWXJEdlYydjZXMlE5MGlLVDlWVFYr?=
 =?utf-8?B?QTk0UmR1bFhadllja0MyKzBmY2dhNnFvcTg5MzVaSS9KTkRPNlVOYk5HQmxX?=
 =?utf-8?B?OFVqT0dXVndwUFYrMlF6ZmpGRVNZMnpaOU1ZQzNReVlndGZ4L1pCVWJ0bVFx?=
 =?utf-8?Q?Ld33s+IiWwa7oLooHom8pqtww?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635ea107-05c4-4117-4710-08db15909b4d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 11:25:02.9782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Upe2VoGnnYR4w7OY6Lv6E9H7jqcOy4bxwBlQx0Q7xcOkNFXlWCFx+IC6Wl9lGfuLzw1MxbXLpsOzOFKjXVrPrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8492

On 23.02.2023 09:42, osstest service owner wrote:
> flight 178148 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/178148/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-xl-qemuu-ws16-amd64  8 xen-boot         fail REGR. vs. 178042
>  test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 178042
>  test-amd64-amd64-xl-pvhv2-intel  8 xen-boot              fail REGR. vs. 178042
>  test-amd64-amd64-xl-pvshim    8 xen-boot                 fail REGR. vs. 178042
>  test-amd64-amd64-xl-vhd       8 xen-boot                 fail REGR. vs. 178042
>  test-amd64-amd64-xl-qemuu-win7-amd64  8 xen-boot         fail REGR. vs. 178042
>  test-amd64-amd64-xl-qemut-win7-amd64  8 xen-boot         fail REGR. vs. 178042
>  test-amd64-amd64-xl-multivcpu  8 xen-boot                fail REGR. vs. 178042
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 8 xen-boot fail REGR. vs. 178042
>  test-amd64-amd64-xl-xsm       8 xen-boot                 fail REGR. vs. 178042
>  test-amd64-amd64-xl           8 xen-boot                 fail REGR. vs. 178042
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64  8 xen-boot    fail REGR. vs. 178042
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 178042
>  test-amd64-amd64-libvirt-raw  8 xen-boot                 fail REGR. vs. 178042
>  test-amd64-amd64-qemuu-nested-amd  8 xen-boot            fail REGR. vs. 178042
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 178042
>  test-amd64-amd64-xl-pvhv2-amd  8 xen-boot                fail REGR. vs. 178042
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 8 xen-boot fail REGR. vs. 178042
>  test-amd64-amd64-freebsd11-amd64  8 xen-boot             fail REGR. vs. 178042
>  test-amd64-amd64-xl-qemut-ws16-amd64  8 xen-boot         fail REGR. vs. 178042
>  test-amd64-amd64-qemuu-nested-intel  8 xen-boot          fail REGR. vs. 178042
>  test-amd64-amd64-xl-credit1   8 xen-boot                 fail REGR. vs. 178042
>  test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 178042
>  test-amd64-amd64-xl-shadow    8 xen-boot                 fail REGR. vs. 178042
>  test-amd64-amd64-pygrub       8 xen-boot                 fail REGR. vs. 178042
>  test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 178042
>  test-amd64-amd64-pair        12 xen-boot/src_host        fail REGR. vs. 178042
>  test-amd64-amd64-pair        13 xen-boot/dst_host        fail REGR. vs. 178042
>  test-amd64-amd64-libvirt-qcow2  8 xen-boot               fail REGR. vs. 178042
>  test-amd64-amd64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 178042
>  test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 178042
>  test-amd64-amd64-xl-qemut-debianhvm-amd64  8 xen-boot    fail REGR. vs. 178042
>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 178042
>  test-amd64-amd64-freebsd12-amd64  8 xen-boot             fail REGR. vs. 178042
>  test-amd64-amd64-libvirt-pair 12 xen-boot/src_host       fail REGR. vs. 178042
>  test-amd64-amd64-libvirt-pair 13 xen-boot/dst_host       fail REGR. vs. 178042
>  test-amd64-coresched-amd64-xl  8 xen-boot                fail REGR. vs. 178042

Hmm, looks to be another Linux change to the MSI subsystem which didn't
properly take Xen PV Dom0 into account:

Feb 23 03:58:09.723080 [    0.318338] BUG: kernel NULL pointer dereference, address: 0000000000000050
Feb 23 03:58:09.723080 [    0.318487] #PF: supervisor read access in kernel mode
Feb 23 03:58:09.735104 [    0.318522] #PF: error_code(0x0000) - not-present page
Feb 23 03:58:09.735104 [    0.318522] PGD 0 P4D 0 
Feb 23 03:58:09.747081 [    0.318522] Oops: 0000 [#1] PREEMPT SMP NOPTI
Feb 23 03:58:09.747081 [    0.318522] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.2.0+ #1
Feb 23 03:58:09.759130 [    0.318522] Hardware name: Dell Inc. PowerEdge R220/081N4V, BIOS 1.1.4 05/06/2014
Feb 23 03:58:09.759130 [    0.318522] RIP: e030:irq_domain_create_hierarchy+0x28/0x70
Feb 23 03:58:09.771113 [    0.318522] Code: 90 90 f3 0f 1e fa 41 54 41 89 f4 55 48 89 fd 48 89 cf 53 85 d2 74 3a 89 d6 31 c9 89 d2 e8 80 fd ff ff 48 89 c3 48 85 db 74 1b <48> 8b 45 50 44 09 63 28 48 89 df 48 89 ab 80 00 00 00 48 89 43 50
Feb 23 03:58:09.795089 [    0.318522] RSP: e02b:ffffc90040057e48 EFLAGS: 00010286
Feb 23 03:58:09.795089 [    0.318522] RAX: ffff8880037a5c00 RBX: ffff8880037a5c00 RCX: ffff888003469430
Feb 23 03:58:09.807191 [    0.318522] RDX: ffffffff8302cfa8 RSI: ffffffff82431fd1 RDI: ffff8880037a5c30
Feb 23 03:58:09.807191 [    0.318522] RBP: 0000000000000000 R08: ffff888003469430 R09: 0000000000000000
Feb 23 03:58:09.819069 [    0.318522] R10: ffff888003469430 R11: ffffea00000f0080 R12: 0000000000000010
Feb 23 03:58:09.831107 [    0.318522] R13: ffffffff82dee000 R14: ffffffff82e8aaf8 R15: ffffffff82d6f140
Feb 23 03:58:09.831107 [    0.318522] FS:  0000000000000000(0000) GS:ffff88801f200000(0000) knlGS:0000000000000000
Feb 23 03:58:09.843091 [    0.318522] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
Feb 23 03:58:09.855206 [    0.318522] CR2: 0000000000000050 CR3: 0000000002642000 CR4: 0000000000050660
Feb 23 03:58:09.855206 [    0.318522] Call Trace:
Feb 23 03:58:09.867061 [    0.318522]  <TASK>
Feb 23 03:58:09.867061 [    0.318522]  __msi_create_irq_domain+0xae/0x170
Feb 23 03:58:09.867061 [    0.318522]  xen_create_pci_msi_domain+0x2f/0x40
Feb 23 03:58:09.879047 [    0.318522]  x86_create_pci_msi_domain+0xd/0x20

Jan

