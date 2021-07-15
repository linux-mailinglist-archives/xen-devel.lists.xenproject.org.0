Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CFF3C98C8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 08:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156383.288538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3uoV-0005kE-S5; Thu, 15 Jul 2021 06:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156383.288538; Thu, 15 Jul 2021 06:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3uoV-0005ho-Ow; Thu, 15 Jul 2021 06:25:39 +0000
Received: by outflank-mailman (input) for mailman id 156383;
 Thu, 15 Jul 2021 06:25:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3uoU-0005hi-Oc
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 06:25:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16e3f634-81ec-441d-a040-23501046d133;
 Thu, 15 Jul 2021 06:25:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-99FszrLNOwqS2felOY2h0g-1; Thu, 15 Jul 2021 08:25:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 15 Jul
 2021 06:25:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 06:25:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.10 via Frontend Transport; Thu, 15 Jul 2021 06:25:33 +0000
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
X-Inumbo-ID: 16e3f634-81ec-441d-a040-23501046d133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626330336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+xJirLfAEYwVb9Jsp6bbLi3/OFI2hsr4mfZ7XiAyxo=;
	b=KTSVlYC5xHi8hIDh/3aL1RTQ2gE0vg0sPKleIBkTjK2uCybxBemASfDym7wxiPtVWAfFax
	kfB2UOP95e9/rxjoEBBqdKoui1gtP73znpiZmeLjZFEOaBh6h9G5nuWV3O/eFCQ2d7FA7h
	MEldg/KN3uA+PpE6G2eh9xRnw1NBYwA=
X-MC-Unique: 99FszrLNOwqS2felOY2h0g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yl66lkmxEyEYhB2byNp+O0y6c/faVAdmcJLwDV/cs/9QxWlIviGgvn/bMd93gsLHEPsAfyyyv52d9ASIv0ss8tY9F9CROvDo/8r9TQA5UFql0/bQaRpxqBLpGiBNOa+QWDJBX9lOIY3YRh6NQATcjbG3ijoOfDZezzaQKpD8XiGp7Wpl4WRmOUVEgElWtqLOlqRhelVWLdC2yl1HHLrJAMME9jq65Pnbd9zmRYiQBk9Ahqe/oGVX299QN10zbSCs8GN7/9aM4Qs3mTDd+Gz7jHSnH+um4CMfd5nke2+qrU80ONQHPL13vfpWgWUVdbdFB2Cw2Qf8N9dRI9yI+lYVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9Mtv6ZSKdFakMelHl5mBwSqwqBhBedpI0ODq3Gc5Yk=;
 b=K5o6frgPSTw74W16RxiJCc+magXbWQks7U0/9ypwdFYUHeZ72MvZeVDfW+hmDkaAPRoIoMnnUFCgiQ71KdpZbn32taDxTTCP2LeAsKBApQGlA8QhBGHHzdbOGx2gj62phBUFE5AI+H0D8VGn7XKAlLeUWR1D+XDtA8AZB2FQIXVa6meMm6LjG0s83ZFKcDYsuvj+Hmpu4BWfblDJWy7B+oxOONayYt76t1Q08kO5A/4knIeEYOH1hZsk6zMC+PGsv4oswdtFbDODxAEIlwwVreaWi7WzMlsfuUy8FYP0bI2hLWa9qRpPH3+pQEtZzYpmrk4Ct7OyhO8CTa44/i7RkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210714161734.256246-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be712d94-7fac-fc34-3f61-61819c5cbc42@suse.com>
Date: Thu, 15 Jul 2021 08:25:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210714161734.256246-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b43aec4-1e94-4b90-12ab-08d947595a15
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038B5A341693F5ACFE7F3C9B3129@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ijAPcAs02n26oGVzDCp4zzCVZ4azsWmdydcxmcqfXvfiRkk8LnRn6vwHx1OdNjuN+p6J6td1VYBUDSw3gQJ+d2sM8lM9FKiRcfRJ33ARWShAC0Ri6Li1JeqyC4GabUkvQ1F3EUNqwToGhiDPfrevr7TECG5Y/8CqJLOlpJ6cXupfWugSZKTF30/MwAS0JQv2f7j2IhGYSCHRHVtj7xZSieTmdyYMUP3ealrAQ7AaTfpbmq15KuJ5EPmTBd25s7dN8i3/PGh1akk6uJBx72CLT3TvFJNlhh74hDLCrqtibZ8Hpwwr7Y4iv0jCKIos/7J3CTuT3vXaqoLtij6P67OtMjufCuzEqCITLWkYUj12iLnDi2X5Fk/+i3A9YNUW9lQX2lNsaZarFRxs/RYZpYPOtbcsT8aYN3p+VF7Lr7scy1ucfsfRoX5i3SrZl5xHYGkEq3QtzQsDxZtbRoOWFTk5gmT/h4FjJzsxFNRJv8Y/o7NE9+BwuXlKyCs+bJXH7te5dcG7BgonVrlKbSxLyOPgas9qgtUIKYihHGCLl+BShgt2Eaz4yanyFDePh7kXxYR7BG2aqFDuLe7uIlCyUcM6YRiYTpOr1reP26ps9kg+AsrbjMGmtiiMcayrOVT+Mzl/ADS/d3MqzN2XSQ0ZNifUvQWAU+XeOVuxSelszxi6iQXWkBZkVXgWz82X61vScsKURFJLMaUHl3Wu1pHDCzam7l4yVNSpTB1OTozxZiC+V2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(39850400004)(346002)(376002)(66574015)(26005)(6486002)(186003)(38100700002)(31686004)(16576012)(66556008)(54906003)(4326008)(31696002)(6916009)(36756003)(5660300002)(956004)(2616005)(2906002)(86362001)(53546011)(316002)(8936002)(66476007)(66946007)(8676002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?py2UCMhy/sCJcuOndb8xR3P+F+sDibqXu/DA8W+PnSd+o6PKCF/aZmxK8RrG?=
 =?us-ascii?Q?KSeQ8fbbWlp7hVa7tzYHV1ZKt5tABahMBecKEsxzQInZv+4nZ/RZjFsWZ6+F?=
 =?us-ascii?Q?s2uKqvH4DWfjqA3qEhSuxVYlw0GV2w82LUSvI/iD8KgUqWWUoOHctBRnlIUf?=
 =?us-ascii?Q?ss5Je2+SjQzJubvH6rdnUr9rLaaFc3B9CZJKS9Lb+Ot0uXU2Sw/P3BoTFpKL?=
 =?us-ascii?Q?UHhD8RGfwBqW90yreAn6hYsfpR2QX2aSCHKVEfOu7hNfdClnRv3Kky0b9l1e?=
 =?us-ascii?Q?CRDWyy1XhF0Y5DIAVyaekBjtvTcWAliambPuVyg+zbX7pIEa++YgsqbnzNs2?=
 =?us-ascii?Q?L9UOeYB3EaRBxLKxIVyy/Zp/qjPj0sLiqkHqwIxdvLIZlpiGmrx2EqMT340S?=
 =?us-ascii?Q?dIeDPGaxPtohkJme5TkuNxu1wVcboj1VK7VTkJdbF+VcS79EcdTCV5/qiXnO?=
 =?us-ascii?Q?epApXOPynY9W4zqCr2ODCldq4l1+/F26ZO2t1CYmcz8Eeu6HBn/8qeDzudv8?=
 =?us-ascii?Q?kN9lxJ+LUp6eq4q/842xIj/xijd82r0YJs7hzzIQWpVkYxW+BNWj83ge4ZnR?=
 =?us-ascii?Q?6ZQtEy7/hN5jdAwSqJXHdsBujX5WGeb6wb3A2hJVQ8voHaUiBiXfmbJQIwsM?=
 =?us-ascii?Q?IoEwcXbRGTxdb1zWBhc+UcaYym8Bdft846EQttZgYNGPY4qhOp+eDh5nUXB9?=
 =?us-ascii?Q?KMPh1CLK2n74VhRPyvZGOGDHhYGjWYcU/Ir6i69b0HN2pZWYTbG03Fv/1x4Y?=
 =?us-ascii?Q?UdkEUn3JHIG6u9VCNu009s/yGdHWUSp9eTYxqpmUBUq/mzgGt7nwvTdTfsNS?=
 =?us-ascii?Q?Jjjgb4uy8VRGwBu+45GWwi0SF/2aYZFfXNP8SnhDu1QZahZBlhyS8bxRZf4C?=
 =?us-ascii?Q?X8Hw52dRlyROr5ShxRCUGcyODrqzEuMKewSF64IfDi6zXpKnsYe6clOSCEdZ?=
 =?us-ascii?Q?J94t+fmoaCLvAclaQLuNOrDffDkkcFh5xv7R/ojvz9XnABaK/JMXnnOeODue?=
 =?us-ascii?Q?uoNuft2sRntxdNb3atw/TQyWtM/bL89eJWZgkTvyv81dP1sKYDJAVSz4MXXT?=
 =?us-ascii?Q?9tvNQJUNpsmIA5otNpvL/nYMVL6+xD4rmTCMK/lGVHmx858q8wJoGvh4qIeR?=
 =?us-ascii?Q?sq0Xd9sLobwmCY/OmcL2+nCzHea1eO0GOf+aA1nDR26jzli1eoBCT0mUDJDS?=
 =?us-ascii?Q?piBz8lTcQpJJlvNAtDWwVHpEPbH7BMojQg4qr1znL/HjxWRArVZnj7cFR32s?=
 =?us-ascii?Q?EQZbV+6S9R5KBP4AVxFxbUthQwkNT4Qfhy+BdZXaF1y5hgN4G7Ym2VzDkhLw?=
 =?us-ascii?Q?zdnX12860tMV0VgKj7iTuzfB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b43aec4-1e94-4b90-12ab-08d947595a15
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 06:25:33.9727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TB8VCvgjxb2OVxr+aZyamZWY7+KfY+LI9l0OW8bvRMmYf37p4KkVcC+WYlJL0YtLYMTkJt5PrX99zDzybxqqXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 14.07.2021 18:17, Anthony PERARD wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -25,6 +25,9 @@ config GRANT_TABLE
>  config HAS_ALTERNATIVE
>  	bool
> =20
> +config HAS_CHECKPOLICY
> +	def_bool $(success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
> +

This is no different from other aspects of "Kconfig vs tool chain
capabilities" sent out last August to start a discussion about
whether we really want such. Besides J=C3=BCrgen no-one cared to reply
iirc, which to me means no-one really cares one way or the other.
Which I didn't think was the case ... So here we are again, with
all the same questions still open.

I'm not going to nack the patch, because there's an immediate
purpose / need, but I also can't avoid commenting (and I won't
put my name on it in any positive way, i.e. also not as a
committer; if anything then to record my reservations).

Independent of this I'd like to raise the question of whether
the chosen placement is optimal. Other capability checks live
in xen/Kconfig.

Jan


