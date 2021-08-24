Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5921D3F6166
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 17:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171590.313101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYAv-0007KR-TJ; Tue, 24 Aug 2021 15:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171590.313101; Tue, 24 Aug 2021 15:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYAv-0007IV-P5; Tue, 24 Aug 2021 15:17:17 +0000
Received: by outflank-mailman (input) for mailman id 171590;
 Tue, 24 Aug 2021 15:17:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIYAu-0007IP-PR
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 15:17:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89ae0d01-a559-47cf-aa03-71684e4c09b7;
 Tue, 24 Aug 2021 15:17:15 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-1Z0yBO8JOj6BGPg06iAs-Q-1; Tue, 24 Aug 2021 17:17:13 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB7186.eurprd04.prod.outlook.com (2603:10a6:208:193::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 15:17:12 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 15:17:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0067.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 15:17:12 +0000
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
X-Inumbo-ID: 89ae0d01-a559-47cf-aa03-71684e4c09b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629818234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P0K8mwDiBiU/vUNwI+0hqWHphrygZosK3D30BVUqR6I=;
	b=HIevAZthAr1ZxuRQQWrJhMbf231dVolwpisL+js+QpJ2qq9N9tiaFPcUlsbKc0cVz2rFI6
	UbmHo3fHcl/El+Cy7xgUrDrPdnB3lShUeGzBQRzQw5+veKvi5QuYM8tk0mx/2+XKXDCs9+
	26BLL6NARaqw4NHgm8CmKrFDCwCokys=
X-MC-Unique: 1Z0yBO8JOj6BGPg06iAs-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSnb0uzy+I6FnJmo/viVwernH7qCooTbzx8pI6DjpC6Aac0zHNUeo1QcOPTj7WjYM6ngbcIrOY5J/zx3CLDTz0dSrbL4xQwyyIvuDPt+WdaHqT6S29KG+qqhGRe4HpHWiqfJej7o0Ijq01A58zVOa18NbtHswaFQqCmVL9HTQjZ+rqU4nqJCLmkbf2FQnJ5PJ5xoXkiALetrGiXJQ1FYpmaqdifXAMGfbU574Aq5pKWM5tMX3sLeRbBFZe+UIZimD2E348elEapUqhIZwrgj8yrHp4C4tYwRifQsaCEFom0qUabttX37A3cDB8mqXfY3bGZFMpMtziXqsSQNia2tMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVpnzoeO9kAmwlgIXewPwuIUmruct/Hbifu48wW+1Ug=;
 b=SwqyZm8jYauVcs4HNtmv4cPUo09ViSBXAN2kCOiwk4MMtcGqR68LJcG07x/Tg14Yba4/TeaMbsd7xpFGiu36ntT/a8WJQvdwLsJ3ZSUMNlEb1TMMu/EqgDsbc1/BCDCE8uHR3TYliPz0yIf3wHUGJ/FhOVJEasTYzuGR2c2ePIU/3bLdX0sN0ZTh2SVrAeqiXkPDTb+RaX743JaydnaL6QcT4D+GEyvgFBouZ6W4QYduBtXcgv3h1QeLD+d8yuYcaq77Kf4iXNiaBwYpLuhJexpw8uFyYgxTZgmvO9+IhwWGQkX8ROOkvH80adp9w9XRA7SvRj3mYXopm3dmi4ms1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/3] x86/amd: Use newer SSBD mechanisms if they exist
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
 <20210817143006.2821-4-andrew.cooper3@citrix.com>
 <35356c32-46a1-815e-0ecd-bd2b4b77519d@suse.com>
 <54ea3563-446d-8742-c99a-8eb2b0824ec2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <98f1c7dc-7eeb-4463-26d3-4a956703cb6b@suse.com>
Date: Tue, 24 Aug 2021 17:17:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <54ea3563-446d-8742-c99a-8eb2b0824ec2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P189CA0067.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::12) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96e78668-5733-4201-f74a-08d967123f99
X-MS-TrafficTypeDiagnostic: AM0PR04MB7186:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB718698998D2C2834C841F5ACB3C59@AM0PR04MB7186.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qYv1tp6GE3ARUlx/VDgafA9RwZXnLswXdoyKEGcv+TRpalRpJFB38OuISfyAPWVKgVyytziW6ikADb+iM4H9eYFg1JyY3KBEbG8uihjrFsfDj+rA4bJKefJy72q64WFVZxL6UMIo3kTyVJjmq4rWX51gJHLDTUl533eAx4plAfTofvo9ZvLdgvvfRCRcaHJifMAINCY7qNcBjSQwvP5cCURGq/cRpDsWNh7dDlVmCb+B7HAUPiwExk0MTWcjXVR9AEtdItJICtZXkC5FbnAyul/lXFKmpez/85DqBq6fVyCB5K2kUN5yDLuUYFcwHwFrzYZst6uA2HS5Dcy2pU4krQqxtICMXKHJHCbeKyB5sH8xUK12XOqohz3eEQH7+ywM2Vkq4cIpB1oH9PjN2dpsggbsMoZRVsSCChdv41rPft4UdjWDaF723ePAYReKpLb3ykdU4vokfLIpYBM2oIjHfk/Eg1Ov+H3VU2kPXCabFdZrAiIIujq645IQSldHl23I9lB73N4YRJMJYJBtzJKsD5siRGlGrDqKeCX3EXncQ/PE+SXx26m+CbGam4ZHHyRRrBkcR8oH6JVSyf7qq8WRCa5vkVY37Lklld/xTYcgQGL/wblD4wW9JCW7QhPEkVlpjg+rx9Rah80zXlw+SZqqNwhPVQBA3S4RxQET5bJxGincH+vCa9B9UJ1Us5o4uVmCFzW+8sDJJEfQSo6yhTAUV7fmd8i3XGvfQRJ9lQRZ3hI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(39860400002)(136003)(396003)(36756003)(956004)(31686004)(6486002)(16576012)(2616005)(6916009)(26005)(186003)(2906002)(8676002)(4326008)(66556008)(316002)(54906003)(31696002)(66946007)(66476007)(5660300002)(86362001)(8936002)(53546011)(478600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fs2IaXgTQroCl1TQ2mtC553Vsk0dLT8mbn0wu8TSn4/7QiypmjHXhRpRXXWe?=
 =?us-ascii?Q?+3X/jZkAhOzujIGjl8nrzSJIDnDzmpWItN1wt9pUjXKY0UgX6bcap9Sc/t2i?=
 =?us-ascii?Q?bFEc027LvIGi0lnMN+qjFMR1/mH5pL9+s6N3KFnpHsrSA1+T96ubIfjWerIr?=
 =?us-ascii?Q?f9A7nCJfVczbKxQ3PEdBmJofExPQMBH8VRrCLjls8ImxPgQKuC05jflzhcqz?=
 =?us-ascii?Q?6bwpIPuOL4PtiQZbRM4eng1w4AIIIGmotuBj9iig7NRGOenvET5ZQTp20HZ1?=
 =?us-ascii?Q?wpYGxXOu2XKQhPLfSA1AWfTYBtw0qZ5PPbFFvjdLpbiAzyvTFmWT6trjE6KS?=
 =?us-ascii?Q?utUPm4TbIXJ0xVuqTKoDDKcwnJHCW4YZuVCXEYC2Oqxo5YMjBb5oITxEt/u4?=
 =?us-ascii?Q?ZBsUsGSgP7tWjjPk8Ci3z+KWruosBb9DJRyxyiypB3/XINgSa+smZirEOFyZ?=
 =?us-ascii?Q?X8ugsVvN8lV7CX9+EfnJCwQoJ7QJC4wpR48E77rFwqalz5Nq/JR4bd30BiUP?=
 =?us-ascii?Q?ZLNPr2SuYsbpdwGahmkef0En0hm/18b6Qh67T14K2VAH+SazOysl+kpGE4fc?=
 =?us-ascii?Q?lZH5JIaLegdvKdK/RtJ2ujK/05plDps3864R7Ulwe+UQEUJJh0xHmmIR0cu+?=
 =?us-ascii?Q?y9uE8RsWIAzqGPbzYIfnB4nLxpATPNp732ZUGvDuLUqYAmfEQkJB7hl2wy5m?=
 =?us-ascii?Q?nMZMzty2ib0wi1ynR3cWSQr2xNjU6LEMkRrRDN24bdnNViJ/ZOp136SZv28j?=
 =?us-ascii?Q?rflaS+wGr6DPLnOUpqsCGoaYkCpdr14LLPFve5lnpkSQwLhkdiArmzeHwEDc?=
 =?us-ascii?Q?LL/QCipuTXJQ2dhCpdwFOFXztJPn7xjJv/u3qe/2YFPKxgVSiwThVF+KLMPY?=
 =?us-ascii?Q?HyA0DxJi5Y0b65TO5Il2rQA7PnJBgpGvHIZxAob5rCcLdFSGzwrqnRHOUiLj?=
 =?us-ascii?Q?UJYc0viRpOy5gkWKK47+IfTd/283i4Nxaf8lFxGrbkTAYnaJ/BQiWA77Ddho?=
 =?us-ascii?Q?Cy6mJGP5SNv/gKfS7otrUspgcq9WrLtK06GN5hhNGZ6GU2f3I1XI8guW+oiE?=
 =?us-ascii?Q?+Aah8P+UlpGuMUV/BD6dix3TdoH3hS3L+vNJ/jiJnvFWxy1Rwf1BFWUI/xh8?=
 =?us-ascii?Q?1emWxCrsX0wOZjgAx8caF3vFV+NNYutgkxna9o464LQMZd/eVYOByMGGcEQF?=
 =?us-ascii?Q?MWlzlj78ii/za064HaQnaghX6BMBs76MaEbAmxBaEWOl1Gai3lL+lpCwkDWH?=
 =?us-ascii?Q?Y60dOMdV3rgM5pmBkJMcFwrN/13R8ndYetBlj3Xk/u/S6Y5yjcjptq9HQNTB?=
 =?us-ascii?Q?2Ox2GoCMRv+C0a0H1ZwEDVcH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e78668-5733-4201-f74a-08d967123f99
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 15:17:12.4832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G89LTfrnv80JS835X3wzeFrNXpJ3FnPZihjYbzhTiMw6E5kHwQMxNAQ/aK0DFC8CrT9+h05osCvw1DQ0TM+3bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7186

On 24.08.2021 15:39, Andrew Cooper wrote:
> On 19/08/2021 15:59, Jan Beulich wrote:
>> On 17.08.2021 16:30, Andrew Cooper wrote:
>>> The opencoded legacy Memory Disambiguation logic in init_amd() neglecte=
d
>>> Fam19h for the Zen3 microarchitecture.
>>>
>>> In practice, all Zen2 based system (AMD Fam17h Model >=3D 0x30 and Hygo=
n Fam18h
>>> Model >=3D 0x4) have the architectural MSR_SPEC_CTRL and the SSBD bit w=
ithin it.
>>>
>>> Implement the algorithm given in AMD's SSBD whitepaper, and leave a
>>> printk_once() behind in the case that no controls can be found.
>>>
>>> This now means that a user choosing `spec-ctrl=3Dno-ssb` will actually =
turn off
>>> Memory Disambiguation on Fam19h/Zen3 systems.
>> Aiui you mean `spec-ctrl=3Dno-ssbd` here? And the effect would then be
>> to turn _on_ Memory Disambiguation, unless the original comment was
>> the wrong way round? I'm also concerned by this behavioral change:
>> I think opt_ssbd would want to become a tristate, such that not
>> specifying the option at all will not also result in turning the bit
>> off even if it was on for some reason (firmware?). Similarly
>> "spec-ctrl=3Dno" and "spec-ctrl=3Dno-xen" imo shouldn't have this effect=
.
>=20
> I messed that bit of the description up.=C2=A0 I means `spec-ctrl=3Dssb`,=
 i.e.
> the non-default value.
>=20
> We do not disable Memory Disambiguation (the speculative feature which
> causes the Speculative Store Bypass vulnerability) by default (due to
> the perf hit), but if the user explicitly asks for it using the
> available command line option, nothing currently happens on Fam19h.

Oh, I see. Yet (nit) then still "spec-ctrl=3Dssbd".

Jan


