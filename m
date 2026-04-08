Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bhy5C+GY1mmTGggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 20:05:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D423BFEED
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 20:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276483.1561944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAXGr-0005as-CH; Wed, 08 Apr 2026 18:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276483.1561944; Wed, 08 Apr 2026 18:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAXGr-0005ZQ-8d; Wed, 08 Apr 2026 18:04:57 +0000
Received: by outflank-mailman (input) for mailman id 1276483;
 Wed, 08 Apr 2026 18:04:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAXGp-0005ZK-QW
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 18:04:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAXGo-006pYq-IE
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 20:04:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d698bc-5cb7-0a2a0a5109dd-0a2a450bb9b0-16
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 20:04:54 +0200
Received: from [40.107.209.23]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d698c4-bca8-0a2a450b0019-286bd1175be7-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 20:04:54 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5878.namprd03.prod.outlook.com (2603:10b6:510:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 18:04:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 18:04:49 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuMxXx/+CDY7dlUT9dMpiUKgqpxOhWzMk2k9/SWTJjTA0VqAX6qjsV0zyKNpJSoFw4icS1aUJYoCFt6XK+rUjGhhP40cCEtzuPYK8Vn/rhA/NULO37gUCyDe2tH1RD7sjrgm16K9hjR7lNXqFUT9PMDUknoKVyzoAj++Lzj2YtpT/3WfheIBibOZoEQwXSYERA48HdvY4cpMOvUvsGh/Z8+KVwgifhD4mzz4ohraRUxnT+VA2Y3tTbwK2X9HIJO8ofQd6zAnDnmjsJqkTgQo5pZihjhAvKZrhXD/6slkrT0WymE13iyn7XHMgAxxs3WpzkiUWEMua+tx/H9TVgGZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11fOth0B8XPCVasLcgdCnme1hOOqNAG0D/6bxLNNwzg=;
 b=JcvxDTQeTC1B2bfl07/SpQoHhrqiPjEkgQUNV7rpALy25LzcLl2gADg5M7ERSl6YU/08QYrc3MOUKu88BIQyNc3dUk9r1Yp3+lTfXsfI7JyvNR8Gxv0faOw623VhOgkwuv0crTgYwO0AxcI/0xFVjwY54XVPGKb9T1C6lpkyETt5Oly7dRTsSw/E+8efdtIIExCaQrurub3JAFHtKlqc+Ic5Q9CCrgsy5rO8yHscNnxx8xUteEeC9+QIL6jYqeJxABvBY9VVcWfRcVut/8VgkpYO01f3rL+Que8e7GdKpD5ZeQgDtPj+aQ+UsQqubUOQZk0VjwNbddn6GsW1fNey9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11fOth0B8XPCVasLcgdCnme1hOOqNAG0D/6bxLNNwzg=;
 b=qPg48auAdI6TrWjyup+PawXWEgHMftNXAh9UvhCA1oJIn+ej7S2eyevCTui+++Lyw6HCfJ97Hoz9Vuta84CTwS/RR5iTGDDr/Saa5B2FMa51PN+gBX7z5hXb6FaUCpx257DxFO/JDgMkTpn9L1Y9cAEEllxoeOAz3vfzWr9hBqQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <99200edd-3a99-4043-88b7-a7f3ee2c7a44@citrix.com>
Date: Wed, 8 Apr 2026 19:04:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v10] x86: use / "support" UDB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <deb26054-ec00-483c-bc18-1edc1b4599b3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <deb26054-ec00-483c-bc18-1edc1b4599b3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0229.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a32de1-fa79-4d16-95b0-08de95995358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JYXwYNrMnNyai5f3yFvb/EGNPd4299I78FIVAUkerbD1Vzmoa3JAjagceOrm2ZwF3IizdsF1yYsPpCrxfJtYtejVZkNkKOXAWKH/ScJmd8puFMZHRfRtWyGqbI3GaSGpp8YOl6auNuU1pPAq/4Ap7xx5QtGdB8ZLQc8VkRd4JwxRjqRKgJn6izKVFe/YyXzqawOlZgJ0Pv+mcPIJVxGtAyOXw0q2M9NVhPeJXXg3RqXSvOQH1IvUNGcANzsl+DzibT9zj4vbD2LbMh7TbOX3xrQflTeYpgfXkPZomSR9+qcbg2W3TgVseqwxYxmyWOzT+kpeoeD6iaiWhmCe115pQ3719YsycFiOoC0bAz7uPBGBM7f/ap+SbSq0J1qmSMOrueO2Q3YaWl4yJHc5uOmmgEQeE1gvyucc0nmSKW1xK5rd1iwoQxRFMVU+iwRYXLJN7WEEIt6gduJmRr7nAzPdrlOQ0OjVLrD20NWHQC/HCBAGsJ9JDReaD9XOnaDaiDIxklvFOMG2e2cBld6grVcR2EOffzXON10uB1yNnbJrtAjCxbTGs50Jdv0S7uVZ7TXxBLl4Ydx5ZfKoTBmsastZPimYIjCRIh+X9pSKMWPZn/QvR5gjKCgevvfc8Pu0bLLpnlYFJJLnMnhRrUU/42NZYQd9aPHHKPQO690j9XMWd0gx5HpMwqo5DyqRuzSDWxGPdW/v7TSBVO5NF/2NAp5ywu7pbTKu91KICBAcPRbQ8Wg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDRZdk14MHdYcFd0SXROaGRUYW12OTRrOFk5QTJSR3o0SUZsUG5jaERPRExK?=
 =?utf-8?B?NEsyWDBDSTNuNXdkZVJWRHd2NHpEalVqOXJGRmFRMFhTYVZybVdkSHVjTW1H?=
 =?utf-8?B?STEwdG5valM5TExUTFZrdFM2a3NnMDNuTHNqSHRjTmp2ajI3cVZwbER6T0tq?=
 =?utf-8?B?TXZqZkFkN2M0dDFaMGJzNFNjZEYwRUpHei9tZ3VNUjhtNWtnZDVuRzVMcWdn?=
 =?utf-8?B?OGNINGk4bEQwQnZzVGxWT3FvdzBucG9DRFZuMjR6cnkvTEQwRGdkaTZhWTZx?=
 =?utf-8?B?YnVpaTVjbityYU1mZmtqRWhDL3FiclNqY2s1MGt2bW04RmVZc0NIQkFIK1hu?=
 =?utf-8?B?RlB6MWRZbDZ4Y0lQMzluZDg2c3VjcEFBK3Vnbi9Fd1RlQ3d6V2F1T0FoSEpO?=
 =?utf-8?B?aHBpN0ltdStrdElEWFA0N29Fb0toUWFISWdENjNjWFUvc1FXQ3c1THZtcHBB?=
 =?utf-8?B?SlFSZ0RHZGZ6UHM2NjBKVmJ0dU9KejVlNUgvQTN3VXk4YllIYXJReWVTeHpu?=
 =?utf-8?B?SVF3THNxQWplTUN5TkJSYTN2R0lvTXR6VVZNVkkybXlDbWhXZ3lXSkJTSEJV?=
 =?utf-8?B?b0p0Ymx6MFhNQkhudVpLSGN1RDQ5Ym1MaTFwUlZsb1E4OVg2MGVEd0JobElH?=
 =?utf-8?B?QVE5Sm9PaTVGb29iSU9YUjFNVW9JdXkvRitld2FwUlRvU3ZaeUlIY09QeW5E?=
 =?utf-8?B?cnZyTjZZY2h5d2g3ZXpDK2dqc0RXSmpoN2t5OGxmTldHZzh6bW5IQ2ZORWN3?=
 =?utf-8?B?OXVySm1rS0lUcmZScWdjWEUySzlLdkduSXY1d2ljUkg5MGFtdUpwSnA5ZTN5?=
 =?utf-8?B?VTVwclFadW91ZWhGTDRpZzkzb0NCYmg1cWhRNnhsSnI1bU53L3F5a29acUtG?=
 =?utf-8?B?WE5wRi9ZQmZjTGkrbXV6alYxUmZMUlR4QTdlY2laSW00dll5ODJRdVZuZmQ3?=
 =?utf-8?B?Vk8wZHR5eWVsVno1WWpDakVaNHFZT0t1NTl6OVorQk5kdGoyZzRrYkZkenZv?=
 =?utf-8?B?TEV0OVdZbVFib1JmdFRHODFYMkwzVW1EK2pIcGlmcEVhRHhsVVk4djJZWlVr?=
 =?utf-8?B?NHdlZzVZTHdmSHVsdUd1LzdBNmltS0FXWjMwMWliSndhLzlLUUx0cVhRcVdW?=
 =?utf-8?B?WDBSZEIrS3pKUElHUGd6M2hya04rMXFoeUIxaXhZQk1PZW0xODl6MlBDb2RO?=
 =?utf-8?B?YW5KRzkyMTN6NjdwS0t4d0pqZGp3QUVnNGdrT1lzaVhkcmFMSUpxSkc1dkFE?=
 =?utf-8?B?UXJRcGJBcVJtZEhvSjVudHBBb3lJWWp0NnkrYk02d1FvSVkvVldpeHVhc3Bn?=
 =?utf-8?B?ZnZpYmN5MUw4NU5tV3hBc09VSEFPVzJvbzk0c3hxQmpiWmVST3hOR0pIVnVI?=
 =?utf-8?B?S3B0L0NTWkpPTjVSQ3NNbTBCeDdRNEtuVnFxOUdHOEpMbXIzdWp2NGFHWXVP?=
 =?utf-8?B?QVNjRmVXVisvYlhkMzgyaEt6SVN1YnZ6MXFiMFR2N0szSkJydWI0b05BbmNQ?=
 =?utf-8?B?ZUZoTjU0cDlQTnNyZFpmNWVRSkhmTzAyZFBCUHlXNmRra0RFVEJyV25zV2tN?=
 =?utf-8?B?QTF4T01ZTCtEU3NMNjMwZjBMSkVqMklTYjhtN3cyUjNpMllsMVFYdnpoSWJH?=
 =?utf-8?B?TEcraE51eCtFVEVwVGFlcXZPaWVIMFZzUHNUcVg3SDd4aEpaSWZFNUFpNzVY?=
 =?utf-8?B?SEpwM24yMTRkdk5nWFl6SkRRVHprL3BkTFJrM3VsK0NqYUVKS044MUloQ21x?=
 =?utf-8?B?SzJYdWJkbUhqMU1OemxORlp2RnJJYlBxenFvUHJsekZUNk1qS0lyTmVjTHM0?=
 =?utf-8?B?Q1U1WXpvZmZRN3REeW1oNndhWitPdVZBcjBCVFl1TDEyY2JqWlBTVlJNQXI5?=
 =?utf-8?B?VXFEVjZTdkxwb1R4SThTekgvY08xd2tTSzB2aGhTSTZzQXZ3a0NsNU5hbUFV?=
 =?utf-8?B?UGM0M3Ewc2h4ZkFpZlNTMGV2M0ZldHBHb2QxWFRkWGIrZGVKbmxmTWhPSDZE?=
 =?utf-8?B?THN1RlIreTVyQkEzS2xLeHJYdENma1NWaG1GT05NQ3dRS1BQOHAxWld4Ync0?=
 =?utf-8?B?bmNlcVVkU0tpZnZ4aWFyQWRnSC9lUk5QTTNjaERCZS95QkZJeFMrSzhwMDVN?=
 =?utf-8?B?aG9CcW9oVERuRk8vSHVsZDJRand5OHFzaDVKMVQvRE5RZXFNVWd2eGdnTDd3?=
 =?utf-8?B?Nld1bWY1M0tqYjF0QS9ETEJWQldDbkhYdm9DUW45Q2J0aENFUFRpanJKYks0?=
 =?utf-8?B?Uk5zUTlqTnNPb0s0bUhLUHRIaW1mamlYM0FrNHhyVkNTTDJUYkd5dWlreEpo?=
 =?utf-8?B?dE9DQU1oNkplK1ArWEFLZnFvUTlzWTczNWw5eDZXMlplZndsM3ZJOFU5TTI5?=
 =?utf-8?Q?dXJS9bbpwriQqG8g=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a32de1-fa79-4d16-95b0-08de95995358
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 18:04:49.5609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQ+scMrzWpCkrZV3HgmRF14T3DYRkzP4+VEtD16oPswreoo+pPsr+E+sIfIyqUQtd4E5vhAcut4JYXOZjZU/fho0UoYAPnlyrmLQ85wAvXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5878
X-purgate-ID: tlsNG-42698a/1775671494-ED7522A1-9E9F1B11/0/0
X-purgate-type: clean
X-purgate-size: 1494
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 56D423BFEED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 1:12 pm, Jan Beulich wrote:
> With opcode D6h now firmly reserved as another #UD-raising one in 64-bit
> mode, use that instead of the two-byte UD2 for bug frame marking.
>
> While there also make a minor adjustment to the emulator.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

For the patch itself, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> One of the table entries in stub_selftest() uses UD1, yet in not quite
> an appropriate way: The 0x90 following it (presumably meant to be a NOP)
> really is a ModR/M byte, requiring a displacement to follow. Wouldn't we
> better adjust that (e.g. using 0xcc instead)?

That looks too much like breakpoint padding as opposed to nop padding.

What about:

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index a9b6c6b904f5..24440ccd03e3 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -157,7 +157,7 @@ int __init cf_check stub_selftest(void)
         union stub_exception_token res;
     } tests[] __initconst = {
 #define endbr64 0xf3, 0x0f, 0x1e, 0xfa
-        { .opc = { endbr64, 0x0f, 0xb9, 0x90 }, /* ud1 */
+        { .opc = { endbr64, 0x0f, 0xb9, 0x00 }, /* ud1 (%rax),%eax */
           .res.fields.trapnr = X86_EXC_UD },
         { .opc = { endbr64, 0x90, 0x02, 0x00 }, /* nop; add (%rax),%al */
           .rax = 0x0123456789abcdef,

which also brings it in line with the adjacent example?

~Andrew

