Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F65514626
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 12:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317141.536332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNQP-0005SX-2p; Fri, 29 Apr 2022 10:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317141.536332; Fri, 29 Apr 2022 10:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNQO-0005Qb-Vh; Fri, 29 Apr 2022 10:00:32 +0000
Received: by outflank-mailman (input) for mailman id 317141;
 Fri, 29 Apr 2022 10:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkNQN-0005QC-Oj
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 10:00:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33414eda-c7a3-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 12:00:29 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-fPU9DSkmOsCnn96CAf-0Bg-1; Fri, 29 Apr 2022 12:00:27 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR04MB2952.eurprd04.prod.outlook.com (2603:10a6:6:b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Fri, 29 Apr 2022 10:00:24 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 10:00:24 +0000
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
X-Inumbo-ID: 33414eda-c7a3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651226429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BTJsUJAPEIuQXyp98P3XftmWrZw49yvkYUB7KnqPkeg=;
	b=CtsRf5ofcCVTA0sl9OTL9/TBhCeR5qPviC9MIZ9jIloAS7hn+/Q9b64bxp2Brb5ifq+ELG
	SUtk9c9eQllTW5hXYSPBP1Da8audDY5WtSFRTbdYRrEi39GqQvSVhVGEm3co3eUYOBhqMC
	6hJV/aZtxd+LiGpZowL0ZK4lJ8NpvTw=
X-MC-Unique: fPU9DSkmOsCnn96CAf-0Bg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgW7GMaoU17Najrg4oMUZxVuRbSz6btVj3Thnz2085Ay05i609/z1weMaPgNfQIG9yKcPX1FDl/a5GsmASdvOfURyZl2LqfyVVfa3yhxqcWbRyLAEg8WlitjjTcrdkfbUnjkS+ryDQ+G3AZvrFbjOyq9fjrN8ZvUJE26oLh8sAbKe3K7orFZZ3UauxCpigiWdeCMvsdjq0BiJkkP/m3cFpEFH1ny9pdPnZyawTyT9tuV/JDXVPuH0Iek9zsdwpXQQdbjUo05NupzqztNMeRX+xtHIjN3uDutvchXu7CNoU5QfHOH53aufda5k4mJH86Dyl1x7uEKce+QBvcNLp/7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RPmWF+WLhZ49qd/qXvvWeU0bAoV+1Ztkr8p0t6aoOo=;
 b=Aw/YZTCc7ks0m4ZujqUf4sYkPaaVM8WJ8REF/zCvdvYNLrjDcQ39kNoEIPNAh1BamwVyPFYhre949bubadvQhbLxxYI/tFwK2xgJdPm2oZv+gKMAij8DKdjT2MD+8GpueWpq4MYMJKxyxqingM7Nptg6YQDJK8RpNEt2gl1yKBBRRuKC84vYgCq3Oush1XpS90osRukcSOdk8tgPoibuzzWU1nTTgXVXWD4SvHpS4R2/KiooxH53XqI+XajVQFwm4WSwsuV8xqd2bMcmilh3+PVOCejjidJyB9oNcLHPB8F22ktc6C+2/dFUxwTAt47KQiFXtcty1T1gbnnhEKqGJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a229df5-c341-9ff0-ae5c-cc0d848d7cea@suse.com>
Date: Fri, 29 Apr 2022 12:00:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: x86/PV: (lack of) MTRR exposure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
 <YmubOeYPqW5mBNy4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmubOeYPqW5mBNy4@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8183452c-82c7-494c-c992-08da29c7142e
X-MS-TrafficTypeDiagnostic: DB6PR04MB2952:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB2952A17C217E0EAC2D3FA812B3FC9@DB6PR04MB2952.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZLhPUkV/+cyvsJGoIgHP0ykoSz7GodTMzhtYeL7zChK1ddN8ydRSztTZhxB4VUctjJWjksmIfRkzmzlLsYc/L//2QZyz7B60V01YL04A3cJV04ONRuwrzZR/DFUO0Oy5VLyrxVFzsWh/21kqWiTa6Ui5qmXgG4lkuikiods7DjlqJi90vrRKnGB5oNML1vL/fc9QcBu+fxhk2XxORvpRxiMtvVjAdRlVVOJLjnOgoCK6EEAvV7nMJkSCYbEkkpAazt+rCtiDO30ZKb2W71gwxjkSxKyp8o1a2zADnbE5FtosZFrP5ULU9ojJI62bswN5Q9o2GEBe1kPh32kDgrzPTFAMvsd+gOGTb/lSLMVyk2rRSKz6Imi+pTDmb1C0GsN2BH5aTG9PT1YKL7oeZxSLG7Muq58BFXTsi8GaCI913nA5NFO4wQ3EB/LEG3NViyfQMnqKgcw9iPwa38OvHXz3Uw79YAZM+5JI9Z3yRrkbPAcPYcPNW0qAU48JlicLEyQr5J+0Vk7SpIk2nCdxqP4wyTvacX/Qu7n4nch/7JGAPeLWZmvW+N+yqRPzX1+hEdsECUMq8rn+YCf2k6vNAqfF2eXfx9uhlutjwoNIgLwnWi+iYeXAdMWoEi1xqc8dqOVpqZcHEeb6dn9MylQlPJCj/ZbVL/7v8jIfnsWYsmBZ74Kw2De47MJq5QSs4nEPb7OX82+lFFFFQK6hn6y7jfkwnjXRX9/dP57taWzadM0o3v1+cDL9FY/THD2ifkxtls5Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6666004)(5660300002)(36756003)(6506007)(186003)(83380400001)(8676002)(66476007)(66946007)(66556008)(2906002)(31696002)(4326008)(316002)(31686004)(2616005)(86362001)(26005)(6512007)(38100700002)(8936002)(54906003)(6486002)(6916009)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iHCcdGUKxQi9gnr0P0wmrX65j5xzAqY0/IIKB/NH4pB8bYtW+1/mB0ZW3f4m?=
 =?us-ascii?Q?ZrScB5a1puTN0rIsMwx9nLrCjKLd7yusy38MzZuYSNsuw8QtoaPwa8Wd1la/?=
 =?us-ascii?Q?VRBH57kvTJZd9wqQhsMUCbH80DecKIkl+lmOS1YWEL408SEKi23n788EzeFw?=
 =?us-ascii?Q?owCUCHArHYBJlwTIIPR+7yyJu05uv4LdmTrTFPrWHlcqxq5FYPNJxHJ5yMqq?=
 =?us-ascii?Q?XVySaS/u8JwE03sCSflh5BARoFQ2fvfW+TvSushH4O/4EIg9cPAHF6rmQItC?=
 =?us-ascii?Q?a0jQr5vAvhJZSPU1IdBZOy1CHO/kf3x3Mlmd2kkZFlV+5qnlaJE12VXB7sbj?=
 =?us-ascii?Q?9HlzN3HcUA6O2EE2dCn06rY4odWH/+Sz/W5rSfRLw+WS3q7REbW1q0+vg37Q?=
 =?us-ascii?Q?dMi0xreO3+ao4mU7oSHD+Vzptto9qOyDjKUbZE5lKSTjP7avBSMFJpx4GqBY?=
 =?us-ascii?Q?IFLn539lOS02aJxW3+7KLQ5uQoAIW7sqt5LDUeL5SVpkOOExt5bcZFNywboR?=
 =?us-ascii?Q?ZEfGeCS8mH1yYy62wqHhEAPlFvXA2zF1hm1LC1jsLeYsDg1afZOszq69xb0g?=
 =?us-ascii?Q?NHKZoC6ljEDnLF/xq0dkh62wYT+x514hCT5P7/6NOZPa9WPnzjbxQCHOVRuB?=
 =?us-ascii?Q?LjX/snPXWHKMxtFHzzdqEjfyvgzWmtu32deKh6YR0s45TK7H9+1Z9KVtlES0?=
 =?us-ascii?Q?qe6H5X0fLBf1KZHRrL6yqGTjHHWhD5kfF432esLL95V8Zu/m2Sp+Iim/v9Ba?=
 =?us-ascii?Q?8FeAXdDWsE6GfdmCuTxMOixHGG9TbplQt478aHqbM6EyhKp6yiprfCWSiCjW?=
 =?us-ascii?Q?sNHgz4gDO8HfGmcMGHihHew1ycTVP0psNgNq6Cndovr1LeWHx0qEBrymU1UO?=
 =?us-ascii?Q?ktgoQMlHb/AjgUqJzNKYeU7PkC9KwEFK7Bkl8OkifUC3FjPKplXlEiTayr0i?=
 =?us-ascii?Q?E40HVhBKsGo4gXWIyMq+AXkkl81P8oR5hnyh8BXDWTQu2tnH+hP/BUZQdrJP?=
 =?us-ascii?Q?+r+ITvjRbIs4FrwKT2iQrCg3c0b0l8hqXyTQFPrq+gZXZ7i19YHPFHvfcMdh?=
 =?us-ascii?Q?zg3Z3yAcck980KohkEGay8AS5IZhyLsfR1WHQlhz8WlorMhxaeb9tSvcvAiN?=
 =?us-ascii?Q?aD9d0c5ISU/rkxPeKZdx79+Dp3U6f9pUuelFZwbwyAiArpzFommdRxoraREv?=
 =?us-ascii?Q?fJnAj/PSKsQnny6zGatOgFNASMKOiZPellMOTBsMzs0YtpUlU2q7wtO2bcEC?=
 =?us-ascii?Q?ubEnCF/7mOraMfmRbn73dE8sVnhJhaTyg+mC0wGGnMewc64TfVTYZeYkkSzw?=
 =?us-ascii?Q?tMikZLCAbF9Y7+4CE40DWhFzzyQgb35V2ICM8EM9J1EQCuMBzs0+fmOLC0eI?=
 =?us-ascii?Q?O8PtPwBnfovZCSg+ueN0QWKdqXyu69mOBqE1epqfUTEQX0XWHdsiCvEMgOje?=
 =?us-ascii?Q?a0IcBNFH0k9E/WdcykDGXVk3Aj3R1wz3XPUsvunwgX3RjA3IpuyLyDhVGGdz?=
 =?us-ascii?Q?LOaPxuWp8Ndgg9k+a/dd/SUbh6Sto1e4Xi/i3oSngQ4KvsJQ4U/KsBGHjrZN?=
 =?us-ascii?Q?ZQWmsNXlqI6lCXTVV7f373qUfMndxRz9++EjvCuDwo+zhhrHOX+8AGcBKQg4?=
 =?us-ascii?Q?95E0wgmNUrfQ5JKj9nRZ6DEBLLWJy9DkY5aq9Gh28hjFfExG9LqgEyvQ3yMx?=
 =?us-ascii?Q?XGq+IXNti425qNcfttlXjJMY6YOLUoN8fIfCMCAXBaAZKq3viF8T1guByn4A?=
 =?us-ascii?Q?egqZhsHj0g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8183452c-82c7-494c-c992-08da29c7142e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 10:00:24.1281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kq33KtlA/85MGTvR7IAvXMPySiaL8UJdHSrcCMOwpgdzCCe5uU0ph7IcEQZ5HXb3ZOYFAB2dCm1m9udeCoJaPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB2952

On 29.04.2022 10:00, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 28, 2022 at 05:53:17PM +0200, Jan Beulich wrote:
>> Hello,
>>
>> in the course of analyzing the i915 driver causing boot to fail in
>> Linux 5.18 I found that Linux, for all the years, has been running
>> in PV mode as if PAT was (mostly) disabled. This is a result of
>> them tying PAT initialization to MTRR initialization, while we
>> offer PAT but not MTRR in CPUID output. This was different before
>> our moving to CPU featuresets, and as such one could view this
>> behavior as a regression from that change.
>>
>> The first question here is whether not exposing MTRR as a feature
>> was really intended, in particular also for PV Dom0. The XenoLinux
>> kernel and its forward ports did make use of XENPF_*_memtype to
>> deal with MTRRs. That's functionality which (maybe for a good
>> reason) never made it into the pvops kernel. Note that PVH Dom0
>> does have access to the original settings, as the host values are
>> used as initial state there.
>>
>> The next question would be how we could go about improving the
>> situation. For the particular issue in 5.18 I've found a relatively
>> simple solution [1] (which also looks to help graphics performance
>> on other systems, according to my initial observations with using
>> the change), albeit its simplicity likely means it either is wrong
>> in some way, or might not be liked for looking hacky and/or abusive.
>=20
> I wonder whether the patch needs to be limited to the CPUID Hypervisor
> bit being present.  If the PAT MSR is readable and returns a value !=3D
> 0 then PAT should be available?

I simply didn't want to be too "aggressive". There may be reasons why
they want things to be the way they are on native. All I really care
about is that things are broken on PV Xen; as such I wouldn't even
mind tightening the check to xen_pv_domain(). But first I need
feedback from the maintainers there anyway.

> I guess we should instead check that the current PAT value matches
> what Linux expects, before declaring PAT enabled?

I don't think such a check is needed, the code ...

> Note there's already a comment in init_cache_modes that refers to Xen
> in the check for PAT CPUID bit.

... in __init_cache_modes() already does it the other way around:
Adapt behavior to what is found in PAT.

>  We might want to expand that comment
> (or add one to the new check you are adding).

I don't see what further information you would want to put there.

Jan


