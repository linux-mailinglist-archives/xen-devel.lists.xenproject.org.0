Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED5A7CA4B5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 12:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617418.959968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKTC-0007hL-8j; Mon, 16 Oct 2023 10:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617418.959968; Mon, 16 Oct 2023 10:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKTC-0007eH-3z; Mon, 16 Oct 2023 10:05:06 +0000
Received: by outflank-mailman (input) for mailman id 617418;
 Mon, 16 Oct 2023 10:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsKTA-0007cT-Hc
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 10:05:04 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7890357e-6c0b-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 12:05:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Mon, 16 Oct
 2023 10:04:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 10:04:57 +0000
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
X-Inumbo-ID: 7890357e-6c0b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvvZVp8LKyy3Ub4YRH9pEpKH0b+usM4sTObXXWW/2IxSvdiRfvAvoYrn5EUEBDA8SBYQI3hM6GROpRkP3t/AJJaTdzLWjmpQ/poDQkWVFpd47YnFPV7zFLEYgbY2MswrQW1uBywxiGmSv0iBFKsXp+xjI0iLfHvPzX0dLiRMn3I6VYfHRU9m88WLO7d9pKnNnboWks6w0GQ8FGfses1ZIirz0oaKEcNZVHUjVNOrZRrXSkiOgBZo2nyRsrxNMv8P98S025riVQvECaXXtX0iInqpexPZH34yJto3umOW18fRNfujMfo1VgBabidMdyAPslSQ9n4amMA8QjxxDWMX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8nJcolPsRnkQBhfl8OlvP6KhoU+y2+T/M5M7rwXCP4=;
 b=RNe+En7BKHHuoi0QwJOx7Q/kjymrhgNHn/5Gn6zS+LoSJ9YuJG8CzIp48gVxxeGxL07e+boOWCk4uqIytv2S2zN6yhvnap9GMtE6Ig2jkPw3HyPrnho1Qy8FNMATO0vCBEmREVGWnkMH2UzZfW3Eume3405p8RVuzOZGZLxZ5gKGM6QrXfIm1xLghLlCTxV11kGmmw0xwunHCW0aKBC6kjxUN7ekoQeUqK0DXd3VtWDQN8Uj7UgriUAD4vKRja52r7TDKYvXlPZQ0jTEj5tITChTxMxJCBQyDOvN0IvXrG9hIUDU4CUugAQML4Pdl681j/D92UigxjPQtwezDZ5jew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8nJcolPsRnkQBhfl8OlvP6KhoU+y2+T/M5M7rwXCP4=;
 b=x+uA016Hj0qbzvqiO/LBZIiLDM9BCsGHV5mPSt/VhOG29nQjyBNSu2f7wX4PPkqkz3L+oYTaThd5m+tjLxZ8taaVfGKL9xETCbjGChQfMVN/2gRtcW+BCMJKQ6a0UeeyR1cRn9VzLpMBNiagS0YgpYbwowIQRdaCULpC2yBI45RB/8+OQzZwk1+5man/+cDcayHPcFx0kJ/23LbJDyhHqA1F/KI5ag6B0zg0N4xOpZrANUolbip82Mzw1YUsj7RfOnzYkC02umVZGT7dDpxFGGed4CgfmM83ZisEPh4n5GV8YsB6GgVADlmKD09irvN1+MxnNWGdruJi7U9o54eplQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0370403-9a1e-83a1-ff8a-1d3d8c463959@suse.com>
Date: Mon, 16 Oct 2023 12:04:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [CRITICAL for 4.18] Re: [PATCH v5 00/10] runstate/time area
 registration by (guest) physical address
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 henry.wang@arm.com
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <ff8994eb-968d-4bbb-a960-e5ca78ef658e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ff8994eb-968d-4bbb-a960-e5ca78ef658e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0216.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: c09c1156-4b2c-488b-a4bf-08dbce2f5a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eOExx9ZX0g5wM5Xv8d4vFhTNDzzTK6lan+de3IB8BgLyxqq+OaGXXXyxu1SGUDIA3Qgk+erCD/mOyx7bc88KpyAKX81j/3amTnfvco6x7pIPjOTGtNi2oTcl89pR+RrgYbGknk7UC2QgL+9uIm175ZTWQbgIhyAZnYrAFOqxX/7ClXNdAdcSiEk1Wj7iaAB28zVEzuPwabdNDCxJ/6JqWUlP4sCc6Cfap+1ciCee0kxBZ677q7tyi7H1SND/mEgr1iVGJGWIW2/7YgF0PiOiDzYv3eftyVHGf6MFgZwEyAnm8w8TnRYmSQRVFNBuKDbfpZxxcUNGIXLVBpI1Duy9snBHLa70eXXQR1hMaZ1v7f6IwjHuIbMwwipuutWlw0XHYYhOdWKphtf6p+VRRIVOZQ+osyXpLv8/CloqrBd4N6AEGenrjnkURjBHc1g7KFbGyNAdIBAy0tkb5IuyCnU8RsQtUesov857mfTLpYFfcQeE+kNf25OQUvQoOR8ZGTeaRYyyZ5diqURxuc1veTgZenRDbP9GEai5Qx+wv2xS0ybAIpIS58NThqgNjq5YwIlkcx5y6eMy0Nstm0ciCSiyphZqsyQBRbw8G+7P1uK7j99M+KIvWlWnWhuC+4Glf0xuC155hAbC3262SvUBBAOa9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(366004)(39860400002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(26005)(83380400001)(38100700002)(36756003)(86362001)(2616005)(6512007)(53546011)(31686004)(31696002)(2906002)(6506007)(5660300002)(66476007)(54906003)(316002)(66556008)(66946007)(6916009)(8676002)(4326008)(478600001)(41300700001)(6486002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVRsRlFQaW9YWHAvWlR4bkRPcEtRWDFOTy9FOHJUVnpZVC9odmpUYWZEQ0Jy?=
 =?utf-8?B?VnJjQU9YRWswbW5rSXp5WTZzZlRkclo0Z3pvRWRTWENnUHlBZkVqWVNscXNw?=
 =?utf-8?B?VUFPdnpSbWRudklKT1JOUjNDMjJCaFR3dW9LWlRKSDRBdEZDN3VjNVFUTDdn?=
 =?utf-8?B?dWZZQXFSNXJSelN6MTV4ejdnQ29PbmFqdG9ZTjdTN0tSQVRWVHJCaUprbUpD?=
 =?utf-8?B?R1gvaW1qa3lLRTNUT3hLTE52aUlwMXp4WlZnbExBaVlhYnpMNzVHWTJ4dWI4?=
 =?utf-8?B?eDc5bjZndFpycWljVUJrVkxYK1YyMGJabUhuako2eFE4Q1lSQy9sR2pjZGJx?=
 =?utf-8?B?VHZ1MTY4U08ydXdIbXlEWitzQW9wUjZVQzBKSWRkSEQ3VzZRVnduRjlYR2tX?=
 =?utf-8?B?SUtjMDAvK1NGd3lkZVJadTNJcmJCZllYVldsRHZ4OFJyT3dVWnFQM1VhZFlO?=
 =?utf-8?B?R3ZDNW02dHcyL2pRT2pUOXdacm5PUmJKdmRvWFR2b2R3QkhGM1VoUXVUdk9n?=
 =?utf-8?B?a1d2VnFQWUtHcHdBcjRCcVVUVjVGWVpTODJUUXNtZ0dEUUJvUHliZ0l4Vy9i?=
 =?utf-8?B?bkFOTHZQbG1BNm41UXVSeGZnc1d2UWxrVTNYS2piVjVaZTdRNSt6UGF1cklG?=
 =?utf-8?B?T1pXdHJJUXdOSkprRi8ySEJya3lJdDdTOW9zSWlEREZXa2lRd3hUZ2RyR2Qz?=
 =?utf-8?B?VHNoRE5QMGlWWmplRU5CNFphZ0JZKzlYZHVHUTErckY3ejA2ZGhJTkxDUGJW?=
 =?utf-8?B?Z3Jvd2RRQng2YVM5Myt5djNyUlRnV3VVM3dRVUJJRUZDa2FsSDdvdVExUlNX?=
 =?utf-8?B?NkI1WHJhZ0lkTUt2VXBseHlMcXJtWE1kQ2dCOVRDTSsvUCtKTGJqY1V4cjBJ?=
 =?utf-8?B?bHRwcmdzK1BlSm5BV1VjTVJvTkZHczl0OUtabHE5czNBWGZheElHa05IVFVJ?=
 =?utf-8?B?UEtVSG43bVNRaGpUUElXQjh3Sm5JZXhMNkQ5dkF5TXBXbHhEaHJBMm1PbE4x?=
 =?utf-8?B?T0NDOGYxRkpNTkt3MHh0RCtTVFJ4bTFEU2ZRckcvWWVSNDhkbG9JbGFTZ3k5?=
 =?utf-8?B?OFdZbnF0SVduNmw3cy9vckRJTGxtL1RKaktLM01JRUFQYjFrRVZJOXBYU3JN?=
 =?utf-8?B?MXlkbEY4eWUxNXJPem1GSW9oZGxPbURTZis3T2wvWERmR2ZBYTJVV0RhRGFN?=
 =?utf-8?B?dDcyVEd2U0VYMGJTdnptWkZLZkhBVVNTZnU1cW5nVnhYaWtaR20rTkExYVZm?=
 =?utf-8?B?WVZMalJBazU3dk9QZ2lkamloLzRWM0owMHgyZmRNcUh6a284SnNBUGRyVFFV?=
 =?utf-8?B?dlFJRGZoNjRlUmw1UlZpUHllYjg2cDRjaWZlRVJZMHNQWE9zVk1BYkphS01M?=
 =?utf-8?B?TzZCL29kZ1ZkeEdpRStFYTRWSDBxbEZEa0ROcVpUSkFOdVF4RTA5UzBDSHZ1?=
 =?utf-8?B?NGNsV0JlVjFlRnZBVWZ6VWU0M3ZBNVk2NGFnSHd4dGZ4ekZCMjhkTFZ3ZmVV?=
 =?utf-8?B?azhOaTA0ZC8zb3VyZkdndnpuY3VXcEVpV0tEZVlaNDZTWlVaYlNEd3JHU2Ny?=
 =?utf-8?B?bkkreUw3TW8zTFNmd3hmZGtCRHB3cFJYM3cxRlhzWjg3Y1BpeHhXdmVUN2d0?=
 =?utf-8?B?U1p1cXd0dzR4MFliOFhRdU9vbGUwY25KMEhldnBaZGJPNnFZZGtzMUJJR0dL?=
 =?utf-8?B?MS9ieXRLZWZzU1UxYlVtMnB2Yk9TMTNkNm1tbXlkODBYZmdWSlllcUlwY1Q2?=
 =?utf-8?B?NFM0NTFxbGw4ajNkbTIzR3kvOFpVYjRJUU1sQ0NvR1NJVzR6NXdVbTlKQkNS?=
 =?utf-8?B?NGRoY295VnhzNThYQlRzK2F5WCs0K3VTK2hla3BkQWcrSHpXcU1DZXhnWGpv?=
 =?utf-8?B?dXRKcnR4a3g4NUtUcnIzanN4YzR3WEwxY1EvUDhxSWtaZkZ1VDUxKzJhTk5j?=
 =?utf-8?B?Ti9NMlRZOGZDVTN0eGd1enJSZ3hpQXZ6bktIL0NyWWZ4ZHJzVEJ5Q2lNbVBF?=
 =?utf-8?B?eUlzRVJ2dHByeFBwdkdDczk5bFora0Z2aHd6bk91LzU4K1JGUEp5TVlTNHFZ?=
 =?utf-8?B?T0Q5cFlzQkxEOTFYOXVZQTU4UFEyV3VicEpTY04xQm9QM3FMVm9IVVFDZ0Jq?=
 =?utf-8?Q?X5OkT1Wb8FV+wBEbcxPbK1OuR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09c1156-4b2c-488b-a4bf-08dbce2f5a4c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 10:04:57.8322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+JzAH3FmTL+EG7mxLX3G7vdHvYX9xAMth3oQjPJTg0tbUU/YIvUe8NAdSf+/fZhacVJ6LTv40STlS+RLRph+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817

On 05.10.2023 20:58, Andrew Cooper wrote:
> I see this series has been committed.  But it's broken in a really
> fundamental way.
> 
> 
> This is a new extension with persistent side effects to an existing part
> of the guest ABI.
> 
> Yet there doesn't appear to be any enumeration that the interface is
> available to begin with.  Requiring the guest to probe subops, and
> having no way to disable it on a per-domain basis is unacceptable, and
> has exploded on us more times than I care to count in security fixes
> alone, and that doesn't even cover the issues Amazon have reported over
> the years.

This has never been a requirement. Plus you had ample time to raise such
a request.

> Henry: Blocker for 4.18.   The absolutely bare minimum necessary to
> avoid reversion is some kind of positive enumeration that the two new
> hypercalls are available.

I disagree; to me this is a nice-to-have, not a requirement.

> Otherwise I will be #if 0'ing out the new hypercalls before this ABI
> mistake gets set in stone.
> 
> 
> If this were x86-only it would need to be a CPUID flag, but it will need
> to be something arch-agnostic in this case.  The series should not have
> come without a proper per-domain control and toolstack integration, but
> everything else can be retrofitted in an emergency.

To be honest, had it been clear that you expect a per-domain control, I
probably would not have taken on this piece of work.

> And on a related note, where is the documentation describing this new
> feature?  Some tests perhaps, or any single implementation of the guest
> side interface?

Documentation is as for sibling interfaces - as much or as little as
we have in the public headers. I did test all of this with XTF, but I've
pretty much given up posting XTF patches, seeing how even XSA tests and
alike never made it anywhere.

Jan

