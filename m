Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C9346E367
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 08:42:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242748.419819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvE4N-0003dG-26; Thu, 09 Dec 2021 07:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242748.419819; Thu, 09 Dec 2021 07:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvE4M-0003bT-Uz; Thu, 09 Dec 2021 07:42:22 +0000
Received: by outflank-mailman (input) for mailman id 242748;
 Thu, 09 Dec 2021 07:42:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvE4L-0003bM-TQ
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 07:42:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a616809-58c3-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 08:42:20 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-XjtuEnkwNvSlYP5qrZr7rA-1; Thu, 09 Dec 2021 08:42:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 07:42:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 07:42:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0034.eurprd08.prod.outlook.com (2603:10a6:20b:c0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 07:42:17 +0000
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
X-Inumbo-ID: 8a616809-58c3-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639035740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTUPdzdnBXfPKSm8mLG1WkWz9XNaOGoTyoL2AQTo36o=;
	b=Lp/NKTakbkEyX4e6INjuKG0PpieUDBrkKZk4iv9eskb+Ys60iAtwZFj6NBwh3Z+4qTzlXW
	GrQe7d44Jq4BNPbluFETNBbn/sfcwTZO6qYqGDBpPIzueSi3Hjc+VPv5D3BIgF+kIJjtn4
	6/a9gfMbXzGaUsairom2yHLIghitI8Q=
X-MC-Unique: XjtuEnkwNvSlYP5qrZr7rA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyptaMZyYwdRRjo8CerDLvM5JteCBQw6LRsowUNEQta7CFlFiFMZi948LRVAxeFAEEeuXFqWClOXFCF+t8AdPD3wNo/BC7JcqZOMHJFmkyROBTVfcsL5QFc/DhCsy0XrqBEHepiXMunbVpsO6fSdTo/P7ZDAPU7nAODG4dR7QTgan9L0fedUb+EMr73s2e6NWkQLJvj6Salh3+ABSN5nG8r5c3GIc60EXfq4h7BMWaNVXB+HOxb4raDzUr6dPTLoW7jH+l0T3If37DAVWprxAFOxXbh6FTHqTbLktvQm5oEdeQwouwdX7BfYTP8BLiag63gtSMtE8wZk9oK6pfYgOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afy0kI54gIUjviHx00A3H7rP+W4FLZMtjjoh+bwDsJQ=;
 b=ENZndmKYEiFbYFVg5UOGybi3FAODoCqf7I+k1IsddLabKLdgbyn0um3BjDqNt6KUX2aQd1PMvtkuqK7YTc2w7i/y8HIMGGxgv4qGDUQ5znhn0QyZnmrsiMTNv3CZzdXgHQw7iV+iuLLD2VH4txdxpLM4QjyvGgUru/jMMbwDYL5ICnoW4wbQ914pkKrph/EbBAZ+OdUpTIuxh6BMSuPuB1k1oSUs8F2ikKPeQHik8EV4okm7kBHYeylQjd+5dBCdBn/OWkaRgdI/3Z9at6jzYOTSvlurqUq1JCCzVDs1JsBbexLaKmKphHouhK1eXqTlWpkURPwIXNnfUSxr2bXddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36495d64-ea6e-3d2e-18b3-ff441e3c835e@suse.com>
Date: Thu, 9 Dec 2021 08:42:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86: avoid wrong use of all-but-self IPI shorthand
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <935688c8-c971-53c7-4c27-f34a841168ec@suse.com>
 <1f06e98d-ab69-09b1-d460-f863827713ec@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1f06e98d-ab69-09b1-d460-f863827713ec@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0034.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cdd2671-d30b-4167-9cc7-08d9bae76d08
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260778B67D11C002393A24F3B3709@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fXA+Odeg2wr77Xs2F4PDrl4q6oLB/fgrLykEiHJKVeiJgJhFsFJe5WpqFEdiGk1kwfsPtaZcZ5sTYA/LiR4DddXu8gXkPtdfnr0FVxG0GR/6J6DMwAqVHpgtT/CmBX0bVZBiuukkt/b3AdyYYh6+8VHniDC4A/DGQGjb4tid1Uc9Ni7doYmngU4Gz7dUPWVVnAuX+b+/U180uyPvZkL54JBygp2uU3npGzaS2TEHyAyUsmFolAyRnujm5HBKcrGtfNUrZ/BufJ/RaYgde39DgJ3cWct7rZ+oQgqhBmo0oxkxqy/VYZrbxCtUc0J8GjykAIldls/f2lxgKkHuqV+PvwOspV4V2NafG5nvB2no9OyDVpnqy5/GWVXGTch2z28QjP86cHoREhH9o6NLmrCsg8gf2h0oGb+DXxVtdkw3rqAVvzwnS4g9Kq0hNytd0ZV/7SHgVoXblJOVcVg4Q70ZUbWScJI7qqNBQr5BHAXDMMi1MULDJZgQEojNg4Uv4/sVvRljevH/8y+Y9OINMaZNZw8J8oONaxQFNngHBMXGm6btkMRhomoaRosJtJhGdMBSuXrkDMtJeiObzpJf+iuwjuHtoknWjkSU41xjr2nNlF2CmEoxIPBl0o+EPfG07FQ3UzTbdlvLWy12P6LhfcruoRtT+EnY3va2WQ1lKpDVemjJo3fdMC9mFFzbV1BdnFgEfUC7obi3XtGtdkulz9rpCu1Hgy8jLTBf6mEM1XV2SMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(36756003)(4326008)(2616005)(6486002)(66556008)(5660300002)(66476007)(8936002)(8676002)(2906002)(53546011)(31686004)(956004)(31696002)(6916009)(86362001)(508600001)(66946007)(26005)(316002)(38100700002)(16576012)(54906003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hcJGM6W3c1y1qX6K7wH+MRFL9vOVMMTHB5LxZuMBjYxJHxcmmGJ7j8VwDf3p?=
 =?us-ascii?Q?slVmaEMwYEZOy/Q7QDibaZPFrjrSqw3V1BWsNqJAat+kapjNrdT9atagZghj?=
 =?us-ascii?Q?GfPAzWmP7JicynBHjtGySbIaLX7zyfV4/mnbqlWzUtnYIzEWXDnQKMhS2Svi?=
 =?us-ascii?Q?ycLSa2dXTqXtMmn/lQYMe6642SzTMhjLiUbHTBs+nQXmO/OrSgd8XQgMv3vs?=
 =?us-ascii?Q?iDbMSMrUhEL5v5kF/UV+PZpm5MSKhuxxB2R08XtRodSWQcfJj3WZw2qjGNAf?=
 =?us-ascii?Q?0fpKaPJzTnGpzeQnh+cizowf6kpz72OvZVELhcPKCjSZyaUzo/H0dIBO0Adv?=
 =?us-ascii?Q?7tXDZuYvlPQniXxSc3NYQ6dlp3adDQcTXlbbzfjIe3Bl50VPDD+iehP4sQ/t?=
 =?us-ascii?Q?pVJB37vLhJ64Ha5MY3vPjkEO8Nrr06t13VMoIlcHi54M0RkW1cO8Y9UtseyC?=
 =?us-ascii?Q?XGLJZHKlkNqddEGiM2ZMgYs6+frjV2aHUupcDobFae3wV2rkdL5CcWhTRuRU?=
 =?us-ascii?Q?Pki5B8sU7dTV1UrKf14YwNMsSphAu+1XMiSxJxWGGdCWsHUF2h4WTLnvR5ot?=
 =?us-ascii?Q?hml96gkhpvuqQysWK/fEEMElraKB3mvQGW8pn7rYO9urPAn0mTTPdPXZGJr8?=
 =?us-ascii?Q?48sPeyCssxT6Ko2Zk2yNJ1AcliUnH0F0Ew8h64Oc3L/E7BgrVUXpPsEz6L/P?=
 =?us-ascii?Q?UixrGrCXF6Oym7R4e49JvqNHo1jWXT7dEiOCb0wdyfb+f2Pi+6v87hebRKe9?=
 =?us-ascii?Q?/OrC3H+mxdXb3gEhHKsbYyTCoYBLAyzcQyg//AtwbydLDlUE8sbTB1uxfthj?=
 =?us-ascii?Q?v/HwntAQb6T5nmq7zrg5jUfur8/VwiQFB4LAbqGx9SEOq0W/mOMRzVBEuJoW?=
 =?us-ascii?Q?DrssfRagwF31Wa0o75lwWmxzIixkauTZm/CkpzRTh3vypDIk6dXKGKneozuv?=
 =?us-ascii?Q?80jtgBDgETzqHnDhb4J4sgIOqikVAhhvcujTT/sxd4R3/baSmESpUTSPdNUg?=
 =?us-ascii?Q?p4Ggrh0Z+GahNV8WwbK1aPh+0RqK+T+uuIjTxpiU0uVxiZLdYImNxok3fxKs?=
 =?us-ascii?Q?c7uZMW4nxRdH7dTZ4zVuyWPHlhieh4fg40AtWQyn4jrr8efq3f1MEUFOB3T5?=
 =?us-ascii?Q?5FGRNnxcHv1iyEJhdCFZxttoW6pSCAsc2amc4HNupXNkDNckXeCCen78p2X7?=
 =?us-ascii?Q?BJYUQEn0WHa62zQTHbkG+NoqDNkC5Ule49jQ+MbTCZJMyLTxQNLR/Wx6c7Zl?=
 =?us-ascii?Q?GIwgSDqMr5qFJx4nQxuQqppYcWcKyEE+XXfpcQWEyO4aSHECF2ovE9uPvYDk?=
 =?us-ascii?Q?WQUqs2xdoSl+U0DtgrsKbDnmyUUUwxqyWwwU2uVMYXllCOsmZigCTdlEhZrF?=
 =?us-ascii?Q?2bwlLt7noNMg7As8xEwMAiLtUkk18LWUSYveLmEN7rHZtdAbSJU2SOiQyHN+?=
 =?us-ascii?Q?Uc0BkjqNaEof4ktYjzan9Assbjn/UW1PAGXeDONSfP8Wc6hrbORSj9wt1EnA?=
 =?us-ascii?Q?O3cwa8XcaGWeqFYvek0uI7GID7tB+PDLNOOfwY4BI2BXc+wu/cUvBVhDWox6?=
 =?us-ascii?Q?ab6DWT64+mpevfld2ThXdmFkHCNrquHwPmTCScmIYTTzRB1Ib/VRJNvv2eCx?=
 =?us-ascii?Q?BmihunMK+gjINe0zZxAk3fU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdd2671-d30b-4167-9cc7-08d9bae76d08
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 07:42:18.0807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfKbOy3EoJkx8Eql8vbR92/3a6iLUOmmGd1Sv+l9vafIVzbCbQqrc532F8/JPuK0EhfyNHZkD6icjgxMSx1+vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 08.12.2021 15:16, Andrew Cooper wrote:
> On 08/12/2021 11:47, Jan Beulich wrote:
>> With "nosmp" I did observe a flood of "APIC error on CPU0: 04(04), Send
>> accept error" log messages on an AMD system. And rightly so - nothing
>> excludes the use of the shorthand in send_IPI_mask() in this case. Set
>> "unaccounted_cpus" to "true" also when command line restrictions are the
>> cause.
>>
>> Note that PV-shim mode is unaffected by this change, first and foremost
>> because "nosmp" and "maxcpus=3D" are ignored in this case.
>>
>> Fixes: 5500d265a2a8 ("x86/smp: use APIC ALLBUT destination shorthand whe=
n possible")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> While in "nosmp" mode it's probably benign that we switch to the bigsmp
>> APIC driver simply because there are more than 8 physical CPUs, I
>> suppose that's inefficient when "maxcpus=3D" with a value between 2 and =
8
>> (inclusive) is in use. Question is whether that's worthwhile to find a
>> solution for.
>=20
> Honestly, the concept of "nosmp" needs deleting.=C2=A0 We inherited it fr=
om
> Linux and it wasn't terribly appropriate even back then.
>=20
> Nowadays, even if we happen to boot with 1 cpu, there are normal things
> we talk to (the IOMMUs most obviously) which are smp-like.
>=20
>=20
> None of these command line restricted settings can be used in
> production, because neither Intel nor AMD support, and both require us
> to boot all logical processors.=C2=A0 Everything playing in this area is =
a
> maintenance burden only.

But you realize that "nosmp" (nowadays at least) is merely a shorthand for
"maxcpus=3D1"? I don't think you mean to suggest to delete that option too?
What we did remove long ago, matching what you say, was CONFIG_SMP.

One aspect of my consideration, which I realize only now, would be that
then we'd have a way to test "flat" mode even on larger systems. This may
be relevant with there being less and less systems with no more than 8
CPUs (threads), and hence that mode probably already hasn't been tested
much.

Jan


