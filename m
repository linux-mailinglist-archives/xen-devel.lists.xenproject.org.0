Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58904FD883
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 12:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303603.517974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDsQ-00063c-IR; Tue, 12 Apr 2022 10:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303603.517974; Tue, 12 Apr 2022 10:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDsQ-00060a-FS; Tue, 12 Apr 2022 10:36:02 +0000
Received: by outflank-mailman (input) for mailman id 303603;
 Tue, 12 Apr 2022 10:36:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neDsO-00060B-DZ
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 10:36:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 579d8f5b-ba4c-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 12:35:59 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-3LH67ZJJNuCnf_FstZfXMA-1; Tue, 12 Apr 2022 12:35:58 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PR3PR04MB7449.eurprd04.prod.outlook.com (2603:10a6:102:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 10:35:56 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 10:35:56 +0000
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
X-Inumbo-ID: 579d8f5b-ba4c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649759759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiZw/xKH1YvRWQhrvlS9anyN+AZzc+uATdIDjuIab1E=;
	b=YlIxa1gvRCeXHz0C9XpDUU2MoTGEx8y1eM1b813OopyVhgwUjp7kjucIz/702TEIPaZeD8
	Fxu45WbyFahHaZJknotGOius6iSp56GLz6QP3AkO74z1P52gS6e2V2DKwywxKoPA2GbAhJ
	JsSlH64BYsnMzmFz1347jQ8aqIBcZ8Q=
X-MC-Unique: 3LH67ZJJNuCnf_FstZfXMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luRPLNHCiL8kgv1vAo/TIqVP/djujOpY+mntta9pcLUnHvKH3x+5mWbU4Lcs1JrAiRuQzpAe0o0cUqwtNaPSjujgKcZ7MLcXwy19tLbNmwB5wX9uLzwAx00WHpx+tCqKyvp9Z5OiQduTkaSjNmQ+8r3/UqVCsj4Ex6m+bOgO4MHPLXHLooog9y+3K2uNfXrhdsNSv5QMO5q9jBpDeTFbbwYx5IAALZ+lldzkmxzNgE6pE29cJ4OeM6OVmPFLPckyTgQz5P5ffavXk6DQ6MN4ek5CHBgGflfAG/sNJcYyHU95VFCo6wRQu3Sd04BBy9jiGDsX2oH5O3n5GCeYKm2x5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f71msdOqqBAgXBkZWxPjrJDYt9BvK8zXaPfKjRtojEo=;
 b=WN5p7Z0LHzt3h808LntcdLLZ8lzpQNGsnD5Co0OhMH4/xHOBN33LujOqln4HEA+RnsXlomP9GnIfuBaBlpXfTv1Ymnw97UnBbt0ELH6OZQldXQn3D6Xzsxdt58SiviVVqR8p3Citz+3DOKh9YyzSOBVX9kkLKAwLe6BURa6LocVjCxK5IyAGS1QNRvpLuI0O7F0D/vbsxIjmH+9Y57dN+cK8Zj2oL7DztlzBd4dTqMKSW2z3gGOofmk+X/x3kb7gF0PICH0GyhT/mWqhDWZJqFXXk8jveAfwHqGVeZsCHP0+/4nsushO+4sGijR8bhFbiYWBwyUD5hpdB+D3rm5auA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2294fcf-025f-7688-25ed-4d6ffa1f0a7c@suse.com>
Date: Tue, 12 Apr 2022 12:35:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/8] VT-d: refuse to use IOMMU with reserved CAP.ND value
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <0f7136ae-0b52-431d-f789-4b7d5bbecb25@suse.com>
 <YlVE8ImYfQUPEPxn@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlVE8ImYfQUPEPxn@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0099.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::40) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2db673a3-114a-476d-a9de-08da1c703a08
X-MS-TrafficTypeDiagnostic: PR3PR04MB7449:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB744925CA1E3D2B81440BF371B3ED9@PR3PR04MB7449.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tf3GJpxOcl+LfFpM411iPwnAX2lc5kpXR0nuSDbhfb0veHtX6B213idAYvLNjLH/GDnyIuM2clKwPFVj1zOl0+z6MEJvB/x9bVtATaHr9T6NVt5337qN3Pz+ThdCdV1biKIC5mWPaQNx7ZupzzzDq+3Ws5QwxcumPKJY1hFMvf2/DLnxmU8To3zvTZtRWGMGDkR+HieUZdHknp306UTnuBSVQHEwMDXRFbsZAPlVH0lJDGaXt2/ATo+R9ZtnpG9ME/aUKdeEn+S1be/mdKMuPa5qjwO9mePYggrEmIemWrtkpBZYN3l02fDgrL9TuC1V4FOgM9ZztdrA1gbAWd4BhSWDxSADpKIUkR/Okkap1cwd/Vj+FnVH/B2tsPOY4Ibwm3Q2tPgmEWQYzMQEyohWQ3PrBf9KQ26YswAgYSmbWfSpev+JgNVcVGas4WRu5/nwk3lYOd35PRR9NaWhvu3C/0K5du8YVmAylDqyOjdxgprcfLUmH5vqNv9ECJ6VdGFA8IytOhQiqGR0Xn/7CvM5lDP8/LC72VCaPNx/I0JR/7oBSOqbLSuOkOpcD+Vr0FMcOJwqQxu6897BL4y/GCDSTzfUk6DgaSxXne8+bSX3/AblxOpAb+9UAcYBKZzP3UhKOqhfnFD+eqDjDQHwbV+yF7wzRVlD4AwKOMXL7Hq4pLjtJfIhxAymWLaxXsJB6mDl/nesX0xqeTpcuRQn6TftlY7Sx94rFoUwKjo5dGObwEs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66476007)(66946007)(86362001)(8936002)(2616005)(31696002)(4326008)(4744005)(8676002)(6486002)(5660300002)(508600001)(2906002)(54906003)(36756003)(31686004)(316002)(6916009)(6506007)(53546011)(6512007)(38100700002)(186003)(26005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/2TcfFGsQ4R1DLmm/N2OpA7UgJQahLP6y6vs99zf//K2xc14uiYGaEnWGnf4?=
 =?us-ascii?Q?9u1d9LVqknqO/Q/gWxHQtYPe8RK0aJsMQhC61xYg5xfSBxtOcr5dCuEryPPt?=
 =?us-ascii?Q?nqBNma1Gfc67kV/zWjqlxtH8FdaRcn7/TEVcS6kw/rVh9/FbxxIcjgtwZ8LV?=
 =?us-ascii?Q?iqIFekkdfE+V+aRpcEy40la8g09cEgzZaYSpO5IFcKvZEckncuf8tuiVvSDF?=
 =?us-ascii?Q?hVjIL1umlA4Ri6qGkvl7lNYL5iv3NynTEqEHQsC12vJVpmdhG1H6FmFYU8JQ?=
 =?us-ascii?Q?BqLPGDJyMs8M+1Dawt8wCjTBsCuCZYdb9cOdLh8tgQ+sLiueGVAB68KwvCiR?=
 =?us-ascii?Q?djOgPFVfozZ9d2HSxkX6GZ8pVh1GxUh+r2OHQPXdLX2hjmoU8e6gIN7W4PCM?=
 =?us-ascii?Q?WinVPoDPtjVriWL5xFQGXK8YubtCXCWltyaCH3Hkqpzclcai8P7AJAY+V+oe?=
 =?us-ascii?Q?qUNy2oxZ6mn5G0CNZaiztbn5O5Z5hL0jCBpTV2lSvbCsqs4LSQgh9VrR6nAR?=
 =?us-ascii?Q?jf6GHi+YYzzz0fUeuEgNFdOtsZBnMk/6QcFzOEF/n9UvoZrE2b4gldzXgBrS?=
 =?us-ascii?Q?tA/vyKzein2MNTCbZ1lnYqogT+VWYNTTm959dPVtmzK2N3ZnZD8BejdfP4cO?=
 =?us-ascii?Q?PYSHR/EwLXHAw4IsS/Jex0iPjCC3C5DodD+ARsvC1i8J6pDvFOCUxj1fCSWy?=
 =?us-ascii?Q?d5ifEb0z9omL2pQarjfevS/Ut7+9vZrTBXTlabT+oM6PkSpAModGoWsAXLbx?=
 =?us-ascii?Q?takGf7U4Z7Z3eublOX8QFvFSTjOMsFttr5dmdZGkc1OChd+6U+7vRqXDEAcr?=
 =?us-ascii?Q?IPcyDl3u9ZIl3bu0nIXU8jbzN7ZPFMmxkRvBNdtvlsgFz7aL+6MeuEO88ANV?=
 =?us-ascii?Q?xLRmiQdpsKucItqpKXkRvqg5ZKiPF1lKtbSdQkSThmDHDrqMV3wmnN0bViIO?=
 =?us-ascii?Q?S6gcEIsFeTqajQGHviqHHq4Oba/wokBmfTMHLWGgNTP0SoZcAxdS9d5cX40X?=
 =?us-ascii?Q?q7VD7vObSuehSvT/Clbr2Uob5duCx73ihp8trMNtHNhxjH7voC19Ui0OvSDt?=
 =?us-ascii?Q?euVgPB7P3fzN3LSJaJkhWTyTzspwWfxq79uT3/fAccrf0u5z4tmRVuSWn6QR?=
 =?us-ascii?Q?nmjKYW+v6WgTrFoBIN4Om50nlcII/3UGTLWfWeMU40K6JfcZ631/wkpzOu3f?=
 =?us-ascii?Q?jFAt/f6+w7E1Z9HztDqWPyCOMdqWQaovOb3+XHBuoCidN+1bIpfv4wB0BswG?=
 =?us-ascii?Q?Ei+8NHm68qqKMZ/A7Je8SvTOk/WFb5REoy7M3jfQ6tgVMxBw+N5qwhEw5lCB?=
 =?us-ascii?Q?LfufVxm0CCLX8N1Q+yEh053LwxKNxD1H8XBLWddWaWWResDzVpj1oBqL0qYp?=
 =?us-ascii?Q?D5m4nhRf0Z2BHHhIsd/Ls0mhVEbHrdrjIeKhlt5L6vCWO70IAgmI5+dlYXWa?=
 =?us-ascii?Q?sLP43O5jevJLuGbsLscih5wHrZ4yAGKKwXVAwFpcFEzoit4crJxtWUTCvoq+?=
 =?us-ascii?Q?CZddGHICu3YTUv+QeC3HeUVsBNaIADAQ7C5vaFqfFK5vPY5vC1Zp/fJeBeFN?=
 =?us-ascii?Q?QCFr/HCB5ZpFSFoRa0OkyEhV5SYLLEOMVT4aD9aNmoPwtbAcSlMfWLaskxNT?=
 =?us-ascii?Q?yZZrB5Xjgays9DGh4oRRKY75zr9WoNrOMKYRwulY2HfNHmmeBq8TWOpw+nzQ?=
 =?us-ascii?Q?qFHqWDb7tQ+jZ1hD/8xprsQTwQfTw+rsXJtfkAZ3wAiVEzn3vYax8VWONDvJ?=
 =?us-ascii?Q?4lzKcMxK0Q=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db673a3-114a-476d-a9de-08da1c703a08
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 10:35:56.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHYdLb20yglIWhmAqZJ+l5oMpw6wCQJsX8tJxwATpr0ZEvTQyeWXCbE21fqPt6GQK6jLvCMW2FS0cNDjCFHp+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7449

On 12.04.2022 11:22, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 11, 2022 at 11:37:28AM +0200, Jan Beulich wrote:
>> The field taking the value 7 (resulting in 18-bit DIDs when using the
>> calculation in cap_ndoms(), when the DID fields are only 16 bits wide)
>> is reserved. Instead of misbehaving in case we would encounter such an
>> IOMMU, refuse to use it.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> I would maybe prefer to get more specific error message rather than
> "IOMMU: unsupported" and a dump of the iommu registers.

Perhaps, but this extends to other properties being checked as well then,
I would say, and hence may want to be the subject of yet another patch.

Jan


