Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2240F501
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 11:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189173.338705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRANO-0006kE-4b; Fri, 17 Sep 2021 09:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189173.338705; Fri, 17 Sep 2021 09:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRANO-0006hM-0i; Fri, 17 Sep 2021 09:41:46 +0000
Received: by outflank-mailman (input) for mailman id 189173;
 Fri, 17 Sep 2021 09:41:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OQJ=OH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mRANM-0006hG-9Y
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 09:41:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec57acde-5335-427d-8304-76c45b1d8392;
 Fri, 17 Sep 2021 09:41:42 +0000 (UTC)
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
X-Inumbo-ID: ec57acde-5335-427d-8304-76c45b1d8392
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631871702;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=goznNx9biLP39gTT9ltJqgHGv2ns4jazfM+InMjg3iM=;
  b=MexDGKBJy+XDGvw/uvynEHLz8awdSnz1GBCdoYD+fZOsjeiJ4rr4NARt
   HvrCgRDwk5tsyFDeg5aYKcvSHfhyNS1HJM7JBdD7oWCYN3li3ALCy10kQ
   FxIDK3PEJB1F6B++AQzQS0BNzR23Qrx+d1vPEnueURuQ+1h0/jIFhaRuf
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gHxsnH2r3isRuinxo6JZV91/7czAZLK2BwTds1M6iRd+oUrzAZyE41iEw7kmS0VQs2BmB2H+xA
 IRUKNuHvF2cSl2tlE3GlFRtqizZlLhAqjRnVjF5sK1rOMlfbzaP/4xAPCE5Ur4/2napEjtVVlK
 MT4sQK/khulBbcbr3bKdiv2LQF+arnoms6cjCcJJJT6U4LMQoKqK8v4xbq3wzw6IZmiw65BAeO
 Rs76vL8cH82a6Cw31LZak9+mZwPpTRA5NahjFhxwmC0HUgboqH+RCytc50XC9pLBvdhF+k7vjI
 2cEIFPO6POK75iNOy++7V+1O
X-SBRS: 5.1
X-MesageID: 52958604
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vD8hkq7qtSsdgwCbgd67TgxRtGzBchMFZxGqfqrLsTDasY5as4F+v
 mFMWG6Gb66JZTT3fNp1a42zoRhQu5HSn4NjGwBuri4xHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo29Ew2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zm
 f9jpI6LTx8VP4qPoc4XYyRbTDxlIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTR6eDN
 5RBNVKDajz4MjsVEVUrGq5hv/uNv0HEYQJ1inia8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2m2orv/Cm2X8Qo16PLyn9NZ6jVuL3GsRBRYKE1yhrpGRiFO6Wt9ZA
 1wZ/Gwpt6da3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ug4RmNzKvS7C6QA2EWSTgHY9tgqcxebSQjy
 1uhj97vQzt1v9W9U3CG6rCSoBu7PCEHKmlEbihCUAhty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqYj1r6y/FPGhXego5nVVB8d9wzRUm+1qBlkDLNJfKTxtwKdt6wZat/EEB/R5
 xDohvRy8shfJ7+chheLWNkMO/KQzfy1DT6DnEVwSsxJGyuWx5KzQWxByGggfx40Y5lbJ2aBj
 Fz74lwKtcQKVJe+ReouOdvgVZ5ypUT1PYm9Dpjpgsxyjo+dneNt1BpnY1KZl0vpmVIl+U3UE
 cbGKZvwZZr25KIO8dZXewv/+eRwrszd7TmKLXwe8/hB+eHGDJJyYe1eWGZilshjsMu5TPz9q
 r6zzfdmLimztsWlOkE7FqZIdjg3wYUTX8iq+6S7iMbaelcO9J4d5w/5nup6Jt0Nc1V9vebU5
 HCtMnK0O3Km3iavFOl+UVg6MOmHdc8m9RoTZHVwVX71iylLSdv+t883KspoFYTLAcQ+lJaYu
 dFeIJ7eahmOIxyakwkggW7V99A7L0X32lvVZkJIolEXJvZdeuAAwfe9FiPH/ygSFCun88w4p
 ryrzATARpQfAQ9lCa7rhDiHlDtdZFARx7B/WVXmON5WdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK9nv4nvqrZWwx5KBnLOa1j3WLpsLmPfhZtEt7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZw2CA4+40LUP24D5M0ICGCUgCbQORjCF9LaduNN93y
 +kWp8NLuRe0jQAnM4jag3kMpXiMNHEJT44uqooeXN3wkgMux1xPPc7cByvx7M3dYtlAKBB3c
 Dqdha6EjLVA3EvSNXE0ECGVj+ZagJ0PvjFMzUMDeAvVyoaU2Kdv0U0D6ykzQyRU0g5DgrB6N
 WVcPkFoIbmDomVzj89ZUmHwQwxMCXV1IKAqJ4flQIEBc3SVaw==
IronPort-HdrOrdr: A9a23:WizkAqGBrJUdZQTmpLqFYZHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HmBEDyewKiyXcT2/huAV7CZnibhILMFuBfBOTZskbd8kHFh5dgPO
 JbAtVD4b7LfCtHZKTBkXGF+r8bqbHtms3Y5pa9vgVQpENRGsddBm9Ce3am+yZNNWx77PQCZf
 6hD4Z81kCdkSN9VLXLOpBJZZmNm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTjj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZvA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQfZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv3nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLYU5nghBgq/DWQZAV1Iv/fKXJy/PB9kgIm3EyR9nFogfD2xRw7hcsAo5ot3Z
 WODk0nrsAXcie6BZgNctvpevHHflAldyi8eF56EW6XYZ3vBEi93KIfwI9Fqd1CK6Z4gKfbpv
 z6IRplXCgJChnTNfE=
X-IronPort-AV: E=Sophos;i="5.85,300,1624334400"; 
   d="scan'208";a="52958604"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZycynE5HMNSuVG7PbYtlsAzlMtYJIsQAbG14TwMfl4dJW+4ozhoSnj5sKxFD1UzkAFaDo3b0Pw+/ySDtK+k3lruPArRf13/DaFwGfgCV9Gf9rOn3m4l5GYJkfuzii/k9/pJ+irWptdmNnQlX22AXI9SPkmqXLsfT3dQdPlrtiYQydBiXVHXx2OozfM9e+F+HRzcfCMBNh5GiMxp6OkfbyH0WUE0bxf8BTaLn2ETTf6E56w6TGDDDHlvSzInArf22qqRBhYhJ4onbffhKotacmUkE1WzqCV82gIBlP5YGTQt1FtN46Wrxe354mGIBXzmtNWXuQVWrogmnzMlOdoQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=coWda/k9IouttF7c2IlLgWtAZ4QLMG93DOX9yngDXj0=;
 b=YNn1Lfb1AVY/e73gR2IRW1k3XzZjV/ZZungGN03VzaNp8c74LCGHHI97yVG1dRI/ZMHgrvE1Bg9stoyPSrcyT1Y2+IVxJPdDxcwGKYBjzWDJsuzsX9jpgzbwwePhE5xPCXx+JiG7EnEttBbWb1zSRFBQgMnT6DyHaSqN3cL2tGfDOHqDXaremS5lMO8WGKeFP4AL8bWqapxUWgKTd4s8MIjHEQrH5n3Fl9rmd04ZzWHoz/ynKaWEuzkGqFG2ftwq6s94ABEaV+Xk3Bc52ZIwhgqdpKDB922NlsBDrkbC7ovovtDcrQCC1oUbEsrt3JfbQmVE2TQBlkhmMuvTVtiTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coWda/k9IouttF7c2IlLgWtAZ4QLMG93DOX9yngDXj0=;
 b=qhI4gHXWxCUhJllbLpJ1WvI0RaiPpfHWpmgCmMemEUxSurSyMHi73DvlprJ76WCi5J4PYzhOv2AokVnbI5sELJqNaSMubQCx10Rye5FUUyzEtO/KdllpCG9ARhuGywAGty2OSH4sh4U+TTZ8udXe7wlgefceZWF29q8rA3eSr9Y=
Subject: Re: [PATCH v1] domctl: hold domctl lock while domain is destroyed
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>, Dmitry Isaikin
	<isaikin-dmitry@yandex.ru>, <rjstone@amazon.co.uk>, <raphning@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
References: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
 <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
 <16d43ba8-d45f-021c-0e19-e233cb967938@citrix.com>
 <f1dda72c-695f-34d3-619e-ec2aa7696bce@suse.com>
 <01ec71a5-a1f1-b7db-d467-bc4c734db096@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0fa0d369-c67c-1cdd-0ff8-1542487ffb8a@citrix.com>
Date: Fri, 17 Sep 2021 10:41:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <01ec71a5-a1f1-b7db-d467-bc4c734db096@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0087.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 020039dc-925d-45f8-e1d0-08d979bf5865
X-MS-TrafficTypeDiagnostic: BY5PR03MB5045:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5045A7C4222FB7C24B95C805BADD9@BY5PR03MB5045.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zkb+VtVTMUyETf+eyuoIvLM8/UpzimhfwXQAzpU0VYMdyC3sTHlf2Buy6ivU2h6a5tJgnQwW4xDmt+XWPOGl0Z8RNOM+6/qonbSHOsdrFYjiVjDEsQPtWuPRvbEmzyWxl1ZSAeMmdd5B329XEYldUoIMmsUchYjHRlITOz+3m7Hi22BYm3QLJ2KLNpqlvlEAITxntCJzdIOvE8ezHiht1795MKQZGLtaDRIZ52dErxtIE9qsiEVlY8FY6iBY0yxTCaEECqwnGBCG6XlgrnADPC2OTEMtk04OcnRUmGyzfOnWZ2sq1aRWyb5zw4Bg698Szu/vYfzoIxsOkUkvcyWVTfMIfMkcn1eMZCuJmgFOVIrZ98oQm7JFkkXDVTAIdr6AikHNkLzCwTSBGwJ+fSNSRimnGm253u+ync0At89Sck28UKocgBPib70PNir+sCPWPJFLvVB7pk7LnxIx82HSZRmkiYvBxYvVIvaJmF8uMi2p/fFNt6ggamimmkNPrnQB6g/XlCGmC/y4Je3ZlosKCOH7hP6NpogC6t2ywxZBtjRXWp839KVPPSHU6+vy94kAXJO+Zj/oce4RoDp4b2JMiJLzx4T2bh/7u8oHwm/BFvAZXFF6Re4BsDKjU/kUNIJFgNii/2kunxQLO6XEXL9VNVQVzdNByzIrjkbA6VIXNUsot0V8/5/CdMEZZMhGzt+GYKRueRXubdGtI/R084WUr2IKFKqXmoYd3lzCVdxn3GYwCK0nidLcN2M0Mg4cgzKjwymhR64cGIyyy/gekiGlRvmObFztyFz0DccmYFvEnhGn8LhkFixpGkWpSVEs/UPkzzfY6ADorMNmWh1CNapaw2JL0iPik+5yGf3TbhW1Uk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55236004)(36756003)(86362001)(2616005)(2906002)(4326008)(6486002)(26005)(7416002)(83380400001)(38100700002)(8936002)(508600001)(8676002)(966005)(66556008)(31696002)(110136005)(45080400002)(186003)(956004)(316002)(54906003)(31686004)(16576012)(66476007)(53546011)(6666004)(66946007)(5660300002)(23180200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnBEbXlLK0tZZDhLWE1ncU14a0JNOERUejV1UjZGOWd1d3l1MW9kZmdlWjhs?=
 =?utf-8?B?OVpOUWs0YWFybS9PYURDU2xuUUR3Y3luSVBHdUpZQW0raElUTjI4MW9nZ0hJ?=
 =?utf-8?B?bE9MUW5wMEt3OVFDMG02bjFKVG4waXpMOGEzWXpRVkljNEVNNDN2WCtiRnEw?=
 =?utf-8?B?VmVmSjBwcHNvL2NjT21oV0EyZWovZEdydXp0aXJDNVlBUWJWUVR5WXdCT01Q?=
 =?utf-8?B?cmx4b3dLb2kyNUpna1ZDaS9oTnVWMy9pNlhTZEJ5a0VnZkRmcTBEWDROTTJ1?=
 =?utf-8?B?SEpleHBKS2orWE54RC9ySEEwSzNkNWN5TGprQUpaMmVycDFnckFXeGhRTjlB?=
 =?utf-8?B?cWcrMzNPZGJDbGJDbnpIS0JiTFNWMERwdGp1REdxN3Q4L0lUbUQ1ZTJrdUNp?=
 =?utf-8?B?NEtMZ2tNeTA4SGI2NnlveEdmODYyQlBkRFc3S3J1d0tjNGtnb3FKc2pRTlRF?=
 =?utf-8?B?cVFRK1o3eWExVGs0T05ROXYzS0N5bFN5NjhMaHl5cGZvdHVxN0pPYzJaUXE5?=
 =?utf-8?B?ampDY1Zjd0V0dTYzL2pIZUlIR25jQzJURlR1TC9ROG9MSGxOOFR1bm9YSHFl?=
 =?utf-8?B?c2tSTXFxeEdsdTgzK21JMTh3Mnd5aWs2S3RUNUxtNCtrcEZXbVJNdFg3T3NP?=
 =?utf-8?B?ZVYyS0RUVE5zdHpPM3dTbjdwT0xxemRQcXVhQWJ5M2ViSmhFQ1hROXRFeVFj?=
 =?utf-8?B?M29zMU9mQ21rbXk1eDdHMDBnYi92bDZDMUVLc2ZxZEViVk5sK3diSk1mcURX?=
 =?utf-8?B?K25iM0pzMDFJODFQUDBUWWhFSm1MamxnS2NTem9jS1ZUSDJ4bVRkMjFxY216?=
 =?utf-8?B?YTkvbmEycHRUc2JaVjJuV2VUZ1RuUWR3L3F5V29YbFZsdzg4ZWNTZ0dVb1pj?=
 =?utf-8?B?V1BBQjlsR0tLRUk1NkU3ZFJxdEtHd1JWSnlZSEtFSXBZQlpFN3JNRXp6M0hF?=
 =?utf-8?B?VDdVeWxPTTIzMTdNY1pmakl6YmlEQjI2aFl4RzZUNzB4L0c4VmNBenVDK0FE?=
 =?utf-8?B?YW5GMnB2UG90UGtTaDIxTWQySnRWenNhL0ZQVEU0Y29qcExTTXdpVW81M083?=
 =?utf-8?B?VTZyREpVM3RKK2lzMjRMZ3kwVjlSVno4UDFzZ29JWHZTS3JCK0hydFJSVEw3?=
 =?utf-8?B?YitBNHhJSXJZWFhuNUsvRThkdmdzNXA3Y2dlWFg5QVZ4RkpRNHNoaVQwbVBa?=
 =?utf-8?B?bEE2K3VQZmxqY211cVpMZjBNbExIdHh6STdOVDByR29TTzFRRW5xSU8yRlJa?=
 =?utf-8?B?eDl3bGxVVEVNNWJXUUc4V3VlMVBsbXhrNUZVOWdQZ2R1QXNyN0tINXdPNHVS?=
 =?utf-8?B?dVQ5Ti9pbm1kTXBTNGJQQkhTZ1c3aHAyM0Q5OGtkT1hwYktkWmkrdUs0TWM2?=
 =?utf-8?B?VER1K1FmWlRLMzdBTXIzUW54NjRhcWE4YWdhR3cxbTJkbDNwOWY3Rno0cmRq?=
 =?utf-8?B?Mnp6b0x2QTRhSVk2clU2YU8rc3JTUjlUUFB3VldHN1BiZ1NpZmtWSVg0M1p4?=
 =?utf-8?B?cHg3V2NlcStEREZyVW1FWE56Tlc4V3M3TmMwR2hzVmJvdE9HRFNHQ3BRMHZG?=
 =?utf-8?B?LzFUMmd0bTA1ZU5abEl6WWpCQWhVOHpMVDdKeDd4V0pZU2hTNnkxcnRXK0tL?=
 =?utf-8?B?ZmxjeStzSWpXa0I1U0dLUngwcnpYQXVTZ09VUWFIU1FNcGZ5TlE1bDExOS95?=
 =?utf-8?B?SytURk9ZTi9mUVZweDVRYUo2ZFFESS85anJiRkI0V0g0a1RPYm51alR1djhi?=
 =?utf-8?Q?INWZVtmYs0EToh5HI8sdZn9ifLxNe0ktKpHdNsG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 020039dc-925d-45f8-e1d0-08d979bf5865
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 09:41:38.1120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzBb2cPpCTP98bKSgqo5yAKJW4QCM0sXZllFf87gatzk8JLZaYBA2PH8cprbHg9KGt+tH6aAPInrZpqpreD/lIeOx+jCIlf+bMprdZkD5e4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5045
X-OriginatorOrg: citrix.com

On 17/09/2021 10:27, Julien Grall wrote:
> Hi,
> 
> (+ some AWS folks)
> 
> On 17/09/2021 11:17, Jan Beulich wrote:
>> On 16.09.2021 19:52, Andrew Cooper wrote:
>>> On 16/09/2021 13:30, Jan Beulich wrote:
>>>> On 16.09.2021 13:10, Dmitry Isaikin wrote:
>>>>> From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
>>>>>
>>>>> This significantly speeds up concurrent destruction of multiple
>>>>> domains on x86.
>>>> This effectively is a simplistic revert of 228ab9992ffb ("domctl:
>>>> improve locking during domain destruction"). There it was found to
>>>> actually improve things;
>>>
>>> Was it?  I recall that it was simply an expectation that performance
>>> would be better...
>>
>> My recollection is that it was, for one of our customers.
>>
>>> Amazon previously identified 228ab9992ffb as a massive perf hit, too.
>>
>> Interesting. I don't recall any mail to that effect.
> 
> Here we go:
> 
> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fxen-devel%2Fde46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia%40amazon.com%2F&amp;data=04%7C01%7CAndrew.Cooper3%40citrix.com%7C8cf65b3fb3324abe7cf108d979bd7171%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637674676843910175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=si7eYIxSqsJY77sWuwsad5MzJDMzGF%2F8L0JxGrWTmtI%3D&amp;reserved=0
> 
> 
> We have been using the revert for quite a while in production and didn't
> notice any regression.
> 
>>
>>> Clearly some of the reasoning behind 228ab9992ffb was flawed and/or
>>> incomplete, and it appears as if it wasn't necessarily a wise move in
>>> hindsight.
>>
>> Possible; I continue to think though that the present observation wants
>> properly understanding instead of more or less blindly undoing that
>> change.
> 
> To be honest, I think this is the other way around. You wrote and merged
> a patch with the following justification:
> 
> "
>     There is no need to hold the global domctl lock across domain_kill() -
>     the domain lock is fully sufficient here, and parallel cleanup after
>     multiple domains performs quite a bit better this way.
> "
> 
> Clearly, the original commit message is lacking details on the exact
> setups and numbers. But we now have two stakeholders with proof that
> your patch is harmful to the setup you claim perform better with your
> patch.
> 
> To me this is enough justification to revert the original patch. Anyone
> against the revert, should provide clear details of why the patch should
> not be reverted.

I second a revert.

I was concerned at the time that the claim was unsubstantiated, and now
there is plenty of evidence to counter the claim.

~Andrew

