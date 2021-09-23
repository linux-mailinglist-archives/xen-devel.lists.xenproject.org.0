Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC94415CD0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193778.345193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMt8-0005h1-Fd; Thu, 23 Sep 2021 11:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193778.345193; Thu, 23 Sep 2021 11:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMt8-0005f0-CM; Thu, 23 Sep 2021 11:27:38 +0000
Received: by outflank-mailman (input) for mailman id 193778;
 Thu, 23 Sep 2021 11:27:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTMt6-0005eo-W3
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:27:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b49c7b7-5fb2-4eba-bbae-fad3dcc29654;
 Thu, 23 Sep 2021 11:27:36 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-4jEBeSl3Ot2NMScZYB6Qmg-1; Thu, 23 Sep 2021 13:27:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 11:27:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 11:27:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0045.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Thu, 23 Sep 2021 11:27:31 +0000
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
X-Inumbo-ID: 3b49c7b7-5fb2-4eba-bbae-fad3dcc29654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632396455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLv34NzNfECH3TDbVe8AtqUakpYCaTSoad0Jnx87XMg=;
	b=bFZBT4Thg8OKDm7IGMgG8rOKe1sp9uzKOo8Q/P0IdTuqu7utXGZQTvUTwgsLNjZ9BS/cmN
	iiajJszbtLIj85dfdretJE6RLrFybRdWs4cHwHSdDIpzxOkaIRyE8y3wlfj17SldiLtBfP
	ju2Qbu0AOA0JrLmmYvG/AeCQgVCnz5I=
X-MC-Unique: 4jEBeSl3Ot2NMScZYB6Qmg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFy9sZcAmNbRUznYTTWXyi8z9eaw6BO2giM0KY5J/ROsF9CB0a27Vw02m8N1esVgMaUOXN2WkjSNb6ORfm9yOOz2QdVLQWSRkvSZ7n95exKorU7xRI1r1h42IiqA5EIjIqx6pHIN99ONxqf14yeJx3waPzxdy8+F5aVKRrXAEh+6VQns6D2uaJFIcmEAvCjJEdXUHeRm5IBxIClaaMiNUX7ALBjBOCulrzZ9CnABgioUKqIghjjw1sU2u7VAWR1H3alHY8MerwbFNuFj6FqPRE3KmFIIrgy2wa+z1uXhGRdz1MsHtTH/+f9CPokGp8WD8etGhijZ1evhJtBzvCuo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vykuahmkcVEa45h5O0kikFNVm23Ro8CWi14oldtTsS8=;
 b=cezzSvsFj7POJ8C1jmmOZQ0TgBXCFhgsM6AuxkaynfP5D6Iv+rE0+gMl6AWS9+prk3QdCEV66HERO5UF5tdmM2mGGIWzemPHyLgwzXD4M5ZiLR3OocRln/ERXb/CU1tcXfQmnz1gsQh95WdG0GFJIcoqHBv/5J3WsvVdNebPAtGE5AVgvBvP2gDxVDGuT2WgR6Pjz7To3KGy3Rrsj1u9pmhEfS0kiOqQ1KawOpeZ7FUKP05P6ldilkYKxuZICwxEZQeBbrq9qPb/e0g5YgwfwsNKl71lJALyGmv82w5tqVMjBxNP22mFaq3XAYjMSZyjsovYamb41MJQn+biObpIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 8/9] x86/HVM: skip offline vCPU-s when dumping
 VMCBs/VMCSes
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian
 <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <5cc8f7e0-399e-f6a5-bc84-823a6160a3f1@suse.com>
 <YUw5babRHdk6Jh8E@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1c14b85-e65a-d563-bf51-0cb4483fde0b@suse.com>
Date: Thu, 23 Sep 2021 13:27:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUw5babRHdk6Jh8E@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P189CA0045.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a87c4f8d-212a-4cf8-f883-08d97e852230
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686330F9342F88998969E335B3A39@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dWC+aMNsGxZqdWPN8IfToqBtvR+uwaPmw1kYu/ncal8nHuKJ5yaQnXyPU207tkXTaWBGeL3GJIuMNxahwR+rO+976tiS6rA0r0sNJgjktT+mMEcpAPzO0xwtg1P2pTiUZq59xw2xHX5GJuOKbKmcVNj6OM+eW1xqOXBlROtALHOkWKA6Jfbp0vzuwEZBJWlPo3CKy2TgNgvmMj/wai37x81Q7mwSAlNOLrQk+qCHufLjxyHvcTGHWv0lFm5r1asLZa1lGaRAJtD+nGJvaCcHNBjN/8az+rgt/4zflH/7/zJpi8Iu2W9bGEWPdz2kAoQj/GedHYjhOXlr6fdBInXsinoSoIrly63HS6cHQ8Z2bGlJb7VU2aX40XPa4VZ7WcuRjgccuYOCKtLwR0VFnC9SBMnd+V6UuxVbvVMzpWg7jReNgxCB1wd1lsvimsRWYu/G3RTTloepU9bAsGU6icxR6oZWQAoRywOlCfMnozgAhSAMC1bPtcXUDak2rsMelxrydqbXUlaUquWCogzWdKJyAM+YoqRcKtljhbvBjkSbXsNcs6TR2OLOraQeZVsfNiHFt++5i5mOAtZtoedI9a7u+r5ZGxX0eQf5JD5rgUarLDqrlcA/xAMOa8d2Y2RF3+L/c/sZlxPi3+daEyo15FQVNxjUYnftFQF4UbmTlYRrWLhoLAKoZnySiQPvU7FeiBUKqPWOMsZO78GeqJptkZFkBgFKybNQ8H8nt41Lr5LX3HE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(53546011)(54906003)(31686004)(6486002)(36756003)(4744005)(66946007)(66556008)(26005)(66476007)(2616005)(6916009)(16576012)(956004)(8676002)(86362001)(508600001)(316002)(5660300002)(4326008)(2906002)(8936002)(186003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cT7cHv6MWIIrhTUMAo3/Sa0bta/ECUDr6XZImG7YPKNHJwjzusni5WRELQs4?=
 =?us-ascii?Q?zehmPmBLpDpJCb3eO01t3BPC262Bay+wlXvzNXzyc1ZVzZCGw9oWY1P9IwCZ?=
 =?us-ascii?Q?iDXnPQDIuqtnSvPdsVrCHmOafefg//kLmlIrHpiCcRZciAsA2KIOLN8BdRFk?=
 =?us-ascii?Q?ryFWDfFwxaAH6dVXfdtjne8bkC3rfpu9cWwwytXBSEm75QYvKRAI/OQSg7Nn?=
 =?us-ascii?Q?nW9m0UdxTE2hpKbuckX6Pp6jo9NKa1NnJKGc0c93zjCtRknPDvHAGHz8Nv+y?=
 =?us-ascii?Q?EDbQP1gH5Iq+QX2B+vP/dvvwD1VpRawpFWHIKodA0Pqag3JGdLozjO8wNM8x?=
 =?us-ascii?Q?5kJLkpFiHNyGRe1Rz9ZxSkj3X4ShIpu6pp6GHhGueN31c08dj+h8rU1+9Zcq?=
 =?us-ascii?Q?PP/ynsSPyFWNw/6WmNn9mHbnxGj4pscn6zmK0mSkEo6YKuuhunQbDMcZ7aaZ?=
 =?us-ascii?Q?y2XlWGLWSkbC53V1Zz97pgSXi26CKazqUjK8xwfH458LzBr1IWLNqp6ZTs90?=
 =?us-ascii?Q?53DKWZQUSGfv6+gFzb6PRIAJQfCO+Okt2VZqarK+fxZFLvHSLJScTf6Ha/rU?=
 =?us-ascii?Q?j91seKI23akTPK1H4tjf7dhMlqRY4SWmgdt2Ih+M4C2WaTCxMiav/S+dQf7y?=
 =?us-ascii?Q?InkigFRs14zY5wpUUQZFjxVFx8svfYB3YXAdMXkX1vj00sAHZPm/nMDvDmjn?=
 =?us-ascii?Q?1jKYGDIvPGeRfeXI85HXqUhttx7I/e7KD/87pSriKOSWPGjfWgQC8Wy3K+Lx?=
 =?us-ascii?Q?G+yzFYa1B1OaL7HeWyXEYAgEIQtbAzjcf2Zp3Xn86ARLSUEKcB3oCDEoFxyn?=
 =?us-ascii?Q?0l78mqabaVnkonLxwcUFmreQnbGSJgkZnHiLUNtinJ+LS3iVl+siMjHi7M3q?=
 =?us-ascii?Q?9Ywoqczvx2f9M9Bchhyq6Kl/Fy0sZHgQzgRS7lJgg8OKMqlYadrw8JRZjBuR?=
 =?us-ascii?Q?Jcrw2mamAAcGEWpjZREtEeA3o07S+qA93L4iUJculTUkVHooqEN74V50uVaS?=
 =?us-ascii?Q?LTTtnlV1ONVI/gCeR1siDCGsYmWszNrznRJSenoImWgNxY8C/7vH1+tE5nKd?=
 =?us-ascii?Q?Z+NKxta6yTc50EVzZR4GCTJstem1QCNm1PwanC06IpXsvBViQrFMHVwOP/8J?=
 =?us-ascii?Q?GZfCPDg4LXdrS+63tf2iDITmsnNfLLLttvJlQvJMduPjM97FS2aqYB4J+OF0?=
 =?us-ascii?Q?Rnhahq0xeFT+avsFNG624vhNMd0VwXCoMMtFN+N86NCCpRfTbH/ueHFTuiXC?=
 =?us-ascii?Q?Ce5daLPKb7vWbbxSpd/RDGuVy+guRqtEH74PK6p50lmcmIopdd6QfaqbFkfB?=
 =?us-ascii?Q?GAmGHu64JoB0Jv52hXQNevhA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87c4f8d-212a-4cf8-f883-08d97e852230
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:27:31.9740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTVDXPmWZJgmFAnhwQJgChin/QolX3NlKTOJVGrmV2PJmfh0gJAcraUjCtHgP7BgVxHPBGJCHYOM2CbNXko0rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 23.09.2021 10:23, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 21, 2021 at 09:20:32AM +0200, Jan Beulich wrote:
>> There's not really any register state associated with offline vCPU-s, so
>> avoid spamming the log with largely useless information while still
>> leaving an indication of the fact.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> Is the state cleared when the vCPU is brought down? Or else it might
> be interesting to print such state for debug purposes.

Hmm, if that's considered to be potentially useful, then we'd need a
key different from VPF_down. HLT would leave state in place, and the
INIT/SIPI sequence would clobber prior state also only on the 2nd
step. v->is_initialised may be an option, but gets cleared by INIT,
not SIPI. Any other ideas?

Jan


