Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FDB36CAE2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 20:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118834.225146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS7m-0003IO-Iz; Tue, 27 Apr 2021 18:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118834.225146; Tue, 27 Apr 2021 18:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS7m-0003I3-FG; Tue, 27 Apr 2021 18:07:54 +0000
Received: by outflank-mailman (input) for mailman id 118834;
 Tue, 27 Apr 2021 18:07:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0mD=JY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lbS7l-0003Hx-U3
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:07:53 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95c9866a-8691-439b-829c-f1c14cd3e28c;
 Tue, 27 Apr 2021 18:07:52 +0000 (UTC)
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
X-Inumbo-ID: 95c9866a-8691-439b-829c-f1c14cd3e28c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619546872;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5bhsfNCvq6u5nRAaWA7AijvgxaPM7/WhSGEiveMMfoM=;
  b=iHmf0+b/Rqf2P6zEii1wPNMkUPqfWPSkoX/f0+O7KuuCI7xd8o7kaWB8
   eLAK4QTTEw4t4jT0PmGUAF31OnUyFQf5+UI5AiT0VmUsgvv2B2nGbuIVA
   fPHOaUGMAjdgIvFchA+mwHNQOBetgIfk3aDl/j6NzUK6+bbMhUsSsqBdd
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /Pus4mt7meV4lbn1fyrJLKulIfF9BWGeRsjpqgpDYqTmtUO8ZaFVHBVTZzakHQUPotUP/SgeCz
 roxXxbN4mqHtHfi9Y7H9rBnBRntKznLRZcWIKr4IpV7xltsba7yTYbRJp3UtfTD7VUD/dPYetg
 p0tv92mw6bVBNK7NLTCg5JwADG1sLTrVac0hCNWICQgUQ6z9R2b0lhBo3ahpQOtO5W5ps8tz/r
 gwprRohR4kaJ6SALIfr+i2sGTDpsCIVYbnnRCbNsUUWElWhdHWL+KFkB3kfUCIMqWPbkfK/XrB
 BU4=
X-SBRS: 5.1
X-MesageID: 42658483
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QhXpCKhcdFRRDsSqLca9PBKljHBQX4t13DAbvn1ZSRFFG/Gwvc
 rGppsm/DXzjyscX2xls9WJIrPoewK6ybde544NMbC+GDT8sGyzI414qafkyTvsGyrxn9QtsJ
 tIWa54FdH2EBxGnd/3iTPIceoI7dGb/MmT5Nv24GxqSWhRBp1IzwNhDB2HGkp9SGB9dPwEPb
 69wuYCmDa6Y3QQaa2Adxo4dszOvcfCmp6jQTNuPX4awTCUjTWy6KPreiLopys2aD9Ezbc8/W
 WtqWWQ2oyYr/q5xhXAvlW8071qmcDswtYGOcqUisJ9EF7RozuvDb4MZ5Sy+BQ8oOSi8z8R4b
 3xiiZlG8R251X1UgiO0GPQ8hTgyzon5jvjzlKVkBLYy/DEeA==
X-IronPort-AV: E=Sophos;i="5.82,255,1613451600"; 
   d="scan'208";a="42658483"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acaaoUuxvNrx9DS8/CFx0l0l5E8sH/B03Hi5YtYo/tPi+4edVYTv2rkjERXk4Ook7peNO/5gDOQEkp6G/2Lxvx4uhMr5VSpWCj1YQcA+GBmi8k9c9nZQPbcwD80WG7wLDKpNnlJH1C2JLaybnjJC/EITC2SNsXh0JPIkZdV5Kxj3GhQOEG1tnaJBMklhgng66ZC8iUJqLV3h9waADifRXMO3OeLIoj3XifAn2vGdjIyzGUxjQeSEmHkXQ9jTbph/yDACLvHkxSPyO4znPG1i/9cvgAfs/93q/qZkvUKL5FMKffkKNzyhHmx73QXw3/hVuiqz3q7cAySnec6TwODzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cD5Er0KujSlLLnnmEad21Ga6zZz6hn6HOhqtsSdkss=;
 b=VDazG8baqIaqIqJmhIJlCuikAWnF5vH6iigDDZUNYaRIx6LSTHKAs7B0de90U3w/ctmXIxx/xbAAbJv2X2g3VbU/M0BiCViHXYrGOhRyh2kTbXp7e607UDn8o/VeCRrjZkYPQpZppzNv0aGErIVH0urYYGLobczbGIF5qjCO3PZbgrwrC+PVRwHvXxd3VB43b+MNRZMy/uKhGrl67iQ/8X6Ygf6BNrwscQ6C0mcjLW57FYNWhS98irb/OISu3DI38kjRUYDmXpQMfqxW3g9ly9vrKI8BQV5pHYjnbyxIQNluLjaP5nQTVHdhriXmvH3kOAELNRQBOAUQuHNbpnbRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cD5Er0KujSlLLnnmEad21Ga6zZz6hn6HOhqtsSdkss=;
 b=enxdslWs0Hig0HtNsL2zSwAAEfT61jcTCQ3CcihVsPxT9hu6DKBE7kjr42/xzLXs4O2Z3j2wqupmZcrUfjdMmudgmdCulgI1oTQJ59G3IZQSgeXoAwxaQDTtui4vxf4Of83/FvOq+m/r4gozj+0Mo277T3TM6coFFf2hYzjkjVM=
Date: Tue, 27 Apr 2021 20:07:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] x86/oprofile: remove compat accessors usage from
 backtrace
Message-ID: <YIhS79tn2J3FpJSy@Air-de-Roger>
References: <20210427142113.31961-1-roger.pau@citrix.com>
 <6812da01-72ef-7b88-9512-2feb250de223@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6812da01-72ef-7b88-9512-2feb250de223@suse.com>
X-ClientProxiedBy: MR2P264CA0190.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::29)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 342d97c4-7771-4459-c3a1-08d909a75e4f
X-MS-TrafficTypeDiagnostic: DM5PR03MB2556:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2556E29A277E65E4F7833E0C8F419@DM5PR03MB2556.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: InoQttS2DIiL2/yQmF9aWXul9bKZQT14lF/0/8gBKsvkDrgrXAySQOCajs4C//nuPDK72rzAZAagDvZK52dLdGsQgUPvfuLw1Nl3tXGzu1TZcdnSMBmFG9PUoFsN9umiapQbR39OXDXAbIuz1f/PE5P1daf9o3sSS14dIJ14SonxO7x3XcuRExmjLUaJW+GoXsnxwlmDPTbIw4mZt5txTaLVlHRUe/kGvbkIMPnZn+UFEG1L1ZdqW5CvFEBx/PyzydZ2KPHK/nGwYORNuBXHqDHBvCwJfJK7H+2GVR9jlkiEXqVGDfpDJ0wS3tLpAn03mkn+6dPvi86Nko5xN5GDio+/k9ZOA8ddKJvLMwWQiOelLTIFyQGk1Rzutk4vDYE47ou3d6rBo3xsiQNlmCFI5BYNvwC93CiPeNWV4p67j7xf2ItGNoInn2xA/+M6w/IKU7hXcJSiVdOceHy+27ewWoj2X9jvX4f13gqyG/DkCgXLlDNb746m0iufj9J0oeLASoIxH5/WMPJ+v/VwDY1DowuinhBxVzj4w4rIUR+kaM/4q/pJMLvRxJTDhXegjYeGWuq0spiBONetc4DGu3JNLkUjywUockWy4ujyouBa1mc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(376002)(346002)(366004)(136003)(6666004)(6916009)(2906002)(4326008)(53546011)(6496006)(86362001)(478600001)(316002)(54906003)(33716001)(16526019)(186003)(6486002)(38100700002)(83380400001)(8676002)(26005)(85182001)(4744005)(9686003)(5660300002)(66946007)(956004)(8936002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eW1oamtNUkRRYmVmWjJoNXgwTTZGTnRPbkR0UUdJVS9sb0pSOWkvVStmVTVy?=
 =?utf-8?B?KzVFUmtoMTNpQUs1dGRtdll3NGJ4dm5mcEVOZkoxUXRRaGw3SDk2NUgxWitv?=
 =?utf-8?B?d1ZDTmFXemp5VU5uNDdvVDF0UVhycERzK2JFUVJDUG9oWUovaFpzZ0lGUUp3?=
 =?utf-8?B?MDl2V3MxS21jTGo0N0lNQnczQXlienBtN283OG1PKzFVMXZEcW9ZZkFLNndE?=
 =?utf-8?B?bWxXckY2U2tBZnJOQ3Fkb1ZMb1QyQWNqUkhNWmQrMWl3dFBZK3ExTUF2akw2?=
 =?utf-8?B?b3ZJTWR3dFlDdEFBNjRsditvZHpvWjd2MDUwYlRZT2VNNHQreUcxOUtJZXlU?=
 =?utf-8?B?M2FvbldBZjJnNUNKSkc5VU5jbkVxU0o1b0YzQzIydFUzaitVTUF3OEp4ZDJN?=
 =?utf-8?B?dlpaTEp6RUJWM0l0WWJpK2w4a00rblNhK1ZTQjd3SEw3UTJGOFMraWtjZVlH?=
 =?utf-8?B?S0hycmFVNDRqczdSNE9MdVd0SitRSjJWSUlWdldSMEt3WXlqK05zSVFsbWNO?=
 =?utf-8?B?Q1BzUlc1V3pTQnRHL2lJTTFkM1Y2aG5uNmc3VXdRdGVGYVV1NnJmU0VFY2RM?=
 =?utf-8?B?N25Nb21oWWV0UmtkYWFlRDBlWWkvMlNlTG53eW1hWUdXZnlyUnlLcWtIZGVU?=
 =?utf-8?B?em1lZVI4TDZMOG9ycXZtNmJkOXdHNVVRTGZXRGQ1R0xJelpPSnpuNWFJcmRR?=
 =?utf-8?B?cTM1SUZSRjJlYjJTSTVnWmFPVklmdmtHT1Y5K1dEc001OW1mcVZoUjRHU0pU?=
 =?utf-8?B?UTVRMC9URzJaQWZBSEp2bDJjWTkwbUhJTWFPdm1paWFUb1ZpTmtLQ3RTVmZ2?=
 =?utf-8?B?RmZ2RVZrdGRmWm5ieDhMODdzdURoZXhnZE96V2grdCtYNTlrem0wYVk1b0k0?=
 =?utf-8?B?ZjlDYjZOMXZxUUZFcTBBaWNwNnA5Y2JOcUJhU2VOWlNLcVRXZThodFhZSUdl?=
 =?utf-8?B?eUlwT0tSRDhUVUMwem5xRzhXdVFWbmRkaVJZSHorL3podGNoQmJWSUtINmlw?=
 =?utf-8?B?UVFpTzIvTTdnbVZyd2hWdGF4dTdYWEhaVVBkejFpM0ZxNHRkOFk4dk9zaWRn?=
 =?utf-8?B?ZnZUSExOTTZjdVA0NHZUU1lWUnZ0QllBdzdlQThlZjVUeDBDZTVlbWtENEpE?=
 =?utf-8?B?WHJXdmViWlBKcUxNc1NhUldmTklZVDNUejJyVGVvT3ZUNnp0Z0NieTJOcm9J?=
 =?utf-8?B?clpscExkeTAyTU5IOTJJSGMyRU1GMkkyTVRBeFZyUFFGVGh5RWVsVnErR2Zr?=
 =?utf-8?B?SDdjN1FDaDlGVE9wcHVkVHIwSkpwd0VhUXZpVlcvdnZUcEVSb0tFY3VoR1dE?=
 =?utf-8?B?M3h0ckFHNmtYbHF6UHRuazA2R0JzQ3UxdTZyeW95Ri83Z0FBOGpYZFpibktH?=
 =?utf-8?B?YnM4Z0ZZOWxhWWhHUTBjN2xycjlCcGc1c0FGZW94RzNXR3hYL3l5blNxNmpO?=
 =?utf-8?B?UUF2YXQwb25tZTFFVjVITG1PQWE5QXh0Y3p0dCtrYjZNQXdZVEI5OTlidkYv?=
 =?utf-8?B?TC9QblBSYzdpS0dCOFpJM1pDSXZQb3E3S0JZelZUdzNpNFd5TnFzVzY0S2Nt?=
 =?utf-8?B?c0dNMHpFVVNVYytTSkczYytDNENCZlVyZFFYa0E3QTFrdmFQMmxOR2VwV0hS?=
 =?utf-8?B?a2RUc3ZobDZkeis1TllaUXJ0aVMrdE5nV3ZOWS85ZDVjbzJNVkVkY2hFbEw2?=
 =?utf-8?B?R0FkMjI5OXVGVGI1SStIZVpXMDdRRXYxK3dML0ZnMU5yMDNwak1TS0ZnWEJG?=
 =?utf-8?Q?nFwc02eFpPvJgTIyDtSFNDhZqohb89pIH5smvB0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 342d97c4-7771-4459-c3a1-08d909a75e4f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 18:07:49.7175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfdIeFKMDpxkrZog+6sWH9JLi761R+GKiN+mCVFeH+jEcd8RtPATkqIpUgQSh77lyOkU5WAAwkUOyZzk6nlu2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2556
X-OriginatorOrg: citrix.com

On Tue, Apr 27, 2021 at 05:37:22PM +0200, Jan Beulich wrote:
> On 27.04.2021 16:21, Roger Pau Monne wrote:
> > Remove the unneeded usage of the compat layer to copy frame pointers
> > from guest address space. Instead just use raw_copy_from_guest.
> > 
> > While there change the accessibility check of one frame_head beyond to
> > be performed as part of the copy, like it's done in the Linux code.
> 
> Oh, one further question: I suppose you mean historic Linux here? I
> can't find anything like this anymore in current one. If so, I'm
> inclined to suggest "..., like used to be done in the Linux code."
> Or something substantially similar.

Oh, so my local copy of Linux seems to be circa 5.11, and AFAICT the
code was removed in 5.12. I can reword as: "..., like it's done in the
Linux code in 5.11 and earlier versions".

Thanks, Roger.

