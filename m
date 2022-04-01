Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2924EF235
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 17:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297491.506809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIpY-0005JB-Ce; Fri, 01 Apr 2022 15:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297491.506809; Fri, 01 Apr 2022 15:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIpY-0005GF-9T; Fri, 01 Apr 2022 15:04:52 +0000
Received: by outflank-mailman (input) for mailman id 297491;
 Fri, 01 Apr 2022 15:04:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FwaM=UL=citrix.com=prvs=08375ea47=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1naIpW-0005G9-Fv
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 15:04:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 124d5072-b1cd-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 17:04:49 +0200 (CEST)
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
X-Inumbo-ID: 124d5072-b1cd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648825489;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PPqHA/MZh4eS0o+MlOz+r3ixLSalPH+ceDM5C4RiUfE=;
  b=Orgb137uutGEWQIU4oHw0azvIwWPS9v3Y/4dkZlky3oSoeEf4OFJUHFY
   lKeY+Wl7tCBegX+VuPisGt/tzpBAsglyGZKVt+87nOiOtXxna+AqqcCyj
   99dat814Tlc9Ps1mOCLS8db5NuEdyHgwPTPpxhWpCldT4Czv0B6JDHBcP
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67791584
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fgrfZK74VLdSfcsympe7zAxRtDnHchMFZxGqfqrLsTDasY5as4F+v
 mYfWDuPOPuDNGGkLdh3b4iz80gF75DUm9VkHFNtrio8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YThWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSQRjsgYvGdo946QkZUHTBgOY9GpqPIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5RGNms2MUScC/FJEnkdUbJ9hNqOvHXicGFe8GPNvrEowmeGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYCD6TnPi/6P/0BTnHYsCd
 QpEoULCsJTe6mSLQeX0A0Hpm0Sjr0EQVctOF886th2Cn/+8DxmiOkAISTtIadoDvcAwRCA32
 lLho+4FFQCDo5XOFyvDq+78QSeafHFMcDRcPXNsoR4tuYGLnW0lsv7Yoj+P+oaRh8a9Jzz/y
 iviQMMW1+RK1p5jO0lWEDn6b9OQSnrhE1ZdCub/BDvNAuZFiGiNPdPABb/zt6ooEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AAzT8Z8rW71qi/+IOi8BQ2Swm8zba7onhezP
 SfuVf55vscPbBNGk4cpC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk3nVKeGrZGuZd2l39W+I8mbc2ip/hR+eHFPyD9pHZsGAbmU93VG4vf/l2Pq
 owPZpbSo/idOcWnChTqHUcoBQliBVAwBIzsqtwRceiGIwF8H3omBeOXyrQkE7GJVYwP/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:mbLe1a8lxOTIP06e6cxuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="67791584"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYpZi6G+/irvyJy7vh55wLrvQlMbFmkJuxDW/mtFjmJJGub/V01ARBnT2yC08YSGm8Gm+FfAIuoH9e5MU5jY1A8mnrtpt+wG4O46Wu4BUXaaxoNDDNUYVL3l/DusYxcXYkbrHtwfh6f9YgpIA4JWrBJqMyb0HL6gB8BTUp9wpVmDPstqBSa40cih6XyDWim7rgYGWLxQhM4rR9BWugrLM2ctKkEXPJ9MUV7quFgF8svZ8NB698ilBJPEGnNSCk7GpB3c+uOkrEMm4iKy3QuzbTRe2sDl6GNG6ae+YtUfZxe9VHfy+qYO0BN+lmxld9mHUp29U5uHnFcSXfpsvG3+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPqHA/MZh4eS0o+MlOz+r3ixLSalPH+ceDM5C4RiUfE=;
 b=kBHuby/fy2cgxzXR+V3bRaglCFJeQukIf1BR0WH8XqnsRKCV475IheLfYUGr1FCnEzgWBuh3cHM0fbWNMKTO00J1s2qMScPnXwEP11SR/OM6vGs4Sl/PZk9OTPQrK5LHDSqsKxBugF6V5CuU0NCeR7Ql71KCl35fETz6EMXAIDdOKyngHBPxAQPgAO5cgsIVoU3y6h2xh34U4aQRToBy79U1ImAx02ma8vWoH4T2Rx9vpayjZU5W4ywSsTSkWUy7oZRipaX26Q2qD0M5RlaKVRaAXipd9pQHrSm3MwZTzaInl2AQcdUxlqtT7teL8iM+jG8+Tx108fdf9RaFOPCreg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPqHA/MZh4eS0o+MlOz+r3ixLSalPH+ceDM5C4RiUfE=;
 b=dv8/Oe2pls5BxKuiagIRHJ+pIUK4vd+JYydTUYAlA67NeZZ/Fn4UVPvTeec0KCKgVLfthzigaatk6ZkTeRLo2w3qeNCCFVzGIF/vXm57MEZONzF0lkI2reAsGl8wy0Dq9P0y2M7XrdjN14tj0yIP8eMs8pnv2vZ/r8cep2M7vxk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Thread-Topic: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Thread-Index: AQHYRdaC1Ty1lDbR3E6vxjqdlx39GKzbI9kAgAAEHQA=
Date: Fri, 1 Apr 2022 15:04:44 +0000
Message-ID: <7b129a01-07c7-e856-fb5b-0c7b44a8dac5@citrix.com>
References: <20220401143720.23160-1-roger.pau@citrix.com>
 <20220401143720.23160-2-roger.pau@citrix.com>
 <YkcRGIy7l48BkZQz@perard.uk.xensource.com>
In-Reply-To: <YkcRGIy7l48BkZQz@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbafe306-e1d5-44b2-fc7c-08da13f0f4e6
x-ms-traffictypediagnostic: SN2PR03MB2158:EE_
x-microsoft-antispam-prvs: <SN2PR03MB2158B605148BA18C78B48376BAE09@SN2PR03MB2158.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: su3QZbQUxMa3XC4B0/dUGQSqem6Krnn3qTxJkkFb1cIbqsax7TrXLPgxtkoEkc8s5bHBJRrarqhS/pI46ezgq29i01UsuBkzv1SmIGiZ9nZKcEaj+XLdN5Fsr2hijRBGIK5IGGexBBKzIMDKBeBrZ/qHWn8qkjvi6G8fmf+pCwb22yD0gFOt79gn+tEYEy3gp1JL29iAKvqqoG/qbtqsnxhWIV8dOIb2pil9ouksfwIIlf3i/oP1i0t+/G+oVwSX0edVXDQd+MizwV9GwhHY7VHoHIiJBk+E6GbLoI8Io1V7M9kEsShcOBZkdQGpEMsjhvYbtueet46fxz31Xqaw+y5qwOM4gefB32EWpKPmx59udViPok0jlCZeTUfYfxPbO4yu31Y3eSx9cGDUC8XQpMCrUwhqI3BMADPVa05Jr+C75NgZfpPWHEZpJLHVvdDX/NvN21RbopgOII3IJLPkCW3L2/I4LZEe1LXJc4+lgub1LcrlRXt9mIp6q4zgj6VoMFJqimUrM9EJDCJ0wDnQg5HZcxgfWfm8uHURt8ck6U+SHRrjbhicnG/aTQQd8KpUz7jxmXvYJbs7rUdK+E6X6EwwpK3CFWenQHxhlaj0GQgsqvpnPhscvEzHgGLwZS+AEI5UZ1780gAY9yCclXISU5A80Znno9iwrih9f9VLXFZIt+ehU+7UKnB3DYNpvFUgmlvP2nnycuY74WKB1vRb2qqVsUWSP2/MuovEGQSlMeXD4w4fI79Eyjzz2+DhKv4ZpglcbPGoy3wfF8XJm5wdSw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(8936002)(5660300002)(82960400001)(86362001)(508600001)(31696002)(31686004)(76116006)(6486002)(55236004)(66946007)(53546011)(91956017)(64756008)(6506007)(4326008)(8676002)(38100700002)(6636002)(66446008)(66556008)(110136005)(6512007)(54906003)(66476007)(83380400001)(316002)(2616005)(26005)(186003)(36756003)(122000001)(2906002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUZvWlEwQk1weUdpdy83WjVxQ2tXMlMyNnZkU3IwRE1SYlNUQS85VEhGN1pY?=
 =?utf-8?B?aXZYOUM2Qnh5Mk5OTjZ3TmxiVmJVNjhGVXVIaHBJUmNzWGZmekdZeVRDdjFS?=
 =?utf-8?B?RVMwYkJSL3ZVM21oQldKVllScUNOcUd6YkNmVWlKMWsxVElzeHR5ZWdGU0hT?=
 =?utf-8?B?UTZnMHdJcXR3M240U0tiVEFxaW1xL1Y0U25IVjV5TUNzSmRyLyswREVKVys2?=
 =?utf-8?B?Q1NQNThEUUtvUmVQdWJFZlNQckNSd2pPTHR6aHQvUnhyNnhZanZmMVJmd2lr?=
 =?utf-8?B?ZU9PVkRBVElocEpZcERBcXJvYk95YXhVWTRva1R1UWVsa2dWSXY2bWF0S1Jq?=
 =?utf-8?B?ZWNmSmIzb0ZOaElMYlBUYlZlMXFMOTdPckNDYktXV1JNS2FTMlRUMUZ6b0Ro?=
 =?utf-8?B?RzlBZnh2WjVKdnJGdmY4RGpSMHJ5MmYrYmIzU1VUQ0RaaCtTcGxMR0xUeWNr?=
 =?utf-8?B?QWtNdEd6VVNRTHVGZ2U4Qk0rK1JSNTFzTlhpYzlIRnJZV1I3TzhHYWxYT1Fs?=
 =?utf-8?B?Z2xGVXZ2M1BuWFVRTDd0ZlJEQWgxTGo0WE5jSkFDaGFsaWVDa0lKR3hjUXVn?=
 =?utf-8?B?NEtRYURIS0dSN0ZtZmZZZmJERnJTS3Bic3RYdGd3N0grb1JSV3ZhcHZDS2lK?=
 =?utf-8?B?WngveGU5VDF5elJWYkZ3Qk1CVHVaTXBUcVYydFptMWR0RGxiVG5QTGdicnoy?=
 =?utf-8?B?a3pZZHJ6aCtHMDU1dEdyWFMzbHNud3N4ckYzSzlHUHJsQ2Jzc2NtbFRTUG1a?=
 =?utf-8?B?WHQ3S3FDeW9TTy93UmFLbGxPMmZ2RmpKeEI4dWl5bXA0eTdvZFVvZHpBZG5o?=
 =?utf-8?B?Z2VZNXRIZUpwQ0RqMmo1QzNad3ZEQzM3R0ZIL0VDOFZEbFNjYVN6R2Jwdmxp?=
 =?utf-8?B?ajMyNTFmUHBRa0ZxWkd2T2ZRME9Seis3SlNRNmJoaURPQzdEOGZ2a2xrenRW?=
 =?utf-8?B?U3d1SzQ3cnpnOEhjQzlTSUwwYzZZUW9sN0xQTDlUbFFSMGliS1hsTDNYR2xv?=
 =?utf-8?B?SGthR2hTRktSUVN3YWVsMURWRVcyZzNQNFUwL1QvMGpxSVFMQ1h5VjRFQ0to?=
 =?utf-8?B?TVIvR0VBTFpVeVFPbDA1Ymo0L0Z2QnBjd3Y4K3R3RkU2Tzc0alBOZ1luRVBY?=
 =?utf-8?B?MnNjdTlBeXFoN1RaNTBPK3RQNW5tNTc1bzZvNjJyMFVlb3lTbndsZU5oWUdu?=
 =?utf-8?B?eFdIOFlVQW40S2VUS3RiMGUvRHlKRVBDMTNLYkZRc3ZCV1FwSDVGWlpTTDUz?=
 =?utf-8?B?OGFDOWtLb3BFZVVuUlVPMCtKdERzOFNTejNDOTM5VVpDSC90anhyUUErSzlY?=
 =?utf-8?B?UUtncmFuOFJ5S0NQYW1KaURRNVZEa2VuYk1sQURtSkhoZnJCT0djcWpnN1hW?=
 =?utf-8?B?bm9id3Z0YzV1YXZuMUtkNEZLSXB3NE05N1N6ellDN1M2bHF5UkY3aDNtR0J2?=
 =?utf-8?B?RVBQa0R0NUZLTjhnN1NseXRLWW5wZVduc3M5Zk9JY3Bzd2RGcC9HV2FtMFY5?=
 =?utf-8?B?WDQ3NWRBYzRTbjNpN0tPS3lhRGVHa2xwSlczV2JQaDhCcmZHMkJ2ZkRsZ0cz?=
 =?utf-8?B?RklBZUd3MFBZZFZQZXBPRTh3RkVYQlpOQlpWUExic2RVRzVnaUVBbVp0bDZp?=
 =?utf-8?B?OWRXRm8ydEJRaGliK0ZiVld3M1VMeEVPVlZZYUZZeHFaeExoWlFmOEJWQ2R5?=
 =?utf-8?B?cVdGazh3T3ZiRGNia0xUcHJoKzk5NTJDMnpXN1NTd2ZmaXVIN0dtMkRWRXlo?=
 =?utf-8?B?Y1draW1WbGNrYm5YOUxRb3VDc2xmZ2JjcjhhZ1doekVYRHI5ZklzWW5Pckpk?=
 =?utf-8?B?MURkNDBhTHBpZXA2Y3dBbDF0ZkNaaDJaTDlhbDVOc1dJZ0tDTDZEUWZqLyta?=
 =?utf-8?B?Ykh5alZWSmVvd3BRdmxoZWNNamhYU2JIaGc0bWRuWlpHUkRCYXBzNUcya21Q?=
 =?utf-8?B?dXBINVVrV1F2bDZrVHNmS2hkZzNtbmlueGU5THk1S3c4cmhSVHI0eWpZK0xx?=
 =?utf-8?B?N3JlTWpLZzhFSnZYNmZMTVc1WnNmTXNjWXQvSVVvREN3VlY3c1piZ1Y5VzJE?=
 =?utf-8?B?QUliai9uNE9mRk95T2pyeUN5Rk5lQ1R2N2pGZ1F0aldUSDA3TjIwZnppbnhj?=
 =?utf-8?B?dGh1SEtSR0ViN1VRT2ovMU95TTFCOEpGWHdsdzlMc1VZUmViSGFiVXpUb0Uy?=
 =?utf-8?B?Si8vdlZyTCtUalJMUnp4MUkydnBSUDlXMjlDdmJrTVZZY05hMm1nZ2NDbktZ?=
 =?utf-8?B?KzdhRmRNQnZrUWZOcFVVRlVFVHdFN2lacmRQZ3NSTFVLeFN2UEdReUpPTDBS?=
 =?utf-8?B?eEM0VTJRYVd5ZGo1a29id1k0d0J3YktMSXhVYjFjaWUyZ1NXTC84UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED6D1DEFB777764A9DFC2E7BCEEEE355@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbafe306-e1d5-44b2-fc7c-08da13f0f4e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 15:04:44.7110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q34bJ7kQNwilWvkd8qxAdXkN3bYyxOEzXqVb8V8ixMTtxtGIYQCoob7bdkJc6fGZYYA7vRC1u+97X63iCXoH0lfp4dfQh4VJjkzWC3qcEag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2158
X-OriginatorOrg: citrix.com

T24gMDEvMDQvMjAyMiAxNTo1MCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIEZyaSwgQXBy
IDAxLCAyMDIyIGF0IDA0OjM3OjE4UE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4+
IFNldHRpbmcgdGhlIGZjZi1wcm90ZWN0aW9uPW5vbmUgb3B0aW9uIGluIEVNQkVEREVEX0VYVFJB
X0NGTEFHUyBpbiB0aGUNCj4+IE1ha2VmaWxlIGRvZXNuJ3QgZ2V0IGl0IHByb3BhZ2F0ZWQgdG8g
dGhlIHN1YmRpcmVjdG9yaWVzLCBzbyBpbnN0ZWFkDQo+PiBzZXQgdGhlIGZsYWcgaW4gZmlybXdh
cmUvUnVsZXMubWssIGxpa2UgaXQncyBkb25lIGZvciBvdGhlciBjb21waWxlcg0KPj4gZmxhZ3Mu
DQo+Pg0KPj4gRml4ZXM6IDM2NjdmN2Y4ZjcgKCd4ODY6IEludHJvZHVjZSBzdXBwb3J0IGZvciBD
RVQtSUJUJykNCj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KPj4gLS0tDQo+PiAgdG9vbHMvZmlybXdhcmUvTWFrZWZpbGUgfCAyIC0tDQo+
PiAgdG9vbHMvZmlybXdhcmUvUnVsZXMubWsgfCAyICsrDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2Zpcm13YXJlL01ha2VmaWxlIGIvdG9vbHMvZmlybXdhcmUvTWFrZWZpbGUNCj4+IGluZGV4IDUz
ZWQ0ZjE2MWUuLjM0NTAzN2I5M2IgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9maXJtd2FyZS9NYWtl
ZmlsZQ0KPj4gKysrIGIvdG9vbHMvZmlybXdhcmUvTWFrZWZpbGUNCj4+IEBAIC02LDggKzYsNiBA
QCBUQVJHRVQgICAgICA6PSBodm1sb2FkZXIvaHZtbG9hZGVyDQo+PiAgSU5TVF9ESVIgOj0gJChE
RVNURElSKSQoWEVORklSTVdBUkVESVIpDQo+PiAgREVCR19ESVIgOj0gJChERVNURElSKSQoREVC
VUdfRElSKSQoWEVORklSTVdBUkVESVIpDQo+PiAgDQo+PiAtRU1CRURERURfRVhUUkFfQ0ZMQUdT
ICs9IC1mY2YtcHJvdGVjdGlvbj1ub25lDQo+PiAtDQo+PiAgU1VCRElSUy15IDo9DQo+PiAgU1VC
RElSUy0kKENPTkZJR19PVk1GKSArPSBvdm1mLWRpcg0KPj4gIFNVQkRJUlMtJChDT05GSUdfU0VB
QklPUykgKz0gc2VhYmlvcy1kaXINCj4+IGRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS9SdWxl
cy5tayBiL3Rvb2xzL2Zpcm13YXJlL1J1bGVzLm1rDQo+PiBpbmRleCA5Zjc4YTdkZWM5Li5lZmJi
YzczYTQ1IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvZmlybXdhcmUvUnVsZXMubWsNCj4+ICsrKyBi
L3Rvb2xzL2Zpcm13YXJlL1J1bGVzLm1rDQo+PiBAQCAtMTMsNiArMTMsOCBAQCBlbmRpZg0KPj4g
IA0KPj4gIENGTEFHUyArPSAtV2Vycm9yDQo+PiAgDQo+PiArRU1CRURERURfRVhUUkFfQ0ZMQUdT
ICs9IC1mY2YtcHJvdGVjdGlvbj1ub25lDQo+PiArDQo+IEkgdGhpbmsgbWFraW5nIG1vZGlmaWNh
dGlvbiB0byAkKEVNQkVEREVEX0VYVFJBX0NGTEFHUykgb3V0c2lkZSBvZg0KPiAiQ29uZmlnLm1r
IiBpcyBjb25mdXNpbmcgYW5kIHdvdWxkIGJlIGJldHRlciBiZSBhdm9pZGVkLg0KDQpFTUJFRERF
RF9FWFRSQV9DRkxBR1MgaW4gdGhlIHJvb3QgQ29uZmlnLm1rIGlzIGNvbmNlcHR1YWxseSBicm9r
ZW4gYW5kDQpuZWVkcyBkZWxldGluZy4NCg0KWWVzLCB4ZW4vIGFuZCB0b29scy9maXJtd2FyZS8g
YXJlIGZyZWVzdGFuZGluZyBmcm9tIEMncyBwb2ludCBvZiB2aWV3LA0KYW5kIGVtYmVkZGVkIGZy
b20gbWFueSBwZW9wbGVzIHBvaW50cyBvZiB2aWV3LCBidXQgdGhpcyBkb2Vzbid0IG1lYW4NCnRo
ZXkgaGF2ZSBzaGFyZWQgYnVpbGQgcmVxdWlyZW1lbnRzLg0KDQotbm9waWUgaXNuJ3QgZXZlbiBh
IENGTEFHLsKgIEl0J3Mgc3BlbHQgLW5vLXBpZSBhbmQgaXMgYW4gTERGTEFHLsKgIFRoaXMNCmJ1
ZyBpcyBoaWRkZW4gYnkgZXZlcnl0aGluZyBiZWluZyBjYy1vcHRpb24nZCBiZWhpbmQgdGhlIHNj
ZW5lcy4NCg0KU3RhY2sgcHJvdGVjdG9yIHdlJ2QgYWJzb2x1dGVseSBoYXZlIGluIFhlbiBpZiBp
dCB3ZXJlbid0IGZvciBhIHF1aXJrIG9mDQpzdXBwb3J0aW5nIFBWIGd1ZXN0cy4NCg0KLWZuby1l
eGNlcHRpb25zIGlzIEMrKyBvbmx5IHNvIG5vdCByZWxldmFudCBmb3IgYW55dGhpbmcgaW4geGVu
LmdpdA0KDQp+QW5kcmV3DQo=

