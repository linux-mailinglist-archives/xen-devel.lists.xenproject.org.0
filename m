Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F575AE4CF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 11:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399725.641000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVVFV-00038s-1r; Tue, 06 Sep 2022 09:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399725.641000; Tue, 06 Sep 2022 09:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVVFU-00036z-VA; Tue, 06 Sep 2022 09:52:04 +0000
Received: by outflank-mailman (input) for mailman id 399725;
 Tue, 06 Sep 2022 09:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVVFT-00036t-Lm
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 09:52:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e42ca8f-2dc9-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 11:52:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3493.eurprd04.prod.outlook.com (2603:10a6:209:b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 09:51:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 09:51:59 +0000
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
X-Inumbo-ID: 8e42ca8f-2dc9-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ztdh6pP11EmKUdhcgZ6sGw8/jTYFbAJReNaRHieS2+kxDlxhXGPqptM7VqPHjqgLIJnWjlhGFidqPGBz6x+r18+4yTveXRVJoLeyVPfbD1LfAdzc06KUnipPImkf8ZdETz47ZdHX7c2M5GNaA1hnWsn3iqZpBKBZb5KSwbbw3EkPZuAu9vWVzzb8sCS4aQXPHmvRv+1Y1azVIDfYue2iKlwtgUdaQDmwkLcq99aTFAPpV4GNBAmWtmm2WDm96nBgJNhWrqVgOiPonlhWWa/l2PcriTyPFc1eHtjfis6SeyDxd3jCpoZlB/R5aJFq4/BZJyCsAzJxbSmcXi8p2PRHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLLg6gFadAmdbcUunSG3/Bs98NLHgzdwTmQ+0ku3QMU=;
 b=d2dBhvmOyhNCYWJy1yCB+iD2iR6C+KTgvDkHLF7JFaQ5nRPEhjGG9n7w2rU0VDiHU0yPpPLwafWz+mPiSkCzsvdDtlYmarbICMQFc55RH55MbfAIhFxoHw4vHu9G8+idYAYWtr/7kZCB/nhiv29VRw775MZnxGjCfscd95JHeZ9/ZfM2rK1SLn7X37awOlq0WaQdQk/G7kZomimL+Njzs5KRokGmjLpD+9ncFTAlwD7k3hNGhaMp1/wDtdExZIMuMQyhZ02lVbgFG6rymD48NClBMRV6YEW1/2jrvAbC1HwqbhXG95pJpbyBn03I9a4oBUk+MgcAosvmGZDrs/8jNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLLg6gFadAmdbcUunSG3/Bs98NLHgzdwTmQ+0ku3QMU=;
 b=Ee4kDCHL/YBf9jJ9SQ+GkwGSyUkkZG9B8/b4wrI3wu+wZKX5noVjRDrX6egRVBkjSC7oMBsqQLo2JhKuLV/YQvybu1kuiQ+8aeUmdxlAn01NhhsgnHDt4m/A/yRMBSLPme+KErhP+pv1pac0dbdU4htmYQhZXgROAFtm9NIDsjqmHKsC+1lgr6EsHJr2rLtkPyYlKvK9BwwW+U6waiotWHGOEyKQh56GIPKtpAUgHqEPpyvUoeBoKr3caZNzk9GS1fYqUhVvlNQEQyrHHHSBgo0eASt1ZbDpgMvAnN+9kyW05dQDdzOHXELFYNiJFhog2d4F2+U9kQykK+xNmcFOHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
Date: Tue, 6 Sep 2022 11:52:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Setting constant-time mode CPU flag
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <YxFk2GaIQVCAFsyi@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YxFk2GaIQVCAFsyi@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44e67ad2-ab7d-4d8e-31f3-08da8fed70c9
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6xYwqskpewSKFz5mzeBgzqxkUYK0b9U7yDUfwI4JIHz0l0DWMg2KYi0ZCb0sJ8pZchSz1HG0G5kH4oT2Hvf29aVkgfD99kYpz49VVNlIH56nGUO4rzqK21OBLijfsGHD/Ht+WGFIvdSdYBE7XJbmXjcVMf4dgA9c7i4s2jK0ZU5jCU+RowdomZ666SWKAjbyx4/Vu0k1ID91BEJSMgVew6M1pfGq81y+lai/8XqzH/gwiOxXAymrtEj43FIQKF5RJWr2wU9PEClrApXssWnHxe0EVJ1uMctAFje1Hr4MHsvB1RVpxdAqToLGIh4MHLGmSDS/ioB8FmpG1bd/Jgso9LcXq8eKhGVm8WWGhs46xD4pkzyQer69o4BflZ4/jIFPvbfERusGz0tI4UYdo7c73JRSesxdXBnLJtiNkoLb1okO/aTI187ZwOpTxjO/hIbT6r36wX3AFz8svza9DsX7XScVe5GLihvRdV6keXRZe8aqd/dqfG5aabvbJ2A3SgTJSVq+w86gKGyEoitKL0sm7zBjW6omX1REqDr/TanTgbfMAwig2kyJ/D6kqDE7EZ/Uxgp2Ur+wQmUZEE9x5FfdvasdSwcNhK1UwU++sDBjKArg24VSetm4sJOUthrZ2tq5P2m5hxuLPeuz37JX1YQ/7Vr/jf0G747wOv9AF+Ly4TU60H/yQX7Ym3aXT6qvvoCqq8yaVAtMr9V1lugtTJlcJUgIfYmpce5AoEgtFnRpsSebv/5KxhME1MKZIfhwgLhyMoJoHrdHCZS0tZuq7vsWGb+Z6lcjhVCBj7JodznEMuR5V1hHc0ICLYQ7BO+l2FU5Mlzp3oUIp9yrL72hOJbBUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(346002)(39860400002)(396003)(366004)(31686004)(5660300002)(4326008)(66556008)(8676002)(2906002)(66476007)(66946007)(36756003)(41300700001)(478600001)(316002)(54906003)(53546011)(6486002)(966005)(6916009)(6506007)(6666004)(6512007)(26005)(186003)(86362001)(38100700002)(2616005)(31696002)(8936002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTdYeWRGMk1jaFhHWXJwMHpRVWxOVGpjWUlVVU1rWlllKzBRa0xYaGJvQWlQ?=
 =?utf-8?B?eHRweVZPZnExVXI2dHh6Mkh2akNRRmtWdUU1N1lZUmdYU05Td1NPbjNPalUw?=
 =?utf-8?B?bk11MGhSbTcxNmJ2Nk9LQXdaY2JWb0h6UFJPZSszOXNVRjk5ZXZUQldCRXl6?=
 =?utf-8?B?bTEyMGVvQTBiU1prdWRtTy9vcFQwemIrVUs3WnA5VDIzMmhVZk9GQUpqNnZh?=
 =?utf-8?B?UlhvTUFjamJRdVhwQUFaK2p0MFpXMUZ5cGFpcjF0aUdTRVV6TFRBKysrbERP?=
 =?utf-8?B?ZHZpY3RPNWtpcnJqbE1FYjhNMmQzM09MZExzOURXTUp1R2hKYWMwMWN3Zmpi?=
 =?utf-8?B?RklIWmM4eC94WTNNYTdXM2JhSDdmQk9hbld2TUVQeG9seUNSK0N6M1Q4S0k1?=
 =?utf-8?B?aUhCL3RMNm9rVjg5TDVVL0VYbGtyVVQzZHk4WHluM0NtWUNJTHRhSmRYY2Ja?=
 =?utf-8?B?QWdKcnc0UmZSYWR0Z1BBMEF5eWNGNERUSW5XQ3ZPYVRDQVFXVFhBTmdpa3k1?=
 =?utf-8?B?T2pWMFlKMVVyMnBaZklaYkpxTmZiVm1mb3RsZXh6KzhKcEkwd3g0TnRPM3Nk?=
 =?utf-8?B?L3c2MHNCTEZRMHhwL2NuQkdrNThMWlRzZ3pOcjg0R1ZuYzNRUlBHbUxWQVg2?=
 =?utf-8?B?QlBPTndDd3cvRE9JNGE1MWhUSjVPcXFHVUJxYWV3KzVFMWx1VzNXa2hLRDds?=
 =?utf-8?B?ZjZqREpmRmp4STk1UXJaQWpkbGI0NjlZNlJ0UVM0c2ZSS3lnaUNraVF4OUsz?=
 =?utf-8?B?bVhNWGEyOFkvVzVPbWVRZ0tSVjdEUDNaQ0ZIc0V4N2lLRVQyTmtYMkNIV3NK?=
 =?utf-8?B?c3NjM3ZROGJjeGZjaDlqQ1lMQnBGM0R0djdEWU5rQytsQmtkTHYvSnBlQlIr?=
 =?utf-8?B?MTZaSDdITERRNzhoQWcxZnBiZW9TSGVQWXhnaWtoTVh1TDEraDFzandEdFpK?=
 =?utf-8?B?LzlSWkxNTUZ5VFJTdHp3VU84OCtJV0pLVC83VWszWEZ5bnFMRXh5VCtxNUxP?=
 =?utf-8?B?a0JqVmZDTXFQcXZjbVpHYWZ2RG0xWEtHemRMU2FmOXBtUHJ6TytxOXhRREdG?=
 =?utf-8?B?RGk2UEtDcm15YytoVWcrNEJTSHRydmcwL3JlTTZFMm5ia0Yrand6UFRIaGpC?=
 =?utf-8?B?Ym53RFljOVU5M0JaQ1hia0xDWFpIT1h3cld5OGdDbERUWFhiR3FKaGx1b2kw?=
 =?utf-8?B?dmt4OG95M2NxUGhQSWRUSjQxK0xaRFVYd00yaS9DUHhrTURFckFRVHFEUSty?=
 =?utf-8?B?Y3JDSlNhQWRUWjljdTd2STRjbDdPUlpra2pFVm9tOVVGUWlJUkM2d3d4bitX?=
 =?utf-8?B?NXJyT1NSd1NyOVAxbGkvMkVXVW9nSE1hN0tZYUI1WEJPaXNrQlZPWDVjRjda?=
 =?utf-8?B?TWxEcGFTVVE3RWNTVmlRc0lZUmJ4L215ZTQ1YS9NL2drd0NEWGFJRHQ0bFN1?=
 =?utf-8?B?OEhnb2FqZUJuUmg4RkI0RG0wUHVPQllHUUpNUEdOYnNDczhqblZ2UXViNUtx?=
 =?utf-8?B?SEVSaC8zMzU3SkJMK3NUUldDaE1scjdzWUNEQ1NZRG9GOEFMT2loL2FiRUNm?=
 =?utf-8?B?b1J1VXdwZktPSEFhZ0NYUTR2WGhEaVBKUzYwbitHR1o1Zmc2UHU5RS9wT2J3?=
 =?utf-8?B?TlpScnpiM3hPRC9ab2pzSE92bWJjd3JMMllwRmZqc1JFNmpmdTlJeDk4WnRT?=
 =?utf-8?B?RUVwNEV4RjYrNE12WGhhYXEvZ1pUU0JlYXVwNVhta0Y5V0ZDTURlbS9oTmQv?=
 =?utf-8?B?Nm1weWFtZ1doakpMbzZyWmJUZFlKaElvY3FFcE5WdWw2SmNDVkMxYmlOU0RG?=
 =?utf-8?B?ZjQwOE1oWFF5V2VOMG5UY1huQmp0dUlHeis5eitMYUxxVVJDNUZqeVdKbklv?=
 =?utf-8?B?RVR6VVVNdkpQT2dEcm05OEFDMkpIdVhpSU9vQTdJN0xyQ1RVZWg3YzA0UVRa?=
 =?utf-8?B?N1kyUmV4bzZmOWRqOXhiSmxvU0xKZmdhak04SjY5cEN5YU5pWUJxcXl1M0lO?=
 =?utf-8?B?VUdibE54dzZXaEQ2RmpseWRQblM0cGxKTkpUMG9oVzQ0QU5rU1F2emkrejcv?=
 =?utf-8?B?bHl3UE9nMHpLK08vL2E5THZqVXNLNDdLblRxT2l6TCtJZm5jL0xhS1JWQnNJ?=
 =?utf-8?Q?s8AT7R/vW9HYK1QYu5PewMTjw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e67ad2-ab7d-4d8e-31f3-08da8fed70c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 09:51:59.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+kyb+jjnUQOcOc2ob+KS/gZtkgXXeJmaok9GvsOEKJfWPWq+p0sbQS4fpSo8/+pLbG9Emjo4bG2Vv0X/s0giA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3493

On 02.09.2022 04:05, Demi Marie Obenour wrote:
> On Intel chips (Ice Lake and later) and ARM64, a bit needs to be set in
> a CPU register to enforce constant-time execution.  Linux plans to set
> this bit by default; Xen should do the same.  See
> https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for details.
> I recommend setting the bit unconditionally and ignoring guest attempts
> to change it.

I don't think we ought to set it by default; I can see reasons why kernels
may want to set it by default (providing a way to turn it off). In Xen
what I think we need is exposure of the bit to be guest-controllable.

Jan

