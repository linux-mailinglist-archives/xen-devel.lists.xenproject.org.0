Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319724660FB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 10:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236431.410127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msioI-0002Ux-Sj; Thu, 02 Dec 2021 09:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236431.410127; Thu, 02 Dec 2021 09:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msioI-0002SN-Ow; Thu, 02 Dec 2021 09:55:26 +0000
Received: by outflank-mailman (input) for mailman id 236431;
 Thu, 02 Dec 2021 09:55:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msioH-0002SH-7q
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 09:55:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f79b299f-5355-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 10:55:23 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-HI3eN7vsO8a_3i7p81hHHQ-1; Thu, 02 Dec 2021 10:55:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 09:55:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 09:55:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0042.eurprd04.prod.outlook.com (2603:10a6:20b:f0::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Thu, 2 Dec 2021 09:55:19 +0000
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
X-Inumbo-ID: f79b299f-5355-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638438923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vHB8ehy+7ikkB/mv8cYbHNKybPgmR1yQA7IgGUjzJ+s=;
	b=ejHxBST9ELDTse0dVilGLEI8JwL59cct7fzI8SIeVd713NGeXsHvrC3jQWehkIOdw2PW0V
	uf0+W34zoyGyyu1FTvFRP+8Fc1xW5gV2fDWWlOdxQ3nLQF0CITamimNQRFQz1cBCqcKRE0
	QzzCUXZ7aZI2CXKEdC1bNSOhQvv1/7M=
X-MC-Unique: HI3eN7vsO8a_3i7p81hHHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTsCB0WPvki4EZhK564qstSSRFzsuvm4cgTHkHVzG1a1ole88iCPHR1O8rzSt71QKbO55Cy1RuqnUkKzBymkpBfmrH2qEjEynTHpPvnH4VIdRlwmLuh3UKEAqHgK6GQ1++WogOTseCWxogBS/fGT71DA88hLkGUVbClPm5KQvsTFQubc50MiiX0+DQ6jB9RZlGggzHteg4y1U/PWFq9qFtUx5L/jJq5CmfVbhok4PKMAx+Vaa+gruwtHSKRvyd8EjUYwHDLIdoeYnBMYMQKMdn1rWcxwoZxUBoF8Xv2jveyw5oZL09HO80hfMZ3sVLkmz9bkvl+Twdx/6c2YgG5lnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qS13c7112W8LQjv6N90bO86hzLmviVvmGeT7WYs0FmI=;
 b=MOEx4HIFd/TQOnKrfn7uGfwt0NUQaCjGJa4azVD3NF6TggiEBfE1lFTYNZzeCGfFGLbpP6xQvI7J6h/Q3pkq0t30/ONOKJC2pcmb62aKHAOeRwkDOPtckyyLtXbhj791tGv4RXfyVhJehKGDxHk+upjBSzGyoQHGBzg4wnws6QrQMw/o9fla6fxwI6aSCFsch5xCJOnQAOv9D4M8xdAWVrDE+9tPTS9BY/yvErpWRClrRcG23YurBboKclG8V7oymtZzGr3e7VSeZivhkBcmk99i4kE6QItfHErKQSdToUe5g5MaIIxMbSY0d3WyDXkNNgLwuuhnnSZppcV4TpWT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de69401c-309e-ed71-ed7b-69842e395adc@suse.com>
Date: Thu, 2 Dec 2021 10:55:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 3/4] x86/altp2m: p2m_altp2m_get_or_propagate() should
 honor present page order
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
 <09aaf19a-b03e-7f41-208e-bfc6bb968049@suse.com>
 <420124f7-634d-8d9d-9cbe-34ed6a66d80f@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <420124f7-634d-8d9d-9cbe-34ed6a66d80f@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0042.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55b31d56-ca3c-43cd-7a1f-08d9b579d9f6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB574314394005EA3AB5AFE186B3699@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+CvC2M1E5vUh2Z+YLC0shDmFRkrwj4lIowv0JlW/IiiGuYcXvu0JTBwTSS+nG7sBDySnOxXoUO8GHtyeRtp3mbayoS7YYEfn7WSc3Rhul7c7l4TO1dzMaWzaZPB7kXM/otoDHBhMHZ4iUZ6T7l7mizMpa99r3ioKFEcF3844wgQgCeAiCtdr9/4JPnm7ip1+vUp0lb/39vajqIlynpsKWeEdBFrOyhsiynSt0etxR3K6l8KoMh/79oOhjNVWULjveMYX7cujDch9YsFB3T518KpebFXNS6oZXjIq/cXMGMpn7Zdf/Y8aCrPrtjxp3rWmFsM46mUDNghYnAPbq83sLhTYxIz7lnVkivnV2Fpt/PkOk0CGrH0plFiNGLCxb3XkGvtNrdu6VqpKw74Fgox1CP1mlDWpmPDDFzKc22LtEG4/SdpsLjgnbpP3pzdnGoWCU46fuTwa1Kn6Q5G7A2orGso03IH2lFsPoVPckiRZt6oG68i8gGAdIM+8haH6nWts84GgfmNpBEhe28+GeLxzie/M6QDNeaxin/6jP2hV8V1V4kgNl0i/AV2qPiwfT7BDdqH7PmUiVodRbjx2+BRXz6dyUeI/1YFmYJmD8hSLS8nO/wlNBTxZJu3ocW49J5K6Xo0OwHuhlGFp/ZpM70b6ePjxv/bRbgUNVIyw5eo6XJzO0ZllASyF+eJWcW81hVLf7vzyfhe788xV+F347CEHSg09oyCQ+HfJNRstoND0o1o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(186003)(508600001)(8936002)(6916009)(66476007)(66556008)(31696002)(38100700002)(66946007)(53546011)(4326008)(6486002)(5660300002)(16576012)(316002)(83380400001)(54906003)(36756003)(8676002)(86362001)(2906002)(956004)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jMfMaWzyisp8ljISJGZHCcxHrdxCHV4G3sUsujzuily4eiOpeM8q2sjivF7x?=
 =?us-ascii?Q?iPf8oMTy0rjNP2j8CE2SFytxXOze4abG9N1sIBDhJEtFyzLKzk2ItMzYPfXX?=
 =?us-ascii?Q?8TEa2/yhV+6/3+bTDPMJa0eD+tOMYicHwpI23OOMwUw9L8ZAwQOsJnNTspdo?=
 =?us-ascii?Q?0cmzOvuvSoAFeS+r1HBZeS2It4/nlhFNdPlyq01Iy6xmPJ8zNUbvic95rbe8?=
 =?us-ascii?Q?QrGWDJskB7D4Q4Fp4udP0ImuOTFB6OfRtDZkBM8yeGfZdbxN10xA1sj219Zr?=
 =?us-ascii?Q?OA0Mmy/h08IbRSeA59ddx1utUBPTAMNn+O4RHczM9e8LSNljCmKkmI+FpQY2?=
 =?us-ascii?Q?Ehc3XDqiHSAHdCDIAy8bKHugmuUShpXciAO9bQEI3AQGPObrA4GGQkNr1vwJ?=
 =?us-ascii?Q?Lh+yc+xLXlPiFG/5Ses86MhsQhAsUHMbyvi2Isjs89GD91AwUN1avxEObAXw?=
 =?us-ascii?Q?B22KWDJU6bJNdyrpoMYFo9UE6l5lp8bkAr+7k0eq/UtjjajJFNsi1EU/LGFW?=
 =?us-ascii?Q?76ZNj1goXTWZ5XevxNhO6sHPxyvoB/4S7kKKlPx7MaU4u6rycS3HURfSFXXb?=
 =?us-ascii?Q?02Gavr9lNFDsn+176HW4TsWnrm0+vZTaZdOz+eKcdSsFYmmXuSWuDryuFtPG?=
 =?us-ascii?Q?K2AFYsWjilAj+jfi2M7WllLyjtRvBOG6FzjbheKGBQIsxI/Tm3eMYBvTXTEk?=
 =?us-ascii?Q?bQ9oUqjE/nfYGWjegqZhqFulfsGtT+fy/XdQdZyZZ0EawJfyOuLvGqkbcISY?=
 =?us-ascii?Q?+9XV2vevnAS53PA/jjkSctxTiErehEK1YF7UlR7nSGPKj4s+ElR+T5WQBoaL?=
 =?us-ascii?Q?xQODjV3L47XSecFIDLCgNe+lXVOydnlArg9bjW9GtwIUPYW4qt7zvF26VE29?=
 =?us-ascii?Q?h85xhDimkQf9Wifz7oJy+CHIyQUKU/Uc6CiKvbDiTkmX/PM9dfGweTCMJXMj?=
 =?us-ascii?Q?/pQfC88t6YO+fMIxqPIy0+M6WRtE0nWX8r0ByLiwp284nrdm2ZUmzQsiw6dN?=
 =?us-ascii?Q?AZoU+xkN9u+pMqxJF+mAeA6Sy6pIbvfs7s1SS/ijMvAWLATH4GqtE6V8VOyp?=
 =?us-ascii?Q?QCWWIF/++C/+ZDKOQ6cfLTnocHLsj8GvecbqTZYwjfBT3lkbmf7SW3zFWBLZ?=
 =?us-ascii?Q?1hVFQCUGZ63T5OaE7S41hQdTi02xUTldkU43qBG2oqqDefZlqI6grWcujE48?=
 =?us-ascii?Q?SIsIFEbUUnS7aazHGmpfsJ8RDt0/N0AM3auZ+Qf8r95GeUe/FQd7ejPs5MHe?=
 =?us-ascii?Q?PfUiS3nFHxllrop8q6kdrbB9JofezRMJWi/eSFQy0kmfM0qdY43LpM5U10ez?=
 =?us-ascii?Q?SVENN5JvO/daioM37hH5AEt96wmqjFsqmG0iruyNE8Mgv2IWQxv2wR5ptz4Z?=
 =?us-ascii?Q?Qf0NXrIh1tcimzwRJLzwe8zg38LRcr0EQdCI8DB8mcwKPJXhTIBI5Kg94Hrf?=
 =?us-ascii?Q?40ce46p5z4Zeh6P9vfbIdOBMxBZRXmaqU1opfnhh9prp4OK4Xk92g9SJFUa8?=
 =?us-ascii?Q?RICBt64oy//eK/cctN233wi7Ol6hZKV0FFCgIOLyJ4kDxAVdYt7RIthey9ji?=
 =?us-ascii?Q?lgZsIFILQFqtaKQTpMQsoso3io+PrjdXAhnyQNcUwHPEJZ9SpB3x/b/QcQPq?=
 =?us-ascii?Q?S906nNO9c/4iw3wdgFdFc88=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b31d56-ca3c-43cd-7a1f-08d9b579d9f6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 09:55:20.4553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUHV8qzfZchG7Daz3Q5Y7t01dXyf9IWUkUqVWbWTcPOwUZR7TAbPTyK9rIDVIlmBb+eL7l/jbAN8CDIWjN3K0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 01.12.2021 13:44, Andrew Cooper wrote:
> On 01/12/2021 10:54, Jan Beulich wrote:
>> @@ -2237,11 +2243,11 @@ bool p2m_altp2m_get_or_propagate(struct
>>       * to the start of the superpage.  NB that we repupose `amfn`
>>       * here.
>>       */
>> -    mask =3D ~((1UL << page_order) - 1);
>> +    mask =3D ~((1UL << cur_order) - 1);
>>      amfn =3D _mfn(mfn_x(*mfn) & mask);
>>      gfn =3D _gfn(gfn_l & mask);
>> =20
>> -    rc =3D p2m_set_entry(ap2m, gfn, amfn, page_order, *p2mt, *p2ma);
>> +    rc =3D p2m_set_entry(ap2m, gfn, amfn, cur_order, *p2mt, *p2ma);
>>      p2m_unlock(ap2m);
>=20
> While I agree with the problem you've identified, this function has some
> very broken return semantics.
>=20
> Logically, it is taking some hostp2m properties for gfn, and replacing
> them with ap2m properties for the same gfn.
>=20
>=20
> It cannot be correct to only update the caller state on the error
> paths.=C2=A0 At a minimum, the
>=20
> =C2=A0=C2=A0=C2=A0 if ( paged )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p2m_mem_paging_populate(currd,=
 _gfn(gfn));
>=20
> path in the success case is wrong when we've adjusted gfn down.

I wonder which of the exit paths you consider to be "error" ones. The
first one returning "false" pretty clearly isn't, for example. And the
path returning "true" is after a p2m_set_entry(), which means (if that
one succeeded) that caller values are now in sync with the P2M and
hence doen't need updating afaics.

And anyway - how does what you say relate to the patch at hand? I don't
think you mean to request that I fix further problems elsewhere, right
here?

Jan


