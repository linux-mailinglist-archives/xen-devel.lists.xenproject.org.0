Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F0474613
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 16:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246824.425663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9Rs-0005Zf-Nt; Tue, 14 Dec 2021 15:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246824.425663; Tue, 14 Dec 2021 15:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9Rs-0005Xs-Kn; Tue, 14 Dec 2021 15:10:36 +0000
Received: by outflank-mailman (input) for mailman id 246824;
 Tue, 14 Dec 2021 15:10:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx9Rr-0005Xm-Iq
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 15:10:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc5abbac-5cef-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 16:10:34 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-ipeAA4ZfNASAhvgWdVqtFQ-1; Tue, 14 Dec 2021 16:10:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2701.eurprd04.prod.outlook.com (2603:10a6:800:af::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 15:10:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 15:10:31 +0000
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
X-Inumbo-ID: fc5abbac-5cef-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639494634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VSftDR1HEYYpWf5OLbtVlhbMevF/3BMHkUISlL569Wo=;
	b=F10RYFZIBISWHF4iPWpd3xZBQIl4Xzanbzue4QGvyzIPTGVnlqGW4u6s8Bmr9fBIoqeQEb
	Yy1dlLIIbXeOVsaxdiPwgT4UDme8v7+84a5aMVI1nSWf8Bgamh4Ej/Ykgw0gdTItDfSRWO
	vPNORLd90j9DJN4Dcy8mB/sa55FIlYs=
X-MC-Unique: ipeAA4ZfNASAhvgWdVqtFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+LHHFNkM1QPoUPtQpIje31wYd+kf6P+cRzjs0t5CBs9OrSA9/P5HDRxfbP/alxh/ai55tqTQV7tzsoFKomKhN40EGi/rZJgUs3eUurzSp1jI6BB9+m5HYgLHUjwU5dpzu3mYOskgpyQD4DsPpjUtT4moTt3ev095RgF6YdSHMWd9G7N/ZyMaNYQ1FLRdv3n2AOxhfr6qCt9o5r1NLGTdwdMJdR+WIgoE2PLx+HjlxhhqOCDdw/wjdVSvs0Mc9dp+xxKLLSgY6fCdxxyRzFMXTTJn9WTFtea/vFRG5jRZcljaidnIJE1M5rDSyxWQgvjyVT2V66hgMaaWoOTtxM9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFYHNZzwOHkEq8nsDZdIz1h5pD2dwJzLNbnpYtmgyC8=;
 b=FSYj6nPjHObopcYML7SFvTBpFU9EJXhcstuWrYlJd6Dlt0jif4XHS6s04bWPyiDCsevj9A///AqAvDj4Po+di432dCsnui237I+xj6jLk6i+RhpDbm2auulB5uw3n731d2CDg5+PChNzhRYj1pMunZ3p2YfGBIo8f5BqXT8SqGDdwTV3sT1+6TD78Qw8u47wEvE5f97WxZLZ1SWprQ2KMZoQNKXPH7BYkLkY35NmIlsXuzWIIONFUYR4aspr/PWARCTdZjYC5QQRfQ6OfrmGawdzvlYEXb89Pg64eQN1l7eV9Eox2s/nQDVZ5HAdC3kyRRhLidSsDzsRWmnenEGIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d05185f5-7ef3-4a76-60d1-0db38041baae@suse.com>
Date: Tue, 14 Dec 2021 16:10:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
 <YbizA1adGRRIlcTv@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YbizA1adGRRIlcTv@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0188.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f389b7b-b698-4c3e-128c-08d9bf13dedf
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2701:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27012C7FD0B42FF5300A444FB3759@VI1PR0402MB2701.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jpwFdrUN/tla1Ntt1MOlghpmlYDDi3mBTtgJSCI204LQocM+Hk60rz9lnbn62dcCV3YQkLWvZPb2NHB7GwHyd9jJ8V55NHgud3oSLMgkXHVzfoKFiELiUf3ubSLyOjO419V6EnkDdEkM/42drFjqcxVXZOqjlFnDn3ynUHpfaAngbqnVu8uCo7q9wXPFLybUd++tg82scOqtEj3MH+Z4wVeCAAXpAASsXpcIn3pCo+Y+1/aqBDmdhpm2pU069cB1I1L4PFTFAe3aAzLhXqpiu5u1fa5dMz8Pi/y3Lw+1HT8ebR9uuQziqG1u7Ml5RPZjTozbTYNCAdFUFjskKPMxgeXq4c1vPS9M6VdAqTsPfJHm3SUdbws/IDkVqpHtTThp8Lh5mc2V8SZegkl26ilWb5qRwo715brXXVBVbX61KdvlNcwGOtS2Nv42VPllILQTDZbNz3FIDkhZIdm4Mq2BLtEBiufGjxnc1O1JuTQ6ag8K3NHstK+dt6iUtsNXQ0C0tLj0rSsMc77b2eT7Vs6KVAKj+0Yw9UuDPwmxjWj5OmdhN2k5be1Qs/++SmqnVYeEqMILwMMGOGZcZzJHd9taMjyKrnLny9mfAOeqv3Yli9TN9pmfFyU9SMY4kDjnHk2eVo3qYxPeobWmkDx7cD2Znj+u2jsRjDojyi6Qw6ZvJyKL6pEfiSV3XEBMke+luUtEIYvP/igIRxsQM0dKulKXqEnvwzyhRlTzVNBj3TceA94qqciFuQFI7JwsfuVv4ky+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(54906003)(6916009)(31696002)(2616005)(508600001)(186003)(6666004)(8676002)(316002)(4326008)(8936002)(5660300002)(66476007)(53546011)(6506007)(6486002)(66556008)(26005)(36756003)(86362001)(31686004)(66946007)(6512007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HwGZdfUZyx1sP8wpOMTny43ZWZq15xXaiNGR6YFcGZdlAhe3YwNO9rBdcwtc?=
 =?us-ascii?Q?7i0EC8wLeyNinfKN0rpOb/OS53nDnj0SIHbk9ipzRe5WXf2VIubc0RTaQ/xo?=
 =?us-ascii?Q?qlHUe9D5zbSJl5fhq6u7F4H2FxfeSfzgcgAv4Sg8DlZSoU72urL4WRIYUcyW?=
 =?us-ascii?Q?IFwCxdT9ydG8JKaz2qLdnW8ivb0Uh/nAuK/KOnaLJp5w8ffor/oq+jHf9yXC?=
 =?us-ascii?Q?X68iaMRedbK6Ep45GCcEs2pkCsC6UTDpz0t+WZkEPGBEfNRpSi3k9wNZDzMq?=
 =?us-ascii?Q?xJ1kz0Ta96o1Duth2egn/R7HUds2afmzRVfns3GrvyrZ1qrb2I/c4zJAL2wD?=
 =?us-ascii?Q?qV6g5ILQ2Km3PJfYAlfIrhkyou9b5YPaFI746xCtXdXqmja43MU5ijVjrD7T?=
 =?us-ascii?Q?BYIh7P3wea3684Z7X4Y0og0ifsLTIqVKyn9X9V4/27pnRMoAfpzUum+Mp1dQ?=
 =?us-ascii?Q?Cr5FfKe4WFoMOH05jFLEQaaAQhypIG2q1ezBCDp0eFRbRvENjQqxz0ZmrGR8?=
 =?us-ascii?Q?l7L40b0xodenHOMN7EPihGefkJ+KG5CmV2/FbH2KTFAbXkhURkLfLuIsyLCr?=
 =?us-ascii?Q?4ACK4i5b6Zbz8tk5pAUl8+dE0b4fbP8HNt7sVulZuArsWl4QlO0ODsInzYmI?=
 =?us-ascii?Q?FSXUo1Oc8F1RhmUVAxhP7oG4IaLNcxTEaIB6HkZAm04bqmlWM6xo0SQcEGAC?=
 =?us-ascii?Q?kXLtKfCFQ7Y+lVrSVS8iSk9rJ4BaDHolnPqlLhml/HAb4eAzRcISO8kpM3nA?=
 =?us-ascii?Q?xyOYUy11VnzEh6FrRVwUeB9qIKCNFD7F3dMqAlazWJWocpZd3MGN6FLEvPdW?=
 =?us-ascii?Q?jylWfrBPJaNdn+bepP8ndmRJ0k2Ymc+LxFw3xLdNht9b+rvVKrqyTJEElwlk?=
 =?us-ascii?Q?gebbooY9+csMWU5Qj7Wibd3P7xFOnEbluC9NXjiPLd5lwzhAXth4X9Tx4mvH?=
 =?us-ascii?Q?1UrcgfwF/zHFVKEjJUM/+TpWNBbqm0wUgHUya+dv5+LeT/OOn1Th41twcnPa?=
 =?us-ascii?Q?mChiJfimYMFZygQLTWYmU29F3kHbjx+rCl8Vpnt9Q0AI/fDHhESDG0vnR/eP?=
 =?us-ascii?Q?CFcQ3kSYnX5p+zJRhiiRAawN7lax5J2xvYhldnKDcEQXqVbjb2Yf4PVbXsDR?=
 =?us-ascii?Q?Q7IL4iMNANsIME0bJShXr4bIeKzM29Q/9pqVwFiRZ41d0XFTsJ/ZRpRoEYMB?=
 =?us-ascii?Q?PIFMsN1GKFMBZhU0rptcjme6dEfHqiikqgqyj50YWt4mVEXoCTQWJ6LG9ks1?=
 =?us-ascii?Q?pIUJlj55XXQTMjZLZ7D5ZV2VDhEQATwf26xGN38PeK/t9IAbrvWvcUKO+XX/?=
 =?us-ascii?Q?Sys/Jo8qbe7seBVVw91yOQNbGYqs+uD+8buZKJrb9IseoXtbCteP2LXIH+AJ?=
 =?us-ascii?Q?DIxX2i83yhsRSa5iCeZmxVobQXayBSUSLCcN0CTdwWuknZ91jFRA16W79tiD?=
 =?us-ascii?Q?dRS1Pnxpt+qX0sDREe8rYlfZZ26rvGAn9Z4caPOIVLfJ49uJ4majSY3GCnfP?=
 =?us-ascii?Q?POW61vYJ3YVJSGQ+m/VICZIwv0ymuBp0KH45AVRr2iiJEGOGD6poxb6T83Mu?=
 =?us-ascii?Q?GEVw0wxKC3+C9GqKQ1bdjNq7afoYw8J9lIeyBaYT2b/KnqTK1y61zDsirhKb?=
 =?us-ascii?Q?fuJrktDCKrP3rFrLy2CuHH4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f389b7b-b698-4c3e-128c-08d9bf13dedf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 15:10:31.5100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0Ejz4FkXTitiVLQLI2BDNoi4DxnjjAwMAGIIb8Us1twzV7XelsH13ebaotkRuOG5vdd4bUav7ZN4wMnuzGSYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2701

On 14.12.2021 16:06, Roger Pau Monn=C3=A9 wrote:
> Forgot to comment.
>=20
> On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> @@ -238,7 +238,7 @@ int amd_iommu_alloc_root(struct domain *
>> =20
>>      if ( unlikely(!hd->arch.amd.root_table) )
>>      {
>> -        hd->arch.amd.root_table =3D iommu_alloc_pgtable(d);
>> +        hd->arch.amd.root_table =3D iommu_alloc_pgtable(d, 0);
>=20
> So root tables don't get markers setup...
>=20
>=20
>>          if ( !hd->arch.amd.root_table )
>>              return -ENOMEM;
>>      }
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -297,7 +297,7 @@ static uint64_t addr_to_dma_page_maddr(s
>>              goto out;
>> =20
>>          pte_maddr =3D level;
>> -        if ( !(pg =3D iommu_alloc_pgtable(domain)) )
>> +        if ( !(pg =3D iommu_alloc_pgtable(domain, 0)) )
>=20
> ...likewise here.

Yes. Plus quarantine domain's page tables also don't. Neither root
tables nor quarantine domain's are ever eligible for re-coalescing,
so there's no point having markers there.

Jan


