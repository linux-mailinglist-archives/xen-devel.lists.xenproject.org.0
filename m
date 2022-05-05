Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5651C2B4
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 16:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322183.543412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmcZL-0006eT-Bt; Thu, 05 May 2022 14:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322183.543412; Thu, 05 May 2022 14:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmcZL-0006cX-8t; Thu, 05 May 2022 14:35:03 +0000
Received: by outflank-mailman (input) for mailman id 322183;
 Thu, 05 May 2022 14:35:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmcZJ-0006cR-A9
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 14:35:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ad5fecb-cc80-11ec-a406-831a346695d4;
 Thu, 05 May 2022 16:35:00 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-f7jG_UhcPj-3UlWeVw9IHQ-1; Thu, 05 May 2022 16:34:57 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5399.eurprd04.prod.outlook.com (2603:10a6:20b:9b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 14:34:56 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 14:34:56 +0000
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
X-Inumbo-ID: 8ad5fecb-cc80-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651761299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xk+9P6950bom3ZRgp4thk8t8DeWGZS/JWvU9oUH7jp8=;
	b=Ycq3ncyOmNUbYcuIaag+iX1gv1VaXaNYsGCZK1hB4icUZ0PMUJRObywpV6DbG3ZAHsI5VR
	n/Jqm/GuVxw0c3GJtUbDAQFvEJ1UKYC+sk0+iCig3hK/gjZlNcegSmczRsDGkOULEldo+i
	gcRTucFE/FaYhaNRg/QmwiCqEMUOl4Y=
X-MC-Unique: f7jG_UhcPj-3UlWeVw9IHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvNc9cpanvT/a/YmmuzcD8OdAJIa5Nfaf58Lg/X7a7Nnuo7RwJikUKfJDzb76ntclR+xdR8pSD4K0xBWrRrHlTTYP58O3D2etL/Kd1JLQV37Boo/Xp0eJEZPEb0es2yS2I6arT0skzCvxu/KDTZgbqelzTigZtc5RWuaTaSA+3hfdNwmngF4QfIpB1Vm1Rwe3OTxgLLUFTGnRW4A7kR/l5vixGgA/oLEZywoyKzi5f4fg1G0pHw6QxJAL+hMWkW/YhIWbh0YrtwyvI1ex6Y18wn2XPqBH+fasruTrvpNwRMVzNScRhtE2uqSi+m0VT7V/CZclIZov9cxAaH5cdh5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKvnMLOx6F5zJw3pKTDY0Uhbi7RbOqyNost6ZW7B7JA=;
 b=Ce/Z6aMnf1DB9aMlD/rOtmJpaHmkEFVv/qLtUcDr+Hmz0pGHQ76MvSdJi1N0FbNuRFgkHsErcZjhfxyXzZJqlrtN9jp1zxWZfU/h03fe13pD/NibtweZE3UP3cv2Lfpmn3im6/SsMQc4ZOD5QjtE2HvGGEJDZCWosFd4bAbFEZ60Y+okmk7Nhu0LS8U+YUPwVxhNQEVeFu7yQVsm21y35Fa2RrNjbIySP0FOlOCl6Hh24usib5dXRA3/9psKQHiQ5wmwMrlZb27Y0AqRrIUFBJJkBj9UolXTa4AIWVw1gYztvtDks6Uc4DpwcilfAsAfV/fFrEV8+x+2eGr+9pVb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <efe148e8-df16-f43d-6617-750f2dd058cb@suse.com>
Date: Thu, 5 May 2022 16:34:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 10/21] AMD/IOMMU: allow use of superpage mappings
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <5866e22e-9f31-84ab-1df9-db84aa802944@suse.com>
 <YnPO/B9rzxkYrHkh@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnPO/B9rzxkYrHkh@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0094.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69d6d315-2bef-4e8f-cdba-08da2ea46cb4
X-MS-TrafficTypeDiagnostic: AM6PR04MB5399:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5399B99114FA985D27E8B222B3C29@AM6PR04MB5399.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mErE2Yur2XOpysNdcGOKuRxXbHr+GRVsGSuvVI1ZdYvsv+N/aVkVMaw2Lr2w4sCRiXn+NgSvJ+i+uV41D0jRrJ2Y0rZf0QcvmuCwrPWqRrZHs8AtnPsunMKUPQgzA1+sOhktCC2EUHunCo7QU1GA0gjIZMF/LMLwyhEFRIO/iXrndbnS/RowBNKllMDCaQfazi70JNYFPS208pd0KLt4kh6DcExKs8SnekwcfH2u3TLATQgZTOffH5d8LgWIj8HHiI50SlHSLkf+y4oTkcFoFUvL9gazC58548np1v7IUEFUPqGdIlzq5EU4cKPq3DUAwwCEWtmlPA+v4CLklIq4RHsMVOBjxc1HMdIAGl7dUcTnQceycsiyaooVpnob15ypmZdy0KCykFemgFrLdeq4ehO47jA9BJz0mzlTpKf+tPyC6enf6FyP7KeqfNur8DguGREDaI62fv/HvaBioxlhdlDeFx5lFNwQxsrEvI0iT/zDcjZEa6XptIiHSTioi8OwzEhfNRhjbqv6gRWXd/pbqNXVpx/g6cbM+cND7xswWWg44TzstHHM2Ncna9D4IqefK2BoE8d9fd+cXXcYyk6GR8edIKQ42qn8c2X6bkU4tp/MNCCuUCBRmRgLvsB0Z7pBIXDpg0LpA0dXRDnd7WAFshjzd2C7ivh9t+loFgbclZ2EKRCtcRYjkE/3I3zHgfiZAeKjfH8qTd7WPeUQJ6XIMpbERtw8w3CXT1tN5vvCVAIu3Z8dBZsEvvilU/Yc5ZIY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(8936002)(4326008)(8676002)(66946007)(31696002)(66476007)(86362001)(66556008)(6512007)(26005)(2906002)(6486002)(2616005)(5660300002)(186003)(36756003)(31686004)(6916009)(54906003)(38100700002)(6506007)(508600001)(53546011)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ym1w/a3MTFxDuwYQaHHNViJtdHguG+I4MCpdhCZitRIwG2lwnswqFIpqqoh4?=
 =?us-ascii?Q?7Y/w+0gwUnYMS0uid8V8jwNBUQl48eP87TQWJbxi+OM9C09dhcM/aUb+kPqo?=
 =?us-ascii?Q?9ru8AP77I7i1ec+pghI+5cZjwCqfkyzhiLqElhJWACPqV48Dx3vHH/jxX0fO?=
 =?us-ascii?Q?rBsqaj0unQThh+HY1PCERAZZshuKSvqPlnDifksdWryE+Iss6uIt8lrN0AJs?=
 =?us-ascii?Q?tdLAVHtDcm30DWWmA/yKiws7U83i5oiDuZkC4zd5u7g+IQ3Tz8TLg2ZQS7pb?=
 =?us-ascii?Q?zROghC8joxgH+qg4L1uTABuYljqUi1k9RAkI+cUl4pC3HcrwPh0jAzgKoG3a?=
 =?us-ascii?Q?d8exA6Fmlwv4f2XdJ1VpKgefiBEkq/PHVXKqkKTh7NFlHztMbPtPiqjKQSDe?=
 =?us-ascii?Q?qInqHpeCjJAJa4G/8Vjb8JKRp+t46bDtrcrC9w3YL36qa7ER8oV1QdDae97F?=
 =?us-ascii?Q?4EqSHVMYfrWUsIIrkG6/24Z2cOEw3hR63iV4VUxUPy7wiBJfjlcacaohg8HE?=
 =?us-ascii?Q?7aaJj3SBbUdYGhK27MYz7S6iuiGu1j6Mc5nXdSAclACNAQvVAC8gRyQwOjhk?=
 =?us-ascii?Q?3ITWZG2+eYzk5x3zvmsjT0h5ikOzXkd10gNc1kS+HKBzxVnMaXEJSDcZf9BU?=
 =?us-ascii?Q?unKufRg4ayv7oz/dYk9la8Se+uWg1oYZxkh4VykSNII+FopCFZyDlYKfOazC?=
 =?us-ascii?Q?iMg3mqPlYhqam4gqX6g5OxLLDX8NI6YvjQSfd2ExsPcUOmX3KuJWWW2zBxQH?=
 =?us-ascii?Q?dPuH3ixoXuxoiFYAmy97LmHBCeyJpZvKkhmwwRIhjhtJEAFl7Xqx2nrbbMTo?=
 =?us-ascii?Q?Z5eCR1nHimcd4COLSClty3xSoTHzP0xophyCCMU8WWhSqP8qsMy6FfSpX9Ll?=
 =?us-ascii?Q?O+HAxIWj0xMnO0Uf/ZLGy2LoBHdNnkQOs1WmfnKK83uJzsRW3mS9oX51lVsa?=
 =?us-ascii?Q?OFC3dWfm0/VuFwFpbHPzisBuIaSCY+beSNIt08xaWW4NKnmQbP3nTb4S+0m4?=
 =?us-ascii?Q?j1XiDNX4vYjbEJJICNEbH7bekAWYbY0XDS5c3UeYlFNmDwoGlcgIVXVmj8NE?=
 =?us-ascii?Q?6DtECuJDhgHGMkAFT3pMxoTGjkO6052vH1r5LGoufkeRrEX9GnzEvtLC8Jj1?=
 =?us-ascii?Q?z0yUx2XK/am7KvcTFlRImKAKHeeRvnkBnVj6KRoyO1mg0e/boLiyWdnEsN5H?=
 =?us-ascii?Q?199pEJwTFS+KWzf6Eh/uX8Wvi83r32Q8S5VugyQkAjdj9gnk1H/txfFai9Tt?=
 =?us-ascii?Q?JwuGA7n7gAaV3+5AOGExqnbsFjoIieMqX72xuGmpspHbjRNi5In0PMOA9bGk?=
 =?us-ascii?Q?YaMtFEgbpjc7RQbXKRpRWWkSZ39QCisjixLvd8Exz6sG1EbE4a3jlsIM6RDd?=
 =?us-ascii?Q?MbFNY8rKj8LAqx2ASOsJO2W++1McDMgRyYIJYI/wUocCKq+5OxQGnJubpDxB?=
 =?us-ascii?Q?Q8vD2OXV0Qhy+MFhRjJrCBfcFb0X2JjJspUtQXX7gMd+8l6zCwjH2fy6r/Kh?=
 =?us-ascii?Q?kqnFwv7XDllFyDUFVr+3WfHAu0qhX8/RBOHml9uGH5cXmm4RPIBw6hy39lCW?=
 =?us-ascii?Q?f+pzwy6iiYasKVUau1Fs1xzvqYqu7CY1UVISj8K+YESAWqop+scofKE0oyRD?=
 =?us-ascii?Q?R+m6v2lfBkd1f64/XETcO0F+onhp1sWVSVyylf7qZYg6mxT1TMXeME98M0JP?=
 =?us-ascii?Q?LYyzXRMgU3UzcWZv22jqfDtnc8mfqo3oPe9omzFIimQIPJAZNyTQtNNjmOsw?=
 =?us-ascii?Q?6kb9L7/7fA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d6d315-2bef-4e8f-cdba-08da2ea46cb4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 14:34:56.0742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDeiNFCgZBEMqw1gOgQTpG8G85vCR40PlOxj/pYtFDdKG2nyYxG0dRuh1lT/41gi5A2EBUW7RyeH/eQ91wKhwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5399

On 05.05.2022 15:19, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:38:06AM +0200, Jan Beulich wrote:
>> No separate feature flags exist which would control availability of
>> these; the only restriction is HATS (establishing the maximum number of
>> page table levels in general), and even that has a lower bound of 4.
>> Thus we can unconditionally announce 2M, 1G, and 512G mappings. (Via
>> non-default page sizes the implementation in principle permits arbitrary
>> size mappings, but these require multiple identical leaf PTEs to be
>> written, which isn't all that different from having to write multiple
>> consecutive PTEs with increasing frame numbers. IMO that's therefore
>> beneficial only on hardware where suitable TLBs exist; I'm unaware of
>> such hardware.)
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> ---
>> I'm not fully sure about allowing 512G mappings: The scheduling-for-
>> freeing of intermediate page tables would take quite a while when
>> replacing a tree of 4k mappings by a single 512G one. Yet then again
>> there's no present code path via which 512G chunks of memory could be
>> allocated (and hence mapped) anyway, so this would only benefit huge
>> systems where 512 1G mappings could be re-coalesced (once suitable code
>> is in place) into a single L4 entry. And re-coalescing wouldn't result
>> in scheduling-for-freeing of full trees of lower level pagetables.
>=20
> I would think part of this should go into the commit message, as to
> why enabling 512G superpages is fine.

Together with what you say at the bottom I wonder whether, rather than
moving this into the description in a slightly edited form, I shouldn't
drop the PAGE_SIZE_512G there. I don't think that would invalidate your
R-b.

>> @@ -384,7 +406,7 @@ int cf_check amd_iommu_map_page(
>>          return rc;
>>      }
>> =20
>=20
> I think it might be helpful to assert or otherwise check that the
> input order is supported by the IOMMU, just to be on the safe side.

Well, yes, I can certainly do so. Given how the code was developed it
didn't seem very likely that such a fundamental assumption could be
violated, but I guess I see your point.

Jan

>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> @@ -747,7 +747,7 @@ static void cf_check amd_dump_page_table
>>  }
>> =20
>>  static const struct iommu_ops __initconst_cf_clobber _iommu_ops =3D {
>> -    .page_sizes =3D PAGE_SIZE_4K,
>> +    .page_sizes =3D PAGE_SIZE_4K | PAGE_SIZE_2M | PAGE_SIZE_1G | PAGE_S=
IZE_512G,
>=20
> As mentioned on a previous email, I'm worried if we ever get to
> replace an entry populated with 4K pages with a 512G superpage, as the
> freeing cost of the associated pagetables would be quite high.
>=20
> I guess we will have to implement a more preemptive freeing behavior
> if issues arise.
>=20
> Thanks, Roger.
>=20


