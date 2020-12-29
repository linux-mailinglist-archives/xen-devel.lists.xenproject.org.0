Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E32E71C0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 16:21:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59966.105145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuGnE-0000Zm-Le; Tue, 29 Dec 2020 15:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59966.105145; Tue, 29 Dec 2020 15:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuGnE-0000ZN-I6; Tue, 29 Dec 2020 15:20:12 +0000
Received: by outflank-mailman (input) for mailman id 59966;
 Tue, 29 Dec 2020 15:20:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuGnC-0000Z2-4t
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 15:20:10 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf01b7c1-9722-4162-b05f-bb797fa70c4e;
 Tue, 29 Dec 2020 15:20:08 +0000 (UTC)
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
X-Inumbo-ID: cf01b7c1-9722-4162-b05f-bb797fa70c4e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609255208;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=phJUXKEsuBnUAbed3mQNpsnR9fAqyfE9ogI7sOyE9Sg=;
  b=RaJe4iBG7+QcMiB9nE36Rpz+UmH8flBlJoN0iZpygbODgyAQ+xneEK5D
   uCzc5SkUJMOxT7+pY+J/tzEm8n06BhVfyMFtrJqNEN3ZQChYZsR2HL3vx
   db3eoNXRMpVP5pOVDGf9s7Z5NtxA/zk+RRs4NBvam8p18MhbqqBzAlhpN
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s6u5yk4SXnBRwldhM5dt/Tt9vNs3Wgo8N5qP4wP+HC/YhOyygjMEqrFVNAhsOtOoL2WEcyhWsE
 tSW+XHB4SalOf6jolpjULTFOVQgroZdvZKILe8Wwh7ndABuyC8U2QwaOuouGo/hEW8QB/JM5JI
 veTCWFKJ2bHfHbXP0BPxz3pbOBoj3Pm7gP/oQUUwsna2kvLZZmUHJ9CPY35sgUa2G3lfNrWIjR
 1SD3u2Bp5VPBwxFJ6BsNavMXbVyUtOoevdDWGheB6x3rbi7j4ochlUdfGZJGxFtVrHJUzrMJEj
 Bno=
X-SBRS: 5.2
X-MesageID: 34329278
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="34329278"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLBYNodBKehb1Aty/LyaBO66uJnkOye+ZiPGZCgQkVGkM3lfFmnd/E7ILKFL5tS+ccB284S/R6bU9zWiB/V3tvZR0e9L6/6+5hfvfTSgUGmAKjO4IQ8tt4V+r7J07EXO+h/C2/131qU1EmlApyjtNPlvNpSZVJVA1YWOjTSWyzBTNvtPN3xF0zlvLBI7n+aAIJAzR7QuFUdJqGMjgpQcqXVuME/5MqS5CHiG72Qjr45eP19Xc3K2LceFcdJexblMPmmIhb5kxMPuuWzekgq1XQkU0zUIgoy/SOEmGkDvcix3RnVvuaG1X98ectN+c8Fe0jL/IKVK1tjgCvG3M+dxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQXKmy6xWG9sSsKlTZYW/3ACpR6I1k7AGY2g8ru6yKU=;
 b=KFkjKdr7HxA61kHgM0GxdXv3dAI2eFD/VzSOTXdej4I+wLObBN8HVozWhxFen7572l3NvN74Jr9uavm8l8zNgSzIU7dAzKhpbII8bmVEjsgdK8cH8Jx/fQMi9g2J8rRUQ6hq/XsWrvs+mwptW7fBO/a+0Oz0LHW/hToPqNJTHe+aELv65yGgvVWjHC+sbKIbI8l8iX8Xp8A5khE3MynsznPNASh8mWyeekax9pEd3dYwCC9M3dtbEtBDW1mKCLpnaCjiaTzPco94rRC3dY+aJVPZjs9IF1VECf0DLJZA131zzYfk8acsoj/E2eIlslCBCYcHcLCtU73oDv8/ft/piw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQXKmy6xWG9sSsKlTZYW/3ACpR6I1k7AGY2g8ru6yKU=;
 b=PtnWckh8tuyMuxCAnVRkQeppefdTX8dRDsx/3rBwEvn45r9C5FeKD+iiDIA675+bVkvwmf21OXqhMrbCkoVfdWEARwND0OoO5so/sP+mQ6nnOIvZn8e4V2ukwWAHNdtBYfLPVstnilQMYzz15l/3Ji9/4ODUt1og1X8cPtbst+0=
Date: Tue, 29 Dec 2020 16:19:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 14/24] Pass bridge name to qemu and set XEN_DOMAIN_ID
Message-ID: <20201229151958.ungp5efzj75zszzm@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-15-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-15-bouyer@netbsd.org>
X-ClientProxiedBy: MRXP264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d08ebca4-e23b-44d2-5953-08d8ac0d37c5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4217:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4217A258792D04592D5F4B098FD80@DM6PR03MB4217.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xf1eQV0+MmuTRBFB3V3hhfWMUbzM++JMFHi6sgMJcA4+eyTwNul9uydjb6DG7SsG9nv/enZ6PMPsI2EbVzm2JM5aifDjOJNW7izHx/5A9T5iOPIm7ENcTzOVMIzXLmxj5Y3pMUgXwAYCz3L1UeOKAed7b6BNtmlPptznzPH5lswxBThYA6TGgclNk8ecT36Z9o7QLhMC6odsXyqeKTScSnru0NF/D7+vx7lKAV1U68r0Eo889uZkOVfz4TZ6m5w1tqMcz4On5gjsSkVrS2aZ3BqyjmwmzFmR7fXSOcEZQqqYtjYhZDEnLxDZ9ICFCFHcNYVkXoAco6QahiGuh7ycFkGZ6pxJnV9yGL2bp90/37M/wfL13eRjCkKrskXXkeKL1i1RZD8izjm6MBKpIVM6Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(4326008)(9686003)(33716001)(6486002)(2906002)(6496006)(86362001)(6666004)(478600001)(5660300002)(66556008)(66476007)(1076003)(8936002)(26005)(186003)(16526019)(6916009)(316002)(956004)(66946007)(8676002)(85182001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WHc0WFFSV2w0bkw4cTVkcHYwSm1RcTJJbzhOWjhsbi9wMjNpbWNUUnNlSW5a?=
 =?utf-8?B?MVE4VUVPa1BkSUhpTVlPTWl0b1FGM2tHK0E1Zmo5WEFvRDJDNlRpa05Dc3cx?=
 =?utf-8?B?YUMwOFlXalJLZFNjRE1xeVp0Mm45a2hCNlVsYWhEVWRaMjRqbnBTM25iYlQ1?=
 =?utf-8?B?T0tWZjc5RkZiV25aaDVqTTl4Ry9DbzFoTmJ2OHVZMDloeFZjQm4wdGNnUzhW?=
 =?utf-8?B?TEc0Zk82L1pBZjRxcTdGUjF3UVppQXBWVzNkMW9xV1A0ZEQwSGhVUEV2TDIx?=
 =?utf-8?B?djF2SmNrSm8yMkJIQnVkUWh0V040N2pKY3MzUkw4NWFPam1mZ0VudGhLUWRE?=
 =?utf-8?B?MzlzZnByekVPTSs3T05zQ0NWM01BQ3R4VEVJeFlrRk1EZ25NY0s4TWpLUnhv?=
 =?utf-8?B?OFJIak9iSjNNdXRZQTQ4a1hEYVB2RUtGdVU3RFIwUy9zalhQU25FZ0JsQm1y?=
 =?utf-8?B?Sm51bFhvU3FMaVM1RDZvNWFoQjRCOG5Ga1lXV3hnVXltTE1wS0VxL29aTHNz?=
 =?utf-8?B?ZVpVT0pUdkFhWFJDTEV1UkdtazFTYWFJd3hFWjNDbzdENG0xZ1JIR2JTOWpZ?=
 =?utf-8?B?NjkyUW5TUkoxMGZ2RTFDRmYzQWxEaTMzcWJGdG9IcVU0Y3dmQlNiak1NYk03?=
 =?utf-8?B?Yi8wWWpweGNPd2tSaG5sNGw1YU1ocFJJVmtDdnpDRTJyNjV4TkhueHVHeTFS?=
 =?utf-8?B?YXlnRTRBZzFENEJTVHJ2VHJHM0l6STBKQTludGk5aGVtUjhCclNhN0JrM1RK?=
 =?utf-8?B?RHhFRW9yNWpYUkFpVEVibGhxU3VLOTBhZFdITDJDWk9ZelFDelJ0NGUrQml6?=
 =?utf-8?B?bWtDTmR4VlRTNDVPQVMwSjB6R09nbERkT0ZiSi9McFdoSG5sdlFQdExWRnYy?=
 =?utf-8?B?Vi96VG5VczlPbStEZ0w2U04rUG45VTl5c3N5ei9zVnNoZTB2RVlOb0phM29j?=
 =?utf-8?B?UW02N3l6TGFOZzZQQmV1MnNSM0JpeWZjZHhiajErYXVpanE3aUd5UWZ4M1JS?=
 =?utf-8?B?RmhHanFxLzZJZjJlTjF6bEJkcEV5dlNoSHhuM3ppbHlDSWdnOGF0N3hkZ2VM?=
 =?utf-8?B?TUIrOVNacFlRelhML2pYeER2T0p0QWlxbURDNmlFQTJLZ3hYTkFCMHF5MEdY?=
 =?utf-8?B?T1hrQzh3c2haVFZ0bEtaNjNEcG5aNVZHeDkvODJMbEtnNHFMUm5ObGNOTDVK?=
 =?utf-8?B?Qm9zVnYrRERqS25CaHBHOStCWHE0cWhZMFgrMWVkRmdIa3ByL0NvR0JSWEZQ?=
 =?utf-8?B?U2ZGZkZUTVpQbCtBNlJvOXh0QzBMNnVRNVR6elV6TnYyREJ4VEowZTFCM21P?=
 =?utf-8?Q?2NP+gcLAqHIan+SZFC6HJ4MWerMVFLWq3c?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 15:20:04.2072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: d08ebca4-e23b-44d2-5953-08d8ac0d37c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljIoqrA6Yhow3yruiP7pSfVfDSk0OVqyrKD2Zo1lyxsU/7PKaNn3elQr6DFGUCum1thYGK6d5//EjqUuTYDwug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4217
X-OriginatorOrg: citrix.com

On Mon, Dec 14, 2020 at 05:36:13PM +0100, Manuel Bouyer wrote:
> Pass bridge name to qemu
> When starting qemu, set an environnement variable XEN_DOMAIN_ID,
> to be used by qemu helper scripts

NetBSD is the only one to use QEMU nic scripts, both FreeBSD and Linux
don't use up/down scripts with QEMU.

> ---
>  tools/libs/light/libxl_dm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 3da83259c0..5948ace60d 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -761,6 +761,10 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
>          int nr_set_cpus = 0;
>          char *s;
>  
> +	static char buf[12];
> +	snprintf(buf, sizeof(buf), "%d", domid);
> +        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", buf);

Indentation, here and below.

Also just use:

flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID",
                      GCSPRINTF("%d", domid);

Here and below.

Thanks, Roger.

