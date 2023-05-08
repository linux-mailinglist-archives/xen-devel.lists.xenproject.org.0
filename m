Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6886FB00F
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 14:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531487.827198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw01I-0002fb-5q; Mon, 08 May 2023 12:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531487.827198; Mon, 08 May 2023 12:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw01I-0002dz-2h; Mon, 08 May 2023 12:31:12 +0000
Received: by outflank-mailman (input) for mailman id 531487;
 Mon, 08 May 2023 12:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pw01H-0002dt-5w
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 12:31:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33c4ca0a-ed9c-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 14:31:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7295.eurprd04.prod.outlook.com (2603:10a6:800:1ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 12:31:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 12:31:03 +0000
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
X-Inumbo-ID: 33c4ca0a-ed9c-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+z+ScDij6RZZ+fcDvMogE/+wNvDipT3fhhklDFmrG2+nwQ5a8wXAHbSJtMbx5UPKLEsTvlQ2gs4a/uIP5q3QMiOJp4Ymtl8vYvhkyCkHhii7S6qmYzJLhcV8k7lYmWXqK811hCiXtjM9SESQMn5ngTgZm/VgMUHv02ojDg6XG6YBX7mPyan0o+HTNdOlMShYRKp5+aZJ7f5CS4vjstWhVQ60p+zZinF0AsTURGGU0ceNzJXsnFCvbBBXw5TI+veW83y0rmi0dhwAawiDTS5MaEgkFnNCEx5RhRIUmOBzYc3TP0XNhC7qJjdlWbgVvNKuNaiOEv0CXSxNHBNRTcbCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5UVgGCt7HFd6QpACbVczcENgH/UCk8cUe0fCdquCg4=;
 b=VDFQ6wd0GBDDF8yGclvg8V6pSo58JwPoWXi+fYEM9OL3ZG7MCeuKpsfRVfiUiHqQLD5J4tcivgScg9cMElFCmZ5imJNwAbp7F3+Icoz0bULhEAKqv9qPBP7u+x1bU7UGNfMi4miPrqjFtnxTXT0qCJ5q8JRzWhWAw7yNz0e7ShZ40cyb93qy2HvoKxhfHOfgJDtf9avVC+rNUObCnTkJ5X11xxR6ApeMuBRKAzZrmI3jETHGYaUDa6QT5Vw5i/vXS9rPL8zVaJfkBneA7i8Yp0+Jf5t7ZSKmocZdvgZPSXRLSFE1TvQCpqhJUEWZIgCt/oyhX5jYnBNfSQt6s36wSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5UVgGCt7HFd6QpACbVczcENgH/UCk8cUe0fCdquCg4=;
 b=3GU+/ihArZcdilCAqaZOXlBhNFw/9TICS0xg+h0yvfZgaAeayRB2XXzJrGTDtIJ862jluyDWzh2aCg47H1IyEwyK1aCCFigdXKMm0rNeBQsoWhWOHdk/xAC6FgeHTZWslrYOHTpuUJrOx4KW63AAMqBbStHmF7lKpkZyj/YBPliKxsvM1hw9ZdY7xAJWYuz1XVrznPbQXgho1OdFLF5hXiUCQjiW6LMl1QMIlxVOGE7yyfoz6a9CHHZTgQeRzM6nzqtPQ2YddTz9qpGIxj4Ls+UKFPjNVwXdamQ5hZbffSwVsFGKJDnPC9gmTFHZBXFZpCU2Al16RAcSn5Sjkeh6vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b2a4e8c-ab43-4e6e-2c51-027dcdf1425d@suse.com>
Date: Mon, 8 May 2023 14:31:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] x86emul: misc additions
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: af34bd62-b7fa-4f8d-a448-08db4fc0161b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x2s8dJwPa701iSoFm+RCxs6OYxNvbVUnyzYJqdd1gh/JquLW/Peb8A0v/pA5jIGO0GWOQOU/yopV4gZRqpzPXRF9YZGOu2z87q0v1aAXzP+8uQ9Dyu7KE6YCQC0ypPxNfng/iCt45qwhdHo5T0p6AWPwxIScCD2wnXthWAmY0LA5O3wcaLcR2g0xPSq1MApcpkotykZjhTOiWjhVY840+SwSnP0BxnbPRDfgM9Q1Z3pMR6EqkATVhzEHAjhdgspJ4YSYZNz9UYy3sR9mmsniREAi7/KtHUzNHZ3yAPcum3aWjR2obuH6fpLD8wMIlfj08AoPTsKHBQlbnbCp1V6B+Yb3uw8hiywUjDr5KTCKeMR7ofp6IOrAHOnTo1x2vJ4HNexawLv3nKogQn5kdgDxlI0KJuWXqCuWtQ0dNpue/0dxWWABJD4q6njnTQx4El6dT58cJqdEvOY2AcU//fcrEQWYdmzPawHjBp1QM5xgcE1enzW6I7UYs08NJQM0NI2LRCuqgFt6thEB0TxDrNuRU56zKrfM0npeifKDfUrORBmz2Kas0QmJjUWrx6C74q3VLj8OAhLp90NKfDZUfg2o/oQpn9TtatI5HA/gXxNoBV90w3RlIPqfeLswtJfcI0qLmIkOKgZB+gnHy7S/l9YWpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(136003)(366004)(396003)(346002)(451199021)(66476007)(86362001)(31696002)(36756003)(54906003)(66556008)(6916009)(4326008)(66946007)(6486002)(316002)(478600001)(5660300002)(8676002)(2906002)(4744005)(41300700001)(8936002)(38100700002)(186003)(2616005)(6506007)(26005)(6512007)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clBZRk5SWUZiZG96TFhJV1BPNmhhZDBRbWt4eVJBcTRtaFR6dkZpQ0xFall6?=
 =?utf-8?B?M1RVVEV0UGk1VWduZ2lmT2R4YWNYYktQYSsxOHlBSTlBVVBVL1ZqNDc0WWVB?=
 =?utf-8?B?My96WXdONVN4dlBUMFVwSHd0UW5JUVNYVEdpMVJCL0VQM0FXdm43ZHBKRDF5?=
 =?utf-8?B?Mi9kd1BQRVBZbDZhSFBQZ1cxYy9RYmt1RDhWK1JNM05hZHo2L2ZWSHoyUUhL?=
 =?utf-8?B?c05IVE5xQUl3alhmRHZ2bDJQaWw3UTBacUx1TVR3S1cwT0l3ZDdWTUE0eEh1?=
 =?utf-8?B?eHZKTUJuK3BsdGU5b0lEZkdVTVMwbHNtNU0zcngvNFRxNnZVOU9mOFFCOUln?=
 =?utf-8?B?eWEvWWRPdXhvd09tZTQ1YUxPS2VkMjArZ2lKK2hvSmtTTXBacXVNZEk4Q0hm?=
 =?utf-8?B?RlMvYUlzby8zTVYxTWdVdE10T1ZGMzNrTytDZGRpTlViNk9GdnNXQk45NWJq?=
 =?utf-8?B?NnhaOXpHczh1SXlWRkFQd1Z4UkFPbVdwSWJHU1BIZFJiclF6ZGZuRFBNSDJz?=
 =?utf-8?B?WXRYUTRyN3d6bHNScElUbnN5d2lJMUt2dzJyNzIwYWpqQng1Um51V3hhakUy?=
 =?utf-8?B?eEkySFBzMEpzb3YvSFJZTTJIQ2ZpZWR4OXVGYVBVZW5jNnNLZXJicG9HNFpq?=
 =?utf-8?B?MXdlaXZMUHBHbURCdjFzTnBJeGxrdERCK21jdUM1RUxwZUI2QlVCeTQvY2Zu?=
 =?utf-8?B?cDJYWDBhSExQMjZGcko5LzNENW82d1VQTXdtcU0zbzMyNHdMWm9VR0RGVHRu?=
 =?utf-8?B?NUJCM0kwOHZPeHNETURsaG5Ca3JnOVVoTDJPaFUzWmRQZnZ5cUFMcnV4dWhx?=
 =?utf-8?B?UHp1dDgwVFRXSHJ2T3Z1QTMyQ0R5L0U4VHNTMDhINEtONVQ4bGNheDQvZ0s5?=
 =?utf-8?B?dHhUWEN5aTBCdHpaU2NHRnpWWVlHa28yVDRpemhyQzBVNjFWcXczZGxyTVk1?=
 =?utf-8?B?aTJkdXBnN0FBRVhzVlhIV2RIbE5Dc1k0SEgvOXRDckh0K2s5Sys1TStsb25s?=
 =?utf-8?B?RnFFQmsrS0djUGFER0ZlSVNCbVcwR0NHVm9TNGNvQzg2RlVzQTcxZUFNZWdj?=
 =?utf-8?B?VWM3SkZQRVNWYW15VU9tVFdQOWpOcG1MSGViSENJTHpEUWJSczFkd09tNDBl?=
 =?utf-8?B?dWRXK2l0cU5xZXhJcjF0Z1F1SHVxUXc3U3h0NXV3Ymh5ZExKaFpreWV3M05k?=
 =?utf-8?B?TE1haUtSbnh5dWRPU25hZ3RqT0ZlSkYvdXNyVlJpTVQ2NnFwS3hjdFBReWRW?=
 =?utf-8?B?T25IUVRhL0M2cCtFSU00MVFDZFJLMjVacVpZUEYwTEY0UTVMVkFxdWxTR1RU?=
 =?utf-8?B?QmRjdExhaG00SE9ZTnF1cUtnNThoM2lWMEIyY0M5NllTNFVhR0p5OWZtb2Zs?=
 =?utf-8?B?MkFTOHR4cEJxaEtpQTlpelduby81MnlOTGZzYkhLMGswd21NQ3kySXFVZmps?=
 =?utf-8?B?L0xWKzJhVlkxaldsVE9FVTY1MWNLRXAvVXBkT2Z0Tm5pSlZ0OUN3YkI3NER3?=
 =?utf-8?B?em5qZDROc0dsWVN3VjVNc3NtaXBuTVNlQ3FLMVFKUFkyb0kxTjVNdTAyc2ND?=
 =?utf-8?B?TGw3S2hXKzZ1NEVxNlYvWDRudVNWRWVsbjNFcEJRS21KLzhFWWlQT1VsUkNS?=
 =?utf-8?B?ZUJVT2pyUkFQRjFrdGM4Q2Fsa2hhQU9BUHc3ZUxKbC9NdW8xeC9IYTJCbmE4?=
 =?utf-8?B?bEFKTGdqTUpwei9pRlJnT3VWZHNOcVlxWVIxVm5hSktxU3FWZVJhY1QvcGdK?=
 =?utf-8?B?SkxYREFsemlJTHVQTXZKeTVoQUN6L0pRdkRpZ0VWTHYzUjRiYVJBdExsN2JO?=
 =?utf-8?B?dXFVcWtDQUdObmxldjZnVzY2cEdDaEY2NVBtK1VSU2VsWXZzK3BzY2EyRzdZ?=
 =?utf-8?B?bzBlcXIvUTd0bDRzK29Qa3pRRStBaHhaTElpeU5WQS9IaUVVNFRIUU8yMHdr?=
 =?utf-8?B?cVZ3SGlUZHk5K2tDMTZ6VSsrODNjd3hqQ044dk5kUlJsWFN1OUNuU1dsNUZQ?=
 =?utf-8?B?THA4QU5vUGJIR2ZGVUV6MDcyRWcvdElXejJGblVzYko1bDFXRytrOVk1WnJk?=
 =?utf-8?B?T2x6aEFDNlExZlBMUVJKUXlGRnZDMFRzYVFYZlZ6Wk5Yc3BSVDF6UzJnQXNC?=
 =?utf-8?Q?es98iVNgx+6tzoCEBO8NBOAVb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af34bd62-b7fa-4f8d-a448-08db4fc0161b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 12:31:02.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBRAFiwro7iwPnjipZFkcJfoutmDQ9PdtIHV7AjZFIfniKwOlVPfCoEJtmlzciHtmpHQAW5rooy1l1bgLh/zCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295

This series adds support for a number of more or less recently announced
ISA extensions. The series interacts mildly (and only contextually) with
the AVX512-FP16 one. Note that the last patch is kind of incomplete: It
doesn't enable the feature for guest use, for lack of detail in the
specification.

1: x86emul: support LKGS
2: x86emul: support CMPccXADD
3: VMX: tertiary execution control infrastructure
4: x86emul+VMX: support {RD,WR}MSRLIST

Jan

