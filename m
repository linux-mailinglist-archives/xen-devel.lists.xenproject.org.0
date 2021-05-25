Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0143903A0
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 16:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132205.246685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llXnL-0002cm-3W; Tue, 25 May 2021 14:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132205.246685; Tue, 25 May 2021 14:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llXnL-0002a4-0C; Tue, 25 May 2021 14:12:31 +0000
Received: by outflank-mailman (input) for mailman id 132205;
 Tue, 25 May 2021 14:12:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kR7Q=KU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1llXnJ-0002Zy-HW
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 14:12:29 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56667df7-6de8-408d-a479-482e040df043;
 Tue, 25 May 2021 14:12:28 +0000 (UTC)
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
X-Inumbo-ID: 56667df7-6de8-408d-a479-482e040df043
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621951948;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Tk5R2CXn4ABCHVx13cYhL1dKO1JTTwTyO92ZNrEclwk=;
  b=fstb1+ioI/tTsdNQu7x6usJyxIz6CY8RHe8cJagzB8FWDsWVpPt3eGP0
   xE/5yfuRdrYnN/OH4mUot1eFeo0QhSl8Rq4qskSCSlUzi0NSbHFwcL2iz
   HNVsQ7a3ggbRqGb8SuIK9TgpfXtG0MLbsSPr58odhvEDXWs0IpZIvl9JI
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8XD7RitWvw4DcHXM3RYj+5KWTrB0RDStYamZrJJdbiD3j19dM4zj62AIBTfviMv2p4cQntrVcX
 nrU7jEdiy1WfUIOv9fxrS1y/izAxqPEopCxjfpNRad9qIe0FDWYfcd1kfwaWYbJbFBlDdp1MEw
 /Yp+LdVtIAYkyoENRreCf2HobbK8sREa+DG7+hhyjgzA8RTaUfJUX4fNGKrRkzl540JjRt4CpF
 vZxQmnMKYh8+W5iOkbIBkX9FM0vg0cx/Kg/G9yuHwyfWf4LG2AWn+9lpIkH/ChNHt8AKpsggHx
 t3s=
X-SBRS: 5.1
X-MesageID: 46126971
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:9ksSWaC4y2181RVW/0Ljw5YqxClBgxIJ4kV8jS/XYbTApDgh1GMHn
 GtKD2uGPP3eZjGjcop+aYixpE9XvJ/Vx9NgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaH4EjratANlFEkvU2ybuOU5NXsZ2YhH2eIdA970Ug6w7Nj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhU6
 Mlmk8GVcDw7O4eVwdYnczBoSCpxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM0DF3bveLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcEgm5q2JERRJ4yY
 eJHcAFvdhKfYiRiJ3UWS8oklc6toEbgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkeHp
 ErW8mLhGBYYOdeDjz2f/RqEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTr18sljlJrfoDxixI0gYZRgcTeUdpsocHGUY7
 H+gr4jiCmk62FGKck5x5ot4vBvrZ3JMfDVYO35aJecWy4O9+dps0nojWv4mQPbs0I2pcd3l6
 23S9EADa6MvYdnnPklR1X7AmS7kgpHUQgMv6gzTUwpJBSsiP9X8PuREBbXBhMuszbp1rHHa5
 hDoeODEtoji6K1hcwTXHo0w8EmBvartDdElqQcH82MdG9GRF5mLJ9A43d2DDB42Y5xslcHBO
 yc/Rj+9FLcMZSD3PMebkqqaCtgwzLiIKDgWfqqINrJzjmxKXFLXrUlGOB/Lt0iwwRdErE3KE
 crCGSpaJS1BUvoPIfvfb7p17ILHMQhulDuPGsijl0rPPHj3TCf9dIrp+WCmN4gRxKiFvB/U4
 5BYMc6LwA9YS+rwfm/c9ot7ELzABSJT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:cMfxoqBhxzNMxtTlHeiasceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U8ssHFJo7G90dq7MAvhHP9OkMEs1NKZMDUO11HYSb2KgbGM/9SkIVyZygc/79
 YqT0EdMqyVMbESt6+T3OD7KadG/DDtysCVbJLlvhVQpHZRGsJdBmlCZDqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOqXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6R64aT1eUYpDLS8KoDOCW+sLlUFtwqsHfqWG1VYczNgNnympDs1L9lqq
 iIn/5qBbUJ15qYRBDOnfKq4Xir7N9m0Q6f9beV7EGT3PDRVXY0DdFMipledQac4008vMtk2K
 YOxG6BsYFLZCmw6xgVyuK4Ii2CrHDE1UbKUNRj/0C3WrFuHoO5bbZvjn+9Na1wVR4SxLpXbt
 WGPfusl8q+K2nqEEwxllMfseCRYg==
X-IronPort-AV: E=Sophos;i="5.82,328,1613451600"; 
   d="scan'208";a="46126971"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgR5iuAztOlWocJx5qm1T7W3dqFJ3oFAcVGy7way9ZMSpGJQGuJXi9jf/NJu9IALyR6A9Ei1ESsHscxThWhrchznJ+zHyoH5ZtgEy8n/lP4HboMdvrcuoSdcJQq4uZenbDrlx2T+2BSjA1hTLqM8vVNPzKe8oHa/a55z0ESoys57pIsGp49nSy/xBK6BPTfPHf/k7+U6T+O2hXFYdQoAWOEJnox2HXRV4Ud424lbFe1PZJFly2drhmWV6krO2y/RGJ2/nlw+qvMTigOznrs+bZk2bMw9gHWaR/4C1VTHyBvm3q0qNxeFvMHEcnr3tcZFoMkgk1iogK4LcMg1Xay71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOywZKrDduUiNYpkV64W6bHWcaGeA5M553mF+IcM46k=;
 b=JeBhBeelWzLUt9Rt94TSz0tyCbVFydnN6T1yl1+fQ59pxKXuot99NtEGvSl6P1lCo0ThWurTWPIyNtZoYSbM+6ceSLwkWtyVcFEITV+eafnUxkA2ZuESa2oGRj2QJFOhGNveo3yRBzRUM4h1g/E6SRELVELQll8nFdnnsKPV+xO5Nx2PfHuDSc0yAVXZ4kmtZuRJN97Is6jT5hKtthonM+QkyFYHvaAyEEFnvr8BA9Mw76DNcZXgm+SYFZXJ//AEqMSBkFoPSvR3bQBxfFSB2yeCBcanpzhOtgEsGyxuhFvgtE8X6uRyn5Xm1RShfy4oCpb1ap3iYjkU/X0pxljFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOywZKrDduUiNYpkV64W6bHWcaGeA5M553mF+IcM46k=;
 b=FVErCiinY8a6ArwsvBRjlUDwI4nHBtCIi1PEwBliYL91Niqk6wEaYg8cypUnssnOLFzkbSmUmNvaXLuv1H6uPCFLw81pcGDS3AWO6U2V+R33IFkYaqJ0PNAYbMYavfS6DQkTMbYWSQOvfWoFgrzfb413WNyVM4l8IY4IQbZPt8U=
Date: Tue, 25 May 2021 16:12:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH 1/3] firmware/shim: update linkfarm exclusions
Message-ID: <YK0FuouoB7XlaQst@Air-de-Roger>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
 <d6f37d26-a883-b194-07a9-1ab87d5961f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6f37d26-a883-b194-07a9-1ab87d5961f7@suse.com>
X-ClientProxiedBy: MR2P264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b12c3094-4c05-43c4-d07b-08d91f8719c5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4219:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB421934D67E81182BB58FAD238F259@DM6PR03MB4219.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1dUAkAOoeD/4TXMJY59sD2o1EyMX+sd407tll881i8TZAV8VRjuQ6S1FJWLbYAf/56rc33jEliyyVevKG2BU3AKF5coLBcCYGq1kUVKnRUIZsEzrDQ/XZ//Jseq/eTcdxiF8W0fguI6B319eNoQ1nQkBWGYImuyAcyRjF3oEaKPJhKP8JDA4XpbcEaYNP1rgWVDT/zUilctqLpm6u4LShrvZ0nxcE+2shMSrmixqQtXQasivgQorRLa8HlXvZXSRjctTevx/FtEMN/ZOoANH+2wbkMdqLFEHAt5tNtwY+g7aHITuJ8UHRqkLrx0txeMtJP+8ba30m0WgxY6xkKm4UNtCLtB7QOroaCzbDXq/iw8Yw6XiEAuXLmsXoTWxvJXGoaH+JbEUb9AnMA/Oz+cWgW/YJ6/j1K3A+zgnQxG0IS/LC4tVElvp+DySmpsjVSDm6M1QqNmWHXyNc209ppGpSik7gzxUaDsl9q0C1HWWc65VGHDUhWWzRD83/fpP1Z1zZiwIhW0a50kF8GPc5veeVBS6urTNnTzQfH50f7AXv0OnCp4TyQ5KuMnFTpEoIAVRl7p5B/uYl+7/eNgV5PVXqOqAujp7+WiIKbZfZFJ/2ck=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(39860400002)(346002)(376002)(136003)(66946007)(26005)(86362001)(956004)(33716001)(66556008)(4326008)(5660300002)(6486002)(38100700002)(66476007)(2906002)(9686003)(186003)(8936002)(6496006)(54906003)(6916009)(85182001)(478600001)(316002)(6666004)(16526019)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?blJSeFU4QUhFdjZMNDcwT1ZJVWtyZjVFSHYzZVB1WHhuem13emdHYWJ5OVA4?=
 =?utf-8?B?bmxnUjE5MkFtTVpFbzhNcy83Y1pCSHdTQVAyVnVVMWdhblNqNzJqSUMxcElP?=
 =?utf-8?B?ekRIU1ZFcnQwc0VjenhDVE1MUWwxMytTYlB3TGJ0WGVMVURtNkl3L0Zxb051?=
 =?utf-8?B?aEJ6aXRHME9QSnFqQTliaDlBTE8xdmxoenRUaGFYZ2FqTGxGZ3k3Wmc0RjJx?=
 =?utf-8?B?a3huZGhvd3B3dFhuNnBIRk9yeWVDdUhwcmtIR0pQU3BDZGFRSXR4WjVRRmwy?=
 =?utf-8?B?NzZpWkpDdVgzc250NUpJZkQ2Q3pyRUZ6eFpJWmhGT09kVlB4Snd4M3orcnk3?=
 =?utf-8?B?ZUVFd2VsQ2R6NDdWUU5ibDVXSlNWSjZFbnp1eW5BOXkvUU9GcnpUNFRtSHZm?=
 =?utf-8?B?MWpXM3pKMksvbVg1cUFEZ0tWUlJTemNSemw0c3Q4YkJ6bkdNRG8yampLWUtQ?=
 =?utf-8?B?OVIycGtnWk5hMnkyUnRKMk1BWVRSTWd6ZzFyRVJLRUoyUjFlL3ZYVzlqeGR2?=
 =?utf-8?B?ODRneERKOVZpOU1vRmtLVHJ4VmJWVmtVU0twMi90RFVSOVJsenJmTXIwUng0?=
 =?utf-8?B?WEFPbUV4cHZ2dmVYdHV5SnZXVzE3SDYwMXVsMGd2VDMzTnViTU5jUU5tc1RL?=
 =?utf-8?B?NFVjd0ZGeHpMaEpQcWN3RHpxcHZ6OFNjQ3BNWVl3ZWpYY2hiemtOWHI0Wlpx?=
 =?utf-8?B?ZUxONW1KeUxJRXZwekNQWWRmYjkxQlVHaGM3RzUwUjJKeGJiSnhsMEcyWmdt?=
 =?utf-8?B?T0FSenZ5WklpYmpjdlV1NUhOcFhwQmIrYXpCVzlHb0R4VkZGVCtwMGJFV3JY?=
 =?utf-8?B?V3RMSzcwTHMyWjFsc3pVWlg2L2RHWG4wRGY1UnpML2RoSjFpRW56YWwvNDdT?=
 =?utf-8?B?SEd4RWxmZFdXUTNTNW85QzVOUTVHdnZneDZnVnNPOEM5NEhDeE41SlNZTGgr?=
 =?utf-8?B?QVN4eEhDbGFVRXJlUGxNV1dOTzJqVFlNVXFRckV0S1lWM0V1VXJiSVhZT0wv?=
 =?utf-8?B?VzNWOFZTYnhDb3BvYkpEbVNKLzJkenBnM3loL1pyL21mOFhMYVNnZHcxSWVt?=
 =?utf-8?B?djVqMlFuOW02eG1IMkJrcVFDbTNpU0F4NUlINDhQcGZ2dERlNTNqbUJRbE1v?=
 =?utf-8?B?ZGREdk1jS3VjNjE4emFneFFVbmFZZjhUQ0ZaUGlRREFMSlNYTmhRUUthb2Er?=
 =?utf-8?B?Y2hKQy85amdQZis5YWJWU3l6MFJ6Nzk3WHIza0h4SE4rbU5WZGdYOVBQem1D?=
 =?utf-8?B?WXd2Y2lCZVVPczhIYkcxbm91bEJ4WTJTeUFKc1BFUkN1OGJWUDNsM211TUVW?=
 =?utf-8?B?WWcra2l6OEFJVng3S2F2N0RXSVFmcVVkMnh0T1Q2S0cvZmpaTGNqcFdsNHJ0?=
 =?utf-8?B?VVUzazN5NkQ2YkttRHNlaHdJejEyZUNqSEFyQlZMZFVhdTMvU3I0WjduMitN?=
 =?utf-8?B?TkgrUGdKZTk5aVN0VFJlVWpvelNkcmdxSHZtUFVxd3lzWWc3VDZ5cFNZZ3ZZ?=
 =?utf-8?B?Tld6bzVIQzVJQXdzYm1pa0xxWWNBaVUyVHFoNEVEZy8zVC9jdUo0dFh0Z0U3?=
 =?utf-8?B?VVBKQW1HUkdhby91T1BLMld2ZnhSWjhtcEhTbzdNSmxmSkpJeC9ZR0Qxc0xI?=
 =?utf-8?B?SVNRNjlJQmdsdyswTWJZSkJ3WGdFZWJLZGkvOGpPOTArWE41T00vMDVXWFB0?=
 =?utf-8?B?REovY2RpSEo1enNKVGhuUlc2SXJPemsvRzZwQVg0TTZ4L0ZZSG9sbkRTYk5w?=
 =?utf-8?Q?hCGqYs48bftB8ngf+JhiFWTiwe7sPXL98whM1WH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b12c3094-4c05-43c4-d07b-08d91f8719c5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 14:12:16.5595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNVusrxi/grBoln6wsF9kZjmifL5/0RMgePQfv7hIvLRR9YUBEkxGJPZ4gvMQWTSPbKW0nU4OwkEAm8iplsrZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4219
X-OriginatorOrg: citrix.com

On Fri, Apr 30, 2021 at 04:43:59PM +0200, Jan Beulich wrote:
> Some intermediate files weren't considered at all at the time. Also
> after its introduction, various changes to the build environment have
> rendered the exclusion sets stale. For example, we now have some .*.cmd
> files in the build tree.  Combine all respective patterns into a single
> .* one, seeing that we don't have any actual source files matching this
> pattern in the tree. Add other patterns as well as individual files.
> Also introduce LINK_EXCLUDE_PATHS to deal with entire directories full
> of generated headers as well as a few specific files the names of which
> are too generic to list under LINK_EXCLUDES.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/tools/firmware/xen-dir/Makefile
> +++ b/tools/firmware/xen-dir/Makefile
> @@ -15,9 +15,19 @@ DEP_DIRS=$(foreach i, $(LINK_DIRS), $(XE
>  DEP_FILES=$(foreach i, $(LINK_FILES), $(XEN_ROOT)/$(i))
>  
>  # Exclude some intermediate files and final build products
> -LINK_EXCLUDES := '*.[isoa]' '.*.d' '.*.d2' '.config'
> -LINK_EXCLUDES += '*.map' 'xen' 'xen.gz' 'xen.efi' 'xen-syms'
> -LINK_EXCLUDES += '.*.tmp'
> +LINK_EXCLUDES := '*.[isoa]' '*.bin' '*.chk' '*.lnk' '*.gz' '.*'
> +LINK_EXCLUDES += lexer.lex.? parser.tab.? conf
> +LINK_EXCLUDES += asm-offsets.h asm-macros.h compile.h '*-autogen.h'
> +LINK_EXCLUDES += mkelf32 mkreloc symbols config_data.S xen.lds efi.lds
> +LINK_EXCLUDES += '*.map' xen xen.gz xen.efi xen-syms check.efi
> +
> +# To exclude full subtrees or individual files of not sufficiently specific
> +# names, regular expressions are used:
> +LINK_EXCLUDE_PATHS := xen/include/compat/.*
> +LINK_EXCLUDE_PATHS += xen/include/config/.*
> +LINK_EXCLUDE_PATHS += xen/include/generated/.*
> +LINK_EXCLUDE_PATHS += xen/arch/x86/boot/reloc[.]S
> +LINK_EXCLUDE_PATHS += xen/arch/x86/boot/cmdline[.]S
>  
>  # This is all a giant mess and doesn't really work.
>  #
> @@ -32,9 +42,10 @@ LINK_EXCLUDES += '.*.tmp'
>  # support easy development of the shim, but has a side effect of clobbering
>  # the already-built shim.
>  #
> -# $(LINK_EXCLUDES) should be set such that a parallel build of shim and xen/
> -# doesn't cause a subsequent `make install` to decide to regenerate the
> -# linkfarm.  This means that all final build artefacts must be excluded.
> +# $(LINK_EXCLUDES) and $(LINK_EXCLUDE_DIRS) should be set such that a parallel
> +# build of shim and xen/ doesn't cause a subsequent `make install` to decide to
> +# to regenerate the linkfarm.  This means that all intermediate and final build
     ^ duplicated 'to'

Thanks, Roger.

