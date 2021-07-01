Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E743B93C6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 17:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148923.275249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyNf-0002E0-Px; Thu, 01 Jul 2021 15:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148923.275249; Thu, 01 Jul 2021 15:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyNf-0002BJ-Mb; Thu, 01 Jul 2021 15:13:31 +0000
Received: by outflank-mailman (input) for mailman id 148923;
 Thu, 01 Jul 2021 15:13:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRek=LZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lyyNd-0002BD-C8
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 15:13:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87d385b9-34e5-4e9f-ba2a-d1d4dbe27994;
 Thu, 01 Jul 2021 15:13:28 +0000 (UTC)
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
X-Inumbo-ID: 87d385b9-34e5-4e9f-ba2a-d1d4dbe27994
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625152408;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ydcrTrLAzfXe3aNjGfjl5WB8cgTZLWAMYtc9G5cGdTo=;
  b=gnzr3f7e72Qu/Chbm41/FVdUEqzS7KiGHxlHRLuDKoR30x8D1ixHszNr
   nO9pukMuDJ2OzN+waRzXZzrs5p/ML9b8T4YNsZW+rAfZ7i3CjbZHxsKPi
   kO6YvxNsW7dYMyCNC4duY8Q56wjqHGpkIIK78Dh4PVIld0mMOdFF0jLU8
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6zI9ZKMYwdDrFHIvYFY2ic19yUSQSrDwKs6wgxS/4c0ougVrejlwwcN7Nye4PNbrguV7dWMQ0U
 OrNEfgnX77O03+MpTn13/xladx/CiSN0ut64Q01DrlKzPRtcmNDDzpPE40vibCGN1AsFSMCT1W
 kVlKCBas7kebf7yirIBh7ERku9+XYdLz/ub55Tc65DrTqSBh2+T+gueSbhyIyQcBrhl3ItPf9p
 Zhrhjw87tnCmkcP+DQm8AwekuWQwf352s5wqfhIXqWo94oIKiNe9ITPGy9YB+AXkWau5JSNogH
 fr0=
X-SBRS: 5.1
X-MesageID: 47391768
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:viFdeK/7gbOtc9MSIk1uk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47391768"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxycDaqTSqXA31CRNt4Bg7MVYYSWtPTqRW30unpo0noBzIBEv9HjrZ4CTTmurEAUh0jowPXDYutmyeXGscOTflyMGdbX/AWgGDjTlKYTlF6VrQlvyzWXIqgiOaKWMWsfiXhEEbqTY07/vnYWWoJP+6W9U0w7UKzT/5vbPk71U7bd44spO1FuPuzIjMhcy1kyvMn2xsA2IVZdgUgHSh2Adx1vl90tuuSN4ILLslEJt67xixqXqpLsrpm6X5BCn7tzuiJzZsen/Ru+D1XLpYGFAWE9GGRG2QCWp+pqxKr4l+S2ow8vWFNk1yAcEFjlqeCN+xdeUki1OfWlTD6XOeDF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMFB/iP2HOsEBbJCx9O3lVcQ2RR3FXbB/e+5SkWgTGQ=;
 b=g4Sk1FHeSiA2UfQt0wmG8VUm92Y4VhYW2P+/5Mf0WqsK8TfipaZhpgMWUeC2hLeKqIN1jbd+/DSErdzULT0dgvJBpXBaH57VtitNyqpPUaaGlF0mFjIkXwNh0mAA3yPT3lYaDJ8nyPC//hqow4kO/Q/PGZtTT1EzvjPn+McxyqyCdnPqa1alFDDOMbYvs4uzxhkvBjAyhoYuNNddDG9LtnM1Hml7LypI4vppzovEYOL3BkoPOvXaWW9lJa9PtjfiYq9NcHK06qgIKLexNcR5eed2xE3BvPMepqqE4i58TeuyHT98DpL8YrD5iha8Zzy1J4LlpNvikTmzOLtvHvp9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMFB/iP2HOsEBbJCx9O3lVcQ2RR3FXbB/e+5SkWgTGQ=;
 b=BJRc4md1llc/1xYAbTE3YwR69FMBQUNikqKpmJyMTjdoYWcyDSa4eCbfWmNOMtVpZPGYkFbRn+owZabppogEkXsi/NylTqFvl5La8FIJ+xG13Rnh2vOoNUUcvvFBR8vJVo6iBwdpnsroDjLuaa0Gv97cmRjCEEL1s4gB/ya6Tf0=
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>
References: <20210701125623.593fe3ae.olaf@aepfle.de>
 <20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
 <20210701170009.5a8be33f.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
Message-ID: <48cfe27b-70fe-36aa-833a-7d78e205528c@citrix.com>
Date: Thu, 1 Jul 2021 16:13:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701170009.5a8be33f.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a838265e-6ee5-461c-9fbe-08d93ca2c63d
X-MS-TrafficTypeDiagnostic: BY5PR03MB4968:
X-Microsoft-Antispam-PRVS: <BY5PR03MB49684C55485B24908806C92BBA009@BY5PR03MB4968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MjFIq2unBIf3KpVRwV/z4e1Yawwb0/n4M8VTSgM8TODPr8Ktn8B6yI6QeoZWAHEN41lYbPXXPSIde/4VdNd5aqm7LkxnVTxtgY7XFj4Xw3Re10KMAEgRvmTs4B6WexrFwqb0kootZLy9FaX7dHF+LYIsoc4knEhDrweld2kYxv1CylGgZHNJzpVV/ZMHT8v9diVBR/dcL8pcKfE2QDBjy1x9GW6RW2vWurVbxQ4dMH8ltkQD2qY4KeB2ZGOBpr6E6jKVoriTcDVa8PWYiEB5/S/PxtiePyMNe+pvnTheML9VoEvIdE8tny5akQ8Go4iWXW2biRJHmI48UhDhYJqaAr9H6ZqXfpfAktmX/YyhTjUPFKe95RhFY2oTNoIjkbwcEjek74CYYgI4bnWJwStLiy9nQQxE7Ag6W/JeBg5Eq0/qJpcE030u/Ac+7h/VyZyNJ5V8bzoS6qFfsMc//X7sJaxqtbfewFkmdBYkHudN6Imc5RmWZPsWQJVN41BiIubE9zRmqFAgXzQ0oRPEnpWnydLlM4+4iYKVGUrmW/TcXpf7qp1s+8zk4n+YOrB/qvePFywKH3cJ+B3x76YV9lxmz3R0DyCBP8N+qoYJJSIO26trzRNlVIi0n04UVMny5qLEa8zL77U6xDq1OV/iKcC43gYRU59SEfMUDKwQ2s9XvcpreH9Iw7WDmqiZIMfF7Xn17FJJFtF4PVnI5Y+Gg9PAN466TQZ7GqDlLeYSEkQiCWxS78knw673+Wx9kSj4Ri4T
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(66946007)(31696002)(6666004)(6486002)(31686004)(4326008)(186003)(16526019)(86362001)(38100700002)(26005)(36756003)(8936002)(2616005)(16576012)(2906002)(53546011)(4744005)(316002)(8676002)(956004)(478600001)(6916009)(5660300002)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?xf0GqOsqzCzKwcDaIH42zAuDY1moxoh/L+uD0HQhqDfwAbT5yI/S8Sv5?=
 =?Windows-1252?Q?nQF/XW+WPecvzY/Rnd+/90gGJyTEjDiOf96V7Eb0zHAUrNya1U5Ht5AH?=
 =?Windows-1252?Q?8YdjB/s+MyUsOUOslTtqO2sobSaRjvy85rTiSE2aE2Qd/1srolnwGAkn?=
 =?Windows-1252?Q?G4UpG39XRssZgtEivRqY1bngXguu3IB9B5LbTY8gyYI75u6Lewm1/LRA?=
 =?Windows-1252?Q?qioSiUn5GIHHKO0BhHCMk/d7byhpMkZppVM0vEbI9V7kDnNVyAxDuuwm?=
 =?Windows-1252?Q?jLXj7/i8C7+4EJ+pmTRt1m+NP/acpzJmUYN4BRPmkUII1k8kHTIHETvw?=
 =?Windows-1252?Q?DK/NEd0THx1cJ7xNp4zp3NI+zGdYYcOX6xNOWXdLfXwoWNkllIW0SKBh?=
 =?Windows-1252?Q?Wr7bPaP5fGk+9Xaq5poYov8ckuW9dru98jvL+UaFdCY8dmKi25u7d/+8?=
 =?Windows-1252?Q?SoT5crCps8qWuHVFNAcyWJhTb/fy39LjLNZuAx6Ls3KfhI/3jAqHallU?=
 =?Windows-1252?Q?LLJIfnmRvyNOUME4AyfJQZRKxdt8BSy99M5CA6hUKNx3vFInAB5ek0p+?=
 =?Windows-1252?Q?o+8xi8v7QaEes+xZLvsZunpzpSpnvAU97LxkIoHI0sey1NHTHESTvRxe?=
 =?Windows-1252?Q?p/yGgJC2m8NhqAEst16HsPbtLfNDb5B63dxeiSXElLdwaTmeDWhSfA37?=
 =?Windows-1252?Q?U7JP9EN2wZknTZYNztKLaldnNT2OFfG6bx7uRNql4mcbJgqb82NlYkav?=
 =?Windows-1252?Q?VqXzsK0uYreNEbQyXgrjO/zJh7oTwpyI2Bm4gC5EKdCzZXnN3B0KaLLq?=
 =?Windows-1252?Q?iZoGKW7gSmZ5X0q0UfvLEoJWiBCaW9IVGviQM97Tzcju6ZqYJRZMMesX?=
 =?Windows-1252?Q?h1k0g+RXn5WEbr2hPxeXn3xY253AQMhlgths1vMAZfV19ImVjP6sfmN/?=
 =?Windows-1252?Q?BBaujtZWlB3yWwNwSsN+UsjvJ5VOSdgcUM4q/RQKwdN+mtXXEAATvtCy?=
 =?Windows-1252?Q?t/O7JCPv5SQQPFWcPi5sx54exGRGgJlbHuRhRibl9BL3VpvIWw0+33YB?=
 =?Windows-1252?Q?ri0qOhtPzo1ZT59ykgERcSHSvdrLAj7A7HBYOYmm6MA2xZePgzYXvecR?=
 =?Windows-1252?Q?Lqvq6GO6cVsXuvgwV8qbRiTdG4cN0CxzYHCFxUuP27v/iBL3idioSLtJ?=
 =?Windows-1252?Q?19zVIRqWGheJto3/SKivHPXHxDJb3gCA3IblBsMcTbpQ9//xsWO5J5Im?=
 =?Windows-1252?Q?a58+yoRSwBRVFDL2k8UepUxT/cV0zDURfi/zfCfcGy6tTdfg0YCm/9ss?=
 =?Windows-1252?Q?eUsah8NX1gl/jCS5XKrzTjMl7mi6+fB7i5b3/LK+PlotsBzGvP90LI3o?=
 =?Windows-1252?Q?quAip6lMfp6gUCxt18fUaIQFqSuaZ1M5WV737i3cALm3MvLrYDkvYoBC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a838265e-6ee5-461c-9fbe-08d93ca2c63d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 15:13:25.9360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uByN7qHxXAOIyQ18s0Gw1hBRvN7l+rPRqSoqRBvI0xA6SOgrCx3R02gfwBUFwC35ijgWYYyC6G64ua730KXaiFlVigezGjl7t+e+NkTSY0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4968
X-OriginatorOrg: citrix.com

On 01/07/2021 16:00, Olaf Hering wrote:
> Am Thu, 1 Jul 2021 12:19:24 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>>  Where is the 51 leaves coming in?
> I suspect the bug is this line, and the magic "0x1c" value:
>
> p->extd.max_leaf =3D min(p->extd.max_leaf, 0x1cu);
>
> In my testing basic remains at 13, while extd is truncated from 0x8000000=
8 to 28.
> I think it should be truncated to CPUID_GUEST_NR_EXTD_INTEL?

That logic is definitely incorrect, but using a different constant isn't
right.=A0 I think it has been copied from elsewhere else and incorrectly
simplified.

I'll see about trying to fix it...

~Andrew


