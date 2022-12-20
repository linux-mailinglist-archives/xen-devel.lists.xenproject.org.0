Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B38651DF0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466849.725804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZEE-0006A6-In; Tue, 20 Dec 2022 09:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466849.725804; Tue, 20 Dec 2022 09:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZEE-000689-FM; Tue, 20 Dec 2022 09:48:06 +0000
Received: by outflank-mailman (input) for mailman id 466849;
 Tue, 20 Dec 2022 09:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7ZED-000683-5Y
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:48:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6601a6d8-804b-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 10:48:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9657.eurprd04.prod.outlook.com (2603:10a6:10:31c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 09:48:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 09:48:02 +0000
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
X-Inumbo-ID: 6601a6d8-804b-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1degcOVIeFdsrBwbwPNZ9nErWwonDF6rUHJKbhxWT78vtE0FXbwKqcBRqRCQnUKQhlzqpeWVOa3g+IjECEOrsHW9YEU9bGWLPgQpp6f6NmblG42Dj+wNqzQQ6RXIhz5CC054yPvddAwtJ61WCH/51I4RrK6sHi16nX7Urvbj0kLOOK8QwcmKzN0fp/MVeLcVPJpfcTLdOyiKFYJUFaQ6Sh2RhT4XARiInPBYk7l6742Ixlt1ak8of9fYB5hOIGVXsqcPV7WaO/2NfVQVzwNV9SNN9Kqy6w9qfbxnz1UEEbulhg93avqq4nQuf5eyxA7S7Ub8X98zOxbjlcxxd2Gug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8xa4IpYaB+XWhbedha+yGQ6Vi9eXGQhWfJYKdUxji8=;
 b=MmEGD+ANpXNHIjFEfH3H34/9BSYNv4ERR4VyF3Kd5ukSvKRN/blAx2olakc9YGNOi/xSlIelSwKcZ4GKjFQrnsWiGzMQabHPE2wT75JMtoJPic4RNEZELaYzmxrW9zmXVT3tzaLJy4aZYoi7voryj/rMffKERR/p3YhDX/Ud6Qrf81QzlNeTzgh1fbzFiUsigIh8Ha+lbUjNRfNZFyMAtEqa3c2SU9JKUkOrrRp2zznW92i5/ahqajzPVB9IhHhYR/19Kf0oUbQgw0Z+MZWa6h98Xp4yQiz/yyheyTANxktYqDAQKiJgKRCbbUre+m51DB/Vn1YBIFsqMUz7KGAiuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8xa4IpYaB+XWhbedha+yGQ6Vi9eXGQhWfJYKdUxji8=;
 b=ZrB4Gku9SJiZsULEg2Y4qcaNdgrcwoLoSmvZZDdmEGl7tHqMv+TyXj+VT3F3qxPi4I0fyWABHUGzz2kchCpgJloictBwL5JUJf8NEEXe8o3/kzbw+oXI0WQyjZn38jTL9rPEV4RAtDGan8yx8IzGEKDTniZXZK4Qu92bgCw5tUt0f73rvvZosoXx0OeXRaPeOGQ4/McBv8uaVG4r97sSUSrZBRHMOaCoXANnuUF6oynTjotgXa0kmYDTbQi7BUuGA0NtcAcwm17F+kDQ6yCBzMWGZqP+Uj5c2wnXnqSJ5qh8/qcipU9oHDN1AMdh8Yhul6j7yr0MuOd0wxVYuF//Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1c0f957-62cb-f7e3-4a8c-1a90da683825@suse.com>
Date: Tue, 20 Dec 2022 10:48:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 09/18] xen: cppcheck: misra rule 20.7 deviation on
 kconfig.h
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-10-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221220085100.22848-10-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d9e384-3f83-41ba-b03c-08dae26f48d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FTCel9kfmT4SVS3qrDntTjaFnNEP6LPwH0y2k4YzpWDyaptScihOBKJ7K+7hp8DsqrKCU/mmV6IULR9VACQ+/tDLN6yHF8K0ODzgFay+o/jmSOkQYGKc61f6gwKucIkIA86ahWFZdLf9q7MyxLaYh+EUQvnA8ycdCXO/SlhwLR79+SUkxIBrRT9lnHwMyweT2t4Qp7LKwKXAyWzntJaSoVQPkBb/YX5ISjVswqRIHi5MistAYmbjvPdtHYFHXV7WNZKb9evQhP6XY6+GneNKtnF4yzQ/piolHRTaVjgFKd4oOcPuWDvYBg94Yo9KZGceK39nDps8all4F6bqleZozEsanraSMa2TIupu9L1LHyhryWvCLjiXl9cbSLccgO9OjFaOGuPpcxZr/s18HOQD7n8XeO6gdXesPTbYEAbRhYk3LcLwsRs2+ip9ibrQYle9djGM8oA25NVYWzGkqpm54KM1oUiphniz7qokLxne/bcLrGFcdKYcwhi/IniFueWWuDD794GrvgczGpgv6mGpgrTSdgASWtpUPW/BXXchtdEUx2+U1egjMgjosWIIJkfCykB8/e/TUu8dkur151v6bnHejZXig9T/03EcRs0biNdiWhHDdYPEwsQ20gCrACG2CNjJnPmcxC9yzJ1DvvAWkjkvjWZpPK3N6HjZ5o08XSRQpomCmmm9B+QGEMtUIU6ogkgTln2z+GQwH8HqaN/Rv8X8G6R2SteIvZOt50TRevM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199015)(6512007)(186003)(26005)(478600001)(6506007)(53546011)(8936002)(2906002)(38100700002)(6486002)(36756003)(5660300002)(316002)(6916009)(4744005)(54906003)(31686004)(2616005)(41300700001)(66476007)(66946007)(66556008)(4326008)(8676002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHdVSGNBQVhjU2tSVFJ5VE1JdFd0TGZRMVJBcEhuTnhidHIrQ0lrcXhHMzBM?=
 =?utf-8?B?NFRjaTEvWjFTbDZLelMwZUNUTHUyN004bDB6eHVGUDZIZkUwOWJ6NXpya3pN?=
 =?utf-8?B?eUZiUXdqNTZRdVlvWTRFdVRKNHlZS25FRks3NkJhSzZjWWFyL000SHpsYzNy?=
 =?utf-8?B?UmhWR2x0aHJiUm04Q0gzSFpXb3grcTZnL293aTF5RVF1L3ZaRjQ5ZzhIRlFl?=
 =?utf-8?B?VUFaeVVRV2lEY3IrRmdBOXZOZDhZTDVENjM2ek1nK0xBYnZldVI2TEkvbVRL?=
 =?utf-8?B?VHdQRVFQOS9UMGFFR1FaUEh0bDBhTE0raUEyMk5VajdFSEhraU9QZGVNWUJ5?=
 =?utf-8?B?Uk1sTzlTNEwwZXVXSUFUZkEzOUpza3Q3ZFI3RWdjeWYxNWFxTW9XL1dsMnd1?=
 =?utf-8?B?YzBvWkE3ak5OT01JLzZFbW05S2tBZUIreWJjOG8wRndSdVhXZHdxN3hpMXFJ?=
 =?utf-8?B?ZW9UZ200azFKbi9QTE85cGpZWGt4b2RNblgxZ3ppcDNLM1VnVmpRWTY3dDNn?=
 =?utf-8?B?WDJoanZaZWNkVWhGUkNOVW1GNkYxWUNSTDQvVjBUR1N0bU5nMEZIUU52L3du?=
 =?utf-8?B?MG1MdDBxMUV2bUM3OElOTFd5eDN1NHBWUzhPcExNM2xZcFgyK3M4UkJzR3A3?=
 =?utf-8?B?Z25FS1NPbHFYbTRiTWtSSlZrbWlsOGpzWjZ5TTV3NjZRSVJFeWVzVVV5bmlk?=
 =?utf-8?B?MFpQRHZrUWd4YTlEMDllNmozbTFGeEQxcWlCRVhMZE5VUGhVc2RNZmJyemFx?=
 =?utf-8?B?WnJOaXRsSHZYUnhBZjRvaDJQVUNLMEpTVFZFWE5adnhNNTBQbStQdFA5Mm9O?=
 =?utf-8?B?RFZsb0JVSlhFVzBUM1NyTmkvaDF1cnhZTkt6V1FwWEJGVyt3dlNHQ01Ydjdp?=
 =?utf-8?B?bDBORVp2YWpHOGVvWXVXdnJpdUx6Q2pHYll0K28xSGNDY0g2S1FycmJmaUVZ?=
 =?utf-8?B?T0xNUDNQQS85RVdCa2xmdGNNNTQ4MHlIek0xVDl1aGJyL0ExUytJSFlNQnlh?=
 =?utf-8?B?U3FmOGE2SzgyUkxkSFM2OHIrOURYeXJoUWQ4MmJ4Qkh0YzJnRW9aZUowL1NJ?=
 =?utf-8?B?ZkwvWktRWUpZVUxTRVpUNzQva0ZyVmNDQWJtaklCRVVaSi9rZHc3STZYeTlp?=
 =?utf-8?B?WXdYYUZETDZ4ajRYdFJDd1VZb3RVRjFNN081OHhrRm5sa29uUnJ5dTgwQ3Ra?=
 =?utf-8?B?c2FnNzBIbGFidkpCbDc3Rnl2eVVCTmNJY0wxVnFKb0dGd1RCNzNXZmE1YXRs?=
 =?utf-8?B?L3J3NkF3cnpsRCttR2VGTFl2dXRqUkNQZmlvb2tjT3Y5eWlHNWNvbFhOVjZV?=
 =?utf-8?B?ZTU1K0lJaEdhNXkwbzB0d3Q1KzJRZTJqcmxqSmRpNDNwVnRnNzdqdFdaWXB0?=
 =?utf-8?B?MjdOM1NodnVIZjlTWmJnQ3dmUmVhalNaK0d0T2ltUjVFSWM2TVdiQ0pLNzJW?=
 =?utf-8?B?K2FHYitCTHBWWlplMWh5WDJnaWtFV2pzRGtEdW9ZS0FYcXhNZ2t1Z3ZqcXg1?=
 =?utf-8?B?N3VCMTBGUlVtQ1dZWDUxNHE3bWZNN0lPTElaQzRvUDlUOUdNcDk0RmwyQldx?=
 =?utf-8?B?amhVVWpreXd5a2lLdVltVDYxWkY0TnpQVE9JaU1TNDVkcHpFbGNxMHZ0Wkww?=
 =?utf-8?B?SHRZOS9NN0twTnlvdGlKQ05yU3Bvbzk0YW8vZTBoVEk0U1FFeUZKNm8xNEY2?=
 =?utf-8?B?Q0NBNHowSkRjbW9GOElDQ3Y0dHI0NnVQOS9LeHZ6Y3JqUENYRFlSUzFuMjVZ?=
 =?utf-8?B?eDE5QzRMK01HdTY5eVJKbWg3a2xjZEJudHJLS0ZUTm83MTl5SmpkM2w4eW5O?=
 =?utf-8?B?Y0F0aFpET2RUMEMxRUk2QXhNK2RzK09vS1J2T2dNTWZTNW5sdTlDM01sYUwz?=
 =?utf-8?B?RzljYzJxakRRaVdxUkg4RkxPczF0NC93M2J4bGg0dk45ZGllcnhqdC9yTmMv?=
 =?utf-8?B?UG53V1hQN2RyU3o5OXdWWlUwS00zRkVxbmxha0R0Z3laU0VJMU9na3ZxaGJk?=
 =?utf-8?B?TE1TRnMyaXpJNHlDeWV2VlJoME9oZjBsMVpiMHljRi81ZHdIVmNhdEQvQzdY?=
 =?utf-8?B?TDdHRWZRQld1RlAxOWFSTnVoTUxLaHMwbzBaZHlaR3JCK3JoY1hmQ29aQy9V?=
 =?utf-8?Q?Qu6aLCtaj23USHoNaW8YFrXmO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d9e384-3f83-41ba-b03c-08dae26f48d2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 09:48:02.2673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kr19YZf923df50atIj8sdDqS+H3sz9MHqQa/SaLYq6fWytAHuDXinAmW30kSca0cntnR2vINOYHRMkfwtPhFfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9657

On 20.12.2022 09:50, Luca Fancellu wrote:
> Cppcheck has found a violation of rule 20.7 for the macro
> __config_enabled but the preprocessor branch where this macro is
> defined should not be analysed by cppcheck when CPPCHECK macro is
> defined, hence this is a false positive of the tool and we can
> safely suppress the finding.

So what was commit 43aa3f6e72d3's ("xen/build: Add cppcheck and
cppcheck-html make rules") adjustment to the file about then?

Jan


