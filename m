Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZSH6EZOEQmrR8wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:43:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7C16DC2F1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:43:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="S1eN8/wA";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347635.1605468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDCY-0007aO-0A; Mon, 29 Jun 2026 14:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347635.1605468; Mon, 29 Jun 2026 14:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDCX-0007Xs-Th; Mon, 29 Jun 2026 14:43:09 +0000
Received: by outflank-mailman (input) for mailman id 1347635;
 Mon, 29 Jun 2026 14:43:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1weDCW-0007Xm-Cd
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:43:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weDCV-000VQT-PJ
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:43:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a428471-e002-0a2a0a5209dd-0a2a4508c254-14
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:43:07 +0200
Received: from [52.101.201.46]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a42847a-edec-0a2a45080019-3465c92e50b0-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:43:07 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5631.namprd03.prod.outlook.com (2603:10b6:a03:28d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:43:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0159.016; Mon, 29 Jun 2026
 14:43:04 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQ73EqPMW246scWixQvJ3XlWP7USygfo19tttzJMSBvbH0+nJ7Y2rCkcAP94S3xO57LUw5wsvfDSD8t06QwV+sk0WVDg5SsJ7xwQ+dZ0KHIYPbpi+yQXQLxbpPLyJvX1DQudQcc0oIrEjvTc+MkhTBF/aKOugDic17CCdDUFS6tj/21Vj2z+gkemPBnRoYWqYFzV20C75CcEN4hjRW2t5DiIAsKQCyxvgFWrb27ajdjqAi+qI4ubWyZTL4AZMiBaLnp0yNtTTwbgSLnDuuaMzGaFuZSmjRp5lsw/CKsO0X9CA4gMv3W4/M1ksg/pxMi2ZSrRaZZdqLbiRex6Tq8yeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQJaLio0uH/dJqhykoZXTQkudsGL9mOnq254CQUvvR0=;
 b=hM+0/81NrdENXj7j3slOfGdce9zje8r1LLQ5Xgml0zVGDeRBqxPj5XH81AKVqMN6vU1q42ZrFVQhaisqWIUe2/d9sbYLY2lTH2oXA7fDPBWCcRqrF0h9Zy53ZVbTrQzIcWKk+0pwcMI5/j0/lGsDHrla5viSnwEueRq4Ftbb5DYG3jviqdHlybDWO275s3z0+yOj3W7J5lVSoKQTy0bViFIsRfP/8F+CoqUyRBLi8Z9tqgTc+zHOl/Vb6/CzabQYDaIyYCBFg+HMCdGyjvzTsbDECxTPTQ2HvaccZIPIvJLw2V5SHcTOt/3qIXgo3hqvgHjIdFJSE54HFjLmOmg+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQJaLio0uH/dJqhykoZXTQkudsGL9mOnq254CQUvvR0=;
 b=S1eN8/wAZmzAuE+1Xi+0BMjC6U3u0lR7RNcFt38wqAVjLNfKRyLTNjm7PJW98LN7s2Ufh9FNpiMlEG2PoA60jmt2MyTSh7VxIcXapJOT1TB0nOq+nF1NI1ksXLUBxI7xxjzCsXPGEeoipzHlQbY/anEMLVRWKiKF2/Hvow48u6A=
Message-ID: <174b2959-d2f5-45ec-a124-d50322de6a41@citrix.com>
Date: Mon, 29 Jun 2026 15:43:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] xmalloc: drop pool list
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cd22dc70-9496-4f18-8476-62d445ff4518@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cd22dc70-9496-4f18-8476-62d445ff4518@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d8a502-3c03-4dc1-185c-08ded5ecb9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	46jm723APikDDtw65NAvzRWMYaFGXFwS+HBoxegUlWf5dF8V8wbkkqZ99Nf81gDpmSqB2YLkirDQ9ISVvHbwh7Yk2EDjcBdX2qtlvCdF+KSu/Q3XjhRRU2SdPTDYO9lBcxznJ0WSP+bvAC/hRHn7/gKhKPpl+BElxeuOY7dapRcyxJG36rrSlHLKixWCsiufMQYrd25LYHoOpAC3ysFJOOXlgZ0wF2ehZ4tKFXybWeHbfyGXFOGu0uK86NN1Ua0CzOoSj+MMepszxGcI7AKzFPV/BvWeyBKKWwn57zRoEmnIHZRJEob4hj0hQEt3KJ/+OSw30jlZ3oE3aSdKVOOx8FC2wnAYqHr5TqskiFXhmXeSVjCxkAoDi8+gviKbdgaYSYFyAgBX+tESLnpilh+yyUWlLBTYIzT6RPcCjAdNSc6XE2fzumU0VAs4NInVTbkg8mmdwDw4p2HOvihPQ6ZMhdIkEMe+Be6E2sgAJZKb97Cfbh/gWj+XjZzSno2PDqC52IVviNsLo1g7jjM/B2+lv/jIwQvOVl0AL3UFIEcFZXVfNkXwpK8PQXs0LXVgK7k6xWJbFcJaeXETtQtb3q0c1zilTMfPJsCdmzneLA0iLS4I7Sy9b8KYnDHDO2PtP2n8MOlj+3f9vqY5NF8v6drpgLpQ+u7YdC+BxTnwvwE0Ie4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3lzL2FlQTJqZGpBeHY0Y1g1NGhEeTVLcXJRcndpeTR2NWJKS0NXV1Q3dlNq?=
 =?utf-8?B?c1JheXlDQ2tJMHJ5QW05emNKWTEvQ1hMU1FDVXJyK3AxVjBxdGxtRndMT0Fq?=
 =?utf-8?B?Y3BOOEZRN2UwUnpVZlBGODhDd082SHlUTHo1WFF5RUxicnhIZWRnNTRGUFRu?=
 =?utf-8?B?aElPaEx6Rzdna3cydXFWL3VjUlU0US82Y1Q0dkVoZEQ0RDdZRDBYaktSdFJp?=
 =?utf-8?B?SUVVR1JxUWpiNWlzcjNkbjdlYW56TGFQdkZFak8xSGhsdzF4UTdkWFAwN3JF?=
 =?utf-8?B?Ylg5U1Q4Y3cvelh6V1BvRGsra3c5eEt4ZVUzYXI5YS9XcUVvMGlnbHVxUTYv?=
 =?utf-8?B?bGxoRzAyM3FTNUFkU3lVZnVMM3pGYXJXcWdmTE1GcTk2Y3lCelN3RDJqdkNK?=
 =?utf-8?B?NXFMMWRRK3VoQ2I5VG03WFNXY0c2Vk15ZkxqUjBYTEpDMnZTdnRqV0llVUd5?=
 =?utf-8?B?cGdieVpTUnFJdCsrSi9XdTA0U25wcnFMSEUwa1UvcTB6SmxBbFVlY0xPcE5t?=
 =?utf-8?B?dDlJOEhyTG5LWnR5SWJ2dmhNVE9vUFhCbnB4WTRNSjA1bzNMZmxMQm1uTEY0?=
 =?utf-8?B?dFFsVkpIUklrSTUrMFpkeGtIdHJYNVgxT1FydlFTYlp5UWhOd3FNZEorUVN6?=
 =?utf-8?B?dkJSRzA0dzZjWkl1TUdkU1gzUjRyelFRalhrVERUWU9DeTRUMXhlb2M3aEk3?=
 =?utf-8?B?OVFHNEZURy82UnZjY2JzWU9xRC9icnZFZzNwL0dRMWx3K3l6djZ2clRHSmMy?=
 =?utf-8?B?NEdmUjlpWU81RDA4NmlPc0U2ZWpDclZTQVc0OUQ1THpOMGZBSUJKR1NYWGJh?=
 =?utf-8?B?bWhaM2N0Zzd6ZzI3Q0wwU05sT3VVUjk4T3d0b1gyb0ZLUVhtNE81N2cxU00x?=
 =?utf-8?B?NXJrL0VVNkJIQkFidTdRcUdPQ2JOVUVHNHYzOUVBenM5cEUveXpNOXVyZEVr?=
 =?utf-8?B?ZHBEWVBkSUFITUdYWUN1NWVnQ0J5RnNoWUtuNmtFa0pteXYraTV2YlpaWjU0?=
 =?utf-8?B?VGx6NndpODZLRHFlajZPV2luTFB0VTdiZmdjWThaNmVzNVVvN0ZnV3FUSVB1?=
 =?utf-8?B?ZFJYZ0FtdW9kYWVTR3IvMHRpNWtKdG11UnA3ZkwvZWovSEFzWk5tZStIdlhw?=
 =?utf-8?B?cVFHUzJyZktDdktXRUhXenVGZFhhZW5BRkJnTlprUUpnWFU1ZHQ3Y2M0L1pK?=
 =?utf-8?B?bnZiR0RZcTVtS1NiVWI0TDNrUTFkM0UyRGhDSnRLSk1acTJOdlBtdzg4VnZM?=
 =?utf-8?B?YjZZS212bFlnb0VsVTc5Q3F3N2VzdnprdUFpTE9ZY0JtR2xKanZkOGhVTVU5?=
 =?utf-8?B?SnBoeExlMEloUk90azFrQ0U4eE1DRTlCZllKSEdibU1BemdYcDFqcHA3eHNX?=
 =?utf-8?B?OHRkMG5sUThqUkhROXZQbysxVGYwRTVRYjhvYWt5bVJRN2plM2NjdWFsWkZM?=
 =?utf-8?B?K3hBdS9IeGd2ZUw2VDA1eEQ1cTJONTZqcGdZWXBzbWNjdVdKSkRxZU1WOXBN?=
 =?utf-8?B?VXRobFFkVTBTdjR1dzFndUxnNExtTnNUbnpCcW5VZTFkT3Vqamcrd0NGYWR2?=
 =?utf-8?B?TGNIL0xabUQwVzlGRFVpeGRCdDJwcjBuUjFtQlpVQTAyYnlibTBHLy9JRDlU?=
 =?utf-8?B?Y3NiekNMSzB6NlNiNkRnTXZMQW1Uay9PR2MyWHo2VjFOZ3FSdDhGaThBRE1l?=
 =?utf-8?B?aFZ0Q3Z3V0drWG9wVVhVaTdCSDJwVFQwNmpDazZLRnFUWm5nZzloZU0wQVNI?=
 =?utf-8?B?S2xENmJUU0JTd0NXcWtxWTB0K055Ynk5dmNWbTZoajZPY3hCRzNyMFNsbEUz?=
 =?utf-8?B?VmdXUUJwd3B6YktZSnJUTU5HdmVnWmc0WGVaRS9EWklRNnQ0Zi9pMlRoMnE5?=
 =?utf-8?B?TnQxa2FwbTBuTjArbWhzZEsrMnVzTlJWQWlkcE8zbzg1S3NjUFFHbkRxY0pK?=
 =?utf-8?B?NDVFck1zU2g0WVhXanlNblc1bzltaStjNFhIek94L3VIVlJuZ1ZSZSt1Vzdk?=
 =?utf-8?B?TENvaFhYaGRNYnV5OFZHUDFPdXpuMFJtS040UDFjYU1ldlVHRG4wRGpSQzFi?=
 =?utf-8?B?dFRCSUlJYTFHV1pLTDR5T1pRcjZwTFJzNEpXcWY1Y2lBMFJ1b2dTbm9OdUJO?=
 =?utf-8?B?L0RBckthS3FqOVZyQlZhQlBGVlZyNDM3V0I4Wm5XVW5RWGUrMTVhS3BTRHpn?=
 =?utf-8?B?V3VZUlJZMnVmRkdhNXdWa1FpODFqSG1zdnRhdm1PR2ljUVB5bm5iUFI5TXYx?=
 =?utf-8?B?Ykh1YVpqRmJyUDFnSTBoRnFkckpHdUtwVDhFYXduL0FjNmJKTVR5RU9NQU5J?=
 =?utf-8?B?TUpFNXYybisvekY0SFZuZFJVbDA4bk94bHFLV2QyTmdIVHp2bG9SZnlLZ3NZ?=
 =?utf-8?Q?T6OoTkirKFuQlB5g=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d8a502-3c03-4dc1-185c-08ded5ecb9d7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:43:04.1277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BV7GioVqkJIYgpjOYvhY6wRJUgCSbwCvOvq08LHoYIatWZMgX6Y25ZD3uJrHNvdiSC60SRezqojZgoV27xrKEGWW/FRbYgjwJOcHD3yrp9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5631
X-purgate-ID: tlsNG-c1860d/1782744187-40D2B3FC-F143952E/0/0
X-purgate-type: clean
X-purgate-size: 314
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E7C16DC2F1

On 29/06/2026 3:06 pm, Jan Beulich wrote:
> From its introduction it has been used solely to add and remove pools.
> No list traversal or alike did ever occur. Drop all of this as being dead
> code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

