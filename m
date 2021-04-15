Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078353607C1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 12:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111033.212225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWzcc-0000sy-Qg; Thu, 15 Apr 2021 10:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111033.212225; Thu, 15 Apr 2021 10:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWzcc-0000sb-NE; Thu, 15 Apr 2021 10:53:18 +0000
Received: by outflank-mailman (input) for mailman id 111033;
 Thu, 15 Apr 2021 10:53:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWzcb-0000sW-8J
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 10:53:17 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52a3d781-664c-430a-93a5-70d4103a84e2;
 Thu, 15 Apr 2021 10:53:16 +0000 (UTC)
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
X-Inumbo-ID: 52a3d781-664c-430a-93a5-70d4103a84e2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618483995;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DmWqUnuqg8rSnyHiqtekdV3WBtWtFjdhj/fA9aDJstI=;
  b=Lblvth4M4T/dOe0qVGojjjq+VqlJMDT4QoocMwkI5kiNnT4enmG+dSgu
   wuOu2IcKWbanzP3+xEfs2yv4vvk1Kr6szQLOmdf4Ya8glEx9H6BUtpcyy
   7Nygg6ePI9TjkTiQRleHe2+K4a5NXosSOVuevGgissJxlnpSKjEVMT94s
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g0HMG15E3+ihH/3TFl7J5XbJ0AkVj7b+ijIjSI0yJd55AW/ffBH1Zix5JhVKOg+fVHlJvvhKT4
 Qfbf0vLIyTQotwty7qaxVpQZ3kg6Sb76DFNgTtkd30hhs3BNtUPGMfI3GCAxf0CLDkLXHS2b4G
 Pz8/PeQ09YCVfEuzivnTJqFEvTBEQfCRHQCWJO9J7RYIwdt+3Rm2U/IQMgpjN1asMANaIiTpx3
 vf19S+r3NX74gy2X0BfEwnqi8Qy6I/lOVs2HYfLj7Lve1HeRocdFWz+K+RsfFAVM4PzcFXiP7h
 9/Q=
X-SBRS: 5.2
X-MesageID: 41654599
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tSNGYqBzAFrwT97lHeg/tMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPvfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VLdMgXE3Kpm2a
 9kGpITNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0McShBQchbnmFEIyycFVB7QxQDKJoiDZ
 yH5tdGoT3IQwVrUu2QAH4ZU+/f4+DajZ6OW299OzcLyimryQmp5rnzDgSC0n4lMg9n7L8+/Q
 H+4mnEz4q5tfXT8G6560by6NBslMLl2p9/AqW3+7QoAxHNrirtW4h7Qb2Fu1kO0ZGSwXInis
 PFrRtlH+kb0QKoQkiPrRHg2xbt3V8VgheIozLo4gqA0L7EbQk3BMZbiYVSfgGx0TtagPhG3L
 9WxGXcjpJLDHr77VXAzuLVXBJnnFfcmwtarccviRVkIOwjQY4Uh4ke8ERJKYwHDSL35as2ed
 Mecv301bJ4d0iXYGveuXQq6NuwXm4rFhPDeUQavNeJugIm0ExR/g89/ogyj30A/JUyR91t4P
 nFCL1hkPVrQtUNZaxwKe8dSaKMeyPwaCOJFFjXDUXsFakBNX6IgYXw+q8J6Oajf4FN5Icumb
 zaOWko9VIaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nVWKfrCyueU1oj+vHQ4sk3M4n+Yb
 KeKZhWC/jsIS/FAoBSxTDzXJFUND0wS8sQltEnW0+fg87CJ4Hw39arMsr7Ff7IK3IJS2n/Cn
 wMUHzYP8Nb9H2mXXf+nVzwVhrWCwnC1KM1NJKf0/kYyYALOIEJmBMSk06F6saCLiAHlqQ3eU
 B5MY72i6/TnxjzwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//KSZH5Vx3nCAhNkVcvZHE
 p+qj1MiOyKBq3V4RpnJ8OsM2qcgXdWjmmNVY0glqqK4tqgXIg5AJYgUKlYDh7KCBRxpAZvpA
 54GUw5b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+aiV+Rvvg1RnwQXyenVOmehQpGfUsSun
 RBt4skxJaQkzemLmUyxMA1KkdFZmisDLVaNwidf4lPlrf3eAZ/cHeSiVWh+mIOU1uv039Xqn
 3qLCWSd/2OOFZbt3xC+ovB8V9/dAymDglNQ0E/lbc4OXXNu3513+POW7G61HGJbEAehssHNi
 veXDcUKgRy5ty+2RKPggyeHXE+yphGBJ2aMJ0TN5Xonl+9IoyBkq8LW8JO9JF+Ldb0r6slV/
 mcdwL9FkKPN8oZnyiu4lArNyl/pCN6zbfG2Bj54HO523B6K/zIO1hiT6waJdbZz2WMfYf97L
 xJyfYO+c23OSHNT/TD74f9RTtKMAnSrm67VPtAk+EdgYsC8J9IW6DGWj7J3kxd1BowLM3IhF
 oTKZ4LlYzpC8tKRYguYCpX8VoiqcSXIGYqugLwBPUifVtFtQ6tA/q5p57Jo6EoGEuPuU/ZPk
 Se6TRU+57+LmG+/I9fL6I7OmJNbkcgrFxk4eOZboXVTCGnbftK8lb/EnizdtZmOeW4MIRVih
 Zx+NeTmeCLMwL+xQDLpDN+Zpt0zFzPe7L6PCu8XchS89K7PlyQgqylpO6L5Q2HNgeTWgA/no
 1KdUsZc8JZrCIt5bdHixSPdg==
X-IronPort-AV: E=Sophos;i="5.82,223,1613451600"; 
   d="scan'208";a="41654599"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXOrejAbdRxOfQ+w8h/ZiGusRtukTzQV98v9hvGcCTFOoqUDlNYjmTJZ7xmMmEim+tNGEgUimgfVzEuNwHssJ2iAG+d1I8/qwOt0chfX318jjCp8dHhmjZbF+KoojLuHwlD6U7q3+y5bnlb4DOFlc1uKQB3Ub6z/TMJZCgGbiVGUpcezaF0NDApXe5ESFzAZvRSac1aK05R5zyJx2ZrBcVqYfB/N4k/AwfD6V/J3ehA+7QGhTHu1xdVJE6GjDGb8t1T/JW9XHjGMv0deP4K8xESrZo9pp+g8tFrFeq4JeR+lgK/RxH22d3ENL+GCL63RhaA98fVjySzq4mUDb2p9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+bnCOuqyrlT2GlTpm6EFhRjWFvQaeXnuOrSnm6KZGM=;
 b=GMmw8PQVW+QLFU4EcpN2fDRkAAqKXvMOMVxRkPc7nUHyfxcTGebilePQYM8HrZsGjdQmYDTdOg+vPnG6rW4soo+y3F78HaPvLLcPl5nPZ3KPH5Dqmm84NRUjMkqZgvOwsq+mIPAu62BYIL+vOA+TmfFk/7jqI59P4P+MrMymBpq/akjddfLR/WLKrax609j985AdRIxTXFgHapYQUAMSq61l9Z+31Bklo/m6aKwO0M7E7jksSTXgC2aYb5GOS9Il/fKJ7+UF2RtcIrHsABInTm+4th1B+CwOuPTdObw8rbLiRCSWULv2H8584+pZ/dWpLbn/8yqzVXIJBON+ytiGbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+bnCOuqyrlT2GlTpm6EFhRjWFvQaeXnuOrSnm6KZGM=;
 b=bgk0lAK16PYRBqo8bWyrP31GyGAcVKEzcV4Z1KVkc8Zj1ryUtVMe97LQp93GvF5WcIYT46Rs2+ty83iayLqzlUw+Ec7JdbMu2DHe9m3uH4TSxbuy502MAditK1K4fng0FNk9PlSuKk3EsM7TZsz+Nd+raP6+NLYLAQgONtECKJI=
Date: Thu, 15 Apr 2021 12:53:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] x86: correct is_pv_domain() when !CONFIG_PV
Message-ID: <YHgbE8Vxb67nYkuC@Air-de-Roger>
References: <3bc868c1-1003-2f80-1617-d64a1e7441bc@suse.com>
 <9667345e-835e-7c55-8d6d-2774008b0017@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9667345e-835e-7c55-8d6d-2774008b0017@suse.com>
X-ClientProxiedBy: PR0P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18dd8cb3-4ce2-44e2-edb5-08d8fffca9df
X-MS-TrafficTypeDiagnostic: DS7PR03MB5605:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB560520D9DBA7FBD06B5FD62C8F4D9@DS7PR03MB5605.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4SVk8Oyc9Vm434bc+tm9lW72voS9AFxqFmxjX8sjKWNn3AQddqIhjbWQ36onyouxJhEA2lHCyqxY9Il9lHfoc0KP8Rl4oQFLypT8HkzGXxvozm0JHbflzrVx5JyASq/kgXW+Ri+I1g8/9aam9qvMUl6noCLBUcXtf6nDthQoiJKPtGG/y0RaY64yWF04bpvx19m/gHa5m/m80DMNgs5RysR2PpcDMva9+85A7GBTV0EehgdTTRO4zQ0lyNem9BYxFT4LIFCK3tyiD/zeM0ghXhLoONS0HbCFjbCrzlU5XVCQzZfXtRZZHe4i8GhGLCTkag8ZHN+kXR4xd9iBv5ySbgbqp8+2nJrTh2HjAzMOWTdFmbOBHLRqdQO9j7mLvaFT1eJsh6IbYaZ/Fy0nnikpRED1326wsty0ZygbT7sa9Bf+ailw067FiE+DrpVLeCe81yK7kN4jbx4kIbZu86YzCNZr0qeJHd1gAXV8OfMkBFxZMAQy0eVJq2c3lWnkCPfKzN6P1DcsXOM3DaO/6eb3LsMpB90O6iHzIkm4MTlkO05iK8Ag2kUYjVGYA9sPByaxJBIG1Qi9DZ61NO0aCDPPAIpZO/+Krei5gZOFhFjNC0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(39860400002)(376002)(366004)(346002)(6496006)(9686003)(2906002)(38100700002)(5660300002)(6486002)(316002)(956004)(8936002)(85182001)(6666004)(54906003)(33716001)(16526019)(83380400001)(478600001)(66476007)(86362001)(66946007)(4326008)(8676002)(186003)(6916009)(66556008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VHd6djA0T25UaWdNbmhIMTFzeU5jZWYyaEZzMnA4L2sxSnUzeGM4MlhuRDRY?=
 =?utf-8?B?cnpOU2MyUzRuY0pCL2VCbTFYcTBuWmVmSSsybUZmMTE5cjhvSk9iSWpraUl2?=
 =?utf-8?B?NDd3UTZobVc5RmhYR1ltM2dSeFBDdmxrZThxTHNjbUprQnVXbGdwWUR1NDk0?=
 =?utf-8?B?OW9vZittUElUT1J2dmhORnd6clVYSG9rYjFVcTVnN1pkTGYvY281Vm5VMEVl?=
 =?utf-8?B?V1BuRTlqeWcrd2tTN3RYS3lDS0ZYYUVtcW5LMThEaG5oQTFwSyt6Q1lIYVZS?=
 =?utf-8?B?RmZNaXhmOGRSSDNLR2hGN2RvZHlYRXZ2NXJ6SjNSaG9FeG9ZMlgxVnRwYkdM?=
 =?utf-8?B?T2xFMWJKem04UUpOZDZTdzl4Rm1hYVhGQmJjak9BMHVHdS9rekl6Ymg0REJJ?=
 =?utf-8?B?bWRSODdmN0RMaGdwRGpvMG9wYXpQQUUrMlNrbkk5YlJldjBPanRXUlFXb3ZE?=
 =?utf-8?B?OEhGOEhwT0ErM2tVMUxpYzQyY2lxU3BsNExVTVhpbVg0dTdNZ1Z1MzQ4V1NY?=
 =?utf-8?B?UWJXNmZ3OUdoYk1ldXVMQTNFZ1lIV21ocTFkbWJad3l2Q3Nld0wzUjBoMFhq?=
 =?utf-8?B?QmhFV3RtQkV3WUlvWGNLQVdPdVRWd09MdkY0RkZ1bzNnMXhueVptWkU4SGJv?=
 =?utf-8?B?MnVXY2c0TlRLRUZWWGF1SVorbTc3MGtmeWFtN3AwY1BhODZ0S0RHcHo1Z2RR?=
 =?utf-8?B?Z2JQaGVqRkJHVy8zK1VjeFU3YWl3Zm1rTVgzdUwyTGpMMUNmRllqU0w5RTJV?=
 =?utf-8?B?VXFzNmN3QlBDWjVpQ294TXo3TWVHcmFMdzlHSTRIeG5HcHV3RXQ0UEd4YTU0?=
 =?utf-8?B?MjAwU0hlNnZRSVBocUpIaG1wMFZnTUlMVktuaTdFanY4ZUZkZ2g3WWJtQlB3?=
 =?utf-8?B?SWx0YjJGeitkR1dtU2hLL0tJd0ZoOW1WbjY0Mi81VEloTUs5WUhFSncwWERz?=
 =?utf-8?B?SmI1MFRtaWZjbXBCSHNCbE8rMVhvb2tQV0I4T1R3UTJyL2s2RUJHL0V0RldL?=
 =?utf-8?B?aGo1WjZZWExaS0RoRHpmeFRISkxmTkxCTTVqbjFUUlR4UnlMNnJNd3g1WklX?=
 =?utf-8?B?cUNlYkprTTlYNG5EL2pXenZiNjBXbkJoWnlibVlXM05tOHIrTVJXZnZ4L1Nr?=
 =?utf-8?B?ZC9nakRFYVpxcWdqMmdOQml2NStSOWg1bmxab05aME5WV0I2MkdIejIrRVZ3?=
 =?utf-8?B?Wjd3R3dSbzlBa1NDQW5xaFY1TlZ1dTZmcTJCSER4Tjl4NUw3RVN4OGIxR0E2?=
 =?utf-8?B?eFVwdTR1dE93L2w5YjdqbGxWaXBxQVFnekZmeHIrUGY2VmswV3dycXBWUnZB?=
 =?utf-8?B?bVB6NnVHUE1EcUM5UGU0VmlqT2p3RytwOTFEbXRUOXlCcFRhcjZVK0hCanEr?=
 =?utf-8?B?RlNtS2tpRjlWOVdzbHZXR2Yxak9hYzMwZCtRYWVNQlE3SG56QlZTSDB3QUhi?=
 =?utf-8?B?MC9OR24vMmNTaUpWd1l4T0Vhd2p0UEZYbkhCSndTcE95ZXVmZTl2ZGNtNDZr?=
 =?utf-8?B?MXY5aTFicktDK3RTazFzU3A2RnB3UlpZVGcxQmw3elJRVURIcTArTE91MWZZ?=
 =?utf-8?B?YldRM1UyUWZVUzViTEF3Y2xrU2xOWVhlSEtlOXlsc2o5WWl4MEZVVnpiOHQ4?=
 =?utf-8?B?QWJwR2h5Ym4rYkt5emh6RFlVc1QrNGROTTVzVEtRRE5nQjZIVGZxbmFvcnFa?=
 =?utf-8?B?R0VZeHVoUU9yWG5FcEhhc0FIWThKRElyUUxiRUNGUHh5cHVOdUNiZ1I5b0FL?=
 =?utf-8?Q?IuafLGiX3HYdLfI/mfqBJe3hdz2itnxDG0u/AUK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dd8cb3-4ce2-44e2-edb5-08d8fffca9df
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 10:53:12.1653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTS6vRBjXndCvbylKNE3plbXLvjcmjXprQ+ptglFnTFhtYXm9rBBpevPjkX9SNOhsPE/MgeRgH26eNH8til8WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5605
X-OriginatorOrg: citrix.com

On Thu, Apr 15, 2021 at 11:34:55AM +0200, Jan Beulich wrote:
> On x86, idle and other system domains are implicitly PV. While I
> couldn't spot any cases where this is actively a problem, some cases
> required quite close inspection to be certain there couldn't e.g. be
> some ASSERT_UNREACHABLE() that would trigger in this case. Let's be on
> the safe side and make sure these always have is_pv_domain() returning
> true.
> 
> For the build to still work, this requires a few adjustments elsewhere.
> In particular is_pv_64bit_domain() now gains a CONFIG_PV dependency,
> which means that is_pv_32bit_domain() || is_pv_64bit_domain() is no
> longer guaranteed to be the same as is_pv_domain().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Add comment.

Sorry for not replying earlier, I've been thinking about this because
I don't really like this approach as I think it makes code harder to
follow for two reasons, first is_pv_32bit_domain() ||
is_pv_64bit_domain() != is_pv_domain(), which I could live with, and
then also is_pv_64bit_domain() returning different values for system
domains depending on whether CONFIG_PV is enabled.

Given that AFAICT this patch is not fixing any actively identified
issue I would rather prefer to introduce is_system_domain and use it
when appropriate?

I think that would be clearer long term, and avoid tying ourselves
deeper into aliasing system domain with PV domains.

Thanks, Roger.

