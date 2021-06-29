Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3033B6FE9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jun 2021 11:10:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147987.273283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ly9kC-0002wm-62; Tue, 29 Jun 2021 09:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147987.273283; Tue, 29 Jun 2021 09:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ly9kC-0002ue-2u; Tue, 29 Jun 2021 09:09:24 +0000
Received: by outflank-mailman (input) for mailman id 147987;
 Tue, 29 Jun 2021 09:09:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ly9kA-0002uY-4U
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 09:09:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01c94723-406d-487b-951c-81911d7a5f4a;
 Tue, 29 Jun 2021 09:09:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-mnw0FPrzPpaaPxM1EF6xrw-1; Tue, 29 Jun 2021 11:09:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Tue, 29 Jun
 2021 09:09:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 09:09:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0115.eurprd04.prod.outlook.com (2603:10a6:208:55::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Tue, 29 Jun 2021 09:09:14 +0000
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
X-Inumbo-ID: 01c94723-406d-487b-951c-81911d7a5f4a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624957759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M0JLxIfMg7OyRwYtnKGGfBmNsyzpNeZOWSN68NtLVOI=;
	b=eMNas0wY4tKujfDFZ45vJh4hcK92umFFAlsBZOo2L7jxln1+UXd1yf8FV10NLF+Jdd1494
	LLQTqGydJpSkhWvQZ6zmgBftKU2vZFzeC71QSfKEIouAJ0sKWpQ+JjHd3pRqoCNzq8h+Q+
	wYWlXn/ZLJr7vYXoxP/al3lCp9wpcV8=
X-MC-Unique: mnw0FPrzPpaaPxM1EF6xrw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXnwxiz46c1J7NcMNmiyt2dv+kkvOcbm1PAZuCiRGAmL8Fzrkbqtw+vtB4/nI+DJIm28LoHBG9o/srUqVX+KKCBxbCHqciNZRfxSXU8p0DCa7yCnUfCaJr3vSc7zThaeZoIXVmUWwLKna5d5LHf8dPrbPJzdr0onBHvyGtuPbS58aS99tEpKdq1Ll7Dm5M7IA54kfKSaU7qiMToa+76426Ge28jkKNO0s0QFTmBuwU4E/jLqiE3+51pKwByePwySv8NEtB2DATKZwUb2SqLxVoDZOYG8/AXx9iqitMFCEpLD03lWHhSEoS/oXXCRjelcV3TUAVcmSmbM/got3+PHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRaV8+fVhLodpx+ySjS6ObWyl/2MdwjAbxOYQphDkhs=;
 b=N/uqeCc+VODNx2L2goa0zbhmKzVuG1hyEO6lnZ3xAjC87JCcy+C23EZFF6uOt1U8Jh4oI8aHPGZ7fss2ok9htaXkPFbixM1oz/zU4Ds2JLgHKyPKuGHHG632en/TYzo2u/TN66cNxlLQGbNwJFBBV4L9L760oruWNIlEDKYPXLEz4HjJVVtDsy2GCfn8s+pqHwvwxTWN9rftOHc9oarz0G+Ud8H5cHryUGjuo24q9awpel0BP/Pa2/zVX4CXf3CxmG9vs0bT9WWToEZsccPH37/zob4XFVePJkkQRcojclCyIFVle5EmvLpsr2sh9ccYLqFAApLVfLWVIbdxpgiMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86emul: avoid using _PRE_EFLAGS() in a few cases
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9285f566-e352-9265-e9e3-e9a1e15ce7d5@suse.com>
 <4362c5af-64d4-ef13-dd84-1c885616afc8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56b1144a-f659-2b67-f054-8e141694f9cb@suse.com>
Date: Tue, 29 Jun 2021 11:09:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <4362c5af-64d4-ef13-dd84-1c885616afc8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR04CA0115.eurprd04.prod.outlook.com
 (2603:10a6:208:55::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fafc6265-e265-4485-44af-08d93add9141
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2607602286F7AC3D957E387AB3029@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oPmNzOpR/qxgcNCqAd2+ubCTrr+dBaraiBeWxuTmNW9RALL39bKM2SevPviNZ4/oQoxLDuk3Zb99aurHmwPncEdYGxHRmxmqjZLhhrpL5awLQCr3EznZrMTqw5Eq0qLmIpG3eccYU0m/kZPugGKx2VnofJjEc45cPMoTR6htRLfEgpjfrMytpGDdGjIz248xzDuvlD1EMn0fLaqHnGCKOeqlHkbtR5cgKEMTjIEnljDpVusiMmysfByfDYVa20IieU+sgpzFlAT5qDnhQYEbIk8ZRWyKe+99uXchfAtXvp9KZwovEaA3Lz1mvxOxx5RcieFfjhxFSkrZqs4MD4lsbwzRYh2sy3qGwcUjhpyi10UdS4Ao4beGB332pJdQ1d/k8/mFr99YOl/Nb7dZssGrTP0MzeQx8gs8oj+zIiZ44E2esNUUpiX02T5T1ZVZXGSuIBwmfMZIKGc0n3SOJLN8uPf++QcSOOo3nINmizbejrjmD7zkLCUVBWgngtg4frLIYWVUaSmM2sSTBmMCJVMqUBb9xNUGTlXMta5WI2txgJQKabr4D/1oEIuh44SUdD2Tt9SOs1jZq9YzfzV1GBw6VpcSu+YPaTWrQfkCCzj59QrFwLS3eyoVYS7dA+lHwVh1W8k42VxpY49/tSfzy7Lc86nYT0akJj34bUZ2ar1MhYbJQIaydQdNyQq7vktCwWtNyBxvIxXkUHKIrzpbKYHAdNzllpK7pCe3VegYy2kzTGI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(136003)(376002)(366004)(83380400001)(478600001)(31696002)(86362001)(38100700002)(5660300002)(66556008)(956004)(6486002)(36756003)(66946007)(4326008)(2616005)(6916009)(66476007)(26005)(8936002)(186003)(16526019)(54906003)(16576012)(316002)(8676002)(53546011)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0QGvTNB9eAryWrBYUdTZ4dNy8zPHGNeYidH1yTyQ55u33JWm+4Y91jfj2mAa?=
 =?us-ascii?Q?VECwBG8mwnMAcYB4IAS9qF/hxZOJKOYg3lbR4jT86vtuT3n4mUa9KI5hep0C?=
 =?us-ascii?Q?rM28OnYMkyTkg2cp15No02foLzInvLVSDyYCdiz4PZIdwMiEWOP1VPvl3p9d?=
 =?us-ascii?Q?jQHx+4ni/vl67bjRld4v6Wdb6VOvbEoHXa4QvSxf04RWAU987OfTHIE+bAb4?=
 =?us-ascii?Q?jRTMJhHmI6K9JfoLM37GDpLbXAZ4o85+ZQguvChDNFv+NhIy8SxdWiUu+/rb?=
 =?us-ascii?Q?kjHV3CrR7Hki0ZTXWxf8r4o2TyxU1oPptGEUsX7tcBBwgYbNGeR5DSvD6yDc?=
 =?us-ascii?Q?4a5APrUBReuhz1DftQNSX7edRUFv10BJ7V5W3+BuxigDGGEUpCY9AZNvqtMy?=
 =?us-ascii?Q?NVTpkReyjC7aab2PpQ17AMRcCQ4gdOhX0rWYI1Xro21v93wgkcISROK8Za+/?=
 =?us-ascii?Q?glMiENvXdWQtCXzI0z3pXm89+7m4BBO0cHLJNFvVHziIFQdSjdT5b33hLnNq?=
 =?us-ascii?Q?Ds806heQ1ZXr4KqQ7DtqbDfmoQW6UjCPBab7lvVTRdzwaJTq2B9sg9fEzIOQ?=
 =?us-ascii?Q?z6vEboY2OHop26qAGrqEUl0eEN3fgE5GEtvVIhSDGDWmVeLsC+GZONxfEs73?=
 =?us-ascii?Q?Lv1UeABcXivPTYExr5x9pWc2orlRhhulx/mpXlgpM7rI5PY3fs1S9drKdONb?=
 =?us-ascii?Q?HRe0lUSLEYIR3xIWXgRPsQ2LhcPJiSDpVgj3b62nmjZr169EkUE7EBoRoqaM?=
 =?us-ascii?Q?r1bfDn5X/2rgpzxYuDccjJ+PoZUwMRQ2c6G51LQ8Zuu7092ZmjAHCCq3N5tj?=
 =?us-ascii?Q?sQAi6nxAJH0mGZLCZO7jygEg0SGIiTpip/6cKpFOMwukNVNw5PxqQm1zWWn1?=
 =?us-ascii?Q?DgGVFHJ3vtkcNjMCthGm8U2xiVS/tC5iWoRt2AT61zae0QII8zOF21Fd5Prd?=
 =?us-ascii?Q?slqVQC+liusIHK4z/enEksLPFX3Iyhe6Y5g8gkawO36liBoTZzXSJB9Zb+0y?=
 =?us-ascii?Q?GjTSZcOkZYIogN8/DyvG8PYA8vua1lCnZf3Q1CkhJVEoqWfrdx3TwfcG1ZBb?=
 =?us-ascii?Q?4uZCAdBDgjXREp6isBtaltWxzBe4DE+EQa8kU2+5LiCZ1AZcONCvFMG4NThr?=
 =?us-ascii?Q?O6e1vydngL13b1h6JnvyOJRC+/IL2ylXRU7xGdvZYNxe1JDwL2JCq26T/fdH?=
 =?us-ascii?Q?o24pb+Wh13RBIbsS1A53tqDgNsxICLmR+ysx1Lr1VHo79FLmPutaW3ylR7ka?=
 =?us-ascii?Q?nM/TsSjd5vWTeVWOnkUYKacz+c9N+m6nRzE/j6+wzokcjLnQweKjMvlODZyt?=
 =?us-ascii?Q?4EQctH3P1k2/9TL+92CJ9vcq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fafc6265-e265-4485-44af-08d93add9141
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 09:09:15.1331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioCXlTYZCdzbYQy5qdfwh7X+HCLSYAX/+OtCP/fEc3Kj+bfLf19hURmcUXp/3d+8iw9aA5wGhOHIn6+5YAZ6KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 28.06.2021 19:14, Andrew Cooper wrote:
> On 02/06/2021 15:37, Jan Beulich wrote:
>> The macro expanding to quite a few insns, replace its use by simply
>> clearing the status flags when the to be executed insn doesn't depend
>> on their initial state, in cases where this is easily possible. (There
>> are more cases where the uses are hidden inside macros, and where some
>> of the users of the macros want guest flags put in place before running
>> the insn, i.e. the macros can't be updated as easily.)
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Honestly, this is the first time I've looked into _PRE/_POST_EFLAGS() in
> detail.=C2=A0 Why is most of this not in C to begin with?

Ask Keir?

> The only bits which need to be in asm are the popf to establish the
> stub's flags context, and the pushf to save the resulting state.=C2=A0
> Everything else is better off done by the compiler especially as it
> would remove a load of work on temporaries from the stack.

I'll try to find time to do something along these lines.

> Nevertheless, ...
>=20
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -6863,7 +6863,8 @@ x86_emulate(
>>          }
>>          opc[2] =3D 0xc3;
>> =20
>> -        invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>> +        _regs.eflags &=3D ~EFLAGS_MASK;
>> +        invoke_stub("",
>>                      _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>>                      [eflags] "+g" (_regs.eflags),
>>                      [tmp] "=3D&r" (dummy), "+m" (*mmvalp)
>> @@ -8111,7 +8112,8 @@ x86_emulate(
>>          opc[2] =3D 0xc3;
>> =20
>>          copy_VEX(opc, vex);
>> -        invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>> +        _regs.eflags &=3D ~EFLAGS_MASK;
>> +        invoke_stub("",
>>                      _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>>                      [eflags] "+g" (_regs.eflags),
>>                      "=3Da" (dst.val), [tmp] "=3D&r" (dummy)
>=20
> ... this hunk is k{,or}test, which only modified ZF and CF according to
> the SDM.
>=20
> The other flags are not listed as modified, which means they're
> preserved, unless you're planning to have Intel issue a correction to
> the SDM.

kortest has

"The OF, SF, AF, and PF flags are set to 0."

in its "Flags Affected" section. ktest has

"AF :=3D OF :=3D PF :=3D SF :=3D 0;"

in its "Operation" section.

Jan


