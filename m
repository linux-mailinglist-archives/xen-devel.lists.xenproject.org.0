Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C00F04C1899
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277672.474462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMuYb-0001QL-Mt; Wed, 23 Feb 2022 16:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277672.474462; Wed, 23 Feb 2022 16:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMuYb-0001OT-IY; Wed, 23 Feb 2022 16:32:01 +0000
Received: by outflank-mailman (input) for mailman id 277672;
 Wed, 23 Feb 2022 16:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMuYZ-0001ON-F4
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:31:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ec7061d-94c6-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 17:31:58 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-kNM6g99mP_aF5sUTHif4QQ-1; Wed, 23 Feb 2022 17:31:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7862.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 16:31:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:31:55 +0000
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
X-Inumbo-ID: 1ec7061d-94c6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645633918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gtwUw8rnXiypn7xfoHzom6f+crNiHCzj+k2uF+Ojhyg=;
	b=Feey89o1Z5vLnfC1Q1Z/5wTD9G/WpiMAI+11ukqPb/j8KdzfGdX0LibeBLL1v4RMi9bAqx
	9+gpbL4wSP1JN9HZF8f//uUeFpkyYd/dllfBav6uUH0TDPOYjm7ln5AbIa5dc1JOXa0eA/
	6epmIzwvrSGMVgzccei4ApTNwEYSbAk=
X-MC-Unique: kNM6g99mP_aF5sUTHif4QQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsdEFtuuUWHdRZ2rRDw9qPEjqhQ1qMA38Rq/A/h/GUZH5CKqOiDQw2//69HKncESFSGqRYyMGQdJ+m4b52qdCaSOEs0DU02WJ5hjimt2NUI2C8aKwLaPZJOWamMR9Vnj1EtkwGeyOXowv4pvuuCdHBK8ALaczDUXgF1AKxZbeY91EftfnWwMl8Jn0/hasEvB0STrUQ1HKWbPEh0MknNJK8G03L8bG76yAG6e1P76jzMMEmXhw3HIRufE69u5u7yu2EnzNnflmjziNJIerQj2rg1vQZJdSHgi40mduAvsB2mKvQgZXFDoZ5Ad7/36lbJyEfgNV8qvwSto64qAhgkuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Tg4BZHzs8/tGsoflF5x3K6sr4inZ33dxpzy5J8Eeyc=;
 b=kuhTAoAIpnDcEdh62qiARK3Qg0RE9EJpD2Zw4Vb3ZadG3sqGhDD/ijEnKE1oC56XGMMAKurVUuckik719tWj8bi6hphJLg73AopQ/xY8tsSCPgv5XrIIOqQXdA9q3WnhyR7HUj1Zhx97GIwUsfH6ElYifju7BwMef+lS2IM0wa+85b41/y84Nt3klv3aN8bCa665uaUR4fdVl6KD6IsLjdiiTWdIdJ/OS8TxQRuKb2HZL4eE3If3Ck3016epbplglrIKyKhn4y0ZPI4K516SM5t5C8r0+YLu7bWw1079BIKwJVsuHEyDWnihO5CPmrrFpUyiAq2eUnZg5S6JRx+7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40942f98-5caf-43b8-5763-81b59a7b800c@suse.com>
Date: Wed, 23 Feb 2022 17:31:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RFC] Avoid dom0/HVM performance penalty from MSR access
 tightening
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alex Olson <this.is.a0lson@gmail.com>
References: <949b4776e23e4607776685a7e2705b9e77f5b717.camel@gmail.com>
 <a1099ae9-9e0d-cf54-e786-835c13f2ba40@citrix.com>
 <d11e54d47776008c17762458e6abbd44ab0beed5.camel@gmail.com>
 <YhZcxkY/BgPy/MTh@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YhZcxkY/BgPy/MTh@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe6bca25-90c3-4bda-3540-08d9f6ea0179
X-MS-TrafficTypeDiagnostic: AS8PR04MB7862:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB78627DC43890682D04F3063EB33C9@AS8PR04MB7862.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L9Qgd2F07wVMcvgM+9y5FYlhSFb+LedRVp7tYzBaraJhbPH35DPbnRlKCTynyTs/9eDGNmwRE2FdnD8YLLvVe/wVYdbZm/xWwafBbIZnjzu4hevzXvcfJT9KhUzWLP9/tnj9lrxRLJY27QF9+LVVrB7eUGKtW2sFJ5j5QMI1gJ/ss8XpHml0YxyjlAW28f7a/A4aBheAdyA1d1S4NAYk+5qOvornYDLycA6bfRuCaQ3dzAcMZyG8ORpveGTW2rC71PNy3sXgxMcnxXqfZtGmXTOqA/k0VswNco2SX1pf4nDIRUqPybNdaqr0V/oN82ipuIC2/NY7UnY7Q0MZjEpbeiitViXiv0TqfNvvb9WYqkJvf99zQI84XIZXVCAuctuDH0uiLmiCwN5pIpA5Vm/Y0EgVbH/yfGop6jZbxELZRQI4/djshrSpxvNQkPTwDgpCyQONZNLDW41ZGbmwslXxoTdh/BI0NA/WRGO0XVzzteWtuBswUePymeBT8Af7SniZskaR7itF2w/NpF4iXWvxFjCu5m8bzLEWW2AH0U+udEX9fjsMskOJ0I8kYHl+GKFJxrQOHvjjmpwlNFc7O2rSO/RX9KypzD47R3GW/y5e7nIHNPX9BW7WEy5LZalXnxTQR1SoNmndaasqbQQDIBZz+IbBceN4isPZ0bjwiLEPKIYkEdqhEPnjaOd1meWLaQNWUAtTMoYR7rz+NEG1y0go+fw4MpFCmzW1zzhG6JCqYPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(508600001)(6916009)(54906003)(2616005)(86362001)(31696002)(6506007)(53546011)(6512007)(31686004)(83380400001)(66556008)(66476007)(8676002)(2906002)(4326008)(6486002)(5660300002)(38100700002)(36756003)(8936002)(66946007)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c4ZXYokAwSSRxtj9ybFY37RjDrBmTs39GdNmRV0G/GfhccjfdBC8fMDsQOGK?=
 =?us-ascii?Q?xeh0T6ZIzx7rEPPHGNJxvYhQwhX2E3LcTjGXp3jMZIPZHPu6KN17FZYLdAVy?=
 =?us-ascii?Q?dgES55bLN0vs8AMZUXIlmieyoMiSHHmreG0oOo8BiC746ZeixCld6+wyFxB+?=
 =?us-ascii?Q?kUf8yPTaj9u3047Jy8WbMNw1gcfiDou2Tajbph+KOLYpVPTjrYFZKGL3ONMV?=
 =?us-ascii?Q?fMHSh32yuYK1932dMxk9GXpw+UqndrkUn8P+gmjMX0rKmGlNGbyfBm9DNONe?=
 =?us-ascii?Q?tPwctxbTkrYo2ES4QsHXAi/MwGMiP1BjDf9686QA8eH9nOfOHmhyrlsfY40T?=
 =?us-ascii?Q?BWHQPIUGxldSdMH+ahohK60OD7UfbaA1i/BiS7dVExRehzstMLTqCKKEDo4M?=
 =?us-ascii?Q?XbmvnKZRhnUCb4YIDQsqXXAUdOO9G3INOb2PiJ2hZr5ibF5Bc9SMurMBRd0G?=
 =?us-ascii?Q?fvEdvX63Nqlw+xSX/hYTmGBZUUZf/gmVPwjWhGtvkIW/26w1AZikPqX7f6+I?=
 =?us-ascii?Q?WFcsdaPhBKcEtyAbLpiIqgqpb7r/WZgNHIjK03NeAiSaQqbAYIA4bCqVqkob?=
 =?us-ascii?Q?xmfVFojA1Lo32LMwUUCAWOptyle9OLTs2uiIBVYl+ks4v8fwyxPkBEkG3R7J?=
 =?us-ascii?Q?q7dxBdERRvu7OXv94RqFr7A+wa8zPw4i/u19eshDylrec31FWuM0bClawkvL?=
 =?us-ascii?Q?eGsxsjZaRf7xog6x6s9NLsrELvduToGUM2NahHvjDlZS16bRJYH/2KgB7mAy?=
 =?us-ascii?Q?ZOvuWk3onTm2Obzd0g0/shLSZI6avZCaOky36bFPIRq/qeRLCNriFiJdYiHg?=
 =?us-ascii?Q?SxqwZJ0FiBvJorNLUGpvfMPejddIYAMR+Q2DOh2wHhHibEYyzGSlk7BLBu39?=
 =?us-ascii?Q?Yi4S7qSNeQICIfRiGBqXqO0d6cLrLhC5t0HbhmKX7wzhdp1cZgVjn19HrJAZ?=
 =?us-ascii?Q?0niTF75P3lUoqAx1wThJEm5EJDpbEsYR2SdN2+QT5R2ozmYkO0WuD4TJbdl3?=
 =?us-ascii?Q?oCOPnRVDhusVcByaVyhlcXsOriSSDbCDFoycNkF55icIaiJ3QU/uaEmoTyIb?=
 =?us-ascii?Q?izFUTM7c+clvY0rvY+40sGigT4777IEHJfzJeUGeJn1TpMyrQQ88kbrOxZKZ?=
 =?us-ascii?Q?owGlFXJFZ+up5MMln02RuFoT/ZA48TNxRs24cghHjwkp/ejMNS/27w01R0gA?=
 =?us-ascii?Q?ER8n/AoxlOncKT2TJ6RMJz9sTEe1kCBGqd/t+7VS19MTITP3Onvp5UEg6o47?=
 =?us-ascii?Q?42VMalVSlfZUHPqsDiwBhkMuU+ULYQ7HOelQlWgKwAevfBo6OIXhAGfMf1cY?=
 =?us-ascii?Q?TVyFnFa3tiwieSgJfLQyh8X77O5I4IyhVXf+vmAl3ajTtA3GqHyrHUN20/ub?=
 =?us-ascii?Q?fbiGmgVgZNvuEL9/BisW29y3G3vJFRCE7It7CDhEhKUIZ0HQbYOPFh74pVAO?=
 =?us-ascii?Q?jOPGNkTQA70b/zS+m7eDnLohEmmTQehYrbJodK81NkScekA9JAN4ScM1NWhu?=
 =?us-ascii?Q?WsxkdCb9kBW3Kgpz6nVoZwqL8aDfLuRqgVxos9TzDquOBe1VC/NZrCox61JC?=
 =?us-ascii?Q?ALYsrfHoPsnDC4swHuidUfasX4zPZDCvzmtXmVI0ymWB7oGiKYKWj6n27xad?=
 =?us-ascii?Q?25dObhRAnbNBA8WaOrHSEiY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6bca25-90c3-4bda-3540-08d9f6ea0179
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:31:55.8542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bz7hhSDWKo5hM3rjOujm3GeajwGqep3csiXGr4aTaSfuJx/fe3O3joQm8gFjzoq3PjGWcLL/0aKdbPLWLgf20g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7862

On 23.02.2022 17:11, Roger Pau Monn=C3=A9 wrote:
> On Wed, Feb 23, 2022 at 09:38:56AM -0600, Alex Olson wrote:
>> 1) For conditions in which MSR registers are writeable from PV guests (s=
uch as
>> dom0),  they should probably be readable well, looks like MSR_IA32_THERM=
_CONTROL
>> is currently one of a small number of "unreadable" but writeable
>> MSRs.  Otherwise seemingly valid read-(check/modify)-write operations wi=
ll
>> behave incorrectly under Xen.
>=20
> So it's one of those MSRs that's only writable when dom0 has it's
> vCPUs pinned. We could allow dom0 to read from it in that case (that's
> an oversight of the MSR handling rework), but it would seem better to
> just remove access to it altogether: it's bogus to allow dom0 to play
> with the MSR in the first place IMO, and it won't really solve issues
> like the one reported here unless dom0 vCPUs =3D=3D pCPUs and all are
> pinned, so that dom0 can fix the MSR in all CPUs.

Dropping this is imo only legitimate if we decide to do away with
"cpufreq=3Ddom0-kernel" and alike. This limited access permission to
certain MSRs was largely if not exclusively to make this extended
Dom0 control work (which as a prereq took pinning Dom0's vCPU-s).

Jan


