Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9DE461136
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 10:38:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234401.406808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrd6r-0006xv-9y; Mon, 29 Nov 2021 09:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234401.406808; Mon, 29 Nov 2021 09:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrd6r-0006v1-6K; Mon, 29 Nov 2021 09:38:05 +0000
Received: by outflank-mailman (input) for mailman id 234401;
 Mon, 29 Nov 2021 09:38:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrd6q-0006ut-Bs
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 09:38:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c59352a-50f8-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 10:38:03 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-S85Uoo3EORawvP2qSjZkwA-1; Mon, 29 Nov 2021 10:38:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 09:37:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 09:37:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:110::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Mon, 29 Nov 2021 09:37:58 +0000
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
X-Inumbo-ID: 0c59352a-50f8-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638178683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZRJv5tos3CyUDw9A51M5bOjixVjt4JksAV18q7LJh7c=;
	b=ngSMBdNc+vCOXUiUQZP6ztucdzOJ2CpzrNTsx71oiljJY84RUfalRUhCZ68fxzbR5Fj8nQ
	GNXchTViO9FxLQuNRr8C7SCUyfrspbKP8R+UoPMruRyaX3i91si3657GV1WArAi0rCR47B
	B26u/YWsX+tuijh5vcpRylqiya2aB0M=
X-MC-Unique: S85Uoo3EORawvP2qSjZkwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpLkqNb4qO61xblaW1J3+2xZfjvSLdKP9LrPgmAhP5ZhhCW38iRCc8nyO7eBmpw+c+OOUhX7Knhhn6NtnM44rrJfnrsOvXa8cS8LxuOzEHql9EuTpYcorIRsgTZcQT8HjVJTv7iOahlrUwZw6viZJdyvRD4DkZ7s5yyaaj0gd8DLzApQeGeknvIatDcW0u9uKv0I6ByhGb2H4wihhZAsMPtSQd0MtKmQ6J4gfGw9guVxiwz+oBLODIRYHqvxUIMlFV35LVfeBjUmlZ/vlgkUymsngxn0afo6QX8od+M90rNyA4Ns9hEjgja68xDiAxW2HD6NSyBPQMYv0cqtYF0s4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Bi1BQoraXlfbqkB17JzrsZbnAi0QmH6TcGduMLGh20=;
 b=UH3P2wTcGeN2/Qg754BS4EIEYjWMLT2JfmufLeEwL+Ia5qsfeImGge18X4lUyPH9HeZzY0KBJM01uXyW2+Z7Rs4HrBNYEn5tjbAOisQrWm5MynqArxeArtTES4TbBXW6ONzX4I/2Oj/6ZzY5XY5N7V0bIWIMyRJT9VcGho798ig1DhpRd1g/j3ugkD9kFhCHgL0/LhbhePw3GMgiRC4rjpQyL1IF092GlUlxGOIhX1jMU+Y9kYcDY/MZyaquAn/S9rlIKeptZ+yCTJ6xXwpEGc+ZqLfoiuDCQxER3+DqpbhE8Pmi6VUhkV/goT46uIjt8FHdnvsHktGaURIPgC7lwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b9a0370-a55f-f773-2dd8-f3398685c9a5@suse.com>
Date: Mon, 29 Nov 2021 10:38:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 04/65] x86/hypercall: Annotate fnptr targets
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-5-andrew.cooper3@citrix.com>
 <374c6213-4319-91ba-6b69-c695d4b2cd87@suse.com>
 <02af4393-8b31-960e-c509-012b3ce09703@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <02af4393-8b31-960e-c509-012b3ce09703@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87b49a70-1477-43e2-abc2-08d9b31bee20
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63840A696DE42EC5AA593DBEB3669@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mRIjpHZdRT/ovTw8MPFCNAwwbarRJbHTOqOmYJXEERh/F6cTHBF1vSXvPA3He9pxOPxXkNuqFmCUhLbnycoqC0xPYuCq0vr9YJ7grMxIsIJFUdJ0hcHinnaPZY2pXiDO53nWyI8VWII3PYS7bsyPml6TI7B48Pv8h13xu3IrNkH4Yi1ANO5LvRLwIUxt6rcoe24hLVGcc2Ki2t+2KPIZ1yH9LozpgGw8yByUZhMZPjCPurXKtY2c464PpQUL8qssOmWb1pFuIlF7SPr91IrBdj5apKd9RP7CXVmMrADEm69nwbvJfKfMR6GFP57ZguAQLEPDHne1VX93/540LtICXkRDgeddZL/j2MhQRTMreVTc3T8XSeFdjgi/Snh98Qz5mbwoAUsQSHwqg+/bdKZ7g19yb8sGDacmDWTG+efvdnNfdBWc8QBvlKhI2ipFM4zwDvDqwE/7IHXr7LIaVMBL5L7DxHz6HJw89Gi76PfuGQ+dXKxPn60t0x73tPN7coTGtV19ag5Rd2JlDllWGnDC4YtwlGlerz24F1ezz4Qc5IkUdZhNbG08CNzZmPLCPHl+yiOvzECJ+dxpLPDZs6lXeYo+eWF019jpcT/8FjUZQRj3HjiQUZxxrOYxMWIfCD4X2GNCdWOZsXSE4xePaCylhLmN7nwwkPnpUheBBZl2N6zGovShAnk74p0A91ngrfIK0L9MGtyZuKn686MVJHhgfzCshNBgQO5TUa7tSGQYWWqnFEDVDE4QeNupzn2HaCLr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(31696002)(26005)(36756003)(31686004)(110136005)(16576012)(54906003)(316002)(8676002)(4326008)(86362001)(38100700002)(53546011)(508600001)(6486002)(8936002)(2906002)(66476007)(6666004)(66946007)(66556008)(5660300002)(83380400001)(2616005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GhKKDRv8Mfrx/1LWIb6aZY8rG8SkuCxNwwXC3JAGFHpNB8Z9giEzWKzXuGCX?=
 =?us-ascii?Q?oulARQHu6yHwo5B6XvJodFHpqziArR/ncMLUbvP9ph0g4FbAYQerbCcGNn/3?=
 =?us-ascii?Q?PRTdr0lBRqE8ZQdlYRn9dZLCDkIUGofYO95kyrESWzv5vavt0E9fuRMk1BGF?=
 =?us-ascii?Q?zazUrVgGZ9gpJdIyVws6lVxqsJT//1c/rE16iZMSKVicyphDnXI4oRW5s7e1?=
 =?us-ascii?Q?2qgmXBsu4PDSSKNK/Jv3Ai01boxKdXU5q32ysrXbL6d7RalPbXM22NlS6sZX?=
 =?us-ascii?Q?VN49iGGYYThjTH4WPZi8fCJ5YwOJ8OCWwNoKv2WOD8BDoPpmnPUuJjkNcvw1?=
 =?us-ascii?Q?VERrR6diGgYtxEuGezJeQ89tKuqHRGgSVSDicoG1Qaohj0uFeNp2QndZSC+g?=
 =?us-ascii?Q?s0ihvc9lJbt6piiOudPeTJt9p6R06aEp5eYCEiciGEnB+5aSbHpkUQT5fYvJ?=
 =?us-ascii?Q?J7o745bGVLeCleKZ7nPk81LeH8X7uFHpW3JaJ5v9B96Ed+uPy9KBvXjz6ziD?=
 =?us-ascii?Q?ctQwQuteMV148nvDOsELQ15P7VsEINvQhtWomDFsMSCpAv4jGVbxDGlOg2Ys?=
 =?us-ascii?Q?Z4m5Xy2h0QW7cw2YVl8ccygcaLfchyxdCI+be6YA76txUQcvpDmb1/F3gC/e?=
 =?us-ascii?Q?4hkcuQDdmZbKYsma4WoOsCCfdqkkMKmHCM6aeINasKmc/lLVp8g6C3lTG6hr?=
 =?us-ascii?Q?LWQVQEI0ejIJd9YjYveA8PY3UvZu4xoM1rSFrT3VRHrqzhOBxBm+VF32a3hm?=
 =?us-ascii?Q?F4qmdrP/FhEFl1vD4c8DbOcnOXlsLyFwQCzpj3KIlO1aoeztWuwC116442ec?=
 =?us-ascii?Q?ttR0aILQWMnjCZ4G93Z2PKqtlwlQI9Lqb2fIqjq8VSJsWDhuCKdPaUT9inPh?=
 =?us-ascii?Q?3IKifw44eox6ZNffH/cTlZURcFm1gQOFaWYLcyK/fXOTYsreSK2Wd8AL03v1?=
 =?us-ascii?Q?TPkeSLXkc07eF6WFh5c/282a7OCiAMJiSjR2CZ4+T5GRLX9synAJpNX80WtV?=
 =?us-ascii?Q?g1UOzYZyyv6cZQ+2AZj0crI0upvz344aJ7j/VMZ8mggX582qQrASCLLWuQr7?=
 =?us-ascii?Q?3m3o55PFXBQz/AgpW6K1saI+g2ELy8b7ZehiZj0rAh3X6crUDwnlNPay4ZbW?=
 =?us-ascii?Q?mKEcbbX/XNqHeP+AOzP64/vGLU70ofkYsYahsr36bApHxU4oSoEw91TkYlZq?=
 =?us-ascii?Q?8G4OvQFsGrFqPnJ2OG5sU632dPeFsklwYQMhaeJbpozEi/aAYhiBv1lvD1+V?=
 =?us-ascii?Q?sYK1dglzPCwPb+1vv7tmZE9PLNBbgFLmMfcn7BjM/hBUDLwE6SCj+rjn1R2a?=
 =?us-ascii?Q?z/2b01ta6KopkWGCxwVd05r8148qEw8YW7icIEEgxP18PNINJpGTNe04iRM7?=
 =?us-ascii?Q?czjK5/faVx8yjJ+oB8fEAV3gDjFNP86LCgoebdoEQfMu9NvtYJMSC+H3hlts?=
 =?us-ascii?Q?Q0MYh9UcXiLiPj4NzhIzQUzPkqzEW7R9H6iR6D6RhEpcFxsUQHBTAUScjj+A?=
 =?us-ascii?Q?SveePMWBle0fWcPpH+IHLyWtf964BSNU6abDT937HHPx8PJKsxXn04FqJc0f?=
 =?us-ascii?Q?bmfcHL+0TODCuX3Xu9Rz1apyfuOz3kEz+yMb2TB/28je7EQpDolu9L0npYsR?=
 =?us-ascii?Q?vZq1zHnRU6yoL4OgpZocq/Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b49a70-1477-43e2-abc2-08d9b31bee20
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 09:37:59.1362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhbLpS0ALi/QNNbVmUAFDWtBFm2CsstSiJNuDtThyWkIgesdj5h5+o4iDz6y+qmy0iaJUIvlnNQWI61u/2zBHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

On 26.11.2021 15:28, Andrew Cooper wrote:
> On 26/11/2021 14:21, Jan Beulich wrote:
>> On 26.11.2021 13:33, Andrew Cooper wrote:
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> I understand there's not much to say here, but the title saying just
>> "annotate" without any context as to the purpose of the annotation
>> is too little information imo. I guess this then goes for many more
>> titles in this series.
>=20
> I really couldn't think of anything useful to say.=C2=A0 Lots of these
> patches are entirely mechanical.

Them being mechanical is imo unrelated to having a subject which is
halfway meaningful even if one looks at a shortlog in a couple of
years time. All it would take to disambiguate the titles would look
to be "...: Annotate fnptr targets for CET-IBT". Arguably this arch-
specific feature may be a little odd to encounter in common code
logs, but that's still better than being entirely unspecific about
the purpose of the annotations.

>>> --- a/xen/include/xen/hypercall.h
>>> +++ b/xen/include/xen/hypercall.h
>>> @@ -18,12 +18,12 @@
>>>  #include <asm/hypercall.h>
>>>  #include <xsm/xsm.h>
>>> =20
>>> -extern long
>>> +extern long cf_check
>>>  do_sched_op(
>>>      int cmd,
>>>      XEN_GUEST_HANDLE_PARAM(void) arg);
>> What purpose does the attribute serve on a declaration? On the surface
>> I would consider it meaningful only on definitions, like e.g. __init.
>=20
> Because GCC treats cf_check (and nocf_check) as part of the function
> type.=C2=A0 Simply getting it wrong will yield a "definition doesn't matc=
h
> prototype" error.
>=20
> Furthermore, it needs to be visible across translation units so one TU
> can spot (and complain at) creating a function pointer to a non-local
> non-endbr'd function.

Hmm, it might well be that way, but that's not what the doc (for 11.2)
says. While suggesting things are along the lines of what you say for
"nocf_check", for "cf_check" it really only talks about code generation:
"The cf_check attribute on a function is used to inform the compiler
that ENDBR instruction should be placed at the function entry when
=E2=80=98-fcf-protection=3Dbranch=E2=80=99 is enabled." And even for "nocf_=
check" it talks
about extra compile time checks only when the attribute is applied to a
function pointer variable/field, not when applied to a function.

Jan


