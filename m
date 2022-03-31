Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 622C34ED600
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 10:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296768.505232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZqNs-0007WA-57; Thu, 31 Mar 2022 08:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296768.505232; Thu, 31 Mar 2022 08:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZqNs-0007Te-1n; Thu, 31 Mar 2022 08:42:24 +0000
Received: by outflank-mailman (input) for mailman id 296768;
 Thu, 31 Mar 2022 08:42:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZqNr-0007TY-AD
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 08:42:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b6f7961-b0ce-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 10:42:22 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-y6XXvykpMPyCjqzkvfjpVQ-1; Thu, 31 Mar 2022 10:42:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 08:42:17 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 08:42:17 +0000
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
X-Inumbo-ID: 7b6f7961-b0ce-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648716142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odKDh0pUb8P5ckURyQZJnyR07ELjt2x593/DI3/G4I0=;
	b=X0Py6xWFQMt1jPsZMCmolbBjQuz9j1ntGGE0iusp3Px6GgURUh9GcPQWA9jUjsu/ZTd6g4
	g37iAZ6eUDy4uzfcG3AXiVhjljQep1MpabfWBUlxB8KxMKeKUlCNJqxlTFJD9Ixssot2lb
	LFsdUqePcAXl/w9HiPi+2iq/EoGAnq8=
X-MC-Unique: y6XXvykpMPyCjqzkvfjpVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BR0DaytymPK50G9woauW7o3WsYTe9Um2bz94bmTHnY0jYLyzhdki3TtIWNme0431RoHq4miJzOlIwXiuZRgURmpmbSnCtAOozWLSU5jDz9Lpu9TkoACCAHcOBqsGfI6ZEqF3eI6JHi8fdKjclXuRtx43YkhwCn8WWUNvVdwW95WRK/76L0oM6Q+LOfZ0H9o/fC0LEq38YCH6ZlkU/MUlDWvJq5XDAVoFOTfaXlv0s5pK95KqtTWvdzfV13ykaAEwS5rhAakqg3Tne3RMT04Hmg8Kx9Z94f4qFU3llRqgBJxV1y3FrcyLP2yYRq5zYwhwmeW7u25SZ7wFHQxbRThvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hg+QikVvGA78nenuqUw7zHf6Ghwa8wX98L1tevmyRyE=;
 b=VbxG5vF3JGvAcgmihI18EedemxlJwm+AZk5T6H2TKUPUjGZSHHqOF4PiNabU5SpSkPC5L9me0YxJ6Wj0BGFf0mwO3b3iXSTQUcigN279MtCDhp/mAKYd+Hong28xTTMB+ZZDIwu+1D/veywPZd1Vd7jAHr/tWv3f74IyjIJyx10R/yvaUUqMsDVV1HmwkHrUtkPXjYMPTa/+PzPkbcgP1DMzBFYTNCnErWnoJrNWp0cUjH7dXrKy6C1qcFMG05oqOkr9GStrj6F09RgsRAYBSb2cgpWnsaC2dzBLxSMalmG3UxNF8GIxPyVl+Bs11aR7EQ8jDHFnAEts7tuYE/0trw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ef884c3c-26b4-1bde-9344-aa9be30c1cbc@suse.com>
Date: Thu, 31 Mar 2022 10:42:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] livepatch: account for patch offset when applying NOP
 patch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Bjoern Doebel <doebel@amazon.de>
References: <8db632ef-9d9c-d17a-54fd-49912d88d599@suse.com>
 <YkVko/vqhfAfS5Jb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkVko/vqhfAfS5Jb@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0013.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d4b4068-e364-40b1-22b5-08da12f25cee
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3355:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB33551F716A1BA7D534ACDAF9B3E19@HE1PR0402MB3355.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rSN8t7A+v3MSUmIKsG/OBOjm2lT+rfdNIyE1YVnIVYUY+weRcZN566VPShyMEAjZsj6ZhXJPhllUYiSThHyaozCryqtR70pLNMXFEp0FaRsBRrLYtpRwpl5zdldJACZ1+oE7gZPg0YsFnTE8Ei1R26etO8JxiJDAJnQg8NcCx+VkaHEK5Lb/cRwhX7eWCxlvs/V6mGQPnBcXgR9JNCy0o5oBqSwm+IbuCGiD4Z1LgHLvY1Eg4kZFoX2YAVBsg9jq4Oeag8I+PlShcQAe9tpeHp3vylsUeSeApBMLWkdfAllVVE7uRP17emm22gvhjOfkykkNirGTxDXzrICjBURoFg9q9YouvQFmLkL62rDsAbawE2LCCoWFKbRsiYkuSZpoGbHk8U/r9M2shwbbCNwB3ZCcyHJPxQsFPkIslfRortQltokCfi0SfsckRmKwyQg8uuPG+U8vaQe5+9jKbP2D3r5wvfjMMZ+SiJw4WXkac8JTlAzBcOiRss79WdLh/viBGatyAxRlKrqMaaKUfP7E0k6dr9wHajjrPSQqf/3zDyZSoneAXmGAzkivQrXrCbqmrGOc3ua37Pqlc7h3xJohHTxBFwRsdUn4k3DC9GzxGO1UXtbvAZJGKxwPM2Dj0jqQxAnleFezf4oHs0KlOacecCY7pSBj4cYbZdG2kiyGqsraVy6JcWHxWFt+meZZp5FOP8pqncvDqFHLLOrqBm0EO9c4oiLO767AGHfEQ/UWE7Op9wDwGH5plSFA6lZGU+l+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(5660300002)(31696002)(15650500001)(8936002)(8676002)(4326008)(86362001)(66476007)(36756003)(53546011)(6506007)(508600001)(6512007)(6486002)(6916009)(54906003)(316002)(83380400001)(2906002)(2616005)(38100700002)(26005)(31686004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+OVOxVxCTsEsufwo20atroOuM5ASlCCkUssEuDqAHGOwclpzId73qGAT2CxS?=
 =?us-ascii?Q?/nIZ0z0Sb60piB8x+LK16wb7oZfrdnfBRDotsCt70UUGBBCF4/I4hFHR8XmD?=
 =?us-ascii?Q?W/zmLWDEaSMeeKpoiY35jlYUgmUZx4MFvE3uEY3+u+uk//6tq9i9FHDFbP4I?=
 =?us-ascii?Q?Q8fw7gAXfKan2AcQ0nib4QSgsSBRZr8jUEdz5Wz1Ilw7p5nEXt4/ZvALGa+T?=
 =?us-ascii?Q?2Br2W15qTAytenngee8bmu2aZeiO0wsgWf9RwD9EFZUkJfY1xdJF2LECe9pu?=
 =?us-ascii?Q?cgnrPmmtzfDFoAXMn6tbz8h+hCKImwqMHg0TGeDbxqMpBINB0U7onRcrewYZ?=
 =?us-ascii?Q?JSCZ/ohAK1azvjmllIu/LZBLlrWXnNfzxmYlG8VFLZkhffilopWgA9snKZFK?=
 =?us-ascii?Q?FiQAOUTDw5D9gTwBndqtZ5dWdajr0GN8DX/pSp+KGqg0frsSPip3EwZzZ+D6?=
 =?us-ascii?Q?DrvK0QKyqZ122vEsrt0m60M8MCKsuPkBrCj2IYCoMZB+bmO1WBO91Kgsgpzg?=
 =?us-ascii?Q?JbazzmPVJKWQ2t7f+x2gckbCDEL+JkrLFu5qpAk37ZCD0RBZ1BodJ4ew3Uri?=
 =?us-ascii?Q?yf3o1EEoLxIk1KkVHBGZmVyK9TTCYHJ+hYokeL7jUT7RCZr1C3B1Z8tK8MHh?=
 =?us-ascii?Q?UwX795s6LZsyAWPTo3HgPDPYQMTJQtbjpDPMrYYT3m99s7ZQouc+M3XgJVMj?=
 =?us-ascii?Q?p7jzDP5zmQMJMV/kI/qa8GnmGc/CNy+D1dVpY1urwFIRUgXnNjZkQIo+O7CD?=
 =?us-ascii?Q?bRCiFoHXTjrvUlj5G3I+szkafvo14nibaMrtWB9qCQcmbcuKjeVuZZkhfc0h?=
 =?us-ascii?Q?NCIORawRmjI1ZLCxRiryQCN8H89zrMTYxS8vp+LWnYFHgsAoH3StvWuOyVJN?=
 =?us-ascii?Q?hXIzFQc+nzGef9weJWLXqs7WpgSvYMnzs1v89jUbBmyohymFBPMDnRa7gxWG?=
 =?us-ascii?Q?qbsugryYfFFdnnpd0+XOJGY73T7XZE/WrUVzoG4pNoVwarnlO9nR7mUNWbR9?=
 =?us-ascii?Q?pMAIHLjzCu4GLZXZyNtUeNArTumXqEbtoVOsz1tGR72Ehc5p1pL2ZyhFn1ob?=
 =?us-ascii?Q?kz/wYwu0JSwN5BzY4zXNHifCweVcSZZwD3dDdaNH1GvSfbRpRTtw+1zyw9zC?=
 =?us-ascii?Q?K9VAzL46ZIEXGhaFWwxD55aXJoingIlJNfbpKwmfTOb6QxVV6FV0RG4cbkmq?=
 =?us-ascii?Q?Fxp4pbMGYSYXHAG60T4w9N6TVWcsO+jEggOXESkcax8Okwa/MRYuewTiwB4S?=
 =?us-ascii?Q?u7L1MufPijyDCWWVcq/yG9AfOLYOPbxkVq6M7DN5TdzCPCozt33CUEl+hCdY?=
 =?us-ascii?Q?kwTJbM7/CW5fj3UXCjJlvh5cqMS5QT0lNJLUH/cPyTxznpBTSvZXHq+8XWrr?=
 =?us-ascii?Q?/arOrzC7ZGh3Av8RNjFWVq3/sPpJp7afkizLMcRxALpM/KVgfMsqeZENFDPW?=
 =?us-ascii?Q?jGG0w/MGdyGbj56cdd6CsFssnoHq/wj9Cd6ctzdK28YBlA4Kz5Hj1FsBajSM?=
 =?us-ascii?Q?jeJQJHaxQy91wCC/EkcBBWxXKpP9DhIrlnnMZ/cniUrOtH0e8tt7M0Tp/TD4?=
 =?us-ascii?Q?xN+3MlluppgwPKU7YjNcjXcr5sgUA+fwHskE7AA/ZKrJdQWnf1iClwEmA32K?=
 =?us-ascii?Q?sD5lqnPwgB3tmD815A5m2fqyyhXL6uLoi+cOR/EpA7Czxih03cLur2Czg0Im?=
 =?us-ascii?Q?QaUimRWOFW0u/a/195LqLWEhaW0fOpo9YuADAlEpnssm+/12Keqm2ZKM+p5+?=
 =?us-ascii?Q?yYClYK7ONg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4b4068-e364-40b1-22b5-08da12f25cee
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 08:42:17.7779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gkpd72caY9dcv9qooJFxNN/8BSUv6ZONWjdXHEtf0HblcH8xacfeJEfN9x0vaOTdo/UHFBlvDnejXwG2bVNcYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3355

On 31.03.2022 10:21, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 31, 2022 at 08:49:46AM +0200, Jan Beulich wrote:
>> While not triggered by the trivial xen_nop in-tree patch on
>> staging/master, that patch exposes a problem on the stable trees, where
>> all functions have ENDBR inserted. When NOP-ing out a range, we need to
>> account for this. Handle this right in livepatch_insn_len().
>>
>> This requires livepatch_insn_len() to be called _after_ ->patch_offset
>> was set.
>>
>> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced =
functions")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

As a note to the livepatch maintainers: I'm going to put this in
without further waiting for suitable acks. Just in case I'll put
it on the 4.16 branch only for starters, to see that it actually
helps there (it's unusual to put something on the stable
branches before it having passed the push gate to master).

> Albeit I don't think I understand how the in-place patching is done. I
> would expect the !func->new_addr branch of the if in
> arch_livepatch_apply to fill the insn buffer with the in-place
> replacement instructions, but I only see the buffer getting filled
> with nops. I'm likely missing something (not that this patch changes
> any of this).

Well, as per the v2 thread: There's no in-place patching except
to NOP out certain insns.

> I'm also having trouble figuring out how we assert that the len value
> (which is derived from new_size if !new_addr) is not greater than
> LIVEPATCH_OPAQUE_SIZE, which is the limit of the insn buffer. Maybe
> that's already checked elsewhere.

That's what my 3rd post-commit-message remark was (partly) about.

Jan


