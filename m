Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C156D836D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 18:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518583.805296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk5oZ-0004za-Tw; Wed, 05 Apr 2023 16:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518583.805296; Wed, 05 Apr 2023 16:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk5oZ-0004x6-RA; Wed, 05 Apr 2023 16:16:51 +0000
Received: by outflank-mailman (input) for mailman id 518583;
 Wed, 05 Apr 2023 16:16:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pk5oY-0004wP-MT
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 16:16:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43a4874c-d3cd-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 18:16:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7209.eurprd04.prod.outlook.com (2603:10a6:102:92::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 16:16:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 16:16:45 +0000
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
X-Inumbo-ID: 43a4874c-d3cd-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G51r360AJlTIkzmctJlQi5uTONjZ23w2RzfWg1JTOFp2blJGsYMICvGKY2ZsClzGrsggO/ara3CCk7jKC1owO1iRrXIdZNEBqWkp+/Cpj8clc2XeeCERBrOY5l8JUbMGujzsMWrDolQp2xMouNY9nBBrkUbYwZ0d/qoqMBUKA3ywEAnOWGp0aZ0LHDPUHN+zqE7jyOYUIJE5hQkX5ans0NW6nzSScqq69hNc3A0LESlxmYXa50P15wzs8M9LfSTPPVY8mM0vmrQYkCK8maNDk2q23d9k7B2Tj5jnkFhe4OhfH/FkYACz5j/tqrwY8k0Pu4lfzO9yhr9n5OujtNih7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED/pJhg31bjLlSP3HBT0D3rUkA+rwZgqc+paNaMixrg=;
 b=NYLlIQ9/1naOK2VdPAIDzUSt1sq7EoBnWB5XjiaqfNMuYNe7CMy5IbQZCjqzFak63WZKU9g+yP75Rz29eSfFwNImoVpeWSNwx7svXn/ZdMbaGoTwcnIfVRhnXBfBkXxSgaAWQ96XNw/yq+fPh7t3bdF/R2/I1W/9g7JEPbR6pv1RvRcpFLLZSrZMHzkkGtd5QnKUQTCYZMzWEskyU9TBSOaKLHMSF9okZkhpbKa/YnNi7uCERW/MgX0gYnh3/5T5xrlUt6a9mpWq7sQJDmopGHcKPp0sJbdszZ0AsuJcYoYdyNwGCd35qGjC+es51/WnhUzi+ghQjlP6UugBb/4Jow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ED/pJhg31bjLlSP3HBT0D3rUkA+rwZgqc+paNaMixrg=;
 b=mZNGfpiYZhmLFOJvEJcaXtg0pJFMjEjBHRTXNevU1jOosto2obndKIL51/2anZMxSsW9YCyG4je40Xg5VhCYIj91cU7mmWU09M8PNZeVL+spNQE9KY5S/pICGGrAWBUHzV/n9j3jZl1lHUUHle8RHVO9mKX3ugSg/YZU4M1kvQ/FTGUOAaweGgu73TGuONYdmxvXxCuPrjoo/MSQ4JP02uCqCMaaJp+bVI7vVCcBiTOo4nNqioKQBiDHGSMzZr9iFhMZQdEBUNNUi9ksR4a3rG2Se8Ichjg80keqy2WweOBY02bBIQaepoCmFEmg1n3XA1Sd2O2ozxo15qMQXk0mfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a665b967-3554-4d26-e2d7-e48ffd7b384f@suse.com>
Date: Wed, 5 Apr 2023 18:16:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86emul/test: drop bogus .PHONY
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <515bbf07-91fa-1932-1be1-1411f7814e6e@suse.com>
 <3d0c36f9-a715-4971-9031-04848bcd2d0d@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3d0c36f9-a715-4971-9031-04848bcd2d0d@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f408ce-d6fd-4014-eceb-08db35f1265a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VoUg+C1X0ETwSPJ+WM6IWBpLL4EodNswdejUlHFSCoiyLckJMAy58mN1svF7MG2Nc7i573oa9grWPqcQ8Bbq6SxyoAZ3Lw2lLsZIcu52HIo5fdovhdVkVC5wQqeWvynS30Rf0rr0Ma9VXn1A0wk61SndClqL9amarWV4/ykBJS27HScRPnQw/m2vn3bRmejpFCQqBIij4yyxhDq85dANU9JQWty2+U1ITdAtc7SbvMFV1khb6y6vGA7cmVR+tjuDEVltWmgIUegHQubMYrnl+68K42CB2HTMHdtQDcn+A4eo4Q6DD0OSX6hFzJYDALJ6/r4WNpEPfHS1NaxPG2LM6CKzj+Dux37AtOFdlvam3k5XBrFmuvNa14hKBPJbTVosUyNpe5koKI3V6/Co4eJ8ZCWVYGsMxhpdsjrBnEiiCfVHYWrkqq5SJrNvEG7kB9+0+Fm4NFG03nXjRdW6tC6K+tk0xctSmxTzfvLOOFtM/HlwSuLnXna7joCnU8St5sr7PIXNXlltl/NOkRmpuR7dHKPvH2rkq1Zl+Cd+KJyjfOI5vwIa/wzc575V87oxSgEa8U+Qd7yBqPBVZo7wDiznfPDffVbKa/Wf3OSUI4gr4gjdMW7w9h7z8EkkO+rYVvveHJTqP4GrV+niRCGvSpHROWW9KfxwceIxbSUcjP94Z5i0umZPRb81H1vZWSOMJRJp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(6486002)(83380400001)(2616005)(53546011)(6512007)(6506007)(186003)(38100700002)(26005)(8936002)(2906002)(5660300002)(478600001)(36756003)(41300700001)(6916009)(66476007)(66946007)(66556008)(54906003)(8676002)(4326008)(31696002)(86362001)(316002)(31686004)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elhVRmozMGtaeFZSd01EbmZaaXFLR1paSE8xVm12UENrelJuWVJXM0tySUhs?=
 =?utf-8?B?bmljK0JLQ1FBVVdTVlJ0VzZobGlnS0JrWDdTN3I0TWRPNDhnYXVSMEoxNEpu?=
 =?utf-8?B?MkhyMjAzVWNXWHB3SXphU3VqRVU1T0ZxME12TG01RUZRM0FyWksraUdXMVZw?=
 =?utf-8?B?bkJ4Q204Yk1Nclg1YXJEcVNoMFJOMFF2OVgwVitTdGUzOWN1OFFCblUrYU9t?=
 =?utf-8?B?a3d6QzBKR0FnOENhbWt2Ni9wNUZTaEtqTDNybzB3NEFvMStCZExQcW9CNEFt?=
 =?utf-8?B?eER6Ni91SDhkWXZGUHYzcFkwakhIbEc0RnBzZEEremp5Z3FYbUh5ZzI0Zi9I?=
 =?utf-8?B?WHJEcVE5QWJJQUJEc2liYU8xcFdRZ1IzZ1VjdG16Qi9FZ0ltSWF2elpPYmJx?=
 =?utf-8?B?c3Y4NmNqejJoRUpNM1lKaWZMa3pyNEQxcXdaKzNqaEcvZ2MzUVBTZjFaMFFO?=
 =?utf-8?B?RTM2OE9hKzQ0ME9McTFOV3pQZE9NeVdhVzRWeUtqYTlpeTRnNFRIUEc4ZGRJ?=
 =?utf-8?B?TmFrQmhyNmxkdkZkVFpaK2pBYVdIS2daTUU3Ui9sT1l3WWJUTERTREZmSmt2?=
 =?utf-8?B?VTV2OUd1akQ1NzZMNzNrY1RKbzB0c205ZjVKMXdyODhxeE1PTHJwOEFTUSsv?=
 =?utf-8?B?OWFiZWwyK1lvSURncEsrT3h1RHZPdTg4bmw3QjJCWnp2TXRFZEFJcC9Pcmo1?=
 =?utf-8?B?cm9mZHBjYjB6QXJSMmlWM3Faa0QzNHI5V2l3U0VqK3VYRFJHSkpRZkJqZDcw?=
 =?utf-8?B?dlVSVWlWb0UyR2VwMFJleGZlbkZsclR0R0YwQU9IcWdhOGs5djB3UGUzaEdP?=
 =?utf-8?B?V2pHN2h2UFJ0YSt6bFB6czB2b3B6bUUzYS9zRldhS2hGN1d2aFFiTnpZaVNS?=
 =?utf-8?B?MjlWalR2NDI0cllEaFRMSFc0V004OEIraElDMUNNbVJjT1o2S0VNOGhWRE5X?=
 =?utf-8?B?eVdORnJhSEgzdkNKTndQSTJDNXRXQkNkMG0rRlA4OGZjY3BYQ3VtQVM1MDhF?=
 =?utf-8?B?YjhTWTh6RlhOUzZ5NEFZSTVvbGttOFg1aVNYODBUNDF3bEdCaGtpMHdOZWRF?=
 =?utf-8?B?ZDhnOTZYRWFqWFl6QUVHZVFiRWJ3TDRzMWxXVFVwVW41ZlJHMC9sT1ZYaVl2?=
 =?utf-8?B?NkVsclN0M1IxbFNxdzkxUUdUaUZ6ZWY5L3JUM0J2U0NuOTlhb1RseGQyWGsy?=
 =?utf-8?B?cU1lQ09KdWFSMnl3OVNuSU5lUWJtMGZoVkJrRC9IWWF3aXh1Y2FiMXhMclFH?=
 =?utf-8?B?L1lSd2M2cllBc3pLdmVlK2pseCs3aFMzQStZMzVmRmEvU3VBTmxzb0VZMjZi?=
 =?utf-8?B?ekx1VEFBaWlPOEFHM0FNeXVaZjJ6WkdZWDhueG90SzRsdjlGeFk4S0paSG9s?=
 =?utf-8?B?a1A0RGJXVXEvbDErTkFicG9KeklNMmZUVzBMT0JWNHUwdS9FTEZkdHZWNmg3?=
 =?utf-8?B?bm1Wd2NYYlFkUUZ6TFovekdyejZFbzRtNzlTcVVwY0ZUWGwvWnNSUERuYVQ5?=
 =?utf-8?B?cSt6UDBjZW45Q3k2VlhSN2pVVjczeGJYbENoVVJEMDVpZHY5U2htZ2VGWWFa?=
 =?utf-8?B?OTAvSUZNZ3R0c1pmOWgvL3cxWU5IR2FrNjhobTkyeDBFSFV0NDJvcUdhQmtx?=
 =?utf-8?B?RFdQb2ZrUm52bldUZllITkR6WDEya0NYYzFyVWZUeWUrYjdFaXVoRU1QTm5B?=
 =?utf-8?B?NitXVUFjSUVTTjdDa2Q2TmROZUlHVkRxVWhMUXpQd3FNeG9IRmdLNS8xenZD?=
 =?utf-8?B?cG5qb0pLSjZ5MzZUNjcxZXp3M3hUa3JPTkhxQm10ak5USzd6d2JxQktKRU9P?=
 =?utf-8?B?ZUxoN3BwS212YVRJR29hMXB1Z1N2WERCYjVzV0l2MHJCTGt0YWR3ZHFWSjha?=
 =?utf-8?B?Zzc0RW5sZmgyc1dkcEQrMXR1VGtzaWpyc1FweGIxRVFzSC9CQVR1UXBmZElB?=
 =?utf-8?B?QTdjaURqY2Z3UVJxUUhYTTBQR05tNklTTjBpcnNodGIyWThFUExVQTVyUm9x?=
 =?utf-8?B?NktQSVFLWlZMUzRPR1JWMkZ5N1dzNGI5N1V2WHk2cDVUWGU0bWU3VlA5eUl0?=
 =?utf-8?B?NmdCcm40dVVZeExQTDZncTh2OUdYdlh0WGx1T0pIYUpFMXBHTFBqdEx2N29V?=
 =?utf-8?Q?dDVP/ux759MFd0lggR7tSXmPT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f408ce-d6fd-4014-eceb-08db35f1265a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 16:16:45.3713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hkqCkxhLiFzUQuOdQ/FnH2qB0YKzXT+Mb9IqHxYVDv/QDHrxcPUCrGBh2BsCAszCgEZeQElyltkw2WiR/SoFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7209

On 05.04.2023 17:48, Anthony PERARD wrote:
> On Tue, Apr 04, 2023 at 08:37:55AM +0200, Jan Beulich wrote:
>> x86_emulate is a real (directory) target.
> 
> Indeed, x86_emulate is a directory, so having the target in .PHONY
> isn't bogus, but kind of expected in most cases.
> 
> Here, the recipe is written with .PHONY been used, as suggest the used
> option "-p" from `mkdir` and "-f" from `ln`.
> 
> Without .PHONY, the recipe will never be executed if the directory
> exist. And, if the content of the original x86_emulate directory
> change, the linked directory will never be updated.
> 
> So, this patch description needs a reason for removing x86_emulate from
> .PHONY. Is there some kind of bug?

Yes, but it was my brain that was buggy. I deliberately added that
line long ago when converting the symlink to a real dir, and then for
whatever reason thought recently that it was bogus. Right you are,
and I'll revert this change.

Jan

>> --- a/tools/tests/x86_emulator/Makefile
>> +++ b/tools/tests/x86_emulator/Makefile
>> @@ -278,7 +278,6 @@ else
>>  run32 clean32: %32: %
>>  endif
>>  
>> -.PHONY: x86_emulate
>>  x86_emulate:
>>  	mkdir -p $@
>>  	ln -sf $(XEN_ROOT)/xen/arch/x86/$@/*.[ch] $@/
> 
> Cheers,
> 


