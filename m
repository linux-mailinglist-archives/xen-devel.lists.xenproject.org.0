Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59637172F
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 16:55:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121671.229476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZxw-0005j0-Ko; Mon, 03 May 2021 14:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121671.229476; Mon, 03 May 2021 14:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZxw-0005ib-HO; Mon, 03 May 2021 14:54:32 +0000
Received: by outflank-mailman (input) for mailman id 121671;
 Mon, 03 May 2021 14:54:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iacE=J6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldZxv-0005iW-KT
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 14:54:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42293fd5-40af-409c-b838-8d71a38f7d21;
 Mon, 03 May 2021 14:54:30 +0000 (UTC)
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
X-Inumbo-ID: 42293fd5-40af-409c-b838-8d71a38f7d21
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620053670;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tE6xTS0ox8T508wp0RiTVObjPvt4tI/lok2HkAV5F7Y=;
  b=O8437evpAcActHG4TrSnWozlI2wBpIVNrtpOkfeH52PJm5w46hWv8SWr
   p6r3iFj2krDnXoSQH6ZjPrg/vdQVS871ODYdnARc+W6V/N57UaN862XyS
   PxaV0ltAFmjbf7YaYEzwxkuzBFGySFke7wL22MODLQ7fdw1Eev7LQxqqV
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: miHaRGsVOtgYeVCoTMAD1NxzVzOqaRAgmHtMAeAtTeuiCHR4dHHKvniwif5nNVOLdj8FBMqeBD
 6je7cy/HeB2Hb7202V0CkAf9g8TTZqc3LjuNlEb7guaTfD41gl1ohfJ3LSe6KYUCGRn1Oc0C5l
 dbATIiF7hdxSFYldB2xNY598i0A0FbsEE2Zk4o04HMcb7PP4DRnlrPesJAVR3uFA5O2HmTC7jK
 rlA5BNlFMEG2r4U/vsHOJ6EHI2C787lB3lzN+N+LAScyvJjNS8yRqO8RnGmMm6CRM6zmAehPh5
 Qw0=
X-SBRS: 5.1
X-MesageID: 42752441
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kqr5MqNTTI32YsBcT3Pw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RdQZCtBApsQiTtRIACdD0FwWU1qBYAhEo
 Cd+8pAoFObCAkqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+HLzGz2BACXzRThYoz6G
 StqX2C2oyPkdGejiXd2Wja8ohMlLLaq+drKcSQhqEuW1DRoymyYoAJYczngBkUp6WV5E8ugJ
 3wpX4bTrtOwlfwWk3wnhf3wQnn118Vmgzf4HuVm2Hqr8C8ZB9SMbs4uatjfhHU61UtsbhHuc
 ohtQ/p1Os0fGb9tR/w6NTSWxZhmlDcmwtYrccpg2FCSoxbUbdNrOUkjTNoOa0dFyH34p1PKp
 gWMOjg4p9tADSnRkGclGxuzNuwZ280DxeLT2MT0/blogR+rTRXyVAVy9cYmWpF3JUhS4Nc7+
 CBCahwkqpSJ/VmIp5VNaMke4+aG2bNSRXDPCa7JknmLrgOPzbop4Ts6Ls4yem2cPUzvdUPsa
 WEdGkdmX85ekroB8HL9oZM6ArxTGK0Wimo4t1C5rBi04eMB4bDAGmmchQDgsGgq/IQDonwQP
 CoIq9bBPflMC/HBZtJ5QvjQJNfQENuEPE9i5IeYRajs8jLIorluqjwa/DIPofgFj4iRyfRGX
 0GcD/vJNhRz0yiV3Pi6SKhHk/FSwjax9ZdAaLa9+8cxMwmLYtXqDUYjly/+4WqJFR5w+gLVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ild3tLoAQNIn7laLprgaTZRUlimF+8YjNvRcLfFw
 BS435t/7isEpCWzSc+T/WqL3ydlHlWgH6RVZ8Tlumi6K7eC9IFJ6djfJY0ORTAFhRzlwovgn
 xEchU4SkjWES6rr76kgpwSDOT2bMJ9nw+vHM5RpRvkxAehjPBqYkFecy+lUMaRjwprbSFTnE
 dN/6gWh6fFpSyiMlIlgOMzMERFbUOeBL4uNnXCWKxk3pTQPC1gR2aDgjKXzzU+YHDj+Ukpim
 v9FiGMYv3QDl1BundX77by/DpPBxegVnM1Tko/nZx2FGzAtHo26+ONa6ap+0a6a1cJwIgmQX
 v4SApXBjkr68G81RaTljrHKG4vwY82OPfBSJ45davI53+rIIqUtK0PEvNO5qx5PNT2vuJja5
 PHRyalaBfDT8850Q2coXgofBRuoH4/iPXyxVnL6nO70HNXO4uaHH1WA5UgZ/eS4GjvS6zWjN
 FXjdcpsfCxNWu0QNic0q3TZyNCLBSWgWPedZBelblk+YYJ8J10FN3ndBGN8ldt9hA3Nt31m0
 MTW74T2sGLBqZfO+gpPxtE9V8onumVJEQlsgbKEvYzFGtd+0PzDpes2f70srIhDU2KmRvoNX
 Se+yNb+e3ZXyHr789tN4sAZUBXYlM78nJs4aercJDREhyjc4h4jReHG074VL9WU66eH7oM6j
 58/tGThueSMw71whrZszc+AqVA9Q+cMI+PKTPJPe5D6NqhP1uQxoOs/c6olT/yDQKBVH5wv/
 wMSWUgKuJZijcji4Ur0i+9DozPy3hV7Wd20HVAjV7i2o+v/WHBO1pJWDep2qlrYQ==
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="42752441"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QL43WIBaAk4Q4A9kQSqU7z2rWfG0CspCfR/yJYw4kOO2kevt0iB8N/6jMVn1FHJsGDt7x28fJkSaE8FF7X1xVYZgcx/6nDtv9XVQO/JQ3saBUrltuszFhgDE3+BEUxhsKp5k8cGM0haMDIithM866H7xP+q4x8SZqqc1dUkcXDvJJ4E0LiNdyNTi6r++x4ePO9xBbmzwNk3jhBBsruY3W0mmD4zMx4G1hQ6PORvDmgorViqPsYW5BOsQ1Z2kx1SXTG+dZVLw/rlMULDxekddHCW0N0U8Waem7U85cdHw5q3SjvsiMywWKA1OmJx1NWSFgLyG5/v6cM5okk+F82gv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTcGgbRpcF+yx991N5BmQYXfWGnNdRb9WDIQjayhgOM=;
 b=ni11iJHBspRnqf0Uj3OKVEFJWROP3j9nBbpYP5mRJpQwf6e9iwmLXZGLFCdtSXWLTKfco0Lw1DcN4cohX8YJjAmPVlbeTfz4K9VMYfkvjO7p6xy0qbfDUkbytFerefnauN6aaFiR/IQ2yIffet8fxpHBkRY9K8pq2Vw0jLF4xg7kHvWcFQV10pT+ROqx3Q6AgKtfd7BXXF8aq43TgbAxFkQgybGQWrQoKQTmTfnRVhwlzo+eupL+RPZz2fbGY79hcnpWjm5jpgcQ9hSR3d1rRmKIHkBq7d61pz7LCmceW8Er1p1pmPCiKF9p2jTBCZgvT3O8Fz3KbsQgq/FVVhY1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTcGgbRpcF+yx991N5BmQYXfWGnNdRb9WDIQjayhgOM=;
 b=tsTTaUqemXdhhz6QYCFTIzL9KXrO9fyp6yketoEAaOKV5zktS8pVldbjuYbCAY/ts7x2C6J71LVOAQ1W3KP/jahBQvzGzxZ4ZipOHs7BpydJIPCVONIgzmsHytgzfuEuaLnCzY13fCa1WIizsRwWhYJeI2pqiE/3kz6iJf9O4wc=
Date: Mon, 3 May 2021 16:54:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3 01/22] mm: introduce xvmalloc() et al and use for
 grant table allocations
Message-ID: <YJAOm+rmKb5gbYJq@Air-de-Roger>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <69778de6-3b94-64d1-99d9-1a0fcfa503fd@suse.com>
 <YI/e9wyOpsVDkFQi@Air-de-Roger>
 <aeb6aa8e-7c90-be22-1888-21b7b178e1d1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeb6aa8e-7c90-be22-1888-21b7b178e1d1@suse.com>
X-ClientProxiedBy: PR1P264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd5ddf60-5a52-47ba-8f7a-08d90e43583e
X-MS-TrafficTypeDiagnostic: DM5PR03MB3372:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3372F1AB54454A93AB624CE08F5B9@DM5PR03MB3372.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qEm0yB6fcRoF7eq41JeJg2sz4Udw3OE/5kn0kpg18tGd6AO5B+EcvffpZ21wdMGMd8IPsK4eqUJRtzOH2pi1b0mrLHPWxPH+NYiQbyCidHn2epqy7Sou73lAdVdJeWzSwbd3zdAYVIZXSFbgdUk7hXC6X9L9tl6yFQT0LsrRfOb0HHwHJUTCI3sC1CERqaqpDqH+UXIlrGWENGu/3OkG5UtA5s1YF/rRXtxvVqroM+sKJsDLzFVJD8kuX4gnhRp1TeUhGvKIVJIEU6RyaLcSuEqS6TI5jdor6tQizg+7wHN3HcA1iko6yBtU4lRvpgqUCEuz30ybdveIFINMMSJ9LbBopDVbKW+fBRfcg0YcpjNF7pid8tqSZXx7mcJpebXhJ1WG0EczPVAL2/8FozUw9+/Nn+S7kJVkh7aTPy9nx31REr6DI1Atm49aKlfH0Y9HgmLeQbjfRzv/cH0xy61W5xKzcCUuee6V7DIWuOsTKyRGEQ137NWh19vkjfRClw3S9EqtFzGMMYa1md0ECCON8akJuNRPMss1H5tNJN0PbXLHz8ZfumYdQk6YMU+iDWaDkTUZSXQ5zXdyYl1POWU4l2nybzKkzDiMkAAYkwq9SJTLAoCgDO2rFIzQHPucg+lCf9IqPkSR6+iAPH6IxgdW/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(376002)(366004)(39860400002)(346002)(136003)(4326008)(54906003)(85182001)(16526019)(8676002)(9686003)(8936002)(38100700002)(6486002)(956004)(53546011)(66476007)(5660300002)(86362001)(6916009)(66946007)(26005)(478600001)(6496006)(316002)(2906002)(83380400001)(33716001)(186003)(6666004)(66556008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RzBHUHJGTHI4Zi8wYnFydUpES3NocklCb1VwWUU0elRmb0NZa3N0VStFWHMx?=
 =?utf-8?B?RGQ4ZUtOQXVvb3BoN2gyUzdWMi9nY0VORGNPaytKaXJRZmY3Sk0vVWg0K0cr?=
 =?utf-8?B?QVpBdmJLb3JNVVQwaWN4M0J3dUJvY0djSHNLT0YwZlpvZEppRDU2WWluYUhQ?=
 =?utf-8?B?VjZrL1VpNzBXTnNSNzZTSkdnMXRmS1NSdm0vNlYycUxRNThJSXhVcEdYSGFo?=
 =?utf-8?B?dUhlb3JqeUxVQU5scVhHTTR3ZUJ1NnlhNlhnWGRRRkFkVjl6NHQ1RkJ4SnpG?=
 =?utf-8?B?VS9pVFBBcEp3bFpCVWd2Zk5JUXVxNFNEM1Qva1FSSGF6MVJ1NUxlVDlVM0ZD?=
 =?utf-8?B?anhHT3VuREhlcVFvbUZpN2RXVnY3a3ZKSGxEMUtHSm1QVnZUVkdUYkI3ZEJn?=
 =?utf-8?B?QmJTc0psOUVxSDFGaU13YmJrT1ZPeGRxMVVtYmthd3l4eUo0TUxRUlI1Y0J6?=
 =?utf-8?B?NEMybW1DWk5KT3h2VEcvVms2OHhVT0c4d3M4ZHdGQjlGV0NWcEVieSsyNWpD?=
 =?utf-8?B?dTVpQWloalJMb0RiUEg5VmFmKzBmc1dPWEFQWCtqVkRkanJvRUZBbFN2dkU2?=
 =?utf-8?B?dS9ZUkxyYy93VkQ0ZEo5dHFnUDFzOE5CalovOEZOdGd0QXlPSk9CNXhzeFpq?=
 =?utf-8?B?cDd4Yk9BMHZoUHJ5cEpBRTVYSWlqeDYwUUJpd1NVTlFzKzlTbkJiY2FzS3Ex?=
 =?utf-8?B?d2pOR1F0UG44NHU4YWg0cktudWIyaUxaeEpjNlVya0t4QjZBRWVpdTZmV25E?=
 =?utf-8?B?eVh0Y1QxR2tsRWx6MlFUL3orbU1ZbWIrSWlNVjlqMkUyTTlkRC8yaUVsTEdj?=
 =?utf-8?B?elVZMUpvS2VHNWVSbVlDY2pkSUQ0Z2dKYmcxU242TDRZS25BMXMxRkVPTThs?=
 =?utf-8?B?ZzdrVm00LytSd2dzVHlMc1FOUXhCelAyeG1KQVpoSm9JMjlJNngzVGRYdjBv?=
 =?utf-8?B?K05ncTh2a1N5aWFPNnhKTERucE9iVHdheGo2Zkxzd2xIekUveXhrWUtSR2lv?=
 =?utf-8?B?aUg4OFdrOUpxQ2N3WndGQmw5d3AzK092Yy8wT1hOQi9zR05JT3I1dWp6L2w3?=
 =?utf-8?B?b2QyaTlCYlFONll3YmVKUERzc0JxQmorWGNxN3hZQ3dKbDhSSnZCOGZvU1Jl?=
 =?utf-8?B?ZDdEeTZGaks5YzlHUzM4OTlZRUhvQ1RQcVlVTERsY0xMdnVaYW10OHY3WjBt?=
 =?utf-8?B?VU40bVljaGwxTy9QQ0xySGxmcDNmQmJHdGgwLytLeitDQ2tQRVl5TWZPT2Zp?=
 =?utf-8?B?cnMvaTFYdHpIR3ZpSmkwNERsWDVwUFhiN280cTlOTTE4VHQvbVJvK2xaQnR2?=
 =?utf-8?B?SXA1UXBvSWNob2Y2MXBwZTRDSHFpa3VoU0JhYytQSW84cFIxVU1UTDN3NU9N?=
 =?utf-8?B?WGxhSVZkbDF5WnNLUWduaEVwYmNiRU1JQk00NTBjS1puM3VsR21lemVXaStw?=
 =?utf-8?B?Vko0NVVPM2tjTGxxNkFWK2NGSnpZMnhFZk1oYWpoOWt1OU92QXRPQjJ2UjFa?=
 =?utf-8?B?MzI3dzBGa1Brb2V0c1NscGIyQU4wc3BGZHFBeFdyR3pxTXBNU1M2eFZtWC9h?=
 =?utf-8?B?ZEhmYTlJbjZhZDhFQktOSDA2SHFOMFRLTTRQZGhsSGpodUNQS096Rm9ZM3NN?=
 =?utf-8?B?YkF4OTNDODZSZGgzUnpMUTNBcDkrNHpNQ3lYR0FGK2Fkall6Lzc1UnBmeGFG?=
 =?utf-8?B?QzdKeklWeWtsUHRtS1hja0xGdzlTa3kvSmFtRzh6WVFxM2dVMVZJOEI2NkdP?=
 =?utf-8?Q?pLti2LWAFAFJToM78J9GtNDfpdtP1pVKgMMbNCM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5ddf60-5a52-47ba-8f7a-08d90e43583e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 14:54:25.7122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEcNxm1l8sQug2DSKOmvbKcKb8c9QYJHvPtEBQzalIIrVjwetP6iqZlaSDogba6DicX8sUcPLiOnRMtDLcQbDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3372
X-OriginatorOrg: citrix.com

On Mon, May 03, 2021 at 03:50:48PM +0200, Jan Beulich wrote:
> On 03.05.2021 13:31, Roger Pau Monné wrote:
> > On Thu, Apr 22, 2021 at 04:43:39PM +0200, Jan Beulich wrote:
> >> All of the array allocations in grant_table_init() can exceed a page's
> >> worth of memory, which xmalloc()-based interfaces aren't really suitable
> >> for after boot. We also don't need any of these allocations to be
> >> physically contiguous.. Introduce interfaces dynamically switching
> >> between xmalloc() et al and vmalloc() et al, based on requested size,
> >> and use them instead.
> >>
> >> All the wrappers in the new header get cloned mostly verbatim from
> >> xmalloc.h, with the sole adjustment to switch unsigned long to size_t
> >> for sizes and to unsigned int for alignments.
> > 
> > We seem to be growing a non-trivial amount of memory allocation
> > families of functions: xmalloc, vmalloc and now xvmalloc.
> > 
> > I think from a consumer PoV it would make sense to only have two of
> > those: one for allocations that require to be physically contiguous,
> > and one for allocation that don't require it.
> > 
> > Even then, requesting for physically contiguous allocations could be
> > done by passing a flag to the same interface that's used for
> > non-contiguous allocations.
> > 
> > Maybe another option would be to expand the existing
> > v{malloc,realloc,...} set of functions to have your proposed behaviour
> > for xv{malloc,realloc,...}?
> 
> All of this and some of your remarks further down has already been
> discussed. A working group has been formed. No progress since. Yes,
> a smaller set of interfaces may be the way to go. Controlling
> behavior via flags, otoh, is very much not malloc()-like. Making
> existing functions have the intended new behavior is a no-go without
> auditing all present uses, to find those few which actually may need
> physically contiguous allocations.

But you could make your proposed xvmalloc logic the implementation
behind vmalloc, as that would still be perfectly fine and safe? (ie:
existing users of vmalloc already expect non-physically contiguous
memory). You would just optimize the size < PAGE_SIZE for that
interface?

> Having seen similar naming elsewhere, I did propose xnew() /
> xdelete() (plus array and flex-struct counterparts) as the single
> new recommended interface; didn't hear back yet. But we'd switch to
> that gradually, so intermediately there would still be a larger set
> of interfaces.
> 
> I'm not convinced we should continue to have byte-granular allocation
> functions producing physically contiguous memory. I think the page
> allocator should be used directly in such cases.
> 
> >> --- /dev/null
> >> +++ b/xen/include/xen/xvmalloc.h
> >> @@ -0,0 +1,73 @@
> >> +
> >> +#ifndef __XVMALLOC_H__
> >> +#define __XVMALLOC_H__
> >> +
> >> +#include <xen/cache.h>
> >> +#include <xen/types.h>
> >> +
> >> +/*
> >> + * Xen malloc/free-style interface for allocations possibly exceeding a page's
> >> + * worth of memory, as long as there's no need to have physically contiguous
> >> + * memory allocated.  These should be used in preference to xmalloc() et al
> >> + * whenever the size is not known to be constrained to at most a single page.
> > 
> > Even when it's know that size <= PAGE_SIZE this helpers are
> > appropriate as they would end up using xmalloc, so I think it's fine to
> > recommend them universally as long as there's no need to alloc
> > physically contiguous memory?
> > 
> > Granted there's a bit more overhead from the logic to decide between
> > using xmalloc or vmalloc &c, but that's IMO not that big of a deal in
> > order to not recommend this interface globally for non-contiguous
> > alloc.
> 
> As long as xmalloc() and vmalloc() are meant stay around as separate
> interfaces, I wouldn't want to "forbid" their use when it's sufficiently
> clear that they would be chosen by the new function anyway. Otoh, if the
> new function became more powerful in terms of falling back to the

What do you mean with more powerful here?

Thanks, Roger.

