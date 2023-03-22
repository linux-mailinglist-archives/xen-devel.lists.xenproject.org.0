Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E16C4714
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:56:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513278.794078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevCA-0001QD-FS; Wed, 22 Mar 2023 09:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513278.794078; Wed, 22 Mar 2023 09:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevCA-0001OP-BE; Wed, 22 Mar 2023 09:55:50 +0000
Received: by outflank-mailman (input) for mailman id 513278;
 Wed, 22 Mar 2023 09:55:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pevC8-00014x-MY
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:55:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7cb12e4-c897-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 10:55:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:55:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:55:44 +0000
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
X-Inumbo-ID: b7cb12e4-c897-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkiJIa5PYyjyQKsN2sQOeRVFSWaXZoCsN8Z8xN4Jrr+RzP1c9ESAV2zwpJU5e/mAzdB3dCZalbbCmjbmQJDuyojVVL0jAs8O7SyV9ARk03tUwTCSVfc+RfjHZsO0/AgGrp1X2a8MedflCE0Q2mSYWkpJBiGNCD2MHu/YiNST2Kz4oiFKNqegmsl341jP+pgxvFNxTbDBbniPoPR1/KXd/Ha2LurdxuhAyGuKgmhNwGPcuWGuRBciJpgAk6nIYRGwJzmXB/nQ32qeNZ4bmyR+oD4n/0j+3ptXNJW1NKXwyEHtXh+E9vAyoGBzvDJOPHxnuUzjxRDEix8MUpSqncJMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/jCCRcswiHE1pOCulr48GciekvLM2a4Zj1U2OVvOr0=;
 b=JEwJDL8blcWX94zBgvg09ELEUMOHs3tCdcbR5ecs0RQVPUo1T1v8NnkzT1oxfwj/jvMHMkuHkjOWGAasrob6d2wsASbSYcOMuanO6W0vBHiyHdZKD2lsj9ui/X49if2ZPrZmLMFo8H7SyHm8T5YtTTLtcOeZNmW2mMJYWgwvEjJ9RrPZ341atAmIV9Wk8nuu4Qg3kKD/xUECi+qaMiCMD31zjJhGF58YOxWA2/ZUsaUrKs6KXX0/79lle7P6ILd0s8m19PpoMbPntTj3/a+ot0ESx99jG2dBm+LoPon2mQ1NzlpzUprVZMkf/RvqsWSKzQCyQDrzYySXhLQpCSLCEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/jCCRcswiHE1pOCulr48GciekvLM2a4Zj1U2OVvOr0=;
 b=5oBKwZ92fmJwdBoLzGZtaZkZ9NxRjELJ36SjmKBWTkD8He4a4Sh0X/onlCy3/qUEboBKWsJ94q+Jp7W55ENGXqVOYap6tOh0H1W8fvyrljuN5EWlx+HikfvQmB+iKlpgIepJ0JJRCRqSf11yy0UHhRYBw/wHYOd829f+iG7++gfQbcHgmHKwsNPokua+i9p7iiY9kf5ml9p+ec+bgY8an0IFNuKh6ks2wxU2md2+LIaQgiwtn7f31P3XZ+7JKG5Zl9s0DhgzRRTe8XOkS4dgjrpIKie2iPLj+aKROqaGuzrkc/5IFiqZHzlsa85WpZ5AJLlhQcihDYnO+ZWP8UMEBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <51ee4bf5-fd96-4fb2-c91e-36780b0f7ad9@suse.com>
Date: Wed, 22 Mar 2023 10:55:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
 <ZBm7N7oEDPlPmZ87@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBm7N7oEDPlPmZ87@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bbf7d1d-d715-4fab-abb9-08db2abb9a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tBZhZmWvWyKbPwp9l5DlGFTI+a+M+EI2d3k+xSPv/4PGaZBwyyiq5xCxVVZXxZtgyVbA4bhg3Nm94jhsDMqaAquwfbBWHtKxKxi45ucFb0RsokDkU6xqaLBEG0vaVZSyAxva9WLxEBaCZt3l6sRTRsyQNW+uGMlx71dmv63Ehaj0IOq5EWY0Fc7jQnv40UCQTAT9PRdXLYaHDyUIcJWvXn+I7vE4kcKukaqI7RK+iuYStVwzx4w5Nmor5k+93yTSGCM9bEsdk5fzQfhEAlkgptqOVUtrbru+2D7RcQuwB0K4Hqjdqwqt6Noqd5bcjZqxKTIb6rnfDK2L3+6bpDXBBj0g2Tqr4b2srCjNs3Prvwj5DOPNoKiL0zrzp0mrHZxkK2v0H7lWeRHFXJniFzq5gaoB7yhKq/yTP7bglvXH3TskGp0GLorquWaNafJ1svcEgJ0G2rE86Wt2obwruy42UDDBet+2W5Io5gkTIEKyiI2lBdTTioZq2ZhPHHY6+8FOF2WasqfYH37gUNUEvHy/XV5YQdugBXTD/K/6zs93hap5bsPh6o79obS7L2OIZYyDLWmaRq0uGaWmal49CvrimV8kcAZVPAGDNsEqtSB34/epxudpBMVkdF1s9uOIO5RyqV8zQ+PQcC0UDQrZEy4QU0n/fSivK1nctSd40Ma9xFDrvpGDBYmX9OWkkg26R73TGwsNGkQslfoQlr9jNqdiSG+NnQZc70J9csn4VGuq8QE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199018)(2616005)(478600001)(6506007)(6486002)(6512007)(83380400001)(31686004)(54906003)(316002)(66946007)(8676002)(66476007)(66556008)(26005)(53546011)(4326008)(186003)(5660300002)(41300700001)(8936002)(38100700002)(6916009)(2906002)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlpaTkpiQjJjd3c1aFpzUzJUSkU1NjV5NTlVdlEycE1TTzZJMFlSMzVmT3FC?=
 =?utf-8?B?S1NUVzdibkpTa2NEeGlFdHJzQzl2cXFFYUJqeGgrM0R5ZlZDK2pSVnpTa1ln?=
 =?utf-8?B?K1RjTmhUTW4zYlBva1ZrU0JoRzdVK0p2c3hRMktVUUhUTnVXbGRIWkFJUFFZ?=
 =?utf-8?B?OTh5eFlMNzRSU1phcERwQzRIY3NCSTB3eUgyekxvQjlZRXo5K2Qyc1Z6ZmdY?=
 =?utf-8?B?MFVhdDQ1QzFzL1UwcTUxQm0rOFBDUlYwOHBXM0JxM0szTVRRZkJSVDJOWEZG?=
 =?utf-8?B?VlMwSWs0ZmZDdC9OcFNyYzcxeXZvTmdpbkZYTU5xS25ZMnVRR1lSYnpRZXdv?=
 =?utf-8?B?TUU1cHRUM1N1c2hkZXBYU0ZCTURMcjlMZ3M3SW9GOHJwb1BGVWhnZFQxcDRT?=
 =?utf-8?B?ZTlnNzA1L3U4NHZrS3FYdFhodk9NY3BQdENWOEZHbFMrby80eUdVOW50RG84?=
 =?utf-8?B?TEFSb2dKcHRWSUh5a3MzV0FrTUhBS0luYmRGQkxTZFFwTXdvVnhta2FHby9s?=
 =?utf-8?B?b09lT3NYbFAxZjFaSlRrWEg1ZGQya1FFSENQa3NjaFNqL3BnZHpwdTV1b05P?=
 =?utf-8?B?Wjlid0RKYkthQlIxelBpRlE3dFNUWnFYYWhpTUF5RU5nSGJnOEkwMGJKYlJn?=
 =?utf-8?B?NFVHZ3RMT0ttLyt0MVYycEFpZ0dCbC9jVGJGVDJXOEo4VnE0SkE4b244Q0Uy?=
 =?utf-8?B?OFFtK1E1RFFDWFdGSm5udEMvUVZ0R2UrS2FLS09sNXhGYkJkRFRTSkMxWURV?=
 =?utf-8?B?UWUzQ2h3R2I4VTJZVk1zcnRzK2ltTng0QUU4VHArNVdwVEVpTVhiMUlqc3FH?=
 =?utf-8?B?UlE4bUYvektoMVBqNmhjcGw3TmNQT0ZnWFpCeFVKaS9Dc3g4RW9GUjJjb0w4?=
 =?utf-8?B?ZDNZOG9iWFY1SnZkSklUa245ZjJYckRPUFVuQkdSbC85MnRCZHZXcTZHR2Rx?=
 =?utf-8?B?WktNVTMyR2kybWJxblp6ZU10cCtBb1Q2VXBMaVRrRzBIRDl1d1hnZUU3ck9E?=
 =?utf-8?B?NWdtdTNzTDhyYzE4SnNUSXcwTWt5Y2JRRnNuWjBVbWRKOEFoankxSmtmcUhu?=
 =?utf-8?B?UDZUY2YraVhsWHZsd0xpcWE4SVJkcGd2dEhxdEppMFRQd1lYUjBDaldnVmQ2?=
 =?utf-8?B?OEw1RnpCSUJtaWIydmd0MXdlaGQzR0lIWmJJYVlIK2pSMkUxZURzRzVDdTZQ?=
 =?utf-8?B?YkFVM3dqbFVQNGpVS0cwMFJTdUlneFpXdlBNbWlFWllOTUZxU1BKdXY0OEw3?=
 =?utf-8?B?ZWpQNDJmb3U5aUtXRDlDaGw0NFRLaVF2SWVYejRnR2diYkZPNytDUmM3VWps?=
 =?utf-8?B?VkhVbjQ2QWxiSjQ5b1RPV000OHMyNU1QTzlrZytKNGVOM3ZJdTZxQVFwelVn?=
 =?utf-8?B?R1lXcHg5dXZHUlUrMWhadi96RE9DdTlueVE3NHkrb3U0TkxuMVpjZ2p3OEla?=
 =?utf-8?B?VlNXSG9lSmpBWk9QMXdaUm9yNkxrZzVZV05hbFRSa2F6MDBmd1hUOXJ6TUUx?=
 =?utf-8?B?MnZaT2ZLYTd0MkNCaUJRQm8xRHR2dFliZmExRitlMG16c1VsTzRkdHBrdXBy?=
 =?utf-8?B?UzFwSHplNVNmWVdmQ1dEOFRwMldHa1p3U0U0MDJZTmNlajZtdU45dk51QTQz?=
 =?utf-8?B?bmUrcDFyNDRZK3U4SVZsODNFUUpEV2tMbTJNRTNqL3J1eStWaWUwWDJPa2FE?=
 =?utf-8?B?dW41WGkwT1pqOVdMMTlKb3ZmK2dKa29jNHZ2K2ZrR0xwSVkzMzBDOTdTdWk5?=
 =?utf-8?B?Zmc0WmRlTDQyZmV2Y0I2OTRicSt3eVB1QktZM2djdlE3QU81alR3RXp5akk4?=
 =?utf-8?B?a0lMUW4vdmVhSzlzTEdBcktZTGRac2luMVV2MmFXNHVyeEMyT1FQWngrT21E?=
 =?utf-8?B?RDJMei8wZ0hzYmVURU1ueTV3R1RpNzQ0ZDgxbVRYWSt0N1JqNlQ4eEYzaEZl?=
 =?utf-8?B?WXM0c3ZValF0MEZnTjZ4VlAyNThwTUFRYTZKK1NkOTFtOWNUbFpPWWIzZTZF?=
 =?utf-8?B?OE1sZVZ4ZkJJUHBsQUhkeGZ6NmZTbW44M01NS201WkJ2dkM1Y25TWVd0NGVU?=
 =?utf-8?B?RWtGcWhGdC9XOGJOMWtsQmNEcmJCWE5zYXlwaFM5WXAxUTcxOG9ydFY3UVRx?=
 =?utf-8?Q?xkVXHkk5yCHb4sx7lUKyo6wsr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbf7d1d-d715-4fab-abb9-08db2abb9a77
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:55:44.2779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbZh+YVQGKAWIjO0KlpcJOGFxX/W8/QmkIuaQzZrHOIP7qPy1asirC4BXgtF8/+jOOaC8UBfBvfz9Hw7eruhmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8459

On 21.03.2023 15:12, Roger Pau Monné wrote:
> On Mon, Mar 20, 2023 at 09:32:26AM +0100, Jan Beulich wrote:
>> ... in order to also intercept Dom0 accesses through the alias ports.
> 
> I'm trying to get some documentation about this aliasing, but so far I
> haven't been able to find any.  Do you have any references of where I
> might be able to find it?

I think several ICH datasheet documents mention this. Right now I'm
looking at the ICH10 one (319973-003), section 13.6.1 ("I/O Register
Address Map" under "Real Time Clock Registers").

But such aliasing (really: lack of decoding) has been present on
various of the low 1024 ports from the very early days of x86. So we
may want to take care of such elsewhere as well, e.g. for the PIC
(where aforementioned doc also explicitly mentions the aliases).

>> Also stop intercepting accesses to the CMOS ports if we won't ourselves
>> use the CMOS RTC.
> 
> Could this create any concerns with the ability to disable NMIs if we
> no longer filter accesses to the RTC?

Hmm, that's a valid concern, but I'm not sure in how far we need to
be worried about giving Dom0 this level of control. As long as we
don't use it ourselves of course (I'm unaware of us using this
anywhere). If we're worried, we could continue to intercept port
0x70 alone, just to mask off the top bit for writes.

Jan

