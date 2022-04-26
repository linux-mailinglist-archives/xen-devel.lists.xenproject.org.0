Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAC351000D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:09:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313921.531722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njLsq-0003al-30; Tue, 26 Apr 2022 14:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313921.531722; Tue, 26 Apr 2022 14:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njLsp-0003Y9-W5; Tue, 26 Apr 2022 14:09:39 +0000
Received: by outflank-mailman (input) for mailman id 313921;
 Tue, 26 Apr 2022 14:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njLso-0003Y3-Lo
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:09:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 815c46d9-c56a-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 16:09:37 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-FAObKtcmNI-3OMbYHTUfIg-1; Tue, 26 Apr 2022 16:09:34 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4030.eurprd04.prod.outlook.com (2603:10a6:803:49::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 14:09:32 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 14:09:32 +0000
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
X-Inumbo-ID: 815c46d9-c56a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650982176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJ7xTwVcN92bkCRasKR6rQANUiBONI7e6u3lc9vkCPo=;
	b=IMrTyg75+4ie/GgNqW/0KGGq4fD6c3eWby1lu1hd8qReeXFno7TZNiqLd5nhYtiC/I8I25
	z7D3l+wzyfqF134mIvlVOkT3aUAsrFuqQBEUKBtkjhddxrzie+ZDlAn93uUgGeFsiAiGmq
	rI4/fy/h2Lb1FJOpfst7I3thyoofMwc=
X-MC-Unique: FAObKtcmNI-3OMbYHTUfIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdtoVV1OPryTj10MBJkFvE1BKa97UBPLtXUo1++gOeo5DRqD7H72nAkeaSNU7nrChuJ7Czd781sCZ1sFfwU0wCvlYHYRexfycw9UICKDG5cOzpUa8uOOwLP1vWSH2uyi9D+ONMY+cvwq06a8W5fxGBpZnk1tpw6QjrvLgdny3jBKZV4YoGechiOimjGIYNQgPBp/Tz7o3HZCNtTKTOigyQukKaR4Htd8d2jLGxpklwTa17UW38qMrXJkBmUMKqlXDjNz+itsujZlaoIwe4Slo7LyUEbjqEzXjsBzO3AZZpdzLTDu1i92FPqaIUsROWitdEDOfjFMX8eARKihfOS4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO5po+E7MPCUDJzb1BT7deuy5c5ILJTTSeQUEc/P2Ag=;
 b=FnPZl2RT0/FwQpjv+pS8x+S6nYJT9hYcm2+xXRiPVLQ9Y6mygKunUuzBARVQ4L1bpPBctwMBNYvxTsvxF1eGSEJ01A1MlLmUWhXaz6x6z1pc9OAxkV7LHdJCBFkgWlPNh6KK1zyFpvh1IH4WoUH4gXHzlMjRAouSl0Y2C5gOkI64M5eAHBT7s2q2qgyrx3tmaepzJgabjdOfIUcd8iXMZGdiL9I9vZI26itr0jEN5bs3yf0sDDJH2dAXAynF3ZU1V/begzxOAbF1Z7PkwDfj6m/p+LbqDYm58PuYYh3J6UE26XMohl9hA7cTwFueFlcMkJofiHZHkgEEzngW6ebVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07281533-7967-bf67-d68c-3ce1bd5de157@suse.com>
Date: Tue, 26 Apr 2022 16:09:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH RFC] EFI: strip xen.efi when putting it on the EFI
 partition
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <394c1b94-beaf-bdcb-c333-65dd9987be54@suse.com>
 <DFF300CA-944E-47D9-9674-6858790D45C2@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DFF300CA-944E-47D9-9674-6858790D45C2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0112.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c2139a7-2b39-476f-82d1-08da278e62f8
X-MS-TrafficTypeDiagnostic: VI1PR04MB4030:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB40302AAD09A9F82470F8E7BEB3FB9@VI1PR04MB4030.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XVqcD+EN/YcVrEax8XuMzaTyH4fJ23w+Rk1bxQtZjF9nM8w/PAUtB+l6IAic0iZe+4C3s4gM3ikzcmF1zsGvmYhKVJCyFE7ZI6yFeQg3AnYikG1rTG5+mCPgGtfP+rSd7PUm2pXPs81X5GjkkWAU64A3bZJOvaLJQc/6AKRf5nV34Y4dfU0nZH7/TS8my+TKl7OGROB8P1KLN3v8bvSKjHNnC96E1NMsPcHdFwcNMtlDxVM1KS9KvDb+MJFEgNVro57iXm+dZsuqslf5FItMOQmeMS5QHeuIA7VCPbtMf1sONJ8IaduhmBzbSc7j38+Ua59TcaRTUmOHrQxRlSaS/ys7dEW1qPgs7P8I82pv4fk/0OOuI16hGtGEu/vpSqfqPIS9za9fGZihgExR2oHFZj7EQ+syrT7qFOHTqd2f7yFIjWdr9Fk6qjk907eMWceUh6E9GHatmzCQfVWJwxf9RNo/jx8yTNZKBrQjzrFdUw/3BE7FULK4xvtNmRiy+H2w0BYmuPrrohDa/FC8UAv6QXY9FrE7FIP3OPouaW8zldFk6K9wUuBP4uu74ghY6i1FJVGHK7b/YygN3KuikuX2QaX6vubExtVILn9nU1Fw6OsreeppFoV0Izqcgu39rfpDGNn/yx8ilpdvdfwVoyZJPq6uOOhNEoq0gwP3eg7YNjbVyJFVUyIoYSkTCc596uHBgMdYhV7OcPK42ici8iNjg/UHM/rnlUTQssJWlog7iuE/qePvtK2VuM8cCGTL74dw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(54906003)(508600001)(53546011)(6506007)(83380400001)(6916009)(2906002)(38100700002)(316002)(31686004)(86362001)(66556008)(66946007)(66476007)(4326008)(186003)(8676002)(2616005)(36756003)(5660300002)(8936002)(26005)(6512007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0N6T0AFgtrHn4pNFeEZDhu5iz4qRwlNhM8wgVIm/e/7XXMcrPHgDDmWNxhXl?=
 =?us-ascii?Q?R2FUOZ3usbJ/yWk3XrixV4Pr75dm8Gq2miM2rjLOTjxWPVsIo7gSNGrTLXcu?=
 =?us-ascii?Q?Hjw3+/COm7yjDheWANVWDJBV1BBcwOQBRtp4/gYpvrTGFDHu576nNpN1Vblz?=
 =?us-ascii?Q?OIj8NKCjIDyYliLoqnjdrElQT02phZ5zbMZpkQC8SeRjRQ2VfZ1uN62xOQhk?=
 =?us-ascii?Q?4b0+z76UvDS+BpyGoQiX0+6thYLryAaa3HxMAzBg6jjrQpgmQhjOxZID8Ddo?=
 =?us-ascii?Q?D93Jvjn3wMjn73oEvCAV+bFQcx1llTktfmNzBmWhJvmnDPCYpExuZnzL54Yv?=
 =?us-ascii?Q?0aobEQYCrwW84HYmW8WdNc7zjWgbJCJcOh30B0u6EpghH3jAvpBj1+1HiS7b?=
 =?us-ascii?Q?3G/dQO3l4uFNkQNPThXk/iYS1aLERWO8j0J6KHpIBM7mb7yPzw2udW+Sy3sC?=
 =?us-ascii?Q?4NuGGNX9NsHkp09klSZK5T1YQhLsYxsgCA6B8SAZ9Ay5g2saKrJGSaKICXp3?=
 =?us-ascii?Q?MvKKhI16/Wb8K+luby1ZomoKfhp70Z1DHU9D9RGr0/MXBA+kXMhMeo79odRR?=
 =?us-ascii?Q?P2Yh0mJrMdj0Yo16IZpREUgiSlyd9MIhntA363F1+6DVSLULppohplHfBNiN?=
 =?us-ascii?Q?vzvHJj/8+pojZbYSJWs1YaXqct+KU2zY+eBQOWRk7siaMm8KlYLUJlGI9xzi?=
 =?us-ascii?Q?HCKd129mJDQDdOvgT8raankMLHsi7hjfrHS74Wj+2UJP8llHrE375G9l0wr+?=
 =?us-ascii?Q?qrmjKFsyRmgThr8iLhiY7C9tRaFnDUxHwRaYbPYGQ1pmVftqVWG0tGMFpu90?=
 =?us-ascii?Q?6CCmxNc65E3MgsjnWfRqxUi0zKfsV9aiDGIWEa3CQoUgPxn5HNm82Uas05Hu?=
 =?us-ascii?Q?GiJnARvA54kweSIrGRtV90XFB3zruDdeaYEWiGOGx264I1vRZFfLk/+VGtt+?=
 =?us-ascii?Q?Z6OYKrSOBcSCdfN+ej0Qey8rH5Boi0U7T5z9kzXHm3JnMwnHr922CouRP77r?=
 =?us-ascii?Q?BEbb51ueO86eYoDM5g7168sfGLXQmh8NwxOYZ/xup5Nya1i+QB4ubTH5/2UY?=
 =?us-ascii?Q?frIORF4xOlfOGGYHQ1vWOxfAa4H+C1yrq4HoaIeyJoDq1gctFOaLSkpVy7gb?=
 =?us-ascii?Q?ZvmWkMz4MkqDSoyvBqOmgvgmWnYbTR6g2LMY+B62NHGwb+mKCqhpyppxYVSZ?=
 =?us-ascii?Q?urr4d8H/+xmyVLkeaNLL9LXWq2M0JJRPNn9t/JnVJObIRLoyLCyESvUlnbgp?=
 =?us-ascii?Q?hbRyUC9RmJQAVdG2XgSEqUIZHna/yQwLo5H/c/adjxXVgC3+ERTcjvx9YQb6?=
 =?us-ascii?Q?QCcO4Cyvyjv0jU7Lau0DeIskl5JFB13CZDPV5InzisNC4XToHyqkDcOEBk4J?=
 =?us-ascii?Q?Otfe02YK0zGG3Ckt7OFKJ6OtQbKFGPzECFdOvp+XwPvhlvpfryEO1cnJndfN?=
 =?us-ascii?Q?+ZKD1Gb4qPF3dUXJbgvqj/8F6abuUL3PSZnuP7Voo37gWJo5QVZk9Vedq46t?=
 =?us-ascii?Q?qPD356GUZgzOlibFXQ1hx4HB+Q9hfxRsYV08bM9x/666ITkfJzD6RXr0dqA6?=
 =?us-ascii?Q?MASesOBGrOyEX/HlhpXyv+Mt8DKJ4qyY6jihUrd5Rv9hRIWaSx87HVnWfQWs?=
 =?us-ascii?Q?2j2tMQRNveFITw9ZLGOTZsEqvv550285IBb+iul6p6hSjcK5yQCc0jqXNBH6?=
 =?us-ascii?Q?bhFEHRimkHJ6Tz+5tcubCXZiFYKR8Rd8qkgmHSiOcA4sZfP2tP5wBHZiSN87?=
 =?us-ascii?Q?VCvZ/ijbVQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2139a7-2b39-476f-82d1-08da278e62f8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 14:09:32.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KKPkC7bX9YEVzF17B1uK0MEcjIWkNIdcrIr9UMMQGBBOy/gCTb4IlMIXQbr4BO+kTbsrfViLE/oCPV/0m2Dzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4030

On 26.04.2022 14:26, Bertrand Marquis wrote:
> Hi Jan,
>=20
>> On 25 Apr 2022, at 11:46, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> With debug info retained, xen.efi can be quite large. Unlike for xen.gz
>> there's no intermediate step (mkelf32 there) involved which would strip
>> debug info kind of as a side effect. While the installing of xen.efi on
>> the EFI partition is an optional step (intended to be a courtesy to the
>> developer), adjust it also for the purpose of documenting what distros
>> would be expected to do during boot loader configuration (which is what
>> would normally put xen.efi into the EFI partition).
>>
>> Model the control over stripping after Linux'es module installation,
>> except that the stripped executable is constructed in the build area
>> instead of in the destination location. This is to conserve on space
>> used there - EFI partitions tend to be only a few hundred Mb in size.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: GNU strip 2.38 appears to have issues when acting on a PE binary:
>>     - the new file positions of the sections do not respect the file
>>       alignment specified by the header (a resulting looks to work on
>>       one EFI implementation where I did actually try it, but I don't
>>       think we can rely on that),
>>     - file name symbols are also stripped; while there is a separate
>>       --keep-file-symbols option (which I would have thought to be on
>>       by default anyway), its use makes no difference.
>>     Older GNU strip (observed with 2.35.1) doesn't work at all ("Data
>>     Directory size (1c) exceeds space left in section (8)").
>>
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -461,6 +461,22 @@ endif
>> .PHONY: _build
>> _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>>
>> +# Strip
>> +#
>> +# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped befo=
re it
>> +# is installed. If INSTALL_EFI_STRIP is '1', then the default option
>> +# --strip-debug will be used. Otherwise, INSTALL_EFI_STRIP value will b=
e used
>> +# as the option(s) to the strip command.
>> +ifdef INSTALL_EFI_STRIP
>> +
>> +ifeq ($(INSTALL_EFI_STRIP),1)
>> +efi-strip-opt :=3D --strip-debug
>> +else
>> +efi-strip-opt :=3D $(INSTALL_EFI_STRIP)
>> +endif
>> +
>> +endif
>=20
> This does sound very complex and using combination of ifdef and ifeq on a=
n external variable is not done anywhere else.
>=20
> How about splitting into a variable to turn strip on or off and let the u=
ser override a local variable setting up the strip options if he wants to ?
>=20
> Something like:
>=20
> EFI_STRIP_OPTION ?=3D "=E2=80=94strip-debug"
>=20
> And then just using INSTALL_EFI_STRIP to strip or not during the _install=
 phase=20

This "just using INSTALL_EFI_STRIP" is what we have with the present
version as well, and I'm not really looking forward to have two
separate variable to act upon. It was for this particular reason that
I took Linux'es module installation process as a "template".

> One wanting to use no specific option would have to pass INSTALL_EFI_STRI=
P=3D1 EFI_STRIP_OPTION=3D=E2=80=9C=E2=80=9D for example.

This particular example wouldn't strip anything aiui, and hence would
needlessly touch the binary (and perhaps make changes to it just as a
side effect: For example I'm observing the string table growing, which
I have yet to investigate in binutils).

Jan


