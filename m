Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5D14664AF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 14:46:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236562.410379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmOy-0003A1-AV; Thu, 02 Dec 2021 13:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236562.410379; Thu, 02 Dec 2021 13:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmOy-00036w-7I; Thu, 02 Dec 2021 13:45:32 +0000
Received: by outflank-mailman (input) for mailman id 236562;
 Thu, 02 Dec 2021 13:45:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msmOw-00036n-GY
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 13:45:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1beb457d-5376-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 14:45:28 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-UGhlhmb6MqKe1aLCGkFQDA-1; Thu, 02 Dec 2021 14:45:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 13:45:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 13:45:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0602CA0019.eurprd06.prod.outlook.com (2603:10a6:203:a3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24 via Frontend
 Transport; Thu, 2 Dec 2021 13:45:23 +0000
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
X-Inumbo-ID: 1beb457d-5376-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638452728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eBqjxjzAKNWmMoaVdx0+u0F+oZJWaI43KvGtrAVKrb8=;
	b=isXHcx8ph+7yy8hBKs6DLTTLcJqms1gKGxuw6R/leoQrO5njTjTQwb0t4+lZ3JQWOEmu7z
	21Q77/9c1Ui2bVVIUUNNwk9pAAqyWjiYI2P0+jmrDcLdmOQHDF/O2Hmy9rANFFR3L+f4G6
	mo1mBy7ZraLrt7+5brLs21YQv9gT7XE=
X-MC-Unique: UGhlhmb6MqKe1aLCGkFQDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ps/BS6POLQkkPrNsO1GZrkP0CYqt481w8GhwW4TbU2V4vKM8Y4ryT32vTziX+stxveTbfgKdprVrnXYUBoLJXTvsa3E/N/y5FBKoUj8KozLynMVwnv7l3v7trEOFZ0qNPs3obbSil7qkpqkUABKf2JyclJyhRC66u8vxHe8yEpCWVfR3VYlxgPf82pHuBa6pbcR4aSCetc1IyNX00WmjzDcNbd0P1NqwynRb7UP2EnWQGm2I2UpLN0Wkoq9pq0eHP/7bBLlu485JDcY8LL2DqZpgJO58zbcZWJ2Sv0rCROjR5FjNoqtIJ+CI9bEzTNGCIq/YAFUgAuBIR9+efc2QKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBqjxjzAKNWmMoaVdx0+u0F+oZJWaI43KvGtrAVKrb8=;
 b=lLK63aKS1kqN4iZzuhC+2L5GOwRgc0hQ2VhdYkjJYfBUyZv1u5loka3NK121Pyw7WLq915CblngZB+g6CyX+tZtvjBRVZ3UUcvxo4iXS/MDsV312YZ2GhKomqDLC3qCubX033QHBqoFvb8+bsgEc2xuuUZArCz8pWt+YdHpvjPSrnNyqOWguOI6XXWevmgGaMUPSZVi1nZsiC/0DRvieoYyFzYjLcdwv3AR5EyefmX6groQsZj3TmnEKkdeLA+cRhWdEaJEnA46lQbeTE+CZczg9U611JOnKMEUhh4TD6Jss/qVcNq98Phl8neJBNGO44Es21N2CAcYrepYXrdMFyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ce78d1b-a223-531e-fb06-47d78c5f3c7b@suse.com>
Date: Thu, 2 Dec 2021 14:45:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH 1/1] Add suport for SMBIOS tables 7,8,9,26,27,28 to
 improve virtual machine stealth from malware.
Content-Language: en-US
To: Anton Belousov <blsv.anton@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1638190663.git.blsv.anton@gmail.com>
 <3ad07dc366117e43a46004a03cdb963581b16fd7.1638190663.git.blsv.anton@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3ad07dc366117e43a46004a03cdb963581b16fd7.1638190663.git.blsv.anton@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0019.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f51e92b-08a7-46e7-82f0-08d9b599fe87
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6480838D42ED19544E55FA19B3699@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iTlUwAbvvzxo9y4afJ9xZxQPyt0Krx+RYtOwVcFW6t+/xCPxTT87jIaKD0RqGow2zyGzP8OaIndMEEIqwa+vwt25CKB8zq1Rycaw9oKAbKX2xTYh+zax7pA4AEoZrXr74QmxmAcwxUElBXbPJV3ukoln6KLvVwhVuj2u7w22Wt6PCxy6W+ZFCgkXmxRjxqGOqBbiPaRV1KhWfht8gR3yprp598NXrVl0joNQtqcDvfMrGV4NOH4kZFEG8dctWFRIK1zj7fX8UjIWvgkAVXFBESa/Bl7rKsjYesfWKVzpQ1yKBGZdo0XAABGMzeRXQRh8meeOk9SJrnv5PgJcqb8MHsyHchHLfh0UoAI5z7RRcNBU9cWhrXAIDoUX6262VHNLDNc9G6mTnSqt3EoQC2/5ZyGnnqJaZD+P8T8bk18lpaZYJJq1HrcODG3gIu+DiVrr2lf/4O8gSwRIownPbJnx2Xdq1NMhJ8lMKGS4MdYEHvSGr0arLcG2kac6iCokfKx8a7fp5r4qOrneKaZJc3owtu8JiHX7p2wn3Opi7PZCFwWLZNIaKsfjjUGpP8jcSObTb/jen7m2uy4DCnqE3W50REJMAsbDc+d+YUsSRDeAUPgOK94SIClwX9frM+AFsNGYttzxv8F3ZKSEoCVvqHLJ8dMEsA9vKPHmLiqiHdS3EaoMe4zeaA1eaEEXxvTU1yn2eia0QIv2ecpkq5P+T7fF75RRQPD8JDocXA92G4nG8DkHTAAn854XNjNZL8j/1kfa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(2616005)(4744005)(66556008)(4326008)(6916009)(66476007)(36756003)(956004)(186003)(86362001)(53546011)(26005)(66946007)(8936002)(508600001)(8676002)(31696002)(6486002)(38100700002)(31686004)(54906003)(2906002)(316002)(16576012)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGpOcjk2TXY3a0wwMm5XSGVyRS9ndDViRG1mUGZPL0tuYUJUWkNQMnFSRGdI?=
 =?utf-8?B?RTNpT0xxZkM1TkRRL2d1UkY1TUhjTFo3c3pvNlRDL09rbjR3QkhpRXo3NlVa?=
 =?utf-8?B?VUllbis2NzZPV1pkVGxkVXNTWkIyTnRnSkcxQ1VnZWtRNEhIdkJuVFFqVWJ1?=
 =?utf-8?B?WjBMWDF5MGlwb3kyNGl6eXMzZE5PNVQzTEJqd01lKzFVVXZMRTlwM2hYWmE5?=
 =?utf-8?B?cUwvYkFtV0JJMHVtMTBnQ09nYW4zWWlWTlRYaEw4QThwY0pwY0RMVExrQWpo?=
 =?utf-8?B?cjZOcllqUzM1d054c2hIZDNKbmRmbitLVmFEaDA0M0pWZE5DUFBCVTNtNW5P?=
 =?utf-8?B?WXVPbjAvTHp1VGY1WVJCR1ZoZGN5RXBrWHJtREFqNjY3bldFdnpFTHlhQUUv?=
 =?utf-8?B?VmpVaG5xZ1ppdUlGQTIxdmtPVE1FUVYyYWJBWmRYcWNCOWM3aCtIcERUeGRM?=
 =?utf-8?B?dWt3bHNtKzc1Q0ZqcXFYM1NUVkZHWmdqM1NsYis3T2Z1WWxLVVVOV3VaVHpD?=
 =?utf-8?B?UktSb0w1K0NiSk9JVERRY0FVaDhFOSt5ZjlueVZzL1hXMTRRU0NnNHZjMUtl?=
 =?utf-8?B?amEySHBqcjJzWGw3WGY5aGJjYzFicVo0R3owdmtJNk9ubEUrd2VhWkxEcjB2?=
 =?utf-8?B?NkJPbmRzQStzSHY1NTk5eWcrenZFRFZKckVQU1RYbCtEVDF5Z25EQ2IvcHRu?=
 =?utf-8?B?SkVxQjFUb1NuQUkwcEc0aFhOcUxIVnhUMWowTmhkM2NsQmJlVzRKQ0lNYVBa?=
 =?utf-8?B?RWFRNmI2TWNCZEt1c1JhaTZ0b3kyamEwNkprMHVRa1dIMVNYWjNTYm85dEJr?=
 =?utf-8?B?eFpTdHhVYjVXQitwUVZOZ3pCNXVRMXlRSTBrazREcENzUStXL0pySGpFck5N?=
 =?utf-8?B?dTg0cFJJUUF3SFR0SXZ5Y01PdGkzb3JRRHliUDVRdXEwcllRQk9GY1kvQThl?=
 =?utf-8?B?UlJkRXNyeXJHZUtOaFJuNUNSSklnL25oS2lTTkE0TFlJaTZUZTFuQWhIZksy?=
 =?utf-8?B?Q2FNOWNkdGRuNjhyandYUjdNZFQ4NitoR2thM2hSa1BOODhsczkwK3J0MFJi?=
 =?utf-8?B?VmxGb0ZmNUxkSmd2STZpektyWDQ1ZEZiQUV2SCtGcDdrWHhTeWo5b2tTVllp?=
 =?utf-8?B?Ym82K0RKbXRwRGdqUDdxYXRMOTMwV2xwMjh2cmI5NnhPTWpGelB0NFRjbTV3?=
 =?utf-8?B?K3NtSVBzb3pMWEVzMWxXeitvNEtMQ3A2bFNYcHRIdWNaMURoZUpKNXYwYmhr?=
 =?utf-8?B?TDJmN3AxRU1TaXJ5ZzZPQi9QeHE0N2wwZW9kY2JvYzFzVTBtR3VRQ0JRTnk1?=
 =?utf-8?B?dERMOElsMFNya0lGQXBVdlFsejJpZzdXalI5UUpleExwY3ZKcGkra3E4RnUx?=
 =?utf-8?B?Q09iV0hKaFJXUm9odnZtMFBhRWRPcWZQY2NNZHRVQUZwTmFtZk8vb0x6dHFi?=
 =?utf-8?B?OEdOYnd1ek16aHN3bXlNeW9uL0FRZkcrSXNaUVYyZmIrZFJvN08wN1RncUEx?=
 =?utf-8?B?a0JDMFBtU3BOMG5BTWx2QnFPek5laHV4eVFPdE9rZ2diK3kwbEd6MWM3RUph?=
 =?utf-8?B?MytOTWM0eTRPaU5ROFhjRE1USFI4R21SQU1jY3BOajFLczljS3RMc3FzclBK?=
 =?utf-8?B?eCtjUlVIUWp3ZU9iSVIzVEZmZlRrRnpPdnpiSXRTQjlDMXAzYVB4c2RrSDdJ?=
 =?utf-8?B?SFVmTEd4dEM3UitsQWk0a2xjMG8ybzJHeFhqME5Dbm9GNHhYRzNVdDNnK3Rj?=
 =?utf-8?B?ZmVDYkx4aVNZMjRqbExZRG15NmhJL1FUaXIwMFdMNitOUjdEVEVJb2xaVEtQ?=
 =?utf-8?B?SkF3d1RNU0xUd2d3UWZ0N0NxSG92Vmdyck8zSzZaY2dzdURsSURhT0pFdHM3?=
 =?utf-8?B?K1pwVTBZTCtYOHVHQzdNcEViNmYvcnJCcHY3eWYyRlJzQ1FBV0k4VmVYcUY4?=
 =?utf-8?B?S3pJQTVrSC9WeVV3K1R4ZE9KajQrWFRKWER3eDlHNzQ2Q0hQSTBwWlJxeTFH?=
 =?utf-8?B?K0NGYXlhWGpkN0xxUTkwcXRrRWI0WkRvK2tBcEtHekNUNkNZVGhSNklrZU1E?=
 =?utf-8?B?YjdrVE9ueFBUUGFMNC9jakR3KzM4Vkh2a2dnTmE3QjU4NUxEWWtsQ2FwQm92?=
 =?utf-8?B?WE9jdW15dTR0anJLV1d2SW96bVRlUnM2Wm0xT0JvMzdlSXU3ZHphaTQveW9V?=
 =?utf-8?Q?CEJt1hc7EgWfeLtriY9A7qc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f51e92b-08a7-46e7-82f0-08d9b599fe87
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 13:45:25.5652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usHEWw5CxDUFax29psBtFSRwwoJuld+B9jDH8VV0s32pcwMh6BRmyVGl3P38GauobvKREIJEziwL1AbLVAnpaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 29.11.2021 13:59, Anton Belousov wrote:
> ---
>  tools/firmware/hvmloader/smbios.c       | 146 ++++++++++++++++++++++++
>  tools/firmware/hvmloader/smbios_types.h |  76 ++++++++++++
>  2 files changed, 222 insertions(+)

In addition to what Roger said: Without a commit message it's also unclear
whether it was considered that the extra information might misguide a guest
(kernel).

Also, even if I expect you simply cloned existing functions: Please try to
avoid cloning style violations; see ./CODING_STYLE. The most noticable to
me issue was missing blanks around &&.

Jan


