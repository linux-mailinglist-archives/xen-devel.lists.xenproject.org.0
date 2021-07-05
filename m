Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C34A3BBB52
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 12:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150075.277538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Lxk-0000JG-Ia; Mon, 05 Jul 2021 10:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150075.277538; Mon, 05 Jul 2021 10:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Lxk-0000Gu-FO; Mon, 05 Jul 2021 10:36:28 +0000
Received: by outflank-mailman (input) for mailman id 150075;
 Mon, 05 Jul 2021 10:36:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0Lxi-0000Gm-KX
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 10:36:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bf36da5-c6d8-4bf5-b689-5563d0c6c8e6;
 Mon, 05 Jul 2021 10:36:25 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-aKa-JLfHNIuexfCe-1UwkQ-1; Mon, 05 Jul 2021 12:36:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 10:36:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 10:36:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Mon, 5 Jul 2021 10:36:21 +0000
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
X-Inumbo-ID: 2bf36da5-c6d8-4bf5-b689-5563d0c6c8e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625481384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtCzWCvJajjEEo4vUf4P1VGPydBh2pXvIVqjdjaqRGg=;
	b=P8tTCnak8yhYHxLWdfA1kPxnMNcq4tQ4DcDyBfJl4fO7D1ii8Vnt67CszZCGdoraijSlEp
	LFWoPwmP90rusv6QYmYCytQUhXPis1p2Ruz4LRzX4YAwnHKKqK9Uy/NHoVfancuehrA/c6
	qiF5wj8SLUnZoxCCnoafDeyVI//PjSs=
X-MC-Unique: aKa-JLfHNIuexfCe-1UwkQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONtv0ruDm2jhst+xEX2fjutqcfNcYgwQc69Rk/VcWxqriP+FXbGatS6pCfV0SNX3jhwTTcZoB/yme0i8XnNJY8bNpMTl4WD/5px46gAfnLIs61+3rFvX/z+PWIC8EMxcaH2WtXmXmjGotn1qoWbkLmMUD3ZxCUelwdGWu1VuKO7JpFJS1j1UI6UW8Qe0JWfJ+EWm2GKv97SZK0DA+tSOhLaQ7Ev5bQRyRHdqoSLkp93pWmZPF6+2E/srsFmnx9Cn2PFZdzDNG70Vh+G9qOE7MZL528zYKSnDPGqtQjItENyIffz70S8Lu6P6GCNN7hAv6OwZbK0itGWxF+qEVufF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDEIsMLkQL72Ggr9E7dr6K9o9lL1gTynJ5Heyl/v4ZM=;
 b=UKxMEytV4yYG91+5/pJa8LFktuvXNYpThQaWStktXekC4YneEJikTf9o+XUvSKCguxj97QTgx1b5yRMfiAW5/zpR3eY26+HaIkgPOu/hn8AGDVuD7NO0BNqBKUHJ/xRQ79nrEYXngL1/Q82mfsijKd+/tVL29uyvkwUTv2r2hmvI4SBFcBympe4/FKGV5fd4MeXFDO3kv8gietTdiTAnkusrY7R/AvZREdiprq7kYYbkmQRILW3FDMrAfh/aU1OZ14gDpjUyuj4oP3G7vhtn+qiyHVS6nGVyfh6ix/RdshS6bPMmWJEXU82a8UX5GJrVWA7hCQ0C/6oBGgU0/MMYWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: aepfle.de; dkim=none (message not signed)
 header.d=none;aepfle.de; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] tools/libxenguest: Fix migration's debug option
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>
References: <20210702190342.31319-1-andrew.cooper3@citrix.com>
 <06968742-355f-ad37-0681-e51eea256414@suse.com>
 <20210705100228.4947ed4e.olaf@aepfle.de>
 <ed3ceecf-239f-9bd9-e040-5246c9b49f53@suse.com>
 <20210705103224.26f3835d.olaf@aepfle.de>
 <1e2a3967-06e5-75ec-3aa5-1f39b6700e63@suse.com>
 <20210705112548.22ae6d20.olaf@aepfle.de>
 <5e4986ad-d3ec-18af-b1ea-ccbce57a70ff@suse.com>
 <f4301654-49c1-8b9a-a6c4-2b40d06641ae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4b6f75d-5aff-cc41-24f8-9aeb3caf09da@suse.com>
Date: Mon, 5 Jul 2021 12:36:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f4301654-49c1-8b9a-a6c4-2b40d06641ae@citrix.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39b8e781-35f3-4f06-8596-08d93fa0bb36
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6176858DA5F29430CCFA086FB31C9@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8C06n86aI3kUJXT951aWaGsou4CSCarTs0cDFdZ7Kry9HBgjVzC+p6avjHE8uA7HP7J7+cEzOTyI6/EgwioiaqqSqvV/f7t7cFoPalkGye+bILddiJTej2mqZfJXmr1YPXmH+iPXDr1yY2W1UoPVt+37aX0mgiujkxWhlGOmgqIx40LlvpD9p03Gk8wugdbGIq8WV6DqGEXMmsK/KRzOmuWMLzoKCJCOn+QFWsDm0WoPfWWpqyq41WfugrBprUiJ6sURbtasPMbOPHbGYfvkeul8kQfqWUtg5wEaAUPWPal6tQNi9dqYRdnP22tyhXoK/vuGgj82zbO32EwYZ3Ai4UOE+D4Qz+Vdij7m6bIcpcRARqXlz8cd3CxQrBfbvlNfzTCyr1uqvLfzim0iNQrzfofNicGLdT9kJI4Qg9SMLN0wCW2eBh4IE0LRp2KQPinGHDSV+hA5FNTajoIT/JDFvim+23Q8KrfZEBCBaB1u2sx9EsAi3uj3/4c9aGnSJk1++862sNcuX/maAYPwWKyLC8miXMHrpw/Zu4iC69H6Z0KI8QQ/XT1e6jCQ/z7fwRBQKkCPBc+NwU2AtBKPWhQnbn4qF3yjpsDSwGAlK7sCAX6/nYpeB1OIASHV/rIN1+CjCnTxargTV49ztk/D7BbiY5cf8bIpU29HbtX3qbdZWrYGoLTgK5yI7gjQa71GC6G5rPIaEbRPSp6frt0jy6AnyxshPBYB6tM8FII3cHQOdr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39850400004)(396003)(136003)(376002)(478600001)(66946007)(38100700002)(2616005)(6486002)(956004)(31686004)(2906002)(36756003)(66476007)(26005)(66556008)(8676002)(186003)(16526019)(8936002)(5660300002)(86362001)(6916009)(4326008)(53546011)(31696002)(83380400001)(316002)(54906003)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e/Juk4y7+BOjp13cXhHIwVu9ZDbuMp18kuoQR0cTCQe2R/9/lByYfw8zEkV7?=
 =?us-ascii?Q?q9wEZdcdE1UdVvqH9AeqMT1YaGNeMndLTBSQgJR7W+RSDF75Z/ZDY3V26FMA?=
 =?us-ascii?Q?PLP/9Tsl4sSzpBTBVJz599HLKigSe3+Vor6UyU0Z0kIUY1/oLkBtWQ3IADGU?=
 =?us-ascii?Q?m6IffpkMxmkQAul9JFIqf8cXIshXjs9lKk3YEZV2b/1TI9CElDOqkcye6oxs?=
 =?us-ascii?Q?FjVQOhygdvAmnmwe5elCdxLqlGccEiEscqpUi/eEMOOXUf0bd79bFAGX66k4?=
 =?us-ascii?Q?LjJV9jdMpDxEUn/MtFtGKxjlMHEosI5L3fSNhNm6O69v1bFrvPpRlkcUZzIl?=
 =?us-ascii?Q?WMgpZwyOr1u4cw5KVO4XpDrzEg61/Zi7cFU+hNuuo5bakY/OfViUCx1dIaiw?=
 =?us-ascii?Q?dINnpuYEVBnlXGGQETUmCYHNCFq6EaysVAhLbaE7k+WiC396UkCpEueZbZ1A?=
 =?us-ascii?Q?8j+SEaQDgdrU3iO14BkfUKOyAbHv6vJpRsVV9oAWaTRTpDV1ardcDQ7KpgTh?=
 =?us-ascii?Q?oFqcxA22EqBmQ3ZANMAcr+qdKvejdLA8z54zXtfGhELhYJy8kMURhh2NOcZU?=
 =?us-ascii?Q?+hbKXUnw8mOv/UeZlf2Ds+oXoJzJkR4w7fw7B6Pe90iGz+qAFmA1XFjT/v+5?=
 =?us-ascii?Q?0uuqGKM1rOvXMPmG6w3vGIxl/Vm8GznIib7/ZP+bA41WChy7aLaJ2gSIW+4q?=
 =?us-ascii?Q?MTbJHiaGDCMexhzOhHt3bDq68LlbGYv5cnL0MLj2uz1CGGSAES/lG4b+19kz?=
 =?us-ascii?Q?itI2ctv5IjkG3gwa+f2VnTTch6DF2F3nO3Xclu3gEYq+SGJBYxPPQpRmH5eM?=
 =?us-ascii?Q?pm9h9RoqxRgQv0tOhhpGtkJMm/zgHuCU/Yna2JxTfhrdaEtn0TtgXg1jCzdO?=
 =?us-ascii?Q?7eDu3VSiJXDQScX3la5YKPZGeRzRfUx1txw/G0nd18iejo8aDRooD/AVd8Bc?=
 =?us-ascii?Q?kCjLSq78+gMf8G+cUJDuxCwXAmq438Sz2yOtWoWex4dPCbcGHaFBJR2x8gn5?=
 =?us-ascii?Q?su2ZHq2LdIVoqVMMAjMULrAHQW67t7UKhcRTDjXYWAswAdlqgg2osEEClfAH?=
 =?us-ascii?Q?y33fJ68fiIiq13fm8k04Xtr08iZxD9XJBCgzgaNLAjknW+j5NZH2Id5dZqH/?=
 =?us-ascii?Q?FfRTVE1QEHqcVcqI7bWDTILubEeclwBCEQ6x4EX9HF2s8i9YnDSqchUx9a4S?=
 =?us-ascii?Q?ghNbMM1owAoHN0B9xbOO1tKNO+trSenZQkGl4AKwTzJlIXmAaYHvFqjh5zIq?=
 =?us-ascii?Q?VN/fpeVwNIycbsNiywSecR4bKclDsdkmDFSrfLS5FgVSZbNPtoPo64RIgtD0?=
 =?us-ascii?Q?HznIvrNSbNWbAz7kFVTE3Fpf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b8e781-35f3-4f06-8596-08d93fa0bb36
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 10:36:21.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcMztUMeHx+0PqKccm11Lgj6ISKnVi80vC/PeV3aFHMwTaoiel4V9eVWYu6+sYI5yQghau+Vl7NT83k95VI30w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 05.07.2021 12:06, Andrew Cooper wrote:
> On 05/07/2021 10:31, Jan Beulich wrote:
>> On 05.07.2021 11:25, Olaf Hering wrote:
>>> Am Mon, 5 Jul 2021 11:19:59 +0200
>>> schrieb Jan Beulich <jbeulich@suse.com>:
>>>
>>>> "The interface" being which one? The tool stack can map the guest's
>>>> grant table, so it is in the position to find out about all grants
>>>> without further hypervisor help.
>>> The interface means the code behind verify_frames.
>>>
>>> If there are indeed ways to query which pages belong to grants, how wou=
ld the toolstack need to do that?
>> Map the grant table of the guest and walk it, recording any MFN for
>> which at least one valid r/w grant exists.
>=20
> That doesn't help - Its still racy with in-flight IO.

Well, I meant the recorded data to be used to simply not verify
those frames.

>=A0 Also with updates from Xen such as the wallclocks.

This doesn't occur for a paused domain, does it?

> The only way to fix the IO problem is to disconnect the blk/net rings
> before doing the final sweep for frames, but that clobbers any ability
> to restart the VM on the source side if things go wrong at the destinatio=
n.
>=20
> I don't have an answer at all for the vcpu info frames.

Yeah, they fall in the same category as the FIFO control pages, as
they contain evtchn_{pending_sel,upcall_pending}.

Jan


