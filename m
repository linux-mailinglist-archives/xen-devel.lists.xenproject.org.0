Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8445C36D73A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 14:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119288.225706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjGQ-0001Aw-Nz; Wed, 28 Apr 2021 12:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119288.225706; Wed, 28 Apr 2021 12:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjGQ-0001AX-KX; Wed, 28 Apr 2021 12:25:58 +0000
Received: by outflank-mailman (input) for mailman id 119288;
 Wed, 28 Apr 2021 12:25:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8fo=JZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbjGP-0001AS-9n
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 12:25:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c24b0d9-5eb7-4c37-992c-9050b018786a;
 Wed, 28 Apr 2021 12:25:56 +0000 (UTC)
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
X-Inumbo-ID: 8c24b0d9-5eb7-4c37-992c-9050b018786a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619612756;
  h=from:to:cc:references:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3GSTP0sOz+gvVg67wg/hpzHOIkbb60iO32BepmLw2aE=;
  b=LelskdGV1MP8WZaBLqqr4eioCyo4vLzwQLRujNkFoi1vygzPrezUxT+S
   pVFUp5AztpTiQvwQGBb/8aw+VfyIhW9wPO7lCLBuJJNuGzXGs4gxC7Uyp
   os7/19gerRX9PdI7DGatsx+vmuIbEaw+2r2woqUAQY0zbSsNU6FIdeVXN
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NHe41w5qBUg2H+4UaymrR0r6Qe7L8yLGs+6CxN0RE2wtd5XFa/Ykzn3k+qaAFzSO7AySta7T0o
 Y+38oTmnulEBZXfZSHQfyt8NIh6FakOeQoMUGLBs0wDG+Kp4JyvxEfHAh06rRt7x8eSf9XK4m1
 usTDI1rWZcU+uWdE+ZF1sUOLrTeG9E65uGlh448Tm9ss9w9UIE60iGaOlQeII9j9TTBarnaPsP
 9BlD5nqAi6WGV/EoJ/bKsltGnoBqYS/uJ/ngi3HeL8t6QIJ0D4IuYFmmHdwV4NqnU7PVdFxt61
 /eI=
X-SBRS: 5.1
X-MesageID: 44105916
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ocu9Ma9Ew2rvChj7DTBuk+FLdb1zdoIgy1knxilNYDReeMCAio
 SKlPMUyRf7hF8qKRcdsPqLUZPwMU/035hz/IUXIPOGVA7ppGOnIOhZnPLf6hfnHDDz8fMY6L
 d4f8FFeaHNJHVzkMqS2njbL/8O29+CmZrGuc7/yDNXQRhue+Vc6W5Ce2GmO2lXYCUDOpYjDp
 qb4aN81kWdUFAadN6yCHVAf8WrnayvqLvcbRQLBwEq5WC15FvCgtOXLzGi0hgTSD9Jy7s5mF
 K19zDR3LmpsP2w13bntlP70pVMlNPtjvtFCcCc4/JlSQnEtweyaIxtH4CFpTA+ydvO1H8Wlr
 D3zSsIDoBW0TfxdnvwiQbx0wPguQxek0PK+Bu9uz/fhuDXABg9ENFMgIpFdACx0TtagPhMlJ
 1z+wuixu5qJCKFox3Yo/TufVVQumSVhVZKq59gs1VvFbQmTPt+lqoixQd0Pf47bVHHwbFiL9
 BLSOD73ss+SyLqU1np+lZX5JiNZDATLjy8YmVqgL3h7xFm2E9B6w89/uJavlpozuNCd7B0o9
 v8FuBUsYsLdOMwQI5Hbd1xNvefGyjKWhLDMGWbPFThGuUGIhv22uTKyaRw+eXvYpsU1t8pnI
 nZOWkoyFIPRw==
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="44105916"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwXvphdkGghxrO3pZ3vssAAKk4QJ7ZOTSZvQPngA9lo7y75Yum6AXeo+zUjpQXs/wvmQ819ZmizA88D8vmECz6kA8t8y4klXb7lNctmLBM7WP8asGRoUkAKpr3gwmw6QyU219aMdHp5eiUg7pmLvKbMDzk2bCiDyJgtAymwvEXv2MDWVajH1PexMApqldVCx+rezM/2hoo9jOabr8c9QzSvg4q0KUXKzPHbKSXEn9Ssx1gSFCZZ1I7of948znK8oAihN1musNj36ujQ4721WndmSovLb1AMz/iYmxkTe/wD0HuZ7g0MDz3E4mCVNF59DcGaVuplEdY64UVRw+p276A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GSTP0sOz+gvVg67wg/hpzHOIkbb60iO32BepmLw2aE=;
 b=f+TE09p6mPeYFs8pQD42nQTR0CjY7VXae7jjhzIidEwvf18XjdS9AUHdXhSd8gnQGeDV165wnzGWsSgqBvMtnJqFF8TXMf1bzS9tPkO9oXK9EvpHov1eI/3vF6tAQcTviTNIA0iUTi4JmFmvawhGKQQsWYqIKPlLUI7NHdZce4FHHOGg4afdqEizmdA76J9LqN6SDzkd/ukxbptWn79zDZNt8TOzdZim6vFK3rRezatSXPrZ24QSsJTGtM3Ui1qFXs/hbMhVBBCfUIqusocl76gkhB7kQtgqg41om2xJWfOJ+JSP7zNCht/SulqSNkuLe/9omB0VAfaPdnsUKevpMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GSTP0sOz+gvVg67wg/hpzHOIkbb60iO32BepmLw2aE=;
 b=a++ijO393Ki9Ka+ab+fP8UGepH/FrFzrjGQGdJfnjJ4VA4qUy879fsnAVoxslFa3BtgBqyrCeA0wxck0SI0omjq7xtkG1FzPJ162p5THQmTeGGScCIz/Jpx2YU+JmYeOzCfnt+5/KFW8BDfUyEXQovRq31hHmMzAHnybX1Spvnw=
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <03630ebd-861e-b02c-e845-1e2324211562@suse.com>
 <3e5369d1-a6eb-92c4-868c-0b9d205aba7a@citrix.com>
Subject: Re: [PATCH 0/3] x86: Initial pieces for guest CET support
Message-ID: <d687a294-f0d8-62d0-12ac-2cb5582b8605@citrix.com>
Date: Wed, 28 Apr 2021 13:25:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <3e5369d1-a6eb-92c4-868c-0b9d205aba7a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0514.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 121a52dd-e382-4451-de48-08d90a40c2d8
X-MS-TrafficTypeDiagnostic: BYAPR03MB4871:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB487196E244D03110C3E05F4CBA409@BYAPR03MB4871.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmt5sKvl4lUBnAmzRhuLR+p+RhxMYzCelk3/LydoccZ5NvlOsKSKBu4MR0C8T1KFLappePJZndW9GhJg8M4E4TqKvRvEcMYrphNEtDz+lwAKl4YT+51R2pmXvksnFjx2OwVCoCXqwN/iZ5n3V0ksNc4QPwxlYf/nktj4tfvpT+xiuYsSGkuShr8If2r0m+uqbbXLE5jBDVK3JlJPyOWIQtoWvoolcoUZdfrvGn6vvAL/K3FXtJBxYctfDQzVkjAmIbIMkxtPk5kFmIGxI/HXTBW6aw8rOFcaN5UemfJEnk53WDWrSFoYgEArUovuvKTS8LM+ijtQQJW4hAkBxUsL85PA7ECqvYu2JTwTjvNuYc5VGRDRssXGvnbJ9dUsu5X/1bQeKHxe050gc1yD8Eaqb5lOiOwr/OWNcbSMAzrlvdjMsk3t8IWiGJaI1v3Ck/prZ7pz2pncztaIXPBgbxA31j/BcinyT2ip2ySL9i4v6fmPGizfz7F9jrEBZ1neTe0aOWIgHghUonyoKrm8gFJR0hIfY+WwmScWpCN48VK9Zqil0G3vE6b4QCKGFPnTNFLQBgWDxaTpKB091XVaDyTRwL6K441E5f76YCuft28sgFH7v6KF0PzTepaU+xossxdPT1Q1LoCwAwTP1I/fcn3y9Wj7SUCnEB9nU+uP/wg9V0Fl8MyeJDmPSf3W3lbVcTgX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(66946007)(66556008)(66476007)(5660300002)(36756003)(8676002)(186003)(54906003)(86362001)(6916009)(2906002)(38100700002)(16576012)(8936002)(83380400001)(4326008)(53546011)(2616005)(26005)(31696002)(16526019)(956004)(498600001)(6486002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHNlYnNCV0tybFNjWmRxZDFId2dTNTNmZysyZkZuWkJjSDdlWTlkbllhcEJo?=
 =?utf-8?B?Tk1udVBadHZ4VUNjQVlJQzZhSjN6bllnbUVPcWZYLzY0TjBuWWduaDZvcWZC?=
 =?utf-8?B?aDhsVUw5MTVXOUduVC83Y1paVkhHb1ZvMy96Rm5Jd083U24zWUZUUmt0dVlD?=
 =?utf-8?B?L3VGU0pIL1V1bzV5bFJ0b09rOXNRNEltcXg5TWFXQnBxRGZVcEIyQWxYbXl0?=
 =?utf-8?B?aVdWaExXYXJiSCtBbUNvYjViNjgrNDRDMlM3bHVVekl6NnB6Qzlxb3lyY0Jo?=
 =?utf-8?B?ZDJ4Mi91dkloOWhvZm1VbUgrblMzbWVJaUI5RFZtOUNScE1yTS92NDRjWVUv?=
 =?utf-8?B?Wkl4Q0NyTlBOL0wrTFVyOVpVdENoeVcvY2pNL0poWjRhd1VpVmloVDFhMWs0?=
 =?utf-8?B?RjZlOFdURGJIQWcwaDNjQ0VvTWZycmFjcmEzRzRFSnpOU1lYWWZiYmQxYkJO?=
 =?utf-8?B?QVJwRGZvb0xhdXRnRUxOTXUxMGxoSndzaHQ4L2ttdWlkOEl5RUdVOUswdWlk?=
 =?utf-8?B?QW1kZ0RjVTc3R1ppVi9hRFBCTDJiWGVORElZZ0FrR0ZqYTd1OU0wZzFOcTJI?=
 =?utf-8?B?WVZobGIwZkR4MTdkUjRLRGlSWm80QlNjdnRwcWR2N3RpL2Z6S1NOSGU0a1Zk?=
 =?utf-8?B?VjYxeFNJMWZ4VUkrNVN0SElwRGx3dk12QTcyV01Hb2VIZTlEcGo1QmZlVkNn?=
 =?utf-8?B?eHJ4cllEZWp4VWt2Vlh4dm12V2JEOGVuZkx0N3o0ZHRVQzl3bWtBd2F0cE5x?=
 =?utf-8?B?cnJ3eUVER1pxWjlnZXhZcG1BSUdubXZoR1AxcGlWQUl6N0hMU3ZleW1lOHBH?=
 =?utf-8?B?bXZYTkdOYlFnZVNrb3RKamQydEE5dmdkcDFaMmhIeUdpMloxSnJscEpENDdX?=
 =?utf-8?B?bk1aVUkydE1YcXpyeC82OUdrcHdzVmhsRHFlYWZPR0VWcHRXQkRpQ1hVVWxU?=
 =?utf-8?B?RGJsdU55OHduTG90TEtKRlpoNEMzNDBFdm9uZjZxaXljcElkdm9wTHphWEJt?=
 =?utf-8?B?eHpLd1Q4R0FEbllvUjJQTEZNUUl6YVJjYzFNS1Z1aVZZZUVVeHhYZUVONTU2?=
 =?utf-8?B?ZGxnRTVudkRwMlFydVRSQWdVaG9tcm5PZWV2ZVdhWE4vU0J3dENSeUY1ZndW?=
 =?utf-8?B?M1Z3WTZWVUt4ZHNNbTlHM2VpejZBS0dCZHZhczNqTDdmMGd0WkRCQzljcXdG?=
 =?utf-8?B?NDFZMkYxZWhKVS9mSVVQMDYrVmtzalE1bmpRendJL1JHVFNtR1hGeU0wbVN4?=
 =?utf-8?B?ekJxK2Nvd1BSTmFnR05NVnk4M0ZGNWFwR1VqWkN5cVJQSUJML1M5QkEwV2ZO?=
 =?utf-8?B?WmdlcFBDZG9HenNNN090eUdWRmFTekxkaUZFR1hhYVNtT1RJTDZrL3A1eVpx?=
 =?utf-8?B?ZmxVSUJVdUtwWUdwaUVYQVJESTM5SVpoNXJLaENMeGhUelZXMHhxS2pKc0c2?=
 =?utf-8?B?RzFpY2NjRlZ4VGRoUStsYWUvNlFkZUpDaC9MUEV6K201bDdmVmtDVzVQaVBX?=
 =?utf-8?B?WXJoRnpTa0tDL1V2ZlYySGhud2UrdTBRSnhyL0RJM2l2dWxRRERWZW1rVjBX?=
 =?utf-8?B?ZDRkUlVlQkJXanZLSmJ2Zyt2QUlkUTdwaG1DTmNhcVpHN0JzdW81ckdFckl4?=
 =?utf-8?B?NUlJb2psSVdaN0c1MTFIWEtrWmFHUFdlSEpIOGQzcXR4OGZtOCtGU1lmRXZk?=
 =?utf-8?B?K2o4cHJ0aUlkTDV3RWFGci9WT2U5OE50dFBNV3NZNWloOUk1NUdxdlZrUU5N?=
 =?utf-8?Q?Wi4MY7PHiHThnpg3OwVZcpYx8Gd+KA48ruK6kZq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 121a52dd-e382-4451-de48-08d90a40c2d8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 12:25:51.5121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjLPqSxGQgzv6T0Jtp1eV/rzHhl66hl4YwRGkUouquXfC2Fw0Ljp0QKdhdtMA0A+sW6hyUWdJvGOFGw8ego1BzgzgA+pdtIXl4AgkSjfaiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4871
X-OriginatorOrg: citrix.com

On 27/04/2021 11:13, Andrew Cooper wrote:
> There are 3 emulator complexities for shadow stack instructions.=C2=A0 SS=
P
> itself as a register, WRUSS no longer being CPL-based for
> user/supervisor, and the fact that RSTORSSP in particular uses an atomic
> block which microcode can express, but can't be encoded at an ISA
> level.=C2=A0 I've got no idea what to do about this last problem, because=
 we
> can't map the two guest frames and re-issue the instruction - the
> aliasing check on the tokens forces us to map the two frames in their
> correct linear addresses.

Actually, RSTORSSP isn't too difficult.=C2=A0 I'd mis-read the pseudocode.

The atomic block is a check&edit of the token on the remote stack (not
both stacks, as I'd mistakenly thought).=C2=A0 The purpose is to prevent tw=
o
concurrent RSTORSSP's moving two threads onto the same shadow stack.

Without microcode superpowers, the best we can do this with a read,
check, cmpxchg() loop.

The common case will be no conflict, as stack switching will be well
formed (outside of debugging).=C2=A0 Any conflict here from real code is
going to yield #GP/#CP on one of the threads participating, so in the
case of a conflict in the emulator, a likely consequence of the 2nd
iteration is going to be a hard failure.

That said, malicious cases within the guest, or from foreign mappings,
can cause the cmpxchg() loop to take an unbounded time, so after 3
retries or so, we need to escalate to vcpu_pause_all_except_self(), and
or the ARM stop_machine() big hammer.

I'm tempted to just throw #GP back after 3 retries.=C2=A0 Its potentially
non-architectural behaviour, but won't occur in non-malicious
circumstances, and all fallback mechanisms have system-wide implications
that we oughtn't to be bowing to in a malicious circumstance.

~Andrew


