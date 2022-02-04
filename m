Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E74A95D7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:16:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265217.458529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuh2-0003zF-If; Fri, 04 Feb 2022 09:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265217.458529; Fri, 04 Feb 2022 09:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuh2-0003w9-Dh; Fri, 04 Feb 2022 09:15:48 +0000
Received: by outflank-mailman (input) for mailman id 265217;
 Fri, 04 Feb 2022 09:15:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFuh0-0003w3-OJ
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:15:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08a38f41-859b-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 10:15:45 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-u441yXTFM6KenmgCxzw2tw-1; Fri, 04 Feb 2022 10:15:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6247.eurprd04.prod.outlook.com (2603:10a6:20b:be::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 09:15:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 09:15:41 +0000
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
X-Inumbo-ID: 08a38f41-859b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643966145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7u6ixG3pydigi95yu3HXcWX5ujp0fAcJhFelHm9tapQ=;
	b=bqQAFG4YJ9ebUg++IDL97bTm1wHnsgNoO3QlbSQPamr0sBL+xvPVrU0wMft11aSXYBSPkh
	SIo8f4ZW4msgMXJrFiSXEMQShVD8TyXdIdPvdexodA9TlFvizDEroCQaCxCtG3Wn1516Y+
	oeCqW2+a3ju4m+aEsT+y7OHa1K/7FfQ=
X-MC-Unique: u441yXTFM6KenmgCxzw2tw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cf639v5I4JWlT+rZEmK11ycFKaQVsJf4m4s04UIgPyUHEQ9rOpArsfxhI0PKG2nvxNL5fNuDjA9KkUkqUKmfDIyi9mGp1UR+Iq3dVCLI4fmUQ5JjRZR6kEh8ZVysjVoh/Ka9LgwbYPdt+ou3gtUgXw1KbgjwODRh0p5qV58Jh4KpEoA/f1DUjuvKaYlmuTDs5fnq1YG/GOE2mbxhnGIya75bNeR8F5pMkYjGj0jQboGy65eUJS2UFwEg90yDnr1F4uIAlODuoYB8H+XdDjOta+4NekeAc35PI8FTCK6n41HZWfFrVGBqXJN1G5rKE+IDsZj9ivmrTO/Kgrwwn97KcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u6ixG3pydigi95yu3HXcWX5ujp0fAcJhFelHm9tapQ=;
 b=fmkxEYMAywPP+s7uVRt9ykHcONPqTTTMASRVFO++2I5XoItRsaUgDJ4GQF0Hovo3fTvL5iPdDLhJ40NcMityZ2vkMl4exhelt7GddyvGPMvC9wJRoWBcjB2K5fuvfKEg0IkklFOOThZu1BxvYBINLVR2UAeUonUSpOWaC/kYF4QR2KafmIQKC+QZWerUw2wSy8WSad3eJ48lRvGK8q3QU7CyxCuHjBVpJZfu9BjPxop+15dh/MGLycdaBrEWONELkYaZo8pY7V9GmeFJuTZWhqZzHErnhGQN+CPm3NXibzBToTEbjl7p9j43EXxGg5YuW7KeiR1+MCDwzmZ8T6P5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
Date: Fri, 4 Feb 2022 10:15:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0021.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa4a7f26-ddca-45d0-d9a8-08d9e7beea56
X-MS-TrafficTypeDiagnostic: AM6PR04MB6247:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6247B560E798517F217EADE4B3299@AM6PR04MB6247.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yjWVq2JHoRRAl70YQGcaR1FHZutedYXlro0h8Vo1DoQ+RICVz9UAlTyZN1IPUfCG2JVEoU8O0k4qvIF4lN4HIDus7So1zQEjZ60PukDCRgv+xGvO7XkUN19xcXmggXn8s7XDbeCzL4jcB+BOdM+06+KgAMsGcpWwwOl/gStuGZVgNAiKfDRB0M19i+bCQagY5HRP3+k3W0DUSNjU6oDMqNOOxHRBkis0HnmkBiSxXQNe0/5I1unOkfhDPHpaN98XkjuMRUMJZErsAScXajZbgTvmWPDLtibHDdv0athkwRlMCw3BmVJyCfig46V0lFn2sYRAuZsHgJodhsaUO+opTiPm4DxiNt07dheU4f5KUnUNX1QcUOqdS+fonkLLXjCOYdgeUPu4wvZ0nUx85xaPWSQBzrXA08grVZyGs86gQrl5hvxOPHUdtCA5zHxhk4Yp2rbpvHBkLKu5cUGfLyNmjB6ZKkoysKycGbMoFQaiFVl1O0ZesIDI6aJYga5BQZgV8V12KwKtxTgAXhOaoq6SHfeYXUtNx7FojU9KliNzJ05isM/BChF9NKZFwS9rRvaHxKI8OW4XqO6YwFy8y/w995PjcXjcQvjhQgvwxTdIVBy4YoaFPwrTiQBWXboJhqcGlwbkQdEiscXAvkTpi8I6KAYnVy37F1M94SnXm//J1xWrh4jQ+aiF1vH7q9VEAPWWFE0FZS/07A4lBK8+V9i2GLnU2Jc0RDzQZstIi0hYBts=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(8936002)(8676002)(31696002)(66476007)(66556008)(66946007)(6506007)(6512007)(4326008)(31686004)(83380400001)(6486002)(5660300002)(53546011)(36756003)(2616005)(316002)(86362001)(508600001)(2906002)(38100700002)(186003)(54906003)(26005)(7416002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHkzcXFEMjM4cGdpVjJvVU9HZUhjbjFJN3llREwwMkpqVFFRUGlqcjFSK3Nk?=
 =?utf-8?B?SXYvZlRBNmhTVE8yYXRkSHRLZTA2TWN1azNlR0VDUnhsRmc1SUp6SFIxSGF2?=
 =?utf-8?B?U0pzcUIvRTlZR1J5OGl6M0FLMGNDalpJckdxRjlDbEhzWVR5clh2MHlXK3d0?=
 =?utf-8?B?Z3Y3THMvTEVuUHVwdURyTDRSc3lMWm9nWmRZdG9SU2p4TE40c091bmFUbU9o?=
 =?utf-8?B?d1dzbkZ5YXRmbm12VC9sK256a25EVldHek1VTGx0Sks5eVBRYkZvblYzVFdm?=
 =?utf-8?B?K0NaUnI0SERBMUlyc2tBR1pNZUZOUGFNT1JsN1ZEWWE0dXVDN1NCZWpaaUhI?=
 =?utf-8?B?SmxSMUc4azRBVEhkYTJrY1Q2dmVXK3p5emFEVDZVQjFPKzc3TE1EQzh2RWx4?=
 =?utf-8?B?Si92dEpjTzh6TklZMUFVNmpTL1pRZDU4QUlkdnNPSmZacUVsNUFZRXc5RXR2?=
 =?utf-8?B?ZEdsNktNS05hOVRBSXJvV0F0R0FsV3hOMEpDZWxsLzNwVHlpSG12cENGcTdL?=
 =?utf-8?B?MDh5SzB4bVJqQWVwUGlocGplM3U0Y3BTNFpuRXJveitUVTJxL2pDczY1NWFy?=
 =?utf-8?B?Z1k1WUEwai9pN1czbzZlWEFQRzEwQTNPQWxYZ3RNcEQ0SHprV09jbCs0UXJw?=
 =?utf-8?B?S3Z2OWtYT1lyR0JnVFdvRUFJeEFGTDVOVmxsTTEyZU5BQjA1VnlHMjBLemxQ?=
 =?utf-8?B?Uk1JSWVaK3RScGxJR3hZNWVNeFhYZmFkN2lOWWliVXRLRmpOQnQrbzJTQ21Q?=
 =?utf-8?B?VllWbmVnaTdCTTc3ZHlWSitPM3NxOW1sbHFuQmJzaDhGVjNzb2VWeTMrVTVi?=
 =?utf-8?B?cWl4UGd5UWM1dWt1VlQxNDFIb291R3h3NUVnVGVlYVJrSkQ0dmtsbFpwMGZX?=
 =?utf-8?B?aUJIWFByTXlpSndnOVd4aHVwMlQrVGlJQ0NycnBuZTJkVGYvWjY4ZmJZUHVp?=
 =?utf-8?B?dzdVb295dGZlN21vcjQ0UXM5TFpRTU81cHo5aTNlR0k5b3NmbXZxejlWSE01?=
 =?utf-8?B?eVVOM2JOdzJrdHE0OUZvYzR4YkJOeXlJVWVYUGVvejBvNkFwSDJ2cTVXVk8x?=
 =?utf-8?B?cE9pUVA4NlBNdjhOSXhrYW0wbm4vT3BYNWZSUlRuY2M5Z0RXcUJZOG0wSHZn?=
 =?utf-8?B?dmZlNWhpbG9YTmhDMDVHY0JOMjFDOTZFQ2VVdm5JbmNwRkZ6ZUZyYW9WSnQ2?=
 =?utf-8?B?NlVFdURSRS81SXpyS0FxblcvUlYyM2x4YXA3OWJwb25MWjhiZ0wrVVlUTkhK?=
 =?utf-8?B?Unk5MnYzTmpMTnEyWWlJc2FRSThvYzNKaXNCNG1YY2NGTDgxK0w1b1REeW9U?=
 =?utf-8?B?UHNxeWV3VnVieHVKZ2pDQjdZSTFLdE93NzRrQm15Rmk0V2lkUDZpQWhFdm5r?=
 =?utf-8?B?amhscFg5cTFQRlAxRVk1aTZyZ1ZMaU9LWE0zUUJ6RkM4T2U5L2FTQ2NQeTh2?=
 =?utf-8?B?cXVlNnhBUXg1RWl1VG41UmhkZVhBZE5tQ2lpMTZtTjZ5MTIvR3lQRFJGZ0kz?=
 =?utf-8?B?ZGQrbXN4b2ZOaHpXVjR3UXhibEw1RkMwMnNGaDRPTi9pb1k3QmlheWFoYmtP?=
 =?utf-8?B?WjlORkQvdGNXME5GSEFVN3pGOStmck8rNklwcFFPMWYrT01Zc3lyK0IzRXhM?=
 =?utf-8?B?dCtTODl2RHViWWh5ZTdGWlRtUkdWYnNvaUVNck1SUzhrSE8vNkFBRTcybDQ1?=
 =?utf-8?B?MUVEOTU4c2FlOTUrZUVPZ3RSeEo4UWMxVW1Hb2lsQUxrMWNzYWhvVnplRGN1?=
 =?utf-8?B?dG1CK0gyandWbXFRb29CZi9EMXRveDVYaVlPVzNydXhPVDN6dUJhd2VENmJi?=
 =?utf-8?B?Rzk4dnBmL0RUQ1E0N1RHNkVkNWsxVitBUVF4OW9iVEp1TlJScTRQNXBaSjhu?=
 =?utf-8?B?S0dqTHJIVkNyWFlMaVk0YU04eW5qQTBvamt4UERoUERzdmVwbkFUM05OOVB1?=
 =?utf-8?B?d0gralREazUyRldFOUFIVk9RRzhSczU0bG5JTmJKZThSMXlyOVc2OURFWDBR?=
 =?utf-8?B?M0c4L1Ira01Nend6Ui9MVDBvUkJpaCtuTHludm91dnJYMlA3YXg3OHJRNDdU?=
 =?utf-8?B?citYYmpidDhhVFo2cUJkMmJDc05JdGs5L1djODZSa0tCMGYybTY5cEZWTzRH?=
 =?utf-8?B?MkYzNlQ1bXBYS2lETENJQ3E2UXFlc3pxd3BJcnpjN2MzdGhJUVNyaXVDOXo0?=
 =?utf-8?Q?+PgvHM8jov1wwYoZWIvexrY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4a7f26-ddca-45d0-d9a8-08d9e7beea56
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:15:41.2404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tx8qT2xnmFa9MXCrFZWVhVw/5q1tQVNVdVS8BVuHdIZDpA1sPszVwrwJgUjn+LF+NZqzFJFcAShThfbeMFpXrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6247

On 04.02.2022 09:58, Oleksandr Andrushchenko wrote:
> On 04.02.22 09:52, Jan Beulich wrote:
>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>                   continue;
>>>           }
>>>   
>>> +        spin_lock(&tmp->vpci_lock);
>>> +        if ( !tmp->vpci )
>>> +        {
>>> +            spin_unlock(&tmp->vpci_lock);
>>> +            continue;
>>> +        }
>>>           for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>>>           {
>>>               const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
>>> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>               rc = rangeset_remove_range(mem, start, end);
>>>               if ( rc )
>>>               {
>>> +                spin_unlock(&tmp->vpci_lock);
>>>                   printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
>>>                          start, end, rc);
>>>                   rangeset_destroy(mem);
>>>                   return rc;
>>>               }
>>>           }
>>> +        spin_unlock(&tmp->vpci_lock);
>>>       }
>> At the first glance this simply looks like another unjustified (in the
>> description) change, as you're not converting anything here but you
>> actually add locking (and I realize this was there before, so I'm sorry
>> for not pointing this out earlier).
> Well, I thought that the description already has "...the lock can be
> used (and in a few cases is used right away) to check whether vpci
> is present" and this is enough for such uses as here.
>>   But then I wonder whether you
>> actually tested this, since I can't help getting the impression that
>> you're introducing a live-lock: The function is called from cmd_write()
>> and rom_write(), which in turn are called out of vpci_write(). Yet that
>> function already holds the lock, and the lock is not (currently)
>> recursive. (For the 3rd caller of the function - init_bars() - otoh
>> the locking looks to be entirely unnecessary.)
> Well, you are correct: if tmp != pdev then it is correct to acquire
> the lock. But if tmp == pdev and rom_only == true
> then we'll deadlock.
> 
> It seems we need to have the locking conditional, e.g. only lock
> if tmp != pdev

Which will address the live-lock, but introduce ABBA deadlock potential
between the two locks.

>>> @@ -222,10 +239,10 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
>>>               break;
>>>           }
>>>   
>>> +        msix_put(msix);
>>>           return X86EMUL_OKAY;
>>>       }
>>>   
>>> -    spin_lock(&msix->pdev->vpci->lock);
>>>       entry = get_entry(msix, addr);
>>>       offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
>> You're increasing the locked region quite a bit here. If this is really
>> needed, it wants explaining. And if this is deemed acceptable as a
>> "side effect", it wants justifying or at least stating imo. Same for
>> msix_write() then, obviously.
> Yes, I do increase the locking region here, but the msix variable needs
> to be protected all the time, so it seems to be obvious that it remains
> under the lock

What does the msix variable have to do with the vPCI lock? If you see
a need to grow the locked region here, then surely this is independent
of your conversion of the lock, and hence wants to be a prereq fix
(which may in fact want/need backporting).

>>> @@ -327,7 +334,12 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>>       if ( !pdev )
>>>           return vpci_read_hw(sbdf, reg, size);
>>>   
>>> -    spin_lock(&pdev->vpci->lock);
>>> +    spin_lock(&pdev->vpci_lock);
>>> +    if ( !pdev->vpci )
>>> +    {
>>> +        spin_unlock(&pdev->vpci_lock);
>>> +        return vpci_read_hw(sbdf, reg, size);
>>> +    }
>> Didn't you say you would add justification of this part of the change
>> (and its vpci_write() counterpart) to the description?
> Again, I am referring to the commit message as described above

No, sorry - that part applies only to what inside the parentheses of
if(). But on the intermediate version (post-v5 in a 4-patch series) I
did say:

"In this case as well as in its write counterpart it becomes even more
 important to justify (in the description) the new behavior. It is not
 obvious at all that the absence of a struct vpci should be taken as
 an indication that the underlying device needs accessing instead.
 This also cannot be inferred from the "!pdev" case visible in context.
 In that case we have no record of a device at this SBDF, and hence the
 fallback pretty clearly is a "just in case" one. Yet if we know of a
 device, the absence of a struct vpci may mean various possible things."

If it wasn't obvious: The comment was on the use of vpci_read_hw() on
this path, not redundant with the earlier one regarding the added
"is vpci non-NULL" in a few places.

Jan


