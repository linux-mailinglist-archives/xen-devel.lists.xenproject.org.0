Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4161A3ACF47
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144811.266492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGXu-0004Cz-QM; Fri, 18 Jun 2021 15:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144811.266492; Fri, 18 Jun 2021 15:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGXu-0004AE-NN; Fri, 18 Jun 2021 15:36:38 +0000
Received: by outflank-mailman (input) for mailman id 144811;
 Fri, 18 Jun 2021 15:36:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luGXt-0004A8-O1
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:36:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b6dacfd-c78b-4e92-8526-aa26da9bc323;
 Fri, 18 Jun 2021 15:36:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-Z382xySGOmG0iezf-rtcGA-2; Fri, 18 Jun 2021 17:36:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.25; Fri, 18 Jun
 2021 15:36:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 15:36:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.10 via Frontend Transport; Fri, 18 Jun 2021 15:36:30 +0000
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
X-Inumbo-ID: 3b6dacfd-c78b-4e92-8526-aa26da9bc323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624030596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SSbh5l5U+U0FVABHB3hjWWZ2nfD2yn777G5Xq/PsoVY=;
	b=TBL5Kdtfs/bw3ZwONbqa8C/RhZ7NlATs+bo4DRBXGbL9x53bxvTds1LaLhlA8wjDqcYxZH
	VzFSea46Kd3++P+2WCMe3loE0F9YVdfGgIrp6KZUrNuK+Z+OPcg8Rzk5UOamOUDYXketqR
	j3Q1RxwgRthT95QGRmMHkNb5WIP22HE=
X-MC-Unique: Z382xySGOmG0iezf-rtcGA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkCaKxTegjPJnHTMYtLHhP+UJvPjFjzExNrseK+EiCRdGi+GxgXgvryD1YG4nE7tE1ckwgTQ6/7//Mzdpc2PyI33b1HF38z5CNEHEZ31dg2jA8PZqchqMc4Vpaudg7gJmXyRFdKs497mAoQcIdxG6c1JNfD/kZbmdtPCUa36N4LLfrqq7RnE91sBbmgKFEqfA2XgLHEr5SIIU3k73Q+GtSlBEm5xeABR1VQFxbHng6z8QRhhoAwoNtqetoh+Gi5FIz+WMJz4+zUDcbOMws8PFiCiNzgBmQmeN1AMU67dVRYvBR8PU69abL2C7GZu91IkjxOpXYKeW8UdFkxENi/CgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz1pzk1+R8C8+7jLgvopLD8NK0XD6rH7eFt/+eifFuc=;
 b=E3ZTiIzNlEHHOeP7cx1KdzeUUu2zF2I21xISz2A4YqblvvZIXlPvIIcAZsyF/dTr5HAaa6lET7W1KwDCPgt9SVwO6BclddtvdU3SkN7nLPjCre7JTnFbg0NsMa+cvcVXuJsOMtwrJZ6DqSfXtnqj2tpaV1cGCHPzv3XLJE21i4aNd0FsomVZySsGLLUSV+01cNdM/y4emFzuIC1uxp76AE/SDe7NxfJ02Litzw7nK+n4W8K8aRjpn97ThtffyJ/PyhC8JLAYeEEtevr/Ufn4HaJaJBGSJzodDUpdHFU8jnqFv59YBGlh3G4iNXqVzTpG3wc3O5U4L4NjR2lueRg6oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 5/5] libxc: make xc_domain_maximum_gpfn()
 endianness-agnostic
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <99979695-e53e-7764-85e1-64dd4cf9447b@suse.com>
 <bcbf4a71-bf30-5a9e-a399-d4366ee95423@citrix.com>
 <0258fa6c-3202-b012-90d1-f48a5f3e9d8b@citrix.com>
 <79cdb790-2db8-0922-5412-d5ab69e7c0eb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fcbb0fcf-b20a-9408-345f-5bfcfb138035@suse.com>
Date: Fri, 18 Jun 2021 17:36:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <79cdb790-2db8-0922-5412-d5ab69e7c0eb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acefbd3a-4a94-4479-c2c6-08d9326ed89e
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB329553F617E845A5B7FBFB8EB30D9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bg4qVnUfSwyCn3227a0iwqkAG1ozLF2nsHUo6sNWPwP+lpZVsG8ljl9R4ZRu4IxD4eOhIwIKXNXX9MNlK2IduArieT4K/wKlkjFcvY5iGLaX8Lu9K1r5H0d3gGm46O+/ZNSXniqyx5z4/93UTwltwwnPAlgc9kscxw2vp2RBbpRzDAB6EUTXxldC+HWaK6el8VQdnHh+2CstKA5kT4f5ZZfcTAKbSke/OsBicXK+Mg4XvRBcR08LvPWr+kf066DtNBQE7nf0TLZv1LFZo/dJYgQ14ymgBS/ULlBu6zQC4Fk3OT2yjThXRXpKaDoHIveWp5hPmWiBmyF096e1TV3GOCTW7FBzLt43g+Z/RDkNNTfKDZpte5X2dJj1WMqqHigdVEdeG5fzTrbktEYpHqt4DdMmLG8wI0sr//9QQC0cDQ31jxUIOeYeJS6X50j1YajyNSDv2HfOG6CJTEHQICanghm4qPNHTDEv1Lh0DH1l3R3UILeQJimEP1wcK3ab2+tignWZfJTf0D6wItEnFtGNCek4z5qjOGBTuWKpCbS84upzIymACTomXkXTi1gSmUeAH3DrwKrqoPt5afOlkKoWljeSbGYI11xtu8zgjUjU7QtMPDgm4+xOHEXDvw2BjG/pxXTLqZgl9/9kZpX8yQuVr2I0UTdU3oJGd+Uh0Io76WqXqIsyLaMMEF9O9Bc7NkrF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(39860400002)(376002)(346002)(2616005)(956004)(316002)(86362001)(6916009)(6486002)(8676002)(31696002)(4326008)(478600001)(54906003)(2906002)(53546011)(66476007)(16526019)(5660300002)(26005)(38100700002)(8936002)(16576012)(66556008)(66946007)(36756003)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UFfRdiX+xqDrbpresYpxoOfoS5tFEJaLaVa5/X/c3Pn6Cq5nQ/xB/p6bvgbq?=
 =?us-ascii?Q?u+QIQL/vNU0LZTyzY60riTshGBZcJe6u6CRoj+bpk8FlokHM79NoWelDcKnT?=
 =?us-ascii?Q?ZNnzh0Z63I60ahf10OW16wkjdSc6oOqDCJuAzxIhluLS9Vtw5EUtq27xeDlf?=
 =?us-ascii?Q?dxD5lFk3ib2LF3dy9kukvyohTVPS69l90vRpz4cScmzvisP7DroBJJFbr1XA?=
 =?us-ascii?Q?69vg+Mrf+aKBCutuTvLlWkuMNmMux5p/fJH/A38XfKVh7pekYlG8Zj9XS+mC?=
 =?us-ascii?Q?13gmpEBcV8wX5nJqp+OCS2ue/PrDjcrG/cL/Qn2OUlU/B3tGbiYgKp8ViURO?=
 =?us-ascii?Q?/jn7uct1Rm2YNlGa3kavWGX3D4yDglxaYGBMIdcCretZJ5cmEKe3Zz44oJJI?=
 =?us-ascii?Q?zJYDR4hNpWFG0CDTnHvvvWeiuM02I2wD+2UMGgZau4sRgdAnu5YipBI52aQk?=
 =?us-ascii?Q?2hBP3arUce5OOsjcz2f4Jer9/4iBKPd/9Qlro6p7kuWQ0qVstwRFy5bPhyPd?=
 =?us-ascii?Q?dsAc8TS/c8Jy0ry1o3b2hd8kDY/h/r8w6ItEyr6kOH19+JGE5kz0jKMEdjEa?=
 =?us-ascii?Q?nONkq2Yo8imL4OcfsSzCLmJB2bmXrNO7PIZUrncc0NMrEasOkN4IlPncQjOi?=
 =?us-ascii?Q?5ghTwB94a9q0spIrLjr3+/yYw6TaGeoHKEMO6a4Oic/re6MNp2q7zEQ0KtHi?=
 =?us-ascii?Q?wqCmS6eifcph0SF574VYiCpbXUWuPmQ6Lc92n6MvmnJpleM2uiiruAd9OBxG?=
 =?us-ascii?Q?h9gKhiYSdOyoPwhqQaenmnEqc0MfFA+VBg8sLZFGcb7kSggwX9+uj3uJoK88?=
 =?us-ascii?Q?GhzObxYBIj2qAMp2IhvsbJlOL5g75kGpBq+UgRKRL4zwzJkW/M6uZyBValYu?=
 =?us-ascii?Q?GZlwqpd7ZjYqxME11Mblrz99LR39FzjbwTK1JTKDHYvn6NZSKASHAzF1+tPo?=
 =?us-ascii?Q?MWVDFZ8gr6NKtBF70Ic+3O8LRzcoo4U17FRnfHZ5LWJkjUDfG8HdyyWr239G?=
 =?us-ascii?Q?5X2YXilxeFH5cOw1zDTQDVURyxBkKGQR1btA/gidbKri7vxTsSk0pvEKRD3x?=
 =?us-ascii?Q?U1BewN+gk7ewi6ooBrk9iWUncofnjBDIZdk763EmVAQK83e9Y+oQ9S0ESKN+?=
 =?us-ascii?Q?i/CEaZtvi1aYuopmZmQ0tqXTftoHet5dnhDlGMPhtaPnwF5FU6HcFN9TwH9g?=
 =?us-ascii?Q?yahl0ptz2TWDulRvBj1lVpSqz+WNUH3wA5I+yVReqmr2ViLJKan979ohvZyy?=
 =?us-ascii?Q?7tHfpShX4th662xiWMmSGO+wlN0t9Lw9oCRTZ9pRECJvsR7DwAu7WqSS5po4?=
 =?us-ascii?Q?MRpzgW1suAgZ6cLdPpsmNiEH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acefbd3a-4a94-4479-c2c6-08d9326ed89e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:36:31.2779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHy0UGjHOt2NhR5PuZ0qtF7vhZvUHCXqSoqgZlmnR9RfcXnxpnGvSvct1NqjNw5//kli/rFcGUa214xgbhfvkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 18.06.2021 17:24, Andrew Cooper wrote:
> On 18/06/2021 16:22, Andrew Cooper wrote:
>> On 18/06/2021 16:06, Andrew Cooper wrote:
>>> On 18/06/2021 11:25, Jan Beulich wrote:
>>>> libxc generally uses uint32_t to represent domain IDs. This is fine as
>>>> long as addresses of such variables aren't taken, to then pass into
>>>> hypercalls: To the hypervisor, a domain ID is a 16-bit value. Use an
>>>> intermediate variable to deal with the issue. (On architectures with
>>>> arguments passed in registers, such an intermediate variable would hav=
e
>>>> been created by the compiler already anyway, just one of the wrong
>>>> type.)
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/tools/libs/ctrl/xc_domain.c
>>>> +++ b/tools/libs/ctrl/xc_domain.c
>>>> @@ -856,7 +856,9 @@ int xc_domain_get_tsc_info(xc_interface
>>>> =20
>>>>  int xc_domain_maximum_gpfn(xc_interface *xch, uint32_t domid, xen_pfn=
_t *gpfns)
>>>>  {
>>>> -    long rc =3D do_memory_op(xch, XENMEM_maximum_gpfn, &domid, sizeof=
(domid));
>>>> +    domid_t xen_domid =3D domid;
>>>> +    long rc =3D do_memory_op(xch, XENMEM_maximum_gpfn, &xen_domid,
>>>> +                           sizeof(xen_domid));
>>> Why on earth do we pass the domid in by pointer and not value?
>> This is horrible.
>>
>> What we're logically doing is passing a=C2=A0 pointer to struct
>> xen_memory_$FOO { domid_t domid; }, except its all done by void
>> pointers, and even the public header files don't provide a suitable
>> structure.
>>
>> I think we really do want to retrofit a suitable structure in the public
>> interface and use that, rather than to continue games like this.
>=20
> Alternatively, declare this interface broken and reimplement it as a
> domctl, which is where the functionality ought logically to live.

Not really, no - this is something a domain can inquire on itself.

Jan


