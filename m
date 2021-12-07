Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D013046BC9E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 14:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241149.418039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muaYf-0003ZW-Py; Tue, 07 Dec 2021 13:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241149.418039; Tue, 07 Dec 2021 13:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muaYf-0003Sf-Kq; Tue, 07 Dec 2021 13:31:01 +0000
Received: by outflank-mailman (input) for mailman id 241149;
 Tue, 07 Dec 2021 13:31:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muaYd-0003PI-Q1
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 13:31:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e995241e-5761-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 14:30:58 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-21-A1R738jOMQi8KBeM5N9ewA-1; Tue, 07 Dec 2021 14:30:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 13:30:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 13:30:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0093.eurprd04.prod.outlook.com (2603:10a6:20b:31e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21 via Frontend Transport; Tue, 7 Dec 2021 13:30:53 +0000
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
X-Inumbo-ID: e995241e-5761-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638883858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yqkppLe7XZC97OCZv/qsjboB2OBINNvMz/0N+T66YgI=;
	b=XMFgLpWv5eMZuC0bPgpLtGZTcrPjhBqcBigEgpALfWktGtCDOJJPEnDGstxxZoEmTqg9RW
	hTp91aOFUY0MwQ6FHne4blNFmoapI2PFg17PAClNhSRxKQyJXUFMxh/6N8qQa3yleqocUf
	I2P5VUW5Ng5wUhUBgnxNKSH74Vflbpw=
X-MC-Unique: A1R738jOMQi8KBeM5N9ewA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXtl6148wUf3zEXmbXT7+sGljrSJRYoUKwBuuUFX+b+I42AlKYYQjFuDMASTtZs1qq44BO3XhDh4erdmKdi3NZ/KN4ZTVWwoifSSNmP6EpZaCdYeOs6vwY3Av5ggRX7RuTRe8wNedax1nVMnghGhLuxn45koODpOeVdKOEyU11raljCAvMb+Sk50rhhVmniDnNdy786rmf0aF9qvq20UImYZi8nRT+QURafXVkU4nDq4wuPFkmQ2i19bN6QiXTj4Vn/Z4nwau25XRSlGhMeFLUpex+5H2ar3RK1ktCpPTi4MkCQH7iOiyAusQS3ZPoodv+kc21YW3eDB5Sn0JxAyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqkppLe7XZC97OCZv/qsjboB2OBINNvMz/0N+T66YgI=;
 b=mNpQ8v3bcizIux+j6mLubRP6D2mNTsiT4mZN+EyKzdIufVpmMbSYD1PqSCcVV6tKmFlvhklMoznwnRGJX+1Y5ILdNsxlBf+pFL2JZOds8IUIhOYSkVkPotMfP7KI4Lj0UGBWoblPdlmXfE6UOXCCz10meKLZtjzNCW44UWSgNlni6PjQBy7PtGnc7mprodp2RW2lE/m8u1GOioDnmF6nqfRhnkgYhOryX9RzaqHc5/LNWrw/tafvw3r+qtjbZS9Zbo05nn3n/cR2S5TIfE4xfKONSq8C69z5QyxewAb8ckF5Z6hwDLpo5rptrLv4ZGqKpPeSNwGR9KIoAFmgU9v4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3cc0d2c1-6c11-e6bd-8f0a-ae207a852941@suse.com>
Date: Tue, 7 Dec 2021 14:30:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
 <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
 <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
 <24992.55453.893877.246946@mariner.uk.xensource.com>
 <2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
 <c3e698ab-afd7-9638-3f7c-c7599908e173@xen.org>
 <e684eeca-a798-9cf1-c8c2-1db2e02bb65c@suse.com>
 <53cd2f84-f011-9c97-a108-fd946535920b@xen.org>
 <5a6ffa5a-6884-57b5-c296-904e9b0b4c78@suse.com>
 <9affccd1-0f74-c58e-ebd4-5a5546ec80b1@xen.org>
 <9c86ae6c-f62b-f54c-b5ad-a776887ae9b6@suse.com>
 <b43c072f-4d4c-a108-2c24-801116e99c3e@xen.org>
 <9bb0ecfd-038d-2671-9929-8f9b37f5ea75@suse.com>
 <25007.19664.487196.625874@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <25007.19664.487196.625874@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0093.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 114221db-e35a-4641-a2d6-08d9b985cb6b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5743DD2460845CF4BE772225B36E9@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L4I7XMhO/Y+yh/oVinaVZMsf9ZP9aiUKLEDTk1DqsdtbZJtZuLCczXtDTlkJ/F9GZ4w1AkMH5FKgCQUXyQOemQ/Q87QR7BdNXRShm971vnzyjRZN49AGqxLrKDikwFIVmtj2SzjCv5VfFh6/y7lEgUXXFZnpuma33mMjY6mOxWlqAwOD5V5mervcDBMcxE1SaP5iGQDd85WnbpDDr0FwJK+QU/oETNpg1YlBUAoc5r4GAalv7t7i4t466sdM8n4uWu1abcS6uBRC2+W9goXophLtm23WBWaoxs+b1tDiraoGb6Ci3zADd0iKClwxxWcKsuR80PsFlpI51zEsuOHsOq3eJLO9QEW0xQcB4zK+dSkx/6pO7P8wLtz265qgV2GxKEix2R3jkI2vdXgwY7X7zqhuHW1qawRB1i2L9VpuHgzYCSO3EMvux4jZiO9mtG5LphRllzR2Lf3FsTaX4T3v+u3m2JdWZuE7QnqCPob+/MG2htGIdqCszmCtiPisoqPlLOo+0zCPFSolgTg3uy3eZGuodaVHYmoJaP2syhvoxCgoW+uVAjK+l1pNjmN4Mf9yHy44h8beILkJ3McRXwcgt9+0vyUmfuRzrRDB0lDhb0RpJMHQYYGxTjP1aa3d4j01gEckohvcdyajPd+TFLljcRPKpfDIy2GVjxm6HFj9WGP4dwPHc5ZKLYQKDdQbJFG1r+p0wtY6xRfGdfrV5UuS9y9gFFjWPsncMd5cbiC7UNQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(316002)(16576012)(956004)(86362001)(36756003)(54906003)(53546011)(5660300002)(186003)(2616005)(26005)(38100700002)(6486002)(508600001)(4326008)(83380400001)(6916009)(8936002)(66556008)(66476007)(66946007)(31696002)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmdNZml3aWZYSC9JS055Q3V4cDZrNlRXbkY3Yk93QjVDdzR0Sm8rYm1KLzRy?=
 =?utf-8?B?RWl2WkZVVFpNV2VvbG1ZS1VYZUx4V2JLQ1J6T1NJcnVvNG5WZlo0MHMxM2lw?=
 =?utf-8?B?K0JxM2xETGwxaGVZc0VNdDRiQzRwMkFDZlhiSzV2OWNKMXBnYXB0VlZnNFFm?=
 =?utf-8?B?cmZlbVpyd1Ryb0pKaG1HVE5heDF3a09CM2tOeVFoVjlVV21pWmFka2FmK1hY?=
 =?utf-8?B?eE5oM2tERmNrNDBocXVGMlhlNi9jVDR3NXZ4b3FJYnc0c1ZTS3hGdHVnN0lN?=
 =?utf-8?B?cXlTUEhhUEovQ3pMV0tWd0N6UitMdDVPQnNubFRFeWNuak56MG1kNjdpWlkv?=
 =?utf-8?B?eitRZ1VMODlJOVBGT1V3bmlxdGEwQkp0T0V3UjNmdXUvczN0eGpOTEdCVk1t?=
 =?utf-8?B?dS9TMDRqeW1QYlFUKy9ZYWIveml5Z1hpQzZ5NmFIWllVOUpSKzIyaW8vWDlL?=
 =?utf-8?B?elA2aDBXWjBPd25BQTdmQ1RFVlpINlpvZk1Ld2JxTkpSUTE4S0ljekFOS3ox?=
 =?utf-8?B?ZGdMczdIQjRMby9JaGdDTjRyR0toSStIWjZ1UmpKaGNEUXRBRnNOZ1c4OTJ4?=
 =?utf-8?B?RDJhMlU0dTd6YTY2RzVCWllEWlFKU0M3amo5NnEvWWU4M2FTSlVsbnc2akR3?=
 =?utf-8?B?OGJwemU1SmlpVjRKeDNtZG10enQ0ZjBack0wdG96L255MS9ySUE3MEtRT3M2?=
 =?utf-8?B?aFJWUUNuaG9SWkVwS1lQZHVKd0FJMk9ycG52dVBDWWxILys0bkwzdk1mUXdp?=
 =?utf-8?B?SGpNZGcyYlNXZzVoTmwwVGYvZVhIOTVUR2VhWDRPVFBmNWppNFRrUTkzb1gw?=
 =?utf-8?B?UEFaNzNZV1dZV0dCalZFanpOc1FtUVFtUjhONjFRWGtTa1hHU0IxOFhSbnR3?=
 =?utf-8?B?bitoSGNjVy9lMHA1REpmUEdPUnZyWi9MbloxVFZXUGdtT1drQkZLTWsvTEpV?=
 =?utf-8?B?MS9JcXZFWWNNakVvTVR1ejhWNnVHajhya2dtZEl6SlBLZEEwWFUxaXN1MU9W?=
 =?utf-8?B?cDNFUi9hNTA1UlVLQ3g3aGNMeDhtZ0s4MXV3TlVmQ3VMRi9vbmdzOW9KbGVV?=
 =?utf-8?B?TUE1VGhXMDQ5VHptYTFPN0pyd2pIM1g4MEJNT25KcWk0MlpYSmNXRkNBendH?=
 =?utf-8?B?NUZNSVF6bGRUa0ROMlVacFRKWm1RQUN0bzJRU2dzb3FIRjZXUFgxRUx2Z2Fx?=
 =?utf-8?B?S1NrWUNRWFRuQ1lWcXlKMjdaWmNoSjkvQ0RUTzFHUEczbFdrang1YVBrelN3?=
 =?utf-8?B?aWVxTUN0MXdONlhkTWpJeVl0eFVPQ2l3STEzcGlhY1poQThPRldTYkZteUdE?=
 =?utf-8?B?eVBsTmZhWEp3UEQrSzV0U2pYKy9lT1JYdjIrSFJxbWxiVWUxVGxuWllFOVh4?=
 =?utf-8?B?V1ovalhVYnJIVlEyd2ZZNElueXlYT0pXZWJpUXpZdUM1bzhEdmNhYW4zaWJy?=
 =?utf-8?B?VCtlTHEycWpzSTBwd1hZSnN2Y1l0TklLREN5VlZ1d2dKeEZrd0FoTFdxeTd2?=
 =?utf-8?B?Skdudmp5OFFxOW02TmNxMjFLRmF3ZmhnSkhJU1JJeTZjSURpNTVXWTk3b3B5?=
 =?utf-8?B?N1ZSK1lraXREeWdHdkFXOGRBS1B6RlhhR0krYThVaWNERUFuVnZmNjVYU1Bw?=
 =?utf-8?B?c05LQ1RSRG91bUI1Qm1mOU1jcEpocTVZVVhhV2dPTjVtYlBrSWxaNFp3QktL?=
 =?utf-8?B?ckxGNzlCaVF4V2ZibFNDTURpN3dvL3NaZFc1aGNqaWhEZFpidGQ4L1piTjRx?=
 =?utf-8?B?VllUR1IyOVY2dXgyMnZzckt2S1JxdERqT3RzbVBIdkNKYStiVk1yNkVNbjhk?=
 =?utf-8?B?bm5FaE1EMHZiL1NIYzkwYzR6WnA2RmYxNTh1SlpYaGxqNCtTRlFBT3dhemM2?=
 =?utf-8?B?WGVtQ01QaXZ3cys3SG0xVnlJSExuaDgwOTl2RldiOGRWV2pKOTd6T1VTaUFy?=
 =?utf-8?B?TmhqNEYzalhzV3E5cGZzU3NsYW5Jcm5uQzJ6VUI2RHhRRXlnUTBPU0JNQmZU?=
 =?utf-8?B?eXRLbDNrNXpIbEFIWVNNUldCOGxlZTl3cjhyUTgxWW9uMFZkaG82blFsd1Iw?=
 =?utf-8?B?WVY1MENyR0ZReTVjbjZNZEVKQmpTbTh5dUhRTk9LejVYMW8wSVlocDFqY2tS?=
 =?utf-8?B?OFpkeG5BZTJtS01yMXlpTUREeVJRbHFQZEpwY3pielFLYzMrcnMrd2hQcURx?=
 =?utf-8?Q?HZy20vGJyEGkls7dbtx1GvM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114221db-e35a-4641-a2d6-08d9b985cb6b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 13:30:54.5363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+YTVlw7Yu13HHQ7fgkpbckt8xxx1bEvEkQPjw9yaJOYmxV37BOuG1HKh8YioBsCJXy7dhg8DVMjReLXYDnuUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 07.12.2021 13:00, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH 1/7] xz: add fall-through comments to a switch statement"):
>> I'm unwilling only as long as I don't understand the need for them. As
>> indicated, while I appreciate your "make verification easier for
>> reviewers", I assign that at least no higher priority than my desire
>> to leave out inapplicable data.
> 
> Are we still talking about Signed-off-by ?
> 
> I explained the purpose of Signed-off-by.  It reflects the chain of
> custody.

And I accepted that (without claiming to truly understand things) as
far as the desire to prove all tags goes. Hence the v2 submission. To
me, as can be seen there, that chain of custody includes the original
patch submission, but not the flow through Linux subsystem trees.

>  It is true that s-o-b is often added by people with minimal
> contribution to the content; I don't think that is relevant.
> 
> If the Xen patch was derived from Linux commit XYZ (whether
> automatically or manually) then even those minimal S-o-b are
> applicable.

I'd like to adjust that to "If the Xen patch was claimed to have
been derived from Linux commit XYZ ..." I don't think I've made such
a claim anywhere.

>> I'd be happy for anyone else to start over. I would even ack such a
>> submission myself. But as long as I'm recorded with S-o-b, I'm afraid
>> I'm not going to accept re-addition of the tags for no good (as per my
>> personal view) reason. Otherwise, based on experience, the example of
>> this series could, in the future, be used to tell me that on an earlier
>> occasion I (seemingly) did things differently.
> 
> S-o-b does not indicate complete approval of the content.  It attests
> precisely to the statements in the DCO.  There is nothing irregular
> about putting your S-o-b on something you don't entirely agree with.

Isn't it up to me where I do put my S-o-b under, and where I'd rather
not?

> Stepping back:
> 
> In a collaborative project, we must all respect our peers and the
> community's decision.  That can mean actively progressing patches that
> we personally disagree with, but which the community has decided ought
> to be applied. [1]

The latter part aside (as I don't think I'm standing in the way of
getting these changes in), I don't see any "community decision" here.
What to do (or not) in cases like pulling in changes from elsewhere
is simply not documented anywhere. Hence all I could have gone from
are past examples. (I don't dare to guess what the correct thing to
do was if a change was to be taken from a project not using the S-o-b
model.)

>> As said earlier, if submissions in this form are going to be nak-ed
>> going forward, and if good reasons (see above) will not be provided
>> (and hence leeway will not be granted to the submitter) to support this,
>> then someone else will need to start looking after imports which may be
>> relevant to us.
> 
> The problem is simply one of verification.  So far there does not seem
> to be a positive ack[1] for this patch.  Neither I nor Julien are
> nacking it.

But, as Julien calls it, "open objections" are effectively preventing
the thing from going in. Otherwise Luca's R-b would be enough for the
whole lot to go in.

I did submit v2 with his ack on patch 1, in the belief that a) he didn't
actively withdraw it and b) I did address his concerns there. Earlier
today, seeing the ongoing discussion, I did drop it here (and I'll try
to remember to also reply to this effect to the patch itself).

> AIUI Julien does not want to ack it without being able to check that
> all the appropriate s-o-b (and perhaps other tags) are present.  I
> think that as the submitter it is really best if you make that easy.
> 
> 
> We think the obvious way to make that easy for a reviewer is to just
> copy the tags.  But an alternative would be to include, in the commit
> message, full details of where the patch came from in (including urls
> to mailing list articles) in such a way that a reviewer can see easily
> that all the necessary s-o-b are present.

This alternative is what v2 does: Already in v1 there were links
present to the original submissions, where available. I didn't think
there was any extra wording needed next to the links. v2 merely syncs
the tags with the patch submissions.

> [1] Of course very rarely there might be matters of conscience, where
> we have protested but our protest has been overruled by our peers.
> But that does not seem to be the case here since you are not giving a
> nak.
> 
> Ian.
> 
> [1] Julien did give one earlier but then wrote "actually" and started
> this subthread, so I think Julien has withdrawn his ack.

Well, okay, I didn't read it that way, especially since I did address
his concern there in v2. But as said, I've meanwhile dropped his ack
from there.

Jan


