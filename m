Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED838EE9B
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 17:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131827.246190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llCqw-0007Pt-9S; Mon, 24 May 2021 15:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131827.246190; Mon, 24 May 2021 15:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llCqw-0007Nk-6D; Mon, 24 May 2021 15:50:50 +0000
Received: by outflank-mailman (input) for mailman id 131827;
 Mon, 24 May 2021 15:50:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIFU=KT=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1llCqu-0007Nd-94
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 15:50:48 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f271c372-0fb3-4366-9954-331ff2e3729a;
 Mon, 24 May 2021 15:50:47 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OFVtat011754; Mon, 24 May 2021 15:49:46 GMT
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38qxvxra4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 15:49:46 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14OFjkZ9021181;
 Mon, 24 May 2021 15:49:44 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by userp3020.oracle.com with ESMTP id 38qbqrbn5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 15:49:44 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BY5PR10MB4116.namprd10.prod.outlook.com (2603:10b6:a03:203::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 15:49:42 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 15:49:42 +0000
Received: from 0xbeefdead.lan (130.44.160.152) by
 BL1PR13CA0277.namprd13.prod.outlook.com (2603:10b6:208:2bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.11 via Frontend
 Transport; Mon, 24 May 2021 15:49:37 +0000
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
X-Inumbo-ID: f271c372-0fb3-4366-9954-331ff2e3729a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=MlK7XwBv8EW7kwoT/0Rmmlv3vhgbarA5dsA7WbtX4ok=;
 b=WLu2y7IYxKKYc9kR282I0lNjq16cJrsaFUwEqFJRPQEu3oOVBQcg+yJnZpf2MQ4phOcD
 wqtck5QlEmPn21ZA0VDCA2wAyqZIYKW0bS+0zJsQgWDxfvvOckWCn/mJZ0C9KWwu6uiV
 MkV+ZWTA+4qQ6CqzAgjgEYW8wvhOeAHKz1L8gfGM0wdHuxLhpar+/cnL2u/gw+Okrcum
 rYlcFX6jPeXgESz4Zcw9K0mhnM/GbV7ePjel43iQADB08H94Ei6HTzl2klw7vCRoTpF/
 23YaPfGeXNEgdLrNHt1zpV2YzPbUxn5cgSF8dJQtIkEWEu4yEuG5ua67l2a/aUWVHB8N bw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8SVVPxkpxj3G+toAdFtVvPfmFKsh97t2GQSoCzaE3MsgAIV6zbNOEFwKd5MI9pdXF/Q9Nm7vKIdO1xCZKKnXezCF9JHWbvzLsssKhyFK986Gom36VPUYcNagxKRF8zoZHtgoGmJPi3rkiejU8eD8o56mrriMu82Cwn2KzgdQtPD0d0Jjlac/fEccS2OtEVUZQqC0VeQmIbXDLqVV3eA4za3uaXGaGp1t194kzlwYUKzuM+G7BMRtAs6X+v+Hwe2uIgNFD0I4fi6a8m20UT9Ig7vMkdIlxkxkMwGR5i8rlrUVVQ5i7S62u4Vvg5VBrgGMR43AZR7CNc1XHzb5lNmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlK7XwBv8EW7kwoT/0Rmmlv3vhgbarA5dsA7WbtX4ok=;
 b=Hr0WgN9WHx9+wHRT+Rm2h01vKBmPoR5RUhruW2sPkz03DKbfEuJHm8qqMbUUxclRK0Rdv1gXNad5k/7nU8hxIvw4qR3KUu/JMHOFsDrIsMoGYjK/q2tKgZZ7A4175oDQTb4Iqw2wpxej8xHZB9LL4YaDQShkukR94anhpqw3TH/5pC/TMM19zFqpNdUnRSmJCiKJvwQWqZb37fm3cYn1N1+CTerwgvrsbFELFrEu4KFwIsXWhY2peH6YsrOJ08ver4+dSmV2TBbbthZpGf7XkZaswDi6cod0z2Yug4tv9PCvMVYyQ8Ncoh1Ogut6YFse0GHxKjMgoT6WVQtS4WuJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlK7XwBv8EW7kwoT/0Rmmlv3vhgbarA5dsA7WbtX4ok=;
 b=xH59lR7o3E7s5+FyjOG7Kj1q90IQo0/m0q4joVJ5dC26FlZpNz7Ldk49mSpi8hDZrBKHcf1JXA7fVNOoc4DcgjKlWm1lOObUoJ2xZgHIN88aknK9RJm+nUAKNXUk6im6ja19F65ArznG5v0m4pGf7FkF+xG1WJFWH2xQj0gUqgQ=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Date: Mon, 24 May 2021 11:49:34 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>, boris.ostrovsky@oracle.com,
        jgross@suse.com, Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org,
        paulus@samba.org,
        "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        sstabellini@kernel.org, Robin Murphy <robin.murphy@arm.com>,
        grant.likely@arm.com, xypron.glpk@gmx.de,
        Thierry Reding <treding@nvidia.com>, mingo@kernel.org,
        bauerman@linux.ibm.com, peterz@infradead.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        heikki.krogerus@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
        xen-devel@lists.xenproject.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com,
        Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk,
        Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        jani.nikula@linux.intel.com, Jianxiong Gao <jxgao@google.com>,
        joonas.lahtinen@linux.intel.com, linux-pci@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
        rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v7 04/15] swiotlb: Add restricted DMA pool initialization
Message-ID: <YKvLDlnns3TWEZ5l@0xbeefdead.lan>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-5-tientzu@chromium.org>
 <CALiNf2_AWsnGqCnh02ZAGt+B-Ypzs1=-iOG2owm4GZHz2JAc4A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALiNf2_AWsnGqCnh02ZAGt+B-Ypzs1=-iOG2owm4GZHz2JAc4A@mail.gmail.com>
X-Originating-IP: [130.44.160.152]
X-ClientProxiedBy: BL1PR13CA0277.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::12) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fbcc4c1-d792-4494-6e1a-08d91ecb8ba4
X-MS-TrafficTypeDiagnostic: BY5PR10MB4116:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB41162EC595B376EAA614CBEF89269@BY5PR10MB4116.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lxMQsLNRA6D5WyYU+pvEzJv+WanfR5b/sGRhvEuqF6R+hb25/BNTjKvJPcx9rDzajGD14lf8sYhIu+26AwjfNIMWB9fighHsQp71dlIuCR2RX5gaOqFCI+8bzhnN6VcPzIiE0ZvyEDzUsRXe0HYriRTisnU34iP3B/XTZTg6JVdNKsrGt4XzKiUJ8LI2YxcKM0pv0Mb1gkgedGz1I3aPHMPB3fwRYiLTjNG1Jcbmn8CCucOilmmIFOM3qmi0jevlQ1KjEIPvtInZiIktzdac6W/qd0TP6kR5dDtaEm2KZm0JPikAUANkoPN7wnZkQChJklWajdkVZKzNitAj6W5j5CHW51qVLNOnA2SjI/BIFXdK89AT6hVbhtffHODLMwN2B78WPmvGSx5F6AujmIuaVo4YRNdN4e77XyDY0wEqVYPrynegaVlYNvjynOqcluJ7fv7ZKGGxUxPXZpq/1zAVfU0enBiZ8IyYuD2KkZif6VrvICClz5MfuDDfGl6YWRGZJ0cW2wi+YfUpq1nYkch/KIZDagN+L+lAIYFzXpJa7XKHkuNfjcY838xAJ/KJ4ht0qWz+staSVDIuAQGbFp6gi2TuE2Hu+s6qdJfuRbmtVH4PaOFBWkZcURAjFM3Qfsnfld+kwgWjaeR5kcczUETgjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2999.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39860400002)(136003)(346002)(376002)(9686003)(478600001)(86362001)(2906002)(6666004)(956004)(186003)(38100700002)(66476007)(55016002)(38350700002)(16526019)(66556008)(66946007)(8886007)(26005)(4744005)(7696005)(8676002)(54906003)(36756003)(7416002)(52116002)(316002)(6916009)(8936002)(6506007)(5660300002)(7406005)(4326008)(7366002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?k9f+vLSIXL2AAotnAoM310FgTBO9E/Tn5j89La1JVNOr6k+sevJwvUJVSwpg?=
 =?us-ascii?Q?+xAtaN56ylkbLbAtdMQCI+KgCP8oG55l/wcUkPZfqNVpiFkPhMsMIKIzwsCf?=
 =?us-ascii?Q?La3ESSrr5RRXv9eCjAjFxhzOYTAhowuq6BRMC78qhHxBawZdp09tNvYiEx2s?=
 =?us-ascii?Q?O1yQHeu+y6ZAJ3h+nBdrLp06csxRDJckDG44OKOh1ZMFxEXBSvi/WrnvjuXo?=
 =?us-ascii?Q?MJtx0UW6OATFRZ1yxhxVZZRTMvqF4SpIBoxTaayvCAYROoPeJXZUvXm+a8n4?=
 =?us-ascii?Q?jd6JOyQgPbER1EDgWKsugoiIudHgFi6r6Ac9HutqFHXQyTlSqxjYsSWZZyGJ?=
 =?us-ascii?Q?aKjuK7UNIW6mpOsMuiKN5Ng/L+2I5MPy9BrtFzqJzVTZgrjY4wt1RUhP+moC?=
 =?us-ascii?Q?t3/nbvHEviKgCzT52k8TBvbPU3pV33tuJgF08RNTNGryYMM/cbfFRRbbWr/i?=
 =?us-ascii?Q?n2e36kdr89XdCXnsk9d6I6UORivqvQS7O3MCJ+mMT1d9lhldFjcaThxYrb2i?=
 =?us-ascii?Q?LVUE6jltznawf1ksouo5Zw34WW0h0pkjxjWS6GumfpDxPvMzk8qcqrzdCUak?=
 =?us-ascii?Q?Sx4k2rH/9A1P8wK8YzyuUWG0uPr81ix2Inmxh4bmxFsotZ/Oi9UYwW9+Ortz?=
 =?us-ascii?Q?VsxUk9zqRtTOLHSBbqz26N9i1hTN6yrn4aKZ5u6gCKNElb46TXWSvSL2iDv2?=
 =?us-ascii?Q?bSlfYMWFkjLaeRQsn1GuJC0o6TwhLrb8FK9du9SyG7X+CkCHArX1ETVbFdgz?=
 =?us-ascii?Q?GcLX326cTexW8+AduVoRyjf+vEqKsRSKJ7q9fK9IbYg+ItQm5E23tV0l4QS3?=
 =?us-ascii?Q?BvwxpQu3rsxpS1qopT8dECAfcnRy9tGIeohJ28+ZeJIs1uT6ronTRjsa5/x5?=
 =?us-ascii?Q?VBgxeYEu1Il2Oq9vYBrmvxH+A2yN1tL61S7Naklc8kyuME+1tNx+UKNlaItj?=
 =?us-ascii?Q?ThX8uQBsAAnsuB9Gl+/g4M7lmNBdGvqF58ULveJP+aAbfRYApLggD8tg4DAP?=
 =?us-ascii?Q?lTeEvBmRSNR/Sy6DTujsQYXqgNSDGvreiWZkNieTTuIOQf7DiM4B23b6Ou91?=
 =?us-ascii?Q?juMRW6uWO8UI/bVgh4OZpiDrloKbxvHVWy0PgPo0+8+4PA1ZNutFfg5h4KeY?=
 =?us-ascii?Q?TyLG/FpQrnwxMpMpCyQJOkRoiOtNnz60ZUTu1or0zdzKx9NERg1fZPTT0FOg?=
 =?us-ascii?Q?myMv/LVetsta3AMlvob2eefW5cmcynI+UNXaNBiUhB+VJRflTflL42nxpygQ?=
 =?us-ascii?Q?568Eu66EpI0EYtK1yYoo3hOS1ZSoaUXh+ISDyJtd32+OBM3BLzD2/CwIlQy8?=
 =?us-ascii?Q?cDaLh+rE4ay997dj46IpjMVL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbcc4c1-d792-4494-6e1a-08d91ecb8ba4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 15:49:42.1378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ONLz8Bfpzu4dW5SAWlMShnXYqz6E4cTtE5FYaSGri6EldOiEB9lf4uzrqlC2CAxWiekmOaDtACIhVsQZuQ4XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4116
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9993 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240095
X-Proofpoint-GUID: jyInOp7QVZfBwaP2UbNyQz4q__eAGIgp
X-Proofpoint-ORIG-GUID: jyInOp7QVZfBwaP2UbNyQz4q__eAGIgp

On Tue, May 18, 2021 at 02:48:35PM +0800, Claire Chang wrote:
> I didn't move this to a separate file because I feel it might be
> confusing for swiotlb_alloc/free (and need more functions to be
> non-static).
> Maybe instead of moving to a separate file, we can try to come up with
> a better naming?

I think you are referring to:

rmem_swiotlb_setup

?

Which is ARM specific and inside the generic code?

<sigh>

Christopher wants to unify it in all the code so there is one single
source, but the "you seperate arch code out from generic" saying
makes me want to move it out.

I agree that if you move it out from generic to arch-specific we have to
expose more of the swiotlb functions, which will undo's Christopher
cleanup code.

How about this - lets leave it as is now, and when there are more
use-cases we can revisit it and then if need to move the code?


