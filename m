Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC82372F38
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122657.231384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldzBg-0006Z9-EI; Tue, 04 May 2021 17:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122657.231384; Tue, 04 May 2021 17:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldzBg-0006Yj-8Q; Tue, 04 May 2021 17:50:24 +0000
Received: by outflank-mailman (input) for mailman id 122657;
 Tue, 04 May 2021 17:50:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldzBe-0006Yd-KN
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:50:22 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c5a74da-ec3d-4116-8c7f-69c25def076e;
 Tue, 04 May 2021 17:50:21 +0000 (UTC)
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
X-Inumbo-ID: 0c5a74da-ec3d-4116-8c7f-69c25def076e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620150621;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DoQ4unHTciOtlEQit/zkvIA8oGYZiCo6EJOuUCqqpLs=;
  b=amHtQwu/mfcEdCZW5SdLlYhEtZAKzQ98Ome2e0oJkWvpd6ePackbfCNv
   hLTbl/JCGSeR+gBRzZLmZjUcU8+jUYYPGZQ9pWJNP9mwRiP5xKpoM0Ufl
   H3A6WkYMsLdraonZM8xhKmgDZ5/Z6x+CeG2ONrRP2ZId+7yz/DVtOeGt/
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ap4bwLnWsQrLiA4GFVvMD3z2AaZKNxux0+wf3qK6IUaiG8afQ5AWk+fPj2zAHVPIQTbeMt6Zdv
 uNl15kQsuSDAjnNL0dXnqYeEbUkeP30SH9+dcX5d9ctgFw53h6ToTIqDsPxhXo5HEyOT+uNVHR
 Yyw92XncENNKEQhJK7y+xvaVbIeQsy27pczrffCbu83wERxpZ5G5yY7ku+UfgJxEytFBMsZ1Pl
 Lb5GOHdRykXpMT4eCCmy51ZxvokGMq12RRMPrz95+p7VWK2Lw0oV+UTN92btIR4d6ugk4qWTZQ
 PCM=
X-SBRS: 5.1
X-MesageID: 42859347
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:R0j+EqNobetTa8BcT0rw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RdQZCtBApsQiDtRIACdD0FwWU1iDZ02CJ
 KT6qN81kSdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LW1JfRFR+E0hACFw5e2LtKyx
 m4ryXVxIWG98u6xBjVynPJ4/1t+efJ59NfCKW3+7MoAxr2jALAXvUZZ5Sju3QPrPir+BIWlr
 D30modFuBSz1+UQW2vuxvq3GDboUQTwlvv00WRj3emgeGRfkNDN+N7iYhUcgTU5iMb1bkWus
 87vBP6xu5qJCjNkyjn69/DWwsCrDvTnVMYnfMOlHsaaIMCadZq3P8i1XlIG5QNFj+S0vFDLM
 BSCqjnlZJrWG+BY2uclmdix8HEZAVIIj62BmIGusCTzgFMmmF4w0Yy1KUk7wc93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MF3xGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOhNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rYiK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW83Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjq0u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjzwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVz
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW01pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/UvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF36wwCyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxWyhl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/epB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/0oNCW1Rkj0Dnvzp0hG+szT98347HPbIIFNpA5scOMqR6mD4R/COlL
 V15OhFy9eYAyHUUJqhz6qSUhtobjX0ikSyR/szqZ9Vsbkp3YEDVKXzYH/t7jV/wB46LM3Ij0
 sQT6Rw3aDZNuZUDrsvUhMc2mBsqc+GI0QquDHnG+MSfVkiiHnAItOCioC44IYHMwmkpAHqP0
 OY/DAY1/DZXzGb3bpyMdN8HU1mLGw94m9l5uWMasn5DxirbfhK+B6fPmWmeLFQDIiDFrN4lG
 c33/i428uWfTH/wgbeoH9SJb9P6X+uRYeKOz23cNQ4u+CSCBCrmaul4Mm6kTfxR3+aUi0j9P
 x4XH1VSN9ChDkkhJAwyQ6oRMXM0xoYr2c=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="42859347"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBFXCxojq5kjfM49+BIFyrZrIwBWd2iJLcWqnIlLFnq5DKeQoX2eUUM6pmMLdg1UPMPaAyhLA+S/dhFS6fKVZuLujLB7//P1Yn7lAayBXlW4DlmKosxRNBKJ+L6NJVynUL6hlBndCrW5aOPRBHFX+ULNYdcdnMNHB0CTFLWZvFJiDQbjs3UhURfK5q60Tlor1nJ8BV/DVjb+GMPj1tWI4CTumSw2xjkAsh4GKB0jSmMjNiW4kAyLao1RQxYFW/K6ORlV3wW6CL7drJGZCu3w7T9QexNBBZOBj+mMkMhkYCtqpvrg5DS9a/nYNO3DtA/wQAiJYolLzFLUquZEPGAj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoQ4unHTciOtlEQit/zkvIA8oGYZiCo6EJOuUCqqpLs=;
 b=PDf3Ir+ssYwJ/eWjEqa0vKcdXeioP4XONHeahWAvvsuyXdbuaSbbzSA8KOPPP+AFU2BleBARocC+fR8VOXU7ifyMCy55wWC+L35iCxOzBeMwAjh6x4cG+xhmeYZVCU3BAtuwITqLasFaShOmrjbZQcAdJlHUgSxmraBgChuyrng3M7+cxSGhfECovo5Ek9GcNdlfXaK7HCqbgpWxffc55gU0Til/5x214M9avZL2MwDZqvgFxS8hk+tz1m+l8S8K4I273+4obqb9ddGaJ0g0o27aJnzXsjEFZTEMmcqKet5iCRYoyCuRbFffvUryaRUN5o46cjwxoytHyrn0x99d2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoQ4unHTciOtlEQit/zkvIA8oGYZiCo6EJOuUCqqpLs=;
 b=OJWlnNnh0NjEm8l+bHSuFV5iFUGKkifiKVCCJDmSCHmRdzDSP2BVFhSaqknSNnSnyI3OYCy4iDwk2+D8kgaeLi/7qqpX2vC1BhARLt4W70Gh4hnR7QzPsoeda+sR872WVI19njNOQ8U0lqdGNGuCleacBqb0BMYS0d9MtJCZsPg=
Subject: Re: [PATCH v1] tools: handle missing xencommons in
 xenconsoled.service
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210504135854.10355-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2b207f7b-3a97-810b-8c15-32be55a3d5b2@citrix.com>
Date: Tue, 4 May 2021 18:50:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210504135854.10355-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0328.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebffa245-1460-4f0d-a869-08d90f25143b
X-MS-TrafficTypeDiagnostic: BYAPR03MB4743:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4743A93BEB4FDE2429DEFC10BA5A9@BYAPR03MB4743.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m8iLlGoCT4Z2cR1CYg8GYHO15c0LrU2mpJVEblDpxz3S1e0GAeeGGg0ezrecrKGCjo5eQ8z89H4/7nESEQpuxU+eL9NK3ZCTul9AS5SZI1vitUdVrqnDhIEo31I85LMVIjASwX1I+x5PvP663Vk6usAhu0tgTSWEgF8t2flwmRYnk/mNOoUqSpZq/14pqNxSK9v0EiTJYteIAK63/Av9uItmIcWbBqPGTDtc9jv3zPY9Zsj4ax5DL7BPIMyjEfah7Wibvqnl3E8wBJP5sO5UExI53G5f0uen2+cN84kWeSxlvbQBsANPBW5GQ6REW3YRKakZ/rj8VGCuPWPSU7Dp7Zi5/Koi2bENtWu5tmgysYcmQgRNd2gP3lt4YPiYUGhSNdmXnAMsQBAkte1UAmY2svG0muW2ETEq3PrRna50Q1PRj6qLcQxCkAcNeMmXSWves+pF0+8qaPpTXjBoMwjEqq4LW8stnKwbKie8OOGQ/9bqPg2NSeAwRyuBgtXsUk/Sdl4ikMzgzi8p2KL+79S+QZOHU+cSl8kOpaWf9N/y5Z/QY25hfCPXj2XEkdTFI9JeqRuG5IPuJe1WrQuunVUQtgOxPUzIOV3+WFHhb32hQQLdNGSzOnRAW7moMQEv8vXCfvTMfIRFbUJQGgYKJG8JVX69trjLErmZ/8L2SZNS/OajvMtsCAdAH/xhYBwaz7fe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39830400003)(316002)(478600001)(31696002)(558084003)(956004)(31686004)(5660300002)(8676002)(4326008)(36756003)(16576012)(6666004)(54906003)(2616005)(8936002)(6486002)(86362001)(186003)(2906002)(26005)(66476007)(66556008)(53546011)(16526019)(38100700002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aXU2WVZvWUxyTGZDc3hHcSsvVlczNXU5Yzd3ZDVIbWVEb0x5NFA3d0xTY1dj?=
 =?utf-8?B?SXYvM0hJTklQcXBhdWlhbEo5bHVpSXJtNVE0RGJER0t1c2Z6dkVxSGxPd1Zn?=
 =?utf-8?B?ZTA5bkdNMnI4ejRWYnpUQ0Q5ZkplRFJFclNKckNmcEdJa0h3L05xanZWQVRD?=
 =?utf-8?B?akhSeFZ1RHF2YUN6dmd5MUcwUFRDRzFmQkorWlk2azVsbXdZemFwRVdmeEZn?=
 =?utf-8?B?YXoyWXFtYXFIWWtDS2xla1NjL1hldUlvWTZwUHVISmY2cy81bW8yeEtNRHN4?=
 =?utf-8?B?WFpEM3A0ZWZFMTBVcnYyZXU3a1pRQlpJQlg1VTZ4K29tR1Juak5MWEdYdWg0?=
 =?utf-8?B?dmxqUUp0VVhqRllHQTVQdUVnM2tXUVd6TkFRVG16bEtUYzl1TkFCZjlxRzB5?=
 =?utf-8?B?UXcraTRUYkJWS1pVYXpMRUVsY2FMNTQ5OWVnQ0xGVGtudk44NWM4WGJ6Z1N0?=
 =?utf-8?B?RFBGcVRiRUVYaUJxZWVHRGlsbEljUGN1NllIN1JRNUJBM3lUaGZGSHVuQUxW?=
 =?utf-8?B?ejJ2MnB5NGw1U3huWVM0VVZ4V0hyR24wM01XMVc3YW9WYnI5bHFwdS92QWlC?=
 =?utf-8?B?b3JOQXFkMGEyM3dJanRhdmwwRXhCWmJXY1NWcHh2SEx2b2FVV3dJbDQwRFF1?=
 =?utf-8?B?RWRWZWpuWGEyS2dvOHZuNWY3Q3c5OGN4M1FOU2J6cHR2a2FTeUExTk1RSWoy?=
 =?utf-8?B?MEYvUy9HQ0tBM2IwZTkxUkJpdVFodVVDUVJ6SEh6am04NlVFUld5SGZVay9u?=
 =?utf-8?B?T3ZPeFVkSzNER3hYdGwzaUhLVTNvRkhKazkxUTg1QjM2NEFsV3hLK3l5NndE?=
 =?utf-8?B?akhiUDZKbXcxNGFwelRucnpPTDFtYnZVTlE5SWNGNzhBUVgyYldLbUdsUksr?=
 =?utf-8?B?ZU1zMUk1L2l6WHpQU3A5Y3BWL0pSRVFUSkRYMGpPb2FXRmorTlR6VHY4UEk0?=
 =?utf-8?B?NlR5c20vbFRLVXFQOGovdDlZdXYyYXhmWXlGV1pNbGE5RzU3QnVVcUg4KytW?=
 =?utf-8?B?Z3JCd3FsVXhleDZRdWRBSzVUZDRKVjVTaTBIRExrak1adDlhZmdnS1plVnRm?=
 =?utf-8?B?U3ZGOEdNRkx1MjQ1V0xWTkpVeFkvQzh1dFYyeHFSVk1vOHptNVB1bFhZYXY3?=
 =?utf-8?B?Y1FTOGFQRzl1dGVBZXMzcU15d2lQOTdsRmN2UkR0NWtCbFlHajRqdHpxOGZr?=
 =?utf-8?B?YUN3QTJ6RkF1aW9vc0t3QUhXYXZENEgrMTZIZUVTSmxaNVQzaXZodnZYWVo1?=
 =?utf-8?B?ME9oZGcyYnNlaGp6MFA5eTJGVk80QWJOa1BiOGhpME9aQlpMbGtJSjVlN3dY?=
 =?utf-8?B?S0N3cmJIQmszU1MrelNMY0pDTG5ESEYxNHBTVGQ2QlcwMjhLcWNjY29CYk5D?=
 =?utf-8?B?SGNMTW94UGgxVUVKVys5RDl3OGNra3BYczJ1VEY5aGRtV2pVRk85b2p5SWcv?=
 =?utf-8?B?dkFneEhuMGJRTzRWcmNsdzhWN0VBNUFjOGdBQ1dhaklJRFBMSHYxZjQzck9H?=
 =?utf-8?B?dXBOd1dPd1FXMk9memZKWmNSbENqK3BLQyswNjA2UUFnMWx6WDl2NEthdXFZ?=
 =?utf-8?B?NURFMEpadUFKMVFVV1NkK0llR1FUeStOdUVXWnlvaGNjRFgrNUlhN21pVVFL?=
 =?utf-8?B?R1duVlhkQml2NWpNNDIyeVg2dEh4YklkOEc0RndVV2RGd2RuS2xXYk1QYm52?=
 =?utf-8?B?QVdlRitjOFlRUkg2Y0o1OEhua0EwQjlwWDVKekhsMDh2Ry9yTjlvR2xCdS9W?=
 =?utf-8?Q?kME5DUWoStwHL9KdLfAeZyWFwcomx8X8JceMJQF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebffa245-1460-4f0d-a869-08d90f25143b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 17:50:18.1613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5l64C64F4ZuFhXuYGKDe+gKUU3awW0f4SBgjhWzgtuxELdXjpmW2nx+HhH9ieAFjs83Kii1n4IMd6f3fpYEgVrbt4XiAN4CwE9jRypXsSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4743
X-OriginatorOrg: citrix.com

On 04/05/2021 14:58, Olaf Hering wrote:
> sysconfig files are not mandatory.
> Adjust xenconsoled.service to handle a missing sysconfig file by
> prepending a dash to the to-be-sourced filename.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

