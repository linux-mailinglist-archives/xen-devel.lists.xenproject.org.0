Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF6341E13
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 14:24:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99252.188610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNF6p-0007hq-5F; Fri, 19 Mar 2021 13:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99252.188610; Fri, 19 Mar 2021 13:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNF6p-0007hR-1z; Fri, 19 Mar 2021 13:24:11 +0000
Received: by outflank-mailman (input) for mailman id 99252;
 Fri, 19 Mar 2021 13:24:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0Gn=IR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lNF6n-0007hM-EA
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:24:09 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5f6d200-9528-47a8-aa04-f3805c966645;
 Fri, 19 Mar 2021 13:24:08 +0000 (UTC)
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
X-Inumbo-ID: a5f6d200-9528-47a8-aa04-f3805c966645
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616160248;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xn7rjvu3dh8SwpcE84e66nM6tuCBjnvG8vY5CRsFkAg=;
  b=f6Zto/i6a6tOzawZWLHvmPQL5PR7xH0G2BJ4ExhVwNxCXbDitO7d5gtp
   e9Q++ZiyXX5j6xjL2hXY5Q1pjNTQj8GbFTGeZYG7AMawYVzwNVvc45kKl
   mVnKZ1zT3rXhoGqAICoBKyVjWLqjIrzxseWZkwI0KY1Qh2sOmuTzRUgat
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HWYsxmfsb21hJ2LyZw21BUArwPAy/ze/piahpMUbVlmp4wPON0fjr1dX9Dx3ewlKOXtVBT0UYv
 yUWe9mVkuVYCEik+TbkW3CE4SVLt2DD1Q/9lJ4ehTXD4sBYmWp6hy/tl5QtKBAAm9LLWfSWD31
 vAd2DBYtd+c7sf2ofgFNO0+lkvcjZHdhmFoxUMdZQo9qfYmfsONI8hhE+518kbTHkl8KExJyFN
 woFXW76mzpKoUWUtgiFUExeNt4aAhVpLQ3uiVsmjbraCBt/DDibsZszUikfutganUEg+gl/kWE
 Y58=
X-SBRS: 5.2
X-MesageID: 41116999
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jhDf6aFVsfqG1mOQpLqFRZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYcNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQBkg/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcLHOjKf2QoTVC4K/Kc6/Q
 H+4nHEz4iAk9X+8B/T0GfP849b8eGO9vJvDNGB4/JlUgnEpR2vYO1aKtu/lRAz5Nqi8VM71O
 TLyi1QRfhbz1P0UiWLrQD22w/muQxemEPK7VODm3PsrYjYaVsBerN8rLlUeBfY9EYs1esUuM
 kgvxP7xu9qJCjNkyjn69/DWwsCrDvSnVMYnfMOlHsaaIMCadZq3Pwi1XlIG5QNFj+S0vFELM
 BSCqjnlZNrWG+BY2uclmdix8HEZAVJIj62BmIGusCTzgFMmmF4w0Yy1KUk7wY93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MF3xGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOhNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rYiK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW83Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjq0u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjzwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVz
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW01pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/UvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF36wwCyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxW1hl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/epB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/0oNCW1Rkj0JgPno0Brq4CyEx3Y5G+PVO0kjaLcBId2QhlKUDsqg4d
 Fct5YSsuSxOGmqNYLD5qHTcjJZKhTc5USxVPolrJhIvaQ08Jt/dqOrJgfg5TVi5lEZKsyxqW
 Y1BIJcy5rFMpV0f8MTdzlCl2BZ3+inHQ8OiEjOHuQ6fVsRlHfVMNOC3qrQpdMUczm8jTq1HW
 PazjZU8PjEVRaSzLI2C6o/JmJNdUg3gU4Sit+qRsn1CA+wcftE80f/GnihcKVFQKztI8Rckj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKCTdmpCAyBXc5O/NrSAyXBvoKapOqyhizwUz21dgAxgp
 BEb1UZaoB7sQYZ5bdHmhSae+jQuUIqk1xX/DFhmBrM4+GdkRnmNHADFxbYjJVQVSRUKV6Sg6
 3+gLCl6Eg=
X-IronPort-AV: E=Sophos;i="5.81,261,1610427600"; 
   d="scan'208";a="41116999"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOmqEcKnSNYJhZenmWo4p8+gF6c4dAEYSsFgrB8OLD0GiBz/GVY0ewm39FtMJMYDbElYLeKzsspEuPDZLFHozHQAYt4OMzYpO/rFMejFMMSTSsm3buJIFfViyV2rf95Rvueb4cgOQG8gpgWv0m+tgzp5VafRsggybC268NiVb4RdB2ERPYJTgzP3I3aO1VvEVxclvU/SqEggvn8FmsfM4D/wQvw4c6kN+AT4XVyen0xnLCFrMnp0qKtKUzytfYJlJoBTtzwrtTw5I9CKxiiG4s32rwpGG5dD3QnynFoaiFcTCYUK2zB4LnAe5K02dX2PKk8L++jzgq0vTjadOjO39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfG1W2Ad7ubJ7si/eLmP7oml4UMH9F+7v2uWsAC/LRw=;
 b=OT7LvHnpnsNwDfDTsNHFiPwceeFsKUOB5G/C6YFIfMZ6y0Q790gqR7o7XujYFRMm3xr0eIhJ87MfNcqbUxrwmGVxMVCSR0tzqW1VQAhTWJmmGerOBDUCOdsKp5w1716SJzfkrC+WLhiV3iLV4RsrOQgeqKvgxLO4K9QpuMsrwBOOZgtXoF3vcgCP5UaJvC2NzMkgI2uwuhbQBaXIt1hhCXC3tgkEyMpqN72BGBc8km7GWwN8g/Nv+al6/rSwST/FRG58968EW/kxDMgZU85jhoDhHhEwR7XNRITTjc3h6SwDehJk3TeoLwc9WDjx96tsvAM4B0PKO3QL1WGlRQnJ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfG1W2Ad7ubJ7si/eLmP7oml4UMH9F+7v2uWsAC/LRw=;
 b=dDUtnBxrj2lZp4re+4DAXp+KcZ9PPl1i5AuebqUUeGSJYigwzmAtTlxgtQQR4CdvLYo+6HDME9FhDn/YxVCfK4AaS0lW3i6gBpUHJxX7/ceeNZEOAm/6ZbsMkLaQn1tucP2o3wWzJelnQQb1Jd7Djt5bZesFD1ln6GkJ0S0Walg=
Subject: Re: [PATCH 3/3] x86/msr: Fix Solaris and turbostat following XSA-351
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ian Jackson <iwj@xenproject.org>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-4-andrew.cooper3@citrix.com>
 <YFDjUSz/whe9Jrqp@Air-de-Roger>
 <e7ee5d1d-d793-1ab6-deb0-e2eb13b89a47@citrix.com>
 <YFG+lNDsNRH66Ql+@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <210d1177-9f7c-e3d5-eac4-be66619f1cf8@citrix.com>
Date: Fri, 19 Mar 2021 13:23:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <YFG+lNDsNRH66Ql+@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::20) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31e8f827-0a39-43fc-c35f-08d8eada22a0
X-MS-TrafficTypeDiagnostic: BN9PR03MB6187:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR03MB6187D0B633BCF2E07395E9F7BA689@BN9PR03MB6187.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQW4UO0RDKj9JBStXeg6TbR6OW5NgGZlNeM6XrZwuLcoUNX/lAB2U+oyxEVVMtKhNxCNDKXbPs/e7obASKpwToqole5p261kHXCrS9O04sdlk1Vg2eDRTACT/JXJrq9hQAoc2WiuJRN92Bp4Kd6qF/OD2GyAC4/S+TowhhCvValIgraQtZ3qcnrvubHCkGTTNHeoUuxHI1AmsypT4p5sewQJKayr9sR9Mk9k1JmPDUMMaCSCKWqQ19OyrJHCM0ooNHvGdo2pf5mgeJvu3mqla/K/3K2X6Zw70Hj+Ylg7kwovlXVJZ7ld1yjY6jAqHEIZIDTbV9dRvKI2I/6oTu1QeKwUiQANrvRHCkurAeP/in5e8cd0myvkaMmZoKsF7is8BJYBBjggqQfcf7rLNMhsoGmbH7EY19A7JmHetaVSfvs2s3q4mt9iW0BHyOrCA69qdRP5pm9r7sO8wsAPo2LQx9OpnNMXJZZkRWMT2ncVKjgejO7nIMl3pDIXHC7K4aibrecerfNGNEqY4Q2CmOaNoFwJmq/G02Il9aVQ6YvUXFSKUeXT5JxY5v93jc5pJUW4r2ylclI3T1H+LO1b5sGZh//DiRcXMO4sKdx35OpQT3/2CAaeQdsZwV3LBTFXCEQDadamea3mFSbuOBamLiKJeD8j1ytJZlcke0Vuy3qAK3iGXblPe9+mJVUmROwTJ/rnuyhB3Ox/0DUlL8ooXNs+Ku1zB689mcoJUGah7M7gZDAmS0fB1ls5AuQ2dFW+Ad7giM58npTexsawvSGJyELDICiLV/62pU+5UCncIopes4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(6636002)(8936002)(8676002)(6862004)(6666004)(6486002)(66946007)(66476007)(966005)(66556008)(478600001)(36756003)(5660300002)(86362001)(31696002)(31686004)(4326008)(316002)(2906002)(2616005)(956004)(38100700001)(26005)(53546011)(83380400001)(54906003)(16576012)(16526019)(186003)(37006003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y2ZOdzlVZExUVUkxUlVDeUhGYXo3d245ZW16WW1QMzZuSEYwN3FoYmprYTVI?=
 =?utf-8?B?Z2o0TWw1bmxyMGwrbmVNR3hRTUZRNlpVdmJOUWRLVlBqNm9YMDB1SHFmMXVu?=
 =?utf-8?B?ZEg1YmlzR0NWSFUxMzZYb0I5RVBFc0JpSm5wQWErQ0lrOE1OWlU4dDVnWGZL?=
 =?utf-8?B?eHVvRExSTjFucVk3cmo1M1ZhN01XWU44S3hYRWl6b0poOWtObkdONVRmd1ZN?=
 =?utf-8?B?WWNjRlBqbEQ0N0IrUjlJY2VjZDEzTlpwaDd0RU9UbUhLRm80NVF1WGFUcmpU?=
 =?utf-8?B?QXlKYTMrcVkrN1NoSG53eEF2TE5YWHd0L2xaUjNTS1ZiWnZOVVdDQzBGUUUz?=
 =?utf-8?B?anNhMlVrQVZaejZHOWcxU1o4YUV2L2ZWWHNBQllvRFl4dnQ5amJJd1ZiUElw?=
 =?utf-8?B?WFZ4dklBZGgzT0tZVGZpRTMyeUF6MWs4bmNxK1g5ZmVXbDJZbHZNZjdSODFp?=
 =?utf-8?B?MEtWY1FaZjN2MEMwNWZuY0pTOFh2QjVnQ05pYjdDYktrVENyUWZXY1JnS0Fh?=
 =?utf-8?B?RU1PUFFPajB0cHBOLytReVR2cUVBWTg0bGtTTnVibnJxSHE0RUhSY2FzRzVi?=
 =?utf-8?B?cHIzMlNSWUdlQk1iaWlyVWpOODl1L3ltQXoza1kwOUw1WTloSHZQZHExM3l1?=
 =?utf-8?B?NmZ2V1luc1VjekRJOSs0Q0dEM2hmL2Y4TDZDWTd2QUwzRTJzZmYyWWFORjRs?=
 =?utf-8?B?eDY4V1ZkamJsUm5LM0owd01tdHFNRXBlUGtxVUN1VTlMNVRHYy9adTdzUDMw?=
 =?utf-8?B?b3lNUUlwbERDYlN5Ym9icWZXeEpoQ1hJWEZwL0ZFcUN0Q1BiVVNYRnRMM1NO?=
 =?utf-8?B?ZU1DSkk4SThIY3A4M0JJUlprbGU5Q2JyWUFEdXBjNzlEVW9HYmQ1WU9zRnZl?=
 =?utf-8?B?dDcxczhXMEJmNTVLeG9aajBUNmJNb1MvOVcwYnRiV2xmTFY4MnAvUTI5ZzZz?=
 =?utf-8?B?VEc2TnhQRkxxR1hlOG9XSm4rcTBlMTNOSVphMXRFWFlXZkhEL3VnamNrR2xk?=
 =?utf-8?B?YURwNTlmWCtScEZaaXlUMEJjdWhGTW9tSExPR25ZV1d3eWpXMHdFdHB5RGVk?=
 =?utf-8?B?TyttTldWanpSQnRnZHc2NDQ1d2k5S1ppTXd3K3FUUHg4eXdoeVhCRnU3UG1W?=
 =?utf-8?B?cWFqVXZ3MFc1K3dwTmw0ZGg3anNERERsekYrQ2dzVmY4Y2ZKVE1RNTY0bm1P?=
 =?utf-8?B?RmdtYzhWS01neU5lajEvaDhCR3hxWldpc1Zxd3lWb1pYem1hcGRkM3N3Nk10?=
 =?utf-8?B?RmI2aEtMYnQxeHZFc1JQRWIvVlFiaXY1eXU0bG1CNlpvVENQUXdZbVpOYUE2?=
 =?utf-8?B?ZTF2bURZSUY5eHBGZUxidnBrSmxnQnEvcm1mNjZWK0FRYUJYRDdGdDNhZmZD?=
 =?utf-8?B?ZzlCNXBud253MjN3blo4Znk1RW0vNjN6N0RESkRSdTN3STlZY2pzV09LM0FF?=
 =?utf-8?B?Qy9GOVgvY0MzTktYaWpvaTg1bUlXU0U0cTZnN29PcUozNEQ5NWJocHk4TGRF?=
 =?utf-8?B?UDQwdWlsN0FKVldWbmo5ZTFhRlJTbEdKOTMyb1B2eUZ5M3d2RTlmQjlaaVcv?=
 =?utf-8?B?Zm1Wdk9ZaklvMjgrRnAza1kxaUtjU0Y2L0J5SU9WcjJqblo2dUttQjVTQWNE?=
 =?utf-8?B?WU8rOXh0d2czZExrMXFQeHcxaC9ORWNTMUVVTDV6RjVSeW5YSzdoaW1CZjZV?=
 =?utf-8?B?cnJ0Qk1hSCs0L2cwRjRvRXRqNVJSdWUvRDBGMlNhUWJLVHcrRC9TUFZ6ZWRx?=
 =?utf-8?Q?fwX8VlFAsJ/VVvuyMb+Q2/mWSxJ9OXHF2NuzIry?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e8f827-0a39-43fc-c35f-08d8eada22a0
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 13:23:07.9615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BIJe3jIwEhh3bDbbeHow+MCiAL6+t9ojil5SJ9Zdd6V8nNXZNx0NUQFOXChOvWMJ8jTsg5cDMAAfX0ADPnCTJfK29liXk7xI/3oH/o3ICE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6187
X-OriginatorOrg: citrix.com

On 17/03/2021 08:32, Roger Pau Monné wrote:
> On Tue, Mar 16, 2021 at 09:20:10PM +0000, Andrew Cooper wrote:
>> On 16/03/2021 16:56, Roger Pau Monné wrote:
>>> On Tue, Mar 16, 2021 at 04:18:44PM +0000, Andrew Cooper wrote:
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Thanks!
>>>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>> CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>>> CC: Ian Jackson <iwj@xenproject.org>
>>>>
>>>> For 4.15 This wants backporting to all security trees, as it is a fix to a
>>>> regression introduced in XSA-351.
>>>>
>>>> Also it means that users don't need msr_relaxed=1 to unbreak Solaris guests,
>>>> which is a strict useability improvement.
>>>> ---
>>>>  xen/arch/x86/msr.c | 13 ++++++++++++-
>>>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>>>> index 5927b6811b..a83a1d7fba 100644
>>>> --- a/xen/arch/x86/msr.c
>>>> +++ b/xen/arch/x86/msr.c
>>>> @@ -188,7 +188,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>>      case MSR_TSX_CTRL:
>>>>      case MSR_MCU_OPT_CTRL:
>>>>      case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
>>>> -    case MSR_RAPL_POWER_UNIT:
>>>>      case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
>>>>      case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
>>>>      case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
>>>> @@ -284,6 +283,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>>              goto gp_fault;
>>>>          break;
>>>>  
>>>> +    case MSR_RAPL_POWER_UNIT:
>>>> +        /*
>>>> +         * This MSR is non-architectural.  However, some versions of Solaris
>>>> +         * blindly reads it without a #GP guard, and some versions of
>>>> +         * turbostat crash after expecting a read of /proc/cpu/0/msr not to
>>>> +         * fail.  Read as zero on Intel hardware.
>>>> +         */
>>>> +        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
>>>> +            goto gp_fault;
>>> AFAICT from Linux usage this is Intel specific (not present in any of
>>> the clones).
>> Indeed.
>>
>>>> +        *val = 0;
>>>> +        break;
>>> Do we also need to care about MSR_AMD_RAPL_POWER_UNIT (0xc0010299) for
>>> Solaris?
>> AMD has a CPUID bit for this interface, 0x80000007.EDX[14].
> Right, I see now on the manual. I guess I was confused because I don't
> seem to see Linux checking this CPUID bit in:
>
> https://elixir.bootlin.com/linux/latest/source/arch/x86/events/rapl.c#L773
>
> And instead it seems to attach the RAPL driver based on CPU model
> information. That's fine on Linux because accesses are using the _safe
> variants.

Borislav also wants a bugfix for that, seeing as there is a CPUID bit.

>
> The patch looks good to me, I wonder whether you should move the
> "users don't need msr_relaxed=1..." to the commit log, but that might
> be weird if the patch is backported, because it won't make sense for
> any older Xen version.

Will do.

> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

~Andrew

