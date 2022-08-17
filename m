Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648DC597178
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 16:43:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389001.625796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKG8-0001CQ-GD; Wed, 17 Aug 2022 14:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389001.625796; Wed, 17 Aug 2022 14:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKG8-0001AR-Cy; Wed, 17 Aug 2022 14:43:04 +0000
Received: by outflank-mailman (input) for mailman id 389001;
 Wed, 17 Aug 2022 14:43:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOKG6-00019Y-Rx
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 14:43:02 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20070.outbound.protection.outlook.com [40.107.2.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4ead1f6-1e3a-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 16:43:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5313.eurprd04.prod.outlook.com (2603:10a6:208:c7::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 14:43:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 14:43:00 +0000
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
X-Inumbo-ID: e4ead1f6-1e3a-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjkYnxQzU/ZzG7VsHlEEy5H2kpI4dY3InsksK8cnhK6ki4XrpKFgy4uSDpB2595GxU5by96lu9jTIOhz+MdkBKRuKD1zYBPiSWEtW07m6Vd4JRRs/h5Zk8eRNOK3nL2g259NyeuzXeKTASS1ds5zL8MrayMqY9lCJ3NAmFVBLQvQIwqpOIoQRCx/V+fS5697pwPAmExf2ZZ8bHLIETzaYlPun6wAFt3QFDxmzH02rWOaInjRWRTnTA5DQTq0MQETeJ7hj6mgju2QdURVDHQdeW2ulaTdO1/vwIm6Vw1AU+SQesVKgfrLZHMTE6WwPSsItSqfKt9bYMJbFPiajq19Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6conJ0jUgrUyoHKEl8/wKGYfP+skB3i8qnunWGJ9EA=;
 b=c7J2A+lNQz1Qu6NkK5qfOWIDmd+tu9VQomN8CahdLpbRHy+25eUrpQK6cg89Je3b6NkusdixRnVLOIu4mP8ldpghpfDOlWgs4aeE5hvYXIMpEnJJj6G1+3Srw0CQzrSm+eySYUjLYJjuTUbL569vawSaMZLEx0bK3u7lKERenL00+cKri7i1P4/ErlsrbtUkFsv0xlzU+NPt4FDHYTqi007KHpct/Gqc/9ZgkTj26nFlUl7/zxTqO5fptsts4RWaRzdhUGQ7ILCGt4D9LsdeDEwtV6cebQlu29JWBVBvJlSB+UembO1fkGapwQmyWThoAxNdCNQ1Dn6jVfGc59g2vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6conJ0jUgrUyoHKEl8/wKGYfP+skB3i8qnunWGJ9EA=;
 b=001fXCGd/IFlMrRDxcP6gdIk1rTIfSL2HWA6YTfGK4HJf/r88RVtFDAfJmC34fBpFA8sr0Y0tEg+GNrjBG0tixn5QPgWObdOrXs4NMxL3KmLFsK6pYFxY6Dc5V5BtHgqvB+KJTVWNDPzGdnbNNGEXJK8ajZcWoKG5pfn2m/azTYWKUX/N5aiMpeQUqHyyIKuBmc4W+33coCP7GHgAN48WFtHSkBA5E+Dqgam3+vHgS1ZsBkR4I6gf8RDmS5RsBYf7p4KTkmkiAWTXnVxtJ5XwJ+9kZuyjMInmUVAVcD8vDPRW+wAypFDSkN2+h1ZIV6N9Qu6D47rgBGlHa6DZ1L0Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3198e5e5-c73a-133f-5651-2dd7f57e9e70@suse.com>
Date: Wed, 17 Aug 2022 16:42:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 10/11] drivers/char: add RX support to the XHCI driver
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
 <0ba9941595e5237a3eeb260e7aaf75269e094786.1660354597.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0ba9941595e5237a3eeb260e7aaf75269e094786.1660354597.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 373abec8-68cd-48ec-8bfe-08da805ec835
X-MS-TrafficTypeDiagnostic: AM0PR04MB5313:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M7TdlnnVlkRbGQojJ2epgwALiy7GxG8SBz3WshFT1EjNgHG03O4/XNmrFCXlH3YPG65In+wTmvL2suYEH3DSqJgae5zNdS2Gr9brddh0jVnZhHSK97GaADIU0Fd3d1IjFnl+SE2qtQZ5WjVdGfFakCUU054qoTN6sZVo3SJDDzCyPSnGz45mdVEUyyrqRlCAE7ppm2E5AfwKJP9vg9HfgdGk8Siv3pb/1w2OqafjgGHmsMPx1Ls7QPU2EhOF85V5pFuPw9LaQHTZeOqLHg+A+MXNnzygiardj0g4CSxC2Ot/Y7uPWmk79IT/SI9vRrebO4d3hKAbQBP/mtLJxpiQtLuVr/VWsN5V//vrx0w6M3+LhkHRkFavdB8bzrG1MTM6ldUctoS8lFyxQYUHOWoUzd39YjvjVvqOm3uRQTzBA/qzV49Qk7UQqimXlVNj34d0RJirLMFwKWNArNkAJOurZsogzt2WauEZ4kPGt3i0Xo0W3ShxExthNnlVPI+YO7UbRrUee/fKoPHu2w9/Q8Pzzp/dY2LZL57+zCeHkmJH6MO5+0QxiSTHUKIuPK4yMBc0BH4fwlsK/PKuhmRwx80R243oQ/RGy2ECne3o4v8S9W7uK4Ex0IB2RShy83/M6BMclFuJ+sEKWJBpymv4l2YXv08cj6svXB1zO4nFAkVJbTuc6hvOdJOzVV+F97iZ5xalc//61x5esSR3kTQQnWsIKunYbDIMDAgxS/TdodKt7M0Jma9bfRUwT4QBgOJl43dpASUzdF0VqR/VMyB2cK4TxiOxxflrPxaIcjArn/h+7AUte5LL69+fgTd0M7E4lOvOGrc5TkAyoGyPsyhK9xUbWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(346002)(366004)(39860400002)(396003)(41300700001)(54906003)(4744005)(316002)(478600001)(38100700002)(4326008)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(6916009)(26005)(2906002)(31696002)(31686004)(36756003)(186003)(86362001)(53546011)(6506007)(66574015)(6666004)(2616005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHFFWmp2YXNlYlVaYVl1N0c2UENEVmdKN2RWNjg3d3VWRlBsREJDKzgva01Z?=
 =?utf-8?B?THRCMG9MZDdyNStYVlJkSFp4Um1UNFBJODIrUnhEZ1plUXplVUR1WmFROEh4?=
 =?utf-8?B?RGVlY0Jjdkswc2FyQ2I2VWxqbVVrajJ4ZHFsU0l0bEtYazJOcVZkTzl3RmJW?=
 =?utf-8?B?b25aMVNnTFBNOTJXbVhPcFp6bDFQeFFyZTRLUFdkZmI1Z3pFV0t6MGxuYlFn?=
 =?utf-8?B?eVd1UHlYdHA4K2RiOUNEUjB4NDFGWVl1QmE3NDNJYWlwQWgxUkYveXY5WGRJ?=
 =?utf-8?B?dXNwV09XejdGOGVUMStzKzNxLzdXcU04Q0lLV1paODFOL0xPYVFQTW1WN1ZD?=
 =?utf-8?B?RkpEcU9pYXZFNUUwT2hQVkVxSkp5dkJkbVVZMEtDVWwyNzc3bFpTQkd0dU9i?=
 =?utf-8?B?Z3JJMGJNYis5dkE4ZVZoRklIZzQ4S1FnT1lITXN2SU9VcUhkVXM4Z0EzajBW?=
 =?utf-8?B?RWtOdVZVVG9qYkJYZ2RyZUFGU2FZUHgvVHhXb1dzQS9JWUtHbWRkZG4vNHpy?=
 =?utf-8?B?UXFkZ2FUWXlYWEZRQUQ2Y0RLbGpTZXV2UE1wSm1EcCtZMDFpYVEwSzhGTTg5?=
 =?utf-8?B?K1hzMUZheWxFR1ZIanQvZ0lmODZrSzIzVUNJVXN0d3Q4RjIvbDdzOFRiSlcv?=
 =?utf-8?B?bklpOGpWNTBxcWhHd1dnK0ZtMkVKa2ZCWGZxOGZvQ0g5YzlDaUpyM3V0N204?=
 =?utf-8?B?SHl5UkFnS1MrNDRUSlBRcWcxU3ltOURidGhrLzVwNU84MmJZWDZMYW9aMHk4?=
 =?utf-8?B?STJ4NXRvaENHM1hzRWlLYUo1RGdXLytYLzllc2l4SE9xTDdTTzd1aDdhcUFR?=
 =?utf-8?B?VUlDa2F5MzVad2JxT1BNaU9tU0RqVEc2TXlFWHUwckNIRXQxWWltV3B4MmRI?=
 =?utf-8?B?T1JFTXk1UU1pYTVVQSsvS1Zmd0RTNVZWVFFCUkY3SnBza3lDZm5rcHdXUXlD?=
 =?utf-8?B?QnEydU96YXl0OWJVRVRlQW53T0FnUkFsMFI0UzRHWnZaWnhJdmIrUmpCRmkx?=
 =?utf-8?B?V0xkTjhhKzBaVG5DYUdwVmg0bGx6M3RhZTVXM3gra1pmdEU1cUpWakxJdDY3?=
 =?utf-8?B?YlAyUWhrMHREY3ZtZmRPTmcrUUFrSnJYQ1p0MitGTCtpVWhURzlBRkZ1RmFm?=
 =?utf-8?B?MkpoQW5WQnFZT0t6LytSN2c1WFRVMzRPdXlvZlZDM0thRnVPdmpFS2dodUlu?=
 =?utf-8?B?U0VKcFlIMTRWVUxNZVhDc0g5UG4wL1ZMTDlOQVZsRXh3NTJGRHFSdnA3Qm56?=
 =?utf-8?B?ZkpiWlZ1NzMxZldmc3VXVmxjanpPdmVUZnBteXF0cWg5TGZjSms5RmtIdlY4?=
 =?utf-8?B?d0xqZnFBcHhMRHVxdERMRi9JekRKcmVaL21SOXd6VEgyQ3pYY1doZmtxWGNZ?=
 =?utf-8?B?OWJvREFrZGFKTlUvMFRoQmZTeVZOSzhLbitOZE54dVNBK0NjdThUZ1JtZ1Jy?=
 =?utf-8?B?UnFQclV2eG85Z0xFOG42eDl3ZU82WWljWWJmMDZuTkcwNXQwbkVoNDYrZEI3?=
 =?utf-8?B?ZDFpellrYi82MTZqM29BQkZsSHZPeVNiQUgvbSsyeFl5MXZpQkpYcVJMSUI2?=
 =?utf-8?B?UThWZlZyUTJhcDVFLzJqN09JNU14dnlOcXpNUENJTDdMMkp2TFJTL1UyZ3px?=
 =?utf-8?B?SDYvc0s1NEluNldsT2hhSncvQ1hNak1iZk1zR0pCaDZHMEwraFdDVWEyS1B2?=
 =?utf-8?B?bVNvWmcyaGtnWVVpaGl3TTUxMXZnZE9TNXJHdEJsSEpTTkxJbE4vaVZPbDMv?=
 =?utf-8?B?RTJDMU15OHVqRWJ2cjY5RmY0YzJROVhaNldCRndGZWFPVEI0SUFHZVhueURU?=
 =?utf-8?B?UG8wTi93MzJhaFdWS2ZZa29DVEFWZ0RqQ1FZRkhJZ3AzZTBxQjM2cDdud2RH?=
 =?utf-8?B?REkxSVlWYzA0emh0VDBicFhFSTRyTTc4czF5dE1OZG5hVThKdjNjaHRwSGVZ?=
 =?utf-8?B?WVExYk5KNElKa1JpQUd2NjlSR25iVjF5MnNZTk1hMEhiODgxYnZlRzFhV3BU?=
 =?utf-8?B?dHkwLzNyNnVpbEdXZ0tzcE9oWCsvZDk4ZWFFS3hlL0djTnBVVCtIa2VYUXN5?=
 =?utf-8?B?QUIyQkxHVmROd3NnK0ZSdTRNd1lScC9jTTZ1T09EY25ZVThaK2E0dUF6Sjc0?=
 =?utf-8?Q?xtg25uYOib82D+kBQOrKiV/Oj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373abec8-68cd-48ec-8bfe-08da805ec835
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 14:43:00.1517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYQ+slXGEQIytTdTCVFTqz7jBfT3VcWvHKXp3G+eZQGr1fikDsKtCcAU5OGb4mYSueCLn0aFINJwfUJKQk2Rng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5313

On 13.08.2022 03:39, Marek Marczykowski-Górecki wrote:
> Add another work ring buffer for received data, and point IN TRB at it.
> Ensure there is always at least one pending IN TRB, so the controller
> has a way to send incoming data to the driver.
> Note that both "success" and "short packet" completion codes are okay -
> in fact it will be "short packet" most of the time, as the TRB length is
> about maximum size, not required size.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


