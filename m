Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y6lCJGVsT2r1gQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:39:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EEA72F0C4
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:39:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=FG2Z4mtB;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357734.1612079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlEG-0002Fv-WB; Thu, 09 Jul 2026 09:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357734.1612079; Thu, 09 Jul 2026 09:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlEG-0002Dp-Sr; Thu, 09 Jul 2026 09:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1357734;
 Thu, 09 Jul 2026 09:39:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1whlEF-0002Dj-Cg
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:39:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlEE-00BOW2-P2
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:39:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f6c54-2eae-0a2a0a5409dd-0a2a450bcbca-12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:39:34 +0200
Received: from [52.101.66.130]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f6c56-ac48-0a2a450b0019-34654282244e-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:39:34 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GV2PR03MB8512.eurprd03.prod.outlook.com (2603:10a6:150:a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 09:39:30 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 09:39:30 +0000
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
 b=SH/R+kinjJZIPpSTruAENdNgKt8o0IkxRnyqXz62MkdwR4tsMXEjd4OogYcq75Dx/1yILPHTsKxrvB2Wb4fDfgHrdjfzBw7Gu+0FW4ei29wf5kwSdm8EoOc73lRYuRjH8qaK1eqvTp9r84CZAYyBQNCXZIVNqZUIQPu6s0GhcSJCQYF1X7tD2nKlqiFfc7TohgkOy6T4lPhayjCfHt22fjD0BVf8ABiwins6Ek3pXqwh8RDP0fpdQhsxfonDCB1GEsfb1O06/FgoD0R6TyN2qrhTIPROTlPjiop3rT1UDa4ukjMg1zLIO+v4EiFpH8zr0Fhxr3vHLOneE+mYI3njbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3i0sTs9yITyUzvVUWXlc805miIzL0cqsYbV1HmqOno=;
 b=vEPy/42yye1nhXvdHWpTyczIGdDgFPzzm3tNoEtbBtVGUHFTBhokJ9NXEAzDHs1iKxmLsRl4e2t5RnuJGRThkeGed1G+AHqEM4736ktJxLfrSux4TYPd2mFOt4Yl4qaZ4nZ3CINB56BRVMXOQUi7SJUkzWLGzDT7LARxNCkt9Nkvd2/wQC0eZnYLUAKyiWbrOiCheHE+rFT+W976mXXHcoTmen/EoYtshG9Z5MN8bOXwinH0nTwDQc1JMcZZx5Vb6bssKnm4CyXvWhcKLDp/n3MonwEp0eE64n6Qb/9PRkGZ73cLTQ63p6vRrbjg3o+v4f/0MpgZdPiBa35YUOWPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3i0sTs9yITyUzvVUWXlc805miIzL0cqsYbV1HmqOno=;
 b=FG2Z4mtBAC9+LssfjgBI5chOLy8jhmQ1FnzaULC/fGS77Uac0CkbwSvj9NrDBNn3jyJjmQ4jB2ZfcLcIyB+nSLm7wKBtvSMnPnSx89aRahVIRxlR468AU+IsNuLOQtAs8TVArimnTk4MY4W1fR2yaBvQkIRUYEytqDgFHprB0d2ZOe4mPI1dZoV+csGoD+7wN+N2ZuzwBJ++LrGVUNyK06ZlPzjbF46WRM4F+NnIBcV043SUIaUzrcRNiDlww9GsydXFSZcTv/4iqEW9I4o3rvNJkhC3UqiPbBOH+yFYKcFzSobx2Rst++v6VWgshFmPrWbKOVqeKc1WSKJMRapFvw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH for-4.22] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index:
 AQHdDiOX7r4PlObs6ESPVB8UpORls7ZiOVkAgADswwCAALVbAIAA6KUAgAAPK4CAAB4gAA==
Date: Thu, 9 Jul 2026 09:39:30 +0000
Message-ID: <2dce4d90-4a3c-41f9-96a9-d8aec9f95409@epam.com>
References:
 <cce2493855ce3b610a2d36cbcd149292254170aa.1783436517.git.dmytro_prokopchuk1@epam.com>
 <e494980c-485e-4dc6-ba84-e40fd53442d6@gmail.com>
 <21ec0511-bf7e-44fa-b6f6-99d9c4085eda@suse.com>
 <c8769518-3f84-4c73-920d-975b7efaaf92@epam.com>
 <ec7bc0ef-e267-4240-ad73-13dd17e1575b@suse.com>
 <1991978f-3d3e-4d23-8583-047ef9797d65@amd.com>
In-Reply-To: <1991978f-3d3e-4d23-8583-047ef9797d65@amd.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GV2PR03MB8512:EE_
x-ms-office365-filtering-correlation-id: a19db578-455c-49b7-6de2-08dedd9df9f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|42112799006|1800799024|38070700021|22082099003|18002099003|4143699003|56012099006|11063799006|5023799004;
x-microsoft-antispam-message-info:
 cHr7J5pgy0e5dOUkQSWBT+Z2qdLSHIOFC+JF1D8LH/6EuKImpxAljCJlaD3bD0lt3z4ucfIYn4R9P+XxhfoPMwC1u7+WrxGQS5msiOc6V3ieazQa6XUYfu2MX9MF3SyFSOWqYXBrSHTDiC5RzjXBgR1lKJQyCSmqF4PBgo9JIEC9/zS/dguSM0rcgkTElsr+BeovFjswi2dMf+GZRqOiaOOuKi0ztRKmj0QPGvf85aoKGxdQLM/FHeBXHDlSRlf1jRxP1NUUKD3tpBQrciYBg67TkB8bfQn1rEAObrpWiGUpEbUwxN8Ywo12tKC487+rMzfeWganbr8FGgcXwugRb60pYqbXATlvq/q/szFBqMxL6eTcSFRTMulinz4c8gzLRNP7T930yYZAUfZoSoYY+s9lyhwjmo+AY40A2acV+MLXYVcJ0JTgtHqtDKcJJVWSrpoSczZYqZDx/Y/DxSU2HByEoeTF4lwKMcYi+d2DdAYVMJp3PlPHORUt2uqTTi4LNbRiiOZNH3ckmGlkpHHOCC4r+9mXgjJdFeLsbAnyMk2Z1JKChoo/g0Xdcl79ksI7vCVjrNjwtVgyPhJ4qIw3SYsGUQ6QDACNMNu48Yt0FyxRYzpvfXJtRA+sDQYfSmFnqspIs+WjQlyFHxxUWdCz7ZIpXP8+goplrAiYSYcrypaF7GHAE8bqjm+eVkTmK1MdV8b1/H+lqpQtm23nY2hAsZPSYv12l7EWmwjswx/60OI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(42112799006)(1800799024)(38070700021)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzJzSTZOVnhSMGd0Q1h4M0dQeExFYzIyZlRCMnFOZFZIVFVqNXdBank0S0t5?=
 =?utf-8?B?VWhxNlA0R3lYR3p3YTNWNDd4NE56V01zTUZTdjdjTkI0dkNZWm1La0VQZ2hS?=
 =?utf-8?B?ems5UFlRNWpGUExUd0FyUWZTa0JHMkZzZmJSVzRDRkpoYzNvY2l4VkFYTTEv?=
 =?utf-8?B?OG1wRHNJVlIyeVROUVZQSEZhTnJoemNtOVBZa2xkUDU4WmJjUHJ4bk5vYjRP?=
 =?utf-8?B?RjRQd2l2R3QrcG9JaFZTSXJrS0g0UEVNWjlyTjVpSjVTWmJMcXRhQi9FYVY1?=
 =?utf-8?B?ZXpQampGditOd1pNcHRuSGlMc2FyQWRmemtFWm4zYWx6ZE9waFVQeVBMTGxQ?=
 =?utf-8?B?NGwzNWtLeHNPV0pXYy9rMGNLWEtLREo5b0ZnRGVodTVmL3E0b3pWUVhXWEo3?=
 =?utf-8?B?U1FUTVVySGUrZ2ZSdjBJMWhka2ZxekxjdHgxcUw3Sjd1SndHOHlHeHFpakxk?=
 =?utf-8?B?aHNiRWJhMGhyQVFxTEhEcGt1R0RaS29HT1hvNDloVk84NHNWeHowWEtvQktU?=
 =?utf-8?B?QUF1ZDZJa1BTb3NOakxXQWkyQ2QwbW93aGVpajdramk1ZUhCUFhOVjJtRGc5?=
 =?utf-8?B?TU84U21GUFMzRzBuRm14ZFFVOG9nUTVGOGc1eWh5RFI2ODVpSUlJMWJUU1I0?=
 =?utf-8?B?Yk4vaWNHMXIyRzJiTXl5bnFuM3RQSTlHMks5R0E1VzdZOS85VmR5bTlXTHhH?=
 =?utf-8?B?YlloYlJmR2tmR2M1Y2NPQmh1cXdjWDVaWlY5ZWw0MGU4cEhYSmtSYlB2YTFF?=
 =?utf-8?B?RXFKVXp6ZzlUR29mUXQyc3JIQ0daQndFZ0JsOVVFS05JMVI0VU13T21lSnRJ?=
 =?utf-8?B?S1BHa3BLTWZDTTUvaEd4QW1nQm1SUUtXOGNOS0tzRUxoTTNpMUhWM2FyeEM4?=
 =?utf-8?B?K3E4QWxtd0ZCT2tIanhWY0lnWDhCYnhKOVFBd0pJbDRUeTZwdUxIMDNMWDJh?=
 =?utf-8?B?SGtneUpCcUhacGZseGVYbkY3cmpLMk1Mbm9zcVMvMjY1cktZMVcwcEdSaFpX?=
 =?utf-8?B?eTFjWjFxZnlMRjhmQmZJZVN4Q3BXVGZhcWZNYk1wN0JLYnhMcnN4Wkt5Q1gw?=
 =?utf-8?B?R2FsM2tVelhpSjRuc0RteTNGcjJORHRkTVpUbnFtY21HYUw5clY1cU5LelUw?=
 =?utf-8?B?QVRnTzhKbW5MdEgxVlhYRkU1blk4SnE5dWc1RHVaRGdIUXM5MVA0RkpDUllT?=
 =?utf-8?B?Wm41UDVRV2xQY0pyNm5PbTRIZDUwK2tzMHRBem5NQ3RmY1RlcHRMRGxXaGhi?=
 =?utf-8?B?amNxckxaUi9WZ3FITzFHZU42S2FMc0xoajBjdzZGTlRSUEoxazc5Ty9mMFVQ?=
 =?utf-8?B?REdLOVUrZzVwa284bEl3Y3dKVklWZjBUdVE4YVpvU3RYa1M1a0RFeG4za0Rk?=
 =?utf-8?B?UnNaK1ZRVC9nYlh3bUd4YmxBMVpBYm8vMDJNeU45blJodDNjdENOUWNOWmI2?=
 =?utf-8?B?K29QakhFQ3pCelUwME1YelFDWFJqUEFTSW5DT2lUcHdCR21teTVKYXowOWF5?=
 =?utf-8?B?WUVkVUNlV0l0ZVFYak1SLzNpQnZQNXpKaWMvTjdLL1JEN0haZDloWndZanht?=
 =?utf-8?B?K0RYd2pBT1VEd1IwT1VOeFZxR2gvbTJIek0xaGF1TGxSSGIxNGtRSU9Ub3ln?=
 =?utf-8?B?N1VXWXZReUVCOG02aENpVVB5SUZEeUIybTdKcTN1V2I5MXA5VXl0WXNHVU9y?=
 =?utf-8?B?SzVJMDduaWVYcVFHRGN5L0FDaDgrbGtvMXhxaVJ6VitsOGJ6SG96My9GYndK?=
 =?utf-8?B?QWljVGQ2eHh4cjZ4U1IyZmRZeHljYTVwN0JmL1VJcVIzYjFmWlFpd1pSNlEz?=
 =?utf-8?B?dHVrTG9tcXZnaC9VdjFQdnVVSlFyaXhUbmZSa3A1SS9keDBCRzRxZGhUQXJV?=
 =?utf-8?B?OW9lUUdoTmp2TlRnQXErYk1QQUZUT3hFRDFBQmY5a2RJRWsyWTN1dkVTZmdi?=
 =?utf-8?B?Wm45UGZnMWtTdm9UN0RGL2lpTWZSSCtsU3ZCelNDZ01PSXdoeDFibjRLNXpN?=
 =?utf-8?B?eE9ad3Z3ckVLQlZncjRkbHVpTFpLaG4xQlB6UVVGWndMT0xqMVVXVTIvMjFi?=
 =?utf-8?B?bGg5TEl2Qi9VaUF0ZGFrbnQvNGdlSjZQUkI5Q3g5cDZwZGtYaTB3TUh4b3lS?=
 =?utf-8?B?bzA2c1dsbzd3Z1FaMnl2U1dYUjlYUjc1TnVmREZaVWs4Mm5tTWJGZHQ4NFJY?=
 =?utf-8?B?dVprVTEzNWVhNXdjandMUStYVWtSYWRwV0tVZ2lwL0hxVkJKbERhZlpnRk8r?=
 =?utf-8?B?TXU4UjM3MWs1STNYVkJyVFdvZ3Q3bHZoVXl3b2s1TXNWdU1VQWE2NUFOM0Nl?=
 =?utf-8?B?R1lwT0FnR2RES2s4ZzFuSnk5U0dndlI1NytXaWtZVUMwUjYwV0RpYkQ3bC8v?=
 =?utf-8?Q?HqpGvHaj53jtxYoU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4518296A996E84A89C7FB8AA8E12FD0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19db578-455c-49b7-6de2-08dedd9df9f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 09:39:30.6212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rdnRirpol+5A7U6wjc3hiuzIfiK7c3jNwOKQ48vxtG/0sx4L2P7qhK+B3y7qA3+8G4vV+S2D2Sm+RB69KE9OsJ3ND8LmY77HvvdaxXHVjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8512
X-purgate-ID: tlsNG-42698a/1783589974-38942220-889BFC51/0/0
X-purgate-type: clean
X-purgate-size: 4226
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,lists.xenproject.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:from_mime,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9EEA72F0C4

DQoNCk9uIDcvOS8yNiAxMDo1MSwgT3J6ZWwsIE1pY2hhbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAw
OS1KdWwtMjYgMDg6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDguMDcuMjAyNiAxOTow
NCwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4+IEhlbGxvIEphbiwNCj4+Pg0KPj4+IE9u
IDcvOC8yNiAwOToxNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDA3LjA3LjIwMjYgMTg6
MDgsIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+Pj4+PiBPbiA3LzcvMjYgNToxNiBQTSwgRG15
dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4+Pj4+IC0tLSBhL3hlbi9jb21tb24vZGV2aWNlLXRy
ZWUvZG9tMGxlc3MtYnVpbGQuYw0KPj4+Pj4+ICsrKyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUv
ZG9tMGxlc3MtYnVpbGQuYw0KPj4+Pj4+IEBAIC0xNTQsNiArMTU0LDEzIEBAIHN0YXRpYyBpbnQg
X19pbml0IGhhbmRsZV9wYXNzdGhyb3VnaF9wcm9wKHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8s
DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+ICAgICAgICAgLyogeGVuLHJlZyBzcGVjaWZpZXMgd2hlcmUg
dG8gbWFwIHRoZSBNTUlPIHJlZ2lvbiAqLw0KPj4+Pj4+ICAgICAgICAgY2VsbCA9IChjb25zdCBf
X2JlMzIgKil4ZW5fcmVnLT5kYXRhOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIGlmICggKGFkZHJl
c3NfY2VsbHMgKiAyICsgc2l6ZV9jZWxscykgPT0gMCApDQo+Pj4+Pg0KPj4+Pj4gQ29uc2lkZXJp
bmcgdGhhdCB0aGlzIGNhbGN1bGF0aW9uIGhhcHBlbnMgc2Vjb25kIHRpbWUgaGVyZSAuLi4NCj4+
Pj4+DQo+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIklu
dmFsaWQgYWRkcmVzcy9zaXplIGNlbGxzIGNvbWJpbmF0aW9uIChib3RoIDApXG4iKTsNCj4+Pj4+
PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4+PiArICAgIH0NCj4+Pj4+PiArDQo+Pj4+
Pj4gICAgICAgICBsZW4gPSBmZHQzMl90b19jcHUoeGVuX3JlZy0+bGVuKSAvICgoYWRkcmVzc19j
ZWxscyAqIDIgKyBzaXplX2NlbGxzKSAqDQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzaXplb2YodWludDMyX3QpKTsNCj4+Pj4+DQo+Pj4+PiAuLi4g
SSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIHRvIGNhbGN1bGF0ZSB0aGF0IG9uY2UuDQo+Pj4+DQo+
Pj4+IEhtbSwgb3JpZ2luYWxseSBJIG1lYW50IHRvIHNpbXBseSBzdGF5IHNpbGVudCBoZXJlLiBC
dXQgbm93IHRoYXQgeW91IHNheSB0aGlzLA0KPj4+PiBJJ2QgbGlrZSB0byBleHByZXNzIHRoYXQg
SSBmaW5kIHRoaXMgMm5kIGNhbGN1bGF0aW9uIG9mIHRoZSBzYW1lIGV4cHJlc3Npb24NCj4+Pj4g
Ym9ndXMuIElmIHRoZSBnb2FsIGlzIHRvIGRlYWwgd2l0aCBib3RoIHZhbHVlcyBiZWluZyB6ZXJv
IGF0IHRoZSBzYW1lIHRpbWUsDQo+Pj4+IGNoZWNrIHRoYXQgKGFuZCBub3RoaW5nIGVsc2UpLiBJ
ZiBpbnN0ZWFkIHRoZSBnb2FsIGlzIHRvIHRydWx5IHByZXZlbnQgdGhlDQo+Pj4+IGRpdmlzb3Ig
ZXhwcmVzc2lvbiBmcm9tIGVuZGluZyB1cCAwLCB0aGF0IChhbmQgbm90IGEgc2hvcnRlciBzdXJy
b2dhdGUpIHdvdWxkDQo+Pj4+IG5lZWQgY2hlY2tpbmcuIEluIHBhcnRpY3VsYXIsIHRoZSBtdWx0
aXBsaWNhdGlvbiBieSBzaXplb2YodWludDMyX3QpIGNhbg0KPj4+PiBjb252ZXJ0IG5vbi16ZXJv
IHRvIHplcm8uDQo+Pj4gWWVzLCB5b3UgYXJlIHJpZ2h0LiBOZWVkIHRvIGNoZWNrIHdob2xlIGV4
cHJlc3Npb24uDQo+Pj4+DQo+Pj4+IEF0IHRoYXQgcG9pbnQgdGhlIHF1ZXN0aW9uIHRoZW4gd291
bGQgYmUgd2hldGhlciBvdmVyZmxvdyAoYW5kIGhlbmNlDQo+Pj4+IHRydW5jYXRpb24pIGluIGFu
eSBvZiB0aGUgaW52b2x2ZWQgZXhwcmVzc2lvbnMgc2hvdWxkbid0IGFsc28gYmUgZGV0ZWN0ZWQg
Lw0KPj4+PiByZWplY3RlZC4NCj4+PiBUZXN0aW5nIHplcm8gaXMgdXNlZnVsLCBidXQgbm90IGVu
b3VnaCAtIHRoZSBleHByZXNzaW9uIChhZGRyZXNzX2NlbGxzICoNCj4+PiAyICsgc2l6ZV9jZWxs
cykgKiBzaXplb2YoKmNlbGwpIGNhbiBvdmVyZmxvdyBhbmQgd3JhcCBhcm91bmQgdG8gYSBzbWFs
bCwNCj4+PiBub24temVybyBudW1iZXIuIFNvdXJjZSBjb2RlIGFuYWx5emUgc2hvd2VkIHRoYXQg
WGVuIG9ubHkgc3VwcG9ydHMgY2VsbA0KPj4+IHNpemVzIG9mIDEgb3IgMiwgYW5kIHRoZXJlIGlz
IGEgQVNTRVJUX1VOUkVBQ0hBQkxFKCkgaW4gZHRfcmVhZF9udW1iZXIoKQ0KPj4+IHdoaWNoIHBy
ZXZlbnRzIGZyb20gdXNpbmcgd3JvbmcgY2VsbCB2YWx1ZXMgaW4gREVCVUcgYnVpbGRzLg0KPj4+
DQo+Pj4gSSB3b3VsZCBwcm9wb3NlIHRoZSBuZXh0IGNoZWNraW5nOg0KPj4+DQo+Pj4gICAgICAg
aWYgKCBhZGRyZXNzX2NlbGxzIDwgMSB8fCBhZGRyZXNzX2NlbGxzID4gMiB8fA0KPj4+ICAgICAg
ICAgICAgc2l6ZV9jZWxscyA8IDEgfHwgc2l6ZV9jZWxscyA+IDIgKQ0KPj4+ICAgICAgIHsNCj4+
PiAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIkludmFsaWQgYWRkcmVzcy9zaXplIGNlbGxz
IGNvbWJpbmF0aW9uXG4iKTsNCj4+PiAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4gICAg
ICAgfQ0KPj4+DQo+Pj4gVGhpcyB3aWxsIGNvdmVyIHplcm8gY2hlY2ssIGFuZCBvdmVyZmxvd3Mu
DQo+Pg0KPj4gSXQnbGwgbmVlZCB0byBiZSB0aGUgbWFpbnRhaW5lcnMgb2YgdGhpcyBjb2RlIHRv
IGp1ZGdlIHdoZXRoZXIgdGhpcyBpcw0KPj4gYXBwcm9wcmlhdGUgaGVyZS4NCj4gSXQgaXMgYnV0
IEkgd291bGQgcHJlZmVyIHRvIHB1dCBpdCBhdCB0aGUgcmVhZCBzaWRlLCBub3QgYXQgdGhlIHVz
ZSBzaWRlLiBQbGFjZQ0KPiBpdCBpbiBzY2FuX3BmZHRfbm9kZSgpIGFmdGVyIGBzaXplX2NlbGxz
ID0gZGV2aWNlX3RyZWVfZ2V0X3UzMmAuDQo+IFRoZSBmaXJzdCBjYWxsIHRvIHNjYW5fcGZkdF9u
b2RlKCkgcGFzc2VzIGRlZmF1bHRzLCBzbyBpdCBpcyBvay4NCj4gDQo+IH5NaWNoYWwNCj4gDQoN
CkhpIE1pY2hhbCwNCg0KTmljZSBpZGVhISBJJ2xsIGNyZWF0ZSB2MyBmb3IgdGhpcy4NCg0KQlIs
IERteXRyby4=

