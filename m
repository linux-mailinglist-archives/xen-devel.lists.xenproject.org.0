Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB566C6DD5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 17:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513972.795792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNxp-0006ZC-Fl; Thu, 23 Mar 2023 16:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513972.795792; Thu, 23 Mar 2023 16:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNxp-0006WS-Cn; Thu, 23 Mar 2023 16:38:57 +0000
Received: by outflank-mailman (input) for mailman id 513972;
 Thu, 23 Mar 2023 16:38:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfNxo-0006Si-4k
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 16:38:56 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 327df0a0-c999-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 17:38:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB9810.eurprd04.prod.outlook.com (2603:10a6:800:1df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 16:38:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 16:38:51 +0000
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
X-Inumbo-ID: 327df0a0-c999-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhP58NWo/CU+T6oGtIKGZiiHfDY/8rrEwLjSF26AdWLrdsehM0ptipjzdkYNZjOvSXkeN83AGOcuB0axnLSAt3SIzIHXFa91AnVMGMQXu4L5PwQiDbUHSkMhlxSkB9xXBd6gBPULP7RC6zy2s4wf9uqQUhUEbknJ0yppEg7ziyPY9x3QIX+ctqgEwsEgO/E7aAA7FSswCly1A4umwE7ruNDCcIbaGHAzobypRcBf53EVbAbbgcQtwWuOphTfi3DKM0GqZSZ59qfBo+mLxC0SlstUA2oS8uMmXhnhUV8OpGiiOlyK9Kd7IL0waFGPlbFuvJULezLs3D0IAJgCoLpMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ial2IyWYu3MSlxiqQUDy1MII4M8ruSAS7b/J8/UTvQ=;
 b=A/OPArNvEe2wV4Sn9I0JJ+EW91VGIXeZC8g6J9QsgO2FR+a6g5+ccbG4xDotx5YBnYNbz3bF80B2SgZGaAofTV622mh2Cw73K+i7B1jeeIX2DjfHaz2AMuqD0KVFm2weuaW/X/fQ2710al6VfpgmvrGlaqvSsIib5+5Hx/WEfkIE5tHLT5hc5rn4K/pMcjnKY0gUJR7Z9VVFvUpDWYiYWu1qQu6V8DGVaY1tl1W7/Z04vOtEIDtjHd5eUWo6eUCGsN0Jr6NhnrkfopyocH1DFK+RrAM9oj3WWFD/soI+JpYXHUV15iz2m+efIZQavLUa1gV6YivPcUbgcNJHqy9L6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ial2IyWYu3MSlxiqQUDy1MII4M8ruSAS7b/J8/UTvQ=;
 b=U61YH+VVMeJGfDYFupqRcJCDGh3YIndmMQUnJLdRl4h+kN11t2MHxC6GkPAMinPQoEM4b6MBK7GhgbiqQUmdG7j6MnmEn9bvvxIcAbb6ruwFgGyBsJkex1R5ZmX0w+QLUfPDKV1aKNdmJhw+S0qfP9sbuyFqbcMH88V6F1XJxpMlFEC57cSgzNT3yXbLX4Jd+o1lkH5XXv7JbCiWglIzA8qdklCNtN+Od5YaD1nJn2q9XlLcoSI3RKEjHj4gWuhRVc4hy3BzBr7dIIGE8DD7SjzNp7FTP0r3u48+iLR4OubgUkUCM+yDNgxXqR6lZX096qtzLOkV7c2GvMhOMqJ9Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe65b5ae-f5db-0726-650d-173826679f2c@suse.com>
Date: Thu, 23 Mar 2023 17:38:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [linux-linus test] 179607: regressions - trouble:
 fail/pass/starved
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
References: <osstest-179607-mainreport@xen.org>
 <ea0532e0-12c4-674d-392f-216658071f77@suse.com>
 <41ab8c98-ee53-8a21-56cb-2c6d801af0b8@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <41ab8c98-ee53-8a21-56cb-2c6d801af0b8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9460fd-b159-4cce-5d42-08db2bbd1563
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mOLIBzBcNTQk72mMuYh3J/60Y8Pj5PDxhQ6yX1Ds6A94YLvWxN3MV5dleykyMNG/c5GcBe0KfbZN+qZo59Gk0NDOnNJRQ1UAIu6QAtt2TJWoKkd3JWLzVNyXj5sib8T47w21gjZr5j6xONBt0xNGkzS7lwMMcY8ssYzO8++s6Zo7XCrjUF3JG5V+wI8dw0ReEpAtGEJ1uk7a5m1g4vq2pZEK+BGfTBvSigFNOvhrzruNnQErC1FsuExKdgBWUgyagzqds5KP8JPsl/b6xlvFgB3Lb+KrBKcfXmxzUsQgczcZpdsU3nnG3yU28MNYqbWN7lTLLBn7lxUDsRuETK1q3wi/Be2WolBauw9t9twEl8rE3vItq/VJGTtFsbwmDol8nvbU67sJGUMl+nqY7R55wJ8QJYniNSWsQ0qe/TwTBYdfgUk56kgvLERoUubdjPidjYE1VBQME8FyS3hqvn1s/nFcsjMXaaVzPfqhSjKXCBp1581dLZg1ay4lsGyPQFJnB3aOC75uUslxDQd8ETZ2CWBJ36zAfHnM0BbkH1zvzETLwPozhMJ0ir0iUAUguTKbwnuRjhavI1yYh4UqumFb5iYsXSVa/vCs2YprmXfzoU24uM0OBo6SYam7j3uvhLY1JV2hoE0wax/5pnxzfsFa9JRd/QfxasiooIX7vZJmVfSte8kipoNIcQllHnJ9a2IZt7Th1iViFnD3y33Lma+flfnETEozMukZM8PdE6u6msU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(136003)(366004)(396003)(39850400004)(451199018)(26005)(6512007)(6506007)(38100700002)(6666004)(53546011)(83380400001)(36756003)(2616005)(186003)(41300700001)(54906003)(6636002)(478600001)(31696002)(5660300002)(8936002)(6862004)(37006003)(4326008)(66476007)(66946007)(66556008)(8676002)(316002)(31686004)(86362001)(6486002)(966005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjVTSXlFZ3NBejAyak1FZ1hVVkVCb3V3ZXZnTDBsRHlsRWxuZTUvd0RpWG9l?=
 =?utf-8?B?VXBSSzJnVEZ4aGlMTEJlTXd3aTVCSXFhemNKcnViZXcrQVhkY3lySjBUQ2dw?=
 =?utf-8?B?ZitnSUdvNm0rOW9CMTFNSkpVdFd4RHJ0R2xGVXozYWYrNHovdW4wYlRyYUto?=
 =?utf-8?B?c295cVczUlc4MmxsdHZZa1NYTU5yNHo3UFlnSkhLS29ON2Z0cURzdklpbGk1?=
 =?utf-8?B?QkJGTHpYYzlvZS9LRkhPZjZmWk02QzFUYko4VGc0enJCK3BhdjZSM2x5Ylln?=
 =?utf-8?B?a0F3MVI0WnJJdk5qVVFmZjdxQVVzSm5WeUpDZWhQaU1EUTdTa2VjcHdVak4y?=
 =?utf-8?B?c0JpU0U1R25IWVZHOWFRNWd1V1M3Q0tmU1pZalVuS0gzcHJtMFF3NjVjdzB5?=
 =?utf-8?B?Yjk5NEdDR3JCaE5OampYSm4zeDlyQkxjWVJtUkFVRThCaFZNM2R4ODhMRXdB?=
 =?utf-8?B?VHFPalZKV1ZVckZiaEVacnRWTUpuSWRQRmZFMlEycVRSS09lK1lzNGJpeVVL?=
 =?utf-8?B?dDNZYzB1SmdUTldweEIzWElhWWN2ZFg1OFRvd3hobWpySW9DRzl1cWM2M1dP?=
 =?utf-8?B?eHhXdXFKTUlpSHFUWCswcGgwWDZYQ0VGNURMb2c4SUVFMi8zbU9XK3ZoYzQ4?=
 =?utf-8?B?czR0blJLWldMUDlIQmFBZWhDazY1dElVYUk2clpQR0RMYTQrV3pFbCtjSEdC?=
 =?utf-8?B?Z0NFcmE5ZUhlY2d2WGRmdFdHd0ZtejBZZFJ4VVlITjFOdTZlSVJvT2VGWklT?=
 =?utf-8?B?MEE3dXFab2FnNTBkbFBlNFZBcmdOM1JPbUhieEVua2JqVk9zWHhpTVcybk8w?=
 =?utf-8?B?bnV1QjkvNnZ0UUk0RzRIQzBWTmZ2eUNDa0hZd0V1c1ZGaURrV3FNUzU3WUp0?=
 =?utf-8?B?MUswV0VDcFNuUVJQYXZYbUFUNXZOMGVhNUpvcUZtRGZ2L0diL1preGgrWWRL?=
 =?utf-8?B?ZklyUUdQUFBZS0gwYk5WblpTQm5RL09HR1U0WDAvSkpDVlpLSEl5M01UbC9x?=
 =?utf-8?B?cUVuM1Z2Tkk4RTFudnYwOHpTMHF6dTdRdFRpOE9QQnZ5eUwzSlVIYWc3blJZ?=
 =?utf-8?B?dHRMSFVGTkY1SDhrbnhBNVZyZE5lRVNYTEpRL2p6M0Z0MkVUUWtvNytiLzBX?=
 =?utf-8?B?Y290QjhMZXZoQituR2pIamJoODVQR2RjWjZGVmM4UzQzdHJGa21wcmtZaVBy?=
 =?utf-8?B?ckltUmRpWkMxcGRnTDFPbU5TYmxORUZGblhFK0ZQc1U4Nkp4VGd5Y1BKL3No?=
 =?utf-8?B?NEExd3pIOG5BSklqeXFtdWhwNjMyNGFVV2ZuUXpYaVRCUGpCbytPdlhHVE1j?=
 =?utf-8?B?bUdhYXI1VW10Tmh6d0JEK2ZZU3c1OEx6QlRYK2RRTmdyS0ZsOGV0dmo5UDRG?=
 =?utf-8?B?SDM0WWpjbVVCcCtBd21nbStGMVJWZzJ0enlEeW9QeTFSWjlPUDlBVzh5R3Rr?=
 =?utf-8?B?VFNMN1plaGNDNHhmZXZKUzRsSXE2YUo3aTdpOVo2OXFIK0NWWVp3bWhZM0oz?=
 =?utf-8?B?bW9YU2ZiV2Z4ZnJqbm1RUUJUamtucGpqLys5VFRoQTNSQmhCNmVRRVcxbW5N?=
 =?utf-8?B?dFJlMll0bVRGcDE1YzVJMDY2aSsvRmxFOFhFeEpPeWtIbEl0REFEaFQyUFA2?=
 =?utf-8?B?M1RFTWQvVEF2N2hjYWl0VFVpUnd5Wkg4RlFjd3UwNnNFMVhkUTBiSVJ0UEc0?=
 =?utf-8?B?bng2QWRuam53MmZJSTZOODNMeVJFa0oyZjlUQ1ZuUk1tNExLeVdKeEszTi9l?=
 =?utf-8?B?ckdCM0pkQ1FSdytlVjNrYkJUTS91UGlqVi9ZWDlSWDN5T085Tk1SZHRIZzk5?=
 =?utf-8?B?UVdPNjFHT0FvNjZlOEMwa2FCdnNKRll3aGk2Mnd5U2dkbTVMQkpOQWdYN2RZ?=
 =?utf-8?B?c0NkWHpKd2U4aXdocGtKd0RSKzBkZzdhaVJvSExtRWNweGFuSHkzdDZEbkxI?=
 =?utf-8?B?YVZXcmh5NE5tYXhSRTlmSnJqbkp3OXJKTXVJdU9GUloxeEhIZHc5TDYrdDZl?=
 =?utf-8?B?b3E0WHphU1NEcDAxWGZPSGwzZnBnUXpURFhhU2lpdkFNVjgrdG96Tlp5THdP?=
 =?utf-8?B?RzdDdXllRXhyWkltOC9jd3FxN2ZqNmRSdGt2KzQvcm5lc3VJK3c2dHFEbUVM?=
 =?utf-8?Q?yQsyjK5xAi/KTRSpmkuNePq34?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9460fd-b159-4cce-5d42-08db2bbd1563
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 16:38:51.2422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAT79fy9W7BoAW0TjLHVC3S3waWAF7HrfZDGiFXWzBL0VswHMIt0mY13FdJandgT5QaRhahbsKJjOF19tTU9AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9810

On 23.03.2023 16:55, Juergen Gross wrote:
> On 14.03.23 14:27, Juergen Gross wrote:
>> On 14.03.23 13:52, osstest service owner wrote:
>>> flight 179607 linux-linus real [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/179607/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>   test-amd64-amd64-freebsd12-amd64 13 guest-start          fail REGR. vs. 178042
>>>   test-amd64-amd64-xl-credit1  19 guest-saverestore.2      fail REGR. vs. 178042
>>>   test-amd64-amd64-xl-shadow   14 guest-start              fail REGR. vs. 178042
>>
>> ...
>>
>> In the logs [1] I'm seeing errors like:
>>
>> Mar 13 23:51:26.275421 [  271.713740] xenbr0: port 2(vif1.0) entered forwarding 
>> state
>> Mar 13 23:51:26.287346 (XEN) common/grant_table.c:2982:d0v3 copy beyond page area
>> Mar 13 23:51:48.115383 (XEN) common/grant_table.c:2982:d0v3 copy beyond page area
>> Mar 13 23:51:49.123347 (XEN) common/grant_table.c:2982:d0v3 copy beyond page area
>> Mar 13 23:51:49.459367 (XEN) common/grant_table.c:2982:d0v3 copy beyond page area
>>
>> Given the vif related message directly before those errors the chance is high
>> this problem is related to netback.
>>
>> Ross, your patch "xen/netback: Ensure protocol headers don't fall in the
>> non-linear area" (upstream commit ad7f402ae4f4666) did the most recent changes
>> in netback affecting GNTTABOP_copy operations. There are probably page boundary
>> checks (probably on netback side) missing. Could you please have a look?
> 
> Okay, I've had a try (see attached patch).

Just one remark: Don't you need to use XEN_PAGE_SIZE in place of PAGE_SIZE?

Jan

