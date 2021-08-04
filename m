Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80653E03FB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 17:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163750.299874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBIae-0007Xz-Sl; Wed, 04 Aug 2021 15:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163750.299874; Wed, 04 Aug 2021 15:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBIae-0007W6-P7; Wed, 04 Aug 2021 15:13:52 +0000
Received: by outflank-mailman (input) for mailman id 163750;
 Wed, 04 Aug 2021 15:13:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7SU=M3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBIad-0007W0-1h
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 15:13:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9187d87c-f536-11eb-9b71-12813bfff9fa;
 Wed, 04 Aug 2021 15:13:49 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-aVAV0xQOMT2d_CxmFoJ3UQ-1; Wed, 04 Aug 2021 17:13:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 15:13:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 15:13:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0284.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 15:13:45 +0000
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
X-Inumbo-ID: 9187d87c-f536-11eb-9b71-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628090028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8JNTBLY6Z0sQ6/6AOlYg68CLIDK+UNOA1Idq7NdQhIo=;
	b=ejXKh6Z21jG23vflJYyd+TuH5vaTJuvuZ3pJJWwU2GGGdkaX6RcuGXXH8R2014se9sXhgU
	D6cm+Lmyjxd/esvg5JfJlbXAqoOI6pbKuHyVvv8V3h2CF04Y8XEDxgtyqRnwb7ao/ekq/6
	k5QTJ/98sMhS4DwTV4uRvzf2o7ghFIA=
X-MC-Unique: aVAV0xQOMT2d_CxmFoJ3UQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3v8/pE0N+y0WxBTrFr+GqnfdiWWUY/dUzy7/wAnXecyzrQeq2RMaUgjaVKTw5f5+3Tk8VDgiWjDgDNoNvqqswIJ3EqbRzEfrkrB/Qq+11q3RSeyyXNacVPAzl9VlvrYgD0RYkOi+MMuon+3SyatGbR0IzsE0bWPi6wMnjxJHAFI0XUjOYOltCfE7Q9qxcw0DWCZcvyZdUycL9FMxEnyzdTklauZvXN6y9QkUfxLyJpsyuqMvqRvcBNUmNQZ6iN4e+FCilkfUjrTTkL5uyMN88sBsIGfNXXko9fu05YDMNyagc+NqFrrDY38EckBplBvIcfc3uQ8tdZ4+HZq5cqaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Al1IjaVLLEgW/ffilDr3J5qAfc1MqdUnjbn1MnErqQ=;
 b=h1wDf6OI045BUZJFlW3/qM8RgLHU6vn3THAFP1GJEgX66QSAkpRX/NuBz6yE+tGguS8WORznkfOvCp36N73FKTTakhiNPgu64d7FQOyn41P4k4200KHZmABgjxbhWKTAbwQDbgbR9W/kdOCVuhk7Slqb3GbZsbxf+sk6rd7+RHjqhn9Oml4T1J5ZUCCK4eYU8IHFq1TX/DK/enDCIvMtCn0TVb4JMhm/LRD6jlXuOtzrg7FEm32+hpDhlxnNVq5rgARJk76c4zjapxBikwoGk4If+YMDrhN8X+2enn94XKqjj3FR3iAxO/v6gfi469LQ8Wlasb71fyvkec1ZhJKovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] Xen: credit2: avoid picking a spurious idle unit when
 caps are used
To: Dario Faggioli <dfaggioli@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <162801221667.955.3439735419862661383.stgit@Wayrath>
 <d8c821f4-8cdf-8d77-90cb-5149a70c7741@suse.com>
 <dc1f7b4c18e46d1cdadedc9db2fcab516ad4cc81.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96a43429-798e-1bb9-7718-9ccf02d7dfeb@suse.com>
Date: Wed, 4 Aug 2021 17:13:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <dc1f7b4c18e46d1cdadedc9db2fcab516ad4cc81.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0284.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 477dbe49-931b-4969-b75b-08d9575a73e8
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7087B6BB2ED00B8CA125D369B3F19@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8dr9x/4BQSpBO4RDQM5MdUT7LYhHrMgvPSDogy0KiEDeHzWtwV+sheaAB1x0N3xnyKM0O1JArRQdHyfCBGdkSW55jBJeNRj37TulbDSB1Ty2YNX8NplZHwJ/RI3aF6o/4a6u+/WM6rsVexZJWCC4ksUqPCeCMN3S4ch2yndzks+sVYSZCAQRvSFcvWfYpv69ldOC5I/NzbM15YlY6SxLWS1imd4oJsakx5QQYZwo+TkrX/3WKh00l9T82A2dOFqVEiB1ooEbLAOxz7jj4uimu4UwyCke5OEEOwL7e0aGCHS3Kk9vNFY/uClZ2Jb0wUeryp1Z+WOE6IOKeSwE2kdi1+f/oXgcx6SYxmXM+wDMnqB/Vz806yyITRyVKXTKxxAH75YtW/zybaSEIzU+z8LgSvJrQJYR+Xi24EqLNj/utaW2hRCh5fpzRxoJO79KBY5w21zeXlxhop9TEV0lnHw0rJqTMnKy2jzSPIV1pXLLQSAwryIl5JrcKlkGeOFsTpqsaxSkDlMrydofPQyyCw26kgppP6OUxjFOhzk0vPQuNYy/y8bdUrfmoOSP26t0iBXKzpjZ3VtiTx3p9Zfy4ntI3K75RhBvyuhA0Ley2zLU4OCXxBujC99uo+djCjxqmccPM509NPhfQsde9QKJGDaJLHBIaG8DXbIgdwI7QEO8Yemk527y3wN0rHF+PEBEnw9y2XIga/B+esMgw5cfQGwuYsQo7JC7ydb9VH6pKOf37jw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(366004)(346002)(376002)(83380400001)(36756003)(31696002)(16576012)(186003)(316002)(6862004)(26005)(6486002)(4326008)(37006003)(66946007)(5660300002)(2906002)(86362001)(8676002)(53546011)(38100700002)(8936002)(478600001)(6636002)(66556008)(31686004)(66476007)(956004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bNt2QcXdOKtKIh+MbKL0OxsPe5cUOhe3CXeKlL26ooYN4ye1ZkGEwFnEgZ4o?=
 =?us-ascii?Q?qI5eZUW2m1jK+9LRfA5QHFi9SxXZgEBEtfFrAshXyE8wDB5RyuLsUvEaMc0S?=
 =?us-ascii?Q?vHKahJFieWQoyufAXEr6N/swBJNN5rrs/AniQbSszWSPti35SppmuAIAqqbP?=
 =?us-ascii?Q?o3X+F0wQ7i6JBkuhaC5vcL6gX49pfS20gy677s1AHg0XoXoAhTEG+VbgwacG?=
 =?us-ascii?Q?8x5KVqp7cl8S8mnj1pVr9ovkStkpsgWmMO7s4NReZkMCFdj9Z3kUNngPwgAy?=
 =?us-ascii?Q?x35Ehh4aXq+JicATu4AEv2Bu9xHsJ3xLcVxFrv0eVuRbKbAyeRK6feivjjHf?=
 =?us-ascii?Q?Bq0FCzTgDq6zIohTNaRjJUCqa0D/I0hIBgiY81ynSlt/Aeb4mLHcJxQvPady?=
 =?us-ascii?Q?p/DNCoxvJOmKhQ41o1suJEvT07r+rcOjErnCnW9opoddQZtlq1hxybEnr7kX?=
 =?us-ascii?Q?dVnJvkoN8PO+7CHvGUj9+AbU/4Zc4lji0/Lw3ZbCAWqkJ7yfg79JPDhy/u/9?=
 =?us-ascii?Q?4/Jx1RbAba5i9JQK4qjoZcsqwV0LD27v/0onD6orxAfr+yCJ6Qo/2JrK2NEo?=
 =?us-ascii?Q?s+5SOhmRk3Twmq0zYDS6DKafWDo1VjsSJ46kdsf2He6CHobLai8sFgZ+U/Pa?=
 =?us-ascii?Q?D+SmFUfgyYgF+uI+fblmXgGINOk6nNuguwvfeRJdi3pQbTlylkOFLEfjVB5q?=
 =?us-ascii?Q?wHxW4HzmlnnTil7A0qYnoUqwhloJxYnSQQ8qyRH/1VBwCo2Dq/69pFYRfg97?=
 =?us-ascii?Q?1CfV7alIK4rFCMUe7KbBxoy1Tij5qtfZEYRHbq7STmOkFy2ffgc77LsU2ohD?=
 =?us-ascii?Q?yltFsWEyjjSnVRP6CL1J5W4HFjK/nwcqQ0M5sytodoawBc2PAFGV1Hnih9Ks?=
 =?us-ascii?Q?ffGXgqwOrCfcD6DE/k9Gjcp25qwIUy2IITvsReBy8hqwnrsV4H0tNwKJwLwh?=
 =?us-ascii?Q?Ce4N4UzxH/59bGslfPz99Vsqr795Yw50k81BOO6f0I00CXVOUtfT4MH2QK2W?=
 =?us-ascii?Q?LtPRRN4VsCnYA25BJ46zNXKB5R3m29p0vtmk9LZFTrVV4+c+k2J9918V9EVO?=
 =?us-ascii?Q?1aBJzgQYSFNUhZI+MYzTj+ptpTDgPfzly35C5DdLg4RnCwRCqiZQ7LJnObIx?=
 =?us-ascii?Q?mL3AiSwyjL1gVQQGTwREsaHM1zYUO/ahisEVTT2IH7LaV8nvR+VZpfXKa+NQ?=
 =?us-ascii?Q?BuJ/YNlE7c/W2q/zHZlivK9D0BYNMZLICN5ApmujhWY2qYMMRGFE6vaIaeI3?=
 =?us-ascii?Q?N4N+4MnrNm40H5OysQGQ00g9RlS7F1CPn1d1FIXNsPpEWqPSRUaEm7kvfEJ8?=
 =?us-ascii?Q?GwbGa2eeXs1qCgF440hN0Lxj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 477dbe49-931b-4969-b75b-08d9575a73e8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 15:13:45.5388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmBRlsRNgkjzmRIkcnlnuKT3fCm7znIXIWyMAxqdm50kkGqV+xLo7w5sOpBhv+YBpFBfgmrQ+SUTA2wyX2+MiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 04.08.2021 15:28, Dario Faggioli wrote:
> On Wed, 2021-08-04 at 09:37 +0200, Jan Beulich wrote:
>> On 03.08.2021 19:36, Dario Faggioli wrote:
>>>
>>> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
>>> Suggested-by: George Dunlap <george.dunlap@citrix.com>
>>
>> Minor remark: Generally I think the order of tags should follow the
>> timeline: Suggestions (or bug reports) come before patch creation,
>> which in turns comes before reviewing / acking of a patch.
>>
> Right. In fact, I agree, and I keep forgetting doing that.
>=20
> Thanks, will fix.
>=20
>>> Cc: George Dunlap <george.dunlap@citrix.com>
>>> Cc: Jan Beulich <jbeulich@suse.com>
>>
>> Since George is on leave and since I was Cc-ed, I thought I'd make an
>> attempt at reviewing this. The more that ...
>>
> Yep. You were Cc-ed because of the request to backport and include in
> stable branches, but thank you very much for also taking the time to
> have a look at it!! :-)
>=20
>>> It should, therefore, be backported and applied to all the branches
>>> to
>>> which that commit has been. About backports, it should be
>>> straigthforward to do that until 4.13.
>>
>> ... for 4.13.4 it would of course be nice to have it in. Things look
>> plausible overall, but I've got one question which - despite concerning
>> code you only move - may play into the underlying issue.
>>
> Ok.
>=20
>>> For 4.12 and earlier, it's trickier, but the fix is still necessary.
>>> Actually, both 07b0eb5d0ef0 and this patch should be backported to
>>> that
>>> branch!
>>
>> Depends on what you target with this remark: For downstreams - yes. The
>> stable upstream branch, otoh, is out of general support, and since this
>> is not a security fix it is not going to be applied to that tree.
>>
> Yeah, I know. I decided to mention this (although, I probably could
> have made myself more clear) and provide a backport (of this and of the
> other, already committed patch) just for convenience of both users and
> downstreams that happens to use such codebases.
>=20
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If an unit is meant=
 to be picked up by another processor,
>>> and such
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * processor has not s=
cheduled yet, leave it in the runqueue
>>> for him.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If the unit in the =
runqueue has more credit than current
>>> (or than
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * idle, if current is=
 not runnable) or if current is
>>> yielding, we may
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * want to pick it up.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( svc->tickled_cpu !=3D =
-1 && svc->tickled_cpu !=3D cpu &&
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cpumask_test_cpu(svc->tickled_cpu, &rqd->tickled) )
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (yield || svc->credit =
> snext->credit) )
>>
>> The "credit" field is plain "int", i.e. signed. Idle domain's vCPU-s
>> don't get INT_MIN credit afaict (there's only one use of INT_MIN
>> throughout the entire file). Hence I can't see why in principle a
>> vCPU of an ordinary domain couldn't have equal or less credit than
>> the CPU's idle vCPU.=C2=A0
>>
> So, if I understand what you mean, yes, we've had that issue, i.e.,
> vCPUs managing to get to credit values which were lower than the one of
> the idle vCPUs.
>=20
> That was, in fact, even causing issue and it's what lead to
> 36f3662f27dec32d76c0edb4c6b62b9628d6869d "credit2: avoid vCPUs to ever
> reach lower credits than idle".
>=20
> After that commit, idle vCPUs' credits are set to CSCHED2_CREDIT_MIN-1
> and, for regular vCPUs, whenever we subtract some value from their
> credits, we limit them to not go beyond CSCHED2_CREDIT_MIN (this
> happens in t2c_update(), called by burn_credit()).
>=20
> Therefore, it should now not be possible any longer for regular vCPUs
> to fall behind idle vCPUs, in terms of amount of credits.
>=20
> So, was it this you were asking about and, if yes, does this answer
> your concerns?

Yes, it does. I continue to think though that the "yield" variable
could do with either a comment along the lines of what you've
explained, or with it getting set to true in more cases (as
indicated), as the interaction with the credit comparisons isn't
very obvious right now (to me at least).

>> Otoh I'm having trouble seeing why all of this code movement / re-
>> indentation is necessary in the first place: If the initial if() was
>> inverted to
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !yield && svc->credit <=
=3D snext->credit )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conti=
nue;
>>
> Actually, I am just realizing that if I, instead, use:
>=20
>         if ( !yield && svc->credit <=3D snext->credit )
>             break;
>=20
> It would be much better (even as compared to the current situation).
>=20
> In fact, right now that the priority check is toward the end, we have
> do the checks that comes earlier in the loop (is it runnable? Can it
> run on this CPU? Is it worth migrating it? Etc) at least for one
> element of the runqueue.
>=20
> With either my code or above the suggested form, we don't, but we may
> have to do at least the priority check for all the elements of the
> runqueue. This was something I knew, and as a matter of fact, it should
> be quick enough (and comparable with doing expensive checks even on
> just 1 vCPU). But still, it's ugly.
>=20
> However, we know that the runqueue is sorted by credits!

Oh - I was first thinking it might be, but seeing all the logic I
(wrongly, as you now tell me) inferred it's unsorted.

Jan

> So, unless
> we're yielding, it is always the case that as soon as we find there an
> unit that has less credit than snext, we want to bail (and keep running
> snext).
>=20
> This means that we neither scan all the runqueues, not even for doing
> just quick priority checks, nor we, in the case that snext is the
> actual highest priority unit need to do any check for the unit at the
> top of the runqueue.
>=20
> So, I'm actually re-doing (and re-testing) the patch in this way.
>=20
> Thanks again and Regards
>=20


