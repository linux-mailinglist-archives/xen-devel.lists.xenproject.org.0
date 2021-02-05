Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDB0310D4E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 16:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81819.151267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83GR-0000hb-KL; Fri, 05 Feb 2021 15:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81819.151267; Fri, 05 Feb 2021 15:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83GR-0000hC-H1; Fri, 05 Feb 2021 15:43:19 +0000
Received: by outflank-mailman (input) for mailman id 81819;
 Fri, 05 Feb 2021 15:43:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB+w=HH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l83GP-0000h6-Ii
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:43:17 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f46ad903-751d-4ba6-9fde-780eb22fd7c2;
 Fri, 05 Feb 2021 15:43:16 +0000 (UTC)
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
X-Inumbo-ID: f46ad903-751d-4ba6-9fde-780eb22fd7c2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612539796;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mH9yQkQE1fqjRRX8L2lFXDS47yVPfUw4NppaJ8wSLnQ=;
  b=fT4qYq96F4PbOKvGa4bvKOVJpCJCrte30STrnJ2YPwdnIki+aEbg3xiz
   RzdTumJDmaNbDbILKCbLZtU6GHDnNoP/nEx4cDH3+3JLmqJbo5QD+F6Sj
   /SDJ3GB7+Szp0MdrCEodddI0DajZMFnYdVPjOA3dnR7fZJOYrrb8pZ4c0
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ex0bbkdtnMwWjLh7Ai9ZYX1H7X+eS1N3ddpcfTuagk1h9Jn+TF4RHi5vfO6ueSlXjX1pMoDH0i
 9EJ6XEeeIog5yHFFC/mwgHciaiPCZctV68EQguM5+WhYUd217bZJj3gdtw2XyerGcPq4r4WyB1
 dEecPA+ZnaJie3BHrs14wtDXNpoYAF2lVt/e70mMI+OdzFLkDK0J5j4htg/jpdW8zB+a3xL5TT
 rlEh4Nk7XzaV2KzRvhxyA57xAeYMqWuLqX3zVhbzewRuhSgpvDbOv2bDnCDeiVUm7aYhgOhslo
 kLg=
X-SBRS: 5.2
X-MesageID: 36854674
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,155,1610427600"; 
   d="scan'208";a="36854674"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7HTzf18NmHFSRsfHxaZEztXkvhe/Zg0O2LoSPTOLltrGhyvK6FxgwJOSWQySld7Y1IlQGqm32fRuMuFIVUgyc7WrePJ2dTcslXQhB/zeWHTMb+0LxGN1Fr1Iu87OFLhW62cIgPKD4r/7rFsmhOr6XvwHx4sHEOBYJe3YPMWN+DcWjAgRmcJvA+NqBV3RGkgxfRalEQ5cLiBViTj+Y8WmJGLlH+klPL4omO69rAhdyu2WyDlluurZqe/NAkxCn/lKH5Tm0XlXJkr4ukVSMbXZ6M0EYj8ZImUMJr5sPnHazkdCxsOcI07DymR9if45ijQJP70wKYfCghvQWZ1KRcN8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH9yQkQE1fqjRRX8L2lFXDS47yVPfUw4NppaJ8wSLnQ=;
 b=ZFFWOZYOR96KtORLXVsmjIyN3wjWvt4RTfYGLOK67fpwB/6ZWXe13/TBuGC81t+XBEy4zG4dyjompOFARioaXpG/RxawzPMqE1kc08k3OITGzpGF/RzfSMXK+wNBfNWKxGtD6uak+8nSQX5Cb3nGVKvNvRJWQv93n0mYdkQAj9kOMEDYddbJ6hRg9OQYMwy+t7ekUhdF7TAuGhH47mpbhh2qhiVTa2pRa3cl2ioD1t/PWI5Q0COI/Ivqw1asD+FfBFuS5UHbLIFNcIgVWkiuNYlkClALivAWJ0XPY/JZDocLZ93IBP46wNxAPFKAONxveOoHJz5Z+pXiAyh4MYzZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH9yQkQE1fqjRRX8L2lFXDS47yVPfUw4NppaJ8wSLnQ=;
 b=myjycmqTlsvzqFkwGCm/gW0MlP3As98v5Gdw3yIAnGj5NHATXHViNS0htc+E94frHYksIONFFikDUu8Jd4ohphFjd5DqeATQhP+k8Hi4sBIuv4I5IUUHwmIh6XAep8mW70dif62M6PSNWfss6U9Gtv6t4PbZiAGQKOsj70IpcYw=
Date: Fri, 5 Feb 2021 16:43:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 02/17] x86: split __{get,put}_user() into "guest" and
 "unsafe" variants
Message-ID: <YB1nhBeMRVGyO8Fk@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
X-ClientProxiedBy: MR2P264CA0015.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6bae161-3f8a-4d94-0368-08d8c9ecbc00
X-MS-TrafficTypeDiagnostic: DM6PR03MB4219:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4219FEAC90C6DC79ACD32AD38FB29@DM6PR03MB4219.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eXb0pViF+tpdpAmm/j7/KXeld+8BAdL19iVIPa12peeQLrDTvhRFwTkixdCxdgn+1pjiGUHD7GSvG7dyIvXebxbeVubpFMgpQ/Eq5l1Gv+gy4hWdk24lXbYBC8bKm1bS+qt2CqNAe9U8/K6LdpdS3KT1CV+SAxdC+TtZf2if1f+TueJCDtOSabQMGkF8oTbWslpjTLTdIvRoNxrhw/AYWdMqE0qUO3mLbbz8m4NJn9P5gzCThEfCaRpOUiiYmw2HUUt6b9XpKTEDIc6fyQtt0S8VhVfsnKR2vjz5KmzrWB+eS70fjXOaW8uz/0qc0ExaaKYmKnXE8XlZ+uL9WjM8jbs5O/ijdc2parmWiadW3HRNX7XS/XzJht9WYm6uOV1OwOBgD7IP0vmwiKlmLOGrujNTAeiAmkzC4/dacwXZSbTzfoFPTgwast4jqfN2XjQ4k4UzZNWt/EwzM2lK01rUQuq8LotBLLAtG3ABgmMpftfRAhWYDecCmVxZngbm9oCYGF7R7nbje93bqTQfitl9lQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(39860400002)(366004)(136003)(376002)(478600001)(86362001)(4326008)(186003)(66556008)(8676002)(4744005)(6486002)(8936002)(66476007)(2906002)(6496006)(26005)(16526019)(66946007)(85182001)(6916009)(54906003)(33716001)(9686003)(107886003)(6666004)(316002)(956004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzFPVXhHQmUvS3lMVytmSXZzbTRPTFd4NUtlNVhWbnZhbUtvOEliZHVMdkY2?=
 =?utf-8?B?OURiSk1SOFNIUUF1eHp1MjVqcmRoL1pKV1hJZXBSeWxuZkpSdFBzbUc3YXNK?=
 =?utf-8?B?YmFpSUFvK3BoNllpVHM1WDN2RDNyYm9rcmh0ZGplYmxjKzFlY3hUN0YvMm1r?=
 =?utf-8?B?bzZaYnZmS2RGRFZydzVQYUhlMytXcnBHZjREbGQ2TVlRN0RFcTlWQmtLTnRX?=
 =?utf-8?B?MUFlaWpUNWpLQWZkTzBvcG1HeVNDbVVoY3NvSHpyNmw4Z3JpWFBWbjYvUzBo?=
 =?utf-8?B?ZU0vaDluajFxVnpIbkNmRFAxOHVoV1QxRStkMVZJdyt1VFBOak9wR1ZGNzZj?=
 =?utf-8?B?UVV1VHE1S2RBZHBWWUVuZ0xqcnQ1dHZTNkdUSGlsYjNZM1RFK1ovQ3BoWktt?=
 =?utf-8?B?T1RFcU5JMWhESzlNRGRtYzMrT3BlMnBoUHVFM1BTS1Y0L3hsT216dllwZVJu?=
 =?utf-8?B?THNVS0JDS1BBVGlRZjVRMkJFZnJ6blN3Zm5saHNZNnVvRmtpTG95eVR5SXZS?=
 =?utf-8?B?RStFMU5VOG9LVDNHaGNyaGpNL1Q0eC9xN2hnSHYxNVU4M1BCb2s2eDBiQmpV?=
 =?utf-8?B?Z1YzeUlLS2FZU1VZVlZLOTBCeG95bkNJc1FlM2JEM3FZR0FoM0lMRkF5ekhz?=
 =?utf-8?B?RWZ5ekNCdFhKUEZQZUVML1RkN2dxTW5qK2V4SndwOVUwLytyVXFDbWtZalRK?=
 =?utf-8?B?MTIrMW83bStwQUxhK1RRZjloa2ZOa2JDY0hicS9zTmFDeDZLUXJ4OEJTRytj?=
 =?utf-8?B?MS8zeGg3b3ZyUjUwZHRCWml0dFN1S29YQ1FPVHRyZkpnRGJpaXB5WVFPTTN5?=
 =?utf-8?B?cDhwOXR0b0FKUDdua3FXem5pOXVQeEJ6Qm9RblBRSW0zY0UzRkVwNjFySGRo?=
 =?utf-8?B?Y0FkZmY5VkJ0U2NaSW5JeXhWVFFQaDJrcjFKdTY1WUVGcDZmNFUxa0R6RWds?=
 =?utf-8?B?V0gra0cyZWlsOG5iYVNCeEkyTTF5RlR5MzlYRFNpZEVJdmZkdmg2eEdYMFZz?=
 =?utf-8?B?QkF6bzZ4cnJ5K0JFL09PSlhXS1ZPSFA0S0NCM0tveEZpbEF5QjNKQnhic2FZ?=
 =?utf-8?B?YWo3TDR2UnozUXVnZ2ZYSlZia0VhcDlTYkprNCsvaFZ3QnNVT2NvaUdQSHda?=
 =?utf-8?B?Yy9Hb0lmejJkOVk2Q2xNVHFYMVQxMlViVTlvTnU3N09vZzkzK25rbC9URzh6?=
 =?utf-8?B?K0lTQjlDVGV6Lzc0VlltU00zTEx3TnVqNmJEcUN3NmcwQ090bGRWMEdqYVo4?=
 =?utf-8?B?aGRNRE1WRk1RRDJ0emJqeVZOM05MaUtNV2NkemMwNUppYi9Jc1NCSW9ORGxh?=
 =?utf-8?B?YlI4K3N3S0dXaHNaOUh4cXFudXJPbkl1L05sMmtPMU9xM1preVl0d1F4Mkdv?=
 =?utf-8?B?UDV4aEZxMHhaTGoyVTFCSWVkMDNwSGF0em1jQ29wdnhtRlBHYTlmcUZKRTRl?=
 =?utf-8?B?U2hjNE5paWhqQk1VMDQ5N0dHR3JuTGNhVHFGS3J5dkZpTGlZc0tTbWVZQVZX?=
 =?utf-8?B?K01Nd0FpK3NLSzlBMDRGQVVDUUFpcWVVdW1MaVpxYU1hZDNvenFLc3JNQWNC?=
 =?utf-8?B?WWtwNjNDNXlic010bFZFN2FKdWFqT0VBa0hDOHVTMnBzWktzejAzUzZVOFVN?=
 =?utf-8?B?Q1d4RUtTaFgvTGxWK2NUWEFxNmRoMGxKZXRGdFF3VHB1eTUxWXBwTEwyQitC?=
 =?utf-8?B?TXo5MjE2MnFRMHZyeTU2SnlrK3A1WGFtZDVrWCtGTDdpMS9uMStXMnRnME56?=
 =?utf-8?Q?1pafqDLEkuK0eW+hIm6gXGzHrT44rh/s6QHUckR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bae161-3f8a-4d94-0368-08d8c9ecbc00
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 15:43:07.7861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXLl0U6OpnQi7SmowwFMmgLheA0Jro8ZeOYOJ+AQtIIzzbER2OuKsaIEH9QPqQYBIR3LQhDT0x6SFi566R+6vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4219
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 04:04:11PM +0100, Jan Beulich wrote:
> The "guest" variants are intended to work with (potentially) fully guest
> controlled addresses, while the "unsafe" variants are not.

Just to clarify, both work against user addresses, but guest variants
need to be more careful because the guest provided address can also be
modified?

I'm trying to understand the difference between "fully guest
controlled" and "guest controlled".

Maybe an example would help clarify.

Thanks, Roger.

