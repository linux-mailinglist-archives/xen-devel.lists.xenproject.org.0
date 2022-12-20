Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D26521E0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 15:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467061.726058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7dAn-0002ls-BY; Tue, 20 Dec 2022 14:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467061.726058; Tue, 20 Dec 2022 14:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7dAn-0002ik-7T; Tue, 20 Dec 2022 14:00:49 +0000
Received: by outflank-mailman (input) for mailman id 467061;
 Tue, 20 Dec 2022 14:00:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7dAm-0002ie-Na
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 14:00:48 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2051.outbound.protection.outlook.com [40.107.15.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 829333b3-806e-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 14:59:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8524.eurprd04.prod.outlook.com (2603:10a6:20b:433::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 14:00:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 14:00:45 +0000
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
X-Inumbo-ID: 829333b3-806e-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1FT6EnAxHlo/p9BzYMZ4NXuOk7jdGf8z+lvTMExcIaLn4R5/Mkau1O7Bl746FTMVTa6pMpY9sf52QaVlLCWU0REqeJhfcaUwcwVZFmxuJybwk2WeFch2OYrqVo8UY1ywDN7vlTb/aFZFX6TeCifi0yGX+6iWNaxw+Vk4C/DzDIOG0ojZQXiBgXhTuJ2vqENQr46+ggDHGjLi+ejTPWT14uDelqZJ8bQ/gutQu2NhnYjuXuTmzIpb6PK+i2VQ8UeUAa6m5U+B2gAyjtTyUJIoY/bWZdhcXj2EXjWcbqamDYmkHwXs1MgrXdevUf8JFnPI5+2VzcdvfOmW6lDw6OGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mL3IjGEWlD1HugB7KLYDxvml1PhJIU23PZZC5HE6BU=;
 b=Uv234/XCIcOr8PQoGOMrz+Vxyvf3aLxxFlVRL6pbbNOL8zbJxnqACD1CphrZzmUsz0YKoRzFUxwrOMU7VGm/dxPw4MZXkN63x2UH9aMOi3kSanTVmY6VKOltS1AtPETnPTThwtkx7gklmHFPX9chTgWi2r/b5y29d9UjgwoshbHYQlP6iPkxK0U1BfgphlLMQ4amhkqQHEUAfJohTCILiPefV05XvK+SW9WsVMbp/yg+qjK5RenEqVi3eFclXXMZIq2RRVlcRMRW8BPQRc6EebERd1t+xXl9E+mWv+GHKSd6v66gxpNhmWK5pGBEGBmrmvC9wrO7AcMrj/Fx0CCPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mL3IjGEWlD1HugB7KLYDxvml1PhJIU23PZZC5HE6BU=;
 b=5he9f7FBEjcgA6LTjmFd6Ykip99SfhyiUvq9tL8JKPOnOMWpO0dDN78poXnRz2V7DZpOH/s+NAeN+unY94NnOO8E7q4jzm0IYjhYSq+7Ns2jodYy3LKrb7al6yBhprMsjFLEr0LO0464zHEELIBanXfLF5KCQgoivFcK7ZpbgspvvcZ4m3t8Dm9NqJ4AQpJ65Iv6dd0mielpdvcHL3GrylpvOVjZ0P6rO4pQG9R+lMbWAWFjEDYMI5oEFJ5PXw8Git9Dn4zEbyVtxp/mEvcDwlc23BQmogLxl1xQrS8pSQpz/p0iD9zgJ7RzqgfPX8+hEMUEQ1jyX+Z7poGJnL8hiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8171ba3-c7ad-0cff-fbed-cbb31c05ef1d@suse.com>
Date: Tue, 20 Dec 2022 15:00:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/3] x86/ucode: allow cpu_request_microcode() to skip
 memory allocation
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221219144533.19836-1-sergey.dyasli@citrix.com>
 <20221219144533.19836-3-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221219144533.19836-3-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 02bd4718-3f36-425d-81ff-08dae292970d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+kOSRxrNOuUawoTX2nNiqEmxfsX7bVvXUsJip7H9RQVQTyJEvSMkVISBd3jiWzUGyFe24qZ9HBKHQ4iqMhTw7kFlxzoI7xrUzD0wTm6XewDHMrvDzF1MZNXzukS/yIJYyUYiZ6BWkeBKnJWzHXa+1ROqYsijBFLgve6z8LAtnVhKFpITzRpEDK9riSRzTDSkrszMXb/wQIPD+t63bkP1/yAkWd06w/SV7jhf9fTjPSUs2f3b/C+AIf9OW1BjwnOuCAR3MXF0kUpM8Ay4nLW3PTHlEplpeQv1ZQFDg/+SIficjSub/S62wVgUUx/yfJr6pr8Z+Q/rKc1YW6f9QVuZRhO3VhCd5Wf0sm6FovnWLLp/IO0YqOSx4FJn/WYNjaMYjta/7tvpo5H3LetXHKvD5VDlQrf97k2d1CsF4Q3nLYo0RlzaUig1+4rnQkUUXDGHDtQ7f3enYGlKniMyOIK/as8/Y7VQhO4AcbjZXjuBE5W13Cp2+4XqOhcuqstabKnofcB86Q4cThGz7ohmHBVL3FWkh2tniYZU4EiPQSyN2xpspUPoq87NxlAFgPoVDbJ/WbNoih/BNU5/h0PZRe6DXxQM8tC3cWik/+c6avaL2X36g6Gn1lzoHzAcppk+uoObmCAA3JzhDLCvErBumjGdKP7MaMgh4/8Dhj1pVww3CcipV5c2eyCPXWUL3WwFfarL/n2DKb2sfsyCMyzvUHgCnQHIa5LqmcGTYJ9C6LfZk28=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199015)(41300700001)(8676002)(66556008)(4326008)(31686004)(5660300002)(66476007)(66946007)(8936002)(53546011)(6506007)(4744005)(6916009)(316002)(2906002)(54906003)(36756003)(86362001)(31696002)(478600001)(26005)(38100700002)(186003)(6512007)(2616005)(6486002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0ZpakFIYW5YMzNKZStIaDVKNnNtYndPZTRkRlRRT011Lzc5ZTFNYm1rNENw?=
 =?utf-8?B?bkttTmFPd0V1RWpkMjdudTJEbzZoZUJxaWNhNG5hNWE5NWFWYlJOUDRXVEtk?=
 =?utf-8?B?TXAycEdTaEp1UFVJU2E1TEdGSUl3b1RrRU5HZ25mamhHbnpxVFJQakZqVzFt?=
 =?utf-8?B?Q0l6dmpmS3pKZmpmVThLQWdwVm9nRzJDNVlYaHdLZFcrTmQxaUVHUlYySTI2?=
 =?utf-8?B?OXdKOFJPZVNsVTIveEZIR28waDhaa04wekZNcmx4ZFNKRHM4MXJFUTJ2UFVa?=
 =?utf-8?B?cXM5RGJYbFRzVFp0eE9kUDBxN0F6UTNsOXF4TUNJc2NwaVJESUgxS0xNQXZj?=
 =?utf-8?B?ZmljRXNmWEloT3dkVk9IUzRwcm1kcjdwNzZ4UjdENEc5SWpWV0xackhRcjJN?=
 =?utf-8?B?QXNETDduMEF6aTFzSC8wNmRWZ3N2cy8xaXZqZ2dESm94b3FKSmVpeFVmNDVl?=
 =?utf-8?B?c3hyVW5OcWxiM3pTaXZKOEcxUWt1ZlRQS3pwcnNyQ3NLc0s2ODljd2FQditT?=
 =?utf-8?B?bDhNelNINWNxclFlWCtBQ0Z0UDFMMk5CNkhVci95YTg0WnhmUHZqT1ZNa3J0?=
 =?utf-8?B?eUVPTnNyc1ZBMDBVeC9FQmtpSmZZVXgwRGxRc3FnS050WTZqYXRES2J1Q2pT?=
 =?utf-8?B?dkxyUWcreTJYNXprcWZnNXNnaWwzZ1RjYnVNdUxtTWxXcUdZTm40SDNHTFRQ?=
 =?utf-8?B?TXV0Q1Fsc3NzZTNsd085aXhsand3bzV3VDh4a2F5TUpsRWxSQmlpcUVwT1dj?=
 =?utf-8?B?WS9Gb3Y3bWVXL3F6MjRJbnQ1UnN1S3hBRm1jOUpRaFcwY0JRWVhGeWs2eEJh?=
 =?utf-8?B?UFcrczRYT1F4a0IvOVFVdlN5bzRmVjhaTWFrWGtiem9TclgzSEw0bUNCV3ZW?=
 =?utf-8?B?TCtVNzFNS2ZYZVU2NUMrQVN0QjQxalRHSVFNOEI0eVZwcTVId25VajU3N2Vw?=
 =?utf-8?B?Z3NSeTFoT2xXS1NOUmNNbnRzNVNqMzYraG03Ylc0enozdlUvQnhyb0wvcENj?=
 =?utf-8?B?a09DU2sxekVXa05mWi9TWGdCVG9KQVNyQi80c2tGQ2ZRNWhTaWRFdDRoNkwy?=
 =?utf-8?B?VDlJWjNZV3VBQ0JVRENTSlRJRWd2eExpbUhjemF2MkQ3akFNNEVjaXNmK1NH?=
 =?utf-8?B?dWFwSXdVcm9xMWl1NzdRbk9yTVBEUjg1TkNQVStrWnF4Yks0SFVOVm12cW92?=
 =?utf-8?B?ejBwMmoyRGRHaFhkTFdYM0dPeFl5QnJ5MCtKM0VvKzR5NmcxcEVLelNHZVZY?=
 =?utf-8?B?WTFwVnBMeTZsRXREeCtISjFsSWh5d20zd0V3WnI0T1ZWV0M4dnZWcUFqaGtT?=
 =?utf-8?B?VFU3WTdzM2k2VWRhQVc3U25mS0txNkNGTWtWSmFxN1VTdHBBRlpZeEtpUzBv?=
 =?utf-8?B?WnQxbXJtWlU4YUg2SmpnV2pkRXRRYm1SQnA2eS9pZ2htSWM1MVFITFAvaUo0?=
 =?utf-8?B?YmxRSUxWR08rNEV6N3NwS0ZLVXFiM3ZlUGVnbUJqTmtPQ2xlMytvOEQzbFB6?=
 =?utf-8?B?UERyc1VQSE9hN0xaRTB2RzljU21YR3d4UWhnZ0c4R0o2WWpPek9iZytka3kz?=
 =?utf-8?B?TUtkRFB3dVZmYkpFdk1JblNUUUUva3g0Q05wS0htY2NPdXNUYkV0bnFHRWIy?=
 =?utf-8?B?R3Ezbmw1WTVqUy9DZWhaZGxwK0FHa2NCMmFDV3dVWFRBczlVNlI3aTV5S2tl?=
 =?utf-8?B?ajJWS3hGZnVERW9pQXU2dll4MFVkV2NwemFvdjdUOGo1djc3eWQxMnZjeXJU?=
 =?utf-8?B?MjhXSk9kZVFGZ09tNVZYZSswYU9qRlUxL3FMVUxEV0pEZlBnOWp5QjROZjJl?=
 =?utf-8?B?UWw3UldhdGJnOVdiVW56UE4vWEFXOUQ0Q1BQWndWTFVLQ25PN1RaZmF6Rmh6?=
 =?utf-8?B?R1NMcEpSUERrcmNTSnBla1FxMjdzMDQrKzlYR2VVSHloTjRoQUN0dmJKQk5T?=
 =?utf-8?B?N3B6MVJ3RElLZGVKTGhFbVNocG5KV2p0UkJITmovTEdNcnFmOWh3b0JGVEJB?=
 =?utf-8?B?Z3NUS1Y3VWVhRmRjcmVaYS80cVhZbXJsN2t1UklUckZUdm1wSVVLK3pSelZO?=
 =?utf-8?B?TkxpMDlNbkNJOUNFeEFwTjRiTUh6bDl2NytlNzh0YUxzUHBTeU1rc2k0TlFU?=
 =?utf-8?Q?LTvdjh1gcPKBvr3LLqUeb3oS2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bd4718-3f36-425d-81ff-08dae292970d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 14:00:45.5568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4vHc5x+3ZQaCJi/A7yDjw0B4PkPGCHkZEJi8NuiVPXc933wPVc+kXdQ5MvVlwiRxU2L1pPGMb83HbIl5jt3eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8524

On 19.12.2022 15:45, Sergey Dyasli wrote:
> This is a preparatory step in order to do earlier microcode loading on
> the boot CPU when the domain heap has not been initialized yet and
> xmalloc still unavailable.
> 
> Add make_copy argument which will allow to load microcode directly from
> the blob bypassing microcode_cache.
> 
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



