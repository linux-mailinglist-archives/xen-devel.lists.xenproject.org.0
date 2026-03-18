Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EeEG8QnumnYSAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 05:19:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CDE2B5C09
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 05:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256295.1550986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2iN2-0005Us-03; Wed, 18 Mar 2026 04:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256295.1550986; Wed, 18 Mar 2026 04:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2iN1-0005Rq-TF; Wed, 18 Mar 2026 04:18:59 +0000
Received: by outflank-mailman (input) for mailman id 1256295;
 Wed, 18 Mar 2026 04:18:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GHH+=BS=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1w2iN0-0005Rk-7z
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 04:18:58 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d474b79-2281-11f1-b164-2bf370ae4941;
 Wed, 18 Mar 2026 05:18:44 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU7PR03MB10945.eurprd03.prod.outlook.com
 (2603:10a6:10:5b2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 18 Mar
 2026 04:18:39 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%7]) with mapi id 15.20.9700.020; Wed, 18 Mar 2026
 04:18:38 +0000
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
X-Inumbo-ID: 8d474b79-2281-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STKfH7a4Bu5CPB69czBcRuLJjWbnyzy5fz2Hrs4fk+MifNUyH4viN/Ii4pDXRDbyIgq/+tE4lR1Uwaih/jtV5HK6TgiTi7+q4nTdkPGL0Uz/BUACJQFF6H+TgBjRhbZN2YWz1aCABKPTGgg4bYU/VjrWgSIE9LBUfVButFFYA5lh5BAQrWx2TofjVJjtPQGQUyfqwjR+DMZs0p1k9f+VCbqvcZLoaxWnShFs0piakwFkL4ZNZ1m65H7HpG0wn2wN0raRHe9fxEz4N9ruLEDp9VWn+trVLdp9xRmp6vY/8CuuRsz96UW9Cgb60egPEQ9CbL3IFKEoWEMt7LiJpuZltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFcW23XxqOB9dyWc8Hb9kjf6vZdaZNC/g3dMuEXNCvg=;
 b=E6B4Zff0l+oL2y2X6UGnriytoqZCjjx+fkGDHuF23c8ke41jQodP/iY7TrUICF28fpvRLRTVg4oMrI73jThwrXTCrO4zvWlz0zaiavSeZs2KDtM8klxw/UJcvgXhrRfUSHdAT8L3JRh8WqVmeHi+OL4jgjPpEKOEKZruEQFlJZuanCnNqO/3a5q3F9EUT8HiaaV7LlAkLixxOcwwPrKq436+gscn5RSENZZfDR6Kj7KA5U7UOVs0xkI/Xhbxu+oGxNrTCSerqxQN34jyvOWWtsJrD+Snv8jBJdhlO2+mp4fbF8f6Re+XAED4FM8XnCdtq1sGOCQ2c7azr7VHq0vJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFcW23XxqOB9dyWc8Hb9kjf6vZdaZNC/g3dMuEXNCvg=;
 b=B1XJY3DdpxuZ29x+lIX67BfpCPgtfS3lhEcE9Dv51oPvpor70cCeE3xUj2TCb3JIK3g/AOUQq6zbv6eYEkTYmP6ZKtsVfzED0XOufA3nPdPZsqHBbMs3Yq0EQUuSilclfryYgLoif0D7FQuTHLzkNazdG9X1Ln36sibJeY/ANxjBnpttZNanA6Kk6x5NFHT8IqzFbgYLDhuIauOxiT/VDeJ3Vln/MnfRGHmoNkORwlDkdZnL3r5+E+E+5tTGOcwx/PM/mzQJUlbxhMzx4gBxUg2C1qhHaQZkdeDv/PZTZLEYYMo/ZkAxGPi8RP31jnw7NO3fhRPjreMDvoOF68gV7Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v16 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Thread-Topic: [PATCH v16 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Thread-Index: AQHca2pkIbZvzRBq5kGPbXWSwbNafQ==
Date: Wed, 18 Mar 2026 04:18:38 +0000
Message-ID: <87jyv9kbxe.fsf@epam.com>
References: <cover.1765533584.git.mykola_kvach@epam.com>
	<f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
In-Reply-To:
 <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Fri, 12 Dec 2025 15:18:18 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU7PR03MB10945:EE_
x-ms-office365-filtering-correlation-id: 39671178-bce6-4d24-9954-08de84a56e50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|42112799006|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 yygLZYpu2yEpTzI8pXDPqRUHjAb6ewPj3XDGd2gA/Pr4z8rfKZzIbt0lg8Yus6LqyjH20SS2tzINOfhuYbMzBK3+xCBZB9jiJ+WOy0jTQ03dsSD8GTxoVS+Ydx3V72CzLxgkEvIc0cySUGHrpFKOLQdZsj0squh4ieyaw7IEppXm9IKgNsvHtYvgxYR7+asnLIwynmqD3rAL899MmaeUl+Uis2vNqnkRk+sJDpy+10RKVNT4aP35lqc2FLf1VXz6kg8iU2ww2zq+a39Gz+n0QobmydMDBOja8ViRKhzEiEVt06iaxpe133z1j4yjn6IjELkgXSIpktBc0il62dJx8/FUa22arWgtoGB0+S+Ks2JS8ZYpD8j2DOifMUTKZs323eG3DPNFeDpLVva04wgfN7SNR8p07+4ZDopf1VroheHrQxHzXIEIIJTl5ksJxqJLN08snnAfGqnqWl4p78hz2L6/NtyxLK7/3vNShdKENGf2J6KRmV79d0xyoPH6ibOnrQM38aKXavuWsNJQ97Hvm5ZBkl+B2gvsja2tpllkSIcJMxzj6ejoF3BqmaB4JopbzExx0kf6S3yq+WMVG/81tCwcX5fRQTapgQBSITKcHYT/BDh6IGaSt1MHyDInLfqrJGHSd4dF/HZNXbiy+HKkHfEd4KZ6ZnGihANNGS5/HDNIEcPH6hEqEiP22soGDtcDslI8E+DOfbvnqgPQWZRtFUszNB0kLAcpFgH2cAUjzvuypV7umVkdu99dOX/vws0cmmNus9zycKV+vCA5hZINe8/rkvBDBUA2kgi86JQMVT0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(42112799006)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CZbyG4G84y8rQS2oAf9mXUKUB/MGRvjxi9jrv5ge3QUsGIs2Tt6oeSWZL8?=
 =?iso-8859-1?Q?N9rWdrs1Kdo+BThV7EDgB/ezmReONW+TvnoUmOzwAaIzH9qpoo5dJyuEkK?=
 =?iso-8859-1?Q?2CtX/1ANMn7TdJzJAy/x1cbgVmEab4u2chHhAxE1v5ULavF9VJW2d318Cz?=
 =?iso-8859-1?Q?SaaLXC+BS5+nYYp3d9EtSvUuXSHnqGWMD+F7hzWv+25cdEbxhQ0HvvY08q?=
 =?iso-8859-1?Q?8qkB+HAVmJRPCBG4CV4YpDvULLgSfjx267izuquNAqrQMIxnpOs7cBrP/t?=
 =?iso-8859-1?Q?mF4nYumrE5FWVctZ+wNlfTQbqZzuTOumOtLGkt+KHv8hD7pPDtTzy4Zjqe?=
 =?iso-8859-1?Q?fFo5xQOtAbwboBJcMGcBTluCcSnOzvttXIf70FjZ7+VKgqPyReogyBpcAN?=
 =?iso-8859-1?Q?MIiC91coXxmH5v+W/7mTjpsWquZ+6MaLvM4JDthGhUOhyEHVEZNLO7X7Jm?=
 =?iso-8859-1?Q?mdxhZeQwLQoLrupkLRE6OY0TIncbjcR5/FkqGV1L9mgPlO0im/UzY+cD1S?=
 =?iso-8859-1?Q?qKIyYMmAgR2L7Esclz8CNwQe/NayU+qOQ5EvaboibxSlh91u88nOcp3blk?=
 =?iso-8859-1?Q?gh0OmMUSsnONLJCRBWuCeSRqzT4hSW2wvpwleXqzeL6wX/xnkLJv0m8HaM?=
 =?iso-8859-1?Q?hLckyj5KzhdycJf1Goelqkrd186SR0GKrrk3Dbiwc4+U9fACOt/T6jL33a?=
 =?iso-8859-1?Q?I3uXAlx4xLFcSMNRv4ULpFRf4aS18d/gyR0cjxyybBZptmPcVeCojI08db?=
 =?iso-8859-1?Q?IWXUldM2Nvo3iORY7Vg9cGh+FahjRWZVStV1+IRkeNjk34Y+6dPoSh3u2D?=
 =?iso-8859-1?Q?ybwGubu6phxMkDNOVZw3tJgJrhl/ME2lo2UcDxkainxIp+BPNmibNC1IuR?=
 =?iso-8859-1?Q?LilFEpELbLnpCwEoLh4rE1WH6Wd2yP2nA8FT9RwCCDxE8pMlC7oGgpO98u?=
 =?iso-8859-1?Q?jHsVfCdF2ecMyBspdceEbHhS02gDlT0iAi5wynLcOHRZpQ9PdgD/18KZwm?=
 =?iso-8859-1?Q?KQo7cMnSEdu7ck52ksJohk/6nRiidjVfCsFu2AR1R14DhgpwtKqjqRTsX/?=
 =?iso-8859-1?Q?SQNApD8k2x/yhKb9qJq4s1jndY05MQSsVyj+LX1PEjBwNhEDYlYkw6tKR9?=
 =?iso-8859-1?Q?VtBgDgswyUeh9XzWcolbiU+itQe5e4UyCkaw6DTUckRF60BlLMQBE5SLdP?=
 =?iso-8859-1?Q?lzcIuc+4SBn+s9eUrNRLDTjEtnIjEc6+0RrGRRWwbtsQ2Bnl/48ywxoefb?=
 =?iso-8859-1?Q?HL5pEpIGb7ZMllYI5KRqx8xWgbHYPK/+ABj1ycp8D5vi4gy9Dt6Jl2hy1K?=
 =?iso-8859-1?Q?FZAwnxKYAhJ7bILiobru9Q1/7rp3mdyhpz47E9rGuF6mkTZf6iYfumJEr2?=
 =?iso-8859-1?Q?9fPQDakJlql7p6DG8DIyd82Z/ODKt0VroUCwjwu7Ou4+5/z7JX9ps2qTDd?=
 =?iso-8859-1?Q?WCtQjIOw70WURb26rWnRZ2Wxes+7kJ2/sez+J58eUjFdFsblVzyiYKvvV5?=
 =?iso-8859-1?Q?Gnn1nYC2jvVr71jH1OqkVA46nY97+QVQd6Rb8er5nZEwSGX+uH3gOOeTFa?=
 =?iso-8859-1?Q?RB8acIH0Hvhe0SY3PXBOMVgdpYQ9z3hH7NP24SG7ZyQvlcsTRewAmfIouk?=
 =?iso-8859-1?Q?9q7nyAI4NZApw0bIA45CiDvk9mcojaN57wAbm5RLMTu6EJQ9kj9jkpeRVS?=
 =?iso-8859-1?Q?rgRFixA5QrBALykEBrQpWCVXtulPdoVioJsDyJhROMFx1bOzzK9Xxl9EMX?=
 =?iso-8859-1?Q?UrPXELDMRb7U/W+xYI06ld2Etvg9tQUXSSKXOHBMOuywDFPXgSScH61Obk?=
 =?iso-8859-1?Q?5cGjW0mQa38m58QxTn6fQPUOvHfjr4o=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39671178-bce6-4d24-9954-08de84a56e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 04:18:38.7810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 55zJeSwbfTxGqzmmyHhb644FhOlvAXQiLsnNvIPvGL2GhEboR8UaRpEQuadbRi4zv45BLQdL9X+FglMfLuGDCsGgO9l9xHqQbfnjZ19gpuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR03MB10945
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 83CDE2B5C09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola.

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
> allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND call
> (both 32-bit and 64-bit variants).
>
> Implementation details:
> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> - Trap and handle SYSTEM_SUSPEND in vPSCI
> - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
>   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
>   in hwdom_shutdown() via domain_shutdown
> - Require all secondary VCPUs of the calling domain to be offline before
>   suspend, as mandated by the PSCI specification
>
> The arch_domain_resume() function is an architecture-specific hook that i=
s
> invoked during domain resume to perform any necessary setup or restoratio=
n
> steps required by the platform. arch_domain_resume() stays int to propaga=
te
> errno-style detail into common logging; preserving the integer keeps the
> reason visible and leaves room for future arch-specific failures or riche=
r
> handling.
>
> The new vpsci_vcpu_up_prepare() helper is called on the resume path to se=
t up
> the vCPU context (such as entry point, some system regs and context ID) b=
efore
> resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of co=
mmon
> code and avoids intrusive changes to the generic resume flow.
>
> Usage:
>
> For Linux-based guests, suspend can be initiated with:
>     echo mem > /sys/power/state
> or via:
>     systemctl suspend
>
> Resuming the guest is performed from control domain using:
>       xl resume <domain>
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V16:
> - Refactor error handling in domain_resume: move logging to generic code,
>   use explicit return code checking.
> - Make context clearing conditional on success in arch_domain_resume.
> - The 'int' return type is retained for arch_domain_resume for consistenc=
y
>   with other arch hooks and to allow for specific negative error codes.
> ---
>  xen/arch/arm/domain.c                 |  39 +++++++++
>  xen/arch/arm/include/asm/domain.h     |   2 +
>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>  xen/arch/arm/include/asm/psci.h       |   2 +
>  xen/arch/arm/include/asm/suspend.h    |  27 ++++++
>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
>  xen/common/domain.c                   |  10 +++
>  xen/include/xen/suspend.h             |  25 ++++++
>  9 files changed, 205 insertions(+), 22 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/suspend.h
>  create mode 100644 xen/include/xen/suspend.h
>
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 47973f99d9..f903e7d4f0 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -12,6 +12,8 @@
>  #include <xen/softirq.h>
>  #include <xen/wait.h>
> =20
> +#include <public/sched.h>
> +
>  #include <asm/arm64/sve.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> @@ -24,10 +26,12 @@
>  #include <asm/platform.h>
>  #include <asm/procinfo.h>
>  #include <asm/regs.h>
> +#include <asm/suspend.h>
>  #include <asm/firmware/sci.h>
>  #include <asm/tee/tee.h>
>  #include <asm/vfp.h>
>  #include <asm/vgic.h>
> +#include <asm/vpsci.h>
>  #include <asm/vtimer.h>
> =20
>  #include "vpci.h"
> @@ -851,6 +855,41 @@ void arch_domain_creation_finished(struct domain *d)
>      p2m_domain_creation_finished(d);
>  }
> =20
> +int arch_domain_resume(struct domain *d)
> +{
> +    int rc;
> +    struct resume_info *ctx =3D &d->arch.resume_ctx;
> +
> +    if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_suspend =
)
> +    {
> +        dprintk(XENLOG_WARNING,
> +                "%pd: Invalid domain state for resume: is_shutting_down=
=3D%u, shutdown_code=3D%u\n",
> +                d, d->is_shutting_down, d->shutdown_code);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * It is still possible to call domain_shutdown() with a suspend rea=
son
> +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_s=
hutdown.
> +     * In these cases, the resume context will be empty.
> +     * This is not expected to cause any issues, so we just notify about=
 the
> +     * situation and return without error, allowing the existing logic t=
o
> +     * proceed as expected.
> +     */
> +    if ( !ctx->wake_cpu )
> +    {
> +        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was not prov=
ided\n",
> +                d);
> +        return 0;
> +    }
> +
> +    rc =3D vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
> +    if ( !rc )
> +        memset(ctx, 0, sizeof(*ctx));
> +
> +    return rc;
> +}
> +
>  static int is_guest_pv32_psr(uint32_t psr)
>  {
>      switch (psr & PSR_MODE_MASK)
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index 758ad807e4..66b1246892 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -5,6 +5,7 @@
>  #include <xen/timer.h>
>  #include <asm/page.h>
>  #include <asm/p2m.h>
> +#include <asm/suspend.h>
>  #include <asm/vfp.h>
>  #include <asm/mmio.h>
>  #include <asm/gic.h>
> @@ -126,6 +127,7 @@ struct arch_domain
>      void *sci_data;
>  #endif
> =20
> +    struct resume_info resume_ctx;
>  }  __cacheline_aligned;
> =20
>  struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include=
/asm/perfc_defn.h
> index effd25b69e..8dfcac7e3b 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_r=
eset")
>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>  PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
> =20
>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
> =20
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index 4780972621..48a93e6b79 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
> =20
>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
> =20
>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> new file mode 100644
> index 0000000000..313d03ea59
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ARM_SUSPEND_H
> +#define ARM_SUSPEND_H
> +
> +struct domain;
> +struct vcpu;
> +
> +struct resume_info {
> +    register_t ep;
> +    register_t cid;
> +    struct vcpu *wake_cpu;
> +};
> +
> +int arch_domain_resume(struct domain *d);
> +
> +#endif /* ARM_SUSPEND_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/=
vpsci.h
> index 0cca5e6830..d790ab3715 100644
> --- a/xen/arch/arm/include/asm/vpsci.h
> +++ b/xen/arch/arm/include/asm/vpsci.h
> @@ -23,12 +23,15 @@
>  #include <asm/psci.h>
> =20
>  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
> -#define VPSCI_NR_FUNCS  12
> +#define VPSCI_NR_FUNCS  14
> =20
>  /* Functions handle PSCI calls from the guests */
>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
>  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
> =20
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                          register_t context_id);
> +
>  #endif /* __ASM_VPSCI_H__ */
> =20
>  /*
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 7ba9ccd94b..c4d616ec68 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -10,32 +10,16 @@
> =20
>  #include <public/sched.h>
> =20
> -static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> -                            register_t context_id)
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                          register_t context_id)
>  {
> -    struct vcpu *v;
> -    struct domain *d =3D current->domain;
> -    struct vcpu_guest_context *ctxt;
>      int rc;
> +    struct domain *d =3D v->domain;
>      bool is_thumb =3D entry_point & 1;
> -    register_t vcpuid;
> -
> -    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> -
> -    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> -        return PSCI_INVALID_PARAMETERS;
> -
> -    /* THUMB set is not allowed with 64-bit domain */
> -    if ( is_64bit_domain(d) && is_thumb )
> -        return PSCI_INVALID_ADDRESS;
> -
> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> -        return PSCI_ALREADY_ON;
> +    struct vcpu_guest_context *ctxt;
> =20
>      if ( (ctxt =3D alloc_vcpu_guest_context()) =3D=3D NULL )
> -        return PSCI_DENIED;
> -
> -    vgic_clear_pending_irqs(v);
> +        return -ENOMEM;
> =20
>      memset(ctxt, 0, sizeof(*ctxt));
>      ctxt->user_regs.pc64 =3D (u64) entry_point;
> @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, reg=
ister_t entry_point,
>      free_vcpu_guest_context(ctxt);
> =20
>      if ( rc < 0 )
> +        return rc;
> +
> +    return 0;
> +}
> +
> +static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> +                            register_t context_id)
> +{
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +    int rc;
> +    bool is_thumb =3D entry_point & 1;
> +    register_t vcpuid;
> +
> +    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> +
> +    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> +        return PSCI_INVALID_PARAMETERS;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> +        return PSCI_ALREADY_ON;
> +
> +    rc =3D vpsci_vcpu_up_prepare(v, entry_point, context_id);
> +    if ( rc )
>          return PSCI_DENIED;
> =20
> +    vgic_clear_pending_irqs(v);
>      vcpu_wake(v);
> =20
>      return PSCI_SUCCESS;
> @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
>      domain_shutdown(d,SHUTDOWN_reboot);
>  }
> =20
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t =
cid)
> +{
> +    int32_t rc;
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +    bool is_thumb =3D epoint & 1;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    domain_lock(d);
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v !=3D current && is_vcpu_online(v) )
> +        {
> +            domain_unlock(d);
> +            return PSCI_DENIED;
> +        }
> +    }
> +    domain_unlock(d);
> +
> +    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> +    if ( rc )
> +        return PSCI_DENIED;
> +
> +    d->arch.resume_ctx.ep =3D epoint;
> +    d->arch.resume_ctx.cid =3D cid;
> +    d->arch.resume_ctx.wake_cpu =3D current;
> +
> +    gprintk(XENLOG_DEBUG,
> +            "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=3D%=
#"PRIregister"\n",
> +            epoint, cid);
> +
> +    return rc;
> +}
> +
>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>  {
>      /* /!\ Ordered by function ID and not name */
> @@ -214,6 +269,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_fun=
c_id)
>      case PSCI_0_2_FN32_SYSTEM_OFF:
>      case PSCI_0_2_FN32_SYSTEM_RESET:
>      case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>      case ARM_SMCCC_VERSION_FID:
>          return 0;
>      default:
> @@ -344,6 +401,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, u=
int32_t fid)
>          return true;
>      }
> =20
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint =3D PSCI_ARG(regs, 1);
> +        register_t cid =3D PSCI_ARG(regs, 2);
> +
> +        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> +        {
> +            epoint &=3D GENMASK(31, 0);
> +            cid &=3D GENMASK(31, 0);
> +        }
> +
> +        perfc_incr(vpsci_system_suspend);
> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
> +        return true;
> +    }
> +
>      default:
>          return false;
>      }
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 93c71bc766..09ad0a26ee 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -26,6 +26,7 @@
>  #include <xen/hypercall.h>
>  #include <xen/delay.h>
>  #include <xen/shutdown.h>
> +#include <xen/suspend.h>
>  #include <xen/percpu.h>
>  #include <xen/multicall.h>
>  #include <xen/rcupdate.h>
> @@ -1374,6 +1375,7 @@ int domain_shutdown(struct domain *d, u8 reason)
>  void domain_resume(struct domain *d)
>  {
>      struct vcpu *v;
> +    int rc;
> =20
>      /*
>       * Some code paths assume that shutdown status does not get reset un=
der
> @@ -1383,6 +1385,13 @@ void domain_resume(struct domain *d)
> =20
>      spin_lock(&d->shutdown_lock);
> =20
> +    rc =3D arch_domain_resume(d);
> +    if ( rc )
> +    {
> +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);

I am wondering about this error path... Domain clearly can't be resumed
anymore. Should we crash it in this case? But domain is already shut
down, so domain_crash() would do nothing.

Probably it is better to ensure that arch_domain_resume() will not
return an error by doing all required checks beforehand. Actually you
already doing this. So how we can get an error realistically?

> +        goto fail;
> +    }
> +
>      d->is_shutting_down =3D d->is_shut_down =3D 0;
>      d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> =20
> @@ -1393,6 +1402,7 @@ void domain_resume(struct domain *d)
>          v->paused_for_shutdown =3D 0;
>      }
> =20
> + fail:
>      spin_unlock(&d->shutdown_lock);
> =20
>      domain_unpause(d);
> diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
> new file mode 100644
> index 0000000000..528879c2a9
> --- /dev/null
> +++ b/xen/include/xen/suspend.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_SUSPEND_H
> +#define XEN_SUSPEND_H
> +
> +#if __has_include(<asm/suspend.h>)
> +#include <asm/suspend.h>
> +#else
> +static inline int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif
> +
> +#endif /* XEN_SUSPEND_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

--=20
WBR, Volodymyr=

