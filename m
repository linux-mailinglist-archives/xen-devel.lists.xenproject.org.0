Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 649EF4589AA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 08:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228581.395593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp3T7-0003tc-A4; Mon, 22 Nov 2021 07:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228581.395593; Mon, 22 Nov 2021 07:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp3T7-0003rH-71; Mon, 22 Nov 2021 07:10:25 +0000
Received: by outflank-mailman (input) for mailman id 228581;
 Mon, 22 Nov 2021 07:10:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp3T5-0003rB-48
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 07:10:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 419eb5b5-4b63-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 08:10:21 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-0gzQMYZsOZGacTl7YJeYjw-1; Mon, 22 Nov 2021 08:10:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 07:10:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 07:10:19 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM5PR0502CA0012.eurprd05.prod.outlook.com (2603:10a6:203:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Mon, 22 Nov 2021 07:10:18 +0000
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
X-Inumbo-ID: 419eb5b5-4b63-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637565021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HdHcSsr8xwWxvSz1xnhn7H8HJUtphqQGBcmkiCpbgxM=;
	b=dchao+Z0ZJSjQ+0Zlp2MaZwdEBasEtuRbfHRLeaeJaj+jHt2Tm1UFLDHsGqbbD43ZOOY5s
	+AFtpJgeEawkQWdLIY16ekPwYND6ETwK+l+7QWALF5B5U3ZTnvdf1R4fYbpJLxnOVpg14I
	e2fJP+/gX6p2Kde0x8NmOEAuXEuJLrE=
X-MC-Unique: 0gzQMYZsOZGacTl7YJeYjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmApmlqg2RXDDaACtQMdFv29E4WAMwAvZ8Fls9VxPEzk4sogwa968p77tFO/EYroLq0hOq0AwQKnsXiSChhCdJPUBh3DACQ0lOkg04TiLTm2xiApKMq2AQ24KErgMpYg1meHTARzsJVsP1DdP6I2DBelDi3Q+Ea65t9hdAXnDFr8C/VN3LD11qn+WbFK33oMLTFEbaGS+kQBi4ZxSb6orQBzYTJG2Lw2NnmDjAhUv01x8zMze5tBzsBkLMG4zIekDa9ARDzM+ShP9cbNYd+7NQ9uAFVEYtF0eYmnxdQyeT2+NARl7dv28ebzmrkTtffrAyjSWKBZxMbmCHJV4WWp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdHcSsr8xwWxvSz1xnhn7H8HJUtphqQGBcmkiCpbgxM=;
 b=RseO/oT4LQdtn0zPuwKB/WAmPfDXZXPyniL/HCwS8R6nTs9HRBtmQY9MrfmGI8PA5tmAKUGhS9/fTBUPByYV0Fi+R0fGtrkF1pxDJK7TVo4RVs3KgHDMQyOxZAMJic4c/wJ1EXbDzc934kjtUIsr8gSyK2Ahg8n5FqHcSuHtl8qBLld6kQWWtdGw948L7L/Wrk/A6V2X5B9wKPt5fLlk/4bupASdyLH6/4zFiElLrNvvie8ScO492bS6CCKdX3GtXJp1IFl6AnfF+Y4qa3aYYDh4Fq1DOQNWNE4cl+52voOgoTDcCvlTP/JKBnCWH+TGI3LrkW/wLbiRsThjeSLJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d354349d-0294-0830-5bb0-45eaa82e2a2d@suse.com>
Date: Mon, 22 Nov 2021 08:10:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 0/7] (mainly) xz imports from Linux
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <24983.46063.379168.151942@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24983.46063.379168.151942@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0012.eurprd05.prod.outlook.com
 (2603:10a6:203:91::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cc382fe-6f8e-4707-5fbd-08d9ad872492
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3936C2FEDACC2438090FECA9B39F9@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3czKs/8TadO/d1nyPZbt1okx0tmRIax3VNBY8tqK1z0Oli0JG/LbOaNaLLTFZUTmLQFz1uJMofQopLobSrWTw3b4KNLc7CvwcSDEHQqHRLPxFcNy4isRWeiK2mWWowBmQiv7fqBADNIrghBpDvrdZZcqkPaqUQU7OP8UKMVM96tCu5WnbTN+ZRyCynKwXMIaeEW3ycAXQVro4aIFXwCaTmzJquynbE0kQAISwMS+s4p/H1qXuplEgklFt1J8T19YP75eDX70yo0xKMiAKSYgeKDCNHEou2Y+whk58wgyx3WzsK5X5DUv4q1VI0MWkQCVy6NK4nIkpCNMXkZFqVetJeki9vJcEuMASIUndtK//2UYxlGMoti57Gof7FVZgKlmC/Fau89Bybq4kPuSmCqILP7w0tWcVdkdy6Ve+Upywh2aK1ZAFZQFlIL/wSOpnOqvKpjn5UAQfpWcQZZ2WyfQU0pfWNqf27rxN7ZgTKMKXbQ7+kUaIKll1LkfZKkOrFHc98DOCKdilwAfQYCLrZU82oddDmzV6vBHQNeFpXQOnbirh9SHhRG42DZdD7Xzo3D6jTnwln2yf0o57rPHE3k98v3acDNQnT+lNx+neHXeCH6L4vCz8CwUHYEf4ump8oJT2wevNFCo3g3hY9B/tTRPTYF8t2UZN0I+shgbD+sRTeCJwH2K/rqFx7wzOe/nuykGEJKpuqDH+0mqpliJw5quAQ5/uuSzNxv3RypLgLNkz4hplC7ysjimdRgT4fXXUrDS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(31696002)(186003)(36756003)(6486002)(5660300002)(2616005)(38100700002)(54906003)(31686004)(4326008)(83380400001)(2906002)(53546011)(86362001)(8936002)(8676002)(66946007)(66476007)(66556008)(316002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE5aMjg1SnJlcm1rQ2hXMFBYc1ZHU3pYR0xOUm1TQmN2RnprRlUwNjJDOTV2?=
 =?utf-8?B?RjBpZWZPRWZpVy9nb3g0bTQrSWdkOWh4N1RVZC9iejV3WW1KM1o3VktEYVRX?=
 =?utf-8?B?VzBhOUFVNFZDTHNWNmlMVjZULzMzN1hKeVNQZDhud25UVVQxNEFQQVVzNlRw?=
 =?utf-8?B?cGNJZXJPMGhSWCt4QlNCYmhXbng5UUh4S2dKeHlxYWN2d3FhdVhCdlJmc094?=
 =?utf-8?B?VDYvTDkybTNXUlVTVGgvR1VQY0w3OW4zanV1Y1ZZT2NpVjNPT2lJa1g2dTJo?=
 =?utf-8?B?aHZ1SHVUKzRhNVNJRUtLQ21LV3hmSXdWTGNDekp4eDBGbW9hT0NyM293SzBW?=
 =?utf-8?B?MTgzY2JpQjRFK0JCak4wTUxKN01BTXp0R2xNMWtWT1kwZC9zc1hnaWR4ZFMr?=
 =?utf-8?B?T3N5U0YrQ1QxWk5GTkVMUWVyOWtKYmlTSzNBa05lOUp1Y2dkb1hRN3E3eENQ?=
 =?utf-8?B?MVVlT01yZXpmSndyeTlWVkZBRzAwbTVNSUlJNXlEWUJremxqcFJZQmJqYmhs?=
 =?utf-8?B?UUI2N0V3NVlWVWFmSlJRNC9YREtscDAya1ZRZVVPMVhBano5cTFWM2tmWEVx?=
 =?utf-8?B?MVk4azBpK3o1WGZMOTlWNW1zbEFXZGprcksvbFdHb0taN0orNzhFcHJTZHd0?=
 =?utf-8?B?RklzYjZVenp5TUlmVDVoYUp5d1kzdDRzTG5NcFJIa1JBVjJuYkdOcjMzR0FE?=
 =?utf-8?B?ZnFRMEc2RDlVZWM2WUhoUUUvenZGRWk4c3N2bUFDaU53QUpTRnNBU09FeFUw?=
 =?utf-8?B?SlNGV2pSaGYvalBoellkUGpHTUNFTzdJdEFVR01tTU41azZ1Qmp3V2d3WDlY?=
 =?utf-8?B?OWMvTEtFblYrUjVHL3JoMWVndTR5ZElOMXlYbjVUclF0M0hVM0dKT3VvbkVa?=
 =?utf-8?B?NG1IdWVsWERXS3Frdk5pTXdjVUhISDd0c0ppUzlpRmdKNmpMRjV5S3dBV0xJ?=
 =?utf-8?B?OWpSZEpCdUo0NGMxajB5OE9DTnJiWDd3Zmp2eHBSUXhKclZqY3VHN1ZMQmVW?=
 =?utf-8?B?eWl5QUpjSytLY0NrOW43K094Qys4T2c4NEdnOXFuZHBpb0pqMGtUalZBTzB4?=
 =?utf-8?B?Y1RudWhRL2tJTzVjRnlNWGRMYkNCQzZlcUN3ZHNGMldVV3ZHMURUbkcvclp1?=
 =?utf-8?B?U0Rkc3RBajc3UmFFbFhxRkZ2TFZBNDRhRENZYkFaT3ozR1pvM1hhMDhIUGp4?=
 =?utf-8?B?Ry9wK0MwVmZZeDQ1UGptK2gxQTMzdklsc1dVZXhsaVBkaHprR1I4WnhZR1Qv?=
 =?utf-8?B?dHZJZWtYUnE4bTJoaGYySWo3ek9HdnJLR29NREl6enB6Nzd2cHY2MVhHZytv?=
 =?utf-8?B?T2dmVml6SXN3YVQ4OVZkN0tiTys3a1d4L0tRc0ROQy9NblFkbThoeGtxMS80?=
 =?utf-8?B?TDJyanhDTGFJM2ltQnhPZGxqZmtMZkRvU3lLeE5oWjV4MWJQNHZKbFNUaGRi?=
 =?utf-8?B?YkQyU0VWUXVuaHNsNE03OWt2MzNIdXpROWlxRlpWWDBDZU5Odms3L0JueG1t?=
 =?utf-8?B?bmNOSW1vd3hqNTY5d0ZFU3ZtUzA5MFZyNjhHcUZRNnZFblZDRnFNTFpjMzJZ?=
 =?utf-8?B?VldrRk5VUlFuV3VBMlZYaHpVMkc5Z2J5b2EwVzh4bVpXdzA5ODcrSmxZc085?=
 =?utf-8?B?WEZ1VkFvT0JvZnR4eHJxUzJWbkRWRzRWazU2NHRGTFVoSVphSHA1bFl2WHpt?=
 =?utf-8?B?alNxeHR2ZFU5V0d4TG5HYTVlK2hDeVNoVllJcHhJdVNWWkFxQ2VOYXlLb1pW?=
 =?utf-8?B?VWxQbEtkaVNsTzFkbkx2UGUrNXpHUkNtSFNORFVaRGFHQ2JwRWdTc1gycGFz?=
 =?utf-8?B?bkNxQVRrZEwySHl4QURvNW9vdVFZc3owOVJiZDNpZzRIeEdNMzUrY09HRFBx?=
 =?utf-8?B?YkZpV3ZRRHJpZlhaVnhxbGx0UC91U3ZpTHBScW1sZkxtL0o0Qit5NDQvZXZP?=
 =?utf-8?B?VExvRDFzVjZHWXFWdU9WeTg0M3RaMEhGL1JXL3U5NTJ2aWErSTNQWDNUQy84?=
 =?utf-8?B?MUE3R2ZramFmL2l1bGRUMnZtWENWZ0dCaVdkTGx4K2FqR282bVZLWDBHQUlz?=
 =?utf-8?B?cVNxSlBRMTFtVmhnaGN4d1pvSXNlRWhHMWN2TGUyM2tlOG9TSGJHUFoyMHhs?=
 =?utf-8?B?ZHBEa3pCQ3JXWURCckpMeGhRREU2ZFJkTGkwWURmR0QxZ25rcW9pemdBc0RL?=
 =?utf-8?B?WlV3Tkl5SkJwRVZ3aFFFdGpNWHl1Nzd1ci8xZTlxZE5yL2dPMjNGNzNvNkZp?=
 =?utf-8?Q?WDrgieeuOkNqcQHoiuu/wXr7eJ0kBKkW7hNX0QFuLk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc382fe-6f8e-4707-5fbd-08d9ad872492
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 07:10:19.6837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWK4XnkGCHYIbxWBcBu0vblFUOjIA+OK2xDVQqUJpCI/ffMPCuLrNNO3yXUgkWpxBhtd+qiuKLq7L77ZLeJVjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936

On 19.11.2021 15:25, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH 0/7] (mainly) xz imports from Linux"):
>> While going through their 5.15.3 log I did notice two changes, which made
>> me go check what else we might be missing. The series here is the result.
>> Linux has also updated zstd, but that includes a pretty large change which
>> I'm not ready to deal with right now. Them moving closer to the upstream
>> zstd sources is certainly a good thing, so I suppose sooner or later we
>> will want to follow them in doing so.
>>
>> 1: xz: add fall-through comments to a switch statement
>> 2: xz: fix XZ_DYNALLOC to avoid useless memory reallocations
>> 3: decompressors: fix spelling mistakes
>> 4: xz: avoid overlapping memcpy() with invalid input with in-place decompression
>> 5: xz: fix spelling in comments
>> 6: xz: move s->lzma.len = 0 initialization to lzma_reset()
>> 7: xz: validate the value before assigning it to an enum variable
> 
> FTAOD I think none of these are critical bug fixes for 4.16.
> Please let me know if I'm wrong.

Indeed, you're not wrong, and I intentionally didn't tag them that way. All
I wanted is to get them out rather than sit on them.

> In theory 4 is UB but in practice the result is presumably just wrong
> answers.

Like Linux did, the plan is to backport that and perhaps 7. But there's no
urgency.

Jan


