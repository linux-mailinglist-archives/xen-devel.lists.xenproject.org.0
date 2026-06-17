Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vhaIOfaIMmqT1gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:45:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 550A16993FC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:45:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=S9SCdvac;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1340320.1601368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoiJ-0005AU-My; Wed, 17 Jun 2026 11:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340320.1601368; Wed, 17 Jun 2026 11:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoiJ-000595-J5; Wed, 17 Jun 2026 11:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1340320;
 Wed, 17 Jun 2026 11:45:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoiI-00058x-EB
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:45:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoiH-00FVNl-HU
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:45:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3288e8-2eae-0a2a0a5409dd-0a2a45099ca0-2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:45:45 +0200
Received: from [52.101.57.51]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3288e7-2497-0a2a45090019-346539339fd6-4
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:45:45 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6615.namprd03.prod.outlook.com (2603:10b6:a03:388::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 11:45:40 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 11:45:40 +0000
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
 b=L3MTbcwH8491u/ghdLBjpo1ZuxwYItauTt80aR7O2tYMQ4tJEV6pgJmRs6GReQ6m9H0ZUNw6/RRLBgnFfJ1WOubBCQOXDzq3gY4VDemJoTTLUczkpYoSbj4dO+XHrmUlLhC6RtDg8NOr/nfhGgmzOzCEtAOzEum5b5eFD7zjqEr1TJbWshVq1AqEXbSVkiwaBGqweXsqEDBtHlk4UB3OJpkVezLiEqRqVodWD1AL+EAi9oZx9iJcvRS10Fl6JaQZTAi9o4EsWaagOHnj6StjtUnU09f4kX8aMcNAmTBS4pak3VRkTPQGAaGvt0Q49I4WF3m/Lto4MMklQqdBL05I/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDfhH4bAKEwdmui17ju4yeJwSls5YX5WpJoqWbmsB7I=;
 b=v9odkOhyiVHvhEYu00Oh1njIpa2RJHqI0MWjIN3E4UnAhWG7/esxOfxDMzHezKnxiDqJftu/+LSY6vB0FPJEEijcAzRT5SXzWyJv1p6OjTBF3m9DXqONHkwvaZ+TwMq4tWYN8oFBZjW/9rop2hyB3sntgAXk6pt+jju40qj6SJsuf8eEhYxglOlXZcVKCyPKIu4se8r19LGkrF9dVOm6HSvHdaXqlLv4sAztGmeXgnJdKGMsP6DA5qRjpIqbPPilmL6nR8Lhs6uLsix+b394lZ2yEZSteTiYQx4sDWL9adp2sJP8WKiELP4A40xeJ+c5bCrHaW0Dub3Ti7PCf+qE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDfhH4bAKEwdmui17ju4yeJwSls5YX5WpJoqWbmsB7I=;
 b=S9SCdvacHCgXZOIDJH+GAfbt2tS0daoSb3u+GLunR8hAAwmLb9NfmXm/Tn9jVP4Ewd8+953hMLXpXvzEQXfCnAy6WrjSugJ/W517rTcdRL7RdOhIk2is0W/vsqdn0/WPeoUNZrsPN5122eonjjSyKQMEBej4a3CFnyJNWs8L0Bw=
Date: Wed, 17 Jun 2026 13:45:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH v2 for-4.22? 5/7] domctl: correct return value of
 XEN_DOMCTL_[gs]etvcpuaffinity
Message-ID: <ajKI4N-z0omDXc4q@macbook.local>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <f223d669-d61f-4110-88aa-e2e71bee1f14@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f223d669-d61f-4110-88aa-e2e71bee1f14@suse.com>
X-ClientProxiedBy: MR1P264CA0100.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::24) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: e58bd0fd-bd20-4e1c-ae1d-08decc65f4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	7qjBZszNBgXKXEevRSK47DmCQ0Xyy6klbkQBTzXUIAWpLgZJMLdchEdf54Qma9PnK/4MuPklteVSbv+KOKZB2bE3BNJ59sIiwPd4Z3i1hpa5c27DyK6iABpzOOBRvopkcI/6r1ydFa6pS9sGaNcxwhPDPsDcWplYkPZD1bqwIfzdziYGwb/8aQwHNNQZaTLX9uCrD4z+BDPZXj/Z8zWhbbcBduodQxn5LezlET5H0YSm7POiAmQn4FRNyFVEio0LWxzlSyK/VL970+FYD8or6xj49fiQ5wo86en7gc+D7qJ74/bydKZEfooLXo4PrN3BdLEaOgMoAX9UmR1X65XfswVy/OdXkie73mhLU1FOh5QGyewZIV88j9ToONhHnE0QHGHFOSrOx894EXBdLwE8X09vgRqgnm5fjFxPnURsHWg0Ph53F5fQSTyHKYmjEGZS5MSsPvXjRFzvUZVAfrjG5wPK6MdBFiB1IGWMgyIpQzfcqfGKWhskufquteLKXHC8Xo2via4rsvYY3NjV6rKX4JAw0Vpu8+DLd8z+NWgZlJSLyuDx3h/2xofezkHTRsgk6Jvcuz8TINhoT7Ox+ksZEzw0sR3l3Ke4moAf16hNgytE+QlYYYXbRmBJjBJf7ahqSlIVUHUJ/12yX8BPlsQESKHDQVg1kQO7/GNgxDcut3beTKjDeBIySz8Jjf6o8b8r
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXpwLzFXaWhEUGs0SGc2VVlwaFI1bENvZWFkdTc4RGVqd0ZtZytpT0dSYVBD?=
 =?utf-8?B?NGQrcld3alA0dk1pUUVlZmI0Q1dMNkRtWDVHV0lhRWw2azlLRDFCdWN6ZzFu?=
 =?utf-8?B?WjdpMXJzaU1YN0tIb0JYQ1ppWHAzbHJJRW9xazhDY3EreHF1QVhkUzh3NzNG?=
 =?utf-8?B?ZG1xN2lmbG5JQkZXMmZlYnBIc1NGNzFJTlQyamNRendrYytFTm9RemdlcTFw?=
 =?utf-8?B?dXRyWE5jS0s5VkZ6MEFkbTB3MHpjZVFQbXJoMkZXREdaWlFlVXFtRWxPVjJH?=
 =?utf-8?B?WkJ4dkxwdXR0dVp3ejAxMmJEOXdQcXgvR2pVSjBzazFOVTBKTE5qZ0htbzc0?=
 =?utf-8?B?U1Vrc1J3dTNwZnVySGVwQVI1R08rV3V2NkF3dW5xaXdRZFBqS2ZyRFRzNVJ2?=
 =?utf-8?B?TWNhTEV4Ri95R2FiazV3NmhlazB6RHVpdnA2Z2g1a1g3dlRxb2lqVytHRm9E?=
 =?utf-8?B?MGFsV1dsN0hrWWtaRjdsQW1kZUxkaVlGKzU0ajRSbkZvbWZKQ2JrQmxHbVk3?=
 =?utf-8?B?NW11YkZveUZBaUNobC8wYjJxdnBpeW0xc0JPS1RMYXFpazNzMVJrNmJvVndF?=
 =?utf-8?B?cjZob3dSeXRPZW9rUjNxcFBTbFB0c3IzSmx1R2NUbFRNdXdTbElLL3VTa2VI?=
 =?utf-8?B?alRid0lYZTJlYXVBUWpGRXdQbHBhRmwzcVlUa1VrSG1iZW5hRGRLVkV6MmZD?=
 =?utf-8?B?Q3RyTGZHc1N3NFNQWk5oVFNBOGU5ZjRpTHJTUDRhNm5TMU94L3R1clNZRFRU?=
 =?utf-8?B?dktGdUdJSHFPT2prMUQrOXp1SmJXOFNtWjdpaGo2LzZrNVkyeTVEaWg0NnhO?=
 =?utf-8?B?dG9ISi90QVR3ckRnUTJRRGJLS21Ub0Z6VTdKcUl5OURzbll5Tm1Vai9BYnFn?=
 =?utf-8?B?Zjc2aEJpOEg4ZXJRRVRWb1lCWkN4NE9vYUhxeThMUnVUanRRK25RQktFd01u?=
 =?utf-8?B?UUFOUlA0SDc3alc4cGJ5TUNwakhZWkpudnpNeThsdXV2M0VuV1V1SDJTbHdk?=
 =?utf-8?B?VkovTlVXSHFScGJtUEw0RDhWamhyVU1ma0NJNlRkb3pVMWF0ckVvMHdZSDAz?=
 =?utf-8?B?c3hKN3lKclFDQlFQY1l4alo1T1hjOEkvWkNwc1Q1eHV6ZzJ1RVlDNDM3YlVX?=
 =?utf-8?B?Um90RVVkb1AwTmFPYXptT1RjcXd0TnZaYW82QWRYYmtJOVJKMGZRQmp4dmg0?=
 =?utf-8?B?NXV0OFQvSm9GbWhEd000V09udndTY3hGZCtPYVIxV29xUW1mT1EwWlhIelgw?=
 =?utf-8?B?eFF1dGw0SHJtdlJ5QmhkZU1kNnZ0R0FwS2RMK1FvMzUwSmllMTV2K2JUZkkr?=
 =?utf-8?B?ZnhRV2VlbFM2WmVPNkhKK0VmZTBTZkgybGdzdkxVOExYQnNJcnBBQUZlQmxJ?=
 =?utf-8?B?aDZyL1E3Mit2ZTlaYU1DWHRQTVNrSWwyVjBOMG5lbnVSU25oVXhzZXlUSHk4?=
 =?utf-8?B?eFFoYzFsb0hJTEZSR3Vud2FOVVRScjZsMmhwTVU5ODlGeHhKV29mZVNWcEFt?=
 =?utf-8?B?RlFsZkZNUnNQQVFwVEMyMUw1WVFpbGdnR0NiMW5HR0ltOWRiVHlMYmN3Vld6?=
 =?utf-8?B?UlV1bkxNcTdFaVpPOHRObHFWUFlab1RKRW1laWlqaVA2TU5CUzRlYlVabEQz?=
 =?utf-8?B?WnZrRTh3Y0gzYlVBb0FOK0xCZ0MzOTJaZFI3cU5zKzVrUkhUWmRac1JCaWNQ?=
 =?utf-8?B?Qzh0d3RwSVdRZGZ3dERob2NuRU80NUdMa3Fwckl3blFYeUYrUVF3RENEM2Iz?=
 =?utf-8?B?WmNaRGc3TmsrTXRka2lkSS9LVzNzWlp3M3FmK3RnYWJ6L1JwWGtiNXRVM2FS?=
 =?utf-8?B?WnJISjdDc2tXWWZzNzRqRjE1ck52U1NiR21VWHlIMGt4dCtSZFFlVEdsZUpE?=
 =?utf-8?B?QjZZQlZHOHQ3aU5IZDZScmpjWEo0blozRWEwN1hkek1tOXVoNjhuL0dJQW9G?=
 =?utf-8?B?TXRZRnJTR0lXTURVSktLL3puS1lXT2praEh3TzFCU3FLMlVZQ2xpUk0yUUxo?=
 =?utf-8?B?aG5kVnVEeWFYRmRzbU9qQ2tlV1hrd0lFekRLNXNmMVM5L3Z4YjhBMlZGVDVO?=
 =?utf-8?B?RHl0cnNmOTRxVjZ4N29OR2RHei8zK2tMQWxBblo1RUc1QnVHbmtFdkZSSjcx?=
 =?utf-8?B?QUJaNEhxbHJuUDNBV3dyK1RIWmxFTU9GU29IT0NZVkRucEltUXlTMjM1RTJW?=
 =?utf-8?B?TDU2NnhIVjd5MWxEbmpYSzIzQXBSeWwxK1ZlVzFLKzVQRk4zb1FPUE5QUFJj?=
 =?utf-8?B?SFhacDF2bWNQemRDQUp0OFlQdmp0ZjhkakVPMU9OT3pkS1BueVFtSVlZSkRD?=
 =?utf-8?B?bUdyWEszMzhVcTVzM0ljTGViZjdldmtBc21rc0tvRzhlVjZIMUEzZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58bd0fd-bd20-4e1c-ae1d-08decc65f4de
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 11:45:40.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p//sJRDtmxslkSZ/MngIGElG5OAnehd4uIPuyAcEo5mDsiBKPBEZQkUvfDOe0wYA8Bz5PxGHNhnuQFieW0DwWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6615
X-purgate-ID: tlsNG-bad1c0/1781696745-89D85A53-BB9FC759/10/73395122804
X-purgate-type: spam
X-purgate-size: 796
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,suse.com,xenproject.org];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,macbook.local:mid];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 550A16993FC

On Wed, Jun 17, 2026 at 11:29:09AM +0200, Jan Beulich wrote:
> cpumask_to_xenctl_bitmap() may return errors. Clearing the error indicator
> of an earlier such call by a (successful) later call is misleading the
> caller. For "set", keep setting soft affinity if the hard affinity copy-
> back fails; only accumulate respective errors.
> 
> While fiddling with return values, also drop a redundant clearing of
> "ret". This eliminates a Misra C:2012 rule 2.2 ("There shall be no dead
> code") violation.
> 
> Fixes: 6e4ecc6d5884 ("sched: DOMCTL_*vcpuaffinity works with hard and soft affinity")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

