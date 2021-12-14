Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27C64740CF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 11:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246587.425254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx5OB-0007wN-HB; Tue, 14 Dec 2021 10:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246587.425254; Tue, 14 Dec 2021 10:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx5OB-0007tY-DM; Tue, 14 Dec 2021 10:50:31 +0000
Received: by outflank-mailman (input) for mailman id 246587;
 Tue, 14 Dec 2021 10:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx5O9-0007tQ-Do
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 10:50:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a66c4250-5ccb-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 11:50:28 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-NjN0jJ44M8yxneRNRr-Dgg-1; Tue, 14 Dec 2021 11:50:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 10:50:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 10:50:24 +0000
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
X-Inumbo-ID: a66c4250-5ccb-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639479028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0tkE/qX64lFKIFZGMymC/B9R7jluBGBrYJ7eoHmcGI=;
	b=hPwn2arIA3zxzvgCWsWn8aSbvj7J/fD/5f1FcuJ8viakwUUvkW3H4lUNu5VzBB6IA0ROtX
	5m/ezLg8smj7We4pNKzKp/LoZqtsd0AMyzpG5SkSwQYStKTZYiIPxrm1E99u/GRJAkGnfy
	IN+Q6c+dHIBXqEh7XQhWOloiBnlHsEY=
X-MC-Unique: NjN0jJ44M8yxneRNRr-Dgg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGiRTaFZB9A7+WnCvHNNviZIinyG74zcZF6ZUtb+xtcszyxRZSkmdsuSWPYLr7pJFw7scjPrsnULXI4pz53tLB/pKCmwWYuppNq4llwnmFEBiU42nCZsuX7g5nmjvzDqeaEb86mJ+YeS+iPhee8vkbj0DFku2GlopHOzIUeWg4LEGNkugJfPN/GceX3xH1i+AKwdShdOb1ngaw1mlWNus0Eo9bKYvbobxmYCtBHywgZ4NUlRCiZdNlSG1kCDOG5BA4cqGra51nlqpt8UlSoOV+M0QKTwI0kygDUN1TFaKv8I32lgvh+xND4kv77lnuacaXbzx5vudHmxU2y8BtJ9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0tkE/qX64lFKIFZGMymC/B9R7jluBGBrYJ7eoHmcGI=;
 b=QofFO/BPCXxJweJARxhNChOdatp2gF0Ip+ftKgCqCxc2p9CRS9StsfXECC0JIWevKPZmrI4mqBp4TBif/hq+z7dl4pHynt8gM4tF2NncLiWaBeNxaoAraXeDQ7Doe5k1Q1J0LC+BrBjHfL36HbpSjelo6GYmNnCk53JNBiBE5fTfoQkgL5Tw3XzxspgAlZ7Tajq7AS9yEKjVDCL4kXaaeEyrJ5wGAw+idQlYM+Xmfd+9knQJMJTiHTInJq/fd5OsPXxrBjmp3QLZQjgfiBv/PeN2+XdUJWvIoZA8YsVz0PxkulzisSrVdSae7lLYGyPo7+qZDjC5UTcz5fJAqZg9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bee28dd-35ad-a1c1-10aa-27bd2fd9a6fe@suse.com>
Date: Tue, 14 Dec 2021 11:50:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] x86/cpuid: Fix TSXLDTRK definition
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211214093732.30424-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211214093732.30424-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0041.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10d5de77-251b-4d42-c90b-08d9beef8879
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57438323D03BC86BD5D49C14B3759@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YxZCjyqCFYQC+txueMg31dX4NQPglHFFApGE2neeXvBwozDHGad0XKx5PZTfFKVk5l+fKYdQ0I7jrAcQXE4ZjVvu7zlk7GQqsx9hnt4spvMOBgFvYyLTv9VfvkPvQWttgm67p4rPwFV4Qksi42MPETGQ42NETEV6fgjYqTVjxg8DnM+H/1yr6ge9XpOYUlo+35WCiBWSgnpMj09vnBTnfhMThV1Be0TOAOc3nUlmx3qz5zP9qmAEdh7qT2SZhkhueW+bOGPcU79ZhW/DMqPuQ2SN3aB3jbLiNq99ANvZ7V3IPdHm7M37c0dzgsv9RRFkkGxJdrRBZ783AH3JJaikesQ/UAFaV3uPFUd7o91Uf8VLObyBaaaEacrWDrPyLaC6vvRgpqEwmaxLuDqrrgAZ7T2WFdHDQDsbZFw80mjg9EobZSUDbtHikSB8V7AyYu+RRUUoFIru9ROBMZy03uckb+bDZfvFg4bQb+xoNB2eecZlAKlt8PbMQiggxEV8KaaRT72BM3F1YAJn+C4gKNI9z+qQUdv8FHuhUGbXTKxycWCNWoLL/yP5+Ge4eWVu/Dy5xjpXqlKyA3yDpOzd+N+2xrtG3QjTg74IChdjsE4W7RsuUni4r7b80mobBtDpHy/UaCCmLgHAZ6fS9WB/jlADkzq9iiHSZOKQ0lpjDUnvoh68b7BrWDCR+VBEpjShRkyb48YKSJYeuJCaLj77LaT3VafFBkWBoXSGuQ3wFd3HrVKy9XbR+/HH6jG4cxFtmRUULFaMPLLyi1Xqi1VPcxUSqKDxeawJ3bBJfauG0xNb3/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(8936002)(4326008)(316002)(6486002)(6506007)(31686004)(5660300002)(53546011)(36756003)(86362001)(66946007)(26005)(54906003)(6512007)(2616005)(2906002)(66476007)(8676002)(66556008)(4744005)(186003)(508600001)(6916009)(31696002)(121003001)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTd0Z2RRM0kxT1pZTzExT1V5dWhRdjBBVU9ieHB4U2o0RktQVitCQTUyU0RB?=
 =?utf-8?B?N3BKUWU4OGZWWldhZGZDREJoTUxiK2xrVVdqeVVGQ3RGSGtlbGhTQmtxMFJ3?=
 =?utf-8?B?WHVLYmROSVJNRWVRZWJWQnV2aEE5Rnp5YzNqb3JrYzV2UXh6YzJ5NS91OHVO?=
 =?utf-8?B?eHBMS1Z0M0hVcHFndUFpd21YTmtSQzJpcWQ1cFMrZHFacVBQbzREZjY4Q01O?=
 =?utf-8?B?WjBEN3o3bzlmaG9qcTN2clVncUF1NHQ2d1BqVzVLZmFCb3ZMbkwybzBGSSt1?=
 =?utf-8?B?YXVlbWx3OFJkNjEzb0YyYzQ1ZDZJQll2YjA2UGJWaW9xS0pPV3hmR2tVVGdv?=
 =?utf-8?B?SjM5VSt6TVdZdWR3YmZWTFpmQUNPUkxEWWFYd0Y3QXF1UUFOdi9TdFp3dVFl?=
 =?utf-8?B?QzFHWUlBOUROajVaWTJ6L0RqYW5Dc3VhYWdLYkFqakpUYVFWMVk4WDF0ZGdG?=
 =?utf-8?B?SGhEbHpmS0FCbW0vTC9PdXIybHRCK3FpZFp2eXUzbHZUN2tqdFhtRDBKY2xq?=
 =?utf-8?B?VEcwREwxaTREc05jRTJkSkxRaUJzbU56ZlRabmlyK2tITWp2UWQvN1AzUkxO?=
 =?utf-8?B?eHd5TnZHNlJTSlczM3NhZEVWM2dZdHhvSVBUQ0VCdkVkaHRjU0N6T3BBbDNI?=
 =?utf-8?B?Vm5LTHFZc1V0ZHpLcDc3NzhQbGtXMnpkSXp3ZXl6d0pUa1JVZlI0S0hqdGNT?=
 =?utf-8?B?RW14c2NaY1c1MzJ4azhIamJnNXY1Sjd2UHNxS01xbWhxQ0RnNGRrdnJIOGZU?=
 =?utf-8?B?T0o3VEFTemdnM2ppZzFYd2hTY0tXNjdrem5OMU9uWlg0eHlBMVlmOTQ3d1di?=
 =?utf-8?B?WkhYMFlGNmFzQ1JzVjV2N1R1SVQ1UE5vZDkzbU1jbys0V3VZYXE5Mkluc2dO?=
 =?utf-8?B?b25lTVFNaTF0MDJaWFVRelZTRzA5cXQxbWRzNm0rZWIyVTNDWUt0RXp3dlZY?=
 =?utf-8?B?dkM0NVUwMWc5TkNPeVJsZk9RalJXcStLV1dZVitURnU4YU05eXRTMXhEVms2?=
 =?utf-8?B?TC8vb1lQWlpOUVo5Sm94ODFJQTBIS2gvNXQrdW83OEhJb0pPcTFZOE5zMmJ3?=
 =?utf-8?B?TTFtQzRBYlo2OFdsVDA4UTlIT3BUMitDV0phSkVZOTNhYWVQMi9QaWlVWDhn?=
 =?utf-8?B?M0k2OTZtQmNycmdhdzVURS9OTlpsdHM1V3NKQlpLYldCNkM0ZnFWUHdLV0pK?=
 =?utf-8?B?MlZzTXB0SW53eXFHNTNRWDZGakVhRnl5MTArMjFaZVI4eXE4Szh0ZkJoVmlQ?=
 =?utf-8?B?QmVRblgzZFJCaE03OXZ6ZUV6eHphM2dWZ0lWS2MxQ0JxaGRhTzk5dW5zK1pM?=
 =?utf-8?B?eUszaFBtV1R0SFYyUHZHR3hOWURUK3pUeEZGeUJNRThTQ0g3SndxY3cyNXBY?=
 =?utf-8?B?QlJ5SlJwQm90QWtaMWJzQ1BhTHd1YTEwWEwxTklsT2hONndDZ3RLMGVwQnlS?=
 =?utf-8?B?dWJEUldLTUNBaEZ6SnlJVkU3R2FHZWpLM0lNcHhWMWc5VmNIeFBUdlEvMGV2?=
 =?utf-8?B?dkxxcVJmOUtEMktxMm05R2Z6MFducjgzMGFzMGI3czlnLzA2cjBCZXhELzFl?=
 =?utf-8?B?SHl4djZEWmd4WHhIdDhKeG9TOXZoS2MxSXBPd0RHeGZEOGxISzRQcTc4Nzhq?=
 =?utf-8?B?Tjk0K2oxMk1SQWVxZWErakV1UkV5cTFlclFJeXFacU9UTHJyQ2IxNnd0M3E1?=
 =?utf-8?B?MmRKWklybFh4dVM1RVB2c3JEamlXOE1HK2hQRXJlV2dlazE2WmdCMDVHT2Rl?=
 =?utf-8?B?TUlHMmQwa1pGRTZJODhuVDErdHBHVTRvcjFNMFI5RXlpMjJOTUFGQWlxL2dS?=
 =?utf-8?B?WjNYTFZiNkRVVFpFdXhocWZHM1JOejdNSjAwUlZiVjFaMVhieTNWWkVYd1hB?=
 =?utf-8?B?Snp6cjBmcmhINlplY0NrWFZzQ1hLeDJGZDlVSUh3bVMyL0IrNkppZ2E0TW80?=
 =?utf-8?B?dWZ4RURZbm5ENDRrYUREWTV1d2JpRUZtYmJjbzVQaHpuUFJTUnhEb0VISDJX?=
 =?utf-8?B?SXFXeWxKbmx4YWp6OWxjYnNpaC9Udm4wd2hEUm1qR1djMDFCRXE1R093U3dX?=
 =?utf-8?B?aWtLMlI5REg0STlZWDZVQTJwd3BGMzVHS1VQaDd0RzlZaW9jVHlDMXdLOTRI?=
 =?utf-8?B?SlRoeFJHVklScHRjS1JXdDJzNThkM0pVZnJ2ZUpUdVh0eEpqYzhHNW1WWFQ3?=
 =?utf-8?Q?OjKjP+hgJ80JfxITUuBnNg8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d5de77-251b-4d42-c90b-08d9beef8879
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 10:50:24.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbMsKGve1X9Nisr/OrjXIsJ3KM6KvhT6qCr0J7IPyGxre0YKapeIU41EnCtHy/OsQOWc+g9c3YaSMK5OOWui+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 14.12.2021 10:37, Andrew Cooper wrote:
> TSXLDTRK lives in CPUID leaf 7[0].edx, not 7[0].ecx.
> 
> Bit 16 in ecx is LA57.

I wonder how I managed to screw this up; it certainly hasn't been a typo
in the original doc.

> Fixes: a6d1b558471f ("x86emul: support X{SUS,RES}LDTRK")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


