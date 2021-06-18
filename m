Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9419E3ACA65
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 13:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144519.265992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCzA-0006hb-4C; Fri, 18 Jun 2021 11:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144519.265992; Fri, 18 Jun 2021 11:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCz9-0006fh-VG; Fri, 18 Jun 2021 11:48:31 +0000
Received: by outflank-mailman (input) for mailman id 144519;
 Fri, 18 Jun 2021 11:48:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luCz8-0006fW-Qc
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 11:48:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3711789-05b8-4eba-bc15-e1de9a90a4db;
 Fri, 18 Jun 2021 11:48:30 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-f0LP48YXMWWEVF90w17jeA-1; Fri, 18 Jun 2021 13:48:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 18 Jun
 2021 11:48:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 11:48:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Fri, 18 Jun 2021 11:48:24 +0000
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
X-Inumbo-ID: c3711789-05b8-4eba-bc15-e1de9a90a4db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624016909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zNq6/dcayhBVL/eCGgv5P9IP7TQQV4/ngUCWpB2QGa0=;
	b=gId1psMfjOzPqa1B64zP8WEhFs7/OxfkUieaV4tIRWTXWYDJjAinIJodsHU3jPutcbYv3H
	mErsTSmNDMXm2MVjcIOJAiN97FZpIQ/iwzTmc3JtMGjDBHJraHJuU5nPgF4buANcOOWZpy
	gkcC00tCN/vnFzJyDXuX6OIe6zZUZEc=
X-MC-Unique: f0LP48YXMWWEVF90w17jeA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ip7rWOIXmvA19ArFeClCQS9NMu44mupsh+a9j5d0kDWo+/9/xo1CvwPObyYhVD19mBi+qsTyxcfPqTzjucojBwlFGsIM/SIi5Yn1yJFquigNjfCZfxA5I2HMk0HNl9vTrGRuIMSn04awyDT50SYGp2dy9Z2mSpo+40u3i+CydsHuFCVTwW9JX6QC87ytSlFCoTwgjqhyxAWjZoa2Ot7tLd0dHJKQVzoyypwpgWlbTTJSzBT0ax61jqKdjqBm9E/0oQ56JHjkiK28PfWmfMXm0g4LwetOQZ8cokFq817Eyc7Lzn0zyGk4/k6go9F01V2vs7q5OWIDCJMijjmvn0nitw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rldUnsukw/2MnnSommIzXPsDhN5BxKPLlDuZZ7OsPGc=;
 b=K9Vyo50TexTF5EUsyb3puDyiAzYZM80mi9/+0u2oETo9zlzLuJedlDGUU0hVJjqVDJQviUKc5xEfe+vxQAAFHj/3fYJT9mOWb6Gki/DN2IvtzXG8kV9uZr6z9G3wDv04W2B5bPwUYvBLtOD9Gvlbp43/nhWGWWqsc5AISvT/amYkGSps/IWp9pmx2yX5aagcQ3Kv3iYqmlUeZvRSH0omOHx5Tt+1aY/S7QQSJyqPN9bzXYzwUfg7U/BnBhwqrUMGWmbrk9akg7+U64UhA5SFC3alj5Xf+3/DtNbYmuDmlce7JkE7JGUDsajpVWdoKpOTL+ARJHJ2EdOaMDXrZRdmIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 0/6] xsm: refactoring xsm hooks
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <7219a9c8-f6c0-a86c-bf47-5b38c579170b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b921c150-84f7-3ab3-1e4a-89d00725d9da@suse.com>
Date: Fri, 18 Jun 2021 13:48:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <7219a9c8-f6c0-a86c-bf47-5b38c579170b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f2affb2-9d90-419a-421f-08d9324efb3f
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7037AF72ADEEA852671A5618B30D9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AARGQ8vwspo4FLF+IZLpsc6IQGIE7cmt4s9V4+l8mx8oejKz3wS9eUB88YCTPzSO+/0HpBK7MD24rtBHfBCuUUN7qmG01KXvaYKzi8/6rOi6+V1sSijOKgGPZ11Zawc524O/voAiiIXImTEKELEJv/YkzMz4eqbAeSq25dwjescF+t1uSkD1kEIvhx8NOCMq0FFbYMRO/Inc5FeaipZzTPHwJcTHaXppOR1t498drkQSgz8TtV5JYG/+ExN/1kiJjmKQ6eg93I5BCcHJnzK424kFnGVP9V0em12HcCSnKHp395/v7oy92mYAtd9QLTN3srbQ4nB/q/cS4VwAU00fhL2NTr/a3QOk1uliqUMQoGVrz9Y/wwi/O71SWgoYL8FIkGeszD3KnVUk1xkTzmXWxoddNujb+jQPuGFb7O/S5BmtBOivNiJuhBkV1usGT9EDskrnOTRDcATy0/VUisK6ypnu95LBWB3L4eD8FEzG0boYyomQ3I8IUoX9r9hNMWbjHe1mXHPyVtQcuSC/qM4z0wFJYPIccBrc0wzTaFsudzsMaPTPVtUHpOc8wyevz0Zz5bpR/lX3aQ8lS3BgNXqJUMAhvYRZmzK5Xd560k7BCCVIsMv7sVO+DYKCRns3LnNQ3HCyK53kc81Xohmioy9L87KLmZzRYLX7QJzjNegcwk3DWxUJHBgtB+PXq6lvJ+8Qw3u0zsC4CftnrD0TvVnFSzJ23TWMFv+IsaDQarvNYKeVmuOSa64u6GPYzNDVoL+O0p91wDSCGofocMM21v32cOzdqV0nmlikU7TcR35TASUSN501/WmOAGHvg+GiJ0kF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(39840400004)(346002)(136003)(53546011)(7416002)(86362001)(4326008)(83380400001)(66476007)(5660300002)(2616005)(966005)(2906002)(36756003)(478600001)(956004)(38100700002)(8676002)(66556008)(66946007)(31686004)(8936002)(26005)(54906003)(110136005)(316002)(16576012)(16526019)(186003)(6486002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aV40nd3VQ0Q4Q154mWilj5RzeSbW13zcdB9ZNN7S8kel+66yK0JB5G/OoTNr?=
 =?us-ascii?Q?bhWmw5nI/arRmW2vCkkjiz+Ld8a5YzMoWavMXVX7td4BVgofI7/xQ6+tWT7b?=
 =?us-ascii?Q?PwF7kixDFceKujabJd5Hu+hCErK0M4Qcmfr2BP2R5Ex5TjDLcc3/lR2ui4+T?=
 =?us-ascii?Q?PYIIbetzPVd/ulVwJHYt4XnSXrL5S4RsRB5+ExUjgrRjUtIJrnlQpprfh9QC?=
 =?us-ascii?Q?STSR/9WDW6wQGZjsLDbL1qPLJbeEGAX/icYrMYtHx6iZxBizRPbZz+gqNXE3?=
 =?us-ascii?Q?fSoXYjbwlIHNEEH6Tm/sT9STzqIDREPsigaYge/iWOlMLFJCYTQPN3HuG7Gx?=
 =?us-ascii?Q?zltO1odHaaxpFq0ZXVAYENKTCCEynmm0YOzbN57yJ4uvMbMsodAdFwLukfed?=
 =?us-ascii?Q?8PZHhs/jD5W2K+yeC87zUpvPTde0ftU+Whp/9W7RQnHR/O/AucNWfl2If2ak?=
 =?us-ascii?Q?c6kjmkEG8XPMMBtUDPgApSho1Q+z14G3lN6q4SCAOFhVmv/hnddqGRqVmM7j?=
 =?us-ascii?Q?IUfas2WGxvka/yz5FWEXDcvzytq46HptJ2rxN1Hohq5Mx9UAfkiR/eH0GQ4d?=
 =?us-ascii?Q?ymb2SS3gPR9aJYJoZuVAi5MxtVODAC034AKkJqXAWCdVOuzZsjTKvmWNooqe?=
 =?us-ascii?Q?DIqz5PxYdNPRi82DTVsgW9u48CQwzL1JDV/E32Jx6DhZeuec0FXaqMCZ1r7u?=
 =?us-ascii?Q?8uJmUKpxOj8wqmFYeStpKscB1msxeohPnRQyLTPzkXb9RmSY8fbFfcpg5YSW?=
 =?us-ascii?Q?mPLs203rg9tgWOpP72nKZ+ciBnMLIO5TNJJsXTHK1D7eUHzmiELStCs7Q8Tz?=
 =?us-ascii?Q?G3G54dN0EEA/GnR43JZ7Vk2ZaIdXaRr8BYnCdy8uyvKJAt0uclhrSuW5pGS6?=
 =?us-ascii?Q?ZqLKucysG+TaDWCufJt3REDQlNDRssf1L8kWjUznQeSq1qyU/xXmJdijXDo1?=
 =?us-ascii?Q?km28p1VlaagGrmw7J0g5eYJicK7zEXO2hSFGXjzWrzmbMcBUlMCAwXI+pZg3?=
 =?us-ascii?Q?mMhDYQkhSRZ/b+eGO0OgOUsnoRN2unQ+7LsGg5LCuGCSebjJfLZKXXvH9kuC?=
 =?us-ascii?Q?zYbTz/2rIHRTTjhrCD7Eq1aA5Fk8EZLJUGXK6s9zO3lO2YQ7wVZDLJz06ZEk?=
 =?us-ascii?Q?xJwg22X051UzEw2NxngETP1WlBCf17vM/XRDTphOf/7EOt160C/4F3ltMP5t?=
 =?us-ascii?Q?JI4S1H0yLo5ILME10uGLL+tkdzWYLwt440/y4C84PxmLJHuCIjyIVO5JEhh3?=
 =?us-ascii?Q?S/ulIsEfE/3noGmQZtLnSg098s6mCrtD61UC0ZJkTZZRVqzjp7FWruEnl5Bz?=
 =?us-ascii?Q?iaHNtLEnf5tcYRCsDDLGPOey?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2affb2-9d90-419a-421f-08d9324efb3f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 11:48:25.4989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7SzBxhCgZO5tIcynwA5N2t9VdBEuFpl0s/nw7NdiAWVwPE1/bkTagnafv79UY9WeQLbYmaSJLjkrpnRgde2Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 18.06.2021 12:14, Andrew Cooper wrote:
> On 18/06/2021 00:39, Daniel P. Smith wrote:
>> Based on feedback from 2021 Xen Developers Summit the xsm-roles RFC
>> patch set is being split into two separate patch sets. This is the first
>> patch set and is focused purely on the clean up and refactoring of the
>> XSM hooks.
>>
>> This patch set refactors the xsm_ops wrapper hooks to use the alternativ=
e_call
>> infrastructure. Then proceeds to move and realign the headers to remove =
the
>> psuedo is/is not enable implementation. The remainder of the changes are=
 clean up
>> and removing no longer necessary abstractions.
>>
>> <snip>
>>  51 files changed, 1309 insertions(+), 1413 deletions(-)
>=20
> The diffstat is great, but sadly CI says no.=C2=A0
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/323044913
>=20
> The problem is that ARM doesn't have alternative_vcall().=C2=A0 Given how
> much of an improvement this ought to be for hypercalls, I don't want to
> lose the vcalls.
>=20
> One option is to implement vcall() support on ARM, but that will leave
> new architectures (RISC-V on the way) with a heavy lift to get XSM to
> compile.
>=20
> Instead, what we want to do is make vcall() a common interface, falling
> back to a plain function pointer call for architectures which don't
> implement the optimisation.=C2=A0 So something like:
>=20
> 1) Introduce CONFIG_HAS_VCALL, which is selected by X86 only right now
> 2) Introduce xen/vcall.h which uses CONFIG_HAS_VCALL to either include
> asm/vcall.h or provide the fallback implementation

A word on the suggested names: The 'v' in alternative_vcall() stands for
"returning void", as opposed to alternative_call(). It's unclear to me
what you see it stand for in the names you propose.

Jan


