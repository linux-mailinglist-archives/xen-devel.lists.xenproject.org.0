Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129364F56AA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 09:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299643.510674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbzeD-0006PK-9M; Wed, 06 Apr 2022 07:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299643.510674; Wed, 06 Apr 2022 07:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbzeD-0006Mj-5K; Wed, 06 Apr 2022 07:00:09 +0000
Received: by outflank-mailman (input) for mailman id 299643;
 Wed, 06 Apr 2022 07:00:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbzeB-0006Mb-CF
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 07:00:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e414bc9-b577-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 09:00:02 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-hiNFXm5gNKWnG42ZC8Nqwg-1; Wed, 06 Apr 2022 09:00:04 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBAPR04MB7206.eurprd04.prod.outlook.com (2603:10a6:10:1a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 07:00:03 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 07:00:03 +0000
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
X-Inumbo-ID: 2e414bc9-b577-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649228405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5qgFRr6p/bIDfH/aDYF7/Evg0uH974PLIv0Pv/T87AY=;
	b=YAbRZTz9xIypuD9PQtKKht9cEys7FzawOnSJX06/pCV71ZyhVP4jcdCqKQYGmAe1IJIzUi
	yTTlszd+6UVoQySJv7QmRmgVb8szqitVRRjKcEZ/52rnT7J9p2IxJyEGZq+d+ZGOqhFWfj
	7sraRerAUqtS0MITEuDLxVjv7vrzIQw=
X-MC-Unique: hiNFXm5gNKWnG42ZC8Nqwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMVKaDXKxHDGQqOsb6c9aJfhJXrxzvkt8TzCNd+oQmaUwbleo14B9TIhSICzUyVuqvXVQUc5ZYJ2tjXrwnKSl6Vhm822gQLUu9rVBUz3pltMTivXKTSrFKKaniUVmsXFJDBAtG3hYiJQpGpSDbx66HoftSPv8Lf2Sh44yjYE2tkC3giX3/+cWgshwOOYC1orDXSk/MMvtaN0zfFLzJSkpGo6cS6yQvuBQgXiITsPRu21llTD9cFmOgK89VpebcDWsENKV9/Ur9tr3pl4s3VHfzJtkQuLqsBOSgqGeREIkKsQfNuAx4vK5c/V/0PTt7b9gMBoGTCtOKWxgQupSCyEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qgFRr6p/bIDfH/aDYF7/Evg0uH974PLIv0Pv/T87AY=;
 b=GwjJRJZ4QVJakw3uyKYDSFRSDWgBq8Xfh8Cj6xveuczUBU316hXzv1PyL7rSz6u5mWYJjo6ZjStfuHqoycw5xPhO61/x71n3YuY/YwjV99LZNfA8HVLs/0n08S3THLGHTG+YtqzWSHs0XF4ZuCnDb6M8IvlxdEpna5y8WG/ZT5PVcGx6C0OggsBdMBz0us+AELoLxYjP3j+fFnK97ygUvLMxrrahCiIwqM9v896TPQKGJh2ZxUvyXTFl6k7g5hwFTTBTzvWkHhKXdbnyn+XdjYNHz90Dh9A/8Ak4IC6UBw3aHk2GiD6kFW/vl4m4Du2QaA4h2eR3Gfv6xxoewRimMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c01eacd1-cf2e-9258-f06b-5a0278fa0ce9@suse.com>
Date: Wed, 6 Apr 2022 09:00:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [xen-unstable test] 169172: tolerable FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-169172-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-169172-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0196.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54252f3e-f5a4-40c3-4657-08da179b129f
X-MS-TrafficTypeDiagnostic: DBAPR04MB7206:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB7206F9373636035E0B439801B3E79@DBAPR04MB7206.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dUWGQ7AxCvDxs6dnnGhPtfT1Z4H4rw9M6+WlyofeqiutnGraFZHkAxMYqi6yBRHjOD8Y90ieIFyngd+XzHMxU13K4l6xiN6XVLVeOXBDcu54aJtE6PU0/5Z4T7nqshOST4tnShqgPgB5nskTd0B7KNHTJ+4e9WN3EiY2PNTuiq5RXH4CsMwg7IcYFCAxyaxB9Q8TSID4yxT2yCoQCV+4J4Lvqsbz/hz4scNcWkxw0QHZ6K0zfLoUw0LzDMIIy1AOYZNKuxcrMIFUeuRlAmE14kBNbbYrlPbg0hiEuH01dH9iuycSkwHPM2tu3tnOM5bn0Q7nrj/StltLbXDI6HQYas4j8RWAFcMo4UfWLwVqgqzI8iTa3DG2TUgxoWuwLYw0qDkZSU/B0WvZ3d3DqDdc3w5ED5dPuEUNVEf8Ixa/q0HfLTROwqQJ4Hpki0dLLThcnZMSeSDcosr1KK6K2byRUP+aQzgxYVx+qlN5C2YenUG+nOhXk7n6Rc8Bqblg/LB2PvFHhlJXm1I+lEHwtRCDdesgIp3PD1PIEAw9oMksB4hvw0l8JKvQTctBqV+XaYQ4gdR12+OJcBGIQXVO9aQ+UwzpnZFbA7RPgRo8Tclt8guB4Ca5Jf9BsdNwpGSCN5Cv4ErT/jEOFPsZCXnuZ0EeL0RdYrxf6JNCFjF7sr0EcieVvxkjMd0Acpge/7VC/ozrRXQT4dRh7Nst9a5b7ALECn3UXFoDSR9/JW0mY1F91jpS1n2b0gnlH/Y52ZpIWwvCqZm5sKOlRSAagdTef7iwIPn3IXEqtVZ8AccUE9N2rXoTxFekhFfF2gZ09odsNHYO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(2616005)(66476007)(66556008)(6916009)(6512007)(53546011)(186003)(508600001)(83380400001)(38100700002)(8676002)(26005)(4326008)(66946007)(6486002)(966005)(6506007)(4744005)(2906002)(31686004)(36756003)(5660300002)(86362001)(31696002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHNxWUZocHJqeHpWQ2pLR2VXQ2VIdEsvQW0xdnlJS3ZhSWtDRy8ybjdxSzVE?=
 =?utf-8?B?dG5YSUx0NGhGQmVOQmtkczlRcXg1b2xxQXF3NVd1a0RyaFYvcDZwUmZqUEdI?=
 =?utf-8?B?Z1FWUGFsOElFMXNNMGxTWTBWRWR0ZkUxRFVIZ3NpSEYweDE1cktUT05YRXZk?=
 =?utf-8?B?MDBqMTg1SmdWaGxWOGdoRWcxUkRHRkxoUWROVnlDTmtVczJmYkp6TVpMNzFu?=
 =?utf-8?B?Nml2WVZlVFFlVDhXR1BITGd0Mm9VRGhuVEVWbmt5bzZYMjJ1UDhCdjJ3NURa?=
 =?utf-8?B?OUw3WFNOakhucFJHQjVGbUZCS05lWTFmaHl6dC8zczVncGd0SWF0MGlaY25N?=
 =?utf-8?B?cGQ5bnRMUHlQTjNzQytQSmZCMmxYM3FxTzZpTkJzOHhlVlJUeTZmWU15em1a?=
 =?utf-8?B?QWFXTDV4WExTSWlibm94TDBLNG5WZHg2Z3ZEU1YwVENCa2V3UVREUk1ad01n?=
 =?utf-8?B?L3ZRRjc4NytpUEZjWUpBRDNoZ2R3RjM0NnRZbUQ3ZE5lbGtvT0wvbkliZlZB?=
 =?utf-8?B?WCtqN05MVUV3NlBMUm9nWEg4V0tibmlDcnM5b1hCTzdieXNVOHZhZ2JtZzBR?=
 =?utf-8?B?N1djdXR4U3g1c2pmc09aazlNMmZXS0crRldGSDhrMW9za3VnTmY5ZTlXaVBP?=
 =?utf-8?B?d2dWeFlhK0lZQUVyT29KTE1ZQXJranViZ2RXZW1lRHpiR0NEY0FGdWE4ZUZu?=
 =?utf-8?B?TGhOTXRRVGFpSHl5VUVNOFRmN3BsWTRMVnZWU09qOVViMDhKKytVZC92MTZn?=
 =?utf-8?B?bmRUN3BJWUFicXhLTVN3ZDAvV2lLdHVrYlhqbUdCUFRMWDBlemMyT2F1YndP?=
 =?utf-8?B?VElZaUhKL2JWeS9XcVRMcDI2SnBoZWJHZ3JZVi9XN2UyNk9GU1dKS0R3QVg5?=
 =?utf-8?B?MjBmajI1NWpGOUFnL1dPMUNSTzFnMkhVZ3NxWnVib3NhTHQ0NUhhZ01BL0dE?=
 =?utf-8?B?WGhVMURQVWtVMEdJejZsZTVJOWowS3cyNmJka3ByRkpxaWJKNnBMZEFlQVhL?=
 =?utf-8?B?Q3lTWnNFdmZQc1NpQWlzQnRlaXlVc0E2VFFnMTVsQWxmblYyYXpDREhWMGoz?=
 =?utf-8?B?c1NJS3FubDJxOVBXNWNMS3JvSmlOdmpwN3ZQZHhuMThodTA0UEMrQkhLcWtK?=
 =?utf-8?B?YXB4a1FTaWl6UVpWb3MwYjBGMzBBRitqQldVbUlqUE1XR21ERmYrL0RhVkt5?=
 =?utf-8?B?L3hDcjFmeVF4Wk51RHZJcWRldWtzTWhkRHo0dTFlZ3NGZlJjU0hCTE54OXNI?=
 =?utf-8?B?ZUtERTgyeWVFTzV6VVZ4empQL0ZZUGk5clNHTllVelhZRnllNGZxNUxnQkNM?=
 =?utf-8?B?UEkzOEhxc1gzdkhYRFlVaHhtV1dXbitTeWRMWVhGMGJJTjJNTFV3OFZ4MWlo?=
 =?utf-8?B?eWdMR2t3bjI3Z29zclRWd3dIeDRrZk5wc01JWTZDSUZBcGlkcXFIZ21LRGdk?=
 =?utf-8?B?WWpTTEJib0dkL2hNQWRta25sUWtmbFp4K0ViSVRyYzl5dWVacjRiZmtJOWE0?=
 =?utf-8?B?clJQZUhxUXdVSXlrOS9YZlVZMlRyMkQzQ2ZPZklRMlpwYmpqRG1QeWtzV01D?=
 =?utf-8?B?QWM0ZXhUM0NlUXdPMDBFdEhQMzJoNHpRcXBZeW9OZWViTEtrSDlHbzZOWkpL?=
 =?utf-8?B?aWQwalQxelg0SVVVZlVWRlhBOFB0bkc1Mm9xU21uTnMxYUhLWmpVMU02eVlk?=
 =?utf-8?B?RmdZenloVUZoS2xESjRnaEdBNTJERzdqQ2RiRys3MFN5MmV6alVxNU1ITm1R?=
 =?utf-8?B?ZCtwNEp1K0RUTjJWaUE1Tjk1NVhkRTIvcS9iaklBMyt2b0RLT1JIMXRCQnZa?=
 =?utf-8?B?YmNQdzRUTVRYTjJsTUJqbWc4akRtRUV3VHZSQk9RWmFqRVMwR1lRU09qcHRT?=
 =?utf-8?B?UFBObUJKN0FmeWhJT0JraG1HcFB5d2dxSVNYeUlqNVpZclhsL1hudjYyRXR0?=
 =?utf-8?B?c08wK2xoN01ETW90c2RqMEVPb1l0SEN5aEJseG15UCtDZCt1Uzg2MHg4anhL?=
 =?utf-8?B?V1QwTjc1TkdjVkFSdDZkT01YUTRqWGN0YU5RUWJHeUhJSFEyS0xjeUtHeElS?=
 =?utf-8?B?Vk5KT0J3d1hmMGtGaElMTEtqejhnUzZpSGt3L0x2ZkVLVGhYemRBWXVMeis4?=
 =?utf-8?B?am9jWFlkM1RxYjBhN1p4K0tzaHhWK2NWcUhaZzY5TURoQVh2MWhzWVYwb2Rk?=
 =?utf-8?B?YUFqUEFlSEVneXF1TjFEUHdFbS8vOCtjMEg4OW5PVVh6K2pKeVBXWFN0U3dL?=
 =?utf-8?B?TlVKNTRsN1FLNlNXbmNYNzcrMUYrdG5nbUVJRHdDb0hhM2h0MHdodU5xRkZU?=
 =?utf-8?B?ZEQ3TXMwaEVZN2pQdXpkVmM1WmFVWG5hODlQSzFLT0k4VFpiZ0hBZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54252f3e-f5a4-40c3-4657-08da179b129f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 07:00:02.9112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6fmH+P+JtKsCYN9rsNKbjzLmhYmXJyGNdjBNWwpZC1Xs+BSF5PZxxQk64zvQyZ0VzYinXyhMg5cxD3LaXIAqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7206

On 06.04.2022 00:30, osstest service owner wrote:
> flight 169172 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/169172/
> 
> Failures :-/ but no regressions.
> [...]
> version targeted for testing:
>  xen                  e270af94280e6a9610705ebc1fdd1d7a9b1f8a98
> baseline version:
>  xen                  e270af94280e6a9610705ebc1fdd1d7a9b1f8a98
> 
> Last test of basis   169172  2022-04-05 04:42:27 Z    0 days
> Testing same since                          (not found)         0 attempts

I just happened to spot this. Perhaps not a big problem, but somewhat
odd and present in earlier flight reports as well when those were
simply re-testing an already tested (and pushed) revision.

Jan


