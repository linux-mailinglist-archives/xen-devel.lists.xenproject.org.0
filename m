Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5BF452B99
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 08:34:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226158.390747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmsyS-00081l-Oe; Tue, 16 Nov 2021 07:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226158.390747; Tue, 16 Nov 2021 07:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmsyS-0007zO-Li; Tue, 16 Nov 2021 07:33:48 +0000
Received: by outflank-mailman (input) for mailman id 226158;
 Tue, 16 Nov 2021 07:33:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmsyS-0007zG-1i
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 07:33:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8888718c-46af-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 08:33:46 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-02aJUhdYMKaho8R9Mkz08Q-1;
 Tue, 16 Nov 2021 08:33:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2701.eurprd04.prod.outlook.com (2603:10a6:800:af::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 16 Nov
 2021 07:33:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 07:33:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0063.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Tue, 16 Nov 2021 07:33:42 +0000
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
X-Inumbo-ID: 8888718c-46af-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637048026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPA1jGhHeFEZlO5N9ugVpojQy4fMwYOuuXv84sG7Gu8=;
	b=Gl00Dd5ZIe5OMXN6fmCBRzhqqWTaea8xv0MJ2hX9uNLMQy5GJkA1E21K0yzXFIPI1r2pnA
	IPsym3s+cm28iqdGpUG4wvp0bob4AlcTIBUwqRE/vyNu1DNEk0CiNp0DoNX0IU0mhEdlgt
	Vit62ttAcp+cG+ZZYgbOF4WPf+PPfRI=
X-MC-Unique: 02aJUhdYMKaho8R9Mkz08Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noPavCY5hAqVKhymyeZjNNjTjHKh9f55tTA+TH2TUa7vfo8Qyw7DxWnPGBevQMG3jV6mDdRe6kRoGaELhdDlyCFZgpwJy5rVDpRERVehyMoId9MZ2QMRDlswS27xnmCNPmVvqzFotts99ZX02ucjgJIgxnrcrSef+a7ig6D9udxR9KAHaCt+DWRjg4OkJInW1yOxWLPyT5fkyzOtsNM7QXhCuwojyUdCG5FUKfKAEcS8jU93h7q1wi+sKLpbqkE33uFEcmiGOrvBiBbJVditrOhERSQi7EFVe+rpFjrPrMTGZXJZ3MWpzzKcpUt/BoWbtPOeqCa1aOQG5Br/akt1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0WOFLme123Z+8DoAJrxNddKPNy2Gl8yWwJFEBzzz6c=;
 b=QGEdXP8EChjdrCYsf1ABrUjW9yCYZzDRmGlc94JGHPhTcaaTrZtPQ8klJmR7OR8zQs8mgtC6WPX0S4eJyPHAQ/lQcl95feABSNl774/rHAg9Uw5QqKOjAn8yAImJGTfjLc+CgYH9ylQKU5VbKWQKuuv7UEQ2sj3fm1mD9Wx/Z2z3hUdgjOMjrQMm/u5ocXW0G+6wnTtsi+jDypZpVavtoiPyApcald554smSD0e/Y308vckzGArVjB3E5Ol0EV8Gmy3szld5Qe6B60CseN5/ujou40EJIn1op4t/Ulleu6kEJM538qupjXepelrTtE/T1qRmGjhQebv2+nqNcaXkTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42136e3f-5b77-3699-39f5-f720ba09174d@suse.com>
Date: Tue, 16 Nov 2021 08:33:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [linux-linus test] 166151: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-166151-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-166151-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0063.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e4cce0c-8883-4db6-ef13-08d9a8d36aaf
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2701:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2701E1902528C07AE4F592EFB3999@VI1PR0402MB2701.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	puvL1T0SVh+AJngDF/vWFN4KAlc3nNdIpARzN2uOH/pruDiXIBiSlDmwpNGxRteO6XKzUZZm9A5SuWdaKaDWYrnSBtm18DoBz9eW6oPFuB3VJkhrT2HjewpYOdfrYW+monkKVZ8W8bnq89NOvSjnUdjojjgfi1Baki4U4HJHt7UrrgjH3pWIpaRsuyMejY33Lm7dwuuwCuoR2LijwgwS9w2BMvHSfHW9j4+T3bT/8oFsWOBs7M5KxqWoIOfC+i5CR302dCC4w3V1UI+H9tcru2QxRZLcdr+zweBLEduEJfl4WJIlCv7CKuwbsTcWMSwnbNhIqlbJbAZBGeQ0rYC7uZJSEnd3ckHNLiEi7GO2hYyqa8Mf0YtT/YbzrB2Mo2z6Sbrd96av2E6IY9QHq0XY4J7h798AT33o14TIre22zolyyvqtGU5gDBuiU1yfSuikuvgaJX/geBxtIGk7S+/2SP8P3JVYcTRVDUa7se4XOk7mOtnfMazQfVwfbuN+5fJScGo6GQ0Zj6jsgfyrfM08dH37PqRkniicrAn8xU2Bie0vP5cLFrPksqztxDEBeOj2e/v1qMIwKUxVFk/l3lPOcFa7LMeDHGh8xSPXoTA2QiBMphIOHBF5qZQw0SeO1oUM5nGM/6CaE+wEAPLeyz0b/0Gx5p7E7agHJ4Wg0lD8EPQRtLD08pnfeqxMmAKYzG8GsaDZbs0DJUeczsxF2HM69MpRuGX0XsaJa/hvZ9PQuKjJ8zZLIXtG7RJzi5idLLl9Fefob4L3ZndeET+zvjKGphLcMm9gwzbwVWz2AKbR7qFJOYqr2bcUIIsGmcQCo5y93EdqP23VaEKs6UwQTPVRhA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(966005)(83380400001)(86362001)(38100700002)(8676002)(36756003)(186003)(6486002)(26005)(8936002)(956004)(5660300002)(53546011)(31686004)(2616005)(66476007)(66946007)(66556008)(508600001)(2906002)(31696002)(16576012)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hVmZAdJIgzYGe7x1dCTz/3HIB/N9qUy8Io3VHLNKlH2O6RcSM9urDelSH/8P?=
 =?us-ascii?Q?n+QqeVrkC1OxXYq/JOFatzgR9IjJqkmVe9NhjeRxXGbVwKrsFJSpcH+CaoQH?=
 =?us-ascii?Q?GkdYD9bZ/XUlYGe/q7bCZbEDIlDos/IKc2QZc+hYNE0bXBMGWsiEsVZbD85p?=
 =?us-ascii?Q?zPbLOPG41D40u1SYUB5Sdrg7p0PPq02+dBN0g8HP55y4Z90U/u4R6GA0gqpQ?=
 =?us-ascii?Q?FqMuVj3grBjJv799O4fQrWduIITGjq9Dzap2wFCGVTXJ8MP9jC00AA3hUwY9?=
 =?us-ascii?Q?krGl5RZQ3R73jYrf5AGfFLaukGTB/+oNgi1Agu9+gYWilUTa4mf9Y0jrGtKa?=
 =?us-ascii?Q?nYr29sYsEXUqvKSQjur2RgW8/jVzHFlLgY9sA+wFIIlFIHhDlUTplsrM59Hh?=
 =?us-ascii?Q?x9AhBpVzQS5ncuOFzUiMQ0KcHTG+hrJWEXkw41aChyV9nkH59T9R2K+f7YpK?=
 =?us-ascii?Q?5PXOMcPxIxjkjtFeZ9lChhl2kWGvjgIU7+4rgkXqhfhLJjt3Y5+m64d0TM5G?=
 =?us-ascii?Q?59A+EfW1W9EfTfqRvdh8U6uSd8qjMkpz/B71tA1Dbgn4ilS2mJhv4QalWUkI?=
 =?us-ascii?Q?jcCIk2LjZCqQ9hrmVQRsa6z1BEWmAalP12PuT8IQeL8e+dKYPdLPKJZMyqXh?=
 =?us-ascii?Q?4bEbALsewagReWShYplG1zQImWFp4AQ66udHDVqn/iybAi69V70xYDYfTkmK?=
 =?us-ascii?Q?u4tK4ftW2FcZo5JKLh4zO6rc+UhmUdX5PUmSCN/R8njqNjgSClGwa9iJ6ESE?=
 =?us-ascii?Q?IjwsZlJKKdUGsIrHPoT8+JLS/vg19xxPrWWlKVxRH78C7B9tAZ7KviJ/gfNu?=
 =?us-ascii?Q?OLfey2V1YvQ25XnghqSxRg+cpILmLfo4maIcaKpETv8Bg27JJkHOa9I1tLih?=
 =?us-ascii?Q?4mVmz9GPx5x4S6phH65HCHdxNpal3zAXV4Q6lz2NQaDKH836OdQtTSEix1vM?=
 =?us-ascii?Q?TvbohUrBs5JoWzgNqFZrKVBcn16/qpc0D9bUcuiV4Z16vGjPxu+GkMc8ltGz?=
 =?us-ascii?Q?CsrvEHqQgdS47knWweQNZiGjt2MB64xMZoyIQEi2SI9BsV4i3F9Ash5cALFC?=
 =?us-ascii?Q?qjREZWnyPnpxsaLDoMRoRNlnyf2Nd4FsDKaHrOyNfebgfIDbdqbRr3vxfXqY?=
 =?us-ascii?Q?AEIJ4WSQMZHf6XDlO1gOf8XrWPbNkfPnitwXaMBzev5xraQJFJjSkEtekM1C?=
 =?us-ascii?Q?+rEIDLSHyJIY75UHEsG+6enorpz7FzkhzilPJczjn+8FoZiPNQ4wu+MYgC2V?=
 =?us-ascii?Q?OSo3UVFFNAm54n6tJAsf4vNOnYWf2WdRjE2IthFTqdKJ+oeD77+ROMkBIEp+?=
 =?us-ascii?Q?Xgy8/e1/4Wj+/iqQF6ChZY2Qn8FRLCOYL5/Ii30Q/+qDv9UovJ7yg5tfzDz1?=
 =?us-ascii?Q?jrwok9tKmvIG17pTaJENQ4FaeU5ru/sVt2LmDc+mmmnhwmT4lxfyG3Gn6wy7?=
 =?us-ascii?Q?0PD2GrfvMMB+loYh3PHo85OwCvrw4gVjx1A5GEYBb1uA+9TwICm81fPEbBZh?=
 =?us-ascii?Q?z0qJoc06ou7tpaBgfn6sETS3T9rmaH0h1UVMmsyAys7IZS7u9iUhR52Kr8+Y?=
 =?us-ascii?Q?r2LKhDI6txgp+xfqCi9bcPW4P6QHKNuKndAKgpsBv/Lq5m9FDkWoSKfLi8Vz?=
 =?us-ascii?Q?cQF49PrRIIWnhDa4+2fBC0Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4cce0c-8883-4db6-ef13-08d9a8d36aaf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:33:43.1846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxT9R0E0DDtXTUyVx90dE98QhyDeWX+vT9kuF2suKCvlTmxnLShvfT51wonhwsEYyiXOsqLRD5ldWBLPiA0uCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2701

On 16.11.2021 05:42, osstest service owner wrote:
> flight 166151 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/166151/
>=20
> Regressions :-(
>=20
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-i386-pvops              6 kernel-build             fail REGR. vs. =
165976

I'm puzzled by this in two ways: First that this is being done at all,
when 32-bit PV Xen support has gone away several releases back. If the
purpose is to cover PVH and/or HVM, then I guess the test name has
become misleading.

And second that this fails on a KVM related build error:

arch/x86/kvm/x86.c: In function =C3=A2=E2=82=AC=CB=9Cvcpu_enter_guest=C3=A2=
=E2=82=AC=E2=84=A2:
arch/x86/kvm/x86.c:9948:1: error: unsupported size for integer register
 }
 ^
make[2]: *** [scripts/Makefile.build:287: arch/x86/kvm/x86.o] Error 1
make[2]: *** Waiting for unfinished jobs....

To limit the risk of unrelated build breakage, wouldn't it make sense
to keep off Kconfig settings which aren't really of interest?

>  test-armhf-armhf-xl-cubietruck  8 xen-boot               fail REGR. vs. =
165976
>  test-armhf-armhf-xl-vhd       8 xen-boot                 fail REGR. vs. =
165976
>  test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. =
165976
>  test-armhf-armhf-xl-multivcpu  8 xen-boot                fail REGR. vs. =
165976
>  test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. =
165976
>  test-armhf-armhf-examine      8 reboot                   fail REGR. vs. =
165976
>  test-armhf-armhf-libvirt-qcow2  8 xen-boot               fail REGR. vs. =
165976
>  test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. =
165976
>  test-armhf-armhf-libvirt-raw  8 xen-boot                 fail REGR. vs. =
165976
>  test-armhf-armhf-xl-credit2   8 xen-boot                 fail REGR. vs. =
165976

For these I assume Arm folks are aware and will look into the cause.
At a first glance it seems to be the NIC driver which is unhappy.

Jan


