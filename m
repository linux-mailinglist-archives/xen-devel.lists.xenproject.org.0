Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EBB3A2DC6
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 16:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139911.258601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLOj-0003og-Hn; Thu, 10 Jun 2021 14:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139911.258601; Thu, 10 Jun 2021 14:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLOj-0003lk-ET; Thu, 10 Jun 2021 14:11:05 +0000
Received: by outflank-mailman (input) for mailman id 139911;
 Thu, 10 Jun 2021 14:11:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sV8R=LE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lrLOh-0003le-NQ
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 14:11:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85a99871-631b-457d-b6c8-a73b39e154f0;
 Thu, 10 Jun 2021 14:11:01 +0000 (UTC)
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
X-Inumbo-ID: 85a99871-631b-457d-b6c8-a73b39e154f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623334261;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lgwASCWQF4VT4PipYIDMFcXJCeGpKLOTCwLaRxcrzc4=;
  b=TA+cN+RUbAGzi6IXOGWfM2GAmXRLnAYDFYaMPh50nA0bD4kCS/LIDP9n
   bXIr6zCVmIzwgaJmeYhQ+uKoxApmNoZuwR4YYmQEnOl6jUmQJPpetakr7
   RLuDHqf4kdMOBoXLeDVdWlST8DIAdZSzLp1y6D1WeuI2PkP4C6qMTrxPF
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Dn+qZlRp7G09v2c9NYF0IeRCIncCWt1Al5ezUuXWgFVUfWns56SuAPKhNUJmC8PiLCo3xiDWW/
 GSVvjvCxvmt3+M2zxmL9UKC1krh/PUz44p5UC5Vb2bvOMbiQL0elc5DVH0nJf/U8V3GOV8sFSm
 75TXOCB8Qk9F7suJf6xHiD64OAmKfVAt8BO/fHIm75lFmnwtoZ/vwwt2UEJ601zA0D9qTV1kJg
 J/ydyU/MoHDDWM3PUXH7Z2Gc0YX8OJexE+vaVi49PeZy8C1ozVLLChliBKG2yP17hkY4JsbYkJ
 6r8=
X-SBRS: 5.1
X-MesageID: 47418244
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:N9jyLqPuO4b5qcBcTzb155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyCMbEZt7eD3ODQKb9Jq7PrgcPY55aq854ud3AQV0gJ1XYINu/xKDwOeOApP+tfKH
 LKjfA31gZINE5nIviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sv1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfp2oCoZ
 3pmVMNLs5z43TeciWeuh32wTTt1z4o9jvL1UKYqWGLm727eBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXG4cTSXR0CrDv1nZMbq59Xs5Vja/pbVFcIxrZvu3+9Ua1wXR4S0bpXUt
 WHV6rnlbBrmTrwVQGqgoFtqObcFUjbUC32G3TqgfblpAS+qkoJh3fw9PZv6kvoy6hNPaWsx9
 60eJiAx4s+A/P/U8pGda48qJyMexLwqFT3QTqvHWg=
X-IronPort-AV: E=Sophos;i="5.83,263,1616472000"; 
   d="scan'208";a="47418244"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Shk6MW390KOCC3xiNN4ahU5y/A926s733SBF+5NZ/CuHuL4a3dOz2uXFnGoxVJFti7Li/XyL85VAOpxjYXrUrjLp7yKJOffrWC1KVaS9GtUqmyaYVfJyFe86T7UqyzBpbb9dbRv/7tJFSG2dSeF7s8HecfasggEh5mGzMZrfIQ/12DSBZxiC6gZVq5k439OmdHsa3TCDyPVWp0cG5J9x4OGi6JV5sd3fhVLacEszPvPZ2pEvO0584PGC+k4cbL089ygIyUVaNS0HbNbfFeDFKfZydIh6USJO7hBoYZtfdQPUg3sxaiPQ6E/PGelkFnp9DyDfX9KGewhuK1EbKlWhwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sf1/7BwnEzl3b/iGjErFl9NE3CyoC8EsipigEZbI5K8=;
 b=OBViev7aAX3umkXFru+SrR5ZfjcoiiZ0D7pYZBWLM6CdbVVZlCJnnxCfr0W+FWrojMTJ9F/a1DhuU+CNeEkhZyFOPH/dHUxWcVE/1vz+ouEoq1kTioe+lB6VHoXFn//MY4tKNQf2K58HYaQnrHuVFZN+ewci7+Su5dOHt/5E6EEtri421CzoadxSmNdp3H0iwf64aRsHDBTrWJsJEcMXOvBa2gLhS5ZiHoJQ9Vv+PY7k8S39IePUBr8Dx+rPqXRcFoqNqAVlkeUtrhI/2m73h6MNk6GGqVPiHTal//1GEy4KMo+AQa06C2cRtL0e2JYzYhf0K5hafZYp08vqW7JVwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sf1/7BwnEzl3b/iGjErFl9NE3CyoC8EsipigEZbI5K8=;
 b=JSKEs0Q7JwBUaZnhsA8DJA8MbURvSm+bNhOIcG3hqCZqGJT1kfeg+Iz5tYqv/8pij+zIp6BkZN5wgVjIStejcOjdnmE87KrUiCIk3/6bNpEUfwAs43VLrDEwg+Qqt261djOl3g92IlENvU6ueg8rgYPhRTmGBsI2qub836su54o=
Date: Thu, 10 Jun 2021 16:10:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: Re: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Message-ID: <YMIdbGCpFGZGwLoN@Air-de-Roger>
References: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
 <YMHFQA1L61ntKNRq@Air-de-Roger>
 <30955a5b-ee46-60d7-ae56-23dc7c91008c@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30955a5b-ee46-60d7-ae56-23dc7c91008c@epam.com>
X-ClientProxiedBy: AM0PR02CA0213.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19ff5831-6583-4e9a-ccd7-08d92c19919e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4298:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4298368D3B058FBE3BE936F58F359@DM6PR03MB4298.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IpjGQ87jtRqQmRBgXANsxpX8Gk60BBjB1/bgDKzX/NREFS/ISCwD872vb57SviqfRx8YASBr1XG5HdcMN1ey4GqHFJwIFjRn0XhSI9FLAj91neu4G2gfhH49TNQD6tiBeoaoH+uCE1Qh2xoaqRdznOjQjuvsr4Lzdcu472cLVbhvGmef1i0rIB2pdSU9f3/lYWGkbXbtmx/5y9w4xH9epGhqbNZh+BPI2ZoNFDvWbVF8WS1+Uibzzwm6d9TuNw7x58HTyZQaDR8TByZnNnPF58YkH3+egcqGtX0Timt7p3voV//rYAOBOmrpsB/5B4kyV4xPRKza61RIGJoVlIZ5jxSBwnHpQqk25yX1QVmKLUDrM52p3XMiCvZC4wlp6n4N+aNE+PAvqogdtt0vCtz/yN3ZwBavhjleS8RYJyBFrN2EXWDqWyIKWW+z41rCNVqdwYZ3ZzR7kqyvmB7W8XIbvh1MWzSx5mon4cVWwfpRpFDcdfNFmBOvYDlzrDlK3rAHn8rFJ6v3q13Aj7cv50t0i9brShd9uoJDYI0+6uSY3KthRdF9GQaMctfu8l6Loe/dquEhcOlkIqTuix14ddGmmXEBNbjKvLm9FBJadrii88jDzODdYOQc0lnTOK+kNGKmCOGwEcuXkUkLP2tyQZ/AGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(376002)(39860400002)(366004)(136003)(6916009)(83380400001)(38100700002)(16526019)(186003)(33716001)(956004)(85182001)(4326008)(6486002)(54906003)(5660300002)(6496006)(6666004)(9686003)(53546011)(478600001)(2906002)(8936002)(86362001)(66556008)(8676002)(66476007)(66946007)(316002)(26005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TytQUU5TbmU0TTR2VXRkWnIzTUhyTzVJREtpZ29Mbjhvak96b2tBZXVYUmhj?=
 =?utf-8?B?V0NUdFRmVFJ3d0lWL25xR3UzQU1oQTZJWlkyWGk3ZVhXblhScDcrRWVWVStT?=
 =?utf-8?B?VStTTytSN3lCTnEvTEJwdW1kQlhSTzVWUkY0OEJUYjh4N3QwNWJSUU0xSy9T?=
 =?utf-8?B?VFNpVjRUVXY2MjlwUkl3L2dyOTV3YU5JTlZtanNjY0JIajEvTUg0NElYU3FD?=
 =?utf-8?B?UzhhOGtBWkNOMHRUTVJIUTlTQjIwUUlwK1ZWNnhRaC8zZTQ0RkxFL2hqYkpu?=
 =?utf-8?B?ZVBjUEJpdm94NHZJNTViem5XRUJOS2xnNVFYcmhzN1IzRHM5Z3ZNWXExZk9C?=
 =?utf-8?B?QlFPUSt6QlkrNkV1QzBWRmI3a0xDQjlaZlNQUldrSUlycEc2QjJIVEs2Y0RF?=
 =?utf-8?B?V0pIczlCWHc4Ti81eHBweGoxMGd3QzlmeCs0T3I4cVd6ZzFXbENmSS9yNWx0?=
 =?utf-8?B?RGJ3RENqbUZycGl5MG1lcDRzdjB1VEo0NnhYaUpQYThkelpsMTB3Q3c2akZj?=
 =?utf-8?B?MmxTd1NTbjJ5dUxXNnYvTXFXRUpjSGxreUNVNU9lZG8vOE1VVHo1VnFKalgw?=
 =?utf-8?B?UlMrc0JFTDBsSGdxcGwyWVAzZ3RwYi9OR2YrN3pDU3ZkTEE5SXZaMm8vZjNT?=
 =?utf-8?B?UXc0cG9QZjFSOTZzZEpPcDZnendwVDFtU3hQUGRiMkNHSWROQWZpbndOMnJS?=
 =?utf-8?B?TDZ1dG9TenlaOEJXejlJSXMvVC93M0h0WE1HdlhQZUdleGZvN0txaFlRUVo2?=
 =?utf-8?B?eTE4VWlXQkUzUEZaYVhSQWxDa3FkNFNkL3FzRWJHbmFDUmpoZDMyTDRkWmZH?=
 =?utf-8?B?VFBQcjlRblNaYTkveGVzSUV5QXpvR2lmN2JCSHA5QjExVVp3NkxSbG5keklz?=
 =?utf-8?B?M1l0N0YrcFVFZDBTd21XeFNoVXUzN3lyT2NFdFJJRllISHRqeWtmUWpVckhs?=
 =?utf-8?B?V0V5ZEl1ZzlpL0NEazZvelVOU1hlUWp4ejZ1ODZqZ09GbmV2VjhUMitPUjFT?=
 =?utf-8?B?dlg2c0ZWaGU4d2JWQ0svK3l5citkYW1Fem1kN2ZpTDkyTERiZFVQdE5xTWF2?=
 =?utf-8?B?Vm5MeWc5VWZBcmNLdU1OR3RJQklKWWI4R2ZOS243dm1wWWVjYkNtRk16SlNS?=
 =?utf-8?B?VnpnWnB2TzJ2TE8rTTZRK2E1S2JFRnVmY252OFJub1UwSzcvSktiU3BNWUdy?=
 =?utf-8?B?Ym5LRXFaUDFIWlkycFdvTmdCUXJqTjRxOUlENTVYZXIxS0tJWDlaUEFxQS8v?=
 =?utf-8?B?enRqckwxdFRqRHN2Mnd5dkszM0NKSm9LRmlNWVRyQXdFV1NMc2YxZHdabkZG?=
 =?utf-8?B?MStKaUFOajJ2ZkUwSG8ydmtPMmtnbUJJdXBwc3dHelpjR1E1b3ZWRVlmelFR?=
 =?utf-8?B?cGZTL2VJUEpTVlI2OG43U1JzTEtKTktjQ2lUTDkrLy9Dc0kzM1VNOFFBK0Qv?=
 =?utf-8?B?VVNxaEN3TDBnZjVFY2dHUFpzRHJIaHdXazVQK2ROZ2UyQVhoeEZIZXdLdnJZ?=
 =?utf-8?B?elR4ZnR3VHNrTXV2eTBiVEoyMkVucGVwWmhXNWpsTWIvTDkvMXMxSEg1QXZw?=
 =?utf-8?B?VlpQUGRmaXJuNC9vS2NVNjJzamgzMnM4Y2pDOHUrcDZ2S0tNUmE2UDBSb0Ns?=
 =?utf-8?B?T0k3WFhHeThCN054OFpONStxTHlQTEpuRVRvOHIxUm56eFh5Z041V1ZRUkpu?=
 =?utf-8?B?cERLbGVqaUxTUmhNWUV2Mkw3aGpSUGVpU2xhNFRWd1VXbjJ3TkFHWTVSaEMz?=
 =?utf-8?Q?lRgdaz6rc+ropDvChUTC2Oix9XMCKtHWknesMCx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ff5831-6583-4e9a-ccd7-08d92c19919e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 14:10:57.9892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WU+/BECNLY0Y7/73/kcw1v2sg0VXkrUXsO0O96ww2lODM8f2xiNdpO8usZU3DLvJTfIrZ02F4KM7kHRrTY365w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4298
X-OriginatorOrg: citrix.com

On Thu, Jun 10, 2021 at 10:01:16AM +0000, Oleksandr Andrushchenko wrote:
> Hello, Roger!
> 
> On 10.06.21 10:54, Roger Pau Monné wrote:
> > On Fri, Jun 04, 2021 at 06:37:27AM +0000, Oleksandr Andrushchenko wrote:
> >> Hi, all!
> >>
> >> While working on PCI SR-IOV support for ARM I started porting [1] on top
> >> of current PCI on ARM support [2]. The question I have for this series
> >> is if we really need emulating SR-IOV code in Xen?
> >>
> >> I have implemented a PoC for SR-IOV on ARM [3] (please see the top 2
> >> patches)
> >> and it "works for me": MSI support is still WIP, but I was able to see that
> >> VFs are properly seen in the guest and BARs are properly programmed in p2m.
> >>
> >> What I can't fully understand is if we can live with this approach or there
> >> are use-cases I can't see.
> >>
> >> Previously I've been told that this approach might not work on FreeBSD
> >> running
> >> as Domain-0, but is seems that "PCI Passthrough is not supported
> >> (Xen/FreeBSD)"
> >> anyways [4].
> > PCI passthorgh is not supported on FreeBSD dom0 because PCI
> > passthrough is not supported by Xen itself when using a PVH dom0, and
> > that's the only mode FreeBSD dom0 can use.
> 
> So, it is still not clear to me: how and if PCI passthrough is supported
> 
> on FreeBSD, what are the scenarios and requirements for that?
> 
> >
> > PHYSDEVOP_pci_device_add can be added to FreeBSD, so it could be made
> > to work. I however think this is not the proper way to implement
> > SR-IOV support.
> 
> I was not able to find any support for PHYSDEVOP_XXX in FreeBSD code,
> 
> could you please point me to where are these used?

Those are not used on FreeBSD, because x86 PVHv2 dom0 doesn't
implement them anymore. They are implemented on Linux for x86 PV dom0,
AFAIK Arm doesn't use them either.

> If they are not, so how Xen under FreeBSD knows about PCI devices?

Xen scans the PCI bus itself, see scan_pci_devices.

> I am trying to extrapolate my knowledge of how Linux does that
> 
> (during PCI enumeration in Domain-0 we use hypercalls)
> 
> >
> >> I also see ACRN hypervisor [5] implements SR-IOV inside it which makes
> >> me think I
> >> miss some important use-case on x86 though.
> >>
> >> I would like to ask for any advise with SR-IOV in hypervisor respect,
> >> any pointers
> >> to documentation or any other source which might be handy in deciding if
> >> we do
> >> need SR-IOV complexity in Xen.
> >>
> >> And it does bring complexity if you compare [1] and [3])...
> >>
> >> A bit of technical details on the approach implemented [3]:
> >> 1. We rely on PHYSDEVOP_pci_device_add
> >> 2. We rely on Domain-0 SR-IOV drivers to instantiate VFs
> >> 3. BARs are programmed in p2m implementing guest view on those (we have
> >> extended
> >> vPCI code for that and this path is used for both "normal" devices and
> >> VFs the same way)
> >> 4. No need to trap PCI_SRIOV_CTRL
> >> 5. No need to wait 100ms in Xen before attempting to access VF registers
> >> when
> >> enabling virtual functions on the PF - this is handled by Domain-0 itself.
> > I think the SR-IOV capability should be handled like any other PCI
> > capability, ie: like we currently handle MSI or MSI-X in vPCI.
> >
> > It's likely that using some kind of hypercall in order to deal with
> > SR-IOV could make this easier to implement in Xen, but that just adds
> > more code to all OSes that want to run as the hardware domain.
> 
> I didn't introduce any new, but PHYSDEVOP_pci_device_add was enough.

Well, that would be 'new' on x86 PVH or Arm, as they don't implement
any PHYSDEVOP at the moment.

Long term we might need an hypercall to report dynamic MCFG regions,
but I haven't got around to it yet (and haven't found any system that
reports extra MCFG regions from ACPI AML).

> The rest I did in Xen itself wrt SR-IOV.
> 
> >
> > OTOH if we properly trap accesses to the SR-IOV capability (like it
> > was proposed in [1] from your references) we won't have to modify OSes
> > that want to run as hardware domains in order to handle SR-IOV devices.
> 
> Out of curiosity, could you please name a few? I do understand that
> 
> we do want to support unmodified OSes and this is indeed important.
> 
> But, still what are the other OSes which do support Xen + PCI passthrough?

NetBSD PV dom0 does support PCI passthrough, but I'm not sure that's
relevant.

We shouldn't focus on current users to come up with an interface,
but rather think how we want that interface to be.

As I said on the previous email my opinion is that unless not
technically possible we should just trap accesses to the SR-IOV
capability like we do for MSI(-X) and handle it transparently from a
guest PoV.

> >
> > IMO going for the hypercall option seems easier now, but adds a burden
> > to all OSes that want to manage SR-IOV devices that will hurt us long
> > term.
> 
> Again, I was able to make it somewhat work with PHYSDEVOP_pci_device_add only.

Sure, that's how it works on x86 PV hardware domain, so it's certainly
possible. My comments to avoid that route is not because it's not
technically feasible, but because I don't like the approach.

So far we have avoided PVH from having to implement any PHYSDEVOP
hypercall, and that's a design decision, not a coincidence. I'm in
favor of using the existing hardware interfaces for guests instead of
introducing custom Xen ones when technically feasible.

Thanks, Roger.

