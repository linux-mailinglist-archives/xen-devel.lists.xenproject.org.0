Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD584B6CCD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 13:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273141.468214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxOC-0008Q7-Ps; Tue, 15 Feb 2022 12:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273141.468214; Tue, 15 Feb 2022 12:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxOC-0008N5-M3; Tue, 15 Feb 2022 12:57:04 +0000
Received: by outflank-mailman (input) for mailman id 273141;
 Tue, 15 Feb 2022 12:57:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJxOB-0008Mr-59
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 12:57:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4335ff1-8e5e-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 13:57:01 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-gSVUx481N8qIdHcenJnjqw-1; Tue, 15 Feb 2022 13:57:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4567.eurprd04.prod.outlook.com (2603:10a6:20b:19::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 12:56:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 12:56:57 +0000
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
X-Inumbo-ID: c4335ff1-8e5e-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644929821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=go+4JVL+XMxFCvrmlyw7wy8tS7nQ7lqr2Sy72F2wM0w=;
	b=VvpuxiClt16VCfuJnhjCYenjDVGpXXyDbMhv6VGsF1d3rpL8FQeuROkdndAscKLyTWo6S1
	LC8FpTGV4b8YcLvOsJmWtK7IU6D86Ba4hrYydaIrYHPGy8l6EWaLU6yCLK6uvXhA5hcbii
	q/sEBWVOXhvpS/bVAnjKiLburbTceC4=
X-MC-Unique: gSVUx481N8qIdHcenJnjqw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WE4sA1ZBoT2AmRbF4gvI9XOM/Yb+/JslQ0A2/H6SIxDdAurLXfOi+YIU2Ysfnmqjd5GrR7StzD1oYkWYhZScaX3DJtmkPef7zmc2k0/zV8uq/UV8VqIs42aSFnRrK0fnv6SiJDz2RSA+5wbVLGEUGdJQaIpaDRg1Cb6MpdjRUyNtCnIHCHYmBeJlSgdrDlzIcDWmb24XYXeDO/L62tHShnqLYyQbW1E511ypPJFoI6xg4wuaKJqyNfWGXuD22jKZkkhROCL8mRr3t75Xi9fdHQ+k8GY6ZXpGgYC971XEKVOBuCio7payTLH/v8sN3Be1dlwSx+eN5YFG+Tj/4iHq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xdf5Z8VRt6KiPSDfUeY7PKAWUyi1LeDNdm/nayjz20o=;
 b=JQ6vWq9HAudmQelJ3rDaKvD0uLs6DDv2f3s78e3aFXaEnrUAMIpE6xjlfu5BvbJdrL3k8ED33EHQkXE/wgg0pLzx1aLC4k6wtzeAzbZQoImfo2Pq7mrFD1OOmHEXKjkCADEIKES41MzhlabgIHYGsrMF+9GyX83zkumkNxE4dQO8nBBkI3Rs6xI0jEbj5O31YSuzqbUaB1nJHCaN2e5iJJrp5CDSywnWAyVCwBTm+krdV2c1c5kL5FOMknE4xuw0ZDpySP/5/6ECAJ/1QolwVTZH7EKOoxrURusp8tddVbBVGfO9VOnQhvNm6UNtthvENFeGC2T4ccvYsu5n4Otzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <772eb410-be1a-3b5f-3b51-e363c43bc3c6@suse.com>
Date: Tue, 15 Feb 2022 13:56:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
 <YguQ8wfhfYFXTWSU@Air-de-Roger>
 <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
 <0d8f01b2-b015-a08e-dd49-e9c688ff7245@suse.com>
 <bbb36ebc-de66-297d-f82f-abc0e63f20a2@epam.com>
 <22d25499-cab0-00c1-3ad3-bddd74c97a55@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <22d25499-cab0-00c1-3ad3-bddd74c97a55@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0042.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dad0a25a-6dd5-4bee-dc7d-08d9f082a651
X-MS-TrafficTypeDiagnostic: AM6PR04MB4567:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB456740B2C6CFBF9A8A9360BFB3349@AM6PR04MB4567.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qIzcWVGBO5BAk70H4CJ0Fq8ZrgTAc1U/DZ9N/UOLbtG96BtkiVqRHT+qTuTRjwwM9D+sCnKCfJATVGbEA6IyCOroXHDt80/jUAoM1m0DKbXFe6vAS6krDffKSkXDpg2mustEIS19d2p4RSRuI9iuEf4EKSKS+pdaX+VrmNdMJgZ4h0l6SFLIHWWZyuvgJLIr+aM65wQtstOn1jLfI0jInU0WpCm+k7DcKFR9XsbIXr+uC0NkbR3WQZEZaDfUTF3lmbffGFT3WUIstYnvv85dYZ0GEkKdNME4dU9O/COgrjgiuG5RSm7Gxv2ooZCqWH2BFjVLtncyb/YFrd9BclJOUW+wopsH3qjCdBV/5UTJzH6JU3u6RvpZLBPNHvlSvrNWx46X1y7+NHBXZhmJe3Zt57NmgaLIyWCmPjSRn0jC83m9QQbTyUBThBC/l3Dx7v9W/v+ZFp662NcWGihO21Aurhf9B0UnTnisp4H8iY0t58y9miZk3Ze5nSzwIFelDQrKVvx0kTLoOMFIjgB25Zuq2beIhcBy1dsZgzx0QS5piGtaaRmTnsY2tW9JXu1U4J0aexY2IoOjJ9/ZKj3jQ05UvPw/qWl+aqYbl7kFPJB/4WOl9x6gta4wWI01OV+V0TAXj11P5YStO6XCu6JQma6aGRKKetRVOhZCgasnIm9HzQATSknhKDOCSvr/aqG3+NbzRzNglAvpEkvfyXPOzPAKyi6hM6O1Wh0n+a7n+Fh66Lg80SEhjCS5V5qmIIfZj2tt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(2906002)(36756003)(86362001)(2616005)(66556008)(6506007)(316002)(508600001)(6486002)(66946007)(7416002)(6916009)(54906003)(5660300002)(8936002)(31686004)(8676002)(26005)(186003)(66476007)(38100700002)(83380400001)(4326008)(6512007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9vRv/5sBrFATTwrRDnRS3caxk3CYO3qYchLUnPovxhlX9XNn0ziVcqiBbpwf?=
 =?us-ascii?Q?FYygfnDys0nl3DtDGgCDeUjcYnnmBFCy4QieLVEUpG6AUgWZaqAIWu0meZlZ?=
 =?us-ascii?Q?A4hpXtJ0eqgmJgdM+V0ujqIW5cCB9VyiZHFYmzkoq58OxUeXQq5Rl4y9gQM2?=
 =?us-ascii?Q?CbKsnzWzT5h8GwKRq1C3PeDWoidfcUcMYD1wa5WK3wgYRwziCka4Z9lrNDgL?=
 =?us-ascii?Q?LvFgsuKTroGGRzlL8STYobv65mTnMckfD7eTqIahVWHh7Qr5CWV1mYwJyRGY?=
 =?us-ascii?Q?zuXgveXcGKVPu+Kcuuuka6DbUGLgI6xvgpXiEgI/A6Mr3Gava9dvlNBF9tuX?=
 =?us-ascii?Q?tP9we7tbWMAZZD6Gbj/CtFzpDbUogU3/pfwO7vF/w5WWR078lRBDDMd/waV8?=
 =?us-ascii?Q?NxmhIREzFk9MjyNT7cJEhDpSIVDaN1lh4xUykMKb6/DP75YZe3glU5z7TbjY?=
 =?us-ascii?Q?JHwvNddQUEYeM29mrX8owj7788qVyJ8BaQjMGznGjj3vBfXbJr2oAe7sDchV?=
 =?us-ascii?Q?a+Y5PEMOytxA9GSVnQKMeMKY2+sq1XsZIA9QOlQMYF2tnb2a2RLAnpiNbcWO?=
 =?us-ascii?Q?Wkr48N/uKXT027gCAAyGYRkguVaD5MCwNiuNSKt9GHvwFm4IuJhBOdtCXU4U?=
 =?us-ascii?Q?Vi0e8TfcJI0I39aWquE7v7TNYnPx0nkSn3SAZyTcZZsPjNt7LfjZMKtxdrFV?=
 =?us-ascii?Q?EdWe80XwGRUgfqf8zjLeKOfRU+fXS8e+dNDLAzQcG3eykpfKIuidUHk1oawD?=
 =?us-ascii?Q?SeLWP2U+ihUVFfRd1Ddb1kP+HNwNl2OXubK8CE9m4S1D2FqOLORPHfzYWWwm?=
 =?us-ascii?Q?0nVbh9wYluieOuHA9xNSxFVQbcAag0edD5q3xbK3OS1ibei9TcrhwHYyFA7Z?=
 =?us-ascii?Q?/XXQNmeyrApkYeIVsAnE0lE4zD3TdCUvLOcGOaeLKKrTobv5Nrd/QL8WP6mD?=
 =?us-ascii?Q?RxzQyqxFuLJQoK40EhnvZboC6fy0pU7a0XlMuyiJ9lhV3UyU0CYdBHtpIen8?=
 =?us-ascii?Q?aGsQ44Fa+IWKNuEEVYUAdVuMbS0cEnu55R1DT7av/YVh+LfeK3/bKofqq42s?=
 =?us-ascii?Q?nR4sf+8taYuj6pSKe4MOCrSUISH0lTeKo6S6DCvH8t7ocS5XkIciHsAKlZr2?=
 =?us-ascii?Q?LX/4P0N0S5ZtxDb9y1kJ6dOxTpuZhmSy5E8iW4wuj8ulDZcCKtfKB3UXR1Dv?=
 =?us-ascii?Q?Ms1AjNLBnWsxhVD3a4pGGN6hqt3aMjO/UUzWJyApnfV4jpln+89NIKTX8X4V?=
 =?us-ascii?Q?b5AJ2xZZMXMcY0cw1m95HLcZuskhtMk8YWBjXenU+7Skzi8gDYF1qGw96o5E?=
 =?us-ascii?Q?geFNw80HvcZc/3h0j1J/AofVRvx8ed9G7UOobGyMB+vHAxzPrrNVAC4xlGyU?=
 =?us-ascii?Q?h4e6f1JcZ+zeetqIAUzRM1/iFqEFAqcxv/L+PDlKSMZYyG3/YO5dtdKo9vMI?=
 =?us-ascii?Q?sTeFRD07FcNn0s2MqR9zAxFqDUW3x5woYhDnUaWnVa35f0sEAMPRIs/5F0Lx?=
 =?us-ascii?Q?Fo7s7H4py1dVg6XRHB05NPBrOoljvQfp0a99J2bIcfERJXKU4cgCa423h5iP?=
 =?us-ascii?Q?3zM7EdqMskuLNqLzHrHhqCxdZ4hRs3+4YitDT+ETgCLeliu3yqKh0OFv+q7p?=
 =?us-ascii?Q?VwHRkjfhFrd1/1WlNaxEsCA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad0a25a-6dd5-4bee-dc7d-08d9f082a651
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 12:56:57.8151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9xsAqU0BqcsXKaE20AoDu168XTTaSTEhXY2Rbaaxwz/i7X9G3z3dn7mes5ZE51jMDpgqmbZc9XZYR3reHJjFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4567

On 15.02.2022 13:44, Oleksandr Andrushchenko wrote:
> On 15.02.22 13:54, Oleksandr Andrushchenko wrote:
>> On 15.02.22 13:50, Jan Beulich wrote:
>>> On 15.02.2022 12:45, Oleksandr Andrushchenko wrote:
>>>> I'm on your side, I just want to hear that we all agree pcidevs
>>>> needs to be converted into rwlock according with the plan you
>>>> suggested and at least now it seems to be an acceptable solution.
>>> I'd like to express worries though about the conversion of this
>>> recursive lock into an r/w one.
>> Could you please elaborate more on this?
> What if we just do the following:
>=20
> static spinlock_t _pcidevs_lock =3D SPIN_LOCK_UNLOCKED;
> static rwlock_t DEFINE_RWLOCK(_pcidevs_rwlock);
>=20
> void pcidevs_lock(void)
> {
>  =C2=A0=C2=A0=C2=A0 read_lock(&_pcidevs_rwlock);
>  =C2=A0=C2=A0=C2=A0 spin_lock_recursive(&_pcidevs_lock);
> }
>=20
> void pcidevs_unlock(void)
> {
>  =C2=A0=C2=A0=C2=A0 spin_unlock_recursive(&_pcidevs_lock);
>  =C2=A0=C2=A0=C2=A0 read_unlock(&_pcidevs_rwlock);
> }
>=20
> void pcidevs_read_lock(void)
> {
>  =C2=A0=C2=A0=C2=A0 read_lock(&_pcidevs_rwlock);
> }
>=20
> void pcidevs_read_unlock(void)
> {
>  =C2=A0=C2=A0=C2=A0 read_unlock(&_pcidevs_rwlock);
> }
>=20
> void pcidevs_write_lock(void)
> {
>  =C2=A0=C2=A0=C2=A0 write_lock(&_pcidevs_rwlock);
> }
>=20
> void pcidevs_write_unlock(void)
> {
>  =C2=A0=C2=A0=C2=A0 write_unlock(&_pcidevs_rwlock);
> }

Hmm, this is an interesting idea. Except that I'm not sure in how
far it'll be suitable: read_lock() won't lock out users of just
lock(), so the solution looks tailored to your vPCI use case. Yet
obviously (I think) read_lock() would want to become usable for
e.g. simple list traversal as well, down the road.

Jan


