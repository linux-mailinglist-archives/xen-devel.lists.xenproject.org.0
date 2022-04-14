Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2205017A9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 18:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304918.519668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf1vU-0002cg-3j; Thu, 14 Apr 2022 16:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304918.519668; Thu, 14 Apr 2022 16:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf1vU-0002Zz-0D; Thu, 14 Apr 2022 16:02:32 +0000
Received: by outflank-mailman (input) for mailman id 304918;
 Thu, 14 Apr 2022 16:02:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xO=UY=citrix.com=prvs=09619e58f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nf1vS-0002Zt-OR
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 16:02:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47c75d84-bc0c-11ec-8fbe-03012f2f19d4;
 Thu, 14 Apr 2022 18:02:29 +0200 (CEST)
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
X-Inumbo-ID: 47c75d84-bc0c-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649952149;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dBVTodBtX3hAbW9HcPK0oBLYvslWKKQuZM5s9mLTQ2Q=;
  b=WwNeNLkb8DKwJfdl8YWIrG3vYtbPO2Cw6no/QZs690KWZ0chgjBMeINS
   pFjtAch8+87Wjvc48L6152j0q9j9eO0QpHi4Z2bUfHYviEtLBY6w3hkxx
   UqBfGuGZHl5ylG2OSykYZnDXJBJgXT4YeR9oUzX9pmhr2HDrUxXrSTo4Z
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68977507
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tpXFcqlFUO2JblfG5UOvEPro5gyWJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXj+HPf2IN2L0ft0jYNyz8htQuZ6Bm9Q1QFZkrSsxHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWl/V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYYgUyBJ/nxuEnDgBVER5VAJUF85LXGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6aPO
 JVEMWUHgBLoRTwWYF0lArcHjeK1uULvWj5Jo1eluv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJ7EfYA2irTz5CJ+gubOUM5dn1KRcwf4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud1IWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 ilsdy+2tr5mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8idRczap9aJWSyP
 Sc/XD+9ArcJbRNGioctPeqM5zkCl/C8RbwJqNiJBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WnO3eMoN9Pdw1SRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WZQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:9eL9Zq/MNP2iITZlV3Juk+E6db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y542mfvVmHZ6VO91xM/dfKla9Ny4kY1jiaGgOKsk8SgfwQtjMkfEI2N0=
X-IronPort-AV: E=Sophos;i="5.90,260,1643691600"; 
   d="scan'208";a="68977507"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJi5YU0HWid8ojPtaLqXmlSSBB56iFZF7USgyF50/qmCFjVDeF/pKZA4EvTclfIYHeJTdg5JaaFV7gADfmFN5vmd+LWLhSqgS1wtS05HrEu2vdGeNaetGNzC2nMdIDV+BET3GUoV5Fof+OFtETBLEpWBwZNL72cRMWOQBe3vwFNpvhqcVTOhlTaPZSN4LMR43lc/kcQGqk7WFQyeUHWzzOaGrsTCTC8I1s1k3JpdKqgdwzO8ONGYz9UALSda6xQB3yEr3RXwcOZnhYOc+269PNyzlhA//I7jUmfzlx5sPNE90f4FP5kqjNLZGAmVEjCjzZOhuwYMxicyfXERKUnanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWucSSDjkz4advjswNkqcdcVCIrU5eHt8e/jefXM3KE=;
 b=koE6/wLCQq3XXXjLIQpqYrF9hVSPDF+dn1frjceRtQGp4ZZQx+ht70r2OsHUSl21O5S4vs2DptMIb1dJcSckxJgTu9qDoQIh9j+BhkOFbx4WRtaVcPegTSzfAQ3yy9JpOa5pZLZA3NXwF2V8fyYqIZJpTiyFeHIGsGkT491tv5Cip44Rmpisvp6RdykhuZUfVBVtYV9ihj9Js2i31uNuPv4S+/gpvs9Qno1xijGm6rs/D2pyIAN9coN85JI0nHUCoXhEpwZATWheYbc+vb855Jka5xy/s2kvcVMBiT75u5OVcucAeq2SVxM2cGN3SjDyVGOjbDH7cZDTA00/0sfWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWucSSDjkz4advjswNkqcdcVCIrU5eHt8e/jefXM3KE=;
 b=NRj01e10yOD4tYPHORyZFmg3KNkHnYrrGi/X5WI06srwUNDWHQPlxqEevfw3TZq4rz6yfOQv/n/vneBmG9huJjl5Msw+6sSpVIQ4ysCJHAu/N/lWqpbZSSaT+tLz2WAzqEqYJy7gPhpSP+xgahxrKCYwk0Ee99Zkk0HwFlUlCbM=
Date: Thu, 14 Apr 2022 18:02:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86: improve .debug_line contents for assembly
 sources
Message-ID: <YlhFiWYQMbjsOOAc@Air-de-Roger>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <23509d85-8a73-4d81-7ade-435daf46fcd6@suse.com>
 <YlgWKGmR+u41zSsw@Air-de-Roger>
 <04f9bd9c-70da-0966-afa6-96f81e290204@suse.com>
 <YlgiLhvsKVYKKvrr@Air-de-Roger>
 <2eab851f-0fe3-8462-cdbf-b438dc01ade1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2eab851f-0fe3-8462-cdbf-b438dc01ade1@suse.com>
X-ClientProxiedBy: LO2P265CA0213.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4824107c-6a1b-4508-7868-08da1e302983
X-MS-TrafficTypeDiagnostic: BYAPR03MB4664:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB46648CC66013E3F12FA3C9368FEF9@BYAPR03MB4664.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XZ90Zb4LniYoayApSeL+2Mg9xnXSLvOAcpEq5O3igEigcj5EoYVMXKlD4CFpffsx5teonSEALHrWEUnSL+zm3xACLNroZEdPzkFOokiwLHrl4EovSUS/sJGViZ8CoFcPcNvUWJZAZV6CRc7Zf+ChcmovChUFst/j5MTB3gSm7+1iFUyujbRbmgFMo0n7vap0OGGqru8sbKc8ax9eIwvEO7XEVaIkJXd2NVHzeEnzQDEYVDvtueq9sPPWbgllEy4TKj/nLEjI2XTLkHRPdG7k4kYrcEikVeQEbRw10yQZ5WB3F6+wARgmbT/HD46FAGVqxmSiN+2VjAyyzYypsOnTgKPnHJUdos5OSO6Psp3+ZCfHozIAXzf5HxLKijps7ZemRyhD5gFkYw/u8+GY51+fTCOhlBeyaqtXhn0hSJy7B9OPOcH0Ze+ZLWWmQaECyq76gEw8VE7nriM67D8QLgPmf3rUzD1+1wShYEoleSa3SRvgyAPFc47CdYXANR2hkCRK9zBZBf5vP9FfRF1HTvAEXmserK6Ke2XexQspAhR45iePtJ/hk+Gm49OjwfWW+UyqFE/Tefkr3PBIIhGcIsOYMK1HtDpizwaLFJzTlcgjDEbmSxHsbMSAPCyQzhsdoOEeguU9kfP9VTxddTKr2dufThNwxiK/oh7wg0qbazWp2vWDwl0ARckNzmDvSzSCqdMrN4FM8d9u0NQHEbrrnKE2bNyy4FWITHgKZCgEIyiqSygEc4oCAe5kSqLlo8Oig7BlcGmkd301quQOHaoL8o1mowEFH2x6IVS+jUpSLB9gsYv35pVXpJdK4UlU2pA5M4B/p6lcYO4JuKUjgzWviBSC9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(966005)(6486002)(508600001)(6666004)(53546011)(6512007)(85182001)(6506007)(9686003)(83380400001)(26005)(186003)(2906002)(38100700002)(54906003)(6916009)(316002)(66946007)(8936002)(86362001)(5660300002)(33716001)(4326008)(8676002)(66556008)(66476007)(82960400001)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlhzTGovU3IzcThoWFovZ01XaW54Y1FVT0NsTm5FbENzQ2tGeCs2WFhibnhC?=
 =?utf-8?B?MHUvMEtBYXVnV1BtcnQvS2Y4aDNSZmxoUFQ5SXA5RHNyUnduaFBUN0VWRDJ2?=
 =?utf-8?B?bzNmaGU1Y05Ldk50bDVoMTU5ZjFHUzN2TzU1MGF0ODdRRm1EeFNLL3dmZ3ox?=
 =?utf-8?B?V0wrRDliUi9XQjl0b2tRKzZqblhXWUhjcG5mM3hXeFk1YjlyN3Ywd1dyWlkx?=
 =?utf-8?B?TjJSU1I2VGNvR09tYnlsWkQ2T1NJWThhQzFjOHB4WUJuL2xGZ2pnVjVXNDVa?=
 =?utf-8?B?QlB3K1lLM20veldCTVRiNmNDaWM1LzF5aUNxYitvdVlzMFdZYm1GUHREcTRC?=
 =?utf-8?B?UGxOWnVUU25TNjF6cU5zeUwzRlNNdHp0T3NBU2M0a1NaSGNkdkE2bmpJb1Fx?=
 =?utf-8?B?OEpaUWYwZXE0aW9xM3RPZHgvRXBFNVhGRmtsM2FtM3pDT09SVzhuYzNUaUMr?=
 =?utf-8?B?M2FkdTF2cjhVZUFrR3c2SWxxQUc2dlZac3BFcEZPRVNlLytJRTBXSXlINFJI?=
 =?utf-8?B?RnpOcDBqa2h2WGJ2SDk3S3p4N0MwT0tndmJLeXloZzlIT2RVT1lRdFRGL2lz?=
 =?utf-8?B?cEVzcTgwbVNhWXVDT00xdnFWVkxNbm5sN1dXalFCRWpZdEN5Y2szbExBOFRa?=
 =?utf-8?B?VVJDTG9Ca3NvclVWTlZYUnVrK015UEtqc2MrVmJHVm9pc1BFOGVsVXhmZHZU?=
 =?utf-8?B?dk9URDgxNEZneGRRMm9lWVVwUXFiRE5RYW8vMkRmcTg3M0xHTzc5YnFjT0ZN?=
 =?utf-8?B?K2ZLOThFZFdvandJQTU2SXJXSFFXY1NPbDF3bXY1S3BJWWZnc0dNaS85VUI5?=
 =?utf-8?B?MGhOUm10NHd3aUZJRFppTCtQMHRCMitnMU1TTzBhOEZFV09KdkNheXRabjd1?=
 =?utf-8?B?OWRDZURDbGI0YTJHbzdQUlJMNVFJa0QwbXhlZXF6WldDVUNOd3Vsand6ZDJu?=
 =?utf-8?B?dy9TaFVQQjBsajRnWm94bEM5bzJmcFZkMlpzSzlqNjNrWGMrZTZUODNuTGh1?=
 =?utf-8?B?WTRGTjlKU1dzS01TZzNCY2Fxek1ITjBjUi9ONDNnbXV1NWZOS0xpczZxb2Rs?=
 =?utf-8?B?WmxKUmhhL3JZekV1MGwybUNFMkRBSVlGS2FDb2hlNm9lQURHUERvVDR5YWVV?=
 =?utf-8?B?ZWs1dnNtSnljNVc3ZUpqbHVHMUgzQjNBMlZFQ3dEM2pBbGZpZTNkOHJVT3Ir?=
 =?utf-8?B?ejRBOFNGZExycnA2TjdySENnUVk1TWxUcUM4aXRCNkhDWUFicUJUMnVSU3hQ?=
 =?utf-8?B?TnNPY2RpY3dXKzY3bkhvb0pDWkcrdFpsZjhpRER3QWFmcDk2ZFhPelR6R1dR?=
 =?utf-8?B?ZWZ2eTZWQ3BqU1Nrc0o3UlBiVzh0TlFMQWdQdDVweFN6dHd2VHFnMGhGV0xU?=
 =?utf-8?B?Y3pETXhDVnNNbXdya2d2RkNtNFdGbFBWWVdkUlpiamNkbGJkTDVLWUpQQUto?=
 =?utf-8?B?UU1DUnRJY0xDdk5qQnNITU5SQkpDcnpSZFc3SWs0QXN3bEc4SkNYdWVncDJU?=
 =?utf-8?B?THJRWGQrS3gwVE1tR0RKR0lacmJqaGxId0EreUcwTVAyNUdhUlo4bjhZczYv?=
 =?utf-8?B?N3JJT0pvVUszMWVMcC9Ycm03L3dPd0dOSHFNK1F3Y1c4bEhSeGRabVFWNVRm?=
 =?utf-8?B?TmtKUkFEVFk4NWpSekZVUmU2VXczWTJUQ2JhczhCdmtqZVRvR0xjeENZaFpo?=
 =?utf-8?B?MjRWc1ZNRFFBL3VrT1ZiNS8relV4dUhGeDdlWTVBOGhsSVVpK2pLMTc3RmJK?=
 =?utf-8?B?MHNnYW9HTGlXdHJlamJBaENSVGRCVUpIQXB4RmczTUVOa005Q3pneXVuYnln?=
 =?utf-8?B?THl1TlZ6TCt2cmFaY0twbnZqSGJCU3hvQlJuUm1NQWR6ek5nUTZ6SkQrWDdo?=
 =?utf-8?B?d2hYRGMrTmVoenRoVzcwaVV3YmVBRGZqVGNzOHlsSlhWMVF4R1JOQUNVQ0lK?=
 =?utf-8?B?cCs0bmNCb3JvVE9qdlNrMnNkK0xPMzN0SnR3dExnMDNKc3NJR0VxeWZwQnB4?=
 =?utf-8?B?ZVZ1QmVWVE1MRncrVnVTdDRYZ3hXNEZvTnlnR1FCaVZoVFJiTGxpYnhYeFhM?=
 =?utf-8?B?ZWdhdFVsM0IwTzB0dFdlT25RUG56TjFmWXdsc2xJZXJXMDg1RURUamRKRHVO?=
 =?utf-8?B?a3RmbHQ2Q3lLR1RjWjlrTmRIZTk2MTZnbFdzVWtNZ05vTWg0UUVLQXpHOERm?=
 =?utf-8?B?cFI3RHY0MTFINGtwYXFIdHptbW5mbExJSlVXdFhnVWhiOGlrenFyUElsQUlw?=
 =?utf-8?B?RFVQMVQyZzFDdjFENUlsRUgyd3g3RG8yQjJjQnhzcFhjMDJoRjRsRFFRZWJZ?=
 =?utf-8?B?U2JlcEk3VUF1Q242V1I3d0hwbFdKUUpRUmZCU2ZYZUtMUnY2SGRDcmJ2Rldi?=
 =?utf-8?Q?3E8xYxfYRWiovw40=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4824107c-6a1b-4508-7868-08da1e302983
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 16:02:23.1654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnjjRHNKnLn74FWMAzaApNk18Qy05TXNHeHYgo9hcxZ4pc56DuuwepyEKlfAYQImtx4V86EoVZ44cto5IinD1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4664
X-OriginatorOrg: citrix.com

On Thu, Apr 14, 2022 at 04:15:22PM +0200, Jan Beulich wrote:
> On 14.04.2022 15:31, Roger Pau Monné wrote:
> > On Thu, Apr 14, 2022 at 02:52:47PM +0200, Jan Beulich wrote:
> >> On 14.04.2022 14:40, Roger Pau Monné wrote:
> >>> On Tue, Apr 12, 2022 at 12:27:34PM +0200, Jan Beulich wrote:
> >>>> While future gas versions will allow line number information to be
> >>>> generated for all instances of .irp and alike [1][2], the same isn't
> >>>> true (nor immediately intended) for .macro [3]. Hence macros, when they
> >>>> do more than just invoke another macro or issue an individual insn, want
> >>>> to have .line directives (in header files also .file ones) in place.
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> [1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=7992631e8c0b0e711fbaba991348ef6f6e583725
> >>>> [2] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=2ee1792bec225ea19c71095cee5a3a9ae6df7c59
> >>>> [3] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=6d1ace6861e999361b30d1bc27459ab8094e0d4a
> >>>> ---
> >>>> Using .file has the perhaps undesirable side effect of generating a fair
> >>>> amount of (all identical) STT_FILE entries in the symbol table. We also
> >>>> can't use the supposedly assembler-internal (and hence undocumented)
> >>>> .appfile anymore, as it was removed [4]. Note that .linefile (also
> >>>> internal/undocumented) as well as the "# <line> <file>" constructs the
> >>>> compiler emits, leading to .linefile insertion by the assembler, aren't
> >>>> of use anyway as these are processed and purged when processing .macro
> >>>> [3].
> >>>>
> >>>> [4] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=c39e89c3aaa3a6790f85e80f2da5022bc4bce38b
> >>>>
> >>>> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
> >>>> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
> >>>> @@ -24,6 +24,8 @@
> >>>>  #include <asm/msr-index.h>
> >>>>  #include <asm/spec_ctrl.h>
> >>>>  
> >>>> +#define FILE_AND_LINE .file __FILE__; .line __LINE__
> >>>
> >>> Seeing as this seems to get added to all macros below, I guess you did
> >>> consider (and discarded) introducing a preprocessor macro do to the
> >>> asm macro definitons:
> >>>
> >>> #define DECLARE_MACRO(n, ...) \
> >>> .macro n __VA_ARGS__ \
> >>>     .file __FILE__; .line __LINE__
> >>
> >> No, I didn't even consider that. I view such as too obfuscating - there's
> >> then e.g. no visual match with the .endm. Furthermore, as outlined in the
> >> description, I don't think this wants applying uniformly. There are
> >> macros which better don't have this added. Yet I also would prefer to not
> >> end up with a mix of .macro and DECLARE_MACRO().
> > 
> > I think it's a dummy question, but why would we want to add this to
> > some macros?
> > 
> > Isn't it better to always have the file and line reference where the
> > macro gets used?
> 
> Like said in the description, a macro simply invoking another macro,
> or a macro simply wrapping a single insn, is likely better to have
> its generated code associated with the original line number. Complex
> macros, otoh, are imo often better to have line numbers associated
> with actual macro contents. IOW to some degree I support the cited
> workaround in binutils (which has been there for many years).

Seems a bit ad-hoc policy, but it's you and Andrew that mostly deal
with this stuff, so if you are fine with it.

Acked-by: roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

