Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1EF4FF83C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 15:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304158.518730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedSn-0000xr-OP; Wed, 13 Apr 2022 13:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304158.518730; Wed, 13 Apr 2022 13:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedSn-0000vt-Km; Wed, 13 Apr 2022 13:55:17 +0000
Received: by outflank-mailman (input) for mailman id 304158;
 Wed, 13 Apr 2022 13:55:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aogm=UX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nedSm-0000vn-4Y
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 13:55:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 580b451c-bb31-11ec-a405-831a346695d4;
 Wed, 13 Apr 2022 15:55:15 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-4TlGO2E9Pxq5mbLgewC7Ag-1; Wed, 13 Apr 2022 15:55:12 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB3071.eurprd04.prod.outlook.com (2603:10a6:802:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Wed, 13 Apr
 2022 13:55:10 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Wed, 13 Apr 2022
 13:55:10 +0000
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
X-Inumbo-ID: 580b451c-bb31-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649858114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17rpDyXkFfWd1OjpghRAvtVU4eiNvVJPNBhED5n+AYc=;
	b=W0rcSuUL1wgppg7d6QgWEG07agoB6KnpZgrS/Y1KN23H85XzvFIKI6k3plnYpW5D6qJHSk
	lquv5J3z2gEYOi9TVK1l1wwliETZPA4kEUk0soUXF4pmRqJ5hF6rtNMGslqpPGGwUM9pmt
	JQLUopcmx1fQiGe18F2yPaiMwXpVwRw=
X-MC-Unique: 4TlGO2E9Pxq5mbLgewC7Ag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJQUup1F/vEvClCRK3w2Y06pE7Go6eya4w4tNjKnljr4BnjgOnTflPZKnzp0mUrPL5rI4SgV9kX6CPDv/SLUttboQ/q6FH7ODgFPV2VVMk5vfLpvMTDjNJGztk1ZXO7q7flRF+sqz/Wi3d3b5+N/zUnSr7J/3lo7eGx09x+OP0Q2NLODaXSS8imLwWsxNLaMgtBOtcwLpKDpGHRFv57hYiefM5zgovnTysTzGY/OAoooy1AdYGucz7EWKws3usFjdbUtlB3LuiKmmKl1byAP0ETRX/EVlIlUq6cNqDk7yIKSZLj3emIu4r/b90Q7QJHMrz1ycSKXGL1PE215SrcepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17rpDyXkFfWd1OjpghRAvtVU4eiNvVJPNBhED5n+AYc=;
 b=RFaghzKXQNMBPCBBkMbzKoalvc8lJcOFKEsS2go7fQIKfbPxGFo/X1EkM6jMOYP71Gj7kb6g2CpGHYtNQVkyhKdT4r1Y5gXPLzqCYp1FBXgGka4uXCJmZCAsFO+27gxjW7GHmm55P1E3CQWQKe+v4BXdNY3lUUnW64/o8QiFw5D8ExGxoCPyBAxEf8ayMOg0aXTrAQIgxxm4M95cE3O4zj1OMD3ECT/pnW6vW+UnmdNIK0g71O5MV+hkhIIUkwV9kgo5GXMC+hI2CHix/iT0aEHuTE1pw1tj8VUmaTcNIlbfxoCzINJ+KX2r5vRnYZ7C0ICAsRj4bDnVpeTlvV9Hcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00731823-a353-21e8-81ed-a8af74b8d1dc@suse.com>
Date: Wed, 13 Apr 2022 15:55:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 7/8] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <452b42cb-56a5-3f28-989f-c02e53334447@suse.com>
 <6F9FAAD4-59FF-4D52-B08D-13E3920B3925@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6F9FAAD4-59FF-4D52-B08D-13E3920B3925@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0022.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e06bae03-4dfe-4337-9544-08da1d5539b1
X-MS-TrafficTypeDiagnostic: VI1PR04MB3071:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB30711C099B3D02BC5AAA84DEB3EC9@VI1PR04MB3071.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zDZ4r5F3m7Bd2odxxtO2Jt/bprIpn0eq65GYzDrmR7jp8+9U4ScbPYAWR8kQfyhyjjJQwqB8vbRKoYiWMESAe7w1j/VhZuGXvhzEA99TSw6nogouK4IKHpB14Rfth5DPglRcrn7QqONSMOuEzF0XhbM9G9venv1LyB89IL/Y/HN46fMBYfmqwOmOniikTVxjOgDeL87guZQuL31FNGgEHl9s3q9AINHFRTYfHng0vSQEw1tP20KyZgkUM+WoEGVN5c8NHrHIRpjAM2D99KBWWYb13X/YLY3z0DqiFTlSweKccxRta8zu0YZ4BRAAEEAB1yANCDnSwNf3HYxDM3Rg8BjR7HE+jwNgzju94yvcrXRVF6KUbtbTuzR+9Tr76oCwgIy9eyWVUnxN5CG5ShKz1wihabJBMT+wO2T3oBcVwJLew3A9j3lN2uP7p9Zokod54fnLm8sTehybcJCYfuwe4Ukux4k6V0wuL9aD8mcdbMwRVvwYdGIMnugnPirGhWzqp3J6KVkmFPNqOjTnIpFBwFOu5XoM3GKejNtGlv8aUIs7wI7+uTDs0KYhr1aeyozxn0/j4DZgxtofu8VxGGztB+QhchPIDjljBtZNXUVR8dB7o4Ri5pzqKDp2eeZxudrv6SpANDoKCvt0llyg9W1p9ncDk4BSA6iBVllL9t11u1N7/eCbjnSbRoiVhq1SEt3TI6/XzTOpjWTPy0mg0oTgjBb4TeeS3ZZDpRYod9HztPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(31686004)(36756003)(316002)(38100700002)(508600001)(6486002)(6512007)(2906002)(7416002)(5660300002)(8936002)(2616005)(26005)(186003)(66476007)(66556008)(6506007)(66946007)(4326008)(8676002)(53546011)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU9aMVZUT01FaWdwc2NNZDZVa0h4VGtYc0k4S3dBdUl4K0p3dkdNcytqdnJq?=
 =?utf-8?B?U1NGS3NCTjV3T1dkblJJOTk0ZDVpSng4YWdxSWhYckNjVVhhcndLZjlBc2hv?=
 =?utf-8?B?djZ0RW1IOFhCL1l0YjJuVHlIa2Zodk1UMXViMlI4SGFrQXBCOC9uc2wxS0xj?=
 =?utf-8?B?TVE4bWkwQjY3amppcldVVVNsRUdCV2dUSWRTdldkazVIMFM2NU5WMDVKb052?=
 =?utf-8?B?UmU2enhnVE42bVFZUkJuUjc1cmVOTEdlSmY5NVRjTlAwVE81dE9WTjRmblhu?=
 =?utf-8?B?OFVCcjJBbDNaRDV5Z3BJSjl2d2hjNE5MbFVWSzhJQXR1SmtxalNRN3ZpS05q?=
 =?utf-8?B?Q0tnejFQcGs4MGxwMFM4SDBmWEdxN0sxYnZheDM4MFJFOGlCT1pwaWJ1Zkpt?=
 =?utf-8?B?OEVUOU8yV2M5VVIrWnFObU5oRWJPME1GL0liQzNIbWhReExWdHNpVGJNNTdh?=
 =?utf-8?B?cERMbVVVUmtUZzdSdytUNXFwZkZIWFFaR2RPY0NrbGVNMzFJOWwza1pHMUlt?=
 =?utf-8?B?TjFhaGRsZittSGJQY0JXMG1KN0JLTWhwc0RVaG1QcmUrMHczRm9ZMTRldWNH?=
 =?utf-8?B?UlZKS0tOaU1BR2RmYTVmTjMvb0ZhR2hmQ085aXp5R3lybHA5M21mVFYvQnhY?=
 =?utf-8?B?cDBodVNHaGlvK3lxYk4rdE43RWtseGxoakR2b1FRaUZvall3YjdaRmowSmdj?=
 =?utf-8?B?NTA2UjBZYWt3R2J3azJEZVBVSytQbXI0MDJDbDFOMXdCWlJQN2orandkb0tm?=
 =?utf-8?B?QnlISUJVdjFpWElXTUtkSCtyTmNhOWFPVDJkbWNmMUpqWFVNRUJmUFR5T0xC?=
 =?utf-8?B?VzM3RnhJYXVFcEI5Z2lka1lMQUNmbVkxWTJWTlFWbTFRdjJFWGdoQnFjam9O?=
 =?utf-8?B?SkdFblV1YVV6a2lsL284b3J0RFVmOXB3VUY5MzBvUXQzT0IzQTVNeUZzTUdh?=
 =?utf-8?B?Mjk0eWJEWS9ZWWlJZ3ljNGN2U1VRWmJjTEpUejE1aHY4MHd6dlZ4YzNmR3Zm?=
 =?utf-8?B?YXhvSlV2a0JlY2N5L0F2WFAxRlUydXZ0cnAxeVRqMVNlM1BxNStIbEgzUXJJ?=
 =?utf-8?B?U2ZwTUhoeFZDU0tIL1hJQVFRbm5JdzJtM2hXWjNBTHdrTVl5UlNJNGR2NFU4?=
 =?utf-8?B?UDMvNXEvK0xsTjdUeGhMcGZ0U1l0ZXZBTFY3dDVvRllVbHdLYVhUSjRtbnpo?=
 =?utf-8?B?cW1McUF1amFqeTlGZ0VRTFlzYUJpemRETlhOYUVZWlBza2ZmTWkxaHhRL3JV?=
 =?utf-8?B?SVZTQTY5V0RTWnZZN1c1SjhPbzlYUE15alk0dENiRFVIREZrN2NCY0FRajFL?=
 =?utf-8?B?aUtQcFJSeGFSMCtFKytoclFCTk1RTk9sK0J1MFJVbFUvZHBFVkZUR2NPZi9n?=
 =?utf-8?B?dHdhcGdiRGdCY3FmSVQwc2MxNFdSK2F6MWYzUGlCOUdsaWdmQWYxeGtVVFp3?=
 =?utf-8?B?UUNLM0Evc0tnYjU0S0pJbUd1MFFjem1mWUFwcWY5WXRPdTc2QW1hTmVTT0g0?=
 =?utf-8?B?Ky9xUFBlMS9BWUVWQzc5eFZxTXhnMUpYV2wxV3FCME1PQzNQeFZ0UGZGVElW?=
 =?utf-8?B?UGZheFR3SGdvUnlYbklUZHBVT2lRSDNiWk9ScGxwdVJqRmJGV3lUWEI1SCtF?=
 =?utf-8?B?TDVTTitJWTJSYWtheTRmUlN2Uzd5c2h2WkJpN3VXMmhBeUU1SldUWmZiK25E?=
 =?utf-8?B?bVo1OTdRSnRLT213YU1GczZ1R3hYcjQwYS9VeFU5QmVkR3g0SmJLczdyMWxM?=
 =?utf-8?B?S3VMSUtrSzJEMFpNSTh3dmdLaFpBbFJMaUYvbU56SDN3QVJhSDBza3ZuTEN5?=
 =?utf-8?B?dnJYS0hxNVdpUUlnOWJpZzc5V0pBa283TFBqR2Y3YXBDVndLeXB2KzFqU05D?=
 =?utf-8?B?WWo3UjNDT2ZQdG8zdnFxbzNLQVlBNnpZbVBxbytTam5kZXk0aUFSNEVtVzdv?=
 =?utf-8?B?UXdHcVV2dXdONk9oVVozMkdZQTJ2UjI5eHp2dmJoZ2p4QVhvR2k1U3grazZv?=
 =?utf-8?B?aXEvbVAvNlNTU2ppMzMxd2tOVjc3Z3krNkNRVm4wUVgrYjF4ZHREZGtpcUla?=
 =?utf-8?B?WU5yQ3NHSzRjbGx5bEFoenhEWTZ3NXpVNlJBKzBFMFh3SmNvcVhSR1FJSUJm?=
 =?utf-8?B?VTMyN0Q2dC9lbmkwZUtSaDhpdUdGZ0VoS04yZlJ6S2FCdTB6aE9aVDhmTE1C?=
 =?utf-8?B?RlNocDNMQUN6TTAzUUZoUy81dG80WVJQbGFmM3dPSzkxTUJZbjFoV1VRQUs4?=
 =?utf-8?B?OFNqTVBJd3MxSW9LdWFjbDZodVJoZ1lVMzJMYmJZd1lWNndGUVJ0QS9QdDRY?=
 =?utf-8?B?Ylg2cXJua05yUzAvc0UrWTlwRFUxSEtJai9EOW84SWpoa25sdnZVUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06bae03-4dfe-4337-9544-08da1d5539b1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 13:55:10.5742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OB6Ls+6CSHpQXAvvp2OiJjc2fMVPrlvOH2eMGQxQ58Z6uBDZlAe4CvTsKcHGaxWxuIqeZY9JOhHr4KEdBiCXhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3071

On 13.04.2022 15:48, Bertrand Marquis wrote:
>> On 11 Apr 2022, at 10:40, Jan Beulich <jbeulich@suse.com> wrote:
>> --- a/xen/arch/arm/pci/ecam.c
>> +++ b/xen/arch/arm/pci/ecam.c
>> @@ -28,8 +28,7 @@ void __iomem *pci_ecam_map_bus(struct pc
>>         container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
>>     unsigned int devfn_shift = ops->bus_shift - 8;
>>     void __iomem *base;
>> -
>> -    unsigned int busn = PCI_BUS(sbdf.bdf);
>> +    unsigned int busn = sbdf.bus;
>>
>>     if ( busn < cfg->busn_start || busn > cfg->busn_end )
>>         return NULL;
>> @@ -37,7 +36,7 @@ void __iomem *pci_ecam_map_bus(struct pc
>>     busn -= cfg->busn_start;
>>     base = cfg->win + (busn << ops->bus_shift);
>>
>> -    return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
>> +    return base + (sbdf.df << devfn_shift) + where;
> 
> I think this should be sbdf.bdf instead (typo you removed the b).

I don't think so, no - the transformation is to remove the PCI_DEVFN2(),
which was another way to drop the bus part of the coordinates. Patch
context also shows that the bus part if taken care of by other means.

Jan


