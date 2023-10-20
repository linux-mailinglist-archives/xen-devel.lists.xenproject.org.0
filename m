Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C610D7D0807
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 07:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619644.965071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtiXN-0004eY-Ev; Fri, 20 Oct 2023 05:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619644.965071; Fri, 20 Oct 2023 05:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtiXN-0004bz-Bt; Fri, 20 Oct 2023 05:59:09 +0000
Received: by outflank-mailman (input) for mailman id 619644;
 Fri, 20 Oct 2023 05:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtiXM-0004br-4c
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 05:59:08 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01hn2238.outbound.protection.outlook.com [52.100.6.238])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6f0c32c-6f0d-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 07:59:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Fri, 20 Oct
 2023 05:59:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 05:59:04 +0000
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
X-Inumbo-ID: c6f0c32c-6f0d-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gubV6prH5Orxw8DrwHsAMsr4nCCApNu6rkNgBdp/iUUfnPGRCTkdeUBXCGKCFTMTLks/msHdq7kEDQWcXNcEqeMQyyWM1NNjCpeoUVkEIa15tXlMBu7kghlwXW9VHV/vkhVPLxdGAywYe8BUgg6G9VYulvof7NflZsC5+mfj8PIEyuLcOHYidSH+fiORjmJBsn6ecX6RvxIk1VCrLo6Ey1IPHcgARyA1yxFPwSHDMZzGyzwlRDEWrmfL81iuXgjd5HMKg6c+g64xUpT3E4scy1pHpzqJoZRM5W6hA94OCvVDQ1rCImV+YI4r2+NrOtwnCmzQfTJ0VnmdgSKy7aTCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHBpAN4uqbwsMdfZ+zIl2Q1dKnK0ZHKEf8zTcwbz0zA=;
 b=i+Fs8Q9zk8pd4//VPg9TyS2iHWG3zPUHu6QPCnPRMHB3raRky12c/C/Oh8gC12PFWCxJ79Lr56vf/baxuYUA/+7XlLS8E9zlJtfXH5YMiBfbyJUZLQ7TpoJg8ja7cSqiJSnND0NqwJPDdtFSEo4VfXVYTAAiiiIbvHhP83mj3vCb2FYuJwOC45aYEazKuICKtjkzRN2nendUGHLrhFbJ1p1k1LhEh4yYqim41Gg9NXB4NpozbiubEaiTed2fm6sB2G2PRvAu5amLuy+QS8bHwTA/6NkPNtZEzqLafSWZudJHgagrUx8+jvm6l0T20/HnLgn12Q9IqPOpCklfJtb6mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHBpAN4uqbwsMdfZ+zIl2Q1dKnK0ZHKEf8zTcwbz0zA=;
 b=310vCVaCdH7ulk2PVsX8cacD9qaOgzDU7M2+BwIFSZer0HE4/p/LSePvK6ibhJIs+d5Qvr2Jg9daFBoO+JW/IbW1FfRTxBn/sWPcYGnLVqEOX4HqWzn8NHR4T/okIIkyDOloJDMKXoPUphZXcQVED6mVDY4dc2Rbe9XN83mQCEk98ZNo0spvluDzaEGFuRROHvZGuT1WfZPKIdWIsCqHRSKFDuBhfJm7TIccuFw3MzSVcOUAxt8Zy4pZWJpOx+r4fEtOv2xAB80bdES9ZPS5snQXUsD+T6NMPWVcJT7un3vQT/bpLPKNzpp0t6Ud+fE62XsG6gN+7aw9pucegUgROQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42132ef5-ddf5-a7a4-70fc-ccb42419300f@suse.com>
Date: Fri, 20 Oct 2023 07:59:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] CHANGELOG.md: Set 4.18 release date and tag
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Chen <Wei.Chen@arm.com>
References: <20231019052050.1032492-1-Henry.Wang@arm.com>
 <20231019052050.1032492-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2310190913360.1945130@ubuntu-linux-20-04-desktop>
 <8327F8D2-72B7-42CE-A31A-9E845A38DAC0@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8327F8D2-72B7-42CE-A31A-9E845A38DAC0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: 501525e4-c95d-4ca7-4a4b-08dbd131aa36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZStSbXNPWWVxTnQxY0VvWndXcmVqaDRBTVdGRFUzc2IxbDdBMW5lK253eEJP?=
 =?utf-8?B?d3pQTWowMGxmcmwwY2FJa0hjMmxIdXdpNUREUHVwNStnYkVmV0wzRU1OeDlQ?=
 =?utf-8?B?em00UTZuTUZ5V0p5VmVVZ1IxVUd3aUtjNUltRGlob2hYVDZ6WUxXQlM0c0JR?=
 =?utf-8?B?Y08wUktCTTVYY1dBbXVwanhrNmFMUVlSa2E4RXlSQUxhTW1ybmxwNnFpZGN0?=
 =?utf-8?B?akFGNGdpSEdqQjdQUUROZkxtK1hBMjd3SVZmUnM5Qy9KMlBzWFRFMGdueG9V?=
 =?utf-8?B?MHBTYWUzT2t4djZwT1AvUm9DZ29pcW5Qb3N4TnhYeExobS9jbVQ5OW5Fc0tm?=
 =?utf-8?B?N2JmRE9ENjNwVVMySm90YlFDTThteFUxMzEvZTV2TldJQm16S0ZkMmRwV3pZ?=
 =?utf-8?B?K296c1RzZEM5NVgzRkZ6NnJ3MTI1SkM4QU8xbkhjNDcrTnRlNjNpRHJvNE1S?=
 =?utf-8?B?SlVSNWtZVk4vZHF5a24vK2pVdlhsbGMrQm45S3c0TDJuOXNmSFpLMjVDQmpJ?=
 =?utf-8?B?YjVNOWdycW1VVkxRUEtEcVIxL2VGQW9EaEo5YVlMd3RTcDExbUN0QUlCd1Y3?=
 =?utf-8?B?YXpWZExwVDhoTzFWNUpyVWl1dUprOEhsTW8zRFg0WmlCdExrUHZmMXRIanN2?=
 =?utf-8?B?N1FQaHMyN1JXUENUWDhocjRzbkZBZmdHYm9ZbTYvQVhmNWRiMFlTbkpMbXNV?=
 =?utf-8?B?OWQwOWo4aWhoc2plb0hPMlBtTWwyeVZkTkxqUXNhbG9MNkJoY1BpSFRVVjBl?=
 =?utf-8?B?ZXA0WnozaStSd1lkUDl0RS9xYU9sWjNxenZXWXdEUjRLUE9vRXQxaE9PVkNo?=
 =?utf-8?B?MFg1eGY3d0loV242Q1JUSENUN25LZTFLeE1JczRqK0cxZWxDSjBncmVZTFBW?=
 =?utf-8?B?cDNFdWZuUS93WTZVRjc4SVpZTnRLZnJRN2duQ01VVjN5SG9EaFJqeG1odEMx?=
 =?utf-8?B?bmR3SkZjZGpIamF0TWdaZGhJSVcwOGtvbHVWT2FxUUxjTGNxUktISXlKNkJP?=
 =?utf-8?B?OUFwRmM5RlhyMUhkNVNQTWtJSnoyWUE0S1REOWJwQlVjZFNmb0FqMTRVK2Nu?=
 =?utf-8?B?WjVYbkZieURrUGxlZFJEUmFTcHNCRHl4dU1uSmpQaVRQSzVqb01KZi9McVB3?=
 =?utf-8?B?TERveHp4clVHTEVxSTFNTHJDNlNzamNiNjZaeXBpRUp4eDlodjYwT2VzYXRB?=
 =?utf-8?B?bWR3K3JQeWM5K0VJOVJNR01JVXl3QXZsZ3NFUVd4YmNCK1RhVkRMVVpkeWZI?=
 =?utf-8?B?dEpCZVVMajFXYVk0UmcvNzdvcDFEM2w1MENHTXZ4R0pweXpXU0xCTXRESk5N?=
 =?utf-8?B?L1pFYzhSUTRRRzJtaURlZlZKM2ZwbHcrVUF5VUs5UU5BV0V3ZFM5UWlQYlhu?=
 =?utf-8?Q?+2yqf7M4XaAlmtc1YRYf+u8ahLRkJPrA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230031)(376002)(366004)(136003)(39860400002)(396003)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6512007)(36756003)(31686004)(316002)(66556008)(54906003)(66476007)(31696002)(26005)(66946007)(86362001)(38100700002)(53546011)(83380400001)(2616005)(6506007)(110136005)(8936002)(7416002)(2906002)(6486002)(478600001)(41300700001)(4001150100001)(8676002)(4326008)(5660300002)(71176010)(59356011)(219803003);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckNHb2h5eHRNdnppSFNlYUo5VTFhS2hxT1lET2xyTkRBcmg0czBPYmxhR2Q2?=
 =?utf-8?B?dzUrd1RjcHY3OU94UlZPTG1mTkJTWWMzWjhtTHZLSU96OEZXUzJJYUl6TmdX?=
 =?utf-8?B?M0p2ZklWZE5KWVJpN2JsanRtUWxKdS92RDUzeFhEUVFGeHpKYkVJUWFyZmhM?=
 =?utf-8?B?Q3JHTk8rd3FEU0dSQWZoOUhhREdRVjBlcXJPQS9DSlBjL003WEVxUFpqL1Bi?=
 =?utf-8?B?bm9MTzFHNk05WmVvbWlWVnpkWm9Ed0dMYnI0QkZTY3FyTEtQT2JlbWdwTG02?=
 =?utf-8?B?VmxrWU95VFUrQlNoTTY3TGxIU1RDNWJzOTRBOVo1eVRvWXZDVVNESFZsR2Z1?=
 =?utf-8?B?Q2JzUmcrMis5SmV4eVUwOGRUV1pqRWRrZ0dIci9jNVhUUkJTZzIrMC9rUmpz?=
 =?utf-8?B?NzFheng2bHhoanlyR3VDY1RsQXFkRG8rd1dwYnVPSE8yWmQxL1VyWTRoSG1H?=
 =?utf-8?B?ZWhTSEJocjlmKzFzRnk5clZXNytsdWt0LzBZT28zZjJxb0JSanM3cUFZems3?=
 =?utf-8?B?TVg1U2YvWG9NTWU1bE5yUlh4cTAvUGd4VWp4WDQrZEFoaTdJeXlOWUI2eUYz?=
 =?utf-8?B?TkhDUUhLaGZNUXNVUlptUUdoTU5jWVJueXU0eHkxdFRxYk9iL2dmV1pncmp1?=
 =?utf-8?B?SjFySEZORVBSZDhSc3AxSXJkdlFDVXZ4TGxMVFNnN05NVnRJMlBqUlY1QmVj?=
 =?utf-8?B?cWI1NGVzTWdCM3hyVHV1aVl1TkRKK3VtZXlHMFpFc3lkNm1kK0hLVEkveUlS?=
 =?utf-8?B?bUxlSmxqZE5CanFqelNrMzZsUTh1L1MxY1FqWDhHV2V3S2dINUtHZ2twWnA2?=
 =?utf-8?B?M1FuRzVpamRMMGdwWk5EZ0Zucnc2a1N5UEV3VSsxdVpLNE1pNUdueUVFYXNo?=
 =?utf-8?B?czl4WlJjQ3hta2ZxZTR3L3V3b2EzM0tlb2dWR0phbktTd3J5TW1IWU0zWW0y?=
 =?utf-8?B?S3JuL0FGMnY0T2NqOHhmNmxsUFFlaXdEd2FFTEdrYmVmYWpXVlhOOGhScTJ6?=
 =?utf-8?B?UTg5c1VVVFhsMndXc2luS0RyajZqdmdoNTVNMXluNzA1MVpFN2ZCRExjbEU4?=
 =?utf-8?B?YnRaZUJsNEQ4YUppVkVJa2tpa0VzK3ppVDJhU213dFBaMnoveDR4YkpMV0dy?=
 =?utf-8?B?eE9vYUt2UDlYNGRRbFBkNzIydWROZnRoYkJiajFVWnk2VHZma2ZrS0kvazRZ?=
 =?utf-8?B?S3FYaytyVVc3eGJ1TGNsbmVQNFNvdjk5V0piNHMwVnFtYnI3cFpYV3FEcUZm?=
 =?utf-8?B?WldWa2hpenRscjJQZm9LeWlxY05XNW1xQ2U0SlRuaERKOVY4S2p2a20xVWdt?=
 =?utf-8?B?SWVCeVY1SmwwWE5aUlFSOU5BSU9RWitBbUllMTVUcTNYTFBJUVQ2bDZhUEcx?=
 =?utf-8?B?WlFSOW5Qeld2a0cyUVVpRW4ydnVzc1o4bXh5MzBCNnI1OTM1Yjh6T2MvdStx?=
 =?utf-8?B?RDVHRkJMcUxxZkRsc2RuZ3dZdlkvQVRUU05CWmJkOEc3aks0bVJYNmE1Y0Rm?=
 =?utf-8?B?MUFIUXdCT2RWaWVPR0ZoZUVRUUplelZLdXVRb3g0SzQwZ2syT25va3B5dVFp?=
 =?utf-8?B?bitneXBLZVAyZjNUa0hwK0RaVUZjUEp4c2E3eVdzY1Ezd0NIeXMxSzFrT0sw?=
 =?utf-8?B?aDhFQk5wL2RsZmJ5M0NsYnhhSXNnSjhtY0FDeldkTXdSOHhuL21TK3VHMWJN?=
 =?utf-8?B?UlVoQy9wdGpTTmx0ZVhjczY3VG9SNzdGTGlha3pDYTVQUUF3SEMzQ1FIdVpM?=
 =?utf-8?B?Z1lhckw4b2dZdnRpU0NuRzUyTi9CV3VKMm9kSTZOMThSTUN3SVU0Rlk1aWhP?=
 =?utf-8?B?ZjQyeXFqUkUwYjlSQi9pR05LcjEyUTEvMUpWUHpzVk9UQ3E4OWU5bWV1WE4v?=
 =?utf-8?B?clc0RDhpOHNTKzRKbklXd3JWZURiVmR5Y1VORGpYYWZvc0hIZ2k0ZXFWTk9U?=
 =?utf-8?B?cnpCa2VscGJGWk1JL2FlRjFPVDA2M3hMTzk4a3BIQ0dnL05TTTdhbzl5M0Zh?=
 =?utf-8?B?dGRIdHRCNnBZUlByMFgzZGpRZndGMWl2eHRHRVZjdHVtbXE3U0lHK0RNYWhU?=
 =?utf-8?B?RmtPcitnamdjeGw3c1VvOUxkSldURGpCSm1RQVZjOWJFT0tzTU54cHVma2ZY?=
 =?utf-8?Q?mmpVzGnPcEII8bmwH0ByLr+hO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501525e4-c95d-4ca7-4a4b-08dbd131aa36
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 05:59:04.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqvCboaFpYpuSiwDeM5necAZftPA2TzMTngUkrMjxltuhzCiQ9U+fxeIJ9k2hL1NYjYThKIPWZbD3iT9Vsn6hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726

On 20.10.2023 03:23, Henry Wang wrote:
> 
> 
>> On Oct 20, 2023, at 00:14, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Thu, 19 Oct 2023, Henry Wang wrote:
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> ---
>>> CHANGELOG.md | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 47e98f036f..3c83878c9b 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -4,7 +4,7 @@ Notable changes to Xen will be documented in this file.
>>>
>>> The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>
>>> -## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>>> +## [4.18.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-10-30
>>
>> Should we use xenbits.xenproject.org instead? I think that's the
>> official name. In any case:
> 
> Hmmm, good question, but after some deeper look somehow I am more confused now.
> 
> So if I click the xen.git link in xenbits.xenproject.org <http://xenbits.xenproject.org/>, I will be directed to
> "http://xenbits.xen.org/gitweb/?p=xen.git;a=summary”, where the http and https git URL
> are both using "xenbits.xen.org”.
> 
> However, "https://xenbits.xenproject.org/gitweb/?p=xen.git;a=summary” is also a valid
> link, but the https and http git URL are still both using “xenbits.xen.org”, also, all our previous
> releases seem to use "xenbits.xen.org".
> 
> Could anyone in this community long enough provide a bit more details/clarifications on this?

Well, "xenproject" appeared later as a name, with the intention of
becoming the "canonical" one. Still it was likely easiest at the time
to simply add respective redirects in the web server(s).

Jan

