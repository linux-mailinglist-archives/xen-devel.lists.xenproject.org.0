Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7E3BB907
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149906.277255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Jsh-0007fP-L2; Mon, 05 Jul 2021 08:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149906.277255; Mon, 05 Jul 2021 08:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Jsh-0007d4-GU; Mon, 05 Jul 2021 08:23:07 +0000
Received: by outflank-mailman (input) for mailman id 149906;
 Mon, 05 Jul 2021 08:23:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0Jsg-0007cu-K0
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:23:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38488aa6-dd6a-11eb-843f-12813bfff9fa;
 Mon, 05 Jul 2021 08:23:05 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-NCa0M6c4Nf--oMymD_jP1A-1;
 Mon, 05 Jul 2021 10:23:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 08:23:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 08:23:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Mon, 5 Jul 2021 08:23:01 +0000
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
X-Inumbo-ID: 38488aa6-dd6a-11eb-843f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625473384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6I6mIlcgCPFdIPQ9lBmvmFHFSFqhliUgJ9G7du5aNmQ=;
	b=T78Q3AXumWgU8aiw7Kdnvl7FxJxeFovOp8YFR2XQ2f8UZhlbYaozj5sIHQCyFm+jRN8aMA
	BAexTAOWEz/JK/KImjCuhzlEU7CK5RLNAGIM2k9YQDQwnJdHHM7O7snldNLVq13KO3ArDp
	QYFGKguf9Pv/Uf1oOnwUKS0FZyLGv2s=
X-MC-Unique: NCa0M6c4Nf--oMymD_jP1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDxzAHj0c/X+8UcvDdLaub8tfE/nr6K5tklmYhUfUlBkp7Nl7ZSducvurAEhkOcSo+8pdd2uuNLdIy6Rp/aXPTnup7QmW5BUR8DQwM7b9BEykr3rq7qvet4DG8btCPNzuB4qc72zJglMBo6WoMY+r/9tWLtf04Nu+Hl+2hfcOBuG0cQSNA7ll7DDBxjh4Lt4Rg/pl5XhtGGanc3l+Ece3XUROIJZKHJi0WMEcszcrg40GbBIw5d5w57G3ploScd3jTL/9O29JeeGKUQcb0szTcEAdtICVF5Q3EUB1fjt+pAwUZiwdQd583kk+iu28UAgeeqpf9l2cqaQLs826daSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I6mIlcgCPFdIPQ9lBmvmFHFSFqhliUgJ9G7du5aNmQ=;
 b=UjN7+91zY+GR9dMtgkY0rjIgA7k44ugslwV33lkMWh7ETzcn6gCWbEb0s2d2WlwM3C/DviKMv4Hw9+N+aHaLbK0ft7m2H4ruVDa5Peo5xU+zWjG6Ukm1crB+mWwlmzcuoiUcttQ43jN7tUO/b+D01GkqhXBUdg7KRwgEG3/w6AeXBkil4BHnT5nG/tlbeNHU1c5gohRQrT7RwAzHD51IakoQb9uGqniOescbUvwf7bH2l6eYVWlx+HwT+Jhd84UAz2XSjNGGKFn5QJ3Oqi1FkzRg3XIK5Agxjgmg/R0mx3XzF5CGgkgpxSns7QBVShzoyEg5JvLrVvUrLJs88zkX/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools/libxenguest: Fix migration's debug option
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210702190342.31319-1-andrew.cooper3@citrix.com>
 <06968742-355f-ad37-0681-e51eea256414@suse.com>
 <20210705100228.4947ed4e.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed3ceecf-239f-9bd9-e040-5246c9b49f53@suse.com>
Date: Mon, 5 Jul 2021 10:23:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705100228.4947ed4e.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 804f2bdb-9019-4642-e7b6-08d93f8e1ab6
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43810754D4DF7390BBC171F5B31C9@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u3+ZdEfZ2ZD8gB3F/Hdv0cm1w2XTfjwON5dIQeLFI8o47/Ki0uREJOcw1KNbdCnqDTepgFILYh1sXiXLRv5kPmPdTuVm9+4bQ1epwW9VlYX1wz+9JLR9hPszrGP9ykoNhck+UDkM5nt6T53+to5wQvK+Iz32Z4PVsqBVlCzpjfz+YGU7Bhp62nbbTrMmvGfDGhWDWoGPfcyA5aQQrERViDoKGJ/w5WQuTWjRQWiB2Z5wjZNUn8d+nnPFrY9hAvThzr+cf7XjoT5ljJLbinA6gTYGbCRrbEgs+CB2sNhNF03l1ooWsUQgqY5yOtDNhLO4npVnSbYziY9FIALmMgJqtDXgLbvzdWRoJXb5v+IRy0rEfJ6Gr02kzCvSDijDoPo7ymPGHsqjeCrWt4j+HopTIyFpOr1cx/G6IN6Ul58eAjzeJ3BweCOuwd4M5Bo2enaUkcWd1MmLvyNvJgZVeK4f3Uxi7i43Gb/iIsA1XkiMoJA0eph9RkYh+yitSUUM5qgs0yFG+zEC9di7qIu6horoujJy30hI+jycXaIzwEOV0TZ9ELOHmAJDDneTMLh4evEOCefY+QxbEHz0uFERHj5W3runUYuIMsetsReRW0Inwx5ZGcf1TN6TKCqxrf51OnjB3nCwrr0LRu9zajqNyekhHibiOnNC6h7vgvNPXqi9b+KV+hGgeiUJPvQHCvpOvjdPbsy3oeKL6asZs3OoWGfeLWKR3A2m+Ueye0EJV0Si4pU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(136003)(366004)(39850400004)(2616005)(38100700002)(6916009)(956004)(54906003)(16526019)(66946007)(186003)(6486002)(31686004)(4744005)(26005)(66476007)(66556008)(478600001)(8936002)(36756003)(8676002)(5660300002)(4326008)(86362001)(316002)(83380400001)(2906002)(16576012)(53546011)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?Windows-1252?Q?QirCUJ1fU/GF3JnVxbZLBACr1/b8d+TmGc5gj2Dv0m6W0QxkpOgJCI6G?=
 =?Windows-1252?Q?rqaj46R19yNvQ6Kx+BiS8OMa4NjI+KXzBEpYIcPBFmFgPpYh2R9pQS9M?=
 =?Windows-1252?Q?fwejlBfgLdtf/dlp+iifUsiTqXAo/ZaN986eW2uk/VVqgLK7Nf6eSO/f?=
 =?Windows-1252?Q?JmhYCRRpleuvTZIfqjvBUXHU//hgzPAt2XAzJl1wWJC3mkTXLf0rgqmr?=
 =?Windows-1252?Q?6Fs1CAtOsTzNBINALX4UGVlwqEcfiQOpSAHZuKSb2ILxK5jjcmBnZuns?=
 =?Windows-1252?Q?CfmZd2S4oMX/Dth2UNm5/rHJoyubyz4tXSLBpaRYjLMotrxAF6UZlOYr?=
 =?Windows-1252?Q?PPepFEBKW7OUW6CUY255UDAPiFHFUtnIL3dZWd8T1E32UpSW/mmnEQ8d?=
 =?Windows-1252?Q?A/UK7nDADuZGXEgMjNtLpa3txMgWrOK9r98zmswWlDfiy284HHGwy5cu?=
 =?Windows-1252?Q?Im+f3iyZZ4uSnbDxSZ4hhH64EnEvVKuQ+sS6c+3l0nXsbGjcgnORdVuz?=
 =?Windows-1252?Q?Gud7icAIKQfCR608H3uxlUc5Sr4NbZsgPbRQ0scLUZ3KRJ+t35t67roD?=
 =?Windows-1252?Q?ZQ+Oif4iklzr8/pXarYJGeXncZvB891Tm2OrFzYsibjz2vtJTgW/l65u?=
 =?Windows-1252?Q?+N+wbCynrJAqqFzhr/iWg0AsXAlT263/XymiirHC7GXbcyFIAHjMhLrQ?=
 =?Windows-1252?Q?R60R+zjIYDQyz/zAymcG2zrCHibZBlT+wo1ebwdJvQtM09xx4Mq9jOt+?=
 =?Windows-1252?Q?Vmo8BzQOROz9h8G1EaTlGasaxzljGOqcUIUeQaElAzbhKPnb3Vhl+xS5?=
 =?Windows-1252?Q?k9atMdmLCIJ/mEdaPsDFyq2N6lZVlGMuPS7Q4ZlC3xYKjdQr6lbvtrdn?=
 =?Windows-1252?Q?ySGm5u5GhIwQNAD/Z2Uqt6gJ9CcuQGBJwypaWuqZJ1HoxweyoJWI7YDa?=
 =?Windows-1252?Q?pRpFG3Ys7CApNJeDokHmbeYxFGq0Pl/yTo9xZIn4EXoAi2abCZDAzS91?=
 =?Windows-1252?Q?TC8qnS4Pw7mWz8g4R8L8LkKmaCYO7Bqz5K+YCNjiOHAtiIIH4c3SI09I?=
 =?Windows-1252?Q?IgZBEmNlDk2QQU2MEcZwmF0fEeu3hIpBiX0nuWawJ75SYBlwHLRcZRyx?=
 =?Windows-1252?Q?aN8SGHL129A0FVgbwotdTi+QcyJDmj81G99U+n3U+hZUQQthR/R+zN8R?=
 =?Windows-1252?Q?G4XioFjHfgoVul15trlcX+l3ew2mRrGJ8C8+ZZXyr/Zxwj1EzB0bzSRz?=
 =?Windows-1252?Q?bU3Mo9QymM6i8+lDU59dJ9gFAD47x1/8/YsIUCbIbOrHWtNuO4p5A9Wx?=
 =?Windows-1252?Q?oU7BCWZzilgz+kDi3aUzxVFMpD1IxW5KmzwkcKAi6PZJEjwz16Na8YZw?=
 =?Windows-1252?Q?rQDqMBsXLPu6benV36O3uFhH2fGGvNEVmhY0YYzNJw+gNUseh9GvFIp6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804f2bdb-9019-4642-e7b6-08d93f8e1ab6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:23:01.6795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKTN5XDcF/2Bs4OmP9cBjBFODbijo9ghvDFecwj9IDMbi4QlZ8Elh4XW/1R6KVU1eXzYLBPzp9kbY+GMpLPJ9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 05.07.2021 10:02, Olaf Hering wrote:
> Am Mon, 5 Jul 2021 09:57:21 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
> 
>> What is "the grant problem" referring to here? Neither anything above
>> nor the offending original commit has any reference to grants, or a
>> problem with them.
> 
> When the guest is paused during final transit, the backends will
> continue to write into domU memory. As a result the final additional
> iteration to verify memory on both sides will always see errors.

I see. A similar problem then exists with at least the FIFO event
channel per-vCPU control blocks?

> The code has no way to know for which pfn such mismatches in page
> content can safely be ignored.

Well, in principle this can be known, but it's expensive: For a
paused domain the grant table can't change anymore. Any pages
referenced by a valid non-r/o grant table entry could in principle
change.

Jan


