Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5256433F0A6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 13:45:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98690.187331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMVYL-0002B8-6B; Wed, 17 Mar 2021 12:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98690.187331; Wed, 17 Mar 2021 12:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMVYL-0002Aj-37; Wed, 17 Mar 2021 12:45:33 +0000
Received: by outflank-mailman (input) for mailman id 98690;
 Wed, 17 Mar 2021 12:45:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=htWl=IP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lMVYJ-0002Ae-Iu
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 12:45:32 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcc5ac69-11bc-48c0-8079-81273cc8d118;
 Wed, 17 Mar 2021 12:45:30 +0000 (UTC)
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
X-Inumbo-ID: dcc5ac69-11bc-48c0-8079-81273cc8d118
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615985130;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=KlTX4UsfeiGhV//szxriwHkLDC+vLgA9f/95c/FNTa4=;
  b=cCqFSrsRIGbsl3mCD8cMJOrogoaMuZE02RIsHZaFrfDmKMD5eqNncxmz
   ouk+vpe/bWelp2BHJDBE8kWoAEz4Hk1WQaKgtsqwG3bvPBMcXStuj/1Y0
   dLx6zoIVkfBdRUnLyiOssACNm30FxF7OcgzDwq5nKPgm0Nc64vn1NlTK1
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7JxEDF+lBuj+Etc2WhtyqY1E4prMu3cNqq6lpBrytolYmV2RhLVbVTWzSND5VoMv4Vseuq6MOE
 h3lJSj0YIS/EUv+LjKthQOOPWzAbTm6MebOwOGysdxHNQkSwHlmT/V+bZUPaIGNpN+cQHjtWGG
 xWmfYFVLHD/1OzPseevoCG2X55PNdf6bI283m6PDzCES9KxPhxr6LwBoHlnle9Mlzf77U6w53i
 PCDswPmInmY02StmeVL/WKAVLMF5ngqW4WxG9wMIih90C41lTe0WebJKP9+EaaovBQTnLEVHDw
 qEM=
X-SBRS: 5.2
X-MesageID: 39660410
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YIbVtqtB1zNEmlp7ybUnmvry7skC5YYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjztRIACdD0FwWU1iDZ02CJ
 KT6qN81kWdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LV1JfRFR+E0hACFw5e2LtKyx
 m5ryXVxIWG98u6xBjVynPJ4/1t+efJ59NfCKW3+7AoAxr2jALAXvUGZ5Sju3QPrPir+BIWlr
 D30m0dFuBSz1+UQW2vuxvq3GDboUUTwlvv00WRj3emgeGRfkNCN+N7iYhUcgTU5iMb1bkWus
 87vBP6xu9qJCjNkyjn69/DWwsCrDvSnVMYnfMOlHsaaIMCadZq3Pwi1XlIG5QNFj+S0vFDLM
 BSCqjnlZJrWG+BY2uclmdix8HEZAVJIj62BmIGusCTzgFMmmF4w0Yy1KUk7wY93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MF7xGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOgNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rUiK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW8zXn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjqou4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjywU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVD
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW06pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/VvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF36wgCyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxW1hl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/fpB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl4EoNCW1Rkj0Dnvzp0hG+szT98347HPbIIFNpA5scOMqR6mD4R/COlL
 V15OhFyteYAyHUUJqhz6qSUhtobjX0ikSyR/szqZ9Vsbkp3YEDV6XzYH/t7jV/wB46LM3Ij0
 sQT6Rw3aDZNuZUDrgvUhMc2mBsqc+GI0QquDHnG+MSfVkiiHnAItOCioC434YHMwmkpAHqP0
 OY/DAY1/DZXzGb3bpyMdN7HU1mLGw94m9l5uWMasn5DxirbfhK+B6fPmWmeLFQDIiDFrN4lG
 c23/i428uWfTH/wgbeoH9SJb9P6X+uRYeKOz23cNQ4uuCSCBCrmaul4Mm6kTfxR3+aUi0j9P
 N4XH1VSN9ChDkkhJAwyQ6oRMXM0xsYr2c=
X-IronPort-AV: E=Sophos;i="5.81,256,1610427600"; 
   d="scan'208";a="39660410"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAdqeUYehD41EjXI1ZK91WSCLH7877AAD63Q1CpcWDfnGHFH5m+WiAHSutZCVh6ul+po0C55C6QITBC3g3PsprgZ/IHKDfDFJxNESxsL7+U1OxJeIj76sTQHvpqfL+FjCQVSHoVgYpsboiQ8Ktm7WXYwa9VCc7Xbb1euL40aFtBIgcjxTXWoRCL6ZkCOV9VMbV6u26pOqXqHG7jDF5koqP5pWeMjOHHNoWGUKhI1mA6Zi24TutyaHldm0fmmFcGDmiKgF1P56s8lZ+EIwFiBRaKF4SyNVZ958L3GQ6qq5cQyiooeVOqQGxS1ZCVUtMC41DMBgYSgV7goFEH0IlbPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlTX4UsfeiGhV//szxriwHkLDC+vLgA9f/95c/FNTa4=;
 b=L8Rb4L0y6R6lb+6Ty4ooaBUgdvhkpjF88Wuzaz4ZEi5UmoumLsaZeMgb+n4LajR0bCqMh5e5hOAoB3kUQsTV01uE3/eypFP35e2txHf5Z9z+z57AlNIUFTEd+NpAK/C78gFAHfkd0+VdAw2jsSX6FF2a+EftvFPUoUruJX1LXUQTbfJND7w9Dbr3NirCYQThuKgpNbyHy+I92Oq0WUvBWMQUw1xVZN0fYg3uRrH94mCrmGyE3SJwUepWo+iwrJjTqVIWfzJdnFFwK9I/sGo37tf7Z4zKWgHQkjZToTD3pFGE34LWIClDbBbu8j7+eJmOhGYU28rbqUh4Yw/AkU7q1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlTX4UsfeiGhV//szxriwHkLDC+vLgA9f/95c/FNTa4=;
 b=btt78hDHm47JLRAR0Bh73HU8J9U4UNYlyKPW/L95GKCcrnhsRnsBrbFPI91axwWeK9j6xHMXnMIeXcH2+eVfa3S2QQM9qsH+58RvzZgaoTbPPxFC+6UGYXC/ik/ytH8lcBIkVF+aIba8KAGFn4lFN8bP3TK1WZiUFFVrChvQRVI=
Subject: Re: [PATCH for-4.15 v3] SUPPORT.MD: Mark LiveUpdate of C/OCaml
 XenStored daemon as Tech Preview
To: <xen-devel@lists.xenproject.org>
References: <20210317120854.19903-1-julien@xen.org>
 <2db25b94-1f2f-c4be-0b5f-486c1cd83518@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ac34f4f0-730e-e665-c130-f5e153c9f4af@citrix.com>
Date: Wed, 17 Mar 2021 12:45:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <2db25b94-1f2f-c4be-0b5f-486c1cd83518@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::8) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f0e660c-416e-44a6-0dbd-08d8e942881c
X-MS-TrafficTypeDiagnostic: BN6PR03MB2417:
X-Microsoft-Antispam-PRVS: <BN6PR03MB241706707D7A2742B2F49A3FBA6A9@BN6PR03MB2417.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwNEM3lT/+4FlEg5TQ5N7Y7DCpJ6VDTmHC+Qyf6NCz3zxFGG/DX1UPup9DiDgyPAFG7IqKVox5634jIVG+ByQ+WDXmvrYVR4Kf8PK74hb6kBUY3pmOU7Z/7gh7HawOORpd7ePe1gq1YZk5SZVmrzef7wAXlVQFQWUykqWbreXfIlgF7aDxph/BdZI3j7f67joVyT7yIhDLVMJ3WHwpUiqQ+dxXReFOSCwyUI4vCprvhondPoZOpNxcoNUjxxuGDaHeGfrpQV7OI9EUZOF2d0I+forTZGLBPzMQ/6kHAQB/H0iE4ochaVm1R6fdPbyZFgp0cDVnesuzP6NAWOM6fmxIKE/AFYuuGTpSlDKV6VBB4VSSL5CTwYsW9AUaZKK3QHDfPSRzPmvo1Nl9RchNDsjzpOFCG6gDU0UEKoFW7sBHEbk41bEybc9rJ1SVHix33gumj3aoEpmAhA6zQUH6GgTQTHoD/qD7Mjm6ZUTNgrs5zAG1Gu/4pjrME+JkUC3QP9GN08RNw/r6n4MblNwjDecvU4QT3R/O7cxY/uig8NqtZG5dQ6TxuN5EClukcgqSNzA5ekD1p69NOiPXvD5d1Qm2d0Ok9mTeFpzb4Hx+Ug1PHAPUkMLhZ4noVj0PtgxF8cRo8h6jcWfVJ1z+LWbOUElg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(16526019)(6916009)(316002)(186003)(8936002)(478600001)(31686004)(16576012)(26005)(4744005)(8676002)(956004)(2906002)(36756003)(6666004)(31696002)(66574015)(83380400001)(2616005)(53546011)(5660300002)(66946007)(6486002)(66556008)(86362001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cy9QNHRqQjZRcXhoeC8wVUZoakh0MnQ5dm40RnV4MGZ5b0dzNHprMVdSU2ll?=
 =?utf-8?B?ZFhQWVFlL2U3emw2elhHWmYvcEVOM2VkMU1EUFcrRFJ0dW9Nd3NXYnFRd1lp?=
 =?utf-8?B?bElFSEFxaGZYN2dnM1FzZXhqZmlLQlA2b1Jna051TE9RN2Z6bHhaK003Q2Vs?=
 =?utf-8?B?SVhCaFdVUUJuZ3cyNUhvL28xc0RRbUhzQnVUYTBPVFp4VzlPck56NmZLNVZH?=
 =?utf-8?B?aXcvVUNUS01nWTVRWUpqM09xc2VXd1JtRldaRnR2TU1aRHJRblowV0grMlBG?=
 =?utf-8?B?WUF4QnJTaE85a2RNZndLOEhZVGp2Mmk3SEVMZkFsd1B3WTNDRzg0M3Z3NFZT?=
 =?utf-8?B?NUl1c3pMY2p6ZTBwTmRlc2hsU3E3TC9aTTFzME44QjZtdWRZaUJ2cmw4VzQ5?=
 =?utf-8?B?OUVXR0plVVlYUG5UbEp6a2JncHg4alFyMDllQXBvQW9oSkpUOGdXczVqbmlX?=
 =?utf-8?B?QVR4OHFPaDRSMURTVjVBWmc3VWhNMGxvV2pwV1NkWUxPczBnU25MTFBwYkMz?=
 =?utf-8?B?aFVBY0Erck5JWXVIa0hyQVU0aGZzTjBiNXIwa3J3R2lGWHZreVV4TklVMGt5?=
 =?utf-8?B?azN6eWdVclNEcHBDRHdFRFVBdjNoUEhuMFpWVnM0ODdnZGlaMU9nTEFQcnZw?=
 =?utf-8?B?bWM1dDhlZnpsNW5LK1MwUUhNZ3FGZ2dBWGc2eWhTTjk3a2lDVWpOOFQ4L0Mw?=
 =?utf-8?B?NkoxSzlYSnhndHdmQUU5bXNmYlRuRHVzZ0lwQlJrWXFoWVJOREYrQ21DZFdv?=
 =?utf-8?B?U21LWmhkNVFUYWZ5R1BWNHdncXVhMGhFSjZ0NVdYQmxXaUgwSTc4VW9pZkRF?=
 =?utf-8?B?MHlIcktlN3RmdDA1a1VRRUFpRUhEYlJoV3I2eE1jSDNyZEJsd2JzM0FJbVZi?=
 =?utf-8?B?SHdiLzY1Z0dtU0ZsUmxmbGZZbzNNcitPNkZqVVREV3AxLzFwTzJpK0ZCKzJ2?=
 =?utf-8?B?V0l2bDNZTk5oS3BVVTNablFYMVFhdk01OUVNa1Ntd1VuVE5Cb2V3OExVUWVR?=
 =?utf-8?B?Q1F2dmZSV0Q4cEZPNlppTWZGZC9JVG15YTMzcCtSZnp5UjhxK00yWWQxT3NF?=
 =?utf-8?B?Mk9oTVc1VlZKMjNlREswYURkdmhkendIN29ERmFjWUUrKzBkSFdVdkhGV2k0?=
 =?utf-8?B?ZkQ4QnIvV2o2QmRsUkVFTE04WkJTQlV2Mkh1dWdjbEZ5WlhtZVpJeThZQlhr?=
 =?utf-8?B?aVpTOGI3OFFMMzkrVTV1U1ViWjhjeGVTanZOK0ZQeThjKytCMnNkU0I4bmdG?=
 =?utf-8?B?dzhkeDVjTlB5MDFIdXE4L09xSklMTTMyYXprTUh3QjRvb0VsY3pOY0RGNmdG?=
 =?utf-8?B?cTc2UVVoWlRReDloc2s4eW4zck9nZitsb21PZ3RELzJqdWY4WjN2NmxjVGVm?=
 =?utf-8?B?blNoeVpGR3M1Y3U4SHQ2dTFsb0dIamt6VnpNOURtakRwK2dNZHhOeUF6dVpt?=
 =?utf-8?B?emxiTUNEakcvZnRsVjJ6UjU5N1lUOVk5NjNRY09oU2Jvb1YzVkJqbG8vQlVo?=
 =?utf-8?B?Rk51Y21UWXprU2NzUy9aOVJPZWF1eHFGZmhXeU82YWRMOTlpUVZ4eEluSnl4?=
 =?utf-8?B?WDV0bUwwYThyY3JIT05IczlBYVZ5MlBXYkRCODh2MS84UmRheDQvamEzRXZV?=
 =?utf-8?B?WitwVmZtUjlIQ3Q5bllQbWUrUS9xaDBLOEdKSURiVnU5T25jeHp6T014N045?=
 =?utf-8?B?MWl2NjAyTDVxS3FQZ3FaandLYkRYMS9tc0hHNzdzYkJSc1V0UEZwYllTQ2pH?=
 =?utf-8?Q?rmBmxpHrDhFfNajCWqMRZkegqucFjddXGVPlsd0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0e660c-416e-44a6-0dbd-08d8e942881c
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 12:45:23.6366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wc/GJRjr+egxiVSXEd8oh+liwqvLJ1uwUpH/s1OmOoK/FiusWDM+kTKjHkn3BHwedTp6IGG/q2rq31OYeCPU/dU+pB44kVtePFiLR3q899g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2417
X-OriginatorOrg: citrix.com

On 17/03/2021 12:31, Jürgen Groß wrote:
> On 17.03.21 13:08, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Support to liveupdate C/OCaml XenStored daemon was added during the
>> 4.15 development cycle. Add two new sections in SUPPORT.MD to explain
>> what is the support state.
>>
>> For now, it is a tech preview.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll add "how to live update" to my pile of docs needing to happen for 4.15.

