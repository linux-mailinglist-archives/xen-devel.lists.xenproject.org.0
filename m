Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A2D3BFAAF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 14:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153097.282834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1TVc-000128-I7; Thu, 08 Jul 2021 12:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153097.282834; Thu, 08 Jul 2021 12:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1TVc-0000zY-ET; Thu, 08 Jul 2021 12:52:04 +0000
Received: by outflank-mailman (input) for mailman id 153097;
 Thu, 08 Jul 2021 12:52:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1TVb-0000zS-4G
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 12:52:03 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce103491-a6d6-4733-a750-cd8e4b5f940d;
 Thu, 08 Jul 2021 12:52:01 +0000 (UTC)
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
X-Inumbo-ID: ce103491-a6d6-4733-a750-cd8e4b5f940d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625748721;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6I+al9BNJnxC2CU82cVxmyQEnKESTV/qboQ+l8LAysM=;
  b=ZU78NVFcWQ0gRCR2FjURU3aNUXW8Cpka7Hl8qVl0fmLF++hrzFExyneH
   HDsGAEq8khIGlfHk8pyJi1puekpZl4fNC+pOCQoibKiuW/wlaY21jGOUr
   qms0B7/HObf2FDl2oSa1oM+GrqxohFcG0QkFTf+UsrDxSuguQ1EaylCZL
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zcUNPUOMT7VNHbfjFoyji97OnY5tQW7p3ezGXVPSfpLKYUOyYhQuOtZZdxz0KFJ8OpicrH4cmy
 25lBLkL95TZ4BdBt9nM+v3JJ/xrdAIXUs8rnw6CTPLYZY00825jRwOBgn+pNRocHaqvxbJL+SW
 wbVPDh54d0Ftbf1qp8RQ/BUjnOLV2ZUMiKRD55++5Fcsi9zOc6qJ3/gtB4CsV5pAcs5mMciUF2
 rCKgtV5knrLsl7FfTl0WtqildpQvOR9TgEo5DawVqAh8Yff4w8V4NaIezeUh6GnXuFEOhNa/9N
 E3M=
X-SBRS: 5.1
X-MesageID: 49470813
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:CNAKfKGOg1OUq1ScpLqFBJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HkBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4lgPO
 JbAtJD4b7LfChHZKTBkXCF+r8bqbHtmsDY5pat854ud3APV0gJ1XYJNu/xKDwReOApP+taKH
 PR3Ls9m9L2Ek5nEPhTS0N1E9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87CsIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsDuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59Ss5Vma/paVFZtl/1awKsMe61wWx4SqbpXUd
 WGNfuspsq/KjihHjbkVgAF+q3eYpwxdi32CXTq9PbligS/MRhCvj0lLfck7wM9HaQGOtF5Dt
 T/Q9FVfY51P7grhIJGda08qJiMeyHwqSylChPaHb2gLtBeB07w
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="49470813"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qx14CpCpkIHitHCaWqlZ2GorA4zwrE5SzGUViVb5NKL174c2HEYc9N6uD20FeztSFwu2VC+/NnudjVGF5XHN4U5e8tyXcdz93k3rRT/Rf/pAYN2l716vMwo9Lxn7hVZJfIMVXqN0eOtr7n/92GYwtUOiViVwbYi8PVnzhPspe5lDsjrvPcf11j6vhczh6E5kkY6pLtK4uXtyKQX6Oe5a3IxSVPDG9/s1pCs39XXHeFqAs5llTKBj01+jWVfbMp7WpYoBknyNLjKaW9mzPUhBwN/G9zOWkDoKsMqGguovmIR032m5iq9HRx/okNwUs0K0spDWnDiwLgIumM3KGnlBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I+al9BNJnxC2CU82cVxmyQEnKESTV/qboQ+l8LAysM=;
 b=iqXl/2y7QImThwystxi7EhchNdmaa/baCep3FZJ3gnQNEjpjA1Qd+sHyzNcDlAmvm7GV1j+AuWthHeBwK075Jcgkt4aO1yyWx25J1Q3CAJaX4ks1ytJmH9IRyzeILqiTD97s9zW390rAoyh2w/8PppC9iokfxyW/SOhR07PQPZL90x6+Lyl1LvBGDbWlgEOabPXIYjjR3MrQSA/dR/mi0O0Q4WYAeVD2Wg6u4bqByhR8Ga9I17MlOsrzG/0ghERoeqNVSQ8X/S4x2/tWyFl2Apb2Tz//fYIdH9JYwffomU4+aciT4z3JQbNygE7ZbmO3goxa3jvLRrvTkFxaQTt8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I+al9BNJnxC2CU82cVxmyQEnKESTV/qboQ+l8LAysM=;
 b=GWtkjjP+8dMyDJ3MKnJZogm3TyirVSjNh6O72zVvw9Osx0M+VwBRlTpQEojj7MVew8ROhUYrmBjI3Bi7KI040PbsnKipf82RqhmS3qpRNGCb6374be73UgG15ZqLShD3BtnYfOv8W9xSCDFsCeKmzXMjWpZJ4r1qsYqLpsPjCoE=
To: Olaf Hering <olaf@aepfle.de>
CC: Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
 <20210707164001.894805-3-anthony.perard@citrix.com>
 <e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
 <20210707223551.5462c74e.olaf@aepfle.de>
 <375823a3-8b49-7aab-ca2a-af219234b5e4@citrix.com>
 <20210708023224.6c05ff5b.olaf@aepfle.de>
 <20210708142309.6d093d7e.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
Message-ID: <8878bdd2-fd3e-92c0-624f-cb0ee9deb280@citrix.com>
Date: Thu, 8 Jul 2021 13:51:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708142309.6d093d7e.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18c82440-ce09-414c-6927-08d9420f2aa2
X-MS-TrafficTypeDiagnostic: BY5PR03MB5348:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5348C66E1D21112013150F47BA199@BY5PR03MB5348.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gfWw8pqGiLUuc8cJyx4PtvUotLJYGoQKrHgOdeiFi80q91uUlgK2AFFAOsd6ZXXIGWHjWhFFIw3J2kUodzhdg3C4ZH5r5xbmKt28jQ8lhQexUmZLsasq+4rpmxuY4L+nGUKnUE4rYvXAJ1y2kJ6RDaeCh7Dt4ulOtxFaNJbIFZyymw81EXDi78tuufS6SJ2UGaM3MygyIrj3WDHINH1K7P7xntTAwQxZaqbv4+Ow189R7pQB0kSSD7cVml2wjOU44sw9atZxATNB2YOPL8jxuW7eNCQsaYw2KUuzNukcKZwu0ISzM4wAXs5jzXYMUeeL28LjrLJPjJ7yEq0mC8rblpBzUmLl9tltpRV5IHJg3geDOZXIpks4Ew2dNbCKX27dMHpdKulGEDQEjwU7eaBy1ez7Ty0EVJKFGUL7iriYDhP0YzlkEXMuCZDzNJ1PYoKudiFI+EPv8bNbzIvgLfNnqQTzDAJc0ITCNBn79ZOF6Z2PP/7+QQEmPW5EtmZiosKWYh+u3d+pf40qVa18bUJ0BrvnpjT6cUF0GaBVp0zRELo3xUu3r+5IL9bs2CG5AOOD/KNEbaGmI3xEt2vj0h9g7C4987dL8lfGL59AHBYjlie2jxqBqk+YV/5WhbSVNzVY3Wi3SqNGo70G1PudQJOURQlxcOcraD3FQ3RooLyawd6EQeXRkJeeLOXF9DlVEHcHSQ0nRXRdkxGNT94zyLoYOlkOSXc/uLfZ40fXqLzsYmQyWhIYBadC4Xbv4avVbWwMc6v6g9d5sG0NMMuuXijgDH5UpKAPJufjztVdmScMf6kDfelaWnDtiBPZnCqzl2HO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(186003)(6666004)(8936002)(8676002)(26005)(478600001)(86362001)(36756003)(54906003)(38100700002)(6916009)(53546011)(956004)(2616005)(5660300002)(4326008)(16576012)(316002)(83380400001)(66946007)(2906002)(66476007)(66556008)(31696002)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?4NZJff+oZs3fGgw0ecyx+Z3Emf4BE3qg6qvXARvGUPLPD857VENtGbZg?=
 =?Windows-1252?Q?u1iEMSghiNYiQ7F3wHNYhjYZC4CFXbol8l7jHzZUg9JZoHOrYzgAWvGt?=
 =?Windows-1252?Q?9/yuqAwuQPB96s1BbvFo/WmqKCqG03MZhmyAO19dN74BR/K8lZH0qA1I?=
 =?Windows-1252?Q?VKBljGIg6cKr1+phv2JzWtxDo4HKKWa1KsC7oV3kba1zvCGX9Bvx/hA+?=
 =?Windows-1252?Q?rbMse3lPjMlzy3iVXN47vcS6Nchj//L9g/++BC7NqhGP7T9id7ZNt8rN?=
 =?Windows-1252?Q?/nvIvfB2u6LsCkaa6YxcSrGhbU93dG5nocbvrtxHXPVBWOjoyuajBi6+?=
 =?Windows-1252?Q?eA13WNcpS5oN7Xawn4/UnKvu6lmiLnt+AFzkadDx1mfWYGfaaBPY6f4q?=
 =?Windows-1252?Q?4u4ByPYiu6X+t6E1mqJttuSSzKhGMHE7bKXM5y3/KnIWyDHZXH3muv7R?=
 =?Windows-1252?Q?RpITH4ZI7SvtIdElXZSc4z5HkBwZu//fzQdwlWrrYe7YNhDfNYZM+e41?=
 =?Windows-1252?Q?07ExS9exkTC0b9lssxGe8u9odz4EGqYcLB4dQTROmX0Bz6ruNe5k5twn?=
 =?Windows-1252?Q?cCvZcMakVlsGeCEFdub5w/Grtixqnk8oKU6nW+819EQVcjWWsFl6xrch?=
 =?Windows-1252?Q?8h6zV0pT/ukp7CRHcohjY/7IBqtUOwqWZwkPVVkFrv0IW8gM8SFUUN8A?=
 =?Windows-1252?Q?cCQ3JPu7kCkZ9yhdBQSXYB1wrp4IPBy9ymX3BVmGRthnVv2fJbsoZvlk?=
 =?Windows-1252?Q?bQh6lgQnUWxGA6dNtXiurXm8npFuAJksPWKO8cV7a8rck412fB7L7R0X?=
 =?Windows-1252?Q?IPJDkvbFFUQKx0VyoYSqTY/dtbTKoODLKOIMp9shGOxANsLJO7XTK6/2?=
 =?Windows-1252?Q?Nllj22YS8hIrrQpu0+MXIlY4AbVoYUpffGyp7sJZLYW6BjnGDIt68DEQ?=
 =?Windows-1252?Q?qJWlU1izfQWn16PzccmfbcDvoFzxzI4KlY6U7DH/2gNdonCBPiLj9c3T?=
 =?Windows-1252?Q?BNmSIlhitZxuRzXjxcgmeAsr1fbRN8OwbtDLQqzF+eaTd8STHDW194ra?=
 =?Windows-1252?Q?baVMqrTqQpJrSUSEbfwHPCAoVLorlWW0o0XOAiYO4KOM/Jp2JKgzlnao?=
 =?Windows-1252?Q?kjIeQvqEd1NHjNoYI9aoOMSJbpUW6o8KT8OWtWOOmBLietmpXamXf8Sx?=
 =?Windows-1252?Q?4+loAkcdOuyVSZMVuPBThvHTpbmX1zGmCXaeb/n/bFGUn/svdmNRGc5Z?=
 =?Windows-1252?Q?4b8utmnHJ7Niw+/qMdwzEy/f0vM4IHFxLbuyV4W6Ufict5w3KqDEq+cJ?=
 =?Windows-1252?Q?yyNqF7m2PxWFEpu8R1wCi4OvJ7Qm1WIJA3eMMY9I6zvA5MGEtkc+bO0H?=
 =?Windows-1252?Q?rY6BjwcldpDj7xqx8pPxagDyhN4EAY0na1WI5DHO6RRlh50ZFI+qBDfq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c82440-ce09-414c-6927-08d9420f2aa2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 12:51:55.8124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWyFiflE7+Ui5nGjYDav+4kNtV5DEb2UO+ZmpZeH9X/xMiKctFuzfM0TF/S2vvNvohfY57k3APzaCqBvrykyMw22YRTKEMxbSVc3L8sfqSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5348
X-OriginatorOrg: citrix.com

On 08/07/2021 13:23, Olaf Hering wrote:
> Am Thu, 8 Jul 2021 02:32:24 +0200
> schrieb Olaf Hering <olaf@aepfle.de>:
>
>> At least for Tumbleweed it is useful information.
> CPE_NAME=3D"cpe:/o:opensuse:tumbleweed:20190730"
>
> Two years old for a rolling release.
>
> Is there any documentation how to refresh the used containers? I think fo=
r Tumbleweed this should be done every other week.

Automatically rebuilding the containers is still a task on the CI
working group's todo list.

That said, the tumbleweed containers were rebuilt far more recently than
that, so something is wonky...


In a xen tree, see automation/build/Makefile for details, but tl;dr to
rebuild:

$ make -C automation/build/ tumbleweed

and to push:

$ docker login registry.gitlab.com/xen-project/xen
$ make -C automation/build/ tumbleweed PUSH=3D1

Bear in mind that the final line will update the live CI system.=A0 What I
normally do to test new containers is to give it a test suffix, push to
the live system, and push a branch to xen.git with the container names
edited in automation/gitlab-ci/*.yaml.

~Andrew


