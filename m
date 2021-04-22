Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB50367BDC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 10:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115096.219431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUUE-0001nN-1V; Thu, 22 Apr 2021 08:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115096.219431; Thu, 22 Apr 2021 08:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUUD-0001my-U0; Thu, 22 Apr 2021 08:14:57 +0000
Received: by outflank-mailman (input) for mailman id 115096;
 Thu, 22 Apr 2021 08:14:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=96sM=JT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZUUC-0001mt-Td
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 08:14:56 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d3c2151-df2f-4fbc-a862-583818ac48d0;
 Thu, 22 Apr 2021 08:14:55 +0000 (UTC)
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
X-Inumbo-ID: 3d3c2151-df2f-4fbc-a862-583818ac48d0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619079295;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tuGsWGEPy7oS6sUDFkUuuhbXmbnww2DnD2caxeVTCMc=;
  b=eay2fHgBONwPwloN5nP97e0YkywZMejXdAfn7pCJeBEGt7CkhiIIPDQL
   7BxzEvGvCVllDfbcZYydp5sqZHPvYW+ow+U8BOygKYLrR5wy+4vMpFi33
   jggFUgW3Mi+f5qJn+oxJBnk1QhJl0F748p/tPbB4tk6mBbnT07IsIB5dL
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cXaXxCS4VOsQhuw7VpnWVT7SNgdmJXOTZlBSEWvojwDZOrzD+DlcJas/dFP7tzMYU+3SgHvpCK
 1Qaz5QlKOwvh+dQbk+nMRMbntBepH7RF3XW+atCOEtYrHK40iW+y0cPS96PfKhuIOGHBUd4lX0
 ElD5LwrEKCGw/QnB7Wy72P680erL13tiYvewmoUO2mw77ZE0ovthFsKagGZr4rzlQTo8cyVG81
 RCYuAT9dhXehFrGhA8ypOxkQXp10i1oeDL/M/xz+/ErRrYgGyPgv8Iuai8jV8ymv7e3A8Oyfe2
 T2M=
X-SBRS: 5.2
X-MesageID: 43647975
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1SCla6i1c6witnyfe0JVcQF6sXBQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="43647975"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXJDtdrhIYX+cxHTRbc1ICqIz+salLdq6r0cAZU4NsdpK+mj0aT3QUQHsY0z0FD8e0o+ub9gYF38sXSOiMwRFxlgGZXmRGGZ6LOyE1+1xVMAhGfeElNIiUZmCkv06ZyWJdCFeiDwPk41Np+NqOdP9mtKChgqrPweDqVg6+6p2ygihcL8bV+rGSvemKLMZWzSkERRmkvqLVzPW18sWcBEwrahrDxd3czvji//aRhxGkBHvgnGprX7DD2aN19jG7bJ5v0W+rQPFyU3AqV9sqA1G314X0vmgsaYlv90sX6oVakfw4fgNPZa3PspLb2a4rpibY5mTDvHPp01qHxiW3WF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtO0BHfBfHhSM7plYYfl1/FJwMXrgySzDccZ+kX1fIc=;
 b=hfu2cy76VhtdnYgWqLemL/ZpSNUFkUjPZH2htlS4c4M3g9Z08VQpcWSGYEI58q+MXqosES8qcjnfAECVDdxPnLtiZ9E5IEuWl4kO0ov4chs/1ZQYrjzeVxHgXLrWRoWoFJdqSw2YXUzUC7uN/Ay8wRB4BYpu2nrTS7XraUkQNDZ4FAQ45xiPFn2Q7ZWUaj0m1dP+9rvWK9oMXO4xyuFIVILJR+08rUb4e/Yebpmn4zLJ0Xll4TRIxRBflIzbnl+uQabmmr1C6t1PoAjqC4jkl/SW2FTSf51I2gApiholWtnwQfSHnHGwDiqQo+UwAa/mBf+HfQ5MlpdEhS04EQjn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtO0BHfBfHhSM7plYYfl1/FJwMXrgySzDccZ+kX1fIc=;
 b=MfJ7cm5b04yX0tMjnpMBXiU6gJMbaVCpGw+k59CWrePnfCXTzsYugWXDKjLurvnvJAeCMM5L6zfrs4K13HMB4sv2UNdvqKzjDwvuW/KMvzTs4s03H1MzHZwKU27p9qGoVkMOfOt6uzd/lMTbSPWeHWZ2L9opalLhgacf57Y201Q=
Date: Thu, 22 Apr 2021 10:14:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
Message-ID: <YIEwW3HQuTtgWH5M@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <96cb4039-5f43-8eac-d855-c9f1587ed2d0@suse.com>
 <YIAJP0SCq0nOKZVL@Air-de-Roger>
 <6023c1d3-4f50-d207-1ea1-30dd1d5f68d2@suse.com>
 <YIBFD4i6bLaeaXdE@Air-de-Roger>
 <3cda296d-e88e-5fe0-4924-4cf974c4f909@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cda296d-e88e-5fe0-4924-4cf974c4f909@suse.com>
X-ClientProxiedBy: MR2P264CA0169.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::8)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91045930-61cd-4f8c-b018-08d90566a45a
X-MS-TrafficTypeDiagnostic: DM6PR03MB3674:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB36740D6F0320D7A2F21C57A28F469@DM6PR03MB3674.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6NKh82QeH9mEb6H7luz5W06Ouy/G6fGldHt9qt55VWXHOBb9BI+6gP9Qk/SF8DhzXyWBHKMhGaoPGyySo0u809vyv9a9FAzxsSaWgtGenv0AgnaJwcfyeoJ80MGdbbezohsBGh/aHtuHiLW/aK68JR64XVOsCLa0Ogw721mkWaxY/LGjc0oqbI5JeeqdRQACcWBD2RuagtyiOZ1jM0KoVL0035h+yrvpZZw2dEQw6Mvp/7DuBvbk//EgaK5jO9cTOHVoPqobXObFmVadJ+4RURWQEf+arAWbm47KFTjrx63cGMI8a8I9BUFiLeDKcUuXONW/Nd10VBq9fHin+iRFoBgSrZs/BQwe/rczfBaCIEot53FYYWX/cHzqPS/mTH51yLT9dIcjSwHxouQ2cG9d+/UAAg55vOthxBrsDZPvmrNJq4RB0PYniVPVzCpMhq+X7TglYg7koyecVhWX2+Si1OJGcLTURLjLvdFAhc8mSuU1x0KIeQ4FQo2BEiQ6GsX5Zx4OWqPDMW3N1kymk7i4Chtnt66/nLzKVg8QS6LyjdWQj6ME0uNAPXqPdd87t1DSprez7c89M4U95oekQgEQ3fCCqjOm4qFN0oD5arXueiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(346002)(136003)(396003)(366004)(376002)(66946007)(5660300002)(9686003)(6496006)(86362001)(186003)(2906002)(6916009)(54906003)(66476007)(66556008)(33716001)(6486002)(316002)(83380400001)(38100700002)(85182001)(4326008)(16526019)(8936002)(53546011)(956004)(478600001)(26005)(6666004)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ckNPWW9NVnpsQzVWT1Q1SkFtQ3QyZHdSRXZjamZpYUVjN3hLUjJqdkxteUlT?=
 =?utf-8?B?U1R1anQ3TzBiVmVNZEh4WWpJbUhRTEJ3STlvSDNQcnI0bTZRL0JIMk45ZlJu?=
 =?utf-8?B?Y0ZwMk9yTDVSTjIvcVZjdEx1MXlUMHhOUUU5M0lDd29ka0kvcmo5S1F3Umdu?=
 =?utf-8?B?N28rcWhlOGJKbmRqUHl5R2V3SWRYNFd1MVpCTm1BaVdLZ1FOVXB2dXU3UFVo?=
 =?utf-8?B?NEp1Q2l6K3lzVUlvQUEwODliRUllQm5KbHdyWnJoSUZkMVJUWExaZi8wYWZu?=
 =?utf-8?B?c1hlQkI5RXlOKzhtWS9DaTdvbjZyK1pVckkwYWlsb0dWUzNibnpqMTVWYnlz?=
 =?utf-8?B?RnROc0xYRmdpNWlSWXRCRjJJeE5VME92eDYySDdjcjl4WG5FbWxVR0hGbENN?=
 =?utf-8?B?UnZVbjBhNHBaMjZJS0JNaGszakV1MExNT3g0Nm5uUmVvUW9ZWnN4VFBOUnlK?=
 =?utf-8?B?cTVIVFJjV0lidkhjUHVnditPSm5iUEErK2RDemg2cU1SQW0zZTlzb29ockJD?=
 =?utf-8?B?QVFORE43ZkdPd0RWZlg5bmxXQkxOWExGZUlXL2EzV0tGeXJHQjFXWTRWcDBv?=
 =?utf-8?B?eCs0TUpRK2xMT0FqV2pqaG9VeTBGcFdMMzNMK1Zpdk5HeFNuRC9jK1Q4UnhH?=
 =?utf-8?B?NFgxZ2JmczRDdlZJY1lLcnRlclF2YWY5K0kxb2NrQkNUWDZ0OURsaGhzeFJp?=
 =?utf-8?B?aHVRcUZJNkFxdENHZGhMUmd6U2xGaWc0RWZLNlVkYW1uUUxYVVY2NkFzemw4?=
 =?utf-8?B?c1V5WkpiYzcrK2hHZ1lHZFhUdmFiK1ZQMi92YUlkVEJWdXBPZk01am5WcTJ2?=
 =?utf-8?B?eDh0ZTJMa3Y3NXNSMDJlaXRTYmhqampPZ2diaUVQdkJMQ21WNmhKUlVxVzZl?=
 =?utf-8?B?YlcrSGszcGgySWhTZWF2ckNQTkFSNHA5WklDWEVwSUZEVUYvd3ZwRmt0NFll?=
 =?utf-8?B?NFR0WC9tM0ZJaFR2cTcvM2FrWFdqbjhJVE0wNW5IaTlvU1VWTjNVd0Ewakkz?=
 =?utf-8?B?THE1NUdtUGI1SXg2azFuQUd2ek9JWnM3WWNnY0JTTzcwanVCQTJ2c1FSallw?=
 =?utf-8?B?Tmgvem5QSlFiSzR2OXNIT2VhZmhHd2dJSENkSHVNM0lqZkw0M1NDdjA0MVJs?=
 =?utf-8?B?V2dTRGpTM2NKaEtYZTlTYkl1bTFmSkFIYkQ2MllEQ3JlbTVvOHdjKzNBd0pn?=
 =?utf-8?B?TFNDMW5iam1KRHNvTThoNUVLM29pOU9EYmFvSzVnYk1KRTljYzB2bzk2VEJh?=
 =?utf-8?B?UzE3aEJVMUJQL2Y0bFQrb2x3NkpLbjh1SWNTSEYyVko0L0lpcC9UQWtmWmFP?=
 =?utf-8?B?R1RRcnJyQkIwUXQ5cThJWG9wL3g1MUh3eXZJeFVIL0g5ZVhtYUJNRTJCakxD?=
 =?utf-8?B?dU9Vd0FyRnJCN095YzkyQXpEZDJJeE5qS2l3U1RSdGtqQitJSndWYUorLy8z?=
 =?utf-8?B?dVRiVXlpYWxzbk5lMlY1WE5aZlFiNVovT0E1TnN0dVFoT0lrR3ZsVzZIVFZi?=
 =?utf-8?B?TVVxaGt3UVVvRXc5RXNEczZZRTFUT3FNTXYySGtDMEx3RlQ5WGJ0RmdNRzZi?=
 =?utf-8?B?d0tiZnI3cS83aFNXeXZteHJIVkVKM1R1WTZ2YUM0UmhabTJSOElnRWtzVk5o?=
 =?utf-8?B?OWFRZ2xZVENGMHcvK0s5MTNKaU5LL215YUtaYmFEYnV6L2pYOTQybC9zVGxs?=
 =?utf-8?B?SVNveWJZMG1NRlhnbmFnQ2RrNVd5aGZxRVJyeFVrZndXOEc5djFqZytmQksr?=
 =?utf-8?Q?XJZvJ3Ak8AFPo3ASQ5Bo2rdQBxJ2tuhncu5z544?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91045930-61cd-4f8c-b018-08d90566a45a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 08:14:25.2811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsO7hSI8oJlX1AdTW3PoOF7MNrvAXBqSEcHJmjCHp7k1pAH08iE+O57vqD2Wwyck+O2KmcM5+/nE15MCaMswSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3674
X-OriginatorOrg: citrix.com

On Wed, Apr 21, 2021 at 05:38:42PM +0200, Jan Beulich wrote:
> On 21.04.2021 17:30, Roger Pau Monné wrote:
> > On Wed, Apr 21, 2021 at 03:06:36PM +0200, Jan Beulich wrote:
> >> On 21.04.2021 13:15, Roger Pau Monné wrote:
> >>> On Thu, Apr 01, 2021 at 11:47:03AM +0200, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/xen.lds.S
> >>>> +++ b/xen/arch/x86/xen.lds.S
> >>>> @@ -312,10 +312,60 @@ SECTIONS
> >>>>      *(.reloc)
> >>>>      __base_relocs_end = .;
> >>>>    }
> >>>> -  /* Trick the linker into setting the image size to exactly 16Mb. */
> >>>> -  . = ALIGN(__section_alignment__);
> >>>> -  DECL_SECTION(.pad) {
> >>>> -    . = ALIGN(MB(16));
> >>>> +  .debug_abbrev ALIGN(1) (NOLOAD) : {
> >>>> +     *(.debug_abbrev)
> >>>> +  }
> >>>> +  .debug_info ALIGN(1) (NOLOAD) : {
> >>>> +    *(.debug_info)
> >>>> +    *(.gnu.linkonce.wi.*)
> >>>> +  }
> >>>> +  .debug_types ALIGN(1) (NOLOAD) : {
> >>>> +    *(.debug_types)
> >>>> +  }
> >>>> +  .debug_str ALIGN(1) (NOLOAD) : {
> >>>> +    *(.debug_str)
> >>>> +  }
> >>>> +  .debug_line ALIGN(1) (NOLOAD) : {
> >>>> +    *(.debug_line)
> >>>> +    *(.debug_line.*)
> >>>> +  }
> >>>> +  .debug_line_str ALIGN(1) (NOLOAD) : {
> >>>> +    *(.debug_line_str)
> >>>> +  }
> >>>> +  .debug_names ALIGN(4) (NOLOAD) : {
> >>>> +    *(.debug_names)
> >>>> +  }
> >>>> +  .debug_frame ALIGN(4) (NOLOAD) : {
> >>>> +    *(.debug_frame)
> >>>> +  }
> >>>> +  .debug_loc ALIGN(1) (NOLOAD) : {
> >>>> +    *(.debug_loc)
> >>>> +  }
> >>>> +  .debug_loclists ALIGN(4) (NOLOAD) : {
> >>>> +    *(.debug_loclists)
> >>>> +  }
> >>>> +  .debug_ranges ALIGN(8) (NOLOAD) : {
> >>>> +    *(.debug_ranges)
> >>>> +  }
> >>>> +  .debug_rnglists ALIGN(4) (NOLOAD) : {
> >>>> +    *(.debug_rnglists)
> >>>> +  }
> >>>> +  .debug_addr ALIGN(8) (NOLOAD) : {
> >>>> +    *(.debug_addr)
> >>>> +  }
> >>>> +  .debug_aranges ALIGN(1) (NOLOAD) : {
> >>>> +    *(.debug_aranges)
> >>>> +  }
> >>>> +  .debug_pubnames ALIGN(1) (NOLOAD) : {
> >>>> +    *(.debug_pubnames)
> >>>> +  }
> >>>> +  .debug_pubtypes ALIGN(1) (NOLOAD) : {
> >>>> +    *(.debug_pubtypes)
> >>>> +  }
> >>>> +  /* Trick the linker into setting the image size to no less than 16Mb. */
> >>>> +  __image_end__ = .;
> >>>> +  .pad ALIGN(__section_alignment__) : {
> >>>> +    . = __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
> >>>
> >>> I think this is inside an ifdef EFI region, since this is DWARF info
> >>> couldn't it also be present when building with EFI disabled?
> >>
> >> Of course (and it's not just "could" but "will"), yet the linker will
> >> do fine (and perhaps even better) without when building ELF. Also
> >> note that we'll be responsible for keeping the list of sections up-to-
> >> date. The linker will recognize Dwarf sections by looking for a
> >> .debug_ prefix. We can't use such here (or at least I'm not aware of
> >> a suitable mechanism); .debug_* would mean munging together all the
> >> different kinds of Dwarf sections. Hence by limiting the explicit
> >> enumeration to PE, I'm trying to avoid anomalies in ELF down the road.
> > 
> > Right, so we will have to keep this list of debug_ sections updated
> > manually if/when more of those appear as part of DWARF updates?
> 
> Yes.
> 
> > Do we have a way to get some kind of warning or error when a new
> > section not explicitly handled here appears?
> 
> ld 2.37 will start warning about such sections, as they'd land at
> VA 0 and hence below image base.

That seems like a bug in ld?

The '--image-base' option description mentions: "This is the lowest
memory location that will be used when your program or dll is
loaded.", so I would expect that if the option is used the default VA
should be >= image-base, or else the description of the option is not
consistent, as ld will still place sections at addresses below
image-base.

Thanks, Roger.

