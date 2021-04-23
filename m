Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE731368DEE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 09:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115927.221233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZqGl-0005De-Um; Fri, 23 Apr 2021 07:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115927.221233; Fri, 23 Apr 2021 07:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZqGl-0005DF-Qa; Fri, 23 Apr 2021 07:30:31 +0000
Received: by outflank-mailman (input) for mailman id 115927;
 Fri, 23 Apr 2021 07:30:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZqGj-0005DA-Ut
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 07:30:30 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8266b7e-74a0-4850-934b-9bcae9a1d591;
 Fri, 23 Apr 2021 07:30:27 +0000 (UTC)
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
X-Inumbo-ID: e8266b7e-74a0-4850-934b-9bcae9a1d591
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619163027;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lUHpFv1925MIF39/R8LuRbyQp22UfWtncBztb3HWbq8=;
  b=Ebe+Tiniys0xbuYo6gvnBMYFpiTkJXlnHgAfnGdrBL/W+IIgx3xmzamP
   LKk+YfqmHuwywcxHgOTFiEoAmrDrht9dwu+lmMgBsP4/agGKuY2t3ZFul
   B55/IVbs4Iy2niGLynzgwj6JOwrHBHlEHKDRtm+eITRKigETllUsYpP0I
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: peFJQ2ea27ksyWlMGr9VfFRnRQnTSJIy1iiLrWR+DYSW0EEls5X7HW+h1kDsm1h29/iTNpMamL
 bmKqqH3sqVuf+fqPkQ2+WtrFWhOfppCU9ZVcbuWI/22fLm2hoQynMhZCN9nRBm5UIwUsoiMd4t
 qFWw5U/BN5dKfDrjXPm4XTDuaaFwsvRkaPZUGQaBl/wz4FhKlhXxp8q/KoffChKsyXXnkP1ATO
 UTTskV1qWTa7wMBa63Ge7MvYxnrxhKIKdeKwp8IUyYALrCzEb+PSnAYijdDBWoQXty+4GzgHo5
 Lqg=
X-SBRS: 5.2
X-MesageID: 42078337
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qXz8NaxdyIpILJl6y7l3KrPx/uskLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr3//dOgbU5F7GkQQXgpS+UPJhvhLGSpwHINg/f0qpm1a
 lme7VjE9GYNzJHpOvz/QXQKbkd6fad9qTAv4nj5lNMaS0vVK169Qd+DW+gYyhLbS1LH4AwGp
 bZxucvnUvCRV0tYs62BmYIUoH4zrWmqLvcbQMbHBli0QGSjFqTg4LSKQSS3RsVTlp0sNUf2F
 XC+jaZ2oyT98uV5zWZ/G/V4pRQlrLau6Z+Lf3JsOc5AHHBjg6pYa5oRrGNuiskydvflGoCoZ
 33jDoLe+h19nPNbkG5yCGdpDXI4XIVxFLJjX+enHf5rsTySFsBerR8rLMcSDT1wQ4EnrhHoc
 V29lPcjbV7J1f8uR64wN7yWxRjhiOP0AEfuN9WtVNze88jcrNLxLZvmn99IdM7Mw/RzpsoK+
 VqBNG03octTXqqK0rUuWRi27WXLw0ONybDRkADv/qc2CRNkEZ4yFMFxNcekm1ozuNEd6V5
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42078337"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0Ttl+PRrLgMoEavC0E+2vHQ8YwB8JB13NwHPxp27CCPYzXVaYNeBas4ySRlqeV9DZ5C+Qh1KlVTdBLxhM4wCTXjm7WHHdU16mnmyHhDjSsv8FaoaAW72x1XxXf5oM35Ly/LeC0tVFqsmonzXC33L4Yncg5r41uVoMtCZYpx2riek4wWpAXAsd/EXMoIlsNYbVAgMmxS6Zg4t6ZI4ygQd2MsJlgyElwgoF5T6A8uyixVJFR1uwWeXgFrTTegiloaLhwtytl5zjEKQs4Bxfhv/lTK94Th2q3yfV+DFK+BYkMp/RfJn6l0VBwrPE3a/l68xhTyZ0SFTyJXl6gUSAoqgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEKD2xhTGErxJ+CKqCKpaKuwc/YRCHmsanolx5nLANI=;
 b=O0QKhdE1HNU9LjmFECKh73aXqgpeM95wdlrFMEPtH+tF5TrcCAuQPgH7Ze4eM/fUGXhkH4gpwRDlgxizVDQ4GJ8I1K4mpyq645fCQxoNraoJxg9I8CTkuPWaBMeJSN0QM0MKyDBBSMG3yxBRueXhhCCKI1NBuUlk1w/QV6tAEXT8wsZfxu1jlCLwRF/5gLKZeur0fOl36Xp8zqPkebZYrobo3tc9bXdkJL/ZX6klqIL/yTsnap+kN21OHOKZn6mIiw4O5nftqSvzLTS8OcC9xKJ+c2W0j0MTNOx8T4zLF+OZrRDPwGcPxZsJPkS1dHRyZARuaICBfo+S8qQ2jFUSTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEKD2xhTGErxJ+CKqCKpaKuwc/YRCHmsanolx5nLANI=;
 b=RPUAE/RVpl+wYxzPS46hOO0B5u6w1CQgccfSvEwF/yCDf6f+CtWVtZOTd+oaXLZZQvph0xE1mIknIdxaVo+oDJ5zyJHIIfLCaedUtADULAAKDbUR3VOVX6IQmOcxeYjyFnSXeag7ZUvHx55JP5A//wXOLwwQ/PBKIdAFApn2IAg=
Date: Fri, 23 Apr 2021 09:30:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
Message-ID: <YIJ3icwAoGEW/AO+@Air-de-Roger>
References: <YIAJP0SCq0nOKZVL@Air-de-Roger>
 <6023c1d3-4f50-d207-1ea1-30dd1d5f68d2@suse.com>
 <YIBFD4i6bLaeaXdE@Air-de-Roger>
 <3cda296d-e88e-5fe0-4924-4cf974c4f909@suse.com>
 <YIEwW3HQuTtgWH5M@Air-de-Roger>
 <a00cfe95-06bd-4999-05ab-cae737ab6f4c@suse.com>
 <YIGOrOL+pKGaHqwX@Air-de-Roger>
 <8fabc56b-8e2d-96cd-e9b2-81bf38777d52@suse.com>
 <YIGcE5Cr+xK4K6gw@Air-de-Roger>
 <98431d14-d4a0-61a8-148e-221652f37b61@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98431d14-d4a0-61a8-148e-221652f37b61@suse.com>
X-ClientProxiedBy: PR3P192CA0009.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb9447e8-2b13-4cdb-6578-08d90629a799
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3147B50B55844C7654F5753D8F459@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0VBdI81guA5mynumJ9EZ9+EPycT5EppGb1/Lnb4OZkuzl+IBCTihitX2N1VgMHnnHdpEBngl+ikWg7TR1KtOd5QLqDMnHai1xpKgsmzMP2GONwsy/7tFtekE87DgPTzDo4ny+/4AxNk1gvkBqTS2qITWSbcdLvjvkyUukIWDImLfLnTECd1Jm9BnT5SfSN1WRu9aqiz1AQsYOY+yMC6u+EJfiH093P5J4JF9Qhch4q7GvzfyXz9HEd7USQKZMHQEA6Zbg8By0ClasTDGsxp3KXSSZ9Ly7AMGd/8je4U90W74H7tjtEYspO//W9hHjWZNofKVg+kbe39z1EdggEMQ7M2GleWO3CGAbmlN80BQXu+yskoNIMzAyNR2qh9oKus7jL+xbH7D5w4oPzpwNmKkkETJV82QKua21wR4yQg4EPK9Nu6qC2wkKsYl/4JDE6M8FHrDWiadPJ48P1ixJL5bHotY10NZ+hfqjgn0/0BwpSBMy92VIsy7MlJQXD8a3NmRSrk71DqgGZlhQFiqvu2KOjUipjlhW2sFMtguz329guH2fkJtsBSQOOBZy5Ksq+q84bvhDRcmzoWSlxysog9LUldhXB6GhamImB6Dt5fLc72QXGtUvxscO0mWZL+SUawIJuhWTG1SnLLY2QByb06s59KEE9EWVAkDjK3DZTJXyja9Ezx48VYD2tjvX77Uqso1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(6496006)(66946007)(85182001)(8676002)(9686003)(83380400001)(6666004)(2906002)(956004)(316002)(478600001)(4326008)(16526019)(5660300002)(8936002)(186003)(33716001)(86362001)(66476007)(54906003)(6916009)(966005)(53546011)(66556008)(26005)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mm9ycHkraGFHS3dndUVjQmxINmV4ZTJ6RWptUzJBMk04Z1BiUk5NZVBuc1Jn?=
 =?utf-8?B?SEI3eG15VXUwUHJYSjZ4UFBDSVpqWHVxS3dSanR4RzYwTEl3bTI5WDFIL2Q5?=
 =?utf-8?B?amp5Ujl5ejFOVUlUL1VuWXJUakFaa1RHUnJ5WGx2cVZpeVNFaDNZaVVGR0lZ?=
 =?utf-8?B?YXgyYkVISkI0OUMzTzFBczdsbWtmS05qR2FuOUE5Z3g5cEdud0p5eUc1WHJB?=
 =?utf-8?B?SjVNVFl2VE5tbmJmR0gxczJpSUhTelltTTI1WFJpQlZmTndjU0ZEOGFSeno2?=
 =?utf-8?B?U0txNzRGUDY4Y2YzZzVvcG5JRWg3N21jRVhqclFITFEzak0xUFd2aGlldFdD?=
 =?utf-8?B?clFaYnpKRXdlSlFvUkloNWlOU3B3NFh3L01UYVl1VjNkTHJ1RlF1Q0JFRURV?=
 =?utf-8?B?a01EeWNnNzJUMkR1aXFPL3NxR01BTzZnR2hxd3laTUxCdWlGYTdUTHJtUk80?=
 =?utf-8?B?NEswc1ZiMlU1Q3g2aEVCeW84V3NSd3NwbEtpQ0lhYnlaVUJHaThDU0wwSjZ6?=
 =?utf-8?B?QnVwVlI4VlE4Ty9UTjd0SmtDYmtJQmxaeGQxb0V2RHFSODB2NVBmMWdWVldT?=
 =?utf-8?B?L2ZkYXE1T3k0aWJKcW95ZitSakExcXA5ZTdrRFozR0hiMHZ1dXQxYUtGL2hN?=
 =?utf-8?B?R2I1NldLVC90ZHJNajVFZ2grR3Y5K2xmK20ydEJCeE5XSHBzR3Ara1hQc2hK?=
 =?utf-8?B?MTFycUUybHhRWi9wWkNpdWhWbTR0U2Jja0JaOVhFRy9vN0c2VHVtRkhUWXpv?=
 =?utf-8?B?ZG5aaUFXT0h0L21zZTRjc0FSVFF0eXozTS9UQTREYVRlTkZKMmNiT1YxRDRh?=
 =?utf-8?B?RDl0ZkpwOEFXSFJZS3BYbHA1bUpTNGMyUmt4eWVsYVNvMDgvY0ZKYmN4L2xr?=
 =?utf-8?B?bFhWd2pCMUpmVURsd3o3SWdoV2RXUzA0STNsbStPZ0w0SDFGNWNrM2ZlbUtU?=
 =?utf-8?B?eTlsRlN0WGE5Q1E4T2pHczhIMExzVmd5QmJBUDdtb0RtTm9EV3FFNUdqSXd0?=
 =?utf-8?B?N3pmeE5SaG1iZ0cxVm45ZTB2MFBtRGxrYjRjajdISzBvbVhJYVFsbjhYc0V6?=
 =?utf-8?B?Sml2d2RsYVVYQU4xZXNzbDYwaGxJZEsyUTdtYXNPZWpHUS83ZFUraVhnb21u?=
 =?utf-8?B?QXJnSnZJaGE4UzJWazkzR2l2SW11OGNVNHBCTVJya0ZBVVN0TGQrRDhwb3dP?=
 =?utf-8?B?U01xbTJoZ2JRU28wajBqMjN2Qkt5cllqQndwVGgxMkRwejNDUVNVc01SbXBi?=
 =?utf-8?B?RUNxRWM3ZFEvMS8wV2NZZEJHQ3RoZ29QeVZWT2JtOWxmdmVjSGtVUURyQlBq?=
 =?utf-8?B?cHVxRnFtbnN2ZlgzUmpCNW95OXdPZmREOURJNjQ3am5ES01PZmY0WlJPNVFs?=
 =?utf-8?B?Y2lxa3hhb01TeFJzM1Z6UFpLcjI0VTQvK2RnajlmSXJ2VXVNNkZ4NytFSHJK?=
 =?utf-8?B?eDkxWmhteVFIQUVQOVliOXZOeFlDSHpCSEJpNzFBUHdwS2tFdTZRWjIyek1p?=
 =?utf-8?B?MUZDUzBuM3dTMWRtNlQ0bnhxSUJDemE3MldyR3puYW5qZTlYNHJESDBoUU1F?=
 =?utf-8?B?RXpqWVFGQjdMVXFheFJKS3BxemVuQ3FvTWhsNmE2dldBVEx6bmFwOVFBcFQr?=
 =?utf-8?B?VTZJVVR5MmNjTXc0Z3A2ZUZjN01ldU56Z3YvVi9LWkhyL09HR2prODFySkZS?=
 =?utf-8?B?Zng0MWhXQ1o0cmFUL3RwVHFnNTdqRWo4VzIraHFZdVBnbURscll6VFZYamMr?=
 =?utf-8?Q?G57gAMA4ya/SWNNNtyKdxIXlHqc+ifT07QOb4HQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9447e8-2b13-4cdb-6578-08d90629a799
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 07:30:22.6881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FljlIRbw/b1vBPhkwm76WmHTcR2GwYlQwsHRns+WDtWFbrDYm4Bp9lSaSMJ7yGnmRrHUNI9Z5KQX6irswPS6+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
X-OriginatorOrg: citrix.com

On Thu, Apr 22, 2021 at 06:01:06PM +0200, Jan Beulich wrote:
> On 22.04.2021 17:53, Roger Pau Monné wrote:
> > On Thu, Apr 22, 2021 at 05:46:28PM +0200, Jan Beulich wrote:
> >> On 22.04.2021 16:56, Roger Pau Monné wrote:
> >>> On Thu, Apr 22, 2021 at 01:03:13PM +0200, Jan Beulich wrote:
> >>>> On 22.04.2021 10:14, Roger Pau Monné wrote:
> >>>>> On Wed, Apr 21, 2021 at 05:38:42PM +0200, Jan Beulich wrote:
> >>>>>> On 21.04.2021 17:30, Roger Pau Monné wrote:
> >>>>>>> On Wed, Apr 21, 2021 at 03:06:36PM +0200, Jan Beulich wrote:
> >>>>>>>> On 21.04.2021 13:15, Roger Pau Monné wrote:
> >>>>>>>>> On Thu, Apr 01, 2021 at 11:47:03AM +0200, Jan Beulich wrote:
> >>>>>>>>>> --- a/xen/arch/x86/xen.lds.S
> >>>>>>>>>> +++ b/xen/arch/x86/xen.lds.S
> >>>>>>>>>> @@ -312,10 +312,60 @@ SECTIONS
> >>>>>>>>>>      *(.reloc)
> >>>>>>>>>>      __base_relocs_end = .;
> >>>>>>>>>>    }
> >>>>>>>>>> -  /* Trick the linker into setting the image size to exactly 16Mb. */
> >>>>>>>>>> -  . = ALIGN(__section_alignment__);
> >>>>>>>>>> -  DECL_SECTION(.pad) {
> >>>>>>>>>> -    . = ALIGN(MB(16));
> >>>>>>>>>> +  .debug_abbrev ALIGN(1) (NOLOAD) : {
> >>>>>>>>>> +     *(.debug_abbrev)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_info ALIGN(1) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_info)
> >>>>>>>>>> +    *(.gnu.linkonce.wi.*)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_types ALIGN(1) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_types)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_str ALIGN(1) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_str)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_line ALIGN(1) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_line)
> >>>>>>>>>> +    *(.debug_line.*)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_line_str ALIGN(1) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_line_str)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_names ALIGN(4) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_names)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_frame ALIGN(4) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_frame)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_loc ALIGN(1) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_loc)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_loclists ALIGN(4) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_loclists)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_ranges ALIGN(8) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_ranges)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_rnglists ALIGN(4) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_rnglists)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_addr ALIGN(8) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_addr)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_aranges ALIGN(1) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_aranges)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_pubnames ALIGN(1) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_pubnames)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  .debug_pubtypes ALIGN(1) (NOLOAD) : {
> >>>>>>>>>> +    *(.debug_pubtypes)
> >>>>>>>>>> +  }
> >>>>>>>>>> +  /* Trick the linker into setting the image size to no less than 16Mb. */
> >>>>>>>>>> +  __image_end__ = .;
> >>>>>>>>>> +  .pad ALIGN(__section_alignment__) : {
> >>>>>>>>>> +    . = __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
> >>>>>>>>>
> >>>>>>>>> I think this is inside an ifdef EFI region, since this is DWARF info
> >>>>>>>>> couldn't it also be present when building with EFI disabled?
> >>>>>>>>
> >>>>>>>> Of course (and it's not just "could" but "will"), yet the linker will
> >>>>>>>> do fine (and perhaps even better) without when building ELF. Also
> >>>>>>>> note that we'll be responsible for keeping the list of sections up-to-
> >>>>>>>> date. The linker will recognize Dwarf sections by looking for a
> >>>>>>>> .debug_ prefix. We can't use such here (or at least I'm not aware of
> >>>>>>>> a suitable mechanism); .debug_* would mean munging together all the
> >>>>>>>> different kinds of Dwarf sections. Hence by limiting the explicit
> >>>>>>>> enumeration to PE, I'm trying to avoid anomalies in ELF down the road.
> >>>>>>>
> >>>>>>> Right, so we will have to keep this list of debug_ sections updated
> >>>>>>> manually if/when more of those appear as part of DWARF updates?
> >>>>>>
> >>>>>> Yes.
> >>>>>>
> >>>>>>> Do we have a way to get some kind of warning or error when a new
> >>>>>>> section not explicitly handled here appears?
> >>>>>>
> >>>>>> ld 2.37 will start warning about such sections, as they'd land at
> >>>>>> VA 0 and hence below image base.
> >>>>>
> >>>>> That seems like a bug in ld?
> >>>>>
> >>>>> The '--image-base' option description mentions: "This is the lowest
> >>>>> memory location that will be used when your program or dll is
> >>>>> loaded.", so I would expect that if the option is used the default VA
> >>>>> should be >= image-base, or else the description of the option is not
> >>>>> consistent, as ld will still place sections at addresses below
> >>>>> image-base.
> >>>>
> >>>> ld's "general" logic is pretty ELF-centric. Hence debugging sections
> >>>> get placed at VA 0 by default, not matter what the (PE-specific)
> >>>> --image-base says. Whether that's a bug though I'm not sure: There
> >>>> are no really good alternatives that could be used by default. Doing
> >>>> what we do here (and what e.g. Cygwin does) via linker script may not
> >>>> be appropriate in the common case. In particular it is not generally
> >>>> correct for debug info to be part of what gets loaded into memory.
> >>>
> >>> So with this change here you placate the warnings from newer ld about
> >>> having a VA < image base,
> >>
> >> It's not just about silencing the warnings. The resulting image is
> >> unusable when the sections don't get placed at a suitable VA.
> > 
> > And this wasn't an issue before because the linker won't even attempt
> > to place DWARF sections into a PE output.
> 
> No, this wasn't an issue before since, for things to work, we
> simply had to uniformly strip debug info when linking xen.efi. And
> this is what Andrew said should change. I was initially opposed,
> until I saw that Cygwin does just this as well.

Just for my own education, do you have a reference about this way of
packaging debug data by Cygwin?

I've found:

https://cygwin.com/pipermail/cygwin/2003-January/090110.html

Which mentions not setting the ALLOC flag on the debug sections in
order to prevent them from being loaded. I'm however not able to
figure out which flag is that on the PE spec, or whether it can be set
from the linker script.

> >>> but the end result is that now the debug
> >>> sections will also get loaded when booted from the EFI loader?
> >>> (because the NOLOAD doesn't have any effect with PE)
> >>
> >> Yes. I currently see no other way to retain debug info in xen.efi.
> >> But to be clear, the memory debug info occupies isn't lost - we
> >> still free space from _end (or alike) onwards. .reloc, for example,
> >> also lives there. And I was wondering whether we shouldn't keep
> >> .comment this way as well.
> > 
> > Yes, I already realized all this is past _end.
> > 
> > I wonder however if the use of (NOLOAD) makes all this more confusing,
> > such sections should only be present on the linker script used for the
> > PE output, and then the (NOLOAD) doesn't make sense there?
> > 
> > If so, I think the (NOLOAD) directive should be dropped, and a comment
> > noting that the debug sections need to be manually added to the PE
> > output in order to avoid them being placed at VA 0 would be helpful
> > IMO, likely also mentioning that they would be loaded but discarded
> > afterwards by Xen because they are all past _end.
> 
> Earlier on (another sub-thread, maybe) I think I've already said that
> I'd like to keep (NOLOAD) both for documentation purposes and just in
> case the linker develops some smarts to actually translate it into
> anything sensible when linking PE. This is quite different from
> .reloc, after all - that section has to be loaded for our re-
> relocation to work correctly. Hence that section not having (NOLOAD)
> and the debugging sections having it points out the difference.

Sure, that's all fine. I think a comment could be appropriate here, to
note both that NOLOAD is likely useless and just used for
documentation purposes, and to also mention the sections needs to be
explicitly placed in the PE linker script so they are not set at VA 0.

/*
 * Explicitly list debug section for the PE output so that they don't
 * end up at VA 0 which is below image base and thus invalid. Also use
 * the NOLOAD directive, even when currently ignored by PE output, in
 * order to note those sections shouldn't be loaded into memory.
 *
 * Note such sections are past _end, so if loaded will be discarded by
 * Xen anyway.
 */

Feel free to reword or expand the comment. Not sure there's some
reference we could add here about how debug sections are placed in PE
files usually.

Thanks, Roger.

