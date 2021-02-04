Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82830F00A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 11:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81203.149608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bQ5-0001UQ-49; Thu, 04 Feb 2021 09:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81203.149608; Thu, 04 Feb 2021 09:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bQ5-0001U1-0p; Thu, 04 Feb 2021 09:59:25 +0000
Received: by outflank-mailman (input) for mailman id 81203;
 Thu, 04 Feb 2021 09:59:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YP8j=HG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l7bQ4-0001Tw-2e
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 09:59:24 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd9adf15-8baa-4332-bb45-9958e234a8c9;
 Thu, 04 Feb 2021 09:59:22 +0000 (UTC)
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
X-Inumbo-ID: dd9adf15-8baa-4332-bb45-9958e234a8c9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612432762;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=W9Sgws0EDVlIWBKMhffh921IrIhIJ8uXbKzG8O0T568=;
  b=bcAOeM+3jeiNaUXuWwC3HVPU/KMwXGRyhK5Ybc3DrPa15BGLB20fxWiC
   /tuR2l4/HyPE49I0ryYt2G+P9FV8/TYMSoPYHMFtyJ3uhTgwUemZgZJd+
   iwDWEyfSG7Beosza8cPOWZiXZBUSMFuhO9kQOjhWozNBJrHX4mchcDblx
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iNtYdhjJhDpc6caSqQvJcZ7qPYpYWUm+kzcRt4/szpqYb1rw2yVKXGhSuctJYuebLiAR6PefHp
 sUiGRo/OB/yzWqVz7iTTOC9jPlj+J5pX8tsmvyP1VAuNJmSl88oCqyFEEcEjnDBqKXCgKgOGdj
 tTSI9wTDZVK73rnc6aBPP0IPWrtWOV2mZZSlL1luhrP4aggBpiVJn0fgOT3P8oZ25Q0pabcum9
 V6pgVwrqcLnsppE08qBjgNawg+0EK2DmUc8FsL7MScVN71DetHW0TkI+1G6gOhMgl845XssMe2
 xqs=
X-SBRS: 5.2
X-MesageID: 37877702
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,400,1602561600"; 
   d="scan'208";a="37877702"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbAeWZhFt8a5ECwoQk72MGtGSdXxcEXPTz5Qv9nkAxJaHaEXa4fzTfLd9a8vQwgajvKRcGTAMpMbeZqGIUOKL8YJY6hg472YC1Eur/uFyqKGaLfLz6+2nYb8c/HXV6fbe32Ip8PDEB0/4KH8uYa/aCd9uEId1bBXptuprX14G8gwHHneUULRWFCXCGvkomPtH3qmzlbcOVwyNZDFkzhAxrRlI3tndxV2GOShL7BZNIpJuarez3huJVav3UnzIBIBi5cHkN9AKFjLbQJNv0ZMWkxcgffx4EI0wNV/NwRo9Z5/Mf9dvp7yqfpUJZLCX1bD8sQSoyJk4Ebtdr8GQqAE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16gpnVe2bqK+U1OuPxS4+M70hUJQBvf7g9iJRjSl3oI=;
 b=n0NcN8nxrvAB8kC97a9C3UnUd8JzgIX0dcumVu1yiHuNNASFvi6PSWUUhXk2inahMxgJMUKBCA9cMwwGlgYv4ob/x14c3P33TA5/U8YORYCVrjVYAIjcdzOwQFyJbeu9InTq1GI55s3cPmC0b1pwLc6az5Hpbc286/5G5HgqX80TPsye+tc6A3IdioVPWHxXKN0aqc8Q0dummmjnI9GybJ3OffsPZFiMkRF5sEy59pEXmrK+vlZuhwnmXrdj2d01HB1+D4D0i6P4FtV1/UUHnJMH7NpyGQ9Yxcl43wYBD2Zda8ec75pmxvk+3Y0JDsDnaW2m+sjU36HGWlbvXc85IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16gpnVe2bqK+U1OuPxS4+M70hUJQBvf7g9iJRjSl3oI=;
 b=BiRhFhIGDxifQU5jeoc5TwigTn2LsuvFOs8LJ+YuAhY06eIF960YIWiZyNU87cm15314KawM5WVJHorn1s9c/M2HGB/rJwawNh1s/FHBHbVTT0q1UAjT8hPP1+cYvuqiD7696/567TViB2geBYp/P72aXiSMeLSFfvPMK/jvr6w=
Date: Thu, 4 Feb 2021 10:59:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15] autoconf: check endian.h include path
Message-ID: <YBvFbbnje+Dt7CfD@Air-de-Roger>
References: <20210204093833.91190-1-roger.pau@citrix.com>
 <26522f21-4714-c29d-5ca4-baf012c51ac8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <26522f21-4714-c29d-5ca4-baf012c51ac8@suse.com>
X-ClientProxiedBy: PR0P264CA0217.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 957a5d6f-4647-4568-5cd6-08d8c8f3877d
X-MS-TrafficTypeDiagnostic: DM6PR03MB5339:
X-Microsoft-Antispam-PRVS: <DM6PR03MB53390E980B6880F50E65F3888FB39@DM6PR03MB5339.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VC/grYPAvLbhgvItErIZCuU4Pi4lzSO5kuSx2ZrKTajbcacXF/+tlulAVLEffxgBoDHpN9abQ01eK9EpAbllGB99YDMIYPc2fulUZ9X1gRzcScRwszzqorrnrMo3IRD2U2b2ecEmNhBfKj8JTcf2WrMwyeEkhc7CMxDXJC5TllbTHqp2sPY8wyx2R/GVV1bto4i6FNzjZ+u3S6Ynk7YqYAHSnWASYDPJWTlB1JSzEwFvTLAJIqBuKjhHQ5q+7vqpkLtHv9N/4PtpOjrTwCUIQKIQXTcmmWWr+b461GdOw8eEBVLK2Zb9tWOp3Ry93CHqp6rJ9UofRttxajvUTmXvkhj27KRNSSNrmdrgmZw00es36dscHLwqNYB5jTecdUSpw2rq+ICgZzwE+4JCcjWv1dd/F5zGDzwL+JAmgjgMs/uPPt9eGX6UIyusyUfPUwukNCtKR1whmBaFsWBTpSYwPqJpAljmWGhtQYJtgiVlc6xsgKCq++7S/gG18/IxgnbBxi6B4j74cjq8GxHD2mY9GQaLFoZwSienUByYKIXrlKpTPq+kGlmlKRkcIsrIXD4a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(6916009)(186003)(16526019)(8936002)(33716001)(66476007)(85182001)(53546011)(6666004)(2906002)(26005)(8676002)(54906003)(478600001)(66556008)(316002)(86362001)(6496006)(6486002)(83380400001)(66946007)(956004)(4326008)(9686003)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V3YycVRqQXh6MjlsUVZYZDA4dGlycE1DR0pVUURHWk1CSW9WQjR3ZHN4UENx?=
 =?utf-8?B?WkR6R0NwVGJVOG5iTUM5VmxqQ3FCMDlGUmZSTWQwYlVTYzFsNjlPVjFrb3gy?=
 =?utf-8?B?MXdJNTlaQkx1ODNUTkVUeDltd3RicGppbmd4V1V0NHJneE93NFVIcWxRWmxq?=
 =?utf-8?B?WHM2VGJRN09YNmV2bDJsdlppZDF4cVlnYnJ6K3gxTFpIQURheGNNUzI5d3g4?=
 =?utf-8?B?VEh1MWlpbjZNek0yYmpjcUpRSHZEZWMxTndHR0FDdUcyRWwxUDVyUzlYQ2pR?=
 =?utf-8?B?WDE2UEYrWWZCQ0pyRTROc003L2d5S08rQ005ZkxFK3E0ZWNvVjJXeEZMWGNh?=
 =?utf-8?B?clp0L2cyUXVlOUpRR2JUUytla0R5R21aUWFRUDFxOEpCUFNCL2ZxQ3lCaTBL?=
 =?utf-8?B?dlRQR2VHRWJ1OGN5aTFCYUdraUNCRmswTTZKYmRiTUYrMi9DQXVucGNOckZp?=
 =?utf-8?B?YkZKUENUMGVTUGhvSERwbmhXOVhwQXY1OHJnMFZpM3huMU5vUU1iSnhwZ0xS?=
 =?utf-8?B?V2hneUZ0VGFHWHk4cFl5dG03OXFFcHAwMFdTeFFkVWpyQnc1SzlMUzhOWEFh?=
 =?utf-8?B?bTVCYjQzMnZZYVRlVzdhbDMxaFVwTlA1amFmNllLNS9PUytXSzJLZ3lVWis3?=
 =?utf-8?B?ODVhdlVqTlVYNkdrZFdmcHNBbExJcTlDWXRDVmVBY081NVphYW1VZDZKTU53?=
 =?utf-8?B?aTNPVTVNYzNhTW1qMDlPK3E1VlJON1hrM216SkxnenllZUZnZ2RqRVQ1dkh4?=
 =?utf-8?B?aVdWc1MzakFCZnY4U0tDbGRpYzJyZEoyM0MrcG9Yck5JZjBPU0JlV3lUYTc1?=
 =?utf-8?B?RzJHc3VOM3hvS3FGNXoyMUhGeW9uQzdYZGt1VC9IdlNndU1TTis2dW4xLzhV?=
 =?utf-8?B?SVp1aDVtYVE5ODk1cXJTTlV4RktVb1JpTjl0WnBpUHJtd2gycm1VdEZSVlZP?=
 =?utf-8?B?dUo2SnF5Z05lY0E0alNQOExTSDY2RUoyYzluNWRCVTc0aUNUZHdiWStEMEg0?=
 =?utf-8?B?NTM5YnZyYmFPSWlBNVdWUnQ0RUxQRVl1WFQvYzg1RWhUMHJ1RDVvTGlQYTVk?=
 =?utf-8?B?aWcySXhQWEV3cDJycVp0RUxsTklWSHptdE9VZlVmL0tLU21Lbm8rU0dWTGpN?=
 =?utf-8?B?VjE5TkhjRUkraDFCOEd3S3pJS1YxdGVzQUVDTCtEaGJzZk94YkthaE16V0Rp?=
 =?utf-8?B?NUJObWsxY2xYdmRJemkxSFpUYTZWbWpZaDNJV1hsZEdKc2wyelk0QjI0K1VN?=
 =?utf-8?B?RkZ1dGdaWitzbzFHVHZ2UWpVMEdRS0Z1bmlKcEFvclNKYTZ6Z09EdzUzbTNs?=
 =?utf-8?B?R2VuMVRLQnQra0xla0NQOFB6OEIrM0hrRUg2TitKV3JkRkRCTENvRDg4WUdZ?=
 =?utf-8?B?MWgzWkZGZFo1YVRsbGkyclpSNFF1Z2EycDU1UUt4MU16TjJ2Y1NGNnVVaTRr?=
 =?utf-8?B?RWZiRlE4MjlvSHBTN0cvcHpDL0tkM01CZEtkYjduM21KbVNWV244SHJzZkxP?=
 =?utf-8?B?ZlcwVWhhMGJIQVhiQXdYQnBnQ0g2VXlsdHBJbXZOM3djaXA3bnpjMUk1K0Yr?=
 =?utf-8?B?S3JVNjVqM2NyMktZVXRIa09QVWNuZytlanRXSDlQcmZERjVML3NHaktoNHBV?=
 =?utf-8?B?WXUxS0Y1bmJ5SU9xSkR4OTk2RnhhdzNaN1UxZ0FrNHdwUDk5M2FHeldDT2ZO?=
 =?utf-8?B?M2VIa3JmNHp6ZnN4Q3QzNjBFSUg0N3RJbVBNT05VQnJkTHcwMXNFZ3RuUnFx?=
 =?utf-8?Q?gipcKv7WsIdOV20mIcp7djHgota0HdTtUF6FTN2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 957a5d6f-4647-4568-5cd6-08d8c8f3877d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 09:59:15.0773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xx6x0VvqDMfio56DWj7eyi9oAFe+0lErjH4uSXX2nnY3vhzcvaeiJhJUTrYlqwk2vuNzB58EOfwtTd8MVWBB3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5339
X-OriginatorOrg: citrix.com

On Thu, Feb 04, 2021 at 10:46:58AM +0100, Jan Beulich wrote:
> On 04.02.2021 10:38, Roger Pau Monne wrote:
> > --- a/tools/configure.ac
> > +++ b/tools/configure.ac
> > @@ -74,6 +74,7 @@ m4_include([../m4/ax_compare_version.m4])
> >  m4_include([../m4/paths.m4])
> >  m4_include([../m4/systemd.m4])
> >  m4_include([../m4/golang.m4])
> > +m4_include([../m4/header.m4])
> >  
> >  AX_XEN_EXPAND_CONFIG()
> >  
> > @@ -517,4 +518,6 @@ AC_ARG_ENABLE([pvshim],
> >  ])
> >  AC_SUBST(pvshim)
> >  
> > +AX_FIND_HEADER([INCLUDE_ENDIAN_H], [endian.h sys/endian.h])
> 
> Instead of a new macro, can't you use AC_CHECK_HEADERS()?

AC_CHECK_HEADERS doesn't do what we want here: it will instead produce
a HAVE_header-file define for each header on the list that's present,
and the action-if-found doesn't get passed the path of the found
header according to the documentation.

Here I want the variable to be set to the include path of the first
header on the list that's present on the system.

> I'm also not certain about the order of checks - what if both
> exist?

With my macro the first one will be picked.

Thanks, Roger.

