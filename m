Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9D364A41E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 16:27:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459732.717500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4khg-0002HA-F8; Mon, 12 Dec 2022 15:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459732.717500; Mon, 12 Dec 2022 15:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4khg-0002Ec-CS; Mon, 12 Dec 2022 15:26:52 +0000
Received: by outflank-mailman (input) for mailman id 459732;
 Mon, 12 Dec 2022 15:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8fsB=4K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p4khf-0002EW-1Z
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 15:26:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2056.outbound.protection.outlook.com [40.107.6.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65c4ab7d-7a31-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 16:26:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Mon, 12 Dec
 2022 15:26:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 15:26:48 +0000
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
X-Inumbo-ID: 65c4ab7d-7a31-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDxKMQJWAdKKtBJD3Wp/UMkUfkM7/lDioK/ctvo4cey0r2Ks0waNPByAweLqFtNrmt0BEf/H47jjC53LVU/WrvGWx3MQcrSXLAplNXt17MfFJ9ntbpTAeuJm0gL16sRCyNEu4v4Ypt8X1H2qXbcGHfqxVx6LitvWor1mYi5Oqy1Uzrsulw9Tmq3vSEhE/b9XpepmPXG4jHorKrk/loIgo1u7hKye1Y0DhbdJy7fyzJsIarXnxn2rKPNCwFO69DEwxZZHwXqZ+4ukawoI6tvKckt4wimZn1hkRNOGhPJVRPNWVmQoTvDupZdU6SUGb28EkeX4U+K6AGwQTONxFj6juw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t66f3Y2FwsdAT7vTc+90QXObZppfXHBLj47/zI58Tgs=;
 b=ejGR8zTa1VIV751NAYJn2gqsTcCr2su3yjACTyPBA+ErFTohilGBsUFvRICctzlySvvMpw1z3LmuijmUn8B+2xemEgifpAMl/Yvh9kGA1F7dfx0Pqlnj34gilgmZJovAYo3HS/MRGL34x3/C5sTJ2mITM2Fefi1oWtr6FiHaxhzvVOrP6eDhEhJqQUJ6Uzo+YM26AQcggTlSxgNt8REy2+4G4DPL1cVZp5Ti+yDM06YZvFvlJzA4L3zhUUTk7QjXsrkikgk/K3HNGWDXecCKQ8cpCMLrhy24jRUHaiEklE5y1pr3JtA3v4vbnHOTG5PFbwujHAtuqf4aBgjf1z/Slw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t66f3Y2FwsdAT7vTc+90QXObZppfXHBLj47/zI58Tgs=;
 b=sIjJFaSE//HLqNOYHeNuvbx+kVjsg1zVf0REj/k+aBTkwZTNoY1Ege3ErqhtMHdaEnUpcHzpPJXWY3Qa6PsHxuv7GwuHQGaQoklhAi67vd44sklEw6cL1VndgYLi8XFh0bbXD0y329L5DYj2xszPz+NzovMSAIZ9Xnwrx8I/8dreGZWCpA6B9ZryqHxklF4mGwzNrtSfBgTxDKn2Ikq8M2Qyk40cq9jANJNJ5Lucqgdt9HB1FeS68XAuSPNXXGq3WY/hXr0j7o9x3Y4esR02Ah7pGykwnORqe9o2juqU0vCRPJb266CgfujJEnT+C/UVrP2h1OUSRgM2PIR9uMKhtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c422147-d541-be8c-e217-4ef32c73c3dc@suse.com>
Date: Mon, 12 Dec 2022 16:26:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] x86/ucode: allow cpu_request_microcode() to skip
 memory allocation
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221208132639.29942-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221208132639.29942-1-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d9d2fc-e248-4a84-5138-08dadc5548da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yCWGxI0VZ72bts+nyPxWd0E9JTbGJbQVMHyxR1PhHfcvvU/NzAVrfn7Rkz6qDhUaTh4SLYdvOs20CmBGLQHZAwMXpnY0seHVySbR1TZY7rg1SFFshcI3LnLyHu1Fa2nm0mm5dG0DD2CEUNv0NXdjB50wut7c4U64ADdF+RyXSi3NAq36BH9O+Vve4NoaEvxWgX5nZRLOvbOE3BTsvEq8kUc65Fey6OH9bptMbKAtrzdfN1OIzkfPWymZEkziIE9mDWIXV6ZXUVSuHMFNfOabaUU4++M9CEhO75bKQvLPzrg/4JdTuAJXEBKcnXwU+zU7z3oc60gm6NTvkbNkLOTdQ3MFDT1xcP5zRAVr2hIKQ2K2xGAw9cbJ5QjfWl2uEkZNdZ2NsUS08ZW0Z2iR+rWcZhhSb1sHSipWbmaOx8M0KZ/Xi6WsmlYKVvZKVU0WReBBAxqsHr4lEZaicZdKV1f0avnl2ttQGHAmE1y+RAl39yk6QWtgSucgkZ2tglSsXH5/uPBlc/reyqSo4FSI2Dpj9E4Ai9Y6B2Yed+xFxto1xoj6oPtykI8hyQT6ja1+K84F0nG65rn36Lv+EfP+aTy1yEoxlfu/eeCNqIhWQXxbU/IExUDZ2aCYXgwFHuAnJOd7vpDLDhC/sje3KOmQSCmgf5MLhu2B0wfEJzuk4uwby/xsG2n43QFJJ6K0IPqiEsLTx7a3Yw/eSIe8AvmfEYxP58NzfCINglsaQkjRSIEfLbk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(136003)(376002)(366004)(39850400004)(451199015)(41300700001)(83380400001)(6916009)(54906003)(316002)(66556008)(66946007)(66476007)(4326008)(8676002)(2906002)(86362001)(31696002)(8936002)(38100700002)(4744005)(36756003)(5660300002)(31686004)(53546011)(6486002)(478600001)(2616005)(6506007)(26005)(186003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0RYMk13TFVoUUFMVkc5RitWQ3ovVUwrU21TdUlXTjZ2UHhvMXRLSmZuNEIz?=
 =?utf-8?B?ZDNzRmJMWU43MFIzcWUvY2MvdTgwbkl4L01ZdFN0RWxtZ1VVVlNXbnB5UlRT?=
 =?utf-8?B?U3hwdVFEYjh5NXlBTWlEQ2JIVDByVkJDc2JDK05NRzJYK21tdkhsalZxMkI3?=
 =?utf-8?B?N3ljbXdhNVdvelRqS3J2aC8yc3N0UitZcGViODlSdHgrcFlpa1gxQWFTMzdG?=
 =?utf-8?B?SWgya2lFaDYxbkw0bzVNdE5QUzduOTg5U21RRHlLelE4akJkK2VGbWVMUmN5?=
 =?utf-8?B?cGFpdEIxbGttQmdNNmtPVlA4OEh6N1Z1ZkVqR09zL2VEMGZTYUh6ajg4am80?=
 =?utf-8?B?cUJTb0hRRENmeGFpQ052aVYwS2FlUnlUMHFCRk1ySy80Y1JoYUZlelN4N2Ir?=
 =?utf-8?B?KzNIdDVCOG03eDh5WVdWTExLa21ldmZOcVJ0TXZFWmRIRy9Mc1NmUHNUMWJt?=
 =?utf-8?B?NkJ5cEJkak8rYzhsWStmY3l6QStBVyswT1lNWUxLQ3lVWENiZmVhZ2ZRNG1K?=
 =?utf-8?B?aEdreXFEUWdheWIreklBakl4cDFKSWVRSlB0b21NR013MGhpRWpZWHpJUUJU?=
 =?utf-8?B?bmpmNHdYRTNPWTEvUTYvNzY0OTloRnJJREtqZU9xODFFeHZDdHFUL0lwbnNu?=
 =?utf-8?B?ci9qbTAveCtTajJxcW16QVBuV1ZueWFSM0RuRXJTbnRUbUNRNHcvWGV6MXU3?=
 =?utf-8?B?YzlNdndzd09tdmhNWCtUTmthdVJ5K21WRzdWTmFRSUtYKytBTXFtaGgxZlJ0?=
 =?utf-8?B?TkdWN29nZUF4alFSckJ6Uk5lTXJZOEV0MjRNbm1id0tvVVR1S1JmdHMxZ0ZF?=
 =?utf-8?B?dzhvZTlZd3I5S3pFM2hoRXVZaVg4VG5OOUMvTlFUaFQzdHpsQnFEM09Ba0xt?=
 =?utf-8?B?MWQ5WHBySDVDV3VIZWJaRmxKcFRSMDFOcGp6ZHhiZWVLeDZhN1pyYlJ1b1gr?=
 =?utf-8?B?Q1dKNXdvMmgwU0xPU21YdDJEK2U2cXZJZDN3c3ZhaGowZ2VtL1VEMkxkV2VO?=
 =?utf-8?B?TXMwLzhuaFY2bVI0QmdBRlhHYnRaRWo5cUVTUXlKcmxKdktoZS96WFRnN2kx?=
 =?utf-8?B?aEs4NWxpWElzMEZqa05QMUlrSG9IVWNITEMvVEdRU1hMMWpKWG03WHpNU2Zq?=
 =?utf-8?B?a2hDOGk4UURERHRxb0tFYWhqRFVuMmhFMmVvcXYxZjc4L2V2VEx5U0tDSGNE?=
 =?utf-8?B?cTlKbFY1ZmtCMmJ5cG9uODVoMVNDdEdkSE9ycUlrM3pxajFpS0F6eUJmbVUw?=
 =?utf-8?B?QW56VDNLb1Frc29VOENFcWdpNmx6OHk3bndhcWJZbTc1dzRDclU5b3J3aEt0?=
 =?utf-8?B?a3NGOXhOa1hOY1ZSZXJMTWc4SWQ3V2JQcTdvTklVOHk2bmdvNWVweUYyNFlw?=
 =?utf-8?B?SXQrNHR1anRya1cwekJzazNUSEF5WmllTEdWL2VNeEdteU5OK2thU3Z4cFVM?=
 =?utf-8?B?ZnVpYzAzekthS3U0bW9ab2JNVCtUSUJBZm9zT0dsMjJ0Tk1jU0JTanFvbWZ4?=
 =?utf-8?B?VnpJS1VyUmZQbHJMNTI1Z1IwNmFKanVvZVA5emJKVDhGTGFFWktKM01wVno5?=
 =?utf-8?B?dGNPWEdldERaZVJZSlJyVEttdmRjWjBORzIrWW9maXZ1aUc4cjVPUCtOc0VJ?=
 =?utf-8?B?K0plZmZCbWFPUldzT29GbWRyQ3M5L1NLTDJoUGpJZjk3MFE1aGp3cnJqV3Ux?=
 =?utf-8?B?ajZobUFuUWVtMWZKbUhmTys0NzB5NnR4VFBIcjM1cTJxMzBEcGZLZGw0aHIy?=
 =?utf-8?B?VVN1R3d0bnZuWVdvQm1KcDF3ZmhDUENORnlsL3VxQUFjcXUvZUlnaFM2NzR2?=
 =?utf-8?B?Z2tUMVdjMUgvWldCYTlHd2s2K1MvYTlpclp4OHAxdS9WbHRrbTdocWFuYU11?=
 =?utf-8?B?c1A0RnI0RzNqa3R4Y3hxcDRTeFpGRUM1UXZjWHMwR0hrWjByazlPdFRtWmsz?=
 =?utf-8?B?enBGRGdKWFlXVXhCVmErSVBHNXRReWdrWWljT00zM3FSWWd5cHVVZVM4Y1k4?=
 =?utf-8?B?am5IRVhsTlozQS9SajlaeVlNczR2YjVZaUViaFA5bk9BYjAxRGdnWmJqeDNZ?=
 =?utf-8?B?b0s2SDJxUjdXVGV3aUloMG1vOS9yNEUrckR6NElpZ3d1dlZKclBENXBsQzZV?=
 =?utf-8?Q?PvLulV1hy+nAw8nTVq2yDemzL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d9d2fc-e248-4a84-5138-08dadc5548da
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 15:26:48.0506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuUwSYZDsQMSZSwttrzz7YO32dPwETI42SYNjbL3cXKZqoE8elTLN9fTFH3bNd8dNws0zUSbZQ1si/hiKt0HNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966

On 08.12.2022 14:26, Sergey Dyasli wrote:
> @@ -648,7 +648,7 @@ static long cf_check microcode_update_helper(void *data)
>       *   this requirement can be relaxed in the future. Right now, this is
>       *   conservative and good.
>       */
> -    ret = stop_machine_run(do_microcode_update, patch, NR_CPUS);
> +    ret = stop_machine_run(do_microcode_update, (void *)patch, NR_CPUS);

Just as a remark - callback function arguments like this one also would
be nice to be allowed to be pointer-to-const, but I guess we'd need to
introduce some trickery to allow such despite the lack of function
templates (and even if we had such, also to limit duplication of binary
code).

Jan

