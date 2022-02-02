Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34734A6D7D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263886.456745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFBaW-0007iA-2C; Wed, 02 Feb 2022 09:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263886.456745; Wed, 02 Feb 2022 09:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFBaV-0007fi-VD; Wed, 02 Feb 2022 09:06:03 +0000
Received: by outflank-mailman (input) for mailman id 263886;
 Wed, 02 Feb 2022 09:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFBaU-0007fU-FW
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:06:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 579eb9f9-8407-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 10:06:01 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-NXOM6CnOOXWQpImrHV4kvw-1; Wed, 02 Feb 2022 10:05:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR04MB2996.eurprd04.prod.outlook.com (2603:10a6:206:6::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 09:05:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 09:05:58 +0000
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
X-Inumbo-ID: 579eb9f9-8407-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643792761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bodEIfNAta5lT/azx38LUKokU+eaK1hP+Iy2qPpiy6I=;
	b=CkPdZjtO3YHGUdPLky/o5+UQ1QxkAuTS35Dy7wn9qWVo6PLfil9CjrShyIusMcMRDHSva/
	ASPAOzkLdnQvbYvCN0tnWOHvnSB31KkfEAX7t1ObXsCM2SmsOfAle5EblMoM9npNuqnJie
	VA909qS5/2hDqkWq2Ux+w6ybuHe+5JA=
X-MC-Unique: NXOM6CnOOXWQpImrHV4kvw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKFHTS6vfvY6SuPCd+T3+45mJtftWtG3Bj2OsUx27uaCUPRm4mMv1wpbQX1Bd9jXdm5n9ZEr+iEDEww45HfneqRbqnskBl9hygKF7Gs7bjnFEpwJOB4049nyrnjEP912gw7TrayAfrKQ7CS84bxAbizXXav2vgQekSe9I7QopFGu+om5XaH82GQnqZ50SDYGBF9U5jiCkxn5EI4WJq1BCxTEpwDjIxVrginWJOKcKxcgdHzpPreyVQA4pozSeJ8DPqs83+IzebWp5gN9j/gxu+rST9iEmJ697D1fgAJBVkWa7re1RiumXxDBPab/yEVL7s9s0wvk8mD4wrB2g2yp1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/YBpmxmbKgzLPZLm2sFypR7msJ3r+ccScFC6rDGFVk=;
 b=mfJvDslpIlpn6gTcX6mL4bOEcVBAi7UF5Cl6zAH+mk8qY9mpUGy1mQKeMVqGL6WO5BNHonkmFh29QGrCXGK1/cbFtPJRcHJc9A38ooKQLDSKuO4qGqIX/Wo2zvWpndWatp9VkDbxbxqGEczo1KWiidY7B5YDeP1pW/gbjLX+6Y6NQ8zIkya9w/igP0YnIS3M3j0ETXaLZFomadcnSelsFqpicI/phoL8qJKoKQDUrWRPhgO5g3Y/qs5GqDz+P+hIRQA09MoIIaPqZJ1UYohwJoXxQ5HaYAwb0585tp7FcHozWuz8FHF0pDxISD3KEvbPBQp9vj1yxoiqlA7RCkjkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ed821ac-0a38-3c1a-a28a-c46295c2ffb4@suse.com>
Date: Wed, 2 Feb 2022 10:05:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] vpci: shrink critical section in vpci_{read/write}
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com,
 george.dunlap@citrix.com, paul@xen.org, bertrand.marquis@arm.com,
 rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-4-andr2000@gmail.com> <YfpEiWT0NpYNSAks@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfpEiWT0NpYNSAks@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f5911da-498d-4b0e-f553-08d9e62b39e2
X-MS-TrafficTypeDiagnostic: AM5PR04MB2996:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB29961EE7E47C9A56A9CCECBEB3279@AM5PR04MB2996.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	chjc+xO5wJWekWMoqRMbH0Lik8Ts8BaMp9UkuylYCiF+2/UMfj1x/ALEeupb3XUAD84tEH88pQUlj6cVjWpxGINNlNlWjaoi4Wgrn8pCuMgq/lnxU/9YqtFqIcJ7ADS5Qd2QoGJ7TiCSSt8HzOIhuprIi8VZAU10c90Kamrc9wLaQW3uVVlioQXQWBtbVH4tk3tVaNc/DtwZxaYp2yTecvka/NfAsYG95609kE5151O2ara5lmF3ua4wbHfq2yp4dI46NA1lAav6gKwfPdRFMvnQLLNNROO3V54znuFQCsgZg5hbOhphGKnrriQwe7fXYER8e/RFdFy1VE7rWpj6zzqUWs6vqhaNtXVUcskjWTfKHK9+vGE7chGacmmzPcyRpFYPDOBRWmsvHczhfEfsyKrSjaYjhSinBG/j3gxVF5d0RxWrlh4qJI531Un2Z66D5nrQfMlgVrwPTKgE5IJG1V18U5x07XU6SgmLHQyCcQwKECKBBWvERUp23cMiHBVizQ2YusGM+ExFYJsAGVWIU9me7lpR5t9AJui8H6Zq6ulAvzyLGKSr3ZSNSwwvGe3q6g+URwOEpST5W4NONeMS1yqlRTXEOaUiXPq9b0Iy4FRSdOLOkNSuHYxJNpw2UWQ1sNlJ6s/9hJAfK1fzqdSFCDpQbAeLB4QSAeZjQFSXoI8OwUia03Imb9hPXwuuhxOaeaBGcMtMPiAAXA/qJAo12bIZHZNG2H1YM+9EQLPE+8QDO3IBLlTM0LG+1MmmTQA5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(4326008)(6486002)(86362001)(66946007)(8676002)(66476007)(2616005)(8936002)(110136005)(66556008)(316002)(83380400001)(38100700002)(508600001)(31696002)(7416002)(53546011)(5660300002)(31686004)(2906002)(6666004)(6506007)(36756003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aLm84U0AWxYAAtAihveum6SlxsE7TqPVIH213deXZ5giseKVFkJehPBfB35s?=
 =?us-ascii?Q?2BPT4PEboIPzi8PrSAhAZ+wUzhQuSv8TdcDU2XYCqjjSl/vUhcSEsIWv6UGp?=
 =?us-ascii?Q?iX5GAvfk+YUUImN1K7jLdIMibxskkVCPsuyzGj4Ryyir2pmZJk6WDFF0mavp?=
 =?us-ascii?Q?esWYK9bDsx/zDl1TPh10ImA786HkIhEtVL61mEVsWCkfJDcH/QoeFJ0d3YLF?=
 =?us-ascii?Q?4g5jI5j0YEPBrkDONXBmSXH3xmLjtI8yNNy0vAl1xoM/oumCjrVYy8Vm7bY9?=
 =?us-ascii?Q?BXIrcTuqU2/vTsZKZdjbd44TjZG54Afcj54N142t+f+ym1/qghPVXSLIjxvS?=
 =?us-ascii?Q?p0FXQZTCrgTDuuhWNMSJI6/5ZSPi01dC3o3k8zRwxftSFeIKGzwyQDDfOCTz?=
 =?us-ascii?Q?NDeuLNqH4AOFLhG0STb7lh7GIMKuUYSJec0voJpDxkpudnI5QzgRw5b5i8GK?=
 =?us-ascii?Q?mpaw5BLnl0ptA1IGtnId1ObTjZi2lOXZJCVTKSG0iT1q/8HmonGP++dqNBju?=
 =?us-ascii?Q?RaJK9vKhTyI/sapRghIhVS+DDGMOiWGIklb149O/HiBTPpeA8Z0FgTChQpuT?=
 =?us-ascii?Q?1AhIz8L/0MChNLjmLoyCyZUz6kcJXSM7sBKC9fs3ozzSzdNZS5F5UBxjCZgQ?=
 =?us-ascii?Q?n/ATG2VI+eTNRLw+jlulwWRPWDVNI/Ph1yVf/Mf7eCFg5fMor9LkP6SLtcpg?=
 =?us-ascii?Q?65t/osemnzz/jPol6DkuGN1GE7g9L3UNAl+P7pHB7KvxlWWRoekUiu3ykazF?=
 =?us-ascii?Q?rBcl5rX02GaQLAB1i4o4ePQPg4TlnEvBdR46UD1uWXecT7WQiTmsEjaF5p24?=
 =?us-ascii?Q?nqj3/EdQkZyObXJNGl9S4NFGja/fNJXd5Th5nJW5azBKuPH/7qwZRkfiX2rK?=
 =?us-ascii?Q?fdiwSQqpPt5fOSXqIGknClC9DWOutssFGAg2rplxfp2KyrzATfWRQ2RseY3A?=
 =?us-ascii?Q?9uMdqBuyxOVSlBqudaOl6NHzrZAlckHm+KfKi/oX9gqrSsSkxJr2vswQ8apw?=
 =?us-ascii?Q?q59Ggk/3dE4bK1EszJjKh5TO/vCdL9Y+Z2SR/IhuO4kl8TRd0abALcnkePlk?=
 =?us-ascii?Q?Lzj+j11q7z9lSn4tCFM//vcLIFppt9eYOQRmG1pxD5fgmwMNnjM/j66uu9eG?=
 =?us-ascii?Q?RsqTorPxsa4phdGRvQoUAI6PXjTiG8UBeZ9eVSpwT/vsGaGWUf4N7uCgf6I7?=
 =?us-ascii?Q?8pMj5/9EezjXmzfgXrzCsUW6GKAXHFXe31KMjp/JRzy1AX/vjJvu6E6DNBIb?=
 =?us-ascii?Q?JIDc72/6KV17qxG9fyQ4BRiIQ6URETbP71eY7fWFc+5Etsb0gCXuB7l+pRYf?=
 =?us-ascii?Q?6IWsLdgW2UeHNE5DwOlP8nS+LLeSEfbfc1ATekwdkoYCrF+WUevQ9Hfqg5f9?=
 =?us-ascii?Q?Hrlt7mlHwZXguZSmuDyL7Ksc1WI2wFZrP+7utYkY2yf5wKKrZKk2tZu+VVFu?=
 =?us-ascii?Q?CtXjZ6XpSLfXuko2r1lWmTvIiU5YlAJtTR4bj2UNtvOSRanu0NjimKEbwibF?=
 =?us-ascii?Q?xevqPNbwo5r9IbShPp7k9ZJ8zR58Xhy2qUZ2LvoceuWT/KhevxcAsHwMVzzl?=
 =?us-ascii?Q?8Xyvh61XOzEIoPWBX1xVVUJJFNrT56y1jblCTECeD7n+cX2xBfzZ4iicUq6E?=
 =?us-ascii?Q?79FHvmeOlZIdXNh/VbkvEFA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5911da-498d-4b0e-f553-08d9e62b39e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 09:05:57.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDJrU8tttz6rnlmmkQTqquqJaZ/4UrbwC3lu6W7DuwHXF79uTPcrqQ/YrVKwJuv+lBBezXCHUgQXyyBkBAymHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2996

On 02.02.2022 09:44, Roger Pau Monn=C3=A9 wrote:
> On Tue, Feb 01, 2022 at 06:25:07PM +0200, Oleksandr Andrushchenko wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Oleksandr, can you please clarify authorship here? The rule of thumb is
that From: matches ...

>> Shrink critical section in vpci_{read/write} as racing calls to
>> vpci_{read,write}_hw() shouldn't be a problem. Those are just wrappers
>> around pci_conf_{read,write} functions, and the required locking (in
>> case of using the IO ports) is already taken care in pci_conf_{read,writ=
e}.
>>
>> Please note, that we anyways split 64bit writes into two 32bit ones
>> without taking the lock for the whole duration of the access, so it is
>> possible to see a partially updated state as a result of a 64bit write:
>> the PCI(e) specification don't seem to specify whether the ECAM is allow=
ed
>> to split memory transactions into multiple Configuration Requests and
>> whether those could then interleave with requests from a different CPU.
>>
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com=
>

... the first S-o-b, as these are expected to be in chronological
order.

> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

I'll take your unconstrained ack to indicate that you're also fine
with this going in right away; see my reply to 0/4 as to the earlier
two patches. Please let me know (soonish) if I shouldn't make this
implication, but I shall wait with committing for clarification of
the question further up anyway.

> Would like to make sure whether Jan still have concerns about
> splitting accesses though.

I continue to be a little concerned, but as long as the decision is
taken consciously (and this is recorded in the description), which
clearly is the case now, I have no objections. In the end well
behaved OSes will suitably serialize accesses to config space anyway.

> Also since I'm the maintainer we need a Reviewed-by from someone else.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm not sure this is strictly needed though: I'd generally consider
a 2nd (later) S-o-b as valid stand-in for R-b, at least as long as
the 2nd author doesn't scope-restrict their tag.

One further remark though: The resulting asymmetry of the locking
(covering the "head" hw read but not the "tail" one) looks a little
odd, but I will admit that I don't see a good way to restore symmetry.

Jan


