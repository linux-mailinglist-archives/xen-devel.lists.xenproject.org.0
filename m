Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4118D66B8D6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 09:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478401.741568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHKZw-0003wo-Sw; Mon, 16 Jan 2023 08:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478401.741568; Mon, 16 Jan 2023 08:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHKZw-0003tY-PZ; Mon, 16 Jan 2023 08:10:52 +0000
Received: by outflank-mailman (input) for mailman id 478401;
 Mon, 16 Jan 2023 08:10:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHKZu-0003tS-Uc
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 08:10:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48faaf59-9575-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 09:10:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7740.eurprd04.prod.outlook.com (2603:10a6:10:1ee::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 08:10:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 08:10:47 +0000
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
X-Inumbo-ID: 48faaf59-9575-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgaQ/59kQf2IXRpU+7IIGheMhmz/iUOMNwE+mH375JsTDbGqZbW4f/N/c5CjSZGxVwPktPX2obrgv1iuAbxSlfOAV5LyTfS3U61PFPL9FcJBjmPFjOg0ROwzhbTmwc9G93BLPTcdhxxgt+IcfM5kUSzwPcgrN/f6cyKMRL9PzrbLLpsP8fSiMCQPGHEKndks9KrooSWOVgPt7bXCW5THbu6FJpsDiEPiKI/1V6F3J+wSYHwhMx81m3n694pJOnLQArTxbAmirfv60w7sAAa/KTSd+FNZ5eRvZCilRabLzZNZOGWg4eRv57h5p9k7Fk0wstD3bZRHI6f6EdNOD2euHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cJBl3Wdi/i7QE6zNHOjm/kREqiE4r19as+0ZMjILFs=;
 b=TrNAUf0Wk3cTbnco8mkrxiVBhsNApPKS409g73AYeRWyxztyTKTf4NlywDISgGncpC8ewmzY61ae2XazyN+WsPh4+sZ9w82S22IaRclI3xbA0yNXJ85FSJ2+goFfnfCFBg0OCpK6NYN/3yu6YossPJmrsAuI+G+wa1a0yShVuDbdK1J/uVWjxMY5QBw3NhWtZyckuas580IwwEQVe0ryrFdDVGqploxpnlsfVc3fq9nCgQ1Mq/hs/F+yDULO1q0wDBzt9a/PYrzxAS5AUDt8YGZII9dUwnGMmdXoXmVFysyT7xe5bbRpXXKRhY6FDef+tmvu3E7EkElZ1Pu7cAwRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cJBl3Wdi/i7QE6zNHOjm/kREqiE4r19as+0ZMjILFs=;
 b=BV8m/waeFKJU4Smmi8c56/YJDTVJdpTJQo519PGtfVFh5AGM8+VYfaoVSN2iSwqO1UDZtqnYXSGIyRgTOtC5gdnNessC6I/ocPUtETzzxHVixZIY+/EO6+Swgvzzi7WtNvYAaJcNA8nhNPzJLCMWsnZUZ96Tj77CN2Ybih3qblP+2uzKNw8mSTrqK30LktMlmucDks6x0WVhg/SiEDIqNGTLSYqS5KqI4iDNg16gm1dNQGA7OrEsNaLfqTeKwnENMxhw+o9aYRzhYbbQJv4++COF+J9EiZGvP24VPrRFtPm/gkDZXkffhw7jXrYgVTi0aokYrdb0aspC/AQQ/y7H8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <51b4011c-e76b-d134-6ce8-cf72e2fd2040@suse.com>
Date: Mon, 16 Jan 2023 09:10:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [linux-linus test] 175751: regressions - FAIL
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <osstest-175751-mainreport@xen.org>
 <09573105-b441-9099-eda8-cc1e407da67d@suse.com>
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <09573105-b441-9099-eda8-cc1e407da67d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 95542b48-727b-431a-eed2-08daf7992bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Jd51VVuHlcmDhtZsixCRC/nX8N2vrfuNJ+5Xxoqdle8sTOXgt0EwI8LkG4qRE5JJFmQwbcxNujlkglGW1RWlyFwcBA5YYQoCdyOuiTomo65cQrrLa7eFbMC9mP4TcwUVwa6EYwLDmdrB5lTNYLygylwZ0U6QeSp0VNH+n5a6Nj/xBjg/H7BEFVENxHv/oK8GLUoe3chTaVZ9wHpDAEvKVv2kCwkB4RxiAOeaZCcVWhPcPwYXCYPexw3b9E93O2j3d/Tva2tB4PfQvJnUolyQ7LnfDRVyoQM+3qZHgjnl/qB5LmiuOMiEu+QVtPxHmmWLgBcYWwK/p7+71xyIxYolXiPrMej2BEhTqj2u7/DZ2enJPmrgatpijhvJ8Q29SnpsRwe3AE8MYPMh+CW6a9q9VeI6XQ1NbqdI4cWOuyeRCX0NrlSoLT2rCb5CLrcvsQBnRag2tkpPpokHPUNxaUi8JikJcG1O+Irru2YB5yzOWxwb4IpTWnAYDGMAgEJOpCX+x2DJg2cEiF5YgR2HUscCjCsBJTDd6BkgeBqPrDmgp44LjzawXQ0KHOaY7/BBDWTDXCONrssYEdZPx0P0ytO4MrE+joqEkOUHE0+tbhZaOYyLDbr2bJuMFkwHGsFeCc9yuMwJ15fjUasAfXR9i6spFgY8Cd9eC1qnVQgfWx4XxUkaGfiiyPderoWfYzDpFqx8YoqU0Jgp/LNUlou/MB4W9Yy4Os/xXnqaUN/x0gMOtNOrJ+Wl3xsgN2FSfj6YdjY5gJvQc0RRU0u4HInyIEiFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199015)(31686004)(66556008)(41300700001)(2616005)(66476007)(66946007)(6512007)(186003)(26005)(8676002)(4326008)(36756003)(53546011)(86362001)(83380400001)(5660300002)(38100700002)(8936002)(110136005)(31696002)(478600001)(6506007)(316002)(2906002)(966005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0RocUdlYTFqRExmNUVOK2llODlRaG5OU2gzS2FHTm5vTVdEWXhDdTBBQ3VW?=
 =?utf-8?B?RXB0QkpzdExlOXE3QzZGS0xsZ2J4ZFdlSTJRaklRQ0JoS3FERlByYk1mT2Fk?=
 =?utf-8?B?N1pPdFBuM0VxZUZjN1IyWVRnQ0ZXclE1MDduLyt2N1B1NzNhdXdPZnpPOTBD?=
 =?utf-8?B?Wko3QUlOVzVVbFJJcnZocGFvMWE2UTlDTkZFRlNPV1BnQjlHaCtMYVdoaWVH?=
 =?utf-8?B?OVJHOEJwNERBQ1I5REZKRHBPVXJSaDBRNVFvQ2pucjhFakpVUzZsdE5CTUh0?=
 =?utf-8?B?U2hFN29BZHE1WXlJNE40ZjFpSHpybHVXZ0RhTHZBcDArRjRsaXBhWG1ETUV4?=
 =?utf-8?B?d1RuaUxoYU1BK0xLS2JFa2w1bkNmL3c2RkR2b1dXYnVuVnhRdDlMdTEwRUVx?=
 =?utf-8?B?R3Z0eSs0S3NLVHJvOGdLYkhJM3BPcUtmNGcrY0JCN2tzdUVsazZONTZYUkVq?=
 =?utf-8?B?L3M2VnFFSXRUdTJsVEdKN3BiZXJCdVBwci8vOWt4NkZObVRRSENtMlBsV2gz?=
 =?utf-8?B?YVdLdEM2SnFGNzhiUWR4L29kcEQxTG5mSVFqYllQckVGOWFyRlI4UWYrWDV3?=
 =?utf-8?B?VVBFeHVyWCtxK0FDN2ZJa0huTVMzZ25EK2h0aEV1Ynd4M2l2VTdwSE5uWnNV?=
 =?utf-8?B?RmxNNU5FZTIzdCtoa3BSVWRBRWViRndZVEdlbFNqQWdFZHFlTCtkYnhZcTFj?=
 =?utf-8?B?TE84Ry9UREJQRlBNa0JCcGhVTDBTOG5aZWdsM2ZJNGcrZVdSU1FWdFQvcUV2?=
 =?utf-8?B?WnJkVjFUWUJyVldXcFZERmIvMVhYNlQrdHJIdDY1WjhLN1FCb0JFZE5RMXRx?=
 =?utf-8?B?U3JBaEsxdlJ0Slhqby9PREV0SnpMU3BtNzlpSTkzcGcweWk5Y2o0UUpzQXM4?=
 =?utf-8?B?MW1zQVEwdXMxOStISyt2ME04a2p1STJ3Z1ZXUkM3NkJBNnBrcjVBVjk3VXkw?=
 =?utf-8?B?Q3pUQmlYckR1UDc0eW9LZjV3ZEYzempTZ0FhV2FSY2N1MzFaOUdqL0RQbzA2?=
 =?utf-8?B?UjFxdlBCZEhMQjJlSk1yU0VEL0lkcmlleFBBWFJLL1NMTXJheXhKWXRZSy9H?=
 =?utf-8?B?S0lmbVI4WWNFbXQ1S2c1UEZNcmJCRldQWDUyL3NKM0UvaVNKcFJWOFdGQ1hh?=
 =?utf-8?B?M0w3ZStodUVLTkZMeVJSMHh3S1d1RS9pUDZ0VXhPWVVGR0FrWE5OZWk3STdQ?=
 =?utf-8?B?dVo4OEpIcFlER2dacENPdTZTdjlPdVF4WG1PUmxiblRncjdGRXlXUXNrT0xY?=
 =?utf-8?B?ODZUQnQyUnJCSDNkRXBtL2RjQU9NME8wZkVkdllvd3owaVUyejdZQkdtekVy?=
 =?utf-8?B?RENEeVlXendrYWF1MkFvYldmZnQ3L1RFaFdqWUIzQjdJV0xwcS82Wk1BR2Rq?=
 =?utf-8?B?RWtWbldDamhhRnhmVTlQZVcyRHZ0clc0aTRWT2NObUNHRXBXWUNTcmtDNU1z?=
 =?utf-8?B?YUVvbjNHNGJkVDYyZE15SnNRcTY5T0IzRVh6bktjL3drOHhwVk5HeFJKN2xT?=
 =?utf-8?B?QUg3Q3hGOWczSi9naHpHUlVVL2NQbXBIREtzQ2Y2eEk2R0pXU2x4OGJhdG96?=
 =?utf-8?B?M3BxOFlrcHRBckF4UkxZZEliWWZqOC9CdnJJbndLZXdCZVZBbGRQcG5qN1Bh?=
 =?utf-8?B?bkFRTUdzcmJyTmt4SlBBb3pObjcvcFRnRVZKMVVjWEU5dG1LQjdaeE90Z2lU?=
 =?utf-8?B?Vm5VVkRJRUZNb1ZVem9abm45TlF6K0dXQ0pOVG82WGFGZUt6dTVJNGpaUFpu?=
 =?utf-8?B?bGIxKzdRcmI1Z2o2enpYdDlQbWFod3gyUG0rdngva1BIR3phSWhVSGZ4NllH?=
 =?utf-8?B?UDhVMUlOSU1iUmtRdjYydmJ5NzByT1UwQ2tlbUFOSFo3NTUwSUg4UmlZYlJJ?=
 =?utf-8?B?U0NocXk2UFZpdkt0SGExeXFOZFZKdFU2N1dITVhWcXVEQVZOeDl0cUlvR1cv?=
 =?utf-8?B?dlhOekdGeWQxZWpsdWZNT1F2cDB0b1NWd1RJcGNnaWVaQkRmdW1VSmFUS3Qy?=
 =?utf-8?B?c3Zac252MW13OXBYWTVuaVBMZUN1eWtmcURDa21RNEJ0WkhDZXJEaW1lVEd1?=
 =?utf-8?B?UWdMelZXT2ZVeXgwdW01TXNkZG9Edjl5b2Iwa2pLeDBTTGtjSy82QkNSQmxp?=
 =?utf-8?Q?k3x5GOieCsCWWohTb9Wpa2Q4U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95542b48-727b-431a-eed2-08daf7992bfb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 08:10:47.0865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9fh0VA2+sr+OmlQOoLgwo3JMH9nVoZrUFXy5DtNC07WFWnLk2TZGt5a0FziV99lyMjU/hSoQNaIJjsWSAjiRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7740

On 13.01.2023 12:16, Jan Beulich wrote:
> On 13.01.2023 12:06, osstest service owner wrote:
>> flight 175751 linux-linus real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/175751/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  build-amd64                   6 xen-build                fail REGR. vs. 173462
>>  build-amd64-xsm               6 xen-build                fail REGR. vs. 173462
>>  build-i386-xsm                6 xen-build                fail REGR. vs. 173462
>>  build-i386                    6 xen-build                fail REGR. vs. 173462
>>  build-arm64                   6 xen-build                fail REGR. vs. 173462
>>  build-armhf                   6 xen-build                fail REGR. vs. 173462
>>  build-arm64-pvops             6 kernel-build             fail REGR. vs. 173462
> 
> Looking at just one of the logs I find
> 
> /usr/bin/wget -c -O newlib-1.16.0.tar.gz http://xenbits.xen.org/xen-extfiles/newlib-1.16.0.tar.gz
> --2023-01-13 07:41:15--  http://xenbits.xen.org/xen-extfiles/newlib-1.16.0.tar.gz
> Resolving cache (cache)... 172.16.148.6
> Connecting to cache (cache)|172.16.148.6|:3128... failed: Connection refused.
> make[1]: *** [Makefile:90: newlib-1.16.0.tar.gz] Error 4
> make[1]: Leaving directory '/home/osstest/build.175751.build-amd64/xen/stubdom'
> make: *** [Makefile:73: build-stubdom] Error 2
> 
> Let's hope this was merely a networking issue and will work again next
> time round.

Sadly this looks to be permanent - all flights over the weekend have run
into this failure afaics. Anthony, the other day Andrew suggested you might
be able to help with such issues in Roger's absence?

Jan

