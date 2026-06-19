Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0CRyC/JMNWqmrwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 16:06:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28F6A6429
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 16:06:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=GGCESWN1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342385.1602596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waZqx-0003yp-3r; Fri, 19 Jun 2026 14:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342385.1602596; Fri, 19 Jun 2026 14:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waZqx-0003w3-0j; Fri, 19 Jun 2026 14:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1342385;
 Fri, 19 Jun 2026 14:05:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1waZqv-0003vw-Jc
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 14:05:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waZqv-005rsY-0E
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 16:05:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a354cb6-bab6-0a2a0a5309dd-0a2a450cbdc2-6
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 16:05:48 +0200
Received: from [52.101.69.100]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <milan_djokic@epam.com>)
 id 6a354cb9-94a4-0a2a450c0019-346545641bb0-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 16:05:46 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by PAWPR03MB9060.eurprd03.prod.outlook.com (2603:10a6:102:33d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 14:05:44 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 14:05:44 +0000
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
 b=T1fkjuzy87T0dsXHU9H9Ooq9U/xB82o4ibxLCit8u+Duap86jedWPTStLzp31GOL1zmn/DebZT1fsQrhagsstxen70PnwEFRW6k4lZMrYfrP9vmEFXa2OcoyxcTz3h6ZPicKVdi44aWTuBFZ8rZGtbfBCORVOJcNh8k4ATidpgNMIy5Hj8/lr8waGHkZ5MquBkKaK2tYYxGKyVHUDdo28hTT20X0A2Z2Vrtx/2guAYZYBwNqoDoL7GsNkYeAArzWk4ed3JGk1oabAm93IbZMW20Ohy8Q4paLEZsalFY/8S61kwAUJ7cMZ4jhG22/8hvwxKM9fje6vUWa0fYGJM61LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyO9NbSllSPz/+oYOq2M5ucmfbI+7gniZCCx8AFoxX0=;
 b=qaJKk9VGRZqxfa0RvxQDL6o4HLoD4w3Zs9G6OK0KjTjDBVO64q0PNXpmNKDy3EsKmVxKluhsWz30BBPp0MS6vrW+dyuaeXUyFXFwGO+cYw6wRVRd+WfNrH0RVRe2PHLvsiEcJpS/jQ/VYcmxwFzn3vZgy4B2HU5Dr5vyg6qeAODfi+wXBDz9V8IqJb9RN5o00EHTE28VLG3Idb78WdhX3rCHj9Ohjeu45PU0vv99AtJ15IwbR1lR3wCbi5je4/Gi1lXTCcOF/N9ke915AZo13Wv00e3oplrxq8whAGKp5ydIiHmIeSfVEzi71y2X5XkDK/9Oxf4Ao07T86M1w6BhqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyO9NbSllSPz/+oYOq2M5ucmfbI+7gniZCCx8AFoxX0=;
 b=GGCESWN1gpT3NcapU6hEHXsNQhw8HbmIuAVU5anY5ErBqxr868fXJPM8ZjAF59xccI3qkrRSxMs8FC9quJ3zeR+QqFCLF2FuwiVftrDdXMXyIt6sQ6tTT0eiEIHhn9fplwjjzFH45u+oMstGv0izok+AFA3MJbLdK1cft6DOw6u4rjdNdu90T+NS1Lny4GsLLvBsqSa6zrQN/3+im/XsMqftvrV+iYhKpskNugy6HYHeLPiOLDJNr8A+XEnmlxubiT95LPSj7jedwY0tUVt1/0fiBLTuBmp4tQckVHcAkE4+dHWE/2V9089eeGcMmWAEGNDukH/AS7mNNhgW+CaZwQ==
Message-ID: <21523aaa-bb8c-4706-81a9-e9060436ad3a@epam.com>
Date: Fri, 19 Jun 2026 16:05:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
 <6e2d0f83-fcb2-41b4-b04f-99c2d3fefcae@xen.org>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <6e2d0f83-fcb2-41b4-b04f-99c2d3fefcae@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:802:2::19) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|PAWPR03MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 0320c8d0-d677-4330-8df3-08dece0bda7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|4133799003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ckEAr40HEIl2LyAejyaS8/XtuSVDab5M9MsSuklmw5+CXD9+VY6Dk53PWvuKgs9DNJT7YCC7tLAkJS70mtMwfB/mWlgrSJOINVUzWDIU4i8z0Ricm1/ycHQxJ2bLdlmurZcfsql8mOrqHtkHyqsMB9UsVkb9bcmfGrtaK+cp+a63QFL7vAUdnRRMk9mfGJ+7UEF/at0HDbtWhM5BnTrgJPlRhvkhvEwx7fKV4VtSmzIFm2BoDBMdYKU79ef+KONayrRKQ5Y4W+JQFdr7dhSzqo/OsfLGXegG+JF8MbWZNbi7HpVE9RH5BxEMY0nUxZ7pXx8cVuVQR/aS3ZYWpFuG1TeLchDkKhbNlolIrQHrBKBxA7nVgOwIOusbQ1QZTL00fZUqhMEkhgLnXbxujxuFYuXseBGprcqmxDJVcBSnWpJ6ZSPov3K3fNPMDVkoJJGwZ31Y6AQjkdFVerw4uewwDLadUPXDR6e1dviIWLMdMHnMPtTbVjnOtbQvR6990wDUb/FSYMoaUsQjJ+i6djjzaMl+MZce1kNmDPMT7fS2ZbB8SymW487N3t6uLs72VQVV/OUxVBIOPgBaNShjICdJUTNsvxh2M8NU7o1Fh0v+9mOYT+EKxamS65t16JNKr8ARxNSOH9dH3cI7iEEgDz2w+DfauMwHZe28fQCy4EsVR6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVd5Uk1XSUJyYjRNOEFCdEZya2Yrb3lHaEVXL1VGT3dEemR4YUJINDdVczZu?=
 =?utf-8?B?cnVIcGkwUkllMTd2VU9iT2VyV0l1cFJ2RjVrR3VVdDBVb1JaRWM2cEFvZmtR?=
 =?utf-8?B?eTdtcUJDRDdsKzN6MUNzMjBKOFVleFkzdFZSelZjSnBLUUJNREkvaTZBcnhz?=
 =?utf-8?B?UkNTbkYxVWFtTlJLdnZTRVhsb2tKSmYvQ1BaRUZKMGZVbHdyNHRBSDkvTVVQ?=
 =?utf-8?B?MnUrVDN4YnYyWXdBazAzRVFBdEl5MzlNbTdlczMrYjQ5cU9kT1dhaXdrVlVy?=
 =?utf-8?B?RU0vSWZ2Y1lKMi9jaVh6bFNvMmRQU3lRWVc0UlJnWVN0NU9ua2JnMUlweWFH?=
 =?utf-8?B?bnZhNUZ3c0hjdE5iVW1uMlJoL1NOMjBXZGJ4dkNSelVQYkNkM1RKeFZrM2l0?=
 =?utf-8?B?bDVUd3pPQUUxZGRzK0NHRkJvc0k2OVFEbTNpQ0dCMkc1VUZSTUhKZXpBUzE1?=
 =?utf-8?B?S0EweXBrelIyUGFORnN5OUZtZE51dGRoVmwyVGU2WHA1QXJLVHN4SWNTWnJ6?=
 =?utf-8?B?SkV0eVB5WStwUHdiSVJMVUpTUGk2MThhV3dpUUtZWFUwdFltQUM4ZXQ3NEow?=
 =?utf-8?B?MDViOXd2TFJqQUtJU0NWckJNTTN1UU12czNBVHZKbmR6a08rV2NFQVdscWpO?=
 =?utf-8?B?UGtOOEQxQkNoMmU1VUNDa3RTZEdnNEx0YUpMRE52ckNPNCs0N2VMYWIyaWFV?=
 =?utf-8?B?MU5OQi9SUXlBV1dOUCtIRFRzM3FjdjZtanFwN2t0enZNVVpjNHV3Q0VCNDdT?=
 =?utf-8?B?cURJL09XeWxvTnBhKzd3Qjhhb0Z0RVUyc0cyM1IrQkFCQnllZWhleHhJTExW?=
 =?utf-8?B?THdRZlQzcGorcDBjcXZhK3B5dHBDaHRURkhmeHc1bzV3eXVISHVBbXJ1STRF?=
 =?utf-8?B?YmNuNXRQWW5TS0U3aGphZmptbGEyZG5Sa3NFdzlvdTd4VXNpUmNwRFhmbmlI?=
 =?utf-8?B?N3BKTGhxMUZLa1pOVmtuRkRCR1Z2Z1lseWl1THRTbEZOb3NUV0VpOW9QWHA2?=
 =?utf-8?B?WXUrQjdWd2hkWFBsOEJXNGt0dGxpQlBUcjhLN3VvblU5b1RxNS9aUWUwR3M3?=
 =?utf-8?B?STR5dGswV3V1WDRaTXNPNmQwUjcxT0hwZFk3TFI2eVJDMjNvRlM1ajVibjE1?=
 =?utf-8?B?TU05ODB5M1I4Zjh3N1VDVW1pU0hmcmR6K25ueTdTenNmWFlpeGFpTXJXL3Qv?=
 =?utf-8?B?djFxNGZ6cGhUMU93YjFDUlNlTkVud1hxOXVzRkZLclVNczY1akRyc0xzWTMr?=
 =?utf-8?B?a1pPckxhbWtjd041TW9RcW4vbER0d3RkU1NHREp0cnMwVTVuS1pLMVRqdmpa?=
 =?utf-8?B?cGVQL0xhRjFyT0ZvaXQrMFE0UURMU1VaaUlDbGl1U2szeEEzamQ0WUdRb0lV?=
 =?utf-8?B?Q1VyNUJpS1ZkeUp6eENweHM0Z3pqN3J6QXJkQnhkeG0wZUpBLys3Mk9JcUJo?=
 =?utf-8?B?MERWYUlRRWdyamZVbDJtK0d5RXQrSWQvNGl4T0lYY2NPNUtZUVllNXN4U0Nk?=
 =?utf-8?B?Tjl0aUJLZC9KaFBHV1VRUGxHeUR5WHNUQzk4aldRbzRmcGtGbG9jbjd6K1p6?=
 =?utf-8?B?WExGUkdCTnlCRy9iOXZLV0J5bXBPRTlVaFRRZitKa2dYOWQzd0w5c2VvWVIv?=
 =?utf-8?B?Q20rSEZVem94MktuR2ZBUjE4Y3FGb202Ri96OUc1QnJ0WmZINlg0N25rKzhn?=
 =?utf-8?B?SW1EOFdmS3k5R2tMSy9kakZXcjZ5d1BoQlZTV2NSbWNjYzF6dCtCNXIvYm8z?=
 =?utf-8?B?bHJKR09uR2dEcVhOMnZDS2F1SDIwUUwvNEFWZGRpYTdseDhJM3ZQWUl4MzNw?=
 =?utf-8?B?ODAvUHJhdTlQUzJxM3U5RUpoQ0ZLdkNPdXI2Y3E4ZFQ1U21mcE9PL3IwR1Vl?=
 =?utf-8?B?ZEduZUVLY2l1OW9mcTl6WGhHc25RUmxFV0FaOHVOelpndithT0xXV09yVkpa?=
 =?utf-8?B?UXd3VWVmZUt3ckVoNnB4bTkrV3hxcVNBT0xkMkYxVDJCckFTSThNUk41TnV2?=
 =?utf-8?B?Yy9PcmNoYXZwa3Y3ajBIUCtDeWxockp3WEg0WUpvbXJJZDdYcnRXQ3N3R2NS?=
 =?utf-8?B?a1k2U2RQSmlvZXVERHZQMVhGWmRPQml3NnpTNWhwZXo4NzQzQ010VURhcy9Q?=
 =?utf-8?B?MHhSQm5IemtNKy83VEovNjU4NGVISWFOWUIzODdKMXVOUFpZZDJMcWJJYTc3?=
 =?utf-8?B?ajAyM0xIL0xLaWlEUHo4SG5tSFYxdHp5Q1NQQk9MNXNrZnJvazRydlFwMEtX?=
 =?utf-8?B?dmI5RWdPVmpNR1dGaUhsU0hYSUlkNTdjZjFkN1QzS3JPWjFtdnRGMmphM2Yv?=
 =?utf-8?B?Y0tWcUwvT0RVRmt4QTRnQ3JXWTRWTU1NZ1RtMENFekxQd3dqZ212QT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0320c8d0-d677-4330-8df3-08dece0bda7a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:05:44.0181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cAYW0e/YQYlxHCV8S3FTTdSUY361LmJFJ5MpH/xGQcLBQ+SBtLJSxv/tDl6Z8CKGGSQM6gBKEk1uDTYZZIGYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9060
X-purgate-ID: tlsNG-d25034/1781877946-535E0ABF-4E08CAAF/0/0
X-purgate-type: clean
X-purgate-size: 889
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B28F6A6429

Hi Julien,

On 6/16/26 22:08, Julien Grall wrote:
> Hi Milan,
> 
> On 23/03/2026 22:51, Milan Djokic wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Xen SMMUv3 driver only supports stage-2 translation. Add support for
>> Stage-1 translation that is required to support nested stage
>> translation.
>>
>> In true nested mode, both s1_cfg and s2_cfg will coexist.
>> Let's remove the union. When nested stage translation is setup, both
>> s1_cfg and s2_cfg are valid.
> 
> I am not entirely sure where to comment. Looking at Linux [1], it seems
> some SMMU variant have errata for the nesting mode. Should we at least
> prevent nested on both variant for now?

Yes, that makes sense. I will do so.
> Cheers,
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0bfbfc526c70606bf0fad302e4821087cbecfaf4
> 

BR,
Milan


