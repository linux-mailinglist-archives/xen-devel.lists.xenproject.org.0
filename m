Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54A6499F9
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 09:25:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459122.716785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4e7k-0003jP-8O; Mon, 12 Dec 2022 08:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459122.716785; Mon, 12 Dec 2022 08:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4e7k-0003gs-4b; Mon, 12 Dec 2022 08:25:20 +0000
Received: by outflank-mailman (input) for mailman id 459122;
 Mon, 12 Dec 2022 08:25:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8fsB=4K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p4e7i-0003gm-4p
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 08:25:18 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2045.outbound.protection.outlook.com [40.107.105.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81b9339a-79f6-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 09:25:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9383.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 08:25:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 08:25:14 +0000
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
X-Inumbo-ID: 81b9339a-79f6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHLjlUf3DM08RTI3cuTcWov/vRxmr8+nnY5GrAB1+Pr7BEOACjv6uIvJircxqCNXmsProHY/VbXhXm67lFaMLl9T9WhOwZwDxzhfGc0bUjRuRhYJWFUEo1W42EPgktfhX7rWIvCloOCmXRBHRwKUGLGTwmE8gxMuCdqnjCHGp52oVDAmaoDWO3ghRaUjgYKnZA25zqDbBfYRo14pphz9v/LcStkjb/2ZM2I5CWEJ6w0tAIr+sXxylB+aIGAfbjTDl/+3nhIM6dHofsXh99ds38cCHjoIrzyAlFmyICTCUI1Tm/pIp0+tX7xvtrNPWR8KOjad+9INkk2KdCvxyAUr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+eMVeXYg4FWVikC/VqxI3JzkM34sIxKmQsuZ9ST6vs=;
 b=UAWoXt7NgKO6wlOM05sd5sP02yL3x5kN579L6Snq/D6wEgxJPuQwkPI3C/jnreu6LlkZHlgW9+RSg9LYb7UM6R8pl/8jSp/lLRl1SHD4Pvl+xPsxDdv6coPrK0BUEr6Wb1mBG7eJc31+faw55EiB/5y4OFesFwEZY6NX9/eimZTwU6x5cb/XN1oRFS62K9XuYSOwcCX7fIFVNhntlYkwJxGeMMvFdeimpkO/Z1m0ctW8VNXPOLNaghWsJWxTrydtyaw7ojX0WOWw0hLsbZvF2k1bSpXX2XOxRVatm4NDvK+IBoP5yBBN4kUfudchgkVeg+PMhaF7Umpap+94hfxRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+eMVeXYg4FWVikC/VqxI3JzkM34sIxKmQsuZ9ST6vs=;
 b=t/VnF3ux9WsLvTr+F7HcwjHqKSqTZvM5DdFOhCozbiayvS2cNfT3vBPqRbi7nlIc/qRBKz49r/7SyQ0ahY27tq4egDvBSl9D6Zb5qb2KwctkICXuz5ogvPX02B1+2IQiF6boo7VYSA9Ol+0a0vpuozFhOOvRnSwtAbcOtjNsLiVPVzFTQWiC2GGXSqitwGoG0EoDDiRxpeUg3I+t4MVfg8T45EUnsK/AildnDc2gqL+qBZV8lpi4Ofir2Gp5AeG8QcjPLPQKUD1u9P4LMAyupE1Wg9KJzAODBwpD5c/MDSrYlMAuFwYj8Z3xxVobVLKuaLuYuXRFupEpb8PvPVydmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78b77cb5-4821-7a1a-ea58-9fc33dcab882@suse.com>
Date: Mon, 12 Dec 2022 09:25:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [linux-linus test] 175147: regressions - FAIL
To: xen-devel@lists.xenproject.org
References: <osstest-175147-mainreport@xen.org>
Content-Language: en-US
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-175147-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9383:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c024c3e-2324-44cf-d66d-08dadc1a64a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jjZqR4aY15Z6H7uC4NA5k5uSQKMKffvGoryKkjHammhS3dNccZHFLjUYpRTerP6z3R4aZeHbIq8lvUsiiDqTmc+tc4G2hiAG1kHKsjmUkrWhy3clOvsy1IzUrrBFCHx9BU08zMWiDMpKZu+HHfGoBKlu3v38Go3o8mDWNxxvuY2Utx3bdPLhW/pGyyM/QAc0EvsEup4piB2SjB3mS5r997goDy/46d5QnKt+9qbMUjTjIpN5O4n1DjCtk6+6KoPrChwVjjfrj0N3tWnrVD8ZzNIITm0STjlH2tpBUZZFrXoISQnl88WhG2w1J4BxPilxTJ8Z7f72Tfzq8v+C1qCAJjUzyTHoDPIyciCG4Nr+cbFeCeEfX+a2nmKomdgRXmgW9YVb0NZRO2tGcFkDEUHbJhTigvVDlW6cSQcp0EHR3rCkugAlZTkGkmE64eix9jpOylZv6/vqMp0ROjc16BgEyBkhan6AUk4NUY4r4t6c0k1llo2nOabszfS2XBp3K1wcC4ZODNXEMEeJWHP/8A5PSoH4AdN3M5vQbvkrLc+ltS9vD3yz16TGd3w8Ns7M7culKpyoSrJlrTIL+VTmYIKamgakfTzNE/5ccMn7z8B8FYWAFYa6cLErWxEmXcnifFNMNOpRysJ3gEECixmXuGskkAPbHqUTdmxsdfImPmWFQVw/GcVVg4crRnSF+r50NPwix1NMjkE/1hj6WhrCGuT9v+vZFvw3EsvXi79jjYmbqrpfQC74LbaK7t+XSWp8Xxfc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199015)(31686004)(2906002)(66476007)(4326008)(66556008)(8676002)(41300700001)(66946007)(8936002)(316002)(6916009)(6512007)(6486002)(2616005)(186003)(6506007)(53546011)(478600001)(83380400001)(966005)(26005)(36756003)(38100700002)(5660300002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cy9NcEQ2SHRNeGdJMzNDZUF6UFd1Qml5MFJwVzVHMjVNWHpSeU5GMmhnWG02?=
 =?utf-8?B?K3o2ZEM5U3NueGcwZzMvN3lPN2RkYWxpZGhZTUZoMG9IOVNFMGVDeTZKK0px?=
 =?utf-8?B?bXgzcmRTbGtUVmRqbWJ6T2h1Z21iV3lFTkt2aENIMjVmWXBaa1BjRE15SnQy?=
 =?utf-8?B?eVU4TFZIamxOMCtCdEJrQ3AreCtYczdnb0EzVDR2OFNOczgvc3U4S2FtbHRL?=
 =?utf-8?B?VVIxby8wV1RNUFIzUjh5YUtYeUFyT2swckhzS0p2VHkwRlBiTHR6QWNBRTR3?=
 =?utf-8?B?L0JBTEs3NFBzRTU0VGtNMlBqRUF0TlVCN1FaVUVPVUR0QXhJTVFob2F6VkZE?=
 =?utf-8?B?MTJGYzdPNEFkQjRJMDQ2elZEOURwMEJ3cXRMQ1ZDQndTUXY5SWVMenp5d20r?=
 =?utf-8?B?RDhER2p2L05GWlJSSlkvcU1ZV1ZIUjZUSTN1Qm1XcExlUjQ0RjFFV09RcC8y?=
 =?utf-8?B?L1JGK3YzTDhndWV3Tk91VWpZemN6UmxrMWFwTnV5cWZKU0F1V3FCVm5GbExG?=
 =?utf-8?B?dDNFQUN3TzljaXVWWVgrZ1ozZDkzTGJRZG4rZnpwYWZkM0RVQXEybXZNZVFx?=
 =?utf-8?B?VkN5Ry80MmRGQ0RrdG44VTNGNkgyR0dlcFJXNnVRM2tHVkdRY2JSRDJWR0Vo?=
 =?utf-8?B?akdTb1dmR2I4OS82ajBkT01ETFNvRkxWQ3Jjb1FSb2g0UU9OSkRGSnZGa3pz?=
 =?utf-8?B?TmNid3V3RFVCUEJaL1l5d0U3aU1yS0IwQ01EUGRsRlRDRTJaQjA5YmV6UTI4?=
 =?utf-8?B?azFKNTZDbVhHSzBreDduTlhWNHRsL1pIZHVhODNPRUgvb1pNY25BVi9TRUk1?=
 =?utf-8?B?WFlacmFsT3ROWkNwZE56MnozVml5dXhvb3hFNTdZZ1hBTzVLaXdMVE1VbGVE?=
 =?utf-8?B?c3hYV0VWMXRmZ0dmd09CTHBNVDNYRWVSSmRTdVl1RmQ1S01BR2dvbzBWUEdC?=
 =?utf-8?B?YWJwbVFGeHF1QTZTK1ZHWFBrOVdiTzhzTmFjN2RMVXJobFQrQ0JjSFdBVTVh?=
 =?utf-8?B?MzRaejlwdk9IMlpCa2RzaFk3OWFYTFVZWTNkVklkMTBqNXdQWWNMZDR4ZFh2?=
 =?utf-8?B?dEVORE9oWjFFSkpBOHJXRVkzcm9CRXBQY0FYSnNidE9nd1pCSVJxVkJMbXZC?=
 =?utf-8?B?aW1XN093Y01hUFRsVUZPVTJYcy9WanJCeFB0NHJqZ21vRWcwSlJKcCtoNDRu?=
 =?utf-8?B?RU0wNmE1RHVVcGVqL1dpSHB3SFRoVkpGS3Bmb29DYzhWbGRUeWZZSFhxaEtQ?=
 =?utf-8?B?ejdQS1MyZVVha2tzbXdiWGRuSHdrdFN6dnJSUU8zblZKdmMwSzFYSC81a2d2?=
 =?utf-8?B?MTJHZ01FZnBBWG9GOERCVldyOUs4YzVGRTMxSURLVkFMaW51MHAvQWhYempk?=
 =?utf-8?B?WDcra0VGVHA0UU9BblYrYmN0dDJDazZtY2cyRi8vVDJsQ1NXV0FPNVZ1VERv?=
 =?utf-8?B?ZkkvZ1hIWmdGQkdxQlBCckQ0ckJnNGFmUzNBSWxQWXVoWkNOREdaY2hYaXc5?=
 =?utf-8?B?ZHp6aVl3ZnV1Y01sa080T0Z1UENYSHpKUW9DVUVRcHNnVTdIL2NlYzFiV2lS?=
 =?utf-8?B?aWNrTVc1Z2Q4Nnl2bFA4U2xMb2VHTDhRdmh6WjJaT0FMQnJTYU4wWEtwOXZY?=
 =?utf-8?B?VXZuSkNmbHoyelkyWWJaWUlhRTg5UUhhRE13bGhrM0ZzYTJxYWZhcW9IRmM4?=
 =?utf-8?B?VUY1SmdiNzFHcnJCOG5odXh4TWZFcnlYdG1LcklHVFZYZ3RyeWdkRHo0N1hJ?=
 =?utf-8?B?eEJ5MlJvVjVJZzlGb0ZUazlocGdEMVkyTDRoTGc5OS90T3hzWXh3ZXVqMUJY?=
 =?utf-8?B?eDRORkZRcTVnb1pYTng0QXVaVkhreWhrVXRuSUx6eVkraVphUE5QNkdUblMx?=
 =?utf-8?B?QTdJbWc4ckF6NjlHMk83YzlqdzJia1N5UFlNR3pYdjliZ2txc3V0Ym9xVXBZ?=
 =?utf-8?B?SHdxK1NkbVR5N0phMDkwc2xDSlNTdGQyanE0YlFmWVgvNCtvZFBqWlprMnZs?=
 =?utf-8?B?a0tUaWQ1WjFPM1BWc1A1Q2pRS29IakVLWTdYTmtlaytvUHFYakJKY3BrK002?=
 =?utf-8?B?K2owWE54d2ltNTlSTG4yUzFBLzU1OHRTVXA3bEw3aWdzdGkzdEZhT1gyeGFx?=
 =?utf-8?Q?9zpxrBwmNGGX9PORIjHgAa3Ru?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c024c3e-2324-44cf-d66d-08dadc1a64a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 08:25:14.4656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkPn8wcLvAoxXKCCn36T/gGHDMN3Cax7DESOWN8t3V2baP/zxak+OxWW/SHsq0d9P4uZZG026P8yu3vgEjCYaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9383

On 12.12.2022 06:51, osstest service owner wrote:
> flight 175147 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/175147/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 173462
>  test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 173462
>  test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 173462
>  test-arm64-arm64-xl-vhd       8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-xl-multivcpu  8 xen-boot                fail REGR. vs. 173462
>  test-armhf-armhf-libvirt-qcow2  8 xen-boot               fail REGR. vs. 173462
>  test-armhf-armhf-xl-arndale   8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 173462
>  test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 173462
>  test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 173462
>  test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. vs. 173462
>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 173462
>  test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 173462
>  test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-xl-credit2   8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-libvirt-raw  8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-xl-vhd       8 xen-boot                 fail REGR. vs. 173462

This was let go on for long enough that now Linux 6.1 was released with
whatever regression still in place which is causing the above failures.
I had put this on the agenda of the community call earlier this month,
but sadly time didn't permit getting to this topic ...

Jan

