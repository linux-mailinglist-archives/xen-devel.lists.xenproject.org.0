Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5B3459096
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 15:52:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228944.396215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAfn-0002OI-5t; Mon, 22 Nov 2021 14:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228944.396215; Mon, 22 Nov 2021 14:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAfn-0002MY-2c; Mon, 22 Nov 2021 14:51:59 +0000
Received: by outflank-mailman (input) for mailman id 228944;
 Mon, 22 Nov 2021 14:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpAfl-0002MS-Hh
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 14:51:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcde5124-4ba3-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 15:51:56 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-p3O98vGKNW67PnUl-kvsWQ-1; Mon, 22 Nov 2021 15:51:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 14:51:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 14:51:53 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM8P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 14:51:52 +0000
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
X-Inumbo-ID: bcde5124-4ba3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637592716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvEBhX5Y3HrBVugXQGcDQBrlex1IztOLf8VMF7bEo7w=;
	b=WrhZVzu/pKw/+zhwNg9MOg+NPXURh6SDGCVJ7wuzbT8nmoP8xQukEQ5R/z8YUKWwMn8BQ+
	H8exWm5nw7h2UN/9ODCLYaNPxSK2tc3BRIYd7VkQ6UEWI6MNAmeCcsFAmFvrEx7+R+lBpz
	vEYadzwYAYltvkKckgynW9vL14a+C+4=
X-MC-Unique: p3O98vGKNW67PnUl-kvsWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBDCSfdN3rRLk4Kihh+hMNUr+mlBustG0xiepDmbxnm+X7qchZnXaQqKW6mu3+Cy33L0o8xhSL62xk+V8Mm5qk0hyn3N3Go8YTowkI5WJyMNVSgAFZF/mAF3XxO++5klhPEnuTxhySwIm2vFfixgR3M2F4MeRpck70WyoyQyh7Zw4DDEwBL/mz3MXYZ7r1vbeARnsVoV4wxCYfPy6eb+NbhHjKTC+XvEWP7waE8LN/tF9Ag6bggX+b71EyXDWiNof1Fh9lfANyWZVqS6e9HK+YWxhXjN5gK1TMDSs1JiUqE/2sciDkHfyNortkSQwuL4p3X1hzwmw7TmP/8GhD6zcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGEHzUyV9JyjwR6seaW3DR+9EKwH/I3dj3JRg7ulIEo=;
 b=ehcMhXvDG1d3nWKH0bcIOLNnGg8pXABTGQtayj7r0pK+hM01VH94VJF++DEtPwCuIvSYpLf/76dt0KkzO7cKoxrKFjI61sFE+DpSbPQ3m4up7QwA5lGf6di2CYxR+B6234ibAv593vxBHquxGBcfUpMmKQL1QvJc2Av3LtZizFnuRKp4rXKVpVbP9kmDd7nPxs9c/ZSvCUIYLefW/LEqH68nl59JohuKQrUZlg/D29CAGLbHb93HqUHhuj8Kn17wSi8qw93nNO3cDy5YRWRMdI/XFknVNEcxsh6Am81fHYBoOTtlrWwq1JO3csCNBYzuGrT1R1sEmOwgpRF8Yb4nVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84d05063-851b-5f80-e334-47c96087fa81@suse.com>
Date: Mon, 22 Nov 2021 15:51:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/5] x86/crash: Drop manual hooking of exception_table[]
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-4-andrew.cooper3@citrix.com>
 <4cff0241-ee75-59f5-49ff-cd29964efcbe@suse.com>
 <ecb4b299-5445-f3e7-5175-9422433061c0@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ecb4b299-5445-f3e7-5175-9422433061c0@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM8P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a1618bf-9cf5-47fe-5da2-08d9adc79f44
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70371D8E8AA649A18CA772F7B39F9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LgDvLcfVpqWCj43OqvNizxDTN5szYIQPQUecXoqp5ydNKxHZkMAOo24EN1gfEJv28W87i9u45MqbWEWQlci99tr26o0KaYdu1F13xLd245OVsKI+bXXJj4JDWpsE7RwuotfNr2X/LEhMnh7KdURKHynFEs5B/Q8xglgWiKuESWNipVSf2LL+HElotyDl/GMfyafXTxznkx71jICmrkmI+h7CMyHXIBG/rL66qwa9JEtmoi2oLIHzWjs8Q6jtDqsAMBTWUErsBs2foyNjgzU7jjqRWmERPDc7AhfHFoO5+Yk6geAXSlpclAxB+F8VkH3riQaDf41wMnasU0h6/VhZrt7k8cP+gPQBfXqDb+9DFRlvjedE28vHCixDdtjMegw0Bsff9bojNq7Rjp7JpOSPXtI2cJjNUzoaCsBLQOoF6HS6uwY6IMcSkqpYWDNlGwJ3hW/TuEHpYGfxo38MAHpKPX3AqaOuVzo85LJnSu+7IRSpw1p/xz+4cR1aVhuRM1wUwcyL3pSBQq2dLcpnhfM2z476LIhJWGH1zlbPn7fXUj6/EioOAmcv8cHB9O7uODuyVNVmxv0A0gEWQN/72hTL6bdgSZrHEutoFQiF3qugR3D0EMaMouo32puxXnnPgEJte4XvAU1o5Wqx2ytL0nW2+c6fHED6D/vWvhUov9eQ7rDCp4AeuDUq+Yn4TqB60nAo1EA2GCIGps1wTCRZKnCzcBK8VNaQucZb9joGfuhFcyF+NnTFaWNU12ymnMuWx7tqJ8LLI2m3s8WUpZESnYdHxtweZ3hPiBrIZ3LM3Fnz/6L9z+FZVLi2XxJvw97pRm94
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(31686004)(8676002)(8936002)(186003)(66476007)(2906002)(53546011)(6486002)(508600001)(316002)(110136005)(54906003)(36756003)(31696002)(4326008)(966005)(86362001)(38100700002)(66946007)(5660300002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xYO0H8EnRJZ55mov+gsjNgUaAKwu/zWuhkTnqkn0EjB+ukebmdjphELrPOPo?=
 =?us-ascii?Q?3TWc6ngu1lq8AvOhHtC7mUFna1ZZXx8PzNHLcCWNSRvC63wY1sIXhmv1f/xd?=
 =?us-ascii?Q?xjk0nRk1zSnVKojCzuoVzfBCcYb9gIuA2A3/b0RllDm8St4t6jlJ9HJf0nrx?=
 =?us-ascii?Q?E1XW8yp7qlPIp7EwDjUAqzyNeZoQUsoa7oxT2NGgD3EtXXk3nhl9yQhX2Su1?=
 =?us-ascii?Q?mHzhfkeZT6SWEDcQh3AZEOD2n1E/wxI+gG6U0w6HhBiJXjPOJOktTufTTzWj?=
 =?us-ascii?Q?rEF/Tu9YVvYNoTluYGEFu3k5cEWNGIWcEPCBRBnqXD/wt2zte4y0eyxTeLrV?=
 =?us-ascii?Q?eHgUakyqcvTarzDFwRe27HI2Aaa8ej8ip11iouz5kvNaG2X4DECEsu8BWTaI?=
 =?us-ascii?Q?ho3ntjW2xjJsBLvGKqlEb3tfLl3Z17dwJAIEPFasslebnxw0yRetOdB4T/Ys?=
 =?us-ascii?Q?0p/z7AsxlHXUZ9+FBJzHEZt08ksKVE5obPl4wBcmLTfRF/VEPPXIbirToGWx?=
 =?us-ascii?Q?CHHFWhOUOazRjA1WdCfMUNW/mjzC+nirLA3cs5XlzrymxSIwE7JYmqQBkECL?=
 =?us-ascii?Q?vEGVGUlwKLb2l4k+ZFneNiXOT0CCuxarqm2EcKwXbwBJUJZU3z/N7vVMNWAJ?=
 =?us-ascii?Q?oBQTt2abuPwCEflrNp6RK5OxGWQaDWtTMZnSoeoSMUMtqddk3B9bLSGYDSCk?=
 =?us-ascii?Q?py80xo3xdSb7qn4Ti20pJ/b2tiK2ey0PUJf8wjuXqmsLHE9fCpPsTmZU/ddK?=
 =?us-ascii?Q?cf5x7my1BaRd4Qksef8Ekr3YbGHTm/Op4owZYT7dLjFsHKAdP5vl5GsEiBEU?=
 =?us-ascii?Q?vlRr2XAaY3owrFHK/9x6OipSbSjOdAltPXnP5MdihN+EgUY5W14gHJkxdefX?=
 =?us-ascii?Q?SSAurAhzgGedfdfRu37KH9ZLpswW9AXM/UEXAkZ+hkU3+gI1/YBr109oTHda?=
 =?us-ascii?Q?0i/VAqfVWuTIRdw2BLJDDM77xUwX5Y+5ZtdxjW7qSyOViEFuW/ZZgvhLF8L1?=
 =?us-ascii?Q?YbjutSVqDh+1rHYiyI6/pjKglbLvtnfIeu0cogLDmDrTHuIV6rjnvKKAyikn?=
 =?us-ascii?Q?eVMKo7KdFB5sPGUDIak2vEJSmS4bECNmt57f8hM4ZuxwarRlVaHgSHIHD34W?=
 =?us-ascii?Q?OQ7MW077ZFS0TeO8fcir3Vr6uihFJLpqvNdHEf2f7uKHYsD4Tb7ZV2tzTLak?=
 =?us-ascii?Q?SeY5nJ1YmkmVRdWqkzRTvHoV2pRCxqpeKeIXsah5sR2DMhzvC2ljWYIrtLhx?=
 =?us-ascii?Q?ynIiP+Tj1pz9aB2bEI/UTQsLFW2Qg9boWTZk4VsMMsPNDYGTn4r2MFWLM5ne?=
 =?us-ascii?Q?z44v3IX3yBefMm+Y4KxXWynnBOwlhSlfgo0TMeydEsG59sl5iMt/pl9LEO2S?=
 =?us-ascii?Q?No3cGeoT1kMmF9DiO7cHwWAnuesnBGrgSMXf1dZZplj4lpxZgku+TKT7Aw5H?=
 =?us-ascii?Q?Cw/wsJXjeESIEF93THkpTgMN0JoaD4WIDOq5pyEpwqosvBm59nYdnIiioUF8?=
 =?us-ascii?Q?myEGOjbFwuwby76cIe2ty2dm/GoKHI49XbHeZVJPBwd9QPt20jp9Cke3KhBF?=
 =?us-ascii?Q?iLwgc09qfspWgvWMT6VjZNqbTAYE2+10kg8MjwVNU1MCLRzB/KmtDbVO4Yr6?=
 =?us-ascii?Q?1OXK6JGBzTtMcObOWJA6+ZUHVaDV/TcWrlo+PkqqvXIDmHeLIiydj5OPXi8B?=
 =?us-ascii?Q?vi5LIUEw6LvYI51BO1lYhymJ/X8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1618bf-9cf5-47fe-5da2-08d9adc79f44
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 14:51:53.3229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUdb7qLVKWTJke0ALIsQJ6UsP1K3GjntSktn6DRz7oW7UYU81wUWwYfzFNV4xOhgmB55LSxGLkAT7vwvsjLPhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 22.11.2021 14:48, Andrew Cooper wrote:
> On 22/11/2021 08:57, Jan Beulich wrote:
>> On 19.11.2021 19:21, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/crash.c
>>> +++ b/xen/arch/x86/crash.c
>>> @@ -36,10 +36,8 @@ static unsigned int crashing_cpu;
>>>  static DEFINE_PER_CPU_READ_MOSTLY(bool, crash_save_done);
>>> =20
>>>  /* This becomes the NMI handler for non-crashing CPUs, when Xen is cra=
shing. */
>>> -static void noreturn do_nmi_crash(const struct cpu_user_regs *regs)
>>> +static int noreturn do_nmi_crash(const struct cpu_user_regs *regs, int=
 cpu)
>>>  {
>>> -    unsigned int cpu =3D smp_processor_id();
>>> -
>>>      stac();
>>> =20
>>>      /* nmi_shootdown_cpus() should ensure that this assertion is corre=
ct. */
>> Looks like this is the first instance of a noreturn function returning n=
on-void.
>> Are you sufficiently certain that (older) compilers won't complain about=
 missing
>> return statements (with a value)?
>=20
> Yes.=C2=A0 https://godbolt.org/z/8a1efoh39

Okay, thanks. That was with -O2 only, but adding -Wall didn't surface anyth=
ing either.

Jan


