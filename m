Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E81A53F847
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 10:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343030.568167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyUgK-0002Vm-Tz; Tue, 07 Jun 2022 08:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343030.568167; Tue, 07 Jun 2022 08:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyUgK-0002Su-Qr; Tue, 07 Jun 2022 08:35:20 +0000
Received: by outflank-mailman (input) for mailman id 343030;
 Tue, 07 Jun 2022 08:35:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyUgI-0002So-Ei
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 08:35:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1cadc15-e63c-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 10:35:16 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-9fe0DDkEMF6gxwO0-hIw9w-1; Tue, 07 Jun 2022 10:35:15 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6242.eurprd04.prod.outlook.com (2603:10a6:208:147::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 08:35:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 08:35:14 +0000
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
X-Inumbo-ID: c1cadc15-e63c-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654590916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iaEelIFpJ0H8LkmQxGJXlUvQrdaB0uJTBaA3rewwCMM=;
	b=Pg0Y7AxNWJN9V9WbIYnQb3195WNZcudoccm3vAjvVSwQb6G+CSOMuU1Nvt0IAPmzxGtk/k
	wEgZLoBMNSP3LJaoR7hPtnade21uwHI8SRVEvZ+Bbcwm2bnhBMfaWxpxGDKi/Aqj6QVa2v
	96yKJQw+abLrJ49tPmXC2ZI/px/suF0=
X-MC-Unique: 9fe0DDkEMF6gxwO0-hIw9w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPr+/XbvzXnDA7IltLtukzIlYbJBHJiDOHA8z6WLO7/1gDHJqkO4XDbkiXaOYcq+lJaHBJ6fTnsx6UgcFKWhO/dYVNufsb/7TC3vMFnl+GnAxrxk910jHY1pdgnWzylkvNoFsTqrf8gelLiluwIHSkMIhE7b4rbTVNi8yItHmv4d4g5cvGGx65a5XRwRIM1T07mPDu//u/94vGWcvpxz1NroXBt9setnAo99BMkjU9Dt1Z0BvW23yDABa/idCzhD452G+fLljsBlxS/QGpHqae8eSLBATIxzlZjjhCec/5SW1sikzX13jxr2e+0l7MczUPtC8zDij3/jLVlhA/vd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1EPj90kGl9tpAxjS29XufcEzd/5q0uJ3GMdf1z9HQw=;
 b=OJyG67HHrE3k7IAU7BlAAXEaVCxxe+8upjs04Ducu0L/gaBZIN+0EBfs4gxAkLjkXhMmJ4nT8c43dYKI+/m2bALl0H2PccJewIR0FZ2XxLDXbposuQQgaBBapEMLb3IT79xGeAJq6ZsecLPvSt8O9i8Ga1FxTBHivLuWs2v6DhgHT0yVOZZcTKTPAgem8baXw4wstHhedXto/dHNUIL8cP3iANNVDbg8ajL9YnxRo9BI+uHZKRkYgq3xY4iC0N/8lKTEG23/APGXoZVDAJ+7XPAEpDsCMLfnsFwWgK5RVG3j+es+x6J8Uz9qmR/EVCFnn+OBiiNGDq6KOMixZWixNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1EPj90kGl9tpAxjS29XufcEzd/5q0uJ3GMdf1z9HQw=;
 b=AwJNbAdipaSSm/R+4GFRr0Tk/BLSFOc7Jqnr5e0zio1VeZgsRJAgldYTyd87fnmXDHG/KvcmMC3Qvh71NpzZvFYgoFQ56JOk3UalxWmfizCYBrMGJsIw7PwM7XCvftRDqTARgBcxRtotrLQ0zgLqP+bL61gwjirsQ+3LcVvKHp6ppCx29ykxGnHH8RP9FD+JMGbfIBo1ysIUd3QGaLAMLy9tdPlWBEdRQotXBmKVY3cX5NohZLYnsAIvWMXjPvIkAlYC2NiI2uClo5wM4EIBl0wVX24ge12hecQ/UR9JDDyv3FActkB4LgHjjstACxRZEpePQFU3b0ny44nWSjLJmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f6638b64-ee36-0959-1ab4-e4ab2f55980b@suse.com>
Date: Tue, 7 Jun 2022 10:35:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RFC 3/6] x86/ioapic: RTE modifications must use
 ioapic_write_entry
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <20220421132114.35118-4-roger.pau@citrix.com>
 <febbff78-6a2d-f2fb-d8ea-a15f97a3abf4@suse.com>
 <YpoiPRETkjBskr1d@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpoiPRETkjBskr1d@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93cc85e9-9619-4774-a374-08da4860a487
X-MS-TrafficTypeDiagnostic: AM0PR04MB6242:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6242A977D949E6FFE0359C50B3A59@AM0PR04MB6242.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+W4D4rwjUNj77Hbx35w6AdzSrGC0qKNuFGj7OreBn6pj9/RjZdtxUUOAsCrio2bkY+kb/SPCB8vuQVggabghwOjrgYgXYxDk61ZLKAp14AEnMsrc8BXf2BPKncL7RsC8gXtaZarsMmul9vjiq/U3bAMrnjgE4aYd8rFAS+ayHJkPdfngs07Iostre8ocoiMgSPYLMJD5dS5TuaGB0/HazPILH1DHR+rGg01QK30anr7gVMAIhvl8bCeJt0yS5L7/FK1ZoRlBTIPQfgsyCyycKRMVq/WItFLlsYCjp2GOaObA01TjkXaZBI1HFTnoHgBVkEN3ZZGZt6x+sCNe2CoUKwNvQjeKeaog95Br9AuSULwitodhBmXe7JWBdHEi4gr9JdxFXzelJIXgGLevoRQrPlpr7+46eE3wcF3SCmzam5bIINuR6indcGqJ+HN4W23kYEHNFQFf6/lrLVVXkbq1bpAJRRQEQAaoHLbA8iJIisPHJsLQtMSmp1k2I1k91sgE0dxXCEGzV0+oru7U/W9RwvjHiW7wSA3gqUJgipas+7/ZAfhObno/SibGTvSjaGiF+S9u9ScCF8kToIOB94ecyk+VxP5t1l/bHmG2FM/XPMhOBPuCpm6pSNqcPSz5w2UHcR3BfmfioYTqtWV25MRdi19p/7J46kw4AkpTb67PtlgpCQIPcq4nb98XSFX3jAT5lIPcz8dWbM+VrjYFYtLbh6teOHKbTh/ddMGWcBOY2KZ3/82xzhLyriOkrr2d9/Qz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(6506007)(66556008)(53546011)(4326008)(66946007)(508600001)(86362001)(186003)(6486002)(2616005)(8676002)(2906002)(31696002)(36756003)(66476007)(38100700002)(31686004)(6916009)(54906003)(8936002)(26005)(6512007)(316002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P2y9Vlj64NySdYWW/c+JsR+Kh9hdujcr5t/qdzX/F6Jg0y5fAoI5mvya/264?=
 =?us-ascii?Q?/btVCJR4liB2ucNPU6gwmaJf5DLJk12FVSn9UKeCIvGmOMTnC0+aoXngMsFJ?=
 =?us-ascii?Q?Cufe+p+QW1R8hsFXHnoGQM8G+UYUqsVyPQu7851TzjrHexpvNT7+EQw493qk?=
 =?us-ascii?Q?SNXNcBR5kK2L6SeEuSx4U+cjWvJ4jbgtn+Nqn8Jb1VNeR+TrHXV1TgXZe7/b?=
 =?us-ascii?Q?xVuAnQPg+z5e6hZFtQ3G2GRcSZdlBIJ7NI+uUtQjlQkDpsvA+r+Bu1BkDuvM?=
 =?us-ascii?Q?prILbpzU+jDxG6cAOGZtHfTBZQLzQY6lhexUeUZPsbvGGyGsMlyA1eg4AJhe?=
 =?us-ascii?Q?9eE6UP9IJfKbwlKNiSoACuCp1UwbzoTZ+B516IyxNtqLdq862Q08WaVnYxli?=
 =?us-ascii?Q?bUl11XAKudGwXBRnN4ppTFqbMM3DfpReW7BqfBH852aRzXA7Hgcsn7DNQd+U?=
 =?us-ascii?Q?vkp0vO5/LdfySxOTPnz4gjmaABpm5sGBKeROAXFB4/rdY8Z9FGA6olhC0875?=
 =?us-ascii?Q?sVvaboIvgRr9QxyiyhHU6kugw4zGPWpKYd5nThWxEusSmTzqPOH0+3FM6n8f?=
 =?us-ascii?Q?s8RPkjIMH8jfq3rg7Axh5ZHsq7u7jAS0g1frY9ChHS+df9wZlDfPOp3ThQjS?=
 =?us-ascii?Q?s2BID+FjEmq41Jk77NSbvkeHoWhG6AW640iw+PMsafmiyMP38rEXjkZUH66t?=
 =?us-ascii?Q?L824a4Ajb2X+3CuIKy8WXipfmxPrT1SW6KbU8Qn3ZIvJN7mdH8o6juOYaJP6?=
 =?us-ascii?Q?awdgtvtyOhNASSaQttx4PywVTrY7PO55zau0EWMxc8UMppXczPZWAf39LNI8?=
 =?us-ascii?Q?K5guohlCx+4M2HrjTD6tnbC/QrnRWcqMhrK4hunWb9cbjwBN0g0bFXvbZyoV?=
 =?us-ascii?Q?Ztpet5oiAXO4v9YkMmCNMMBgPuHJoeaHXRUUa6JOMCWTbUI4BU0j/jgiaRgM?=
 =?us-ascii?Q?XnUXGmJXgZVLHzxZtDw8c3vjqLGbsrBgT+axtIXeCGLJERUBKfM6BRFyRpnN?=
 =?us-ascii?Q?a81hCdfxWW65B2RqPca5MpgwyrZyRL/j9PG7aPAvqNbjNKtVdP/XdmxyOBsu?=
 =?us-ascii?Q?fKddQwjqGIC80vUfiEf+1Wkce7rJyOaeqSrxLcwnqp74jP7QiIQMck3QIQQP?=
 =?us-ascii?Q?XxVz1jACBC8bHNAedauKQlJWq69ag1SdszcrO9oF5QBc6kzrWL7nesHbo+tD?=
 =?us-ascii?Q?DjNH+FTt4/O0H9sRx+i7+dlq/Fdj/CHcNPiExHCJkSwV5XlBG0guX8Uzcqb+?=
 =?us-ascii?Q?S8kMI/M4b3T2OB++bH1SJi8HHagMYE+mwfY3amRKkRklE/ZZMoHgD9ufd3wm?=
 =?us-ascii?Q?yft3sXVsO775piQo9L63h5fmUb5/b+cLwNCVnhQR5RIglRF3hFrfpxdYbOpJ?=
 =?us-ascii?Q?BNR4qLJMW2tQ3Y+n6nc4KLlKBLhXn8qrGrWcG6UBvPBXqgR0xm981DQkll4c?=
 =?us-ascii?Q?GliE/szUql+lzGPa6EcnASiC4p7Mt4sLeOTUbwNLiORdOauaKEZft7n6s0SA?=
 =?us-ascii?Q?fb6J/lDqe0d1Bdq5QCIJwimF4TSgs+3pPBjyIaXcq02ol86DVnqsMKYoyKc5?=
 =?us-ascii?Q?69Pm/Ha7v8vyhnGRAa6xQPl0Oa9E1dl9IG+9mZF7CJ3YLa3kRYY36WXlI2fM?=
 =?us-ascii?Q?StWCGC829q/8kyrsFe4L8FSsr0A7VlxdalPRoXPCNkwHPTOTQhRHG84X7NMk?=
 =?us-ascii?Q?AMw77yD1Hv+41OSTg4cc395amCpLipsbzT7SPly39ocl1IVhpadF08Da7p3h?=
 =?us-ascii?Q?oVzusDL51g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cc85e9-9619-4774-a374-08da4860a487
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 08:35:14.1853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLNk8GekFVkzZ5lPIYe+9vzhm/HOigKk3tCDRchQ3UWngQ4aQnFgdLosMQwOvdmpiFanUU6tPfNovyr3Oajz9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6242

On 03.06.2022 17:01, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jun 03, 2022 at 03:34:33PM +0200, Jan Beulich wrote:
>> On 21.04.2022 15:21, Roger Pau Monne wrote:
>>> Do not allow to write to RTE registers using io_apic_write and instead
>>> require changes to RTE to be performed using ioapic_write_entry.
>>
>> Hmm, this doubles the number of MMIO access in affected code fragments.
>=20
> But it does allow to simplify the IOMMU side quite a lot by no longer
> having to update the IRTE using two different calls.  I'm quite sure
> it saves quite some accesses to the IOMMU RTE in the following
> patches.

Right. You may want to mention upsides and downsides (and the ultimate
balance) in the description.

>>> --- a/xen/arch/x86/include/asm/io_apic.h
>>> +++ b/xen/arch/x86/include/asm/io_apic.h
>>> @@ -161,22 +161,11 @@ static inline void __io_apic_write(unsigned int a=
pic, unsigned int reg, unsigned
>>> =20
>>>  static inline void io_apic_write(unsigned int apic, unsigned int reg, =
unsigned int value)
>>>  {
>>> -    if ( ioapic_reg_remapped(reg) )
>>> -        return iommu_update_ire_from_apic(apic, reg, value);
>>> +    /* RTE writes must use ioapic_write_entry. */
>>> +    BUG_ON(reg >=3D 0x10);
>>>      __io_apic_write(apic, reg, value);
>>>  }
>>> =20
>>> -/*
>>> - * Re-write a value: to be used for read-modify-write
>>> - * cycles where the read already set up the index register.
>>> - */
>>> -static inline void io_apic_modify(unsigned int apic, unsigned int reg,=
 unsigned int value)
>>> -{
>>> -    if ( ioapic_reg_remapped(reg) )
>>> -        return iommu_update_ire_from_apic(apic, reg, value);
>>> -    *(IO_APIC_BASE(apic) + 4) =3D value;
>>> -}
>>
>> While the last caller goes away, I don't think this strictly needs to
>> be dropped (but could just gain a BUG_ON() like you do a few lines up)?
>=20
> Hm, could do, but it won't be suitable to be used to modify RTEs
> anymore, and given that was it's only usage I didn't see much value
> for leaving it around.

I could see room for use of it elsewhere, e.g. setup_ioapic_ids_from_mpc(),
io_apic_get_unique_id() (albeit read and write may be a little far apart in
both of them) or ioapic_resume(). Otoh one may argue its benefit is
marginal, so with some extra justification I could also see the function go
away at this occasion.

Jan


