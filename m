Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3365FC75EBE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 19:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167711.1493939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM9Qr-0001RA-7f; Thu, 20 Nov 2025 18:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167711.1493939; Thu, 20 Nov 2025 18:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM9Qr-0001Oa-4w; Thu, 20 Nov 2025 18:31:01 +0000
Received: by outflank-mailman (input) for mailman id 1167711;
 Thu, 20 Nov 2025 18:30:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM9Qp-0001OR-80
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 18:30:59 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d662361-c63f-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 19:30:58 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5316.namprd03.prod.outlook.com (2603:10b6:a03:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 18:30:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 18:30:53 +0000
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
X-Inumbo-ID: 0d662361-c63f-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLnTWkVkAfrlT4ONx75bEKaLlVXqYm2kNp9r3BttY8PNNfqwkjC1V3/ALmWvuy89LvzXO/n/adlmXb2yD2JXdJwR7n7KNIXWDgYSWGsbu62bLiBgtXwSwkBEraFA0dz7U81RHJT3SpVVPCJRVB2szN3GlKzlbpzkp7MdS7qehYAFgWgEZ0HVz7X3QaeleP2HKevrg5EqhU/NWHvR7eikR4xglsy6jgc1t9xmUhTzLmZt5Pi8VmjrVJnbjuuPwoo3CQai+cFJ9CizuG6TiA1F5sBEeNjjt20oCO4ZJSErwGStipTcnw9VxP5Bt0J2S2wyhPwzMjJJJa5BC8li6cmE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBxSC6UCsEsioV2QWg0TKmfWGZelgz0jipyCXdGpmas=;
 b=lDvBwsbGb0Q+izIpAb8rUCL+PIy5ylxzOBD1blJK0HdWOfruv78X+Gg+xxYOAPnHyfoE1gU6Lmn2ALhnWGudbmycebe9TL38Vz9FUKa9AVJkEn5uFxjpZESXtBiB0ZQr5Ky70jeoswOwF6EjNUrfFxdrqSdnJVbCF4Vmbq7Z7Q7U8LSvSAa4b63JO8x7fMlUIvep7Pbo9Adj9L7EDY7aKFrHIjSJad02GYG0X9R9EN9p1r+ZKvB7jeDDrMU1Yqz0wNM50beZYdroN8GcxH34fj3d+SsVEzvpWih1Vcj6j3cmt13ZdpMFv/We1drI0uHwBIbwPhlLouyt8meUI7A2fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBxSC6UCsEsioV2QWg0TKmfWGZelgz0jipyCXdGpmas=;
 b=R0UE68f/euyWU7OqvSrJNSgEJ6LSGxq4l/ujB8CmdujXYzshGZZgvX3WvUEXIv4vmL/wGop04a6sIpP2YknMYvpcm/koXd95VInZNtRr6CJguB93eTmyStXRpdXfQBnBq54oH+MFHxhdWT4hPFqjsv7Bif+FfQRyRp2HCkoasWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2ca642c5-3fcb-4a35-8500-ed40e540b300@citrix.com>
Date: Thu, 20 Nov 2025 18:30:50 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] x86/io-apic: purge usage of logical mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-6-roger.pau@citrix.com>
 <63a4f416-f475-4b6b-8f44-db570b7a75d9@citrix.com>
 <cd41f345-f5db-4d64-8914-a6984f7fa83e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <cd41f345-f5db-4d64-8914-a6984f7fa83e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0309.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd18a3c-95cc-4f04-f265-08de2862efea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0tZVktybTBVOWFHYWJDSCtuMjNRdUxKOFlJSVlxaGZCbFRwU0Y5RGp2Y3Jq?=
 =?utf-8?B?TldGbUFjdFlCUjlCVDRVZjF5b0VOMzdLZHRCVUgwV2x1bGtuZXlOUVNVdyto?=
 =?utf-8?B?SXZJMlNMRDJlK05HdG1yS3hOWUtWcmtIa2ViaTB3UVd6Y0YrSW80cDNiMGov?=
 =?utf-8?B?cVpmZmM4bmtmZDRHMGZ5QVpFWTVwZktRcTFqOUhmNEo4ZkJyb3ltczNtcWZL?=
 =?utf-8?B?eThMYTQyYUZBeXl5Tnorem1pd285VC9OakphYTZ0UW8yUGZjQ1FmRlI4KytC?=
 =?utf-8?B?K2VJT0h5QVFqOUlsT1NhRzRSR0pjbTFxK0VCaWMyZ1d0OXFMS3QvZmF5VTkv?=
 =?utf-8?B?T3puZ3VpcGFPWGlER0V5TWozandXWlU5TFJJK1hCc3Z2UEdFSnhGNUlUSmZs?=
 =?utf-8?B?YW9od3NNaWlGOVMyOVVnUTFRUjQzeGhsM1dTaVlTaERhb3BNQ01QMzNRMHB2?=
 =?utf-8?B?TlppUkJxQTBjTmlvSC90TW5URkRFdWl3aEg2VzRzaEpWOFRPTEZVME5kSTM2?=
 =?utf-8?B?b0tnYjFmQ2tQMWduOWQ3aEx2MzJIeVMrY1ZSakFaOHNTUmt1RGhUbHZ0N0Qv?=
 =?utf-8?B?Q2R2a1k1ME40LzgzR1NWbWR1RkFVYW9FN3l4Z1NoWFNGcms5SXNLMVNPT2JX?=
 =?utf-8?B?cTFUL0NHQlBjZHJZZDZHQTk4R2FHYUJYK1Z3dTBkemc0V1BmV1c2TzR4NHcv?=
 =?utf-8?B?ZkhXZ05PQ3ZhdWloUUVTc0J3dmhKNExQdHJKVWhTZ3B6OFR1cFhZbEFKbld4?=
 =?utf-8?B?QmRwaEJMeTVBYmRGbmZTaXFEVnk1eU9sQVJ2ZnB5T3VFbE5HZ2Rkd1dITjdq?=
 =?utf-8?B?WTdDd2JhckNDekpTcmVYeUltTWFob1ZOeHp3NG9LQWVrUk5aNFBLVnEvRWls?=
 =?utf-8?B?SE9qQU9VK0YyOFFHL0tsUmpVTVN5em5yaVRSa3ViUUtpc3Z4K3dHbkxPa091?=
 =?utf-8?B?VUlxYlVWVVNsSlRkZEgwcFVPTTRDRzN4NEZhOTVnT09YNmozb216SzlRcmJ6?=
 =?utf-8?B?NjliOU1aanh6M2VuRDFIREtTSWlSOG1xZXdzNEZTUU1kRmJHa1ByR2oxVG1z?=
 =?utf-8?B?bU43Skx3SVRpT2FtMGE2M2NhL2gwS0VUVWdOZWV4cjdUVDJpV3RoWXNHMWdq?=
 =?utf-8?B?ajcxcmtjZ2RRVFJQejJuS2lEYXFFQjNXQnBLS3VWd0daVU5hdmdEKzZwUlpq?=
 =?utf-8?B?cW5Gc2FLM2MzZkFyWTB4NUZjbXFSeDlXeG9ESUZZWG1QT1RSRVdiNlg5Qm5B?=
 =?utf-8?B?M2xhWDB4RG5hVTRPelIzM1Nocmw2NnZXRkg2ZE92YkVwc2gzZmtKUS9JaUU3?=
 =?utf-8?B?RmEvWFE3QWhad00yWnVod1lKNW5QMWpLVlZNajMzUW91ZFU4N1gyZktlNldY?=
 =?utf-8?B?TjNPbWxPc3IwQ1BLTHFpdHlyRThZbVdoMlFrTzEyQWIzaHBUSnRvTHBHNHhj?=
 =?utf-8?B?OUF2WXQ4VHNqTzUvTTNNWlhKWENyRU1OekNlVDhSOFNyQWVyNW93cG50aFd3?=
 =?utf-8?B?aFI0cTQ3LzM2OVFIaDBSb0RHWkE3b09pdGVOeHpVK1o3YnEzZEVVNkNhTTJK?=
 =?utf-8?B?TjlIU2NSYmNMT0tXeFBVditEM0xJMjNhc3hxYjVEZ1RxMHBuTXdvTHJlS1da?=
 =?utf-8?B?c29lTVNJbWpDaEp0WUlMUXJncTcrMmk1OHZqSFI4T3ZOaW9yNnBnRjJTakZS?=
 =?utf-8?B?LzF6dEViMC8wZFIwYVNCVlFmNVlKcy9EZnFqV1lrUUtURzFtM2I3TVdrZDVP?=
 =?utf-8?B?Mjk5QjIwZkJiWkxXWkE1Ujc1a05NOVdQUjAxa3A1MU5idTZiRU55U1YycVJ0?=
 =?utf-8?B?Z1EwelJUM3psS1BKTVVuRldmOUlmOHc4QjNQRHlwbTVOMmRXcmZGS3V4aEth?=
 =?utf-8?B?eVNTcWNrZWRRV3FMSm9IcUs3bmFMcE1BNTd0bEZFSkxROXdQOVJORGpFeGo4?=
 =?utf-8?Q?V6Mklhz5mkD9LMuRqesR8dX98KMKfl9H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3BiU2JXTmlwWExxOVV3OEtVYWlnN0VOaFY2NWwzMFgxbkg2dDdFL3pjU25J?=
 =?utf-8?B?a1lkeVJFQnp2QjZCVmJIdk5zMjd2cG1weWlnN2VXaSs5WC9pY2wzMGdaaUwx?=
 =?utf-8?B?a1lYM0dHeFkycWRrZDlaeXRYQ1Y5bnEzMUlHZXJyVTVuOXErUThVeTFIb0x6?=
 =?utf-8?B?Yy94RlY5MkM0MFhJQXh4VFBEajI4QWtVMm1kb2V6VFJUaVRKeFpCUzBaSERO?=
 =?utf-8?B?em9tOUl0d09EOHUrMFEvaTJhMWw2UThCRThKMTZoMjdXNTRmdEppNDJBa0VE?=
 =?utf-8?B?UHpEQ3o4L1hLSkd1MWNMRkNkUE1vZm9JSGVrUW9haTJKNnRBS1BuaDhTR3Nt?=
 =?utf-8?B?dEZyUG9yUXo2Rkh2d2tOaEM2SUZRQ0h5bU8wajdGUFNBd1lYczdzZGU4RDhR?=
 =?utf-8?B?eTZHejJSeEtkVnZjRm1uSWI1UHc5c0ZKblNEYmlCSXVVcUQvQlpDU28xOHVx?=
 =?utf-8?B?WUY1UnhPMWFzZGFBelhMMlJqRkkvQlBJbGwxbXVNd0doc2ZPcTF0ZkYwUTRr?=
 =?utf-8?B?UG4yWVExalUyaGtud1FLWkt4dWhsdUNJY3BTUXY5ZlR3c3laMWV0Rm9jRWww?=
 =?utf-8?B?TlFNTlZUNUFiQnhDZU1UVnN3YksyNWErMzJsbFR3UkhOcXYweloyb0xLRFpE?=
 =?utf-8?B?VFR5WVpJKzdsd1RnTjUxVWhHMUsxekJpUTIvVlkyaTV3UTNGMGNJMklZRnMx?=
 =?utf-8?B?MHlaUUlhdXZDTWFzc3lHRkFmaWQ2d3ZmSmp4L1JoK293cnJ0bnhYOXJLVVRB?=
 =?utf-8?B?QklmQUNDemIyb1BteWhXNWdweThRZlVza1lFN051SnZpS2lSR0tJOGtjNEpn?=
 =?utf-8?B?QXdQdVNUdTVNS2l4b1JLeWJQUUpQNUtJZjB4WlZGRy9sR043aEsyOFZxWTVY?=
 =?utf-8?B?N3dXZ1hrVUlVZk05QTcyU1QvOTJHUjBiZHJTbGE4ZHJzbHBBQVpJZXVUTHZu?=
 =?utf-8?B?VU9TOG1HTmQreUlFTWU0Q3ZJSDdLSjVEYkgwT012VUNMRUVVN2ZNdDBiVElT?=
 =?utf-8?B?Ujl4VXBaMVdyTnJvTTVVc2pYNFlOdUdtWkliQnNOa2VFcFlVN0wyK1pObmh6?=
 =?utf-8?B?eGtNS0dVU1ErQWtreFRvWXNXMGtncm5zYkRWaWwxelhhMDRUSEVrVDNwOGRZ?=
 =?utf-8?B?ZUlGZDFBV1J4aW5JR1hEQi9POUNMU0JBc1N3VTA3RWx0OGRVWmJsUFBLdmlQ?=
 =?utf-8?B?NjBlU0hXb0NjdVk0K3pOVWo2Z0luekZDSGNqbWZoZk1tb21XaUlyS2pUb3lx?=
 =?utf-8?B?Z24xS2RjOUpjcGFwcXFBbFEyTnlaNVNLYU55OGFhanY2ZjhkbFBtR1RYaFI0?=
 =?utf-8?B?SjRQWUlUSURTRUdDNmxZK2VSY0pmenJIOGVrdVJoZEtRdjVLbFQ4WlBRdzgv?=
 =?utf-8?B?LzBRMzNYWlpUQkZpOEJTT3ZKcUFsTk4wSW1xWUxDalZLUjdpSG1uTzlJa2dP?=
 =?utf-8?B?eUV4VFByc1d0OXRDMU1aa3cySnlHcnlRMmltalcreWhCY0FpYzFGMUFwbDVO?=
 =?utf-8?B?TnNzSTdmS01zZlkrZUY1UkxqWGhmTXc2aUo5Z3Y1eUUvWVIrbU9rRFNJRklE?=
 =?utf-8?B?U3U4ZzNzdlQwcDAxdGk4aUs1eHRKK0RacW9QOUsraFMzZ0NSS3IxRm1CK0JT?=
 =?utf-8?B?VnhjOG5lN0JBbEwveitEUjJrZkNmcEF3d2VUckw2MHA1ZGQ0SmFSZmhsb0FE?=
 =?utf-8?B?UUFQQ3ZNdXdQcGNWa0xrVzdIT0lmTDhVaDVZMFVxV1lxcS9EYlg5cGkzcG1H?=
 =?utf-8?B?MXR1c2p6QnZMQWkyVnd3Y21wdytkMWU1MEtZSXk0dHRkTTZpS0dicXdGNlFj?=
 =?utf-8?B?aGN0cGhad09HUE9vd1hIZnZlY0hnRENuTHZNU0JZOVJ5VG9nUGxaYWtmbjFp?=
 =?utf-8?B?dkVWVkI4UytYOHNsOUFpcXhWWEFKMVJHZEpUdGhVUm9rOVpzQTBPSHdJVzFu?=
 =?utf-8?B?VGZoZkF6VXZBTjVDMDh5NkZ1NHFmcmVtaExJRU1OK0I0VDNkejRtK0U5Slkx?=
 =?utf-8?B?emtJbG81UUhXL1F4VlZJTmttTlJDZVhCdVhWdTZyWHROa01MZ0I1THNaYzFu?=
 =?utf-8?B?dXViOUpIdnFjS3ZWSEtKemNaZE1PZEs1TnlzbEEvZ2dYWGpKbzVNR3VIenF3?=
 =?utf-8?B?RFkydEV6MWgvQUlCSnVnZTVjY2RPVFFzeFpxQi9tcVZaOE1jM2hqcHp4d0xT?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd18a3c-95cc-4f04-f265-08de2862efea
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 18:30:53.2302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjvnw/gqT0M2cmCbUeOB8SRTnTnC1lsfK8W0hvGxE39cAZBlpEPcXRDcfHhoVraemBG6DoGIIU/N/6eIfvgyHptR9VwV45FlPpCsawcz6ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5316

On 20/11/2025 2:27 pm, Jan Beulich wrote:
> On 20.11.2025 14:18, Andrew Cooper wrote:
>> On 20/11/2025 9:06 am, Roger Pau Monne wrote:
>>> The IO-APIC RTEs are unconditionally programmed with physical destination
>>> mode, and hence the field to set in the RTE is always physical_dest.
>>>
>>> Remove the mode parameter from SET_DEST() and take the opportunity to
>>> convert it into a function, there's no need for it to be a macro.
>>>
>>> This is a benign fix, because due to the endianness of x86 the start of the
>>> physical_dest and logical_dest fields on the RTE overlap.
>> RTEs do not have overlapping fields; it's Xen's abstraction of the
>> IO-APIC which is buggy.
> I wouldn't put it this negatively. In the old days, ...
>
>> For starters, Xen's IO_APIC_route_entry still only has a 4-bit
>> physical_dest field which hasn't been true since the Pentium 4 days. 
>> This might explain some of the interrupt bugs we see.
> ... as you mention here, the two fields were distinct (and hence overlapping).

Since when?

Even in the oldest manuals I can find, it's a single field called
destination, and who's contents is interpreted differently depending on
the logical mode bit.

From a hardware point of view, there will either be 4 or 8 bits of
storage, and it will have nothing to do with the lower bits.

> In a number of places we passed "logical" to SET_DEST() as the middle argument,
> thus covering for the too narrow field width of physical_dest. Dropping that
> parameter and always using physical_dest requires that field to be widened,
> though (or else we'll end up chopping off the top 4 bits, as we already do in
> disable_IO_APIC() and unlock_ExtINT_logic() - both benign as long as the CPU
> used always has APIC ID 0, which will at least typically be the case, I think).

Latent or not, it's still in need of fixing.

It looks like the code Xen inherited was added to Linux in e1d919786
(Jan 2008, even then only x86_32) and deleted by d83e94acd957 (August 2008).

It looks like we're 17 years late undoing this...

~Andrew

