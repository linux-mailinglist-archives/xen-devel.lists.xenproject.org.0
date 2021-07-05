Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C92F3BBB3D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 12:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150068.277528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LoJ-0007Ff-HZ; Mon, 05 Jul 2021 10:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150068.277528; Mon, 05 Jul 2021 10:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LoJ-0007DN-DX; Mon, 05 Jul 2021 10:26:43 +0000
Received: by outflank-mailman (input) for mailman id 150068;
 Mon, 05 Jul 2021 10:26:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0LoI-0007DH-GI
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 10:26:42 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cbed756-dd7b-11eb-8441-12813bfff9fa;
 Mon, 05 Jul 2021 10:26:41 +0000 (UTC)
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
X-Inumbo-ID: 7cbed756-dd7b-11eb-8441-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625480801;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4kbApuj5NGTzEu7+bawpz+6DL+1+MSwUB5lOFyJYLMc=;
  b=dI1WXW9YDUbWE1KB+8fPxLYBgtXwBJJj2Z8cHi0yAY5ASdOiwyZwvKUo
   BAIpNaf9AAO1acZ4CtfG5wuq1AlsXzQINkciF0nsz9tIZ1QWoLSUaeZun
   ItxSaGPK8hX5hvpLbanRjwTiK6csT/K409J/vsyvHTeeCjbNxY5pf3GI+
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 939O6f42u88o3HqymiMS/n5catIRZo8ync97JO9hFpz62CRa2nxOucz9WKo2AOFCdmRlfDPX7G
 skOiSmatjcTeblHSnSJWMVI9uaqFupIGYrIkWFJPNGr82513D2ctwjRNT65HcODaA8Zl8bHrbU
 M8pCkNWC9Nng/AFjJjvT+IMn/sbX2dSEZ354D5/HG405mMenzbXoYQbDcRgUy1kKaoiTqwSckw
 4qwbUg+vxhAGzxqsVbv5rZtfsewy2z2yG0/lR7xyX0/qcapsZNIXLSZ8lWMEkCaoUShqbfZSoI
 DLk=
X-SBRS: 5.1
X-MesageID: 47573804
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:XEMBj6DyUKXXJvblHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47573804"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4OFsTj4H4arsur/22GsgmrYPudbtVeRiySAzeLDMqVZebCE+3IV3jY/xim7hRM6oFH3GLrl+TmSU5bAgKvnEgqaUHROX7gs4+EAwS1cUQBN3NdQzS/2o8GQ+qqxYCdORcUDmNCoqwjwipn+VwOmq81n3kyiCbzNhzSNJ0hX1aHZEqPyct0CQFpF9M/vAbYo/pZPLkaI7kcDCt9MCNkumPYxV7aNHed8GYX+NGZFL29JJ29d71iimX5KDidzLYNu6hlbGmhs7dBdfIzYZEZGNtc1Q7CO+Hv66nM91PfAk8U8UzJsVfFQg2Ea8023/C0zz+VCrD/4/c5M5zFzhbJx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtycx29JKBGCYECyiI+oR4jzzwt4Bm61OsfO7gVru4Q=;
 b=NF3R8i5/vUyeTa4dD+vWdvebDdOl+2KvjNmzAD8+Hwt0KS8oQfsLydtaOj1JsP+xYOXZWiufhX6RTOuOFIZIbFg+7Gcyo4SXPWCH+uBnZgGIyG2kfPUK0+hLmbwQ4Q7jnxJFraF9f9hurRVwNGaOPdkD7Q22EazAuSRoMbpmzqujCALdivswPgrqMgacmXlgAD2mJboXY1xrWlQdrBYXSJ0xYKd1ekYYAsYhKUah/Ul4OsGY4RUMXkdssNK+p7um+cPaHeMMgaQ7FcgqoUrKWt4C6acad9f/Rrv3cFxTlX+jUXPySc0t2OB1BgqKet3K0lymiccPTW0mB9eRDPMp1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtycx29JKBGCYECyiI+oR4jzzwt4Bm61OsfO7gVru4Q=;
 b=GdDsYlZ6rKdM6iN5WmNKulugoHSZ6jQXIlsAyZWs1rqJkoBl61+HmOvuvBtK7m9WM7TUdPeAAd3id+PHW2ddQ94ww7QDh2LewDLjDNVd29Dcr2Lc9hIMgCIrJLUrDK77QxcBgAjJo2FapN5RS2p6aje7NJu+CkIB3mqxF41imaU=
Subject: Re: [PATCH] tools/libxenguest: Fix max_extd_leaf calculation for
 legacy restore
To: Olaf Hering <olaf@aepfle.de>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
References: <20210702190334.31271-1-andrew.cooper3@citrix.com>
 <20210705093514.45be9be8.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f14ad095-c5f3-68ba-ecc3-5a724fc78705@citrix.com>
Date: Mon, 5 Jul 2021 11:26:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705093514.45be9be8.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0385.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb9fba98-18ca-423b-61c7-08d93f9f5dfe
X-MS-TrafficTypeDiagnostic: BYAPR03MB4245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4245B4853FCBA9FCFD07E6A1BA1C9@BYAPR03MB4245.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wzF+kRBczHPqaaFuCJoACAgJlupjrn3byssOHbYJBycREF73ID6O7KWvh2+KVFHrtdh43rw4IToWm71VFkOhCU49L6dLOKY3WySRxjGFFB9N211pNcgQFcckH4YJuG5rZynRpRuNC1hPAwwYE0WYJHvpRQ0jMyb6SptzsaLJdwamJjSkAfqk7zon3NkFGjqbA6t4lLgSvYjGSK94vR6vsicTCK8OEg87hhbuY+Fq1pqTi4W1khb8f/o3H/+Q7IUgbKUqMUMZSz4fxbusdHTlIcWTbO9PXlOVJjGcs9VBK1Dfqb/Q0p3G0uxzy4wmMLB9XJkKdMTlu9Wt5bZYesCYvjzd2kywiAhc1EpepqR797smeTqU6n5DPugiWQ1P+Pyr37rlk2AoD85Ch0JpDN4tX5FAVkU4f83n1DaX6h6ZoT5IDX4ks6cgXBKuZyi4EBTmqh4vprWJDT5ixdx/KfqPIz/uKv0uaD0BIWiN3RyFBPoupAKO8JU4eTUJlgQVqGmMeVSl9lsKtFfbW6xzu7Yukz8xnyts5LF6yzF9NAFt9q3rSU4msUUBWUO1Quywyth6NmGC43pie/YUlankgSqlw4HWKBHlk5L9dYnQg7BlL0WwFcTrMxdAbQ5hT8JYtWmdaUf4ohMy4x8M3XWVB/HInA6lnkjZ4HgFAh3UjzMnT6w2x22E8lNjUIWYgi/TCC3sFQepHUh8Ap75iZxLz0BHfhwXac9qPaG+m/Tek3qzNwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(2906002)(83380400001)(8676002)(53546011)(31696002)(8936002)(16526019)(4744005)(54906003)(186003)(36756003)(5660300002)(6486002)(31686004)(26005)(956004)(86362001)(6666004)(66556008)(66476007)(4326008)(478600001)(66946007)(316002)(16576012)(6916009)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?mVMOiy3/1PhNQqZsI69NcoS3KVSfvqm8THGEwwVekrC7dOXBq/8wxZHT?=
 =?Windows-1252?Q?6AGMilxNI83/AR7E+ZdtTsQYUQtSaVe3P54CQ+1jEA2Jc9K6ZRzn+KW/?=
 =?Windows-1252?Q?f37MDzACKdWyMq1LQFCbT7JZOnYHDfxbKxynFpeX8cNtw9cue4q+54nt?=
 =?Windows-1252?Q?DY1NJKUuK6RBZ3/7ooecPQLs7Musndk13LRCLcCooXRHNin3kgXnEDu8?=
 =?Windows-1252?Q?kJq7xuFFqwoYHYSYRVZBOzwHzqx7b/x/Spvqf1FKdTadFX0kkjgFMHij?=
 =?Windows-1252?Q?nTZBDX3fdJcL9fvTfJCE+OKxx51enn382U+UD/vh2DoTNSMmtOhK5AS3?=
 =?Windows-1252?Q?TFvhsVu1f4leopmu1FjJa9OrYJJ9AA4bFmKac3146bebw65q6lNIv74H?=
 =?Windows-1252?Q?nzusWaFNSfvUkpuvGytXZc+ZnW2iZAisQqQDlHiHIAJlQydbB7ihiAcm?=
 =?Windows-1252?Q?SmRJ/WpJIxqHsstbSFRFZpBNOL6A4Xzr8viMyTFQwCenMDA0hv0ShQ6G?=
 =?Windows-1252?Q?ViQioW/3eOwUMcx2du0SU7z+sDmvu1KuLJcLC/wAPHpLnQtVke+f4ToW?=
 =?Windows-1252?Q?tuwIew27As3NxZ85bkJhFM3pqNe2AmSQZhHhRtZt0kznusoKhbxKIKQY?=
 =?Windows-1252?Q?FsmZUML26WMd7rgxTp1hPtBxIu//cQRO9GNXFmYQomYrTLBaVsXb52n+?=
 =?Windows-1252?Q?WqX9xkkYn+mbTR1bVu+aWGTizUjlkXqBpZkL4JSZiRs0Ip1cW82nRoPk?=
 =?Windows-1252?Q?O3cGHPB40rFbyO3fLMXZR7Qf0mxDJrWY9uDXAhd+VMOqHU4yZZcUpvK9?=
 =?Windows-1252?Q?nn+O22ceCJF7Dl4V80+bV+kxjKRx7QKNZz1Kp3W4bWrFP0mAylPmRGaW?=
 =?Windows-1252?Q?UlxF0v6FRw3S5ucbce/bqthSc1XpbTkrr5Clj6iexfle/77Sl/vxj8K1?=
 =?Windows-1252?Q?zV2de6gLHZacDaPnTlOw6cJKAl/i17FakJBZv692G4iR0izPBmgQpCEL?=
 =?Windows-1252?Q?0QKYzRqvQ2thMgLxsIygvXduJONYSraJb1v/8q4EDOYHb+oHf78WpnjZ?=
 =?Windows-1252?Q?iqMTm/+M+lI7taFCbXwYPJe9S3i3BNl/iZ2XFj1Hqu1npuEA1jjGYacc?=
 =?Windows-1252?Q?lakSBuoWkNQBIRVvP7GGihyeYfBQnYujYOLdRiX3m7LLsM5MKM209zD2?=
 =?Windows-1252?Q?DWR8E9WvdMx88BUgs7OiJQNpfAu4LAbobb0zAGbszt078daEPgzEH/19?=
 =?Windows-1252?Q?3k44hytG5F+TpLyncqyL5ezOd7acWklS9xTSPlzCvbD0Qqo6eG5yAAIb?=
 =?Windows-1252?Q?4QjHj8n2ryJxarurJhT3ohFOIzueX46Qm+YaXIfi8vhr0VqUUTI0HVrO?=
 =?Windows-1252?Q?9JtA7Rfn5S15sxPtotVNdKVWMHcYzTWfdpMaFVezoZC0sIKItexrpO4M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9fba98-18ca-423b-61c7-08d93f9f5dfe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 10:26:35.9987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bE9O93zGMUc3f1CDWSCGUobOmrUsAITbkqIs3ZI5/rjRHpIo9h2rJ+aT7NCby+cNYx9k8xl+oTod3qC0jkDb4cx73EEwCF8PD9NuTNid6+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4245
X-OriginatorOrg: citrix.com

On 05/07/2021 08:35, Olaf Hering wrote:
> Am Fri, 2 Jul 2021 20:03:34 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> Fixes: 34990446ca91 ("libxl: don't ignore the return value from xc_cpuid_apply_policy")
> I think it fixes 111c8c33a8a18588f3da3c5dbb7f5c63ddb98ce5 ("x86/cpuid: do not expand max leaves on restore"), 34990446ca91 just revealed the bug?

Urgh... That's what I intended to write here.  I'll fix up.

> Either way, this new variant is what I had tested last week. But with a trailing "u" for the constant. This detail may not make a difference in practice.

The trailing u doesn't matter in this case.  Furthermore, the way min()
is written, the compiler will object if it were to be wrong.

~Andrew

