Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3181315366
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 17:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83321.154753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VX8-0004L4-9Y; Tue, 09 Feb 2021 16:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83321.154753; Tue, 09 Feb 2021 16:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VX8-0004Kf-5Z; Tue, 09 Feb 2021 16:06:34 +0000
Received: by outflank-mailman (input) for mailman id 83321;
 Tue, 09 Feb 2021 16:06:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2YR=HL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9VX6-0004Ka-H3
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:06:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 279daca3-9d9a-4eda-8fa7-405d953d945c;
 Tue, 09 Feb 2021 16:06:31 +0000 (UTC)
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
X-Inumbo-ID: 279daca3-9d9a-4eda-8fa7-405d953d945c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612886791;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mfADmmA5oo9A3poCZNPBvD61kcuRgiB6lJAGQ0GhQcI=;
  b=HEl0Rq5pHBoxNuETAQO1o7brYHpv990tVFbV4+txZgPnfoorIA/gYt12
   mTEWT+woVwpo/5EoQp59VI0ueMQ/7BC2YGuV6wkLJ+I6xF9zfnr8367IM
   N9TiBtczWLrtAkBKW18WYqhL+7+3LUDRemOxky1t4rCbS/9qyW5y6ypuk
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YrnJxObSb9qn6D3kJ7/fwIxqLbO9c7ct+cyYxsCY4syHuGQy5tIktycwyqa9PF2RwNgpIdeS5S
 +JNrc/VLvFe+zBGNU0T1FGDaY9oaDUe/tUs1L1xDkerFAXkakAdSWpHdMpGINXoWfdrZWsDH7a
 jcxgLmiy5GaeWRumVyiQDr/Y4dKeLvZYaSWcaDUmejqaEnIrMIQQxB9WGJ78aO6X+jQE+YicEn
 TwOnMJm6M6fJeRB3xuOy75auY7TI+g/djLag0LqMS5TTJwGSgoP3FD2053FJ4+zqcu7OjArXRS
 BDg=
X-SBRS: None
X-MesageID: 36818908
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,165,1610427600"; 
   d="scan'208";a="36818908"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDC2duD4FcKi3L1gkRcCqXDUL3K3sc++P/pyUZwXuVJrzX6dtsbY9NjyDYNhpksyzHGVBRzGqpRi8/KBUIG4kkVbTAaynEeluTUVWRTM/2u6EAnqI4QVUplVgRPDosPDMdqiCISBl2YyTM1FeY+nS5MFtr9rfeDvzXEsXpa0EMk/fWMqPPE5dH7z2zlvBcY3rMB+62U6SUy1Jy4N6l8TjX8fp+rLmfq0RBWgGa9HEyvpKF1nEOLuUWa4j2i06/j8Fe0xmftdRQ9er6XKuZLjgFeWAEoSl+kwYRujuANovWcUFvHqiV0rW32bWTHuqnvBujerHiIScERX5J2etG90tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69J3HOQhUjTMGEkNOvJ1siyYj8g7/5aQXC6Co04pVF8=;
 b=C2m46v+u34T+nstL6F/2J1FD1fFP0tJgXYD+g+OjQWaYjCQlPFZn6Q3SWpxNZ89y6mvlWbb761qLmy7edbnzxwjlRpUYXaBT4Xas2gLu7O79wolcD04buEqV5sQSKMk1MZq9RmiIrJzDVVFxKDSsa369yyUuCTNWPRaYUtG87RtA1xpa2pIHcc0NpGZ1rD6dfQlYBk1aTZDGmtNLLCuyXMOFF08ctwuQOMNI9aFXGt5fmy3YBELHPAVbaJ2YTwjIsTef/y9aAFe4xALGul4dkorc/+z8ummXi6p9F2g+tvy+RC/sxWFkJ42AmfhN/fH1TqdzFE3Vme1CTv+IyeXB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69J3HOQhUjTMGEkNOvJ1siyYj8g7/5aQXC6Co04pVF8=;
 b=sW2T9bQ+EAfMZZ9kgalT6xMtfLhfN1YNXxTNBpfEARtDGtqdJaX34fcpBhJ2MQ0ZZdTuq8CSoN76YeoZJIrhGAWj/rBLj6uHqtxE3/d6RN7AljSsVKyxCGweoZV/4fdBMxBaxeS+LbCybl25L9YTh23t9kPqwFG44WVNU3hhlhI=
Date: Tue, 9 Feb 2021 17:06:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 03/17] x86: split __copy_{from,to}_user() into "guest"
 and "unsafe" variants
Message-ID: <YCKy8lwh2YVWYChc@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <b8112628-a2e3-2fdc-9847-1fa684283135@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8112628-a2e3-2fdc-9847-1fa684283135@suse.com>
X-ClientProxiedBy: MR2P264CA0181.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::20)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9ae5f88-0aee-46f7-4f8d-08d8cd14a1c3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4970:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4970C2368922285F182E0E2A8F8E9@DM6PR03MB4970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5W1Q1wGmt63I3mp81PfWPH9Fzh25P3KyVSMyUnRwRcu/VqDQ4dbQ7XCn+r2nPuxBQMZ9zzsqY05DCexnOMZxAKOARgRHAiFvOEeKc7NP9xocr1zzFWfgByuz9A9x9R+yiCGm9Sp5wZXc49gYZvAFwp8VWdMlSv099Ojvpup/bOq569cXKjuzqTbHtGZ6UR/0rnTl+jcbmASJ5E4Nq107ItRaKV/b+rThmxpo4syHjd4mHsEvsTntdAFc9LzReud+L3DJ+v1X2TAVrSQvQ4ZxJ+laPRor2BOtdxVF5mt59WfXxSQ6bGySpuRokRENYQciHBOIE2nt72paFQxfWluaMPDpn+DudO8qCUuCtOIGb/wkdloQ7klxxkL6GH+1P9LsAh1ZYlPAzlzqfXHi2itnAai2VCPdxsMgIQ5VfM88VvBWbaSp8dOUx8HGa5yL9RCSJ0ZDq/jTs4uBlYqKBStu7c9RDJLaVnPUZVmz3I2TsLbWo59FcOTP/ZCbBqekE2RMFySyx6AVfWOW5i3w/Mv8Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(6486002)(107886003)(186003)(86362001)(26005)(83380400001)(956004)(2906002)(4326008)(33716001)(316002)(6496006)(66556008)(9686003)(66946007)(66476007)(6666004)(5660300002)(6916009)(8676002)(8936002)(478600001)(54906003)(85182001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QWpuRkJFWFVqcTNGS1c0KzZPcHl0Wm1Vb3hhcTZ0emNVaVhrdXVrZERnc3p4?=
 =?utf-8?B?emN6alRNSkFUODA2aHVSOUVaSWI3eklpWDlOZG11M2tDYnJkRkNjU1pPa3dQ?=
 =?utf-8?B?bG5VRVgxWDJ2d0pDNG9pRUZ3SnNzL0FMQ1NMR2t5NjEzeWdGaDhBZTd6aC9U?=
 =?utf-8?B?c1MrOWNnaFJibGMvdkxXZ2xSUElxV0M0QW5pd3hmTVljVk1uVnA2TXVodGcy?=
 =?utf-8?B?Z1dhRGxzaHI5dW9KbFdMczd0NmJ4T252dEdOSGZ3aGE1M01kbER5b3JLdnZa?=
 =?utf-8?B?VGhpT2QzbjJHdmF1YWVBZ21jYnhHejVVK3NwSzRDUUQ0cVpSNC9hSnhUSFRa?=
 =?utf-8?B?cUJzQTV3RU1WMVJDMVRUczY1YlU0aUdoN2J1bWxxYWwrZTRXendwU1RTTTNX?=
 =?utf-8?B?R2ZvL0JzRFBnWHV2Wnd3R0t4Q01BOGpBeEZCa3RzL1RjeXUwcGVSYjVMN0tv?=
 =?utf-8?B?eWJ0eVJRSFVjalRCVk9uWnNJMXh0YmtQRlY1VHdheFAzbVh3Q3ZLL1hjVVd6?=
 =?utf-8?B?SVlsK2V2Rmp6Y0xHWXIzalRwdXJJSU5UZVZPVjVhY0pWaXQ0MzZEcEtjbWVp?=
 =?utf-8?B?UmRQc2tBQlY4QUQvdE1wNjlDRnFBY2c1bUh4bUNZZ1dFTElLaDJ6b1ZEc01N?=
 =?utf-8?B?VGxOTEJ1UFFoNG5xQ3F0SGl2R1FvcUp0ZnduU2N2Tm1hbmRlUG90cW9LcmhY?=
 =?utf-8?B?Z0RPbTgyNklxWEh3NnV2dlJSVDJRajJ2eEs3dTJTZVBuWlJBczlqNjRNTWlt?=
 =?utf-8?B?S2pvT0lxRW9rRGIxRU5DVFZFa05LNEFsYkFSZElNS3BiL1ZhOWdQQjJ0NzVq?=
 =?utf-8?B?cERKMC9DQ3Q3QkFRTnFPYjlYdDZ6MmRsbEdremtpdi9PN0p2WkRGbk56WUJn?=
 =?utf-8?B?MW5aUUtXUS9wMFUwOHhzMWZFSUxjRTB4bndzSC82NHJxOXI2SHREL3VMV0Zw?=
 =?utf-8?B?NkR6YW82QWNHVjdRV3VoN2JCM3Q1QVMwS0lKRXhaYVB3Ykc4YzZEd1IwSEZK?=
 =?utf-8?B?bVZDUTFkRndiMFBSTy9ab0VNbERFZWxleklSNnlRQ1dVLzU5NFZ4Ym1TUWh3?=
 =?utf-8?B?em9kTTRhUUpBZUhRM0ZlcnJHNjdpcFdCSTlxbTVIQ3ZaWmd0RkNieG1MbWh2?=
 =?utf-8?B?RGFxUmp4T0RvSlNCZWZKOXZ4dmkvNTNiRm0yUm9NblRLRDIyRHBlMm5NZTFX?=
 =?utf-8?B?YUNqODJLeUlabzZGcFM2dDc4OSt1NU5aeTJMZ3l5QUFabTZKMGpnNkZDSFFU?=
 =?utf-8?B?NVh2NkVRYnZQajltQWJramV5aS9ZQXJEVDZ4YW50dTBtSTlNbFJBYUQ1b2Vh?=
 =?utf-8?B?cVoxT0FPdGhwVitxTHdSTFpUSXdyMnU3UHovV0dTdGhQUWhwYnhKdDRINUZE?=
 =?utf-8?B?Z2ZjcXVrT1ZkZ0I3VTJ6T3RWNEdYZDZlMkxIS3F1c2o5aE02RElxVCt1d3lo?=
 =?utf-8?B?SUJwSE15VEJ3bUtRWlNrdW1rbnVFdkR1SkVGNmRENHNGTzNJZ2U1NllVNmx4?=
 =?utf-8?B?WEpyUXZxb0Nsd25LQVpMNzFxckp2Sml1Nld5REVNSEZ0bzNacXdXcG9JcDZl?=
 =?utf-8?B?cmp0TFRXY3JVMjJIY2NMdURKWXlSd2JRbHJWUDJ4MmZkclNucko4Ym9seGF1?=
 =?utf-8?B?Vk5zUmJ6aHNKdndrc0I5bTYvRnIzYlNoRFo3anU3aHpyTWI0MjdEUkdJRTZY?=
 =?utf-8?B?dVdpUVJ4a0JuRGhGRlZUMWxPVHMxRjZ3QmtzM1JZajBWR3MwQzFUVmdNRDBU?=
 =?utf-8?Q?7ka6r4qafH46zN/2U3WkOJNDKJioMV6Ojm+UIcS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ae5f88-0aee-46f7-4f8d-08d8cd14a1c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 16:06:17.2326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5grSyDKP5aGghhdCzsTBTN1/dSnuI1XCzEIzYFZo92ux/RryKC7srS8fPnB4Zyw5Rqr+hcEuJkFBjyZIWZIng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4970
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 04:04:32PM +0100, Jan Beulich wrote:
> The "guest" variants are intended to work with (potentially) fully guest
> controlled addresses, while the "unsafe" variants are not. Subsequently
> we will want them to have different behavior, so as first step identify
> which one is which. For now, both groups of constructs alias one another.
> 
> Double underscore prefixes are retained only on
> __copy_{from,to}_guest_pv(), to allow still distinguishing them from
> their "checking" counterparts once they also get renamed (to
> copy_{from,to}_guest_pv()).
> 
> Add previously missing __user at some call sites.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Instead of __copy_{from,to}_guest_pv(), perhaps name them just
> __copy_{from,to}_pv()?
> 
> --- a/xen/arch/x86/gdbstub.c
> +++ b/xen/arch/x86/gdbstub.c
> @@ -33,13 +33,13 @@ gdb_arch_signal_num(struct cpu_user_regs
>  unsigned int
>  gdb_arch_copy_from_user(void *dest, const void *src, unsigned len)
>  {
> -    return __copy_from_user(dest, src, len);
> +    return copy_from_unsafe(dest, src, len);
>  }
>  
>  unsigned int 
>  gdb_arch_copy_to_user(void *dest, const void *src, unsigned len)
>  {
> -    return __copy_to_user(dest, src, len);
> +    return copy_to_unsafe(dest, src, len);

I assume we need to use the unsafe variants here, because the input
addresses are fully controlled by gdb, and hence not suitable as
speculation vectors?

Also could point to addresses belonging to both Xen or the guest
address space AFAICT.

> --- a/xen/include/asm-x86/uaccess.h
> +++ b/xen/include/asm-x86/uaccess.h

At some point we should also rename this to pvaccess.h maybe?

> @@ -197,21 +197,20 @@ do {
>  #define get_guest_size get_unsafe_size
>  
>  /**
> - * __copy_to_user: - Copy a block of data into user space, with less checking
> - * @to:   Destination address, in user space.
> - * @from: Source address, in kernel space.
> + * __copy_to_guest_pv: - Copy a block of data into guest space, with less
> + *                       checking

I would have preferred pv to be a prefix rather than a suffix, but we
already have the hvm accessors using that nomenclature.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

