Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5BE443EB1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 09:53:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220597.381920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miC0n-0001Dc-JZ; Wed, 03 Nov 2021 08:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220597.381920; Wed, 03 Nov 2021 08:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miC0n-0001Be-ET; Wed, 03 Nov 2021 08:52:49 +0000
Received: by outflank-mailman (input) for mailman id 220597;
 Wed, 03 Nov 2021 08:52:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+yV=PW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1miC0m-0001BW-0M
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 08:52:48 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a2f6440-3c83-11ec-8563-12813bfff9fa;
 Wed, 03 Nov 2021 08:52:46 +0000 (UTC)
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
X-Inumbo-ID: 6a2f6440-3c83-11ec-8563-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635929566;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=A+O+h6niJZharIRZkfLZXyHdY4xTolFIATuVo8NtoS4=;
  b=QUIFpaNh4eJvc9rUQgJw72B1gZtwxznYLShpk6H9oeF+VPT0hYZilToc
   8z8t9vFqmgMU3+wEwwM35rlEV4VFqv26nndLg2GJCSKx20DyIRMVLMaI2
   7ccfV4HstkIlinQR9pHtJrdwy3DRQmNNHndJ9gFfktkqCy8LmgL4EMnIp
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mvcing9vIb79ISdWVczcQYaKR260m4EHJa+fFhpi75b7IQgc2n637uCW6blQZBoZv0Ocu3C82s
 aOzSqYDgf6fk2IvutkjUbSXwYZlPLmVGFMoDusLGovHqi4eLGkKH+PCNr8pGx9NtkUaCOUeT75
 2lDaa2YCsjzesz/yxaNl3/uQbqOFzoGbhrKRAJ/dTRv0v0w4fZX6mgl+xnaK+2aaUjc0PRmgrw
 tAqNJ8kk7fUIV1zzu2pHrqEpaQUoKwrOw872VQrSpWvN/kyNcTmhM2Rqqlb6Vygr0bpvm5VYUl
 Vey5YfbNq35cOnfLJB+PtPdV
X-SBRS: 5.1
X-MesageID: 56497340
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:87YEsKtT0/LGZxpzAlVP19Wd4+fnVEhYMUV32f8akzHdYApBsoF/q
 tZmKTvXOvnbMGT2e952YIrl9xtU78fczYJkHldrqis9HyND+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YPhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplkri+a1kiYI7woPlNUTpFMnBUBKQY5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY254STKmFO
 5JxhTxHNleZQEZGC2YsWYMSpvq1pCHAcWFTtwfAzUYwyzeKl1EguFT3C/LrfdiNSdRQj1yvj
 GvM9GTkATkXLNWajzGC9xqEoevCnjjyXo4II4Gp7f5hgFCVxWs7BQUfUB2wpvzRomekR99aH
 GkF9SMvoLYa+VSiS5/2WBjQiGSNvgMYHcFRFeI6wAiXz+zf5APxLmIJVCJbYdoq8so/XyU31
 0ShlsnsQzdotdW9S3iQ67OVpjOaIjUOICkJYipsZSwB7tr4qYc/lCXmSNp5DbW1hd34HzL36
 z2SpS14jLIW5eYb2qP+8V3ZjjaEopnSUhVz9gjRRnii7A5yeMiifYPAwUPA8f9KIYKdT1+Al
 HsJgc6T6KYJF57lvC6QROQAGpm56vDDNyfT6WODBLF4qW7roST6O9kNvncufy+FL/roZxfOR
 EHx5wgPx6NrISuoTrJWMqiIApo1mP2I+cveatjYad9HY55UfQCB/T1zaUP4410BgHTAgolkZ
 87FLJ/E4WIyTP0+kWHoH7t1PaoDn3hmnQvuqYbHIwNLOFZ0TFqcUv87PVSHdYjVB4vU8VyOo
 76z2yZnoiizsdESgAGLrub/znhQdBDX4KwaTeQNKIZvxSI8SQkc5wf5m+9JRmCct/09eh301
 n+8QFRE71H0mGfKLw6HAlg6NuiyDckv8yphYXxzVbpN55TFSdzxhEv4X8BvFYTLCcQ5laIkJ
 xX7U5zYahiwdtg302tENsSsxGCTXB+qmRiPL0KYjMsXJPZdq/jy0oa8JGPHrXBWZgLu7JdWi
 +Dwh2vzHMtYLyw/XZm+VR5a5w7o1ZTrsLkpBBWgzxg6UBiEzbWG3ASq0qRse5FQck6ertZYv
 i7PaSolSSD2i9Zd2PHChLyerpfvFO17H0FAGHLc46rwPi7flldPC6cZOApRVTyCBm7y5ou4Y
 uBZk6P1PPEdxQ4YuItgCbd7i6k54oK39bNdyw1lGlTNbkiqVew8ciXXg5EXu/0f3KJdtCu3R
 lmLpotQN4KWNZ63C1UWPgckMLiOjKlGhjnI4P0pC0zm/ysrrqGfWEBfMkDU2ixQJbd4Kq0/x
 uIltJJE4gCzkENyYN2HkjpV5yKHKXlZC/crsZQTAYnKjAs3yw4dPcyAW3GuuJzWModCKEgnJ
 DOQlZHuvbUEyxqQaWc3GFjMwfFZ2cYEtidVwQJQPF+OgNfE2KM6hUUD7TQtQw1J5RxbyOYva
 HNzPkh4KKjSrTdlgM9PAzKlFw1bXUDL/0Xwzx0ClXHDTlnuXWvIdTVvNeGI9UEf0mRdYjkEo
 +3IlDe7CW7nLJPrwy8/eU95sPiyH9V++zrLlN2jA8nYTYIxZiDog/P2aGcFw/c97RjdWKETS
 TFWwdtN
IronPort-HdrOrdr: A9a23:u4lv86m9B0kGRyybm8UImvzkcf7pDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,205,1631592000"; 
   d="scan'208";a="56497340"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2L32d1u2bFB7Nn2wjUyih5UqOfhN+ccuJyqZrqNvC+B23RKrgnKhd9EYRswsAifXIt8Xc/24wIF6htHKMQzxtP8oJeO2UfBycXoQ2UQwTaDX2ps+C0Op9qVjG1RUalRipupfBx1bt0K/QMuS7Cwprv/ITIzBnaVXME9nGgxVjVOC75Zcw+8jlAiBL8GK0fQKv6LVjvJP0jMf8owV42TpnxQfHlZhwkPgJ/qoaNoO62AgS8U4eKnJMzIeBnQw0QWX4PmBHxOOwBvlhMUxVusDuzsyKXack3Fgnjknj5d1uMKM9CeUZywEmyTUyNYgQYC4RyErScDAhKfBH79Va5d2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8x6O0c1k5jidd0A8KSdXOJIhCxTFdvEp4ZSD+3KyEwo=;
 b=TTGNef4Jn71HaT0dxwaROluXRZZ1Xcq2CaoBotBDzjyVpMqQSaDLkvaNPm33sLzuOiU4OU//a8ywm2YKGDxn9172feo7cAtmBHmoe2WRL9JMBJ0yflCGSDp/lxh0/H5QdVtymyfURvLTA2BisTd2ilSXkzCNG+gTK/8cEqssmxCinBxJox7Q0Wxz76eJPJupsDJClPeW7sd6wXs8WLN0WLEUMTtQCJCyWSKJG/4u/l8EdVJyCTLy9WNMfDtl+1kMeQlckiaMcHSxapX9RaNelY3p1As3wzCybEb2ZWO4bCakKDFyasT7oKjOYKfuG7l9XYIO7qxnsMAj7XMGis+TsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8x6O0c1k5jidd0A8KSdXOJIhCxTFdvEp4ZSD+3KyEwo=;
 b=UesFOT+39Tb2i0oja9+KRyY0/qyU70xMn43oZ5MxjeeSN0o63vRYzNzBwmGnpr3wW8AO7pVp62Tv7//cu7zlRrTtOBH7GtPmBbraXuYWBgyYAW0KjVsF4crrv5FjaY6Wg4MnIbgbuWmYaE11jHcT4Bpp3I/gbZbls1wzzERxsOA=
Date: Wed, 3 Nov 2021 09:52:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Message-ID: <YYJN028YTy92TLca@Air-de-Roger>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-11-andr2000@gmail.com>
 <YXfng3PqDI6C4yxn@MacBook-Air-de-Roger.local>
 <52b1533d-4aeb-29be-2611-9b50adea3f73@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52b1533d-4aeb-29be-2611-9b50adea3f73@epam.com>
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3d4c09c-72bc-4a1b-2e92-08d99ea74b83
X-MS-TrafficTypeDiagnostic: DM6PR03MB3833:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3833BF70CF6E113F3C1D65648F8C9@DM6PR03MB3833.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EXzFRi0FEDVtxcZHT6vDsnuVcBC/DcfI1r0Ez6btFO4Q9YXTaLWQPqx7KRwDl7VIeySiVQv9OFhT4n/y7pxOoph/dHWM8tRCKIbB/DvRVFIs+PfuaHeKvCYBDC6uv2jFhXDhy5JQ/S8TRFD+/kUFOq6GRBB/XAhQpXQGSA2BkDqdWcJfF05n7Rn4FxrEvGH+UaoJ3v2U6DTqNTAcEu06iYeJmJwsoRg6SWgJrkEGI/K/Q9jDhF11FXNmLJ6cZMQD4dbdN+YOCYCPM2mo3lZ0Jc1avTQgPsXHOmuOZx/B94SZuxx8xCLMBvgWHwR7cYMkNbM4wp+iFtpl0dAFqvcJnziOF3S7fXWIDgLMR8ix0XFhzSDgW0b6o39BEhhtUmA/RvIzGtFdmpF11RVRKwwcJWaCgy9BIEO5ytcZohAuKJyGZ7Pb7K66rWp3aj5N2IH/7Xs5mnJ/dd7lMy/UaUpZDbuJd7pK4fks/EhKCW2iq+4Y3XF5B3z/2uz20Xz4bRsoODP0qwGgFLjnY3H4ihYk+avx9P+dUgzPg0PKh0bLbAWmHYbikk6fNZ4c3VpHj1rESE+f66pTOgL78LWvDke3u7zEo8F69yU/7/y613unaX0/boacQ9Q23vPnSyh44lrfR8eGs/OPeIC8wCUEOL+4iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6496006)(85182001)(6486002)(6666004)(83380400001)(82960400001)(53546011)(8676002)(956004)(66946007)(66476007)(8936002)(5660300002)(316002)(7416002)(54906003)(6916009)(26005)(4326008)(2906002)(38100700002)(508600001)(33716001)(186003)(9686003)(66556008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZud0Y3VWFxZStIdTNlTTFtdStDTWdVYWoyaTYreW5NWEV2NWFmSXgyMm1t?=
 =?utf-8?B?TVM4YVRiMjRwdGs5THJlc2pXRlhUc1Q3N0F4Z1dYZnFsbGxlaTBJQjcvaTIx?=
 =?utf-8?B?c0F3VHdCYy9TaU1QRVFRc2w2KzJXSDVHL2JzWG1IRHBONm4xVy9DZXM2M0dG?=
 =?utf-8?B?TmF5Q0d1V2pVakl1S3QvS2FsNmN1RW16OXd4WTdFTURjYjkySlVkS0ZDd3k0?=
 =?utf-8?B?MjFKcHNmSGJ3VkgvanpjWlFFZkc1eDJ5VHVTMXRBVEZFdjRicFdzY3NTTVYx?=
 =?utf-8?B?d2lMd3JLRDBDTXZZajBNcXpQWEk4eTBwNGFWSkUxM003U2hEVDBFL3U2dGUv?=
 =?utf-8?B?WWVob0tQRFNudlhUU1N4NVZ2YkkzTnFSSUhMbVVBczlSRVQ2eFdoVm1YUWFR?=
 =?utf-8?B?SklQVXgyR0tZY1UwYXFTWWk1dnJ3Mk1ITU9RSlVtTjZ6NkIvQ1dDSEM2U3Fi?=
 =?utf-8?B?VFVVRVVMcHRWYUVnNDhvd0trQ2YrTGdWYjZsRGZDb0pFamYvOU9hc0xOYm13?=
 =?utf-8?B?eDZ0b2tLa09EZUdPR1ZuM1dKRUJiaEtseGlvalk4TkxHKzkwaStIOGwzVnFM?=
 =?utf-8?B?SzZsMTVSWXByN05qYnNqTmNwZFp6a3pKWTBVaWVlbFlabXF0ZDdyTnczdCtR?=
 =?utf-8?B?emtvekNreTBmUUg4aU9la2pwYnVSWFJib2p6T2o3NldaNE1yOWRnS2hESXpT?=
 =?utf-8?B?SVROM2tORzN6ZW82YjFYcVV0OUY1YW4vK0MrUEtxbkRWSDFHb0VFSmZOdGJl?=
 =?utf-8?B?ZVBlQktCb1ZXQmdJblVhN3NDUStxeVYzd1BGVHZKV2E2dklDcVdwWnUwbUhz?=
 =?utf-8?B?NjFDYkk1KzRmdGJXQXJ0YmJzVEVTME9QdXhuUGx2SlhvMnducHFFMWREU1Ry?=
 =?utf-8?B?YmYvWHJad0NsOUxTVDBvOVYvSzRlVUVrZWZ0UGhPMFV0a1lyT1ZBRzQzemd6?=
 =?utf-8?B?T09MeFpGU01WOGhCRjBDT0dVb0hYVTlPTld5L2ZNRHRtSm1vZm1YY29ZczRF?=
 =?utf-8?B?UWllY3pDS3pZU0hXNnp1OGtYbTZaUm8zMXpuSDh5NWtBOXZXTlFNVGNlNStG?=
 =?utf-8?B?VytvdlhHdHc2d0F3cXRsU1l2VlJxclJuVFNjZG1HYUYrSmtTRmhSeHdCZVhE?=
 =?utf-8?B?UE9kY1d5UTJybFlJd2wrMndSWUU5YnR3MmEreEF6Rit0Vld3WTFBRWNzTjR6?=
 =?utf-8?B?SHhHSk9MenRoZ20xUVIvRXV6ZHRCakJZVnJKQ2daUEVJTDhXVWVlVUhyY3Rj?=
 =?utf-8?B?VEZsZjNKYzFYQSsrakFtZlBxalpGWk1MalJRa0kvdDl0alB5YUM3VEVBTkhF?=
 =?utf-8?B?eE1DWEJvSnpuaG12aTBmaTJuRXZBRXgzamo0TUpyaEttMm56dm14ajRtaG83?=
 =?utf-8?B?Nm5kODBxbk9ZMjVtaFV0TExBekhTemduZlF6anVHUEdXaWhPNFI4eTFCb1VB?=
 =?utf-8?B?UnNwMnhjNEhXQXlpeW40MWd3RjBBUXU2OFRqeEdzcWl3UklES0dIVUduVm03?=
 =?utf-8?B?RGRqSmJMb0ZYandMRzZncE9RMEtyalNrQmhmOGR2c08zL3F0c1hXaEpwUmlE?=
 =?utf-8?B?bzNqSy9BSGhMRW9qdXplL1VQUzY4TGdqODR1TzJqdHV0RGZ0cWlidGozVHFx?=
 =?utf-8?B?YXU2UStmSFFhdERwdEFsQ0RpMmhDOWdTUkhLbUgrTzZkc2FWUS9xNHZsY2RL?=
 =?utf-8?B?NkkybzgvRmZ3ZUZNMUdGZ0NNalZBeXFxd0NwWGlnSlpCcFZuK0hhdXc5cmRn?=
 =?utf-8?B?ZkRLUlUxaGJ4RkluNXdhUHRTN3dPbUFoRE56MWRZRis1OWl2KzhIU2haTVkx?=
 =?utf-8?B?bjlpT3RVTEVabHltM0Vncm9TY3VHcGxJais5Skl4RElvZ3BDdUdhcTA0Y0ty?=
 =?utf-8?B?QzhuamhnamlwbS95RGhaT1N3ejY5QlJDdmZoeWFCczZ3N0pCMHAwKy8wRUJN?=
 =?utf-8?B?MEdyZDA3MU9QYlVyVWo1My9xbmZSdERxTldEMkZaM2N2N0tGeTUxUnBvQUhK?=
 =?utf-8?B?UmxYYkgwVHFIUFQ3VnZZWkd6Z0hZNlRkVzFWZ3ZHTHhzTU1rTjdQL2o4M3NH?=
 =?utf-8?B?Q2FaSHQ5V0VtQ3NFOHQ0WlZLU3Q5SXJNRnNVbmlJK1JMVFJkQk5qTlROWGdM?=
 =?utf-8?B?YjQrNjNqOWU5TWhKTjZLZ2xaSmx1Yzk5N3ZIdzg4TkZnb1h6dmR5RmlmUjdL?=
 =?utf-8?Q?feABroqjzY1nLgU/2IBtTfc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d4c09c-72bc-4a1b-2e92-08d99ea74b83
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 08:52:41.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NavfDFchBFlXgmP1aabIWJnuRfrrXTX5ENHvn33VCJSDiyJzbOJUxcnjQfLBwHRQsKl21bsPmJ31N5dGnlW4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3833
X-OriginatorOrg: citrix.com

On Wed, Nov 03, 2021 at 06:34:16AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger
> 
> On 26.10.21 14:33, Roger Pau Monné wrote:
> > On Thu, Sep 30, 2021 at 10:52:22AM +0300, Oleksandr Andrushchenko wrote:
> >> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> >> index 43b8a0817076..33033a3a8f8d 100644
> >> --- a/xen/include/xen/pci.h
> >> +++ b/xen/include/xen/pci.h
> >> @@ -137,6 +137,24 @@ struct pci_dev {
> >>       struct vpci *vpci;
> >>   };
> >>   
> >> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> >> +struct vpci_dev {
> >> +    struct list_head list;
> >> +    /* Physical PCI device this virtual device is connected to. */
> >> +    const struct pci_dev *pdev;
> >> +    /* Virtual SBDF of the device. */
> >> +    union {
> >> +        struct {
> >> +            uint8_t devfn;
> >> +            uint8_t bus;
> >> +            uint16_t seg;
> >> +        };
> >> +        pci_sbdf_t sbdf;
> >> +    };
> >> +    struct domain *domain;
> >> +};
> >> +#endif
> > I wonder whether this is strictly needed. Won't it be enough to store
> > the virtual (ie: guest) sbdf inside the existing vpci struct?
> >
> > It would avoid the overhead of the translation you do from pdev ->
> > vdev, and there doesn't seem to be anything relevant stored in
> > vpci_dev apart from the virtual sbdf.
> TL;DR It seems it might be needed from performance POV. If not implemented
> for every MMIO trap we use a global PCI lock, e.g. pcidevs_{lock|unlock}.
> Note: pcidevs' lock is a recursive lock
> 
> There are 2 sources of access to virtual devices:
> 1. During initialization when we add, assign or de-assign a PCI device
> 2. At run-time when we trap configuration space access and need to
> translate virtual SBDF into physical SBDF
> 3. At least de-assign can run concurrently with MMIO handlers
> 
> Now let's see which locks are in use while doing that.
> 
> 1. No struct vpci_dev is used.
> 1.1. We remove the structure and just add pdev->vpci->guest_sbdf as you suggest
> 1.2. To protect virtual devices we use pcidevs_{lock|unlock}
> 1.3. Locking happens on system level
> 
> 2. struct vpci_dev is used
> 2.1. We have a per-domain lock vdev_lock
> 2.2. Locking happens on per domain level
> 
> To compare the two:
> 
> 1. Without vpci_dev
> pros: much simpler code
> pros/cons: global lock is used during MMIO handling, but it is a recursive lock
> 
> 2. With vpc_dev
> pros: per-domain locking
> cons: more code
> 
> I have implemented the two methods and we need to decide
> which route we go.

We could always see about converting the pcidevs lock into a rw one if
it turns out there's too much contention. PCI config space accesses
shouldn't be that common or performance critical, so having some
contention might not be noticeable.

TBH I would start with the simpler solution (add guest_sbdf and use
pci lock) and move to something more complex once issues are
identified.

Regards, Roger.

