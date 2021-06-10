Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9FF3A2597
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 09:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139638.258221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrFFY-0000Tv-KH; Thu, 10 Jun 2021 07:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139638.258221; Thu, 10 Jun 2021 07:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrFFY-0000QS-HD; Thu, 10 Jun 2021 07:37:12 +0000
Received: by outflank-mailman (input) for mailman id 139638;
 Thu, 10 Jun 2021 07:37:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iP0d=LE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrFFW-0000QM-Qw
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 07:37:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6057b24-c9ed-4158-b39a-4f8f33cd5957;
 Thu, 10 Jun 2021 07:37:09 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-TlOIDy6JOfuO28R73fCnJA-1;
 Thu, 10 Jun 2021 09:37:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 07:37:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 07:37:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0114.eurprd02.prod.outlook.com (2603:10a6:20b:28c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Thu, 10 Jun 2021 07:37:06 +0000
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
X-Inumbo-ID: f6057b24-c9ed-4158-b39a-4f8f33cd5957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623310628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVJr6qolGfc+TnGCF7gON2ry05AxZE7V1JPgJtBIWs4=;
	b=DgQcAcINZ3UBz9eIcBs8B+c4m4e9MDEfxLMBJuUZcaymCxhhtZ931Y5dUhV0+exg/biF/S
	lZRqjFSwfAdHeUw3vBJVkFa/N2oY5r4z+GdDFQJGNvpNhDu2fh2WpSiu9YqN1TyZi54k6z
	SEs7Y8JvO4gxAx/On31qWXPVZtKz5mU=
X-MC-Unique: TlOIDy6JOfuO28R73fCnJA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVBHIRX/kgXHpxvyT7EyFq8QerOHcxqDtFkqXt7e7maQM76kRA2+49QzjGT2QlS42BdsY3WEzK4Qho9K8ZZy0v3fBeF9pzQZaZFk7DnWY6zKSJsFKe8j7ONYqO8+5/GH+pWoNK11BqOmnoiFTJ5eaPBg9MxAJTZ+DgC2ud60ADY9dOtnQJQ1yms5OJqpcZy/FwjlJr/DPmHEmP2GzmwYAJHivkeAcHoT1QX4kippYMQbHz87D7FgEvUZpTm40kH7PP289zn1JGEn8TiNlqlU3xV56AGDlLProh5h27mA7a4CbeCoI9kIyI55+FS1tZmlDJSxN+T/BBavmrLKW1blaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H7kS/QkjXPqTdpjKRKfSXQbK37UtVeb37RDe4HxBW0=;
 b=Z3PrO4s41QI5oCW5ZJSlsh82PE8NCseeExI77OX2JqkSB+TDUnRyoxK0gbFfnlYHf/0WxG+4ndzTttvgJVu5qkQ8kt5iOQ8JzeWH4P4ehfnk3ClmhJV0Zir6EP42Jx5+QaTxX2EWndLdZltnGPWJef+nM7EeUK7lW6SmN1817Shr9eLi8Fv6SAJjRXV8Q8e82ebI9R4cOTDB2U60jUPwoGCvgDavKTHQxZRszvHxxj6/vTDss0tx82IV+wgMhGl5f8L5L6ufew/nXNf/xd1XozA5FR5nuehH7U3yTHqZVNZmAXWhH46hrBKfRESjQMz0O6FgsDfWaoqd4x5olPhggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86: please Clang in arch_set_info_guest()
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c758de2b-c453-4dba-ddc0-0c9548172c6e@suse.com>
 <c032362e-51cb-00fe-dfe9-782bd4600163@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b9383a7-cdcb-f3e9-3ac3-f703f4bfe4db@suse.com>
Date: Thu, 10 Jun 2021 09:37:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c032362e-51cb-00fe-dfe9-782bd4600163@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR02CA0114.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c2f2ddf-054d-48c0-320a-08d92be28c4a
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7360D8E6E034FC738B097316B3359@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KGhBbaIVPQ6jEk7g/DESPbsG0l3ghmevFiZG8GR8VZgO2n+d+f/DD6PSQcpEzGn++nD48JZtmWJ84MSy9/NQd2bNGMaM2VfXw/fX7Ms1MrcoJfF+bkjfzoiZWiEmZzKaowQrgYLhX5IFV+fL6HNdYN00OkgOYNDaCypCaH2s8W7Er0O0+cURRNTSDJlw8PtM3Psr6RVCpWiAAZDBtKDHMFOY56Csw/lAd4xaCzVpNGQYArrZFDau6oS4Q4XDP0Ef7GafvH9ZvVJ/qGGd5Qjj1DqUE6BYc9mrRNf0KKv0326ulK3bw6nnVUMsZeIiwqB2AfsWFCfG2Tt2KNIBU/GmvItPb870n9gTqwY4H1MU/0Qs/QjKuIqf/xbvSvZjhBHwjJ071fbspYZu6K1HoBlKHbAVVX7N8EMEtpew5uS3oEgep5IKupTWGqDwqkmYdWjQ6KnXA2k3ZxsV6Ev+4tTw2ZOSd3Da4pwk9G2E+cO6y+pKPghyXBQsr2l+ZqMUN0RSrlkzfGx8Ed1/7vYYthzLdqNHuy4adjA5L+2MGCwXLubNFrwKWyogTP5bKjTpl6RM4g6urEJ1LWfiW70MsckKpj3NXHhh9XOX3IZCo3fuYkYq2jUP0wZ9BGX6SgKJvG0z2483b1chfvVS7YTesLt2tOLM4JzKwfdUZ/+oTiUFIk5VWsagd1XVZjVw/QXg48XLbXofWhl9Os0FETG9x04gzwTXAStRqer0SNbyC0OvOqWJcIg1RUkCuBIPQAVEQQJlztI5Tx1xUHdPvoMBfKtpH9FnwSL2hIp7qhMEfopEiamKI6hW4lxCBGtFMn1mvK/g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(376002)(366004)(39850400004)(4326008)(16526019)(6486002)(66556008)(31696002)(66476007)(5660300002)(83380400001)(36756003)(31686004)(26005)(186003)(8676002)(316002)(966005)(478600001)(54906003)(16576012)(6916009)(86362001)(2616005)(66946007)(8936002)(53546011)(956004)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?4HqaOvJ4Vn7emvqmAkrcvcdb8dRVlaCdPFLUvXsdtXQ4dFcjjjSQncFUL2yc?=
 =?us-ascii?Q?BaL96IJXvSxWX4VKHUxswkAGTO1xIPfqNwJq9rAD2aLw1JaCVTXfYnh0Mlew?=
 =?us-ascii?Q?Q3mNxkCm40be96zj4mTShONE4SKMk/l+/Vjbo464bkQze7/ewujzyTyi3kG4?=
 =?us-ascii?Q?UyRRDvzRmSkmBuKCLUO5ODeRAITiBf2j27a6hQZ2tgKX2SEYINuCjPkUd1oL?=
 =?us-ascii?Q?z4jwi8RGo45NN+OFQGhmgPpwUE2zC+XnPNHqvWC3wgfzT8W2XYyHr6qpKXR8?=
 =?us-ascii?Q?xn6CexP0UXVSLRaR+J1FrWfFLMjXNc4xiMTUfTvjPisZ2Pwv5uIOA2+tp0Hc?=
 =?us-ascii?Q?Q8oHo8zUg4LOkDE1R1ymAD085VYPM4CPIcI3gNyXPyq3FzyRF4uoMV+h8MgB?=
 =?us-ascii?Q?ZOuCME7TK84/B+b6Q7ghSDqjl//ck0Y+y9H4WlTqf0YT/RCKNPkq27tnBYQA?=
 =?us-ascii?Q?i22IeNqmK7/zarKCF+Wc3+wtR8S/XuEwOi6Nu+OZvAHGHhiMgUk0D/FPlewZ?=
 =?us-ascii?Q?K3qj6rnK0bQujEKggmJF0QnNl75cyYkFvMcgBQAdHxEtKyhfkk+JX1rdScPt?=
 =?us-ascii?Q?49I4+PTQ7f6rr0pcb7tRZiW+C3WQeviOJ3S9xQZA82via/8W8MRy/SqxduPj?=
 =?us-ascii?Q?QWJnsCuWnh+Pz/lDgzJZ/up8J/SPCBWNhUYHcReb+NTp/CQN3bRPPJpmphr3?=
 =?us-ascii?Q?G0JkkoOsO2GeckyXaPz4YgtYTOi9O0BpjrQhIXs+3K0QJqTR73tBl8BVOf3a?=
 =?us-ascii?Q?oSoTrzdrZ3w4rOWn9G83AL3Lxd8luQh3rtksKOkfaqERhXx+VPupN8IE54nZ?=
 =?us-ascii?Q?9lLNnNiWGLhOv5ZAA6O0TrwRxIfGY4MlbeFDwOwq+a+nstQy5ZQVg/tEJ+zN?=
 =?us-ascii?Q?1OCzaAYmfpaou17cWqiwUq7XAo6sCQzqyEbGcKI2y+poN5+1c6YGQOFAXNln?=
 =?us-ascii?Q?PHf29AKVnO21lP3iSW2NJrNX9X0PZhuKbQObvOcYdxNAl0dpf5PzlXOXwH2t?=
 =?us-ascii?Q?FKVZoapMrWaW0X9IsdEBXrhANtbXrcbHWCdhO7opwgmxwyD6/bSx9HWGqBx8?=
 =?us-ascii?Q?kYvFobJser+LAOPHnDL+CjJsawPZXwk16G7p70dtPsJLFf/CKy8t23Ruk5XY?=
 =?us-ascii?Q?wA907mNrp2LTLeMByO1JYbl/6MzODqY9TukkxygCcjSMC2Lg1tfKSdhxzOll?=
 =?us-ascii?Q?yEhExGSUCcvyYGTXihZR2a8EzXRYva8h46wxo/EeEoeus93CqjZOuF6Htt/Q?=
 =?us-ascii?Q?2CmhVJqKynkMofAtL5dycqbQi8aKZ8zeUK/VeiLmZqRK9p8UdGN7iE1OKjaM?=
 =?us-ascii?Q?sDcYycHTHbm/z4skaL5XsL5I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2f2ddf-054d-48c0-320a-08d92be28c4a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 07:37:06.7071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FmiqWI2lfd54ev2tSdeEMib3OfBZ8Z3QXGJJTr/PHlqWU9Xap0uHWX6NZshNk3fHKHsyN7/UfgWJ7KLmQGAtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 09.06.2021 17:45, Andrew Cooper wrote:
> On 09/06/2021 14:14, Jan Beulich wrote:
>> Clang 10 reports
>>
>> domain.c:1328:10: error: variable 'cr3_mfn' is used uninitialized whenev=
er 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>>     if ( !compat )
>>          ^~~~~~~
>> domain.c:1334:34: note: uninitialized use occurs here
>>     cr3_page =3D get_page_from_mfn(cr3_mfn, d);
>>                                  ^~~~~~~
>> domain.c:1328:5: note: remove the 'if' if its condition is always true
>>     if ( !compat )
>>     ^~~~~~~~~~~~~~
>> domain.c:1042:18: note: initialize the variable 'cr3_mfn' to silence thi=
s warning
>>     mfn_t cr3_mfn;
>>                  ^
>>                   =3D 0
>> domain.c:1189:14: error: variable 'fail' is used uninitialized whenever =
'if' condition is false [-Werror,-Wsometimes-uninitialized]
>>         if ( !compat )
>>              ^~~~~~~
>> domain.c:1211:9: note: uninitialized use occurs here
>>         fail |=3D v->arch.pv.gdt_ents !=3D c(gdt_ents);
>>         ^~~~
>> domain.c:1189:9: note: remove the 'if' if its condition is always true
>>         if ( !compat )
>>         ^~~~~~~~~~~~~~
>> domain.c:1187:18: note: initialize the variable 'fail' to silence this w=
arning
>>         bool fail;
>>                  ^
>>                   =3D false
>>
>> despite this being a build with -O2 in effect, and despite "compat"
>> being constant "false" when CONFIG_COMPAT (and hence CONFIG_PV32) is not
>> defined, as it gets set at the top of the function from the result of
>> is_pv_32bit_domain().
>>
>> Re-arrange the two "offending" if()s such that when COMPAT=3Dn the
>> respective variables will be seen as unconditionally initialized. The
>> original aim was to have the !compat cases first, though.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wonder how many more there are to come.
>=20
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/317744453
>=20
> Everything seems ok now.=C2=A0 The failure is a known arm32 randconfig is=
sue
> which still hasn't been fixed, and is unrelated to this.

Well, the question was primarily for current code and the presently used
Clang version (which you say looks okay now), but also for arbitrary
code changes which may trigger the same issue for any other similar
constructs, plus also for future Clang versions, which may become even
pickier. And not to forget .config variations.

> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan


