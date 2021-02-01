Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A9330A5D3
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 11:55:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79738.145173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Wr1-00076n-DR; Mon, 01 Feb 2021 10:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79738.145173; Mon, 01 Feb 2021 10:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Wr1-00076N-AD; Mon, 01 Feb 2021 10:54:47 +0000
Received: by outflank-mailman (input) for mailman id 79738;
 Mon, 01 Feb 2021 10:54:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6Wr0-00076H-2i
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 10:54:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e47bf0d8-2e74-4d75-afb9-ca4d5714e311;
 Mon, 01 Feb 2021 10:54:44 +0000 (UTC)
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
X-Inumbo-ID: e47bf0d8-2e74-4d75-afb9-ca4d5714e311
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612176884;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=t9YagauD79mi4YmCsOHZ3R/PJt7bZjM72a5/MZdCZIk=;
  b=bjQwtpmu7Asvx45eXE9yc9BzQq9Fju2Ig89/ma9pajtEEU406IS1ARqL
   qu3Q+O9TYiwHsENN+TeVW8u1dyWmSi2lpPQbDr6xhwEx5b8bWbjg87vMW
   0RcU6/UThZhcQw2poxaMfuLGCXOSQVeFr1UEOxm/V4bVl+eJSNrhba4hP
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: y4v+UCg4gpTRFVEbIOaWsOqVCNgA+3MQYGSsPGcd7Pmhxxz+Zh5gL9s6xaD7cKthU4ChLy7JnT
 u7b2Zu9x4zgUG1TarBOlrx1rNNQqxS/Q/IvEOW1t6ilMcnJfFAsICEWgWMhmPqSOw8olM2+4I5
 xdy1pKaB+CffoUdYi6z+MRxUdGQ6jAP2zFTXxJ+3Q3KJIRu0OIwZqWwrI5ts2bE8uNf2REMZdC
 UrZ62ll+FGBh3Iv1FqC57dO+MoOY/ONrbjvqydqJ96enmTxC4r1EEjoYTvGLiRlkLYzNVCU5MQ
 Vec=
X-SBRS: 5.2
X-MesageID: 36303987
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36303987"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkuGLNpMsZN4KA0viBOYHkYvXCfsCz8jF6AkIGJCHbb0SF6n7IpEn1fLZosCPIiFPnx4MMauAdcO+7a3jAxIBjSSpGr0hfUYtpnfjcOAakSa/9lTnONKGDHg8a63shgW04PNl2ST/5WWWiD7ZGYoSU7Jh2DiFaFZEOUVyVliMUF/a13ph3Py+9nww/s86w0MC0LAaWFBxTOoid1/2F+cVU3Iw2ndnwpKS3UpFP/Etpvi1NMAAV7p4MwTxpIq6YDR7Jl1QISonJg6rM54UieiTM688Jw+P8qg+7sK4elPX8cS6tDtGAGZCl3hnDT29q4qkrz7K4olZPHzMn5D70tpmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBB2pCXj9pcuxSS5ALOe282uccOem3JuCD5/fK9/WME=;
 b=RI8avMy4KEEhNvv2xnh+Cr3Qvuq3Nfd4yySIMxhOxP77EEJZO937pUPgkPL873AUzViE8c8lR1twHklS4U1nlKpabihRmYXpzGfTFq8bSSHCLuFFVcTAqm0VlGC3sHVLuY0bog/l/P5tvOSvWUMz//rM49EtLYYCTWoIp6jngpZjAVWq2LeP6JRgB0qY/CxAscg0KkXDAHeFftT9D2ZxONjsZAzxlU86nBE/EIRP6/96r1j2dv0r/0KYWIJC0UghOepDF0icRE/wpgLCZfgkRSJf9wfehOwuf4fsKFZrVpguz7WOFTDp0Xlm4zy/Bl20nr65EWSxql0kvaeWsS22ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBB2pCXj9pcuxSS5ALOe282uccOem3JuCD5/fK9/WME=;
 b=fHO4SsOY5ZO5zQRItLgR+GTZVdKFAoScWGVlQo7hYYaF22wg4KhcIqZ6ACfFCnHVIjr9NOmxoosX2QLsBIUJn/00+Z2Gzvi5BhwENLE6xxlI2bD6ZjIhM9T9zcvQQRVzlUk9MA9NAXmYQA8i8ZgEIups9VhWqFhVReMCKW4YSWQ=
Date: Mon, 1 Feb 2021 11:54:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] libs/light: pass some infos to qemu
Message-ID: <YBfd62T1LNh+zyjj@Air-de-Roger>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-12-bouyer@netbsd.org> <YBKbEhavZlpD75fU@Air-de-Roger>
 <20210130115013.GA2101@antioche.eu.org> <YBe2RSZeJBeMybdt@Air-de-Roger>
 <20210201093939.GB624@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210201093939.GB624@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0088.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25f12d7c-b20c-4ca9-7ab2-08d8c69fc69c
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5324C0E7203F874309E3B6B48FB69@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Uk5uNK1dyASdJkGcwC5Wtk1yQQZ9AtVH4NlMnsmLwkd4mC/k3awSfQthrVhBF7lDSks9lc5jBKNY09L5j54YkDknFq7B0Ut+BSFy2IcOvRoYOt4sHy0Joe+M8+WU1TPyZeu/PYu25zUNfvWgwGB7lkyu3KH5LYT5WMCQJ39qb40Mw08TKXhNg95CzPznyv0dHMQ0nADkjHBNK9VewdxoA61EsCvR2oS9PAtJcBG2GcrIprC6jhwICeRYsws/hQIQ4lnXfxvVIP2bT4mK/Gqt9QyhBsrRJg5BjjEbbaHDOeEkX9zUR4ENkjK10pQ8jdY6hlebuKzowa5xxXWDAegWi3HpY6GI6DDQHGNOBsueDAtM4CUa5i6++gEN1sHrwNrz4HbjaNDqrI/Su2LrI5S9e9hVuDC97kEj3fuGRZarOeJjVBy1DRTY3E6BIE8RVyMe8775N9+jKPTTDqvQ0CDRa5Hfv89ri9jNcwV7FUeqXT6meSdrVLhql+/oJ1FhXu35vDg0BICb+rEE1BUjTmP43LYQRdcSeOghEokHnZMSx718tIJWzu5UjeUWB4peuSrSKzDB5FvHSOks6wHTbZg8Cs30AkUJsUuD0h9UoQCkE7x7M/l65L6qtVO5E2+Mbhulu2jTemHeU5oh+cAQoDwDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(966005)(2906002)(956004)(478600001)(5660300002)(86362001)(6916009)(8676002)(33716001)(66476007)(66556008)(6496006)(66946007)(186003)(8936002)(4326008)(316002)(85182001)(16526019)(9686003)(54906003)(6666004)(6486002)(26005)(107886003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TzYvNnFuY3NKMzJuRnpLZGhjSFMwblQrYUhQUWExNEl0VnZGYlNuNnlpWEk3?=
 =?utf-8?B?a1JwazZJS3VUOFRTWmx2eWNDK040Y0kxMGM0OS82TVQ1WnB4eW5VU282R1VL?=
 =?utf-8?B?ZjlFSzhzMU9TODRzWEJPbWhUTE9EVzVZVThvUFlwc3FhaUNzUmtNZEQvS1c0?=
 =?utf-8?B?NXpJeXZ3UlZEZG00eE9uMjdjYm50NzBtdXBmKzE4TzlPd1hOTmdiQW9FWjNm?=
 =?utf-8?B?V3ZMckpRQk93Nk1QcU1ZcTh0QWdvd0JHOWhUSGx5ZnczZjZqWGI2SDN4TEM4?=
 =?utf-8?B?VW5MTEJjamFRTzd0UWdTOHBQaUQ3K1ZldW0wNnMvL016K1pQd1Y4dTJyRXBT?=
 =?utf-8?B?M0xhYmhTOUYvRWRPOEQ0R3A3M1JWd2xCdGNIQlVtRUVyTzZ4ZFJoZWF3bjFx?=
 =?utf-8?B?NUI0ZmNkMUxxL2h4eVhoN1R1M3lSdzZwZ2Ntd1A4WmpSZE1pODRVdmVvWTdC?=
 =?utf-8?B?enZBVFRmdE9haUpMd3FjSTh2cEg4eWQ2UXZNRVZuWnJ4L3RoSC9YYmhVZU5t?=
 =?utf-8?B?TVlwSTg5SnpzTzNjMWUyR0pGenZnMERKV2lKVHo2cDdqWWVFOWwxUXFkZHQ1?=
 =?utf-8?B?YlVycE9oL2RkMmxlSU83eFUxZWliL2VCZWhnQW0vMW1qTTcra0JOcUVrdkZ6?=
 =?utf-8?B?RUxxa3IrS09yUGJMOFJ3ekZnOHJRQTRYeVc4c0JHblhQRWdhaEdZdnloREx5?=
 =?utf-8?B?bHdCWnBNSHJkRDB6aG8zYytYdW9obFhVdjdzdk8zcG00Z3VkbnhMb2RKMjRs?=
 =?utf-8?B?d0RtVlFKNCtNelNQRGY4UzZEc3gvcHRQcEdTWUY5Q0c1ZkRCeGFJTTVKdzdr?=
 =?utf-8?B?dkpNWXdpZkU5ZWU1ajdBbC91aGtteWR4TDRLaDRMcEczc0FJMi91VEtNUm1O?=
 =?utf-8?B?SjYxNjI5SDEyUHZlaHVIUEpjWTB2QXVaSjRISXR5bVVtY0xMT1g4MXNmZk5r?=
 =?utf-8?B?S3RJN0grTThBN2RPajhsNE9ORTA5dXFsTGhiOWlLTXJpcUNVTVVtekR4V3ZL?=
 =?utf-8?B?OHJhcDhiWDdoN2J0ZEs0SVA4Q2xUMGdTRGZRK1dWUkI2eEcxVzB0SnVMMU5K?=
 =?utf-8?B?M0owODFrWjI5NGFhTVc4YmJ0Z2N6L0xqdXl4bVVRalNpd0gvSC9iVG1XbWFj?=
 =?utf-8?B?WGw4VHBPMnA4bjQ2VEcvNGJHMktBdk1rNUxudjZwY1ZGZzZodU5Sek1UVTNJ?=
 =?utf-8?B?cFhrRXdhcGNySTJNRFp1MUplRWlYYkdxTE5sdjZMbFdrMWlSRlBId0FHOURk?=
 =?utf-8?B?U21qZGVQUENXb1dsdFQ5RDhtZ09tSzArZ25Db1p3RmZ4M0ZxbDZCK2kxR2do?=
 =?utf-8?B?eVFPZEN4NXJIS0JyTy9XQ1Brb0RBT3hGTTNYOUtkWkxOa0M2NXBVdGhYWlFv?=
 =?utf-8?B?YWtGVXVETTZDVURsbWZwTldVeFNRS3Yxc3JBWHg1SmdDRXdoZUxBajlRVjFZ?=
 =?utf-8?B?OHZ5dE1PMnhvNTFqek9MOThhVWltekpuQ1RjQmt3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f12d7c-b20c-4ca9-7ab2-08d8c69fc69c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 10:54:40.9597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7trm+dJaDzpTz+eTXXFHcn7jBAsNZJoY5ZKfVqMN2hFfXDW9cezxQOmZxo6S1oa6HsDEovaMTT+2DnUmXmBajw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Mon, Feb 01, 2021 at 10:39:39AM +0100, Manuel Bouyer wrote:
> On Mon, Feb 01, 2021 at 09:06:13AM +0100, Roger Pau Monné wrote:
> > On Sat, Jan 30, 2021 at 12:50:13PM +0100, Manuel Bouyer wrote:
> > > On Thu, Jan 28, 2021 at 12:08:02PM +0100, Roger Pau Monné wrote:
> > > > [...]
> > > > Also, the qemu-ifup script doesn't seem to be part of the NetBSD
> > > > scripts that are upstream, is this something carried by the NetBSD
> > > > package?
> > > 
> > > Actually, the script is part of qemu-xen-traditional:
> > > tools/qemu-xen-traditional/i386-dm/qemu-ifup-NetBSD
> > > 
> > > and it's installed as part of 'make install'. The same script can be used
> > > for both qemu-xen-traditional and qemu-xen as long as we support only
> > > bridged mode by default.
> > > 
> > > qemu-xen-traditional did call the script with the bridge name.
> > > This patch makes qemu-xen call the script with the same parameters,
> > > and add the XEN_DOMAIN_ID environnement variable.
> > > 
> > > Is it OK to keep the script from qemu-xen-traditional (and installed as
> > > part of qemu-xen-traditional) for now ?
> > 
> > I think you want to move the script into hotplug/NetBSD/ because it
> > should be possible to install a system without qemu-xen-traditional
> > (--disable-qemu-traditional) and only qemu-upstream, and the script
> > will still be needed in that case.
> 
> I can, but how do I get the ecript removed from qemu-traditional ?
> It's a different repo, isn't it ?

Yes, it's:

http://xenbits.xen.org/gitweb/?p=qemu-xen-traditional.git;a=summary

I would remove it from qemu-trad and then only install from
hotplug/NetBSD if it's not already there? Or maybe just force-install
it from hotplug/NetBSD even if it's already present?

Thanks, Roger.

