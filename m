Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654B94F781E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 09:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300470.512557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncMuE-0003AI-VJ; Thu, 07 Apr 2022 07:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300470.512557; Thu, 07 Apr 2022 07:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncMuE-000382-RX; Thu, 07 Apr 2022 07:50:14 +0000
Received: by outflank-mailman (input) for mailman id 300470;
 Thu, 07 Apr 2022 07:50:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncMuD-00037t-VQ
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 07:50:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5aca65c1-b647-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 09:50:12 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-LWoQaKiZPhitUfXrd-F2uQ-1; Thu, 07 Apr 2022 09:50:10 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB3069.eurprd04.prod.outlook.com (2603:10a6:802:9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 07:50:08 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 07:50:08 +0000
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
X-Inumbo-ID: 5aca65c1-b647-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649317812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jN77GZG4mCMwqGZ+/YpyXkkaeNwozUatRJtjWE/Vb1c=;
	b=Wz1TdKIx3VaE07E1Yv0VC1PRLimHyM9rQrfETLfl59PhA68GnpPdI/57Dupe0tGTArCVJJ
	uqi0HKxTzIPopWWBYFbMxMV4GsZIXXcQM6VGE0AXAqmDiynNBfEwB8KD+tkZWvTQoTmauS
	LMcvu6wyql77qNFaEyONICgn1ypo0bU=
X-MC-Unique: LWoQaKiZPhitUfXrd-F2uQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpmXgaOLf4crsAymoN8f502ZP/vG4BxoCPKuKw868cuYkzDz7yKzIcEl5Ib1uQ4YrZRP/XjJYdR2V+cUM8Sxy2d3JwgoTTMWolbSM7YIt8Cc3AVDhz+8AJbNOOj96fMx7Uu/fL5Gv6jkWl26OoZvCYy/xukop6YFuSsjQIvEzlRCRznePGBLHbvz7tDdI5LNNXja6qFk17XPb964cHcSL8ewSM1hAWYvOwgp/BjCi76mkustPTn4eCp6RNGCCBRLpSCtb0sQ81Kx6LpnrIuo4KTkFm8i8eoM4bS2H4+avMT6cN1ldJk+v6Rku36HRfVC0j7U8ZzLhxx63wQxqvx0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDWPZgW3PnKuc7oxBCrFOLRo1A13WwxHzKdhk1RsW7s=;
 b=WSZDtnZoWD3OpFYyzvg9KecxR6aMH053qBkmNPbRz3xKB8G3/+4NvIvhLhm5VW2hCpEhdYQPqAhPSLCMhZecx2fZ0ddoFsoEs+9daGVi3Q2VH5pVecepLyPGSqVrR6Ie3ZdAYL+7Klfr5skpp3PdOlQXyTW2LB1/AQr2kWn4knwi9gUKot2NpxN3UEVL3ix+Xn8RZ1+cTLNFVWsCOyLpfpB4m93XFLbQiWHlTL+BOJOjXE64WUE2rgkDtm1Ix73N/KTWB86pv86S/6BRxY9HP1wcZMojbkil3eaGnumF0opQTyxV3wfsuGkGeXGbFqMSwyR7QhtGpTvThvUZiGeTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15a53720-4dd1-3139-5d78-5b8a5704a953@suse.com>
Date: Thu, 7 Apr 2022 09:50:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] VT-d: avoid NULL deref on
 domain_context_mapping_one() error paths
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
 <6739cf19-a74a-208d-82e8-28dfde7710f5@suse.com>
 <Yk6VvXJHWxJZTgeF@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk6VvXJHWxJZTgeF@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0068.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::45) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa2f8c89-4eb4-4073-5e9c-08da186b3c57
X-MS-TrafficTypeDiagnostic: VI1PR04MB3069:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3069F39512C1620E3CE33F06B3E69@VI1PR04MB3069.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	99cF1vQtIfoOm3T7vM6C9EcoEghYmAyj/e4eipBFR/bJa7yyey24tj8I2hKu3vGmORVrc0jzh5wnyMA3e8ogTdZXyutXLnKldyjCMn6EhuUOz1HOyZMLHjl1sqov4jcAKOJLr9v599rttooeCV4pBg5+3BREuN86UjWoxtQgTW+9j33oli4dAF2g2u5AtigylsjCqBhCktpSX8IITGuQ2lP/NwuCfflhsy8oIabMvdA++qutTwea/OTC0/KdQ1eMMFdef8o530z/WgJW2QEgASBMmdUHC/reKiGMEGkBE9CgTatWFctykcUmHaio81qiVfHYGvgbItS4fkytKZQhct4MQCTxjww6Jh772SFr6XpYLzoQM4WFLUelYjewvTJ9CjIAugsmEBCEIvB5roeumaVBcwgxedQ85PvIIClo9qChtjeB2zE31LHII+wKp0rfIE6stwUIx05Gp21j6xkJ2wWtVStMV43xpL/e6WLjL4z+ZOWkjc3XD+25xrE11TEk3B7QlwsYeG1ZDoUoVgnPBYecRl0tdAVVXsSR9tgfZPAeroM6In/SnNMfHzd7JVIaAuWQTIO7WHSYmpiKIeEHvFJ35OJzC/SkOUeOaE6AiaMNRwjMhieP/Jhd8HXWv2pWwg1QYB2sCRf49FOBod7LVthx92pwndbP/nV+VjM6k3zJZodxnZlnriAjlOxtIS3KsycnESr+s59IeHiQJz/KKGfCDuiy/I52zzH37a4uBN7IG1Vla0cBPvoRxfYY/x3p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6916009)(2616005)(54906003)(6486002)(5660300002)(6506007)(316002)(508600001)(53546011)(6512007)(83380400001)(31696002)(2906002)(86362001)(26005)(36756003)(66476007)(4326008)(66556008)(66946007)(8936002)(31686004)(8676002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e2q3K7K/dcBhNbO5RnuGJSn3+KmMhSCVF+Bf0N7FQAj9sSwcLIL6fa58fUc6?=
 =?us-ascii?Q?qFAh3+lFpRRtJ0jtyW/pPsjitScPZk5pIhWelC7+uibKxHY6G6b0Vk7G7GB/?=
 =?us-ascii?Q?2lYTZMlIus2Ivg+H0A+n9TQIZcoPovzhvdmkEccRJFkGQ6O0pDFeeQ1Wbgjh?=
 =?us-ascii?Q?MFD6xFa+OefSsNBx7PIkptk0QrEvsPcMtiideiBYXyOSnWQHqQ48OLYBBBDl?=
 =?us-ascii?Q?qv5gEZOpM9fLSpeUp+j7v/x8TWjUasq28f9SSOW26ec4PqPCgLiZY+ZKxSRa?=
 =?us-ascii?Q?lQg8Le12GE8LTqQtLizNGgvI3cMnVgidrXgUaounuroKuOSm6nt0VLcnJ2en?=
 =?us-ascii?Q?edWxBgVK7PClh8Qrb+dQQGnlay2BYar1APIyT56edJneJtUIxOkV36In5wMN?=
 =?us-ascii?Q?52lhJvGFg61/r1ZLJWboU23qGlpFbgq2aydt5oR9umAxtAYEP5xz3ZK2acyR?=
 =?us-ascii?Q?Sh14uNRk9oXNJdM6DZF7U7YUyFUZRyENxh05uAelT0B5DAH2Kz2LA0C+/6su?=
 =?us-ascii?Q?Y/T8lhpO0pODBW23GqlSSsBd9bNxYRSvkcpXjWH09cin4gmsCrHu3pZt9TV7?=
 =?us-ascii?Q?ZJTaBZ6UkwNA9RlpI+MI/6G/sOSeamtbfl6NOhf2hrGkXVuhzEujbyBlezj+?=
 =?us-ascii?Q?i0sE3jzRqBD3LXeBtNU4eFsmU/mD9O9LzxqJAkz/ULcrEh0/dz9vWHN05ErP?=
 =?us-ascii?Q?n46RmwXai2zXEW5cZU6jtbjZ1QPypGeSuvZWfuMYE6rYlKoH/rqZYSP9cMcH?=
 =?us-ascii?Q?tUrOD9tEP5Pf7SsTbWJfSfUulwSbBmy/Z9D5yQDItlYbSS97auJfbDDIDeYl?=
 =?us-ascii?Q?LaYy8bz/oJgLCsr1MPuySBvRLGW3CBWrYLwCJlWf8HaTo1KNLPk006HiiBcF?=
 =?us-ascii?Q?lBqekdikbTnyU2p8xmxbzU6XoWq/NytcSRHOokdynm909PbeOIiZzMOvC80i?=
 =?us-ascii?Q?xhgJPFEFfctWkfGO4E5/t2dGxQpva7sZBmagpsX85qwt+DQ4XMZu+z/GOxdI?=
 =?us-ascii?Q?4Fw3tlyOpaCu+6o8GP4GSlqW05Zyi44byUbYHrcJAnNkZZjQnaNKCdJy1JhI?=
 =?us-ascii?Q?DPwAX64USRi/F9V5mrKqi021W2IA2iZeRluXQfbLXJD4qpOKRkXkk+M2B0Os?=
 =?us-ascii?Q?K9x1yMyh2pcgRKSXHr3LwZFCxk9gxM3m5MFC4ldXL8fh+VogHuLcx+MpLED5?=
 =?us-ascii?Q?pG4S9LCG0pBoI9jVaEYs3jpd74vZ41kzhg6rh0kSBbh0pkD/+JQonQeTx52a?=
 =?us-ascii?Q?slU8p0cFCxf+p6I+8pSr2c9EQTJdpVs+y/64dgUTOXgTJTadrsSMaT1PDC0m?=
 =?us-ascii?Q?3QJKUnNXHaVdFB2C4se4a21dEhy73fXENirTCRWSLVmVhe+lEU1Jg52+bh7f?=
 =?us-ascii?Q?6RezLNgIJThENFDJAdWLAl9wFGF1TV9QI/Go7oZy0fLEPLix8KDL5m+2kMow?=
 =?us-ascii?Q?f6B6DAoQFW1N6GhcoAQRyHfoDy1L7zN7wnC/RrqI/kU/fJz+jJKykk8Q6hOP?=
 =?us-ascii?Q?o4SRysv3aFEGs0I/4huF4Z1DKd5Yi3l3d6dUUZL5GU5CXLXRv09bhcSIzfeD?=
 =?us-ascii?Q?G+pv6+P5OcT3xEQMe3pxqfKnxGm/tUku3JRbwu0OJ7ks2auiC+ntL+nJFcs8?=
 =?us-ascii?Q?mxql9/+syh8ud+Zvda9yPKZx5f2APs2sgs2Xii293Mp6L1S2LNgKmiPu0hgi?=
 =?us-ascii?Q?JkIVBhtqIQHwye4FCkQ5mHOFJWfLturTSOX7XONnidplOP8Z9GTTu/Y9+OmS?=
 =?us-ascii?Q?cL0jjZBqSg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2f8c89-4eb4-4073-5e9c-08da186b3c57
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 07:50:08.0522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EZAerDKxAHPdnzFP0nng5kkFL/6jpbnkv+VBKTIU2+qPm9Z5ukuuNe72Ce0lLMnmFYmX37Xe2ChapRbPj2hBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3069

On 07.04.2022 09:41, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 07, 2022 at 08:11:06AM +0200, Jan Beulich wrote:
>> First there's a printk() which actually wrongly uses pdev in the first
>> place: We want to log the coordinates of the (perhaps fake) device
>> acted upon, which may not be pdev.
>>
>> Then it was quite pointless for eb19326a328d ("VT-d: prepare for per-
>> device quarantine page tables (part I)") to add a domid_t parameter to
>> domain_context_unmap_one(): It's only used to pass back here via
>> me_wifi_quirk() -> map_me_phantom_function(). Drop the parameter again.
>>
>> Finally there's the invocation of domain_context_mapping_one(), which
>> needs to be passed the correct domain ID. Avoid taking that path when
>> pdev is NULL and the quarantine state is what would need restoring to.
>> This means we can't security-support PCI devices with RMRRs (if such
>> exist in practice) any longer.
>=20
> The sentence:
>=20
> "This means we can't security-support PCI devices with RMRRs"
>=20
> Seems too broad and could lead to confusion. So I would maybe use:
> "legacy PCI devices" or "non PCI Express devices".

Right. I did actually forget to either drop or edit that sentence. I've
now extended this to

"This means we can't security-support non-PCI-Express devices with RMRRs
 (if such exist in practice) any longer; note that as of trhe 1st of the
 two commits referenced below assigning them to DomU-s is unsupported
 anyway."

>> Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
>> Fixes: 14dd241aad8a ("IOMMU/x86: use per-device page tables for quaranti=
ning")
>> Coverity ID: 1503784
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

Jan


