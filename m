Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA23C9A12
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 10:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156471.288773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3wKQ-0006Lz-IQ; Thu, 15 Jul 2021 08:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156471.288773; Thu, 15 Jul 2021 08:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3wKQ-0006J2-EQ; Thu, 15 Jul 2021 08:02:42 +0000
Received: by outflank-mailman (input) for mailman id 156471;
 Thu, 15 Jul 2021 08:02:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3wKO-0006Iw-Sw
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 08:02:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31893d66-69ea-436b-832b-87d1add8f71e;
 Thu, 15 Jul 2021 08:02:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-Nd2Axy6qOzSdtO3nVyMsyg-1; Thu, 15 Jul 2021 10:02:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 08:02:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 08:02:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0109.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23 via Frontend Transport; Thu, 15 Jul 2021 08:02:34 +0000
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
X-Inumbo-ID: 31893d66-69ea-436b-832b-87d1add8f71e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626336159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIdZoi9GqilekvwAudt29NlSU7bcACEvNgcPyJGKMeI=;
	b=Zmgz0fShnKueJ2A1Gch/1zlHXcdTv/OVeixx7CAkNVGFrcBSmuU8xtB91GOSuFu8kObjXq
	/azxTwyIuEYooQ9QVGe55OhYOWECUzKz7rZaUvdd5LSLc5LkEuv5DqFVbtWfgvJfSpQFkW
	rQ8DSwPIat8dYfaRLjeOknEJ5CrT6fU=
X-MC-Unique: Nd2Axy6qOzSdtO3nVyMsyg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OykqASRHClDwGpzcI2DcPKDfATLqP8cf/tgGTiJc8JyrPEbvfYPgfeUsxRWEVs3cCCr9+v7aeU1PQYz0E8IwEQ4Wh1F5jTcOqJ5P4MY2FPRSxbAstBXKfBTS0o+lefPnYRddyDNoYuDvThcECSbSSQjydY4PXzgblOuAXwCh9DEiqjSEWDM0jRHTcnSLm/5zUn3JbI5LKNDSMchh7UMTVer3JQdg2+HQiJ2XhyVUhru8UNHuu2U/nBSwzGAbpT4E6rclYYtX+F8HQKWjcKZhGKLjjs9TVf+6qu6naRTi6jquJ7BcZrabHFNzLVc8PLfxRqWhUymXEmCSXWfV8Fx5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIdZoi9GqilekvwAudt29NlSU7bcACEvNgcPyJGKMeI=;
 b=hTGZKZIiKQvsDAQlm4ADhg5Zzx0RGjkc3jKI4cqRcHk8IMps9c2MV0V4Nsjbkg3cDex6NWObPLh69rb0JDrJJFw3Q0MuIU9yaYZ0F0WbnGfmKTKSETmUEOdMN2pNcP/iuNHBDTHf8JQZHHAGLaVOUrDXQRGbTEHkoHW81TOXdWhUnICVO7GjOMMVWI5ho593sRaGv400fFmZqHdN3UCuliKSNXxMj6uiwYJWqKYHqg3dQlgGL/p2LY8BBPi2p7opsRCpol+i6B12AOinqJRW9ViohInK/Z0SY4ieJUpKbgFlxATc8K4bSQBkA9xz7vOr8R+KwAtBa4fWu2lztUUjvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: preparations for 4.15.1 and 4.13.4
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
Message-ID: <fc0557a8-485a-7650-9c84-bf264b0659ae@suse.com>
Date: Thu, 15 Jul 2021 10:02:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0109.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a11cdbcf-6fe5-45b4-6b17-08d94766e7f3
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150E80DDAEDA4503EF968A9B3129@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HNOVSsZ34HVdyMKHqyttV/AnHjHInCAPxG8DfUA+fcI+LFz6sZhd2297qjelerUsTkJ/bR01MeQEYwdaBMRpONnZsfxJMI+39DhSa+ZoYX8iwBryts45zLV2JHJZ5ZoMG1dCoMaZcEOtYmgJewFdIxwx86LIvJ2EH9IGyl0K+NINWliudenRya1m3vXknYbpg/i2EGcQfndXQpDWLP5q55hJpa8waz4onwf9g6TdRGdy37Lq1zZ+0aLjPq9iPBm4ffEBmIHpiKyw4XOFYWBqXWAEFt7vbZaj9L8llSaf3+wwvh6mHdtVTmJU6BDi4LtNc+7SSxOWYYXJak9AjIaxIYuci3V3wSFjCQTAgRNp7rndS8DFOuDXKYRzWrfrKFLoKtH0YLbOpeQlB0o0OBUqJtJlYaRXwpxllPtK4m6Vhl6oNpuUtXrOibZS6mXDb8gKg/n46QATAF31IAsu0ZejD1bbLZG9ZJwNsFXkjuVuEV5yairzHP5yZbAT95DKKsP3uruQPLvhBhTZgnXSWf84nx8lxB1KanFA0hOQR6Yrf2rAC1ZZqNTgbUeyaT1TtlrOUA0wCoUp7ypSVZR355RnEarHJFp6X9wlc65XLVo/oS9hjQF8u8TLA5odHIoMqhS1DI4iaIdRZ8QbSYm0erKNVHYWKAgFd8HhjiiBddgQ0Y92xpv6MWQfim0Lw8rygUEtOPPC6hllyz53/pEId26pODtfNgNN+p3ska200C8y0e7PG5sSnu4Oya23deRjZCov
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(136003)(39850400004)(366004)(8676002)(5660300002)(478600001)(31686004)(186003)(54906003)(26005)(4744005)(36756003)(16576012)(31696002)(6486002)(86362001)(38100700002)(316002)(83380400001)(66476007)(66556008)(66946007)(6916009)(2906002)(956004)(2616005)(53546011)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bno4UTVBWVREMDIvTHpWa3VVaVczdS9kbzlNOVZPZXZUSmhJdWpBVVhHZTRk?=
 =?utf-8?B?b0pIcFpzYlFNVkNTbk9zZmUwY1ZJcmdGRit1blA1dC9EQ2NjMTM0dUxqQjNI?=
 =?utf-8?B?VGlDS0dlR2loODBMN1RMU2JwcEViQzk5SjdQNHVvZjc5eENFZjdqd3NWblRP?=
 =?utf-8?B?RXFHNmh6c2hLUUVBaGl0RFpuRXRaZnhOOUxSaUNDQjdNSXkzWVBIWFF2ZFR5?=
 =?utf-8?B?eHg1dnhCSHM1emZEb3pXSlU2aS9iZ0dRcWlPRHRXd0dINjZiVXI1NWhrTytW?=
 =?utf-8?B?TDVJeHpvUVcvdGsyOCtDNkVTZU41WE1vOEdNcGh2Y1dLYWJjWFFwMGkvS1Bv?=
 =?utf-8?B?bjNjUE1tV3IxSlo3YTh2ZzVTYUVPNnkyVzFQaHh3ZGw3RmZVVFBCeDNkOW5y?=
 =?utf-8?B?R1VtSVZSaW1UR1dNbHMwZ25UZ0N4Um1hU2NpcFFoTWxpc3krbFdGdmk5clA1?=
 =?utf-8?B?aE1helNLQit6amYxUm9IdVRkWVprNzV5ZzFGOFJaWG9iOU4xVnNVNFl1L1A3?=
 =?utf-8?B?SWF5UENwTGJaQVdheVRuZzVNRHFOcE5lMklVNXNLaVllSExYZVpYR0RyclF0?=
 =?utf-8?B?aEFFTHRCSFRxa1VmMndrVTJTQ3hHaWEzWHIzU2JMbUlGNGRJNkdYRnZkbm0y?=
 =?utf-8?B?eXVPVUNJb2paek53RHZCYU9LM3h4ZjMrZWpIVkhqb1B0RUNFeG9QTmRzQTBF?=
 =?utf-8?B?aVIycTNES3JJK3VzaVhSVlI0eHhmdDBJcUFDVitPbDNTa3pZd0lMMkRyNnJW?=
 =?utf-8?B?R3ArRnBlUVFuSXEvdW5NSTJIdUFYMEVweGphY2VLYWVuVDlMaXMvallEZ09U?=
 =?utf-8?B?M2tmRURKSldkNnFEK2Y1ZVRZc3Rhd01hWnFURGF6U2FIb1ZqbUNucERSVmZQ?=
 =?utf-8?B?WVptcE9qZVNaMVdVY0pLdlVjSk5oajkrTEJKOVJra2ZtNEUwYTV4YTd5ZWZO?=
 =?utf-8?B?WXpBWWlFSzdrSHVRbE1Ga3Q1b3hXdEh2SXRFVXVyRmhUZG5SZmU4bE03Vlh2?=
 =?utf-8?B?REFsazA2a2VoeGdkeTR5ay9HTDk3OUx0R3ArK2RpeGdORmQrRTRqRUVNT2ZG?=
 =?utf-8?B?cU44VHNsbWdncW56eWh0UzJWY3Bac3VYemRZT1c5Zi9HenA3RU1OQi9KbkZw?=
 =?utf-8?B?QnNCSDBLU1E5N1E4YXA4aXkwYkROQUwwS3NDM01KOCs3REZ5MEo4N3ZtcUJ4?=
 =?utf-8?B?NjRvNUFlV3YwQVl2MDkzTDdTWWZ3MFFodHp0Rml5eGFCSlNKRmZsdkEwUXlk?=
 =?utf-8?B?Z25RSmZML3pWcHZUazBrMm9NZFFGcVRKUWFlSUc2Sk4veWxlYkpTeHc3NHR6?=
 =?utf-8?B?UnhidGh3cTJwc0ZKcmJXb3YzRGhPM0s5R0Iya0pnMmlaTUs1TXRNTGZTVHZK?=
 =?utf-8?B?SGVncTVIR3h1UWlkSFhaeGMwN29TRFFTWU0rYWw3WWRWRHRvWW5KQjlsM0Jn?=
 =?utf-8?B?RmFDVUJuQzFZMTZ1WklPRHNSS044MjMrdzVpemRiZi9rbTZkYTZxbERkcElH?=
 =?utf-8?B?M0xnM0VwV1gxWEhiWFFWMHJVQmNNR2NNZXQ3R2h1YnJjL0x3Vm5zRWlqbHNU?=
 =?utf-8?B?dkJGd2cyMlp4eHU1cjFtSWlVOTY0bmtRUkxEMjJWSHF5UDNpZ09UWFBhdTZz?=
 =?utf-8?B?NTZyZUtJVnhLeWFlMERBZG5BZzVVTVhPN2hKMkd0SXRsQjVWZG1PWlFmdTAy?=
 =?utf-8?B?MFJSMEdPdlFaNG90UWM2ZUQ5Tm1qRlFzc1lrUHhuT3kyc0pMMzdUZGRudDEy?=
 =?utf-8?Q?qLn/jUEY7lukAFfT4kcAtS/lryaoVWmmR33zsxJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11cdbcf-6fe5-45b4-6b17-08d94766e7f3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 08:02:35.4471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZ8IpxsustJwR3KDVCO0axRali5RY/SbVa619GZNGHqZ9m93jhqIfGUOTVunMWhIqqCY6BlUtghmbaqiWLZmAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

Andrew,

On 15.07.2021 09:58, Jan Beulich wrote:
> the releases are due in a couple of weeks time (and 4.14.3 is
> supposed to follow another few weeks later). Please point out backports
> you find missing from the respective staging branches, but which you
> consider relevant.
> 
> Please note that 4.13.4 is going to be the last Xen Project
> coordinated release from the 4.13 branch; the branch will go into
> security-only maintenance mode after this release.

as I don't suppose "x86/cpuid: Fix HLE and RTM handling (again)" is
what you were meaning to be all that's needed to fix my backport of
"x86/cpuid: Rework HLE and RTM handling" on the 4.13 branch, would
you please either submit whatever further fix you deem necessary,
or share enough information for someone else (perhaps me) to create
such a fix?

Thanks, Jan


