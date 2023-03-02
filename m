Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B176A80F0
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 12:22:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504856.777287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXh0M-0006dL-ED; Thu, 02 Mar 2023 11:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504856.777287; Thu, 02 Mar 2023 11:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXh0M-0006aB-An; Thu, 02 Mar 2023 11:21:46 +0000
Received: by outflank-mailman (input) for mailman id 504856;
 Thu, 02 Mar 2023 11:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXh0K-0006a5-Bp
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 11:21:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 689d155a-b8ec-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 12:21:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB9002.eurprd04.prod.outlook.com (2603:10a6:20b:409::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 11:21:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 11:21:13 +0000
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
X-Inumbo-ID: 689d155a-b8ec-11ed-96ad-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSn0GbgUYAflcFQ05L7nhAjkoUlBohfpQL0bZUNQSDlTmCjchPFeV61mWsNpHcRFgXaCu9+qLQ309ON9FaETf1BimOxKDpgHSq5d5U4O0REmre0q99iXSviC3rmT/ro0wWycM5hVaZEedLL5G6bqkBc4heZaP2hU2ErevZCNFRyNSUusCU8w1daT86jo7ZGJ4Eh3pLNJGdcE+p8pF9BL2qbUTwDAUD8+sHdZuOYVO/pqdXIvdzkO4uSIrP7d/SDA2aa5+atqHgoXG3q0og/7ELpDFtGkHw7/Wn+Q872c/vnWOAsk5iZQICICzNLLTbcGmnyuWjCtzSo6rkczihlkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKF6TAbUGlScbXpD6OAey4umo16lxka+ymL8p5TWUUk=;
 b=irH8yhEcW37J6n7tLpu58J6CxX/18oG//muxaX4lneBlb+RDIGLySCmOvqfL0p07DH3154Sz5IiQAmzxio4PJoJKGGcnR4kQSnTo8HHPcZ+/H+oxvve+Q/QhbBNm9byA02ofP5Gy3iZlZIxh0XLPx8k3ey2vgxsnlmQxDoKMb/eVbFdaAUbnXJIe0PuS2qRiAQ1KPW3Lz5f4XVWRWTzbPbxDSJlTytwk/az4tKuh99xpA2AN0cS1DW+0EstHx70RDzOZeGLZXIpWoMo1qQ0+hN94UboFsQ61+piFEj8B1owOO/R6NJt5Weji02+0qgefi6MN48hbZCo04AknMhwmlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKF6TAbUGlScbXpD6OAey4umo16lxka+ymL8p5TWUUk=;
 b=NEnC3vYFxcPAkbjONUdqsHdCvcdPPsRkQtl81MvqAn/Oq99ZkPN7jp1TmPTx5mwOB6A7hfxrEKT4muDGt1/QRwkf/QoUmtIps9HN08z4DeopQLs7dOx2baQD0RpF0Txg+hGjdAKx9sQrz1X4tMUk/r0FTt7s09BPWYppwg3L4YqlJf+insCrl7gY2H9E72hZYQYCehpcoILC/izX49GE3OKKjCkV80iEliCnbZpNu82ShWh82f5eaWTVbLNrTBmKDU+rTtjpypHlZu/0rBZP7ULkHlF+IFgDC8rcWkOHuXKjxxZOj6a3cacNc86A4/sRV5H4bEX4idA8utbBXGawcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c401165-6057-2a4c-249a-be877741180b@suse.com>
Date: Thu, 2 Mar 2023 12:21:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen/arm: align *(.proc.info) in the linker script
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com>
 <370809af-75e6-546a-53e4-71a76444f367@xen.org>
 <a9c2638cd8620d74ec719845132ef65f08b4c934.camel@gmail.com>
 <cf15b113-ac6f-e115-6c38-38b25a265934@xen.org>
 <f2f6544a-a59e-2e10-0b8f-080f91708459@xen.org>
 <9e34f587-d42d-3709-9c64-b5e50afdd046@suse.com>
 <7e69d61b-60ca-b93a-36d3-77a1a3e550ec@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7e69d61b-60ca-b93a-36d3-77a1a3e550ec@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB9002:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a3aaf7-7239-48f2-d1db-08db1b103b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iF4DDulYSotiIOBx86tZSTxECw1Zh1ZoxuHCqlo5wGdKpyRUn5HsnirIh+JUtZWaBkjv9LPSc8acayQtaGhEqx8wevJZR2RD+xUkO1DLxzN4cLtVxXB5ffOwWPnaKDpvgA8+YKQTS6xafvkjOLTke+I5Ww/1Z9uR5dq2iK33izx4E03wNPbJ1CVhDGulFKqnOu7u1Qo/IOEsB9HMBB2eZhSmGGXogGmjpxL5TT830u8ahUydOSYpCpaSdujLH+gJJ82nQ8RWpwDAL5Lidb96pAGNQmi2zqnRphh3rDFpQDnNa9EfvnTUZb3OhZydf7/dGpORcHev9bivKfTPPNF0E2V8sr90KQhm44xn1YbdzUJC6gPO8KYMOamkZ/6XvkjCl4ouFN2IM85Ds4L/fHc1407Lmh9UrseBEEipoURTG50iMQIqo3eCXJy+bXbFpk7zl0Tk35ch/6owbm2TFSkPTnXSH6bZ5h1mn1VGUQcsKlsdOt59GbywKtCfxYtzmTHn7agpa1DY7wOllWjXOPjki53sN1weSJTN2xZX4c9vR+kgChnIcOyaj0lqZkI+aIdE0ro79dK8sJVvAQqdmQBwb2npxb+uYxalb3Py1D4dfawsy4qls2Jup0/2AxOBQfGM81WpPwBxpAWKWxp0yQv2g1dJJWbTsJBe1jnqg+WbtrotKV1QkKIO7M3YEeytqZmo6vx1QJ3dKu9E31ggMszZb6OHxRT/88Onu68Oc8PY/p8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199018)(36756003)(53546011)(6506007)(6486002)(186003)(26005)(2616005)(6512007)(4326008)(316002)(41300700001)(110136005)(54906003)(2906002)(8676002)(66946007)(66476007)(38100700002)(5660300002)(478600001)(8936002)(31696002)(86362001)(66556008)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFl1cWRSODRrS2gwK21kSWdBN1VLaHk5ZHRscitHN3ZYMDNLcCtVZWpoRHJE?=
 =?utf-8?B?WnM1S1pEU1lsdGZlemZMRldjNmQ4TlJvK1IxZ09jcmJ5RDZsbFNFQ1hTNy85?=
 =?utf-8?B?NHBhUXFpNUVMNU9WZ1FYUkpzVmRuU3ExMFBQaCsrRzk3d3QzRUNmN00wK2ZV?=
 =?utf-8?B?NU1DaHhrSmJ1OUh1a01kRE8wUjhjK0Z5SnJ5c2RMUzFqemZINWVVV0NoejRz?=
 =?utf-8?B?ZkFIbFIxR01BWGpFZGxrMG83cjJqaTZSMG5YSURIMEtXSHp2VGVLb210cmtp?=
 =?utf-8?B?WEVJcHFnYkFDWlBCanErSTVmT1BlVGdURFJzU0xpOHFrZ2pQUnRnc3JkQXBt?=
 =?utf-8?B?Nk5vMXo0cG8vNXRJMmkzNzI0UmxYdlpkWm1mTmhENEdqRnJsSUcvMUlLQTBE?=
 =?utf-8?B?Zjd1NEM0YU1CVm5RZzAvMVRsOW9ETE0zTlRSL2UwNGRqZ3NsMFFzbXBobDJ5?=
 =?utf-8?B?R0xQbjlUaFFLK1pGeG0vSXpnUnVab0ZQMjJraUUyODNCa3F1c2JURlFLRUVH?=
 =?utf-8?B?UjVab0JnV29lWVNEQXdicWxMRElJQ3dQdWR3dkZyWi8wQ3UvMmZFNnQxRmFB?=
 =?utf-8?B?LytsODZYakhUUm52aXlzNkxQTlRkTXVvbGZCQUFsOTNmUjk4c2dvVjZnR1By?=
 =?utf-8?B?SFlPMGlHamxpZXFaaDFGZ29jTGUvTHBFRHRyL1J3UVd6TEtKOUZrWENnYngw?=
 =?utf-8?B?WHVDNkxBSmdZZFZlbGFVaTFqa2ZSZ2JBOHQ2QVBOMTcrYksxcnZicVNWTWM3?=
 =?utf-8?B?RExoTmF6NE1iWlpHcUpQQjF2OVpzdG5Xb1p4UkdibHhFR2IvWitqYUFlaTJO?=
 =?utf-8?B?eU12ajRFVm9DVC9icDJ2RXJZeFBwRElhVTJtS0xUcVFHa29sc0c5aTlsNDRr?=
 =?utf-8?B?OUVYNmxBZzNpUTJ2QVpxUGFYTGV6eWw0NXg2bitMTUxsWi9rbk9yYm9VNWFK?=
 =?utf-8?B?RXRJSldmYlJQaFFJeFhsTUs4V29jbCtidXphb0FrL3p6NWZXaEtpNzZjcC81?=
 =?utf-8?B?NFNSdzY5YjIySGpnVCsxZm9xbWVTVjBKZjRnbTBjb1htc2NrZC80bE54QkRE?=
 =?utf-8?B?Vml3aHp3WkM3aHB4cFBhc0U0Uk5EL1FPY1R6Tzl4YmRnc0U4SmsyUXl4RDc5?=
 =?utf-8?B?MHFpTStoK1ZhYVBJRVlzVURmdTJzaHROYjAxcis5ZklZckZZUUZWKzdqZkx2?=
 =?utf-8?B?NTRqM3BBdm9sdGpIaGFqNGxleVl5bm5KNmhPaDRoWE9WZk5jZnpTWGhkMm16?=
 =?utf-8?B?ZFlRcEs1cDJ4aVJ2RFRXTkxmNEsrWmpadG12OFRSa1dodGxDYTFFM2VHMkhV?=
 =?utf-8?B?MzlneHgwRzBJWmRRbk0wREI2UVRjR2FGV3A5TnhuOTN1V0ZnL01LWEJKdXhu?=
 =?utf-8?B?d25sMDJPNDk5bEUzbjBnYTJHQlhqTlRsWWhhOGI3QzlxU2hETlByNGNZc2lG?=
 =?utf-8?B?dUNTL1c0cWNuS3RRTWo5SGJsVGlmNHpZMkgvanlMVVh2Tk1pb083eWVKWHQ5?=
 =?utf-8?B?VXFScVVjQ2ZwR3VwNm0rNG00L1NVZC9mRWI1VnBUSmI1Sk01S0p4bHl6Vi9u?=
 =?utf-8?B?Y1BycmJsTXY0NlJ5ellIK1FtaEtOd3pYdWNlcjZhb24rVEZweUZNV1hhRm5o?=
 =?utf-8?B?ckdiM1J0ZDBUK3JaTjdlbmkwWXpKNTYxQm5mUGJHWEdXZmpZK0tCTjlISXhm?=
 =?utf-8?B?ZjFPTXVIM2crdjFMdUdMUHNQNzhaOFcrTEd3RWR2WmpCM0lJaHlsYmhOUUZW?=
 =?utf-8?B?NEd6VEd5SVl5WlB6NnFNNlZuQXA4R1ZQQXVKK3psOTllQkc5ZVdZaHpFcWZU?=
 =?utf-8?B?RGxweHpjdS91aCt2Uzg1TG9CMmoxeDlsVmczc2l2QWV6Mm5YVzlsZ2RHaDhR?=
 =?utf-8?B?SStNZkFXTDRWL2dQZ2ZtZkxSQkpBbnhld3pUUjdkNCtiSVlLV1BGcGtreDdq?=
 =?utf-8?B?VkhUWHZsekFYc0pXWS9SMm1aekdVS2FySmZSZlROcS9sNU1jSVd5ZTdSRWlL?=
 =?utf-8?B?Y0k3ekhkVzFocTFTZ29vUXRCZVNYZGNPNkpndW1tbjVlZnV5ci9pQ3JVL1ow?=
 =?utf-8?B?Z3p4MzQ0WFdyY21qZmtMSjlhK2ZtdzVKdkc0b2xubFJWejVKNGJVVVg2aFAw?=
 =?utf-8?Q?eZyp2xhP46MPqLsjELs1uXwlg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a3aaf7-7239-48f2-d1db-08db1b103b79
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 11:21:13.5572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zU4Ur0THwG0uavxen9NNVcrduErIpKFjtmiikwadBvYKaCg248uK0sZcI3V0jhv/4LRJ5BWFJFUpgxzB2A0sHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9002

On 02.03.2023 12:01, Julien Grall wrote:
> On 02/03/2023 09:45, Jan Beulich wrote:
>> On 01.03.2023 21:38, Julien Grall wrote:
>>> I managed to reproduce it. It looks like that after your bug patch,
>>> *(.rodata.*) will not be end on a 4-byte boundary. Before your patch,
>>> all the messages will be in .rodata.str. Now they are in .bug_frames.*,
>>> so there some difference in .rodata.*.
>>
>> Strings in .bug_frames.*? This sounds like a mistake, which - if indeed
>> the case - will want investigating before the conversion series is
>> actually considered for committing.
> 
> No. I misread the code. But there are definitely a difference in size:
> 
> Before:
> 
> Section Headers:
>    [Nr] Name              Type            Addr     Off    Size   ES Flg 
> Lk Inf Al
>    [ 0]                   NULL            00000000 000000 000000 00 
> 0   0  0
>    [ 1] .text             PROGBITS        00200000 008000 07e7a8 00 WAX 
> 0   0 32
>    [ 2] .rodata           PROGBITS        0027f000 087000 02acc8 00   A 
> 0   0 16
>[...]
> After:
> 
>    [Nr] Name              Type            Addr     Off    Size   ES Flg 
> Lk Inf Al
>    [ 0]                   NULL            00000000 000000 000000 00 
> 0   0  0
>    [ 1] .text             PROGBITS        00200000 008000 07e670 00 WAX 
> 0   0 32
>    [ 2] .rodata           PROGBITS        0027f000 087000 02b3e8 00   A 
> 0   0 16

I still find this concerning (as in: at least needing explanation), as
the bug frame representation shrinks in size: Entries for assertions
remain to be 4 ".long"-s, while all other entries use only two now. So
in a release build the size of all .bug_frame.* together should halve,
while in debug builds it should shrink at least some. And Oleksii's
series doesn't add meaningful other contributions to .rodata, iirc.

Jan

