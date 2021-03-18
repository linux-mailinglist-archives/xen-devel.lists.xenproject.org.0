Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F54340A70
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 17:44:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99074.188204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMvkU-0005Fv-Ta; Thu, 18 Mar 2021 16:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99074.188204; Thu, 18 Mar 2021 16:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMvkU-0005FW-QK; Thu, 18 Mar 2021 16:43:50 +0000
Received: by outflank-mailman (input) for mailman id 99074;
 Thu, 18 Mar 2021 16:43:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecll=IQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lMvkS-0005FR-Kh
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 16:43:48 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce61e370-e5d0-47bb-b95f-ad5dbbc02cf6;
 Thu, 18 Mar 2021 16:43:47 +0000 (UTC)
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
X-Inumbo-ID: ce61e370-e5d0-47bb-b95f-ad5dbbc02cf6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616085827;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jdJO+d8yQA7FbPlZgN/81nCXqS+6l2yHPZ7IYVw7wj8=;
  b=Cd4hn6TMWUVNExc2xw6FlXuS9Qlkk5X6gdVH3k+2t00I6lf63Gsd8Cn2
   OzMCUn+oQZBuEK2BpgnymG3E8sE1/jzpE/MwEwv0YRixO6loH07Br34pN
   0lofO3B1dkVGzoKq5eKFuqa7JvRfW4tBwRCoHMaZs5Y7xsTYNSC+9XIHt
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: V8Rqo/QChW/200UkVJ/8N7olqbN13IhkQlnbT5UWXMgHlf9gnxqW9pE46pxTQSGFVOoHYtpz+9
 8XLsWJfqxyMr26WYBrOvCGmLxD11oYwKiCr3D9m1oBuh+47R3rtM3fV5Mm5HKo1K8iS7cgDCsc
 XzraIj8xm5NRtTQG9s7ed41hclbMgKqAQSE7eqvTVnEz07qh79PUKtOO8Q3471JZiRUTo+Hlhz
 8aJnTwc3FYjbjUce36DkXWCJw0pVRpeVwsUqcwDnE7UOcwt7rjsS1z4G+RdD8A08VaEVw05SDP
 1bY=
X-SBRS: 5.2
X-MesageID: 39619828
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
 ==
X-IronPort-AV: E=Sophos;i="5.81,259,1610427600"; 
   d="scan'208";a="39619828"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3faJItipjp3c9B2pAZu8LeO9yAKUvRvz/gvStwsJMM99iZcRb5sHcs36If/HJvmiywX+o9hymFWEWp6CQ4gQSYeZZkCLhcHM9KT/HRZxKiYDpXXjE/L201E6AAM5hVcUBcsMgFgpZxghoWTxiNGFP/H5IrKQCTK8s3kFVDGAI8rn8A4JZRXMshjRb40aTEeIoy1DRUPn454W1lvaRnUrclUbDc9miJNJRakjnDityAHf2X3sYJWVIYxCateadE3HJ/zNMAmMU/C7d4D7MKqnCM9apeBRu6P8IWOPBrBFz1qkiS1Zw7Bre7y6gNKaPlXytyhy0Z/PtXYbG3FRgoO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxDZB9dQLgRIPvV5DwjxQaV7NJLdr6+APJD95DS2e+o=;
 b=cjfpnm2ekfdWrrUuXWOeYKX9Y4R7tPeNxpYqCAsW3sCQlQ3zy0cMEUOhI1PuOFv6OAod3+VSvMvnrSfv8BgfIlHPAb+/PLjHBVuMGjNzzPt1dgQwi7bf+bVqz3R6zKglGgtqd/+d8JvXPiNx7tojQ2R5e6nvfoG5ZRDqhNHIu3YndPLBYlT3bssC7ogBTo68zToAz9PtO8PF9ZmhovOr3PDdiLdcUSnCnt3tPmaTT9kiWLxPGsFubVmo16DlOW1+V88Hv7jQay7TCaYJ5pulpksw3AJtIWUt7868N5coyn+ebTnNsBr6GBpPm0kxGVOamJLcoDSFPqqW29C0nm4uoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxDZB9dQLgRIPvV5DwjxQaV7NJLdr6+APJD95DS2e+o=;
 b=occ8PBLSpPMzVUFhtZrXINd7uZbNjCBTVPP+f0ajBL/VlCehvyclMtFXO9NJByWvGsUJkg7AstQRqu0RdH6V7EkxL9EAnO0hfhmEQlLRRatxClqV7YcmsioI4F3l6mr4ap2mcD1mxIVDonGrWFWqnkrXiVduiWbDSzyn2PXIaew=
Date: Thu, 18 Mar 2021 17:43:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, <christopher.w.clark@gmail.com>,
	<andrew.cooper3@citrix.com>, <stefano.stabellini@xilinx.com>,
	<jgrall@amazon.com>, <Julien.grall.oss@gmail.com>, <iwj@xenproject.org>,
	<wl@xen.org>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<persaur@gmail.com>, <Bertrand.Marquis@arm.com>, <luca.fancellu@arm.com>,
	<paul@xen.org>, <adam.schwalm@starlab.io>
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
Message-ID: <YFODOnQRAntdETY7@Air-de-Roger>
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <20210316031814.10311-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210316031814.10311-2-dpsmith@apertussolutions.com>
X-ClientProxiedBy: MR2P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7ee27b5-2de6-43d0-da7d-08d8ea2cfe3d
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3673A634DD218E5A665BB1AE8F699@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kx1Z7T753rv5/OOHMKwIldVnW8+vvguEtjXktMlTIJ4LC+Z2IFM66sCrLqHYYhY9KiM8eJ8v5Ckrz3noC04WwE9BvLT9sm1Ga7eCNrJtvCfC4fGGhCw4uure+KYpVf+wyQz1eb/fFZTNZRbECx4wmihMz8fGNJGfGy2wcv4W8qvW/1Sj/sMKyBesnCMpWxmo/NubzV3EEfPrDbyiUfiYE972+dJTUHXfLb7wkSzIu9hw7fdG7PugBpemptpQrdb3orL0eOqyyRo88nfxpJyWk44zBPaYxTD1LUcE65fX60PMktHy74AleuMrDRViZtogd/2mrB5Dudh8qD6uK0Y8xqHya7J7LyvSAEwkPZ/DwY4O8drtTphd5fTlRJibKdufS53ETrzDcmfPFnSGWN5DrwQCMRHf6igOWyB0G8I96lXdqYdPfKMKTfKd0txh6c1cWcEWcouvrp60UPYfBJzWmkcEsrJPEVgAuxUY7mshrZOvZplmiD34eoYb1kOSS2Xu2thNMvh+qatSf14y59364sogkZg8UnX1bG+4CJuLmtMJcBYSfdp6ADNyzH4CPz5yKbut1h9b8PbogGUpCj89c2jkypcfbhfJY/+kcswbAmJ6KHiM/H3xymJxmhw2ZcTy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(136003)(366004)(346002)(396003)(376002)(316002)(8676002)(26005)(186003)(66476007)(956004)(66946007)(86362001)(16526019)(66556008)(6916009)(6496006)(9686003)(5660300002)(6486002)(478600001)(4326008)(38100700001)(6666004)(2906002)(85182001)(33716001)(7416002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QmRqV2FoN3JLQjdxd0lTTnJlakVRb05TcWxlWlA4aURtT3IybElxT0pkK0RS?=
 =?utf-8?B?a1lQSGs5MWtGdE5MaExrZDZTazZHcXVDUmJIM3RjZGFjZWhsNlBCczZ5ei9a?=
 =?utf-8?B?YWlaOU5XRlEvY2lPWGM5d0JlM3hJUzVzczZkYXIvVVNGTWtCQ2toMEJEeXM4?=
 =?utf-8?B?d3pxbHY0Z2RJRE13U3pJYVl6NTNsNHZOWmpGbTNjWlVUS3pIVUthYUNDYnZJ?=
 =?utf-8?B?TjVYZndwb25wdnlkOUJJRk5vaFk2aHpmZFdTVW1Sb0xxaHpnSVJ4ZDY1ZndG?=
 =?utf-8?B?Ri8wT0RDRFFKSFcwMHBCWVpEa2NPWVFtalMvVExGVWUyMXcxVU9Xak5STEU0?=
 =?utf-8?B?bk1ZQURsdjZpeFkvem9aaUtUMkFHZ2dzUkQ3OGhTZGJDWGpFOEF4UThoc25q?=
 =?utf-8?B?OWFxeENva25vL09VZXRjYnB5SXFZbGhpNlBMalZMVXFPVlhSWEhnYThyQWIw?=
 =?utf-8?B?VFNXWGpIZ3dLVS9ZWno0ck9jR1NkNG1MMWh2QTMvaTkra0ZmaTdJM3VEZmVM?=
 =?utf-8?B?SVpNYk1TOUdJWXlhRkVsb1RCaWZ1bk84WWU4U3ByK0RhdUtKZGsxMTZOZTRB?=
 =?utf-8?B?czQzcWdGem5BTXIxZ3NVZld2cXEzeHZCRGhhclpRODhSQVcya05GNkQ4d1Ir?=
 =?utf-8?B?MmttT20xbU9IYW5CV2tZTXo2eWlKdUhvOE1kNzVRZTQ0dHhFb09aR1V3NDVP?=
 =?utf-8?B?UnZxWmNxYWZxU2dRZE1Bc1kycnhFNkVISWlYeFVVUSszc2p0K2tXeC9peEg4?=
 =?utf-8?B?WUoxOWJ3a01xdy9TVnV5UjZBaWVLbTdENTJ4M3R4YlBhdUNScHlVYmZ3SVZZ?=
 =?utf-8?B?bk5kYTg3Wit1djdaZldyZHlwWnFiSThoa25STmozZ1VtcU5mbVlSSlVtUzVk?=
 =?utf-8?B?aGZVQkRxb3N0aS9LVUtEZVAwUng5eWtNbWIzTFBIcXRKWmRTNEVBNFNnVzRt?=
 =?utf-8?B?YXhKck5URS9GbWgySGVlWmNNaWM2andGT2pzSGIrL05Da0VKMXprUXpPQkVC?=
 =?utf-8?B?S3dhU0V5cGxjaS9HTmFUb1hlcHZBRXRWRDBBd205T1h3amdQc0thVzNvV29o?=
 =?utf-8?B?M0NiQWhQNnozK1dUNE4zc2tIOHFzaklWODF1NnhXNG80NjZTMXk4SHBMQmxE?=
 =?utf-8?B?U0pUWnZkT1ByT2xQdXd6YVhXVnVLalcweVV6cDhZZjdMbFZDSVJ4WWZOVnp4?=
 =?utf-8?B?NjlwYk5QeEw3aW1LU0IwNHZFb3QrNDlVeGJOczMyVDJiUDM4cFZCczFzd3dq?=
 =?utf-8?B?M0pYZDNwbnBpNUFSc21odFA2a0c3TGFJdHpXa0NQZnRTZ2p4VmE4Y2FaVjFi?=
 =?utf-8?B?RkhQMUlmOG9SR1JpM1BwZXFjVnlLalNTdVowbzdkN1REL1lwNjlOT2dsTWQ5?=
 =?utf-8?B?SFhWOG5aQlZaT3FUTkphM2E5cFpWNFBpRVAwbFFxODZ1cWpiOG5Yb3RZa1lJ?=
 =?utf-8?B?ZldiMXJWNW5Fb1plQjViNjhuTGRYNUFTR3FpYnBhSEdsSk5xS3oyQ01xWC9I?=
 =?utf-8?B?RGdpVlVnVWx2Zzh0TkhPcnRPNWZSUUYrMVNUOW5iOVBkbXRvdGNCMTM0NEFC?=
 =?utf-8?B?NkRvdkJlSm81ejZHa2VRWmNPUWlGSGhvYUdzU1VWZHJueFlDbVZRTGt6dHZj?=
 =?utf-8?B?SlJVMzdDVkdSUDMxeVpOY1NDR2I0dDh1UmFBODBaUE5xMUJuenJTY1U5V1BU?=
 =?utf-8?B?c2FDSWJLWEtnbWU1ZmIyVE1JaTlzc1p4ZTZaSEdRdkpTOE1LdjVBc1BHY3hu?=
 =?utf-8?Q?V5Impm5i8Kk5FFeCDdm+cnoCQSOd2gQdV3C2Lwz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ee27b5-2de6-43d0-da7d-08d8ea2cfe3d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 16:43:44.0291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBOJGPGLMMmHn4cbPA/mpgkYAwD964h4227D/0hQ6wkaz1Hc4OWTYdDSFtLCIi36lrXnRuzI4JR+gsQ2kC3kQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

Just took a quick look at it.

On Mon, Mar 15, 2021 at 11:18:13PM -0400, Daniel P. Smith wrote:
> + +---------------+-----------+------------+-----------+-------------+---------------------+
> + | **Xen Dom0**  | **Linux** | **Late**   | **Jail**  | **Xen**     | **Xen Hyperlaunch** |
> + | **(Classic)** | **KVM**   | **HW Dom** | **house** | **dom0less**+---------+-----------+
> + |               |           |            |           |             | Static  | Dynamic   |
> + +===============+===========+============+===========+=============+=========+===========+
> + | Hypervisor able to launch multiple VMs during host boot                                |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |               |           |            |     Y     |       Y     |    Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + | Hypervisor supports Static Partitioning                                                |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |               |           |            |     Y     |       Y     |    Y    |           |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + | Able to launch VMs dynamically after host boot                                         |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |       Y       |     Y     |      Y*    |     Y     |       Y*    |         |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + | Supports strong isolation between all VMs started at host boot                         |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |               |           |            |     Y     |       Y     |    Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + | Enables flexible sequencing of VM start during host boot                               |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |               |           |            |           |             |    Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + | Prevent all-powerful static root domain being launched at boot                         |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |               |           |            |           |       Y*    |    Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + | Operates without a Highly-privileged management VM (eg. Dom0)                          |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |               |           |      Y*    |           |       Y*    |    Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + | Operates without a privileged toolstack VM (Control Domain)                            |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |               |           |            |           |       Y*    |    Y    |           |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + | Extensible VM configuration applied before launch of VMs at host boot                  |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |               |           |            |           |             |    Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + | Flexible granular assignment of permissions and functions to VMs                       |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |               |           |            |           |             |    Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + | Supports extensible VM measurement architecture for DRTM and attestation               |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |               |           |            |           |             |    Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + | PCI passthrough configured at host boot                                                |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> + |               |           |            |           |             |    Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---------+-----------+

I'm curious about this, I assume this is done using vPCI so that
there's no hardware domain (and user-space device model) involved for
PCI passthrough?

I'm also not sure how you are going to handle things like SR-IOV
devices. Right now SR-IOV capability is setup and initialized by the
hardware domain, and the new virtual devices are notified to Xen once
setup is done. Do you plan to move those bits into Xen, so that it can
setup and initialize the SR-IOV capability?

Thanks, Roger.

