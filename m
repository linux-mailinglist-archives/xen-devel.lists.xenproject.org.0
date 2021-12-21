Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 045F447BB55
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 08:53:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250145.430781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzZwt-0002uN-Ok; Tue, 21 Dec 2021 07:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250145.430781; Tue, 21 Dec 2021 07:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzZwt-0002rq-LD; Tue, 21 Dec 2021 07:52:39 +0000
Received: by outflank-mailman (input) for mailman id 250145;
 Tue, 21 Dec 2021 07:52:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzZws-0002rk-7U
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 07:52:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6a87983-6232-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 08:52:37 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-NUO1LPJ5Phi8rrmVk2wfTA-1; Tue, 21 Dec 2021 08:52:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4607.eurprd04.prod.outlook.com (2603:10a6:803:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Tue, 21 Dec
 2021 07:52:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 07:52:33 +0000
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
X-Inumbo-ID: f6a87983-6232-11ec-8d39-b1a4ed000e3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640073156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6iY/U+eMABdBoU+mmg32NgkN2+1J/QmjuQwr1r5zNM=;
	b=i5DedrT8g5aZD1B33QvDYhoUuNdc3jdvwRhVWvLNdWSHCVhH9Ugxt83wMXRZ6AslNaN1eu
	Pf42+BFaQC3TXzxBQuEgvsyQSATfzmiUDfrarHjX9rvATa0YNaIBV3Lwv4/gbUqXdymBxk
	x9w8lrdUtoPia/gSBOMfxCtel8t2DAg=
X-MC-Unique: NUO1LPJ5Phi8rrmVk2wfTA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQE2x6RMjRJMU07SvqCYXpKS3obo1KgZAtiSzuYcr79LJi9XmrMUz1pXa7aKLdiC0lCIPnsn5IKJntW2t5ESFxNBImZMeMwv9BT3z3B+geyjNVZWoW75IpwlkEjydXLlqdDJAIzdJi7QPdoA+T7fk4Ubla1a/Py07Dj+ubGUVI3ZOHxd0W00HkSO90O3biRjKgAR8Qm6E/TlxSHT9Oa5M3v4BQHbtaAU0fHehkbLXR3QVcvP3LkUdi2nIi/HEmDqo5ZUCdJzDnY3zDKXbP4hx9JwgJxXANF6moSpf3IT1Ko3H/Ft899e1dUC4Kx9Pe2ovfNkwleD3/fLUXnX0HHKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzGtaXMffeM96mOfrvw56JTznPM/wBt/181aCM3NtHQ=;
 b=dTHnAdoj1yfxdRi45XtqtrrwIAsruBa8TE5z+N3S5vTZnzasslZmB3dauMFxYbwqvsFHMgK++7DUvYrt4nc2EFnMmrT7lLDmGwq+0VRevTPPCSY4ytdigbPsYyxMHhRbLj2GOafq0gCnfTcpy+w/K2BnKrG2nKQK+N6ZMUhfri91DLPEc47AbmV4Y4SjHQmxsAWQXMPbChSw7j0OEqQxteEHJnKaFItwUKkiozjo60dhzLCAS1Pqh6ybzaG77XCU5xB83rPiAZy2oZGv9XENkb+nKsOz4GeXkywEjCveFeu1yJagXFbOZOV9wuRXbX0d4x8jo3OqLIaBHvzFDJ5shg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c814cb4e-7e50-c03a-5c65-89a7aeea4f98@suse.com>
Date: Tue, 21 Dec 2021 08:52:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/5] SVM: sync VM-exit perf counters with known VM-exit
 reasons
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
 <c94bc336-fdee-43af-540e-06e0904d8db7@suse.com>
 <60deae51-6ccd-dd90-869a-db6099e21002@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <60deae51-6ccd-dd90-869a-db6099e21002@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0001.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71dd8d1d-0694-43a8-2165-08d9c456d8bf
X-MS-TrafficTypeDiagnostic: VI1PR04MB4607:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46078E4DD670A8D3CD313256B37C9@VI1PR04MB4607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BDZo+cjkycLOqf/VpPKKrKMAwMHCOlXaIa949Ef5GeRF0wiHU5bEBrAZnn6RJz9WSx+SX8qgGqJjB3zc7DvGUMyB6Qk+ZWWXeW5nHb3MS44yGVcSE79ElllwSWqBGVz3gAkzSKRXo/yR7xv5VYy+LDNgkBROmH7GgLok2dZHd0iDSP6+EzBkBay/+mJ7uNfSF+oQaakOftVPIEg0asZe4FAwS98h34K76x3MTnT9Whdkr00PLTRxXK73vDDfJ8vn5YqB01v+NBoDEwd3KnRUXonZU9I+9Xg1DqQgKm45zj2ruymIj7MLK5RdLj2brRynbNswqFZfrmzV8jaTZR5rVa+BP9i1FOR+e8jamo3Jd0GFIZNjC911dLgzHPWKHbQ2rNZfHe8szRhc1/M6THOoBEbwPZr8XG//joqb63SYWyGSN2n89m3TiZJcN+J/Bioc4kU6ZBcYYb1Cf+wZghn1e56fWsLnKyz6VsldeTL4GJ8Q+/WFf+fo1Zra4cloxTv1wx/4JhP6P4b6CrMEol0ljid89OHdrZDyacsgTM55It4Ka7qFzQP8zDg/VkQVM+wbXG3s58piDVeR+XCPdioaCjZ4vuMmmnrsCn3dUaU1pGaH5dSTGj5X+f6XDzaINVI+zacvxOV2TfAvgHz2//SPki8gtWWuDPxLSDpLBzDOM53yBtKWmvS2c/ZTdiPlCzHTTR7LelGP9auvO5T3xjehdi4l7UeRZJKM2FSCkL0BogT9hBSeJuEBIguJJdW24VpK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(31696002)(8936002)(26005)(186003)(5660300002)(2616005)(6486002)(8676002)(53546011)(6506007)(6512007)(110136005)(2906002)(316002)(66556008)(54906003)(4326008)(36756003)(66476007)(38100700002)(31686004)(86362001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J93dBfRuSWU747gMYzuqE+RkIMh+yDK94ow+ReLFk8wA7SvgAb6fLVyVXlv4?=
 =?us-ascii?Q?vSWzG5RP6g3x5NmeGDmBetGtUThEQQJBBaOhGGRZ5FFqQVmVPHg/EScGwudz?=
 =?us-ascii?Q?sP7texpvL7Rda5dMx4fdZ6br2RNLO4nqMO4eRxBKQSHFXEiDuh/ct9t/ELDg?=
 =?us-ascii?Q?Tq/jlJwIWGow3AUmPBVl35Oo5VQqthxu1aebM7F9uxTLv2h8L/LPQ2/cMTFk?=
 =?us-ascii?Q?0iWreHV2LLmw1rwLHZybzlOzaxEgMGy6lEsOy53Is/VrqyCpug1cAXWtxY0G?=
 =?us-ascii?Q?cKWLcRZ+r7FU/FN6AwatyVnFGMGPVqsjFyS30f/5rRXwP7xMgggHourD6kNU?=
 =?us-ascii?Q?tcFaty153N6/SE8s2nSvKMjuffAoZ8RbSglN+jseOwwIhxtLhZAyoJ4HOPVb?=
 =?us-ascii?Q?ZNcJY5rLMGWUySMUsmwHwG6Evd60Ep84vbQKZit4XNREJVni2BtidmekxckL?=
 =?us-ascii?Q?TeepwDNfpPwRge308X3xL28cULAUIjqJKl8QPoZzRiAmtKs8EXCSiV+sFtEf?=
 =?us-ascii?Q?bwegfHFsNqpWpaSeGJSWmA0KjFNwQE1rcj41lg8Hfx3W2iBTmoP8eP4Sm48a?=
 =?us-ascii?Q?Jh/+Y0Y987LX5VVvMIlEo42Ds6s2H79jz79hmszQwRAQASieaYu2Bquda3pm?=
 =?us-ascii?Q?UabpuwLACL+uN5SP9iyGLfpTil9lIbL1BmXUVOk3/KpQpGV2M1qmSHM57zox?=
 =?us-ascii?Q?Hjl0+ClTYAnruGNRAnEoJQ+3FVL8/TGoH6/pf4vkoN1hH4E5l/G5ZXBh+IXG?=
 =?us-ascii?Q?LZrWvpJnHiilF3PgiPjOHhCt1rtA08W5jd50sFpSFJxo4VV+rCAhqqgnhEzg?=
 =?us-ascii?Q?F3q6vP4TKvxY/U9WC84lD4B7Cbyy9+xjIUo90UtgWdbnGstGRvarLKG9l7C/?=
 =?us-ascii?Q?Iy4koE+ZKmUqDJ2eRxM7w8yFsqKMTTbJXFSQ7n4pDLMU8HWXksrl0eJE6Qvx?=
 =?us-ascii?Q?gWca7846vgYXRfulLkWPPnZKsF3owd7w06HCV+AfbeSyhs3Ys4TQDZvEVi7+?=
 =?us-ascii?Q?I58fAa/KCZUdO6nRVU+O3w4Lh9Z3Rjh+WldFFXTKzmB7EAsnhSyLMbGFX+ng?=
 =?us-ascii?Q?Mfz4c005WDkFxO9FxkvGu2+8uKg4rS0sGoyhShE4tkp5KPizF8Jzf6aR9qwo?=
 =?us-ascii?Q?wu1BWfkUI6L6GHC1G2tjda7LvucEd48fB36kzEMa/uiqe6/4g6d0YlazB9Xx?=
 =?us-ascii?Q?f3zV+uJw86vxzC0YHPwiPz6svWqTcw/1j4P4XJOeAJTIFXXFXXEjRg+CgzYT?=
 =?us-ascii?Q?+qpX018HGqD1wcecTh+1YblWRjTiCtNQiCtVZK2yuDemi9iiuiTAaEnGz1Ns?=
 =?us-ascii?Q?KAJ1RIK8kdJ1Y7jKJYFst/QptsOdy2F4rz5iFGm2B4VTSk37z6B6Tt8qonhr?=
 =?us-ascii?Q?18m6mcar5dCnUrCukh7z1sFvGGmEYcA7lp1M5biUbdmR4R4sjiXytb2NpYiS?=
 =?us-ascii?Q?zFYuzM/B3qdfCT4BusJxrKufKPFHD/WC3JDiYuKozMeELlvF+uTzXNc0OsrH?=
 =?us-ascii?Q?MxCV0hFZJEyATa2l0TNx0HRpx9HOS/FB4qvSRkWcMG8RpnwVYyWueSRu4v+U?=
 =?us-ascii?Q?2NMuzk7xN5SRKls3KSM9Q55LXrMg7dkhtWK4ph/ZtRpBf1c4HbjZRFqO3tXZ?=
 =?us-ascii?Q?lWliPh6huNTAdSHnyOlpErU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71dd8d1d-0694-43a8-2165-08d9c456d8bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 07:52:33.3561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bqOWYIoLurqLN3q/qV7gPY2BwcwWvDgrKhTuLS9H0h7ws28BuXh5WsdIm2PJKrx7T8QX/T8RI0Z6fTOlNeH4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4607

On 17.12.2021 16:02, Andrew Cooper wrote:
> On 03/12/2021 12:06, Jan Beulich wrote:
>> This has gone out of sync over time, resulting in NPF and XSETBV exits
>> incrementing the same counter. Introduce a simplistic mechanism to
>> hopefully keep things in better sync going forward.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Given their large (and growing) number, I wonder whether we shouldn't
>> fold "SVMexits" and "vmexits". They can't both be active at the same
>> time.
>=20
> Oh yeah - that's just silly having them split like this, especially as
> there's no associated element name.

Okay, will do. Albeit I was thinking to add naming to xenperf ...

>> --- a/xen/include/asm-x86/perfc_defn.h
>> +++ b/xen/include/asm-x86/perfc_defn.h
>> @@ -11,8 +11,8 @@ PERFCOUNTER_ARRAY(exceptions,
>>  PERFCOUNTER_ARRAY(vmexits,              "vmexits", VMX_PERF_EXIT_REASON=
_SIZE)
>>  PERFCOUNTER_ARRAY(cause_vector,         "cause vector", VMX_PERF_VECTOR=
_SIZE)
>> =20
>> -#define VMEXIT_NPF_PERFC 141
>> -#define SVM_PERF_EXIT_REASON_SIZE (1+141)
>> +#define VMEXIT_NPF_PERFC 143
>> +#define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
>=20
> How does this work in the first place?=C2=A0 perfc_incra() is still passe=
d 1024.

In

    case VMEXIT_NPF:
        perfc_incra(svmexits, VMEXIT_NPF_PERFC);

I don't see any use of 1024. And the earlier blanket

    perfc_incra(svmexits, exit_reason);

doesn't do anything afaict, due to how perfc_incra() works.

> Furthermore, it's already worse than this.
>=20
> 401/402 are AVIC exits, and 403 is an SEV exit.

In which way is this "worse"? We don't support either AVIC or SEV (which
is a shame in particular for the former, but what do you do with vendors
having given up all engagement).

>=C2=A0 We've also gained -2 as "busy" for transient SEV events too.

I'm sorry, I'm not enough up to speed with SEV yet to even vaguely know
what you're referring to here.

Jan


