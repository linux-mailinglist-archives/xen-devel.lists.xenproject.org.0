Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE13AAE65
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 10:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143727.264764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltn0M-000436-RY; Thu, 17 Jun 2021 08:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143727.264764; Thu, 17 Jun 2021 08:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltn0M-000415-OL; Thu, 17 Jun 2021 08:04:02 +0000
Received: by outflank-mailman (input) for mailman id 143727;
 Thu, 17 Jun 2021 08:04:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k/hY=LL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltn0L-00040z-Ad
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 08:04:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31dcc469-ede3-4ba4-b278-48574246923e;
 Thu, 17 Jun 2021 08:04:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-jVgd05zyN9C3mCQI5rHEjA-2; Thu, 17 Jun 2021 10:03:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 17 Jun
 2021 08:03:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 08:03:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Thu, 17 Jun 2021 08:03:53 +0000
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
X-Inumbo-ID: 31dcc469-ede3-4ba4-b278-48574246923e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623917039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALSgb5AFXT/P5jkyXCqdpXY9SoTQFvUPjHPLRpzqA2Y=;
	b=Q21/WSvOSBWlpW4+s4RkHIyrdzg7DUDgp/9kacCdlo6tZ4zJ2KCwVBOl7BHoHFCu+gaFH6
	Ov6zad8G1Aa5VbxriXsEnTH/K5wjZm4q/RchuPSAHGvfdAQiY89GqOtBPDHVj8PM5RRKv1
	oxWfVDmExKhkq8SIC2IPp7EDIh/i9tg=
X-MC-Unique: jVgd05zyN9C3mCQI5rHEjA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPtr9gUmERvu5Lg57upfHynsmbnQRCB3x9VZ6C+pRDXQb789GFjoSEukMngr1wL0YQ8AH7X4X/Z3QU5YnI+R3G+vGvkhhZfmSRSolur9PSpSDNiCGq/0o7aWQdNCklrmEXA3RI0fwWsOcw9QM3L6uPri9C7onfJ+IgOphBE1kKM+oo6KJVMeoKI3PHjlnuPJyQvt2ZXmklQiIXDcJwnfWt5/Y8LnRP9cxIb78FBmNoqEvyQRPlt+Yxr0r7KScFDkyiAenP0B3PXf4ksve1pGm5vMMVUZquVm6T7nNNku1/BZQzyc7yJ2UMnPY4JrvoQsScAcHDs3R/6vv5GtUYI6cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iiEYt0fEL+ik/evNO33yFdF+zFcXcN1O5IxHQeWCJI=;
 b=WEKrt6OSFtCPuVbFp0qcSZJpM9tGaghfn9mob+CKskiV4MjhrAnRRb9Ow52+7ovbpx77II3l6tFNtHdLErqQzJM6eHbqSLObjsBKqIxhpTsMF4kBHH6NWqS+jjK15DiDnOUFpk5FTv7+tCPzlEqZFOZRKeb0bFACbCBLqD6jPWhAoGVrYxSivDSSeewQO00Q6t+TbFHwzw/XVwGmney8O2wGwpTKV+IRSSAYtjjChHFT9z7S9vROticTEMXAJ3/Yuto/STCAF9uz9e0TqS+hghfoILCeOODD3d5ny0UzNjAnN0ywZB3S9GcxjAODUA9IAUuJ5HqaO+hNFpT7MvSi4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Subject: Re: hypercalls with 64-bit results
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
 <d38cd3a3-6139-5ebd-6a78-debc20c3b2bf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1adf28a8-a0fd-4ea4-bbd0-52734630d52b@suse.com>
Date: Thu, 17 Jun 2021 10:03:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d38cd3a3-6139-5ebd-6a78-debc20c3b2bf@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P251CA0013.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8471467-3949-4e8c-3dd0-08d931667374
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244739B4BE7AB37582B3D82AB30E9@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/yF9GVHe7d1uOMXbHqmsnDp9OzkiowQkXWwjRPPqNAXV3ve6Y9TCcAHbJhPivdwjxktQaue+/8zdqoLjyceB4k1OJnjV07xWLYCpDsHuen7mw9ekLbV/aEP1AvYUN52SiiUnQGPJ7P//fSMGEtPW3Ff9NB+8OjkXsOy7FCNhtP50ORp+v6K0kYZZAR44XwEdRv9T3VGdKYBWCbAz5Nd/P4OU3Ez1QqMckTlSRlgdV48EmB0KVdq+dHYpCQ8Pi5j2bl1Hb3+vXyFmD02jVupIH2+Qjo+mGGzDXz/EOxpYs5M3C6FXBzYZDAhc8rZPOJv4kUAPMRseaXMjMxaHl3KURBkHsBcFyFDyP6VpFBuMQc5L6Eb3MoQw9Z+IO1WizUDpUL1AfH5tuA8xvJ69LOzGiW0AiiyJNRo8VF7+Nalxpt0+QDhrI83oWluuR6awdC7Y3aFGw+RthqQ1xSBQW84MkVkJmDIUOKQiFne98NsKe6pfRQViCUwbMD19eDS2HAuyos+I7WciAQyYXZdQmVuzNwNonPI2XUsZRXrS1Ll+K3gKbWxxyrrgvBPBzfFv2xb5V7kcwiiLRvb26TM6A4fvdpkVtobrQKXcEsNcrQ8gDC6pLR9/U/z5ucjV+ZMsoPFv/dxVKZxCT2NU+qJmlIntVJluGuD5wL7FYwRJH6eEcgwfVKPLR4FR1WSsQxCyqzbo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(136003)(39860400002)(366004)(396003)(956004)(66556008)(2616005)(36756003)(478600001)(31686004)(7416002)(5660300002)(2906002)(53546011)(54906003)(8936002)(31696002)(66946007)(66476007)(16526019)(4326008)(186003)(38100700002)(26005)(16576012)(110136005)(6486002)(83380400001)(316002)(8676002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jLHotoWOg7Hv0Iw5j4tnYrIwVxM2WRwlhF1dI4k8qUOk4IS1ezxgmEWfKeQ0?=
 =?us-ascii?Q?uNJVR8M/YAy4e6mlB4JBxVOK+QdOJZ/4hdJqGvGYppX2F7GG9PacAV8HM0G9?=
 =?us-ascii?Q?31gx0oCoiFudmA9uQ/JuYjCESWr3rKMWOkAYkn4GNvpX+E2mla+1BFFmHyG3?=
 =?us-ascii?Q?05/+m5KLEsSHoAqYFI4HcRwz7njZfe93bEgHemqy4sVyS1ka6dwslC8X/efG?=
 =?us-ascii?Q?ed5suK438zcMfV9CxNb2j2TDYxsJO174yx19zwV8lzEYZ0yJvZH2bG8z9zdZ?=
 =?us-ascii?Q?RO0Id0kFH1KpcWOEj3iwv0myRpBOsqSTkUa0WRWun4gvfEjrit+NF0kFAMJR?=
 =?us-ascii?Q?diqtj7ZixUh4MVn8opumxHMp+fNrjqrdyaqew7MeQsAYpINRKtom/XFE8gJC?=
 =?us-ascii?Q?J2xTXNxFacX6/QnSmXU+gpGbdXLY6aWHx4NIfkTCgYRlL0RzEuSGRbnDlfM+?=
 =?us-ascii?Q?yyMPXNNhimAZ7cFEcH/opW3R2d8ejyK8Wf5+9J0CKC0SDVsfBKWeNQIUnF9E?=
 =?us-ascii?Q?jB0V6uK2j7ZgybpBxznZ0ZVsV/Na8dHGcwWCADaYLlF17NMydyo74hMGEZ34?=
 =?us-ascii?Q?m5ozl3tpKy419H8E5aauFxh4PLjpFZa7hzAqiVjwRh7/3jkrjDtHS8bRT/sD?=
 =?us-ascii?Q?sDvEZhmLf7aHiBqMRkQgj4w/HTG6yyTSMpuRrmbUzIGbOcxxx4IKLs4XuGpL?=
 =?us-ascii?Q?9xcdhgl2/mp4o9c3LrKEjMeKLTAWnmd+j3xTwNZ/jRnYZZ2MYm2l8/tPpZvb?=
 =?us-ascii?Q?p8nBbb94jLpfJUWi8ZIQzP7YoKi4EcSR448N1O/Mga1KrK7ByK+m2+LqXznk?=
 =?us-ascii?Q?2nUVoCBjI+DnFzAGK/nFMDJgLiPIWVVnRJrJUuT55jmM9xy1TKAspt9sjtHk?=
 =?us-ascii?Q?ZLhnuadct4js83JLnaejckZI01KJbH2bKRuUNljmRYAra+sXuuzgWj4F+NnN?=
 =?us-ascii?Q?rXx7QcuZUmL4EzxOgNsM6XjO2MMV63XtW+O332Rd3Ya66cNVwgGZWYp8VVhr?=
 =?us-ascii?Q?7ochIE+NWyASpQoOosoLBf4DH50hcEtIeoyEzsrRyzjNC4yi1TxryjstCahV?=
 =?us-ascii?Q?Zxb3oUaySF8jS9CYxCf971lvLQuFbtF8/sbKmy4ifBYr3BQZDGZV1mIRVm26?=
 =?us-ascii?Q?gSsIBcdQLL5XmjvzxEEOF/KHKrQNomXNLSXTBM5FYplOfBnQg/tX5Ow5QHqO?=
 =?us-ascii?Q?d7+oxCFUwLGGwFv/JnQGbE/QVo7NZe33QcvpovK7TgBrxhl2yAfgqwissf38?=
 =?us-ascii?Q?yvbCFPuIR/hLxPatGQmmLZ1MJKeIt6orTTj86kcGDirkmgraTJZEh5z49frm?=
 =?us-ascii?Q?l2Ak0j59mClboc7SNeivsW0Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8471467-3949-4e8c-3dd0-08d931667374
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 08:03:54.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+pupnIQxGcOTnCg5jnAcWh9WAm4FLTUFHdQucvvowp0XVgJt2Ax8deF8o3E1u+kL9MrtfomKFk4Tin0H+0BRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 16.06.2021 20:15, Andrew Cooper wrote:
> On 16/06/2021 17:04, Jan Beulich wrote:
>> All,
>>
>> several years back do_memory_op() in libxc was changed to have "long"
>> return type. This is because some of the sub-ops return potentially
>> large values as the hypercall return value (i.e. not in an argument
>> structure field). This change, however, didn't have the intended
>> effect from all I can tell, which apparently manifests in the present
>> two remaining ovmf failures in the staging osstest flights. Anthony
>> tells me that ovmf as of not very long ago puts the shared info page
>> at a really high address, thus making the p2m of the guest very large.
>> Its size gets returned by XENMEM_maximum_gpfn, as function return
>> value.
>>
>> Since hypercalls from the tool stack are based on ioctl(), and since
>> ioctl() has a return type of "int", I'm afraid there's no way we can
>> deal with this by adjusting function return types in the libraries.
>> Instead we appear to need either a new privcmd ioctl or new XENMEM_*
>> subops (for those cases where potentially large values get returned).
>>
>> Until we manage to deal with this I wonder whether we should suggest
>> to the ovmf folks to undo that change. I'm anyway not really
>> convinced this aggressive enlarging of the p2m is a good idea. There
>> are a number of cases in the hypervisor where we try to reduce GFN
>> ranges based on this upper bound, and there in particular is a loop
>> in mem-sharing code going all the way up to that limit. EPT P2M
>> dumping also has such a loop.
>=20
> There are multiple things in here which are disappointing, but I think
> they've mostly been known already.
>=20
> But I do agree that this is very much another nail in the coffin of the
> ioctl ABI.
>=20
> For ABIv2, there are many changes needed, and this ioctl ABI was never
> going to survive, for other reasons too.=C2=A0 Obviously, we can't wait f=
or
> ABIv2 to fix this immediate issue.
>=20
> However, I think it might be reasonable to wait for ABIv2 until we can
> reasonably support VMs larger than 8T(?).

But it's not just XENMEM_maximum_gpfn that's affected; that's just the
one pointing out the underlying issue. Plus if so, shouldn't we avoid
returning values that are going to be truncated (and, as can be seen
here, then get perhaps recognized as error codes up the call chain)?

> For now, I'd agree with trying to undo the change in OVMF.

Anthony, thoughts?

Jan


