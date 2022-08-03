Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C1B58873B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 08:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379559.613094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7gX-00086u-HP; Wed, 03 Aug 2022 06:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379559.613094; Wed, 03 Aug 2022 06:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7gX-00083v-ES; Wed, 03 Aug 2022 06:16:49 +0000
Received: by outflank-mailman (input) for mailman id 379559;
 Wed, 03 Aug 2022 06:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJ7gV-00083p-OK
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 06:16:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70074.outbound.protection.outlook.com [40.107.7.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da16c823-12f3-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 08:16:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 06:16:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 06:16:44 +0000
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
X-Inumbo-ID: da16c823-12f3-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qcf2gMOg/LSEEmmjJDr7mb6sijr+p568Yyto10AG6q2mNAB+R7A1haKT9zdn3Pbg6W4FQ5wPjvcD+5m3OwPwhDSpEf2M5FMfY1mvT+Q8aQfHmYBJBk2+cCaHOFgUigop8L8r9buAJ25eoEC3X29hm2LUb+Ay/imaaGZACBjQIWII0Bo36M/LVZM2w4QJDWaFtLMpQO1vN7NHjo2LO8eRVK5bolEuq3PQwhIolX874+KnOOnMVlKxFpvvo/Y/NFRU2XDsm8i3fN6c9wNEVkhu2cZxpL+tUGq+EPnIRgJRkx+M4pkZefTp7EtzQ0meNsKN7PV8DraAVZgZr07aGxi9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTtNdVDYFrM1I1LvxUSxHYlIaMDDTH1sjtZmGr8g4oE=;
 b=oFInQ3ZaPScAajU8al3VVp41/k9qchY46UccnKj1BQSID38bmCXIfRz99vb5laFwBUS54qhnswbx9TIYU+QPEP9WgmKx1S9ZbievveCiiok42vfaZrfPY50iunpF5dUFrg6yns43zHyUt3N9wcBQMVji+SUynxYIMlmzbczS2nnjfmdmBWstt5tLJSnkR/Jz/xqCa3E/pWGwNh0uVii3pr5FOWfBP7i1KPGE5LMkQVVKxjrUHK0amgM5y8rZ0uIPwSrVohuTM0sN007pL6PibUTrqkrmYmb31/VDf6WiUNO6VzvReEy2CupOWZuJSY34mk6lzpuED5DWJWblQJVyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTtNdVDYFrM1I1LvxUSxHYlIaMDDTH1sjtZmGr8g4oE=;
 b=Tgu/dwpsGb4QOz/PJKlghFDCREixbS85ibcp9oDLu93Lxzc2We8gaal8AUMQ3PowXH5gR3/W/CZV7NBVpD/5o65Al+HA/U85I6ZUO/yVVvVBnhGXB44NdRgaHySffvdHXUbkmHfjqrTK3EkmI4au9ynl1UF0RRHHHU/lh+Q/Llli8J94nCZKgpd9tD88qjH/ZCSHMordLc8mxPewhsGmiudcZhDWsduMcLd6GVk2eDh+GCUyhS5ku+tCCq0esWrSNsKdnJ7kHwalAjANo3e6qgB3hIn1L0C02mDecG5JbRrlq/68PqEXQO4ZqEGtqER3Lrrbr2Q+1/OPzIgi9WvtdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8981ca99-247c-ae62-0180-14789be47f68@suse.com>
Date: Wed, 3 Aug 2022 08:16:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/char: imx-lpuart: Fix MISRA C 2012 Rule 20.7
 violation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220802075433.1748035-1-burzalodowa@gmail.com>
 <7e78d64a-c700-5846-f046-a1b0f2c98ea3@suse.com>
 <3b0fd31a-c847-f5ff-2365-5fca5becb051@gmail.com>
 <d6470ea9-f225-a0e9-64cb-a24e25ca7604@suse.com>
 <alpine.DEB.2.22.394.2208021549380.3147284@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2208021549380.3147284@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecf69a77-e235-44d9-f9c8-08da7517bcd6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1pdoeW2GdaEfi2Itow225rUeoKvwNLAJd/NAzE05mehOyRBHdS1teCq35ox+vK/SD0FlyNb/b4vqkuPfvWbS0eteCugPK1mEmsHUWJAWlfNhc2q2R85qB57CD1i4alF6HJ0SvW8TwDDbByksMAfsFI2Wq0P47xTafOXM6oWkYfpb8Yts2FKRaa+zx8FDuiNoUdm5mt73iTW/Y3qmyIEv6G5VoAv8h3dtoOOhPSevAa540J6nuw4XZ2BJf4rxyytb0z2PnTF+Pw5QlkpykpYjww/ZzNbfSi9wrqiTH0PcZHGToVmI2EMaRikigqHHPWtF+D4UMsRfKA91oxjl1+Xa0r31TX1ONm+pkTXhCgUO3gDy2sWAFHuHM6Y+j1q/TQvfPWGvasKrO0mTopLyycLbd782Jf2g0QQPZYuLghaQ2OwPEmQh0pYFZdPwbQ5fGf1GAMMynj61ADTRuR3f6gmqY8MRH6JyWllK/2Jt4tBNdFu/s3xKy4E7TZSHqRlmNG73WxxaoSE8CefDkkJm2jDp32Mq1vohH9R+XHcN3ZVew0kPIVZpkzmBCQCXODFyg9Hg1PsL+7TYpTvOG9UKmwO8yFBnBPpORa5E08VqxPoNyKci/hnAm9XzyV1LJKKupiMR+8Q7tDayUz7HG1vEGQhlspTBPCdd6N2R8eTJtE7Vr8caCSqKhL+I5RPTwSfrf7qKentGcdDEtEBQzefF0gQ4TN8mTveBpZo7nLdlJQw9TPpgxSSZB6NUimFsyGTS+rJAiFy5t7f9ib9uQ96cjpB91EEqx/HcQzoAmkgfj6gQmn5ha8YlWPvxwdMBLZmrB49y3UW/DxeJ+e6qcE3fbythVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(376002)(39860400002)(136003)(54906003)(38100700002)(8936002)(6916009)(26005)(6512007)(86362001)(31696002)(6506007)(186003)(8676002)(66556008)(66946007)(4326008)(66476007)(316002)(41300700001)(31686004)(36756003)(2906002)(5660300002)(6486002)(53546011)(2616005)(4744005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTNDTjlRMVNCTzhoamZXcDljTS8rWklsK0U5eXBTRG1vTXIvbmMxTE1vS1hE?=
 =?utf-8?B?eVNjODFsU0d3WkZPYkZORHlqVFZzOFJtWDhCTFZORDJIeVltWjRmQ1BLU0JK?=
 =?utf-8?B?azdydUJlZTc2dmxNNDdsWTdjNGpjM2t2NXJ4M2VXVy9tc2VadDNrSW1aYW5H?=
 =?utf-8?B?REhzbW9zVlNLd3Y4TEE0YThNaksxS1NwZTY1S0J5Nm9tcTZEVGREWlNZNUVY?=
 =?utf-8?B?QnkvL0U0b3dYMFlWYjQ5aGtneElsc3ozTFNlbk1PazY1clVObEdsZzFzdXJW?=
 =?utf-8?B?YUFaM0JIU1dEKzBKREx0ZHdqQzJDZkRGOVBqQm1qOXVTc0E3clgxWVVndnFV?=
 =?utf-8?B?K2JHaEpFaVVRVkZhcFg5c2wwYitFMGZIalB4Ykc3VHZRVUh0VXZNaXZwMjR2?=
 =?utf-8?B?UHBzYmk1R1RvSmV4S3dtUzQ4U1FnTUZTVG4xbjV1cFM2cTRlclUrQzVieVlM?=
 =?utf-8?B?VEd6djhkQmRMTVBHNkI4T3RwUXZwMlFsT21ZbmhXOWZwVTFzRS9iMFB2Rkh3?=
 =?utf-8?B?cU5EdnFqQyt6M3VzZ3c4Vm83RUhOL24yZEJkUzJlNktDYmw5ZzBPcGp6cXV6?=
 =?utf-8?B?bjJKQlBHWnQ2a3gvYjQ0NmhxY3pOM1c2K0xXZE8vR3dIblpUdmNqajIwRkJF?=
 =?utf-8?B?emVMdjBTa3BVZDJscmxUdFFiTWdjWWM5eHRlMnAraExCNi9aNWVRRVBJT1VS?=
 =?utf-8?B?TXZqR1N6WVpSVDZ3T0t1aFRKQ3dPZ2Y4NG9uZWJsZHp5b2J2alMrUHQvUjdq?=
 =?utf-8?B?aEN3MDYzZWdhekxsNVkzTG1EM1BrMXNGenh0eVRTa3FBaU5sN20vSkVZY3U4?=
 =?utf-8?B?TWJTYkd5V2VadkIvTzdTVklUcEVJcHhKaXl3TktjWFRUWnFkOHozV0tHNlFW?=
 =?utf-8?B?Qnl4ZHRHY3VLeTJTb3FzVW1ZZ01oQy93YjltN2NhNlB6Q3BnSFE2NjhLUmhO?=
 =?utf-8?B?ancvV0ZTSjBGdzh5N05VdFoxSHp0RHlTblZzcnY4MEhIRHpSZmtDUllaR0pl?=
 =?utf-8?B?bFhHYzFZTzFxbnpTdjJhVVVNSTBFS2hWa1pneG1qUkNhQkh6U21WWkRlRms4?=
 =?utf-8?B?Qzl2VHBJNzFoY2Q1cTlGRHhSc0oyQnhPK3ZsL1dmT2FkZHN1NFd0NDFONk1H?=
 =?utf-8?B?ZjJkN1hJcEFuK1VxL0hQN1hSQ0JJVmVMdzlhMk1mVnEvSGxCNXdiNFh0QUVu?=
 =?utf-8?B?SXFjTjRjN0hkb21JbGsreFk2MHhhTzBwSzZBUW1vWEtobEdzL1N3WXViSnZq?=
 =?utf-8?B?enAvKytmTVI5bHBtS0FNOEdYbEY5SHNQbmNnN29GNUU4REJMZ0Vkc3BzaFBr?=
 =?utf-8?B?ci9BNmoxMzRld3oxNk9OaTdtZjFOdndtVXY4dndZeXVBZU81QTQ2V0RtTnM0?=
 =?utf-8?B?Z0dmTVpkeW13ZFNwMDJpRGNJYmZCWUl5Q0ZkWjNYT1NJLzUxb3J0RFY5NW1O?=
 =?utf-8?B?M1Y0bkNreVUzT1dIczNXcUVYQUdwMFRBZ2g4L0NkWmVCYnUrM0FLVXI5NXpw?=
 =?utf-8?B?QURHSzRVZzRMOURyOHZWZ3A1TXhZTWp5aUZXM01GanNXK2VFZ3B2Q0xhRzdI?=
 =?utf-8?B?QTliN2tLR0wvbExzL2tiZ1JRSE4xa291alp3YThFcENJTVYyTHVwL2tqc09W?=
 =?utf-8?B?VWVjeHl4Q2xjcmpoaXVYcU1ja1p1WVltOXNmazd3K2RzZnBrVFVxYXRjZXNw?=
 =?utf-8?B?aGxWc2lxU0lnMDVFVGxNVDVzQ280amZaRUZ5REN6MVMwM1ZVOHRlems1SjNQ?=
 =?utf-8?B?dm13QWlEZlMwdzRtaS9YM3NmMEpzYUsrODczcmRSc2VVTXd2NWlZckxBRk9L?=
 =?utf-8?B?b25OVjZFd21QcFBYRmdNLzgwVGtBWXg1UVJPSzBBbG9DKzcwNHZxaDUwTHZp?=
 =?utf-8?B?K29hU2wrZWRqZHQ2Qm0rTnFJR0FTRzdzaG0yM2FsYTgzd3J3c0E1ZFNIZXFJ?=
 =?utf-8?B?eGJwaEFZaWlXQUFlLzU2eUdnRmRGU0UwMXYzVzdwOXV3SGc2M3E0bEx3NGt0?=
 =?utf-8?B?WFRpUnFNQVppNFlnalJtcTAzSlV1SXFEUVVoaTFSZnhTbGJ4dFdSeHV6TjZz?=
 =?utf-8?B?bGlLTVErVC93emlnYm5HNDZtc2RLRDBuWFVQNXFBSE4zbXlEU0ZzalY4enla?=
 =?utf-8?Q?KzQM6TKXJL0SriMRMxDCYvmk9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf69a77-e235-44d9-f9c8-08da7517bcd6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 06:16:44.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPlPDERjbw5NFC8utFCgf2rA+YeQwKTrF6+QtB6CDvDB0NEKb+kNns5+MKF8wUc23mNGeFBDf2iMGBwOv4EdGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

On 03.08.2022 00:58, Stefano Stabellini wrote:
> I think it is better to avoid asking for changes not currently in
> CODING_STYLE and docs/misra. It is less work for both reviewers and
> contributors to add the rule to the coding style first, then ask for
> changes.

I very specifically disagree with this statement: Attempts to add
text there have been ignored altogether, i.e. have not even been
seen worth a comment against the clarification and/or addition. I
have therefore given up to propose changes to this document, and
I'm also not going to suggest to anyone to make any attempt up and
until I see movement on the adjustment proposals already pending
(the two of them that I can easily locate for now over 2 years,
and iirc there were more which predate our switching of email
systems and which hence I wouldn't have in my outbox anymore).

Jan

