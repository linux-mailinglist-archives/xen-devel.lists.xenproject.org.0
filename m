Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK13JABQDGrwegUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:56:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC94457E239
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312899.1583089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJ3s-0004fN-Al; Tue, 19 May 2026 11:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312899.1583089; Tue, 19 May 2026 11:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJ3s-0004dU-7p; Tue, 19 May 2026 11:56:36 +0000
Received: by outflank-mailman (input) for mailman id 1312899;
 Tue, 19 May 2026 11:56:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPJ3q-0004dO-JO
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:56:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPJ3p-00DNR5-VE
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:56:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c4fe9-bab6-0a2a0a5309dd-0a2a450adbce-10
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:56:33 +0200
Received: from [40.93.196.56]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c4ff0-56b3-0a2a450a0019-285dc438ad99-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:56:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB7226.namprd03.prod.outlook.com (2603:10b6:8:124::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 11:56:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 11:56:28 +0000
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
 b=PRbc/wPSkizHK6R24qw4OAtxdZIw5IxgbMMaoPqlM41QXxQdnbC4I9y90+YpT5AhIu1emsJhK59XkxVfD/xOaEQVC2ApcMzKLCG6uG+Pp6CAEsLfoOo83cn6OldSx5dpzugXPRohPYllfepoqiQiwAVbji9eqe+g6kbBjO93ev3TNXX/Wm1wxEehVm8S2h+Ehx6s8AWcd8EgbjswLvWYvL2rkNLl6rgsOfxyZfCWNvld3RwL5xHikmX+ov90lapxEwcUXWXQn47xYQMfMtyoaSEjL1A1hEhTp/21QArw1lG0Mpu/G9MDYJPWxGmR+uiRoMYwj+o6IEDYvwaCqNgirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeE9dFe5BBB4UzHloRoWnzthEkXsiMtoih1bviroqss=;
 b=fQo40KcszCW5yOOKCxY/6tiAjnACw7XcePQuM7svvsfUuGNZ+q0TfiwsXYjXd7b5OG699fZzvvputSbO5VQRXMSiOwEkdGE8EBW1p1ZFBFyPN4p7VPkpJAfz3gp9C8SIR0L8WKIo9Of1rdJuFcz2JveoFK9n2RgEdANgwlqtKbGXov7WO+heUln6FaOFSs/YQ9hwB1RUIOBakki8/f6EzpyvL0gluQW+6wTEKoHSQSlFTGYAPNixp/s3J2z7KAyeE2kDp7/7szzLmldeoVXekut9as3mBpc+sWyA7rAvaQTF7apds1wlLvR3zsZWIWGlAklPvT5IO8fdlN5nwYgXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeE9dFe5BBB4UzHloRoWnzthEkXsiMtoih1bviroqss=;
 b=orlLRS6v5Mhm0faljr11SuSmVtsL2KPxm8dLrQG733zGdVHyP5Gh38BzxLDVNwkFapTffVdHmgDpW7fGNCRekY/JyDOeAT4c62nuFcXo0dzSU88/yCWYpHu0f184QPnhxCCu8+RbnL3QePl2GOQ6LSptH5k53owyMm8q4Bo4Zqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f5cd7d50-e274-4a8c-a535-8c0f47cec137@citrix.com>
Date: Tue, 19 May 2026 12:56:24 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in
 vcpu_info_reset()
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <09ae75638f9e7991163ed3633e7a60461d93da70.1779179301.git.oleksii.kurochko@gmail.com>
 <2be07ba3-879b-4c79-8103-b4951ab4cf53@suse.com>
 <bedfec37-4c74-40dc-904e-b80e33461be7@gmail.com>
 <e77cb8b3-35ce-4fc1-b98c-d4e889502acf@gmail.com>
 <e65d9be5-f788-42d1-9117-eef70303a1a4@citrix.com>
 <ee441369-cc67-4ec1-84f9-4619ce645da1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ee441369-cc67-4ec1-84f9-4619ce645da1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0331.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: 46663bd0-19de-429d-56f3-08deb59da901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799006|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m9VSgp7WYjo3gHw01UD1xNTAl3deJQw9TE5NQDjWLPIAGNwdeWXdPKwGHuj2VYmiPEeQfO40TUeZFIi8scGQ/sC3iz7YWT/Y8N7VmQARZ1/Wfwi0VTagRJ1LjIGhsY2EbsK9PmUKnd9ZEpl8f8lulU06cqptgIV1goNO7U9jJtaULMBxrL3nZbuHgLecFarQ75+exz//vUkMMl79tIYZTPUoeOhMP2s3RVR40ON/zzP3TwAaRgJ0NuLk7utAe8J/IJj2Ej+NtNeyiJx7ry6RNXHhQUHMXKfzIX9vHyl+4wXDJ1Xk8Me1N/79qr3Wm37pmIjOBW8r/lH91HP6xRKQt9EJSgIHdT5uIOQ+nPuf71ATUYnPiU/d6JXWe7s2L4K9H1ghvbWPPBNTWFq3RJOigDtFTLeH+5GZTjVPQ/UKEop4MQScv84zHtCXzjyheBkyLqFAjMs2TF3H18YsKfw+HJKGFL6LAX1n2ya4bvCxZpI6F7NTdSDs7/xVs8C9EWVqhO2KRUQ8/wl2fAeMp6/n4BIGXjzKPouM01xkN1U9JQvCIGVrOR5vddUqm0DhXr0HE8WaFc7LiNHfUUzHPchm/a3QZY859C+1Eawd6JUwv5xNkfg2QQMrCK7I12Ixbozxx1Q4kN8AFORt5Vr+bA7neM5k/U63TaPY6wAmdwIqP2dogCHMQKj0NpghWIn6fOKE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWxGb1owNjJtRm1hUEQrTnZSekFvaFhUSVNwZW9xVG1ldklrb05YTU50MmpT?=
 =?utf-8?B?RHR4VDVIa3cra2t3RGVzT05xT3ZKd0JQbExCTWk2a3NvbVpYRks4YnpiWmwx?=
 =?utf-8?B?bnRPTnB0SHJRb25BdWkxMnMzWHFkQWkwNWUrQ2lBU2hrKzFudmNVNHVqczZU?=
 =?utf-8?B?L3pnU1Y0UXE1UkNONTBOQ3ljeE5teE01M0dKd1cyM29LcC9UdUNWOVhVdHpK?=
 =?utf-8?B?Zy9xcDVLbGljVVRsbjMvOThvQUhFK0R6Z3BoMG5TWkdiWTBtOTJaU3NTNlJv?=
 =?utf-8?B?VWM2N0paYktwZFgxVHVlSGlPb0ZLOHk4aU15RzlTZjRwWGIzdm8wbmoya0lj?=
 =?utf-8?B?UHdVYm9hUmlNd2pRZkFRdW9KaEpyL1p2bzg1TkxhMVRCNHVvcE1mYzFGVGRX?=
 =?utf-8?B?TkJXOHZkM2g4LzYxbktpRHpWZ2FVaitVOTNLeWdFQ09EOUNjN0FWTzB4UTl6?=
 =?utf-8?B?NXkyQ2hkMlV5cnJvbmNGT2pwaFJWR1NtS21zSG9hK2dMRDN6ajQ1dlZQa1lq?=
 =?utf-8?B?Unl6eklTTXZ4YjJiMDAxSC93eUtCR0F1d3h5dmkvSUxiK3p1RnBuK0JWbHl1?=
 =?utf-8?B?WnNjTXJ2SnpON0NjUDVLUXlrOWdYd21xR24xdzFpTVplVGllckpKUEMwNm80?=
 =?utf-8?B?U1VrbHZ5SS9ZR3AxTHg3dFNhRVFHdjlTUXozL3lTTWxiN1JKbjNlWU1Jd3R3?=
 =?utf-8?B?MUV1L0lLUmNNV1BSTHBMN3dsR0Zmbkd0ZGxmenhYMGdUSlAvR3B1L3BMUitl?=
 =?utf-8?B?QldpUEVBeXNLaHBKTkliYmtiU25STnFzOFZRUFUyRjZyTlQvd2p4cUp1MS8z?=
 =?utf-8?B?SXk1ODRFcEpxSXp0UEZWMGlkS0UybFpmbTl5QXJ4VnNRRTBuc0NIQVo3eFBs?=
 =?utf-8?B?R0VocGR4OG1jTENETmI5WjNHSmYrdGdnRXVJai9RbFJUTFRIY0pOcnRGU01C?=
 =?utf-8?B?UE8wVm16cE0raWQvR1F5ajd5aWd1R2ZtdXBMWWJXQ0tRa2xCa3JaUjNRZ0Zi?=
 =?utf-8?B?R0QzdTl2R2hHNEkzUkpCK2lSdVR3amhvRFdjdTgvN2NLcldDYU5CTExFbjNU?=
 =?utf-8?B?REt6c0hoZDJRMDR5SGUwTDBHY2I3WldhNlJxSlZwVDR5eVhlWEdoUjJwNW9j?=
 =?utf-8?B?eUVIcVZaNzBTWWUzZlQ3R2NVeG1oLzBkRFN3cVZGR2o2V3k0OURDOEQ1MXlu?=
 =?utf-8?B?UDNGZERxazMxODRDb0xPMVFpNUJ3L0dhTVA0NmVYK1YvQTZ5SUlnWjhCaTNu?=
 =?utf-8?B?RHB2SnpscWlqS0NkcEVPSExjMzE4UXVLTHpZWUNkVXF3OHdJSXY0UTZQYXhu?=
 =?utf-8?B?N285eUZZdUl6M0dnNUMya0YvZ1ZMZU5zRFNrUzMraTcyOFRIbkdvdnNyRjFQ?=
 =?utf-8?B?czNYUUFmWTN5TTM2S3loTk1vbnBPVFZERnJLK2svbVpuTjNTQndGR21naHEr?=
 =?utf-8?B?WWc5Yk9hUytBZm1LNlNMVzFmQ0NWUW4xV1puM0JadDdaV1BJWnFOYVgvRVFu?=
 =?utf-8?B?WUluSXR6eUdxNkQ2R3JVWllwTStkbGFFZlFMQmdTWTFjVCt3R0locG45QlVl?=
 =?utf-8?B?QlRocmlVU3pLQXZKbk9NRjBxWFNtVFdRTU1jelNUKzBadjhLWmJkYkYycFZR?=
 =?utf-8?B?TUxZVXJtdE1zK2RqUWNhZ2dnMDBobWpqQ0Fja09BWWZKVXVUZSs5c3l4c2F0?=
 =?utf-8?B?bDlFenBRSGUxbTJCaWdqRkc2WHU0YmV0c2pUYWdjNlNwQWY2dEFTbTRpWkRQ?=
 =?utf-8?B?b1oxZmY2M1M1bUI3VzFaRXpCZm55U1NFQmNsTWphaGtzWGhFOHpsdDIxR08r?=
 =?utf-8?B?MVpVeG0rejg3LzZhTm4wQlEyQ0NRSUpLdFA5SW9hU3JFVWdjdVFTYW15Y0xR?=
 =?utf-8?B?eGFVY3VEa2I0K2hrL3M0bFpqNWs0a1NnQ0dwd1NJRDRSUUVQOFZZdTl2YW1O?=
 =?utf-8?B?eTBDc01aVHZnd0E1Q3kzcTl1OVBzKzgvSjllTHJjMzN4emREMVFldVVSUEQx?=
 =?utf-8?B?RysrbmloMkxhYm5LcGNOVXRjMUJIN0hoU2FSMUtRSS96YnEvMTZDZUpFTjIr?=
 =?utf-8?B?MEVaUVd4KytHZFdiTTZ0RmJPaVg5S3ZocFd0eUtieDRsMmRZUkcrejZXM0VW?=
 =?utf-8?B?akJZMjhLOVZ3dzNvUE9pT01MM1M4NW4vS1p1QTZSUXB1UE04QnI5Y29Ra3N0?=
 =?utf-8?B?WW1KWHQrbXNzS1dwSnlIVHJ0K0wwb2ZrdHdYRWhFNHpUakFZbjhLajFtcHdz?=
 =?utf-8?B?RHozbnVlbGFudjFxam00VGkvcjFPK1NIdkdTbkRHVlV5c09vNWhrVzd3TDBD?=
 =?utf-8?B?K1drSjl4QWNpY3lKVVVSRzM5dDU3ckRNL2lQNGp4R29lcmxKWE56UnBuN2RF?=
 =?utf-8?Q?z8aZ9FOGvyRj1CjI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46663bd0-19de-429d-56f3-08deb59da901
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:56:28.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vfzfea69lGWvHD3Pwc6PBEsu7fwQIVvQe+XYA3NGIPLljpDectQiF9Pqb1EdVCx6ReHuJhmVzu5kOrv5utIGhhFjM7Hz2FKCnLf0s4IWJcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7226
X-purgate-ID: tlsNG-4011c0/1779191793-7E38D8B7-F213DE5F/10/73395122804
X-purgate-type: spam
X-purgate-size: 3462
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:baptiste.le-duc@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CC94457E239
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 12:51 pm, Jan Beulich wrote:
> On 19.05.2026 13:32, Andrew Cooper wrote:
>> On 19/05/2026 12:22 pm, Oleksii Kurochko wrote:
>>> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot
>>>>>> inside
>>>>>> the domain's shared_info page for vcpus with id <
>>>>>> XEN_LEGACY_MAX_VCPUS,
>>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>>>
>>>>>> However, it does not guard against d->shared_info being NULL.  The
>>>>>> shared_info() macro expands to a member access through d->shared_info,
>>>>>> so when an architecture does not allocate a shared_info page the
>>>>>> dereference triggers UBSAN:
>>>>>>    UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>>    member access within null pointer of type 'struct shared_info_t'
>>>>>>
>>>>>> Extend the existing fallback condition to also cover the case where no
>>>>>> shared_info page has been allocated, mapping the vcpu to
>>>>>> dummy_vcpu_info
>>>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>>>
>>>>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>>>> I question this, largely (but not only) because I also ...
>>>>>
>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>>>> ---
>>>>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>>>> d->shared_info remains NULL throughout domain lifetime.
>>>>> ... question this mode of operation. Yes, you may (for now) be able
>>>>> to get
>>>>> away without, but e.g. event channels will want supporting at some
>>>>> point.
>>>>> Which will require a shared info page. Better put that in place
>>>>> right away,
>>>>> even if the guests you test with don't use it (yet). Certain other
>>>>> common
>>>>> code also assumes d->shared_info to never be NULL for an alive domain.
>>>>>
>>>> Would it be fine than to allocate it in arch_domain_create() ... :
>>>>
>>>>      if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>>          goto fail;
>>>>
>>>>      clear_page(d->shared_info);
>>>>
>>>> ... but without calling share_xen_page_with_guest() after that
>>>> allocation as share_xen_page_with_guest() isn't implemented at the
>>>> moment?
>>> Or could it be an option for all arch-s move allocation of
>>> d->shared_info to domain_create() in common just after
>>> arch_domain_create()?
>>>
>>> The only question if share_xen_page_with_guest() could be ifdef-ed
>>> somehow so not to block new ports to implement it from the start.
>> shared_info is an x86-PV-ism which escaped into HVM and then infected
>> ARM too.
>>
>> Sadly it's ABI there, but this is one of many areas where I really want
>> RISC-V not to inherit the mistakes of prior ports.
> In which case, how do you propose e.g. event channels to be handled in
> whatever is going to be the alternative?

Implement proper enumeration of virtual capabilities (to be retrofitted
to x86/ARM too), and only offer the FIFO ABI (which is superior in every
way to the 2L ABI).

~Andrew

